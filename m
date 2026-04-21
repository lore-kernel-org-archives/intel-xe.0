Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A64CF8FA80
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 14:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2B10E8BB;
	Tue, 21 Apr 2026 14:26:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9991510E8BB;
 Tue, 21 Apr 2026 14:26:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Apr 2026 14:26:14 -0000
Message-ID: <177678157462.481576.10982764672080718050@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260421145056.253300-7-riana.tauro@intel.com>
In-Reply-To: <20260421145056.253300-7-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI (rev2)
URL   : https://patchwork.freedesktop.org/series/164393/
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
commit d2d3f915011fcdea5e8982176beef9dc092eb52c
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Tue Apr 21 20:21:01 2026 +0530

    drm/xe/ras: Add flag for Xe RAS
    
    Add a flag for RAS. If enabled, XE driver registers with
    drm_ras and exposes supported counters.
    
    Currently this is enabled for PVC and CRI.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch ec977e007a298eccda3ea383c24b23c1bf02aa60 drm-intel
0c7adcda8179 drm/xe/uapi: Add additional error components to XE drm_ras
e5670625c7c2 drm/xe/xe_ras: Add support to get error counter in CRI
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:71: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#71: FILE: drivers/gpu/drm/xe/xe_ras.c:43:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

-:78: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#78: FILE: drivers/gpu/drm/xe/xe_ras.c:50:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 1 warnings, 2 checks, 256 lines checked
cf6028244046 drm/xe/xe_ras: Add helper to clear error counter
faabd10cde70 drm/xe/xe_drm_ras: Wire get-counter support into xe_drm_ras for CRI
d2d3f915011f drm/xe/ras: Add flag for Xe RAS
-:21: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_device_types.h:194:
+		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 44 lines checked


