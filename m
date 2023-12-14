Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344AEC10F13
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FE510E2C0;
	Thu, 14 Dec 2023 18:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2810E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wSGZJgHcV57cn0jzJRbAlpvua/kTeW8+37/X3wYsLVM=;
 b=JuQvw7ExMYrGUZnpF/VME+TNgD4y8jQVyPGeRicLhYRQCvFvfj9cyyj/
 K7ZDP+OGGZ54Owhi1b3ROB4qHCYKAupUiFJoMYcaiiO2NeAZtLhjdBbZ/
 F8x4CqPFl7Uor6u3a35rf8By1BQYudrL9dzDjCioSl7oQfKHE+tf/FuFk
 8XW2Vizo3w/tpK2qZTQ1nAHuc4sG0mg7CnowIX97tGmF31nBhkRC/4kZL
 JUATTWZGX28BcBdjvEVtXvgxXjEsohJ5yTSYR66SUWiTMAtKsd06cuGka
 TpheSgEs0ys0SWwtCyFUgqnmXTJ4E5V4LakBHrQCcf5R+hocoY5BKb6u2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953928"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953928"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581831"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581831"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/8] drm/xe: Drop "_REG" suffix from CSFE_CHICKEN1
Date: Thu, 14 Dec 2023 10:47:01 -0800
Message-ID: <20231214184659.2249559-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't use this suffix on any other registers, and it isn't part of
the register's official name either, so drop it for consistency.

While at it, move the register definition slightly so that it isn't
separating RING_CMD_CCTL's definition from its registers.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 9 ++++-----
 drivers/gpu/drm/xe/xe_wa.c               | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1a857c4edcf5..67da19f9836f 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -46,11 +46,6 @@
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
-
-#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
-#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
-#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
-
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
@@ -61,6 +56,10 @@
 #define   CMD_CCTL_WRITE_OVERRIDE_MASK		REG_GENMASK(13, 8)
 #define   CMD_CCTL_READ_OVERRIDE_MASK		REG_GENMASK(6, 1)
 
+#define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
+#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
+#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 23f1285135b8..12829748bb6c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -605,7 +605,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	 */
 	{ XE_RTP_NAME("18032095049, 16021639441"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
-	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
 			     GHWSP_CSB_REPORT_DIS |
 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-- 
2.43.0

