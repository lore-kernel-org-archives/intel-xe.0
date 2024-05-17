Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1C1C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 07:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D63E10EE19;
	Fri, 17 May 2024 07:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrgJAX5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7FA10EE1F
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715931711; x=1747467711;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kIbCgfsnJqyWE46yS4a6QVTc2cK35spNOUGCUPBYEAM=;
 b=SrgJAX5w247OwEYo74A2SB7PxjCm1nJ+VXjBezjjBrL6qEJ4TPEXqDNE
 CsKi8pLyCs9ByInglpidZMntMuBQLjdxlAyLnpUY0amPIGgLqheG9Cwg5
 /AESa83Bo8GwJ0W81rQA5l/P7DeB5f9tzxoXdg/DT4h8KdQrWhXp4CyC6
 UrLoRM7uDHbPxnRB8J5lqqjQuYnLPpqihW3/+BXxFyaNmYVftExfaI2Y0
 dRHSCP0e2P2SZAC4GZPu8sUx2kY3HWhMZvFYm4bZpbyxSE9/acyfXbJXD
 KYWGNAbOMt289iCmA2VaH8GKvniMW6v3PYK0+mlf/vrQa4XwkTgrESiSB w==;
X-CSE-ConnectionGUID: 2IcbFFbRQoC43fViH9/c8w==
X-CSE-MsgGUID: WQaovfRRRBuW1XmtKcU19w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11897594"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="11897594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:51 -0700
X-CSE-ConnectionGUID: zWR13dtAS/2kPySVmx0EFw==
X-CSE-MsgGUID: GtF4ks8ORsCsTYgNBDUnpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36213118"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 00:41:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v4 12/21] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Fri, 17 May 2024 09:41:21 +0200
Message-ID: <20240517074130.2908-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
References: <20240517074130.2908-1-thomas.hellstrom@linux.intel.com>
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
 include/linux/dma-resv.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 8d0e34dad446..68dae8f2a22c 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -405,6 +405,27 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
 	return ww_mutex_lock_slow_interruptible(&obj->lock, ctx);
 }
 
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
+ * Return: true if the lock was acquired, false otherwise.
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
@@ -421,7 +442,7 @@ static inline int dma_resv_lock_slow_interruptible(struct dma_resv *obj,
  */
 static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
 {
-	return ww_mutex_trylock(&obj->lock, NULL);
+	return dma_resv_trylock_ctx(obj, NULL);
 }
 
 /**
-- 
2.44.0

