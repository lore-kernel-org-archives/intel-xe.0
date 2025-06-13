Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9470AC7114A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF4D10EA46;
	Fri, 13 Jun 2025 19:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AshCVVTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBDD10E5F9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843114; x=1781379114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nB19nAVD9m070plex/afW8EyMrKnT4TxGqyeUQfHucM=;
 b=AshCVVTn6M3EWS9DOrn4JqsGnVe4JeGYChqdfduZkP2HX7Da+4zaXOfi
 wAVmh2LK2c0L/G3t9QBVFc0UXYmSW/Gm8cU1MSZDVmQqmZdxsRknhqwCQ
 U8mXf/A7a+eH4vnRBz4jzuakCZ83z0VFcVvPXD1XWlJzSuqUvFJVZ1tpq
 sXOiRepv8qwNqxgvfIFPBi4R0QpC3AqI94bIqeQlQ9rfUbbNk3carsAg6
 W9jOX3bCO1fduO9o/ha6AP+3yTXoooTrGA13xPZFKYLZZqdRmipt9CFrS
 UCLy5KXAWXxGfP9ilGDc3f50KkxazLcMVnGRYJgBZSuare9b4lyY5Yi5J A==;
X-CSE-ConnectionGUID: wXak+Q2LQDC3BDEE/j/p8g==
X-CSE-MsgGUID: GJCi7JT4SD277ysZYrDOnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510508"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:54 -0700
X-CSE-ConnectionGUID: GhYVuRyvTbeeNjfCpy50hw==
X-CSE-MsgGUID: bqRwEGn9TqK+ZiRhGxJf2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722650"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:52 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 3/9] drm/xe/xe3: Add support for media IP version 30.02
Date: Sat, 14 Jun 2025 01:01:40 +0530
Message-Id: <20250613193146.3549862-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

Media version 30.02 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

-v2: Extend the range in existing WA entry (Bala)
-v3: Revert v2, Do not extend the range for the time being(Matt)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        |  1 +
 drivers/gpu/drm/xe/xe_wa.c         | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8bb698786334..5ff2169019ed 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -197,6 +197,7 @@ static const struct xe_ip media_ips[] = {
 	{ 1301, "Xe2_HPM", &media_xelpmp },
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
+	{ 3002, "Xe3_LPM", &media_xelpmp },
 };
 
 static const struct xe_device_desc tgl_desc = {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6baf369fb330..f51218a7a580 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -285,6 +285,18 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("16021865536"),
+	  XE_RTP_RULES(MEDIA_VERSION(3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 	{ XE_RTP_NAME("14021486841"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
 		       ENGINE_CLASS(VIDEO_DECODE)),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9a691045831e..d67202c07bc9 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -59,9 +59,11 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
 		MEDIA_VERSION_RANGE(1301, 3000)
+		MEDIA_VERSION(3002)
 		GRAPHICS_VERSION(3003)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
 		MEDIA_VERSION_RANGE(1300, 3000)
+		MEDIA_VERSION(3002)
 		GRAPHICS_VERSION(3003)
 
 # SoC workaround - currently applies to all platforms with the following
-- 
2.34.1

