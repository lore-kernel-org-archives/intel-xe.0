Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D591606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YoQvFNmY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554310E4A9;
	Wed, 18 Nov 2026 12:20:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8E310E4A9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795004435; x=1826540435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3T2zLZG6Fsatelqk3J5s9jKnF8ytcJizYsHOMATTVgc=;
 b=YoQvFNmYZi95McM04sCBvkyu1h2IVhuUvRwRDo0shv30A2fa97gEzPjH
 MGHlFd27FsuUWwoHdoZwEGgvF/uidcADMV8xhPLApyHTwTbR2QGHZ3XeR
 OLtjMGNy1r4S4Nrm0W8ShRTNTwxEal1s3O5ItncgbGjCGe9OCBlNCOJt6
 cyLVSL7pRkhzDlg1ZF7sKV5vfwB8t8x5olMHO/WQANrROYE31qYXBCA3h
 pyb5ql3kroYN1ik6lu+62dd3u7Eobg+qsYBxpGbijzftTrGWITG9SmbBw
 +uorvffS5+NdPGlSDg2Gldvcqr6CaizGem7RLGVL445vwyKN5lgv1djKL w==;
X-CSE-ConnectionGUID: 5igYPTHaQLadz9cp3zUZcw==
X-CSE-MsgGUID: hcSuydkMRz6xW5Y3/W9CTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3802173"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3802173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:20:35 -0800
X-CSE-ConnectionGUID: 4VRWGNyGSq6Fu3GcFEBLmg==
X-CSE-MsgGUID: p99UIoFsQ6ORGfCyZmo6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10040417"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:20:33 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Don't zap imported bo page-tables on L2 flush
 optimized hw
Date: Wed, 18 Nov 2026 13:20:11 +0100
Message-ID: <20261118122011.487537-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Invalidations of imported buffer objects originating from the dma-buf
invalidate_mappings() callback may run without a runtime pm reference,
and obtaining one from that context may not be possible. However, on
L2 flush optimized hardware, xe_bo_trigger_rebind() would, also for
non-fault-mode VMs, wait for idle and zap the page-tables and flush
the TLB using xe_vm_invalidate_vma() in order to ensure the L2 cache
is flushed.

For imported buffer objects this is not needed, since the vm_bind
ioctl already restricts them to PAT indices that either ensure no
data for their pages is kept cached in L2, or that are 2-way
coherent, making a flush unnecessary. So, for non-fault-mode VMs,
skip the invalidation for imported bos and rely on rebind on next
exec, as is done on hardware that isn't L2 flush optimized.

The patch and changelog were prepared with the help of an LLM.

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v7.1+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a..fd7833e598b3 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -805,9 +805,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			drm_gpuvm_bo_evict(vm_bo, true);
 			/*
 			 * L2 cache may not be flushed, so ensure that is done in
-			 * xe_vm_invalidate_vma() below
+			 * xe_vm_invalidate_vma() below. For imported bos, the
+			 * PAT setting ensures either no cached L2 data or
+			 * 2-way coherency, making a flush unnecessary.
 			 */
-			if (!xe_device_is_l2_flush_optimized(xe))
+			if (!xe_device_is_l2_flush_optimized(xe) ||
+			    bo->ttm.base.import_attach)
 				continue;
 		}
 
-- 
2.56.0

