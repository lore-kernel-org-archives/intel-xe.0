Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83088C88E71
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 08:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E85D10E3B3;
	Mon, 26 Jan 2026 08:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM4Y1dRO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF310E3B0;
 Mon, 26 Jan 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769414449; x=1800950449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=df6FZ6LEpj3fnW1u7SwpE4gf/2heeWTTUId6a3oClJQ=;
 b=kM4Y1dROIWoIzFmccc0DuVZCTM8c0WfRWjplEP6kAsQGpgP/nDsv7qEO
 JmLEkPB8BXO1myHwvsZfTWMpz75D3X5fXS6EqrjcHPMAH/EZlnTzBwWHU
 09sOvMKUZuDzFdGSy03u4/oaUvbp2jCEh+ngXatfGrQzOe/dnVobzlbuQ
 hZmtHgsDP6p6RVDICcFfxD2JV9zB3RJty8cd4b8Zdo6AoevudvF5mI4Bn
 LEp7VY/Eo5L8UaPPG3yoHA+AJ/9W3ECJ4vOPtrrm4kGkDBk+SI5E08Yzc
 ebqLPeMbwNVgnfGcXJn3H5S5LVCe59U/LYTBLuUyPbR2VgJMwnXgQWVvT A==;
X-CSE-ConnectionGUID: XK52SolFQvab6RUvJffQbQ==
X-CSE-MsgGUID: 0CfGxVapRZekfuxYR1poeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70682864"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="70682864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:48 -0800
X-CSE-ConnectionGUID: 55kE7FetQTi5FA0TMfuCQQ==
X-CSE-MsgGUID: /f5qxS/nSH+2rxJznZrhUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; d="scan'208";a="207867718"
Received: from krybak-mobl1.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.246.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 00:00:46 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v10 09/10] drm/i915/display: Add
 HAS_PSR_TRANS_PUSH_FRAME_CHANGE macro
Date: Mon, 26 Jan 2026 09:59:58 +0200
Message-ID: <20260126075959.925413-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126075959.925413-1-jouni.hogander@intel.com>
References: <20260126075959.925413-1-jouni.hogander@intel.com>
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

Add macro telling platform supports triggering Frame Change event using
Trans Push mechanism.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 6c74d6b0cc48..13558bc648ab 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -196,6 +196,7 @@ struct intel_display_platforms {
 #define HAS_PSR(__display)		(DISPLAY_INFO(__display)->has_psr)
 #define HAS_PSR_HW_TRACKING(__display)	(DISPLAY_INFO(__display)->has_psr_hw_tracking)
 #define HAS_PSR2_SEL_FETCH(__display)	(DISPLAY_VER(__display) >= 12)
+#define HAS_PSR_TRANS_PUSH_FRAME_CHANGE(__display)	(DISPLAY_VER(__display) >= 20)
 #define HAS_SAGV(__display)		(DISPLAY_VER(__display) >= 9 && \
 					 !(__display)->platform.broxton && !(__display)->platform.geminilake)
 #define HAS_TRANSCODER(__display, trans)	((DISPLAY_RUNTIME_INFO(__display)->cpu_transcoder_mask & \
-- 
2.43.0

