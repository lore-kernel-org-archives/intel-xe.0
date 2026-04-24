Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381DDFED3FD
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89DA10E119;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXUur8fl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BD810E125
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k/Oz6RlVgSQnISCWr6jI18/W12n1QfVXcDwhm196QDA=;
 b=KXUur8flM1xrfbFKRrD5N9FbFniPJG7ADq1udE5Ubm0HZDSseba/6W7N
 hO1bo2LJuJFxZOm+SBPB/2kxoKg98RoAByWIjgNdEIJxAVSOC9/4/4Hyz
 VD+PBwoeln+VsvoD+ctlYRm5hZKD9qeB+F69uGUMVhxeX2ITzWJDzidAu
 uabCm+rmycuxOOr0yEApxwfyFhPX7vj0sgEMDnJ4gJ51+GPfyuZ7eNj5Z
 YhX+tXf6cQAsfPCo6mAFMlobYzIwu6Ppr2spPfADLAUX4ABYEIcxZ6YJq
 VEIMVvlA5cGb4lc+O7y1MQ4SwWr7iBWJ3vNQTV1HzlpcWkBbXU6oSQCBH g==;
X-CSE-ConnectionGUID: pJVsYusdRQiQ8Eqvtzp8cg==
X-CSE-MsgGUID: bl8cFeR6QfC2dmhozhmKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80633997"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80633997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: zFLh7WFxR/Cu9G1yHlirOw==
X-CSE-MsgGUID: 59wAR3ipTAuFDoNPoRAHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560131"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:13 -0700
Subject: [PATCH v2 03/10] drm/xe: Stop programming BLIT_CCTL on Xe2 and
 later platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-3-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=k/Oz6RlVgSQnISCWr6jI18/W12n1QfVXcDwhm196QDA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eU4gy7dR/qZdLlPU8VnMBN0ricu5SGZ39lq
 urfUZ74xr6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlAAKCRBNeSQFyHKQ
 BL/pEAC1dwOWmB8oYhtXIly0IcnAV/VavoDI/yoHbGcFOzMZ6bC4JvWFA5oua4VV1GQku4J+4ll
 sG+FKCfkszBxrZNOQ4o5iYg0JmjGwQ3Q6YGXYYF7bwfQfqPm5b0Jb+TopxPjbwRnlyifKkhPgjv
 LIixK5gPRiKkmtZUWf4jMUqjBlVf3twuGLU2Dm8ivkCMSrE+Uwa82pfnTdYHFcEad4MhR6ap6+q
 DEZBcQu90xGV4YMgeJUyqjfoCoszTnDwpwCOsUFNySfBfqtBdKWUBIQCDPDxAsL6EfDzLg2d7pd
 +VUZZywYQJGFj3biPDe5mZaaEPUUO5B6XsV4rgnodIRCBlvUelslb1Dm7xAqVSddtNxQHtt2HHi
 dNpPaLMm9SiseO9QFXdB/z+iF9H7qVcfaMn7Gbo/GKKw7QY/CMyui/hovjdufNAJeqM+dKZDnX1
 TJ3PdG5QcrG5UHq5R6XFbhVgwbEwntT5/lcYcb0hiVnTxACn/MfNXetsWEaqF56pngJX8CCd5s7
 Gk1Twgi9/qvUdCRDdqNatl/EKkh3T3g4rlRAejOvc0zaKJJWyRPPTRDcSH9iiimJmzc2JfvEf9u
 t8iKSNbnp6u1sIMzZDF9mxq5aIGeRwUSvTUu5SfQrTov2vKvIoVnB9Qxs5gZ7d8CcSpOwTLORZV
 dF4j162xzNRPgew==
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

Xe1 platforms used the BLIT_CCTL register to specify the MOCS value that
would be used for BCS engine instructions that did not have a way of
specifying a MOCS index directly.  From Xe2 onward, all BCS instructions
now have explicit instruction fields for specifying a MOCS index and the
BLIT_CCTL register is now a dummy register with no valid fields.
Although continuing to write to it today has no effect, the register
could repurposed in future platforms, so restrict the BLIT_CCTL RTP
entry to only apply to Xe1 platforms.

Bspec: 60280
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c7d211178300..0419cd045090 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -384,7 +384,7 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 		 * BLIT_CCTL registers are needed to be programmed to un-cached.
 		 */
 		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
 			       ENGINE_CLASS(COPY)),
 		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
 				 BLIT_CCTL_DST_MOCS_MASK |

-- 
2.53.0

