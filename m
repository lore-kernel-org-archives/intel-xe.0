Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E8C53215
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DB10E788;
	Fri, 20 Feb 2026 05:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StJ1hVgV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CE310E78D;
 Fri, 20 Feb 2026 05:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563761; x=1803099761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TA+JSycETjy4/xeKnU2NvMg/OsivTbPmvketng5e4+4=;
 b=StJ1hVgVeKq5WjZhVsXuAI9CDXhC8MjMqwUdkZ9QRpTVkfgiBcFQrTKC
 PL/5zPRNThpLD52DTnAUs9fKJSn75Dbccw2tvVpl5r7JlKtvQlua57+E0
 tJD+/CWe6O7cYerbziSY6TmNuYJ26eDkk5cP3z0DBgfs9oO4BExFfMF/S
 VIBsLEfL186qd37X6oA5xAeJVs2d15R7zQFSy5Hs4yPUIGQsHZqYAUN10
 UPgAyM/Kv97cjq1OsnCa5wosCEBsICSXEWjqeuNY7E7YklbypxbqLi3V/
 91q9bpI0BEZLsvPV7Z3FmbA4NQZYsYtfcn9i/WqSWkWLZ6+A403SiaTIG w==;
X-CSE-ConnectionGUID: +x+WOBiHR1qcpoXOsMsHeg==
X-CSE-MsgGUID: xnV3mtPZTmSw/K47ZMUwwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758243"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:41 -0800
X-CSE-ConnectionGUID: EiK6AGhjQYmwwj99Zywgtw==
X-CSE-MsgGUID: nhu++IWZQh+3yEvqQpK1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894660"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:39 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 8/8] drm/i915/backlight: Avoid 0 brightness for INTEL AUX HDR
 backlight by default
Date: Fri, 20 Feb 2026 10:32:17 +0530
Message-Id: <20260220050217.2453681-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220050217.2453681-1-suraj.kandpal@intel.com>
References: <20260220050217.2453681-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
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

Whenever the minimum brightness is reported as 0 there are chances
we maybe sometimes end up with blank screen. This confuses the user
into thinking the display is acting weird. This occurs in eDP 1.4b
when we use proprietary INTEL AUX HDR DPCD registers to manipulate
brightness via luminance values. Make sure if minimum luminance
range is 0 we program the default luminance value to max, if
brightness level is reported as 0.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Let users set brightness to 0, make it so that it's just not
done by default (Arun)

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index aac6cdb5b69b..725370bcfa3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -442,6 +442,8 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 
 	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
 	panel->backlight.enabled = panel->backlight.level != 0;
+	if (!panel->backlight.level)
+		panel->backlight.level = panel->backlight.max;
 
 	return 0;
 }
-- 
2.34.1

