Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92492C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445CE10E434;
	Mon, 12 May 2025 16:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYhRXz6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F31910E434
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747067733; x=1778603733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLSB+QHPykGxOrSqcFfjupzACBLAt4r0RvA4iceK4AY=;
 b=jYhRXz6wV+S/7pGwHA9dKEH8Toxq958Q6Fby4hu0dqyU+VFcaD575EsL
 mB88vely+LaCiRRSV2ccK6aMDGN/JeSIHI+GJAHp5Myd2PLWFWHLKs4su
 9bNr+pFsLrnepAgx+2nWAoV8C+385J6VhU3NH4qOQRrw/DGsL9VOIWLOi
 AkuJ1ueCWBEqCiS0HD6X4yyJhnHnfsA1pejb3LsUe5kQSMXPcW+DEo8cK
 d370JwCAP/vDCTAgp+4qiGetG0F4q9IaEsSSzFeC33CPn4vyEnrqy9OWN
 2pGYgwqwECM2ovlnxFnD6riOyAi+SCCDg6mzdDgzNpUUwUpjW5mP+LYOR w==;
X-CSE-ConnectionGUID: tNIG2tF+ThuC+yo/bAzXeg==
X-CSE-MsgGUID: oF/lKu1ARSmvvGpK+K7hkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36501043"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36501043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:33 -0700
X-CSE-ConnectionGUID: 1ujjsJMYStSbYiaR6+Kc7A==
X-CSE-MsgGUID: DrJqcfWhTH6TIFJqhuoctA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137351579"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:32 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
Date: Mon, 12 May 2025 18:34:32 +0200
Message-Id: <20250512163432.22678-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250512163432.22678-1-lukasz.laguna@intel.com>
References: <20250512163432.22678-1-lukasz.laguna@intel.com>
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
index c4ddc34ab270..5e94859905f3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,7 +1189,8 @@ int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_FIRST_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_FIRST_HANG && IS_SRIOV_VF(xe)) {
+	} else if (mode == XE_WEDGED_MODE_FIRST_HANG && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
 		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
 			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 		return -EPERM;
-- 
2.40.0

