Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F242CC5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980710E0D2;
	Wed,  4 Jun 2025 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fA22r/4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E20810E0D2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749048762; x=1780584762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5G6vwVJeErvP1jyySj47u33h2dgorLOTbD7xEM4l/Xk=;
 b=fA22r/4upNeaIZxmYx6Rq65xGnCSXId1PM8l9GQPqwmzQ2Z2NlA+JPmv
 cciMFiB20WHTqkh0MXtzMjgHlnkn84Wuvqgok014AAEY1ksNnF2JvX8jy
 Q3dIh1RpirrDQ7MXqhWwf6a+GK9Px5uu4jb9u3yW3pK29lGQ5/Flki86q
 Po3kkJ9VO1PzIxdNAX2CjRwtsmxPYd3fee44YzJbY+iVjN5OtrYZI2Y7F
 7TTjZWlwgSWTgt3/wA+594pbpbVSOULtT8bl/mKQdhdk1RbYaWz0Yoc1/
 mkB7eSqpH0S1RM4wnt8lQfjqLtO1q+DqnCPmmIEhyRX0y45QbuPKt+GsE A==;
X-CSE-ConnectionGUID: wJjj7ZGrRhG42nGqPfFPeQ==
X-CSE-MsgGUID: wFr1ljvFQqa0AOJeCNcauQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51228675"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51228675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:52:40 -0700
X-CSE-ConnectionGUID: Y6+i2E3YQR6l3L6noTLCHA==
X-CSE-MsgGUID: ZdccTek5RvC3czqDK13www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150004757"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 07:52:40 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Date: Wed,  4 Jun 2025 20:22:34 +0530
Message-Id: <20250604145236.1143122-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

