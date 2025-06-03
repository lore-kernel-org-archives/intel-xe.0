Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13608C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D49F10E12A;
	Tue,  3 Jun 2025 20:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IApJy6nv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665DA10E12A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982519; x=1780518519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K5+ltkAJux2E791vEwcvf6NZdiDDO6XU2yOWBjH9yVs=;
 b=IApJy6nvqG28xQ27SNPP4lRcvrI9f5TNUMVT2cLztk/mJ6Kl2aKXnjbZ
 o5Satn4qROXKpODWGuSDsP1taBG4W/KpLY06EoaioO/hXTvQcUrFThMQ7
 ZEtJzYZeG+970rtNHz/O8so8I18P4W4HpfaR6pabyn6H9woE8jh75BNE2
 KAaNfudtGbvtojWLJGQwUZxn4YwGnEWkQHc97mqBgSa29FlpHcIxJ1fBV
 YtVSxY7Gxku7B8Woi85/oBQ4h/uqn9h5d2tTDK1rRQdk91iN6mOcTiaND
 GlW+0fLo2VSwOJNQdhKA1DrCpMtbcW6KM0BHZfNAa/FSadEK1BDcJ4e+D A==;
X-CSE-ConnectionGUID: MFX7I6kqSGmi6DLOzInRHg==
X-CSE-MsgGUID: sOorfpFKREOe6qQaDi/VPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62396646"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62396646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:39 -0700
X-CSE-ConnectionGUID: b++iKScrSTmLimWJKBwSHg==
X-CSE-MsgGUID: IHAckFmsRTGIHKtdERpOrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145583166"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
Date: Tue,  3 Jun 2025 22:28:23 +0200
Message-Id: <20250603202826.681-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250603202826.681-1-michal.wajdeczko@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
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

It seems to be a better place for this helper function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 5 +++++
 drivers/gpu/drm/xe/xe_mmio.h   | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..884e8e4fddbf 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -117,6 +117,11 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
+static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
+{
+	return &xe->tiles[0].mmio;
+}
+
 static inline bool xe_device_uc_enabled(struct xe_device *xe)
 {
 	return !xe->info.force_execlist;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c151ba569003..540bade24790 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -37,9 +37,4 @@ static inline u32 xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
 	return addr;
 }
 
-static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
-{
-	return &xe->tiles[0].mmio;
-}
-
 #endif
-- 
2.47.1

