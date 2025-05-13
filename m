Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FDFC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 09:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7B10E52E;
	Tue, 13 May 2025 09:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SA7nPZcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181510E364
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747127927; x=1778663927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hoZjsQAqO9DDpWyIPHQcuvZfIhiE4tVAP2zs5AddT8=;
 b=SA7nPZcFMg5HSzNVgVM1+6d+UvVHCCDYbD3QEv5R/G3C7kW5xoD6SKQ3
 2CW28FdegQDQMQYgG0NhAg2WF1LXG2CtVMcgxUUXUAMhN60W5X2GydrhS
 0IYvJFoysN6Ipevv/KwiD13+QqtefFj4rdoXK/Bp87mN5XONsey5lmrU8
 IpTBJGbq/8tvKCqFLwhGoLJQPmWAVYAL+PWKrGeakcsWF6dOVjVhwYsHS
 8CEuSWPUI5ZPQSN1/SUHCN10NUKogglhYlldFGNwhLi5d55+I/klCYLbh
 14SrRSv45Y81bFd9vCCUpf54r1AAk5qxJ03Ykziu0Tzs8bazZIqqDei8Y w==;
X-CSE-ConnectionGUID: LqKMp3MPTrKQHQKIgIXihw==
X-CSE-MsgGUID: QRywgxLOR4maGPB/YBcbsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49127692"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="49127692"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:45 -0700
X-CSE-ConnectionGUID: i/Bb6lV0RYe3ABxJk/m6NQ==
X-CSE-MsgGUID: 8JzMIWphSNKls9rZ7ZjGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="142409127"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 02:18:43 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Date: Tue, 13 May 2025 11:18:26 +0200
Message-Id: <20250513091827.4825-4-lukasz.laguna@intel.com>
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

