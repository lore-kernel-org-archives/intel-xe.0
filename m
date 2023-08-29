Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CBAC83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 23:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA9810E4A2;
	Tue, 29 Aug 2023 23:58:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63CD10E4A2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 23:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693353522; x=1724889522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WIaO68MFtN1rQjiLqMw8Q1MdonAaK/xQG3gjXpQA5vE=;
 b=jS4j379FUgwR6nX4spy+YZnO5kdIDs6mKrWt9Z+umJFutVQbSFuCm5IY
 bpZdA5IqjE99IhlYp3Rr/4ORw4wVggeVISmjvIgxzBExaPEzrRE62o8NF
 Ttl7y7orMKGCRgrI7DOOQYqPIQ50aXwnAm02hE0XN0b8wMvnxdrvnwQgG
 g6UhhYhgQT9GJQfu+lHRa7+N3DRrXUkU11Ad48qbq7C2NajayVGmW0wk9
 lUzTg3cRYx2qYmdPdawxp6fsLxCKrDmLFShsSeIlUyWZ0UDqHHycYP43D
 juSr6FHbtrezENe/Ynr6rT2yL5EitaILh1EqeFN/uRSBmiZGPIPjwMYWS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439459246"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="439459246"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 16:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="829016941"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="829016941"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 16:58:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 16:58:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 16:58:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 16:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGetyOFYXrPXIqTOo8rJHNyVc/Iu+fcgFiiiArlwtUrD+Hq6ezQYvTfqN3av0wTVI/XTVWQCLQ7M3S2APIJ0G5lF8UNFqa0jlI9fT7SCfu3LO9Zxk4vkyzP1uLspW49CuhV8jHu4XPzfH8tqNx9/CLXLFFsLlEg2SSikV8Kd6LSO8cuBmlD/rjt1/CwTAFz66ubhAMfGxBf7VaP0XNpD+EcG7iBKp5Re3zcUtWMy7uUkRlN6OY/ld3lL54JH33KnuSvJ6KiDbP3msWnBN6kSTfJNrDO9WPlaxXSSPxTIGvJ8h+YXfHCzNyWZWkfhQvYWUpFckQSU5gjXY0buL+gP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5/YPXsNIhCduwLdBUo4mAWRwTK7UZIGA8ifQ4Rxyjk=;
 b=llxYz9nom/hzXMu3z38+zRtpQXFACdELKVyMk4yBWd/cmtz0jhH7pvZe1PlBV5imcsF7GI2nryswGgnKiCpEEuK6AOiElm/no7P+pa/kZ9B2SEpx+jJIwZ+Xwequ/4tFAWYQSicw32Q9dlXvKZ8Zs6spstcou5Sr6aoJdKo9ZBO8kqR/2wPZwobJJaNEnOMRafNyjldV3jOD5rfmkR9nvFmI7pBj8SZbRbfF7w+dri2t+4gbI69f8mgf6DZv/mKrI0c9yh6aG1KHcrwiFhD/EJAzH0CpSdSJUcwnmBcYnxa5zlPXDLxprRlZKZOFbAqFfz5Adk6K+rkm2tQyoSXmug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 23:58:38 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::a53a:1157:885:64fa%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:58:38 +0000
Message-ID: <c352ecfe-3b68-72ad-2879-ca053be8201a@intel.com>
Date: Tue, 29 Aug 2023 16:58:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: "Chang, Bruce" <yu.bruce.chang@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230829231648.4438-1-yu.bruce.chang@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20230829231648.4438-1-yu.bruce.chang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: b011fe8a-1a0b-48c3-d601-08dba8ebdcc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Qo7R0iRuMeZYeI5mFWmRP9o1hE6SCAllWum3+LYPlK/0urJsY9garXDq38lcc9IPQhzdA/66NITOtEKMbJzEgiOORRVktPe1cLIvazHHHqidQCLOjy9IRkzCnySwWiKPSq2YOyaxav2DXreYpI8t8hsHl0retTo49OqMhOi9oI3GS4knHy2v4OGGTfZwhDJ2k9bUYwllIPYjjaG4Ag73sSczVDiHbmHTTfR+taH407ZAxiuAhhNy7dESiDIRPz5/MJ6J7dEfonP7IVp0cY8lwQZzZLbiNQxlcIFFAOZLthb+Vf0RLW8SIflHedrFn8dhYJAphfqPClw3cszq71//dNDz79euVBBPlWY1diSavx3A4ZDHGkz8SpfjWT8xCsoQwpBz2Jzt3ViUs42YZfHbM8bCK/Wns0GqbsTOZhglWRT1jsFi13Rsl/RbJFNetgFD+xboZTG+JXlHXV3PV5H2jh+STw4KMKY2b5dl2ceKiASynHVwdcdJfiSOIGnCsKl2TurSXwPkMhPCO2NWlyz6sfZ5wk3IUujR5Zx/FWnK3s9eJBKbVNIp3BCJcaGBbeYbyVZKq4slJIoiJbQPZq5zpbLZ4i36YSN3w0FzqabDHc5Ap6Fq4K2UnjdEpVO/xm3OYtyLdseurjh0G27+khjKVFqIFegCwUon2F/D2RBtSyyRNUhvImEFw+YtTSeb0MY56Yh8YQQam3sEgyHZ7zelQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(1800799009)(451199024)(186009)(8936002)(4326008)(8676002)(2906002)(54906003)(66946007)(66556008)(66476007)(316002)(5660300002)(31686004)(41300700001)(6486002)(6506007)(53546011)(107886003)(6512007)(26005)(2616005)(36756003)(38100700002)(31696002)(6666004)(83380400001)(478600001)(82960400001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmRydURIZGZhMUNHVzNVVVlrcCsxQTRmU252L2JXTitlVDFTNEwwUEI3NkUv?=
 =?utf-8?B?K1B6TWxxOFpGZ2F4MEkvYmlxd2tkQ3hoRzdmUWtUd0tDS1NMVWl3b1YyUW5U?=
 =?utf-8?B?dkFRdlNPM0tHc1FEQWc2Tzd0YXBoalFRSnFBcmtvNmVrY1dCdkE2RzhqV3Mz?=
 =?utf-8?B?ejE2aHB4b3hIZ2kwSmhVbm45ZERXUU9hZENhNjNOTnVZQUhyVEk3aE45OVA1?=
 =?utf-8?B?VDhrMU80TUw1L2crQTUzRHFhS2tzandETnN6NG5LUnRjQUlibXJTV0E4N3h0?=
 =?utf-8?B?bkw3Z2dRMHZvZVF0QVkvK3VOalpXOFVpM2M2T2M5U3c2TGcyY1FIY0xHdXpk?=
 =?utf-8?B?Z3J0V1ZuRnB3dWRkL0Nja3NET2RqcWxIcGZ6c3pDTDhDeHY4WkRYcmd4L1ZM?=
 =?utf-8?B?dVlsMkFPamZ0OVQwV2dtQmQvSEx4bklRMVVoeUh5UlNMMTdYclNaYzhEMG1k?=
 =?utf-8?B?ZmN1OUpKWDQrdXpyenU1Y2M2M0dHV2lVL0VGQWZZRi9vcmNldnV3dzVlSkQx?=
 =?utf-8?B?ODZJUEduZ0FrcFJ3RXMxUktzVVB4RWU2eHQ5TGRHVXFqSStsajFSS2QweWFt?=
 =?utf-8?B?N3AzcXR5RHdpMEpOVXlCNnZhZFl6QjVnRy82M1dMV0RUREpPVi9wVmRsbEgz?=
 =?utf-8?B?dWloeG9FMm42NFZFc2tyTnduc1EzNWVNM1p2bXRkdFQ2c3lmM2Vvalk4UkNM?=
 =?utf-8?B?UWRZUWNvdnJVSWRBSGN4Qjh4bzAvbWxpVmpmU2c1ZGVDdzRYbE5EeldnK0xh?=
 =?utf-8?B?ekdiYkdOeGtVa3NlK0Z0a0N4ZjNZcW5rK1cydEFLTE1DYW1ZUDg1OUZjTVdk?=
 =?utf-8?B?SE1mRmYxNDlJOUlPU3VWbjlibEZsZnFuVE9FSzJYYnBzNDZKOW1NaHlqL1ZI?=
 =?utf-8?B?NWt3dXR4TzBEWXA4VnY1M3JZNVBFR3hXckwvWHBCakNWZXVORjcrTk13emE0?=
 =?utf-8?B?OGMxK2xXMmw3eXMzU0JraEdBQU4zQ25GNWdBU0JtVEcvZklkYVFaVEtobmJW?=
 =?utf-8?B?bjFnYVBOZmZaNk9hOG56cUZnZUkxd3FzSzBJK2tYREFyS2JlbkRkRnJNenor?=
 =?utf-8?B?RUdwWUhIaTYvbkQzcGxPN05pMXZ1amFVWFN1UldDTHphQUdWa0Q4dWFyVGhX?=
 =?utf-8?B?N28xNklMd3ZHSVBSYmJRQTFJZnJhaWFya0U1bXNWcTVsUGsveG91dmdVNU5a?=
 =?utf-8?B?dXFYelM4UnZubHV2MFJ6dWYzZWdvQ2FDbUlqZEdLMVBUVHB4OXhhVmliSlFp?=
 =?utf-8?B?eVNWNkY1OEZIdkx3Ykx5ZEo1RldrN09BWVlPbkZGRXBKcEhkd0c5MHJMMmZm?=
 =?utf-8?B?a3lzNTJ2Y21sRVpjUWtKQWxYeUNEeWxaZ3JZSTB3NXlHSmVveWNsSldVT3hz?=
 =?utf-8?B?Y0N0ckNGQmhURkxqWGhxQXdUb1R0dGs3UUxQbkR4bVBQK0lqWmMxTERzNko5?=
 =?utf-8?B?RUVXQmVXRjFoNHZNL2luVy9EbUswRU91YVBmbnpNM25yRVY0UWRnQ2J2WHpo?=
 =?utf-8?B?ekNKblVyZDQxV1hBRTlpaEhabTNPYk1OdGhhVytudloyRENkT2FsTGx0UXd0?=
 =?utf-8?B?OHlRb1BaUVJhaEJScTlsNDJSMmd2Y3kxWkhOS09QTW9ZcE5xTDR6bzYrUmRB?=
 =?utf-8?B?cGcrWllOVmsvTURRK3ZoUThTYlhGSXhpUHNwcGI0WHZ0cmZFb2p1b0tiamhC?=
 =?utf-8?B?M2V2R0xielpzbXdUcDFMaXVQTDJnRjhobk8vTW5HUWdad1pTOWcyd01JdzJr?=
 =?utf-8?B?Z1c3eEFhMnAwUFN0SEhqWlNTS1F6ejBhdFFya1YvYUJ1SHhYdVlUYXZnSUFX?=
 =?utf-8?B?U3FCa0lubGJ1ZUpYRmdrczF1L0VxM1luQzJjeUZ5cGNHTGcxLzZxb1lVdGV5?=
 =?utf-8?B?WDFoVmFhSWJHSStHRjh4cnFnZzluVXZoOThtbEdTL0VJNHVHSHlzMHJ4UHVa?=
 =?utf-8?B?cDhleEhBNVYwWVB2Uzc3eDVJVlVkSTRFVGpvZ0lJRGdubXpOeVh2NUhPVklj?=
 =?utf-8?B?UVV2eloxMkpIclBtSVUwUDdJbEVLU3daYXVJalZxdUZIN2JlYjNMWEFNZUVz?=
 =?utf-8?B?bkxvSHl5SnJQeXByQVNyK3lnWTdYcnVKeHlHdVU0SzhJSDZHNVBkalc2enA5?=
 =?utf-8?Q?2iMKrfZoXL9bbJS1RFFhAPVbb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b011fe8a-1a0b-48c3-d601-08dba8ebdcc6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 23:58:37.9172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+M/ZPEQKTCSsAciKJ0ypjJx9x03G/mcnK/Eh4BPy75D1PEWwJs6lGvRhCjGX9/ac5LuLK4sIWOwqG2xL1ppWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable scratch page when page fault
 is enabled
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
Cc: Stuart Summers <stuart.summers@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 8/29/2023 4:16 PM, Chang, Bruce wrote:
> The PVC HW has a limitation that the page fault due to invalid access
> will halt the corresponding EUs. So, in order to activate the debugger,
> kmd needs to setup the scratch pages to unhalt the EUs.
> 
> This feature can only be enabled if scratch flag is set per VM. So, once
> EU debugger is running, the debugger umd will set the scratch flag,
> otherwise, this flag should not be set. So, in regular run, this feature
> will not be activated.
> 
> The idea is to bind a scratch vma if the page fault is from an
> invalid access. This patch is taking advantage of null pte.
> After the bind, the user app can continue to run without causing a
> fatal failure or reset and stop.
> 
> In case the app will bind this scratch vma to a valid address, GPUVA
> handles all of this (e.g. it will create ops to unbind the old
> VMA, bind the new one).
> 
> This patch only kicks in when there is a failure for both page fault
> and bind, so it should have no impact to regular code path. On
> another hand, it uses actual page tables instead of special scratch
> page tables, so it may not require to invalidate TLBs when doing
> unbind if all upper layer page tables are still being used.
> 
> tested on new scratch igt tests which will be sent out for review.
> 
> v2: per Matt's suggestion, remove the scratch page unbind.
> 
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 +++++++--
>   drivers/gpu/drm/xe/xe_vm.c           | 24 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_vm.h           |  2 ++
>   3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b6f781b3d9d7..adfd2206b942 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -137,8 +137,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	write_locked = true;
>   	vma = lookup_vma(vm, pf->page_addr);
>   	if (!vma) {
> -		ret = -EINVAL;
> -		goto unlock_vm;
> +		if (vm->flags & XE_VM_FLAG_SCRATCH_PAGE)
> +			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
> +
> +		if (!vma) {

Looks like vma could have an embedded error. So maybe need 
IS_ERR_OR_NULL() ?

> +			ret = -EINVAL;
> +			goto unlock_vm;
> +		}
>   	}
>   
>   	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 389ac5ba8ddf..5190807089e8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1262,7 +1262,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   		}
>   	}
>   
> -	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
> +	if (flags & XE_VM_FLAG_SCRATCH_PAGE &&
> +	    (!(flags & XE_VM_FLAG_FAULT_MODE))) {
>   		for_each_tile(tile, xe, id) {
>   			if (!vm->pt_root[id])
>   				continue;
> @@ -1998,10 +1999,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
> -		return -EINVAL;
> -
>   	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
>   			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
>   		return -EINVAL;
> @@ -2783,6 +2780,23 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   	return err;
>   }
>   
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma = 0;
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return ERR_PTR(-ENOENT);
> +
> +	vma = xe_vma_create(vm, NULL, 0, addr, addr + SZ_64K - 1, false, true, 0);
> +	if (!vma)
> +		return 0;
> +	XE_WARN_ON(xe_vm_insert_vma(vm, vma));

I think might as well return the error to caller here?
(let the caller decide to ignore it or not).
And on error, seems best to call xe_vma_destroy_late() to free the 
memory allocated for vma structure.


> +
> +	/* fault will handle the bind */
> +
> +	return vma;
> +}
> +
>   static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>   {
>   	int ret = 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..ddd387333cd2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -212,6 +212,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>   
>   int xe_vma_userptr_check_repin(struct xe_vma *vma);
>   
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
> +
>   /*
>    * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>    * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
