Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73676CA0EED
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5110E4C1;
	Mon, 18 Aug 2025 17:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOd0XDXi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CDF10E4B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538705; x=1787074705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xCpZSFW0p/Ln8DQBB/ePTtasTpDQA7pOEarGVFwhRCg=;
 b=EOd0XDXiwEU38ZX1BTj5LYKsF5FBYXpGd15yqDXwgXdXyIJGaU5/RDzl
 jCfW1gGEK3ZfZ6Gj2cO9/rvaf3434WbulU9WF1wv94QTOq+nQI+byJby3
 K3m9dkRCKKUcpMv2lNmXv+1ZEU1GjIV6+EzCkdUv2mq09Gg+kh7qQ3azs
 g3ENL8IjOUlX70ZuxqX9I9wQwX2gxiJYfab0uYBov+L5srzRh+7C4Jv6P
 GwYQPCS57+V09+m6YV+zVEovlLk1TJAULmaaUlTJsaKFOHteQL5rqCDJg
 LHNPTkvm0x76CaWuuYbOzn+A5vXthe+McG8wzU3vSXN7R1D8hMTc0PAAG Q==;
X-CSE-ConnectionGUID: vjauq2PcRW2EEBbtJ5Rzjg==
X-CSE-MsgGUID: glHi+T94SKqnZcbjiN7DfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918658"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
X-CSE-ConnectionGUID: Z2n6/8nLSKyzTDjUZXiJPA==
X-CSE-MsgGUID: dmYyxc5ETPW2MhkhGFRJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838893"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v4 12/13] drm/xe/configfs: Minor fixes to documentation
Date: Mon, 18 Aug 2025 10:37:37 -0700
Message-ID: <20250818-psmi-v4-12-a330783ce1c0@intel.com>
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

Add a few missing punctuation and line breaks and make the syntax for
code snippets common to all of them.

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 5888114647510..f4bc0e66b6c50 100644
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

