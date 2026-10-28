Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FCB606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VstNBAvW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4110E54E;
	Wed, 28 Oct 2026 07:15:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED74D10E54E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793171751; x=1824707751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v8JatsLcclZPbFWgGBLEVkZP7qE53dB3hrpOSX5nv00=;
 b=VstNBAvWJmjsuRGI/8IdZ3slyQpdLGYWsVaIhMCtGS0Eh6e2PtY/nTe9
 /V9kxs2d4tVOdT5IktqUi2SVRQL5icHm615Xkv/RPG3t52B3FtwbsXsXr
 DmN+MNlaDqezxG8qdyVMxQsgLecvMUX8njV4q8nPcrfYs+99FfhbEwEAe
 n7G+x+LUcjZSHHy/nr3/lPksUT8Qw73FHCl4Mb077y4UZZ53ZL7M+g0z3
 nIg7NiykxhnK4H2iPgon1mevjjW9X1i8pYsSb7eOLeH4PoECEkJpycttb
 KGSJh4OHrKGjUWiZkSK7GZfdoJ7edq8VQH6VzK6odgZV/GYPpI8xjLWn2 w==;
X-CSE-ConnectionGUID: 9AX3E48/QgCwMPwGqmBpCg==
X-CSE-MsgGUID: gvPW1jmkTea05DwrYaud4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1976249"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1976249"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:15:51 -0700
X-CSE-ConnectionGUID: KQUJw/kSRmSWPdL+s9DBOg==
X-CSE-MsgGUID: m4POvILZTOGDKRRTGMO9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4626270"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:15:50 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/cri: Add new PCI ID
Date: Wed, 28 Oct 2026 12:56:03 +0530
Message-ID: <20261028072602.2035289-2-balasubramani.vivekanandan@intel.com>
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

Enable new CRI PCI ID.

Bspec: 77979
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index a2160920781d4..ac858ed26df2e 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -905,7 +905,8 @@
 	MACRO__(0x674E, ## __VA_ARGS__), \
 	MACRO__(0x674F, ## __VA_ARGS__), \
 	MACRO__(0x6750, ## __VA_ARGS__), \
-	MACRO__(0x6751, ## __VA_ARGS__)
+	MACRO__(0x6751, ## __VA_ARGS__), \
+	MACRO__(0x6752, ## __VA_ARGS__)
 
 /* NVL-P */
 #define INTEL_NVLP_IDS(MACRO__, ...) \
-- 
2.43.0

