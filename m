Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1DBD68BD0
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 02:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BBD10E056;
	Sat, 16 Nov 2024 02:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv3B+Ige";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638110E3DE
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Nov 2024 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731723162; x=1763259162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bj9KFDDLJUNavY0tG1yxe+MTjqzX/L89qukWT8nDfu8=;
 b=Vv3B+Igewu/Y8KQ31LC+3UgzNjYos0oy7jfge8I2l97dIfFFJ9V4sYkM
 2ymzTkbZLrU2X80Z1ho2os7lzK0kKwqXq+u1d3KZDOdtN8TJrWzQn6m0V
 1QE5ZBx2eizG7O2SkSuTy0wT8aW2YwTe0Uoq7khdHar1S2BJ8VQQSEMXm
 Px603PE6vbG6RUF6cdliDMM0DmesSgl6cVx8PZJPvuQ89Ffb5D4fV7Stt
 3gK/s6e6WlFdNQyAiLUYgNDpjzjBn4F3nn8KRqXCgN8Ezm+xcKf8zObga
 RB6ZkysJrxPymo962mqYMP04GVOYVwZdlxc27L2U+EW+sdvn7eZoEZW2F Q==;
X-CSE-ConnectionGUID: as1U7GVtR56AEjZjgnNj9A==
X-CSE-MsgGUID: X1i4zp22Rn22AM/C28Ak2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42380711"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="42380711"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 18:12:42 -0800
X-CSE-ConnectionGUID: 6FxwcyAiRCKlfi57IcGowA==
X-CSE-MsgGUID: Cjmtwzn0Somn6fGYAUquxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="88481927"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by fmviesa007.fm.intel.com with ESMTP; 15 Nov 2024 18:12:41 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/3] drm/drm_mm: Safe macro for iterating through nodes in
 range
Date: Sat, 16 Nov 2024 03:12:36 +0100
Message-Id: <20241116021238.2486287-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241116021238.2486287-1-tomasz.lis@intel.com>
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
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

