Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA9C83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C779510E696;
	Tue, 22 Jul 2025 13:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DtqwbJdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C98C10E67B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189747; x=1784725747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FY9rNhdEDe7XNE+Mp33jG/YpzUoqj2ftYeQTdn5Vjdk=;
 b=DtqwbJdWTwMtXmTq0m5gSGuwr9VwnEPavOFHXwqTF4GJbml82wYErcY3
 dLAPaT/vDB6U4QySkZ4OxzU/OwjSHWR0u8jaF6qI6GdxAeOaqqAJOobVE
 ioEbvHcLAe0bgzlrgYHknGKDTLAZr0QDv57GqJg4ui887ccrkzUNXQwv3
 zPriucZPT/h0Rh/s0GRVyIkHWA7tKXF4BuL4kQ/fUuMkj7KBzB6B6Jgqw
 LmmxQg3ETnDZNt7vd5U+UQLDlStqCHqNSDsHpHHqaKWzAplN1I5+6rtav
 n69BQTGsHKd1FGIff1ikMcTxL1/o9aZohZsG06xhAt9cWccklsy+NUPk5 A==;
X-CSE-ConnectionGUID: URY1rqmESMaFHeeRoqgioQ==
X-CSE-MsgGUID: lggnf4OaRC+4JNydk+Dbeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530387"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:07 -0700
X-CSE-ConnectionGUID: hjUyinvvQNS36GtmPXtzJQ==
X-CSE-MsgGUID: oI/XawuzQM6yGp+OCEqX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420646"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 14/23] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Date: Tue, 22 Jul 2025 19:05:17 +0530
Message-Id: <20250722133526.3550547-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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
index 51dcf63684b0..8f1d48664424 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1006,6 +1006,10 @@ struct drm_xe_vm_destroy {
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
@@ -1111,6 +1115,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

