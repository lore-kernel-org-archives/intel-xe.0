Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FA1C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 13:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A4D892AE;
	Mon, 26 Aug 2024 13:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QACthRyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FB8892AE
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 13:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724678570; x=1756214570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0AYbwlXAiC6X15gOdNEvtGs/VYKIfjpizATqiinZ16c=;
 b=QACthRyN0PpJbAzliC5v6AlLV6Yn/HBBYlooCVMdKtIDMun37aw/rwy/
 dAASRLwVsagnZccR/QdTt/GMSrG5eMq5Tck770MLF+rrJA28XECvEqSLs
 0wZC2BH5ZMLlR/r/vOD/6KAotC7u1dXJRKAZYU51VSID+0yyIvniTJ12i
 AIDwF3uCsdVezi7HJbElMCwwopAwmiGt++JO0/7c6aOTOjY8Tm2+6Yhny
 BxKLstnUK5UV/4jiC+/ObVAKFbwMosurZxfYjNhHP9TF6enSXs8nzhmoJ
 oeS2iRqkN6gju6Yw0Iu5eM62ISH4gekWTfYRDQ7yvCFkjktfdTNYmQDAJ Q==;
X-CSE-ConnectionGUID: mDtOkXmrRcmdf4CE+I2tgg==
X-CSE-MsgGUID: z5RwEn0dSLyyC/RA1fPdVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23230565"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="23230565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:22:50 -0700
X-CSE-ConnectionGUID: 91yHVE7jQne3h1C74Lf6+Q==
X-CSE-MsgGUID: Z3mLs17ySfGZb6ypiyxO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62570491"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 06:22:47 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
Date: Mon, 26 Aug 2024 19:06:33 +0530
Message-Id: <20240826133633.129853-1-karthik.poosa@intel.com>
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

WRITE_I1 sub command of POWER_SETUP pcode command takes param of u16
instead u32. Corrected it.
Without this pcode may return illegal sub command errors.

v2: Mask uval instead of changing the prototype. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 832ea81faeee..1faeca70900e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -450,7 +450,7 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 {
 	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
-			      uval);
+			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
-- 
2.25.1

