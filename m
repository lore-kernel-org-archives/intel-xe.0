Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E32D4662F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 22:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DEF10E7CC;
	Thu, 15 Jan 2026 22:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+KZC7SM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B310E7CC
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 22:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768517024; x=1800053024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kYJrZVvQubgRYS0hgsfMLsTXma7gnD0K4fXo9beOYRw=;
 b=N+KZC7SMMJ81WDjs+C6DDEv1pzJR+EmeQC1Va+7ThKK0i5r2DW579AIh
 Q2JfdNBjFu4fRdZWdZ7KvMm3K+6Pec5+qHvQq99Ku8ru8onehX2FdbXEh
 J/EmAfgHZKRUzlXuXlIaTGermOHCfM0jmARoVbuWz8KmkXnEOPboyfl/Q
 cJ/YPVrs0p0s6ir/3k+C8P6O7m5pvXJJox31vfdzLENPbhf6tfjWaxsUs
 PkrpYsMviqXht1qaNYmQ87WBXKPjQD27+/sEf6BYvfPAseY0SSoCr1l3k
 8XPEyIzYtZGluSRqUcm+NUAvwIyaBmqnZPu38NbAFV/DBOoPFQXGEkVVR A==;
X-CSE-ConnectionGUID: Y3EdBLpdS928nxqpLrfd5A==
X-CSE-MsgGUID: y3hdP++UT2mkUvtEhHtSUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69037139"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69037139"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:43:44 -0800
X-CSE-ConnectionGUID: 633UoK2uSYmXLftX4z0IOg==
X-CSE-MsgGUID: 0MENktXvQ4SxKIa3pB0rRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="204274195"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 14:43:44 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe: Add GSC to powergate_info
Date: Thu, 15 Jan 2026 14:40:39 -0800
Message-Id: <20260115224040.2668209-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
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

Add GSC powergate status to the existing debugfs.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 24fc64fc832e..7d3ec1fe4f7f 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -367,6 +367,7 @@
 #define FORCEWAKE_RENDER			XE_REG(0xa278)
 
 #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
+#define   GSC_AWAKE_STATUS			REG_BIT(8)
 #define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
 #define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
 #define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index c1c9bec3c487..52436dcb6381 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -255,6 +255,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
 			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
 
+	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)) {
+		drm_printf(p, "GSC Power Gate Status: %s\n",
+			   str_up_down(pg_status & GSC_AWAKE_STATUS));
+	}
+
 	return 0;
 }
 
-- 
2.38.1

