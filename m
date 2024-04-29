Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED9C25B5C
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A6112C02;
	Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gglKd8rJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD12112C02
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392954; x=1745928954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kOy9BO1cxQsJQd+om7PsWAE6bChjvFSgX7s3Wmc1l48=;
 b=gglKd8rJm9dXbRE/dOsfo/vcjWTu8ACcJWEBS4B5rtTXoWDErsr1yRZJ
 YyRY2aXUNyHYxCQNjBBkMTIwaTlbkyY6eb2TcfXF+dt0OE5BfAZIx1F/+
 nLPc+imogzvx3X932987yQ9enk3MEWUpMMTEkxMOZyHcJSkMq9mBkBSi8
 Ki4l71mCVbbt4KnN505Jqx/pISm3qIxV/JUqxfIvgGc8DDd6YrZ3Iei+v
 oTN7NXR4ySeSkoAYYCm7yKzQ9Ibrc36NsMl4czwlOtzHiOaQ83FGX41Z3
 vrxEND5lgeFp9EMSbYam/4z/S6uf1Ww83X0jvgM6xCu+ETv+utXiEIN2H A==;
X-CSE-ConnectionGUID: bgWtY+b0SwOGmQEwQP5WuA==
X-CSE-MsgGUID: Ph2BwljWTpavx4EMUARYFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878404"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:54 -0700
X-CSE-ConnectionGUID: Jpf63yh1RSy7pvh2xJHJNg==
X-CSE-MsgGUID: 7FoGhHmdSvWhD9mZ1AyfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303412"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 7/8] drm/xe/device: move flr to devm
Date: Mon, 29 Apr 2024 13:14:43 +0100
Message-ID: <20240429121436.33013-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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

Should be called when driver is removed, not when this particular driver
instance is destroyed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b61f8356e23e..ba917e383f8f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -387,7 +387,7 @@ static void xe_driver_flr(struct xe_device *xe)
 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
-static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
+static void xe_driver_flr_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -589,7 +589,7 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
-	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
-- 
2.44.0

