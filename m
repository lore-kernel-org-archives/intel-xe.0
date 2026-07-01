Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C978C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF47210E385;
	Wed,  1 Jul 2026 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVe52zBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920A10E383;
 Wed,  1 Jul 2026 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782913996; x=1814449996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KG+YCyL5nvnVPZfX3xRoOPrMO5vAPWXlOX9suaBqk10=;
 b=hVe52zBS2zuYrOBLNhQ6ZYN24mf6E+X9csMvUSz1tp+NRjobsaUy2bEo
 bEe7TcjjjC66rIOMB4iyfYxWI17288u1+Kvwexba6tm4fOBmyec2sL+H3
 uLzrS/IInILtiPNCXOpj3ZtKXP2SXaqa45gYXJIxfAVYQFUSQXdgdVphD
 rZ13b3NtdUGQWvMPv6g3Tm/xuMkgbnxh4ZeJTrVMjSrE/D/9wGInV3pyq
 dDwJD5vLv5B0xfG1Q4JFuDnevmN4ZbI8GUIHFhBsIVR8gcPcQajKgVyiv
 cRxsciby7VloMl204dwIkpJD/W2yO82e8xD5LFlwJDOWkS8GckAVwLL8I Q==;
X-CSE-ConnectionGUID: eTqbuEuyQdSFjl68PPQ2Bg==
X-CSE-MsgGUID: 3IC81ZKxQXeQxk0pqtQOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83733871"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83733871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:16 -0700
X-CSE-ConnectionGUID: BBdRRhzHTzS4uA4KtSU45g==
X-CSE-MsgGUID: OV6d49zGTHauMYvP8RJHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="249207283"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RESEND v2 1/8] drm/i915: call intel_uncore_runtime_resume() for each
 gt
Date: Wed,  1 Jul 2026 16:52:59 +0300
Message-ID: <e9dde426a8f84c75a5d61857c4259e562fa8ee41.1782913901.git.jani.nikula@intel.com>
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

All uncore suspend/resume calls are done on each gt. Follow suit in
vlv_suspend_complete() error path purely for completeness, even if
VLV/CHV only have one.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 45f2dcc5130e..c9ce2b05b787 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1522,7 +1522,9 @@ static int i915_pm_runtime_suspend(struct device *kdev)
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

