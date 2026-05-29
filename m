Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC20CD5BD2
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 09:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3AB10FB9B;
	Fri, 29 May 2026 09:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEqsNZRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A183610FB9B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780046248; x=1811582248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NiqXeNVlv2OEgZmLsk0UbnGQsGibKWCkTfqljsH8nv4=;
 b=LEqsNZRWqpg3Gz85tD4facLP3KU8hf499x11aXsmxjm6cpcBFuSNKDm2
 VvnyRMKHsF4lw/BHvtVDBgBp9LyFWf7WDj1EkYF45BlY5iOyU5tmvjbFp
 Yjs6VNXC4OYgY54Q9FS9dzQwgFbhKvom1yAuSZCqJ4+uZUjFC3Vj2f7En
 9wBRcThRvG9RmS946PuBDSd1D3KhPgH71pDwvoAqMFl1HyxfmqhEWqO1d
 v3mcLRMP7h/sB0K0f177r3g0eyaV87mgFzfEwWpda4J2x7Frk4fj+a4bz
 1o/XV/MJLOVj8ATroaaXmACrsp4/boRtHthYecvpZjh/gygyffgDDaa2z g==;
X-CSE-ConnectionGUID: Uzwt0buVQbywNI1WZjw+Sg==
X-CSE-MsgGUID: rlPeFueiRb+i8Bq7WDl0dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="81079923"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="81079923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 02:17:28 -0700
X-CSE-ConnectionGUID: hNEh3vZdT9WKIOxhr4DWZw==
X-CSE-MsgGUID: oasCIp5LQN+gVsVvXnwU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240249720"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 02:17:27 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nitin.r.gote@intel.com,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
Date: Fri, 29 May 2026 15:23:07 +0530
Message-ID: <20260529095306.443350-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Apply Wa_16029380221 to Xe3p_LPM.

The Xe3p_LPM media page walker is hard-wired NonCoherent and cannot
observe CPU:WB cached page table data. Force page tables to CPU:WC
by clearing has_cached_pt when MEDIA_VERSION(3500) is detected.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 9 +++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..8a6f494e11d5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -948,6 +948,15 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	/*
+	 * Wa_16029380221: Xe3p_LPM media page walker is hard-wired
+	 * NonCoherent, so page tables must use CPU:WC (uncached) to
+	 * be visible to the media engine regardless of stepping.
+	 */
+	for_each_gt(gt, xe, id)
+		if (XE_GT_WA(gt, 16029380221))
+			xe->info.has_cached_pt = false;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index f8a185103b80..9027365f0043 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -65,3 +65,4 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+16029380221	MEDIA_VERSION(3500)
-- 
2.50.1

