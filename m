Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CE6C10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DA810E8A7;
	Thu,  7 Dec 2023 13:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8010E8A7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957032; x=1733493032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixO0wfhLmcp/7IswdPp+I8pOyO456HWu+3UHuvqYUQI=;
 b=msRBDv6ZDW59I76itkEa/hMizH3fZHlQwgxGpZlyPgPpPRvY7GMAaRw0
 G+YccwUt0TZCQ/G5uOB0DtEssdd8zR/g9xXPhagGyRnOVdClKCkubc30H
 q00e+Lm5rLJnqwHbb2ismFvnvw3WovkF/NyuK0hXfoX2eVsjwRj1g0ZOK
 SE2ECdhoc6iJKysLkqZSZ7YXGHv+coaMioe5sAx09ulZSWnB93r2a8Pwv
 /Yh3K8zlZYqdedG//ixzNJrxH2uJnkJEtei6AlYSl/Xyv2utJArlIomPG
 dmsa9jN8VdAmPJGbUUDlxbla1iwIPBl1uQ7ej04z1/9BG8I7BRBvCfCQr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722257"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722257"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115513"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115513"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 07/14] drm/xe/uapi: Replace BO with GEM in documentation
Date: Thu,  7 Dec 2023 13:50:02 +0000
Message-Id: <20231207135009.7-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align documentation with names of constants and structs, which
use GEM instead of BO.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e608a8e7dd76..f9178fe024a5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -610,14 +610,14 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-	/** @placement: A mask of memory instances of where BO can be placed. */
+	/** @placement: A mask of memory instances of where GEM can be placed. */
 	__u32 placement;
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 	/**
-	 * @flags: Flags, currently a mask of memory instances of where BO can
+	 * @flags: Flags, currently a mask of memory instances of where GEM can
 	 * be placed
 	 */
 	__u32 flags;
@@ -625,7 +625,7 @@ struct drm_xe_gem_create {
 	/**
 	 * @vm_id: Attached VM, if any
 	 *
-	 * If a VM is specified, this BO must:
+	 * If a VM is specified, this GEM must:
 	 *
 	 *  1. Only ever be bound to that VM.
 	 *  2. Cannot be exported as a PRIME fd.
@@ -768,8 +768,8 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
- *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
- *    handle MBZ, and the BO offset MBZ. This flag is intended to
+ *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the GEM
+ *    handle MBZ, and the GEM offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
  */
 struct drm_xe_vm_bind_op {
-- 
2.34.1

