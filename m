Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9722FCAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 21:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3A410E5B8;
	Mon, 15 Sep 2025 21:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HC5DElV8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9472810E5B8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 21:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757972876; x=1789508876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4xbwItkbEgulJVeMjIUi0zFuJeXXHCxL5o3zXwoY66Q=;
 b=HC5DElV8/vxux1/B8HvDGBDo0qnNit5ksvJK5D8N22QXVj4GRFA/VEE0
 a3sUUkrH/mYd13wrcGZopLPgW62bzjguBkDxvRmmFd+Jvps7nOR/Zi0wg
 y744Q0qnlqXVVvb55T//KHYEW9lpMo6XWmd/ZxeUmZjn6bHY+6WmLeVuX
 RUVfXBpBIrEPr+8k9MNUDHcKC8aSyfkFisJRIQ6tA7c9gGgHs14TNqZrL
 LX1KmQoUQgbXf7uuLVT2aN8MYbLXg/n3S+zJmQ9jUVKtuJK4CgnQZPenb
 /kTWOMEEqp/WQ+1vEamqTjQDc7rjkEQVRmLGVbecgmk2QYNyIjKP9h6h3 w==;
X-CSE-ConnectionGUID: m1wQS5S2RnyXaHmn/JCxNA==
X-CSE-MsgGUID: /v9XqufzSGa+EkFXXqn31w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60388772"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60388772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 14:47:56 -0700
X-CSE-ConnectionGUID: pFTRmGNMRLS0gdLOwHr5qw==
X-CSE-MsgGUID: /wsqBW9zRju0KjIVEoYnbQ==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 14:47:55 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 1/2] drm/xe/xe_device_sysfs: Add cleanup action in
 xe_device_sysfs_init
Date: Tue, 16 Sep 2025 05:47:15 +0800
Message-Id: <20250915214716.1327379-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915214716.1327379-1-zongyao.bai@intel.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
 <20250915214716.1327379-1-zongyao.bai@intel.com>
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

xe_device_sysfs_init(): on partial failure, any sysfs files created
before the failure will be cleaned up via xe_device_sysfs_fini,
ensuring no leaked sysfs entries.

v2: Using "goto cleanup" to reduced code duplication.(Stuart)

v3: Split patch & remove unnecessary notes (Lucas)
    Adjust the comments accordingly.

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 6ee422594b56..e5e3c56ea53c 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -311,12 +311,17 @@ int xe_device_sysfs_init(struct xe_device *xe)
 	if (xe->info.platform == XE_BATTLEMAGE) {
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
-			return ret;
+			goto cleanup;
 
 		ret = late_bind_create_files(dev);
 		if (ret)
-			return ret;
+			goto cleanup;
 	}
 
 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
+
+cleanup:
+	xe_device_sysfs_fini(xe);
+	return ret;
+
 }
-- 
2.34.1

