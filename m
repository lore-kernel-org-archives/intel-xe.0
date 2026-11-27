Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90186606A327
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZo51ouE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575EC10E84C;
	Fri, 27 Nov 2026 12:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417D910E857
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781699; x=1827317699;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=QD7Q9GHwgdaa/kGUmZ6TBo4LiO2pGVF+dnAFDaQsxXo=;
 b=kZo51ouExyufF4h7lyfuko0xrzJkqUMDsaY8tFLhmzSJWtJYCEqwl1J5
 bqsf5ZVc1qNoZOF3yIao1kYMb7VRXniC6yPkhm3JM0fUrMe1ZzbRoN4Qr
 0Y+8SU0MIl2BXhcAQ6iaU9MjQ8hV2D6LGVFPUlEJm6OTLutJ7jw71o7Zs
 0sPyttd1UWs6WzTvrykpugshGhKJzIFP4WYds5MqgZnJVnDDw+P01pVwm
 i8UPHmwspydXpsO7zzswk+UhMauGAzdJDom44CWGRoDpth6yWFEiJYyrC
 aC/H72v0CpxJSH76+FVKIfB7O7L7LiCBzKRPkAQEZ3OUB0AeNo1FVeuz3 Q==;
X-CSE-ConnectionGUID: hJq+wMIaQRWkCjzqwyVmRQ==
X-CSE-MsgGUID: ZtpPNTiGRLGiPIpWmUM4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4599401"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4599401"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:57 -0800
X-CSE-ConnectionGUID: Pb08/DBUTqqo2hRiUP6ESw==
X-CSE-MsgGUID: YVAwksLNSXulhWfWwd2W1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14404712"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:14:56 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 27 Nov 2026 12:14:14 +0000
Subject: [PATCH v2 4/6] drm/xe/migrate: optimise chunk sizes for identity
 VRAM clears
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-migrate-bb-optimise-v2-4-808d0d520ddb@intel.com>
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
In-Reply-To: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

xe_migrate_clear() currently clamps every clear pass to 8M. On platforms
with Xe2 blitter instructions and no separate CCS copy emission, VRAM
clears use the identity map without dynamic PTE updates and execute on
the dedicated migration engine, so clamping each pass to 8M splits
a 1G+ clear into 100+ jobs. 1G VRAM pages look quite normal in real
workloads like llama.py with even a small model.

It looks like the 8M limit comes from wanting a ~1ms preemption
granularity, and dates back to i915. But consider:

1. Xe has kernel reserved BCS engine just for migrations on newer hw,
   so no need to duke it out with userspace jobs. Further, we now also
   dropped the GPU VM_BIND path, so there is now only a single migration
   queue, so the ~1ms preemption granularity is maybe not a big deal
   anymore.

2. It does not take ~1ms to clear 8M (single MEM_SET) of VRAM through
   the identity map. Currently we just lump everything in the same
   bucket, even though we have VRAM clearing with identity, VRAM
   clearing with PTE emit, and then copying between VRAM and system
   memory, which will have different characteristics and performance.
   Applying the same 8M limit everywhere seems overly cautious.

With that be more optimistic and bump the fast path VRAM clearing
through identity map to 128M per single MEM_SET instruction. This still
only takes up to around < ~2ms, or < ~1ms if boosted. For very large
clears, this massively lowers the number of GPU jobs, reducing pressure
on the bb pool and as a bonus gives slightly lower CPU/GPU overhead.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 31392e7957ea..f34b741bbc77 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -261,6 +261,7 @@ struct xe_migrate {
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
+#define MAX_IDENTITY_CLEAR_TRANSFER SZ_128M
 #define NUM_PT_SLOTS 48
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
@@ -2053,6 +2054,11 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
 		clear_L0 = xe_migrate_res_sizes(m, &src_it);
+		if (clear_vram && !xe_migrate_needs_ccs_emit(xe) &&
+		    gt->info.has_xe2_blt_instructions &&
+		    xe_migrate_allow_identity(clear_L0, &src_it))
+			clear_L0 = min_t(u64, MAX_IDENTITY_CLEAR_TRANSFER,
+					 src_it.size);
 
 		/* Calculate final sizes and batch size.. */
 		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;

-- 
2.56.1

