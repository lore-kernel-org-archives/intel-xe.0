Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D30CEB8FB3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 06:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE93710E04A;
	Wed,  6 Sep 2023 06:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA7410E540
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693980620; x=1725516620;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gQb0QKlF1u2do9LcJnzuMAGtptkn6IQzM7lAwkK6wME=;
 b=XP1gaUSwPMecShyeMLrHpfmBEp797DX+BRh/H3GKfqdKMfCreaUWNrnq
 rY7cB/XN2WvFcsbNdNaLBWmY4HRkbqFqqbhX6I1sqxvbqubRhDL1ptgbv
 7WkU8KT6KWmPKOF5/72FTbKX4fNadhfp0O+ioYzRwk+UviGb2TUXqmiCD
 k8zUOS8OaEIpArNRKdK5MIE1QYbHbPBGoizEjZb6ln9YEcdrRT5T2N/WZ
 3VifD6cjwvG+IXjp56CVZzLfH/tsm/KEY7pAbDn1op6ofi5vGpZ0SEg9c
 uVBnhi9ZcFB9QlwE0ye2xz1j+xLWzBZXdTrRsIbSH8LeKHtmIX+bg7Jep g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443376883"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="443376883"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 23:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072268262"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="1072268262"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 23:10:18 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 11:44:49 +0530
Message-Id: <20230906061449.4147094-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/display: Print display ip version
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

Print display ip version during module load

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 60f3474844e2..60927ad7fa27 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -844,6 +844,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		str_yes_no(xe->info.enable_display),
 		xe->info.dma_mask_size, xe->info.tile_count);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
+	if (xe->info.enable_display)
+		drm_dbg(&xe->drm, "Display: %d.%02d\n",
+			xe->info.display_runtime.ip.ver,
+			xe->info.display_runtime.ip.rel);
+#endif
+
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
 		xe_step_name(xe->info.step.graphics),
 		xe_step_name(xe->info.step.media),
-- 
2.25.1

