Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B32E606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oq5oH7E5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0840210ED2C;
	Wed, 25 Nov 2026 05:18:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE9510E854;
 Wed, 25 Nov 2026 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583893; x=1827119893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5dWrt5Awg+UxY+vD/9ywGyIW4VXSCmB9GDrsP7/3ziM=;
 b=Oq5oH7E56UFFYt3qU88CaAhbOPuvWhvgc/MqPRQ9Tt5ExTBnRgkVRcGr
 2sK//eExyOIDriztgwXpSw/waRZLcGFQ/fGzB5DIs82F5UCZ3odYzKv4O
 yl/YILrOpZXUfKN8gDMrRAfK+L2FImG8OjsM1+EAb+DQPYoA7g8RVY/nc
 yuvXi28k4RvznqD6+qLoT6hL+pE5QIvXqX5JiGVSMPP1fyXarevDyHpCY
 m2P5oW0WdPfaKSwKLkUTt958fOjWCfO+3JnHVKWi6aOufs3ilbEl8pRqT
 xUzj1xAmUhOiPjs6kxdw+BaLs3jMgOGpv7AJ5rKP0zDsjfBDzpaslgW2y Q==;
X-CSE-ConnectionGUID: R5apgtzkRhmK1OmQyepkIQ==
X-CSE-MsgGUID: WIeul3aUTtWMQkV1W+BKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334170"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334170"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:13 -0800
X-CSE-ConnectionGUID: GjjBv0BwSWivdEEVEWxJag==
X-CSE-MsgGUID: Nbotfw10RYS41yVr1LQ0+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12092986"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:11 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 4/7] drm/i915/dp: Use the common downstream bw check in
 compute_bpc
Date: Wed, 25 Nov 2026 10:32:28 +0530
Message-ID: <20261125050231.1942380-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
References: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
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

Currently the FRL bandwidth check is only added for the mode_valid phase.
Add the check in the compute_config phase also, replacing the TMDS-only
check with the common function that checks for both TMDS and FRL.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 82a4e3abf4ae..657bb56237f0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1778,8 +1778,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 	for (; bpc >= 8; bpc -= 2) {
 		if (intel_hdmi_bpc_possible(crtc_state, bpc,
 					    intel_dp_has_hdmi_sink(intel_dp)) &&
-		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state->sink_format,
-					      respect_downstream_limits) == MODE_OK)
+		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state->sink_format,
+					   respect_downstream_limits) == MODE_OK)
 			return bpc;
 	}
 
-- 
2.50.1

