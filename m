Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A506DC54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 13:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CF710F12C;
	Thu,  7 Mar 2024 13:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fauzYqLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD9F10F12C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709819558; x=1741355558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=95NvVrUKlyFN2oD2+cvWKB+QUAzz0jBmBHu2Snz29Zs=;
 b=fauzYqLlXbfKCkEXe/xslv824fAQr2J/MZUID8aqBBe9+xSdpNsuWMDb
 NqImZIz6NycHsHrzTNrqFu78+v6YhcaHiVrPM4yri7zo/ayKgz2S6ikCs
 hCj/EXW07hOg/uTFgoL443RzZ3Ui5jmEYdj4iLbCT+ils6KHZhq0UaSA2
 UNYAQYjULu5eeU0VQ/Qk0gM+1sggr0DQ+f4pOJ0YQexBDntOFEGPMMh+J
 5LzjSBmy4iJFIQEzctdoElRFtLsy+GksooO0SdHzBk86STbK9TDi4UrlT
 hgabCq0MOqHKPoA9ASHoTVF4GEr0FXuFuCC7+HGl29FnPnz8+07ZzwnWW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4343244"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4343244"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="10557063"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 05:52:36 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Make devcoredump VM error state print
 consistent
Date: Thu,  7 Mar 2024 05:52:27 -0800
Message-ID: <20240307135229.41973-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This makes VM error consistent with [x].length and [x].data.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a7386..df9360a4c9e8e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3435,12 +3435,15 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 	unsigned long i, j;
 
 	for (i = 0; i < snap->num_snaps; i++) {
-		if (IS_ERR(snap->snap[i].data))
-			goto uncaptured;
-
 		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
-		drm_printf(p, "[%llx].data: ",
-			   snap->snap[i].ofs);
+
+		if (IS_ERR(snap->snap[i].data)) {
+			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,
+				   PTR_ERR(snap->snap[i].data));
+			continue;
+		}
+
+		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
 
 		for (j = 0; j < snap->snap[i].len; j += sizeof(u32)) {
 			u32 *val = snap->snap[i].data + j;
@@ -3450,12 +3453,6 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		}
 
 		drm_puts(p, "\n");
-		continue;
-
-uncaptured:
-		drm_printf(p, "Unable to capture range [%llx-%llx]: %li\n",
-			   snap->snap[i].ofs, snap->snap[i].ofs + snap->snap[i].len - 1,
-			   PTR_ERR(snap->snap[i].data));
 	}
 }
 
-- 
2.44.0

