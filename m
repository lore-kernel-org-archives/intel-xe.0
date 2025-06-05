Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC7C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 19:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F2610E307;
	Thu,  5 Jun 2025 19:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8TEA1yg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CBD10E307
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749150489; x=1780686489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5G6vwVJeErvP1jyySj47u33h2dgorLOTbD7xEM4l/Xk=;
 b=G8TEA1yg25yUMMXfTqbU+kwqeM4mSAcFFR6OyZlGWWLDXXcxrdQDaQL6
 4s0Dd6qkZu9UY2XyhdKBhsbjD9w9U9a0Uf4qCZG/q2cYdOuJZNe4YJ5sv
 K+XpflwjPwLyME+wBxLLlWMnQOWTlfw7NwCXwQ8M8n0rHDv/ZqZqtmDOQ
 YC0bKUkVvol9XjDRl2ofFy79cVIiVqz/VkF81ZT8a2b0agazgyxr9Va/2
 hZzsygQwsjszM1c4nrFobmyQLLSHipl5AMVYgQwvlYCS/V48wlf0f037M
 hpMrrhGsBOT+d+Nx6iOj7517K/jawmVLQHa6YI3bKzStjJk1Mma5CDFVy w==;
X-CSE-ConnectionGUID: 7JjNaOFWRmSyphAbOH3p2w==
X-CSE-MsgGUID: zPS/ttZkQ/Oj27li2kwAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51432755"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51432755"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 12:08:09 -0700
X-CSE-ConnectionGUID: 1ix9VJltRVuHDMhAWi6bkA==
X-CSE-MsgGUID: Abfn/KxeS3mwBy+izZ03zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="168761536"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2025 12:08:08 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Date: Fri,  6 Jun 2025 00:38:02 +0530
Message-Id: <20250605190804.1287289-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
References: <20250605190804.1287289-1-dnyaneshwar.bhadane@intel.com>
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

As per updated Bspec, Sync PCI IDs for BMG.

Bspec: 68090
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm/intel/pciids.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index a7ce9523c50d..129c3172aa5f 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -852,8 +852,11 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE220, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__), \
+	MACRO__(0xE222, ## __VA_ARGS__), \
+	MACRO__(0xE223, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.34.1

