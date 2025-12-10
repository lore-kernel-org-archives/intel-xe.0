Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F49AD2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D6810E24C;
	Wed, 10 Dec 2025 05:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3lgLVE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929810E24C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344354; x=1796880354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6h2kEpjaOnKMs0+JyAzxR4Rzx3k1/nvHANtNHxI5k5A=;
 b=d3lgLVE9pfRNC4pXqh/GpwZwbiNyARDgy9sVS2vgCMX3Xz9tIxbmVkCA
 820/6PK3pY+/pOHY5gPaSWnujEf8ceGVBwqWm4EHlX7gOMElrhpAkXfFg
 OInm5bgDxQprArjz2uzM5gwc3JaU6kJ59nHyGZ5h22Gisua05si2tIGP6
 ZYdGEi/utP+37FLzi1Ni+gZmgR56WGWT7Sx5/O72bbO1H3f4mIc+O6dcG
 Q88XxDSayDCu8r75fHQiKTw9l3EKPb7cuLzPrjPp13iFeJfBriSSZNK9G
 nzZPoagnr8T3C4+lvWAD04nAESyKzt2cceULBj0T96y9DvB82RdhDAaBd A==;
X-CSE-ConnectionGUID: LOozYUO0RomExr85dpLI5w==
X-CSE-MsgGUID: pwFrOKPgQY2EcfwYQUYZAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84723067"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84723067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:25:54 -0800
X-CSE-ConnectionGUID: 35wQj4yHRea3WRhl5cxaAQ==
X-CSE-MsgGUID: U9AIa6pFSFuBL+pSkJXraA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196420000"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 21:25:53 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 2/2] drm/xe/vf: Reset recovery_queued after issuing
 RESFIX_START
Date: Wed, 10 Dec 2025 05:25:49 +0000
Message-ID: <20251210052546.622809-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
References: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
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

During VF_RESTORE or VF_RESUME, the GuC sends a migration interrupt and
clears the RESFIX_START marker. If migration or resume occurs before the
VF issues its own RESFIX_START, VF KMD may receive two back-to-back
migration interrupts. VF then sends RESFIX_START to indicate the beginning
of fixups and RESFIX_DONE to mark completion. However, the second
RESFIX_START fails because the GuC is already in the RUNNING state.

Clear the recovery_queued flag after sending a RESFIX_START message to
ignore duplicated IRQs seen before we start actual recovery.

This ensures the state is reset only after the fixup process begins,
avoiding redundant work item queuing.

Fixes: b5fbb94341a2 ("drm/xe/vf: Introduce RESFIX start marker support")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V2 -> V3:
- Fixed review comments (Matt B).

V1 -> V2:
- Fixed review comments (Michal W).
- Updated commit message.
- Used scoped_guard for spin_lock/unlock_irq.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 47612e67d462..b8b391cfc8eb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1171,10 +1171,6 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
 			return true;
 	}
 
-	spin_lock_irq(&gt->sriov.vf.migration.lock);
-	gt->sriov.vf.migration.recovery_queued = false;
-	spin_unlock_irq(&gt->sriov.vf.migration.lock);
-
 	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
 	xe_guc_submit_pause_vf(&gt->uc.guc);
 	xe_tlb_inval_reset(&gt->tlb_inval);
@@ -1258,7 +1254,14 @@ static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
 
 static int vf_post_migration_resfix_start(struct xe_gt *gt, u16 marker)
 {
-	return vf_resfix_start(gt, marker);
+	int err;
+
+	err = vf_resfix_start(gt, marker);
+
+	guard(spinlock_irq) (&gt->sriov.vf.migration.lock);
+	gt->sriov.vf.migration.recovery_queued = false;
+
+	return err;
 }
 
 static u16 vf_post_migration_next_resfix_marker(struct xe_gt *gt)
-- 
2.43.0

