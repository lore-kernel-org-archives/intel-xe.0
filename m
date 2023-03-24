Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B75C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 21:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFED10E53E;
	Fri, 24 Mar 2023 21:04:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4A710E55F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679691865; x=1711227865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xfokV17pz+LbM/E/Ky/oGKMMZwWM7ttOe6pwTYk2+8=;
 b=YWkpWxKzq6+7vXuMn9r+JOZEbjLM6DNLyMZUuKgmqEkGo4wSgsocOPXr
 g7MFjift1RxNjJXs+HgH/214eq0JnRdZ11xJOziq5Hp5bTOUcDFPh8WOg
 rlvsTlRCpTDwE1sLFvculqJ4g+QUkLXl3HMrpj5QjaRKi2XBhmFZzBLhP
 wItwIyIiuc9+u/LzZlwXCf3TY+fq0MbGyMaPBBet4KZvBw/cByepLFxGz
 hfVPw0R1SpfmS9k8SLR8niS6hlXlG4FsXL4+zn1DZ0Kbu85pBJmm9Ev9V
 o6QsUQw1OEYd73oWFE0I1vC47Xa4C8HE5G0k73yz3wUT7jVUKQ7ouTHml Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="341456108"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="341456108"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752022855"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; d="scan'208";a="752022855"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 14:04:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Mar 2023 14:04:14 -0700
Message-Id: <20230324210415.2434992-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324210415.2434992-1-matthew.d.roper@intel.com>
References: <20230324210415.2434992-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe/mtl: Fix PAT table coherency settings
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Re-sync our MTL PAT table with the bspec.  1-way coherency should only
be set on table entry 3.  We do not want an incorrect setting here to
accidentally paper over other bugs elsewhere in the driver.

Bspec: 45101
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 142cf11b5914..645eb20aea8e 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -52,8 +52,8 @@ const u32 pvc_pat_table[] = {
 
 const u32 mtl_pat_table[] = {
 	[0] = MTL_PAT_0_WB,
-	[1] = MTL_PAT_1_WT | MTL_2_COH_1W,
-	[2] = MTL_PAT_3_UC | MTL_2_COH_1W,
+	[1] = MTL_PAT_1_WT,
+	[2] = MTL_PAT_3_UC,
 	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
 	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
 };
-- 
2.39.2

