Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEA0C02193
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 15:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE7F10E835;
	Wed, 29 Jan 2025 15:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ooC3XLHx";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C89110E834
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=33nfkifHrZE0AMW6vFCxdrdPtr++nY2MBPhjpGEEYqE=; b=ooC3XLHxYsJ4083htv84QHofoS
 k07Mksu3l1EBcHf+Wn5k7LSYhPLW6IgIxc9wPDRbPws7qdciHLOwF4UlmBCHsXaMjeF2+QV7WM2MP
 B5uPVpY+anM3BE2qIPZs8tstJualLSJiQTg49Ce3NYkvFtiOtHd6cqVeD3cYpMJVjd35ZqiOGL0PM
 DMFfmf73FXF+Hp4sx16WfhUjTjxQ3MkTHLMsxl1+lW45QETNe5taZGcHemwfMb3U9EEQ9Ue8ju1nt
 NtakRmMzU6LN8kJMD+O5Wn1DfNcpFZHka23yWIR4kVAKvNNJ75stJhcj9vFuZUysRb/OiojeQw4VK
 1YDVhq1g==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tdAQX-000e7V-LA; Wed, 29 Jan 2025 16:56:35 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/5] drm/xe/gen12: L3 recommended hashing mask
Date: Wed, 29 Jan 2025 15:56:25 +0000
Message-ID: <20250129155627.93827-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
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

According to the i915 codebase xe missed to set the recommended
performance tuning for L3 hashing which is applicable to all legacy Gen12
platforms. Lets add it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
I could not find the reference to this in the public docs, including
confirmation whether 0xb004 even exists on for example TGL. Then for ADL I
don't see that PRMs have been made public at all.
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 096859072396..909638b18557 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -366,6 +366,9 @@
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
 /* L3 Cache Control */
+#define GEN8_GARBCNTL                          XE_REG(0xb004)
+#define   GEN12_BUS_HASH_CTL_BIT_EXC           REG_BIT(7)
+
 #define LNCFCMOCS_REG_COUNT			32
 #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
 #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 9e7ec36dbd47..b21a59578ba3 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -107,6 +107,12 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 						FF_MODE2_TDS_TIMER_128))
 	},
 
+	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1254),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(CLR(GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC))
+	},
+
 	/* DG2 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-- 
2.48.0

