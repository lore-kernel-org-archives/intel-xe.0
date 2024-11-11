Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9763CD2E9C8
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 09:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BB210E45A;
	Mon, 11 Nov 2024 09:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAifuo9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B220610E451;
 Mon, 11 Nov 2024 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731316214; x=1762852214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwkhJw2+1NQ4sG6A6bgymwWEGGxCIJcogydoXc840Y8=;
 b=IAifuo9SY/rWmrYjCXB+yd6DV7qfA8wFEr3bjy6VWj96/yxGYOEkuZ4r
 q/lzQtgxEPW9YR3sy06NcN42S18grBSK3jOQmkzAm3/Eu6b9d/VgFT9BN
 pQP4Cf65JHggauxF9a6TBmPiKQl/U8d9vXaGBdeEABUM9+Tu46FmqrpFE
 6PY5naLUSvXocutiNrl5G86HySSTqQpFk9rTWI0bKi73WkvhbddoNu5mm
 7JJDRtNwff5ULVgbwmm5D+t2ytwhZ1dcMPnblOBJMEn6cgq1R+WFuUE8B
 eV7rIpzvrjOPsjPi2OTJR1IU2XWLVdSd6QT9XvglV+2mrJh9AB0YTH3es A==;
X-CSE-ConnectionGUID: yoesAN7VTEK4kEt51MXsFw==
X-CSE-MsgGUID: hJvsj57LRlSF7wDoroEi4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="35052353"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="35052353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:10:14 -0800
X-CSE-ConnectionGUID: lidx0qhDQNiE/L7TmVBMlA==
X-CSE-MsgGUID: b5Wo3yZvTm2yJhWeODmXNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86762639"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:10:11 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 10/23] drm/i915/dp: Avoid vrr compute config for HDMI sink
Date: Mon, 11 Nov 2024 14:42:08 +0530
Message-ID: <20241111091221.2992818-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

Currently we do not support VRR with HDMI so skip vrr compute
config step for DP with HDMI sink.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fec720bcd296..2db631ccf8ac 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3178,7 +3178,12 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (!HAS_DDI(dev_priv))
 		g4x_dp_set_clock(encoder, pipe_config);
 
-	intel_vrr_compute_config(pipe_config, conn_state);
+	/*
+	 * VRR via PCON is currently unsupported.
+	 * TODO: Add support for VRR for DP HDMI2.1 PCON.
+	 */
+	if (!intel_dp_has_hdmi_sink(intel_dp))
+		intel_vrr_compute_config(pipe_config, conn_state);
 	intel_dp_compute_as_sdp(intel_dp, pipe_config);
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 	intel_alpm_lobf_compute_config(intel_dp, pipe_config, conn_state);
-- 
2.45.2

