Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E9606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSMYjSM+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9A810E07D;
	Wed, 11 Nov 2026 05:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721010E07D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 05:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794376248; x=1825912248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N61iJlx9Rh+AF7HFqcIzFcxfLpbOuGac9JegqLIM5m8=;
 b=XSMYjSM+8f23Zd4sIjqawHowJ+exUcktmZFms5ztRwqod18FmWjjkxEV
 9Fxk/AZ/rRA0sAcy5R8WGSbPVFUO+dGA/Vb+LdcwamssfTXSIr28l2yVg
 E1oPwBFhiIqgyMtl/jDgo4czf/YgovI3YFPnkGsJo/14JAzLbgh5xB409
 vZv7pC/V3NHG6xtfeNu8ImLIZbRvyFgYPWsLFFIn5r+HoAkTAV99EJZsk
 LDHniSlEOl+Iyv0nz4YHz374ix2+55LQFAftH3MihR3MKztm3XWuSaegW
 tJRTt0u8vgQoFjEAXoqNcm6jn4Rx0vpYb+A9IX/OZGElXmTTzKjW++oeW Q==;
X-CSE-ConnectionGUID: aGobYIKaRp+7aotNloPgTA==
X-CSE-MsgGUID: efgdVyLQRPOzrqj9sKMm1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3061269"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3061269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:50:48 -0800
X-CSE-ConnectionGUID: hBFWK3YzQZi5JvRc4nCd9g==
X-CSE-MsgGUID: RoINPyh+Q06Vcq6fiyHNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8649330"
Received: from rmaurya-mobl3.iind.intel.com ([10.66.118.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:50:47 -0800
From: Ranu Maurya <ranu.maurya@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ranu Maurya <ranu.maurya@intel.com>
Subject: [PATCH] drm/xe/cri: Add new PCI IDs
Date: Wed, 11 Nov 2026 11:20:20 +0530
Message-Id: <20261111055020.866766-1-ranu.maurya@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add new CRI PCI IDs 0x6753, 0x6754, 0x6755 and 0x6756.

Bspec: 77979
Signed-off-by: Ranu Maurya <ranu.maurya@intel.com>
---
 include/drm/intel/pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index ac858ed26df2..ab02bef262f1 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -906,7 +906,11 @@
 	MACRO__(0x674F, ## __VA_ARGS__), \
 	MACRO__(0x6750, ## __VA_ARGS__), \
 	MACRO__(0x6751, ## __VA_ARGS__), \
-	MACRO__(0x6752, ## __VA_ARGS__)
+	MACRO__(0x6752, ## __VA_ARGS__), \
+	MACRO__(0x6753, ## __VA_ARGS__), \
+	MACRO__(0x6754, ## __VA_ARGS__), \
+	MACRO__(0x6755, ## __VA_ARGS__), \
+	MACRO__(0x6756, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.34.1

