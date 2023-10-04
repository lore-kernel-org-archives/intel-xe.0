Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA433E8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E006E10E344;
	Wed,  4 Oct 2023 03:10:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8015310E32F;
 Wed,  4 Oct 2023 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389007; x=1727925007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0ISvgGixhx2vOSRKzodHD308NirFPfZETPsC46FfIk=;
 b=YF8M8MRy8KLajrfJiX9v9JMg9rgTlV5v4i4HCTKMlYkySMiQxw1jouIk
 KwYs3DJ7+6pTUNihCod7a8WBnHA50YOt7EIdhUVfp4IiuWbeLDojh1msC
 igJJzxMizeW5O/IQ7Wa0IhT7hbj66l9wzPetRkwadUQ1xXcM5jRD56lhg
 2+fjbjB8+utkmpjnGJoWlhuXKdSxJoyUyX94lOCG+1D/00I/eqj5zOx40
 IWom4W66oUSTV8nK2elHT3YarS71nnWiNG2/JnPAsbMAYU38H5FX9w+Gt
 pEj1hm3+v6vXsN762S/k1uVuY8ldO/W787zJ5Gyw1LC295dlgJmQ4nb0k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308409"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760414"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760414"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:20 -0700
Message-Id: <20231004031023.3444455-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 10/13] lib/intel_mocs: Remove unused
 lefotver defines
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Leftover from previous refactors. Remove since they are unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_mocs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index d9de16932..aafe27692 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -16,8 +16,6 @@
 #define GEN12_MOCS_WB_IDX			2
 #define XE2_MOCS_UC_IDX				3
 #define XE2_MOCS_WB_IDX				1
-#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
-#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
-- 
2.40.1

