Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4708BD58E47
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 03:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF3D10E350;
	Mon,  2 Mar 2026 03:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nxe6X7cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285A710E077;
 Mon,  2 Mar 2026 03:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772422666; x=1803958666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ru2laCQHS41AQNp5VQ+pIQ1d2rOjkozF7jqTxX82BKk=;
 b=Nxe6X7cLQl4n5sduyjCAmxsXqaX2w6VKmqyWKQ4Ake0Q/mrwYxFiWxs7
 qVVw1rcdTV0dsHMmAHXyJyynORfJj6fKmETpfOP5EerBeIhBxJDVhxETL
 wLbFuucMGbnB3+F0/Kpkw4gd5QLzm4vxuWqD4AWM7s4u3HUtTmEf8g+fX
 XJNpWhiYAYowb75KKeGtOFdIZl8Voj+NC6MPaNPHxQy1SiKWLpIFPROkt
 teQfnZ7f+eSngA+Zv5J6vTOOO5g90Fs6MrYCbSO6ow50xqKdRrwgNeJbf
 R/t0s1sSq2pEoNftRt640pmhnFMh53OFG90+AbUVrkFoKmDxLgMpcI3c3 w==;
X-CSE-ConnectionGUID: PUd2mIABSWGrCVp7/oeHnw==
X-CSE-MsgGUID: r3sTm2K7SNyq/YoRSMi/pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="91000141"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="91000141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 19:37:46 -0800
X-CSE-ConnectionGUID: FqhIgxcxTtK8btoSUM95kw==
X-CSE-MsgGUID: amcBKp4JTEe+4iwuCZL1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="215206569"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2026 19:37:43 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, ankit.k.nautiyal@intel.com, jani.nikula@intel.com,
 jouni.hogander@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/dp: ALPM init to be done after DPCD init
Date: Mon,  2 Mar 2026 09:06:30 +0530
Message-Id: <20260302033630.428913-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

In ALPM init, the DPCD register ALPM_CAPABILITIES are to be read. This
read has to happen after the DPCD init.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 613559d11133..e60802b0b8c9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6948,8 +6948,6 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 	 */
 	intel_hpd_enable_detection(encoder);
 
-	intel_alpm_init(intel_dp);
-
 	/* Cache DPCD and EDID for edp. */
 	has_dpcd = intel_edp_init_dpcd(intel_dp, connector);
 
@@ -6961,6 +6959,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		goto out_vdd_off;
 	}
 
+	intel_alpm_init(intel_dp);
+
 	/*
 	 * VBT and straps are liars. Also check HPD as that seems
 	 * to be the most reliable piece of information available.
-- 
2.25.1

