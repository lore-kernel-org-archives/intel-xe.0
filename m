Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75B6D0D145
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2B910E642;
	Wed,  7 Jan 2026 17:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiFYPU4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2144110E61A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808076; x=1799344076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b0sxkSYQUJ7TuclZZKYoxrbl24oxWDhLNviMEXq+V4o=;
 b=NiFYPU4ZounqfG8t/0+EDJ3rzlr7vku59jS61Jp0dIlvWihY2+81Q0q8
 dMR6jw+CSbaJMOkSVgfN3Nzb5TAHB+053+JZn/LoLgzZMupZtjxhEE17o
 InGpGQAGjOQl4QY+5KdclwgWvgbChf4WpepQ28jLpk0jKaM9my2BGzKIP
 iJtV5CLSkjycXoego8EEtcgzd7w+H3w8YrhFSKPdIEepGf0Zwfdioal57
 rN7WDwBADrzhqzoT+S21Nj5s8CmyCjdMiAI3aNJ4AI2a5FXkxZwusbc4Y
 tySqC5xcylqeCP8EIfJ5k/xcwROLTaHqFb8vIvfqNBW8N4GNF5D/gvgwf g==;
X-CSE-ConnectionGUID: d2u8lugUT/GkGUj3nHM3Cw==
X-CSE-MsgGUID: aMHz8xTySnaubfLwsG4m/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="91842128"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="91842128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:56 -0800
X-CSE-ConnectionGUID: pisTEKLHRJi1zN4HBII4Kw==
X-CSE-MsgGUID: JBCy55c0QHiUb9OYX0BvYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202191218"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 09:47:54 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v12 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Wed,  7 Jan 2026 18:47:40 +0100
Message-Id: <20260107174741.29163-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260107174741.29163-1-lukasz.laguna@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
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

In upon-any-hang (2) wedged mode, engine resets need to be disabled,
which requires changing the GuC reset policy. VFs are not permitted to
do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 62ec2e2d6436..d3431128670e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1387,6 +1387,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
+			mode, xe_wedged_mode_to_string(mode),
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

