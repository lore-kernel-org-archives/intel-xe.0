Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02FDEDE9B5
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 12:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A482610E570;
	Thu, 14 Sep 2023 12:11:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58510E56D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694693491; x=1726229491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNJJV+uGofeWUcP/qPEfgBkcBPa8dkpyTrJh4UAsNAs=;
 b=ea2s1tSLpPRVaMbzXwp2v20SbvkeT4DlAdHGsxWa9ZqQPd/7OYaO960m
 t9An0BNduToFsXBi9Ch+meZSOqhQM87yopzDMyIkUuGPleMobgaPU3BN8
 HJddu8KG0ToaYXrULQ02Su5G1a7Rpj3MbZmjgVCgC/W7kkxlCZooEAec+
 SqTrzx3B+mdyCFYBmYKgxHuJQOKfVNcag8SLF8VnNXLarlI/td82cOwrU
 GbNuklfQlgsDnVj6i6Ih0ohcWrzrsynVnuvFNNSgU+LOVzVzZ4Kr+0WN+
 LsCIDLksJ0Vb1Rpl479Oa+wM6IMnHSLRKRMfeX7qAQVTqqr+7pmsILTl2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377838142"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377838142"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 05:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918223775"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918223775"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 05:11:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 17:49:06 +0530
Message-Id: <20230914121909.3860392-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
References: <20230914121909.3860392-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V3 4/7] drm/xe: Record each drm client with its VM
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

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 1 +
 drivers/gpu/drm/xe/xe_vm_types.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2b225c0692a6..9a993dff98c1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2056,6 +2056,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
+	vm->xef = xef;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52e5eaed91c3..af2ba4acf1f9 100644
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

