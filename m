Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18B3C54FB9
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55F710E0A5;
	Wed, 15 Nov 2023 16:05:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED31910E0A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700064338; x=1731600338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ztbp7NBjZ+bGpXOK47ZMqMD8rsRulNgwQPQgjHnlr9Y=;
 b=EjPYBmHVNYzQyMyMvf8zkVTxaLM+5oHLlowMY6yH6+pnOly+7HkeYvQm
 dc7WTEah6RabmYuAIpqej6iB2r2OYutG7aFSuSWpfCfUF12uBWr/jClVV
 X3ZQAE/fZKcCm2NfxH6c+DU0twtJXORGn0E5lsBY+ft3iRYxysH0gYLJ+
 CLUnqnDyEhWVj9uiEktnPQy/WK8kgc1ik2EbFfaSKHYi16uhLW4urGFAn
 eUbxllR7zW7ARh+UVIqSkmMoi0iLEC4Ps3rQRfIifqnKcwiosT2wcFXKH
 Bj6AZMK3hhT2XgBReY/cqYTyNEEqLuZ+hAppoTWgl1YhC8cAtMtlcyt+r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="390697829"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="390697829"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="830984614"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="830984614"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:05:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:06:00 -0800
Message-Id: <20231115160600.123008-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] iosys-map: Rename locals used inside macros
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Michał Winiarski <michal.winiarski@intel.com>

Widely used variable names can be used by macro users, potentially
leading to name collisions.
Suffix locals used inside the macros with an underscore, to reduce the
collision potential.

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231024110710.3039807-1-michal.winiarski@intel.com
(cherry picked from commit 2e122362d25e1b977aa5c5c88c03956be4228e02)
---
 include/linux/iosys-map.h | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index cb71aa616bd3..bb3a8c30fb92 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -168,9 +168,9 @@ struct iosys_map {
  * about the use of uninitialized variable.
  */
 #define IOSYS_MAP_INIT_OFFSET(map_, offset_) ({				\
-	struct iosys_map copy = *map_;					\
-	iosys_map_incr(&copy, offset_);					\
-	copy;								\
+	struct iosys_map copy_ = *map_;					\
+	iosys_map_incr(&copy_, offset_);				\
+	copy_;								\
 })
 
 /**
@@ -391,14 +391,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * Returns:
  * The value read from the mapping.
  */
-#define iosys_map_rd(map__, offset__, type__) ({				\
-	type__ val;								\
-	if ((map__)->is_iomem) {						\
-		__iosys_map_rd_io(val, (map__)->vaddr_iomem + (offset__), type__);\
-	} else {								\
-		__iosys_map_rd_sys(val, (map__)->vaddr + (offset__), type__);	\
-	}									\
-	val;									\
+#define iosys_map_rd(map__, offset__, type__) ({					\
+	type__ val_;									\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_rd_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_rd_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
+	val_;										\
 })
 
 /**
@@ -413,13 +413,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * or if pointer may be unaligned (and problematic for the architecture
  * supported), use iosys_map_memcpy_to()
  */
-#define iosys_map_wr(map__, offset__, type__, val__) ({				\
-	type__ val = (val__);							\
-	if ((map__)->is_iomem) {						\
-		__iosys_map_wr_io(val, (map__)->vaddr_iomem + (offset__), type__);\
-	} else {								\
-		__iosys_map_wr_sys(val, (map__)->vaddr + (offset__), type__);	\
-	}									\
+#define iosys_map_wr(map__, offset__, type__, val__) ({					\
+	type__ val_ = (val__);								\
+	if ((map__)->is_iomem) {							\
+		__iosys_map_wr_io(val_, (map__)->vaddr_iomem + (offset__), type__);	\
+	} else {									\
+		__iosys_map_wr_sys(val_, (map__)->vaddr + (offset__), type__);		\
+	}										\
 })
 
 /**
@@ -485,9 +485,9 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * The value read from the mapping.
  */
 #define iosys_map_rd_field(map__, struct_offset__, struct_type__, field__) ({	\
-	struct_type__ *s;							\
+	struct_type__ *s_;							\
 	iosys_map_rd(map__, struct_offset__ + offsetof(struct_type__, field__),	\
-		     typeof(s->field__));					\
+		     typeof(s_->field__));					\
 })
 
 /**
@@ -508,9 +508,9 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * usage and memory layout.
  */
 #define iosys_map_wr_field(map__, struct_offset__, struct_type__, field__, val__) ({	\
-	struct_type__ *s;								\
+	struct_type__ *s_;								\
 	iosys_map_wr(map__, struct_offset__ + offsetof(struct_type__, field__),		\
-		     typeof(s->field__), val__);					\
+		     typeof(s_->field__), val__);					\
 })
 
 #endif /* __IOSYS_MAP_H__ */
-- 
2.40.1

