Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC9CA0EC7
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 23:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB61110E7A8;
	Thu, 29 Aug 2024 23:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iwoar3eW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59F810E7A8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 23:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724972591; x=1756508591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A5XCHBddOph2X8eUM0yaE/GlW8vZ13gSam0AMsU3GJk=;
 b=Iwoar3eWP+6+VtTY4urTsf48QJgUGt7DQL2G7wJi4BCPUmtBLCeuReFC
 INzcoDy3LAxW482KZbbAT/LsICx9G6mGhHVxmuD9QOr51io1HVJBHX8LJ
 Dv9AyNGWEzB9k75QCayIioWYcmACi0c8rGPJ1b8GTBV6PWXsPD2ZY4kMN
 Gg9p5r9PZFCSHfXjEoGK6Q0b+UEiDRpEVoEWvThGjKrcXhLlILKctMgac
 HBTwxEsDmcdvIOXMYgGxf8bGMg0c47wFUsm7fLRJqLxKxpeUGmU008K+r
 z3bjbodOsPsbvZPm56kOOfQcCIT27+YpzJwdzytAqffwA1dGG7LyaRksE A==;
X-CSE-ConnectionGUID: 0PynHEnZS8C50Aku1gxYgg==
X-CSE-MsgGUID: wsoGSlAwSHKzQbkhjzCLmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26495265"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="26495265"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 16:03:11 -0700
X-CSE-ConnectionGUID: d1mzNofBRUepf0kTTWYEDg==
X-CSE-MsgGUID: ZgScAjG7SKCVnD6a9EkLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="94545736"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 16:03:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/display: Drop unnecessary xe_gt.h includes
Date: Thu, 29 Aug 2024 16:03:08 -0700
Message-ID: <20240829230307.886233-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

None of the Xe display files work directly with the GT or need anything
from xe_gt.h.  Drop the unnecessary include.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 1 -
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c  | 1 -
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 1 -
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index cd8948c08661..99499d6c0256 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -8,7 +8,6 @@
 #include "intel_display_types.h"
 #include "intel_fbdev_fb.h"
 #include "xe_bo.h"
-#include "xe_gt.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_wa.h"
 
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index ccd0d87d438a..f99d901a3214 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -9,7 +9,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
-#include "xe_gt.h"
 
 u32 intel_dsb_buffer_ggtt_offset(struct intel_dsb_buffer *dsb_buf)
 {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d650c5ac41a4..b58fc4ba2aac 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -12,7 +12,6 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
 #include "xe_pm.h"
 
 static void
diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 0af667ebebf9..6619a40aed15 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -16,7 +16,6 @@
 #include "xe_force_wake.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gsc_submit.h"
-#include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_pm.h"
 #include "xe_uc_fw.h"
-- 
2.45.2

