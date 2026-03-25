Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8004FEA80B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C25F10E77B;
	Wed, 25 Mar 2026 05:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDjwIIFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A20E10E76C;
 Wed, 25 Mar 2026 04:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414794; x=1805950794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZdtL4VjT88tZ757ZAurFWbxyc5QhKJj3sNKswRYpp8=;
 b=lDjwIIFCjBbrOhb5vAmWcPAm1Zn4VgnWwIZ0I5cUXiEYFR1Sygi1/dCd
 NtsuZ4hMQ47EQoQzqR5kd6YHS62H6fEmTN6+Dlhzkpb3zt5aV6J2AOUIm
 P+KeMFEdC4z0e3+28iiOh7YqGAAdemYafd1mUNGZw8IFn3QHfjzX4ov/9
 fayJ1MqpKtfK9rQFah8xp97T+ml/uo1hggcxVCrgqRoaw44lJgj1Uw+oR
 AhQ55TQfjusYhNOaL1yn7gvYa5rjR/ASQcOYmHu7pjLCvkyMrz+eIEx9y
 xYK3hY9gIQriHYN4O2iValbsGA+UgGsneFAGBLsezS/F6msy2CTvYr/B9 Q==;
X-CSE-ConnectionGUID: ULi/19zyQ2ag592wSdtoYw==
X-CSE-MsgGUID: dNEfNhzAQxuzmZmvJ3qcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922301"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922301"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 21:59:49 -0700
X-CSE-ConnectionGUID: WlqsmrJ6SDyyP2bXjzDF6w==
X-CSE-MsgGUID: nwGsjWyoTGu9YI+YWINi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580518"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 21:59:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 09/26] drm/i915/writeback: Fill encoder->get_config
Date: Wed, 25 Mar 2026 10:28:59 +0530
Message-Id: <20260325045916.984243-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

Fill the encoder->get_config hook with relevant data which helps
verify state.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 64769609aefe..1df04538d48c 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -100,6 +100,14 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.mode_valid = intel_writeback_mode_valid,
 };
 
+static void
+intel_writeback_get_config(struct intel_encoder *encoder,
+			   struct intel_crtc_state *crtc_state)
+{
+	crtc_state->output_types |= BIT(INTEL_OUTPUT_WRITEBACK);
+	crtc_state->output_format = INTEL_OUTPUT_FORMAT_RGB;
+}
+
 static bool
 intel_writeback_get_hw_state(struct intel_encoder *encoder,
 			     enum pipe *pipe)
@@ -170,6 +178,7 @@ int intel_writeback_init(struct intel_display *display)
 	encoder->type = INTEL_OUTPUT_WRITEBACK;
 	encoder->pipe_mask = ~0;
 	encoder->cloneable = 0;
+	encoder->get_config = intel_writeback_get_config;
 	encoder->get_hw_state = intel_writeback_get_hw_state;
 
 	connector = &writeback_conn->connector;
-- 
2.34.1

