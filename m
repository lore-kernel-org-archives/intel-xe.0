Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3271AD2E037
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 09:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29110E7AA;
	Wed, 23 Oct 2024 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIUoUFlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678E810E7A8;
 Wed, 23 Oct 2024 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729676389; x=1761212389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/9QCpGKVoMBrw63pr2oUYuGSPTdQjRz/kb58Nv+5UmM=;
 b=IIUoUFlTWpB3PPW6D5TWam+mabt4EM+21Ku3Kszw/My+7t4bdRZ5qNBH
 3QGV96xchdGDm5Jh+T0dd5CtP6GvD6lZF118+ca1w+a2sgOArVeOzDPq1
 lbCgTEw0NST8Wv+gCaD+mTOZm3VNAV+G2sb0PaHM0bA3pTpNKyIE1/r05
 kDQLanaruijS6+h7Y6zcfITzenH9bdgygk6YN8wWsPEKWKN+FY5PNNVdN
 Q5jAyGJ0GiwmqWR4cLDq9C+/AA+GtXpvg7Uk+E/BzJwBq0BcG4/jfGLOQ
 5hHzmDMBqxSWK/oSdjn5EY+bXdiyW/SIUvYlVas+0IQjgGqWIwqs2my+5 A==;
X-CSE-ConnectionGUID: lTnvVN/IR/6HqBaYoMz94g==
X-CSE-MsgGUID: x0WWIQluQrGgFE5RW/7F1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29414205"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29414205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:49 -0700
X-CSE-ConnectionGUID: WxC5zYCHTgqgFUZ/GBNOxA==
X-CSE-MsgGUID: cPAwxTx4RfiZ9dTcBuU/cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110979543"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:48 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t V2 1/2] drm-uapi/xe: Add new flag in mmap offset ioctl
Date: Wed, 23 Oct 2024 15:13:26 +0530
Message-Id: <20241023094327.965050-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023094327.965050-1-tejas.upadhyay@intel.com>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
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

Add flag in mmap offset for querying special defined
mmap offset for specific purpose like pci membarrier
which requires to write 4K doorbell page mapped at
defined offset.

For user to query special offset, special flag can be
passed in mmap_offset ioctl and used in mmap as follows,
struct drm_xe_gem_mmap_offset mmo = {
	.handle = 0, (this must be set to 0)
	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
};
igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi/xe_drm.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f0a450db9..a04d6f1de 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -817,7 +817,18 @@ struct drm_xe_gem_mmap_offset {
 	/** @handle: Handle for the object being mapped. */
 	__u32 handle;
 
-	/** @flags: Must be zero */
+/**
+ * For user to query special offset we are adding special flag in
+ * mmap_offset ioctl which needs to be passed as follows,
+ * struct drm_xe_gem_mmap_offset mmo = {
+ *      .handle = 0, (this must be set to 0)
+ *      .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+ * };
+ * igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
+ * map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
+*/
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
+	/** @flags: Flag to indicate if any special offset, zero otherwise */
 	__u32 flags;
 
 	/** @offset: The fake offset to use for subsequent mmap call */
-- 
2.34.1

