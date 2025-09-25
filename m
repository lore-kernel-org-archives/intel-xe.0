Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5296ACCD182
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD1010E099;
	Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtIPPZTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1B710E9C7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844008; x=1790380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BPz7zhw86PMmYXr0DNBMdZ68opioYpcpUzZjoPP53YA=;
 b=GtIPPZTlXTuIuFB9tX39Zd0O4H/AOX9LNzUHj3y5lKTnZPFEwwWTVmCs
 +ArdswhXMuf/hn8m1EI4wtgZysuidEQYXNtLj6GmaIEfghRmh/2ztl525
 PgE2Hrc5Bgb1sd42TifSV/RNVB2TL2aBx/sd7Ucu+WHQfOwQMnTwfZ1IF
 I83lsGBnl9qyeclxW2Vda/YtDA8ac4n5pa7pFvestXEsgQA50N5DkRj2+
 K4V3G1pnxSsWHC2UHsGsiVnH6npTrBDT2Pqr4PIdX0taObRu5BBDBAfPy
 gWwpgpRe1JY8xBZ8WiX/YFz61ZNO/KDskyb3Q1J+cSMwkfuHAbEMWvQso Q==;
X-CSE-ConnectionGUID: FKWfcO1XQMSo0U/gUndmlg==
X-CSE-MsgGUID: Np0fMRMOQtCRME4KfqUH1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817681"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: DMG2D7ckRVCLbIZdlPsV4w==
X-CSE-MsgGUID: P08ZvNVOSyi/cUxmYrPJcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181853003"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 19/22] drm/xe: Don't check BIOS-disabled FlatCCS if primary
 GT is disabled
Date: Thu, 25 Sep 2025 16:46:47 -0700
Message-ID: <20250925234628.2112163-43-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

If the primary is GT is disabled via configfs, we can't read the GT
registers that would tell us whether the BIOS has disabled FlatCCS on a
platform that would otherwise have it; we'll just proceed as if the
FlatCCS is still enabled.  This is similar to the situation seen by
SRIOV VFs and doesn't cause any functional problems since the hardware
will simply drop writes to the CCS region and reads will always come
back as 0 (indicating uncompressed data).  We'll simply miss out on the
chance to avoid some unnecessary overhead during BO creation and
migration.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bf99792e772c..0b4fa7769f05 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -781,6 +781,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
+	if (!gt)
+		return 0;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-- 
2.51.0

