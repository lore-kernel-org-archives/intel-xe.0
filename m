Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A52AC5AD7B
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 15:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6910E0C8;
	Sat, 21 Feb 2026 15:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0ZsTkVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0714310E084
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Feb 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771687381; x=1803223381;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ynm4tuKpjBSRFhp4qw3CKt8oDezNNDxXod2DhUVitjo=;
 b=R0ZsTkVFD5rfTwDRvncCUAsAxrKQ+uCDsqBGFjPqx2lnz+zTQQh1qFCp
 U6rsT3oXZhX2e5I7hVi7ca2Hwc7cs7MqImCOF8rsaTQZgxcAjc8QaTrfO
 J+QkBTTRLTJuU16em5Ac0bA6mwLtLj9EDCXhANBeaFuGFIGcvPThBJ6cq
 L9Bk4YAj+MmPmdhsX1Y3SOyTL9V7xpAfX1oYeNVnw3ST9Eit/+BJYgr8R
 EZCl1KNR23/f6yhytzYrfOeVgb9IrEo4Ss7IBzomN9U5qeTHIXCqDfsTP
 Un0pq0ICaSGKOSo4+nwcrp3eekf7vsMXrKKC+lzoup9+gL53ySEd7zYFi g==;
X-CSE-ConnectionGUID: Jrz4OS/VTna2tPipoAPOew==
X-CSE-MsgGUID: q89R+ntuQ2ejDpm1rI2npA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72852227"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="72852227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:00 -0800
X-CSE-ConnectionGUID: C9V2sG+kQzam+8ebSvSbAA==
X-CSE-MsgGUID: lPdZTo97RluL6neKRMTKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="215136023"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/xe/pf: Use explicit VRAM BO flag for VRAM
 provisioning
Date: Sat, 21 Feb 2026 16:22:28 +0100
Message-ID: <20260221152230.7071-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260221152230.7071-1-michal.wajdeczko@intel.com>
References: <20260221152230.7071-1-michal.wajdeczko@intel.com>
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

When we are about to provision VRAM/LMEM for VF, there is no point
in using semi-automatic flag that supports fallback to the SMEM.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index cba20eb6b36b..6383763d02ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1652,7 +1652,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	bo = xe_bo_create_pin_range_novm(xe, tile,
 					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
 					 ttm_bo_type_kernel,
-					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+					 XE_BO_FLAG_VRAM(tile->mem.vram) |
 					 XE_BO_FLAG_NEEDS_2M |
 					 XE_BO_FLAG_PINNED |
 					 XE_BO_FLAG_PINNED_LATE_RESTORE |
-- 
2.47.1

