Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DE2606A332
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ef99/QCd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B306112AA3;
	Fri, 20 Nov 2026 14:23:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A93010E8FA;
 Fri, 20 Nov 2026 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184603; x=1826720603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yb7t6iXTOATNjMwXsdVxyxZD+1VON/7MaeT1G1RUb6I=;
 b=Ef99/QCduLxKjD08BrXH0WT1MIllw0UY6JCjnAzzZlogZ4/zwlkI7+oc
 F28AgW0omCeImiBUVK7TCH0Tv36tvH3QbnvrvZVGe+OTF2DA4g+hVJRgc
 T1FhvpFxTLUTQpZxJjlKHLnHppthEluEEp7yJ/WfQGFrebM7cNR4MEDNO
 xvWK5AW7YgIw6NZICzqiGQwAkZImEDoGpfr4qfCFixm338syV/MjwgcUb
 7iIDhj1SF8LIkBHfyzmBKitT33J/z5eem3kNONWyoE7oJoYzqFbz12eTr
 v44dHDxyJW4tfYMk/DtvQ+z61l5Wr4kqau0wo9/wBud9B7ChtS2sNQJSS g==;
X-CSE-ConnectionGUID: in7vVREKSgSMfZMRWOVz4Q==
X-CSE-MsgGUID: L+gjZeMKTzC6o19eVD5EGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090935"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090935"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:23 -0800
X-CSE-ConnectionGUID: YIWMVYz9RNq9/Zrhg1yTsg==
X-CSE-MsgGUID: 0RvZvJ8cQuiaSs8LjqaOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422007"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:21 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 08/29] drm/i915/dp: Account for FRL 16b/18b encoding overhead
Date: Fri, 20 Nov 2026 19:37:08 +0530
Message-ID: <20261120140729.466177-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

HDMI 2.1 FRL uses 16b/18b line coding, so only 16/18 of the raw FRL
rate carries payload. The FRL bandwidth check compared the required
bandwidth against the raw rate of the PCON and the sink, and so
accepted modes that cannot be carried.

Use the payload bandwidth for the check. The requirement is still
estimated from the full pixel clock including blanking, so it remains
an upper bound.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 45e4812777cb..0e32e0f0789a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1206,8 +1206,11 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
 			 intel_dp_hdmi_sink_max_frl(intel_dp));
 
-	/* converting bw from Gbps to Kbps*/
-	max_frl_bw = max_frl_bw * 1000000;
+	/*
+	 * Convert the rate from Gbps to kbps. FRL uses 16b/18b line coding, so
+	 * only 16/18 of the raw rate carries payload.
+	 */
+	max_frl_bw = max_frl_bw * 1000000 * 16 / 18;
 
 	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
 	if (target_bw > max_frl_bw)
-- 
2.50.1

