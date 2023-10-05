Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50AE7AD44
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 16:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022210E430;
	Thu,  5 Oct 2023 16:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA76610E430
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696523947; x=1728059947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xoJeColMssbLuKD5Z/+lN/ZNcM2Z3CAJwj+dEc8v8Ws=;
 b=hHBCHmVU6QKHgYAzv8giGIHfDT6YbgV2bUtHdhvnqR2CkG3j3h7QZx8W
 OmJi0+w/+q8RclnPKCP+xCjnc8Tr3AQltZ1Wjp1WVQvLZqiS4MtDtgANd
 A0cWvO4LZ9kQZVusQ8Y9BlxZYd3UOMmfRWZosxjT5f4BCYCqTk1Xb8hKB
 IA+Il+NlUglUUeuuQ+YZ4bnznLvkZrOtLJMmjrbxCvVYvOW0Y/YX9p/Zl
 gG5kYXBoAcGMRV6cRFyEgrgcDADUdPJnkTuPkM259txH1b2yqo8XGw9c6
 apNLYzBwXtR7P/GgSTcXit6j82cjHWLr9e/Eq0iKSIxI/z5AGnCWbSfF2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363830255"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363830255"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 09:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751817083"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="751817083"
Received: from ssshahap-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.30.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 09:39:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 17:38:55 +0100
Message-ID: <20231005163854.483488-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/hwmon: fix uaf on unload
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It doesn't look like you can mix and match devm_ and drmmm_ for a
managed resource. For drmmm the resources are all tracked in drm with
its own list, and there is only one devm_ resource for the entire list.
If the driver itself also adds some of its own devm resources, then
those will be released first. In the case of hwmon the devm_kzalloc will
be freed before the drmmm_ action to destroy the mutex allocated within,
leading to uaf.

Since hwmon itself wants to use devm, rather use that for the mutex
destroy.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/766
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 1deb5007e1e2..9d3e06b96073 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -584,6 +584,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 		xe_hwmon_energy_get(hwmon, &energy);
 }
 
+static void xe_hwmon_mutex_destroy(void *arg)
+{
+	struct xe_hwmon *hwmon = arg;
+
+	mutex_destroy(&hwmon->hwmon_lock);
+}
+
 void xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -599,7 +606,9 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	xe->hwmon = hwmon;
 
-	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
+	mutex_init(&hwmon->hwmon_lock);
+	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
+		return;
 
 	/* primary GT to access device level properties */
 	hwmon->gt = xe->tiles[0].primary_gt;
-- 
2.41.0

