Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F19CC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261B10E7DA;
	Thu, 31 Jul 2025 19:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKAiWVp2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416D810E7DA
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990438; x=1785526438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dS2nFpyiw4fAuARNAazh+ZaQtbTdE+mX7yMNgTaf754=;
 b=SKAiWVp2wEX+kDSth4MX2PQH+cNnqE1p5wGZV9+x0x1Wvkn4bJMT8QJy
 BxiK4mE+QVaBivj6A5MglVT4BmffGV81L/WRjAZ4Uh12PkhB/xHL3FfXu
 S4N1vn4AVS/ybLs0alAI4lxBS4OtttzfFKdfSjharxf3qzJ47Aqk1ZRhS
 eGQWAIfNA60pq/0XnhHMsOV6MBB5ggVRACr6/xPqolDgPfZKLJZr09XKK
 saAajUIqmb+SMxWi2bI4VArWw4Jr93CfW3NrE3cXMf5ikHcobvqqg59OH
 EC0DJrDJ6f3i3mIWFSpJP4N6V/97ZKL5ZgoN2W9aG3/n1FPupHZg5kQEZ Q==;
X-CSE-ConnectionGUID: Qyz7Oxx2RAKHV2TOWqtLSQ==
X-CSE-MsgGUID: INdFEOKZShilZrPkcnkQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55395024"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55395024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:58 -0700
X-CSE-ConnectionGUID: +D2F3bD8SMSTGMdz29Gs8g==
X-CSE-MsgGUID: 6TKv2I9rSsKB0epqTFjjdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194333968"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:33:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 04/11] drm/xe/configfs: Drop redundant init() error message
Date: Thu, 31 Jul 2025 21:33:32 +0200
Message-ID: <20250731193339.179829-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731193339.179829-1-michal.wajdeczko@intel.com>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
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

There is no need to print separate error message since we will
also print one in xe_init(). Also drop temporary variable, which
was likely just taken from the example code.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 56fbf4c1c37f..6aa0531bcf76 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -392,15 +392,12 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 
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
 		mutex_destroy(&xe_configfs.su_mutex);
 		return ret;
 	}
-- 
2.47.1

