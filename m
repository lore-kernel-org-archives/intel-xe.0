Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A77606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B1irAkpJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2D510E342;
	Wed, 18 Nov 2026 06:26:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F810E4F1
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 06:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794983179; x=1826519179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DjH4zgK0CZ1ijFx2t2mnDVg10HQfQUzOXJ0LFk8rc7U=;
 b=B1irAkpJ9F4Qwgv88nRk69M7PJs21TcTpa9eWLeNP3YWeQQVayBOMWSb
 K4w2pjaDj/tj+E+tqLoBEeW+nqsOVqIF0vkcgmWttlGo94e42cLJF1gow
 i3Ea+EWQqjsWVL04arGJnGsn+e/YIJ9bsyJIpvIhfC6VkA7DMtr0a9bO6
 7hTBDkctWeN7sItdjBv6YNrJNKGl51d0QjQ7qmVkMRETp19DMmZBUSb7t
 OJPsJmNbDEuxCF5pAT8hQ/Xjx1TSvKjLxjGQGN2R4lqtgmPhH0Pjc394Z
 Z/4e10joQ3boqOa8FtDJNqkfLxex7WsbNAaUrSUIamVlKHyWSfumgLmAM Q==;
X-CSE-ConnectionGUID: ffWrEDH4RRW8P9VCZHwCwQ==
X-CSE-MsgGUID: ZtqElGvLR4i9dr5520+uqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3823487"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3823487"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 22:26:19 -0800
X-CSE-ConnectionGUID: kpiE7XDKSkykzKhh7bNhQg==
X-CSE-MsgGUID: /3cvJOzwRQCcHZ0tPKPvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9906211"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 22:26:17 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
Date: Wed, 18 Nov 2026 11:52:56 +0530
Message-ID: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Add the PCODE MEMORY_CONFIG command and its READ_MAX_BANDWIDTH and
READ_MAX_FREQUENCY sub-commands. They report the maximum achievable
memory bandwidth in Mbps and the maximum achievable memory frequency
in MHz.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 00c4fc7d0124..f05846931059 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -81,6 +81,10 @@
 /* Domain IDs (param2) */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
+#define   PCODE_MEMORY_CONFIG		0x70
+#define     MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH 0x0
+#define     MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY 0x1
+
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
 
-- 
2.43.0

