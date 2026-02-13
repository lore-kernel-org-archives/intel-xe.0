Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE1EF99E6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6F10E845;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifE+WBhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE2010E845
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Zavkv4uoqtvS1Kw1L8fhSmz8FY5vC9Z6q0SR7wbNNwA=;
 b=ifE+WBhkU+BCL8KE9M/1jdNj5TjNbDzZq6hBmG0UmuaYv0dKLwzDUC39
 T1ejBlQag0qhBpo4TCpbvoNgvRTzz4QThtyhLA6opdV724fxdquyFYWeO
 e76Z+gQnwwQIplv35c2K2AYE0yqCuGZdKC68euI62L/8L2n6nTYhHf4xF
 JSVVisYycQ4d5p8I1WHvvbiiXGXWYvbBo8oPH/mQxx+R2GhZnW4eAZI9/
 MhJWn5SGkjHww3Oe06gZeyr2YyTALKOSSb/xTXIj93S0q0xSwcg6lwDIl
 KENGeag5vWdjbbS8udqAXiuVsTSrgTDeihGOrS+ZZrT+mIJQOJjOKqsWp g==;
X-CSE-ConnectionGUID: ozJoij7FTTyGb9+t5FSclQ==
X-CSE-MsgGUID: zoiMb5rrS+SU+vTZk2ab/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654436"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: yEYaA3BBRoWD04Lsum0fbA==
X-CSE-MsgGUID: bN+I5R6BT/K2/i/ud/AYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705644"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:43 -0800
Subject: [PATCH 08/22] drm/xe: Consolidate workaround entries for
 Wa_18032247524
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-8-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Zavkv4uoqtvS1Kw1L8fhSmz8FY5vC9Z6q0SR7wbNNwA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBJon0VPt68RuI5N61EbpcuDFZ+iHp/Wv3n
 +iCgxZ+YEKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BNfVD/4uqfW10Iw5u5dH8HMiUpXIlf/nzWo22nIqmjoXbt6p93dqXihJb+t+P0119P6idTjSyq0
 y1RK8Bw/Fqu+mr1IWmT/h/7wPgIUdywMz5/Y+UnGn/oWaupG0GMmKi5n/I/MK05CxSo2bQwvCO6
 Wu/nHNTqfhQKELt0UrH9Ecz3eO23UudrwyJU5vMIB/hz8PsQB9QQMVrD255eMP6LakLOtR1s8ge
 OZUd4k0/hXu0mu9VB9CwAPrAKoBB+VYR0SDuJeJKXyvglyyUzgdfri0oUBa7mcgoiWnLY/z1q9t
 dZ4JYrTMgREPstILbYJOARTalX/Nn3DBXaJynv+Px8avwTYY91IRfjt8ISPk0k4An/oTnBkgEDN
 OJtM+z+xCoDgXhxJB+D6TbLnUGBJZeNsosqZVLpgjD/gtlH9zvlL44MI7tZA7gSkrSOvTIcghzE
 efla+GKvzNtZmo61psDTFUpRlVb0LDFO2jkZ5mVf79FNlHKVcIUW7WP9DyrsSNE2uWufjO+PTtU
 10gLUQOr+3yq08UnKkmtOdbZMLC3BRqN428V/g+5KBpw2NDsfM8H8a1mz+X1cML4NnmFhzdJJBl
 evjtbk4mSxkcQWKTP4G0N9C6Y2AFyaNF0ASrZFMpkWkk5cX8qjhJavz3LK3ZoXuvopQHSG8fIdE
 BAAmfJIgiWdwTKg==
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

Wa_18032247524 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 399e4064e4025911ea442fa200ceb7e2e51c60a9..fc5e417bde62a5c81d3af928edefc36deb4b2073 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -306,6 +306,8 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
+	/* Workarounds applying over a range of IPs */
+
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE(RENDER_RING_BASE),
@@ -341,6 +343,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
 			     FFSC_PERCTX_PREEMPT_CTRL))
 	},
+	{ XE_RTP_NAME("18032247524"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
+	},
 
 	/* TGL */
 
@@ -478,11 +485,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("18032247524"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
-	},
 	{ XE_RTP_NAME("16018712365"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
@@ -545,11 +547,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
-	{ XE_RTP_NAME("18032247524"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
-	},
 	{ XE_RTP_NAME("14018471104"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute)),

-- 
2.53.0

