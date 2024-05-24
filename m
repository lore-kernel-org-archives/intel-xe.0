Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C715C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 07:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3E710E073;
	Fri, 24 May 2024 07:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fbh41SFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0788F10E3FE
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716535199; x=1748071199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dMsd1uTIE47SHswD6vHdvVxC9p5rycAT6JMwDMg1dEQ=;
 b=Fbh41SFegeDCVl0TSn6Y+OjkNb3X6oQ2FR/dJW3Z3ZdJuos7x+jbH1Ve
 kwR7AihXGnULuqiYjpp7YdRnlBevXUmumBmgDSst68lWmOP3FrpfSR2GD
 FR3qVi45lzySR/E9vu+bP6XxZBA5cxV/cSKXzAVToHwj6nMKc+O81View
 EGMQSjOBO7tqrCPqiw6OYPBYOC2wIYH4cVMH/XjIHFANqA09ELoq0hYYz
 xvgpihBZxJVxxwzo9lTpGRgu2Q/k+DGYt843ufDEtUmj3usLiOiJtRIij
 rjGbzL2aC6x+YqcRhzbQ67Wl6QN70u54GexpsbRg50py6FbdO/rRioVKw w==;
X-CSE-ConnectionGUID: zOOIkM8mTD6WOxfgrWeeog==
X-CSE-MsgGUID: C/SgQWoUSn66SjxonNqweQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13130626"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="13130626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:59 -0700
X-CSE-ConnectionGUID: 6bER1jr4TI+386HkWYR6tw==
X-CSE-MsgGUID: FNGFAN/+Q76MV2p0rcMkDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="64751313"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:19:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 4/5] drm/xe: Remove xe_lrc_create_seqno_fence()
Date: Fri, 24 May 2024 09:19:39 +0200
Message-ID: <20240524071940.83042-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
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

