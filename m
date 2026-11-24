Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6250606A323
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3FwfaUk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AC410E1BB;
	Tue, 24 Nov 2026 20:12:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA7010E27E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795551129; x=1827087129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CQFMXA8SfEE8phvgOJbdVAWeD+pcVl6g4eJIsR04Ue8=;
 b=H3FwfaUk8+1TPD3+m0OYNytLgBhdk3FV52nzrynfd2Ybxx0xrAa7OD0B
 RGWBG6Ic/I/W1VeHoqcT/FgnDNtg7udAOCdhHvrX0dN85R1c/lerm0hpe
 1dWSKT+8uJyGMPxNRzd9cPWNNsueu7jxrGqZymvPG8Y3OGLlgZw9r+7HY
 e6dzF7DqOpJDqixqA3kr1175SCUKAlxv4NuGPy0E6V8bUkzyEJA/GYnEo
 26AqWzfVnkVuBMYw94o2DZCB9Myi5FI9PFdkmXoMHG7h+mA8o/+iL1VKs
 P/LXK1YEITozeeDpHenxO98H39M5tn4ZYt2NXifrWsFH+lPat/zp0VjkS Q==;
X-CSE-ConnectionGUID: T+uirykHRj6j0YJcGg+e+w==
X-CSE-MsgGUID: oWYRrvqyQ06O4Rjw2Wmhig==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4305568"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4305568"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
X-CSE-ConnectionGUID: 2kWpfOtMTYqOdLA3co5Eiw==
X-CSE-MsgGUID: 1SXkkvvyTGKmfCYs0NL+Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12240628"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v10 3/7] drm/xe: Reject vm_ops->access on BO mappings of an
 unplugged device
Date: Tue, 24 Nov 2026 12:11:54 -0800
Message-ID: <20261124201150.405479-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A userspace mapping of a BO can outlive the device, e.g. across unbind
or a PCI slot reset. After drm_dev_unplug() the fault handler only
installs a dummy page, but ptrace, /proc/<pid>/mem and
process_vm_readv() can't use get_user_pages() on these VM_PFNMAP vmas
and fall back to vm_ops->access(), i.e. xe_bo_vm_access().

xe_bo_vm_access() doesn't check whether the device is still there. For
a BO in VRAM, xe_ttm_access_memory() then either goes through the VRAM
iomap, which is unmapped on remove, or submits a migrate job after the
GT has been torn down. This applies to GEM mmaps and to the OA buffer
mmap of an OA stream that outlives the device.

Enter a drm_dev_enter() section in xe_bo_vm_access() and fail with
-ENODEV once the device is unplugged, like xe_bo_cpu_fault() does.

Fixes: f85dc3c5abdd ("drm/xe: Add xe_bo_vm_access")
Cc: stable@vger.kernel.org
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
v2: Add Fixes tag (Sashiko)
---
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 353ac1e9a9d6..16afde56b31b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2347,9 +2347,20 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
+	int idx, ret;
 
-	guard(xe_pm_runtime)(xe);
-	return ttm_bo_vm_access(vma, addr, buf, len, write);
+	/*
+	 * A mapping can outlive the device. Once it's unplugged, VRAM is unmapped and the
+	 * migrate engines are gone, so refuse access, like the fault handler does.
+	 */
+	if (!drm_dev_enter(&xe->drm, &idx))
+		return -ENODEV;
+
+	scoped_guard(xe_pm_runtime, xe)
+		ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+
+	drm_dev_exit(idx);
+	return ret;
 }
 
 /**
-- 
2.55.0

