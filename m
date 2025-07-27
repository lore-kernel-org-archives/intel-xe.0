Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F526C87FCF
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAB410E312;
	Sun, 27 Jul 2025 17:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eswrt7Yc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1C110E312
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753636823; x=1785172823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hotk0lDaAYz9BnHUzPCQSG7rL87WgGQlfacyt09Bdzw=;
 b=eswrt7YcxvssSFphOtd8tuz9Ej2JNNW4H06uxMpuvkRlMETFZzwjCpgN
 Gm6AlmmkrcgkYSxE/Uq8ENEYhMXg8MtP+s73v9HMyeDqPfVbNsf0w+nks
 CCmC34FTAW6pyzHZbdYhxbD13Er9s6WFbYozkQN6DKUrL8AUEIS+5qR6O
 Xx2FTd6oZMLzj5iCT3uBVsjHc9R+T5mk31JgwjwSphcv8H66++CJQCNl0
 dFbiKjjjzSYCRwWhyx6h3ZZBLay6RRG15UGH27V1lWTH9ETLWr9lafTKa
 aVkW+Ek8CmAk3HshZpzHvDOdb56ZLjNgU48SEnzc+DkuHsIFwxLy5hd/D g==;
X-CSE-ConnectionGUID: gB0bUH3aTvCKi4rGVIFL/A==
X-CSE-MsgGUID: qVBMG2tDTMmaWU2Mzi7lyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56046723"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56046723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:23 -0700
X-CSE-ConnectionGUID: Vj7o0YNDQ2WHMcHjbSJqFA==
X-CSE-MsgGUID: 6XuaVM9bQhaafWBbEjz9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167556822"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 10:20:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex on
 exit/error
Date: Sun, 27 Jul 2025 19:20:00 +0200
Message-ID: <20250727172009.587-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727172009.587-1-michal.wajdeczko@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
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

While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
enabled, we should still call it.

While around, simplify init() code as there is no need to print
separate error message, nor have a temporary variable, which was
likely just taken from the example code. And drop a traling line.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 36e2b45b305f..6aa0531bcf76 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -392,15 +392,13 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 
 int __init xe_configfs_init(void)
 {
-	struct config_group *root = &xe_configfs.su_group;
 	int ret;
 
-	config_group_init(root);
+	config_group_init(&xe_configfs.su_group);
 	mutex_init(&xe_configfs.su_mutex);
 	ret = configfs_register_subsystem(&xe_configfs);
 	if (ret) {
-		pr_err("Error %d while registering %s subsystem\n",
-		       ret, root->cg_item.ci_namebuf);
+		mutex_destroy(&xe_configfs.su_mutex);
 		return ret;
 	}
 
@@ -410,5 +408,5 @@ int __init xe_configfs_init(void)
 void __exit xe_configfs_exit(void)
 {
 	configfs_unregister_subsystem(&xe_configfs);
+	mutex_destroy(&xe_configfs.su_mutex);
 }
-
-- 
2.47.1

