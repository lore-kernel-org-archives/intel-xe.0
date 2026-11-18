Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3C606A74B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QCeNUW7U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6BE10EC68;
	Wed, 18 Nov 2026 17:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5810EC68
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795022898; x=1826558898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=na0Xq17Isgv71qABl4i03nTya+RhqFhqnQMiLfZF6p0=;
 b=QCeNUW7Ue9fKdqULtTdinC8ksh4fz+6M2CmAdHiLnLAhz+aERtv6IFGl
 80ZbCqSh+tgFcgJ5evNE2QBRgVT8c4FZT0Q4jzFIh4fANONJu24cCH3yw
 3csiFbARBv+c5a1WHJ4Uvaot/v2OquKmL3TllUeGDwzMxIev4wFddtDjF
 OvMPWP55DwGu3fMMZeuHz0CePB/ZAzy06RkbmqWZIZoAZDohED53jrjsb
 N7wmlsCk+J0RA9o0pG8qKIPWmG2+iC4PL5+IzeNjtKbvibhF/nXcQjS+Y
 lI6OX7tsTDJUx2XiMhJlUFVnrd+lAFkoY7WflY4pwoBkEGzXfYKCRYGTE g==;
X-CSE-ConnectionGUID: R0P2PmerSTG1hwhw1gxBhg==
X-CSE-MsgGUID: MpHVbHOlRb+agT0ayygWlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3730757"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3730757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:28:18 -0800
X-CSE-ConnectionGUID: uGmjTp6kSliMvYXNwsXg2A==
X-CSE-MsgGUID: GAa4UGoCTlO/FSoJYNdzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10203780"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 09:28:16 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 1/3] drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
Date: Wed, 18 Nov 2026 22:54:52 +0530
Message-ID: <20261118172458.316603-2-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118172458.316603-1-naresh.kumar.g@intel.com>
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
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

