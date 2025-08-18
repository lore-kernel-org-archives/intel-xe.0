Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5071FCA0EF3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0110E4BD;
	Mon, 18 Aug 2025 17:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlYgR71e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F9E10E4B6
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538705; x=1787074705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3o55osKvjWNEWlUW2RHljCt2EJyBL4q9wvuBuzgxPu8=;
 b=ZlYgR71ek/SHM2ODbzZmgBNZneB2+HOIiuPUFvPlcKxwQ+KH8hAHw2iw
 1BjeWJqOfHvZekkOTd2PCSrPpLcWU3hC0z76QYu6J9SiXKrq27KC5ZJJy
 ANDhnW4hAZKlCiVGcLftcYDd1AWIsZpO6Mj20fxz+cPkhfETdFwno4f4e
 Y9w9AAXDG1TmftOHuoM2g3eAZOL1ExZoY2dDnaAS30XCDVxYlEWPNyDha
 M17HePWVdIrY7lpKvhCk47vK1qGDYDp8tL0jIUJNib09QgLGzd8IWvB8i
 AuiRq+Y8Zy+arkcKcrZzNNfu6v85UHHIBzLTlMda90hG119M5uoNJGBMA A==;
X-CSE-ConnectionGUID: CvM6sYyLSXmjtdxEWshQ3g==
X-CSE-MsgGUID: p3vCN8EJSF2En1KY3/v/oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57918656"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57918656"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
X-CSE-ConnectionGUID: ikqjgmNOT7+TRB/yHCp3XQ==
X-CSE-MsgGUID: Q2ZSwL21RgmaKw+GbPADlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172838887"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:38:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v4 10/13] drm/xe/configfs: Use tree-like output in
 documentation
Date: Mon, 18 Aug 2025 10:37:35 -0700
Message-ID: <20250818-psmi-v4-10-a330783ce1c0@intel.com>
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

When documenting the directories, use an output similar to the `tree`
command and add VFs and missing attributes.

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 5babe8cc21b36..1dea3715c2369 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -39,8 +39,16 @@
  * used to configure it::
  *
  *	/sys/kernel/config/xe/
- *		.. 0000:03:00.0/
- *			... survivability_mode
+ *	├── 0000:00:02.0
+ *	│   └── ...
+ *	├── 0000:00:02.1
+ *	│   └── ...
+ *	:
+ *	└── 0000:03:00.0
+ *	    ├── survivability_mode
+ *	    ├── engines_allowed
+ *	    └── enable_psmi
+ *
  *
  * Configure Attributes
  * ====================

-- 
2.50.1

