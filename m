Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA70BC6379F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 10:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABBF10EA96;
	Wed, 15 Feb 2023 10:30:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FB410EA91
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676457037; x=1707993037;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3vFnY0YTCKNonkdXJ1f9w8WCLzPVhTZOpD5w+qcyOpU=;
 b=QP8ycVtys7axQ045UpqLi9S2LBDzzpw+rM73W2tbZN34Lg0iKkTaEsAE
 FRvB3uqW7oRJ8mtvYlsAI41RUFXhaFh3UQpApvmGvi18QezlVoGCngqqe
 BUfwoDjPNgm+cX/XkZ3IqonZrh13SY1yEuU6kAt+C8aa28dfs/jVP2ebM
 2hqADFX9uXzs27GPutHqspEnu1AodWkRw7MFgh7CXxF/f3MBrFWLbdgbA
 0jCZV6TUBIvB1SnfxzO1ObEJtBu2AyT9rHdUeSa1NLA2E6fwlZeAVFAm8
 29+XPxSgczGv0HmvSzW1rErj2h0F78sy9yeG80lIfrqCI4MsOzuZQeWnF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311758972"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="311758972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758352305"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="758352305"
Received: from merinomx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.230])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:09 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Feb 2023 10:28:45 +0000
Message-Id: <20230215102845.278677-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215102845.278677-1-matthew.auld@intel.com>
References: <20230215102845.278677-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe/query: zero the region info
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

There are also some reserved fields in here which are not currently
cleared when handing back to userspace. Otherwise we might run into
issues if we later wish to use them.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Lucas De Marchi lucas.demarchi@intel.com
---
 drivers/gpu/drm/xe/xe_query.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 6e904e97f456..f9f21bd1bfd7 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -115,16 +115,13 @@ static int query_memory_usage(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	usage = kmalloc(size, GFP_KERNEL);
+	usage = kzalloc(size, GFP_KERNEL);
 	if (XE_IOCTL_ERR(xe, !usage))
 		return -ENOMEM;
 
-	usage->pad = 0;
-
 	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
 	usage->regions[0].mem_class = XE_MEM_REGION_CLASS_SYSMEM;
 	usage->regions[0].instance = 0;
-	usage->regions[0].pad = 0;
 	usage->regions[0].min_page_size = PAGE_SIZE;
 	usage->regions[0].max_page_size = PAGE_SIZE;
 	usage->regions[0].total_size = man->size << PAGE_SHIFT;
@@ -138,7 +135,6 @@ static int query_memory_usage(struct xe_device *xe,
 				XE_MEM_REGION_CLASS_VRAM;
 			usage->regions[usage->num_regions].instance =
 				usage->num_regions;
-			usage->regions[usage->num_regions].pad = 0;
 			usage->regions[usage->num_regions].min_page_size =
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
 				SZ_64K : PAGE_SIZE;
-- 
2.39.1

