Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626DEE87837
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1173410E68E;
	Tue,  3 Feb 2026 14:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkkZI3ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91C710E68E;
 Tue,  3 Feb 2026 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128011; x=1801664011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4O24omxODgCCjyppIhrufdcFQnFRXL5CUUFvYipKpZk=;
 b=jkkZI3ti4+5RMQ+Uzt6Tyj5WKAW8k9S8KtIG6uod2GsMJKCd8iU4BG86
 oZyw2HfRxgjHv2tKtElZpj7nBrgSGLrPUJYXrhKCqEElEx3mqwDSUzGkq
 XM0cp2d4ZSI/1z0jAkdrcCBmCzBaxmbMo++7NvFsdKEUs/ICQuQ5j4Iw0
 +EAhe6aEG0ENGCjeCW6aFHyz1dqY+BIJAHnu1oq4XESmiK+7SIKq6iaJ8
 SXL+MFMb3W/UVIleWMu6tH6s+l7dLp39a05LN8kaXcDcT9JARBcw4yZcB
 1KuG8PdSSv0DQiojRKSH4zF47lUu28v7b5RWLSL8uZKqpjDQ0bQUfAiIB Q==;
X-CSE-ConnectionGUID: eW8ZADrDSAWJfqXOVRFW5w==
X-CSE-MsgGUID: uVCDngLuRXyM4uHB6H5FEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156444"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:30 -0800
X-CSE-ConnectionGUID: VzECrJF6S0GjqqAyt57Bxg==
X-CSE-MsgGUID: yyS6P7alSBSIJrdlKudsHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956306"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:28 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 05/10] drm/i915/cmtg: program set context latency of cmtg
Date: Tue,  3 Feb 2026 19:14:02 +0530
Message-Id: <20260203134407.2823406-6-animesh.manna@intel.com>
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

Program context latency for delayed vblank timings to create window2.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c      | 4 ++++
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 26adf70cdd00..cb1376f4c13f 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -236,10 +236,14 @@ static void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state)
 
 void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (cpu_transcoder != TRANSCODER_A && cpu_transcoder != TRANSCODER_B)
 		return;
 
 	intel_cmtg_set_timings(crtc_state);
+
+	intel_de_write(display, TRANS_SET_CTX_LATENCY_CMTG(cpu_transcoder),
+		       intel_de_read(display, TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder)));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index eab90415d0da..3cfd8eedb321 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -32,4 +32,6 @@
 #define TRANS_VRR_VMIN_CMTG(id)		_MMIO(0x6F434 + (id) * 0x100)
 #define TRANS_VRR_FLIPLINE_CMTG(id)	_MMIO(0x6F438 + (id) * 0x100)
 
+#define TRANS_SET_CTX_LATENCY_CMTG(id) _MMIO(0x6F07C + (id) * 0x100)
+
 #endif /* __INTEL_CMTG_REGS_H__ */
-- 
2.29.0

