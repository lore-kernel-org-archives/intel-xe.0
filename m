Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E9CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D3210EA23;
	Fri, 26 Sep 2025 11:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSmVOUEe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152E10EA23
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758885616; x=1790421616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/tFtUxdqNKSuh3K1fa3bUaBAaevz5ag5G4F6VcB97J4=;
 b=iSmVOUEerlFJiqKipjJJ5GOuaLNT63Fcl5zyNcMahbQqKMIrqIsDOFfa
 xvBX2nXnkWsG4KXsRPIrSeNx45JOiw2nTy9go+7wIf1abZzSCeecUPpEc
 OCqTBeAWu2hFhliK0empa4qqTGXuR5PwuLMG1OLjJPajauTEg6wIJlro6
 geh7vQvXAEzfciHmNVhD5yi79D14sDGwxyGIEAGetkphXPmglpq4FRNRZ
 rF0I7TU+eba2ACXXXBp2+TnhHH+q3n5RhOB6WvjAlqsgCsiYpKpoic1rJ
 gQlZDsK/FzWaqEBQLq+fhXO7fc/76ZAqsGJUxqaiIiUvYUMBh184ZqSvN w==;
X-CSE-ConnectionGUID: uZlsP1ftQA6KY60IIduKeA==
X-CSE-MsgGUID: PcObmiTASBmnWgGxcx9R/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72314434"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72314434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:20:16 -0700
X-CSE-ConnectionGUID: 5o0NDck5QMmTo6srVDZoMw==
X-CSE-MsgGUID: KKecQMQzQ+aFxWcVfD0BNw==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 04:20:14 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 8/9] drm/xe: Handle xe_work_period destruction
Date: Fri, 26 Sep 2025 10:45:19 +0000
Message-ID: <20250926104521.1815428-9-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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
index c34da72e5c9a..e270f57a9750 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -419,6 +419,8 @@ static struct drm_driver driver = {
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_user *user = NULL;
+	unsigned long i;
 
 	xe_bo_dev_fini(&xe->bo_device);
 
@@ -434,6 +436,15 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
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

