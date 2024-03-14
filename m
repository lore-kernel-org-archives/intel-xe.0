Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D8FC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 03:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CD10F82F;
	Thu, 14 Mar 2024 03:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcOYUSbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8F310F82F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710386628; x=1741922628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SkO4fjkbO1uV408+9TCiENPFnDhlyw9EYI//tp8mFB4=;
 b=HcOYUSbouW00wTitHDeHvs08/OyRfJwxDx9+M3zvCzNYcLLK4wuTzKBr
 N1ypGytxHpdzuWhf0sp+AKowMWc7GxW/IhB0U2ZgXCCouflyVcf91wVC/
 cB4VkNl3tkxoh1bTAuItn2pjcNzyg6K43d0FL18ns9g60uKkPG4kf2ZyU
 fPqK4Bo0E42o/dqXvHcXhOdUuHV+1zVd49SySwSNeUpsF+vXSRGWQTMQx
 RPg/J42GasY5tgfvmmrypDjxIDI3oQVdDS6n1MY8jfKi1huAaOaQs7EEI
 Nnv0CajPqpvzZXgpHgERjTBs+V6SXxyIwYhfuEIZAfLY3ZB3aD46cCwH6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8966478"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="8966478"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12084619"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 20:23:47 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, matthew.brost@intel.com, airlied@gmail.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/5] drm/xe: Helper to get memory region from tile
Date: Wed, 13 Mar 2024 23:35:50 -0400
Message-Id: <20240314033553.1379444-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240314033553.1379444-1-oak.zeng@intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f27c3bee8ce7..bbea40b57e84 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -571,4 +571,9 @@ struct xe_file {
 	struct xe_drm_client *client;
 };
 
+static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
+{
+	return container_of(mr, struct xe_tile, mem.vram);
+}
+
 #endif
-- 
2.26.3

