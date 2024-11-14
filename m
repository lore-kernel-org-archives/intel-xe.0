Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3328DD68B26
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 14:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DD910E2B2;
	Thu, 14 Nov 2024 14:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW8UT/rn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9B10E2B2
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731593599; x=1763129599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=073qr4pZH7Uu+/vIzBLAJkc8KYxFDYk8nK1jWNQTF+Y=;
 b=BW8UT/rn2L8kSFG7YAOULzNK7G3Q/9aYd6vRtRElP648/3bby6AWkQQ9
 jIlPpgc0NBNusnpezaPc3Xn0m3DPSe2jzxAPQKRiKkMsMzG0Ze02aHFwj
 vibKYqG1ehYTxNSNfG7U7SmTB/ltQVHZY9oClyW7EloS7LYYrQU2zXfK6
 kyP+X9A1wq2YgbyUK9L6Bnfk+toiYEOojSjGLgbIEbKkrf8ahCprCDJFf
 0IDi/yrj2Ye7EHxfMckNnVUHtxJFuL0sv+VTMIRmvhcbIF0ZX23tTld5x
 PGITDfYTMcoSrFWVydf6JSErsA1N07wYEJeFZPAcdXUspZQsf0R15Js5V w==;
X-CSE-ConnectionGUID: GxyM25DxSVSdmS9aDlapRQ==
X-CSE-MsgGUID: uNaMywqcQT+7mixCPDBJwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="19144982"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="19144982"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:13:19 -0800
X-CSE-ConnectionGUID: N455L5+cREO7g5FjP26qYg==
X-CSE-MsgGUID: zOujwtS7QtaHGignXf2m5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88635314"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 06:13:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 1/4] iov_iter: Provide copy_iomem_to|from_iter()
Date: Thu, 14 Nov 2024 15:12:38 +0100
Message-Id: <20241114141238.2255-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241112200454.2211-2-michal.wajdeczko@intel.com>
References: <20241112200454.2211-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Define simple copy helpers that work on I/O memory. This will
allow reuse of existing framework functions in new use cases.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
---
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
---
v2: use iterate_and_advance to treat user_iter separately (Matthew)
v3: add explicit casts to make sparse happy (kernel test robot)
---
 include/linux/uio.h |  3 +++
 lib/iov_iter.c      | 66 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 853f9de5aa05..354a6b2d1e94 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -183,6 +183,9 @@ size_t _copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
 size_t _copy_from_iter(void *addr, size_t bytes, struct iov_iter *i);
 size_t _copy_from_iter_nocache(void *addr, size_t bytes, struct iov_iter *i);
 
+size_t copy_iomem_to_iter(const void __iomem *from, size_t bytes, struct iov_iter *i);
+size_t copy_iomem_from_iter(void __iomem *to, size_t bytes, struct iov_iter *i);
+
 static inline size_t copy_folio_to_iter(struct folio *folio, size_t offset,
 		size_t bytes, struct iov_iter *i)
 {
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 908e75a28d90..a6eae4063366 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -323,6 +323,72 @@ size_t _copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i)
 EXPORT_SYMBOL_GPL(_copy_from_iter_flushcache);
 #endif
 
+static __always_inline
+size_t memcpy_iomem_to_iter(void *iter_to, size_t progress, size_t len,
+			    void *from, void *priv2)
+{
+	memcpy_fromio(iter_to, (const void __iomem *)from + progress, len);
+	return 0;
+}
+
+static __always_inline
+size_t memcpy_iomem_from_iter(void *iter_from, size_t progress, size_t len,
+			      void *to, void *priv2)
+{
+	memcpy_toio((void __iomem *)to + progress, iter_from, len);
+	return 0;
+}
+
+static __always_inline
+size_t copy_iomem_to_user_iter(void __user *iter_to, size_t progress,
+			       size_t len, void *from, void *priv2)
+{
+	unsigned char buf[SMP_CACHE_BYTES];
+	size_t chunk = min(len, sizeof(buf));
+
+	memcpy_fromio(buf, (const void __iomem *)from + progress, chunk);
+	chunk -= copy_to_user_iter(iter_to, progress, chunk, buf, priv2);
+	return len - chunk;
+}
+
+static __always_inline
+size_t copy_iomem_from_user_iter(void __user *iter_from, size_t progress,
+				 size_t len, void *to, void *priv2)
+{
+	unsigned char buf[SMP_CACHE_BYTES];
+	size_t chunk = min(len, sizeof(buf));
+
+	chunk -= copy_from_user_iter(iter_from, progress, chunk, buf, priv2);
+	memcpy_toio((void __iomem *)to, buf, chunk);
+	return len - chunk;
+}
+
+size_t copy_iomem_to_iter(const void __iomem *from, size_t bytes, struct iov_iter *i)
+{
+	if (WARN_ON_ONCE(i->data_source))
+		return 0;
+	if (user_backed_iter(i))
+		might_fault();
+
+	return iterate_and_advance(i, bytes, (void __force *)from,
+				   copy_iomem_to_user_iter,
+				   memcpy_iomem_to_iter);
+}
+EXPORT_SYMBOL(copy_iomem_to_iter);
+
+size_t copy_iomem_from_iter(void __iomem *to, size_t bytes, struct iov_iter *i)
+{
+	if (WARN_ON_ONCE(!i->data_source))
+		return 0;
+	if (user_backed_iter(i))
+		might_fault();
+
+	return iterate_and_advance(i, bytes, (void __force *)to,
+				   copy_iomem_from_user_iter,
+				   memcpy_iomem_from_iter);
+}
+EXPORT_SYMBOL(copy_iomem_from_iter);
+
 static inline bool page_copy_sane(struct page *page, size_t offset, size_t n)
 {
 	struct page *head;
-- 
2.43.0

