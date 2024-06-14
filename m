Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD8EC27C7B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557FC10E2AC;
	Fri, 14 Jun 2024 21:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htMD+XpU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E388410E2B8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401660; x=1749937660;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sD5SCknucRR6AJF2NRU0G1Cpf9qwG6Ya1qnbWmf/Jlk=;
 b=htMD+XpUZU9cEzmKSUhUfRr4PSbJUYARZ16iuSCUdJQTwv7IyxGBmlGP
 QgaKd1VdJHHRPG42kG/Qf5JDytsDnXyYpppDgR5GUUDPEFAR/WMp48GuW
 +lIar+RS2FUiWjyC4vM28TEzVeiCSZecY01JeX6n9ZviltnRWqR0maOkZ
 qFPLRb9HQW1AYPYYcI/nXSmDMxChXNgR4Mht1XQIhf4F9B0kuYFbXbmUe
 hsS036Au4YjuMhr8ZN3+luvGy/k3Uy4WKz+ZJl5Io4gxIhUApB1RB3uvi
 GaSKNv3sgyczWjqQxrpyOktBhOz+/Twk8KAwEMSAVm+aE9nEs9xJ7z4ux g==;
X-CSE-ConnectionGUID: gpZ4RanYRTG6NTLdn2BkIg==
X-CSE-MsgGUID: K/nEAy9KS0qt3HrG6WG9Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25886599"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="25886599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
X-CSE-ConnectionGUID: J9r211loSZuBmelvl9Nnkw==
X-CSE-MsgGUID: A0242meOR4qDwkNAdC0wLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45572416"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:47:28 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 22/44] drm/xe: Retry BO allocation
Date: Fri, 14 Jun 2024 17:57:55 -0400
Message-Id: <20240614215817.1097633-22-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240614215817.1097633-1-oak.zeng@intel.com>
References: <20240614215817.1097633-1-oak.zeng@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

TTM doesn't support fair eviction via WW locking, this mitigated in by
using retry loops in exec and preempt rebind worker. Extend this retry
loop to BO allocation. Once TTM supports fair eviction this patch can be
reverted.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..8fe78f7b000f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1929,6 +1929,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
 	struct xe_vm *vm = NULL;
+	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -1994,11 +1995,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
 
@@ -2007,6 +2011,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
 		goto out_vm;
 	}
 
-- 
2.26.3

