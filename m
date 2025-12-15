Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478C0D5B85B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089DB10E346;
	Mon, 15 Dec 2025 17:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4QIePOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F12110E4E0
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765820792; x=1797356792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AN/BlTAU4u9VX2msjIv1fiiCLhUEvgNgawbjbOEKIdc=;
 b=F4QIePOikZsvG4qtnL7t7jnqoL/wjq6VNKGFwb4R5xTMxuKvo/aB+Weq
 rS1M7/8N2vGII3C5lB/6d+jN9gBY0fmEvGN91XAkIntSGglMJKabKPzwA
 KeOi2s28BjObTuSxPmlzYAcIF5X73OwCkmew3pUP/uhbJX7U0+o0Wko1Q
 wxudANXk2oZah43sl/P+rI923yO+AqbS6FyhkmCUemfVbt2L3VAWMv31w
 tVEfVzZRNY/YJysUKEzIUEcKzL+QEMnzeN9Rr9r+sbnp1VNBQ88VlQTcR
 H7auMxsgZGrkw3NuDuNWwtzD7vKkHXgPpCm6O887CbXT5iRSSRTJ3c57N Q==;
X-CSE-ConnectionGUID: kugqbVZXRkCWRfA6XV4xnA==
X-CSE-MsgGUID: tm/iSqctR0i3GZzOsHdOZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67612368"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67612368"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:32 -0800
X-CSE-ConnectionGUID: lK7TKeueRSGA8OXTJz6TdQ==
X-CSE-MsgGUID: ufnWXbvxS3WcvgrpZaiH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="198610964"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:46:31 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v11 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
Date: Mon, 15 Dec 2025 18:46:13 +0100
Message-Id: <20251215174613.3701-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
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

The GuC reset policy is global, so disabling it on PF can affect all
running VFs. To avoid unintended side effects, restrict setting
upon-any-hang (2) wedged mode on the PF to debug builds only.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 15470e0558cb..cbe9e47f1ca6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1366,7 +1366,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
 			mode, xe_wedged_mode_to_string(mode),
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-- 
2.40.0

