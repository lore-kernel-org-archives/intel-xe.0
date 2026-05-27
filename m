Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164D6CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 05:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FEF10E236;
	Wed, 27 May 2026 05:34:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9710A10E236;
 Wed, 27 May 2026 05:34:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_and?=
 =?utf-8?q?_clear-error-counter_support_for_CRI_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 May 2026 05:34:57 -0000
Message-ID: <177986009761.14032.8462992223151830221@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527060241.3351323-8-riana.tauro@intel.com>
In-Reply-To: <20260527060241.3351323-8-riana.tauro@intel.com>
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

Series: Add get-error-counter and clear-error-counter support for CRI (rev6)
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
commit 593d236c36ebbc64490964ac5a53efd5e02c55a1
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed May 27 11:32:48 2026 +0530

    drm/xe/xe_ras: Add drm_ras feature flag
    
    Add xe drm_ras feature flag. Enable this flag for PVC and CRI to support
    exposing RAS error counters via netlink.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 14d3e29c36bea707856f5c03dbf7b0ef73fdeb85 drm-intel
dfb3d50ed50c drm/xe/uapi: Add additional error components to xe drm_ras
c26bc1f79aea drm/xe/xe_ras: Add support to get error counter in CRI
166122923eb1 drm/xe/xe_ras: Add support to clear error counter
c0c1139321a2 drm/xe/xe_drm_ras: Wire get/clear counter callbacks
62448f852564 drm/xe: Move xe drm_ras initialization
593d236c36eb drm/xe/xe_ras: Add drm_ras feature flag
-:32: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#32: FILE: drivers/gpu/drm/xe/xe_device_types.h:159:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 51 lines checked


