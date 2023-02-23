Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFC5C636D7
	for <intel-xe@archiver.kernel.org>; Thu, 23 Feb 2023 18:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF3F10E04C;
	Thu, 23 Feb 2023 18:57:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7E310E04C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Feb 2023 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677178673; x=1708714673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jwW/pHPt7Cgsd9VCtTNCDDT/LL6SWxPWS/8PFD3MLAA=;
 b=JfT/6cmxwoBw4oBf66aFQmTWOcRbv6EJVdDU/jP4FIWDoUMKHa63vMdo
 i18v+l5rjdD+kA/hHuAN1/pU7eZg11RFQbq1OJECdrQjLvFc6Kyvhsrwu
 CMCjeSQkLFs9vn5HSbGjrKuGDTkpR8JDIGHa+j7w4C6hTvNxNHr9xQm/1
 O7BhB0Emwwu5wqHZXiYlfsMhFHYfFA3KbZey5pVGtGwdJws7488KORiMe
 9qMOOgvKznipIK6WUIwxtgFLRRUifRUdphMk48PDBedqX89Iff6QAJFsT
 ZL+iiSTpDAln2SkCp1i5jT2HOt15EDcURJoOxjAKe2FtB7MadDz+t9WDl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="360793751"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="360793751"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="782018604"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="782018604"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:57:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Feb 2023 10:57:35 -0800
Message-Id: <20230223185740.3356127-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223185740.3356127-1-matthew.d.roper@intel.com>
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/7] drm/xe/mocs: Add missing RKL handling
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

RKL should use the same "gen12" MOCS handling as TGL/ADL-S/ADL-P.

Bspec: 45101
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

