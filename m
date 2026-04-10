Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48CCF45A11
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 22:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603BB10E9E0;
	Fri, 10 Apr 2026 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBS6WS21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB510E9DD
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775861467; x=1807397467;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=86T2A2wOabqQOz+4LJZ7Dmzf++CaJdj9mFVxxPGm2ng=;
 b=GBS6WS21GUXVJXF+XJmHchLM82D2ow5L1tLYzVF9qZSwlp26od6uZH09
 w1KnR/f14KKtQZb6tFKQUmu3qJisQp7qfFVW+VhTI3cqcdqsX8ynY+/y7
 cdJxstJYq46xN6CSoAQn0mwmY4peaydYsmh1BTWPdGNZwhpP1CTbjdsXN
 5hs23LkTXKJu4xYm5Jxtoim8gSQTEgOMmMG6EPC/0+xpqEloygtwqWJdF
 qjTiPlAgd2SteIq5s46hge0hXyrMyd4Ar/4eVGTY8OZ3TPgDkxBE6HpKi
 /5gN34WV1x83nOxSVISq5WDORMB5ZZqEbWxCPYGCzrIcQLzf0UKl5lLuK g==;
X-CSE-ConnectionGUID: 8WbuaXXgRtumiFZnXHv/Rw==
X-CSE-MsgGUID: FbDThsfaRB+OtKMf4Zw0lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76849548"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76849548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
X-CSE-ConnectionGUID: p2frJotXRKC4f+FF3c4w2A==
X-CSE-MsgGUID: hgpcqLp6TmKq8AwN9CHdhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="222728516"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 10 Apr 2026 15:50:28 -0700
Subject: [PATCH 1/3] drm/xe/tuning: Stop applying CCCHKNREG1 tuning from
 Xe3p onward
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-xe3p_tuning-v1-1-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
In-Reply-To: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=86T2A2wOabqQOz+4LJZ7Dmzf++CaJdj9mFVxxPGm2ng=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp2X7aOORqOqYIBTqu6lx2w7U73Z+SgZdaqafZw
 27kichE0XiJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadl+2gAKCRBNeSQFyHKQ
 BNPCD/sES2YPWyWH5ZVPxbIyp0A9eZi+wR59YcSEluy2JCXjXPpMKyiAtFlmrCBEXbFT2tjY/VI
 O73tMSex+6b49Ht72eI/TjsI8WtbMhOsKXRqceDhhYRF5oDOfvukrUhao0dtq2F8uZLoI+xe5cW
 awmVQFgBOE6ysdcX/4nu018NJmvdT3fKZJ6htWL+o8Cec97RA1dVlMZMmu+dWCdt0skMahBrKyw
 fEgtIcX0mW3MnxJewf17ncv5piKH8OEzUILv0gRDOjaqJjdArfRR5Q6pYIPGxVBmsvge4Qmc9hq
 RXIQpzAMdwfw+eyjJurH9VyVqoG+xmvFVJzV2VfqoJml6RtNiEP1VIJxDPt9LV9nxEcnvp3QeTf
 NiZSYmljWaF9WI7DF5ocVn0IOMILJ4Pw/pVtItkaazZWveAj/7R56ZWg4uOyHq6Kvplp7hn0uJe
 4DPkYQZTNRtHCnTdNiDIHPa2ymaxoibSJz3kDtjrQRL/mQXEpkPqkUDY2HvYmM9+j0AnAxmTHJu
 zGvY57IhIv+kDTZZUP2T6D53s2KaLhzV5nywoGfCQy0KOzaayuooolbhV0E2DZob/NEWjO5WkXa
 jwe9IENrMYjrRyHXCyRUOM1t1+cgN6smafBL2tEz/CSnKkf5gBGI/8jDmsD0pFIQd/RrmQ+IVyc
 HE+2xOWSMniCdoQ==
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

Whereas the tuning guide gave guidance on adjusting various CCCHKNREG1
on past platforms, starting from Xe3p the guidance is "Leave register at
HW default settings."  Set a version range upper bound of "34.99" so
that the current programming will stop being applied on any Xe3p
platforms that have graphics version 35.

Bspec: 72161
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index f8de6a4bf189..ea48e2a60fcd 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -43,7 +43,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3499),
 		       FUNC(xe_rtp_match_has_flat_ccs)),
 	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
 			 SET(CCCHKNREG1, L3CMPCTRL))

-- 
2.53.0

