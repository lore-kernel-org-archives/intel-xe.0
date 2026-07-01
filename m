Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B8BC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A297D10E38F;
	Wed,  1 Jul 2026 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPOGNLOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72510E38F;
 Wed,  1 Jul 2026 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782914000; x=1814450000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GxYJqlmCOkp9/qnP8mG2l1IeRlws0vWdRQC7rvPhmNU=;
 b=CPOGNLOPFEwKmB6HuS7gjllg5o2F6gRlkISvHUwl8lDSs6p8F+nOHIlH
 AYatmCL96vPh8nKXigLYr3RfJKrrYZAozL3ZEJ/L11SJqsbP00wiYejcq
 h/NuzW2rYFq0vdZSQwMAK1eMScsX9Tg+wQUd9f/avRXd2Xv3DQCF0Dg82
 qAM7o8rpsR+zhhpzkZU4Xr/t9qGNoenDPv7wlRiQJyQ4OA6/cLqGznjcO
 blUGz/cUZoa54BxW582Km6Dj7qAg17sp2mp60pJk8khjNPK6SYmhAYwYp
 zP7KLyrqBnPfLt8JD5PY6VhuApTb5DGduSaw0MasCmmEln2SLRDUokeeb w==;
X-CSE-ConnectionGUID: +9Y7N9MqT5+iTAAetntOpw==
X-CSE-MsgGUID: WOXhI1B2Qn+jlBTwyhzuBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94002787"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="94002787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:20 -0700
X-CSE-ConnectionGUID: 5FUkf9fsRQOYonS5cV2qGQ==
X-CSE-MsgGUID: 3cxUjMElSSyELewOugTsCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="256484701"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [RESEND v2 2/8] drm/i915: call intel_display_power_runtime_resume()
 on suspend error path
Date: Wed,  1 Jul 2026 16:53:00 +0300
Message-ID: <b0c131ed970d16d0147c87ba583abe3a4ea36ed5.1782913901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782913901.git.jani.nikula@intel.com>
References: <cover.1782913901.git.jani.nikula@intel.com>
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

The vlv_suspend_complete() error path fails to call
intel_display_power_runtime_resume(). Fix it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c9ce2b05b787..10427f8f5699 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1523,6 +1523,8 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 		drm_err(&dev_priv->drm,
 			"Runtime suspend failed, disabling it (%d)\n", ret);
 
+		intel_display_power_runtime_resume(display);
+
 		for_each_gt(gt, dev_priv, i)
 			intel_uncore_runtime_resume(gt->uncore);
 
-- 
2.47.3

