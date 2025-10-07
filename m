Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A835DCCD18E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A5810E68F;
	Tue,  7 Oct 2025 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fwa8UlfF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19C310E649
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842314; x=1791378314;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dJP0KZNDVKPsboEEz1IKCzRlCxR9Y4yoVpZhRMjfz8A=;
 b=Fwa8UlfF737Onac8d494S7XxKj1vJ+3rsMSPkijHW9897blwp/uyngdq
 0QJIVumJ+0gh6RgdVIkq3sA+a0AiXnoPJ7XitEN7GUS6PjxRnWPbnuby7
 flpTFWKxiQyzbevBOFpAdXvvQU3ajhR+loxQO3Ooa2QObAuGnz45VrG4b
 JcI04Y3ZIY6bruOG2AaKsJuh82LQJAVsQRMhB0bWRwcv2NNNjfP0v87Eq
 F06fWbUvH2VJjo7whm+ciIJGKuqcDGGPqg7UdQSiySqJQq3/PnstWR961
 kpp37qWOL/Vg5ejhmhNJoYVPvKAXknQZ1kh4SVah9l1lwaegSqsfOkeMe Q==;
X-CSE-ConnectionGUID: adcbTFizRwKe5k2Oh5jLcg==
X-CSE-MsgGUID: mOhVF8lORs6WSYBDi/WLug==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639840"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:14 -0700
X-CSE-ConnectionGUID: 4KEp7LQcTnunGl6wi/xXew==
X-CSE-MsgGUID: 4F1F/Vj5Tmq0l2zXV7YXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576950"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 20/33] drm/xe/vf: Reset TLB invalidations during VF post
 migration recovery
Date: Tue,  7 Oct 2025 06:04:52 -0700
Message-Id: <20251007130505.2694829-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

TLB invalidations requests can be lost during VF post-migration
recovery. Since the VF has migrated, these invalidations are no longer
needed.

Reset the TLB invalidation frontend, which will signal all pending
fences.

v3:
 - Move TLB invalidation reset after pausing submission (Tomasz)
 - Adjust commit message (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6856973cab9a..d5819cac1bc9 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -35,6 +35,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf.h"
 #include "xe_tile_sriov_vf.h"
+#include "xe_tlb_inval.h"
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
@@ -1102,6 +1103,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause(&gt->uc.guc);
+	xe_tlb_inval_reset(&gt->tlb_inval);
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
-- 
2.34.1

