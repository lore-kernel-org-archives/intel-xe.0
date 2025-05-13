Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF12C3ABD9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 09:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005A610E513;
	Tue, 13 May 2025 09:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SlRxMa1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27C10E506
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747127928; x=1778663928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TfNkSzB5lDKdoYJ8IXK/f/zXU4oTXrDLhYfb9rgXfV4=;
 b=SlRxMa1xV5dLADEZ55lJpEbcKYgipkQQcR/fCzAQasdl0dOdlA7xUf9U
 aYxkVebUriYRGHj953vruOO3A1QJ4KLEQtn/8YSgTOcR2HjS62hQt7qew
 Mz1R+pPUum5r+O5d6NQvc4sYGfc5HWToffQBL5FA1SblGBpXWPMVnbqSu
 YigIHUPNYjIVj+9sezGFVudA8DIEP/d5qgnJ7Si1pBzRLrmY9Qxrx1JoZ
 fRhXb2yM+t5FtXv4nSDQnVV998NIs46r3Mg15lhk/rDJCzFYNXE7H7H0T
 0Lb3hsQp1C7xFEr6g7e2IfF71eZOt99klVVmPxgO1qSvKrvEs4lmytHCe A==;
X-CSE-ConnectionGUID: fJ9PSlN/SvSQIqyEmmIfXw==
X-CSE-MsgGUID: 9O/J7FtlSkedpHs7TrSRaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127698"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49127698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:48 -0700
X-CSE-ConnectionGUID: plg0LhFsT/uEBeWyjWlWfw==
X-CSE-MsgGUID: 9UPSkf6rSo2Nus64Ud1Zlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142409139"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:47 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
Date: Tue, 13 May 2025 11:18:27 +0200
Message-Id: <20250513091827.4825-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250513091827.4825-1-lukasz.laguna@intel.com>
References: <20250513091827.4825-1-lukasz.laguna@intel.com>
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

The GuC reset policy is global, so changing it on PF can impact running
VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
is restricted to debug builds only.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7dfc39dd4c9c..f23d8236bddc 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,7 +1189,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 		return -EPERM;
-- 
2.40.0

