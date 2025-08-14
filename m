Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55192CA0ED1
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 10:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7CA10E84B;
	Thu, 14 Aug 2025 10:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlpuM3B4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD22D10E849
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755167592; x=1786703592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ig+V85+Q858DhV8ZDCj4yrKSQ4oD1SdA9e8dhVbIy6w=;
 b=JlpuM3B4KZdq3ipxUnGVBYYpn7KUgU6yYcBhmacpKQHEXv42qYbhQ7uB
 sEmjX2G5uTMribmFinT/YW3MTQGv30pzFYaAyTa0xphJQdb0WWGwhPbBh
 MgkQjMQ04DKpo1nKdfvdaIxChawDb3a6VbW2/aahM7ToIjRf0NFEDNsB5
 p80wuhjUeDL8zVBjvIemq5W1ioxNSmumpnTWfU2EqJXaI8lb1nU2F48o0
 9SPRMtD32+CZ78dmmfObt6ZTcg7PjM6BPJZ2in4xo14FwR2Bk2zsC7zXG
 EUkpEotq1ZN9jDGLeR+am7ZClv0eg160jYrqCQ3cBi8f3K/UUuihym1PK A==;
X-CSE-ConnectionGUID: ng11wx9hTk+KUomg3FNH1Q==
X-CSE-MsgGUID: 9fhGiXKvS4a6txmCD/oKuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68083782"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68083782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:33:11 -0700
X-CSE-ConnectionGUID: 4oOvIPFSQN63db3aCFvWwQ==
X-CSE-MsgGUID: KtRBCImLSxSQmvUMS9cY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197579406"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 03:33:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 16/24] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Date: Thu, 14 Aug 2025 16:29:42 +0530
Message-Id: <20250814105950.2177480-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
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

Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
in madvise-advised memory regions

v2 (Matthew Brost)
- Add kernel-doc

v3 (Matthew Brost)
- Fix kernel-doc

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4e6e9a9164ee..115b9bca2a25 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1010,6 +1010,10 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *
+ * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
+ *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
+ *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1115,6 +1119,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

