Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5482FCCD1A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228710EAEB;
	Fri, 17 Oct 2025 02:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwI0hVzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F3410EAE5
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668037; x=1792204037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aiay/dZkv5b7JNFdLm4yfgHYHynhmGQFGIsoON/qWRQ=;
 b=SwI0hVzcE9Q4evzgzJFyCt9+KrSNt388RumUI9a5q8yWgMCrGmiPE4Yx
 xy3IbOTsWqBeRBwcReEqCrzwF0MoSFqFOstsnhFkwFlw5XAmt5zV8YHcq
 A5Nc/9LK8I8Brw6f26mpdiHAwLm3SWgQo1wLbsD38piV4lfuWxdE/9SNf
 3Osk3QO81Ttzpm3olTiCr63cyaisoweg/Sd/hdGXdCxMFEtYGwAnhSrng
 rddV0V4U5SpcW+Feh1n1t1aAk+YLaTQFNAGgqrLsKog+7w1Gqv9vpKIPk
 nXXkQQdC0frQ3hCiluDA5Zj3qrAvJtil4zJ92hz8XElplJkuM5MsJNRc2 g==;
X-CSE-ConnectionGUID: R1rkz2JlRXuh6Yr5aSvzDg==
X-CSE-MsgGUID: jW7tTlPEQ+mD7sxJsi6oXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739208"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
X-CSE-ConnectionGUID: K5XF59UIQo+3ztM0MsU42w==
X-CSE-MsgGUID: 3zq/1yQzSlGgnjBcLqBQAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089171"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 05/24] drm/xe/xe3p_lpm: Skip disabling NOA on unsupported
 IPs
Date: Thu, 16 Oct 2025 19:26:24 -0700
Message-ID: <20251016-xe3p-v3-5-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

IP version 35 has removed "NOA Enable Signal" bit from RPM_CONFIG1
register. Skip clearing that bit on unsupported IPs.

Bspec: 62391
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3f..f901ba52b4032 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -837,7 +837,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
-	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
+	if (GT_VER(stream->gt) < 35)
+		xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);

-- 
2.51.0

