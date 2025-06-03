Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2F1C5B552
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE39710E95E;
	Tue,  3 Jun 2025 18:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggFQGvXO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C402810E94F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975077; x=1780511077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L75430j4G7ez8ZybJP1gBkIKBljcAIHVTPOLQ1VMozk=;
 b=ggFQGvXOROyIHDUZpuwnBtBFqCELBaF+rrys2vHTbN4+v+5S/ZAq9kEt
 dPTqUIe0YQ41ADgM+T6xZL8ZWNcwIaawE3v6eWrE+bU4np8ZMl3Acq8V+
 1KmNwb6bsgJwZ0w8nspsCfJIRZxLsp1dJZ8p9jV/maWyyez7SplYd8nzK
 /9SlaSptQ3bRNVzsOJngstsfWzpbCS/xg7vFGYFF6VhP5nxpWf8hbbHrm
 7IBVvEo6wPcSO9MjrYpdzdi9Fz5b3nNH493i+gN0iiUmrj0dDWXP1Rl1V
 VBUCtY53yQs/Z2WLnMUb8kUdxXq6nJuUMVeZus1hWXXbrKlwkZxK5XFcY g==;
X-CSE-ConnectionGUID: Z6SEa+KKTCefM4lv4JQSDQ==
X-CSE-MsgGUID: ResO5y4fQMidSKOaLg02lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693862"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:37 -0700
X-CSE-ConnectionGUID: jHS517SBR7qgEI/Ui+rsjA==
X-CSE-MsgGUID: T+vX3n7YTrK4OYb5XAJFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562032"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:35 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 2/6] drm/xe/xe3: Add support for graphics IP version 30.03
Date: Tue,  3 Jun 2025 23:54:26 +0530
Message-Id: <20250603182430.1016734-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Graphics version 30.03 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        | 1 +
 drivers/gpu/drm/xe/xe_wa.c         | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 5 ++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b68c90910d82..247cd928b933 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -182,6 +182,7 @@ static const struct xe_ip graphics_ips[] = {
 	{ 2004, "Xe2_LPG", &graphics_xe2 },
 	{ 3000, "Xe3_LPG", &graphics_xe2 },
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
+	{ 3003, "Xe3_LPG", &graphics_xe2 },
 };
 
 /* Pre-GMDID Media IPs */
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 67196baa4249..5f750054a9c4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -640,6 +640,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..557d23c1bb9f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -33,9 +33,11 @@
 14022293748	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION(3003)
 22019794406	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION(3003)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
@@ -57,5 +59,6 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
-16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
+		GRAPHICS_VERSION(3003)
+16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
 		MEDIA_VERSION_RANGE(1300, 3000)
-- 
2.34.1

