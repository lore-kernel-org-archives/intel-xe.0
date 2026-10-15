Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E0CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 23:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B810E0E6;
	Thu, 15 Oct 2026 23:33:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AEA10E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 23:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792107224; x=1823643224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+TUizCne03odHERnNX2QxpU5CqSvsq9nAUdZNEY6/U=;
 b=ki6OO+90Onfo3ZMrCICIpoJvey/ghbD6ZVNjlNAiYty/kCle0sQSByjF
 zwu9fHO6PpQPsULRDpt/XTJporPJHyVFKTpYqUBKisSJhuk7FYL4tYzhO
 9sRTX6edey8N9EBB0t1Bol1qv5OGrlKwJPCHypKHFPVoyX8omf0z3hMjE
 PYtyD+zC9ZOFT/bFFXMSPpsvUj6rwtor1JkRiP0EFqBmjSpOiSJPRxPyw
 8lck/24P/kkRBTIIdlOt4tmoLnYGZ+QnY9M5sj0PAzk7ORAKzpF2DCcVG
 hXQTXXvW6MIPS1fFhTO4a4WcNb2bITPzJ9Haujn2D6M+3yHxzbnZq+SY3 Q==;
X-CSE-ConnectionGUID: k0p/l5oUTVSpt6IvqYFo2A==
X-CSE-MsgGUID: 9uRuzCeTREqzpL/c+Qsn7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="891344"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="891344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 16:33:43 -0700
X-CSE-ConnectionGUID: 5irU+0zZRLmHpSo4yjZ2xg==
X-CSE-MsgGUID: a6ZK/LxvSQOZxXAMP3VVrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1814584"
Received: from vbelgaum-desk1.fm.intel.com ([10.121.64.203])
 by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 16:33:43 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
Date: Thu, 15 Oct 2026 09:54:53 -0700
Message-ID: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
References: <20261015165451.154495-5-vinay.belgaumkar@intel.com>
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

We enable this flag during runtime suspend, need to set it back to
false early during resume to prevent any race with pci driver.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 57c6f778ca24..2269e51868c1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1450,6 +1450,9 @@ static int xe_pci_runtime_resume(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	if (xe->d3cold.allowed)
+		d3cold_toggle(pdev, D3COLD_DISABLE);
+
 	err = pci_set_power_state(pdev, PCI_D0);
 	if (err)
 		return err;
-- 
2.53.0

