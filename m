Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F886C27C4E
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6C10EDA9;
	Thu, 16 May 2024 18:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Htcn8Voo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6EE10ED99
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883842; x=1747419842;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kIbCgfsnJqyWE46yS4a6QVTc2cK35spNOUGCUPBYEAM=;
 b=Htcn8Voo+ahpesDCPDnavC156JYVPLj5thi/mC2FC7F7p0kG+9CGois1
 5JvjvyRzyBMH5lRnIyMBzNiGwi8UFv18FE0VvVI1H4a1fgMtm4uk37gMr
 F21Yln4c1Sb/ziZ/RHxVQSdZW1HXQIwoiYkF1s0CV6YKSgeOs3Q1MmnAV
 b4PkQcBf8QTlacKYqRuMpnuPx6ziHUaZH0bqtV6XnxrT4JGU5KYkHBg3S
 iywhMvN+ruaGxgubUGREVhgu7gd6996dGUTQekfkC4HuXTVs/EU+xd5bU
 uiGRCJwEuZ4BH9ZXC51DWBSSFhJJNxrkqTKoTsF7g/QIJPlEMAmHBQhfY Q==;
X-CSE-ConnectionGUID: AdrE0DMZTCiRXPsL7EQ8OQ==
X-CSE-MsgGUID: vlYya6ocQamOoichoZVe8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23159932"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23159932"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:02 -0700
X-CSE-ConnectionGUID: vhCwd29vSv2/9vukgyJoig==
X-CSE-MsgGUID: 8vUGiZZgS+6QAvtrSs9+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32065405"
Received: from unknown (HELO fedora..) ([10.245.246.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 12/21] dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Date: Thu, 16 May 2024 20:23:30 +0200
Message-ID: <20240516182339.3482-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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

