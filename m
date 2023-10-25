Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA79FC25B6E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 20:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D62B10E5EA;
	Wed, 25 Oct 2023 20:59:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A71C510E5EA;
 Wed, 25 Oct 2023 20:59:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5EF7A0093;
 Wed, 25 Oct 2023 20:59:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 25 Oct 2023 20:59:08 -0000
Message-ID: <169826754867.20488.2672033285293304771@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231025175745.1906310-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Clear-media_HuC_support_for_MTL_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Clear-media HuC support for MTL (rev3)
URL   : https://patchwork.freedesktop.org/series/123816/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dfdccb7b7141988e4575b6f07eef1631d9048134
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Oct 25 10:57:45 2023 -0700

    drm/xe/huc: Define HuC for MTL
    
    MTL uses a versionless GSC-enabled binary.
    
    v2: don't use the filename to identify the header type (Lucas)
    v3: fix commit msg (Lucas)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch bd3d7e8aa312ce25c5797388f753151f024bec02 drm-intel
809c17be4 drm/xe/uc: Prepare for parsing of different header types
ffce2d03a drm/xe/huc: Extract version and binary offset from new HuC headers
-:51: ERROR:POINTER_LOCATION: "foo* bar" should be "foo *bar"
#51: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:405:
+static bool is_cpd_header(const void* data)

-:63: ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#63: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:417:
+	entry = (void*)header + header->header_length;

-:166: WARNING:UNNECESSARY_BREAK: break is not useful after a return
#166: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:519:
+		return parse_css_header(uc_fw, fw->data, fw->size);
+		break;

total: 2 errors, 1 warnings, 0 checks, 284 lines checked
384e956fa drm/xe/huc: HuC is not supported on GTs that don't have video engines
-:32: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'gt != tile->media_gt'
#32: FILE: drivers/gpu/drm/xe/xe_huc.c:46:
+	if (tile->media_gt && (gt != tile->media_gt)) {

total: 0 errors, 0 warnings, 1 checks, 20 lines checked
9dd3e7f9c drm/xe/huc: Don't re-auth HuC if it's already authenticated
dfdccb7b7 drm/xe/huc: Define HuC for MTL
-:31: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#31: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:115:
+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'fw_def' - possible side-effects?
#31: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:115:
+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))

-:31: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'no_ver' - possible side-effects?
#31: FILE: drivers/gpu/drm/xe/xe_uc_fw.c:115:
+#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
+	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,		tgl))		\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
+	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))

total: 1 errors, 0 warnings, 2 checks, 19 lines checked


