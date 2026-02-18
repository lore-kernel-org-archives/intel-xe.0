Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7040EE9A04B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3404310E2AC;
	Wed, 18 Feb 2026 20:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqvOIFYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145E10E62D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448195; x=1802984195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQ/pRLIqxF9cr6LseDDqgtFE7O7qMIRE9Z3o31T7mdE=;
 b=eqvOIFYnXRtfRAqM226hPCVRv9k/v+GRe5dpzC5A02yiteYcvWssVs/s
 NVAgKUA2ENCbI/9cAgNzzXu2+2WlHYDoO1wW6N9sP1q2xWzmtVLGeoztB
 InQxqZoyNBt9kTputCkO/CFTUR/DVaqg4wcpNoBifjm2gBCrfMoPDGFVi
 gH1wO0FyJfU6XG9yvwT93mtQlHjNM0zHu/TSRHs5qcvYgrc/TvWTJUg59
 s2lt8g9NPkfsWpqTefCb7qzeuP+TXvyTIHQk188J8qNfde1VJVaZ3vifE
 kg/FwUTfpowaXc0W342hvqs0ua6a0Oh+p7NVfrbRsSNPP/8ZvyOmhfTry Q==;
X-CSE-ConnectionGUID: WuUJfdIBQb+p7k6xJEZ9Uw==
X-CSE-MsgGUID: 8seBsffsRMKmAL+Ce0QRFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710602"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:35 -0800
X-CSE-ConnectionGUID: yegEldxnR6et/fZsFI9NaA==
X-CSE-MsgGUID: OaCmRQq3QXyfLxCJfkil6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548272"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 08/10] drm/xe/pf: Prefer guard(mutex) when doing fair LMEM
 provisioning
Date: Wed, 18 Feb 2026 21:55:50 +0100
Message-ID: <20260218205553.3561-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We will add more code there and with guard() it will easier to
avoid mistakes in unlocking.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 72cd46554230..d2a2201440b8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1945,10 +1945,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_lmem(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -1958,7 +1957,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
 				 "VRAM", fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_lmem_locked(gt, vfid, num_vfs, fair);
 }
 
 /**
-- 
2.47.1

