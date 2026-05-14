Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816C2CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 04:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4061D10E35B;
	Thu, 14 May 2026 04:55:10 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6455C10E35B;
 Thu, 14 May 2026 04:55:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 May 2026 04:55:08 -0000
Message-ID: <177873450840.70182.2490620763486740034@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260514052205.1340143-8-riana.tauro@intel.com>
In-Reply-To: <20260514052205.1340143-8-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI (rev5)
URL   : https://patchwork.freedesktop.org/series/164393/
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
commit 85ae17b611fb6b2ac1ef3c3b974197e14aaa24f5
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu May 14 10:52:12 2026 +0530

    drm/xe/xe_ras: Add drm_ras feature flag
    
    Add xe drm_ras feature flag. Enable this flag for PVC and CRI to support
    exposing RAS error counters via netlink.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch dee34cfbffbfe2196a9332f966b006cd2e54e976 drm-intel
0f4ae66f1e2e drm/xe/uapi: Add additional error components to xe drm_ras
cdf08a822d85 drm/xe/xe_ras: Add support to get error counter in CRI
-:42: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#42: FILE: drivers/gpu/drm/xe/xe_ras.c:64:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

-:49: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#49: FILE: drivers/gpu/drm/xe/xe_ras.c:71:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 0 warnings, 2 checks, 200 lines checked
da154de03dd2 drm/xe/xe_ras: Add support to clear error counter
081a0ca70152 drm/xe/xe_drm_ras: Wire get/clear counter callbacks
ac9f01561f1b drm/xe: Move xe drm_ras initialization
85ae17b611fb drm/xe/xe_ras: Add drm_ras feature flag
-:32: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#32: FILE: drivers/gpu/drm/xe/xe_device_types.h:159:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 51 lines checked


