Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EBFC77B76
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 09:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B2B10E6D2;
	Tue, 25 Apr 2023 09:10:52 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE1F10E6D2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682413850; x=1713949850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5/KYkUdfD9JAWCdNmRuJY3P5GK3Wti1/E2+XzsXuSc=;
 b=nskXNe2yaBfaqPiJVlONks+LTaRsRMe3+e9JWCLX2h1s1ghLBDTuGbes
 UOGKqog6QQw6uMKEdL32r9NFw1Ey226oAMl6KFYdPcOrqtxXEpkTvdkZN
 nji02BGkVJ/m7VJ5yQWfiUWrhiycrN8hxXtl+erc0OVCJFApXjG4tsV8x
 bgTvfA3cdxitZ9OBPQ9aOOlQUO9e3B3bErl6OBxo0kUJji67bmligdhsN
 CqqwL+gTqtOPVzKxEKg4t7EJk+sffPQg2dkuIDmmgUcYOUiAXjqIw1S7D
 gMdleZGkQHdvsefMZAQuvDQSvmULBoNvKtzkXChKI25Y/AuLJc2X5/4O5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="327014125"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="327014125"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="817598084"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="817598084"
Received: from kav-xto-001.ka.intel.com ([10.62.231.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:10:48 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 11:10:26 +0200
Message-Id: <20230425091026.3499175-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix build without CONFIG_PM_SLEEP
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

Build without CONFIG_PM_SLEEP (such as for riscv) was failing due
to unused xe_pci_runtime_* functions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e512e8b69831..14be0259a222 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -710,7 +710,6 @@ static int xe_pci_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static int xe_pci_runtime_suspend(struct device *dev)
 {
@@ -768,6 +767,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 
 	return 0;
 }
+#endif
 
 static const struct dev_pm_ops xe_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
-- 
2.25.1

