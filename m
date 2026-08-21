Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ADCC5DF88
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4945A10F218;
	Fri, 21 Aug 2026 04:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ5RAQYK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586210F210;
 Fri, 21 Aug 2026 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787287872; x=1818823872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/EbSTrIelztdpBLVTFhymkTRHTRO6r5cA7NrfqLXiU=;
 b=YQ5RAQYKBW9b1VOm9Hunw38HmjA16kIUyF2/46j8gujD6XblAuwEGNRq
 4o562oFL2I9h+jpoGHwAa8shtdYCdmFToM/jxdD99tFfi38Ko2DiNXwCO
 FHAswCvOfr8AvXlHd7krxF2Oazj7s8zE4zedNdUL/F42T1jzewRjUjwsO
 lVAwjJZ6wKLgqlepjH/wwSTPngRg3/QrecGaK051SHu+50aILhG1SwuJ4
 BbTCylfL5giCRVr10Jg2OoVIlEcKCAlcppbQ0fkVzIw/tG34MWXpj5nmk
 3B5HokZl3nuQFPw/cP9e57SombzJ5qNfojNau+zEz1HNO2LGjOZ4yUHTl w==;
X-CSE-ConnectionGUID: ETcwtzAiRzOs4fpvs+0VlA==
X-CSE-MsgGUID: N71sQxyoS/2w+XtvheolIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87893838"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87893838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:51:12 -0700
X-CSE-ConnectionGUID: acBoExf+SQe51MZzYgAcPg==
X-CSE-MsgGUID: p4YTies4QLOQS+bZuKBt0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266291125"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:51:11 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 6/6] drm/i915/cursor: Allow joiner cursor fast path update
Date: Fri, 21 Aug 2026 10:17:55 +0530
Message-Id: <20260821044755.2234490-7-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821044755.2234490-1-nemesa.garg@intel.com>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
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

The legacy cursor path forced all joiner updates to the
slow path by checking joiner_pipes.
Drop the condition so that joiner cursor updates can use
the fast path.

v4: Trimmed to only the joiner_pipes gate drop. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index dedb6f87359c..fbf0c9e143a1 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -909,13 +909,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * PSR2 selective fetch also requires the slow path as
 	 * PSR2 plane and transcoder registers can only be updated during
 	 * vblank.
-	 *
-	 * FIXME joiner fastpath would be good
 	 */
 	if (!crtc_state->hw.active ||
 	    intel_crtc_needs_modeset(crtc_state) ||
-	    intel_crtc_needs_fastset(crtc_state) ||
-	    crtc_state->joiner_pipes)
+	    intel_crtc_needs_fastset(crtc_state))
 		goto slow;
 
 	/*
-- 
2.25.1

