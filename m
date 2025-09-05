Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED66CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 16:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732DE10E2FE;
	Fri,  5 Sep 2025 16:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8TiPhla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C3010EC14
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757089372; x=1788625372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hiWEBXYCUBvg/C35XP2ZET17WycKSa1stTZ+u/e8Zrg=;
 b=n8TiPhlanupURmILDel8bP7ZOpSUplNCmCDVCBozy15vYgo+GMq4P4Dk
 3C2pnzc4NMZYfwWIevKEm3/HOTmR/FcjooG0gZIjjAEm+97rH8NrMKoat
 809X/9WSe0FsrnCqwjaRPZPlDwHNe5f0qeeetwpVInZv2eyoH/YIymphn
 2BBtNO6R3/0XstLt7tNpVv9TzvMwG3Tgy2gsWkuUb6aoRsI8I9yqfYL6x
 t/NMevTzTJ8zsFZPmi2c6BAYXMr+0VmOZTaGsZcxLhMt2Q3jsfeIWR5I6
 dmfqSMuZ77OJnEAXqjC3AEGveKuY5cG/2DrFKh2VJp93vshnThIifsNt3 g==;
X-CSE-ConnectionGUID: 2V65lUcuQA2OW1Ytorwq0g==
X-CSE-MsgGUID: hPcM9koITva5w4t4f3HemQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70147691"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70147691"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:22:52 -0700
X-CSE-ConnectionGUID: rK+AhaANSjy7nPEvitZbJA==
X-CSE-MsgGUID: kzUw74xCQmaY57nd0bLuVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="177410074"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:22:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/configfs: Use config_group_put()
Date: Fri,  5 Sep 2025 09:22:37 -0700
Message-ID: <20250905162236.578117-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

configfs has a config_group_put() helper that was adopted by
commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device").
Another pending work to add psmi later landed in commit
afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
the helper.

Use config_group_put() consistently to hide the inner workings of
configfs. No change in behavior since it does exactly the same thing
as currently being done.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 0337811864cd9..e515fa7085fa4 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -598,7 +598,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
 		return false;
 
 	ret = dev->config.enable_psmi;
-	config_item_put(&dev->group.cg_item);
+	config_group_put(&dev->group);
 
 	return ret;
 }
-- 
2.50.1

