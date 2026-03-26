Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E6110A88EA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD6F10EAFA;
	Thu, 26 Mar 2026 17:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U10YYl8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1F410EAB9;
 Thu, 26 Mar 2026 17:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545335; x=1806081335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rIyHDVpDg43GfYqiT8koAFmHkbwGclBFYv7ljkh5GZs=;
 b=U10YYl8T2gzBelatnMquJnZ5Rpw6XPdrGWeCga/2xiE2UK4l9T4wRnDW
 gPdztsBkvvqhuAJqT+lMdyzw64ISygklk+n3e8ipMbVTxs5TYVB5QavG9
 11gOr9g4nq8EEsZWaI9FNUQzKl46Ywtbg6udIPaeUnizkCzqmMKytMPsE
 u/RdG1NawXFqz92qRC7l9kAoruegxkbKn3fVbeEmHetmRYlGfRoAmXFDe
 zCO2J8aSwZ6+eWhP5vyTPJxYIPOHpK8q8ld0l26cynxs13SNaFzbFUaFI
 rq0FdJf7TxH/Nhoz28P67TrFlgnjI3HjJnGL8BqZP7n3N03f7cq0HwaV/ g==;
X-CSE-ConnectionGUID: jZqCmlqCS+yWrFuv5TjQ5g==
X-CSE-MsgGUID: JGUvG8JBSdasC3gsOu3CXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630585"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:35 -0700
X-CSE-ConnectionGUID: We5LqB07SBSbzj61fdXe4g==
X-CSE-MsgGUID: dxEFvdj4RK2bdUPZSmJnEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975597"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:33 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 11/19] drm/i915/display: Store DC3CO eligibility in PSR state
Date: Thu, 26 Mar 2026 22:45:49 +0530
Message-ID: <20260326171557.2065632-12-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Store DC3CO eligibility in intel_dp->psr during
intel_psr_post_plane_update() so PSR configuration
can take DC3CO into account.

This will be used to control PSR2 parameters such as idle frames

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c           | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0a327c4df98d..d0d2cda3d669 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1783,6 +1783,8 @@ struct intel_psr {
 	ktime_t last_exit;
 	bool sink_not_reliable;
 	bool irq_aux_error;
+	/* DC3CO eligibility used to control PSR configuration */
+	bool dc3co_eligible;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 987d49536548..bab254700a62 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2239,6 +2239,8 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.dc3co_eligible = false;
+
 }
 
 /**
@@ -3061,6 +3063,9 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 		 */
 		intel_dp->psr.busy_frontbuffer_bits = 0;
 
+		intel_dp->psr.dc3co_eligible = intel_dc3co_allowed(state) &&
+			intel_display_power_dc3co_supported(display);
+
 		mutex_unlock(&psr->lock);
 	}
 }
-- 
2.43.0

