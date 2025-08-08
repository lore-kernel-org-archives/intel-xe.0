Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819B4CA0EC0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F36810E97F;
	Fri,  8 Aug 2025 17:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYrewj9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCBD10E969
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Arvwbvekf4f/5JHEzAdyy2V1J3r8KGZlSsqHe5f+Cc=;
 b=XYrewj9vNFrTKfr+GSqN53jZNGsjHJlA3Ii5N1ATKq8pl+OfZLfHVQgU
 J3hxd40GGVJE2sifHd9/yRG1sKk9F6ddZF9gWLvnS9X7n30KzJz1dcCQW
 llHbt4tjaU9kJi2RdPCC6iUX8fKSeHWe9yOnXvlJO2mXNocAMm1LM3nH2
 H08xNK2xubkbDBXAfc5XfBsKjrLDB+L+widGa52skgbWHpuHDtmqzuvOZ
 V5cx22sv7biEZc17ssva6DFbIXnf9x0HNNLuVqccj4XTeiwPWY5Qw6D9C
 vsYw3WeswfS7mHeIf1YqHe7XzQN/2aeJcGW6SE+/9KNOf8EMetT0Ejgn6 A==;
X-CSE-ConnectionGUID: lJ0iV/oYT0mXtjOmolfFMw==
X-CSE-MsgGUID: AHkVv+qsSIOigFEbs3hRCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109828"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: qFiMNbKuRZqBGhSpkcFDlg==
X-CSE-MsgGUID: avskqdqrSpCnbqWotKp2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387431"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 12/13] drm/xe/configfs: Minor fixes to documentation
Date: Fri,  8 Aug 2025 10:29:55 -0700
Message-ID: <20250808-psmi-v3-12-a111e9f1e4b7@intel.com>
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

Add a few missing punctuation and line breaks and make the syntax for
code snippets common to all of them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 58196b7571239..3b9d24c0bb588 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -24,9 +24,10 @@
  * =========
  *
  * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
- * configfs subsystem called ``'xe'`` that creates a directory in the mounted configfs directory
- * The user can create devices under this directory and configure them as necessary
- * See Documentation/filesystems/configfs.rst for more information about how configfs works.
+ * configfs subsystem called ``xe`` that creates a directory in the mounted
+ * configfs directory. The user can create devices under this directory and
+ * configure them as necessary. See Documentation/filesystems/configfs.rst for
+ * more information about how configfs works.
  *
  * Create devices
  * ==============
@@ -119,7 +120,7 @@
  *
  * The created device directories can be removed using ``rmdir``::
  *
- *	rmdir /sys/kernel/config/xe/0000:03:00.0/
+ *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
 struct xe_config_group_device {

-- 
2.50.1

