Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1829CC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 23:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B410E064;
	Fri, 24 May 2024 23:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvvvBkeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E152310E064
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716591888; x=1748127888;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6wTNP1c9WuwtjVvcupFmp3Zc/tNAvaFdEyHTf1RGDYw=;
 b=jvvvBkeCk3o9ioI0ughdAjQaREXfHLXVTA2Lwx9nrFE5VXWx8KIBDyBs
 hKMAZ+R6XiPoFX1xFFAbdHma0gdsUKa9aqIzUDv4L7qzqJC/Vd1fD/jZ3
 oiYVS1snLy8xMhgmJGL9ivbM7tth2oKQRZA/fjQhJ8UU0PnPrSPibS/Rd
 MhJJ1sISDcg448XQM81CBhgat1NpvomoHEAkRjLiLpPQo3UIjAcqgtfKA
 r/N9Co1T/ytqAEI46UoP/L31ACNKJ/UyyMfBSd/ALXqiLoccRaZ9flzu8
 TZhZWOfiDP1nYgCWLDvvQ1UShjkejREhhTyUSst1Axr4bcYUiOJq3rVAp A==;
X-CSE-ConnectionGUID: dpU3UGY7RKSUB4X9sjU1VA==
X-CSE-MsgGUID: pSxcUiXUT2OsLgr6PaMiWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23589376"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="23589376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:04:47 -0700
X-CSE-ConnectionGUID: q1QpAqdxSo+ZXylDlv+y3w==
X-CSE-MsgGUID: hFlqeFODR620VtLnKtZ3Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34083530"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:04:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Don't refer to general LRC initialization as a "wa"
Date: Fri, 24 May 2024 16:04:45 -0700
Message-ID: <20240524230444.1447797-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.0
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

During engine LRC initialization a number of registers need to be
programmed as general setup.  This programming is not a "workaround" so
naming the RTP table as "lrc_was" is misleading; switch to the name
"lrc_setup" to more accurately describe what the table is actually for.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index de1aefaa2335..9eef789be897 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -342,7 +342,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
 			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	const struct xe_rtp_entry_sr lrc_was[] = {
+	const struct xe_rtp_entry_sr lrc_setup[] = {
 		/*
 		 * Some blitter commands do not have a field for MOCS, those
 		 * commands will use MOCS index pointed by BLIT_CCTL.
@@ -374,7 +374,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		{}
 	};
 
-	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
+	xe_rtp_process_to_sr(&ctx, lrc_setup, &hwe->reg_lrc);
 }
 
 static void
-- 
2.45.0

