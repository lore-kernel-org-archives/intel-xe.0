Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD1CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1DB10E40B;
	Tue, 12 Sep 2023 11:45:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B23010E40A
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519104; x=1726055104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eKqI0e3zeFV6QoYp4+uWMNmbf+jTZ0wFcaRupoWhJVM=;
 b=Ks7Zw3lc+uG9V4wDp8bDLn6l27MeIkaOcsoTCXmw7s4P0MeEWmAfMxdT
 32NyKCrWULTWoQu1NSsfB4TdP4OHSaJFqLc7JpRbN0NaDUi472neQYOpH
 oezUgtrlJICPBHCVJoIKD7zddbbsbcRF92o+64YVIOr0k/v7Yn19IpUpG
 5BXg3s1p2T1pubiQtT+zDZon3EcxwDqYGBYJv+f1g4mW8jlnv12/grinm
 C5XHjYcn74DnTaFIMEOQNQS7uq4l9sK3S0jAQ3j+N/IWS1GfGtm8iD7tq
 pC/Ou5yOkAoHrwz55RbFB7YxYbA2miTBo9FR/13wqmGMcQrHAAE07xPCZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381050205"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381050205"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="743700060"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="743700060"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 04:45:02 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 17:22:36 +0530
Message-Id: <20230912115239.3554341-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 4/7] drm/xe: Record each drm client with its VM
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
index a6a0f17fec1d..92d8c78c9284 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2051,6 +2051,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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

