Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661C7C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1B910E464;
	Mon, 12 May 2025 16:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSFE4qu3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EC310E464
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747067729; x=1778603729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKySqpVIamGc5KntDplkxh28VaPy2DSQHZHu4pZ2YnE=;
 b=mSFE4qu3ZHj3PZRPKvoOhjfOrCWQyvoJQVC1gMtFlwPpvjibN8hBLBEk
 8TC6OtZn6HLnnik9PaRnmM6f5Yf7MTUG9pNbWeXKdyWeb9IeojMGRt/tt
 XY1HJLLVuSyAF4NdDWVDUW1pPIlMXLxH6XsobdoFmpllZQtwOOdGZyz+q
 BfBy5LUevjTGmYTf3euXE0sjqyFrUT0HxAugrAx+iQoTljp8uHbjQrBmy
 TcSAq5HW2tkAVq8ZtRYVnwTd5GsYPopjDhBPOoZI61YpmsSNEJUti/rTS
 L0yfEeloA8N19D0mAHW5cZcOSPlqQ0FIvKcaqrEwO+IjgK1XOQLEko6L8 A==;
X-CSE-ConnectionGUID: lfdx6MBCTnqeJaYDt/G2og==
X-CSE-MsgGUID: r2ZFb+cuQnOYTKzAFvTAxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36501033"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36501033"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:29 -0700
X-CSE-ConnectionGUID: 3bbViJjwTdGTtkgvOmP/1w==
X-CSE-MsgGUID: s2+Inz80R2yxxs0FQqvDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137351573"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:35:28 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v2 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Date: Mon, 12 May 2025 18:34:31 +0200
Message-Id: <20250512163432.22678-4-lukasz.laguna@intel.com>
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

In wedged_mode=2, engine resets need to be disabled, which requires
changing the GuC reset policy. VFs are not permitted to do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b2d4f1b7d46a..c4ddc34ab270 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,6 +1189,10 @@ int xe_device_wedged_mode_validate(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_FIRST_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_FIRST_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

