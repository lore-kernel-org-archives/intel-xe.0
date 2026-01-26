Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7D9C88E6B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 08:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5624010E3A5;
	Mon, 26 Jan 2026 08:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4YvKNCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5694F10E3A4;
 Mon, 26 Jan 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769414438; x=1800950438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOQAoMbsXpG3V7ZjuTftJkayYMgqNXoYKtZsP8aQJ2Q=;
 b=B4YvKNChDK7tugCNIlBy9h0Yy7jCIQPHQuSWS3wAtTjeTT+XDvMRtjIf
 xNND/P5UICpNI4fMLv1/XH9ZmplCuI6O4Oq+2LylWer89VLNFh3L5kHWf
 CGbMk92q3K6TFK9CGodPnQF6HhmEzjR1V1Q5NfE3aKU+O4cEum/rqMvk8
 ijn6P55b9n7Z6uWftXRFxmC5sPJiyZBs755GMONPAo814BW2mYG8oJPix
 kH4poGRU1QyTc/MoFOLTcIIqpfqff7ICXpWyXOR0+etcBfrXcKT9qkMQP
 hsJYxrSvfyt3jrlVRdCFG0p/280+19LllJzQ7jXmZVTqEvnyFkE+ykedC A==;
X-CSE-ConnectionGUID: BoCTbeGGQQ2AoctW6uoubQ==
X-CSE-MsgGUID: LNiWQwsnR4+45gU/ir2W4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70682842"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70682842"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:37 -0800
X-CSE-ConnectionGUID: cVfAN7EXTSmBfEmE5ppDTQ==
X-CSE-MsgGUID: huTpfLvtSHq/F7FJcuTt2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207867655"
Received: from krybak-mobl1.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:34 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v10 02/10] drm/i915/psr: Add intel_psr_use_trans_push to query
 if TRANS_PUSH is used
Date: Mon, 26 Jan 2026 09:59:51 +0200
Message-ID: <20260126075959.925413-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126075959.925413-1-jouni.hogander@intel.com>
References: <20260126075959.925413-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This is a preparation to start using trans push as a PSR "Frame Change"
event. It adds intel_psr_use_trans_push placeholder which return false for
now until we have everything in place.

v2:
  - modify commit message
  - add TODO

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 62208ffc5101..b0d72c04db45 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4562,3 +4562,9 @@ int intel_psr_min_guardband(struct intel_crtc_state *crtc_state)
 
 	return psr_min_guardband;
 }
+
+bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state)
+{
+	/* TODO: Enable using trans push when everything is in place */
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index b41dc4d44ff2..394b641840b3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -85,5 +85,6 @@ bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state);
 int intel_psr_min_guardband(struct intel_crtc_state *crtc_state);
+bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.43.0

