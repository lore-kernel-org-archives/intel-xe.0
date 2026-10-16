Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BCBCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41CF112602;
	Fri, 16 Oct 2026 07:27:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C3E112602
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135638; x=1823671638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlztRoBGPa61+oS+R9RDHk0iK6Cv0Vod7puwi9F3ias=;
 b=hnmpCmWsyA32h2cUHBCquJ7mvpht6QG2fxcBHjVCPtOvaSu9h6oeo3AU
 j+PaX9+FAl1Gib70linpDIOzWUIEPIyNx1nKBbWEWi+w1hFcNXLXk/pZe
 7YuQpogVJ/2U/2VFMv5yQ4r1wgdAUGMpL2ZGYjm32bKTIbgt417vIaE4A
 EXZA09NPXZlk5OnV0OgUKDfktaXwWgASOLZG36zxQsOjsk+uawnC3JFOx
 JLWFUlWjt5LqMYPfRvYvYjRGpn6TbI9MoY8sfxRRabHWzmQI3PW4ZMWMG
 THBSWOLxi1kjUlpQavvynMNqbefvJwOytl1Xs3jS36hH0WLhDmGn5e3Lj g==;
X-CSE-ConnectionGUID: T2+TcH6zRueum8bjl3arVg==
X-CSE-MsgGUID: kenvp3pcTbyBGPUf07hjhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="806155"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="806155"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:27:18 -0700
X-CSE-ConnectionGUID: h7ggvnBMRpqWV2B54kuOqw==
X-CSE-MsgGUID: o/d6f5i+RnOH6eSyuN0Xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3673956"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 00:27:15 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 6/9] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Fri, 16 Oct 2026 12:56:00 +0530
Message-ID: <20261016072623.457392-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016072623.457392-1-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
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

With GT wedging now done async, make sure the wedge worker is flushed to
avoid side-effects during PCI bus reset.

Fixes: 13b9555ffb03 ("drm/xe/xe_pci_error: Implement PCI error recovery callbacks")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index e1b9dc5f0a6d..a5c8fd67738c 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	xe_device_set_in_reset(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_gt_declare_wedged(gt);
+		flush_work(&gt->wedge.worker);
+	}
 
 	pci_disable_device(pdev);
 }
-- 
2.43.0

