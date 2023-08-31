Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E7C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B7F10E5D0;
	Thu, 31 Aug 2023 08:58:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEEA10E5D0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693472296; x=1725008296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wFsIAgdKsEmSR2Re3Pd11/QpHbBgwaVpJ9fxISJyBFo=;
 b=fbSXhj5BBXhiRHB6uMyNtvA3gEcvrGp74K52bqZvuTDwrktORSHN7nd+
 TWDmejxDH2Pi7XclHgQH0ROxOwwM7kFZaF/RSBSrP47HSE4k0eCtHzjEN
 fzyGio4CRWcer+sIwklsxPw3RlrXGVQJz3a97lC7HmlSaMjyHLAoVWNFt
 Wu3SnHgsrw53GVJaLxPtQ8jZugxiLbyo3WZI5Q0eawnBVezWU1V4HE4qG
 GHZbQuKdkVrUbN40y16tqaArMnkQl4TtJ3xQE240vVygjr8MKEE+sgK6b
 Mh1EDtbs0f50wsiHcn6TnM/AQyteFoV1vWh5jaw0vrBiGov7YIQ2ySgB0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375814179"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375814179"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 01:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716257380"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="716257380"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 01:58:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 14:35:33 +0530
Message-Id: <20230831090536.2949934-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Record each drm client with its VM
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

Enable accounting of indirect client memory usage.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9cbf2f63d641..f5f832c8ed42 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2057,6 +2057,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
+	vm->xef = xef;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fd2178dbde3a..db8523d81d0f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -336,6 +336,8 @@ struct xe_vm {
 
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
+	/** @xef: XE file handle for tracking this VM's drm client */
+	struct xe_file *xef;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.25.1

