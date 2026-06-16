Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BDBCD98E6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF68910EAB6;
	Tue, 16 Jun 2026 12:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGB27Ejf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2340E10EAFC;
 Tue, 16 Jun 2026 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613932; x=1813149932;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1SCRIWldmdAVbd49yfKA6ZSKtMssvMroeByvTzEY9t4=;
 b=UGB27Ejf4pFOyoxTaBgv1mft55kNAZWUmdye3MmFGY9Zyk2Qbc914LK+
 5UWQLVkhHwQQnHOpjPUrqumWZBgGJDhMAkZ9bFaD33cPbuh4zQ9MllL0s
 ReqgR7RW/Sn9sOIG5UyGMFELRapsiudnNu6zeqH4Xt619gtiI8C0AeM2X
 rD6V66Q/HnCiQZvdwKbNtVeTWf/Um6I/qbNCHB4L1sofpkGxdHhyZx6CK
 1HKHfNkUVlJvB3HlrMsM3aC04ipR8oVtF9xu6AbZfqtCw30RWVocrEMxo
 1iRR9D9qJhLvYBR1IpCuao+XhgOOsJVpLg9FsP+fJXzDLsUVKnGNwjgK9 Q==;
X-CSE-ConnectionGUID: 5vDjMFrkRpWlxmIM6WAoRQ==
X-CSE-MsgGUID: nI4I+oppR+icYe6rlukjcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513240"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:32 -0700
X-CSE-ConnectionGUID: wezWc4VxRkWGAdUkj3C15A==
X-CSE-MsgGUID: znG9TEFfQnW1VgrKzvggVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876265"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:31 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 11/39] drm/i915/display: Rename cpu_transcoder parameter to
 transcoder in VRR fixed-rr path
Date: Tue, 16 Jun 2026 18:13:47 +0530
Message-ID: <20260616124416.2442161-12-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

intel_vrr_set_fixed_rr_timings() now takes the target transcoder as an
explicit argument rather than implicitly using crtc_state->cpu_transcoder,
so the parameter name 'cpu_transcoder' is misleading. Rename it to plain
'transcoder' to reflect that any transcoder may be programmed.

No functional change.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++----
 drivers/gpu/drm/i915/display/intel_vrr.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 60a92e8b1094..401a12aee700 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -320,18 +320,18 @@ int intel_vrr_fixed_rr_hw_flipline(const struct intel_crtc_state *crtc_state)
 }
 
 void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
-				    enum transcoder cpu_transcoder)
+				    enum transcoder transcoder)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
 	if (!intel_vrr_possible(crtc_state))
 		return;
 
-	intel_de_write(display, TRANS_VRR_VMIN(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VRR_VMIN(display, transcoder),
 		       intel_vrr_fixed_rr_hw_vmin(crtc_state) - 1);
-	intel_de_write(display, TRANS_VRR_VMAX(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VRR_VMAX(display, transcoder),
 		       intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
-	intel_de_write(display, TRANS_VRR_FLIPLINE(display, cpu_transcoder),
+	intel_de_write(display, TRANS_VRR_FLIPLINE(display, transcoder),
 		       intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
index 57c5e28378db..55e9c429f579 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.h
+++ b/drivers/gpu/drm/i915/display/intel_vrr.h
@@ -44,7 +44,7 @@ bool intel_vrr_is_fixed_rr(const struct intel_crtc_state *crtc_state);
 void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state);
 void intel_vrr_transcoder_disable(const struct intel_crtc_state *crtc_state);
 void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state,
-				    enum transcoder cpu_transcoder);
+				    enum transcoder transcoder);
 void intel_vrr_dcb_reset(const struct intel_crtc_state *old_crtc_state,
 			 struct intel_crtc *crtc);
 bool intel_vrr_always_use_vrr_tg(struct intel_display *display);
-- 
2.43.0

