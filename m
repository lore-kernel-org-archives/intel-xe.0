Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C214606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WL/kFL/v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135210E684;
	Wed, 18 Nov 2026 07:27:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1549A10E684
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794986819; x=1826522819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6zX25XPlsJO9E/kZaJztu76EjIoLipcWiSrAcLFbnU=;
 b=WL/kFL/vkLzMeiIeRMpnsTGVUpGrFxCG62tWefI8HTbm9wLnZyldOLds
 1VqJGO/VppGGfrXejI6LvM8ojJK60wCb+t/HSr+z5vrX9/1HdSRQEs1m2
 bw8NehZsvnlHvYLGTGW0u0TUC86RxDtH3ACyqIztg+0hT8G8d1zhbrDrr
 cL9Lo3ZvQjmrd59KlPWSsna4ltbTEyNRsl+hjFWjBTszrqYKkZfGkBnmV
 M94IpTSowFUKn1aUu5icbfL/1j5AgmdKVswZIx8boDhFEPEjL97zK1MNU
 2IQDYl9lTopB6vUF0pooF0V7E4j2f91PDK0qxiH8oTSf4wcPkU9cSObu5 Q==;
X-CSE-ConnectionGUID: mKENktI7Tum5I3rmFMou2Q==
X-CSE-MsgGUID: xMe5UfUFQsu1FZZcugLLyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3645062"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3645062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 23:26:59 -0800
X-CSE-ConnectionGUID: Wq4FCgAfTa6XdrA52aIaMQ==
X-CSE-MsgGUID: d6nY2e8xSLOwk/m0eKnd/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9943934"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 23:26:57 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
Date: Wed, 18 Nov 2026 12:53:39 +0530
Message-ID: <20261118072344.4158760-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118072344.4158760-1-naresh.kumar.g@intel.com>
References: <20261118072344.4158760-1-naresh.kumar.g@intel.com>
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
index 00c4fc7d01244..f058469310593 100644
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

