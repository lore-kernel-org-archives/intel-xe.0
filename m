Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3051EC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 20:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1EF10EC3B;
	Fri,  7 Mar 2025 20:01:46 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F25210E1E4;
 Fri,  7 Mar 2025 20:01:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_differe?=
 =?utf-8?q?nt_GuCs_per_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 20:01:45 -0000
Message-ID: <174137770525.3728.11321657411541675300@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
In-Reply-To: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
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

Series: drm/xe: Support different GuCs per GT
URL   : https://patchwork.freedesktop.org/series/146015/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 51148f2ff0c997a452ee0dd8b8365583462a77e0
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Mar 7 10:13:22 2025 -0800

    drm/xe/uc: Add support for different firmware files on each GT
    
    The different GTs on a device can be very different. Right now for all
    platforms the same firmware is loaded in each GT, however future
    platforms may benefit from loading a different file depending on the GT
    type.
    
    Based on previous patch by John Harrison <John.C.Harrison@Intel.com>.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
3121ba1a51c2 drm/xe/uc: Remove static from loop variable
51148f2ff0c9 drm/xe/uc: Add support for different firmware files on each GT
-:51: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mmp_ver' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))

-:51: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'major_ver' - possible side-effects?
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:116:
+#define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 29, 2))	\
+	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 29, 2))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
+	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
+	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 29, 2))

-:89: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#89: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)							\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY, major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY, major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:89: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#89: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)							\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY, major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY, major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:89: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'major_ver' - possible side-effects?
#89: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:142:
+#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)							\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY, major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY, major_ver(i915,	gsc,	mtl,	102, 1, 0))

-:100: WARNING:MACRO_ARG_UNUSED: Argument 'platform__' is not used in function-like macro
#100: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
 	MODULE_FIRMWARE(fw_filename);

-:100: WARNING:MACRO_ARG_UNUSED: Argument 'gt_type__' is not used in function-like macro
#100: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
 	MODULE_FIRMWARE(fw_filename);

-:100: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#100: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:172:
+#define XE_UC_MODULE_FIRMWARE(platform__, gt_type__, fw_filename)		\
 	MODULE_FIRMWARE(fw_filename);

total: 2 errors, 3 warnings, 5 checks, 141 lines checked


