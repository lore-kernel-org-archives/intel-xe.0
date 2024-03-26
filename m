Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A363CD11DF
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 10:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B890B10E592;
	Tue, 26 Mar 2024 10:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8aIncve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE8C10E592
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711449300; x=1742985300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYxW9+bsHwdGJQEDPdl3sUHmJmRkMPvufSNHSzjfyy0=;
 b=I8aIncveutgFMv2/tZlXHmjKkKeoRk2cFtJ4Ib4rH6E4A1/x7e+MKBcN
 GyyasF2R8Hkfr+xeEsru3QarL2QZaKzlCOWHD3i4JyMHEn8SUsdLAaSV3
 jbaNqxE0zzEcCG2oY4m5lYBN1/fSAve2yL2XQx3Kp+F/FHWnKBdUfRtaA
 7FsQhGq9CNfIhV9Lc5e1QePUmXJLTynOmWloXBE8s/8KML4NkmYatn6ZC
 cNAXNEOsHA0Opr/S9UV3RCihuEMwPgV0dJDZ3sX9wGb6+7QKLP0PV7pXN
 a+AGIGbYaXVjENUiLlgnyJRYUFwzMu/x1frEvSNXcNGX3g3qHxAjPj/44 Q==;
X-CSE-ConnectionGUID: +Lr70QVbQxGENbP3PSoOhA==
X-CSE-MsgGUID: Hf07qOTUT4qWegbu3lSBVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6680007"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6680007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="39033546"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 03:34:58 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 radhakrishna.sripada@intel.com, clinton.a.taylor@intel.com,
 matthew.s.atwood@intel.com, dnyaneshwar.bhadane@intel.com,
 haridhar.kalvala@intel.com, shekhar.chauhan@intel.com
Subject: [PATCH] drm/xe: Add new PCI IDs to DG2 platform
Date: Tue, 26 Mar 2024 16:08:25 +0530
Message-Id: <20240326103825.3832879-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
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

New PCI IDs are added in Bspec for DG2 platform, add them in driver

Bspec: 44477
Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 include/drm/xe_pciids.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index ab4a8987ac65..c7fc288dacee 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -134,7 +134,9 @@
 	MACRO__(0x5692, ## __VA_ARGS__),	\
 	MACRO__(0x56A0, ## __VA_ARGS__),	\
 	MACRO__(0x56A1, ## __VA_ARGS__),	\
-	MACRO__(0x56A2, ## __VA_ARGS__)
+	MACRO__(0x56A2, ## __VA_ARGS__),	\
+	MACRO__(0x56BE, ## __VA_ARGS__),	\
+	MACRO__(0x56BF, ## __VA_ARGS__)
 
 #define XE_DG2_G11_IDS(MACRO__, ...)		\
 	MACRO__(0x5693, ## __VA_ARGS__),	\
-- 
2.25.1

