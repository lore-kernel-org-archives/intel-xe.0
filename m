Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48246EB64DB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312110E21C;
	Mon, 19 Jun 2023 15:22:43 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88A10E21A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188159; x=1718724159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5W6K5ThwvLyzjh44TahUQ4JWxyiyfjxFw5sGPesKoWQ=;
 b=E80/ihA7c/4QAU7bt/sWewyxCM2t7S70cHAVcAPk6rQa7KevKenDwhs0
 CSYiu4pz8/CqAdt3d+K0HLZJMGklIAIlkN+sN61L7aoxo+UdUVQ/oB7KZ
 GkRwywpmkK7qvTVhRGSkq92lrqS2WEitIFQsbOm7FN5DkgSS81/H1BMG3
 A/JiPZiMEuoZnlqivyA2Y4n2Sx5wauzuqeEnPwt8d4f2S9ii4/I3rIUlk
 q/QGazItjDzmN7/E+EFbJPkn40X9O2vncuvLqm6pUAdN0QlII09Uv1Oi5
 fW2aReWelrsKiWt4v9PvhaOOkmGvU2/FaA9INCc82m6UlnT9uxQ+4nine g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381544"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381544"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250596"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250596"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:22:18 +0200
Message-Id: <20230619152222.11733-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] drm/xe/bo: Fix swapin when moving to VRAM
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

When a source system resource had been swapped out, we incorrectly
assumed that we were lacking source data for a move and therefore
cleared the destination instead of swapping in and copying the
swapped-out data. Fix this.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b9f4b61381ca..fcdeafdba79f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -568,6 +568,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct xe_tile *tile = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
+	bool tt_has_data;
 	bool needs_clear;
 	int ret = 0;
 
@@ -590,8 +591,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
-	move_lacks_source = !resource_is_vram(old_mem) &&
-		(!ttm || !ttm_tt_is_populated(ttm));
+	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
+			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
+
+	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
 
 	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
 		(!ttm && ttm_bo->type == ttm_bo_type_device);
-- 
2.40.1

