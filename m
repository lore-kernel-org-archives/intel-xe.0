Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EA1D6A225
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 18:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9CB10E36E;
	Thu, 14 Nov 2024 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1m4oAL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527BE10E023
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 18:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731607214; x=1763143214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5sn0DmgwqCyh82lsA7Iw4cCH7xMZLYPABObyOMsbkKU=;
 b=h1m4oAL0CKs2OIFsLTuhZVzbacJ+s6+mUfuPR9kdLtukGvfMuY8EtSc9
 fyJMwEMHpeC5WkLedd9HHDdpTj5/xdmbfZSuhtzIVZ8hVf4AzgzhUyAWT
 WbneHTbmFIPIX3vDaXrza+OY9Kw7YayBEf79E+tUnKQq/TkQkkPUM5mIP
 QBNLifz44XDUXX18vNoVuujjeuiLGptvxJiSRrbVKv6lp1nv2JpNnE7We
 s57cjom93uAXMLYtlpoafwNv13m0x5BOXYiqfoQ2LFVaXYf9yAzEGqcbs
 KgNIpH8Eq257ThKHNmav3VahVNV/yksohTuGBQVtLoXbSG+dPitg+mP2F A==;
X-CSE-ConnectionGUID: CD1+ROMhSLiBni3MnG9RIg==
X-CSE-MsgGUID: G1Y4aRKKR0uDX1LYdeurZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35290763"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35290763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:14 -0800
X-CSE-ConnectionGUID: BpROzw7eQSysuKKboHWXuw==
X-CSE-MsgGUID: VVK9hU2OTnqq9QQAubhpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119224719"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:13 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
Date: Thu, 14 Nov 2024 18:59:54 +0100
Message-Id: <20241114175955.2299-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241114175955.2299-1-michal.wajdeczko@intel.com>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
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

While we believed that xe_gt_mmio_init() will be called just once
per GT, this might not be a case due to some tweaks that need to
performed by the VF driver during early probe.  To avoid leaving
any stale data in case of the re-run, reset the GT MMIO adjustment
data for the non-media GT case.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d6744be01a68..d45d2cecc4dc 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -643,6 +643,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
 		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+	} else {
+		gt->mmio.adj_offset = 0;
+		gt->mmio.adj_limit = 0;
 	}
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
-- 
2.43.0

