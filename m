Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B88E9A04C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924B510E6D9;
	Thu, 19 Feb 2026 13:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPQu0SX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDC810E6D9;
 Thu, 19 Feb 2026 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771506487; x=1803042487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=htgtctGjo0OPyz7EIZGlWgEFQxFWfUMbWDqGURTjXYk=;
 b=lPQu0SX6P+xTla3+bfkXY3xGBOAwG3raAqYsyl9JaW82K+slBvUA3gMT
 y1L4qoeM7Whj7FMLecds/rQWdvYO4+5UL7TT7rbm4acACegCCPa8utg3j
 6nDsXOmnJ0G5OxYcHqK1+jPIjL4ZeZnutGQ+ANQgvTqBF0nm8bAN6TCFO
 M0hApDl953TsVX7i+GW5aDTc4E6GkP8GZ4lIzpKCJdQBJ6niKSFvhkuEI
 +aKe/5PVNLM2hszbQxm62zhT3XlwDh+sO1p/88EdxwikclZhj+JQk2fg2
 YkE0D8TcJehVV7cfRy77PjufS7whz2uxPcURAbltRrCuzOa9/P0MbV8Lw g==;
X-CSE-ConnectionGUID: +GFQfGwtRGW8/pPMz+maiQ==
X-CSE-MsgGUID: JALSLqnCS8mmsMt1/ELvhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72475518"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72475518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:07 -0800
X-CSE-ConnectionGUID: /OM3W5gPSumjnmKgk6MjTg==
X-CSE-MsgGUID: wRRtY6lYSB6eis8yo5w81w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212458574"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.120])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:08:05 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 3/5] drm/i915/dsc: Convert intel_dsc_get_vdsc_per_pipe as
 non-static
Date: Thu, 19 Feb 2026 15:07:41 +0200
Message-ID: <20260219130743.1232188-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219130743.1232188-1-jouni.hogander@intel.com>
References: <20260219130743.1232188-1-jouni.hogander@intel.com>
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

We need to do some configurations on DSC when using PSR2/PR Selective
Update Early Transport. Convert intel_dsc_get_vdsc_per_pipe as non-static
to make it available for PSR code.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 7e53201b3cb1..f27ec0251613 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -467,7 +467,7 @@ intel_dsc_power_domain(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 		return POWER_DOMAIN_TRANSCODER_VDSC_PW2;
 }
 
-static int intel_dsc_get_vdsc_per_pipe(const struct intel_crtc_state *crtc_state)
+int intel_dsc_get_vdsc_per_pipe(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->dsc.slice_config.streams_per_pipe;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
index f4d5b37293cf..b70ac86ca9ab 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@ -44,5 +44,6 @@ unsigned int intel_vdsc_prefill_lines(const struct intel_crtc_state *crtc_state)
 int intel_dsc_get_pixel_rate_with_dsc_bubbles(struct intel_display *display,
 					      int pixel_rate, int htotal,
 					      int dsc_horizontal_slices);
+int intel_dsc_get_vdsc_per_pipe(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_VDSC_H__ */
-- 
2.43.0

