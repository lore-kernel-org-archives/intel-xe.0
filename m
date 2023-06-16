Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A678EEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C6710E592;
	Fri, 16 Jun 2023 09:55:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D353C10E596
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909346; x=1718445346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j09ubqJINk7l1bJXrQEACsfhJeV00pgfUgbONKvdZXk=;
 b=NL+Iin9061FOA72vceOYy/dPwS1kBq1e88bUeMOj5W8PNFL9ZuyHscxg
 wZUitOmf7K06VcVyD2egNad22dgR/eHUrubNQBM+LndsF7g0widOhOa1q
 CmIbF87emE2L9LGCxU14y5kK0UkHiYNGhoZfzdsiqT+CBrsCmjjEU0pew
 yD/AsANijFxo01+cIufVzWEGWCYCplOfIf4WaxqMoZREjyQsg2jLAirrD
 JWJRKovVjxrGjz+MHoIgj86ASKgtDGrQLCX58q05G64DwUiYtMFrt7V48
 ILhqGegO7jF0O7V79CTjTCGHU0KCn/TQcovGnoVX9wig5+zW16c9gOrwG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916576"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916576"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959557830"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959557830"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:55:02 +0200
Message-Id: <20230616095504.17084-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe/bo: Gracefully handle errors from
 ttm_bo_move_accel_cleanup().
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

The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
move, and in doing so, needs memory allocations which may fail.

Rather than failing in a state where the new resource may freed while
accessed by the copy engine, sync uninterruptible and do a failsafe
cleanup.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 94dd11066f51..77d5c5710688 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -689,10 +689,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (!move_lacks_source) {
 			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
 							true, new_mem);
-		} else {
+			if (ret)
+				dma_fence_wait(fence, false);
+		}
+
+		if (move_lacks_source || ret) {
 			dma_resv_add_fence(ttm_bo->base.resv, fence,
 					   DMA_RESV_USAGE_KERNEL);
 			ttm_bo_move_null(ttm_bo, new_mem);
+			ret = 0;
 		}
 
 		dma_fence_put(fence);
-- 
2.40.1

