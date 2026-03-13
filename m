Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA89107BCC6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 16:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C752010E464;
	Fri, 13 Mar 2026 16:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaxvpjiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E919710E461;
 Fri, 13 Mar 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773417794; x=1804953794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mCG5pWLZ3OSPV5dZK6aZeKkZpWGc0KVs9Wz1rYLhSqw=;
 b=kaxvpjiW/0CDH49LOOdv68/mtzPBBg8JQcJqvH+DowM17lc4MSaR9/7c
 0Wq2OxpvLLcj+lA71ZuBpZ8F9QZlGccst6OLk/jcABSNEbGGlXKE8uVo+
 EmFdzxlDlotVmG2W/Rnq+jtmImfG0cdUAaGtH+4O1NPtEHPEjRvfPg6a8
 9KvotRSNwRRECOS384DjYp5wKE3/2qgjNManNx/Lsm7sOLXPl1AxcQcmb
 1njQt2Z8iybHdOsI2n58bR+P0MgAkYAA1DXRk3Vf5UjiWN5nXDumtYXb9
 BuT+yMorxJ7h0HVX3TjcehtRhN34e0ZU9TJCAfs0JyOX8uIukcc3WsNQ8 g==;
X-CSE-ConnectionGUID: j5Hy18rTTAGndnZXEQvilw==
X-CSE-MsgGUID: Pl5+OC+0R1C+/Ph4j4Jyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74715360"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74715360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 09:03:14 -0700
X-CSE-ConnectionGUID: nyLwBQsSQLWUaVQS3Aurqg==
X-CSE-MsgGUID: +rb83aBYT3+755TxHidUUw==
X-ExtLoop1: 1
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 09:03:12 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dibin.moolakadan.subrahmanian@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v3 07/12] drm/i915/cmtg: add a hook to enable ddi for CMTG
Date: Fri, 13 Mar 2026 21:02:55 +0530
Message-Id: <20260313153300.3530695-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260313153300.3530695-1-animesh.manna@intel.com>
References: <20260313153300.3530695-1-animesh.manna@intel.com>
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

Program DDI_FUNC_CTL2 to configure the eDP transcoder as secondary
to the CMTG transcoder.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index a802bf3e52e9..703828339d4d 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -334,3 +334,16 @@ void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state)
 			 transcoder_name(cpu_transcoder));
 	}
 }
+
+void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
+
+	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 64ff6a19948a..12abbafa7d08 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,7 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
-- 
2.29.0

