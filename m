Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C006EA3C23
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13910E78A;
	Thu,  9 Apr 2026 10:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKev4uTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F1210E78A;
 Thu,  9 Apr 2026 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729748; x=1807265748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZ7ljuBQzz2MNmVHSfymm7c966ESx6Z01LTP/d7aipU=;
 b=dKev4uTc6uFbhgaRkdLlwGUygNsR8SNeILgF0Z/VMeGbYbKukJmshIoy
 PcMlw9NxTwH4oVLEYJoUSDd7/dBvF4LiYNQIfpYdH5WBm2t36weQpeCsJ
 DBCbiR0tEGP9WE+zgxv/BwCxvPV5ex4z8y3y6719ubKtuepwJ6iPsy3ud
 pFmeV3Lhic0RVjEb/fNPjgV8ZheOumzhHUbg5yoqZMeM3c9Q6FtseBWIA
 TazuwfPEzzWMOd/y1nyP2P90rIJy0/qNAa4gk6GkElobzVGggBbi4yGvU
 ddZ1xh4mX63/UgL88Z3qxfGpNPLnKNoNDg2T6IWpaG6BWPKt/tpZuqO3O A==;
X-CSE-ConnectionGUID: o6uFEMYZRX6sK+b1j93vlA==
X-CSE-MsgGUID: U/jB8+n2TgSynZVTfgRekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87354247"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87354247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:15:47 -0700
X-CSE-ConnectionGUID: MZqhPHsURYqtuvgBFb4/4A==
X-CSE-MsgGUID: YXUSacb0Q/Wyg2aqP+GReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="252065381"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:15:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/9] drm/i915/hdmi: Add missing intel_pfit_mode_valid() for
 4:2:0 also modes
Date: Thu,  9 Apr 2026 13:15:31 +0300
Message-ID: <20260409101539.22032-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

intel_hdmi_mode_valid() is calling intel_pfit_mode_valid() only
on the first attempt (4:2:0 for "4:2:0 only" modes, 4:4:4 for
everything else). Add the call also for the "4:2:0 also" modes case
so that we actually know the pipe scaler can actually produce the
4:2:0 output.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 17bd2c207453..0d88eaefbe52 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2079,6 +2079,11 @@ intel_hdmi_mode_valid(struct drm_connector *_connector,
 			return status;
 
 		sink_format = INTEL_OUTPUT_FORMAT_YCBCR420;
+
+		status = intel_pfit_mode_valid(display, mode, sink_format, 0);
+		if (status != MODE_OK)
+			return status;
+
 		status = intel_hdmi_mode_clock_valid(&connector->base, clock, has_hdmi_sink,
 						     sink_format);
 		if (status != MODE_OK)
-- 
2.52.0

