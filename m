Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA696CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 09:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6B10E726;
	Wed, 22 Oct 2025 09:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jB8c7KHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18610E726
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761126194; x=1792662194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gvFW9sXDSfFX3I6wKo+PDCRF7ttP/lLxyH3pdmYoI+A=;
 b=jB8c7KHnyqdETINd9VsWUrxSNAsNjlL1tjAFGPO4tGcgTeGgoAJ7JBki
 +0atKBfNZzt1rkVjKzAER/oCmMY7fEmAfzBrkcAjbIWIE+Dlo0q4FmD0a
 3a+YpPocOVzJvsByrYqjCoLGf+cWnP926vmklRnKLmTWMsUW79mVkrpUJ
 UXthH89OWTFI7/iA+4xQd7BdYXE0BSgQjfk+a7kb5pKe4NNe84yPSW9mv
 oKD2FKlhldrorURxopDzdMomuUWreyg6/6J0xYv0KX+17QBVeqhf9X1xv
 N8NrzYF+w3MMg2rfaEpa27Y/aPGyKWeDZT+aCS3qF+3E28I4hS8Uphqh1 g==;
X-CSE-ConnectionGUID: moBxxGICSU6+8V6wVxpWTQ==
X-CSE-MsgGUID: 0rz5tCZDS1OtbXkAzdGccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63363957"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63363957"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 02:43:14 -0700
X-CSE-ConnectionGUID: KyXycgPuS6mAE+ucwAEoQA==
X-CSE-MsgGUID: nSwmmJxNRJeFhgAwp4ss6g==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2025 02:43:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 3/4] drm/xe/pm: Assert on runtime suspend if VFs are enabled
Date: Wed, 22 Oct 2025 15:12:45 +0530
Message-Id: <20251022094246.3584785-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022094246.3584785-1-raag.jadav@intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
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

We hold an additional reference to the runtime PM to keep PF in D0
during VFs lifetime, as our VFs do not implement the PM capability.
This means we should never be runtime suspending as long as VFs are
enabled.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c326430e75b5..c2939faa2296 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1132,6 +1132,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	/*
+	 * We hold an additional reference to the runtime PM to keep PF in D0
+	 * during VFs lifetime, as our VFs do not implement the PM capability.
+	 * This means we should never be runtime suspending as long as VFs are
+	 * enabled.
+	 */
+	xe_assert(xe, !pci_num_vf(pdev));
+
 	err = xe_pm_runtime_suspend(xe);
 	if (err)
 		return err;
-- 
2.34.1

