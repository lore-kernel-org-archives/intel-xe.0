Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA740C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BD310E0A9;
	Fri, 29 Dec 2023 21:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F46110E0A9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884008; x=1735420008;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E+TakHECUkYzj3FlyH8ubLp8zcu441wN29jSL6Wh7xM=;
 b=EdI4xqnk/S06SaoY18dUay4+Op8wt65MrqKL8P6g9USultEcU8kZQ5M6
 saHhbZvTowDbuCOzoFhRUujbLPtRi/GCTJsZE8az/w0pt1BrJ0b5efvfU
 2WciVTVjamtGLbYiPFCFrarYpQq9HgU/yqCuzdJgrMXEHCTl+kIU8vMa7
 Su6aYbof51kgRJ6x3SEZqbFHJIoY3bClcM4IRNTWji2T5JozK7e7Evz3E
 MbLMocgx1zPMiPSNbgysppN/ww/w81+7ekX09DOqw4vLNxgY+zOnckGBl
 5fcCnpmbRJ5qWxmgd8+NAJV+vVN4z2iuwyp9z6EpWzO92L7ToMXCoMrWU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3758593"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3758593"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="844783425"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="844783425"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:06:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:06:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:06:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:06:29 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:06:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnxVquiuAxX2JLHaLqfh6JaeufJDCWY2jN4h6g0wn9O8swHpZ3eUdoNCZLgzjxhOENW0BmtvxlM5d8Zqoado27v2GdnTGeM3UdkVlRknnIl5ps5BgnWfY/RhOPQBVKm+2vUs81cgWEwXzHxYIOgNFcp7NSPtHBJCdDL8qbiXlLO9dYcR8s/BNHFO2I3/FTpwqy/Z/NHFMZkI55eACZgmVCsn2B7n+g9wZS1VVTz9N8mdO0w152FOEB4qQnvtA/IvGXMjA7l1Uqtz0riCx1+5Y1fNgZxfLrEwgjt5bsAceuHLrwfIUtKuyTiefifBjeiQHW92NkYG9UT+OleQXkv+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gyPLVyNKbPxdlC9y+k61NY5JUbXf31Nk+EAgB7WPlI=;
 b=U49YwSUk38VsSnbWKfySwr9Gq5GQA+6OkfgANbAW2ki4+Dv5L7eZRJ9KA3gffCYZRuLCs4pm6bqRAQD2/AuA71A35wG4/1qYiOWccWiot8FUIKV4qYvu5luSZXR+RI75HmHTwK0YIlt23PMYruYIqlvsJNyj6M5liwy4BEmt1UwmX1WGVUutQrz7EJmuzBvqz/ZX+/hT3CNPHcNem9nw0CrnG6JcrmAm+VIqsotvCJo8nowH3hYyZWJyCanafH5QL9betH4rbsVw4I9QU7AxfGpNS/XBR+FHTwlwB9+Zz16P+TNZj/ffGqsmeR4GGD6J6dyyH/VottZFluWfi8oosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:06:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:06:26 +0000
Date: Fri, 29 Dec 2023 22:06:24 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 01/10] drm/xe: Allocate dedicated workqueue for SR-IOV
 workers
Message-ID: <20231229210624.wbr62pode7kp2vdj@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 87964ed9-cfd6-440a-6d95-08dc08b204fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uai3jRZ3yybre0zW0Xx7tJMi+QEasH9AhjVFGLw5LqiBFV9lZhEGJN8jIC4wrJ+HPm9tGnr8a+qWcAXcm1bFu6jGx3FgiYcdmvVLu702tRO6TwoBhK5ZLr3s84NMmCTvKdV9QLSnW1mqYHyzTwAJSD/f32gwjTstXkNEiaR6KLcKR7nfdfJFxy/qeOaOh3dZKrKclRM2ifKnG5FMbre48j/O7XDROu71lu2wGdadL4UIH0tluBlqGXqT4GfP6vRqkJsxxhK8atl0p3iOCkLipsR+OaZTawkotmx9XI5vhcTSnxOnVd+gCXRgbF2bV8HqeAnvl3chQlCbS8Prs6UwfexsDo/Sxem73z+ZxZy+MUK6dXS+Pz6mG8uONe36sepfVOj9bmrBjAt5kdmwXL9pjbXAs7630FxPNDJZgrwIweCd9/+8TLTo22XWeBN9EOZ6NoLYKzou4sUc8cRvUyn0tjC/khiLBBwKrhaIIP6R+m4XixvdQeWA9mhE4EXsLtJpMWvWOdocW+sVUjSMdDaNiJGO9zDmgJ/pYoJE6nPb4RvqN2YRgnSQtJAQaR7o63yk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6512007)(6506007)(5660300002)(6862004)(8676002)(8936002)(4326008)(2906002)(37006003)(6636002)(66476007)(66946007)(316002)(66556008)(6486002)(478600001)(38100700002)(41300700001)(86362001)(82960400001)(36756003)(1076003)(66574015)(2616005)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RHaVZkMDBnOXdNakJDVTdWN2M4dXRpMEJEeWsrTjRHOUkvYzhHK3h2cGNL?=
 =?utf-8?B?REVhUzF0bGhYY05ubkNEbTJvRW5KNU9MZHdtMFRkeVJjYm4zSnJQOVRqSmJL?=
 =?utf-8?B?U3pzVnZqTGVTQnd2RUNsZ2dFRE9PWGtKUVI4eUNUQW5NWnNuZ0NLUStWUkRx?=
 =?utf-8?B?N3MvZ2FhVHB3ejd6ZE9JWEpzQXhWczdSSmxrVk43bnpCcmdPeUNTRGZVZWVE?=
 =?utf-8?B?ZHBZM0x4L1NXSVRmeFdQMm5mTlpmaVVxelgrenhOYmtSTDl2eFhhNFEzMG1R?=
 =?utf-8?B?OTRIYzV6SXlyM3l4dmhzTitVYnB5UHdWWmUyaHgrVjlzV2hhRk5UZkNqbVlQ?=
 =?utf-8?B?OGZFWGZFeEdnVGtQTUovQy9tUzJBRHBoeTlMdlhZMmhtbEJIU3lNVGZsd2xz?=
 =?utf-8?B?SGpjSGZIZ2d1QktsdGNudDY2eVY3NCt5Q1JaR09Fc0ZGdHhZOXJSN3pJZ2Vl?=
 =?utf-8?B?LzQzYUF4Y1lOWVFCRnVXZTdldzRITnpTNHRhdHFjUTRYbkxlQytRNFY2WmY5?=
 =?utf-8?B?cy9Ua1pGODJmNVllRy9ua09BcUtzT25mNTNQdm5IK0p2Tms0cDkzYWZ5UHdQ?=
 =?utf-8?B?eFYxOXd4UDhHMHIyY0FtMGRFRldlRld4Sm5VR2pUeExhcDJTYTNGL3EyUGFL?=
 =?utf-8?B?WGpVaFZJTTliYVp5SW5vWWZUbUFVc2dET0UvOU1PUmUvcWhvbFNYdSt6Lzlh?=
 =?utf-8?B?ckhEZmc0YzB4NHZZckR2YytKM0pSMVRyMkx3UXhWNjBUYVpvb2w1NEg0Z1JT?=
 =?utf-8?B?WWYyUmpaYWFtaDBzc3EvalJoNklzV0xJcC96Z1V0SnZBaEJ3M1NhbjZMcUtC?=
 =?utf-8?B?cnQyRGxiRFpVVXllOFl3Q3pObHhMQmZtNzNLK0ZTdDZQMElEVUcrNVlKd0t1?=
 =?utf-8?B?VzdZeDJOVEtlQW9xODMrclk3S2FsbFF5Z2libHFUYU81VzR4UXF3bTJyUGJN?=
 =?utf-8?B?NzFIcmIrQU5FbGIwK1d2VnZlcUNTUGJXbVhnRFVzVFJJQlp2Tm0rUjlTSGdq?=
 =?utf-8?B?amYyM21CN2V4MU9BVmMyRHI1ZW9VUXRTOUJZNVdob2pCYjZjajk2S2o2bnFT?=
 =?utf-8?B?SnppNW1VSDQzSzhQd0VjaUZrMDJEM0Z4N0lGU0ZQM0RLNlUxMmhHaXhNb2xV?=
 =?utf-8?B?QXhlMHBpc2h2QzJKUDlNT2NVQWFjVjM4SEdhWHcrU1dndjVoODVIZElxdlZB?=
 =?utf-8?B?WDJIbDFEQlorVVBpYlUzeHhtbGU2STdKZDd4Y3JlRUM4Y1l1cG10eEliN1RK?=
 =?utf-8?B?N2lWZzRKeWVBWFVEQlhjeTRsOFg2eXEzQ0NaLy9FaHZBbnorcUhoeFlYeCtE?=
 =?utf-8?B?cDFiNUxVQlVETkhIUUVRM3ZpQjR3aDc4eGsvUWZkY25oejFRMlhEd0ltcTAv?=
 =?utf-8?B?WjFWQXhjeXdzc2lXRWNYN3JCdHRIOXREemFkQjJRT0cvbGRqWHh6L1lXR0Rm?=
 =?utf-8?B?Q2ErTnBlZEVmQzg2SjMrUTh1MzVpWEp0Mm9KTFV4dHJmbEtMMk1BR2JQSURw?=
 =?utf-8?B?YlE2VW1LRXJxR0tIejc2TDBvdmhDMUszRUN0K0VpZFBQcUUwRG5JZGhnSnYw?=
 =?utf-8?B?eXNFd1hhK2xBZkpTQlI5a2RjMU1yL1hsVjlON0RkOGJDSVh5ZC94dWxsSCtx?=
 =?utf-8?B?bnlUMmNMSzJHTzA3VDB1bFFLbENKZUdKVStPZVJTZ09qTzZPeGhkbUorS1RX?=
 =?utf-8?B?STRmSTUyRVE2cUFzTFpxR1hnZ2lod20rL2RVZytzNENERlhpeC90dkZHYTlI?=
 =?utf-8?B?V0hFbUQ5UXpKdzErelRmcEJib2Rlam1JdkttT25PS3pUVzFhUU0vYldydWF1?=
 =?utf-8?B?TDJ5ZllRT0NWWWlDZllhRjBQVkdENE9CUzlBOE9qNVozb2RlRk9EeDNNdXgx?=
 =?utf-8?B?NDhldDI2ZjVkWGRzcEQxYlhTUC9Db1ZaTHZpQ2FNVXZwczgzQTF1b1hYa0RD?=
 =?utf-8?B?bDFsY1FVNTJiN0EwT09KWUk2VFdNejB1RTFRUHlpelFnV3dVRlZTSWZRdjd2?=
 =?utf-8?B?SVFxZWE1cFM1SFJ5UlQ4UFJPcVdQbTNNZXV5TU91Q2w3QzhRMDBOd09KTHNW?=
 =?utf-8?B?eitDK1VtWW8rYlR1RnNEckJtbGRLVCtoYktHNDQ5QWVMck9adzdYQUhrbzEr?=
 =?utf-8?B?V0FYSXFqSWpOMXYzNGFrMHpva2hNVnRETkJzaDR2cXRaSHhUM0VRendQU01S?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87964ed9-cfd6-440a-6d95-08dc08b204fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:06:26.5103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i54ZNRW8LRPMVgswGKg8ua8p21JMVZkLxVS5izuhKWG2MXulQa3aMEsRc8cXDujFfUKC3B51xb8ITsaZ4yYql0ko/rKVkJfxEc7SXWtCP/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:29 +0100]:
> We plan to use several workers where we might be running long
> operations. Allocate dedicated workqueue to avoid undesired
> interaction with non-virtualized workers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  4 +++
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov.c        | 37 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov.h        |  1 +
>  4 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86867d42d532..004e65544e8d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -438,6 +438,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_pat_init_early(xe);
>  
> +	err = xe_sriov_init(xe);
> +	if (err)
> +		return err;
> +
>  	xe->info.mem_region_mask = 1;
>  	err = xe_display_init_nommio(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 71f23ac365e6..163d889d407b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -321,6 +321,8 @@ struct xe_device {
>  	struct {
>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
>  		enum xe_sriov_mode __mode;
> +		/** @sriov.wq: workqueue used by the virtualization workers */
> +		struct workqueue_struct *wq;
>  	} sriov;
>  
>  	/** @clients: drm clients info */
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 42a0e0c917a0..4960e8f461c8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "xe_assert.h"
>  #include "xe_sriov.h"
>  
> @@ -53,3 +55,38 @@ void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
>  		drm_info(&xe->drm, "Running in %s mode\n",
>  			 xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>  }
> +
> +static void fini_sriov(struct drm_device *drm, void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	destroy_workqueue(xe->sriov.wq);
> +	xe->sriov.wq = NULL;
> +}
> +
> +/**
> + * xe_sriov_init - Initialize SR-IOV specific data.
> + * @xe: the &xe_device to initialize
> + *
> + * While most of the initialization errors would be fatal for the Virtual
> + * Function (VF) device driver, in case of the Physical Function (PF) we
> + * might just limit the PF functionality and continue run as a native
> + * (non-virtualized) driver.
> + *

The description suggests a functionality that has not yet been introduced
in this series.

> + * In this function we just create dedicated workqueue that will be used
> + * by the SR-IOV specific workers.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_init(struct xe_device *xe)
> +{
> +	if (!IS_SRIOV(xe))
> +		return 0;
> +
> +	xe_assert(xe, !xe->sriov.wq);
> +	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
> +	if (!xe->sriov.wq)
> +		return -ENOMEM;
> +
> +	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 5af73a3172b0..1545552162c9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -13,6 +13,7 @@
>  const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>  
>  void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
> +int xe_sriov_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
>  {

I would suggest remove the comment I mentioned so as not to confuse others until this
functionality actually appears.
However, the rest of the code is ok for me:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



> -- 
> 2.25.1
> 

-- 
