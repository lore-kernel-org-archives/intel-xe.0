Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827B0C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 08:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145D10E392;
	Mon,  3 Mar 2025 08:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mveLeT4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4A810E392;
 Mon,  3 Mar 2025 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740992259; x=1772528259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UUY4aNP96g5klPO5A2zdCQVNd0cwpdDnzN6WiCcjHxs=;
 b=mveLeT4lUNeYp3zpqYw05CJdwmtissPUSdY61zT6esfjsdgFejfh4DMP
 yMHPPCLuRAUu4aP8ADBLATIQTQ2ijS23f2lwYnNpaKTs+kUX+8vJnaVR7
 5aEFnpvr4x/Pi37+rYGe8hw1xXE/PpplciEIzT3Gpoc1b8kqhVIip8EIf
 /UTslcwSXhZqfvqUow2EjtxbD+EPEZzlvSHDX9BBVsEg14EkcIVLDlZxT
 p2X3PsSwpIQAmmWBSzAlnv/LgsRk/Y272OL9QpeIAiuqNyPQs75VgsKLN
 5DZ83EodKv5h9fr7hmG0rvTAnBDoQH9DPLIU9K141Xj95WjrWYPn7dG+M g==;
X-CSE-ConnectionGUID: AQ7+Cc3xSFGx8fXsuBvABw==
X-CSE-MsgGUID: ZYaNmRlASN6Rox53JOZaWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41770031"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41770031"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 00:57:39 -0800
X-CSE-ConnectionGUID: tfMyK7XHRvuBtbX8Mrltmw==
X-CSE-MsgGUID: rpXGnOJdTcSCWzONVB6CEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117949566"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2025 00:57:37 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, jeevan.b@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 3/8] drm/i915/lobf: Add fixed refresh rate check in
 compute_config()
Date: Mon,  3 Mar 2025 14:05:17 +0530
Message-Id: <20250303083522.845224-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20250303083522.845224-1-animesh.manna@intel.com>
References: <20250303083522.845224-1-animesh.manna@intel.com>
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

LOBF can be enabled with vrr fixed rate mode, so add check
if vmin = vmax = flipline in compute_config().

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index d2f133bc5f38..c2862888466f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -288,6 +288,10 @@ void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
 	if (crtc_state->has_psr)
 		return;
 
+	if (crtc_state->vrr.vmin != crtc_state->vrr.vmax ||
+	    crtc_state->vrr.vmin != crtc_state->vrr.flipline)
+		return;
+
 	if (!(intel_alpm_aux_wake_supported(intel_dp) ||
 	      intel_alpm_aux_less_wake_supported(intel_dp)))
 		return;
-- 
2.29.0

