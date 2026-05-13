Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056C2CD484C
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 05:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081C10E2E2;
	Wed, 13 May 2026 05:03:14 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BADC10E2E2;
 Wed, 13 May 2026 05:03:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_error_threshold?=
 =?utf-8?q?_to_drm=5Fras_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 05:03:13 -0000
Message-ID: <177864859342.65322.10625570065918774337@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512191610.1817578-1-raag.jadav@intel.com>
In-Reply-To: <20260512191610.1817578-1-raag.jadav@intel.com>
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

Series: Introduce error threshold to drm_ras (rev2)
URL   : https://patchwork.freedesktop.org/series/165091/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d61077e4c62b0d27075c3705199068496536bea2
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed May 13 00:46:10 2026 +0530

    drm/xe/xe_ras: Control xe drm_ras registration with a flag
    
    Add a flag to control xe drm_ras registration.
    Enable this flag for PVC and CRI to support exposing RAS error counters
    via netlink.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.comg
+ /mt/dim checkpatch 8fbb3d48e61c7e68cefdba85c3fa3ba59e7a93b4 drm-intel
7ca271e26416 drm/ras: Update counter helpers with counter naming
ef4a025dc3ed drm/ras: Introduce get-error-threshold
-:252: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#252: FILE: drivers/gpu/drm/drm_ras_nl.c:32:
+static const struct nla_policy drm_ras_get_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
266bc905b534 drm/ras: Introduce set-error-threshold
-:150: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#150: FILE: drivers/gpu/drm/drm_ras_nl.c:38:
+static const struct nla_policy drm_ras_set_error_threshold_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD + 1] = {

total: 0 errors, 1 warnings, 0 checks, 169 lines checked
1e656c8cd7d7 drm/xe/uapi: Add additional error components to xe drm_ras
ee3fa8f74fc2 drm/xe/ras: Get error threshold support
-:43: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#43: FILE: drivers/gpu/drm/xe/xe_ras.c:64:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_components) == DRM_XE_RAS_ERR_COMP_MAX);

-:50: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#50: FILE: drivers/gpu/drm/xe/xe_ras.c:71:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severities) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 0 warnings, 2 checks, 172 lines checked
94cf526ec103 drm/xe/ras: Set error threshold support
fcffbee0cd3a drm/xe/drm_ras: Wire up error threshold callbacks
7be9c83a6239 drm/xe/xe_ras: Move xe drm_ras registration
d61077e4c62b drm/xe/xe_ras: Control xe drm_ras registration with a flag
-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Raag Jadav <raag.jadav@intel.comg'
#11: 
Reviewed-by: Raag Jadav <raag.jadav@intel.comg

-:21: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_device_types.h:159:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

total: 1 errors, 1 warnings, 0 checks, 44 lines checked


