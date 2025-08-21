Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD5ACA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A51010E38A;
	Thu, 21 Aug 2025 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldqxnqWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D199210E38F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793117; x=1787329117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+/uq3+n/pNt03wUuLZLkm3s/PzUo2LqN9LFNPsSJgQ=;
 b=ldqxnqWHoao88vaVyxbwv2nkykrdyS97lhTldYGvdubvdHFmglAtfSZ8
 eVQtKGttlI4Pqxu3X+/Ogj6VB4O6HK06vjWfQlM7LChaPsWoPqY3pBCs+
 CG39J8ux7qHXhcBtFuxK3ktv52l9dx0ZkuOwRKTaDQmksRHrfF3qLkWKb
 PHdFtkYIPuambiFu11xP7h6Q60GIflvr+5celWusu2oJ2eB2Ymnsl19Lq
 4dyVVgyDCjPjK7XIYtafryr1ShkTbVRudJWkhia51A7ILgEPhSG57TGWD
 MdbFNJsSqMxyTz1XkA/oYE7Lyjupp0rdGxZ/0ZYnDGm9ZhyVcE6Or8nvR g==;
X-CSE-ConnectionGUID: o+xm9hJbSquPdR+vKOVu+g==
X-CSE-MsgGUID: 5OEPbc91SIegym/pFo7DEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527895"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527895"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
X-CSE-ConnectionGUID: b+RjynE6QaCrr7XmMK63+A==
X-CSE-MsgGUID: 6Q8ZZVwuQ5i0l8U8EG3yXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v5 09/12] drm/xe/configfs: Use tree-like output in
 documentation
Date: Thu, 21 Aug 2025 09:18:04 -0700
Message-ID: <20250821-psmi-v5-9-34ab7550d3d8@intel.com>
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

When documenting the directories, use an output similar to the `tree`
command and add VFs and missing attributes.

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index de73c4ff8f4f2..25b47106413b6 100644
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

