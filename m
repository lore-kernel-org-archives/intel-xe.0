Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F33C02190
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 16:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B5C10E6A1;
	Tue, 28 Jan 2025 16:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkTeR0EO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D64910E6A1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080873; x=1769616873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m6VMXPkxfQuVso7sOf5K5MiC7gKiqRoGq7uVSEMAMmY=;
 b=VkTeR0EOSlSNMSGd9Ikl+FplMu7+g29QN4BUjP7bdVafxE4F40pWlPlI
 Oi9YyG+OQ+FAmIzjlhbjsoflccLnJeHEi8/rWhjPcSKMLtSf02/nF9MnS
 SUmCq+6McG8eqWcV7DjKfggwWnBSNa6TCq7EvCRJkax67N5rDkvnKXMzF
 LhC111XT4TL3EaAIInHv9Ax+EwmqriebVEjVY7+224Xg6ux33yZHzET4E
 YUh1qSaKqEd21UWkWrwsiL31pmqtFtk6o1fTjpBOET5jaU2jupQdoLBdj
 tKHOJDbSMJoaPt+OvQwykUZTXy2MAssKDKJ0hiJXI2uzxLTe9LhLwAu1r w==;
X-CSE-ConnectionGUID: dkih+D4KQXqSbMjzZL5cRA==
X-CSE-MsgGUID: wNuKt8ZZT4+zjilxOTDP6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37821886"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="37821886"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:14:33 -0800
X-CSE-ConnectionGUID: TZbxh1o2RQmJq+1cD/3SkA==
X-CSE-MsgGUID: f9MN9PmQRsmjYQpjVvvcaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112774682"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:14:31 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com
Subject: [PATCH] drm/xe/bmg: Add new PCI IDs
Date: Tue, 28 Jan 2025 21:43:46 +0530
Message-Id: <20250128161346.3287890-1-shekhar.chauhan@intel.com>
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

Add 3 new PCI IDs for BMG.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 include/drm/intel/pciids.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 7883384acd5e..7a86549604d8 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -817,7 +817,10 @@
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-	MACRO__(0xE212, ## __VA_ARGS__)
+	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__), \
+	MACRO__(0xE215, ## __VA_ARGS__). \
+	MACRO__(0xE216, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.34.1

