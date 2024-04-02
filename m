Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929C1CD128D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4099410F7C9;
	Tue,  2 Apr 2024 12:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGDH8PEJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969AE10EEB8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712062062; x=1743598062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0UNeVTjjH7ZvLCUSElwq+ngS3eSmmwSHrLBGgEqMF0=;
 b=jGDH8PEJedhnrC8gRyQc5hiLy5r3F+pEjozwsmEZb/ZBXWceBrVioVaI
 oc5RIwzlV4pCluM16I6VFGK84uGnLFpSszgIVOECSzfmN+daVDTEB5pvx
 YQBatX6hbt09o/HhHTRf8XKjyJBcb/TsY0N94gC5JgzwImQFdyzkZkSD1
 PemCllbLh/6E8YDcrX9FPXgcdBckvHeAd0RQZDoR5CXriUHK9SOI0955W
 yXmxgQR3Id9lRJnKnf+439MfB4bMdD5Du3sgKlxsbNAGKERE6sGa+tOn3
 yn9uXvK0/TFiDOzTtMForpio+1qjWxqRpwoVvIy2swR+KQ3bapvozvbz7 w==;
X-CSE-ConnectionGUID: D63FvkGvRRymvd3g3DaE6g==
X-CSE-MsgGUID: hmNyyetuRv+l0PZpmZq7RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7098092"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7098092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:32 -0700
X-CSE-ConnectionGUID: BPn8v17TTqOYU122KhqoHQ==
X-CSE-MsgGUID: XTHFA24cRVWilR5eJQSdKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18111222"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 05:47:31 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 08/11] drm/xe/xe2hpg: Limit chunk size to 4MiB for vram
Date: Tue,  2 Apr 2024 18:17:21 +0530
Message-Id: <20240402124724.1238122-9-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Currently, The maximum chunk size for vram copy is 8 MiB, which means
flat ccs copy would be able handle 8 MiB/(page_sizes).  Since page size
for vram is 4k the value will be 2048 pages which won't fit in 10
bitspace.

Therefore we need to limit chunk size to 4MiB the way it is for LNL.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..07a09649787d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -407,7 +407,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 {
-	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
+	if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe))
 		return MAX_CCS_LIMITED_TRANSFER;
 
 	return MAX_PREEMPTDISABLE_TRANSFER;
-- 
2.25.1

