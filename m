Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C28C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 08:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8B10E116;
	Tue,  5 Dec 2023 08:43:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92910E0CA
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701765804; x=1733301804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zGglew/CYYxYH3FY40UcMXtcqapXWQ/BSWvT759O5Nc=;
 b=jQxPgzT+9v3z76NskwdIMXdZxdKXXePmtL9ZyBYjqPSrZx2YsfOyE3O/
 TZWTEyOupV2KVUGF7tdYUvXsHizWRtrL6SEjBQ2WmcceiKOQ9HrbYsA9B
 Ftx6duf65OV5cXx+taAlO1BssZiNgCOYjh42dFzTej92GCYH7a1XRz3oT
 R25M6GVncXadjTiJAfCiZqlzajJDGadgZyLp3C1/NVwwwY9mGYcPecKkb
 s6xwkwVlj92aqu93GytLFOywmtw1zoXyxqnc5RCOOn0nQHMkoRXtJ+z3M
 5+BGh+gHk8itlqP2zYJsYhwkAJ2044ZZox3VQqbHaMj4VTcCazuKsrsnM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="705440"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="705440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 00:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914727166"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="914727166"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2023 00:43:19 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 14:22:49 +0530
Message-Id: <20231205085249.833836-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 18032095049
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This workaround applies to graphics 20.04 A0 step and on
render engine.

Workaround has three parts :
1. Pipe flush before MI_ATOMIC - This part isn't relevant to Xe
   (at least not right now) since we don't use MI_ATOMIC anywhere
   in the kernel mode driver.
2. Memory-based interrupt masking - Memory-based interrupt processing
   isn't supported on physical functions, only virtual functions,
   according to bspec 60352. So this is probably only relevant once
   SRIOV support lands in the driver.
3. Disabling CSB/timestamp updates to the ghwsp and pphwsp - Workaround
   is added by this change.

V2(MattR):
  - Mention detail in commit message
  - Reorder bit define
  - Improve bit naming
  - Remove workaround part which isnt relevant

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 6 ++++++
 drivers/gpu/drm/xe/xe_wa.c               | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1..ecdbc04a2d91 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -40,6 +40,7 @@
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
+
 #define   RING_MAX_NONPRIV_SLOTS  12
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
@@ -47,6 +48,11 @@
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
 
 #define RING_CMD_CCTL(base)			XE_REG((base) + 0xc4, XE_REG_OPTION_MASKED)
+
+#define CSFE_CHICKEN1_REG(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
+#define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
+#define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+
 /*
  * CMD_CCTL read/write fields take a MOCS value and _not_ a table index.
  * The lsb of each can be considered a separate enabling bit for encryption.
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 63bd4bb1af03..4389ce3548dd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -596,6 +596,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
+	{ XE_RTP_NAME("18032095049"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1_REG(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS))
+	},
 
 	{}
 };
-- 
2.25.1

