Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42346C54791
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25D510E9B7;
	Thu, 22 Feb 2024 16:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSTkIy/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2A410E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620029; x=1740156029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xk721JfpgXFhg9IEAvy2xWuRR83XCmK3IJ+RBZ1Kd/Q=;
 b=RSTkIy/xxoDW3/vpwx4ev0l2XMRnMFXKvET7oYRWft4KrQv+7nPiOkJR
 oolAQeiIPgn6XNWHCIPrbEX2bEU2Sm4OQyPXk6fCrz2TVy4FplSR9+aLs
 gYcaeb/OPKW+1FWyl281pkKl1uIjHO4nr7lvjvzIT+y1nTO4JuhjtTt6X
 xjQkP96cEWyj+iQhnEXwRIKzb8890kA7WToQC9Jod5VhgjV9jAhFnVuwC
 6z9uGlzKdg1LEC91Tx8/wsW3VoCefSSdW3jOYZw+FtMCQFFMHdOnWcSJ0
 oz2xNnV0wUM/OlZB0oj/c0R9VQBHZ9FI7f5OttCiwEZNTBAD3ilmkd2ld g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2730724"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2730724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913553023"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="913553023"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:27 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiDQAorbGViXU969uOTylVbBj0/MnK4LImqvl2NlLI2dRq4IRBaQyVw17eeBrsyM4gBaCOFNt0JsoYG1VAS4m87NtWMvMFEVjbJwgT3DVMlfsWBf1jCD0EFzaYgAjRZL+7bvULkPnSDU567kskqaNsX1Xt4p7pMKsjwcFKhD87Fb/x3MGuoHMBoZZdFR5x5tlh+NqNSyXg37BV8g93GDizEIO9tEsXSqEvrJy5ktyNNYOT0dpBjkO66cekqndOLt7SckSh84NVGSX131aRbDx95j2ALsNrUO1XVAHduAtCsGPcjjMJawMcDv0zKlvvoy9Z1rLg2pfpd1z81KgXSmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMttqykXjukwDwHwVomtJAeu6T2jq/btO6iVxWdbOU0=;
 b=SAWd9swkUkf59xGYP4CIVM8/40yM21Yk6WbW6QjHkAJzen3C3jB7CuEopl7RYodvcjUunDFOUWGbSsHZp2NR5NtrW6gWFhB5WHwXKGrtC4ZQhdJkYzIpFb+Wf0giMF/sBxZgKg4xNs5yyrtCzlc5J6rgQ6fY7gtDGHI8A4iaUe6x6sr64rTkGWK0h0VKKrWbPsWW8Chx5a87DAhHlBwchT7Sg3m2KhWlUqHWMQkMiEl0YSRUWFuyNi/J3xe+eGiZRDikmA9N4OfVSf+/LNtwffLWMAYm3//1ZUtTmENL+t6ag8Yat/P0wS/54Ki2J3JD6UoYXZz5CbK4M7dPV9WWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 12/14] drm/xe: Remove mem_access from suspend and resume
 functions
Date: Thu, 22 Feb 2024 11:39:35 -0500
Message-ID: <20240222163937.138342-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: d50f831c-0709-46a2-fe17-08dc33c4f519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okpPlJGpBnzQLbvJLWZbyKamOVMkmzvrAEEChRUIT3stn3tM/FTBUFJE6YdDcTV13NhqmmdPp2ZmW/qj8joMDLqfUCYe60nrH6787thSl+lap8oa0YNrJhIRPS8milfRZpZXOTRi2GZfwdJ1SnwcWtOn2WZ9p1S+BUjCWQEV74Jjybd6VDdiETofGeE0siYfoAaq0vi17J9Y9/rOoB04RjThSUB7dL3i15dHbV/O9uIzB9Tzc92PzZ9f3GvM8mYf5W2WaqmFDbeXd27yYnPG+YT0RNTLBADNp1PPU8ZFctyV6DEKXELHi1snDlamYtc+dJd5wgVI/8XEj/kPrSF2IUG4gV/lwRiD+V2qcxAezto1DhKN2cPCBFqyyDxjFlw3AHjUyaCLlNVtq78NDpVnXRaBjDwGVMG3RLuQpOpPRPs8kqRcBPgUslh0//C0jtS7JzdyUwP/QPqCXFy2PFickyMFMjeiJicLzghhG5JeW5/B0Tu7Ne8OddIX6Hy9d/aIhHw6Jl3as2/h2UPdP7UH6zTknUj2xfihADS5/kM9EHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4Zn94W/DCtBGfyu68hr+xPP5z4N6N90bKWqri9B0RIJHEv+msV2O1uL0NTc?=
 =?us-ascii?Q?XsXBw2nmoES18BdsUyaBy4lJ8kDcF0zkmtm+wNSnwUSaqxxGcmNGacWTOw87?=
 =?us-ascii?Q?cGkhiq4/fckPCEbY8E8ue9Kz7wiZ0p9FQSeDBzlsLOerU3ZK/QXNtYuRw2cI?=
 =?us-ascii?Q?KawQGN92LCca8Mgl1mJZPo28Ocnysz0jFGpzTSzpmpjacz08ooJb2gGtyfEp?=
 =?us-ascii?Q?UmuQT/LkGLexBYHrN4lI4dU9U+Qlas0JCMNY/01MHcC4OBJ7CtA1YI69RvwA?=
 =?us-ascii?Q?wA/NL770+HOAZtykgY2ZLxT7nVxTohZiS6kOJ4JTK9x0TdKkqka54TZ16Hvn?=
 =?us-ascii?Q?60Oi6gvtEKD5Q6Z+e3BHmQ3AWDDp0y5DNuRd/7IAU+B3bo49E28tSTCBxJ9F?=
 =?us-ascii?Q?KfwO23il1X4kPcej6XBFPiNo2ivcfcod12Th3cLkFPcXdL2OY55+0Ruf3wGu?=
 =?us-ascii?Q?Rpz4fJqYqYbg0ksgbIMWzQxrwy16Cocj5iwBjPeTezeg1vPOKJP3g+QFAQ0c?=
 =?us-ascii?Q?DA716T2grcqUJzTcSe2hsnt0qMvgz70gQc6qp9NX+jG8cnhJwH4p8dlSp7uG?=
 =?us-ascii?Q?pG0lCDE33AST+RCANsFOy5mkaMCJ8P17A9499VS014PFtMIw85rAD4Tnl8sk?=
 =?us-ascii?Q?j0JV1dmgS8XJxRAL090oI27VyfPMRXfGo39Yze+oNQ8cSntkydsJjvsST4QG?=
 =?us-ascii?Q?c3Z26K7FE/Amgw6ZpbsFswPpryeMdV8SdDFtj7c6R9pY1UI1mOS6ckxFDXID?=
 =?us-ascii?Q?Bq7L1q2sUFbpjPVfDZERiueeij7wdANjjZfiyGVeW2lpuUWHEPebbj7OA4Uz?=
 =?us-ascii?Q?tRc1daS22TMlWI/SgUpgyR+dtt6qJc3Qnnu+Kh5s2ssilhbY2WjAcbuYaqPI?=
 =?us-ascii?Q?qxr9eS5bBMr4lgigFMg+p5KUHuDzH3YbK9+HvNM7q7m+mBQcSUx41oKiSsXC?=
 =?us-ascii?Q?KDXkp7ahY1DEmNF93yHTM33uy8CH5xKHn6+2rigSl3M15gAtIzOhEtq7HOz1?=
 =?us-ascii?Q?JQOxlvtjJ76dNtssZE1G4N4meJmzuZyvDPtaDQhAxfSSVCO5T/QfuPu4yKL1?=
 =?us-ascii?Q?Bxna2tHXt8lxlPgXcOqT9GGJiXqTnQ25j2Euf7R0w7D5bgSekDx3TXdLhZ/1?=
 =?us-ascii?Q?L2GfndjtnW1/bV/LR/T445xqDM7nGIWZRabEufZmSCtXQsQFhRWPX1I4bdvk?=
 =?us-ascii?Q?DFoS3ADrZ5SY1TdWGjqBfdFg7UgdzYPf8KAa5V2BbWtlsP8JmDyuQbzfPCFU?=
 =?us-ascii?Q?0PV/zqYa6iexyXo2ciBmwPunpPpLzhHsHF+jYnDdpMENZ1Bgwtz2xML0KDmo?=
 =?us-ascii?Q?VFOocbGKuev2a3vfyiAbzkMokSpGET1ZT+VrInCXWAYSgeX3FCvz8k7g1iLs?=
 =?us-ascii?Q?8Ua8v+o+L4J/rZ0pTbKkPjqA5QrNPMa64qi4vKc0UZmYh1+AztPv6l8uK/Ad?=
 =?us-ascii?Q?nGjdFbKF4dSwJql6RWRxPqVHiRyVbosTanqthrxLyeFvGJEPufEyPaE3uyOE?=
 =?us-ascii?Q?BHzYsVRCujNLL6t/CODEPJ5WQc550S8IORqMFO7+JGNPcUbDxzdqDpHF42qY?=
 =?us-ascii?Q?HpYtMNzSyYyQoLwZOFM1Ii9l2fjXmzLp6Iq44+aJauKJdqva+bl9QIdGeVoP?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d50f831c-0709-46a2-fe17-08dc33c4f519
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:20.0315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ffCeW1HotKxw4ky0f40mDCh5kUGgHtmF96tfWVBZk1jvxmNhGR+lPzKRSs9VXYnDZJMGZJVn8aexL/0zKGqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

At these points, we are sure that device is awake in D0.
Likely in the middle of the transition, but awake. So,
these extra protections are useless. Let's remove it and
continue with the killing of xe_device_mem_access.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b75f0bf0a9a1..e0c79351a131 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -711,13 +711,11 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	xe_device_mem_access_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
 int xe_gt_suspend(struct xe_gt *gt)
@@ -726,7 +724,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_gt_sanitize(gt);
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -736,7 +733,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
@@ -744,7 +740,6 @@ int xe_gt_suspend(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
@@ -754,7 +749,6 @@ int xe_gt_resume(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
@@ -764,7 +758,6 @@ int xe_gt_resume(struct xe_gt *gt)
 		goto err_force_wake;
 
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
@@ -772,7 +765,6 @@ int xe_gt_resume(struct xe_gt *gt)
 err_force_wake:
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
-- 
2.43.2

