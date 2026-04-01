Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07735D3517F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 20:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B674710E5ED;
	Wed,  1 Apr 2026 20:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNHQ7Ua+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0086310E5ED
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775074473; x=1806610473;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Y6ndLoKJ4G53RM4FKd2A9XPwMv33uMIFn+kegBHtOGE=;
 b=NNHQ7Ua+7Ai26LwciLOiXXGaHTbQL3mjP99pgmac1IeDBG3UG0E6ymit
 UXTRRbt4BNZIkZOgTaa+sb8jqZsxHFyAKKVzEgcWlwTkeKBIHPj853S2y
 u82HSTwf42bxgdWGI/mMPxCqjKqA089bF8s2y1EvIDTX0zX0dg4F5VbpJ
 MVImg/6rvdt5qgwP/RS0sJ3hlffuRUczVpHzJX7uLRnzzTMO+67orkhGt
 e6WWskOCccNwN+5GF+x04X/79PqN47udKD/UeLk5Ys1iz4+3M9AvVVF88
 v7Rdymh53oEw9/2PnbbJRQf+qQOCGhck244g40cSdfzsEjgHtZUH9GZvj Q==;
X-CSE-ConnectionGUID: rQ9/dTk0R5upAbUe70KTIw==
X-CSE-MsgGUID: v2ompixdTsSdDwYKJCa+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76185714"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76185714"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:14:32 -0700
X-CSE-ConnectionGUID: bkR326e2RyCIfcmH4Qn8Mg==
X-CSE-MsgGUID: RVR0pdMlRDeE2WilbjyQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="264712176"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:14:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 01 Apr 2026 13:12:44 -0700
Subject: [PATCH] drm/xe: Drop redundant rtp entries for Wa_14019988906 &
 Wa_14019877138
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
X-B4-Tracking: v=1; b=H4sIADx8zWkC/x3MTQqAIBBA4avErBNU+oGuEhE2jTVQFhoViHdPW
 n6L9yIE8kwBuiKCp5sDHy5DlQXgatxCguds0FI3spJKPGbcyS804uHsxngJtGTqGVG3k4TcnZ4
 sv/+zH1L6AAmibpNjAAAA
X-Change-ID: 20260401-wa_merge_conflict-cfea5dcc27b0
To: intel-xe@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Y6ndLoKJ4G53RM4FKd2A9XPwMv33uMIFn+kegBHtOGE=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpzXyn5b2KN2C2+WK5N+gp7+KUX4Ay4BeWFCewa
 YW5FtZJEhCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCac18pwAKCRBNeSQFyHKQ
 BJQvD/4oJlPWNWN8eK6E+FncriSvcVijJaQ0TiMBKOLkvVeF87PZx1ckMWMECszBEGs5uzV9Zsy
 dLXozlj63PMkb1fbm4YM0NFUELvsEdsK5KWRzepWjzyvB7Eea4Iz17aGWyj5cIjBp0AajNK4gfj
 me9P2xUepK9f+1sSBvTxvHAKfzmBLhwvZEQcOrewvX+g6T0lnL1qzhRykvepGL8QAN48dIFultX
 KUjeW6Jk2m774CqSpUOYdLXpoDUfWfwtojv5iWTVWWfDX6AZ0BrsmC5IKPjJG0gbKWeMLSCWF3R
 95N83ZhuxBTaL0qU3bobTM3FGlQYg0VZgRYZp2XrZ4EX0U75DURluNRkrQoCyepOOCcyYemCbtU
 Jhx8phkbG3jr+/xqV9Y2sJ2pRUvAxpcGNSbTgaqtDLFazznWzjA8whGfl6x/qld0Zn5hk9UZyLM
 Vh0nQ0/LtH1F2+h35TWt/92Gzo5FvlaTO97weTwLasGsBGfD+ZLzNd8bQnPzsZ9OEsK04AiZ3cr
 8ZQVlflKmbIkuUamKyxxQoH40yOSG487oxW6NUr9VKL2COWxZmNcEBLhp3VEgrBsaTnA9eu57X3
 szrG/xL3RUbi4fDk68JInWxajmJP9PSio4LEisEXfU8VXa0COPxRsLztjr54OUZngVWGFqAJqKQ
 yke0YltF1hnhQPw==
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

There appears to have been a silent merge conflict between some commits
updating the workaround tables on Xe's -fixes and -next branches:

 - Commit bc6387a2e0c1 ("drm/xe/xe2_hpg: Fix handling of Wa_14019988906
   & Wa_14019877138") from the fixes branch moved the Xe2_HPG instance
   of two workarounds touching the PSS_CHICKEN register from the
   engine_was[] table to the lrc_was[] table; the equivalent
   implementation for all other platforms/IPs were already properly
   located on lrc_was[].  This commit on the fixes branch is a
   cherry-pick of commit e04c609eedf4 ("drm/xe/xe2_hpg: Fix handling of
   Wa_14019988906 & Wa_14019877138") that already existed on the next
   branch.

 - Commit 55b19abb6c44 ("drm/xe: Consolidate workaround entries for
   Wa_14019877138") and commit c2142a1a8415 ("drm/xe: Consolidate
   workaround entries for Wa_14019988906") consolidated the individual
   entries per IP generation for each workaround into single, larger
   range-based entries.

During merge conflict resolution the Xe2_HPG-specific entries (i.e.,
those with rule "GRAPHICS_VERSION_RANGE(2001, 2002)") were accidentally
resurrected, even though the table already contains the consolidated
entries that match a superset of thse ranges.  These redundant entries
don't cause any build failures but do trigger a dmesg error during probe
on BMG-G21 devices:

  xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg 7044 (clear: 00000400, set: 00000400, masked: yes, mcr: yes): ret=-22
  xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg 7044 (clear: 00000020, set: 00000020, masked: yes, mcr: yes): ret=-22

Re-drop the Xe2_HPG-specific table entries to eliminate the error.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7433
Fixes: 17b95278ae6a ("Merge tag 'drm-xe-next-2026-03-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c3fef8fd73f7b8c064dcab79235a0e4e4d4dc086..2ec70be78bf90a252e7503bec2195442972384c2 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -751,14 +751,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
-	{ XE_RTP_NAME("14019988906"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
-	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,

---
base-commit: 35dad892ec87d448384f492ba061d0da7e3710a5
change-id: 20260401-wa_merge_conflict-cfea5dcc27b0

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

