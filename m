Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C05CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B9010EEBA;
	Mon,  8 Jun 2026 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FptnP62m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07110EEBF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780906050; x=1812442050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tQOafOK/gu8EowxTbFz3TWmDYiYqj3sc1V7M9MOqI8c=;
 b=FptnP62mFc12bgqXwWR/dvIM28T+iJ1J01bZOzLZHDNCsudoIn0xeTU6
 nc8jjl4MFjU5o5m7HBdZy/4HYg4puG4u1hZ8lZr3zBaenO9GEW2n4SZtY
 ByMc241ItJk5DFO550I96QPST+Q3Q9m8lE63CRQz+XQG0uhTeL8lfyDs4
 Og9vwW7YhlC0ZbG8UV0bzaJ5XdwfE3eB4YsULiJLd+dwngG8Z/7SZkeu8
 y3pmBbBVhc4RVLo6chqHbw5wWAAXIEhmsqfv8dtp5n0ZyhqaxYx6xC36R
 T3gz+/V50pjRhsSqTOdDA4GxK6xRk8cCOem8U3UgNhk99Zg5elwhz0lQn g==;
X-CSE-ConnectionGUID: wMNIeuctStCBChKTn0/YHw==
X-CSE-MsgGUID: bIEjfCqoSTauiuwbFyyt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="92202460"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92202460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:07:29 -0700
X-CSE-ConnectionGUID: IJOHNIDhSeW+58NnNJWL2w==
X-CSE-MsgGUID: jbsbniCJSRyiTvxgs5i/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249403847"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 08 Jun 2026 01:07:27 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/1] drm/xe/hw_error: Defeature hardware error handling
 with system controller
Date: Mon,  8 Jun 2026 13:33:21 +0530
Message-ID: <20260608080346.1135464-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608080346.1135464-1-raag.jadav@intel.com>
References: <20260608080346.1135464-1-raag.jadav@intel.com>
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

Hardware errors are reported through System Controller on the platforms
that support it, and never routed as direct IRQ to SGUnit. Defeature
their handling to prevent unexpected side effects.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 3c1dc9f83d1a..fd4177819afa 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -434,7 +434,7 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
 	unsigned long flags, err_src;
 	u32 err_bit;
 
-	if (!IS_DGFX(xe))
+	if (!IS_DGFX(xe) || xe->info.has_sysctrl)
 		return;
 
 	spin_lock_irqsave(&xe->irq.lock, flags);
-- 
2.43.0

