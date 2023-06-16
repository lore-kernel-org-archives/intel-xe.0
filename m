Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDADDEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8210E58F;
	Fri, 16 Jun 2023 09:55:43 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EAA10E58F
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909342; x=1718445342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDw/ljVvO5piv2jn8nk7xKKySNtOZ1aiOTulHAxgXN0=;
 b=dacHLG8CS3MabM0e2aoUwuN23T2Q74uTRhfbWkujE4xlrsqwEQMM8u7U
 CrbAVvYwEdxQ/KlS7CVwOoE0qCvclF5Iw3B2vEyCBI70V9kbUoFdWzE+k
 SDIAggarWx64koIco4vjzHSA4Ex2NMUXJ/48lVUr/0jC8dWrM8nZWT0uX
 aD3J1F1N/qya1hL5rahHikXiDTLjoxXGhgw/zn50whHjnWT27vEAjlIL6
 qh2/pi+5tf+MB2osU02V/1GklaPO1It+fP62xqgyey03PeC554TPtS3az
 1dkMgHukGCQCaTdrkcvIgmv8+GtjK2xHtgx2j8hLHP97Phre7bpN9ePxK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916563"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916563"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959557819"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959557819"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:55:00 +0200
Message-Id: <20230616095504.17084-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe/bo: Fix swapin when moving to VRAM
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
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b94a80a32d86..43d81f37a855 100644
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

