Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECC9EC1EBE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 14:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7CB10E8CF;
	Thu,  5 Feb 2026 14:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2CDXNaY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359610E8CF;
 Thu,  5 Feb 2026 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770300192; x=1801836192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lk/UIgPkuyAZ1hGdlTByXfoKc6VAar1Pv6XzJHK75/s=;
 b=f2CDXNaYKVLjMtHvSDPYFUlVR/79Cs3JstlWs8xcOxbI1P12aa20pp6Q
 7K8wInRCeMmRQo3i2h+e6np9dTNY+a+8odKPKl1MLLZG+jSec+NSLX1Bh
 PixFNKknAoMFuN4DhnQacfDiXXZDrNV5l9PzNg6XiZtuAHvo5jonlFIFR
 XEiag5vwhuw4QyB+oi72Guj7N/hY2CHogD8RnVQzOChi91vXiUcUJzuZV
 ZMC3nlFamlXYQmSoG7ywHw7JlMbTfIx3V6HTTZXGSJQKvuENFUNbRH+wj
 j48k+7pPHr2nwYmYlo/wsCF0d7Y7AUFIOL1vQ96v8AS4F4FJ5CpQpbKYw A==;
X-CSE-ConnectionGUID: kelwhYbYQAW+RWxRvaW+MQ==
X-CSE-MsgGUID: b1+/8mnhQU2AlGsBwsaiSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75351016"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="75351016"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:03:12 -0800
X-CSE-ConnectionGUID: qspFX4KFS2KXvQU9X7vMyg==
X-CSE-MsgGUID: vmyY/1u3SJOJ98S/3COL9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215508929"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.157])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 06:03:11 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 uma.shankar@intel.com
Subject: [PATCH 6/6] drm/i915/fbdev: print info about stolen memory preference
 for fbdev
Date: Thu,  5 Feb 2026 16:02:35 +0200
Message-ID: <20260205140235.338410-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205140235.338410-1-vinod.govindapillai@intel.com>
References: <20260205140235.338410-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

If stolen memory cannot be allocated for the fbdev  because of the
preference for fbc, have an info about that in the log.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 4f057dbd1279..1e6a334e4f70 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -48,6 +48,9 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 	} else {
 		if (intel_fbdev_fb_prefer_stolen(i915->display, size))
 			obj = i915_gem_object_create_stolen(i915, size);
+		else
+			drm_info(drm, "Stolen memory is not preferred for the fbdev.\n");
+
 		if (IS_ERR(obj))
 			obj = i915_gem_object_create_shmem(i915, size);
 	}
-- 
2.43.0

