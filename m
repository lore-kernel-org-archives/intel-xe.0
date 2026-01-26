Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF949C88E6D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 08:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391B10E08B;
	Mon, 26 Jan 2026 08:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vrhm6JM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EEB10E08B;
 Mon, 26 Jan 2026 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769414447; x=1800950447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X76fVjXUM+EUXPAQWqwUJ2huZ6jA5EhkFSyd2rcuPgE=;
 b=Vrhm6JM3wBwSN9xeaNNkckMJL4lsprAZ+Ov7K184I2cwMo6knCIMcj05
 8/eQPxD25ZR0p1cNXVkuME9aTIBo0N4fta9MniF2kk24ZMxc7j++spt1R
 RXNWtIOD9JAnhv2i3dZsHqwYlx9PEuBSOIDCd7F6KBs1mAMprKJfJ+e/R
 J0P290mCKRFZ4GtxfQxIOi/fg4FjAi6dwThR3KDehGnAls4upDUAjt9ex
 iwlU6J5ErXpaMutI0m16Xu2doXU3byfOIKuMyUR690yu9cKO0utclbxRo
 s9ewLu87GyX92pa4V6YcMoqSTHfeoXiux+24qrO/NcGQke4n8q+ueQ0FJ g==;
X-CSE-ConnectionGUID: 3dc/jo0xSWew7rsalTZafA==
X-CSE-MsgGUID: 0RFJhti+SDylflUACRDseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70682863"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70682863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:47 -0800
X-CSE-ConnectionGUID: fdxmYbGZRtyvMYhtGIs2AA==
X-CSE-MsgGUID: WG5CekRyT6KxP288+lvuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207867712"
Received: from krybak-mobl1.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:44 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v10 08/10] drm/i915/psr: Do PSR exit on frontbuffer flush on
 LunarLake and onwards
Date: Mon, 26 Jan 2026 09:59:57 +0200
Message-ID: <20260126075959.925413-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126075959.925413-1-jouni.hogander@intel.com>
References: <20260126075959.925413-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We need to use intel_psr_exit in frontbuffer flush on LunarLake and
onwards if we want to move using trans push mechanism to trigger Frame
Change event.

Keep PSR1 and PSR2 HW tracking as it is for older platforms as this was
seen causing problems there.

v2: typo fixed

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 9613c50623dc..9a4354c6bdda 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3559,7 +3559,14 @@ static void _psr_flush_handle(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 
-	if (DISPLAY_VER(display) < 20 && intel_dp->psr.psr2_sel_fetch_enabled) {
+	if (DISPLAY_VER(display) >= 20) {
+		/*
+		 * We can use PSR exit on LunarLake onwards. Also
+		 * using trans push mechanism to trigger Frame Change
+		 * event requires using PSR exit.
+		 */
+		intel_psr_exit(intel_dp);
+	} else if (intel_dp->psr.psr2_sel_fetch_enabled) {
 		/* Selective fetch prior LNL */
 		if (intel_dp->psr.psr2_sel_fetch_cff_enabled) {
 			/* can we turn CFF off? */
@@ -3579,16 +3586,11 @@ static void _psr_flush_handle(struct intel_dp *intel_dp)
 		intel_psr_configure_full_frame_update(intel_dp);
 
 		intel_psr_force_update(intel_dp);
-	} else if (!intel_dp->psr.psr2_sel_fetch_enabled) {
+	} else {
 		/*
-		 * PSR1 on all platforms
-		 * PSR2 HW tracking
-		 * Panel Replay Full frame update
+		 * On older platforms using PSR exit was seen causing problems
 		 */
 		intel_psr_force_update(intel_dp);
-	} else {
-		/* Selective update LNL onwards */
-		intel_psr_exit(intel_dp);
 	}
 
 	if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
-- 
2.43.0

