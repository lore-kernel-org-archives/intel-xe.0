Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1404606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRvubuPv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8EE112786;
	Fri, 30 Oct 2026 11:50:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656F7112771
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 11:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361003; x=1824897003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gc5HQ/uI42C4XvTNY+RnAXgT6UKrmDQNcHKoFpBmU70=;
 b=LRvubuPv2UVP5FH6IAooZ+ECK7ixTTU3A1iuA6ThdNJN3GB9sThk+Z6v
 mmOhVPVU7weFaiLSHG95Z9aaK3otlOD3VRsq77EU1sC8dV/+hPS+yDc+k
 PffVz4x9cL30U2zNCAwKQaE5oXWS4fhr/8flpIx//p83vXkfGMF9OwvJG
 vRYU0/WzrStuVfTUQ+0izv5TGGlMJEKNuPfs9Ps/AyCRVXyLlWwNtyCYP
 Vxa3VPpnOgZn2ecyya7APz8mJSIR1OeE7kHVi+mzx+CepR5gkOW2ZTt5Y
 yMLms0TFx2LQ+K/7l/2mouzf398oPX4UdnPPFProRcc0cEf4jCda3M+ey A==;
X-CSE-ConnectionGUID: t5ZQe/MlSr2IfZFn9qifIg==
X-CSE-MsgGUID: DzDYIP1gSQCn/3N88qcX3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2135385"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2135385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:03 -0700
X-CSE-ConnectionGUID: iuZV+SZOR5eljliasilXNA==
X-CSE-MsgGUID: mQ9sHl3/TMu5+L3FZjsiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5441138"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.36])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:50:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: allow larger chunk sizes for identity
 VRAM clears
Date: Fri, 30 Oct 2026 11:49:51 +0000
Message-ID: <20261030-migrate-bb-optimise-v1-1-b8d01649cfe9@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Assisted-by: LLM
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 70408fa0a606..1a216fb12d2b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -246,6 +246,7 @@ struct xe_migrate {
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
+#define MAX_IDENTITY_CLEAR_TRANSFER SZ_128M
 #define NUM_PT_SLOTS 48
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
@@ -1964,6 +1965,11 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
2.56.0
