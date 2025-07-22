Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79857C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4313C10E6A4;
	Tue, 22 Jul 2025 14:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncxBGanO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF0610E6BE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193497; x=1784729497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z88CMfojatSEvQ9RLmuzKcYSEJt6o6u2vbP+05H4VPM=;
 b=ncxBGanORDbltPOTh5xXiD9XKcUDjOrbGyfb2tCyV34Cg4BKFZk75Nhj
 qzl6T/2MMrIFaxdtk9YaxYMA3TLZoyIlFuUGN7hr9HwIKLrWz2IIMtVt+
 majfEJI4toREKcemzaQBP0+0zwJJDGtzZJoP5OVOQyJ71Ikunzz35/CvQ
 FEiFCroqQnsxB6w1B9zArR0RXyGEHhhqL93yl/MdtRT3TXWaAYn58qv/w
 nQm3OPALYJLeRTl5N76O4QhEJeoX6lZJWmRk0IRMIE3nA8FgqatWw2RZQ
 OkT1Lm5sxEey9lDqIyJHARgktEEv/gpmPrrW4cRP9x+IqLWWmCPXcSOxz g==;
X-CSE-ConnectionGUID: CTDCFHg/T+uxc82hTr4Y1A==
X-CSE-MsgGUID: HzWGz1D1QFSJIWFzmvnvWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663032"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663032"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:37 -0700
X-CSE-ConnectionGUID: 8voQE8fETmirKJvB8PidMA==
X-CSE-MsgGUID: gi1ujNszQ+upKKYnpwAk+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396273"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3 3/6] drm/xe/configfs: Use pci_name() for lookup
Date: Tue, 22 Jul 2025 16:10:56 +0200
Message-ID: <20250722141059.30707-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722141059.30707-1-michal.wajdeczko@intel.com>
References: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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

There is no need to manually build PCI device name from BDF data,
since it was already prepared and assigned and can be accessed by
calling pci_name() function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f5ce48a0adc8..36e2b45b305f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -312,13 +312,9 @@ static struct configfs_subsystem xe_configfs = {
 static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 {
 	struct config_item *item;
-	char name[64];
-
-	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
-		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 
 	mutex_lock(&xe_configfs.su_mutex);
-	item = config_group_find_item(&xe_configfs.su_group, name);
+	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
 	mutex_unlock(&xe_configfs.su_mutex);
 
 	if (!item)
-- 
2.47.1

