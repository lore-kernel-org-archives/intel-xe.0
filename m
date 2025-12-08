Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8243D3B7DD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 07:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DAB10E3A3;
	Mon,  8 Dec 2025 07:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkTTZQ+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE8D10E3A3
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765178865; x=1796714865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kpiG3cdmBmbMzhoI8ZcTMtAPYDcVjGtRoJoVH4ykb/8=;
 b=nkTTZQ+Vkw4FvYCLNGjSTL3ko3tWivkJ6q8Zy8UinZVXZ6IyNlHaoIBq
 Z4Umcf/3BegcxzAW5B6IKkO4Ntg77yJYEFESn1trkRsx7RX5OpAoUvA8Y
 OO2P7fLzJ6xUjOCEaEzEil70EMPp6Yn3l7OtSMv+LQIpPZBM6IGIJ8AFH
 es1IjtHF7oU7AP8mCDcwPEVvAksXORx8ks0yiYmY7bX1NrnHrI/h4ojcp
 LkchkZmPk0FGk3ZdVNJLQ/NaVQ9WkFL1ufYMV5XPfK6tNt27Q3XxqJRoi
 jKo1nSBQJU+8GiFWprr/OJ9kOKoyTO/s1BruO0QIeOxox8coGTiuDxbPx g==;
X-CSE-ConnectionGUID: X3RiZwK7RlqgFYZrrTuUTg==
X-CSE-MsgGUID: vwPddvyPSVCe2/dNOX+4zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54658500"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="54658500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 23:27:45 -0800
X-CSE-ConnectionGUID: osCvCZaeTziW3tC7oXWRSg==
X-CSE-MsgGUID: pVcO2sGoRHKmA/ZYJOcAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195769573"
Received: from ksatya-dev.iind.intel.com ([10.190.228.51])
 by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 23:27:44 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 1/2] drm/xe/vf: Avoid queuing migration recovery if queued
 or teardown is active
Date: Mon,  8 Dec 2025 07:27:41 +0000
Message-ID: <20251208072739.336647-5-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
References: <20251208072739.336647-4-satyanarayana.k.v.p@intel.com>
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

---
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

