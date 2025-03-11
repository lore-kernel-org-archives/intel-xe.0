Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D0EC35FF1
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 13:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757710E252;
	Tue, 11 Mar 2025 13:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFGnk8z/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D4210E200
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701460; x=1773237460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9YihiRxLNwCR5AK40VBKZRylbDmFD+v1tMuR/18Dm8=;
 b=lFGnk8z/eE+HgmNOIR2DpYrp6bKjilC8PjXMlYc74ffYRCk3Bxvvi63E
 oV+g6QZpJQxcdJcDqwN8HqGEjdpx3rHVA7a7jF+P0tQFux12ocNn11BS+
 MqX9y0GmWzyipD8gjZcWoJcgdduUpzHujWHwwtrA1SaC5+4YZ2ToSykUw
 ltip4/8TCl1oyh+J820hyCDTJnQCoeA3acdN93pIFyIh2VfQk8gdVF2x/
 v0iB099HG5QI3jcxiq176OitNeRASqRsynb3fe5THVrs2UoIbnSOXGf9C
 zy80M+k8leG1NWomGXO7zDeu9dF4GlUz5x02WjI3oUIrDtDVC/PyL1OFL w==;
X-CSE-ConnectionGUID: hpjJcZw2TVGIAufChf/Q5g==
X-CSE-MsgGUID: hpaqKYp7TiKO0hsksdi2EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54122586"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54122586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:39 -0700
X-CSE-ConnectionGUID: 2TJr7dRWSMePw6YgqlSGZg==
X-CSE-MsgGUID: GIGcUYV1TjiKrp3WVcDnOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="121034403"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:57:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Catch all unexpected register reads
Date: Tue, 11 Mar 2025 14:57:26 +0100
Message-Id: <20250311135726.1998-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250311135726.1998-1-michal.wajdeczko@intel.com>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
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

While we can only mimic read32 for a few GT registers for which
the PF shared the values, we shouldn't avoid calling helper code
if we try to access non-GT register, as then we miss to trigger
a debug warning. For cases where sriov_vf_gt was not set, just
use primary_gt instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 70a36e777546..13e06a956ceb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -204,8 +204,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
-	if (!reg.vf && mmio->sriov_vf_gt)
-		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
+	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
+		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt ?:
+				       mmio->tile->primary_gt, reg, val);
 	else
 		writel(val, mmio->regs + addr);
 }
@@ -218,8 +219,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	/* Wa_15015404425 */
 	mmio_flush_pending_writes(mmio);
 
-	if (!reg.vf && mmio->sriov_vf_gt)
-		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
+	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
+		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt ?:
+					    mmio->tile->primary_gt, reg);
 	else
 		val = readl(mmio->regs + addr);
 
-- 
2.47.1

