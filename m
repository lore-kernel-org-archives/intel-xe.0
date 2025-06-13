Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C56C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FB810EA22;
	Fri, 13 Jun 2025 15:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IfYAJIq/";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA110EA1D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Luhm1CEo4hZukoE8AaqK74sJydRxTSvXT2nahIkrSF0=; b=IfYAJIq/HQljBt6xjCw35a6mcH
 5cnwOBnJ1OSwDKIJkurR2Gf/b1GEOaLRfzzuaSgM9hxeNODsr3fOf+JW/ra1RH1k2cdNI4LYKeYVV
 qrYeaIRoFETQhUETsNeIboYTCAtcnjhCYrXrVpmdR5AfmNG4uGW0eer4XyHnEr+H0FQmnUTxBr8sO
 F17MCobqemX8knOTWr3dtiw+W8Bza2899Zz8COlf0bCzxY1taKg2yb3YTAahyJoSoGzZL4w73IKXv
 0JLSZDWs3u00YVaFy3LauBA1oxMPVrQI80YEE8mZf2ThSaxN+Xq8s/f0iGBnoxZH1SR0tckxttUog
 NEbjXdZg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ6Rn-0034pL-GF; Fri, 13 Jun 2025 17:36:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 4/7] drm/xe: Allow specifying number of extra dwords at the
 end of wa bb emission
Date: Fri, 13 Jun 2025 16:35:55 +0100
Message-ID: <20250613153558.68350-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
References: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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

Indirect context setup will need more than one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 0a90b7eeaf4e..9a27e194ba6a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -981,6 +981,7 @@ static u32 *
 setup_wa_bo(struct xe_lrc *lrc,
 	    struct xe_hw_engine *hwe,
 	    const size_t max_size,
+	    unsigned int reserve_dw,
 	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
@@ -1011,10 +1012,9 @@ setup_wa_bo(struct xe_lrc *lrc,
 			*written += len;
 
 		/*
-		 * There should always be at least 1 additional dword for
-		 * the end marker
+		 * Caller has asked for at least reserve_dw to remain unused.
 		 */
-		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < reserve_dw))
 			goto fail;
 
 		cmd += len;
@@ -1049,7 +1049,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	unsigned int written = 0;
 	u32 *cmd, *buf = NULL;
 
-	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
+	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
 			  ARRAY_SIZE(funcs), &buf, &written);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
-- 
2.48.0

