Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A8C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 16:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11FE10E6C2;
	Tue, 28 Jan 2025 16:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtPD913a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D872A10E6C2
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738081233; x=1769617233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1pdfO8XngWXCwlIQFuWPgjTYnzePhewBBzV7bakShic=;
 b=XtPD913ayIJjLIDTULVNW+ooibcyaEkLHC7YX5ulOUvKgHX0fZR5bhuu
 9Bf6pR8jbruK5yVbzLfkSNpslbBwJUHSsT+Aw5rlvNpHQsdqfYjca1yP2
 TKZnjUIXnaODh+sScjcWnWb4JkEknPeZVChToWegsaU/QZqltNrdaBH6i
 Cs7sgx4H/L0vDasr2/nO13YG52+EP3rUZUAddbQiiD3zHaHOW6vyU6qto
 yZQYEp3CocBw1uiH+5m5gmeVjBAmCa1439IlFNTrMZKJz9y4fsao6JNpZ
 zlqlZ/eJt2G9xs0fzTAjtMLGu8vskDXlEnLTRDVCr95hdBG9FZbwK1tST g==;
X-CSE-ConnectionGUID: wC5m0sTeS9O0v+8YqeTHsw==
X-CSE-MsgGUID: 0LkByCIGSMqI7FSQJ3kE0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38456056"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38456056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:20:32 -0800
X-CSE-ConnectionGUID: bkB2EnvmTsuN41ovOefEGA==
X-CSE-MsgGUID: Jo6ubGneTF+/DeDAIKyoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="113817909"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:20:32 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com
Subject: [PATCH v2] drm/xe/bmg: Add new PCI IDs
Date: Tue, 28 Jan 2025 21:50:15 +0530
Message-Id: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
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

v2: Fix typo -> Replace '.' with ','

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 include/drm/intel/pciids.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 7883384acd5e..e53d7d9bb64d 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -817,7 +817,10 @@
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-	MACRO__(0xE212, ## __VA_ARGS__)
+	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__), \
+	MACRO__(0xE215, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.34.1

