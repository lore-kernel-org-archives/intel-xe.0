Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C894ACA0EC5
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CF810E971;
	Fri,  8 Aug 2025 17:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKzce0z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAAC10E1EB
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674210; x=1786210210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+jUmQwUYg4lqXvJih90pvRxFb3IACTXSnO8LPQDPbF4=;
 b=YKzce0z+iZeOqmMMAGDgaFYKcyFOWJaNMBqC6dO67QnTPASWHAnSasXO
 YRf+RUXJjXHvTnhOgme7Z0+1r4JEcoo7ma7k+n9Hs7siM713QQeNsgBSB
 EhO/YZZDxEFw6EoBxAeHnlxdb54AVNOiYXMEJXyUoys/ZZB18Obiar0jg
 xeFBeQXJPEV7Ehb2tD5JezbnYhRnDzz2+bXxz+0/d32zdsqJ7csJBFeby
 qIAC1wVtgTMoUTTMtiClLj+dxqGV/SV9kSK5my+tk/vYcfwie9DxZk1NM
 gTorfp8FEn8hiEUbdKKOOggV6IOtEslS1wd4pgby3MHetxq9maJp+zZ2E A==;
X-CSE-ConnectionGUID: sfx7vYXuTuq9rQcCvxR5yA==
X-CSE-MsgGUID: 9BienwBLTPmuFmBxlRvRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109821"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208,223";a="68109821"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: PnkQsRgOTzqwbxvvewG7sg==
X-CSE-MsgGUID: W7YcVJPCSlSheSE+Ji7KXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
 d="scan'208,223";a="165387413"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 06/13] drm/xe/configfs: Simplify kernel doc
Date: Fri,  8 Aug 2025 10:29:49 -0700
Message-ID: <20250808-psmi-v3-6-a111e9f1e4b7@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
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
 drivers/gpu/drm/xe/xe_configfs.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 853da2ee837ac..17b1d6ae1ff6a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -389,10 +389,7 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
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
@@ -409,11 +406,8 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
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
@@ -433,10 +427,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
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

