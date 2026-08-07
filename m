Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9D3C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31F410F4B3;
	Fri,  7 Aug 2026 12:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTlV8BGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1C910F4A5;
 Fri,  7 Aug 2026 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104947; x=1817640947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rksPp3rHa/EKYgpDdCpLD/DEcw7d1GBwldJTYa1T7os=;
 b=PTlV8BGyJ6zd10wD6ANLXBzAm2k4XBMFTp9CP6P7SyHXrByiuuEaT7qJ
 IvPOhVgcUF4eNDP5blZNO8gOjV3WiOTS3DBO2T0WJUx4TA3QUVK9qjtJv
 ZpaUPMs2akgPan/gld3lioe3nyi5S0NIH36ctp3/gIib8wuE7Xv7wlcd7
 MKDQa4JrS8UIvZDaBgchfzYavRnGk6Q+zULhZMmaioFoi+hdKTY1AGMAL
 v4CuSNUkIWeVKD8dHLji4Ggx4aZeTOSeOQkuhy0oFzmfMQYob9FLX6zhh
 1Fj1yVoSoDA6l97+uZ8Yoh+ELX64UQ3iAEQ6O5gGIyJ48HDYueAGPTK6A A==;
X-CSE-ConnectionGUID: QZnRQQg5T8q5oYt7CxHHrw==
X-CSE-MsgGUID: VahhqwOQTeSpcOjgCric4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86562845"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86562845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:15:47 -0700
X-CSE-ConnectionGUID: vpfq3kYWRsG0LcprdrHASA==
X-CSE-MsgGUID: b9Vnlk9FTviyzqT6vwKekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="260611621"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa006.jf.intel.com with ESMTP; 07 Aug 2026 05:15:46 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 3/3] drm/i915/display: Reset use_flipq when duplicating crtc
 state
Date: Fri,  7 Aug 2026 12:15:40 +0000
Message-ID: <20260807121540.2032283-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807121540.2032283-1-mika.kahola@intel.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
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

intel_crtc_duplicate_state() resets use_dsb to false but not
use_flipq, letting a stale true value survive into the new state.

Reset use_flipq alongside use_dsb.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 9d0d47c79dd1..b66c2d4ba2b3 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -276,6 +276,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->dsb_color = NULL;
 	crtc_state->dsb_commit = NULL;
 	crtc_state->use_dsb = false;
+	crtc_state->use_flipq = false;
 
 	return &crtc_state->uapi;
 }
-- 
2.43.0

