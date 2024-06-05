Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977EFC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 20:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2413C10E087;
	Wed,  5 Jun 2024 20:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n52PGLTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92110E402
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 20:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717618800; x=1749154800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OR4fJkLCJyYYn//s4JrnsM5tgUFl0Cw5SNSeZstJCIs=;
 b=n52PGLTwQBYxhfF+mFj1UYwP4vUv/vg/qW6ZSevFEzOL6csxPn3wi849
 qqPtEtk3XIN1UzXIQYd1Tqmg466QFm22LfvwR0OwVgxT3cWefpBeskWso
 rIyoyEcHO5HZZE+jBwj4XVAnZ4+LQb75fJp5nH5cxVnoQg5Y91mHI36+q
 XbFQwdWNcd93I+nSTKO+e7iU51cctViEb4Hpv9tK2aiptUolKCLCjIY8D
 OgimSAd/z42iqHmOnB9kz0EI13BuiJo/ZaWzRyamZh5zL+uQOaEJ25iw0
 gRhAciXtuGAUWYUaH2vloqXD+V08JZPDpztdzSFUnTiARYuoa+uyvd5ZL Q==;
X-CSE-ConnectionGUID: jMLBLkD/TwWyccqXtF+Dqw==
X-CSE-MsgGUID: puLvTCcxSW6QILokHunMig==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31751841"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31751841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:20:00 -0700
X-CSE-ConnectionGUID: GEk+4gtnT+ODZciDrDKH+A==
X-CSE-MsgGUID: 2m3+XsTxSVOnLbshLMR2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42161868"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:19:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Prepare fast-path to be called outside of IRQ
 handler
Date: Wed,  5 Jun 2024 22:19:46 +0200
Message-Id: <20240605201947.1460-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240605201947.1460-1-michal.wajdeczko@intel.com>
References: <20240605201947.1460-1-michal.wajdeczko@intel.com>
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

G2H fast-path processing is done today only from the IRQ handler,
but in upcoming patch we want to use it also from the work.
Update spin lock to the _irq variant like rest of the code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c1f258348f5c..17f0e5019bb8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1216,6 +1216,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
+	unsigned long flags;
 	bool ongoing;
 	int len;
 
@@ -1223,13 +1224,13 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
 		return;
 
-	spin_lock(&ct->fast_lock);
+	spin_lock_irqsave(&ct->fast_lock, flags);
 	do {
 		len = g2h_read(ct, ct->fast_msg, true);
 		if (len > 0)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
-	spin_unlock(&ct->fast_lock);
+	spin_unlock_irqrestore(&ct->fast_lock, flags);
 
 	if (ongoing)
 		xe_pm_runtime_put(xe);
-- 
2.43.0

