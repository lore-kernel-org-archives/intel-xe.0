Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C434D597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5DA10E670;
	Tue, 12 Nov 2024 21:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNr3Cu/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928A510E1D0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448522; x=1762984522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iwGvDQ0EjcZ2EBDchc/dTr/K4/+yNR3VJHivPTY2KSI=;
 b=LNr3Cu/JBUZLG2trviy9q2tUYPqWJOuYE42dm8kl6qwogQQfijrLWPUZ
 9WTSnXt8C7KFpV3NuvlhgYCYb5rCgNgTRWRyduE6rOdEzKlc9QccNmYeU
 UzhvoYOI0HdzEeLX+7IQo5Y/rVuvTEMAbPJlKL0tkzkMjKBtS7bWDUmRB
 1aoEd/3ercxMVrrTCMpZGTrdEAdUS2QRIOvAbnDODsqfrpYJWEYTjcekm
 FBLQXZn1Issyq+6w/38u9tvlVvOhS91FNHcXCF3DYYCi6SMiShIkNsISa
 X9oNXbXwtKRpgvJVSEmsWlMhD3wCHAybxq+JoHpZbqZoPrljhQ6AKT6GB g==;
X-CSE-ConnectionGUID: xYTO9hi+RbiYJ/JJA+c0FA==
X-CSE-MsgGUID: eTaVeDecSdq4MPjlB++LUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31190108"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31190108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:22 -0800
X-CSE-ConnectionGUID: AaMDsDvRRzeRpClNXpn4WA==
X-CSE-MsgGUID: zvqZOBL1RtmUcqi3Xa4oBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88050233"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:55:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/xe: Remove redundant rebind from preempt rebind
 worker
Date: Tue, 12 Nov 2024 13:55:48 -0800
Message-Id: <20241112215553.1369146-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112215553.1369146-1-matthew.brost@intel.com>
References: <20241112215553.1369146-1-matthew.brost@intel.com>
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

We issue a rebind in xe_preempt_work_begin so no need to call
xe_vm_rebind again in the preempt rebind worker.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 624133fae5f5..756c72cd6048 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -525,10 +525,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	err = xe_vm_rebind(vm, true);
-	if (err)
-		goto out_unlock;
-
 	/* Wait on rebinds and munmap style VM unbinds */
 	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
-- 
2.34.1

