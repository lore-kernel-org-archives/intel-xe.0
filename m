Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420B0CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 11:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E0810E0AD;
	Thu, 11 Sep 2025 11:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEmNJpT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414E110E0AD
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757588532; x=1789124532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1UPU1XFJW9WYmYsP8/ici0VnptsuklET6mnf+DRsJ/4=;
 b=fEmNJpT+CBiJwrJfN7wA/D1HyFrqNgnQ0PQMsEylLyzkpAtGvR5OqXa3
 TwVSH7oYYtD8rzPxILjLYfNMDes61pQva8dY5QWNCS6Bxl4gYcTTWBwWm
 5df8qsy6uRfoyrTmsEiLwJwV1U41NEC2QIPY2m6BFbwxrkx07QEUpvV1W
 sIuClEq6se1RtkK6l7673l0Fkd/k6dN8YqBVGNO37VVadu3JgQWYW87GD
 BWfSSFfvyaf/+TkUqEJRdAfQbRHIpKggL/glZM1JTtfZt7qZ8oyPZXEPi
 yj+CIGN33L+VRB5bh572ikn1//ygn2NBEOiOPeuXInE7KSQoA24K7muJI Q==;
X-CSE-ConnectionGUID: lpG5zxWwShKztSnIfDu4BA==
X-CSE-MsgGUID: IyEXZgB8RJW6QQi+TPRupA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85359695"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="85359695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:02:11 -0700
X-CSE-ConnectionGUID: xaWUNwQ4Qdm6BI472ANhVA==
X-CSE-MsgGUID: YpKKfoZ1Q8Csi4NctM8nvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="178000307"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:02:10 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	varun.gupta@intel.com
Subject: [PATCH v2] drm/xe: Fix driver reference in FLR comment
Date: Thu, 11 Sep 2025 16:32:02 +0530
Message-ID: <20250911110202.810715-1-varun.gupta@intel.com>
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

Rectify the reference of i915 to Xe in a comment.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7bba535b145..76076e3f1914 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
  * re-init and saving/restoring (or re-populating) the wiped memory. Since we
  * perform the FLR as the very last action before releasing access to the HW
  * during the driver release flow, we don't attempt recovery at all, because
- * if/when a new instance of i915 is bound to the device it will do a full
+ * if/when a new instance of xe is bound to the device it will do a full
  * re-init anyway.
  */
 static void __xe_driver_flr(struct xe_device *xe)
-- 
2.43.0

