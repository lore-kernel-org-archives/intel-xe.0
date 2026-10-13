Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF4CC6B15
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B97A10F9EB;
	Tue, 13 Oct 2026 21:47:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4F10F2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791928054; x=1823464054;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dJ5q09Y0JRSNZHn9BaYBqOY2g6HmUax7eL1boDeDoHs=;
 b=mc9RoTpxXeM9uaWlJRuEt+ksdt2eI+TGMumn+eYp1j2NBzIv+oGdbawl
 qijkQ+LJ5vp1T4NjBcGOIgBKc0K2hgWOqC8IxPsrdffolW8QO3IHhJzUq
 ET8753zAEEO3cstTVGRLqF9j/Sk9jbl9sDGjaHYyim04yuF30In0ioXGh
 0Pa5TIMo/uNqJy52oUVL/XhHXfqXSMf5MIIK0e6L8rCRvDraXGQQtRBEy
 kkUX0dU/+Fstnp3QTWVV21OogHZYU7ETkoXSLmvpBswiMI/rOadvCuv4A
 1VoNO+VpsKsm91urQsU1vFEmsf9OJQQ1MGLImQIE28R9x8xu8v/PtaSm2 A==;
X-CSE-ConnectionGUID: 1lcbMFTQQfupjEsWE8iJmg==
X-CSE-MsgGUID: PfGhPjA9TcqOs3XNQCVJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565927"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="565927"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: j42PDZwpTIuEqIhNj83pkQ==
X-CSE-MsgGUID: ydcc6n2yR/a3phbgHhryHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629856"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v12 12/21] drm/xe/vsec: Update VSEC probe order
Date: Tue, 13 Oct 2026 14:47:05 -0700
Message-ID: <20261013214655.3502964-35-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c4..c999d874a0e8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1074,6 +1074,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1087,8 +1089,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

