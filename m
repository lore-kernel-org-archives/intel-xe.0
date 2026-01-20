Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD9D26280
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF16010E647;
	Tue, 20 Jan 2026 18:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dX+UX368";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF4D10E64A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768934152; x=1800470152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KQGHNXS5RcjXCgsD9lcpc5EXR/l85j6RBGx5uONnUxY=;
 b=dX+UX368Cwso7llgfRdmLxbK5JzoeUkXoz3LZICAlXSQyLprklHP9/F6
 hVCuEt4S60/Dd92bblQVqo4Ow7W94nBPUt9QzBLsXa+F9c+BOshCWvKrf
 BzT+22VZkCwlsZqFYYxRwRm3O3CPMHsiKV3QOBo5cN69Ky5RDKuBgcWLu
 bCcATVyOk8VxQ6w4oTBaXT5IQaJ67xztVvKPnIt6QR/l0TksElPHw+Lv1
 T98JIl+7ZL4kroCiSR4uzKrLm+9o/58exLHR2nNbYPMxsEeHR+rgrPDlW
 YC6hHF+IFBehw2UZn3M34Burp93LmHFqFxb4M6kqWgPHXY6wkuHFFd5Ox w==;
X-CSE-ConnectionGUID: vCN1LtK0RQCLb6oAo+nGhA==
X-CSE-MsgGUID: 0Y+sfmqoQiigvX77P8XQzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69883282"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69883282"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:35:43 -0800
X-CSE-ConnectionGUID: jGgEQMACSumxBvH92DacXQ==
X-CSE-MsgGUID: 7xdDdgRHQ0u1W7cptOKpeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206445789"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2026 10:35:42 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/3] drm/xe/nvm: Fix double-free on aux add failure
Date: Tue, 20 Jan 2026 18:32:42 +0000
Message-ID: <20260120183239.2966782-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120183239.2966782-5-shuicheng.lin@intel.com>
References: <20260120183239.2966782-5-shuicheng.lin@intel.com>
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

