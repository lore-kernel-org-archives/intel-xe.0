Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AABC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 10:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771310E33B;
	Tue, 16 May 2023 10:54:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521A310E33B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 10:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684234474; x=1715770474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AshnQ7rClLuO1/+2nS7Klp7BiHKPvx28kqZHwZ2ForE=;
 b=J8qtjrhkm6sUYLMdHi1WVx8Pd/10U+nMT+BNqgMFojX1n+73TVaKB/1C
 38Ds4uFtliNp0+rV7OQ364zZf6SKAOAazgGrxArpWEG74CHJ07XxaU+rL
 QEhiD/1XAVbKsThtreqmnsCxEgcc5MHM8lkrfNFWyNU0ENc4mtebD8Y0P
 JwhUKZclsb5Q2RETOeKE2CGQmeIjSZtTvyVilGWEFtHJbZNhENm9o5UPG
 oVMak7BFG7zYjIxKbsX04Tx8FRP87vD+d8LTxeaM1ox/kHTIfPUJB4zFU
 FJwiDGSpxO9q4DR7vcP9Htm5CyIMMPesh4cSmK+etWpdU7ZyZ8eahUrL9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331064956"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331064956"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="704354472"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="704354472"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.120])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:54:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 11:53:55 +0100
Message-Id: <20230516105357.148846-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516105357.148846-1-matthew.auld@intel.com>
References: <20230516105357.148846-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/6] drm/xe/ggtt: prime ggtt->lock against
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

