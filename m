Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BEFC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 12:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F330F10E26A;
	Thu, 31 Jul 2025 12:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNlG3akx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A610E78E
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 12:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753965497; x=1785501497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YZ9GRaI3DqZsrrh/kSYVmq5oOWJatFLfCwXi3Z1pT9s=;
 b=CNlG3akxiyon43G7U4zfTzdooohknMit18IBQACmYd0Uo6ytfsqOv2Y7
 WMwVj8DLWdu7tGNPhpfwzmEuuzrALck6q5LF+FKDwNohlovEeKWMUGsP+
 XsWE2HpIMkhPkV+n2ROwu91mmJOuzQx8vjNChoOtsfzVWURPCeFHcaNSm
 KiKz9q0Ep5Z9MlPsf9ZgaXEz23C21rYaGbnTf3MAB7fX0biHQZV9yqJR7
 drJjCeNXX2JmobhhNcKVOj+sDyvDqTbZGAZuJB7+YU9f2NOGG04jtkr5x
 GuigYYpvDpjiYzoHkACjNMwvhz+C2NCGq5276wLsUcFf/DE9oYOPBwMit g==;
X-CSE-ConnectionGUID: 0J7zJpj2Sqa3OIjJP1A2rw==
X-CSE-MsgGUID: t4cSAqaDTH2N3mWmj3BT6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="58911334"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="58911334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:38:17 -0700
X-CSE-ConnectionGUID: MH9lSWIZRFSthE0u+O2u4g==
X-CSE-MsgGUID: CsMSauqqTIqgKCZQtXYB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="162838714"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:38:16 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v8 4/4] drm/xe/pf: Allow upon-any-hang wedged mode only in
 debug config
Date: Thu, 31 Jul 2025 14:37:56 +0200
Message-Id: <20250731123756.29259-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250731123756.29259-1-lukasz.laguna@intel.com>
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
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
index 7b0fa360d5ef..6d0bbfbb6ac8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1224,7 +1224,8 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
 			mode, xe_wedged_mode_to_string(mode),
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-- 
2.40.0

