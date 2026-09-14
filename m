Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77813C88E6F
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 19:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E3510F1C3;
	Mon, 14 Sep 2026 19:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGkHeg+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1358210F1B8;
 Mon, 14 Sep 2026 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789415292; x=1820951292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F1Jjc1H6lSCN6Defskc9Qtk8JbSr5ZdAl17rMvs7tBg=;
 b=eGkHeg+5LD9a25wyNL0acRD6UCX6bf2TLENkqprKZpO1sp6BaNB3et7+
 QnVzPiMAgY+O1lSRMZfgQQ8WZA+nToKiMmHYQVTV8YIW3PmS5iEQ/1h+c
 6kBZ0fj60b87QnZ/nBeAjwXEvC8aJ0IKjsxNkjEYyPkCKGwm8CWp9ZEuU
 NXfhk4Q4ydgUcVg6Zt2bZ4oxoRsEJX16lLXQc1SoKOCrMxaeTrax2izNz
 N4nbWIcY3QLs7BGXdt5H5MIX9g6ZMfdX3LXabonwUSNDAk9DiU+PCb6j1
 DvW9w2reG0r3RePyiQOSVafZgx8Rfe4S70yWKeZ6G+CwwxCq3q13Tc1Tb A==;
X-CSE-ConnectionGUID: M0U3rb/7SDC+LQ278EJbLg==
X-CSE-MsgGUID: 8Sf6ELlDQYq/aml3pzSw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92284855"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92284855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:48:12 -0700
X-CSE-ConnectionGUID: +RBpgFpqS52IhhV/Z/32hw==
X-CSE-MsgGUID: D3or/BSTR8y939gU97GOow==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:48:10 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v6 7/7] drm/i915/hotplug: avoid HPD polling if the device is
 PME capable
Date: Mon, 14 Sep 2026 22:47:37 +0300
Message-ID: <20260914194737.272679-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
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

