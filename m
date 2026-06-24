Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49D5CDE003
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800F110E0CB;
	Wed, 24 Jun 2026 14:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNJ5xZ1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A758D10E0CB;
 Wed, 24 Jun 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311827; x=1813847827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WTsAfuHK4817ZEVijca3f9zMCMIxQjyC70HLJNkghNg=;
 b=lNJ5xZ1Y0vv0bjdcJVk/uEgiiNWqKzZ/Fb2Z8hxxWmeUl1WSOBnMx0o1
 +SZQz1hXKPyQE4Ow+EpcM9zIc/4OPX2/ju+KOfqpJUN+oraYdMhbvlDpX
 eVf9eKF+HQBhhTcGzlRc3WcvdBJyeUdBlbAPNio6A93bWC7EIv1Zc1Rwj
 3hL+cxxSbJ3EkFW8eyuMltzheV6vEzQPr6DtP7vR0Sh5eKWYGecZCMBHn
 AHzNGGj+neSLIsB8lJXa20cdSWGjsGvZjbc3sDchJKPASJaTCQqjonmeL
 40Epu/sP9X/1sTAhlOd2ONQYQ6i6k0TvDrh69+bJGdMkDi810xt1ziOp8 Q==;
X-CSE-ConnectionGUID: x2nqK0AeQye6RHaaTtRLWw==
X-CSE-MsgGUID: dkSmVIGzSJajGsRfwhNMPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920297"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920297"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:06 -0700
X-CSE-ConnectionGUID: ZcA0KSs0RuOt9nGBI7cVDg==
X-CSE-MsgGUID: AGrfvRPsRme2qykNMn9w9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253798968"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 1/8] drm/i915: call intel_uncore_runtime_resume() for each
 gt
Date: Wed, 24 Jun 2026 17:36:48 +0300
Message-ID: <59d87d12e535aa1a587a9c6884b8a43471ff3131.1782311749.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
References: <cover.1782311749.git.jani.nikula@intel.com>
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

All uncore suspend/resume calls are done on each gt. Follow suit in
vlv_suspend_complete() error path purely for completeness, even if
VLV/CHV only have one.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 43f747c3c31f..f6c7270300c9 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1545,7 +1545,9 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Runtime suspend failed, disabling it (%d)\n", ret);
-		intel_uncore_runtime_resume(&dev_priv->uncore);
+
+		for_each_gt(gt, dev_priv, i)
+			intel_uncore_runtime_resume(gt->uncore);
 
 		intel_irq_resume(dev_priv);
 
-- 
2.47.3

