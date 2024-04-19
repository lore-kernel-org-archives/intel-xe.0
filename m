Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BF1C071FD
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 18:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5155110FFC6;
	Fri, 19 Apr 2024 18:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lavM8UdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6E910FFC5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 18:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713551662; x=1745087662;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWN+EiLMhYl2IDSt1ZeQyCISxPqQMok8mL0CZerOkUw=;
 b=lavM8UdU45cJvZVZWY3h+PZGPlPvCOucN8xhl73nv85usxk4v48+xH93
 WW8Hd9r4QZR1h70YGlMfxNXjZukLl59YBpzioHQcSHpkVpe9xAjR83Uov
 uMhCq2idOHd7grYqZUCzn1BRuIOxGKPTxAOOqOgV5Tll1n4vgaDvkKxi6
 JECT//xMlHNt6wFdQL5MteIUttMB8Xspj+XbUJ3l3eZ6RrIV9YdKJtJ/f
 eP4vl99Et8/reScShP65ENEFV9JBXzP8HISKvFt3UtXZyxmQ9h5SL/Ee9
 rR2eu1FW7bITL1C5oYdt8gxCcxQcnzGiDOqMzEvDeefInLHeMn2gEkUpx A==;
X-CSE-ConnectionGUID: k4z98TTdTfGkMxfpOCJYtw==
X-CSE-MsgGUID: /q7R96chQD61dhC7M7KjmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26681786"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="26681786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:34:21 -0700
X-CSE-ConnectionGUID: XAuzSBuDTyyPZsvbogpr1w==
X-CSE-MsgGUID: n11653HEToulHWB++az/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23392425"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:34:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/2] drm/xe/gsc: Turn off GSCCS interrupts when disabling the
 engine
Date: Fri, 19 Apr 2024 11:34:11 -0700
Message-ID: <20240419183412.1605782-1-daniele.ceraolospurio@intel.com>
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

Starting on LNL, there is a new GSCCS interrupt that is triggered when
the GSC engine reset fails. If the HW is in a bad state, this interrupt
might end up being triggered even if we're not using the engine, which
will lead to a warning because we'll see it as unexpected. Since there
is no point in handling the interrupt in this scenario, we can just
make sure the interrupts are off when we disable the engine.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Tested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 455f375c1cbd..9d2142fd75e2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -716,6 +716,11 @@ static void check_gsc_availability(struct xe_gt *gt)
 	 */
 	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
 		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
+
+		/* interrupts where previously enabled, so turn them off */
+		xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, 0);
+		xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~0);
+
 		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
 	}
 }
-- 
2.43.0

