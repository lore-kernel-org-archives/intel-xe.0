Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B104CD8C9D
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 03:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA6210E06A;
	Tue,  9 Jun 2026 03:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkMIcSVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72A10E06A;
 Tue,  9 Jun 2026 03:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780974668; x=1812510668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YE45qB0T/5f9XsoAlYNzyvHRdjI/1MJmF5mzScukCs0=;
 b=AkMIcSVLNwqRLFDOKrfEfaemqwp4R/3Vic61fhHG5m0log1GVp6kT+ZJ
 w0f/REv+8xjQoOQrfSF770hMhV2ua6+5ElGWW9iKCMWe4FmqQo6jJApF7
 JPHACjXQ8TFTI1SA0EB+LNEdptOKYOFUeYDPtMv48bqOCgXOuI9864FYK
 jKQpDD43Y2qPwvwhCoHz8OWGvhZiGksILP5q1xDcHFYpbjhG7wSDrBScP
 pfQZZ2TR84o521i6RJ7JBTxNf3XkOMGUgzzUwGb1h0rDf8tuRgprKliJQ
 NzNr+pLTHSsMedWK/T5e5OXZUxDqs0LwZJZHu56xio22hAa5JFYkSCb+r Q==;
X-CSE-ConnectionGUID: JafSAhInRZeLJtP5nfLVyA==
X-CSE-MsgGUID: n/S8LEpUS3qDK8nLZlYKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85351717"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="85351717"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:11:08 -0700
X-CSE-ConnectionGUID: bhT00tx6QFiW57DhBzJK7g==
X-CSE-MsgGUID: MGggPTXGRVWbSDfvdFqoxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="241287291"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:11:05 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/2] drm/i915/panel: Preserve Vtotal-Vsync distance while
 adjusting vtotal
Date: Tue,  9 Jun 2026 08:23:25 +0530
Message-ID: <20260609025325.1128543-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260609025325.1128543-1-ankit.k.nautiyal@intel.com>
References: <20260609025325.1128543-1-ankit.k.nautiyal@intel.com>
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

As we increase the vtotal to accommodate lower resfresh rate for fixed
modes, adjust the vtotal-vsync distance also.

v2: Rename vsync_*_diff to vsync_*_offset for clarity. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 20c548eea6da..81fb349ece5f 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -237,11 +237,18 @@ int intel_panel_compute_config(struct intel_connector *connector,
 
 	drm_mode_copy(adjusted_mode, fixed_mode);
 
-	if (is_vrr && fixed_mode_vrefresh != vrefresh)
+	if (is_vrr && fixed_mode_vrefresh != vrefresh) {
+		int vsync_start_offset = adjusted_mode->vtotal - adjusted_mode->vsync_start;
+		int vsync_end_offset = adjusted_mode->vtotal - adjusted_mode->vsync_end;
+
 		adjusted_mode->vtotal =
 			DIV_ROUND_CLOSEST(adjusted_mode->clock * 1000,
 					  adjusted_mode->htotal * vrefresh);
 
+		adjusted_mode->vsync_start = adjusted_mode->vtotal - vsync_start_offset;
+		adjusted_mode->vsync_end = adjusted_mode->vtotal - vsync_end_offset;
+	}
+
 	drm_mode_set_crtcinfo(adjusted_mode, 0);
 
 	return 0;
-- 
2.45.2

