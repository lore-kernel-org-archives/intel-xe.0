Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE874C77B76
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 14:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2E10E0F9;
	Fri, 21 Apr 2023 14:50:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A650810E0F9
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682088626; x=1713624626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+3qxkXnNHo6iaGMKMDVrPGUngD3R/M7cOCXK6i5so78=;
 b=kpAkSURYHTUJBC6KmImx6V/1vhVP2fhzPxIviR54MuwZ/H7P5oCJsGIb
 mLdkJfhZakFAwm2pijZTW4NaxLf8goALyPK9dFAqMluMM+Y5D0BaO5Ehi
 uz1+ols+9wwFY7C0Yrc09pUvvhPXCHT+VbMOwnxrhwKpBQGD8pzRGgx4r
 IrQZHN4W8u5AzBav3mfx8WDj6oVzF6p+pUsIwkfqxh+vsRQBSkiXEWl7G
 BxQYhzKY1GFcwGBYMgi4pXox6u9zonapAs0nUbAHDR2uvWZ0Y4PubBt+4
 bOn4vJjVwj5xCvYnVx6p+2ctQwWws2gI8zjIbPSaOBRyFwttYAU60BW2D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330204773"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="330204773"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="724847457"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="724847457"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:50:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 07:50:05 -0700
Message-Id: <20230421145006.10940-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/2] drm/xe: Fix xe_mmio_rmw32 operation
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
register update that wasn't the expected RMW operation.  Fortunately the
impact of this mistake was limited, since this function isn't heavily
used in Xe right now; this will mostly fix some GuC PM interrupt
unmasking.

v2:
 - Rename parameters as 'clr' and 'set' to clarify semantics.  (Lucas)
 - Undo xe_de.h's workaround for this misimplementation.  (Maarten)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://lore.kernel.org/r/20230412225248.3229571-5-matthew.d.roper@intel.com
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 388a633b438b..a36c52bc098b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -34,13 +34,13 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, u32 reg)
 	return readl(gt->mmio.regs + reg);
 }
 
-static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
-				 u32 val)
+static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 clr,
+				 u32 set)
 {
 	u32 old, reg_val;
 
 	old = xe_mmio_read32(gt, reg);
-	reg_val = (old & mask) | val;
+	reg_val = (old & ~clr) | set;
 	xe_mmio_write32(gt, reg, reg_val);
 
 	return old;
-- 
2.40.0

