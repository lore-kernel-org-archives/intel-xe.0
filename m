Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB53C61DF0
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 15:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC8010E0A0;
	Sat, 21 Feb 2026 15:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GX8QDiw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BB310E084
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Feb 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771687382; x=1803223382;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DG+gqvTZvHQThNpHY+NkJgx+nh5IkkW5va25va1qxbA=;
 b=GX8QDiw1Q/osIF65Je266Bq6dpbDomqwiC6Vj74Q+UlHw0EyJ9GY7cMQ
 bBpAznU6jHa4uTzam0BSizWLrAa/xcxRfeDEzxtALsvz/NBwDEAiUC1yz
 V3gRG1Y17AosCnBRJyN3M5xjy6+wCqgHRkrBVheEJnOadhzVLyykNgycN
 6S9WNPAklTZodQvKqs1gN00Ag8mJ0mEt7iYdBufhQA7uH+0cxRwEFiYGM
 cQbBiTUdHYmqR4wQfH87ttHSxUGGTFxXOLJjb1iZAwjr/4UclFdBzjcRL
 QvVgrZR6jmi2vZfg8icxIsVlvh0OXYjxdKIw2PX8ldASh1yuVgXdZWMHe g==;
X-CSE-ConnectionGUID: 9xXQHF04THiAnAoldnWB4A==
X-CSE-MsgGUID: Al3UdPpnRXiI4jQhz6FFqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72852228"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="72852228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:01 -0800
X-CSE-ConnectionGUID: 9qAeBzPtR+qoCfnNCSEjRw==
X-CSE-MsgGUID: tNzGXVIIS9KLDP1O/YkC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="215136029"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/xe/pf: Don't force 2MB VRAM alignment
Date: Sat, 21 Feb 2026 16:22:29 +0100
Message-ID: <20260221152230.7071-3-michal.wajdeczko@intel.com>
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

There is no need to always request VRAM BO to have 2MB alignment
as for now this is required by the LMTT only, which could be not
present on some platforms with VRAM.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6383763d02ab..53f03e7075d2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1626,13 +1626,15 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
+	u64 alignment;
 	int err;
 
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, IS_DGFX(xe));
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
 
-	size = round_up(size, pf_get_lmem_alignment(gt));
+	alignment = pf_get_lmem_alignment(gt);
+	size = round_up(size, alignment);
 
 	if (config->lmem_obj) {
 		err = pf_distribute_config_lmem(gt, vfid, 0);
@@ -1648,12 +1650,12 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
+	xe_gt_assert(gt, alignment == XE_PAGE_SIZE || alignment == SZ_2M);
 	bo = xe_bo_create_pin_range_novm(xe, tile,
 					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
 					 ttm_bo_type_kernel,
 					 XE_BO_FLAG_VRAM(tile->mem.vram) |
-					 XE_BO_FLAG_NEEDS_2M |
+					 (alignment == SZ_2M ? XE_BO_FLAG_NEEDS_2M : 0) |
 					 XE_BO_FLAG_PINNED |
 					 XE_BO_FLAG_PINNED_LATE_RESTORE |
 					 XE_BO_FLAG_FORCE_USER_VRAM);
-- 
2.47.1

