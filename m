Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4082DF46C45
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A5E10E198;
	Mon,  6 Apr 2026 14:54:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDCB10E198;
 Mon,  6 Apr 2026 14:54:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 14:54:57 -0000
Message-ID: <177548729729.433781.9554905778884162829@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406145440.2016065-7-riana.tauro@intel.com>
In-Reply-To: <20260406145440.2016065-7-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI
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
commit 11d773bb3c972993b849b44db60fb73f4828ece5
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Apr 6 20:24:44 2026 +0530

    drm/xe/ras: Add flag for Xe RAS
    
    Add a flag for RAS. If enabled, XE driver registers with
    drm_ras and exposes supported counters.
    
    Currently this is enabled for PVC and CRI.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 7b7217a9e27a82ef10be22ab3a55ad5bbc849688 drm-intel
0627e7e5cc01 drm/xe/uapi: Add additional error components to XE drm_ras
4e5d68e25364 drm/xe/xe_ras: Add structures and commands for get and clear counter
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

-:103: WARNING:LONG_LINE_COMMENT: line length of 102 exceeds 100 columns
#103: FILE: drivers/gpu/drm/xe/xe_ras_types.h:87:
+	/** @num_headers: Number of detailed counter headers present at the beginning of queue data */

total: 0 errors, 2 warnings, 0 checks, 197 lines checked
b32315d55490 drm/xe/xe_ras: Add support to query error counter for CRI
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

-:150: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#150: FILE: drivers/gpu/drm/xe/xe_ras.c:43:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

-:157: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#157: FILE: drivers/gpu/drm/xe/xe_ras.c:50:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);

total: 0 errors, 1 warnings, 2 checks, 197 lines checked
1831db2533e6 drm/xe/xe_ras: Add helper to clear error counter
11d773bb3c97 drm/xe/ras: Add flag for Xe RAS
-:21: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_device_types.h:194:
+		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 44 lines checked


