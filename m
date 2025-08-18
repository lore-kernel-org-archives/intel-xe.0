Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ABCCA0EE9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D8110E4B8;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JH0SIV/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6F210E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538704; x=1787074704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bzCmM34C3wuOg179NO29BWJ2WRHSFVmSiJt1hJcfKc=;
 b=JH0SIV/fU4b980YEVfCFgznAyqfmN3jSC39yPkXA0oDdEQwb5uj/6ZWQ
 wMI9H5f7+klnbHDIMCK/Z22vBuE5PIQI0vhvD3iXn/rHZ+YiaHXr9hA0Z
 9ef0yqNev0PKjDCA90iT9qjgqWvXi0IMccWHgAHNCKhB+S9BAxWZDo0Nk
 xek5S2J2lepKFqVqYzEXpFojRPGbQQuIRUo2QOkm0GBoSVq0gwxHJHrXw
 q5I7V8z5njH6zMOE6HwCWFSUo2gdgJ4vCeefvlz4BSImsFegu+fa2apLK
 NtIVn1e12gNDbDroVw8JYXEUXTsSF8Pcyb+c4SAdC8DbuJQpFf9hKPELG g==;
X-CSE-ConnectionGUID: GqXiFNT3QcW3qr0FIDGr4g==
X-CSE-MsgGUID: 5ExsS/u/QtqeCXHBcWWnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918652"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208,223";a="57918652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
X-CSE-ConnectionGUID: +LcNvdXERQKeRUryv5J2mA==
X-CSE-MsgGUID: 1bPY3lejT9mL1xSXOz+pUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
 d="scan'208,223";a="172838875"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 06/13] drm/xe/configfs: Simplify kernel doc
Date: Mon, 18 Aug 2025 10:37:31 -0700
Message-ID: <20250818-psmi-v4-6-a330783ce1c0@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Reviewed-by: Riana Tauro <riana.tauro@intel.com>
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

