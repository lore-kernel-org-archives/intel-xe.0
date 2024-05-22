Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66104C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046710F4B1;
	Wed, 22 May 2024 10:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVwE7x9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1110EBFE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373326; x=1747909326;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KCALLNd5pL1pPi8x2R6KIkgZqOF/v1MKm7XNyrxoJ+Q=;
 b=dVwE7x9AditiYlJ9FE9Gcrla7z543vqK02lzPybOpb/2ai1/4cagJG8c
 W0YlOaRh6M/TtHn6rDCGoRD59VVPDvrLTHaGJA6CiRdz5PAuMjbv2Fbmh
 HuGUXFx0HoJfQ3efmZJya6hRo4i2FmTO+aRK7CfJy6xpZNZnLuUg68jpJ
 s0JjnGm2iBf0uGjbQDW7tLMEzY9lMB+pZXp53wTKsutfi6AwTyCgw8k8G
 7/rwB1WVyCm8zri+3OK7MN8MjO9W/0XLan/pDPHjOqoOjqqulQIJemIP+
 vOUQz86fXRlEZrSjPGWEnRCVwHFrXisiUAPfOKHZaj6MMIx+rNRCV7fIv g==;
X-CSE-ConnectionGUID: oyBHe7ysS6iKE3+ddNT/+A==
X-CSE-MsgGUID: jvxKkuPkSo+lbSSKRKOmBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562676"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562676"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:05 -0700
X-CSE-ConnectionGUID: 5A4TfpzAQIOyMFZ+WZB0jA==
X-CSE-MsgGUID: ok5jNiFQT8SY24Iyo8Mtrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195218"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 01/18] drm/xe/pci: remove broken driver_release
Date: Wed, 22 May 2024 11:21:44 +0100
Message-ID: <20240522102143.128069-19-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8da90934c900..f17283c9dcb9 100644
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
2.45.1

