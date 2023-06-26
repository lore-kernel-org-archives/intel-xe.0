Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94324EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 13:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E99B10E20D;
	Mon, 26 Jun 2023 13:58:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F66410E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687787922; x=1719323922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szZMNu+gQzAH7QFPyjTA7mGRfoNnYkNu/KISfIWwmS0=;
 b=AO3Qq2pw85yQLzGbYokqqTofF0ZnvZE0RtBj4ys6dKOugALPOPwQ6lCt
 TEjIpFGAg4bXcKNJ5E2R8bb1FUErjnl7KnLs5h78izbEvAuZDl+QTnf1q
 +mscpjM96T1NFyTJesXgUPYjbtuFkmptqlkur7ow8nVyubMU2riP+QwFW
 srnZOt/JAA19jC9EdiRUgQcH0eDuIZTWWrT41+fMrLZRdPCFqw3OBfJPt
 1+hyAqE65LFZauMt41rkKPoP8Dyn6H668e382a1C9INLmMQv4/IXwFIGg
 yCaRVe5deS2PGCnSsdTmUeOIr7UsjJw/nC6zcYh79fdHHXANnFBtjnc/0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364723166"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="364723166"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="716149397"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="716149397"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 06:58:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 15:58:23 +0200
Message-Id: <20230626135824.21984-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
References: <20230626135824.21984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 3/4] drm/xe/bo: Gracefully handle errors from
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

v2:
- Don't try to attach the signaled fence on ttm_bo_move_accel_cleanup()
  error.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230619152222.11733-5-thomas.hellstrom@linux.intel.com
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2c19c051562d..9444130c11e3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -700,6 +700,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (!move_lacks_source) {
 			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
 							true, new_mem);
+			if (ret) {
+				dma_fence_wait(fence, false);
+				ttm_bo_move_null(ttm_bo, new_mem);
+				ret = 0;
+			}
 		} else {
 			/*
 			 * ttm_bo_move_accel_cleanup() may blow up if
-- 
2.40.1

