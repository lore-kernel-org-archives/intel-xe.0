Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5761ECA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 13:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2129110E6D1;
	Tue,  2 Sep 2025 13:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4nmE4Jf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D9410E6D1
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 13:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756819077; x=1788355077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uiimQ/NKlikudAUcLZFPJ9Y6pVqyOlRPtHMV58wwJjM=;
 b=L4nmE4JfmsVMQf6m8MYijoK3vLWZoR1pnQOW/d2dxWWl14ShYzRHnGqV
 gsL5qa6VtxvaambS36+W173kPPn0tAUEOmes+wIUTbwKQymXwHSQ8YDVV
 Xvp2u/a2Cy894JEXMdB7QDzj3VXVLkrZAPVUeqIr89k8kUwjbHdOGWYtK
 TsDMrntXjiqHc2YurbP27cFHRQlx//qrqmyFu3eb9OXk3xP6q+WNx1tH7
 fpvtXmE+5bI9gjeCPt5axQzk7DcGPNkjoOSJx6S6S65S7YPS3xGQbvdJU
 ejRIpzcJbvgIkpomQCDBfQKqunX7h62kDkPCp8qsBiiwC48bR0xzDTaAA Q==;
X-CSE-ConnectionGUID: wKOAjGVSQUy9WIg7GGqSHw==
X-CSE-MsgGUID: uOOyn2f1R8CWqCXmzYoVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="76535160"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="76535160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:56 -0700
X-CSE-ConnectionGUID: VIIDNE+cTFOxCyrL1gjj8w==
X-CSE-MsgGUID: Cl/eV5a9TfeCxB5xwEhR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="175642817"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 06:17:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on fini
Date: Tue,  2 Sep 2025 15:17:42 +0200
Message-ID: <20250902131744.5076-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902131744.5076-1-michal.wajdeczko@intel.com>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
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

This is a user controlled configfs attribute, we should not
modify that outside the configfs attr.store() implementation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 53c5af4b810c..79426ea46861 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
-	xe_configfs_clear_survivability_mode(pdev);
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
-- 
2.47.1

