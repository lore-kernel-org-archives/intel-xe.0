Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8ECC5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390BE112448;
	Mon,  4 Mar 2024 18:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTCfgtsz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5ED112448
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709576527; x=1741112527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IltFPNAyMqtKCMwaU24g7o8/V0C689xDjNlxPmTW0RQ=;
 b=JTCfgtszfsHgPpp3Ezze3KtwBMUZueAeOQEUplwBjFlG4rijRCoS563O
 OECfatkytbXCARvoYZL8Ysz7CYzaFwVw1Hwg4Pi+7k1wE5SMdUIOP1IyM
 kKHQq14yGuH4BJVYgGA38bNIaEMAqkXTCFdtmb1QeOeX/IKqhYA4vZOkr
 QmW08GCLp7+yBzq+JPbWugkvrYpdTGdMeCDg1ek87SGpAdSYX8DJBMDIr
 j96p/4cc3bcMEiRm6OVsx4r5lz7Rx1MZUDZcl/+QdJ2P/+2R/xjyR5abn
 eEkx2KpSFTKE3Dot4XpaDW++FDdvRsWh0MQT0quJFGpno8JuJmTRcH1gp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21623953"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; d="scan'208";a="21623953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 10:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="8936097"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 10:22:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 10:22:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 10:22:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3aj5+PqiIFfFFFSs132S22IIX0ipBqDQ8gdJ2o8P6bI11OaU5fbLSs2eYdMAJDZoFN8DSuu7UE1Qg5hD82WV/pcCnkGT1LFtHmkFjc+KMluCkP1geRX2AU8K1EyWtSNz5E4eZedfkPGUtVJ5TaesW5zwH89YEF2kiWl7QaqbAmmH9hHrXq1pKzSZhRBcRBveP4tdVdevpOJ67bBzUC/nhQcaTS1yIu6Ic088nyyTOCvLP0DBxW9/xAhIR3zBLW3zuGgYpRqtubT06rkvagONDJgkSLkC8l17DT0iFrbyecK7Hr42bToTwULD+AiAHl5gcqp1vETAJHo+3PQ7PrubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8NvMLLzgQEYQ1ItpSW/8wvqU3vS854Wc2dOJzWWeBE=;
 b=m1dnayGcxU6hAoFjz9iAoe5ZE2itMzO8x7z/DJW+0MGB3aTS9AYwris7iH+CZOA+J1e0P8uHcG7DCuuwcM9D54WMm2yUI+G1RAaVLfO1AXiZQXPTNYlzmHP7ags9ubphuVor4MLQZZjTGQh8Hfq9v43XIFvwLJDBp/qgq9jDz7hlN7rMs5ZnYhD/YKSCEICiDQuaPHucr6oFBuUokX8PKIDsp+yC2i6912fE1xnBBuS9PDpaf1UYRYAFqOH+LnuBV9wecMgQSxkDDxorKJkjNaTVJHB6mSvwcu/6wPmHW/dcdYn4hirzf1Dxaoj4sGEQlKiyJEvI3T9YM3fELSeqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 18:22:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 18:22:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/9] drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime
 calls
Date: Mon, 4 Mar 2024 13:21:47 -0500
Message-ID: <20240304182154.42611-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:180::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5133:EE_
X-MS-Office365-Filtering-Correlation-Id: d88a5fbe-79f3-40ee-8cd7-08dc3c77fd65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /gSIB7sDbCXc02fAVUiSt8ajGVxyRyN3DBi1pXV0TXy/ANhcG+gQUwJ//WHcy2FALO7vauVHYyG1fiQqAVxWnerGMzrahkyDKx5lTkSJ1cv90c1J0GZ1CDgoe4D34bPPSclYX2agM9siyqMFcVq2EujPdoP1ambG+3/WiFV7lZYCNdGacO74EF8mShCXO312G4IKI+e1TpWyViNmsG0GoY4z0eT+UBvoHY3HPh40WH8KlqnuL76PErvUI8A44clBBUNmf3BdqGGcprXwmA5CGRC8iSnBBQTw3Pfi1dG8lm4haIT1mDkpVKOYpVkXNaC8SXG0Zc5c2xsQRKj1P5RUq7TNNw2HUUBB0EsTv4nmCB4y8sKrP4Rwj6HocLv25lPNNLJ+xv0x+JvB8Qjjf+QBo4fSIzUW7ZzNC4etpwvdoNKaupLKjgZDddKV0RZ5wxjeCLGl/nMjFwVXNAij9NYAROP6zorci6Cj1SSDer05GrIgnFOIZDpbynH52cpxKCCiUuZNJn75eZs/5d1leoxs9H0wdrIZKKRejLxsJUqYFRfDf08P1sQS11ogAQLdQIfuNwFp7vxzERNsFeWwBdVqKvn/65ngDSBmX0ioybZXgqOHJQihdpH7oS4sD4vQKTQZc8SU09MQZOBZbRcr3kk/Q5tMuQZW6lXpTqDDkgRzVdk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ng+XdJKpMb2qsQ462/p0IUym07z60IfXrgIABW/O9+YXFtWP3CNloWgmwevT?=
 =?us-ascii?Q?2rhXZ5S/MRpXJrHPARnF9pUsnJZPuEWp+hO5iiTQ4XQ1p+WZ0df4d61Axvds?=
 =?us-ascii?Q?UNx210DFtoi/P29DwdoQm6mf47FFhJ1bEhAaW9HsWcBAz3ryuJYtlpoUTqZ7?=
 =?us-ascii?Q?gilPNOE62PuOC/lEMQIfKOYaabPNT5N+x4U2oEfOeT+Hlu0s/CWKCQkD7KC3?=
 =?us-ascii?Q?o4gDYyZSRurJVAIS7ifQ0Rsri8Tu/WjCnh4TzLio+rpJQ8g2+0lngcQCm2Cy?=
 =?us-ascii?Q?1BBGX391lqer/iabmA8ItTzCpfyMjRFRYF8+XmPga41oXnnMqvMXAAWWB2A8?=
 =?us-ascii?Q?r/xY6AMgfs0oobmhlW/uw9UeJZ5012RKJJQZMzdvPFCvrl4uBQaeWVmEu/Gr?=
 =?us-ascii?Q?CdKQZNwLqZe5XS0mQSdCZ2cO+yloC9M5vX6m+Z3R9JmZ7fLFEcziaOg7ojib?=
 =?us-ascii?Q?aFNX9DRheZsc95Pzi/PY3bHQhmWlz6LRBRubTrvDVUaFKX464q+Py9S3LJfN?=
 =?us-ascii?Q?Jy6O0+lSuuNLk1HJADgq3fJ4h+dNaB6tZ4jat5SE+sejNi7lPz4fuOh7kquk?=
 =?us-ascii?Q?gCijStG/nc2ZrF1cBbqsQ5+nRTACLjh2K15QEK4nIZ1MRCH2jv9ayxB62o3g?=
 =?us-ascii?Q?pDptQWx2mXMKoBnwT0hH4/mhdsl76trFgkKqPBmznC+gi6fLhLf6ydWbEiR0?=
 =?us-ascii?Q?tLkMD88yV2HJ6sP3Xf4XaBtEhQtqH9blnEgt5cGg4oI5fEe6EdYGPs5seOIg?=
 =?us-ascii?Q?o0ZsffE28orx36SkuKkv2u7O3KnO3byLyNz9w1t0he9xgt/SXMrj3pvn6Hjt?=
 =?us-ascii?Q?JaBOZtm0uNliLMSA+9v/cLn4e0P532zQj5WzqmPdHyNTzK2I+E2PD1DYGBaT?=
 =?us-ascii?Q?CkCnhN6+tFYsCDjIM0qSRU3XVJNiSKFnUzOgxoHnIVcPvYxDA690mSrijTLH?=
 =?us-ascii?Q?b6Vh0LzoOjsnWdmslDubYQBdk55K6Nrf0icryS64BdEASVCFn4L4EVumWtgF?=
 =?us-ascii?Q?8mRafMv467jyXkXmFmwFaBMJt7Z+fS173pDUoIGlRnJ8ME6mkyKA8yAJIdqQ?=
 =?us-ascii?Q?mIwj1FUqkIYYwnv8ateJz5t802Ysidjzh/J89IW/jjteQsjVLXMRV6Wsh+II?=
 =?us-ascii?Q?q63opfdUERl0JsGh+EcCUug6XTNNcpJVe6o8a43GIKDuK2evjOs55Qb3IL+q?=
 =?us-ascii?Q?WiE1F8ZfQpZDEmEWoV6twj9UQnCE00EGoIe+ra11BAWAT7pVJEXCV5U2ofzm?=
 =?us-ascii?Q?DsSyQhEQS22obpwL/cUBLDKiPu0o3p7ibjec9476Nt5Yz2vsXE81SpNMfPrJ?=
 =?us-ascii?Q?Xpx1Eyc1BueVDXGNOQlqmuPWuKoAvNNl4yxOegU7SFWEQ2XGdyUcQ5NrFPXS?=
 =?us-ascii?Q?VLQ0j9SdFD5ewiQzCUdXIhSAQC8fh9JZ1JJ3KKmjdOxR+SqteUBVrovTFuPh?=
 =?us-ascii?Q?DowV1Nya3DVOcH2wwdnVJYcQfT5iZdeqIFVRkk18/STFlKqwILBZwR7jiu0O?=
 =?us-ascii?Q?0OPR9HMoomswzWgCO3i/WuxROzhnk5/isPuwqGwc03kzdERT+pOEWW8OLPBv?=
 =?us-ascii?Q?U83d+K5mktxLBGEboGrlMT9br30dqmNavQu5iS79?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d88a5fbe-79f3-40ee-8cd7-08dc3c77fd65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 18:22:03.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5HFcwXKsHOf7Kesxarvc2t/iCv4BzuZV2DzkaSZ5va/jw6m5VjY6hKxLz+ykgaB4WT3e5XNIoCKMR60BTRCNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com
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

The gem page fault is one of the outer bound protections where
we want to ensure that the hardware is in D0 before proceeding
with memory access. Let's convert it towards the xe_pm_runtime
functions directly so we can then convert the mem_access to be
inner protection only and then Kill it for good.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6603a0ea79c5..def68528cd40 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
@@ -1144,7 +1145,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx, r = 0;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1184,7 +1185,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.43.2

