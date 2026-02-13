Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B75EF99E4
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1CE10E84A;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQjnX9Bn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811D210E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021957; x=1802557957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=U6IvGpKuQknTA6miy9WvsJNhvJjopRrUB/XZUkWEUFU=;
 b=iQjnX9BncCTcm97imkQfehHcnXqp4JAWEjmA9sxDnhstFU5WQF1nf2nq
 lNjr067PfwbnFxGpCbTOEFmFLVWx/a9sSVwjxGjbxXE5K5Va0a9Q8AhDu
 Vas9zAWNmztMmdhD/zf7PtBRmKtRbEhr6CXy8yu0PQwl6MTiOgUpj+cn9
 RXYtMHZ+tZwFylG0dUt1NRIkn8szEWBBDGStqUKgIiPLPhY4o4z4vTY4g
 KxYLqpeY8TONx+6VYyIMJjKvrqCJ8T1p5RfbP001+BHBnLJBTt5U+vQbM
 BM9WD4h9f59Ey78vzd4gAf9XMLrg8t9GHnF9prc8WM3GL15eQBViCSoAo w==;
X-CSE-ConnectionGUID: Vf4L4+PMS/WL+KrRDQQ4iA==
X-CSE-MsgGUID: SAXQAge5SRKDvMhMlGdfzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654432"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654432"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: 8gHTcyCzTd+/G3i1M/loyQ==
X-CSE-MsgGUID: gfxv6uVxQTafB1C3lQR8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705632"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:39 -0800
Subject: [PATCH 04/22] drm/xe: Consolidate workaround entries for
 Wa_16021867713
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-4-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=U6IvGpKuQknTA6miy9WvsJNhvJjopRrUB/XZUkWEUFU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBDnFmRQ4L+1batWgJvunWfFqT4eVHbSvmM
 yiI1C43oLGJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BHD7D/9akwUlGT3JCrN6b4vphjhGIVFb1BQiM8r205Wc/h37MjTyEDQyc5a2EqB9vvlTqFtS4zF
 WmpIcjxchdPzKlZkYu2zWA5IRte57D8gEwvuEgnO8KTNrgIM+pbkZ7pd4Z/RPtHgPH4DeX0jzEA
 gDvaYJGVd9Pe7xcExEOEwmLWzEWUpBD0/n2O2Bi1ol0zKTbqrf6dW+z7PdzlCL2LVOoY+FQIdl4
 OXFAnY4eblE4jQsNIE9TjOi7pjVNMlUBly2omE3eaavlvvmIHspDlajCbOTXsMiIzHFLlGo0sTw
 jptEMmWlkpq9US9YuLQLmTEGWcKZzeJKb20J7leraAycJNRCw+I3e6nlLXjjTfH1Z3TrArIQRv6
 aAFtXzzhKc0pCvAieJeJwsYfq5luobqWYM/sqJgJm751xxwOPfrvkHLXs06181e6DaSZdSCdA5X
 rjOh9uv4vIh/jBH9wanbOpv81BNxjWJV9toGj8WBCBpYt/MkO55vgZZo+e9rJirexlikjTY74zB
 nhPjhy+J9teWh6YisUtEFDRuCKJri1lcEad03wfKUCMtw/0+33aaqH+nBZLZXIUMZ4HJo0LuLA4
 XZVQ3U9vnh60/vKoMtSpxlMU2TXlz9m2PqkI4BGao/SO44OtPi63VCEJMoppuHlNeIsTb5ucxLw
 vDnKm50jC46Qg2w==
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

Wa_16021867713 applies to every single media IP from 13.00 to 30.02
(inclusive).  We can consolidate the multiple per-version entries down
to a single range entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 8a9badb7f1085b10378ce410c2cb8ea495e53e7d..3d406256d29d28c57e55141ca70670419e3c42d1 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -131,6 +131,8 @@ __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 static const struct xe_rtp_entry_sr gt_was[] = {
+	/* Workarounds applying over a range of IPs */
+
 	{ XE_RTP_NAME("14011060649"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
 		       ENGINE_CLASS(VIDEO_DECODE),
@@ -146,6 +148,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1260)),
 	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, 3002),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 
 	/* DG1 */
 
@@ -213,12 +221,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe_LPM+ */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(1300),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("22016670082"),
 	  XE_RTP_RULES(MEDIA_VERSION(1300)),
 	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
@@ -232,12 +234,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
@@ -262,12 +258,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe2_HPM */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
@@ -291,12 +281,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe3_LPM */
 
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(3000),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("16021865536"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000),
 		       ENGINE_CLASS(VIDEO_DECODE)),
@@ -309,12 +293,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(3002),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("14021486841"),
 	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
 		       ENGINE_CLASS(VIDEO_DECODE)),

-- 
2.53.0

