Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C056C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C7C10E8FD;
	Thu,  9 Nov 2023 15:46:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FEB10E8DB
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544769; x=1731080769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TgDMeIzTBKQsirJFHcd/tYp267Upbg8VeWIsi4JcNJ4=;
 b=aOKyzKEwS4tAfoIgG63E9hjrTnjPL7iUoMZ7D9g7DslSRJK8Rpx26oM5
 LRi+LTmQ+vGPK66FoN0/S3So3vVx9wk8CosgHGo0+TMS6miH2Z/OH6Xd8
 feXd24IqXrXnLkuI0MJtSx9wt0gd4LY550GYJso7+YObZGAzq3a8NiPwm
 gPr9Ey2aMgP/bJNuHp4bmIwAVDpimdn6GGo26tvyJP1AQ0ke4lIDvaK61
 9HKxMRlsxEHcV7kUa3CsRs3mv9YoCEInTDp+tXgHvdejI04oS1EZR/fBW
 LFw/TRtJP/oWCExHLje53A7tR2bz9QChbyYuBsNKeUT0FyAuPxb/oR6Wx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556739"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556739"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936886026"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936886026"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:37 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:34 +0000
Message-Id: <20231109154457.7-21-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 20/43] drm/xe/uapi: Replace BO with GEM in
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
index 8d83f8c2ca04..d66d8aa09270 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -631,14 +631,14 @@ struct drm_xe_gem_create {
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
@@ -646,7 +646,7 @@ struct drm_xe_gem_create {
 	/**
 	 * @vm_id: Attached VM, if any
 	 *
-	 * If a VM is specified, this BO must:
+	 * If a VM is specified, this GEM must:
 	 *
 	 *  1. Only ever be bound to that VM.
 	 *  2. Cannot be exported as a PRIME fd.
@@ -748,8 +748,8 @@ struct drm_xe_vm_destroy {
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

