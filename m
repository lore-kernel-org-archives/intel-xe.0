Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27807D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 05:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE38F10E218;
	Wed, 10 Dec 2025 05:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9OLX1yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B39810E218
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344352; x=1796880352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t9XctcGmvW2vf0khaRb7VR9SebEif/kM2rRN0VADR7Y=;
 b=d9OLX1yo3S7OSrchNJ6hamiE6+TO2ulU4g5h4sJQWbFRLO8I2k3UA3+E
 hipLReFHhT/He1//itC6IY6I6cW1PMmmpfe0yihGgkVYlgZIgTfvpONVy
 S3tS69iGYV5hqMbTDMB7bkMUtLIYzUKtfCeF50is6DaXPrr9Tva4NEF4e
 Z6GJL/7WHe/LPau1QhguXfAB2tgBsasPaIaOmzBRi3iGMYKfjTjRicW1B
 HX0BfbAxhbTGhN5n+xIXJe5zM88NxUvkuSigwvKPR798Afkyah192+VLY
 8A1x5sCvhzRdELvshmQYbqBqxedG4gfp6JZFfEyj7uYNviklD3TvSbAF8 w==;
X-CSE-ConnectionGUID: B9Q6x0AsRiCZ3vhomJRrjQ==
X-CSE-MsgGUID: 71kTqRy+SRGWUwHECs3v0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84723066"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84723066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:25:52 -0800
X-CSE-ConnectionGUID: Pn/DuGvxQ5KYsJqGbpbqRw==
X-CSE-MsgGUID: BEawOivxR9mb8mZrMCPYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196419995"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by orviesa007.jf.intel.com with ESMTP; 09 Dec 2025 21:25:51 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 1/2] drm/xe/vf: Fix queuing of recovery work
Date: Wed, 10 Dec 2025 05:25:48 +0000
Message-ID: <20251210052546.622809-5-satyanarayana.k.v.p@intel.com>
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

Ensure VF migration recovery work is only queued when no recovery is
already queued and teardown is not in progress.

Fixes: b47c0c07c350 ("drm/xe/vf: Teardown VF post migration worker on driver unload")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

---
V2 -> V3:
- Updated commit message (Michal W).

V1 -> V2:
- New commit (Machal W & Matt B)
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 3c806c8e5f3e..47612e67d462 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -781,7 +781,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&gt->sriov.vf.migration.lock);
 
-	if (!gt->sriov.vf.migration.recovery_queued ||
+	if (!gt->sriov.vf.migration.recovery_queued &&
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
-- 
2.43.0

