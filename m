Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C7EB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6725110E1E6;
	Mon, 26 Jun 2023 10:51:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FFF10E1E7
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776678; x=1719312678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Tsn8oQ7tTSjfxTe/W1AjrZBQiuMsVlMG9lB1VUyMQU=;
 b=ThmC1Ij1BdpSnsUO7Pb1dEbdIbzEprlwDpa31XMQWoOUNLABzwYqV383
 ff/LIZAYndkk9iNyryjHa1kUJP88qHUAI10sIX/Se5f+MzKIcXC2u2V4Q
 FNptliW0hhcdjlFQxVnUp36ZP069gM5knTad6ggFDfBELjFHz6O0pSeZp
 tBOn/Blc45mpXhFQBirdgp4W4F1+WK3JtZnqXgBh4d2dQaW8cXFhOhI4c
 LEJMKGS62JI/lqZPC2YUee+wgZWTjb55+Ypi+GieISl8+baL+lT+kRDEN
 JlR2a3ksGbcUA8Mt3KZpFBCUxvbVf3PMnDJNyRTC2sO/WXo0dKCooaYcs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361280001"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361280001"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182876"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182876"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:49 +0100
Message-ID: <20230626105037.43780-26-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 11/13] drm/xe/ggtt: prime ggtt->lock against
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

