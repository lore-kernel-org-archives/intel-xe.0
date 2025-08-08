Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E3C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5740D10E974;
	Fri,  8 Aug 2025 17:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dvp6+cMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3175510E969
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754674211; x=1786210211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1SEYkpWwVVNtuC3puW4TmcPbniS3aj+LTQOibMkYBK0=;
 b=Dvp6+cMG2JN19dYjxDUdAsvDZQOsEstgFRzaJEAK4xa3TFfXkHmWea1P
 EIDgvk30fp6Z2RwyRxwVFEZBVbDBgkC2u1coULvYMyfnsCJ/nlZvKroBC
 4pQLhQXQTnyqypisuWjmrRV5nWfeuUgL/R+1bfPmGDQxS9CBzuhtYXaFX
 6aQ6NNq9DUuPGYQDdnfc5sW+bV+I414J3c6fBfXYIV/WKWtCfm2KaRFKW
 uh8bUSXgitrkzKdDdtfX5k9Gv444kDPd+McEkSPHWWyFE8fdwYdkK7tiS
 tBdIiUPvOYCVe6SwbXcENDDY4Q0cL77UaCxSkm39Sfgw5FmxZUF8ZrFU4 g==;
X-CSE-ConnectionGUID: CETR7n3MSaiN9Tj+6NwhRA==
X-CSE-MsgGUID: 58l6KU+ERvyUyi8TCus5rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68109826"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68109826"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:09 -0700
X-CSE-ConnectionGUID: kTbYNg2eR7CNNvbY/+HoSw==
X-CSE-MsgGUID: KfVDwJB6SIqBenhrtKHrmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165387425"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:30:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v3 10/13] drm/xe/configfs: Use tree-like output in
 documentation
Date: Fri,  8 Aug 2025 10:29:53 -0700
Message-ID: <20250808-psmi-v3-10-a111e9f1e4b7@intel.com>
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

When documenting the directories, use an output similar to the `tree`
command and add VFs and missing attributes.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 489c5c67001dc..7c92d293ba733 100644
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

