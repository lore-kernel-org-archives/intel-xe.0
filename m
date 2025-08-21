Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC423CA0FE1
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996A210E393;
	Thu, 21 Aug 2025 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Egu+zv3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4396910E38E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793116; x=1787329116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bzCmM34C3wuOg179NO29BWJ2WRHSFVmSiJt1hJcfKc=;
 b=Egu+zv3b8z+chGLu/a8JoedthjVA7lGfffepUePYlc0RrJVvccPKTbcs
 Bfsmw8VnGdWvJwGz6kioE7ZpQo0gQoLk8hSO69XzUFd7Gvlo5TYYcvijw
 wgJopdxQ1oFHtVxJkCetSF2fClIfvK1hm688Qz3z2gqgUc7Ut/CY3WDi5
 sKUQ1Tt9nOGfxGB07CNEAylXFzJThBGOE12tJ3kYMJt5a0zjtgZeu2ur/
 gWAe2KftavUq3rRU5kqET7cNNk9w6xoLMzItdfw77cRGqOUOOcY3xoin6
 56V0QCPU875EHKE5iXZz/GwsFjtfzBfSuRkBrG+VLDdtpq7nc/FlHDhpF w==;
X-CSE-ConnectionGUID: t6EuFWKmRbaWhngPGCYJpQ==
X-CSE-MsgGUID: qJKm8jAPTFi0hevOnzhKxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527889"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208,223";a="69527889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
X-CSE-ConnectionGUID: +p6K0iz/R6iBkEjyey/C6A==
X-CSE-MsgGUID: 5TCciqZmTF+2fY5x/20rOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
 d="scan'208,223";a="199326718"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v5 06/12] drm/xe/configfs: Simplify kernel doc
Date: Thu, 21 Aug 2025 09:18:01 -0700
Message-ID: <20250821-psmi-v5-6-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
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

