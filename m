Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D02C76188
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB43B10E9FE;
	Wed,  5 Apr 2023 15:40:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1F510E9FE
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709238; x=1712245238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uThg+17Lo/nW5CPr4Q5arRBBUOEnElNmEzdXv1mSo+s=;
 b=Jxp028REr2huWeF1z7rSgfNHuswaVrv37gl0+wjZKc4O5/W3JZ9HqVyA
 jKuAgxGgLNQghJ7VZhdq0CfGmUXuR1zkz1RPr6JpZQtOSFZ4OAHTjkGfV
 fw+zvsslXhtQbEP4xXk5t5FjsCFlq11i7DhlvAPFyuiMblExIY7GfGYlo
 ygWEdur2AvggYNxuv2qrAdQzgIPDKOnT+9GzCgBWXekIgftu2/vh8tAkV
 SSyMPD+mFDFiKWTOXAIaEH/5IZAmZEq6kqnza2IKOXB2APMRuPQEOcWlF
 afKASuMtXmI21amRqnwhHwz0zRrJmOXLzRygbQ5KxEVIUCVYokVolX2ku A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865235"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865235"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689327720"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="689327720"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:40:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:13 +0300
Message-Id: <20230405153920.926583-15-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/21] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_pch_display.h ifdef cleanup

To be replaced with better conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch_display.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.h b/drivers/gpu/drm/i915/display/intel_pch_display.h
index e8b50e9a4969..41a63413cb3d 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.h
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.h
@@ -15,7 +15,6 @@ struct intel_crtc;
 struct intel_crtc_state;
 struct intel_link_m_n;
 
-#ifdef I915
 bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 			     enum pipe pch_transcoder);
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc);
@@ -42,20 +41,5 @@ void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n);
 
 void intel_pch_sanitize(struct drm_i915_private *i915);
-#else
-#define intel_has_pch_trancoder(xe, pipe) (xe && pipe && 0)
-#define intel_crtc_pch_transcoder(crtc) ((crtc)->pipe)
-#define ilk_pch_pre_enable(state, crtc) do { } while (0)
-#define ilk_pch_enable(state, crtc) do { } while (0)
-#define ilk_pch_disable(state, crtc) do { } while (0)
-#define ilk_pch_post_disable(state, crtc) do { } while (0)
-#define ilk_pch_get_config(crtc) do { } while (0)
-#define lpt_pch_enable(state, crtc) do { } while (0)
-#define lpt_pch_disable(state, crtc) do { } while (0)
-#define lpt_pch_get_config(crtc) do { } while (0)
-#define intel_pch_transcoder_get_m1_n1(crtc, m_n) memset((m_n), 0, sizeof(*m_n))
-#define intel_pch_transcoder_get_m2_n2(crtc, m_n) memset((m_n), 0, sizeof(*m_n))
-#define intel_pch_sanitize(xe) do { } while (0)
-#endif
 
 #endif
-- 
2.39.2

