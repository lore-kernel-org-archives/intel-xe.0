Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA76C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B53F10E060;
	Tue, 14 Jul 2026 10:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdmMNFpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9475910E20F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026477; x=1815562477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ukScwW7wK5mLj3f/dm6sZF+J4tPFdNMI8q8nhOlIFf0=;
 b=YdmMNFpNPzoZAcr5ImHnbkwHAPOPjEtGmtk8JpFwbQFnYhz4qudO5Rhw
 kF26aWI6cHAyrQrZBjNaIkC/31YaQVVUFAgxekzYjwFql2Fa2v07S+l4z
 aCiF0Uj5E3jaJ0EjZ2u+2k7UQdKRbusZQ7bG/W9j5XhUWt75P6KtxQPfx
 zDKbTrRCB32ZJEAfEu43HrMtLMjHD00uWtxOD1Qkx+jnTqZ36MiGD0edD
 r4Ny6LGyYW9EBVsGWxqtRi8bfW1aY8AHlbsJ6+EQof6okJdJxB5ruVcgO
 KyZsH8wvJnpl3bWb5z7ZoIo9c2WxRoZFSjrnwvDLMq50qz1+7GX5Sb90I A==;
X-CSE-ConnectionGUID: foNEdxzORD6FtpDSaKewUw==
X-CSE-MsgGUID: NB+mDsBYTVSjz/rxpCcFsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84839588"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84839588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:54:37 -0700
X-CSE-ConnectionGUID: RR2ok4SQQMmdI9i9qvEudg==
X-CSE-MsgGUID: yDswtoqYT/aQQHwW83hxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255876717"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 03:54:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v7 3/7] drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size
 sizing
Date: Tue, 14 Jul 2026 16:25:42 +0530
Message-ID: <20260714105538.170849-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
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

From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Add XE_BO_FLAG_NEEDS_1G to mark BOs that require 1G minimum page-size
sizing.

Update xe_bo_init_locked() to honor the new flag in the existing
VRAM/stolen-memory minimum page-size sizing path. When
XE_BO_FLAG_NEEDS_1G is set, the BO size is rounded up to 1G. Otherwise,
the existing 2M and 64K sizing behavior is preserved.

If multiple minimum page-size flags are set, the largest requirement
takes precedence: 1G over 2M over 64K.

v3
- commit message reworded

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c80bac67622..9dbf59fad421 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2323,8 +2323,16 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
-	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M)))) {
-		size_t align = flags & XE_BO_FLAG_NEEDS_2M ? SZ_2M : SZ_64K;
+	     (flags & (XE_BO_FLAG_NEEDS_64K | XE_BO_FLAG_NEEDS_2M |
+		       XE_BO_FLAG_NEEDS_1G)))) {
+		size_t align;
+
+		if (flags & XE_BO_FLAG_NEEDS_1G)
+			align = SZ_1G;
+		else if (flags & XE_BO_FLAG_NEEDS_2M)
+			align = SZ_2M;
+		else
+			align = SZ_64K;
 
 		aligned_size = ALIGN(size, align);
 		if (type != ttm_bo_type_device)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6340317f7d2e..d5d023cac367 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -52,6 +52,7 @@
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
 #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
+#define XE_BO_FLAG_NEEDS_1G		BIT(27)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.43.0

