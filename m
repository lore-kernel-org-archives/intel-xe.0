Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AB1C678D4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C425010E88E;
	Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD8B10E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PKeJkUJZ2ewI/9aQOrxCmxsG6FDXawylv9PRBqmf+K8=;
 b=K7Ke6kIX2iTSjPw9DAFjY5wV80/8VNxWsbE0FRHGlNRAbEdDUcSF0PqR
 VoSpW9JDiqCZsUKYOixQPbUXg56GqnJDvsSjT201178YJc/eHUD5lSCkc
 TJC+6GOs5vb/GwV+d0L3k/jRRpb9bwLr7F0ZbkcL5ik4DBNTVX2++OPoF
 WolygLEOcXSpsHqatDH+6QSFv2CAbcrjBh14WRuC2WSc5SeMhrPzrOfm/
 uaJO9T1s6FVfsK1i8FxLMOe4+r3fEOS4NiF92m/l86MXkuDd/KPrjyzLR
 mEiNSFZe53dvhUxK3CtxGhhG4bVLPjU8ht6C0kRrOLZESv0OLgtl0rquq w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450058"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863223"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863223"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:51 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:27 +0000
Message-Id: <20230214112136.162380-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/15] drm/xe/query: zero the region info
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
cleared when handing back to userspace.

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

