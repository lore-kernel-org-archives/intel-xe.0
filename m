Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44663C55ABF
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454B10EC89;
	Wed,  5 Aug 2026 04:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1zNXOQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE8510E14C;
 Wed,  5 Aug 2026 04:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902848; x=1817438848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3H9vNDYFEmW1RYk1h8hkllsDMtAz+FZ1LdFsbw9BzF8=;
 b=i1zNXOQFypMJfVn3v/A/1BexMW0CaLmVBXbFzuKN7bi/cArmzXtp1Enc
 1xhxXQcDNtkRMdwNwJi9NyOUHpps2KmCLe3D/fEYUKlEasbAEw4Z+bwQp
 2KHIHbHYp4KCdZbONKGCgZfIvWkQnIILetIUhi5SVCc6HZeHp2o+e9erE
 MjjnXRrV/fJEBPUBPlUfg3DnBWo2vGrTIOd5nsuQoXvSzbUilBYeYG8fk
 nt1gIqq6IJtVLJKS0cofrD/GLh+7k4Y1ZoJ5SF9LFIbB475afnm+z1XKe
 BNY3TsRLOAdEkLJgjx3lEHWEy+SWpreyd9oOYrvT+dzzb0cCxvIzF3Jex A==;
X-CSE-ConnectionGUID: /rH4XuP1RnmeX+iqun/V3g==
X-CSE-MsgGUID: QHJfy82gQhuG0Eyt9sRitA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143522"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:28 -0700
X-CSE-ConnectionGUID: HaBxqoA/T26rSES3ehnWdg==
X-CSE-MsgGUID: UJqBt0yNTOS9k/PT9pRCVA==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:25 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 1/5] drm/i915/hdmi: Use correct type for output_format
 parameter
Date: Wed,  5 Aug 2026 09:20:23 +0530
Message-ID: <20260805035027.3473398-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
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

Correct the data-type of the argument output_format to enum, for the
function intel_hdmi_dsc_get_bpp().

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8a019d3574df..9af0f3aba0fc 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3338,8 +3338,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
-		       int output_format, bool hdmi_all_bpp,
-		       int hdmi_max_chunk_bytes)
+		       enum intel_output_format output_format,
+		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
 {
 	int max_dsc_bpp, min_dsc_bpp;
 	int target_bytes;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index 0fa3661568e8..fb950fdd0e7a 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -54,8 +54,8 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink);
 int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_format);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
-			   int num_slices, int output_format, bool hdmi_all_bpp,
-			   int hdmi_max_chunk_bytes);
+			   int num_slices, enum intel_output_format output_format,
+			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
 int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
-- 
2.50.1

