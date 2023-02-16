Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EDDC64ED8
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417B510E390;
	Thu, 16 Feb 2023 23:17:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748710E390
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589460; x=1708125460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qOv3B5fJNv+vTccfkziZpJrAQzdtgGS1LKJ/xpNo+D0=;
 b=PqCaGxDyv/HDY9U4ibtx4y/2bahb0NAPNm/EHShIArBDp0n/fVUYmORw
 hObOD3j9m74dQHVggnDTSU+0tWMbFh6mohPBts+HzHj2lpGigVgaoa+2F
 8nOKuXJi6C6bdIEVZx9J6SgZdy+6+fWjrM+krNjvo+fIzqPq5rNPkKL8w
 Zvqlgr9JdjMLERuIrYWxFcoDhMkJ0DaemKpShYjK7PZ1xpN9WIry6cfF+
 terA5bkkxHuGYvcKr6RpX+Y35xlu8TSYeoy7+Hmu00NhqEYecMKBeuqoa
 tfQ04nOpF8ZkgPAs22U1tYWREwFix8+KyqK6GNoDUB1VrJhu+1MiJh/hz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220839"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169217"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169217"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:22 -0800
Message-Id: <20230216231724.2246534-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216231724.2246534-1-matthew.d.roper@intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe/mocs: Drop duplicate assignment of
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The DG1 branch needlessly assigns uc_index twice.  Drop the second
instance.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 583e198af88d..696001f60259 100644
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

