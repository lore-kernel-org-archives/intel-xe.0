Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC63C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 23:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058DE10EA27;
	Thu, 16 Jan 2025 23:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnTt8bU5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D80710E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737068862; x=1768604862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V6aklTnNRjyy3hx1cVBJla1fNTKIoJtFZGS5jbt8x98=;
 b=YnTt8bU5gK+2Xeepamwp7xEsi+1Kk220iNapj0fTRlXTe2lHmtWd3Xel
 aTYkgNm95/L5sxUXjxH2U9hsxuvuVqTzenhPP5efb4IZ0qg1B+LY3UzDZ
 yRjr08JBX4BnzUll1JSfbIoAT1cV2M+BGhPVll6WYrx7oau5/yprm3WlD
 OK4WxvhE/M1D7WVsS/qYA3Ix6wGoj9QHxdRNuGSu9IUWDBHvZOerRFvUV
 ywQjHorZpyDTxSvGzoRqQVkNx697dZz8Z1OrOEJAkyjz4AFU57bmpbwJA
 ionc19XBX5aU3liWkWC38enzKyX4IHCog6223/o65gOdj1DQquz0HswOT A==;
X-CSE-ConnectionGUID: lvmd6eF2R3qY0Fsy3nICeQ==
X-CSE-MsgGUID: dW4phsPsTaePZ+x9fDe/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37364120"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37364120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
X-CSE-ConnectionGUID: Lfj59kN+T3WCCs33KtJ65g==
X-CSE-MsgGUID: ZIa//T25QXCZN/LxLGRpkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="136474351"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 15:07:41 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v13 3/7] drm/xe/pmu: Assert max gt
Date: Thu, 16 Jan 2025 15:07:14 -0800
Message-ID: <20250116230718.82460-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250116230718.82460-1-lucas.demarchi@intel.com>
References: <20250116230718.82460-1-lucas.demarchi@intel.com>
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

XE_PMU_MAX_GT needs to be used due to a circular dependency, but we
should make sure it doesn't go out of sync with XE_PMU_MAX_GT. Add a
compile check for that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b63f819c54d02..2312c73a3ee16 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -258,6 +258,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	int ret = -ENOMEM;
 	char *name;
 
+	BUILD_BUG_ON(XE_MAX_GT_PER_TILE != XE_PMU_MAX_GT);
+
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-- 
2.48.0

