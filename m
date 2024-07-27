Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F093CC3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB610E974;
	Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqFCF2B5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B26E10E93B
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045565; x=1753581565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hzHsMIvZRgbUwjFLXacGNz0dxsVh0U05891AA8MkyqI=;
 b=eqFCF2B5BCeAdrWP3uaPWFK6K2lwAIDcXtdYaHpbgP4IzM5FgQsYbt3u
 OWxjMwpkEubMQdmbRr2LqBdNKxcJ8BpfD00z4jW/KL7ds41qtWkDSsLY4
 6WHNi3zFjLWtklqspLZJoPvAikiRSBKSwdviL5zjlqpSSy/mHjHQbKhIV
 ZG4RnhMYFul3eQe3F9AeweLgnJs8OtBp1rOH7EHxQj0QVyYqC/Y99r4zJ
 ZKiY/CFNjNtEDtoB4jZLNiSdb9Atzaazrp1XKS0sl8JDOTY/6NbA/tgk+
 O/vadDT7LpVhRRA+w5xumAjZqjwSaO2kbIMKXLtFgpFgp6ZJBm6h5G7VM Q==;
X-CSE-ConnectionGUID: kfgjuOK4Q/6m7s50JgJfPw==
X-CSE-MsgGUID: zb/dE4siTniVCJwpl2r/jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460260"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
X-CSE-ConnectionGUID: +7K2sjv8QWC7DY4SOI2Yww==
X-CSE-MsgGUID: f0qNEpDsRJuo8hR61R8T8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108394"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 6/8] drm/xe/rtp: Simplify marking active workarounds
Date: Fri, 26 Jul 2024 18:59:05 -0700
Message-ID: <20240727015907.899192-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 1c641cc0f5a1..86727f34ca25 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -221,18 +221,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_active_tracking);
 
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
@@ -277,8 +274,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 		}
 
 		if (match)
-			rtp_mark_active(xe, ctx, entry - entries,
-					entry - entries);
+			rtp_mark_active(xe, ctx, entry - entries, 1);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
@@ -324,7 +320,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 		entry--;
 
 		rtp_mark_active(xe, ctx, first_entry - entries,
-				entry - entries);
+				entry - first_entry + 1);
 	}
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
-- 
2.43.0

