Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF9AC67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 11:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86DD11247B;
	Mon,  8 Apr 2024 11:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljMFha5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591EE112477
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712575184; x=1744111184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=klyP+jTT0eCXzQtEQDLT9ZEEf80GpilBFInN2nzGNh4=;
 b=ljMFha5cv/qR5g1vpHY422WsPcRJAZ8f0z8U0aIiFTNazDzpiPEedhfA
 MBa8HhPi0HHP2000r1jrOjM0pQZzp603sc9/yR/MvyjO7dov3db9B3c9I
 ROXGQg05h7sF/fmDgiC8hNZUL7UbGGfbZf9+VATgTNAM/dYoEv4IXZZVY
 NJAPBaBYioZtH4JbqaCnMBDs/GckqQ7LVv1vipzcQDOpbJ1/mseXlU2ND
 CeyxqqISag6+FkPv5YKLEPFHD+CgpHqlGl//yWAinAL3a1W+JUjI1DEyG
 hm6GJXdu2enxKV3eiMAsuMuBcIcNdXXz+ZB9bQeG8RqSKvqnF3K39k2F6 Q==;
X-CSE-ConnectionGUID: 3sKHiJYXSneSGbLm5s5Ozw==
X-CSE-MsgGUID: SwI9w/EHSwmFJo+Kx92mUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18988783"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18988783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 04:19:44 -0700
X-CSE-ConnectionGUID: JfmEU5r/QFawn6p6SGBdzQ==
X-CSE-MsgGUID: TJFldqd+R86ObAfAh6ZoHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20290532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 04:19:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 04:19:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 04:19:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 04:19:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 04:19:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+cJQgMHtXNOR+fx24JOWIBdEvU3rbMwGjUofobkN0i1HKT5Kbnd88jhLRQw/26fzuHqFxbahvPrD3xG5v29Fw1N5D+uIhtTuQS1sAg0ou4Zju8jFkYtkv61s8m5OCbMsmq967ckLTTwPMRuDfbh10A/f0nIBASzFD5YoMKUrA+LY5ms49gw1zXBW7YFNVz+Crd5Mrc8fP0KsPNAmxVxghub+6ASWLCZj1rMBQpRTtKP3sLoZQ3Wtg0e22ZSQ8g+U3T7h3KzSrgks95Yy+dzUcA5qTzDnAj2HUWjNNETvePHnrgf1pg3GmKwTudwyV1vNofLxu1Rbfwffz8UUAas7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwt5GjpRElXrj0iiThooDdDRlZbFmuOR34ioG/r8VAU=;
 b=TxwpGsCGf7jW5Lb3MJLXnvutkDXF2eHjCp+5DjgAjezxqtBmW3kpNCN/zrbT8erO4CqSoNkpZWk4VY97sj0e8ORnK4H79WN3J0fJQAxhmlPadzI5iBcIpulPx++y52cM6bzLsZ79oWLP+tXj0GLszU4yKXXJqxUwxpS26qZJ/dm/RcDEdyJU0Psjoc9VgBlRqXsnHuiTffAGrZ4t9rO3RoUr9EGLRvJOCb4xcW7wOBHF1rPHgH3VIM5WMzVt6UwvYwPLlesYnGM3y+hu9Y4Z968y2VQPrtwsvbn7HJk3rMwZIiai9TFBjZ61Z86bAvjN3F0aQArcqGStLmD471T1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 8 Apr
 2024 11:19:41 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 11:19:41 +0000
Date: Mon, 8 Apr 2024 13:19:39 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/vf: Don't emit access to Global HWSP if VF
Message-ID: <20240408111939.uuq3c5dea4pcnkg5@intel.com>
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
 <20240405133936.891-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405133936.891-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB5798:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQU023m7kjzp6cVu73aPJVC3aei7mC4eSUc5rgHPBHUAtfbmHfy4W5Q2uPIvKwpK8QZduxwcrHakVXeKB+7em82RIg5mmxPxL6JZL9nNRZ59Zn6IwhXvc1vLymHu8m8b2f8emIyZLTYFWuwsvVoQBe2k31YFg+pPBhXvqvU7nJs+2vehfFbamHO7ZOEutEU00Dea2qjZTLpRnG1EFKZMJ6tSoaK3xWN+ibfEsC9bKeGaeJfCYOauq5yPHk661YZXj7dLdmFbdagO8CPOwh9dsjQVyLQE18LADj0onirhDODFW1PxaX7lDedX7cmW4O9EXhkbe13clnicvy/bBQb7iJ132/yQjMStPaTe4OnSnoBIJ3v2I7aiow5vfUMaZiKWg07ws563K8T+VzYmps3OrKgi3FgrIJ5jz0tLYRM2ZY2PztYIYGkD6xgJbkJ7HDpCbEpEClBHNuEDR+hsPyhoFFFjLN713C+ckPK36CLxQEXnoK/JXIaNMFkvwqJT2MEV1k0OTJfsERWTxiipV8kteEpXG6CMaNksMznGSc0jStuj/EglEChkvaVIsMBSRPWlxaeXvzexIznEIbzXvTXvVMX1knSPDIzi6M5gxsi9Lt5nOAJ7UJLxCeJTIbzy+LLavkrGxxoeWNzPEnhH9TR+YXdW13jp2eGE1PdB8r7B+50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJsdzNUeHN6VlRkNXhaRGNGZEVBM3FwWGRHYnJ0ZFZYdTIzU3c3c3c1L2ov?=
 =?utf-8?B?NmI2MnN6UitkM1d1QUROQlFTM01kUjJnVkdkeDI2YmFpbkV4OHA4RkhPc1dx?=
 =?utf-8?B?UnJmR2F2dGxnRDdFQVlYaWF1YzF1LzVKWFBmUFIxazQ0Mi85NWtxTkpWYmpy?=
 =?utf-8?B?bjV4KzV2b2xib3pad3M0RDRaUTlYWGZld1huazJBdW9pRkR4eXhHR1grMVJJ?=
 =?utf-8?B?NlZQTWdadndwMHRtcEtiZjBWWVhVQk5vaWhJUGgwNCtCcjEycFh4My95aUdG?=
 =?utf-8?B?MTUvbW5jUWVXR2VzYzIyT082YlZGbnVYT3ZQUlZJQlZEbTd4RnptUlc2ekVy?=
 =?utf-8?B?RHhYczlFSnJQZkZsb05BeE10aENEeWxRd2lRUzR1Z2h5SFNiK3VnYTVnQWF6?=
 =?utf-8?B?TzVkS1lzQmROM09BUi9ESjZ3MXhNdnd1WTBuc05XSjJ0c0Q1SE5RbDJmeS9L?=
 =?utf-8?B?UGlLb3VQTDFJczRzK2Vma0pGZW1US0dJWkljWm56aUJqMzVqalBPVUpubWta?=
 =?utf-8?B?L0pZSElETTRpemRma1RHdDBzM2puSlNSTlI5aTM5bFNwSVBkM24zRGJZZWJ2?=
 =?utf-8?B?V2JaODVIU09nQ2VFeXJoYVVjemxZVnZ1M3VlbGJLd3JhNEJmR21PUi9JaTV5?=
 =?utf-8?B?SVp4Slk4aVEzUnBKRjcrVUdVKzNuRGxkOERTQ2pvTHFFSkR6Ty8yYTJaZ0VM?=
 =?utf-8?B?TEZvMG1GSkxNb0dIU2djcTMwVytoaEljQXQwL1JkK0RYZ1BQWCtkN3pmRFJO?=
 =?utf-8?B?VWpTOG8zS3NRREx0Z1hnY2U5MmdHTks1TytnTHlkMWhlSTdMcjNOVXd5ZW5B?=
 =?utf-8?B?eVBHZ1l4azdOWll6NEIyVWNiRUhLWGZQYkRzKzhjT1drcnVyTFdWU2RiVStj?=
 =?utf-8?B?bUpnMlVpcWlQR3VQalI4QldMNTBmbzdKR01HdTVHc3M5WnpIcjZEYWQ5WFRy?=
 =?utf-8?B?WXdEM3V5elk4NkNKYlhkRldvVzFhZEVjNjZNVEgxRTVhVjVFRFRvYXRHOTB3?=
 =?utf-8?B?NFVaV243ZUUrRVIzK3VTa3JYamM0TXZhTE56N0xNc2lpTnRsZW5xYzREMnVp?=
 =?utf-8?B?bk9TVXVBa0pxSXpzdjRKMW9DQzEzUERmYjJQSjFjQjBBdTB2M2FGcDk4b2Yx?=
 =?utf-8?B?Q0lRdEs1RE1CeG5tbllFaGYzQ1R0R2V1M0ZtTitWRlFGL0ZndGRWNnRBYTdS?=
 =?utf-8?B?MlEzVG1ybXNqbWRLL0xlcXZQZE4rSzJ6c01yK2tSM0twdzJEOFMxTGFEY3BJ?=
 =?utf-8?B?UDNKNjEzaVJWZDc3d3lCb1Z5bHhRZHNFVXVUVitYQk95VklnTTFTaVFBVnpQ?=
 =?utf-8?B?SlVEazNrT2pCNlFwK1J1TVg0Y3IrUVRiSkZUTmNLaFlMUDk2bm93ZUg0cjdR?=
 =?utf-8?B?aDRCZnd3NjhURjNCYXN0NUNHMUtTQ3hlb0lZaStuODNNMHdCMUxZMHpVa0dC?=
 =?utf-8?B?MHBLdElncjRGS2ErdkhPRk1mNStTVkFMa1IvZWJmWDUybkJ2NEFyWTYrUmxM?=
 =?utf-8?B?K0VuVVRJQjNjN1hZMVE3V0VVVkozUkJYUzc1d1NwaFRWN2xoMWNDOGFaUHlG?=
 =?utf-8?B?cFowNnBFeDIrYjVHNGpvOGdmZzhGVzFlck0yZTIrUGtyUXFpb0p2SmU2M0ZC?=
 =?utf-8?B?ekJhWnIra3J3eWgvUTd6RDBRa3FweEd4RUlheEtEM0t4WVhhUmxpNkFNWHRI?=
 =?utf-8?B?VjlXVnJjTGdJVjk3dXRoVVFhUEllcU1GWlNuNFJVR0pRaXJQL2pvMUx4bjZJ?=
 =?utf-8?B?K3NIbU5RQ1Q4UHlYSk5MNk10UjBpZ3QvNnFBbkJSekZpYiszODFIY0pNbWF0?=
 =?utf-8?B?YTM4dW9ncXdRM3RCZlNFWTl2VzhGUi91b2pjYXF4eWpVQ1pwOVArRHhFaEV5?=
 =?utf-8?B?MXNRUXoyeFI3TXA3ckFTUnlPVHY2YW0zS1VzZWtYWEg5L2VBRE10UWFZeitU?=
 =?utf-8?B?eGcwU1NYRnlNVC9BMDVmRlRGVGVOVlBlWWQxQmllR21nS3lrbmZQWkVVNk1V?=
 =?utf-8?B?OUN0WEZEUjNDR2w4dWJack9xYUJmWkFsYVpHdlh5dzFJRExpcFBwR3JhNUp3?=
 =?utf-8?B?VUpuOURNdkcxNGwrUEhCNnYxMzgxOEtMYkRQcTBhSmRVVFZHbzJRWmNadDdv?=
 =?utf-8?B?dFh6WjlXVW1peStqQXhwQlVCLzhDYXo4V3J3Q3hETUZCbU1aY0o5MitWc291?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b0cf4d-9816-4e71-67dc-08dc57bdc924
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 11:19:41.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmqwZAv5HkwjpVS/AjH3FtIy2VwN7RS7akaJG+dI2oVWcAAqpF5bkllGlOPb4z2eOibgAP6T6MiKH/jFlJnkLKayafJHktj7tK6Ft+4I/bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-05 15:39:34 +0200]:
> VFs can't access Global HWSP, don't emit questionable MI_FLUSH_DW
> while processing a migration job.
> 
> Bspec: 52398
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5b2b37b59813..d42b3f33bd7a 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -17,6 +17,7 @@
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov.h"
>  #include "xe_vm_types.h"
>  #include "xe_vm.h"
>  #include "xe_wa.h"
> @@ -367,10 +368,12 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
>  
> -	/* XXX: Do we need this? Leaving for now. */
> -	dw[i++] = preparser_disable(true);
> -	i = emit_flush_invalidate(0, dw, i);
> -	dw[i++] = preparser_disable(false);
> +	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> +		/* XXX: Do we need this? Leaving for now. */
> +		dw[i++] = preparser_disable(true);
> +		i = emit_flush_invalidate(0, dw, i);
> +		dw[i++] = preparser_disable(false);
> +	}
>  
>  	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
>  
> -- 
> 2.43.0
> 

-- 
