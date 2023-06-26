Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D78DEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AB510E1E9;
	Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C3F10E1E7
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776673; x=1719312673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lqfz7C1TOJQ1htJ92uvDDalA/XiNozRW3OfIRQ6kH0M=;
 b=YKBvYKQMe1wjhC6ny3goTF6d5f7PwUyQLzNQZa7Y5qvILrfUb4BDvMNN
 /RLdZkFXoOVso2ukmBT4igyTXcFNTcf8gQNosrRSLeMK7LANiC6p9FbiD
 wsIAYlHMelQUImMzhgThZ47LQZ2BBgqEyHt5VxDMRDgoK+0monFRdc1Hr
 of3m1uL8e9mMrIEVSapPitEueRQigzU2XVkkc3N5jINS5h6n1ng4+AU0W
 0EzSgkmgnmv0qgF+sTLI237dBeyLNciZVmMO12/t0HXGypaq85OvhVOt4
 BbaR90mYwRip1IlFnMjKebLfktfTZkYIOTkRWl3FxKTyrUuzrqpN4i4Sw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279989"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182803"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182803"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:45 +0100
Message-ID: <20230626105037.43780-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 07/13] drm/xe/pci: wrap probe with mem_access
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Various display init stuff is missing mem_access.ref, so just wrap the
entire probe sequence with xe_device_mem_access_get(). It's impossible
for the device to actually be runtime suspended during probe, so this is
purely just to stop the xe_device_assert_mem_access() from incorrectly
firing. In a later patch we want to add xe_device_assert_mem_access()
for all mmio accesses.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2991cf5365d5..91ccdaa1193d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -680,7 +680,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (pci_enable_msi(pdev) < 0)
 		drm_dbg(&xe->drm, "can't enable MSI");
 
+	xe_device_mem_access_get(xe);
 	err = xe_device_probe(xe);
+	xe_device_mem_access_put(xe);
 	if (err)
 		goto err_pci_disable;
 
-- 
2.41.0

