Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCECC636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 23:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE24A10E390;
	Thu, 16 Feb 2023 23:17:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292F10E39B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676589459; x=1708125459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/F5UzVA3v9kGN10KCvZzepFE4E+BFaoIE9GWaoQs1c0=;
 b=P3XVXbHRp6w6XQjpToQbWQEM1E0PihLgn/7QqO0TNivBom9EqzFU3MNX
 8FjO7fB6+GVMyF2+Y/UZkJI/CHvBt4kWsgfxkK7WgBlgXOETAph1euGuq
 xqxzsCytY8IhZZH8ylTIwaT0ZKPCG865gYu6NQeRRZM7Vxq+GIHvkniCN
 aibTDv9PVxJuHjwJJv398+MbBfJMDOJ8RKHJbvUC+Jdle2Saw+RS95Fdi
 Dw4egDc+nUF0SM9DPlVvnRecpFEqfH7pQoL21heK5G25oHToK+BHYS//N
 d8P0mpuHEpxYH3A9U74Ie0BikDilgo2G6MENdG5e8jkM+oGUPicZ4c4vJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333220833"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="333220833"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813169209"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813169209"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 15:17:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 15:17:20 -0800
Message-Id: <20230216231724.2246534-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216231724.2246534-1-matthew.d.roper@intel.com>
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe/mocs: Add missing RKL handling
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

RKL should use the same "gen12" MOCS handling as TGL/ADL-S/ADL-P.

Bspec: 45101
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 09adb69d1545..ec89ff3ac29b 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -381,6 +381,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 		info->unused_entries_index = 5;
 		break;
 	case XE_TIGERLAKE:
+	case XE_ROCKETLAKE:
 	case XE_ALDERLAKE_S:
 	case XE_ALDERLAKE_P:
 		info->size  = ARRAY_SIZE(gen12_mocs_desc);
-- 
2.39.1

