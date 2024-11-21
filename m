Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1ABD75BCF
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 17:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC4410E2DC;
	Thu, 21 Nov 2024 17:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8Kco9j+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D58110E2DC
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 17:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732211888; x=1763747888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mh3RHqFaCSVRRUyNK9gn3mx1DXsjl91n9TAaNKfmzM0=;
 b=Z8Kco9j+2GLyvttjiZBq7sXyb9XO3fEh7UlJ180NkRP3+P4ToIXENz4p
 uBH9bQj4mbbPJFt0TXh/MZv+CWVjTFRFOd3ZPidD8WI7noXtrpeiVvn+L
 9QBIXGV0j43JfoGWCRBmHCCHckb820SZg49UB4d2wdWVMtGJqT+mI26Y2
 sUenv8hOsMhZcbUU01vvLKmWf8snjms4dToAg11gdaZ6fPSSYS9pBt78q
 L8+cE2Wel5ONJqm4jm+bDFcZomtE/MNyBGIsuVwPFLSTioUw2vIy6DKcA
 NtUQUMcgpvK3a+mvIFGKIgXeeBWWM01x7e55vLfIFU1kIpe/woJ+lqVVm Q==;
X-CSE-ConnectionGUID: NORmIYPbTJSVcf5JnAVSzQ==
X-CSE-MsgGUID: /eICusJcR2qdJ6u3ktBEZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32489205"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32489205"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:58:08 -0800
X-CSE-ConnectionGUID: QRWMSfepToqG6/XfVZ1BDw==
X-CSE-MsgGUID: hkxOTCaIR42keQkpaVcjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94414614"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:58:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH] drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
Date: Thu, 21 Nov 2024 18:57:54 +0100
Message-Id: <20241121175754.302-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Since commit 678ccbf98796 ("drm/xe/vram: drop 2G block
restriction") we are able to provision VFs with more than 2GiB.
Drop our temporary limit of maximum fair LMEM size that was added
just to avoid hitting -EINVAL from auto-provisioning.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 8d84d2a9ab1e..65082f12f1a8 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1545,8 +1545,6 @@ static u64 pf_query_max_lmem(struct xe_gt *gt)
 
 #ifdef CONFIG_DRM_XE_DEBUG_SRIOV
 #define MAX_FAIR_LMEM	SZ_128M	/* XXX: make it small for the driver bringup */
-#else
-#define MAX_FAIR_LMEM	SZ_2G	/* XXX: known issue with allocating BO over 2GiB */
 #endif
 
 static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
-- 
2.43.0

