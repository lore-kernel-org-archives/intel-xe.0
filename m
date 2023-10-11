Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F135DCD98F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 05:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8470110E2DF;
	Wed, 11 Oct 2023 05:14:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC5810E2DF
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 05:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697001269; x=1728537269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4PVLGEXgc0pbErDxrIK1l4wviKYHIof9HS9V14uVo40=;
 b=enrRlKvtjztKuPigkTpowSmNmBMkTNkmRrEttitpwev5q+9fzngt38jS
 aaILyF/sjHMFqKDk+4vAI86gSNdNnPqou+ZogL34H/Cig5Lz28TPmfZrp
 KXYe7/I0k0tuFstGeKGdN+dd+uXR1ul6nyN3a1zXBNcNDfXNA7rzDlQh3
 yF3+CQALgVgJbnK6FPIwadWMoWGJuDgq313lADnx42ZPpXrACrHR1ARE0
 kCmSuGeD/6Mm1A5ijTxs8QC6aFaGv2kp6afDn0QkAsfuWGgNCDOYon9fK
 fbHlsyWLnwiq2FSHj0OTxAz4yl6gsC/9HSavN3uXB1iuUbWBybm9ilgqJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363938625"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="363938625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 22:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730359706"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="730359706"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 22:14:27 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 10:44:18 +0530
Message-Id: <20231011051418.2767145-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add new DG2 PCI IDs
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add recently added PCI IDs for DG2

BSpec: 44477
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 include/drm/xe_pciids.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 29f07a00ac0f..8253219abc62 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -138,7 +138,11 @@
 	MACRO__(0x56A5, ## __VA_ARGS__),	\
 	MACRO__(0x56A6, ## __VA_ARGS__),	\
 	MACRO__(0x56B0, ## __VA_ARGS__),	\
-	MACRO__(0x56B1, ## __VA_ARGS__)
+	MACRO__(0x56B1, ## __VA_ARGS__),	\
+	MACRO__(0x56BA, ## __VA_ARGS__),	\
+	MACRO__(0x56BB, ## __VA_ARGS__),	\
+	MACRO__(0x56BC, ## __VA_ARGS__),	\
+	MACRO__(0x56BD, ## __VA_ARGS__)
 
 #define XE_DG2_G12_IDS(MACRO__, ...)		\
 	MACRO__(0x5696, ## __VA_ARGS__),	\
-- 
2.34.1

