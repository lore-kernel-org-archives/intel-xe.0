Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E87FEE4F5
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 19:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002710E1AA;
	Sat, 28 Feb 2026 19:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jjy2kvG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03010E1AA
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772305690; x=1803841690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxQV//ZuipNl0qnyq6zWhtkKEofOnt9EMHQNtTJo9aA=;
 b=Jjy2kvG8EEp46l/lOU0ftwyiQL9nQlcc5gas1ni1rnhRyy49vPVMSODI
 W2YZcYkr884kHdCYZgAr4rRmT2Alu8B/9cNRmBkLUdTEl8yebIhZNpvlR
 WBnZjWsfSp8PJfVn6E71kf2U2c/X2V2sxiZwYdR2zZqFzaBYbZIYxSZd3
 54d2o5ExsSYbV64clnSoR3R+AUlBduAjYhkvi5fTdCcb3ZbovkTIGc3jL
 +RDXUAbTdHBC0JzCKifV2M2ohv8PBaiWjBCUoKQW4KGEhjrtRmcE+w4w5
 jEPF8/9BWDL/TGJu1sjNDK3R2T4FjKL00jO/F3Hzf2yc231BERhQPW1UZ w==;
X-CSE-ConnectionGUID: LXUAzwPFQmKDMqbFhrvJBw==
X-CSE-MsgGUID: UtkKS0WDQEWchh+AZ0qjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="77207382"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; d="scan'208";a="77207382"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2026 11:08:08 -0800
X-CSE-ConnectionGUID: yv5fSW73Qmi7CbfPfmDqig==
X-CSE-MsgGUID: uEVTt9irTa+f16haZ/pZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; d="scan'208";a="216452036"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa010.jf.intel.com with ESMTP; 28 Feb 2026 11:08:06 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lukasz.laguna@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/guc_submit: Log wedged mode correctly
Date: Sun,  1 Mar 2026 00:35:02 +0530
Message-ID: <20260228190524.3471743-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

The device can be declared wedged in basically any wedged mode. Log the
correct one that is set in device struct instead of hardcoding it.

Fixes: 17d3c3365ba9 ("drm/xe: Validate wedged_mode parameter and define enum for modes")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index de716c1fb18e..4c761087c830 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1319,7 +1319,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
 	if (err) {
 		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
 			  "Although device is wedged.\n",
-			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
+			  xe_wedged_mode_to_string(guc_to_xe(guc)->wedged.mode));
 		return;
 	}
 
-- 
2.43.0

