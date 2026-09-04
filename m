Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A6BC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 17:05:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D305710FA98;
	Fri,  4 Sep 2026 17:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enq3BYJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B3E10FA91
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788541547; x=1820077547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZt12TZui/jygueU4ZCxENShJDmX/9HI395siX/OXMM=;
 b=enq3BYJMkwHwrFOE1dEC6fTSn02EjtVLHK5oJOqKQWEu3RnsloWUNdZB
 0jp3GoFypiaCrKM5l2g/Kz+Y31VZDhmItJ/ppj99odOdgC2uUhT7o2ZIo
 qSkFq0rJkXS+gfTsnaMkQz4BjqrUEbShySiyXbTFk3ua+nTn4x7EEL8t7
 ke7mBv+yKxkaUx5rCVjdidATcFpux4d46fzq+o8rMBkB7+zDIJ3lh48/J
 t8Drjz6QmOu4sbm1lfwrma6CNDddwHosxFsdFyRIs1QXgq3VE0iZxYnUf
 OzooAIfxWXcV1MNqr6WXm9EmEJFRFMka9vRRtw0V+hoezGCxbOPRyux6O A==;
X-CSE-ConnectionGUID: 3DYGTCILRuGVQPWPK9CG7g==
X-CSE-MsgGUID: 33oHlMrlTHaTK7Es5KpQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89082210"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89082210"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:47 -0700
X-CSE-ConnectionGUID: axzgrTZvRPae87wP2savqQ==
X-CSE-MsgGUID: zpk/5eL+SrS61zYOi0iFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273882678"
Received: from johndonn-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 10:05:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 3/6] drm/xe: Drop redundant parameters from xe_info_init_early
Date: Fri,  4 Sep 2026 19:05:27 +0200
Message-ID: <20260904170531.516-4-michal.wajdeczko@intel.com>
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

We can now obtain the const pointers to struct xe_device_desc and
xe_subplatform_desc directly from the xe, no need to pass them as
explicit parameters.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 drivers/gpu/drm/xe/xe_pci.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 48d5ee478fe6..c817692c0ce3 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -383,7 +383,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
+	xe_info_init_early(xe, &probed_info);
 	xe_info_init(xe, &probed_info);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 191e69fb0e3d..d19478c9439e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -771,10 +771,10 @@ static int xe_probe_info_early(struct xe_device *xe,
  * passed to the driver at probe time from PCI ID table.
  */
 static int xe_info_init_early(struct xe_device *xe,
-			      const struct xe_device_desc *desc,
-			      const struct xe_subplatform_desc *subplatform_desc,
 			      struct xe_probed_info *probed_info)
 {
+	const struct xe_subplatform_desc *subplatform_desc = xe->subplatform_desc;
+	const struct xe_device_desc *desc = xe->desc;
 	int err;
 
 	xe->info.devid = probed_info->devid;
@@ -1222,7 +1222,7 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 	if (err)
 		return err;
 
-	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
+	err = xe_info_init_early(xe, &probed_info);
 	if (err)
 		return err;
 
-- 
2.47.1

