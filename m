Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66B7C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 06:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41D210EC0F;
	Fri, 28 Feb 2025 06:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnuY0A4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7CC10EC0F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740725576; x=1772261576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MhdgQ5NobSmGdoH/AFVxSFIuq0UamU/eYuE3LZUqKHE=;
 b=MnuY0A4vVsQ3A9T8UEZ3uOQkBt+8Y+kmTyI7gRqkvQsuI4BDcFlnLQOg
 OlmjdEtPU/gwXkt2SrnzHCOMhEiRtC6ycIQ4hXOo3wcamhj/ST/EzU9Fe
 Vc8OO15xte2N4oUQ7RNHnSVButKZjO4iPqOq3QWiZxSn7vv2EQU+wMfLT
 czsqdUVS8zxCsFUPfMEwtxPxsMfRCgVeL5wUoqL4xcBlpx8bQ73NglCPB
 RSnFCDmN6GYmqsCXN8MYS2k8cFyACh8wilNFwmPqgEDdmvri6JFMBDoPc
 ndpmHmFB1AHnJ62CAZ6uoVlBXmNg4Wf0UloGdvdePYzXi4ixaLjjw5yiG A==;
X-CSE-ConnectionGUID: 9vI470hBRiGNH23PG6iXHg==
X-CSE-MsgGUID: ZInn1GOrR4WQLik97wZedg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45562087"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45562087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:56 -0800
X-CSE-ConnectionGUID: dIcABkQ+RliGe6bTx/O8gw==
X-CSE-MsgGUID: mpnTihMWSSShGFMk7pKdWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117442420"
Received: from dut2050adlp.iind.intel.com (HELO DUT2050ADLP..)
 ([10.190.239.12])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 22:52:53 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during device
 remove
Date: Fri, 28 Feb 2025 06:52:24 +0000
Message-ID: <20250228065224.320811-3-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228065224.320811-1-aradhya.bhatia@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
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

Now that xe's migrate subsystem is dev managed, instead of drm managed,
evict all the VRAM objects during the xe device remove.

The VRAM and TTM resource manager are drm managed, and so they are
destroyed when all the references to DRM are put. When that happens, the
VRAM and TTM resource managers evict all the BOs before their
destruction. Since the migrate subsystem will already be finished by
that point, the resource managers won't be able to evict the BOs
successfully.
Change that by preemptively evicting all the VRAM BOs during xe device
remove.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..ef293552db6c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -905,8 +905,22 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	int ret;
+	u32 mem_type;
+
 	xe_display_unregister(xe);
 
+	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
+		struct ttm_resource_manager *man =
+			ttm_manager_type(&xe->ttm, mem_type);
+
+		if (man) {
+			ret = ttm_resource_manager_evict_all(&xe->ttm, man);
+			if (ret)
+				drm_err(&xe->drm, "VRAM evict failed! %d\n", ret);
+		}
+	}
+
 	drm_dev_unplug(&xe->drm);
 }
 
-- 
2.45.2

