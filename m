Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F985C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2710E1AB;
	Thu, 24 Jul 2025 01:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLBz6vux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF3D10E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 01:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753319084; x=1784855084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKpyPvnrlAsGuHjv2mPr+m5GuQO6eO2+WjrdmuZp9Z0=;
 b=HLBz6vuxxnLpGfR7ysMtJfAFjcdpfKVZyOmmOlS6KkgJoKQ3fc47tZOC
 v/bvYbubOo6sPkEy4gSLeACSmGAsqg9w60fxKHKxM3FjeLGXEuWQFyz0i
 ZoHfE6UPfsHkNAA1R6mQv1KNy2QrdaZTZ62N4HX6jC7WSIRdXADT6ZtXL
 hBM9Gh+ecjQU1PG+gERuwYN64a+HRctLnfDkqXLZHqMXRNU4dW3xBpXLI
 1K/NujcDfTz3OxkJHvxvHwut9ENS7PyHBSISSDjfCRV1P2A6y7dsRIPj4
 YsqlvCU4yaahlDFpnJ+eixs441ybxKqGiknyf8L+cNrrLAuI0tcieG1dI w==;
X-CSE-ConnectionGUID: 24pFFKzMTSigLILpMsopbg==
X-CSE-MsgGUID: rYWUJFLvQ8m6AEfh+eNQ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55766486"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208,223";a="55766486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
X-CSE-ConnectionGUID: k/wiTGOyQhSIgROfjib0ZQ==
X-CSE-MsgGUID: 0K/xtZatSjOZc2A/4yyDPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
 d="scan'208,223";a="160106425"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 18:04:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com
Subject: [PATCH v2 6/7] drm/xe/configfs: Simplify kernel doc
Date: Wed, 23 Jul 2025 18:04:27 -0700
Message-ID: <20250723-psmi-v2-6-84a04b5a3c04@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

From the caller perspective reading the documentation, there's no need
to be so specific about everything the function is doing/checking. Just
document the functionality a caller cares about.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8ec1ff1e4e808..e5bdfcf6185ff 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -320,13 +320,10 @@ static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
 }
 
 /**
- * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * xe_configfs_get_survivability_mode - get configfs survivability mode
  * @pdev: pci device
  *
- * find the configfs group that belongs to the pci device and return
- * the survivability mode attribute
- *
- * Return: survivability mode if config group is found, false otherwise
+ * Return: survivability_mode attribute in configfs
  */
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 {
@@ -343,11 +340,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
 }
 
 /**
- * xe_configfs_clear_survivability_mode - clear configfs survivability mode attribute
+ * xe_configfs_clear_survivability_mode - clear configfs survivability mode
  * @pdev: pci device
- *
- * find the configfs group that belongs to the pci device and clear survivability
- * mode attribute
  */
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 {
@@ -367,10 +361,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
  * @pdev: pci device
  *
- * Find the configfs group that belongs to the pci device and return
- * the mask of engines allowed to be used.
- *
- * Return: engine mask with allowed engines
+ * Return: engine mask with allowed engines set in configfs
  */
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 {

-- 
2.50.1

