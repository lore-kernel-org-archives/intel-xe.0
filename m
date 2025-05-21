Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32ACC3ABC9
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 12:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643521138DA;
	Wed, 21 May 2025 12:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7aAHjNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5BB1138DA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747830328; x=1779366328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XSRJ/fVth/bq9PAdk7r5MMrssNc0V4x88bvnTYMMqMY=;
 b=E7aAHjNxGl4vAbfPt9CXVt8cTSTljlGVPi30IWZXinktvPoCSvkLKePh
 Wf9ebMxdTIYJryANxCq8xxg96JJPssiNMK0fw/AQv9AanDvhxK30MI95U
 c5CpyWgohrjLO/9PBdyiJ+VMt5Idp3NJxz0wdJ4SQrjfs+Fsmeqbid7E9
 bVkE2+OGRAv/KV/64ZOh6c/gs4aYvvzW8sd6AC1IW7oCZwGe/BnYswDIe
 Kb4mb23doqRS5QgJhFIaRQx2sdqdoh3jEwV1USfvQdlKZJm7FflFdURqX
 rRpK1QhZodb2YHGObb8fndZ85YqWIYwdgrL4K13KIJrwrkKFO15019y3/ A==;
X-CSE-ConnectionGUID: dYQGnwk/R9uKGr4b98krJw==
X-CSE-MsgGUID: bGXFRJgaROSQkIwdmFudTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72324583"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="72324583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:27 -0700
X-CSE-ConnectionGUID: G3Ro26JbTUKR7oY1Utmxcg==
X-CSE-MsgGUID: IKF5fgkXQkuVwCsze56PbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139945568"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:25:26 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v6 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Wed, 21 May 2025 14:25:10 +0200
Message-Id: <20250521122511.5760-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250521122511.5760-1-lukasz.laguna@intel.com>
References: <20250521122511.5760-1-lukasz.laguna@intel.com>
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
index 0aea87994541..c495d499edff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1186,6 +1186,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
+			mode, xe_device_wedged_mode_to_string(mode),
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

