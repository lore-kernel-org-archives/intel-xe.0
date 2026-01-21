Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD2FC44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 17:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773E410E850;
	Wed, 21 Jan 2026 17:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1IdooNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C562710E1FC
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769017247; x=1800553247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=23evekRqA/og2nWivNNoLrdsNhnvzctxCs+24iaWI1I=;
 b=D1IdooNXpoeJSCOc0W6br++lmCDjQ9fBBjPT70/smXyiDBzV53FqVh/j
 tDdcWiBkyfchBAVuCjFOj2dSbg9JCr9Eym6LbhGoOsFGKdGQGWa8atR7w
 77ypp89PkQncudQC9FYBO4PnADXgMbNQFee009Y9U3J6WACyrMenqctPG
 vWg3xaUA5l3UX98T/M30Jkim1+ieTz+EOgvDNCrIVw9KqQ9HDgtVOxIKs
 rz6P/nbvBL8E5yQSAa53UmKZ+GpcXBuZjyL9SwF6R26KiH9x5aKY9vzBQ
 OTXuFt7Hq1fWcD80mtKEscajZcH1EqVKyyUyWBi21SZCC8fahiNyOJZtQ Q==;
X-CSE-ConnectionGUID: TMgJVAOJTdGCi+4Qrc9XUg==
X-CSE-MsgGUID: ICBQfkbcSDqA6qvv5i/g9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69267171"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="69267171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 09:40:46 -0800
X-CSE-ConnectionGUID: aJxorCM6T1uzSP698g2ibA==
X-CSE-MsgGUID: HZYKegQ7QeaQg273QcZ3Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="244084390"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa001.jf.intel.com with ESMTP; 21 Jan 2026 09:40:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/configfs: Fix is_bound() pci_dev lifetime
Date: Wed, 21 Jan 2026 17:37:51 +0000
Message-ID: <20260121173750.3090907-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Move pci_dev_put() after pci_dbg() to avoid using pdev after dropping its
reference.

Fixes: 2674f1ef29f46 ("drm/xe/configfs: Block runtime attribute changes")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 9f6251b1008b..82edd0466005 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -347,11 +347,10 @@ static bool is_bound(struct xe_config_group_device *dev)
 		return false;
 
 	ret = pci_get_drvdata(pdev);
-	pci_dev_put(pdev);
-
 	if (ret)
 		pci_dbg(pdev, "Already bound to driver\n");
 
+	pci_dev_put(pdev);
 	return ret;
 }
 
-- 
2.50.1

