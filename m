Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B16E7719A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 13:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6282B10E702;
	Tue,  7 Jan 2025 13:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAFX052d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86810E701;
 Tue,  7 Jan 2025 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736258126; x=1767794126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDvghJba7JjGPaVQsZq4GaUxd0zGSoYzKYUUvegtXB8=;
 b=PAFX052dGUCgW4mUAVEPjqGhVittyxdokkYjiOaBZ8v7e6Z0SQqey4A1
 UdShyin0naKwOWN11blMJB0PlOpBmAeZG527Sojow9IQHYqYzEsv0wZqP
 29OKeLRD3IW4fwmapsTG8HeQVyZYVLeKrz4HtBdrBxjBguIhYGm5ASKfO
 qedRQzfVXWFTqt0YgmhQkhIBqx4QUpJIj86SbBcuQ9LUA1pjrLvdINzmV
 mZC6aTbXcjOW5YMJf8J0XROvldXFCixo/ph/SNolYC8M3JG8MLhQrchUh
 k8r1Fvfyni4HORjbKlJFLzBO1PXs+pXha3u/t7q0wqj33M1mTF2lieCWD Q==;
X-CSE-ConnectionGUID: 46xKCHL1R1+3Quj61kKXdw==
X-CSE-MsgGUID: CMO9Zw6iSYaiMTCENQoAcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36558827"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36558827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:26 -0800
X-CSE-ConnectionGUID: /9IIVEKtRjC1WcbngpUx5A==
X-CSE-MsgGUID: wyodLmIJS66XvwzJp4l9GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102678810"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:55:23 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Auld@freedesktop.org, Matthew <matthew.auld@intel.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V8 3/4] include/intel_drm_local.h: Add
 DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER
Date: Tue,  7 Jan 2025 19:30:22 +0530
Message-Id: <20250107140023.2940684-4-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140023.2940684-1-tejas.upadhyay@intel.com>
References: <20250107140023.2940684-1-tejas.upadhyay@intel.com>
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

For now dump into intel_drm_local.h. Once the uapi on the kernel side is
merged, and is part of drm-next, we can sync the kernel headers and
remove this.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..40e8dcc43 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,8 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

