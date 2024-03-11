Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E922BC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5564112C39;
	Mon, 11 Mar 2024 19:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klnwOTQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BDE112C39
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185387; x=1741721387;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=SLAy7xb0kIdLBGA8KH7TIdD31kWZ8RwTKjj2aRORC4Q=;
 b=klnwOTQDMUwzwM6edJEYJab2dd1tR+mscgxfr7ksgl+qq+wfsXmbFmC0
 HLVIRPyeFpIDFV1G0KHMDo68dBmZItcpo8x4LCpcIMc1xjOVNc1inCnul
 pWtgIsdm2i54JZ8cEtlUi3al54wItOD0ZyRCm/qJC8bPY/HkupeLAJnLU
 d1y10qwszgicFVt/RSWwrs2tGFQ/jsnqvEe6p2m5E3v7SbgR/TD93hs6s
 RyITUwH1NojjXhopeLtk3K9DqIALawl0SFaBRxiA/RdKQBlFJyIipnv0d
 e3tdbbfrGobPORhQ2YibZ8bmKt8uI58NsDkIujCAvEOgZ9Pupgyp4+dKG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8627982"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8627982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11346308"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dp46hkhIWG63Va3tq6e3BFicpoti7QGvyRBU+TW0GWud8dQUOLjN3dV8j+c5meyCwQYyqZhjr1eh7aK5ivyfhOJWVYpbf8DPH+x3wBfoVznQy/dm9UVEwMi3k7I04hsvOz/gQWUYlpn5bnCjQdPYlDRllfcIScW3da5JqvyHVhMzhBlkm1VCEWeVY7VRBybyY5kDavZX9EHP4Ohi3K4VYVloFcPjESwjOopzsfr37z3p8GJajG6Ea8knjh/W1eDPrQN3uk0y8iYxHOlXeGrz83L4Dy2NqTK3ukdX2/Kef+IzJDyCnQyxxC7aw80TBwibl6ivg/jt6Jw/6JbyXz69og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbneBIyhKiLdNGjTGM9EQMuGfLWJx4uRR5IX+6rj/ak=;
 b=ceOdpI8+y/TKsGdayfX7fHVlIJQvwNHV4jKJcoGB4lF8oP/Ogl/0gkoaaD5clNyGdhOR4rroa1nthsf2ekhPmurn83xpx7Fpl0PUblCz1Xa6dJD1LsVI5D7dGXr6pOLxnciqgNR52TypTDnN910/ZeOuIoqDQj00vWxDt4iq6Uq0Xqm80urqSGW2n6RaqpMuFpL3sO/MHKdZd63rwxKcBfLXXIehqp4VAVSSo3XfspegPOQF1byw5JHRz/2FSd3G0ILarUCP8nHdfHy6lkBF880YfzsSaBIQzulYc4fSBBLrK959zu1UqENk0wXGLvCabLv346ne3q+HIXPu/n2jGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 11 Mar
 2024 19:29:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:44 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:40 -0400
Resent-Message-ID: <Ze9bpH1C04qPzMky@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 07/11] drm/xe: Convert xe_gem_fault to use direct
 xe_pm_runtime calls
Date: Mon, 11 Mar 2024 15:22:59 -0400
Message-ID: <20240311192303.33961-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8253:EE_|MN0PR11MB6059:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b48200-8e7a-4401-77b9-08dc42019aad
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: a87ce7f1-7623-4674-aa71-08dc4200babe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:28.2695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Weog+BztyzmIGpz6KkJ2dtFSn3mAcKhNzXhO6asu375G0yIt2lXZbQsd17YnOKNgPjdX7TCY5IYUE9d8xoSJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-MS-Exchange-Transport-EndToEndLatency: 00:00:04.3247056
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: 94wYLCKNWACjlSYlv+Kvry67TbT58JQ+kswMKXcs1swHxFWJDuCuP2TWdKyg/PqYzLDB6A/e3DSdgpSIzF4AxzZXvmemVmU5o9/LXaVXtx6rSMF8CVDYTod5Mk9TP0x/qq5rj12vwkbqEa5G0CDhgDRpqOCeua58YJw76gtS+Fqa1wuV94actdJpJ2Lfyt62BMxgyN+gNvBavj+qL0ZM9Xss1ehnv+8hACC+3Z9Q6WUex1zTPjXe10NpCB2Uv3l7jUK0monNz4PzLP66glZ5mEvRtkg0LsaJoiQaeqfBlkcb4XUmbGKbkzjvJKl0omTrWxLm+SG3/RhaQzD0GVTzohMK25GDamiEXdY8+Ha6aDG958PF9fuoRECAuKp37qiFQVRWGpzVafh3XqAwpa6YcJYAhnscEbeFOPrvq/2R+B4/ZHa+0/RqmWZ+DT6JCfUCEelka/DeBDEv6iwNTFY4oFY5XyAld/D8iM89eZgo0zVJSMs4wbT9OHOMuFlCXrjhnBIxqNQGzutlOqDfnm2ehOBtkgSrJ3EJKxpUjjLGCURQ0yOZhwt6cet9Mw9QIVTCGQnj+1SN6peMvMo9G78R9MAj2jvv0GR1oU2M9HHp6nI8jALHk8dnyRMoMQvWfMmzHk0rszJK2Rt3cbb+EtjQbduJ99P+iCybynC/S4336Eo=
X-TUID: MKNceQpE8RI8
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a87ce7f1-7623-4674-aa71-08dc4200babe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FY+5wOMyzL1xOSHqRTw0cjL3f3Jau8uEnDIVfipeMbTGiEZLHYXH6kxF2mPd?=
 =?us-ascii?Q?UMpjIowW2SUn599Pu9Jrff1mkBUlAsB4nbTvzBOEh7gwFbVYYzKDN87mEzLt?=
 =?us-ascii?Q?WgcWFrtF32k1kK5knS/6iKj9/cMOecQ2QtNkB4aM7qQyXlipZXPtnFvkWSOP?=
 =?us-ascii?Q?fGxBltE11rsGVSz1ujnTPbfn84eADtvZ9ulEu/Kp9uXHcemrYfRA7EQ5PaqI?=
 =?us-ascii?Q?barE0qZGjDanYSymBlcPEDIo24KLFy1xpu/t5ONO0fOwp8NnhC2Fj5mqcMrE?=
 =?us-ascii?Q?D+Dz48Yxrb/w2lutsd4Msl4dIZFOV4hXwmh+D6iknv3ZdaHh3/NT1Y005Z+R?=
 =?us-ascii?Q?IXIZlOkU7XgW99s55BlEdewfDQ5HJaVLuaUpGJpuOoeeXpi6LebUS2YdcB8C?=
 =?us-ascii?Q?51Iujo5Y5d6w1Sg0h/Ljad/wUxbC46x1Zdf5SJxsevlFqEoFBt/ooP3KiXQw?=
 =?us-ascii?Q?dMEWkudybqGH4fi6yIwVGQ5MyUuEKr816e6FDNrcS/zjNuqiGwTNBBmOxM0L?=
 =?us-ascii?Q?BQsPcAEeVpdARsN227XuWFo4f4A+i7fFbCOCWRwoLJAgat3IPKcgoIVj63Ty?=
 =?us-ascii?Q?nUdyhYXWV5BU4BtNVlaR6ihAPd7BgMBHvtqeIQGPIPEh+aQeqOnwvke1+SrC?=
 =?us-ascii?Q?H6hxZBiBqIsZJk5g/h7218e762qXgpaD84Zcerg53QTQcPRSRJZoOZp7vHql?=
 =?us-ascii?Q?mJEukQWFCJ5Ua8QywKI/g5DCCXcNo7mzdbLz2mYfuouCw5ZlV6UJ+tOp+FVk?=
 =?us-ascii?Q?SN9q7ft7xGXLq9LqiKBy5QtV1w0PdnnEsM9NSN+M7S4wXpKakzTbmSctBDjH?=
 =?us-ascii?Q?b0zUAZvWYHyjK0OZ2CLdr8tuwFHTKEFJuSQpioqldikfQfGv9iMMqP2jwLzK?=
 =?us-ascii?Q?sobspYYISHjsp7s299eMLHtiq1GxtQ0lumQhgOBvX7wuDPJEjcsN9/WjZJ9F?=
 =?us-ascii?Q?iTwWGJ2LyHwu5RLRcuWM7MTbTZPKxUBDUegfL4CrDsQGm6uvObXEcm5N1tnH?=
 =?us-ascii?Q?CSzgW2VL1AagqC1d1SkkToF3N8Y39nnBtRNdvscP8vXDUMyNJPOGTe7UeeN3?=
 =?us-ascii?Q?AI46RyAxiRIDV6r2mhldEPBg/jAst6jzUAB+NhdRIEe94C6IhZk3PhVy1PaK?=
 =?us-ascii?Q?QnWMx1+KkQYs+TtXoD4YBNrD87gSTMrl2a4WJ96NCKtODktYusxiKfxQfL6p?=
 =?us-ascii?Q?DVTSwTHpLqQQACXCUPbRtAuSC6bRffbGSAraM8MhH+8XBZZejiA0+jkMiNar?=
 =?us-ascii?Q?M6xBDzVw74S81EySxZ6eWN/g+QqNVpwi1Y1OGih8xJN5nmP5p3E0ewnz6ul1?=
 =?us-ascii?Q?ld6xndJbxPzx6pv/TH+slUP7o3012GGw/Me0o+W5Pt2OKVIbkDmgvdV0lBRZ?=
 =?us-ascii?Q?rjad4Lk4+5Egad5oZhOI48LDKCURqzUZI1tMajWhPXfBV4Y016glXTVmBmf8?=
 =?us-ascii?Q?AzpRC1XIp1ZYGQPyEBa7LRqioYUxImzVITmdArJsq6ao30GNlUfyY3EyNdY5?=
 =?us-ascii?Q?HXt1AR/FjUENpKD1MZd7flKmjb4O2aOsn+eRHrKLmiVKUiFLt9A1GuyiKYW0?=
 =?us-ascii?Q?0gS2s1PnBDhR1D65i9Ae/ar7XzUVUxmj2/zqsaU99wRU+riUrzAlnSje6jT6?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b48200-8e7a-4401-77b9-08dc42019aad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:43.9646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEm/jVT3LUM1BsdYw35Tc5ZRiUskvZiUM/NlBuhtR1nYuYDMy0HHML0+EUbiIXusXAUI4p6rZMnBON78/D7Szg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..bc0cc5edc533 100644
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
@@ -1136,7 +1137,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	int idx, r = 0;
 
 	if (needs_rpm)
-		xe_device_mem_access_get(xe);
+		xe_pm_runtime_get(xe);
 
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
@@ -1176,7 +1177,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 
 	return ret;
 }
-- 
2.44.0

