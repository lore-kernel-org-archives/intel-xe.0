Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B2DCDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEA910E0B5;
	Wed, 24 Jun 2026 14:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SN+FZLlG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B93410EF3C;
 Wed, 24 Jun 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311839; x=1813847839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=igYDgT5qzF7BdjsW7kiFxuwdJCifa9wPJIjVR/n8zS4=;
 b=SN+FZLlGgAOrLtU2MK5sKm51FBnDKYFeguXUu6Z9oDbeDVjlhN94+LZ0
 rrg5OmnOEw2pvBqpB8feyJ4dl91DCZAtQq1zHUPJLeTJURJXU0F/nE33f
 e74iM7ohdS9MFY1OTqUKI10vsPf02mgEJI9+QC38sFJ4r3+uSmos9+m0t
 oNBntaqezKk7Gk4sGfuQ3LaMZDE2+QYUERIJLhfaW2O+ggXBYSSNP/c8v
 zG3WRXKRhk0VARy1Kxpk74WwPCF6yJoaUB4zD/0svJ2NPQlOcIX0jZ8lF
 v8PhuSkZ93vI0yr2mB2jGGkQ1FE4AAZVpaG0qEsUP3NKnDh7c4YOvIZ4Y g==;
X-CSE-ConnectionGUID: G2f3vDEIRQm+Y+6KCBzTNQ==
X-CSE-MsgGUID: Rd9ts6F5T8SfBx0O4psX1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920305"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920305"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:12 -0700
X-CSE-ConnectionGUID: v96Bh5USStGFSdtSJexjNA==
X-CSE-MsgGUID: CKZWWjn2SwiTo8ht4I4TJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253799016"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 2/8] drm/i915: call intel_display_power_runtime_resume() on
 suspend error path
Date: Wed, 24 Jun 2026 17:36:49 +0300
Message-ID: <025b4c29b6df1d3d4de6dcab417612dc27148e76.1782311749.git.jani.nikula@intel.com>
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

The vlv_suspend_complete() error path fails to call
intel_display_power_runtime_resume(). Fix it.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f6c7270300c9..51b8bd751376 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1546,6 +1546,8 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 		drm_err(&dev_priv->drm,
 			"Runtime suspend failed, disabling it (%d)\n", ret);
 
+		intel_display_power_runtime_resume(display);
+
 		for_each_gt(gt, dev_priv, i)
 			intel_uncore_runtime_resume(gt->uncore);
 
-- 
2.47.3

