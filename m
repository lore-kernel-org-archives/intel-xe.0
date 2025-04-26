Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D6C369C2
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 00:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52110E167;
	Sat, 26 Apr 2025 00:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC5YakyY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8810E0C0
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 00:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745627397; x=1777163397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q9DOtX5++EM5SZT/ySU2ZF+jF6LWlN1GUErSzqr4ADE=;
 b=DC5YakyYTABZElr8i9HqMsjJsQT31lXc+1KsZ3Ul+mAh6UbM53WCE5p1
 9HuHTPxeZhyGpyv16rNW+SLSPlU3BP4/wg7py6rbzli7FmHqpLMhf+pE6
 WNDbkaDEd8gJZ8wBWbuaKXf77Q4GymBXsEAXdGF05tO0D1YNgMzniBpAA
 /8dgPxPMv9hDN2vhmEehAFFkefE/dlSP+hRzfGGwRf3/ip6qZqme2p46C
 j+Om0cqEVVIHTQlyX3+Wxj0aNrBPOUfzdWglidHWo5YtkoKk+JP4GjjIG
 oJT7D045AyxIXiFgBOj1oQn2jPOqE7lycaEAB/hb7rzrF0RDJ8dwzvU7j Q==;
X-CSE-ConnectionGUID: dyxBunQJQHKfl11yGmDIJA==
X-CSE-MsgGUID: PMvAwgY+TiOo4FrCv1hLgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="46532994"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="46532994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
X-CSE-ConnectionGUID: fLsY2Tz4Rc2WCdGYg/PxFg==
X-CSE-MsgGUID: i+me7+VKTSqelaXwDccEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="138134884"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 17:29:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Save the gt pointer in lrc and drop the tile
Date: Fri, 25 Apr 2025 17:29:50 -0700
Message-ID: <20250426002951.1795492-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
References: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_lrc.c       | 4 ++--
 drivers/gpu/drm/xe/xe_lrc_types.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 855c8acaf3f1..089b195e2635 100644
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

