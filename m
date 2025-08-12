Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D38CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 08:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFEE10E5C3;
	Tue, 12 Aug 2025 08:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOfLFNo9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39010E5C3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754988374; x=1786524374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hhv7SNNy4jriBP0SW5X/I5bVQyifZFphgJxrXwzDiV8=;
 b=gOfLFNo93nsLktA14ZIwY9bNgTWWSrUfhqxbhG4fZuUq2aoDLtJDsXOZ
 TXtPkKffPpj2A1dPWXPhB/Gm94uje/rqQ8Xnz9+G+pPx3tX0MO0jvMzau
 xBSMl4hBeEb+slmQCp2Yrszl5P7KdmwW7XuDETLtZw7wv9QiR3Z+PcriL
 tOIYdOHj/gnlgPgJ/MYxCo0qO3d0aqNstTYYQeASq0MZ3kQLoGQh5z8iP
 7Kkxqmhf19FUk6lI5RNG4yqfqt6JvbEVYgLLoxhFJcJXanqVrkG8slv8R
 JlZK6Ptw1MuW2cBgvYvtIgzew82WnN7LYKwNhb68Z1DIgFmoqzW/FGIQ9 g==;
X-CSE-ConnectionGUID: SKYuKIGCRwC526yuz9GF0Q==
X-CSE-MsgGUID: n040rHaBSUS1V9GVDIpwUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67857794"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67857794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:14 -0700
X-CSE-ConnectionGUID: /lfOFp5jSOmgC8746ichfw==
X-CSE-MsgGUID: s3hZPTT5TwKv5AdrEZmyCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165645731"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 01:46:13 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH v9 3/4] drm/xe/vf: Disallow setting wedged mode to
 upon-any-hang
Date: Tue, 12 Aug 2025 10:45:56 +0200
Message-Id: <20250812084557.7805-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250812084557.7805-1-lukasz.laguna@intel.com>
References: <20250812084557.7805-1-lukasz.laguna@intel.com>
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
index 412da766ea79..7a089999170a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1224,6 +1224,11 @@ int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
 	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG) {
 		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
 		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
+			mode, xe_wedged_mode_to_string(mode),
+			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
 	}
 
 	return 0;
-- 
2.40.0

