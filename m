Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD91EDE996
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 02:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7035C10E0BB;
	Tue, 10 Sep 2024 02:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajAweV3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477E810E0BB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 02:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725937154; x=1757473154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ESRvQW6kKAsvTd93Uy7K2gBztTHE5j2xYRHJejG20f8=;
 b=ajAweV3Hwe/SqWuK1Kn9Py93+e+83LNy5Msd3A3bX/ADo7a/Rh1EPkmE
 G8jHOYA7Ve7NkG6klNlNJE58tdbJeNyVmUU4iYeIVjks4k4NSQnfQ/1NW
 d8lWMpgzmNX8NawjiFe9o2TUW6upUYINU9/LRakfS9ji7cIx4ZtUZlwAv
 FqXZnnZ/czU1f5Fd88HVp2PWPvIM6u/MZ7N9ReljOkrq85UOLPzVOAU0d
 dJyGvlc0iTodUyyt9dJkyyj2KfH3ojmraHEk/He446BY4jjHby8eRe3Nm
 4sXnEECBu7Iz8da46FAZE2Dqyesif0MdzDE3jg18qjMG0St/6rHDkfA99 Q==;
X-CSE-ConnectionGUID: cxE4y/JOTeO3ef3j9VwqwQ==
X-CSE-MsgGUID: QwyHnS8yRqaOOhqcpnk2wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24479716"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24479716"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 19:59:14 -0700
X-CSE-ConnectionGUID: HJgnG0WGRoCm9YNr7HQuvg==
X-CSE-MsgGUID: dBSk23ETSnOOaOivNJh8UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="66678676"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 19:59:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Insert wmb/sfence before enabling OA
Date: Mon,  9 Sep 2024 19:59:07 -0700
Message-ID: <20240910025907.2667875-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

We are occasionally seeing that OA Buffer register is not programmed (has
value 0) when OA is enabled. This means OA has been enabled before it has
been fully configured. Or, the register write enabling OA has overtaken
previous OA configuration register writes.

Therefore, insert a wmb/sfence to preserve OA register write ordering
before enabling OA.

v2: s/wmb()/xe_device_wmb()/

Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Reported-by: Guy Zadicario <guy.zadicario@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/xe/xe_oa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 63286ed8457fa..4fb7aae37a94f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -440,6 +440,9 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
+	/* Flush previous writes to HW before enabling OA */
+	xe_device_wmb(stream->oa->xe);
+
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
 
-- 
2.41.0

