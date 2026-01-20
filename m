Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0346D26284
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDB10E1CF;
	Tue, 20 Jan 2026 18:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHspULDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4110E647
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768933911; x=1800469911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQGHNXS5RcjXCgsD9lcpc5EXR/l85j6RBGx5uONnUxY=;
 b=cHspULDGRwZwY5FimarmYXMTWW+VYFBb5vVAIs/R/Rls80mrdDv3Zefe
 F5PnO4U+zjl1RKcYAX2qoCtL0/YoFmtZ56TTizqYrSRMH1cJfj406tDuf
 RN+/eI6txteolNYRDR1vVtRq8X9+kQAlMjMhy3SgDEcPipiPCkLbM/sNj
 reL9hmImt5zEsLyVtyKyAJNtkn0sH+6jCN9bfkwj9HAxBglDJIodoZPPj
 YrlQP0UjgrayOwOANyEFOhX0jiRTEom6+pncL/XKgYNupL93qz4DUKDpw
 nHFw28TaWE5sTDZUY2RDR2rseEp8HL3LbDBS4isOr8Pn2Uyyh748YMCco g==;
X-CSE-ConnectionGUID: mpqc8LmWTtSrCKV8iSh/HQ==
X-CSE-MsgGUID: IiTHYTeRTra5+D1xmiDx0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95628428"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="95628428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:31:51 -0800
X-CSE-ConnectionGUID: msmuUnhESdi5Uz2hg0NFvw==
X-CSE-MsgGUID: eDALCVRsSVmhGu+lk3l4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206612835"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 20 Jan 2026 10:31:50 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/3] drm/xe/nvm: Fix double-free on aux add failure
Date: Tue, 20 Jan 2026 18:28:18 +0000
Message-ID: <20260120182815.2966078-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120182815.2966078-5-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260120182815.2966078-5-shuicheng.lin@intel.com>
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

After a successful auxiliary_device_init(), aux_dev->dev.release
(xe_nvm_release_dev()) is responsible for the kfree(nvm). When
there is failure with auxiliary_device_add(), driver will call
auxiliary_device_uninit(), which call put_device(). So that the
.release callback will be triggered to free the memory associated
with the auxiliary_device.

Move the kfree(nvm) into the auxiliary_device_init() failure path
and remove the err goto path to fix below error.

"
[   13.232905] ==================================================================
[   13.232911] BUG: KASAN: double-free in xe_nvm_init+0x751/0xf10 [xe]
[   13.233112] Free of addr ffff888120635000 by task systemd-udevd/273

[   13.233120] CPU: 8 UID: 0 PID: 273 Comm: systemd-udevd Not tainted 6.19.0-rc2-lgci-xe-kernel+ #225 PREEMPT(voluntary)
...
[   13.233125] Call Trace:
[   13.233126]  <TASK>
[   13.233127]  dump_stack_lvl+0x7f/0xc0
[   13.233132]  print_report+0xce/0x610
[   13.233136]  ? kasan_complete_mode_report_info+0x5d/0x1e0
[   13.233139]  ? xe_nvm_init+0x751/0xf10 [xe]
...
"

v2: drop err goto path. (Alexander)

Fixes: d4c3ed963e41 ("drm/xe: defer free of NVM auxiliary container to device release callback")
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>
Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 77856f460770..6f9dd519371c 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -164,19 +164,17 @@ int xe_nvm_init(struct xe_device *xe)
 	ret = auxiliary_device_init(aux_dev);
 	if (ret) {
 		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
-		goto err;
+		kfree(nvm);
+		xe->nvm = NULL;
+		return ret;
 	}
 
 	ret = auxiliary_device_add(aux_dev);
 	if (ret) {
 		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
 		auxiliary_device_uninit(aux_dev);
-		goto err;
+		xe->nvm = NULL;
+		return ret;
 	}
 	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
-
-err:
-	kfree(nvm);
-	xe->nvm = NULL;
-	return ret;
 }
-- 
2.50.1

