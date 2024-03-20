Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731CACD11DD
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 03:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0588710E8E7;
	Wed, 20 Mar 2024 03:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFcQTuF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2D710E839
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 03:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710905530; x=1742441530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mr8uXFmsqkKVJJSeRhqMlCRLKluwX3drPbxw6raREFQ=;
 b=HFcQTuF1PWq4bgAwZJNPvAPlzIqVI4kuroKrKBBGpK+34zS3au+rF4Od
 ERotezpHuCHnBPHayJsBjo+3HEx0b+p7M0HZe8KtECbCDPUm2lVhADQI6
 p9NQfGC6zaQ0PY0xxY/sIFMc/cm8MXsI4nkMQfTVE2fspVlfwSC6bQqK1
 bdAGBAJ9LGcuViEdXJAL5BLRZV2H0i6Pl32lBAuJmvr1qx2ieMuUaaWHo
 JP6KJ9yQ9Q3UuD6/BizlCb0hLRBjTh+U+BPwwYY6hAWxGBv4INNFUlo+7
 2NuE2VmJgrZ5+1g7jFUeXNEpf+LGTAhlspyq8hLO13SzWE/H5/8TRXKd+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5688805"
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; 
   d="scan'208";a="5688805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,138,1708416000"; d="scan'208";a="18599092"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 20:32:09 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, brian.welty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/8] drm/xe: Introduce helper to get tile from memory region
Date: Tue, 19 Mar 2024 23:44:20 -0400
Message-Id: <20240320034425.1785007-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240320034425.1785007-1-oak.zeng@intel.com>
References: <20240320034425.1785007-1-oak.zeng@intel.com>
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

