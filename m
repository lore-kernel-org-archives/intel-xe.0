Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E2FC98305
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66A210E00E;
	Fri, 16 Jan 2026 21:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKR1hToL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16F010E021
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768599885; x=1800135885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blrlMT6o68PM1zRekeLsG+EtKWNIl7AYfVcN1tuFaP4=;
 b=VKR1hToLgJ5ym32B+bArhlbrp8BK0oVIIb2Sj4VXt64KCAbjCOd9upL6
 VgoMr3b5exoPecdsJvxrWQ7QDeUPYkjULN7VgJ2Mdv6bt4RRAdMv9w/VR
 3JVRdnUsmASUEzHmTvE1jtjNYEW9p7n972Gd2SXawW4hHbkTbJciGAhTw
 WM3ieCirIPNy5ZZUM8Dt/Wu5OvCxlQZrxZ1ACURLElB6uRTUlychaJu29
 IAScOHMPSOiFXA5E4AObuA+6jM+oOVRvhteqwGoF5+oa8lubwK5sDhrpa
 gHB9rWA8GKVC1h93ZVAtp7t++VaeTkwB6ilijXy/akmqVBWk9Bf5tHkRJ g==;
X-CSE-ConnectionGUID: hEK712bhTCGxsz2DvRfArQ==
X-CSE-MsgGUID: 5/C4gN1uSlWw2jCqSgvxDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87334975"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="87334975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:44:45 -0800
X-CSE-ConnectionGUID: 0P8AuorZQMS1m1jaxB1pSw==
X-CSE-MsgGUID: c9FVWatvT9qXBFkCOr4ofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="209475678"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 16 Jan 2026 13:44:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Date: Fri, 16 Jan 2026 21:40:58 +0000
Message-ID: <20260116214055.2882338-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260116214055.2882338-4-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260116214055.2882338-4-shuicheng.lin@intel.com>
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
and remove it from the shared err: label to fix below error.

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

Fixes: d4c3ed963e41 ("drm/xe: defer free of NVM auxiliary container to device release callback")
Cc: Nitin Gote <nitin.r.gote@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 77856f460770..6d18c775d550 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -164,6 +164,7 @@ int xe_nvm_init(struct xe_device *xe)
 	ret = auxiliary_device_init(aux_dev);
 	if (ret) {
 		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
+		kfree(nvm);
 		goto err;
 	}
 
@@ -176,7 +177,6 @@ int xe_nvm_init(struct xe_device *xe)
 	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
 
 err:
-	kfree(nvm);
 	xe->nvm = NULL;
 	return ret;
 }
-- 
2.50.1

