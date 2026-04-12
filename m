Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7592E937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB110E2AC;
	Sun, 12 Apr 2026 11:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBXICw/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6534910E2AB;
 Sun, 12 Apr 2026 11:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992077; x=1807528077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WrvyRKbEHkYhUzKV25ngJOGHpL5utDLZ+GlH23Vtok4=;
 b=IBXICw/nvy+5CIGanVS5eXg/rzfVYs+yyZe8e5KIjMQ/J3IlH/kaWpjd
 R8Ge6Ylcf62RUpA3zj1snquupqu5eXXY/luRKiEM1D17HUYauxgz80i6l
 bFJXoJY6T4JE11TbqKe/5yOpUQMrV0cq/dsUV9aEUv9UQMN09ULiA4311
 AcI4qY4q3DNa/7SJnNWOVFolGq0Kw2gQZ+k7ugAETyDZCld+NrT55L3Hq
 w5aE3OjZRYfr4loy62j42AImiI2M88X/KkhZ75nPsBjZfNyiD++C/7cNG
 ikuf7fGgktyBS5poyPdWKd+hc4feWCRbgvvlDOs8du0uZvvI576B3Pzb6 Q==;
X-CSE-ConnectionGUID: NL6AfwxrSzWcr8oOsSB+aw==
X-CSE-MsgGUID: kGaF4n6eQvGwyUBstGmIyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115119"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:07:56 -0700
X-CSE-ConnectionGUID: GrlG+E+EQemwqla8cM7hxg==
X-CSE-MsgGUID: AIhJ4BXPTWuiC09nfTQtOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507725"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:07:54 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 05/13] drm/i915/cmtg: Set transcoder mn for CMTG
Date: Sun, 12 Apr 2026 16:07:04 +0530
Message-Id: <20260412103712.4021213-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
References: <20260412103712.4021213-1-animesh.manna@intel.com>
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

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c      | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h      |  1 +
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h |  9 +++++++++
 drivers/gpu/drm/i915/display/intel_display.c   |  1 +
 4 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index c5ef9de2e408..aecee4157405 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -314,3 +314,16 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
 
 	intel_de_write(display, TRANS_VRR_CTL_CMTG(cpu_transcoder), vrr_ctl);
 }
+
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	const struct intel_link_m_n *m_n = &crtc_state->dp_m_n;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_de_write(display, TRANS_LINKM1_CMTG(cpu_transcoder), m_n->link_m);
+	intel_de_write(display, TRANS_LINKN1_CMTG(cpu_transcoder), m_n->link_n);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index c92e3a62ff0d..6796eb727eef 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr);
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index b50ada371262..b6a549aec033 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -45,6 +45,15 @@
 #define TRANS_VSYNC_CMTG(trans)		_MMIO_TRANS((trans), \
 						    _TRANS_VSYNC_CMTG_A, _TRANS_VSYNC_CMTG_B)
 
+#define _TRANS_LINKM1_CMTG_A		0x6F040
+#define _TRANS_LINKM1_CMTG_B		0x6F140
+#define TRANS_LINKM1_CMTG(trans)	_MMIO_TRANS((trans), \
+						    _TRANS_LINKM1_CMTG_A, _TRANS_LINKM1_CMTG_B)
+#define _TRANS_LINKN1_CMTG_A		0x6F044
+#define _TRANS_LINKN1_CMTG_B		0x6F144
+#define TRANS_LINKN1_CMTG(trans)	_MMIO_TRANS((trans), \
+						    _TRANS_LINKN1_CMTG_A, _TRANS_LINKN1_CMTG_B)
+
 #define _TRANS_SET_CTX_LATENCY_CMTG_A	0x6F07C
 #define _TRANS_SET_CTX_LATENCY_CMTG_B	0x6F17C
 #define TRANS_SET_CTX_LATENCY_CMTG(trans)	_MMIO_TRANS((trans), \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index bf58ae5d3535..e8470b7ce13f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1615,6 +1615,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 					       &crtc_state->dp_m2_n2);
 	}
 
+	intel_cmtg_set_m_n(crtc_state);
 	intel_set_transcoder_timings(crtc_state);
 
 	if (cpu_transcoder != TRANSCODER_EDP)
-- 
2.29.0

