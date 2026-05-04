Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2038FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 06:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A410E257;
	Mon,  4 May 2026 06:43:50 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C82C10E257;
 Mon,  4 May 2026 06:43:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 06:43:49 -0000
Message-ID: <177787702911.33916.6994481322132940509@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504065614.3832331-8-riana.tauro@intel.com>
In-Reply-To: <20260504065614.3832331-8-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI (rev4)
URL   : https://patchwork.freedesktop.org/series/164393/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 579a341de8b50abc89db2a8ef738f27d185e1b2f
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon May 4 12:26:21 2026 +0530

    drm/xe/xe_ras: Control xe drm_ras registration with a flag
    
    Add a flag to control xe drm_ras registration.
    Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 59b0faed1d239bc0f433999671c2d195bd62f9b8 drm-intel
b190520f86c7 drm/xe/uapi: Add additional error components to xe drm_ras
d706ccb20437 drm/xe/xe_ras: Add support to get error counter in CRI
-:42: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#42: FILE: drivers/gpu/drm/xe/xe_ras.c:64:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

-:49: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#49: FILE: drivers/gpu/drm/xe/xe_ras.c:71:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 0 warnings, 2 checks, 176 lines checked
c5efb7b17ae1 drm/xe/xe_ras: Add helper to clear error counter
fd5de937474e drm/xe/xe_drm_ras: Wire get-error-counter and clear-error-counter support for CRI
4108f84f6825 drm/xe/xe_ras: Move xe drm_ras registration
579a341de8b5 drm/xe/xe_ras: Control xe drm_ras registration with a flag
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.

-:19: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#19: FILE: drivers/gpu/drm/xe/xe_device_types.h:158:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

total: 0 errors, 2 warnings, 0 checks, 44 lines checked


