import os
import subprocess

# ==========================================
# 1. USER CONFIGURATION
# ==========================================
FILENAME = "active_cascade_filter.cir"
N_STAGES = 100  # You can change this to 10, 20, etc.

# Component Values
# High-Pass Section (C_hp, R_hp)
C_HP = "560p"
R_HP = "18.94k"

# Low-Pass Section (R_lp, C_lp)
R_LP = "18.94k"
C_LP = "560p"

# ==========================================
# 2. NETLIST GENERATOR
# ==========================================

def create_netlist():
    spice_lines = []
    
    spice_lines.append(f"* Automatic N-Stage Active Filter (N={N_STAGES})")
    spice_lines.append("* Uses Ideal Op-Amp Buffers to prevent loading")
    spice_lines.append("")

    # --- A. Define the Active Subcircuit ---
    # Structure:
    # In -> [High Pass] -> NodeA -> [Buffer] -> NodeB -> [Low Pass] -> NodeC -> [Buffer] -> Out
    
    spice_lines.append("* --- Active Stage Subcircuit ---")
    spice_lines.append(".subckt active_bp_stage in out gnd")
    
    # 1. High Pass Section (C-R)
    spice_lines.append(f"  C1 in     nodeA {C_HP}")
    spice_lines.append(f"  R1 nodeA  gnd   {R_HP}")
    
    # 2. BUFFER 1 (Between HP and LP)
    # Syntax: E<name> <out+> <out-> <in+> <in-> <gain>
    # This copies voltage from nodeA to nodeB perfectly
    spice_lines.append("  E_buf1 nodeB gnd nodeA gnd 1")
    
    # 3. Low Pass Section (R-C)
    spice_lines.append(f"  R2 nodeB  nodeC {R_LP}")
    spice_lines.append(f"  C2 nodeC  gnd   {C_LP}")

    # 4. BUFFER 2 (Output Buffer)
    # This isolates this stage from the NEXT stage in the cascade
    spice_lines.append("  E_buf2 out   gnd nodeC gnd 1")
    
    spice_lines.append(".ends active_bp_stage")
    spice_lines.append("")

    # --- B. Main Circuit ---
    spice_lines.append("* --- Main Circuit ---")
    spice_lines.append("Vin source 0 AC 5")

    # --- C. The Cascading Loop ---
    previous_node = "source"
    
    spice_lines.append(f"* Cascading {N_STAGES} active stages:")
    
    for i in range(1, N_STAGES + 1):
        if i == N_STAGES:
            current_node = "v_out"
        else:
            current_node = f"n{i}"
            
        # Instantiate the Active Stage
        line = f"X{i} {previous_node} {current_node} 0 active_bp_stage"
        spice_lines.append(line)
        previous_node = current_node

    spice_lines.append("")
    
    # --- D. Simulation Control ---
    spice_lines.append(".control")
    # Sweep from 1Hz to 100MHz
    spice_lines.append("  ac dec 100 1000 100000") 
    
    # Plot Input vs Output in Decibels
    spice_lines.append("  plot db(v(source)) db(v(v_out)) title 'Active Cascaded Response'")
    spice_lines.append(".endc")
    spice_lines.append(".end")

    # Write file
    with open(FILENAME, "w") as f:
        f.write("\n".join(spice_lines))
    
    print(f"✅ Active Netlist Generated: {FILENAME}")
    return FILENAME

# ==========================================
# 3. EXECUTION
# ==========================================

if __name__ == "__main__":
    netlist_file = create_netlist()
    
    try:
        subprocess.run(["ngspice", netlist_file], check=True)
    except FileNotFoundError:
        print("⚠️ NGSpice not found. Please run the generated .cir file manually.")
