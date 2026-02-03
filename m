Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E0E87836
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386A10E695;
	Tue,  3 Feb 2026 14:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYnd1ZAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522910E693;
 Tue,  3 Feb 2026 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128020; x=1801664020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wf6tRe9yoAXHFT/c5OMKr9r1Lihg95C/vlcDSqQBewQ=;
 b=IYnd1ZAXVJDEukDdhCpKSMUkWMC40TmnYj81dyKGT6KWKI7VELchNfMK
 HIGUW2+oqmpY8nn5uTcvEB7n2P/E02AJFINZr/hJN69a1C/9nLe4FODT7
 yoFwBVZFohtOxo809KuXZFhh6kDFxJKTVY+0WOE/HITvqYTtWVK9WMQLu
 p0f9/QDQsGW1Qt39/3/Penfdl22VmidU4se9r/jWcuUa/CxclfBjf8IG7
 7wA66Qw8vesKXfhhOwssNs/fcd9i+pQKYDhAdq48ckgU6mYEc3gv7CTqP
 SfzAF0vAn0AslfLOrr7i3RjhSrymHSuIQU/8TnUIRNx8p2zB7gRSsCBbU w==;
X-CSE-ConnectionGUID: L8uM9SxxSKymDCKlsVghkQ==
X-CSE-MsgGUID: W789qGpXS1+SLodmIWuUbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156454"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:40 -0800
X-CSE-ConnectionGUID: Z4dqkvAlQc+Rjbb4JW5rUw==
X-CSE-MsgGUID: mzTp/mkPTLetyRnjd2/nKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956321"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:38 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 09/10] drm/i915/cmtg: enable cmtg in secondary mode
Date: Tue,  3 Feb 2026 19:14:06 +0530
Message-Id: <20260203134407.2823406-10-animesh.manna@intel.com>
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

From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

Wait for CMTG_SYNC_TO_PORT bit clear in cmtg enable sequence
and then enable secondary mode for cmtg.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index f7364c7408d5..d1ec9b79cef2 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -277,4 +277,18 @@ void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 
 	/* Program Enable Cmtg */
 	intel_cmtg_ctl_enable(crtc_state);
+
+	if (intel_de_wait_for_clear_ms(display, TRANS_CMTG_CTL(cpu_transcoder),
+				       CMTG_SYNC_TO_PORT, 50)) {
+		drm_WARN(display->drm, 1, "CMTG:%d enable timeout\n", cpu_transcoder);
+		return;
+	}
+
+	/*
+	 *  eDP transcoder registers as secondary to CMTG by setting
+	 *  TRANS_DDI_FUNC_CTL2[CMTG Secondary Mode].
+	 */
+	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
+
+	drm_dbg_kms(display->drm, "CMTG:%d enabled\n", cpu_transcoder);
 }
-- 
2.29.0

