Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FD8C79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1710FA91;
	Fri,  4 Sep 2026 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCh44fjf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C996D10FA91
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541549; x=1820077549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OsE0l/kbdFUFenadJ8wCOtZt3ev2BUUeMKIJfTRMjME=;
 b=eCh44fjf2auAGk2refw9a5LTwa6zmTDcLaON3Uk3CyXc13cyQtDLqGQg
 Dxbsy3SK1Ticz33Fsd+Po+oafULLYQnGST9MDPW2DFnUgvlKMLyjCkLkT
 frEyccu2HCgP3TdOdj4RpkRmPvLHLq/POcorqR9CML4OD95ckwLPS1T/d
 XHtpMx57YKv40G/45q7LQ3kn4CUsqAoiURjo/xonDgPj8eJOhhZ1hvYTd
 iZOnkPuB5GvYVhN36EZ7peU7nN0WUyifU/08B+iEJGxuTkpXTYI2xKUDZ
 d4gBx6c5doYtygrwcza70a5IGN8fTBEq+lukUwO79JUBgGvYuucyxFaQC w==;
X-CSE-ConnectionGUID: fCW8M+4tRZ+no4EZlM9KxQ==
X-CSE-MsgGUID: znsg/gMrRLC7utKYB2XskA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082217"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:49 -0700
X-CSE-ConnectionGUID: Hd1bqvoISTWbKCThl91AvA==
X-CSE-MsgGUID: ZLqcLEQMTNejI3+4gLSLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882688"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 4/6] drm/xe: Drop redundant parameter from xe_probe_info_early
Date: Fri,  4 Sep 2026 19:05:28 +0200
Message-ID: <20260904170531.516-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904170531.516-1-michal.wajdeczko@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
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

We can now obtain the const pointer to struct xe_device_desc directly
from the xe, no need to pass it as explicit parameter.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d19478c9439e..6ca1ec311a4b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -753,7 +753,6 @@ struct xe_probed_info {
  * Probe from the hardware the info required by xe_info_init_early().
  */
 static int xe_probe_info_early(struct xe_device *xe,
-			       const struct xe_device_desc *desc,
 			       struct xe_probed_info *probed_info)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -761,7 +760,7 @@ static int xe_probe_info_early(struct xe_device *xe,
 	probed_info->devid = pdev->device;
 	probed_info->revid = pdev->revision;
 
-	xe_step_platform_get(desc->platform, probed_info->revid, &probed_info->step);
+	xe_step_platform_get(xe->desc->platform, probed_info->revid, &probed_info->step);
 
 	return 0;
 }
@@ -1218,7 +1217,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	pci_set_master(pdev);
 
-	err = xe_probe_info_early(xe, desc, &probed_info);
+	err = xe_probe_info_early(xe, &probed_info);
 	if (err)
 		return err;
 
-- 
2.47.1

