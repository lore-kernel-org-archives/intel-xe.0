Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1E4CAC593
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9426110EBEC;
	Fri, 12 Sep 2025 09:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcHtEdiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840F610EBEB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669808; x=1789205808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+tAbjZP6fZt0IkTmXCN/Vjh8FoIKW5E2ePuCUUv+Qg4=;
 b=gcHtEdiZvUlzfI7Is2Kf0JL6xFkIOQG3l7+jTCzh+ppONS3nwNWRKYdP
 WSxqt3DvRWTCYuYeiNcMOxHTVEgygUxYhCgCIFfYfXTFPvn/zOYTSFkIS
 LtYvgzJp5VCAY4ja27CiS27OR5gLxaABwffQsL71R28s7L5AvzBrSRYOH
 36QYx4sXvvZ5uWSsAh0zI0vx3NzG8yzqgktUxnw0cTl35GhU18XkMTTzU
 4m6fFYZgq/vSTEAshFF+h2HDTE9xch4UAM/rr4SV2ZoL2GMDXBxEfZf/0
 Aev5F6OXFb8OIU6yZ1lGy45tDNDUCXsM0yQ8dZ4AC2Hlt2HUIsxYV+4FN A==;
X-CSE-ConnectionGUID: Zrbq9JFGRzeIh0Th4V595Q==
X-CSE-MsgGUID: IXENFDuhTI6+kS0Q7gbrKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159852"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159852"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:48 -0700
X-CSE-ConnectionGUID: utJvcLQ5SVmDWE3cY6BPPw==
X-CSE-MsgGUID: 1RZCzD9CRlOk6+OtfUhvrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311732"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:45 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 8/9] Handle xe_work_period destruction
Date: Fri, 12 Sep 2025 09:03:51 +0000
Message-ID: <20250912090354.2619418-9-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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

This adds the xe_work_period destruction procedure.
We iterate over all entries in the xe::work_period::users
xarray and cancel any pending delayed work. Then destroy
the xarray itself.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 569f3890bde2..e07bc2f2d0c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -481,6 +481,19 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+		struct xe_user *user = NULL;
+		unsigned long i;
+
+		mutex_lock(&xe->work_period.lock);
+		xa_for_each(&xe->work_period.users, i, user) {
+			if (cancel_delayed_work_sync(&user->delay_work))
+				xe_user_put(user);
+		}
+		xa_destroy(&xe->work_period.users);
+		mutex_unlock(&xe->work_period.lock);
+	}
+
 	ttm_device_fini(&xe->ttm);
 }
 
-- 
2.49.0

