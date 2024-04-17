Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55136C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1FB10F6EC;
	Wed, 17 Apr 2024 21:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlGBhTdB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7DD10F6EC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713388354; x=1744924354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DnPPo0wH3NO3ePQrot7NEVz8L7S8ywLCjH4AJvI3RbU=;
 b=YlGBhTdBko8m4UrWYVHOST8xoQWFyB77jK0b4fatIs5UtCTOyPdK3g8Y
 YRZnWi+hZINKXI7BHaAFwWSEV6AyhpmtrL2BMpM7X0OwERPrSdYc8iokf
 sGGYIwosKbOuf+93mWMUX7wX0VAqv73f+t5rq4U880cFM3SkvYXcrs3w3
 SXsvfLHjWndT3Nl5TflIvL1R2Eeb9ZILBxRjcDHUciiApsOzYWa5j5I1m
 d6rpGGRf0LZyPkxX6DcC+Fyr8+ob8LBlLOPrf+u14Quiq+F7ewalHHYXQ
 br3i9NUbuCgFepizgcpTfKNbF7XNcRV1SbEbpuc98jg45Ctk4VhjRFVgf w==;
X-CSE-ConnectionGUID: nMRhvI7SRMiv10B/qCwo8Q==
X-CSE-MsgGUID: mP/zoNCzSYSggE1BsXPtuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26412680"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="26412680"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:12:33 -0700
X-CSE-ConnectionGUID: +mV0Qjv9T0eCN5TUFbq2Tg==
X-CSE-MsgGUID: l/2NIDqHQgaBc7X3dvN/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22793407"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 14:12:33 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/gsc: Turn off GSCCS interrupts when disabling the
 engine
Date: Wed, 17 Apr 2024 14:12:23 -0700
Message-ID: <20240417211224.1359313-1-daniele.ceraolospurio@intel.com>
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
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index a688bb2d96ce..b9c5690c4d96 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -720,6 +720,11 @@ static void check_gsc_availability(struct xe_gt *gt)
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

