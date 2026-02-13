Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FBDEF99E7
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220810E84C;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/YFUAQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2115A10E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RcWO/8GBqydDV9oKZHfTzeyJDClepXmBUXft67q+8gw=;
 b=a/YFUAQ4Aox1ZEJd9FwLkogUeSBKOyua5GeeFxRS4YWIxP6mC8bntv1+
 jVU5gGwgIXQGbEziZVnXkIOrza0LH7PyTcBBB6iV829Uf5co3BM02DMkL
 puN3a6gc80nQmDzJlmrDQu8uhR7DzwZfLvz/wPHsCjDp5/j4HR61Da+tp
 kT4J9yXGwYeXdObekyzYJ7vr4vjDMAUR7RIdqIcFj/E+FpgDs1wZ+PYMR
 D5jjDA5I7NAxG1SBCD61cNPVXUIuuOtrp5g28mZS0nz3inqEEgAICq/sn
 /Nb2etESZw+KoWTzryZDWk5PUNSm0SO8KZnftMxgBwbgouj71ghDUGX07 g==;
X-CSE-ConnectionGUID: XH3VEvBcQgK8Vp9x8EVaVw==
X-CSE-MsgGUID: FhBOAifRSI6oXS7zo6/6vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654429"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
X-CSE-ConnectionGUID: pvJB3QKSR8asrhq/IQXOQQ==
X-CSE-MsgGUID: k1fd0ZIPRISkjikAxEzuRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705623"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:36 -0800
Subject: [PATCH 01/22] drm/xe/mtl: Drop pre-prod workarounds Wa_14015795083
 & Wa_14014475959
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-1-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=RcWO/8GBqydDV9oKZHfTzeyJDClepXmBUXft67q+8gw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aAAIpyHN/Z26UAbTqSx2hcdn3yO1xOxdOp7
 FGms8uHQMGJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgAAKCRBNeSQFyHKQ
 BIfWD/91sSrivZ/ZMyy/Exd5sfrDao1WEQRhrOyIpyWipvCiOe5oqtafJhWBGCcd7k8k5Q/ssKD
 3iMOt27f8nXf63Ftp/XnSayte9TNaNU/axWyP2sSRDxH07OcSpi/r0qUJjvhqp96iCnnf4l275i
 erVVlMBiha0+pa5D453dIew+lVExiiv+2oSOwA43R8B83o9879gJiaMZy76wakUePdzbi94v9Mz
 wcNUtxQKtwrEeq2UiCjmrC9NDuQ/5KyQm4jF2WTCFPiXDQuk3jL+MsPYBw9pk8p/dc9esKP+jnh
 YskIkrgGRzFwZ4ZpzYd2XsStAlDQNxQYjWEvwVtGTaWgz+vhfji7hELvHwdOLTsFq+Wyj27h1Cq
 TrSWeToDwTAbFv/kG6GN4hlANer6D5Gibv7aykkyX62epkNtUkShDHorxfN2NAropjD5q3nKfRA
 94+tn84F4lMf+LV98RXgIceBe5Ca+O8LruwE58hraUZ6gkFUd3jwR+Uja6WpTbfz8DItBqKMv6q
 0E0T4xu4r9rZQ5CKK0dqgkp0a0ryX3P0UW9llr7dBZlHRIHw0MtqP7q9qPQEIyGoMx0iCgiGypJ
 nWv9FSSV+s6hhP6fNX6Ljc3CVMMF8MV26lp74dzy00uqeSqGtsaI5M4faaF5Sdw8MTd2P9qzV+G
 E3eN7+VAk9EnYLw==
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

Wa_14015795083 and Wa_14014475959 only apply to early steppings of
Xe_LPG that appeared only in pre-production hardware (in fact
Wa_14014475959 wasn't supposed to apply to _any_ steppings of version
12.71).  Xe1 platforms already aren't officially supported by the Xe
driver, but pre-production steppings are especially out of scope (and
'has_pre_prod_wa' is not set in the device descriptor).  Drop both
workarounds.

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c         | 4 ----
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 61c4187dc0aee2e86010af36536eff56041f982f..7f45d6eba44354a4dd047ac5800f18c6a9c90725 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -191,10 +191,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe_LPG */
 
-	{ XE_RTP_NAME("14015795083"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
-	},
 	{ XE_RTP_NAME("14018575942"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ac08f94f90a142629545c4964ca0fd3f9cad6aa9..cc988f2a18d33365dc09d32f4e85ced01b823877 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -2,8 +2,7 @@
 16010904313	GRAPHICS_VERSION_RANGE(1200, 1210)
 18022495364	GRAPHICS_VERSION_RANGE(1200, 1210)
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
-14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
-		PLATFORM(DG2)
+14014475959	PLATFORM(DG2)
 22011391025	PLATFORM(DG2)
 22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)

-- 
2.53.0

