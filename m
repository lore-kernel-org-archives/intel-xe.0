Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DB7C25B77
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47410EC25;
	Fri, 10 May 2024 18:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6kJVE5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63C010EC25
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364750; x=1746900750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lUeeIZXdVEU4fvbBugT77aCUWg5jYRAy2hLTk7HzcBs=;
 b=D6kJVE5V00LEGA4Ij61u4ZIoySH94UzrvGPFtsRLviQFTHPk+A3VhWlt
 ZzCBtdZF4p5PrBkYlpuDVC7t7PpiVwz9kQ9wHnWUDkZofGmJevGJG9DTx
 m61zFWgotWv2NZTLgJaopT7BnZLjERGb2hZulECnyw/PoxSQ9ItIBfxns
 rkCJpj5SB2AgaMl9yxOIsOIS0o9rsHIgmekJCTvHQFECyc5sXx/rmqwy+
 S9rBZ1bZ49i9I3trEWPdjDnKXJHdbUqluI9Tox618VTjkFPAd+Q8RdLvu
 g/QFnIS307bR0Bio7JdDwlSc253IlgGaoq9gpmmNHGAvAD5YPTWtxN9cB A==;
X-CSE-ConnectionGUID: bzSc9ILjSg6h3gJLDgtTEg==
X-CSE-MsgGUID: WxQBD16/Q5SPUScNEG05gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844571"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:30 -0700
X-CSE-ConnectionGUID: q7JJBRu6RqmTx001RPUjeA==
X-CSE-MsgGUID: h99UiwraQrKEVJP+IN81Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544060"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:28 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 03/20] drm/xe/pci: remove broken driver_release
Date: Fri, 10 May 2024 19:12:16 +0100
Message-ID: <20240510181212.264622-25-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

This is quite broken since we are nuking the pdev link to the private
driver struct, but note here that driver_release is called when the
drm_device is released (poor mans drmm), which can be long after the
device has been removed. So here what we are actually doing is nuking
the pdev link for what is potentially bound to a different drm_device.
If that happens before our pci remove callback is triggered (for the new
drm_device) we silently exit and skip some important cleanup steps,
resulting in hilarity.

There should be no reason to implement driver_release, when we already
have nicer stuff like drmm, so just remove completely. The actual pdev
link is already nuked when removing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f89c781986a5..d6f9880a15fd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -188,13 +188,6 @@ static const struct file_operations xe_driver_fops = {
 #endif
 };
 
-static void xe_driver_release(struct drm_device *dev)
-{
-	struct xe_device *xe = to_xe_device(dev);
-
-	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
-}
-
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -213,8 +206,6 @@ static struct drm_driver driver = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
-	.release = &xe_driver_release,
-
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
 	.fops = &xe_driver_fops,
-- 
2.45.0

