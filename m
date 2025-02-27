Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D035C19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA47210EA93;
	Thu, 27 Feb 2025 10:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DCxMqS6r";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D10710EA92
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZmGCAVTq6/jwVoRSZInPiJA9ebtWqcVoLZSsr1dBrjU=; b=DCxMqS6rUh9Ye7JqwiR/2LI6H6
 xvXELjS5ssHnhPpth7ElTaIgm37LTGaFf8Z/OYeEwnUeD0hI1HR6jO7fjLuGv11BwjWoKQxEysJy2
 9MPpLPXFvrRfCE1TtyWqfzpfDGaMIhxeZgcPTq64R97EnO/lel+8k3Q25H9QU+Pxl7x1Cbzs7qLCk
 kcLpNRkaHPpxBWuUIdNvBRi2lfkLknIdZdlgaX7oTJCw7Qm/gGjA3NVzPjMK8dgaWb8S9VcgTmbA8
 f/yPx4QH/aa6K9wdliKNE0VoL9PXykINW9msBNJKfn+CekXAd+dI/U6Xy/Exh6Fbn69E4qzQidg0p
 izouDPPA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnat4-001XVt-Vz; Thu, 27 Feb 2025 11:13:08 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 3/5] drm/xe/xelp: Add Wa_1604555607
Date: Thu, 27 Feb 2025 10:13:02 +0000
Message-ID: <20250227101304.46660-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
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

According to the i915 code base and as confirmed in the workaround
database, apart from setting the GS timer, all XeLP platforms should also
set the TDS timer.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index e446bde3a52b..398bfd0984c2 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -631,6 +631,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 						FF_MODE2_GS_TIMER_MASK,
 						FF_MODE2_GS_TIMER_224))
 	},
+	{ XE_RTP_NAME("1604555607"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
+	  /* read verification is ignored due to 1608008084. */
+	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
+						FF_MODE2_TDS_TIMER_MASK,
+						FF_MODE2_TDS_TIMER_128))
+	},
 	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
-- 
2.48.0

