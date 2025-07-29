Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6C5C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 11:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7878D10E61B;
	Tue, 29 Jul 2025 11:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5GB1CG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B36B10E617
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753789353; x=1785325353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMf18kZeKJU678xCwXclVGpTwiH6tO2rrYK06VXNqdw=;
 b=f5GB1CG51YEy/l4pexz0O0iTdCaMKovmuodVQQrT6yVUUPE7TEF7xw5r
 o+GphZOIcDnod+Ku7Zba+ZwysARYt4eu2AyLLZVFwsF9UjHkc/x4Zpyvu
 3w+RRgKWgZS91csRX6MdtfdJZvDi8YMZrEb8Xl3S+E8wNv8oUdJCr7IZg
 i55SXaRQ6qi4+hhx6WhWYKuH5qVMSdUFC+wDqsUhjJ1QnHKD0TlfME/kf
 8IJrZQ/miY7fg6tz5NCposqRJgEwrfMVmBFyVC8fNxtGt6o4JCdlklmMU
 Bab6DD/8SAdAXwhdDi78mwXCCHll4tKwm/TtmU4Rs1mSOTdTOpJd041lE Q==;
X-CSE-ConnectionGUID: 1zL3KYgJRZCrHwb49YFZcg==
X-CSE-MsgGUID: 4S6912ANRKKpcqMByM+FjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55755585"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55755585"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:33 -0700
X-CSE-ConnectionGUID: JqBzCIuoRZK+cKJW341TZQ==
X-CSE-MsgGUID: 0g16nZ+5QxOAAnL7CR5fTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161946897"
Received: from bjanicki-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.2.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:42:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 04/11] drm/xe/configfs: Drop redundant init() error message
Date: Tue, 29 Jul 2025 13:42:08 +0200
Message-ID: <20250729114215.177586-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729114215.177586-1-michal.wajdeczko@intel.com>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
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

