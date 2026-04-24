Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902F6FE51F4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E310EFCA;
	Fri, 24 Apr 2026 09:31:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nILlWpkp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBE10ED80;
 Fri, 24 Apr 2026 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777023090; x=1808559090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vXK6PQ9+ieMSCgXS/b2U+R9UAXUrgo/WiNU0fk90m5A=;
 b=nILlWpkpIBHEbCV8wINUYEVanvX+m2zM/j2rHlKbFLtr+r81pMbQNOq5
 K4FiUtiX9Rqnen2JsAdOp5M8OkO3IysgWtLId9RSysvP9HAdPyWBPA/J6
 fx72mHl8SoCUkIQC7O5Jt1r9i7drSQjKU1mxq5L7N+VRKZrCRhZRrsGE5
 SmVDdk6oTd1NNLRG2RvRVyOqA+H9cirwucu8cs0bb7AdKxfJp+dwgq2Jv
 b7SYDVAbsrth1UaELN+MwBOx/yoARV2zbva9pZptzz8q1h0ZgKm2ANgry
 Pt6uRHiqV8yv7MjMHSEuLb51Z2okMrIs/sbbtLtLV9/vMDRFt/fZy1Z+X g==;
X-CSE-ConnectionGUID: RQaLGL3KQg+1TN+Csn2KfA==
X-CSE-MsgGUID: 5pcF35AbR3a57LHfH3GaYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81859285"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81859285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:31:30 -0700
X-CSE-ConnectionGUID: 8H5+MV1pTJ+D1qwclHoM+Q==
X-CSE-MsgGUID: zuOCIOFHT4qota9715YEoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="228572885"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:31:28 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/7] drm/dp: AS SDP cleanups and additions for Panel Replay +
 VRR
Date: Fri, 24 Apr 2026 14:46:39 +0530
Message-ID: <20260424091646.3060549-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a subset of patches separated from the series at
https://patchwork.freedesktop.org/series/164512/ for merging.

These are drm-core (drm/dp) patches that clean up and extend the
Adaptive Sync SDP definitions and helpers in preparation for
Panel Replay + VRR support.

Ankit Nautiyal (7):
  drm/dp: Rename and relocate AS SDP payload field masks
  drm/dp: Clean up DPRX feature enumeration macros
  drm/dp: Add bits for AS SDP FAVT Payload Fields Parsing support
  drm/dp: Add DPCD for configuring AS SDP for PR + VRR
  drm/dp: Store coasting vtotal in struct drm_dp_as_sdp
  drm/dp: Add a helper to get the SDP type as a string
  drm/dp: Add target_rr_divider field in AS SDP logging

 drivers/gpu/drm/display/drm_dp_helper.c | 39 ++++++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp.c |  4 +--
 include/drm/display/drm_dp.h            | 20 +++++++++----
 include/drm/display/drm_dp_helper.h     |  1 +
 4 files changed, 52 insertions(+), 12 deletions(-)

-- 
2.45.2

