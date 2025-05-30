Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599ADC5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696410E7D8;
	Fri, 30 May 2025 08:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1bJKlBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF3110E14C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748593381; x=1780129381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BhIyJfNxqyroMSJQKpdBifsBeZaGC+y9ABoQeSoN7hA=;
 b=I1bJKlBfonxzdigXzYNYhJx+w8QuKORtcoSp/T4lpqypc3xRLdZYbj/F
 eOMKi45GL8DmPQFOnL//iGj5CyDKoJ3mZkd+Y5mm7kZVpkm0xzBxswgCi
 daDBOKtLF+fTdcMn5QXYay/IloOrJ8H8o+I3HJADycRfBqW99Ep5Lncl2
 +0Y9YWTlwoCoicxMM9sL9jZZTaqs/lz6XaPEUOWD48/RKxaIL94ESkZdA
 rwCEgw3+W62qK/rAE3qPvN05AAqdsqe2L9vgeQvHtLBWwl2PzIYQpkUCf
 cCUeaFLCn5/vpUGElmHenYkUWfHNIj6lxiwJUc8cICKmbs7UfO2xrWuHw g==;
X-CSE-ConnectionGUID: LYuuh7HESzGDz/DHRRZIMA==
X-CSE-MsgGUID: 759BfOlGS3y/y3aMtQibXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50825030"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50825030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:23:01 -0700
X-CSE-ConnectionGUID: 8NToqtsURmeE9z44QnK+8w==
X-CSE-MsgGUID: gixrotG7TOi2QHxYn6KeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143772843"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2025 01:23:01 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/3] drm/xe/bmg: Update Wa_14022085890
Date: Fri, 30 May 2025 01:20:45 -0700
Message-Id: <20250530082047.742183-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
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

Set GT min frequency to 1200Mhz once driver load is
complete.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c     | 9 +++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c623992035..513657154dbe 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -51,6 +51,7 @@
 
 #define LNL_MERT_FREQ_CAP	800
 #define BMG_MERT_FREQ_CAP	2133
+#define MIN_FREQ_WA_14022085890	1200
 
 #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
 #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
@@ -911,8 +912,12 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 
 	mutex_lock(&pc->freq_lock);
 	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
-	if (!ret)
-		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
+	if (!ret) {
+		if (XE_WA(pc_to_gt(pc), 14022085890))
+			ret = pc_set_min_freq(pc, MIN_FREQ_WA_14022085890);
+		else
+			ret = pc_set_min_freq(pc, pc->stashed_min_freq);
+	}
 	mutex_unlock(&pc->freq_lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..75fbdab68d44 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,3 +59,4 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION_RANGE(1301, 3000)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+14022085890	GRAPHICS_VERSION(2001)
-- 
2.38.1

