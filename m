Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70710A88EC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A910EB43;
	Thu, 26 Mar 2026 17:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdcVPR9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EF310EB14;
 Thu, 26 Mar 2026 17:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545351; x=1806081351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TwM5udQ5DjLraxPfu1+3zRARE+iggrPyNmwTCCS7RLs=;
 b=BdcVPR9PRb43fpwJT+EJAFy07eqZoe4ZaNgOhHyE3oDkmfVyMHMhYOkY
 tN03fZhEDklr75ZRVxGB8aIOqQC09AZwWUWUnMMhLhAEauL9q2S1vZa6L
 UQkQJ+RpiW8SCxDJH3pvBzNai/OiyDffTPQ5WLQlJHCuuVMdlXGiFygxa
 iu+rz68bf+wUvilDnC0k148u/9wTfTyV6+6Ojz7B8St0vGxyXqKh20QYB
 DQ5fOGBSO9KBpJepsLizR7iKTWWOHl17MhsOk3tTUOcr1X1qvs6aVwsiR
 R+Ci01ilE6RFzSdpU0SIOG9QbkM8FdUSQwtGYfYHNAyrmGrR45+oafkMW g==;
X-CSE-ConnectionGUID: 4Bqwj6IMSwm7dPHxnwolDQ==
X-CSE-MsgGUID: uOl2FyrMQpSk9oEartT+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630618"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:51 -0700
X-CSE-ConnectionGUID: Cha+Yy2xRKW+l6sr8mn5OA==
X-CSE-MsgGUID: 3rFUuKw2Tje1eq2wyDDdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975668"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:49 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 19/19] drm/i915/display: PSR set idle frames while exit from
 DC3CO
Date: Thu, 26 Mar 2026 22:45:57 +0530
Message-ID: <20260326171557.2065632-20-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

After 6 idle frames, DC3CO is exited and DC6 is enabled.
Reprogram idle frames so that the deeper states can be entered.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f3476118b8d0..dcf33359dc9c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1708,6 +1708,7 @@ static void psr2_dc3co_disable_locked(struct intel_dp *intel_dp)
 	if (intel_dp->psr.dc3co_eligible) {
 		intel_dp->psr.dc3co_eligible = false;
 		intel_display_power_set_target_dc_state(display, DC_STATE_EN_UPTO_DC6);
+		psr2_program_idle_frames(intel_dp, psr_compute_idle_frames(intel_dp));
 	}
 }
 
-- 
2.43.0

