Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF2CC88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 09:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBB410F3A3;
	Tue, 15 Sep 2026 09:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="An0Rzayf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C7610F3A1;
 Tue, 15 Sep 2026 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789464364; x=1821000364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1Jjc1H6lSCN6Defskc9Qtk8JbSr5ZdAl17rMvs7tBg=;
 b=An0RzayfBMviVxoLVDhhLdmvZwZ/cFZGXUz96WCSV5Q9tjXflMTS5L5A
 JV+UT00u74X/AxV1Cqvscv2FJEl4HAKEjX8nO71NUzpkSco2dMluOzvZF
 BGnrcVqg3dHoNBXyM67IFmNM4L1wuK1uCIr0acpWDSvhtELUrgUr+3AW/
 TJr8jScHrsPPvocXpJjliL1Edpoqw6/s6Z2hA8Nq5H3InJIrd+Pw0DqEq
 b0R50pcvn3Twuh3BxAhCLFqml8gR80JBw7+YfCpWRojgg/lyPMe7cJMc/
 0t2ojXggCJVjQrVS3kFZqCYFupohjYI/gXlL8CRRM+r+yFUgYK03E7/7X Q==;
X-CSE-ConnectionGUID: Ot2PYdIPSoG5w0Ht6StSpg==
X-CSE-MsgGUID: rXANMSS5Tra8h7b4y4VxIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89581877"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89581877"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:53 -0700
X-CSE-ConnectionGUID: xzRPluADSNSdw3L7nd2CGA==
X-CSE-MsgGUID: ByqpKqKXQFOBs1KHbywTzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1118214"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:25:51 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	vinod.govindapillai@intel.com
Subject: [PATCH v8 5/5] drm/i915/hotplug: avoid HPD polling if the device is
 PME capable
Date: Tue, 15 Sep 2026 12:25:17 +0300
Message-ID: <20260915092518.639448-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915092518.639448-1-vinod.govindapillai@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
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

In supported devices, HPDs can generate PME and which in turn
can invoke runtime resume calls for xe. No need to keep the
HPD polling in such PME capable devices.

v2: use intel_display_rpm_pme_enabled() directly (JaniN)

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 970aa95ee344..d095eb13dc06 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -867,6 +867,11 @@ void intel_hpd_poll_enable(struct intel_display *display)
 	if (!HAS_DISPLAY(display) || !intel_display_device_enabled(display))
 		return;
 
+	if (intel_display_rpm_pme_enabled(display)) {
+		drm_dbg_kms(display->drm, "PME wake capable device, skipping HPD polling.\n");
+		return;
+	}
+
 	WRITE_ONCE(display->hotplug.poll_enabled, true);
 
 	/*
-- 
2.43.0

