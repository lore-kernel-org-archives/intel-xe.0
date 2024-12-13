Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06AE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 06:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3942510EF0D;
	Fri, 13 Dec 2024 06:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbTtHwlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665010EF0B;
 Fri, 13 Dec 2024 06:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734071742; x=1765607742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mjzHaWrkJciiQBORKKdwoV/HQ7ctyAmN1ZxDG1OFac=;
 b=fbTtHwlVHkq/Zvn3rhBWJ9t7K91YGNJjysRUaMbdNvoKaBRW2aCRmTNH
 NoUSKm4Gs7QC3BJzqmv6oIwNuhYmQwtCq3GF6abIVDP5f1ZTybPCDTkqW
 MQXiSL53sVgPGDRZ1H65GIO2nC+iUvTEZ0rI7Hi1WVcCjamcjV96itue6
 2HrLUEu2LTO7P4F+v+1R7vw4HHMEwoXqU/qVc/eZ6hA4h5vbjHRus7jmN
 ijVxPncHTaqPjFvqBBZAJfMNctPTLRWSU/pS7fzrMUAD6VuevutbVQRsL
 O6jRLyD6Bqg8ZE1w1sdFMUIfSTZHZuSxYOJQ0i87YUOyRqxAvKcJQza+G g==;
X-CSE-ConnectionGUID: auOZuQaUQb2UOdlBYARwDQ==
X-CSE-MsgGUID: eULB2xG3Shes//rYytazNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33846822"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="33846822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:35:42 -0800
X-CSE-ConnectionGUID: YajrV+FWT8K+VS9FyIbYQg==
X-CSE-MsgGUID: q9lEd0ZXQZCERuZr3zWGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96307688"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:35:41 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 01/10] drm/i915/psr: Use PSR2_MAN_TRK_CTL CFF bit only to send
 full update
Date: Fri, 13 Dec 2024 08:35:19 +0200
Message-Id: <20241213063528.2759659-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213063528.2759659-1-jouni.hogander@intel.com>
References: <20241213063528.2759659-1-jouni.hogander@intel.com>
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

We are preparing for a change where only frontbuffer flush will use
single full frame bit of a new register (SFF_CTL) available on LunarLake
onwards.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 64c00a8a6850..7ad8adcaea98 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2381,7 +2381,6 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 	val |= man_trk_ctl_partial_frame_bit_get(display);
 
 	if (full_update) {
-		val |= man_trk_ctl_single_full_frame_bit_get(display);
 		val |= man_trk_ctl_continuos_full_frame(display);
 		goto exit;
 	}
-- 
2.34.1

