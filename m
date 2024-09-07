Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A715E6FE4F
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5C910EB50;
	Sat,  7 Sep 2024 00:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L01zHR5h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A31F10EB3C
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667679; x=1757203679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUxw5U7qKooVYR8txCSqxPwklVqbKlV3RNVtBu5f9gA=;
 b=L01zHR5hoNF+2BSsckf2SEf7/ZEL08g9+wrdF8lImWvihB85DVyHDgWB
 WvOd4HUL9oebhcoLbLfZQaj8vWCigYFIWs7sabyeGHd8kgVH37UrVipGv
 D18wqsxSXXDg3aV3tmKIZpYUq1Wrmi05fX/C0YQU9IWpLNrr/xAAJYUmo
 +Er1FcVNY0koxmzReRWrmS3HxU5X4V86by88TOMUXSldu8p14ETprHUbd
 sdu6i93kxmqRF4DfVyTo6iviqwHFBci7pt7DiKEi78jbh+EoSeJISYppx
 PM2V4k1ypEhyIZ6YT7+RmVmB0Jde8rz+QEXsf8RSkPAPngJB3KsDHb/Sh w==;
X-CSE-ConnectionGUID: YdnS3qEHQjK30rjvwWwsjw==
X-CSE-MsgGUID: zN9ZLyntRb27EDX6dp0a/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855331"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855331"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: MVDbBia7SjGCcv4MJbWIpw==
X-CSE-MsgGUID: kOwyCs86SBaif7lMNcmrAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792742"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 41/43] drm/xe/ggtt: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:30 -0700
Message-ID: <20240907000748.2614020-86-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f3fca5565d32..0f4e778a7663 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -107,8 +107,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 {
-	struct xe_gt *gt = XE_WA(ggtt->tile->primary_gt, 22019338487) ? ggtt->tile->primary_gt :
-			   ggtt->tile->media_gt;
+	struct xe_tile *tile = ggtt->tile;
+	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
+		tile->primary_gt : tile->media_gt;
+	struct xe_mmio *mmio = &affected_gt->mmio;
 	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
 	/*
 	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
@@ -118,7 +120,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 	lockdep_assert_held(&ggtt->lock);
 
 	if ((++ggtt->access_count % max_gtt_writes) == 0) {
-		xe_mmio_write32(gt, GMD_ID, 0x0);
+		xe_mmio_write32(mmio, GMD_ID, 0x0);
 		ggtt->access_count = 0;
 	}
 }
-- 
2.45.2

