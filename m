Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB11C4452D
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 06:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308C710EC7C;
	Wed, 22 Jul 2026 06:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3XOAHZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2210E404;
 Wed, 22 Jul 2026 06:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784702520; x=1816238520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SwR0G/RFriirWU50Po+QaoT/JslAut5Vu6mSHiwy3w4=;
 b=F3XOAHZfEeXBdqBcM/CPEP54Z7IO9H5RC3wgwQKXANP3q3VQnu59Ddgl
 dTwnhGN40+FRv8kpUpdr8dWlMoVenz5zNgeI1OPqms+9YD8N/ml9gus/q
 LpVplJgdoQk3TdTTRvMUFA4zYL7pyslU7BynVYNtWzGD8wG8TS+KloQ7g
 dGzG9s//ss9muKXwDuN5D3rthVpi+7EPCNXpyN9XRrv47Plq1ie+jd8Uz
 7gv24NTXraTzhAfAs8EQSPByd7fVS70lwZ8+db95rw+mcGj6ysC79joG1
 +XmfsAADGdl4i2/hlIQ3Gk20og/wBT2KV7PVbLgiAUVGL28odn0XjCaAZ Q==;
X-CSE-ConnectionGUID: dX9xztxfQ7OMJoLeDr3Q8Q==
X-CSE-MsgGUID: zwN0nFuYQxe101KL8cxDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="102875327"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
 d="scan'208,223";a="102875327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:41:58 -0700
X-CSE-ConnectionGUID: fvylb5KeTFexzBzF5sZZqg==
X-CSE-MsgGUID: HN5RRQrVRjqzX0KDgaJxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
 d="scan'208,223";a="254096715"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:41:57 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, chaitanya.kumar.borah@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2] drm/i915/display: Ensure a non-zero safe window from PTL
 onwards
Date: Wed, 22 Jul 2026 11:54:49 +0530
Message-ID: <20260722062449.1166411-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
References: <20260720081803.1123264-1-ankit.k.nautiyal@intel.com>
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

From PTL onwards, the set context latency can be in the vactive region,
letting the safe window start some lines before the vblank start. The DSB
waits on this safe window instead of vblank (bits [15:14] select the safe
window signal from the DPT unit to start the DMA engine).

With modes that have a smaller vblank region, the computed guardband is
clamped to the vblank length, making the undelayed and delayed vblank
coincide. If the SCL is also 0, the 'safe window' becomes effectively 0,
and the DSB configured to wait for it gets stalled, since the hardware
never signals the safe window, leading to:

  *ERROR* [CRTC:159:pipe A] flip_done timed out
  *ERROR* [CRTC:159:pipe A] DSB 0 timed out waiting for idle

Keep the set context latency at a minimum of 1 to avoid this.

v2: Fix the bit numbers and correct the commit message. (Chaitanya)

Fixes: 4a68c7516c57 ("drm/i915/dsb: Use safe window path when VRR TG is used")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Assisted-by: GitHub-Copilot:Claude-Opus-4.8
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 38763a6802c5..0822a2194c7f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2459,6 +2459,19 @@ static int intel_crtc_set_context_latency(struct intel_crtc_state *crtc_state)
 	set_context_latency = max(set_context_latency,
 				  intel_psr_min_set_context_latency(crtc_state));
 
+	/*
+	 * From PTL onwards, the set context latency can be in the vactive
+	 * region, letting the safe window start some lines before the vblank
+	 * start. With modes that have a smaller vblank region, the computed
+	 * guardband is clamped to the vblank length, making the undelayed and
+	 * delayed vblank coincide. If the SCL is also 0, the 'safe window'
+	 * becomes effectively 0, and the DSB configured to wait for it gets
+	 * stalled, since the hardware never signals the safe window. Keep the
+	 * set context latency at a minimum of 1 to avoid this.
+	 */
+	if (DISPLAY_VER(display) >= 30)
+		set_context_latency = max(1, set_context_latency);
+
 	return set_context_latency;
 }
 
-- 
2.50.1

