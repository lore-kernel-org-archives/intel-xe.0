Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754EFC5DF70
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E44710E372;
	Sun, 16 Aug 2026 22:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esO1I6p8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579AB10E37B;
 Sun, 16 Aug 2026 22:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920035; x=1818456035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rS0vA+cwyVGqLqKWN6fB6aS+JKL+iPwJulXBZIZI2JU=;
 b=esO1I6p81GaakI0jBq8DEWzqFDWJkL2Hk3dFhxBPQRd2GYUow6Z3/5bX
 PC0b8cFWGE09HxxFbrx8Ydw23UnbePiGmcvgTpD5a8Dtr4Xky+O+aUb0M
 C7AbpOE2o3C6thUa4grRTl9m5LNhfDegyboLx2sAdtjoGCBHiimmRcJ/C
 aAKgqRZIVGCHEJI07E755oVqkAR8RxzyVpL7/HodsPQy1JXcRF78b4NRk
 DywJBI+21GxZQTxgTNt8vIeORZW2ULLuPGDZ9nMLfthHHG53XcbsZPhIt
 UU/Gc1bekvdyDQoh4PZrTB4MpRpaJqjQorx40xB+L18mbgZYYh+YV2MUc A==;
X-CSE-ConnectionGUID: C2atLY9JQm2dXiJeRwdJ4w==
X-CSE-MsgGUID: /6fiOrwQRGedw8OSAta21g==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761690"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:34 -0700
X-CSE-ConnectionGUID: m+VWwF7eSmuvuEjHqu2eiQ==
X-CSE-MsgGUID: sxCAKShFSQOWivNCujvUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948377"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:32 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 4/5] drm/i915/display: add intel_hpd_polling_enabled()
Date: Mon, 17 Aug 2026 01:40:03 +0300
Message-ID: <20260816224005.886035-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Expose the HPD polling state so the runtime resume path can tell
whether polling was enabled on suspend.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_hotplug.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 970aa95ee344..cc3aabbff687 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -932,6 +932,17 @@ void intel_hpd_poll_fini(struct intel_display *display)
 	drm_connector_list_iter_end(&conn_iter);
 }
 
+/**
+ * intel_hpd_polling_enabled - check if HPD polling is enabled
+ * @display: display device instance
+ *
+ * Returns true if HPD polling is currently enabled.
+ */
+bool intel_hpd_polling_enabled(struct intel_display *display)
+{
+	return READ_ONCE(display->hotplug.poll_enabled);
+}
+
 void intel_hpd_init_early(struct intel_display *display)
 {
 	INIT_DELAYED_WORK(&display->hotplug.hotplug_work,
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.h b/drivers/gpu/drm/i915/display/intel_hotplug.h
index edc41c9d3d65..b17fdeb808ca 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.h
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.h
@@ -17,6 +17,7 @@ struct intel_encoder;
 void intel_hpd_poll_enable(struct intel_display *display);
 void intel_hpd_poll_disable(struct intel_display *display);
 void intel_hpd_poll_fini(struct intel_display *display);
+bool intel_hpd_polling_enabled(struct intel_display *display);
 enum intel_hotplug_state intel_encoder_hotplug(struct intel_encoder *encoder,
 					       struct intel_connector *connector);
 void intel_hpd_irq_handler(struct intel_display *display,
-- 
2.43.0

