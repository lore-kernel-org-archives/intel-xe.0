Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B777CD98DA
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7210E5E0;
	Mon, 15 Jun 2026 18:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8rUQvO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CFB10E5DC;
 Mon, 15 Jun 2026 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781549307; x=1813085307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJHcaR2xjnkzAlRLUHYKAczvFdOD6ScyoSjwfW3SEws=;
 b=Q8rUQvO5zQfR0chU0WbY60TfJWyAVyZR6bMlVnuncj2QTZRLy5brMwJT
 Lpjv28Mcz7CjnpCoCSAEVjQSky1XGCQ24bqtC8aSWTtZYV3xUtGhUCUUb
 39Sv+urjAbEWySA+F0q6p6frweeMUOli09LCuhSq2dO4ZarUFTCZt1aHI
 MUWHF9owU0ncooLTJMsKZENMumF0/QWQXGuaVw2IuLqtZYDifr60QqoD2
 W3EjS3r18jz1JkdUPqXIz8/IUixdnIWzWHV+a9mDwG9Pq49qeJnyAowWp
 tgDoITZqoVysV5gmKkOilqzOW3KuLu08gzIgaCxx2HM5Eh/X3eoaeW0vY Q==;
X-CSE-ConnectionGUID: n4ZS/AbgRu2iX1J7NVR+SA==
X-CSE-MsgGUID: zQdWwlRSQt2FusiTh7ISCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81438588"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81438588"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:27 -0700
X-CSE-ConnectionGUID: h8Hf4baqRq+nQOf+x5Hm7g==
X-CSE-MsgGUID: CSwKxECISXCV37vUF50a6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247628611"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 4/6] drm/xe/display: change order of
 intel_display_driver_remove_{nogem, noirq}() calls
Date: Mon, 15 Jun 2026 21:48:01 +0300
Message-ID: <afb11c4e11cc4d946f0360aaad1664d004a93f41.1781549229.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781549229.git.jani.nikula@intel.com>
References: <cover.1781549229.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

The display driver init and cleanup calls are slightly asymmetric. The
cleanup order should be intel_display_driver_remove_noirq() and
intel_display_driver_remove_nogem(), not the other way around. This is
also what i915 does. Follow suit in xe.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 4a621779fc53..0d93784754c1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -82,8 +82,8 @@ static void xe_display_fini_early(void *arg)
 		return;
 
 	intel_hpd_cancel_work(display);
-	intel_display_driver_remove_nogem(display);
 	intel_display_driver_remove_noirq(display);
+	intel_display_driver_remove_nogem(display);
 	intel_opregion_cleanup(display);
 	intel_display_power_cleanup(display);
 }
-- 
2.47.3

