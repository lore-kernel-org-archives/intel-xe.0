Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24050EF99DF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97C910E327;
	Fri, 13 Feb 2026 22:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX6M7I3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD74510E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=dnFlYE1upNmoosV5cWBgQFvagyKkfyWFEXObR/nX8pc=;
 b=EX6M7I3SSLzzRuWTkO1NqNuF0imZGo9u7v/QpXG5hcqSNOyzF+UFfJD0
 rIAZaBUcokbfwiYO8wE1/UI3kM21QfP+QOUR2QbcvspKecfsV57pHVOuf
 25Rih+WSJJzkH+k+Au9DdCUG2yuB7oiA2qdbF5ZN3NVPkC5Ln7pEesfK9
 fbnjj+9608bPOviAZwS1AKT3aXWx36lNncJ3I0t4GnLa2yesOr6McPzeE
 VERrxy2QJnkRj+UNPJKk3cxXIxqnNSvk0Xaerkzo7oTCsxiJeCbSX7377
 St5y2CT21Tyv+vqFEHLinKVZ65DWn7YqnCgFrTd21s7ktnpQLIUtD/wWu g==;
X-CSE-ConnectionGUID: MwStVFljQGeaorLPpiTaAQ==
X-CSE-MsgGUID: DppaSR39SWqZnM/vKaWl+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654434"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: LbJoJO8tTsCTbO8fIRYhTA==
X-CSE-MsgGUID: uO5401HdSPKrgh9of6jdbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705635"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:40 -0800
Subject: [PATCH 05/22] drm/xe: Consolidate workaround entries for
 Wa_14019449301
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-5-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=dnFlYE1upNmoosV5cWBgQFvagyKkfyWFEXObR/nX8pc=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aBzyt8mxvLUOPZuslAZNTWhHS/VQ6m5Jshb
 SAB92yiVGiJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgQAKCRBNeSQFyHKQ
 BJy3EACvWFD6LX/GuDsk1TUy80tLKZtUQJosxkLTSlZFaBnfcKsymsn88kKAtUiHn7g4W9XFbr+
 EjPs7GvfhoJ0iDnsyl2OIOP4Pvh2Y5HndCWaBjVwz691CC+4XCUQREwDvnkpalcXyPhz85NKgNA
 DrOWV7264fgGvyCRj37DyajJ2WxCuwLwsPMlnT4zLI6oBB04irNziqKSlW+INBm+OgTE1AEM3hn
 9Vdz/8SAquGSvobDvhCZkgAen3JGj/t07FQAXYU9A5CT8iWwp337XCYWPXtF4ZK5sa1sI5GtZIY
 sskXf9dF+70iCTVLwdaBRD+OMpaZ4TVDPHqRP3uN5LcnxQlnkogcDHO7/ByI10o1l7t+jQd0rR3
 T3GJwUomGdKdvfgKLCWn69zlIY+5ci0ck1k9wnH7Lmot+lKTAA4ZvjYbJ7bQHxIXLN7IJqw2Q8i
 jdTqTZ1+Z/hCd+c40qWowVW/VfLBlbyxES0KRO+PnL9SAH4XzZEAYwCWEK/1spWax/0I5o1vYo1
 5XKXMS4dGVEtgxIw5UQYHaCbFSNa+o3ICrwuW/rrfNqowtd0T+hqoMJszsy40LfK0i2PNkpJKIw
 6+M8Lp7oA2LAwA9g8zrmVcBaAgXwhEh2TdNKhCU6zJHBkgqYwZHCQLYa1W/IglGs0S/4JLbbuXO
 xlcjZPXSliqnqYg==
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
index 3d406256d29d28c57e55141ca70670419e3c42d1..200ce2db8adc80490845724bd891f01a0fa7e859 100644
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

