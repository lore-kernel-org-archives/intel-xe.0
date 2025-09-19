Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEEDCAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 19:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C410EA78;
	Fri, 19 Sep 2025 19:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvoZvlLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6A810EA78
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758309137; x=1789845137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YajSQH8ThQgMxA3T1khHLg0CRjxRL+sJ/HJa/Q5tDTI=;
 b=HvoZvlLuEsb4g5LTcASMI/iGTpRxA72PDE/deD4SOKjgeydtl9fXU9wB
 MhTkWQfU8KMV1hpqeVjhQpON/YGuiFsZljWGbve+bFx20PIblIKDM69Ve
 f801rDi1w8feOrrYFjpDuxIww23gpRgm2g8rTZ7rrrvJpSScCc+mdROtv
 waQJ7sB7MS+s7PT6S9hf/SsltP/vDgj4V9hy12dmsrAVlWniCWjFgptYI
 IDiK02woxCui9Op9AiP5UoIAt73gUNQOXRmD8JFFvpcflEXlDGDYxmiWE
 RzTGfGtTbYAuws2v2r8wg9wznvA5cfmkvK3su6CY1mrIzx7vbscSIHVBZ Q==;
X-CSE-ConnectionGUID: fGKS7orMT+6vp7xI3mSSVA==
X-CSE-MsgGUID: 8b1NOmRkT8e6ZtTLnMr80w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60579549"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60579549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 12:12:16 -0700
X-CSE-ConnectionGUID: ePIpXmQpRYmtu9050Lem2w==
X-CSE-MsgGUID: uBXS7Kr0STO0S7S7ZCuAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175530251"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2025 12:12:14 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v3 8/8] Handle xe_work_period destruction
Date: Fri, 19 Sep 2025 18:38:08 +0000
Message-ID: <20250919183817.52325-9-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250919183817.52325-1-aakash.deep.sarkar@intel.com>
References: <20250919183817.52325-1-aakash.deep.sarkar@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 30d9f2747eab..3b546d92fa03 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -418,6 +418,8 @@ static struct drm_driver driver = {
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_user *user = NULL;
+	unsigned long i;
 
 	xe_bo_dev_fini(&xe->bo_device);
 
@@ -433,6 +435,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (cancel_delayed_work_sync(&user->delay_work))
+			xe_user_put(user);
+	}
+	xa_destroy(&xe->work_period.users);
+	mutex_unlock(&xe->work_period.lock);
+
 	ttm_device_fini(&xe->ttm);
 }
 
-- 
2.49.0

