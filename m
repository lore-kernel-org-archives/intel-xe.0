Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993B0C5AD2B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0010E835;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBZB4Vyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D9F10E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=orXLbf4BJ+K4tx43r/9FOsEcCmOqS8IcrvzIAN4rjpg=;
 b=UBZB4Vyf0aPs8k2QCSbnqAVqQWdzkCcugc/CGy2nbMmKV/fy/UuVzdy+
 idQHdI8qVQl19aRb6Ih8lfXXiMjhbbeI0WVePK5/sD0w8/e1O1MYz89gM
 zpppp3NwuEdb7qf14qJyZkHIllXFvwUPYKeC0groEn+1t9e18S/kVBqKc
 2WdcbBTtB8MWIYddEQXn2U7z0uCP6QD2FZiI2fIUwbrKPpicdBuh0bfZf
 uhx+COrghp2R61k3QvAiI2u9bn1baQ7S9TFgj8z48BV9hg8n3rE1y1YBJ
 f14UQib6YVokjZr4NZ7JulQ56IJ7bAcA9vpmt3VBWebalTccERoGPByGA A==;
X-CSE-ConnectionGUID: zImyi/jHR36j3PWZscLr4A==
X-CSE-MsgGUID: biYq5LzqQCyHNqKrNM8AJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606754"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
X-CSE-ConnectionGUID: FhTq/g0ES6+jD/kdQImoYw==
X-CSE-MsgGUID: Sb3E9y1cQv+SHU/atFWoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138742"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:45 -0800
Subject: [PATCH v2 23/23] drm/xe: Consolidate workaround entries for
 Wa_14023061436
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-23-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=orXLbf4BJ+K4tx43r/9FOsEcCmOqS8IcrvzIAN4rjpg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmvzYMvHEzSfVmRwT4kibFuOu/AwxODcjHtz
 5ungn+EVhSJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BFwhD/9a0gyTHEL4czOp4/G0Kq+W2aVdN0S9zbbw62CCrJ9ZiddYT7SU4y5WBNYfBXJV/ea00gP
 4ZIVLxvHr1PCcbsgcZe1Rf+TnpI03sek6aSExmNXebjPSZjW59hg7Bzgx6tDA38Z9jflKqkoTm1
 utSq14RtZ31ipTIGBpkKRQLKuIyuERp69iZdyHjRR0ey+q/j3Cqi95XVNK6aXAarMN8PSP82k8U
 cZE6JKgwZENsFC0JTLdAbHv9JOkQ8S4GGsq7u4QwAh+Ox1porByYqT7S7lk2iUw961Zi3iizMUw
 1JVLBhY7hTwhSGr38FeJLaaBEtxRB9HxS80h68NyYB1Rox8CcGcJ9GwI283BO5MyXb8Yz00WciW
 dgje4jt42KCGX1mak5YjR0LyxmRISzDlqmM8QevKCZHS1t3gbE8n8jsQRVrqZMNsGBY0OybXtmf
 OydsSxN5w9SeTc3FVEZKLc17s45ASTlksS2WekR6FHP6C7y8jtmU1qhW3hxB0MEL6QXbJysoCA5
 QRUXDT0QAwQzB0ZhKOfFLKcLjCfMJw7aOw74tdH9wn3BU7lbVsQKzNa2FiE0QsBbsnarRsQuSaw
 divcwN6a4/OeKGUM8+0+4MIEAdzsGJX205NMY5/Jrf+UG0HUF2UQlGxN1aFiRKP6dMTF/0H6Ut6
 dbLvNjY8w+yL6ww==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_14023061436 applies to all graphics versions from 30.00 through 30.05
(inclusive) since there is currently no IP that uses version 30.02.
Consolidate the RTP rules into a single range.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 105ccd8115f09993b7ef82e70cb87d74008f267f..6bee245286abb674cc3089257c979e37ea51760b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -571,9 +571,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 				   SMP_FORCE_128B_OVERFETCH))
 	},
 	{ XE_RTP_NAME("14023061436"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
-		       FUNC(xe_rtp_match_first_render_or_compute), OR,
-		       GRAPHICS_VERSION_RANGE(3003, 3005),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},

-- 
2.53.0

