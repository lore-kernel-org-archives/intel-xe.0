Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E90F4BB71
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 18:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD3310E5F0;
	Tue, 24 Feb 2026 18:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddH8zUlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7E10E5F0;
 Tue, 24 Feb 2026 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771958367; x=1803494367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BuVJDz++ybKsld7OVBTkwoWG7yMLxrT8YHD3qL+eAnU=;
 b=ddH8zUlwJs8l/ffPZnqjNN6l2avURdJeEK+3TnboU750NZ/HBsHsKgNU
 ep7y7Lk7xjf8Kcdrf18V7brAwQDCbeesuha/SXUZ+qE67sR3jW+7x/a5C
 O7MRzKpBUwgXiCqP4rcF8YMGLc9o6wHPnOy4tOrjrFVltplv79SIWbGCC
 CVuKFvDjH2jtptGM5jZglg6jxxm/pIVyKSpgQ1fPUCiruH82vPCnhq32E
 anVbn8MtL0xVzNms4N10F4pN7WduQDsAOrEfJ2pdAXtvseC6mVcvEj785
 KnvWDq/i9B7yxdSvI2fujwXNwBYjNa+6vKG0ia4dER0wGV4n0Mgeb9oyW Q==;
X-CSE-ConnectionGUID: ixoebGXdSrWZhtA4TG858w==
X-CSE-MsgGUID: hu6OxsKqSh6M+SqAc6CbwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72894497"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72894497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:39:26 -0800
X-CSE-ConnectionGUID: /TUT3xWPTUGIWqyQLjmB0A==
X-CSE-MsgGUID: WzYiOcDXRbOYI6W7ccU5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215999660"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:39:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2 1/2] dma-buf: Assign separate lockdep class to chain lock
Date: Tue, 24 Feb 2026 10:39:21 -0800
Message-Id: <20260224183922.2256492-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

dma_fence_chain_enable_signaling() runs while holding the chain
inline_lock and may add callbacks to underlying fences, which takes
their inline_lock.

Since both locks share the same lockdep class, this valid nesting
triggers a recursive locking warning. Assign a distinct lockdep class
to the chain inline_lock so lockdep can correctly model the hierarchy.

Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v2:
 - Drop if IS_ENABLED(CONFIG_LOCKDEP), lockdep does this
---
 drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a707792b6025..a588f55ea4d3 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -242,6 +242,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			  struct dma_fence *fence,
 			  uint64_t seqno)
 {
+	static struct lock_class_key dma_fence_chain_lock_key;
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
@@ -263,6 +264,18 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
+	/*
+	 * dma_fence_chain_enable_signaling() is invoked while holding
+	 * chain->base.inline_lock and may call dma_fence_add_callback()
+	 * on the underlying fences, which takes their inline_lock.
+	 *
+	 * Since both locks share the same lockdep class, this legitimate
+	 * nesting confuses lockdep and triggers a recursive locking
+	 * warning. Assign a separate lockdep class to the chain lock
+	 * to model this hierarchy correctly.
+	 */
+	lockdep_set_class(&chain->base.inline_lock, &dma_fence_chain_lock_key);
+
 	/*
 	 * Chaining dma_fence_chain container together is only allowed through
 	 * the prev fence and not through the contained fence.
-- 
2.34.1

