Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63730D78797
	for <intel-xe@archiver.kernel.org>; Sat, 20 Dec 2025 00:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007E910E83B;
	Sat, 20 Dec 2025 00:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6Hq3l/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A010E83B
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Dec 2025 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766189536; x=1797725536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QoyNnuaCb2dFMwbZZgKAhh9H10pUQa984IvN4Iulykc=;
 b=O6Hq3l/WIPNG6GfuZDuFR/0y7lVtR8cZnnd8+2paGfSVwCq8WC+jwvkf
 6pRvBqP/+poGdDKK7KltgKQdN1CAr9EPl0eFajjJF4vlCqUjvH0UDfU5D
 NPRVKLpay3hALJLzBp7o197tdYn3uxV4Uwu3fnwUlJkvUx8XcFjMq3wZW
 iAuRQfY5q/eSVdsv28HUjm7fpXS+RFJUXN1lAj2qiki9h7t/Tq08jTRxl
 CvnZdT+EybcbU2+hfu5iYZcu4RQulR2nFLcVwces70DqC6lzAA4oS6EE7
 w8qhYFXRhD8Sv/Y7RH82ep1fRIsGqfya/Tg2tcQbvT+NTxtdehbzsFuX4 Q==;
X-CSE-ConnectionGUID: vI3HgBw8RK+8VczhVX/rqQ==
X-CSE-MsgGUID: zPnHXtJNRYi3Asst/iqUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78868574"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78868574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 16:12:15 -0800
X-CSE-ConnectionGUID: bFCRtlj+SBmgUYSJwP3GjA==
X-CSE-MsgGUID: FqJLNm8zRli3Jx6PlbPyZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="198902197"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 16:12:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Unplug drm device on error
Date: Fri, 19 Dec 2025 16:12:10 -0800
Message-ID: <20251220001209.2888121-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

A probe error is resulting in some stale sysfs nodes like renderD128
that were created by drm_dev_register. This is preventing subsequent xe
module loads since it complains about duplicate sysfs nodes.

If we fail after registering the drm device, remember to unplug the drm
device.

Fixes: 62fbc75b28a7 ("drm/xe/hwmon: Stop ignoring errors on probe")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 00afc84a8683..fcf22e6ed80b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1037,6 +1037,8 @@ int xe_device_probe(struct xe_device *xe)
 err_unregister_display:
 	xe_display_unregister(xe);
 
+	drm_dev_unplug(&xe->drm);
+
 	return err;
 }
 
-- 
2.43.0

