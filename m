Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9FDCDD1D2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 19:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0415010ECF7;
	Fri, 27 Sep 2024 19:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IwbnArzg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DEF10ECF7
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727463870; x=1758999870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fB3kW8r3a+MkSqSCAj6L8Kdg67H6rfp18ePE9JUN9j8=;
 b=IwbnArzg1ohyje3rwNua+20BTVDv88Qaty4Rwo7aNc+u5BXwNPSoW4aF
 oA/P5LXx9goSR2J0MEub2pnpHPH4RPA7sEw+YJdUdPw/jtw/jC3wPPx4a
 f6QNPV3Y7Bi4mZdfVprbEz4Jk5yn1roJrYiHFwISR7sg6oCH91/yWS2VQ
 ATdQfM7OfdRvWwrtPuwCj1QayG2KPhv7FroNKpe26hxGYO+eUJJ6T2KNH
 Y7O2KiseCeVO5qlJTIrg/Qeryq4GQqFQZ4RaqDjZXQiI0ZMv4TGMnhm5v
 9bJ0ysq0ChMY+gtwQRKN8L+IOVg/9eiWa3s4CLgyH7P3KB41eOBeHivXv A==;
X-CSE-ConnectionGUID: p4ZQI+IaSKiLHxjvJLOhYg==
X-CSE-MsgGUID: kCIgr+JSQ7G2xqmxCjfBqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44141848"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="44141848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 12:04:29 -0700
X-CSE-ConnectionGUID: 8h3ODO1xRVa0P8WE+N814A==
X-CSE-MsgGUID: YbHK6iNGTeizYS4mwnI9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77450672"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 12:04:26 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 vinay.belgaumkar@intel.com, vivi.rodrigo@intel.com, matthew.brost@intel.com
Subject: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h resp
 times out
Date: Sat, 28 Sep 2024 00:54:28 +0530
Message-Id: <20240927192428.1160211-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
queued, but it didn't get opportunity to execute and timeout occurred.
To address this the g2h_worker is being flushed.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4b95f75b1546..4a5d7f85d1a0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	}
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+
+	/*
+	 * It is observed that for above GuC CT request G2H IRQ triggered
+	 * and g2h_worker queued, but it didn't get opportunity to execute
+	 * and timeout occurred. To address the g2h_worker is being flushed.
+	 */
+	if (!ret) {
+		flush_work(&ct->g2h_worker);
+		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+	}
+
 	if (!ret) {
 		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
 			  g2h_fence.seqno, action[0]);
-- 
2.34.1

