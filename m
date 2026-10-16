Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF07CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6610EC3A;
	Fri, 16 Oct 2026 03:16:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36CD10EC3A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792120586; x=1823656586;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlztRoBGPa61+oS+R9RDHk0iK6Cv0Vod7puwi9F3ias=;
 b=SEtf5GotevIJwj8GPgL4RucCD6DsW2eRmXzb9xJ6GfN5mYclyAVX+lOS
 9b2DY2VBMi7OQ/epZBfRYaH+ZQcwI2kzzrp52LtdYOTpmm1JPKrCOJ5lO
 Qb6/Tieg894PZfW1U+y0f+K+FScDk03t4EE+7j4OjhE4G75eScP8AMcR3
 yxiZ6w+ZSj3cioGiF1ECA026EwQu9yGW6Y9jI+9NHC6rVf7dE7jmUEqIR
 vAb1YfqlY5mcJ34nhzFzK9NcPRJemnFHkuKxqiF8BH6DgkkeQcQBv8hBr
 NckpI/UkN1lVB2E1P/MS8lwtfBDZ5P3cRHiZvnGrFiGlgT+6ILT+uTS1s Q==;
X-CSE-ConnectionGUID: fZz9so55RU+Gt1Ysx6TW5w==
X-CSE-MsgGUID: gInlna+7Tpy0bkwd5lkmXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="933508"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="933508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:16:26 -0700
X-CSE-ConnectionGUID: 7n1Dhuu1RkWfllp4sVYygg==
X-CSE-MsgGUID: Qa/pKEBZTy2wKCF64xCfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1854116"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 20:16:23 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 5/7] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Fri, 16 Oct 2026 08:45:18 +0530
Message-ID: <20261016031559.427941-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016031559.427941-1-raag.jadav@intel.com>
References: <20261016031559.427941-1-raag.jadav@intel.com>
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

