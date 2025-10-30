Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C0CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B910E269;
	Thu, 30 Oct 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqi7bA6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0F410E267
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761827078; x=1793363078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pioGi0JWLhG2fmFzEjGp1vsGXfYyIw7+lo80eZ64gkk=;
 b=iqi7bA6sfXkhYeGm9Dc2n27HwnJgdXwYROYtr5oHoUf+2WyPQVqXUZUl
 f0TprVKggEZKDYyxG6UTs6Hj0SK1Y6yevubqoK9TxrDwbahw5K8NAu4K/
 T61OkvR986KY/hCzP2Q7QiBYS+pjDv7d9HGTqvrVqsjttBY6lFr9WU/+t
 XUAVACo9+GJ5Jaxgjr3Cjnxe3WePKaOHO8FIX0Kv7drr1QnBc26uHYP1Y
 SjtQRS/3OMsv5fkWxydUAc845yx9aujYvAdpQmgmnfAKJ/Py7LiB5Pq2q
 ZllOBPk9kzfKwnw1W91Vi/LsHfo7P7+WVjLMsYRSotHBDS3aQOQOIuXPF w==;
X-CSE-ConnectionGUID: OeKCn717QAmL57kmJ9Dnaw==
X-CSE-MsgGUID: ZUN3MkcaQo+1qO26pp2cHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="64062632"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64062632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:24:38 -0700
X-CSE-ConnectionGUID: l1qFT9rLRai+odSY1z0HBA==
X-CSE-MsgGUID: BanWl5peTpiaRYLod7u4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191103687"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 05:24:35 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are enabled
Date: Thu, 30 Oct 2025 17:53:56 +0530
Message-Id: <20251030122357.128825-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030122357.128825-1-raag.jadav@intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
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

v8: Add !IS_SRIOV_VF() assert (Matthew Brost)

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820..1c37f4d91047 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	/*
+	 * We hold an additional reference to the runtime PM to keep PF in D0
+	 * during VFs lifetime, as our VFs do not implement the PM capability.
+	 * This means we should never be runtime suspending as long as VFs are
+	 * enabled.
+	 */
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+	xe_assert(xe, !pci_num_vf(pdev));
+
 	err = xe_pm_runtime_suspend(xe);
 	if (err)
 		return err;
-- 
2.34.1

