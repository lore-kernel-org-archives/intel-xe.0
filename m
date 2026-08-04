Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1723FC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 06:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783C010E863;
	Tue,  4 Aug 2026 06:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1gIvGD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2E10E863;
 Tue,  4 Aug 2026 06:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785825064; x=1817361064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GB6z51OLdjy3Im/6UBJH17jzN0nL3VSkEzb5M0kUIuc=;
 b=Y1gIvGD4x2UPs29x3eTqwQ3Jus1GNFQSjhpFk5TimwUlxhzIzkB2mxEh
 Jr+p5Vq2tj8IoIZizBPMkKE+tgcyvyToX2Oat450Ar3ddSpjayyn1EPTP
 2/5HeNg3pKRiA7To2o+58yaIUQvHzOfxKW7+TskLwPqkajlCOUT6fnANr
 XMgHGhMLLN1KkrfFhDBzmk3ufIYHWuyOYSZ2QSFSZT1INB+384IR8ovgv
 ULTFhvxgWLZbYnDBps+ThyOsCepDI+kap8EsDZlag+lqtFY+RR1UkGPTj
 oUwFzVtkHWjO0W2JUBb0/LBSx4Oxao120OgfpBCNzOdtzTKlb1XGuoqkl A==;
X-CSE-ConnectionGUID: H8rNhEYjR7yc7BY4zxOoeQ==
X-CSE-MsgGUID: 0QRBCMBGQ0Cpl0xxCbFnYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90179808"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="90179808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:31:03 -0700
X-CSE-ConnectionGUID: ambatNl6Rx2BjnCR0iMYcg==
X-CSE-MsgGUID: saMTaoP6TeSxrkyMobi+Sw==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 23:31:02 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 2/2] drm/i915/flipq: Invalidate cursor register cache on flip
 queue reset
Date: Tue,  4 Aug 2026 06:30:57 +0000
Message-ID: <20260804063058.969207-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804063058.969207-1-mika.kahola@intel.com>
References: <20260804063058.969207-1-mika.kahola@intel.com>
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

i9xx_cursor_update_arm() caches the last CURCNTR/CURPOS/CURBASE values
it wrote in plane->cursor.{base,cntl,size} to skip redundant writes.
That cache is updated as soon as a plane's DSB program is built, even
though the program's actual execution may be deferred (use_dsb) or
queued into a pipe DMC flip queue (use_flipq) for later, asynchronous
execution.

intel_flipq_reset() discards a flip queue's ring buffer contents
without waiting for or checking whether whatever was queued actually
executed. If a cursor update was still queued when this happens, the
real registers never get written, but the cache already reflects the
value as if they had, so a later update computing the same target value
will wrongly skip rewriting the hardware.

Invalidate the cursor's register cache (mirroring the ~0 sentinel used
at plane creation) whenever intel_flipq_reset() discards a queue, so
the next update is guaranteed to rewrite the real registers rather than
trust a value that may never have reached hardware.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_flipq.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index cd2cd8eda447..8d5166ad5f9d 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -272,6 +272,21 @@ void intel_flipq_reset(struct intel_display *display, enum pipe pipe)
 	}
 
 	intel_de_write(display, PIPEDMC_FPQ_ATOMIC_TP(pipe), 0);
+
+	/*
+	 * Entries dropped here may never have reached the hardware, even
+	 * though the cursor's software mirror of its last-written registers
+	 * was already updated when the DSB program queuing them was built.
+	 * Invalidate it so a later update can't skip rewriting the cursor
+	 * registers believing HW already matches.
+	 */
+	if (crtc->base.cursor) {
+		struct intel_plane *plane = to_intel_plane(crtc->base.cursor);
+
+		plane->cursor.base = ~0;
+		plane->cursor.cntl = ~0;
+		plane->cursor.size = ~0;
+	}
 }
 
 static enum pipedmc_event_id flipq_event_id(struct intel_display *display)
-- 
2.43.0

