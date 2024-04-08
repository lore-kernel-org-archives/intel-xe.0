Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD96C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2736112776;
	Mon,  8 Apr 2024 16:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crl9itgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D8311277E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712593767; x=1744129767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kvT6iN/Lva1IwXivt+JiVIGe9r9A8Lgu7mRCPqEmfzE=;
 b=crl9itgsUkKCVuIUzvIL1I+rROlteHsZ3azQM7qaevfNSZHG0AIoLuu7
 Mza5WHLPt+Kmk4AY7wUecBlQplXaKHYafCX+cqll29yctJcuRGTIYHbJs
 XzWM9KRfnKyEhf39KBRkEhyfD4fGWK7m0gZPwbEmxn3wShm8jPbtGCBID
 4Qlu6gPrPfC/KNl83D4OliMoU+MGbEk80ra7sFe/Mc+d0XjaiFTtLfjeK
 saaLrWNPiloyWwEAEhyqFiUbyShI9/jVH41H88Oq+pvmfcmRCVWJTkS6P
 G9UMY/fs7HFZzRj8bs62GD3tOzyd3xiiIrs8usclxxz/uVn305xdUFCzN w==;
X-CSE-ConnectionGUID: LiQFH8DlSuaLayJ3GAAPWA==
X-CSE-MsgGUID: uw5b65SWRWml/kU4GshKwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19024989"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19024989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:27 -0700
X-CSE-ConnectionGUID: 0a21niBITX+i6iOwS0znpQ==
X-CSE-MsgGUID: PrSulWmjR06jUNq5SJzH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24683530"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 09:29:25 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 08/11] drm/xe/xe2: Add workaround 18034896535
Date: Mon,  8 Apr 2024 21:59:12 +0530
Message-Id: <20240408162916.3767771-16-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
References: <20240408162916.3767771-1-balasubramani.vivekanandan@intel.com>
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

