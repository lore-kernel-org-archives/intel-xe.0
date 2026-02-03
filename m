Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD20E87837
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF89F10E697;
	Tue,  3 Feb 2026 14:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyrSc9KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC110E695;
 Tue,  3 Feb 2026 14:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128018; x=1801664018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cr0XNT+qsbwSgKZ5tRZYhG+2pbW3P9qDOaZyywZSC88=;
 b=NyrSc9KO/mp3Wx6gqSBMcVOLxIYoC4GUEE1mFloVWjSoaIV5z3L0uvJ7
 1lSUvyrnbt7bngvQpAVyTQvPXnmAcG+Wz4bXsz9JR6Cxtuhhrv3QuOLHL
 cl/g0BnfExBdkUSCN1ITM+iuDve1KTWLAIXxjtiq58X7vUNRKnibufFRs
 JAQ+Ey3Ixp0GfgIfrRjToFo8Xn5Z9sTzAYuVHjNAGJIvKj3+NRvcx2Wz6
 1WPHdzVKfAN00Wpc165VN0Q0YSVU6xpIneS/bhkR+WjtT7KVToxsyqjvb
 SST/1AfHW/QK1lP0d0eOu+hI2SMwV6f91fdMKomnFHUlLwt1S4cibIO5j A==;
X-CSE-ConnectionGUID: Xn1CWjZQSGOC7knEJlx/JQ==
X-CSE-MsgGUID: UUNBu6/DTKWnJNkASb+gJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156451"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:37 -0800
X-CSE-ConnectionGUID: eqBEf9geTrG94pnk4kS0Ag==
X-CSE-MsgGUID: N15mP9IMS0Kn9vRa+O5xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956316"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:35 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 08/10] drm/i915/cmtg: enable cmtg ctl
Date: Tue,  3 Feb 2026 19:14:05 +0530
Message-Id: <20260203134407.2823406-9-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260203134407.2823406-1-animesh.manna@intel.com>
References: <20260203134407.2823406-1-animesh.manna@intel.com>
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

Enable CMTG through control register.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 3af4aefc760e..f7364c7408d5 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -244,6 +244,19 @@ static void intel_cpu_cmtg_transcoder_set_m_n(const struct intel_crtc_state *crt
 	intel_de_write(display, TRANS_LINKN1_CMTG(cpu_transcoder), m_n->link_n);
 }
 
+static void intel_cmtg_ctl_enable(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 val = 0;
+
+	val = intel_de_read(display, TRANS_CMTG_CTL(cpu_transcoder));
+
+	val |= CMTG_ENABLE;
+
+	intel_de_write(display, TRANS_CMTG_CTL(cpu_transcoder), val);
+}
+
 void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -261,4 +274,7 @@ void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 
 	/* Program Cmtg Sync to Port Sync, TRANS_CMTG_CTL */
 	intel_de_rmw(display, TRANS_CMTG_CTL(cpu_transcoder), CMTG_SYNC_TO_PORT, CMTG_SYNC_TO_PORT);
+
+	/* Program Enable Cmtg */
+	intel_cmtg_ctl_enable(crtc_state);
 }
-- 
2.29.0

