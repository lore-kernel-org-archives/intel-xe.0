Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78833C5AE5D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E710E83A;
	Fri, 20 Feb 2026 20:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/D0BFbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250C710E839
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771618756; x=1803154756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfP1VYl2C0PF5I1PsWLkcV0U9Wbb/I5AYpQt0krU4GI=;
 b=j/D0BFbeVoOnMaaps14I3zDaMCKITgUCaT+W+Mz0JnO9yAFfMILnIMMZ
 O8+fUGSkAU32mZCK6Oyozpgtp4gzTCAJsTEfrXWt6vBnhgu3XlO0xedKA
 2itb0LwqP5H5GVsFViNE/dV7MDvF5kB/NYj4pg9IvIHKfTQhOpqDoKCB/
 PoMBKy+BVhlVxdhdB3JldJoXnK0pFLzF4mv5kjyWseVSgOCuzrXvYSTkM
 IPextBhAcnF4IkEFw8S2KKBNLfAHdpvSFFw24WqB3WzKTl4RiFAyNYaRQ
 PyT8WQZaRqcyIqugXqZKMUMsWvKPs5RsmQHSgaD9mKKggLXrduTyAN2DK g==;
X-CSE-ConnectionGUID: gNQ+lodsQ/W5z8heJkacgQ==
X-CSE-MsgGUID: r2sVR1kaTFaXWouKAjxASA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84169544"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84169544"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:15 -0800
X-CSE-ConnectionGUID: K/JGlDMQSHCM/08HKDq0Ww==
X-CSE-MsgGUID: QGJvCjr1STCmIbIbQXDwmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214182134"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Don't force 2MB VRAM alignment
Date: Fri, 20 Feb 2026 21:18:55 +0100
Message-ID: <20260220201857.6113-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220201857.6113-1-michal.wajdeczko@intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3ae83cffe925..b867203b4997 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1627,13 +1627,15 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
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
@@ -1649,12 +1651,12 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
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

