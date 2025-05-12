Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A07EC3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 10:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0937B10E381;
	Mon, 12 May 2025 10:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3nS5Qz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD1D10E381;
 Mon, 12 May 2025 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747046060; x=1778582060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8/hCe2quLNzvQROWdbVI791Te2Ft3ODoBQynxzb+4JI=;
 b=P3nS5Qz/pGNbkpHo+P3AUmmqRQugPrTof12xJteJis3pa6ao26aeXzI3
 ONE4uJtUXPCO2/TsjgPxqcdE8hfw/WjM8FYhBXpHYMGHQiHOhfhC9YOB5
 jua5xcyPBcNQeQ2UcAaJlMpz0LflfcjRt346rDON46vlDECwwP9f4v0nR
 A+rUIQZ+fHcIjFDPaN3RCSrzdEpSuJzPO75t4gEoFlj/Y/FfiRuua524H
 yCg/aHcVGqMZUR1Mb8cy30/zvzkyhhja8sui9JzI8WFxPrEjTulnBnGsD
 buDPR4T6e2pEe7HwSm9r5GAK75GURa/EEaUdExWUeNbDtvXOi3I1t2oDj w==;
X-CSE-ConnectionGUID: L7xI3bffTHCIsS1Qn4P4ew==
X-CSE-MsgGUID: kj4DVok8Tm6kn1gnFsFlIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59467400"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59467400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 03:34:20 -0700
X-CSE-ConnectionGUID: Dqh6hcGjTFSQFouXtll1QA==
X-CSE-MsgGUID: A8FLvlpLScOMecOlSPsXdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142439957"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.195])
 by orviesa005.jf.intel.com with SMTP; 12 May 2025 03:34:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 May 2025 13:34:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/7] drm/i915/dmc: Extract is_event_handler()
Date: Mon, 12 May 2025 13:33:57 +0300
Message-ID: <20250512103358.15724-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
References: <20250512103358.15724-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the helper to determine if the mmio reg+data are the
event handler register (DMC_EVT_CTL) for a specific event.
We'll have another use for this for runtime event handler
enable/disable.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 238f3cda400c..d758032d1af6 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -564,6 +564,15 @@ static bool is_dmc_evt_htp_reg(struct intel_display *display,
 	return offset >= start && offset < end;
 }
 
+static bool is_event_handler(struct intel_display *display,
+			     enum intel_dmc_id dmc_id,
+			     unsigned int event_id,
+			     i915_reg_t reg, u32 data)
+{
+	return is_dmc_evt_ctl_reg(display, dmc_id, reg) &&
+		REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) == event_id;
+}
+
 /**
  * intel_dmc_block_pkgc() - block PKG C-state
  * @display: display instance
@@ -622,12 +631,12 @@ static bool disable_dmc_evt(struct intel_display *display,
 
 	/* also disable the flip queue event on the main DMC on TGL */
 	if (display->platform.tigerlake &&
-	    REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) == MAINDMC_EVENT_CLK_MSEC)
+	    is_event_handler(display, dmc_id, MAINDMC_EVENT_CLK_MSEC, reg, data))
 		return true;
 
 	/* also disable the HRR event on the main DMC on TGL/ADLS */
 	if ((display->platform.tigerlake || display->platform.alderlake_s) &&
-	    REG_FIELD_GET(DMC_EVT_CTL_EVENT_ID_MASK, data) == MAINDMC_EVENT_VBLANK_A)
+	    is_event_handler(display, dmc_id, MAINDMC_EVENT_VBLANK_A, reg, data))
 		return true;
 
 	return false;
-- 
2.49.0

