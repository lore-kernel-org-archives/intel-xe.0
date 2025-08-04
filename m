Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20E3C87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 13:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CAD10E51D;
	Mon,  4 Aug 2025 13:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/6bJLQz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C1310E207
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 13:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754314434; x=1785850434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lFg0UKGRXkbZXVdRziNfRQzvyEvzd5ER+uhZ/JMn+nM=;
 b=F/6bJLQzJJNbczQLf43S732fwS1U48L2DMctwFRYgyOLvCtjEcMMshde
 2jlzELctzsro3sPpfuPtnIM42JlTW1FSC18WQPAe8ZdwvKWp/hIoMHv1Z
 pj8+23l9YqmrmgUYUm5p/XtrBxqZMp4StNkRqqyx+vpriF8PaNEtZfTXv
 I8iQjOLQvL5OVa7I9qOdfpp9iSt+uaMyfd9mKYJEw9VA6h6TPFWOasMsF
 XvXkNRU2llCWrcbAAC7cqc1ot40eMRk97AKc+5D6bBe1emn0XS5jH01ZY
 Dvy5MOs03jXcdnHFn4bmKWJo9nD+61aNnrfKjm9Xd22J+w6X0J/3V+Uea w==;
X-CSE-ConnectionGUID: mVsTMDPPQZG0QjVoHZjR0g==
X-CSE-MsgGUID: ba7oiiQBRA+bbEVpyOSgVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60216934"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="60216934"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 06:33:53 -0700
X-CSE-ConnectionGUID: u6e04fhyTauP1orzd3isrQ==
X-CSE-MsgGUID: V3O3VX85TCCRpCGDAQAHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="168369581"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa003.jf.intel.com with ESMTP; 04 Aug 2025 06:33:52 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com,
	Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] drm/xe: Fix coverity issue, overflow_assign
Date: Mon,  4 Aug 2025 19:15:43 +0530
Message-Id: <20250804134543.3313558-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Safe cast of error code from long to int

Fixes: cda06412c0689 ("drm/xe: Wait for migration job before unmapping pages")

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a72561f987c..a1e82c879f1e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -988,7 +988,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 						     false,
 						     MAX_SCHEDULE_TIMEOUT);
 		if (timeout < 0)
-			ret = timeout;
+			ret = (int)timeout;
 
 		if (IS_VF_CCS_BB_VALID(xe, bo))
 			xe_sriov_vf_ccs_detach_bo(bo);
-- 
2.34.1

