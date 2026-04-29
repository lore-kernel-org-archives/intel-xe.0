Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AB0FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48210E566;
	Wed, 29 Apr 2026 05:25:18 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6899110E566;
 Wed, 29 Apr 2026 05:25:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 05:25:17 -0000
Message-ID: <177744031742.23767.12043864383435089514@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260429055147.1579576-8-riana.tauro@intel.com>
In-Reply-To: <20260429055147.1579576-8-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI (rev3)
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
commit 2763436f77c08e6e120109a58006f842fd3f1fec
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Apr 29 11:21:50 2026 +0530

    drm/xe/xe_ras: Control xe drm_ras registration with a flag
    
    Add a flag to control xe drm_ras registration.
    Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch a53aafc879e9c52b2776089762591d2766a27f0a drm-intel
fb831f57d27a drm/xe/uapi: Add additional error components to xe drm_ras
742cc9f378f1 drm/xe/xe_ras: Add support to get error counter in CRI
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

total: 0 errors, 1 warnings, 2 checks, 259 lines checked
a801287bbc5f drm/xe/xe_ras: Add helper to clear error counter
ca8550df8554 drm/xe/xe_drm_ras: Wire get-error-counter and clear-error-counter support for CRI
cbee574dff6b drm/xe/xe_ras: Move xe drm_ras registration
2763436f77c0 drm/xe/xe_ras: Control xe drm_ras registration with a flag
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Enable this flag for PVC and CRI to support exposing RAS error counters via netlink.

-:19: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#19: FILE: drivers/gpu/drm/xe/xe_device_types.h:158:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

total: 0 errors, 2 warnings, 0 checks, 44 lines checked


