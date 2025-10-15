Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4787BCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D1410E8FF;
	Wed, 15 Oct 2025 22:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WB1sJ9td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F73F10E8FF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VE6xoBlH2a+VX0sk1Vh42dEf1b3l8+OiLy1m7ON6zSY=;
 b=WB1sJ9tdfMpmWxxkEi9BjhEvO1NBW1vXURcNeqJj3hkNsT+7fgJoO4ms
 ZS5ka+9ZO12eIjrawp/x/VnMXnlESIt2YetKKAc0vnRww7Pn9w7A0fRi4
 bResJeCuziLkaXb7jadZ8pSR1xafDzUrAK+kCWIEbZXOQX2YJr8tBSfCi
 G38wcnwnY5uVWhmRaDwuCkCKhXhxmIpyMDKkVn+EJehnXj7L2N0P1SXdV
 PFxqj176WWs/+aICjLQrdxZkVqbUu/4RPmSKSFtD6KQa/CrePl4Bg0Ghx
 mz+noT/j3l+a59nI/CYC60syP2h/pbuQe6JULspRI+XtTcVOqWXYC7Q1k A==;
X-CSE-ConnectionGUID: VffoFAw4QO2BzoZLOFDmqg==
X-CSE-MsgGUID: RDostTh2RuKHjqdo3gw9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794052"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: upv4lxByTBWMenlWDpMHIQ==
X-CSE-MsgGUID: xlh8guEjSKCPl13MSQUIlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298280"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 07/22] drm/xe/xe3p: Stop programming RCU_MODE's fixed slice
 mode setting
Date: Wed, 15 Oct 2025 15:06:22 -0700
Message-ID: <20251015-xe3p-v2-7-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Matt Roper <matthew.d.roper@intel.com>

Since the hardware load balancing is no longer supported, the
programming in RCU_MODE is no longer necessary.

Bspec: 60382
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index cba4375525c7e..b08a6d42c8ffc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -350,6 +350,13 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,
 						 const struct xe_gt *gt,
 						 const struct xe_hw_engine *hwe)
 {
+	/*
+	 * Xe3p no longer supports load balance mode, so "fixed cslice" mode
+	 * is automatic and no RCU_MODE programming is required.
+	 */
+	if (GRAPHICS_VER(gt_to_xe(gt)) >= 35)
+		return false;
+
 	return xe_gt_ccs_mode_enabled(gt) &&
 	       xe_rtp_match_first_render_or_compute(xe, gt, hwe);
 }

-- 
2.51.0

