Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCEFCD129D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E771128C9;
	Mon,  8 Apr 2024 17:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfU64KYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35A91128CD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595941; x=1744131941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvT6iN/Lva1IwXivt+JiVIGe9r9A8Lgu7mRCPqEmfzE=;
 b=LfU64KYuxwCNjs78Z9MJ8RiBrM1w4YJmgo+CRx/xrfD4ydr2N/UaNhMo
 u5udXZ1EAIXznHZmUtJ83nLg7DLZGTqOdaLQLxd4y+QLvao0yBmqrsz7q
 2kfy4r70+IchQ2vLM54OC57u/SSiGP95oyjkmIyelfEvqwg72e4/TWqH/
 rY+Gfeq96WbSXIryohDEfS1bbq9omW/fDFjBDMQJ/5dVtxfGktgDSjt6i
 tcPZiDIEdwCSDXbfSW7pWIGt5Sloh5ur9sRmVxwU0rZjsGXF2+OQilRB5
 zDhk9oDsADDvxM4yqhq3lmFLrouT+Mscp7kMedih8rsQDPBfffFgkZwbQ A==;
X-CSE-ConnectionGUID: Av9XkpcVRROJvYjyfLe7dw==
X-CSE-MsgGUID: jFyOCvNTTPuFjkdt7Mocsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11679162"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="11679162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:41 -0700
X-CSE-ConnectionGUID: /kyBJ5GSQiiDBgqI+QQ8Bg==
X-CSE-MsgGUID: 9zmr0FCjSxiBPHpC7FZC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24733879"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:39 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 08/11] drm/xe/xe2: Add workaround 18034896535
Date: Mon,  8 Apr 2024 22:35:42 +0530
Message-Id: <20240408170545.3769566-9-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Add 18034896535 as driver permanent workaround.

v2: 18034896535 and 16021540221 are two independent workarounds
that just happen to have the same implementation, hence keeping it.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c904e55ced9c..43fac92e5d20 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -428,6 +428,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 	{ XE_RTP_NAME("14019322943"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.25.1

