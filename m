Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC77C46CC7
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 23:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8EB10E4E2;
	Tue, 14 Nov 2023 23:06:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAE810E4DE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700003174; x=1731539174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1CKvCt0a3rojwp7GhgBaZrOvg/zDZh7GQvXqOuQUTY=;
 b=l/INLd4LbCbGxYYKGj4jQt6pHFIcIE5G9SI6NHiCRnUC8ysSX8w2lVYl
 Wk0u3Td3GszS5H50ym15NMR2XNetQy0xq3At7223QzW90vlh9FxI6vo1j
 TqKQRBq2YtAWXAj5Ygcqk78QJTZ/XEz8jOJJbQaKgxby259Tua8nmGvSO
 dyGuWbZnHupaO5lMcC/kilF/EFvGZK8B4pHQJFuPiSOTgU7cfucfpQt84
 nM6rGHjWaHugAyUZe5qEd8tkZQSC6YDh/FYw6gVB2iAtVGLb4HoE1FA7a
 qC4UHp4a26sevLgL59yPgjWBNn1f/g3IGtBfAv7g082GKoyqqVB7c/tbj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421864120"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="421864120"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 15:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096258515"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="1096258515"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.195])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 15:06:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 00:05:58 +0100
Message-Id: <20231114230558.1774-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231114230558.1774-1-michal.wajdeczko@intel.com>
References: <20231114230558.1774-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Print virtualization mode during
 probe
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

We already print some basic information about the device, add
virtualization information, until we expose that elsewhere.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3030b223e4a0..cb762c11dd0f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -736,6 +736,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe_step_name(xe->info.step.display),
 		xe_step_name(xe->info.step.basedie));
 
+	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
+		str_yes_no(xe_device_has_sriov(xe)),
+		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+
 	err = xe_device_probe(xe);
 	if (err)
 		goto err_pci_disable;
-- 
2.25.1

