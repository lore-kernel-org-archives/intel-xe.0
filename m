Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE59C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 08:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E00610E0D9;
	Wed, 15 May 2024 08:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv0HU9YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE2B10E55A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715760911; x=1747296911;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MGqKC47qkZegJ6Hj7/TCMYhqLLkNLS4Nc2TmSqEKC9s=;
 b=Zv0HU9YQhBj2cElLxFxIXkqxNOsvnfIyclNoOhOzH8qPjk8CXclJHZcj
 oNwHP6ERxXBG2d47cZMah09/+NrAKdzbDP4A+CX+cLdlonzNvUnirG/we
 7fLB42UmI+1nyV0SnFDi5Z6jAcWdF/8SF31f2OGNTQWC8yfdIitaFuK9b
 ea9bandurmejkhq5H624hg3BTH7xzbHPzX9Q9ZkIXjpYsHqX4uz6isjbh
 LJV2nwqqWlTolASlOvpSdI7jLk6uNHk96Dc5AmFtQvWJtZ0Zm5JZq8Llu
 axUoqJKI3DKZRcGhbq3c0GkKD0jfCZgT8CzjWwzcgWEJOE/sF/04DZ+dt w==;
X-CSE-ConnectionGUID: W8FOl2ekTzG1dkvAOrvFuA==
X-CSE-MsgGUID: HNpwVUf/TjGLza7ESiBJUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23193316"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23193316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:11 -0700
X-CSE-ConnectionGUID: /S+D+ZvQRGqxeYppc3cSWg==
X-CSE-MsgGUID: 2p1phTo+QZOOMXoSuZ5u2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30977476"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.147])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 01:15:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 13/21] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Wed, 15 May 2024 10:14:41 +0200
Message-ID: <20240515081449.46646-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

For the drm_exec_trylock() functionality, there is a need to be able
to trylock a dma-resv object as part of a drm_exec transaction.
Therefore expose a variant of dma_resv_trylock that also takes
a struct ww_acquire_ctx parameter.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/dma-resv.h | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..fceb31657379 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -405,6 +405,29 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
 	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
 }
 
+
+
+/**
+ * dma_resv_trylock_ctx - trylock the reservation object
+ * @obj: the reservation object
+ * @ctx: The ww acquire context or NULL.
+ *
+ * Tries to lock the reservation object for exclusive access and modification.
+ * Note, that the lock is only against other writers, readers will run
+ * concurrently with a writer under RCU. The seqlock is used to notify readers
+ * if they overlap with a writer. The context parameter ensures that other
+ * ww transactions can perform deadlock backoff if necessary, and that
+ * subsequent attempts to dma_resv_lock() @obj for @ctx will return
+ * -EALREADY.
+ *
+ * Returns true if the lock was acquired, false otherwise.
+ */
+static inline bool __must_check
+dma_resv_trylock_ctx(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return ww_mutex_trylock(&obj->lock, ctx);
+}
+
 /**
  * dma_resv_trylock - trylock the reservation object
  * @obj: the reservation object
@@ -421,7 +444,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
  */
 static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
 {
-	return ww_mutex_trylock(&obj->lock, NULL);
+	return dma_resv_trylock_ctx(obj, NULL);
 }
 
 /**
-- 
2.44.0

