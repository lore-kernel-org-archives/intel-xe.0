Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAE0C7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 10:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0E10E320;
	Wed,  2 Jul 2025 10:24:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34AB10E320;
 Wed,  2 Jul 2025 10:24:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Plane_Color_Pipeline_supp?=
 =?utf-8?q?ort_for_Intel_platforms_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 10:24:03 -0000
Message-ID: <175145184399.127473.4701099547201620986@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702091936.3004854-1-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Plane Color Pipeline support for Intel platforms (rev4)
URL   : https://patchwork.freedesktop.org/series/141788/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cbf896bafe1ccc52440a3dae4d973890a201328a
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Wed Jul 2 14:49:36 2025 +0530

    drm/doc/rfc: Add documentation for multi-segmented 1D LUT
    
    Add documentation to explain properties of the exposed hardware
    1D LUT blocks, its identification and computation of the LUT samples
    based on the number of samples, their distribution and precison.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch b8e85a966e982941b8c00783d4d45bfdcdcff768 drm-intel
65dd1b112abb drm: AMD series squashed
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

-:681: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#681: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:526:
+	uint32_t r, g, b;

-:740: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#740: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:730:
+							 gamma, gamma != NULL);

-:748: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#748: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:738:
+		res = mod_color_calculate_regamma_params(func, gamma, gamma != NULL,

-:758: CHECK:LINE_SPACING: Please don't use multiple blank lines
#758: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:748:
+
+

-:794: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#794: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:850:
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);

-:844: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#844: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:968:
+				       uint32_t lut3d_size,

-:855: CHECK:LINE_SPACING: Please don't use multiple blank lines
#855: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:979:
+
+

-:896: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#896: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1429:
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)

-:976: CHECK:SPACING: No space is necessary after a cast
#976: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1509:
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;

-:1032: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1032: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1565:
+	uint32_t shaper_size;

-:1048: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#1048: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1581:
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);

-:1078: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "shaper_lut"
#1078: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1611:
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;

-:1104: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1104: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1637:
+				uint32_t drm_lut3d_size,

-:1120: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#1120: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1653:
+
+}

-:1134: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1134: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1667:
+	uint32_t lut3d_size;

-:1155: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "lut3d"
#1155: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1688:
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;

-:1184: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1184: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1717:
+	uint32_t blend_size;

-:1201: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#1201: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1734:
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);

-:1229: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "blend_lut"
#1229: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1762:
+		blend_size = blend_lut != NULL ? blend_size : 0;

-:1248: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1248: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1824:
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)

-:1416: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1416: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:66:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1434: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1434: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:84:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1444: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1444: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:94:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1449: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1449: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:99:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1459: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1459: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:109:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1465: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1465: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:115:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1472: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1472: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:122:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,

-:1477: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1477: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:127:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1482: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1482: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:132:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1489: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1489: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:139:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,

-:1494: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1494: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:144:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1499: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1499: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:149:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1506: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1506: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:156:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,

-:1511: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1511: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:161:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1516: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1516: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:166:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1528: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1528: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:178:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1533: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1533: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:183:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1545: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1545: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:195:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1667: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around pipelines[len]
#1667: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c:1805:
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));

-:1753: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1753: FILE: drivers/gpu/drm/drm_atomic.c:591:
 
+

-:1810: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1810: FILE: drivers/gpu/drm/drm_atomic.c:780:
 
+

-:1813: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1813: FILE: drivers/gpu/drm/drm_atomic.c:783:
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)

-:2003: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2003: FILE: drivers/gpu/drm/drm_atomic_uapi.c:261:
 
+

-:2032: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2032: FILE: drivers/gpu/drm/drm_atomic_uapi.c:290:
+
+

-:2119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2119: FILE: drivers/gpu/drm/drm_atomic_uapi.c:740:
+static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state, struct drm_file *file_priv,

-:2148: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2148: FILE: drivers/gpu/drm/drm_atomic_uapi.c:769:
+drm_atomic_colorop_get_property(struct drm_colorop *colorop,
+		const struct drm_colorop_state *state,

-:2151: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#2151: FILE: drivers/gpu/drm/drm_atomic_uapi.c:772:
+	if (property == colorop->type_property) {
[...]
+	} else if (property == colorop->bypass_property) {
[...]
+	} else if (property == colorop->lut1d_interpolation_property) {
[...]
+	} else if (property == colorop->curve_1d_type_property) {
[...]
+	} else if (property == colorop->multiplier_property) {
[...]
+	} else if (property == colorop->lut_size_property) {
[...]
+	} else if (property == colorop->lut3d_interpolation_property) {
[...]
+	} else if (property == colorop->data_property) {
[...]
+	} else {
[...]

-:2188: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2188: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1068:
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);

-:2218: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2218: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1287:
+		ret = drm_atomic_colorop_set_property(colorop,
+				colorop_state, file_priv,

-:2373: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2373: FILE: drivers/gpu/drm/drm_colorop.c:86:
+
+

-:2381: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2381: FILE: drivers/gpu/drm/drm_colorop.c:94:
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)

-:2426: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2426: FILE: drivers/gpu/drm/drm_colorop.c:139:
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,

-:2535: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2535: FILE: drivers/gpu/drm/drm_colorop.c:248:
+
+

-:2583: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#2583: FILE: drivers/gpu/drm/drm_colorop.c:296:
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,

-:2679: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#2679: FILE: drivers/gpu/drm/drm_colorop.c:392:
+				 uint32_t lut_size,

-:2748: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2748: FILE: drivers/gpu/drm/drm_colorop.c:461:
+
+

-:2773: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2773: FILE: drivers/gpu/drm/drm_colorop.c:486:
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,

-:3479: CHECK:LINE_SPACING: Please don't use multiple blank lines
#3479: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:344:
+
+

-:3554: CHECK:LINE_SPACING: Please don't use multiple blank lines
#3554: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:419:
+
+

-:3574: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#3574: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:439:
+
+}

-:3629: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3629: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:29:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3647: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3647: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:47:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3663: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3663: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:63:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3679: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3679: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:79:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3842: CHECK:SPACING: No space is necessary after a cast
#3842: FILE: drivers/gpu/drm/vkms/vkms_composer.c:188:
+					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);

-:4883: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#4883: FILE: include/drm/drm_atomic.h:779:
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)

-:4898: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#4898: FILE: include/drm/drm_atomic.h:794:
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)

-:4932: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#4932: FILE: include/drm/drm_atomic.h:1061:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \

-:4932: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#4932: FILE: include/drm/drm_atomic.h:1061:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:4932: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#4932: FILE: include/drm/drm_atomic.h:1061:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4932: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#4932: FILE: include/drm/drm_atomic.h:1061:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4932: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#4932: FILE: include/drm/drm_atomic.h:1061:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4936: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#4936: FILE: include/drm/drm_atomic.h:1065:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-:4942: CHECK:LINE_SPACING: Please don't use multiple blank lines
#4942: FILE: include/drm/drm_atomic.h:1071:
+
+

-:4954: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#4954: FILE: include/drm/drm_atomic.h:1083:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:4954: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#4954: FILE: include/drm/drm_atomic.h:1083:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4954: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#4954: FILE: include/drm/drm_atomic.h:1083:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4954: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#4954: FILE: include/drm/drm_atomic.h:1083:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4958: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#4958: FILE: include/drm/drm_atomic.h:1087:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-:5056: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#5056: FILE: include/drm/drm_colorop.h:35:
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
                                      	  ^

-:5155: CHECK:LINE_SPACING: Please don't use multiple blank lines
#5155: FILE: include/drm/drm_colorop.h:134:
+
+

-:5177: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#5177: FILE: include/drm/drm_colorop.h:156:
+	uint64_t multiplier;

-:5297: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#5297: FILE: include/drm/drm_colorop.h:276:
+	uint32_t lut_size;

-:5383: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#5383: FILE: include/drm/drm_colorop.h:362:
+static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
+		struct drm_file *file_priv,

-:5398: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#5398: FILE: include/drm/drm_colorop.h:377:
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,

-:5406: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#5406: FILE: include/drm/drm_colorop.h:385:
+				 uint32_t lut_size,

-:5437: CHECK:LINE_SPACING: Please don't use multiple blank lines
#5437: FILE: include/drm/drm_colorop.h:416:
+
+

-:5458: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#5458: FILE: include/drm/drm_colorop.h:437:
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);

-:5459: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#5459: FILE: include/drm/drm_colorop.h:438:
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);

-:5506: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#5506: FILE: include/drm/drm_fixed.h:97:
+
+}

total: 2 errors, 13 warnings, 76 checks, 5484 lines checked
38209d4942f9 drm: Add Color lut range attributes
d7d397a93ffd drm: Add Color ops capability property
e4d8c3a6ca37 drm: Add 1D LUT multi-segmented color op
-:23: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#23: FILE: drivers/gpu/drm/drm_atomic.c:804:
+		drm_printf(p, "\thw cap blob id=%d\n", state->hw_caps ? state->hw_caps->base.id : 0);

total: 0 errors, 1 warnings, 0 checks, 42 lines checked
ac97ea6ca6e0 drm: Define helper to initialize segmented 1D LUT
d0b9bb6e6866 drm: Add helper to extract lut from struct drm_color_lut_32
c9d46c0caee0 drm/i915: Add identifiers for intel color blocks
6b966b17c32b drm/i915: Add intel_color_op
-:19: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'x' - possible side-effects?
#19: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1563:
+#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)

total: 0 errors, 0 warnings, 1 checks, 31 lines checked
00b536b727db drm/i915/color: Add helper to create intel colorop
970d29d23499 drm/i915/color: Create a transfer function color pipeline
2d77e789bd11 drm/i915/color: Add and attach COLORPIPELINE plane property
81231d39bbee drm/i915/color: Add framework to program CSC
fad6843deaed drm/i915/color: Add callbacks to set plane CTM
8cf5b85bcc44 drm/i915/color: Add new color callbacks for Xelpd
5b08e7bb5b90 drm/i915/color: Preserve sign bit when int_bits is Zero
593815e8aed1 drm/i915/color: Add plane CTM callback for D13 and beyond
23c076497b5e drm/i915: Add register definitions for Plane Degamma
-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)$

-:37: ERROR:CODE_INDENT: code indent should use tabs where possible
#37: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)$

-:37: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#37: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)$

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#38: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:39: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))$

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))$

-:48: ERROR:CODE_INDENT: code indent should use tabs where possible
#48: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)$

-:48: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#48: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)$

-:50: ERROR:CODE_INDENT: code indent should use tabs where possible
#50: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)$

-:50: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#50: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)$

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:318:
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)    \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))

-:52: ERROR:CODE_INDENT: code indent should use tabs where possible
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \$

-:52: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \$

-:53: ERROR:CODE_INDENT: code indent should use tabs where possible
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))$

-:53: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))$

-:60: ERROR:CODE_INDENT: code indent should use tabs where possible
#60: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_1_B)$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_1_B)$

-:62: ERROR:CODE_INDENT: code indent should use tabs where possible
#62: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_2_B)$

-:62: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#62: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_2_B)$

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:330:
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))

-:64: ERROR:CODE_INDENT: code indent should use tabs where possible
#64: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \$

-:64: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#64: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \$

-:65: ERROR:CODE_INDENT: code indent should use tabs where possible
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))$

-:65: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))$

-:72: ERROR:CODE_INDENT: code indent should use tabs where possible
#72: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_PRE_CSC_GAMC_DATA_1_B)$

-:72: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#72: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_PRE_CSC_GAMC_DATA_1_B)$

-:74: ERROR:CODE_INDENT: code indent should use tabs where possible
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_PRE_CSC_GAMC_DATA_2_B)$

-:74: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_PRE_CSC_GAMC_DATA_2_B)$

-:75: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:342:
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)        \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))

-:76: ERROR:CODE_INDENT: code indent should use tabs where possible
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \$

-:76: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \$

-:77: ERROR:CODE_INDENT: code indent should use tabs where possible
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))$

-:77: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))$

total: 16 errors, 16 warnings, 4 checks, 65 lines checked
b7641c3999b6 drm/i915/color: Add framework to program PRE/POST CSC LUT
f07ead561c4d drm/i915: Add register definitions for Plane Post CSC
-:34: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:303:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:303:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)$

-:36: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \

-:37: ERROR:CODE_INDENT: code indent should use tabs where possible
#37: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)$

-:37: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#37: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)$

-:38: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#38: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)     \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \$

-:39: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \$

-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:308:
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))$

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:308:
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))$

-:46: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:314:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \

-:47: ERROR:CODE_INDENT: code indent should use tabs where possible
#47: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)$

-:47: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#47: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)$

-:48: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \

-:49: ERROR:CODE_INDENT: code indent should use tabs where possible
#49: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)$

-:49: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#49: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)$

-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#50: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:318:
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))

-:51: ERROR:CODE_INDENT: code indent should use tabs where possible
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \$

-:51: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \$

-:52: ERROR:CODE_INDENT: code indent should use tabs where possible
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))$

-:52: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))$

-:59: ERROR:CODE_INDENT: code indent should use tabs where possible
#59: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)$

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)$

-:61: ERROR:CODE_INDENT: code indent should use tabs where possible
#61: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)$

-:61: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#61: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)$

-:62: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#62: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:330:
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)  \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))

-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:64: ERROR:CODE_INDENT: code indent should use tabs where possible
#64: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))$

-:64: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#64: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))$

-:71: ERROR:CODE_INDENT: code indent should use tabs where possible
#71: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)$

-:71: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#71: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)$

-:73: ERROR:CODE_INDENT: code indent should use tabs where possible
#73: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)$

-:73: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#73: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)$

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#74: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:342:
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))

-:75: ERROR:CODE_INDENT: code indent should use tabs where possible
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \$

-:75: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \$

-:76: ERROR:CODE_INDENT: code indent should use tabs where possible
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))$

-:76: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#76: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))$

-:83: ERROR:CODE_INDENT: code indent should use tabs where possible
#83: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:351:
+                                               _PLANE_POST_CSC_GAMC_INDEX_1_B)$

-:83: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#83: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:351:
+                                               _PLANE_POST_CSC_GAMC_INDEX_1_B)$

-:85: ERROR:CODE_INDENT: code indent should use tabs where possible
#85: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:353:
+                                               _PLANE_POST_CSC_GAMC_INDEX_2_B)$

-:85: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#85: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:353:
+                                               _PLANE_POST_CSC_GAMC_INDEX_2_B)$

-:86: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#86: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:354:
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))

-:87: ERROR:CODE_INDENT: code indent should use tabs where possible
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:355:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \$

-:87: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:355:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \$

-:88: ERROR:CODE_INDENT: code indent should use tabs where possible
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:356:
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))$

-:88: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#88: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:356:
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))$

-:95: ERROR:CODE_INDENT: code indent should use tabs where possible
#95: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:363:
+                                               _PLANE_POST_CSC_GAMC_DATA_1_B)$

-:95: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#95: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:363:
+                                               _PLANE_POST_CSC_GAMC_DATA_1_B)$

-:97: ERROR:CODE_INDENT: code indent should use tabs where possible
#97: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:365:
+                                               _PLANE_POST_CSC_GAMC_DATA_2_B)$

-:97: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#97: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:365:
+                                               _PLANE_POST_CSC_GAMC_DATA_2_B)$

-:98: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#98: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:366:
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))

-:99: ERROR:CODE_INDENT: code indent should use tabs where possible
#99: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:367:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \$

-:99: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#99: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:367:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \$

-:100: ERROR:CODE_INDENT: code indent should use tabs where possible
#100: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:368:
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))$

-:100: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#100: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:368:
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))$

total: 24 errors, 28 warnings, 6 checks, 86 lines checked
93cc2a346165 drm/i915/color: Program Pre-CSC registers
576089137c34 drm/i915/xelpd: Program Plane Post CSC Registers
132ec6a8c393 drm/i915/color: Enable Plane Color Pipelines
7275766e5631 drm/i915/color: Create color pipeline with multisegmented LUT
cbf896bafe1c drm/doc/rfc: Add documentation for multi-segmented 1D LUT


