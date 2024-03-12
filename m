Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AE7C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6310EC39;
	Tue, 12 Mar 2024 14:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaowQ02R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9413310EC39
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252709; x=1741788709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7i3fHJbbr8mM+wemrO/eFjLm2b0tebKeK8W9qqIMaMA=;
 b=QaowQ02RT3udU7+VtgcfDV8d/uUMf3pTJe1V5FQEHsVIlYk30Uny1YLk
 o5FKjZWEdXS0OCU/QIpNlx+mQRNQFfnr4t+P+e/3ajCGuR98+hS3F4boS
 /26zKKoIBoDhRX3uXmvLcK/mTEu5Wn2R4uVzkQjuXE/JF6dnqzMarxdFP
 nEPiTiHnd1dP3uEkIrwW5kLbWSRLCo9fku65Mtvv6EUZaHiEMrWXpSXxJ
 Yh3fkmDGZEyOyCF71jfpxjoikVsJKzqACr3vaiqBUx5lcVUQye2twQfLF
 29uKig4fqCqrTM+PZcxdYfUgCnEAmNASbVmnasYVGurLyKYHmwISLyfib w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7908625"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7908625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11454548"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2024 07:11:45 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/gsc: Check for possible err in forcewake GT
Date: Tue, 12 Mar 2024 19:54:24 +0530
Message-Id: <20240312142424.3152951-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

GT Forcewake can fail, check for success before
moving forward

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index d9aa815a5bc2..a5ee1b39f4a7 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -287,7 +287,11 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (ret) {
+		xe_pm_runtime_put(xe);
+		return;
+	}
 
 	if (actions & GSC_ACTION_FW_LOAD) {
 		ret = gsc_upload_and_init(gsc);
-- 
2.25.1

