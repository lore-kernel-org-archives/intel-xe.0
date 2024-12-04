Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A15E7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 09:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FC610EC96;
	Wed,  4 Dec 2024 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzqiFPBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8410EC96;
 Wed,  4 Dec 2024 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733304260; x=1764840260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DcpQkVCAYxlEsa76sbGHuBOSkuo9udqlr2rfOplizXo=;
 b=YzqiFPBqAiRirjFBVVa9gzFXogcRhjfwI4C2cdKyxXasB3gZo8OgdNST
 gUU6lyhtE0m7HB8+bTYwY8QZwLLx7T71vhzR3b4EpdPbeMKAujBsDIct1
 2mGuESaixsw5tn9bE/P3DPdpbIAvxqonUybHv37AmEpnHfWXBk+CNZG/Z
 3uSlGOw6zC96Ax5kUSpdE5iJs3OpvUoKkAxgNkfbU7QeHZMOluzB2VIk1
 vSoM8SjkkRX0pmyucZeZPAgkk5isxKjo1ORO3JAvyya/W3zGT02H+LxGW
 PCuFq9JIjkUhay08OYlDhX0/hDfHSGxBbqp3Q7vEmhrR7lpcKsADtpn+A A==;
X-CSE-ConnectionGUID: jXHL0zs+TQqMDq6VNlLnXA==
X-CSE-MsgGUID: CNJpUMD7SIeYA6eX8YJD4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44038474"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44038474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 01:24:20 -0800
X-CSE-ConnectionGUID: YQBxh2UGSi2G/ZAhx20oHA==
X-CSE-MsgGUID: d9vFQ0IvS7KEkwW2onvDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93555176"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 01:24:18 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, suraj.kandpal@intel.com,
 jani.nikula@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 12/14] drm/i915/dp: Use clamp for pipe_bpp limits with DSC
Date: Wed,  4 Dec 2024 14:56:40 +0530
Message-ID: <20241204092642.1835807-13-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204092642.1835807-1-ankit.k.nautiyal@intel.com>
References: <20241204092642.1835807-1-ankit.k.nautiyal@intel.com>
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

Currently to get the max pipe_bpp with dsc we take the min of
limits->pipe.max_bpp and dsc max bpp (dsc max bpc * 3). This can result
in problems when limits->pipe.max_bpp is less than the computed dsc min bpp
(dsc min bpc * 3).

Replace the min/max functions with clamp while computing
limits->pipe.max/min_bpp to ensure that the pipe_bpp limits are constrained
within the DSC-defined minimum and maximum values.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c5740b8d2315..8da85eee65a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2512,8 +2512,11 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct intel_dp *intel_dp,
 	int dsc_min_bpc = intel_dp_dsc_min_src_input_bpc();
 	int dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(display);
 
-	limits->pipe.max_bpp = min(limits->pipe.max_bpp, dsc_max_bpc * 3);
-	limits->pipe.min_bpp = max(limits->pipe.min_bpp, dsc_min_bpc * 3);
+	limits->pipe.max_bpp = clamp(limits->pipe.max_bpp,
+				     dsc_min_bpc * 3, dsc_max_bpc * 3);
+
+	limits->pipe.min_bpp = clamp(limits->pipe.min_bpp,
+				     dsc_min_bpc * 3, dsc_max_bpc * 3);
 }
 
 static bool
-- 
2.45.2

