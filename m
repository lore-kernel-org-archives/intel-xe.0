Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395C1E87838
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50B910E689;
	Tue,  3 Feb 2026 14:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvQy4HSz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DFF10E695;
 Tue,  3 Feb 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128013; x=1801664013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UordhuqJabhdScAPutmaJd3SCzlCU630avxAxWMDQJA=;
 b=VvQy4HSzU7zfTqQsGUTuKxf+SgXMpRKj8/XD4zGAnDzrVIX3WqxjSh1F
 kwH/S5Y7luHlTYuNLas/uKwmwDhebke51r4dQb1uuSEfkixU41DvqMmN5
 9ALm7oz4VhOfY7NDmI+BTLYh5rnB8Cb8caZlPhgqq0hR1/MkqZVGikCAi
 3CVCIRoeSRAgfUPuh+XOKBUm/e5HtiHTKyMm3OaMy2sd2RRZJZOOAE9At
 X0AJ4PP1oL22KJaNyncxE2arg0V4KR9IJvZCLI98t2V3Q0MRmGQX8llWJ
 7tV3TH6KIDt3ax33U9xPIM6ROwLRpsYvzdord5OtsZFJbGKVnJ90Y9LwN g==;
X-CSE-ConnectionGUID: xsYr+xfnSpi/7q/BC5+hvA==
X-CSE-MsgGUID: kvpeNXUKTRC50Reb8bM6ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156446"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:32 -0800
X-CSE-ConnectionGUID: nWkFlFJ6Sr+SidF8RzD8MA==
X-CSE-MsgGUID: Qhan2wXQSeSopne/9hqoQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956309"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:30 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 06/10] drm/i915/cmtg: set transcoder mn for cmtg
Date: Tue,  3 Feb 2026 19:14:03 +0530
Message-Id: <20260203134407.2823406-7-animesh.manna@intel.com>
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

Program CMTG link M/N.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c      | 12 ++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index cb1376f4c13f..12a081dd7e4d 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -234,6 +234,16 @@ static void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state)
 	}
 }
 
+static void intel_cpu_cmtg_transcoder_set_m_n(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	const struct intel_link_m_n *m_n = &crtc_state->dp_m_n;
+
+	intel_de_write(display, TRANS_LINKM1_CMTG(cpu_transcoder), m_n->link_m);
+	intel_de_write(display, TRANS_LINKN1_CMTG(cpu_transcoder), m_n->link_n);
+}
+
 void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -246,4 +256,6 @@ void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 
 	intel_de_write(display, TRANS_SET_CTX_LATENCY_CMTG(cpu_transcoder),
 		       intel_de_read(display, TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder)));
+
+	intel_cpu_cmtg_transcoder_set_m_n(crtc_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index 3cfd8eedb321..b766ded8686c 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -32,6 +32,9 @@
 #define TRANS_VRR_VMIN_CMTG(id)		_MMIO(0x6F434 + (id) * 0x100)
 #define TRANS_VRR_FLIPLINE_CMTG(id)	_MMIO(0x6F438 + (id) * 0x100)
 
+#define TRANS_LINKM1_CMTG(id)          _MMIO(0x6F040 + (id) * 0x100)
+#define TRANS_LINKN1_CMTG(id)          _MMIO(0x6F044 + (id) * 0x100)
+
 #define TRANS_SET_CTX_LATENCY_CMTG(id) _MMIO(0x6F07C + (id) * 0x100)
 
 #endif /* __INTEL_CMTG_REGS_H__ */
-- 
2.29.0

