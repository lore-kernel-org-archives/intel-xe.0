Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ED6E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 14:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885D810E8F7;
	Tue, 10 Dec 2024 14:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YV9yWFlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9436B10E8F8
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733841484; x=1765377484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RDl3Bqs0458+mPZ8AWEmqB7d5Io0qBPnsI3GL/6LuSE=;
 b=YV9yWFlhj4KSs9gn0jT65uRFHWg7JwYxzRk4h2x2kNEPxHevJdzRVQMg
 U5bjWDNhubJt/znaqNpn0D7aLqOy+dET5/FLp8dHEBGrBYUNbyj2LWIcC
 Uvm6LOuH1PbViP28QH9doOldcp4M0lnBkOBOz95w/xuqbA6AlrBrzCG9w
 arEhWvXJYVxGjs17a0NMbkKO2iY7hnbgU6jsbXq2C9arA5qqITq6sDGHH
 bkcQKIrMBUOpEVnqAVUKsDbI4u3IDTKNSnCOkTnoDsOu3PaaznwXbS6Bj
 Fnse+cgUZa4CHFznUMi31G6uhHzAVP1hxJpDBZ8FScIV/YUpkpB9iEA5q w==;
X-CSE-ConnectionGUID: PkNS4GtNSOqJEH2nrMegvw==
X-CSE-MsgGUID: 16l4KrAdRa2LIzbGKX1KdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38114265"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="38114265"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:38:04 -0800
X-CSE-ConnectionGUID: E7SVq49LRUGgNK2ng5H6Bw==
X-CSE-MsgGUID: 0h2ic1c7R6yp03m+tAFylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="96240160"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 06:38:02 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com, lucas.demarchi@intel.com,
 raag.jadav@intel.com, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v2 2/2] drm/xe: make change ccs_mode a synchronous action
Date: Tue, 10 Dec 2024 15:37:48 +0100
Message-ID: <20241210143748.1417098-3-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
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

If ccs_mode is being modified via
   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
the asynchronous reset is triggered and the write returns immediately.

With that some test receive false information about number of CCS engines
or even fail if they proceed without delay after changing the ccs_mode.

Changing the ccs_mode change from async to sync to prevent failures in
tests.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index b6adfb9f2030..50fffc9ebf62 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
 		xe_gt_record_user_engines(gt);
-		xe_gt_reset_async(gt);
+		xe_gt_reset(gt);
 	}
 
 	mutex_unlock(&xe->drm.filelist_mutex);
-- 
2.43.0

