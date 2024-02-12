Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A198AC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 18:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DA810E80E;
	Mon, 12 Feb 2024 18:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKWlSpk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300B510E80E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707763975; x=1739299975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgP95PibM7SG4wIS4ZdJnJwEMUzYZlvQ6vvOK3wuClU=;
 b=WKWlSpk3tvw13Dswu+cgQm1udaJjX9+oS4wrllWXxEFSn1pu2pMrWeXA
 6TlX3agoHPhiuZ3n+zSFWC9R3M0qoMMIbf/0+/+MdI6IaR70sIFZ5KpMR
 pHNgz2o4FyZCTyM3rxjiwiK1EVeOxNLn5NFLZLGkbva+bdd9PIr19vNqL
 xEdTWHKgWx8bEW3YxAGptgTTsN3ag7pWYE/tJAjmcHALG9fcYwIMV0jyQ
 Iu7apHJg+rGrBPXekUDEZNbu3uRPb0TBy4oxclYlmldJ/hq92dcJ3pTJp
 Sqtl2QF8pIT6nKN9It9VZ9huRdrrAIorfDTsX5bu2pU+PFH2P597F26Pv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13149510"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="13149510"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 10:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="3007723"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 10:52:55 -0800
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [topic/xe-for-ci] drm/xe: Add new PVC PCI ID
Date: Mon, 12 Feb 2024 10:51:25 -0800
Message-Id: <20240212185125.457721-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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

A new PVC vector only SKU got introduced. Add the new PCI id
to the list of PVC PCI id's.

Bspec: 44484
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 include/drm/xe_pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 3011d99a05c5..2b7c2003ddb4 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -186,6 +186,7 @@
 #define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-- 
2.34.1

