Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F14C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 21:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6C110E0FF;
	Fri, 31 May 2024 21:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUByEIM7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5560D10E0FF
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717191831; x=1748727831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P/aG2exls9E4BvkCliRlSoQYROamhfUKqYk85WzPUDg=;
 b=nUByEIM7T+TXZqP7CMD+gbNqHQwFyuYEUX8e9gTgPMKIWFtwRfLTChRL
 jyrLX5dwOA6JllGnXuTkvUEbDYyXf7kjYnRkufLzPUtx+L5fO/q30nAbp
 cfKDM9x/9Bcv0PIpQCCmrm9fKNk1rnoQ9cjZsaij1nrLzYZMFctuSwf2P
 AlS6DOpbhT2OpeLi5yKX23VZMKSZHaAeNpFAuZK0j1NwihoAwJ/jvgCvO
 rvq+Mnun5UtfmJX+8C5x14au3RBVkPfkIK34LgHOC3Q2nD4g6HeJEQsZ5
 DPZWLnJFjf2Hlui58jxMybsRhYC7Eu3n/0Xpe9aNGqDbcEvqjDYjgE8Sl g==;
X-CSE-ConnectionGUID: 0GXovZUxQ/6RKhV8xVPVbA==
X-CSE-MsgGUID: RBgQzNusQNuAUNFDmg6ZQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16706789"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="16706789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 14:43:51 -0700
X-CSE-ConnectionGUID: rwbFs//TRLSHLb4BNXFrlg==
X-CSE-MsgGUID: fo5yUdW4TeqzzFuLetjLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="40726531"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 14:43:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe/guc: Request max GT freq during resume
Date: Fri, 31 May 2024 14:42:32 -0700
Message-Id: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

We already request max freq in the load path, moving it
to __xe_guc_upload will ensure this speeds up GuC load in
the resume path as well.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f7886c00af01..63e1b685bd4f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -694,6 +694,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
 {
 	int ret;
 
+	/* Raise GT freq to speed up HuC/GuC load */
+	xe_guc_pc_init_early(&guc->pc);
+
 	guc_write_params(guc);
 	guc_prepare_xfer(guc);
 
@@ -779,9 +782,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 
 	xe_guc_ads_populate_minimal(&guc->ads);
 
-	/* Raise GT freq to speed up HuC/GuC load */
-	xe_guc_pc_init_early(&guc->pc);
-
 	ret = __xe_guc_upload(guc);
 	if (ret)
 		return ret;
-- 
2.38.1

