Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAA6C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C710E4B1;
	Wed, 20 Mar 2024 03:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHQBEVLK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AA110E551
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710904361; x=1742440361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mr8uXFmsqkKVJJSeRhqMlCRLKluwX3drPbxw6raREFQ=;
 b=UHQBEVLKJc3gwFx2a8F5OBvM5hzJRdLwhHD2jAzfkGPTB4YtDkxcbEAo
 MQJhfGn8loxZwWlzTSlA5sw26/MwXhDpTYMCyZwGJ0e87ZuyqS2FkEFwX
 CHjHNnb8Kqh50djwXAcIIQHIuakbYjroM1zBoJIIqFtM6no4vgfey415i
 GBuUkBKUi4cS66iS5zGVue+MCVzMM+ZMHt5maBVYzSelbhAoG1a7S6t0V
 5OggswfZzevEy0Yv9Vbc+/TBGodPFpTR7q+s+8FyCaQz1FryRWZP69spn
 bEtVLjUTGnQRCvY/lqsfFCsoLT+M59KpGMPE6SMcVcYwQmNnlHpcyD6+j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16356326"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="16356326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18666586"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:12:40 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/8] drm/xe: Introduce helper to get tile from memory region
Date: Tue, 19 Mar 2024 23:24:52 -0400
Message-Id: <20240320032457.1778608-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320032457.1778608-1-oak.zeng@intel.com>
References: <20240320032457.1778608-1-oak.zeng@intel.com>
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

Introduce a simple helper to retrieve tile from memory region

v1: move the function to xe_device.h (Matt)
    improve commit message, add kerneldoc (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index d413bc2c6be5..3f74c460bb14 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,13 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+/**
+ * xe_mem_region_to_tile() - retrieve tile from memory region
+ * @mr: the memory region we retrieve tile from
+ */
+static inline struct xe_tile *xe_mem_region_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
+
 #endif
-- 
2.26.3

