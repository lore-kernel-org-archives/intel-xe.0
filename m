Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5A5CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 06:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44121120BD;
	Thu, 15 Oct 2026 06:27:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F161120C7
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 06:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792045635; x=1823581635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlztRoBGPa61+oS+R9RDHk0iK6Cv0Vod7puwi9F3ias=;
 b=DL+peSezwAwJp1IkcGqLRRQWWVcIRhwsDKW1nADT82j1BqkEW+li8DU/
 f+on1Ogvy/3siuvPGwnVVatYVNFLGIjoUJQF1JmX5Uni0R/oMLXF9/1dZ
 KmYXCGcQH2NK0FVBjyz2ndZSWrXkdZRwT80usGLqh+rz/z5jzVEPxP1rV
 J+kfZf9mwsKAylpptcGl5oXvOu5YtKNbEWvO1Ab1EvdLlWECD4ox13qyV
 HbAzG+cMtQhmM2pmuGyuRPkrDfYULrK/oT+Lya9Wc7GtfVqyhBTYoSR7D
 9Dr9zrMdB3Kjo9fkimb4XP3aUY/nHxwhqn8zSxsMOUtkXZcM7prNbTI/n w==;
X-CSE-ConnectionGUID: LCPrxoEPRv+A6xO9fwsD2w==
X-CSE-MsgGUID: SGz+vOxOSjelv6+htur9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="817301"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="817301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 23:27:09 -0700
X-CSE-ConnectionGUID: +n9jeM30SFux0uE8PPnBkg==
X-CSE-MsgGUID: fENwqh79SdagMMs2CChfHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1566630"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 14 Oct 2026 23:27:08 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 5/7] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Thu, 15 Oct 2026 11:55:36 +0530
Message-ID: <20261015062623.385048-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015062623.385048-1-raag.jadav@intel.com>
References: <20261015062623.385048-1-raag.jadav@intel.com>
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

