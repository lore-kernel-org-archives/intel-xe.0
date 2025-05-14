Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F0C3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 10:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0274310E60E;
	Wed, 14 May 2025 10:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKrVEH+I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037710E60E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747217506; x=1778753506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hoZjsQAqO9DDpWyIPHQcuvZfIhiE4tVAP2zs5AddT8=;
 b=XKrVEH+IVmDFD4LcO/0/aJZqucnAshiEWPE2om6h7X8rofsuUmnv75I+
 ERmx8mJtkMzRisvTsNC90XIUCLUYuBfYQlmTRNEJzSn1LXo/A2IMx6gCF
 zvw6KM+M5Pc2ExYJgO7PZ4Ng8oiP9tg7VJrKR4WEwsx0pgimz1/YG8dFi
 vv3nkjJgYxRBE+E0J7cRO776sE3ts0FrbuEl2kGBDpcWvjlqS1/SUepPf
 KJjNkZR4RzpZgA2pI6mWGtA7jfqCk2v0+Mk0g+Jj+Nxb/yolzn3oAahkC
 HeMBA9rQI2XfW/DkUsfe/gzfn3zDlcfp5uimIopDdCgMQxUreWZluymMI g==;
X-CSE-ConnectionGUID: 1tlOOPWSTeGBeRgy2C9Njw==
X-CSE-MsgGUID: zXrZENjDT0+LSFxF4Vkugw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60505987"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="60505987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 03:11:46 -0700
X-CSE-ConnectionGUID: Tj5MmGQoQTqyLo9FksMj1Q==
X-CSE-MsgGUID: cEt7PMc9Sui/ruD4Z2q2MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="161285765"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 03:11:45 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v5 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Date: Wed, 14 May 2025 12:11:23 +0200
Message-Id: <20250514101124.12437-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250514101124.12437-1-lukasz.laguna@intel.com>
References: <20250514101124.12437-1-lukasz.laguna@intel.com>
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
index a8470221ff85..7dfc39dd4c9c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1189,6 +1189,10 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: unsupported mode (%u) for %s\n", mode,
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

