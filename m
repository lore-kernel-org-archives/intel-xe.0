Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB6DCD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB21210E649;
	Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq1wtv0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDAA10E639
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036272; x=1812572272;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VGgdoO9AKtQjpegVmFmvBIgkJJZkAY+EY9pbroNgLw8=;
 b=Bq1wtv0Gse1VmK4VSALFZIO71MXrOS+DFzBiRsnyYaIzyfoj6RV56q0A
 zS8w9DXSiI0eGjktoWyrrU0lipvtncErblOveLb//BOUfAsIuQTh9yD4M
 CtqtJ6DetgiJsCgLfw94u1Wk/evH1DRHBhUbvcMbByUKTrf/aE0IQYL8h
 NKpqY8VQfJ0lpDmzj7bDAThIHRpULkjrT+c4BDoPbbXYzowQCM0N2TXTb
 /stVxmCFPWna1RtIn52PL2cIMSV6K7jj0eS8t1oVqmLjYxPM0RRrb48cQ
 6oGsZgfukvxkImMgdAgpTkWCg/2dC8nLDjenePKyHCSaZYoiYGG5zokCs w==;
X-CSE-ConnectionGUID: 6DSvKEbISjW1CWIEzuBn6Q==
X-CSE-MsgGUID: XbDn93+eTaKixn01bXMDBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383303"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:52 -0700
X-CSE-ConnectionGUID: Ji0eAN8hQjiqigvfPMWINA==
X-CSE-MsgGUID: U3tUwGoiSMqW8AhE9BDNGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027547"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:37 -0300
Subject: [PATCH 5/9] drm/xe: Add platform-level step info to xe_probed_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-5-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

The platform-level step information depends on the PCI revid and, as
such, should be probed in xe_probe_info_early() instead of
xe_info_init_early().  Move the code accordingly.

Note that we currently only update probed_info->step.platform as part
of this change.  We will deal with the other fields of
probed_info->step as a follow-up change, which will be tied to the
probing of graphics and media IPs.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c5c75fbfa0e2..1c53a25442a9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -730,12 +730,14 @@ static int handle_gmdid(struct xe_device *xe,
 struct xe_probed_info {
 	u16 devid;
 	u8 revid;
+	struct xe_step_info step;
 };
 
 /*
  * Probe from the hardware the info required by xe_info_init_early().
  */
 static int xe_probe_info_early(struct xe_device *xe,
+			       const struct xe_device_desc *desc,
 			       struct xe_probed_info *probed_info)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -743,6 +745,8 @@ static int xe_probe_info_early(struct xe_device *xe,
 	probed_info->devid = pdev->device;
 	probed_info->revid = pdev->revision;
 
+	xe_step_platform_get(desc->platform, probed_info->revid, &probed_info->step);
+
 	return 0;
 }
 
@@ -759,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.devid = probed_info->devid;
 	xe->info.revid = probed_info->revid;
+	xe->info.step.platform = probed_info->step.platform;
 
 	xe->info.platform_name = desc->platform_name;
 	xe->info.platform = desc->platform;
@@ -808,8 +813,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
 	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
-	xe_step_platform_get(xe->info.platform, xe->info.revid, &xe->info.step);
-
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
 		return err;
@@ -1139,7 +1142,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	err = xe_probe_info_early(xe, &probed_info);
+	err = xe_probe_info_early(xe, desc, &probed_info);
 	if (err)
 		return err;
 

-- 
2.53.0

