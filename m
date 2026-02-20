Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78654C5AD46
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6DA10E827;
	Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0UdF5M2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD5010E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=koudRxXfuxBsifGkeCMsdEhJKwFbSE+zp6EilvQamrI=;
 b=D0UdF5M2TA+f96RZc7inGyKBvb4eJmcVcLdda58Jcfid4eSxeR/8jWKU
 mGMYpcuMGYJ8meC7AU2/SEl/al3NJCYkCJrviJxRH3eN6GTKahzgr6Cmo
 CzcxowrISkQ8qpCqCW4LWOCaJPAYQzp7QIh3nLDW29pimwBTBJxbeth3W
 8ZJZz3n1sdyk0KuVQoa1lrm8Q/rBibA31wpc6FNo4kfXW4no+gNla9ECJ
 yhQHNKlLfnK31YZyycIMRRoYT0Pu9aCNIfy99D5nMhPBu7pAOOxGtcww+
 yzR3DWJC4GaDlQ+JGgkAhQTRGY2qXyVL2LtRngTMTdXr3CouHvoXaUdyh Q==;
X-CSE-ConnectionGUID: QBpX4X6NReCBo2giMuK8wA==
X-CSE-MsgGUID: rRgbZ7IyQBenyjyup2cmlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606732"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606732"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: l7PJCja4Q72XVL6KFjPt7w==
X-CSE-MsgGUID: C4gdGnMBTcqRkXs0BfidRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138680"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:27 -0800
Subject: [PATCH v2 05/23] drm/xe: Consolidate workaround entries for
 Wa_14019449301
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-5-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=koudRxXfuxBsifGkeCMsdEhJKwFbSE+zp6EilvQamrI=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmsEn8RUpoJ3mxwk+fO7W9xt06rnj0I2W3kF
 c53AOu+nd+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrAAKCRBNeSQFyHKQ
 BACDD/4pR3m11QJ00fJ1ZzXs53y0misxWU6Ftm07wXSJBiIo/hBdPR0Qmg8iDD3DR0q2SdKukI4
 htHjcLQni3F6o0+Zm9EtQN/fxIy2ujEyoIFMCow1+mfudlAigklef9yK7Y0pdleDrsrsT9T2UuC
 cnkFzBpDrRmfrCfMVda2QbLmUFEeopOkEMEkSrAIMUuAgP/VBbGeIngwsiQBFHZ7dijcynZw9IO
 3wTKqwTSfXstUN8alxGJN/Gk4px3g5zcqqlquuPWQLeQKFS0fJ7kjvu3/UVfv6hcmzxGTfVH8rg
 rbw416Df7QXSqMPwVG18de+CNP5QH44C9j8T7dVQz/Fnx8QW08A09XCNn/KJGtjIHV+JCVd40zZ
 rpEAND3kP5X9pE+gwzo2p4aYNJ3qsGQou1JCHlH9Umxr9THXdhUJyrV+gL7ENWTPndNu02tEhHL
 gxrARsNpLNeKVdoqZqozBHKwMgzj71BV7468dKmBE5ikfaq4Vm2v59cjGYgWUpmbCA3UacS4iBL
 wfoYRF0UIuCC9EceGZCMZMz+HODQeYAGb7jiTjhVYKS2rc6tL2vgdsjQxZ8b7/G1cYdHDgvKnb0
 hPJf/Wr7oK5gDcKEYE3v/n2bnPrnmD818cPbz1N7tZLEac3hEoOyaiiofVKYIjgD2hTcYtFAVij
 nnLCqzkWik9AJvA==
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

Wa_14019449301 applies to both media IP 13.01 and 20.00 and none of the
version numbers between those are used.  Conslidate the two entries into
a single range entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 4a8685f2ea985cb67b21bdf8a043ad1dfdfc816d..33e7e33db83175953361ee13dd40af8954c6d838 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -154,6 +154,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("14019449301"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000), ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
 
 	/* DG1 */
 
@@ -234,11 +239,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("14019449301"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("16028005424"),
 	  XE_RTP_RULES(MEDIA_VERSION(2000)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
@@ -258,11 +258,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* Xe2_HPM */
 
-	{ XE_RTP_NAME("14019449301"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("16028005424"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301)),
 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))

-- 
2.53.0

