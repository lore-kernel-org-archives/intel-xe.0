Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B8FC6160
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 16:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A9310EBE4;
	Fri, 13 Sep 2024 16:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGT2SYbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D6810EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726244956; x=1757780956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zcDJLqEDmgAOsPDaZzXl4IKSesYpY/xIxeuiDhFi7vk=;
 b=ZGT2SYbGoySQ6NnuCM77zhwDVU83F4d/HzrOzdJeBUJLqr0PuP1L9CY2
 U9jGc+7vSM6mw+TW4dQALVRDVO1RhjQ55sKjTmxg9TIv0y4bgjjU3hrXS
 Ve+rX2TgjCfAkfqxrYPEaftIzLmtaa02u8B2UKGowmB+9jTBt2X66YwiV
 p/e01utbKxTpPwXmvpWaizxFGY9iNSlQgbjEGWlDg1K7Lq8s8PUk9t0vI
 DhzIS3SVMUAAYbEXYiYHLbxR+rlYfUklCBacAn0jfvmgZs8ag+IZHH86O
 4TuhESl20+vO69HugMckAmcT7oWrcWj/kvq8F6rOaLWsRGl+bGLyTybea Q==;
X-CSE-ConnectionGUID: rnRw3DkmTMS8QhpNqgBHsg==
X-CSE-MsgGUID: BDoA3YJzScaKOdtLuGjzbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24692392"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="24692392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:15 -0700
X-CSE-ConnectionGUID: b8uhj1PFT1+uokzvwUfaXA==
X-CSE-MsgGUID: R0tC1tYRSAWQPsZJB/zgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68440209"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH v2 3/3] drm/xe/sriov: Drop TIMESTAMP_OVERRIDE from Xe2 runtime
 regs
Date: Fri, 13 Sep 2024 09:29:13 -0700
Message-ID: <20240913162910.4145142-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913162910.4145142-4-matthew.d.roper@intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
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

TIMESTAMP_OVERRIDE is never used to initialize the GT clock frequency on
Xe2 platforms (and the register itself no longer exists on LNL) so drop
it from the list of runtime registers.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 924e75b94aec..a5bd577227d4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -173,7 +173,6 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
 	CTC_MODE,			/* _MMIO(0xa26c) */
 	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
-	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
-- 
2.45.2

