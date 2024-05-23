Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB14BC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 15:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0DB10E8EB;
	Thu, 23 May 2024 15:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvh/U6qU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0710E8EB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716478177; x=1748014177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C4irQ52htMp2sdrwmPBY5iMDOSp9/4xAb1l7eEktgnA=;
 b=Bvh/U6qUZWv06915+R/ws94ytL9EPOPeHALCzDi7n70OsJNoptGFKQZn
 0zE+iUg/urTQlpMWWrVI7mZpX8pFks8QiP+BUqio0eSH1wr7+CU8VxIza
 MpsKdJcjDwAcJ4uhNyDiPfOB3XZYivb1WkoneKnEVoNUdiHqGWKZhfPyj
 1EtSoNlp25EYYvFDC3ZMlgVcmJ1nrCSVvkMYg6jeJQ0OB6yt7R+fycTk2
 y4uWKvZqKXgAC5ZMeg3AfO+r3WtQL0zFWwqOXJkgkrqbTsZzNFwFX3hNV
 jNJXHSuYeNCUXjOk5MkM+9XXpXHIBVCL4tLtF828hv5oOCEu6Ew2qdH7d Q==;
X-CSE-ConnectionGUID: 8HokGBcvR/+8OuTktDJxSQ==
X-CSE-MsgGUID: Ng1cjMnyT0iFJ1NxCnxG9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11663781"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="11663781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:29:37 -0700
X-CSE-ConnectionGUID: dhSfgeU8RR+C6SVqufmU+g==
X-CSE-MsgGUID: oRmv+oOlSL2oo45oJQpqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33774233"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:29:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/5] drm/xe: Remove xe_lrc_create_seqno_fence()
Date: Thu, 23 May 2024 17:29:10 +0200
Message-ID: <20240523152911.28387-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
References: <20240523152911.28387-1-thomas.hellstrom@linux.intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c | 11 -----------
 drivers/gpu/drm/xe/xe_lrc.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 7441230ad627..0c7d8dad1cb1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1069,17 +1069,6 @@ void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
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
index 84e4f4ef7f68..2e6d4de16e6c 100644
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

