Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB8DC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 14:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90FC10FB0D;
	Mon, 27 May 2024 14:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atfPsnTu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC1710E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716818374; x=1748354374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mhBaQ5HOKyUvKD91qc1s8wCrdM9ra518w43J2NLcYmA=;
 b=atfPsnTuLdDojAOgcoc054KftfShIU4IUfYZyVbWRcRGt5p0gqP00XGK
 ZDU336VRxRMT9kPcs0MW8rITFnlVQR+V6dF/JwEsOc8rW+ZUVccaibWxL
 lCZklPLu9erinT692szV788U3iNytQbIl6EfPyVP3RxfqrEb2xdeTSCL6
 GWHKdCgz32EbaFX/QefYXDjq3PNt2HxK023q+Yc4urL9SIw+o5ouGPE4H
 +VYSSkhkV9ysnO/2LSehpjqeg+8XTWQF6AOQhGUrPwbdo48Krr9F/iegz
 SpeCxVxFt5Kc6uxNOcxu0tXDlhcRpqmx9Ue3BO4Yl538DKAn+9B5u+HFV A==;
X-CSE-ConnectionGUID: v1yPu1eNT66G8+4Uw/FYZg==
X-CSE-MsgGUID: Pcc5VCoDRWunYgt+wQajbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16090293"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16090293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:59:33 -0700
X-CSE-ConnectionGUID: Caj/MgzoTleJXi7f51LcJg==
X-CSE-MsgGUID: JhINheupTP2Yhydy7ZgPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34858904"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.209])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:59:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 4/5] drm/xe: Remove xe_lrc_create_seqno_fence()
Date: Mon, 27 May 2024 15:59:11 +0200
Message-ID: <20240527135912.152156-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
References: <20240527135912.152156-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

It's not used anymore.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 11 -----------
 drivers/gpu/drm/xe/xe_lrc.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c28796cfaa03..e91967070478 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1072,17 +1072,6 @@ void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
 	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
 }
 
-struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc)
-{
-	struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
-
-	if (IS_ERR(fence))
-		return fence;
-
-	xe_lrc_init_seqno_fence(lrc, fence);
-	return fence;
-}
-
 s32 xe_lrc_seqno(struct xe_lrc *lrc)
 {
 	struct iosys_map map = __xe_lrc_seqno_map(lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 7a8752fd8484..c2df6bfd1889 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -47,7 +47,6 @@ u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
 struct dma_fence *xe_lrc_alloc_seqno_fence(void);
 void xe_lrc_free_seqno_fence(struct dma_fence *fence);
 void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
-struct dma_fence *xe_lrc_create_seqno_fence(struct xe_lrc *lrc);
 s32 xe_lrc_seqno(struct xe_lrc *lrc);
 
 u32 xe_lrc_start_seqno_ggtt_addr(struct xe_lrc *lrc);
-- 
2.44.0

