Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2A0D29DC2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 03:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2044210E451;
	Tue, 13 Jan 2026 03:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfIxFFiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D510E44F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 03:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768273202; x=1799809202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpP7DbpWOj1qeq+tXjckNWwcyOLfreNOZz/LHR4DhdM=;
 b=SfIxFFiw2iypQo5QvGbQVXeetiq8yBL8jxezNPqhIhaTHLQPntIFNbnb
 +Oav3pCpnDajHle7muMv4kJH/ckcxF4iKJ5opgARMOeIx4jU2g7W5FheB
 qhCDOzw99Ins+lfE/CVZTA4Sx34AYYkB8Kxoz77clE+yAV0R8i/FCkmMi
 bB8i3keGUWC6cVlrvc19iCFf6/sCgk/NXaBPkzC9RUvva3SpZ87UG/2Sy
 yLafKQCuUZ4jTJLbj/ckemwtMGfKx9/wiadWCUx3DvxUyo57LF404V1wW
 +H5LobzAngtZb9ctBQwZZnKj24zkgv6tOoyTGIRhyiZnrezluz6MZSD+4 Q==;
X-CSE-ConnectionGUID: LsqhbKVmRbOMxOTHVLfG1w==
X-CSE-MsgGUID: AE+SCOhATjmWC54HkgyzwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80273980"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="80273980"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:00:02 -0800
X-CSE-ConnectionGUID: npVIyVAxTCi8LjYZBqr0ng==
X-CSE-MsgGUID: R6v+S5EZTqaGSj2DU6rzBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203422466"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 19:00:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH 2/2] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Mon, 12 Jan 2026 18:59:56 -0800
Message-Id: <20260113025956.3505110-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025956.3505110-1-matthew.brost@intel.com>
References: <20260113025956.3505110-1-matthew.brost@intel.com>
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

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

xe3p_xpc supports multi_queue, enable it.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..e21b437ad8fb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -113,6 +113,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
+					 BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.34.1

