Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEAFC88CB6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CA010E2B9;
	Mon, 12 Jun 2023 17:14:47 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6C710E2BB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590085; x=1718126085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7gnWs6PxVBBJJgOF2tXsupCnNr/WWSNeeKvlBSerR2o=;
 b=QI35QPu8bNavRd4AEmpUwCMnZdR3q2VlhsJ+ug+CXmZ9Hh7DzAmZR0gq
 SvzZWWvG/ZDK66XZmPAvncOWcCYeQ0h2uVMUFx+2e06MNvi8Y3/eprey7
 E5HOHld1LH+Lrs8hPk4qKg/6s3xhVJQQVqdTNFL6v6+1Tn28Gy2KqD4sb
 EsXLLmvbfVCJertJREcuXOD5PiZJkWtz28WYM/SQAo695FNup65a/Pw8W
 expVWdze+dqkXcFOr6ptVqh5Rfb9OeE1CY7zR347TosF9+r1G6FR33W/G
 Vym5yB4t8+2RtWsLaYgdWHf54f84+IR4wsEMlTja0bdOAsBdZZnPFW3Fa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792772"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715216"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715216"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:19 +0100
Message-Id: <20230612171225.88689-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 06/12] drm/xe/pci: wrap probe with mem_access
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
for the device to actually be runtime suspened during probe, so this is
purely just to stop the xe_device_assert_mem_access() from incorrectly
firing. In a later patch we want to add xe_device_assert_mem_access()
for all mmio accesses.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bd1f59b49928..e1143a6c071d 100644
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
2.40.1

