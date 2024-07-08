Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DACC3DA41
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB92F10E40F;
	Mon,  8 Jul 2024 20:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6VeziQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8670C10E3FC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 20:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720470070; x=1752006070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6S4UHLCmYIvtYGL6XwSCQxayNj1pquSu1EAMKX+i35I=;
 b=B6VeziQo5ov28ZPX8ZDAf7K0oHfyY/n8yudJ+AJYTT4AAfDrDjgW61ft
 7hqUjJygygBz6ZKTr5UUwwRssRgzzLxZsZ6clui+mB29y+xUNOIU1qSBQ
 uPGCoKJNq5qngk/BGxppi1NPvAU0THyBxWmnlUyJcxx9BMv5YHHxXHLhS
 vAKS4pCI6gqSu6EoCU7ovhAcpWfB//l/LhPkuUEiRf5o9VLRo7pGcVFaT
 +cgd+Y6jOGsfOkRyGE3fRqGhJh7lUDjHT/mMHkq5mvDfjHrD39eFEmrO2
 5XY7xfA0QOJ1kHPWBk4RHQ7E/+DJW2wtePHpW/+kBpKN4FeWDNng7QBCu Q==;
X-CSE-ConnectionGUID: t0H2+b6ASp6S8iRJ3Qvs5g==
X-CSE-MsgGUID: 30xopJ/vRlyNOVbbHz/YEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="43114142"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="43114142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
X-CSE-ConnectionGUID: /M2yzORPSyOQzHAMj2jmtA==
X-CSE-MsgGUID: soQRoKMWRwKCSxxy8X1klQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47495009"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 13:21:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH 4/5] drm/xe: Take a ref to xe file when user creates a VM
Date: Mon,  8 Jul 2024 13:21:02 -0700
Message-Id: <20240708202103.3347869-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

Take a reference to xef when user creates the VM and put the reference
when user destroys the VM.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0c764647a552..67b4c2467b78 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1611,6 +1611,9 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
+
+	if (vm->xef)
+		xe_file_put(vm->xef);
 	kfree(vm);
 }
 
@@ -1926,7 +1929,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
-	vm->xef = xef;
+	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
-- 
2.38.1

