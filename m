Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1E6CD4F50
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CA310E59F;
	Mon, 18 May 2026 04:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9lu7mI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998B910E59C;
 Mon, 18 May 2026 04:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077375; x=1810613375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qq9uHXNrcrkHQDxOSbjw+4P+SUOjr5H5Gx4VTHOkreY=;
 b=U9lu7mI8t1oikIGkbZf1tc2j50L1fS7/uVN+A8/tLh6BfGYkFDp2uz9O
 Omv51a+syHBEUk+XAIJzIIrP6soHWoK0QwY0A5Crcmzat4Qt14XTd5kBF
 LxEDcz0UBvnpJFqm4DSltqG9Ydbkk5pdcaGlO0B9wqWLM3rI9HiM6SYGe
 j3DlRbsBpPnZQMUNx0aG2Z6mi/qByRSEcLpv6EIqY2+EqUPZV16QdhTdy
 ek42fPkPgc4XANTabmKRdachWj8ZWVov/nZaBV5HHl+L59MdK2WAp0qbN
 LfBjGCe/rZlU79VK526iSWSaTAUAB5Ej1Ihk5Qrt2vhVTzs/+MmAnqflG w==;
X-CSE-ConnectionGUID: +ilfhncFQfe7+CCmZqa+PA==
X-CSE-MsgGUID: owhF9sZ0RXmk1cfX7yfTtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495610"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495610"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:35 -0700
X-CSE-ConnectionGUID: XtL2YrYuRBiV419oLTPMZA==
X-CSE-MsgGUID: sRsuTEBuSd+XAYJBnvtszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403524"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/11] drm/i915/dp: Allow AS SDP only if v2 is supported
Date: Mon, 18 May 2026 09:24:53 +0530
Message-ID: <20260518035502.2909359-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
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

We do not support AS SDP version 1, so allow AS SDP only if AS SDP v2 is
supported.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 92a650a728d8..d1b40db7e2a3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3172,7 +3172,7 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
 				  struct intel_crtc_state *crtc_state)
 {
-	if (!intel_dp->as_sdp_supported)
+	if (!intel_dp->as_sdp_v2_supported)
 		return false;
 
 	/*
-- 
2.45.2

