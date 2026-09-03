Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4FBC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAD310F452;
	Thu,  3 Sep 2026 08:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHVFfB4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA6310F452;
 Thu,  3 Sep 2026 08:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788422682; x=1819958682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bpver/j9JMCfFs+wB554BKAXQ0+MaEdlFNrdSAmVdHE=;
 b=dHVFfB4mmPwkV7Kx/i/r9aNLWHFDLG6QMo1N+idiPFXs0FTtM68yfFBo
 BI2cjnXWOG7Z9mCJpC+pTcJBxToVWpERCw/y7tM/nVFCbyHceiWm+3CfP
 AQP4ka0S499eIpqFabujGC2YXD2X7Wm+P/8QQ6jsha8HwToQTDaRshY3b
 XkfBxnEMB/wHJkH9fLSJwsvaupwMj3rkL5oRIpeZZlNUQF+XkCYq9IhvW
 sj5LzzR5BLMHL58V/o79vnR7CA8TBN/qYjTk7PjCD8ZVpoIS6vL3EqtBQ
 2xFOXLM2WCozguWrV0IiCM2cEUmu9lvkevxWfaY13xgMQ+7YG95B3ZXwU w==;
X-CSE-ConnectionGUID: m9LQCYSvSJyq17hO2Xq8DA==
X-CSE-MsgGUID: gvNCQD1IT6OVoLW2dQngMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88919219"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88919219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:42 -0700
X-CSE-ConnectionGUID: K1Jfp/h2RXGvTg2netVQyg==
X-CSE-MsgGUID: MjIFWI6JTEasv511sL5q8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266397389"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:40 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 4/5] drm/i915/hotplug: avoid HPD polling if the device is
 PME capable
Date: Thu,  3 Sep 2026 11:04:09 +0300
Message-ID: <20260903080410.489411-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903080410.489411-1-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
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

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index b24c9f360e24..8b7b9f47f049 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -877,6 +877,11 @@ void intel_hpd_poll_enable(struct intel_display *display)
 	if (!HAS_DISPLAY(display) || !intel_display_device_enabled(display))
 		return;
 
+	if (intel_hpd_can_generate_pme(display)) {
+		drm_dbg_kms(display->drm, "PME wake capable device, skipping HPD polling.\n");
+		return;
+	}
+
 	WRITE_ONCE(display->hotplug.poll_enabled, true);
 
 	/*
-- 
2.43.0

