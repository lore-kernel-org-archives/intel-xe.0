Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B300EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 18:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBE410E23D;
	Mon, 26 Jun 2023 18:18:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCC410E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687803478; x=1719339478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTbbhroHflttMd/OfWK6v8f0E/bBSDJDx+PMnAlaFjI=;
 b=MElvCavaImd74jAebQ/MUzHTdnlUXD4uo+J2ODdUmME+/jwdpV849zBJ
 evOODgs3ZYfKxzXTKuLFm+N4rlWFsqUsXI1Di4X7Y8ipYlkDcoyWFzZhW
 BM8Fbjp/vDDDsaSFWYRBy+jDGYtQXVIrARb92JXBlGnfqEbAJs/0PI5t6
 mZiJgAFpbrGaCl9xUrTUCqA9KQPl09+OQqyHrIajkj+/1v1bjFhgIxIyw
 Uo4qvtbGOIqJ1Locdyf2L76W8sWgab7GEFvX7Q87dC1xBiVvfpUuWs8TR
 6lNysIpVo7jxv8iBshLbmnrKEatn8vu+O2zMHrVmhORY3quqVZRB0OJ1u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341689114"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="341689114"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890369742"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="890369742"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:52 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 20:17:38 +0200
Message-Id: <20230626181741.32820-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
References: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/4] drm/xe/bo: Fix swapin when moving to VRAM
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
index 71a14e1f25be..d2f4575d8548 100644
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

