Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CD7C41513
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D010710E440;
	Tue,  9 Jul 2024 00:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGIHvym+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B8B10E217
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484920; x=1752020920;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8skIYz5AoXJS+GGS5K/CEYRjOEzaUk6J2ZweYWje81E=;
 b=mGIHvym+NQ/+FcsFFPdf3TQheV6tvOTFhCDe9ggveDuxPhJSYkDR7lN0
 kqu6HI98SlsrfRqPxndzIxayfy+YPoajhl+V533+LfElmsZxow8pCQxy4
 iVMtQrQkuaxIR57rPm6vW73EcdNvsG/752kUOTAnlW5l1EZ4CYC9z0eR8
 PJ5tziM/0ZK24mCYsAesm08D5Zq7u7ThhLbj8m+7kikiR5cKOX1cIeZgV
 52KAInE6Io0w76GxFRkfype5brG9ZWnwHUPFusjgU6kMso6fX6lPOWmn8
 AWcijzZY7tfkXlvrCkbTuWdFqNBun+xropI071Zj4yDAca6fjJcB+23/u g==;
X-CSE-ConnectionGUID: lp0jj+zaR4iliQ2Hw+NWPw==
X-CSE-MsgGUID: 5OUVN4wYTB2RDC4egGJa6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29105704"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29105704"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
X-CSE-ConnectionGUID: rxeawpnWRMmr6vNkJ3zdQw==
X-CSE-MsgGUID: Wn92HMdgQpyh7d9D8t0luA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47630951"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH v2 3/4] drm/xe: Take a ref to xe file when user creates a VM
Date: Mon,  8 Jul 2024 17:28:34 -0700
Message-Id: <20240709002835.3372618-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cf3aea5d8cdc..6adb0ff09d40 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1670,6 +1670,10 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
+
+	if (vm->xef)
+		xe_file_put(vm->xef);
+
 	kfree(vm);
 }
 
@@ -1802,7 +1806,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
-	vm->xef = xef;
+	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
-- 
2.38.1

