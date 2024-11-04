Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5280FD132D5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D59310E458;
	Mon,  4 Nov 2024 14:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sium5B4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DCF10E46F
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731756; x=1762267756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tIYRfXCkGfqmP9Mr/efjX7gI59AU9VXliClEIZW+XjY=;
 b=Sium5B4aHRUkBkr6IY6g/yhQaywC231+aGTluR0k0Yjji7UUFzxAi8lc
 GqiLYfuR0SceyKNfhpPYrkCrqY34T4j+wwB/YvkygbkVWz92G3WrwZpza
 wkudU5umagYf4g9u3ixeGCW19NufutgX2CEhxDoogshUNP1VGDihOuT8v
 gAU71bIj5isfxY9IJQpaByNHpRPEe2f9W+rUpOrC4zpch9SD5TQXF2Rw1
 MJLl3JfO3YjWnRZdO7mRsBxCWSHhGnUYttwpIZlBoL6qmwmzWHr0nPNpy
 VSVT1AqMw+fKfbAQCa+i1ggQSI0lqZytIyQIrb0JpL9YeXJbDIxZ2v5a2 Q==;
X-CSE-ConnectionGUID: a8VVNQQUQTOKedsWtFGkUw==
X-CSE-MsgGUID: OU4wTKW/Q9CgND+Iryd7Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29857266"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="29857266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:49:16 -0800
X-CSE-ConnectionGUID: a4KRlXBYS0aw2wQ+OmC82A==
X-CSE-MsgGUID: HE0sZ3bPTPiMaR9JP01dng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="114481172"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.9])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:49:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/pf: Fix potential GGTT allocation leak
Date: Mon,  4 Nov 2024 15:49:01 +0100
Message-Id: <20241104144901.1903-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

In unlikely event that we fail during sending the new VF GGTT
configuration to the GuC, we will free only the GGTT node data
struct but will miss to release the actual GGTT allocation.

This will later lead to list corruption, GGTT space leak and
finally risking crash when unloading the driver:

 [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-EIO)
 [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT

 [ ] list_add corruption. next->prev should be prev (ffff88813cfcd628), but was 0000000000000000. (next=ffff88813cfe2028).
 [ ] RIP: 0010:__list_add_valid_or_report+0x6b/0xb0
 [ ] Call Trace:
 [ ]  drm_mm_insert_node_in_range+0x2c0/0x4e0
 [ ]  xe_ggtt_node_insert+0x46/0x70 [xe]
 [ ]  pf_provision_vf_ggtt+0x7f5/0xa70 [xe]
 [ ]  xe_gt_sriov_pf_config_set_ggtt+0x5e/0x770 [xe]
 [ ]  ggtt_set+0x4b/0x70 [xe]
 [ ]  simple_attr_write_xsigned.constprop.0.isra.0+0xb0/0x110

 [ ] ... [drm] GT0: PF: Failed to provision VF1 with 1073741824 (1.00 GiB) GGTT (-ENOSPC)
 [ ] ... [drm] GT0: PF: VF1 provisioning remains at 0 (0 B) GGTT

 [ ] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP NOPTI
 [ ] RIP: 0010:drm_mm_remove_node+0x1b7/0x390
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  ? die_addr+0x2e/0x80
 [ ]  ? exc_general_protection+0x1a1/0x3e0
 [ ]  ? asm_exc_general_protection+0x22/0x30
 [ ]  ? drm_mm_remove_node+0x1b7/0x390
 [ ]  ggtt_node_remove+0xa5/0xf0 [xe]
 [ ]  xe_ggtt_node_remove+0x35/0x70 [xe]
 [ ]  xe_ttm_bo_destroy+0x123/0x220 [xe]
 [ ]  intel_user_framebuffer_destroy+0x44/0x70 [xe]
 [ ]  intel_plane_destroy_state+0x3b/0xc0 [xe]
 [ ]  drm_atomic_state_default_clear+0x1cd/0x2f0
 [ ]  intel_atomic_state_clear+0x9/0x20 [xe]
 [ ]  __drm_atomic_state_free+0x1d/0xb0

Fix that by using pf_release_ggtt() on the error path, which now
works regardless if the node has GGTT allocation or not.

Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 062a0c2fd2cd..192643d63d22 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -395,6 +395,8 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
 		 */
 		xe_ggtt_node_remove(node, false);
+	} else {
+		xe_ggtt_node_fini(node);
 	}
 }
 
@@ -450,7 +452,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	config->ggtt_region = node;
 	return 0;
 err:
-	xe_ggtt_node_fini(node);
+	pf_release_ggtt(tile, node);
 	return err;
 }
 
-- 
2.43.0

