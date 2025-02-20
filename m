Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688B9C021B0
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 06:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67810E8D4;
	Thu, 20 Feb 2025 06:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYevz6KC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6A10E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740032756; x=1771568756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L7HVFdixZfpa1W4KQAfruLaq7n3EL6kAvbcv5Mdd0Bc=;
 b=CYevz6KCfawXk1E8NLOs8BLRRR17+zadye9GSRpsTSPwLawugvyeDofK
 YWcX69I/M+EykVnOvzY5XmeM3c4dnQxv3LAZiFzORdnGzaPmtN+4CiggB
 EHoD6btOcE5C2H8WLmZ5+Jg7OOdULbNqUbj8rRyNgdbJ6xPN0+Suc/rs7
 Aw0cb1agMINTs1ZJbaaFtUKQTn2aCijRNoGYRY8vVGMOTCiGhPPGLHove
 QqH1eBa+rmYstZ0SMcKbhCXNIM8Q4OsURGgR/HQijX+uEqouFn4rK6cHc
 Ecm/U/6hbGu1qRFBclIpJAW8k59ThVol8o1/OoJdcTE7e+/h86PrKNZ0j w==;
X-CSE-ConnectionGUID: 0wV/Z8BOSG+hpWnu2meNWg==
X-CSE-MsgGUID: hF6+09X2S12tvlgtkB634A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40665053"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="40665053"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 22:25:56 -0800
X-CSE-ConnectionGUID: ZMwcaPq6TIGph/6JQYQjow==
X-CSE-MsgGUID: 03FVdLTDQGKKjCC7fAZT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114781944"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 22:25:54 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Create a link between PF and VF devices
Date: Thu, 20 Feb 2025 12:11:18 +0530
Message-Id: <20250220064119.26623-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
References: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When both PF and VF devices are enabled on the host, they
resume simultaneously during system resume.

However, the PF must finish provisioning the VF before any
VFs can successfully resume.

Establish a parent-child device link between the PF and VF
devices to ensure the correct order of resumption.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index aaceee748287..429e1c7909a1 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -62,6 +62,41 @@ static void pf_reset_vfs(struct xe_device *xe, unsigned int num_vfs)
 			xe_gt_sriov_pf_control_trigger_flr(gt, n);
 }
 
+static void pf_link_vfs(struct xe_device *xe, int num_vfs)
+{
+	struct pci_dev *pdev_pf = to_pci_dev(xe->drm.dev);
+	int domain = pci_domain_nr(pdev_pf->bus);
+	unsigned int bus = pdev_pf->bus->number;
+	struct device_link *link;
+	struct pci_dev *pdev_vf;
+	unsigned int n;
+
+	for (n = 1; n <= num_vfs; n++) {
+		pdev_vf = pci_get_domain_bus_and_slot(domain, bus,
+						      pci_iov_virtfn_devfn(pdev_pf, n - 1));
+
+		if (!pdev_vf) {
+			xe_sriov_notice(xe, "Can't link PF and VF%d due to missing pci dev..\n", n);
+			continue;
+		}
+
+		/*
+		 * When both PF and VF devices are enabled on the host, during system
+		 * resume they are resuming in parallel.
+		 *
+		 * But PF has to complete the provision of VF first to allow any VFs to
+		 * successfully resume.
+		 *
+		 * Create a parent-child device link between PF and VF devices that will
+		 * enforce correct resume order.
+		 */
+		link = device_link_add(&pdev_vf->dev, &pdev_pf->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link)
+			xe_sriov_notice(xe, "Failed linking PF and VF%u\n", n);
+	}
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -92,6 +127,8 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
+	pf_link_vfs(xe, num_vfs);
+
 	xe_sriov_info(xe, "Enabled %u of %u VF%s\n",
 		      num_vfs, total_vfs, str_plural(total_vfs));
 	return num_vfs;
-- 
2.35.3

