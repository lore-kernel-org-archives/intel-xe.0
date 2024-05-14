Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0EFC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 21:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B346A10E086;
	Tue, 14 May 2024 21:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mir30sxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EEE10E086
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 21:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715721552; x=1747257552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tRvLwA6+jpFFEPuT6oo8rRNSWj0tEkC04EkREXYtY6k=;
 b=Mir30sxlg9T7gvjvp5zGMEHUP5wQySOJTze1F2PAr94TktrX3b/s/a0C
 MkSp+AY2DDKNLnS4QXwyxfWEDV3xyIKIeKSfSBIIoiqdtK3xyasGVUNMv
 BHZ6i/JHLsTqwYsaWWJbA+qbZv8hnTmUh8hFK35w2JQC0U4KjmVWgA6dV
 Q0l77xADXs/8Xd+F0b98B54uskLrYCXx4l7EglnkMJXgXYeeef63igNze
 yuD8n6nGTxQKHuDrQMG/8tPZKG6XvHPfjg9+1dUdNsZH3Axqs4xeEDhHu
 EI4cYhK+hyH9JPU72+m31Z6ECYBqmp5+K47uXYWG3T6DVuRBuUa+rVK6L w==;
X-CSE-ConnectionGUID: DNVl6rabRUe/ucpIwi/2pA==
X-CSE-MsgGUID: P97cWUTvR168w3Exuh1uTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15558070"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15558070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:19:10 -0700
X-CSE-ConnectionGUID: ElkEmKVNRGur03wqiNKONg==
X-CSE-MsgGUID: GXr1K2+3TFaHN/Z3s6eZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="68277929"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 14:19:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Retry BO allocation
Date: Tue, 14 May 2024 14:19:49 -0700
Message-Id: <20240514211949.46127-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

TTM doesn't support fair eviction via WW locking, this mitigated in by
using retry loops in exec and preempt rebind worker. Extend this retry
loop to BO allocation. Once TTM supports fair eviction this patch can be
reverted.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 03f7fe7acf8c..b1a23ddad67b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1931,6 +1931,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
 	struct xe_vm *vm = NULL;
+	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -1996,11 +1997,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
+	}
+
+retry:
+	if (vm) {
 		err = xe_vm_lock(vm, true);
 		if (err)
 			goto out_vm;
 	}
-
 	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
 			       ttm_bo_type_device, bo_flags);
 
@@ -2009,6 +2013,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
 		goto out_vm;
 	}
 
-- 
2.34.1

