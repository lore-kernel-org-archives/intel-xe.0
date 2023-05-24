Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C4C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A1110E5A6;
	Wed, 24 May 2023 17:57:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F610E55B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684951055; x=1716487055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kxWwlmi/80BIuZup2tZYksMfZa756JTN+2mwjPbMPM=;
 b=JqjkH7EO8g2Gkap3zf2PxSiY79/KUitZv/7R72aJaso7UlpZiCtO/bGT
 rEjDlGgTlL6T1Wf7tHnXiCuNQTwmUiU7rQN5YiRRFL1olmTlMxo/Prji7
 E+vjk3AH/Z46tP8O180iIkOvDVL/8Bqm9hv7HzDwC4LKYM7Agdhlx7ihH
 MWK27qihSZNI8F6bYsCpFuL/s1q0hFferpXxIx1RlAFuNADrVWdqAMUuy
 VOVlYrfBMwlIVfx1RhKomaUW69s5Sii1tGXyrvbyr9CcdEuVtjadaZxoS
 0BbN5HzEumF3b+D7fR/74D3Wh0NVRcsOOnu0K0CZ5Z4zTmD6J8FTHx1pS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333266929"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="333266929"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698629021"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="698629021"
Received: from cannonro-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:57:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:56 +0100
Message-Id: <20230524175701.320653-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175701.320653-1-matthew.auld@intel.com>
References: <20230524175701.320653-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 4/9] drm/xe/ggtt: prime ggtt->lock against
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

