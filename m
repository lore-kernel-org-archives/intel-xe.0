Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D9CE7CE7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8610E5FB;
	Tue,  1 Oct 2024 08:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsC5tzMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B910E18E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727772255; x=1759308255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tLs81DM20eCFAJrh47MdALFlOXQ2cSc4tsHP2vPnu0s=;
 b=dsC5tzMbT/ICaNFw7X03gYrQxuNr1kgG1scftx5aX44q1S5cRijKfzaj
 On8bw5hSPa9hp6as+OOxzL2V4cPUm+ZrZDqdvhfyDJgNMEhSZGTD5ji9T
 rZl2d+mw/gnKgGCsuBOwSSBUt8yHXhjO9gg8uycc0O4HywEv6vrbmNdYv
 ZYQNLik4OkS7XjD2CK2TWaO8DxAMQHwgfqcylLeAouZYma3o4KP/EpHoD
 ZiV5aryWAJc4ltlZJiwgcPKYC7WOdtGa2u1UpvNucet0UsIcdnfa6PMZu
 CHEeqIpULtli8bFpQhcM5576S+47ov5YSsMux3/D7tP+2rRRVGfsc2riQ w==;
X-CSE-ConnectionGUID: AVRuH8BKRuyaEv1g9rNKRg==
X-CSE-MsgGUID: OVSYSN5tQkSNf6T+0zpg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27020730"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27020730"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:15 -0700
X-CSE-ConnectionGUID: k3nce6W1Soa6ufTRvjT+DA==
X-CSE-MsgGUID: p97zAiWrQJWvSPpsAXIjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104413742"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO mwauld-desk.intel.com)
 ([10.245.245.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 4/4] drm/xe/ct: drop irq usage of xa_erase()
Date: Tue,  1 Oct 2024 09:43:50 +0100
Message-ID: <20241001084346.98516-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001084346.98516-5-matthew.auld@intel.com>
References: <20241001084346.98516-5-matthew.auld@intel.com>
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

Unclear why disabling interrupts is needed here. Nothing seems to be
touching fence_lookup and its corresponding lock from an irq so there
should be no risk of deadlock.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d3de2e6d690f..3fd1d4e97528 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -890,7 +890,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			goto retry_same_fence;
 
 		if (!g2h_fence_needs_alloc(&g2h_fence))
-			xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+			xa_erase(&ct->fence_lookup, g2h_fence.seqno);
 
 		return ret;
 	}
@@ -907,7 +907,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (!ret) {
 		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x, done %s",
 			  g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
-		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+		xa_erase(&ct->fence_lookup, g2h_fence.seqno);
 		mutex_unlock(&ct->lock);
 		return -ETIME;
 	}
-- 
2.46.2

