Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144EACD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6E10E50E;
	Fri, 22 May 2026 20:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMdTygyR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DA110E2A6;
 Fri, 22 May 2026 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779480252; x=1811016252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f8OvaonxYZSvU5Cdn1mAYdEACjjH+9DDTi1UeyOP3Uc=;
 b=RMdTygyRhAYKBQ0Efjt/7rPrvKqxyWm/N8RDqGR4dWI2bNPEy1HF3kjH
 PYiYzjJI9ComP/oXj3bc488bxT2RSrSd53Gs1nWI0Lwm9hONQoIBqRuBY
 QCOJVxSqBATcjQMspVXxqwhVRRMgLJULUTigc+Bqei2DYAsYU+moYGeQf
 r/LCN494Dgx3tGZfULF/5NNKj7d3ZPSNPhCSUq5Ie5KaLrw50us/t1BzO
 aESxbXq4/987mmdrMyqBE6QyUeTcVF1jFClZ8GBCjl0FOqxZWZFSZVAqr
 fqkvM/cCSFqyde+Ut2sPD/yYxD0GX3QdHiO0ak3nKTv1YV0evmTl5ST0f w==;
X-CSE-ConnectionGUID: tBpTT9n3RWCH55BkBxDnrw==
X-CSE-MsgGUID: QhnMQlyxRA6CJoN4eUF3sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80396773"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="80396773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:11 -0700
X-CSE-ConnectionGUID: VddvLoBjSD6q9vS0oks/SA==
X-CSE-MsgGUID: OQSRY4c9QsaiS7FJtsUXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="234649081"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 13:04:09 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 04/10] drm/i915/bw: Fix 'deinterleave' rounding direction
Date: Fri, 22 May 2026 23:03:40 +0300
Message-ID: <20260522200346.17377-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
References: <20260522200346.17377-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For some reason we're rounding up when calcualting the deinterleave
value. But the spec says we should round down. Fix it.

But I suppose this doesn't actually matter since the deinterleave
values should always be power of two. The only exception is therefore
the deinterleave==1 case, which gets handled by the max(..., 1).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index bbaafcc1b6be..da294c1722b1 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -607,7 +607,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 	qi.deinterleave = qi.deinterleave ? : DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
 
 	if (num_channels < qi.max_numchannels && DISPLAY_VER(display) >= 12)
-		qi.deinterleave = max(DIV_ROUND_UP(qi.deinterleave, 2), 1);
+		qi.deinterleave = max(qi.deinterleave / 2, 1);
 
 	if (DISPLAY_VER(display) >= 12 && num_channels > qi.max_numchannels)
 		drm_warn(display->drm, "Number of channels exceeds max number of channels.");
-- 
2.52.0

