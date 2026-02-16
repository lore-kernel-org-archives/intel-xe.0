Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A658E81A24
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 13:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815410E055;
	Mon, 16 Feb 2026 13:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWr8YFrU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467110E055
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250248; x=1802786248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xlf3cc7QRpRqEgvVbkbEnN5vm2Us2LIpbloW2wpxzhs=;
 b=iWr8YFrUdbXbdEX+WwrZ79oz7wN6leGnilyJgyqJE308gGfSvXpwM2cJ
 WfDAvH8/wwsAdqb+12i0UGhzWC27bp18ptvldsSb0OiMMuTaIue4wwjam
 SgI0LAneCIbBQXRMlGw1uRLAjOTFjMXBgCzGmo47RjRrmjZ/beDJqmTFw
 TsRfKI9HB/ayTWQVn0HbRvvm2PwSAR9ls+IXVwWFwaOOC0+2ysXnwjrKB
 QbEfENEErzGRnGhFDWrQDA7WIY7jIdxJpXPdjjk5UtILBAAxIhVCqCtiW
 iAMO32ueq95VHq+ie4Q2Dx8oxssI/GU2C0xZGmM08kEe1D4697ZlLRvTl g==;
X-CSE-ConnectionGUID: KGNF77UkQX6YkItuaC3ZRA==
X-CSE-MsgGUID: +ssCE+IpTGa/iKqhMRtQNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72238321"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72238321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 05:57:28 -0800
X-CSE-ConnectionGUID: oOIFIlGzTK+RuZu2p0dHFQ==
X-CSE-MsgGUID: 9U+duQzTTbqQP8snmO5wFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212593037"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by fmviesa010.fm.intel.com with ESMTP; 16 Feb 2026 05:57:26 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, tejas.upadhyay@intel.com,
 himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Mon, 16 Feb 2026 19:21:09 +0530
Message-ID: <20260216135107.3148167-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
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

 While previously applied only to the BMG G21(Battle image) platform
 via workaround Wa_14022085890,this 1.2 GHz minimum is now the default
 for BMG and CRI platforms.

 Setting this frequency floor(1.2GHz) default is critical in multi GPU
 environment for supporting effective Peer-to-Peer(P2P) transactions.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5e5495a39a3c..881054c9cf92 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -860,6 +860,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 {
 	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	int ret;
+	struct xe_device *xe = pc_to_xe(pc);
 
 	lockdep_assert_held(&pc->freq_lock);
 
@@ -885,7 +886,13 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
+	/*
+	 * Setting GT RP min frequency to 1.2GHz by default for
+	 * all BMG and CRI(For BMG G21 WA do the same).
+	 */
+	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
+	    (xe->info.platform == XE_BATTLEMAGE ||
+			 xe->info.platform == XE_CRESCENTISLAND))
 		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
 
 out:
-- 
2.43.0

