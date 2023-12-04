Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B274C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 10:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D43C10E339;
	Mon,  4 Dec 2023 10:51:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2810E339
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701687100; x=1733223100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zuUwW7kPy3pjP+wsdQ6z1A0CSXKttME7sdLnBO4LRfE=;
 b=I8ycVAGC9/LDbvXc9yxU4qfLYO1AdWRBQ9lVK2bgTLgLIt8j+F1PpusE
 P5j7grsTCcJyrmeWMEABEIxTx5yR7qsLqlX5IRa4LsAH0+rKg/4KqpVbG
 dIJ24QTe4j3G6ThCbcc2JnbNEoBEnLjmYqV/zHuQKh3SlJoZAV7G0v2ty
 7GXsT/CW9ayJqs8HODx1LlMzErxwu7E3jYzPVWsWysEP8Lnl6mYXxMk2w
 N6rhws8tUX727h/eNE1DHteS7ZLFWkICX/icTekqfKT5vVT3SKk0xfo5L
 9YkW3OI0lrK4FJG1bTeos4RTb2HaTh0hKzhumPLS6iPhgFdTt0V5ovnWG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="460209306"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
 d="scan'208,223";a="460209306"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:51:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="836546482"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
 d="scan'208,223";a="836546482"
Received: from psobol-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.9.144])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 02:51:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 10:51:27 +0000
Message-ID: <20231204105126.34751-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: add some debug info for d3cold
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

From the CI logs we want to easily know if the machine is capable and
allowed to enter d3cold, and can therefore potentially trigger the
d3cold RPM suspend and resume path.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +++
 drivers/gpu/drm/xe/xe_pm.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6977f48b03c8..501b4489f9d4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -751,6 +751,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_pm_init(xe);
 
+	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
+		str_yes_no(xe->d3cold.capable));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index e31a91cf311c..b429c2876a76 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -399,4 +399,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 		xe->d3cold.allowed = false;
 
 	mutex_unlock(&xe->d3cold.lock);
+
+	drm_dbg(&xe->drm,
+		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
 }
-- 
2.43.0

