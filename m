Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA650606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWIr1MTW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9A10F8B3;
	Wed,  4 Nov 2026 00:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F45810E66C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753562; x=1825289562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSGFNtu5e4pSU7IcRaz7DrdNUXafzAqQahLpy3qSgAA=;
 b=NWIr1MTWPdBDhoXQwQ4aGFa0SVma4hZpFnBbdO4SsENLbe6MfCbSbuOW
 GES37qin5ZKeDNn8L4clVQudCY0jx2c+I2Dd/iR19nsQ7H2bBaUopHduZ
 8zP7on6J7wTPaOexWlacqkHhfFNCiuTSSzjFzljE/l1NJaJc/qZupAxAB
 nK7zp8E45RLQmQU4PRIUFAZuxkoei810iNuMCttbNDuhSQlwnoO79RgEw
 MXIhLJlvTYsrYS39vKOguTpU4PHca5VA1zeucl27wd/DgI33OrEf8t9RA
 wZ8nEX5Rjwbf/ASC5Mf9qiaRJkzVJmBUnsCmFrG2crWsd4w5OrJm1uPLA w==;
X-CSE-ConnectionGUID: xLlEMMXiT9qxdMrvhQutiQ==
X-CSE-MsgGUID: /B1vHhq9SbaU2bqkgkGTVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2529527"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2529527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:31 -0800
X-CSE-ConnectionGUID: u2OHW6ExRPS0s8XfxS8Gjw==
X-CSE-MsgGUID: P5AliUzkRf2acdTpYJOoXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6649334"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:52:30 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v3 4/5] drm/xe: Reject vm_ops->access on BO mappings of an
 unplugged device
Date: Tue,  3 Nov 2026 16:52:26 -0800
Message-ID: <20261104005221.3230003-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..a74c38df2bdd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2345,9 +2345,20 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
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

