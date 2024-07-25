Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C8BC3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1010E8D2;
	Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkFTRqsy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4EE10E8D7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945404; x=1753481404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HeA2FQN7p+yY36KjHu2R9u3ZSbzj4IRi+Ri+6IZPUrU=;
 b=EkFTRqsyHn+wuUnpZPjyFtaHFq6aU51IkMFe0HTKIJpXIhfBpUBbCpIR
 wcnuskwm0PJsH5fUgLLd3hHaqjlZe3I7DKAPLCvr14rWY6Y9LGTfipkpu
 9P/wIiJ7+iCwGhe8VpjWGgVyhMG6wq+y1FWiDLa133MkFpo0zuHRR47k0
 o022sWw88zmfrtyhEOpL8Zm86LCjbzkEBpaKy0n4nyolru1IWVF9xrD+U
 mrQA43XMypelKzV62FwYuL+jPFHPLHIcDXxRFb3tTc9/aJ6N9DzOddXix
 eKcXH85Z2dc0c/2ZCBqxJJUKOgmUmUh2/axYpfMDPX0A1gu4ZmP+zv7P7 g==;
X-CSE-ConnectionGUID: jWGZc0CuQN6MZDXzinfrZg==
X-CSE-MsgGUID: u3AT9MTnRqCCnfmnNhl73A==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853167"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
X-CSE-ConnectionGUID: rjGyicSXRoK89bHkOdtkwg==
X-CSE-MsgGUID: a7iGXr6lSAWkCbZvHuaoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346273"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/5] drm/xe/rtp: Simplify marking active workarounds
Date: Thu, 25 Jul 2024 15:09:53 -0700
Message-ID: <20240725220956.737987-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

Stop doing the calculation both in rtp_mark_active() and in its caller.
The caller easily knows the number of entries to mark, so just pass it
forward. That also simplifies rtp_mark_active() since now it doesn't
have a special case when handling 1 entry.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 5efe83cc82ab..59c6c8c32ad8 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -220,18 +220,15 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 
 static void rtp_mark_active(struct xe_device *xe,
 			    struct xe_rtp_process_ctx *ctx,
-			    unsigned int first, unsigned int last)
+			    unsigned int first, unsigned int n_entries)
 {
 	if (!ctx->active_entries)
 		return;
 
-	if (drm_WARN_ON(&xe->drm, last > ctx->n_entries))
+	if (drm_WARN_ON(&xe->drm, first + n_entries > ctx->n_entries))
 		return;
 
-	if (first == last)
-		bitmap_set(ctx->active_entries, first, 1);
-	else
-		bitmap_set(ctx->active_entries, first, last - first + 1);
+	bitmap_set(ctx->active_entries, first, n_entries);
 }
 
 /**
@@ -276,8 +273,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 		}
 
 		if (match)
-			rtp_mark_active(xe, ctx, entry - entries,
-					entry - entries);
+			rtp_mark_active(xe, ctx, entry - entries, 1);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
@@ -323,7 +319,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		entry--;
 
 		rtp_mark_active(xe, ctx, first_entry - entries,
-				entry - entries);
+				entry - first_entry + 1);
 	}
 }
 
-- 
2.43.0

