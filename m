Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C09C71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D053610E91C;
	Fri, 13 Jun 2025 12:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="In8mDt8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840410E29D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817826; x=1781353826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=15peKwCf3He66JoOUkLaLw+cbHU2GVwmlBrJouMpl8s=;
 b=In8mDt8xglMKv2YMsompln/a0KnJCWBTdskEtn6zPQfqalj9bFqySqDy
 2tuT1Q4d86QFPl3Lf9WI7BsXhQu2EkoLlbZrTPKCdsM9S8xyTaoOKMicf
 n4pIA4W6IAxY0PEryC/hHSIzWRaCIqXY98NgiQ2cA7w6Zp0RRM3SF/teG
 b35/zhF5AarN/K4XUeNomE+R7gxoYVjzD4NmU6DohNw4Zj0CVga4exY3t
 KvLT5zFjli6/DIdKz6hxcmJ/tNr4h/50r8V3+gf1hfAEfSaIFq2h+TInL
 Pz13nbzkcKRdVJqDIHYqzZz0SlE//3NwX0A7zMdlGMTBTu08B3QXyUbnR g==;
X-CSE-ConnectionGUID: XcdF38MESJ6KdN7K5WtraQ==
X-CSE-MsgGUID: /TnuB5gXQIquGg1dmptrKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610182"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:25 -0700
X-CSE-ConnectionGUID: f9J+lm76QNSjP4hU6jSuxw==
X-CSE-MsgGUID: We6PwdmuTSqDzJ1jtC1r+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290357"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 15/20] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Date: Fri, 13 Jun 2025 18:25:53 +0530
Message-Id: <20250613125558.2607665-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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
---
 include/uapi/drm/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b5f8d11faaa8..81e90270313d 100644
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

