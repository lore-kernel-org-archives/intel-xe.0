Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF6C19F32
	for <intel-xe@archiver.kernel.org>; Wed,  5 Mar 2025 15:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A7B88FBD;
	Wed,  5 Mar 2025 15:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcA3vE3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469B88FBD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Mar 2025 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741187230; x=1772723230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/oNVmvhMEa8gJUhOvyjkHf2/MVbh8NIMWiUeyCfvSj8=;
 b=QcA3vE3zQ+Dus/Z3tK1GrqWyMAvAiMoCqNguIOwLqcVfnvmsuAdEK0mC
 YcZzJj12+GAXOc/U6EvskihJL/0CmpW9tggRvc+LG02a5HS2W4bVuR2ej
 wKwH5giAes2DO3SIJg99L2kr948rO7zYRpWw+PCLfUdNb7pLy5KtKlmwE
 fF3Mx5Vge788MhFaQpc8qHR/cwebeDB3Z5DkbYDpG8szIm+Uu7fS0JjUE
 W72ZyqoG4LdYFz8dGlDVtA/nMgNUm+ZqA7mHDBJNiiAfsb9q1kekua6hi
 c81UApEHAwU/zxagsKGAB+5mdVMPkENrgLjmmmqSdjgbkAsUcedDYpN6Y Q==;
X-CSE-ConnectionGUID: QpHwf/3qSYytmoCU4x1EUg==
X-CSE-MsgGUID: BG9IsGLMT5WBsvTf6p52Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64596630"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="64596630"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:07:10 -0800
X-CSE-ConnectionGUID: gA6AhMmyS/CN88QWIBPoWg==
X-CSE-MsgGUID: LKzsEtA5RgS+5lIlYqrLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="149473443"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:07:09 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe: Allow fault injection in exec queue IOCTLs
Date: Wed,  5 Mar 2025 16:06:59 +0100
Message-ID: <20250305150659.46276-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use fault injection infrastructure to allow specific functions to
be configured over debugfs for failing during the execution of
xe_exec_queue_create_ioctl(). xe_exec_queue_destroy_ioctl() and
xe_exec_queue_get_property_ioctl() are not considered as there is
no unwinding code to test with fault injection.

This allows more thorough testing from user space by going through
code paths for error handling and unwinding which cannot be reached
by simply injecting errors in IOCTL arguments. This can help
increase code robustness.

The corresponding IGT series is:
https://patchwork.freedesktop.org/series/144138/

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      | 1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 1 +
 drivers/gpu/drm/xe/xe_vm.c              | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7c5c003d3c40..606922d9dd73 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -203,6 +203,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	__xe_exec_queue_free(q);
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_exec_queue_create, ERRNO);
 
 struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
 						 struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 82750520a90a..2d68c5b5262a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -178,6 +178,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	up_write(&group->mode_sem);
 	return err;
 }
+ALLOW_ERROR_INJECTION(xe_hw_engine_group_add_exec_queue, ERRNO);
 
 /**
  * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3dbd3d38008a..338d98533fae 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -270,6 +270,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	return err;
 }
+ALLOW_ERROR_INJECTION(xe_vm_add_compute_exec_queue, ERRNO);
 
 /**
  * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
-- 
2.43.0

