Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03406C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 09:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF0310E4CD;
	Tue,  5 Dec 2023 09:57:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948410E4CD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701770250; x=1733306250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m2K25dYVhG7duW8XOpAGsP9ItXt4UBV5cMmWaWyRukc=;
 b=Y7rjBf3+kWZ5f+Nj2f3MkPuhYvCKCY3hE8wWaPdeVOvPu+ndv1sfyRxI
 tWD0kv6S0zhmd5InTimhZmgA7xCR6YMVHr7vvBwbUnT/IgO6HEqPrPHTg
 N1kq1QdT5OBhxMCx3bgbKfggO6Gh6Czkqje9eqa/M4HG4sOt6d7es9AeB
 mkeTm0TEQ3oRzUtV0/b5MoI5jPJjwuDxArMfTQxCZMdRycKNJENuc1kGa
 i57O2bCn6cCJOHKrnJZDn6du6hOxq57byuYU/DQFJ42sytLG0NweZ35zy
 0fAJa3L5qEJ+KDzv+OdXrlI8i24NFl2aNVFu2DJx2UoF5gl7fi/hVDAXS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="924059"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="924059"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770854884"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="770854884"
Received: from jderonzi-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.46.200])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:57:28 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 09:57:15 +0000
Message-Id: <20231205095715.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: Francois Dugast <francois.dugast@intel.com>, michal.winiarski@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 9abae65c6b23..f25c920ed8af 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -760,7 +760,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (!fw)
 		return 0;
 
-	err = uc_fw_copy(uc_fw, fw->data, fw->size,
+	err = uc_fw_copy(uc_fw, fw->data, ALIGN(fw->size, PAGE_SIZE),
 			 XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
 
 	uc_fw_release(fw);
-- 
2.34.1

