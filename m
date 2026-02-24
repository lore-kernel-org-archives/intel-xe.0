Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32909F4BB6A
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 17:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E921B10E600;
	Tue, 24 Feb 2026 17:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Arj3cI4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3CA10E5F7;
 Tue, 24 Feb 2026 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771955750; x=1803491750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOarn3UFzrnH2/WI5PAHfdR9EZaDfOMSqmXAf+44E7I=;
 b=Arj3cI4wlddHRQt/DIObh485NEmqiF1BiIgPb2P1Zt6vbbJ99Fom4+CF
 +ZToZYqyeSIbP8M57Gk+0lrhqs+vNbmWb6d3g3RloND4iftmqlN52l6bV
 cpzpk+DXDGB/m9KKdtig27vRHHWWJMQVvzXOT8GNtgZqcscRuWe8mh6Xc
 Y7Hb9+QxojrmtQP99eEdbtzeke3ImdUoJAOOgl8J2Jtni5Rap5SooUnzJ
 42WX8J/RQYnRRceZckbxh85nPrSXF7bpyvYVDVxIJMY3NZvSpRKEblvCk
 03wngwPDXt/wUopXfZwzKgi8yeti6Mos/hGDurD/CCL/HAgn1DdpGD5Ho Q==;
X-CSE-ConnectionGUID: sMd/fLkBTrS9dHxJ0A624A==
X-CSE-MsgGUID: cGH8e1gnShm8PhpcxFZvcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72683131"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72683131"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:55:49 -0800
X-CSE-ConnectionGUID: fFjvRo+4SY2x/zI+iqfZgw==
X-CSE-MsgGUID: ulbmjDkoRr+KzW53ZxOS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220479708"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:55:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 2/2] dma-buf: Assign separate lockdep class to array lock
Date: Tue, 24 Feb 2026 09:55:44 -0800
Message-Id: <20260224175544.2167712-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224175544.2167712-1-matthew.brost@intel.com>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
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

dma_fence_array_enable_signaling() runs while holding the array
inline_lock and may add callbacks to underlying fences, which takes
their inline_lock.

Since both locks share the same lockdep class, this valid nesting
triggers a recursive locking warning. Assign a distinct lockdep class
to the array inline_lock so lockdep can correctly model the hierarchy.

Fixes: 5943243914b9 ("dma-buf: use inline lock for the dma-fence-array")
Cc: Christian König <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/dma-buf/dma-fence-array.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index cd970eceaefb..9cfac1ca68b5 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -200,6 +200,10 @@ void dma_fence_array_init(struct dma_fence_array *array,
 			  u64 context, unsigned seqno,
 			  bool signal_on_any)
 {
+#if IS_ENABLED(CONFIG_LOCKDEP)
+	static struct lock_class_key dma_fence_array_lock_key;
+#endif
+
 	WARN_ON(!num_fences || !fences);
 
 	array->num_fences = num_fences;
@@ -208,6 +212,20 @@ void dma_fence_array_init(struct dma_fence_array *array,
 		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
+#if IS_ENABLED(CONFIG_LOCKDEP)
+	/*
+	 * dma_fence_array_enable_signaling() is invoked while holding
+	 * array->base.inline_lock and may call dma_fence_add_callback()
+	 * on the underlying fences, which takes their inline_lock.
+	 *
+	 * Since both locks share the same lockdep class, this legitimate
+	 * nesting confuses lockdep and triggers a recursive locking
+	 * warning. Assign a separate lockdep class to the array lock
+	 * to model this hierarchy correctly.
+	 */
+	lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
+#endif
+
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
 	array->fences = fences;
 
-- 
2.34.1

