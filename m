Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B07BFA1FD4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446B110EE9D;
	Wed, 22 Apr 2026 16:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1IR2W5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929A510EA8E;
 Wed, 22 Apr 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875180; x=1808411180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URmSUJJwwv12vLN7044YbCisg5My/ojeYRF+sF0l0jg=;
 b=f1IR2W5uwiOBMdc8Rzn4i7BFFd0yMkN+LUqnPKUi8dxBU+AqJyUIE4Aa
 UlW58RKRYfRpXzK+cefQ4uIFGooB2vCQH/ZqXIAaIevkez5yvUhFvo4ir
 YwIZ26S2i43U8S+HsuRS7zOsE0I65/BERU2NQxByAU1mJsSfSWGBYMUM/
 MAGCaYrt9wo6z55f/c2cpPJePD69TdYB95DHOhJ9RgpyftQF0+JIoticM
 284XeSlTJH0ZaOUTdYKdAqkyDHnFryx2An2GWC6OEGC+Mbwo16kHhFhaz
 +9YMETu+DEJ2bGTzabzUJg3Iirj/XQJ1uaX3JzVsUhNgHnJFg7hJA2OWc w==;
X-CSE-ConnectionGUID: cWZl1luuT/+q3M61oXuTEw==
X-CSE-MsgGUID: GgEQCc5tRLmTrgMfH7my2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247611"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:19 -0700
X-CSE-ConnectionGUID: gpjouJGiQIG1hOcbf453/w==
X-CSE-MsgGUID: 2p6SYUe+Ts6U6PtWv22Lgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816161"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:17 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 08/13] drm/i915/display: Store DC3CO eligibility in PSR
 state
Date: Wed, 22 Apr 2026 21:56:16 +0530
Message-ID: <20260422162622.1869831-9-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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

This will be used to control PSR2 parameters such as idle frames.

Changes in v2:
- Use intel_display_power_dc3co_allowed(display) instead
  of intel_dc3co_allowed(state)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c           | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index fc283cc429ec..28ab686b702a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1769,6 +1769,8 @@ struct intel_psr {
 	ktime_t last_exit;
 	bool sink_not_reliable;
 	bool irq_aux_error;
+	/* DC3CO eligibility used to control PSR configuration */
+	bool dc3co_eligible;
 	u16 su_w_granularity;
 	u16 su_y_granularity;
 	bool source_panel_replay_support;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 34e4a1ad609e..2e0478e3d560 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2263,6 +2263,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
 	intel_dp->psr.psr2_sel_fetch_cff_enabled = false;
 	intel_dp->psr.active_non_psr_pipes = 0;
 	intel_dp->psr.pkg_c_latency_used = 0;
+	intel_dp->psr.dc3co_eligible = false;
 }
 
 /**
@@ -3095,6 +3096,9 @@ void intel_psr_post_plane_update(struct intel_atomic_state *state,
 		 */
 		intel_dp->psr.busy_frontbuffer_bits = 0;
 
+		intel_dp->psr.dc3co_eligible = intel_display_power_dc3co_allowed(display) &&
+			intel_display_power_dc3co_supported(display);
+
 		mutex_unlock(&psr->lock);
 	}
 }
-- 
2.43.0

