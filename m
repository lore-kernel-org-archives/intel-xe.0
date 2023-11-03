Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D14C0018C
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC9110E9FF;
	Fri,  3 Nov 2023 14:35:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77F110E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022154; x=1730558154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ChjLFXWVTTrRYtbPdZXCCrQGRe+0tlZI+FzL+vFlNXU=;
 b=BmIs/ntQBjq3HOrB6JzSgQtkHcp78BeuYSAnTKp/0MFNPpWbANvNWED9
 oFclun7UBg4oput2j4p91Tg3uCb+rsU6upfYVV06DFamL/xvcAyz5EgnT
 vwVA5Xe3dcblSCP0+a8s22VFow+P+1/8rpPwfQL7VXFSHPxwsh9X0B2od
 IYPHBO08viZEpQC/Jzr4fbE+O046pbtQxoRuRSh7438ckxyEzo01XK+fo
 N+1H4o8nxJW4UxlVgKKxA698jZ28PnrXDV1vsjc7VfPEsrHzRUFS9wpsO
 GTIAwE5T4mdki/o3Fw1pHWWEGe8djUuBvelmhcrI5gTHgK9SrLtDaGBdb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843400"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843400"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832482"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832482"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:28 +0000
Message-Id: <20231103143456.7-23-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 22/50] drm/xe/uapi: Replace BO with GEM in
 documentation
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
index 8dd3abfdb4ad..b39b1c2646de 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -621,14 +621,14 @@ struct drm_xe_gem_create {
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
@@ -636,7 +636,7 @@ struct drm_xe_gem_create {
 	/**
 	 * @vm_id: Attached VM, if any
 	 *
-	 * If a VM is specified, this BO must:
+	 * If a VM is specified, this GEM must:
 	 *
 	 *  1. Only ever be bound to that VM.
 	 *  2. Cannot be exported as a PRIME fd.
@@ -738,8 +738,8 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
- *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
- *    handle MBZ, and the BO offset MBZ. This flag is intended to
+ *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the GEM
+ *    handle MBZ, and the GEM offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
  *
  */
-- 
2.34.1

