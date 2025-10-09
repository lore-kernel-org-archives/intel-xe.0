Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2446FCCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 21:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49310E22D;
	Thu,  9 Oct 2025 21:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aga7wiu+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66C10E22D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760045515; x=1791581515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rgbCxPhYM0PrS3L9gcHdulQ954kXr/GURpRZE1s4mt4=;
 b=aga7wiu+d9r11/oLRVux5p0f8yJS1ej0aO+VlzsagMNc4/Pwqhi9r+zM
 GrxV2OJIUUFg+5+Q/F4a5viTYYLY+munh0IZFAKWUIbzubatVxS1Sc9Mo
 Eo5SFnnKead8xZbVRyvMFwbD243Tmkh2B4Y+LMuENNSVsmKRIqBnMKFuY
 DghhMaYPLru+k8bNcu+cNWjLmVUeoP3Z6ju5nLu42MMGyVBmQMgapbetj
 0K7W+f8NOOCnSD8q4jZBZFQwvpa+vkZrtoUzaVXmJ6Oa+q2LXbYkonpVh
 ulT3DPn+k82OYOuicsOKHfwMaiCMaZ4GHmIzYjGf0Ih35ZtNrKCwzOBWq w==;
X-CSE-ConnectionGUID: h+/7Jx7ZQESRe5ZKRTHrOA==
X-CSE-MsgGUID: iCQ0N6sZTm+9Qg92zzWliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62186250"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62186250"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:31:55 -0700
X-CSE-ConnectionGUID: wF69S1cKStyECDw7UT7+RQ==
X-CSE-MsgGUID: t0ziy6hRSm+BYwvsDYoYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180503547"
Received: from iglushko-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.98])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 14:31:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Pavel E Popov <pavel.e.popov@intel.com>
Subject: [PATCH] drm/xe: Make printk macros more robust
Date: Thu,  9 Oct 2025 23:31:06 +0200
Message-ID: <20251009213106.6395-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We should make sure that our formatting macro is expanded prior
to invoking final drm_printk macro as we don't control it and
in case of changes in its implementation we may get wrong order
of the parameters.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Pavel E Popov <pavel.e.popov@intel.com>
---
 drivers/gpu/drm/xe/xe_printk.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index c5be2385aa95..16d851b2118a 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -12,8 +12,11 @@
 
 #define __XE_PRINTK_FMT(_xe, _fmt, _args...)	_fmt, ##_args
 
+#define __xe_printk(_xe, _level, _fmt, ...) \
+	drm_##_level(&(_xe)->drm, _fmt, ## __VA_ARGS__)
+
 #define xe_printk(_xe, _level, _fmt, ...) \
-	drm_##_level(&(_xe)->drm, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
+	__xe_printk((_xe), _level, __XE_PRINTK_FMT((_xe), _fmt, ## __VA_ARGS__))
 
 #define xe_err(_xe, _fmt, ...) \
 	xe_printk((_xe), err, _fmt, ##__VA_ARGS__)
-- 
2.47.1

