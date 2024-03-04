Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5045FC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59AF1121C6;
	Mon,  4 Mar 2024 14:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4GxTGD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6868F1121C6
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709561125; x=1741097125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I/lz+psv6F4OgvJ0mxjhONVFYdt9W1sFKQdr2X0qvNs=;
 b=k4GxTGD9KTomTlneNEixLf1eYH7LayE0xmxen8oVCew6UKZkOArQ5ITB
 H0Qf+RYjPEcyegTmZgamU+Wv6X9ompemOjPzC3owOZbMJ/itR7Shy6uX+
 vxPnoaaNbeBEMI4YsfaUsOfFt9M2eNREEFho23XNbzVacjGDjO8toqIFt
 BdFMsTAdkHBAwjZq2oK37CG2NZf3udUVwv+zm5wo9AyrtR7hgdfwZQYCM
 NYwozLXIxmref9VMv2xJVwhxbByASXa2eKEtlgpj95Txlx1q1mdb8PnVI
 WqxykBRZpbM8JzuohuJ5J22qgfjqYRqi8y8gKnDNuNKsfYPZ+QbxTX+rn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4175441"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4175441"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8920929"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:22 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/4] drm/xe: Make devcoredump VM error state print consistent
Date: Mon,  4 Mar 2024 06:05:11 -0800
Message-ID: <20240304140514.24768-1-jose.souza@intel.com>
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

