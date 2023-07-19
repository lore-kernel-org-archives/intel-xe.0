Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1812BEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0310E434;
	Wed, 19 Jul 2023 08:39:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028B010E434
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755945; x=1721291945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Tsn8oQ7tTSjfxTe/W1AjrZBQiuMsVlMG9lB1VUyMQU=;
 b=PoFAO8PH0d4CjI+DNytGu3FvDvCI64yDopp59Q4izpffrqMqDPQAxEzs
 Gggxvc9FA6TsjLvMgyCIjSywBfWWZxrq4LXoj2U+41VRVHhMSqlO8q8jp
 kj/EnK3sQQp+wHgzY+zPRP6P5NqEb+iWz4+1UAQUkZ69Oud+ME4uwbKF6
 8YnT+onfoIsq7Jq7YS37+z5MCgNA5LGmZm94b5uta2+yDBXDtEsscmh/x
 mcC6ZYjg7CC/1cbc9FIhYtTVW8oRtodGlqamZ8yPtW6t9uJb/BpSepxPy
 ZwAEBHbJB7CMxSNoz4L85VCyomwC9kZYp87Rdw5GbtHuPt7cfVq24eDws Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999059"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999059"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603367"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603367"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:10 +0100
Message-ID: <20230719083801.182123-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 08/10] drm/xe/ggtt: prime ggtt->lock against
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
index 7588fbc2f278..e1b84bc25375 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -93,6 +93,16 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
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
 int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -140,6 +150,7 @@ int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
+	primelockdep(ggtt);
 
 	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
 }
-- 
2.41.0

