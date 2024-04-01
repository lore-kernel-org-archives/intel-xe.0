Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427CCD129B
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31F810F1D3;
	Mon,  1 Apr 2024 14:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfM/HQcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9240B10F1D3;
 Mon,  1 Apr 2024 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711982132; x=1743518132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wuui56U+4qb34tThVfqkOE82wWTvV0OU+lltr/EdjrI=;
 b=FfM/HQcXhjLQkT1uKnc7baw7gIFPSTGP/2OiVOSKKYP5AKOOPzUeGSy/
 lafkvTYnyZ/lDRjoID8MK4+7XVj5wFq9VBtgSyPadtZ32l0Z/4N5FuQVg
 vUPPfRHUxldKoEwTaEboa5Me3EdS9bG+0p0vYggZMP5sr9YeDk4+kiKUd
 PKqmLVN37faUjkp4RRdt96ojKFAZjwUO4GVRu78NU0z0NRRJKEbMH8Pbl
 S3AyDADh8VKuj4WE67fe+JH7y1zgk2jzgrbqcRl0ariCjpk9fYpxrDGq7
 AcP2HOzkYbDDNoS0u8jBzT+90LIN9m7xiroLugxAMLsy9dPxAsF8z68rZ A==;
X-CSE-ConnectionGUID: LKGyOLfsT5+KLFreYxKSPg==
X-CSE-MsgGUID: WWp1+zyIRZa/CnznsKP4gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17679885"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17679885"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 07:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="55199640"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 01 Apr 2024 07:35:31 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for legacy
 mode
Date: Mon,  1 Apr 2024 20:18:34 +0530
Message-Id: <20240401144834.577481-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

RCS/CCS are dependent engines as they are sharing reset
domain. Whenever there is reset from CCS, all the exec queues
running on RCS are victimised.

Lets skip parallel execution on CCS with RCS.

Fixes: VLK-55941, VLK-52341
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_exec_threads.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e9588f9b9..b1c65e1c5 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -996,6 +996,14 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		/* RCS/CCS sharing reset domain hence dependent engines.
+		 * When CCS is doing reset, all the contexts of RCS are
+		 * victimised, so skip the compute engine avoiding
+		 * parallel execution with RCS
+		 */
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
-- 
2.25.1

