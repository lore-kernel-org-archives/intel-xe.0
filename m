Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE354C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9910F0D7;
	Wed, 12 Aug 2026 19:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7xblIoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319E110F107
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562134; x=1818098134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B7IUjTmNQaxgCZJZj6OPvPdaQ1dEgkYrfOJqZGtl8vM=;
 b=W7xblIoB1AZdzRCxl+rm+6PXdiecyUZ1VQLhcpKkeYzkVVCkXx++aw9x
 hph6+6MB1pa38uMhkPEmx7PdCfEZ6TCC0jnTjCEG/jG4JWqpCWVzHbM8I
 wZQlaf708wfzjABIXab0OVvheSEnjNQmlmxu6wvnAKUHIlqw3aemU1p2J
 IMjYKy0dMTjA3T9UH7wxFeoKzlPG9WBxNhe3VqBflkZgu8bAkwWY7OAUR
 mx92jPKHAxMP9LatIDX0W1SION9k+1VxH1RSZCnRuq02omm0Eb6Sn1dD3
 Dlvl4hn6+teoqFZsA88WFJLXkNFpa6qAJesDyg+V8GCPwPNVkk20R1cHF Q==;
X-CSE-ConnectionGUID: wZo59uwzSEeYIPnqvuXgng==
X-CSE-MsgGUID: kJQ7uxu4Q3uRdq9Ori3zcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987557"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:34 -0700
X-CSE-ConnectionGUID: rg3aPjMfQlyVL/KJZESzOA==
X-CSE-MsgGUID: G5kDNWj7SW+7tUVsnn28Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892009"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 18/32] drm/xe: Report 'probe blocked' error using SIGID
Date: Wed, 12 Aug 2026 21:14:34 +0200
Message-ID: <20260812191450.11690-19-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'driver loading blocked' error using xe_log_info() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: use info severity (Aravind)
v3: drop "Probe " prefix (Mallesh)
    drop redundant vendor code, update message (Michal)
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 36d62927b969..b19efef1c5cd 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -25,6 +25,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pci_error.h"
@@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	if (id_blocked(pdev->device)) {
-		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
-			 pdev->vendor, pdev->device);
+		xe_log_info(pdev, PROBE, "driver loading blocked for device '%04x'\n",
+			    pdev->device);
 		return -ENODEV;
 	}
 
-- 
2.47.1

