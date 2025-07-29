Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0224C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 16:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EED10E05C;
	Tue, 29 Jul 2025 16:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN1Klp0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E0F10E05C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753807616; x=1785343616;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=I1wW63uK6+FV/Iow5bgtM+XA2LNz7V3PeG/4j/IM2kQ=;
 b=YN1Klp0HonmrDV4b66ftIWGI5gR7ML4nJZVT/3zGmxNHTmhiW6AG1v6i
 fkgohrAlSHFLsaeNduYyWX3uk9pj0wm9STKgwKWHFQWo8DRTS8Ul+5rf+
 EI5gZouyOXvfWBivpKRJCCZI3WUDlFAnwz040PD3HA//WUIvSYnfMurNg
 fRoskl6q9MneV0MXhLAJl4QzdhmDhyRHVc1/N2iT0biH6uvSOBfkXJPcg
 oVFG9FUrd0cWlv9JVHJ9reisS08z+phPmDyn4dwH2QsFGs2cKcT8iRFZe
 cn3DS1wFcIXcTp3UOL54zEJAH8eaS+U/czKrCAJ1p/qmnSTfukMi9/SSP g==;
X-CSE-ConnectionGUID: Jcl0Rmy0SDGAD6npIiviAw==
X-CSE-MsgGUID: sDernvb/QeSlbRX7oeDOJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73674606"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73674606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 09:46:55 -0700
X-CSE-ConnectionGUID: fGDilWi6RNajYc01JHpluw==
X-CSE-MsgGUID: DGyjDwk3SOOstnA5+7Gxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163093775"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.109.120])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 09:46:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 29 Jul 2025 13:46:33 -0300
Subject: [PATCH] drm/xe/debugfs: Do not register residency files for SRIOV VF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-skip-residency-debugfs-for-vfs-v1-1-3c5edec08c8b@intel.com>
X-B4-Tracking: v=1; b=H4sIAOj6iGgC/x2NQQqDMBAAvyJ77kIMlSV+RXqoycYuhUR2qSji3
 xs8DXOZOcFYhQ3G7gTlTUxqadI/Ooifd1kYJTUH7/zgyAe0r6yobJK4xAMTz78lG+aquDU+Ezk
 iCjnOPbTIqpxlvwfT67r+s1W3IHAAAAA=
X-Change-ID: 20250729-skip-residency-debugfs-for-vfs-4d707779fcb1
To: intel-xe@lists.freedesktop.org
Cc: Soham Purkait <soham.purkait@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Karthik Poosa <karthik.poosa@intel.com>, 
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Registers accessed by the recently added[1] residency counters debugfs
are marked as inaccessible to SRIOV VFs. That causes warnings to be
raised when an attempt is made to read those files. Skip registering
those files for VFs.

[1] Via commit 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and
    pcie link state residency counters through debugfs").

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Karthik Poosa <karthik.poosa@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 487579fd8524 ("drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs")
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 0b4a532f7c45..53b89528692a 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -360,7 +360,7 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-	if (xe->info.platform == XE_BATTLEMAGE)
+	if (!IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
 		drm_debugfs_create_files(debugfs_residencies,
 					 ARRAY_SIZE(debugfs_residencies),
 					 root, minor);

---
base-commit: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
change-id: 20250729-skip-residency-debugfs-for-vfs-4d707779fcb1

Best regards,
-- 
Gustavo Sousa <gustavo.sousa@intel.com>

