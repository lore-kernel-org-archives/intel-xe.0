Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851DBCF6499
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 12:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7F310E412;
	Mon, 30 Sep 2024 12:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY+npbxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8F10E412
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727699435; x=1759235435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vuq8HXqfU2ro4b13tOzQNE0ivPNzTAE0DTnAaPKddoM=;
 b=YY+npbxJnDvq1z+ng3EwJTgpesWnmAbtACBb6f92iVRDICKBE2WoLKRd
 awS5+6Q20rZSfa0shtvNNELiNb8esMuZhxTB3gNuLR43ksCUaRwXuG2+H
 yb7f6U3n8nUeaRPICInfGsiUY3CPspT7zzllCYIdc6sqcdsWzAVJhpj7j
 YcT4rOVJOjPfZ9ky7Jq8/lI7djqBrVRBnBjaxnJHzu8yzNOvxVH4Q29B7
 0Sp7bsZuI0bKJWrdEzHF16AjiymMwW96EQ1/GolAc+fVIRKdq/o/i44Ou
 Ik381fRjgiFQkYiJPYMZOL/59MpLiDNrlxyfiI++wYoOXRhTq+vrk9df0 Q==;
X-CSE-ConnectionGUID: UqAATeYWThGSExBNPOzVfg==
X-CSE-MsgGUID: Z4k/dX19QzKS0x1cOrcSAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="49305183"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="49305183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:30:34 -0700
X-CSE-ConnectionGUID: 7nbltE07RyWvp0FJeorREw==
X-CSE-MsgGUID: 6GxuqpgPS7+Y3D4uQREy6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78247137"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO mwauld-desk.intel.com)
 ([10.245.244.244])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:30:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/ct: drop irq usage of xa_erase()
Date: Mon, 30 Sep 2024 13:29:42 +0100
Message-ID: <20240930122940.65850-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930122940.65850-3-matthew.auld@intel.com>
References: <20240930122940.65850-3-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 232eb69bd8e4..a65bf542cadf 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -897,7 +897,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			goto retry_same_fence;
 
 		if (!g2h_fence_needs_alloc(&g2h_fence))
-			xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+			xa_erase(&ct->fence_lookup, g2h_fence.seqno);
 
 		return ret;
 	}
@@ -914,7 +914,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (!ret) {
 		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
 			  g2h_fence.seqno, action[0]);
-		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+		xa_erase(&ct->fence_lookup, g2h_fence.seqno);
 		mutex_unlock(&ct->lock);
 		return -ETIME;
 	}
-- 
2.46.2

