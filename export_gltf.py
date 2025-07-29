import bpy

FILE = "digital_twin"

bpy.ops.wm.open_mainfile(filepath=FILE + ".blend")
bpy.ops.export_scene.gltf(
    filepath=FILE + ".glb", export_format="GLB", export_apply=True
)
