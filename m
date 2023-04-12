Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16C5C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA3310E835;
	Wed, 12 Apr 2023 14:28:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1659810E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309683; x=1712845683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sZ5J/UkXeiDBMtE1s9lx3cUbsw8Ugsa3kmvuzH4Hiqo=;
 b=BCCP7C7N9PavCB3lR4/NdfAfahRUs3AkUNmke6sJecCIPp6DugEnMXN3
 MRSpg0UkfjSRu6SzQBXRRu4bwiAE+qM/5z7EuVZuGy5O3d3DZv/dOQkfX
 cQ93olRy/v73k7G9dgUR6C6ZgA9WSygWSSAj8CHpfOhSYV2cO6f/lOXeE
 x4dLGAe8z1MR/iRRPG3cKQchqMv0Us9DUfOc4lrBiCZlt5roY1FXJzOKg
 5YdMx9IRQ6tr8bCAl9J+G8fsacN+kJ33m/OO6ti2mIxF0gd+tBe+3Ytma
 8WwqOBitryJxtDjUmxXzispaoj/5EHBiwedi/gipq5529CXP4P5aPOcLB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430198354"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430198354"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863322924"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="863322924"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:28:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:06 +0300
Message-Id: <20230412142006.877109-42-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 41/41] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_trace.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index e5b97ac87dc5..651ea8564e1b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -186,7 +186,6 @@ TRACE_EVENT(intel_memory_cxsr,
 		      __entry->frame[PIPE_C], __entry->scanline[PIPE_C])
 );
 
-#ifdef I915
 TRACE_EVENT(g4x_wm,
 	    TP_PROTO(struct intel_crtc *crtc, const struct g4x_wm_values *wm),
 	    TP_ARGS(crtc, wm),
@@ -279,7 +278,6 @@ TRACE_EVENT(vlv_wm,
 		      __entry->primary, __entry->sprite0, __entry->sprite1, __entry->cursor,
 		      __entry->sr_plane, __entry->sr_cursor)
 );
-#endif
 
 TRACE_EVENT(vlv_fifo_size,
 	    TP_PROTO(struct intel_crtc *crtc, u32 sprite0_start, u32 sprite1_start, u32 fifo_size),
-- 
2.39.2

