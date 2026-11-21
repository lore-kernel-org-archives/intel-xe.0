Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC5606A68C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3rztnsQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510E710E8B0;
	Sat, 21 Nov 2026 02:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB1510E925
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795226525; x=1826762525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CQFMXA8SfEE8phvgOJbdVAWeD+pcVl6g4eJIsR04Ue8=;
 b=I3rztnsQ9rkl3PveFO7aJ3wGDt7uxqraNFY8ZbXWQEsh/V5HfYyboE3T
 ObjY1eswWcSyiltcXmNCr48qlq7E+ioydxRLK796Yoc1eZOtYb/FDr4qE
 dLHhdfW4OanXcixaxnHoWiMv+IjWb3Nv5RYOD6cEB/NbGKlr3xubOCUTq
 arp4gUKy9p99X3Oxy0p9Y5swJ+WlVS+ZJKfpX5AaeiaJhvrX0NIWlpqZP
 VVsr1CG8M5w7POTo9vu/FRzyodcGxt8vkPT4usr6DY9aCLw0N0ftjf+zh
 7Blp3FejhTUplePJIR1ZsXSZXZ8ONG13M7qo50is/6+0GuXv9d6vMF+Ap g==;
X-CSE-ConnectionGUID: 40YkJgEbSnO2S7OZ1tLTJg==
X-CSE-MsgGUID: bXs+ZA6iTfyb10cDOKHjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4118795"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4118795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:54 -0800
X-CSE-ConnectionGUID: hk6BBmJHToaiT/ilNYkjJQ==
X-CSE-MsgGUID: fRjjVzGpS/Ce3p/3hxMMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="11182116"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 18:01:53 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v9 3/7] drm/xe: Reject vm_ops->access on BO mappings of an
 unplugged device
Date: Fri, 20 Nov 2026 18:01:49 -0800
Message-ID: <20261121020145.147384-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
References: <20261121020145.147384-9-umesh.nerlige.ramappa@intel.com>
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

