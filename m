Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D8C3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB71C10EAC7;
	Fri,  9 May 2025 16:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ba31XFrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FFA10EAC2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746807123; x=1778343123;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yHclQpmhFwvSSeGlMvpfUlRtKRROjQbK78l3tjn7xvA=;
 b=Ba31XFrncWUNV9QEKPCGF/DOznx4Cg+xy14V6aU1DQE6Ys3MMcMKuTZ1
 7mbwjwSh26+hL/gVdzT8RwR4Ow+42uYl4PL6jpXrk0TOpazvPd5qErNCq
 LHDj0aSPv7O64eI31kp3gnEC+etppP0PVEMm+ZfH4nb6OW3Xe4pUXWnJx
 vWtcsKjCJLg0qg/vGwR07MwlwhnH8dvD6gk1x7NvoVccNayPbgDJbggK9
 KjH/r0IqjHUM/SJ/LsbNPnqcqb31u6reIlrjZRwKG30LeLbKI7V3fl5d8
 x9llt9zmAPkU6Ui4E5vzjNzIWB3zofGZ2TEtQYuHztXPhLC7YiQCyxRAk w==;
X-CSE-ConnectionGUID: J14VgmV+SeKTfYR78qcX3g==
X-CSE-MsgGUID: WR77hU/7S9eXh8krjivOLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59987211"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="59987211"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:12:02 -0700
X-CSE-ConnectionGUID: 1020W6N/SA+6/pDktZ0FYw==
X-CSE-MsgGUID: JHULi6YvTJa04x4AsL+ASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137151442"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:12:01 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH v5 2/3] drm/xe: Save the gt pointer in lrc and drop the tile
Date: Fri,  9 May 2025 09:12:02 -0700
Message-ID: <20250509161159.2173069-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
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

Save the gt pointer in the lrc so that it can used for gt based helpers.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 4 ++--
 drivers/gpu/drm/xe/xe_lrc_types.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 015b00a73c0b..9d9be9383207 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -867,7 +867,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
-	u64 desc = xe_vm_pdp4_descriptor(vm, lrc->tile);
+	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
 
 	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_UDW, upper_32_bits(desc));
 	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_LDW, lower_32_bits(desc));
@@ -900,6 +900,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	int err;
 
 	kref_init(&lrc->refcount);
+	lrc->gt = gt;
 	lrc->flags = 0;
 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
@@ -921,7 +922,6 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		return PTR_ERR(lrc->bo);
 
 	lrc->size = lrc_size;
-	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
 	lrc->ctx_timestamp = 0;
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 71ecb453f811..cd38586ae989 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -25,8 +25,8 @@ struct xe_lrc {
 	/** @size: size of lrc including any indirect ring state page */
 	u32 size;
 
-	/** @tile: tile which this LRC belongs to */
-	struct xe_tile *tile;
+	/** @gt: gt which this LRC belongs to */
+	struct xe_gt *gt;
 
 	/** @flags: LRC flags */
 #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
-- 
2.43.0

