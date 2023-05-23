Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFAEC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 09:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA8710E423;
	Tue, 23 May 2023 09:47:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C029210E421
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684835266; x=1716371266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kxWwlmi/80BIuZup2tZYksMfZa756JTN+2mwjPbMPM=;
 b=Chl2/cJSIWguCrIN/MUhHsUARtXdV2aYj9w4BZFSHgmDm3N2qJVuwICk
 /kfzTXWZcKLfQ+wKm87F8GNNu4o9uLTCQrE0OWYyPHob632ai4XLtu7hZ
 OER/ah2msxEgBLoeD8AvfijhLEkVFc4cmCK09ktvybOXoQ79kXY22Hwy7
 hdg5THf8REp2CfuTxKauVvda5w/80P49EQ1mIe6KrDpXQHwpzYUw55dm3
 u0NmhhCYwpXTgc71H7zIgBMqbwtMSi/aAt0J1Lo02uQRwwa2TXBItj0NJ
 tYRkD/uFWhDttAqTvT6OHBBiNvdlow/lmTDoZUCJUKMsZC7mrGUOpmm7G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="337777460"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="337777460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="736797299"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="736797299"
Received: from eakeogh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.0.142])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 02:47:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 10:47:24 +0100
Message-Id: <20230523094727.162266-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523094727.162266-1-matthew.auld@intel.com>
References: <20230523094727.162266-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 5/8] drm/xe/ggtt: prime ggtt->lock against
 FS_RECLAIM
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Increase the sensitivity of the ggtt->lock by priming it against
FS_RECLAIM, such that allocating memory while holding will result in
lockdep splats.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f986e8218820..e25eb70d44f6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -90,6 +90,16 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(ggtt->scratch);
 }
 
+static void primelockdep(struct xe_ggtt *ggtt)
+{
+	if (!IS_ENABLED(CONFIG_LOCKDEP))
+		return;
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&ggtt->lock);
+	fs_reclaim_release(GFP_KERNEL);
+}
+
 int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -132,6 +142,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
+	primelockdep(ggtt);
 
 	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
 }
-- 
2.40.1

