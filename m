Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C274FCCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 12:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DDA10E71E;
	Wed,  5 Nov 2025 12:36:29 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A8F10E71E;
 Wed,  5 Nov 2025 12:36:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Plane_Color_Pipeline_supp?=
 =?utf-8?q?ort_for_Intel_platforms_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 12:36:28 -0000
Message-ID: <176234618862.20785.12730880162040277704@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105123413.2671075-1-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Series: Plane Color Pipeline support for Intel platforms (rev5)
URL   : https://patchwork.freedesktop.org/series/141788/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89fc3c0bfb005e4541de97f5f9786e555176c03d
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Wed Nov 5 18:04:12 2025 +0530

    drm/i915/color: Enable Plane Color Pipelines
    
    Expose color pipeline and add ability to program it.
    
    v2: Set bit to enable multisegmented lut
    v3: s/drm_color_lut_32/drm_color_lut32 (Simon)
    v4: - Fix dsb programming
        - Remove multi-segment LUT, they will be added in later patches
        - Add pipeline only to TGL+
        - Code Refactor
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 8043455e28fb7b8089e55e4390547a4c3d7bd4dc drm-intel
a76ac9300351 drm: AMD series squashed
-:50: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#50: 
new file mode 100644

-:734: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#734: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:724:
+							 gamma, gamma != NULL);

-:742: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#742: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:732:
+		res = mod_color_calculate_regamma_params(func, gamma, gamma != NULL,

-:752: CHECK:LINE_SPACING: Please don't use multiple blank lines
#752: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:742:
+
+

-:788: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "gamma"
#788: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:843:
+	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);

-:841: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#841: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:964:
+static void __drm_3dlut32_to_dc_3dlut(const struct drm_color_lut32 *lut,
+				       uint32_t lut3d_size,

-:841: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#841: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:964:
+				       uint32_t lut3d_size,

-:852: CHECK:LINE_SPACING: Please don't use multiple blank lines
#852: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:975:
+
+

-:893: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#893: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1466:
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)

-:973: CHECK:SPACING: No space is necessary after a cast
#973: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1546:
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;

-:1029: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1029: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1602:
+	uint32_t shaper_size;

-:1045: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#1045: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1618:
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);

-:1075: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "shaper_lut"
#1075: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1648:
+		shaper_size = shaper_lut != NULL ? shaper_size : 0;

-:1104: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1104: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1677:
+static int __set_colorop_3dlut(const struct drm_color_lut32 *drm_lut3d,
+				uint32_t drm_lut3d_size,

-:1104: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1104: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1677:
+				uint32_t drm_lut3d_size,

-:1118: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1118: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1691:
+	__drm_3dlut32_to_dc_3dlut(drm_lut3d, drm_lut3d_size, &lut->lut_3d,
+				   lut->lut_3d.use_tetrahedral_9, 12);

-:1135: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1135: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1708:
+	uint32_t lut3d_size;

-:1156: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "lut3d"
#1156: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1729:
+		lut3d_size = lut3d != NULL ? lut3d_size : 0;

-:1190: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1190: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1763:
+	uint32_t blend_size;

-:1207: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#1207: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1780:
+		tf->tf = default_tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);

-:1235: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "blend_lut"
#1235: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1808:
+		blend_size = blend_lut != NULL ? blend_size : 0;

-:1254: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1254: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c:1870:
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)

-:1425: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1425: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:69:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1443: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1443: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:87:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1453: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1453: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:97:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1458: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1458: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:102:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1468: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1468: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:112:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1474: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1474: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:118:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1481: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1481: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:125:
+		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
+						amdgpu_dm_supported_shaper_tfs,

-:1486: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1486: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:130:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1491: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1491: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:135:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1498: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1498: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:142:
+		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,

-:1503: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1503: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:147:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1508: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1508: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:152:
+		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1515: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1515: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:159:
+		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
+					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,

-:1520: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1520: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:164:
+		drm_colorop_set_next_property(ops[i-1], ops[i]);
 		                                   ^

-:1525: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1525: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:169:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1537: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1537: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:181:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1542: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct drm_colorop)...)
#1542: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:186:
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

-:1554: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#1554: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c:198:
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
 	                                   ^

-:1687: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around pipelines[len]
#1687: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c:1805:
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));

-:1773: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1773: FILE: drivers/gpu/drm/drm_atomic.c:595:
 
+

-:1830: CHECK:LINE_SPACING: Please don't use multiple blank lines
#1830: FILE: drivers/gpu/drm/drm_atomic.c:784:
 
+

-:1833: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1833: FILE: drivers/gpu/drm/drm_atomic.c:787:
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)

-:2023: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2023: FILE: drivers/gpu/drm/drm_atomic_uapi.c:261:
 
+

-:2052: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2052: FILE: drivers/gpu/drm/drm_atomic_uapi.c:290:
+
+

-:2120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2120: FILE: drivers/gpu/drm/drm_atomic_uapi.c:728:
+static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state, struct drm_file *file_priv,

-:2149: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2149: FILE: drivers/gpu/drm/drm_atomic_uapi.c:757:
+drm_atomic_colorop_get_property(struct drm_colorop *colorop,
+		const struct drm_colorop_state *state,

-:2152: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#2152: FILE: drivers/gpu/drm/drm_atomic_uapi.c:760:
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
+	} else if (property == colorop->size_property) {
[...]
+	} else if (property == colorop->lut3d_interpolation_property) {
[...]
+	} else if (property == colorop->data_property) {
[...]
+	} else {
[...]

-:2189: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2189: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1056:
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);

-:2213: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2213: FILE: drivers/gpu/drm/drm_atomic_uapi.c:1270:
+		ret = drm_atomic_colorop_set_property(colorop,
+				colorop_state, file_priv,

-:2370: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2370: FILE: drivers/gpu/drm/drm_colorop.c:88:
+
+

-:2378: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2378: FILE: drivers/gpu/drm/drm_colorop.c:96:
+static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
+			    struct drm_plane *plane, enum drm_colorop_type type, uint32_t flags)

-:2423: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2423: FILE: drivers/gpu/drm/drm_colorop.c:141:
+		drm_object_attach_property(&colorop->base,
+					colorop->bypass_property,

-:2532: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2532: FILE: drivers/gpu/drm/drm_colorop.c:250:
+
+

-:2580: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#2580: FILE: drivers/gpu/drm/drm_colorop.c:298:
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,

-:2676: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#2676: FILE: drivers/gpu/drm/drm_colorop.c:394:
+				 uint32_t lut_size,

-:2745: CHECK:LINE_SPACING: Please don't use multiple blank lines
#2745: FILE: drivers/gpu/drm/drm_colorop.c:463:
+
+

-:2770: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#2770: FILE: drivers/gpu/drm/drm_colorop.c:488:
+		drm_object_property_get_default_value(&colorop->base,
+						colorop->curve_1d_type_property,

-:3508: CHECK:LINE_SPACING: Please don't use multiple blank lines
#3508: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:302:
+
+

-:3583: CHECK:LINE_SPACING: Please don't use multiple blank lines
#3583: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:377:
+
+

-:3603: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#3603: FILE: drivers/gpu/drm/vkms/tests/vkms_color_test.c:397:
+
+}

-:3658: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3658: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:29:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3676: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3676: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:47:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3692: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3692: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:63:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3708: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#3708: FILE: drivers/gpu/drm/vkms/vkms_colorop.c:79:
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");

-:3878: CHECK:SPACING: No space is necessary after a cast
#3878: FILE: drivers/gpu/drm/vkms/vkms_composer.c:188:
+					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);

-:4943: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#4943: FILE: include/drm/drm_atomic.h:816:
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)

-:4958: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#4958: FILE: include/drm/drm_atomic.h:831:
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)

-:4992: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#4992: FILE: include/drm/drm_atomic.h:1081:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \

-:4992: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#4992: FILE: include/drm/drm_atomic.h:1081:
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

-:4992: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#4992: FILE: include/drm/drm_atomic.h:1081:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4992: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#4992: FILE: include/drm/drm_atomic.h:1081:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4992: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#4992: FILE: include/drm/drm_atomic.h:1081:
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:4996: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#4996: FILE: include/drm/drm_atomic.h:1085:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-:5002: CHECK:LINE_SPACING: Please don't use multiple blank lines
#5002: FILE: include/drm/drm_atomic.h:1091:
+
+

-:5014: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#5014: FILE: include/drm/drm_atomic.h:1103:
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

-:5014: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__state' - possible side-effects?
#5014: FILE: include/drm/drm_atomic.h:1103:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:5014: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'colorop' - possible side-effects?
#5014: FILE: include/drm/drm_atomic.h:1103:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:5014: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#5014: FILE: include/drm/drm_atomic.h:1103:
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))

-:5018: WARNING:SPACING: space prohibited between function name and open parenthesis '('
#5018: FILE: include/drm/drm_atomic.h:1107:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-:5139: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#5139: FILE: include/drm/drm_colorop.h:35:
+#define DRM_COLOROP_FLAG_ALLOW_BYPASS	(1<<0)	/* Allow bypass on the drm_colorop */
                                      	  ^

-:5256: CHECK:LINE_SPACING: Please don't use multiple blank lines
#5256: FILE: include/drm/drm_colorop.h:152:
+
+

-:5278: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#5278: FILE: include/drm/drm_colorop.h:174:
+	uint64_t multiplier;

-:5399: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#5399: FILE: include/drm/drm_colorop.h:295:
+	uint32_t size;

-:5485: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#5485: FILE: include/drm/drm_colorop.h:381:
+static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
+		struct drm_file *file_priv,

-:5501: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#5501: FILE: include/drm/drm_colorop.h:397:
+					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,

-:5509: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#5509: FILE: include/drm/drm_colorop.h:405:
+				 uint32_t lut_size,

-:5540: CHECK:LINE_SPACING: Please don't use multiple blank lines
#5540: FILE: include/drm/drm_colorop.h:436:
+
+

-:5561: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#5561: FILE: include/drm/drm_colorop.h:457:
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);

-:5562: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#5562: FILE: include/drm/drm_colorop.h:458:
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);

-:5609: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#5609: FILE: include/drm/drm_fixed.h:97:
+
+}

total: 2 errors, 13 warnings, 77 checks, 5563 lines checked
b9c4d876b7f2 drm/i915: Add identifiers for driver specific blocks
f1258d799e26 drm/i915: Add intel_color_op
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
c12445dec322 drm/i915/color: Add helper to create intel colorop
cbeeee9c9814 drm/i915/color: Create a transfer function color pipeline
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 128 lines checked
a0e1467ca506 drm/i915/color: Add framework to program CSC
61aff75af281 drm/i915/color: Preserve sign bit when int_bits is Zero
f29c19f4847b drm/i915/color: Add plane CTM callback for D12 and beyond
4897859a825a drm/i915: Add register definitions for Plane Degamma
-:40: ERROR:CODE_INDENT: code indent should use tabs where possible
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)$

-:40: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)$

-:42: ERROR:CODE_INDENT: code indent should use tabs where possible
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)$

-:42: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B)$

-:43: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#43: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:44: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:45: ERROR:CODE_INDENT: code indent should use tabs where possible
#45: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))$

-:45: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#45: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))$

-:53: ERROR:CODE_INDENT: code indent should use tabs where possible
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)$

-:53: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B)$

-:55: ERROR:CODE_INDENT: code indent should use tabs where possible
#55: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)$

-:55: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#55: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                               _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B)$

-:56: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#56: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:318:
+#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)    \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))

-:57: ERROR:CODE_INDENT: code indent should use tabs where possible
#57: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \$

-:57: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#57: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \$

-:58: ERROR:CODE_INDENT: code indent should use tabs where possible
#58: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))$

-:58: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#58: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))$

-:65: ERROR:CODE_INDENT: code indent should use tabs where possible
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_1_B)$

-:65: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_1_B)$

-:67: ERROR:CODE_INDENT: code indent should use tabs where possible
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_2_B)$

-:67: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_PRE_CSC_GAMC_INDEX_2_B)$

-:68: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:330:
+#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))

-:69: ERROR:CODE_INDENT: code indent should use tabs where possible
#69: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \$

-:69: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#69: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \$

-:70: ERROR:CODE_INDENT: code indent should use tabs where possible
#70: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))$

-:70: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#70: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))$

-:77: ERROR:CODE_INDENT: code indent should use tabs where possible
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_PRE_CSC_GAMC_DATA_1_B)$

-:77: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_PRE_CSC_GAMC_DATA_1_B)$

-:79: ERROR:CODE_INDENT: code indent should use tabs where possible
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_PRE_CSC_GAMC_DATA_2_B)$

-:79: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_PRE_CSC_GAMC_DATA_2_B)$

-:80: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#80: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:342:
+#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)        \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))

-:81: ERROR:CODE_INDENT: code indent should use tabs where possible
#81: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \$

-:81: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#81: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \$

-:82: ERROR:CODE_INDENT: code indent should use tabs where possible
#82: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))$

-:82: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#82: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))$

total: 16 errors, 16 warnings, 4 checks, 65 lines checked
f491f862b0ad drm/i915/color: Add framework to program PRE/POST CSC LUT
41a5e4fc9570 drm/i915: Add register definitions for Plane Post CSC
-:38: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:302:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \

-:39: ERROR:CODE_INDENT: code indent should use tabs where possible
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:303:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)$

-:39: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:303:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)$

-:40: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:304:
+#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)    _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \

-:41: ERROR:CODE_INDENT: code indent should use tabs where possible
#41: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)$

-:41: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#41: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:305:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)$

-:42: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:306:
+#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)     \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))

-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \$

-:43: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#43: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:307:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \$

-:44: ERROR:CODE_INDENT: code indent should use tabs where possible
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:308:
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))$

-:44: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:308:
+               _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))$

-:50: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#50: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:314:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \

-:51: ERROR:CODE_INDENT: code indent should use tabs where possible
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)$

-:51: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#51: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:315:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)$

-:52: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:316:
+#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)     _PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \

-:53: ERROR:CODE_INDENT: code indent should use tabs where possible
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)$

-:53: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#53: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:317:
+                                                       _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)$

-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#54: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:318:
+#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))

-:55: ERROR:CODE_INDENT: code indent should use tabs where possible
#55: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \$

-:55: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#55: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:319:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \$

-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))$

-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:320:
+               _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))$

-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)$

-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:327:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)$

-:65: ERROR:CODE_INDENT: code indent should use tabs where possible
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)$

-:65: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#65: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:329:
+                                               _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)$

-:66: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#66: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:330:
+#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)  \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))

-:67: ERROR:CODE_INDENT: code indent should use tabs where possible
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:67: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#67: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:331:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \$

-:68: ERROR:CODE_INDENT: code indent should use tabs where possible
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))$

-:68: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#68: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:332:
+               _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))$

-:75: ERROR:CODE_INDENT: code indent should use tabs where possible
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)$

-:75: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#75: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:339:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)$

-:77: ERROR:CODE_INDENT: code indent should use tabs where possible
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)$

-:77: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#77: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:341:
+                                               _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)$

-:78: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#78: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:342:
+#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)   \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))

-:79: ERROR:CODE_INDENT: code indent should use tabs where possible
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \$

-:79: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#79: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:343:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \$

-:80: ERROR:CODE_INDENT: code indent should use tabs where possible
#80: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))$

-:80: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#80: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:344:
+               _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))$

-:87: ERROR:CODE_INDENT: code indent should use tabs where possible
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:351:
+                                               _PLANE_POST_CSC_GAMC_INDEX_1_B)$

-:87: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#87: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:351:
+                                               _PLANE_POST_CSC_GAMC_INDEX_1_B)$

-:89: ERROR:CODE_INDENT: code indent should use tabs where possible
#89: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:353:
+                                               _PLANE_POST_CSC_GAMC_INDEX_2_B)$

-:89: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#89: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:353:
+                                               _PLANE_POST_CSC_GAMC_INDEX_2_B)$

-:90: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#90: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:354:
+#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)      \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))

-:91: ERROR:CODE_INDENT: code indent should use tabs where possible
#91: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:355:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \$

-:91: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#91: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:355:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \$

-:92: ERROR:CODE_INDENT: code indent should use tabs where possible
#92: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:356:
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))$

-:92: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#92: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:356:
+               _PLANE_POST_CSC_GAMC_INDEX_2(pipe))$

-:99: ERROR:CODE_INDENT: code indent should use tabs where possible
#99: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:363:
+                                               _PLANE_POST_CSC_GAMC_DATA_1_B)$

-:99: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#99: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:363:
+                                               _PLANE_POST_CSC_GAMC_DATA_1_B)$

-:101: ERROR:CODE_INDENT: code indent should use tabs where possible
#101: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:365:
+                                               _PLANE_POST_CSC_GAMC_DATA_2_B)$

-:101: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#101: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:365:
+                                               _PLANE_POST_CSC_GAMC_DATA_2_B)$

-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#102: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:366:
+#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)       \
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))

-:103: ERROR:CODE_INDENT: code indent should use tabs where possible
#103: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:367:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \$

-:103: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#103: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:367:
+               _MMIO_PLANE_GAMC(plane, i, _PLANE_POST_CSC_GAMC_DATA_1(pipe), \$

-:104: ERROR:CODE_INDENT: code indent should use tabs where possible
#104: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:368:
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))$

-:104: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#104: FILE: drivers/gpu/drm/i915/display/skl_universal_plane_regs.h:368:
+               _PLANE_POST_CSC_GAMC_DATA_2(pipe))$

total: 24 errors, 28 warnings, 6 checks, 86 lines checked
711606a23e06 drm/i915/color: Program Pre-CSC registers
8f966c300b32 drm/i915/xelpd: Program Plane Post CSC Registers
b70762f851a3 drm/i915/display: Add registers for 3D LUT
7898b6c5a91d drm/i915/color: Add 3D LUT to color pipeline
89fc3c0bfb00 drm/i915/color: Enable Plane Color Pipelines


