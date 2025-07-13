Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF84C83F10
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 02:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593E810E033;
	Sun, 13 Jul 2025 02:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSbWYolr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D2210E033
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 02:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752372465; x=1783908465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WteIeOlmzLnLZq4bAw0bMvC9F+B5UI/Ns7a2lpF6kSw=;
 b=MSbWYolr6tjvzoI2qvWCa916LzA4O6Ivx4idDWTA5GPk3CL4e1k4++Q4
 Itq4g/gabiT3lz/89GMXszqwFsIJEQZXuOq3ueNzlMyCmJ0OXufgixYBl
 BliMi+BLbbd0srwSEM25ZHrMQ9eGhQccfyxTEO0tFAWgAcS6ZNNmjigjN
 lH/I2TnK1rhN52foY0y80jZgggoyODSm7Ds2efzXFhIH2gZi00QHAf4RO
 sZut1/9LoHUl7u7+dLmVGDOPKpY0s/dQpc48jiaXG+vsxtrRwPTwA2zpd
 VcSbLo3xyJYjIR0rQYQTM+eRteqC4hvySTBzgN4ZrNJV6oDlDs7cw9b06 A==;
X-CSE-ConnectionGUID: ZfhrbCh8Sc+3Z/lpSYHogQ==
X-CSE-MsgGUID: iU3BF2GQTUqzfjtWoJt3nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42247979"
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; d="scan'208";a="42247979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2025 19:07:44 -0700
X-CSE-ConnectionGUID: mt8lTK+2ToaHI6YfWbD3ZA==
X-CSE-MsgGUID: wZsND+SPRXuoKQg3OeVXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,307,1744095600"; d="scan'208";a="161205122"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 12 Jul 2025 19:07:41 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 stuart.summers@intel.com, daniele.ceraolospurio@intel.com,
 vinay.belgaumkar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Don't fail probe on unsupported mailbox command
Date: Sun, 13 Jul 2025 07:37:01 +0530
Message-Id: <20250713020701.2747237-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

If the device is running older pcode firmware, it is possible that
newer mailbox commands are not supported by it. The sysfs attributes
aren't useful in that case but we shouldn't fail probe because it.

Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 8250aa4620ee..654a1ba92311 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -160,8 +160,13 @@ static int late_bind_create_files(struct device *dev)
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
 			    &cap, NULL);
-	if (ret)
+	if (ret) {
+		/* Don't fail probe on older pcode firmware which might not support this command. */
+		if (ret == -ENXIO)
+			ret = 0;
+
 		goto out;
+	}
 
 	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
 		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
-- 
2.34.1

