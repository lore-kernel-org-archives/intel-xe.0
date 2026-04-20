Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E70F5A8B6
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 19:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D789510EB41;
	Mon, 20 Apr 2026 19:51:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9510EB24;
 Mon, 20 Apr 2026 19:51:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_error_threshold?=
 =?utf-8?q?_to_drm=5Fras?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 19:51:34 -0000
Message-ID: <177671469441.478721.2130921987323050871@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260417211730.837345-1-raag.jadav@intel.com>
In-Reply-To: <20260417211730.837345-1-raag.jadav@intel.com>
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

Series: Introduce error threshold to drm_ras
URL   : https://patchwork.freedesktop.org/series/165091/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b6789ea593d0f7becaf9c7f2f09bfdcbd9c27365
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Sat Apr 18 02:46:46 2026 +0530

    drm/xe/ras: Add flag for Xe RAS
    
    Add a flag for RAS. If enabled, XE driver registers with
    drm_ras and exposes supported counters.
    
    Currently this is enabled for PVC and CRI.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch da91cb4e6137507f74e4da41c39d0260b4cd1201 drm-intel
24cb1511b779 drm/ras: Update counter helpers with counter naming
b2b42850a2d7 drm/ras: Introduce get-error-threshold
-:220: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#220: FILE: drivers/gpu/drm/drm_ras.c:405:
+int drm_ras_nl_get_error_threshold_doit(struct sk_buff *skb,
+				      struct genl_info *info)

-:247: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#247: FILE: drivers/gpu/drm/drm_ras_nl.c:26:
+static const struct nla_policy drm_ras_get_error_threshold_nl_policy[DRM_RAS_A_ERROR_THRESHOLD_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 1 warnings, 1 checks, 275 lines checked
b14b6b3fdce7 drm/ras: Introduce set-error-threshold
-:118: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#118: FILE: drivers/gpu/drm/drm_ras.c:451:
+int drm_ras_nl_set_error_threshold_doit(struct sk_buff *skb,
+				      struct genl_info *info)

-:147: WARNING:LONG_LINE: line length of 125 exceeds 100 columns
#147: FILE: drivers/gpu/drm/drm_ras_nl.c:32:
+static const struct nla_policy drm_ras_set_error_threshold_nl_policy[DRM_RAS_A_ERROR_THRESHOLD_ATTRS_ERROR_THRESHOLD + 1] = {

total: 0 errors, 1 warnings, 1 checks, 165 lines checked
ccf8617bd24c drm/xe/uapi: Add additional error components to XE drm_ras
e3172913553a drm/xe/sysctrl: Add system controller interrupt handler
557b5ee5d8ce drm/xe/sysctrl: Add system controller event support
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 219 lines checked
28c4e4d1c72f drm/xe/ras: Introduce correctable error handling
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:70: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#70: FILE: drivers/gpu/drm/xe/xe_ras.c:39:
+};
+static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);

-:81: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#81: FILE: drivers/gpu/drm/xe/xe_ras.c:50:
+};
+static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);

total: 0 errors, 1 warnings, 2 checks, 202 lines checked
3423741adcdc drm/xe/ras: Get error threshold support
-:43: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#43: FILE: drivers/gpu/drm/xe/xe_ras.c:63:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_components) == DRM_XE_RAS_ERR_COMP_MAX);

-:50: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#50: FILE: drivers/gpu/drm/xe/xe_ras.c:70:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severities) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 0 warnings, 2 checks, 143 lines checked
753a4612f652 drm/xe/ras: Set error threshold support
8c9e08ab822f drm/xe/drm_ras: Wire up error threshold callbacks
b6789ea593d0 drm/xe/ras: Add flag for Xe RAS
-:21: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_device_types.h:194:
+		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 44 lines checked


