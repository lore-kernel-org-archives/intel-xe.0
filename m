Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295A6C636D6
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD4E10E076;
	Thu, 23 Feb 2023 18:57:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49D710E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178673; x=1708714673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4YxmNqY+p7KFWf/JV/aCeVTESC11lvcoqkP8G6mkNNM=;
 b=cer0PyATAEVeWjzdQhDGAXSwuO7V7qdlsOHCc8TLiDL+GWAM4AGQfc3I
 5KZt/lHZZwugHbZD7o1fAn9PGSMuDqU1vDiZhV6SpoctBNZV3ht/eQskL
 eWN21aPKCjKCX3i50tmaNiHVkzOwUr2+T15KH/h2izDAt6QJFqY7BxBbY
 HXUUrE2bbLAcLluE5Hb3KG7B1BEbCZhki8blDKdHQ2qbsnKT8pkiN7jyl
 CC57LTf2BvJTjzjkzYM7j5NuaC9rflTof3wuQ3r2IRt/2STjnLOUIaNsQ
 80rpgZYF4S4dqOhS+qayUve0IQL0JxhR2PFnDjE8WeBLo39JWkcG+YWub A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793755"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018609"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018609"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:37 -0800
Message-Id: <20230223185740.3356127-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/7] drm/xe/mocs: Drop duplicate assignment of
 uc_index
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The DG1 branch needlessly assigns uc_index twice.  Drop the second
instance.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 05b8a9967f0a..d0f42f17a29e 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -352,7 +352,6 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->table = dg1_mocs_desc;
 		info->uc_index = 1;
 		info->n_entries = GEN9_NUM_MOCS_ENTRIES;
-		info->uc_index = 1;
 		info->unused_entries_index = 5;
 		break;
 	case XE_TIGERLAKE:
-- 
2.39.1

