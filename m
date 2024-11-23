Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF6E6ADDF
	for <intel-xe@archiver.kernel.org>; Sat, 23 Nov 2024 03:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38A10E477;
	Sat, 23 Nov 2024 03:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQu+0DtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25DD10E476
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Nov 2024 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732331618; x=1763867618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bj9KFDDLJUNavY0tG1yxe+MTjqzX/L89qukWT8nDfu8=;
 b=PQu+0DtWwvXufPsWYgH+W3SvrXV1jWWiFr1E4L1NGt9yAacf1XAlcNM9
 tTVgu4gV7cuoB0w3LMLmQ5u1bPms6KPSFpc794rSTHqBWLvPuYmtCkduV
 ceykoyZ4qO6nvPm2WrqSoQRDwnjaWhWGpfpNmOrbkUuSoaNs5z51TG2bE
 qZn2EhizyR8Kz/Cy9WjBRzpJKoMiK/8RP7u/LhxdmsOpT8JwcP7FCDUTt
 GyyAXDbGb6Pf3honhfe/YsKwXpuJdd8jaSiHGmUoBik1sVyvzCWPAKewt
 qvmECEvsmHF1kXBGDqCS4LZUz2NbYGDQp7NL02kaPibKg+QqEyooPQisC w==;
X-CSE-ConnectionGUID: +1aMo07gTYyMr66/gqzYRQ==
X-CSE-MsgGUID: GkNLRxtNQFm6F+e/ti1d9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32363183"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="32363183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 19:13:38 -0800
X-CSE-ConnectionGUID: vxd9MrRWQGuXG7LEIP9BTg==
X-CSE-MsgGUID: ZeJhdvl6SdWQjsfjGCmErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="94830337"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa003.fm.intel.com with ESMTP; 22 Nov 2024 19:13:36 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 1/3] drm/drm_mm: Safe macro for iterating through nodes in
 range
Date: Sat, 23 Nov 2024 04:13:30 +0100
Message-Id: <20241123031333.3435414-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241123031333.3435414-1-tomasz.lis@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
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

Benefits of drm_mm_for_each_node_safe and drm_mm_for_each_node_in_range
squished together into one macro.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 include/drm/drm_mm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..43e99441f6ba 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -504,6 +504,25 @@ __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last);
 	     node__->start < (end__);					\
 	     node__ = list_next_entry(node__, node_list))
 
+/**
+ * drm_mm_for_each_node_in_range_safe - iterator to walk over a range of
+ * allocated nodes
+ * @node__: drm_mm_node structure to assign to in each iteration step
+ * @next__: &struct drm_mm_node to store the next step
+ * @mm__: drm_mm allocator to walk
+ * @start__: starting offset, the first node will overlap this
+ * @end__: ending offset, the last node will start before this (but may overlap)
+ *
+ * This iterator walks over all nodes in the range allocator that lie
+ * between @start and @end. It is implemented similarly to list_for_each_safe(),
+ * so safe against removal of elements.
+ */
+#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
+		next__ = list_next_entry(node__, node_list); \
+	     node__->start < (end__);					\
+	     node__ = next__, next__ = list_next_entry(next__, node_list))
+
 void drm_mm_scan_init_with_range(struct drm_mm_scan *scan,
 				 struct drm_mm *mm,
 				 u64 size, u64 alignment, unsigned long color,
-- 
2.25.1

