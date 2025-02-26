Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E235FC19777
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 11:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC9810E1E9;
	Wed, 26 Feb 2025 11:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kLTjA7Ng";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F7610E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ComlpAtL7nfHs2pw0A+3cdaSKUJ+rpzrrYpgc1t4XX4=; b=kLTjA7NgWfIfBNHRbE4+aLJV98
 tV2aP2mbnwU1/ip4l1+CP6cRkbF/JzhTkAyYbhX6nZcUW9FEe5G5wC4/GMrjjTGbl50VzwJrED13m
 e5ostdB6pHHOCNxh0jc7ofmFYP7hLAFsnnYzzvK4+dm8VZbw5pkAiJaTVYlWnomeCkuKeI2Zmrdud
 LoP2vY4V8Gi7qH0lv2izu8vlcyIz05xmjuCk7h6Tk55p76dnxlDIl7AFI5D7lvfh5apID56Dpn2Zt
 iAxhv9jyztORI4xGo1NyBxTcuLISYZE2um29SP0pONWF8683jWbVl3xv1KkZP5CrbROp3tBga56Gj
 Wd86lpWQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnFTO-000vLq-8B; Wed, 26 Feb 2025 12:21:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/4] drm/xe/gen12: Add Wa_1604555607
Date: Wed, 26 Feb 2025 11:21:04 +0000
Message-ID: <20250226112106.28173-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
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

According to the i915 code base, apart from setting the GS timer, all
Gen12 platforms should also set the TDS timer. Make it so.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tuning value")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
This needs checking by someone with access to the proper docs and proper
workaround database.
---
 drivers/gpu/drm/xe/xe_tuning.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index d449de0fb6ec..9e7ec36dbd47 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -97,12 +97,14 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
-	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
+	{ XE_RTP_NAME("Tuning: ganged timers, also known as 16011163337 and 1604555607"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  /* read verification is ignored due to 1608008084. */
 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
-						FF_MODE2_GS_TIMER_MASK,
-						FF_MODE2_GS_TIMER_224))
+						FF_MODE2_GS_TIMER_MASK |
+						FF_MODE2_TDS_TIMER_MASK,
+						FF_MODE2_GS_TIMER_224 |
+						FF_MODE2_TDS_TIMER_128))
 	},
 
 	/* DG2 */
-- 
2.48.0

