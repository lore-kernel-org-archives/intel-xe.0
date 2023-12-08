Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95590C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 19:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8AE10EB09;
	Fri,  8 Dec 2023 19:35:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A20A10EB09
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 19:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702064131; x=1733600131;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4YrlPDvtGKYqvX+xcI0oo7lA/YK9CzyvnpqP4IoT0/w=;
 b=A/9OBhlHp97Wm/ZGrdVkZ3Y2qRA6bBBoE4myMp9DSspE8yxvv4OKwAaN
 L8VCAbe/tgrE83QZiPolVONoUi6HY6OM1loYK6OuOpnsCXiBsBzXPJS2U
 Impne1nte/tw6ZYXThfNExO4EQTbO7HKuNMuafX9fn6TnkK8YSbu6WElH
 M3nIwPKK9aWGLkW/Jc5ktMkis7TMZ5gopdLlluZuxCZE7ll75uGUcQ6sI
 V8ypOwJDC09TiN33hzr9iXlJrT5Ddjkk0ofO2vHniTIBVexdWD8pwhqwK
 d0tY6abXuIZ66qxINOODDXfHRyXS2BT5JjXMvRAVZnka9AuUeF6ReGEa2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="480647065"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="480647065"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 11:35:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="721965690"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="721965690"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 11:35:30 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 11:35:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 11:35:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8FDGKwFWad9efp764elF/Yp0yyPJdtlqZWz3MGJ9STIeVetr/Di5/np5gWib2UQGA5dYUMYkMBXQggS+t1p4BBefct+LXT7MoEMFa7ZzdJCvr2Fus2udnrs3Ndhzh0V+7DMvMiBEXx6LBh+l9UXDxKSMGdGEw3AYiX/BWgkK6FvMFfCEDlpqfn9PmPMJAN3sOpjPZ9gOc6wxvvPnPcNRHYjJp6zK+F8wN9MEZZ9Pbe5KEekLTQVme/EMPCVcSlik1VQuErh8WMBybqqvFA+0o7pNIbsNQBWgy47KiyXrOPSfKUivH5NcZzo1s/XJfNobtPVoWwLyLOrzJ+HkWLL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhRuhREf4jaK0YvzPQoP/ELx7CjpbYaMZ1YUoefowXM=;
 b=YmHHi4xRqK4ljxUmOImcUMxVeZ2V7vscheuqnoLQnRzquSNwM1+SuT5vbNNaB8ZI/xoxjGeMWRj6nqoB/zKy2GTrlBQX0UPOYRBq2RmfoSJbuO2D+Ro+hQ3ZHVqhWsf9+4UqF+IjJ67WOuBat708LLfTG288KonW8ITGkSIZuMVwDAORehtize812gjQXzVbdt+Dpci9wbwdNxDru0ojBA6/s+hUFedYWWOixaleZQXzFVCaw/pH5ZgqCXHLdnMkU9meo2/D23+9cN6ZNv7xPpyVBYKZlVaN5OxVGM/6qI5qEnCNFSgIsTN7nQwjqd0FLJ64ZOoaBRw7WWyqzYOtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Fri, 8 Dec
 2023 19:35:26 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 19:35:25 +0000
Message-ID: <f28f6bfe-3a57-4dfc-abdb-4dd526036bd8@intel.com>
Date: Fri, 8 Dec 2023 11:35:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Restrict huge PTEs to 1GiB
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
 <20231208112918.15411-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231208112918.15411-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SJ1PR11MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c7809f-7499-47fa-23af-08dbf824d3bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ydL6ulxZ8o7oskdOJzsxP4gSlAlLfryTZEfmJRnzKeEDBw8IagVKTob3OtqjjMfhGmhx2XxQOpoWTJfu44xe4fht5K8Qiblf4XAmlfzlXFq2s4FxmEasIR9N3kcWQOf51xyCY4bzLH3BNTZ3cOztJY04jBp3lFn2H2JCSYr/DN+Wx28sua+2zupxG/ZZWiBhtpwc3zk1HTWjB8aMiJQcai0ukc0Hjs9FUtrqXNuKdpYBnxpkgVaSqWA4sHfHGeS6WPix7yQ6m2bFqXrdBfpqmDxAFNYquuw4oxfTwW5J4zU9U/iFI17OtdcLbjBq+9zZfWWVRnBIJeTVMZ7SDANvD38TqAgVx/PSsTt5L0Yr1ZXrCRl67Cg7vpBgJLx/pK7cFXYEUCU/OFa33lmjlQwf/h/Q9ekv09JGJ0HIDuhPfnftsAmhm4RaXbDVaMD5oKO1O1kI3PlML9xHkR9DHNyMRail2+Bbp9j+MBd+1geOV3vnf3MV0D2Uy+f2/Z0A8nx1lw9tPuAuJBqtxhIQ5LlW31fCO6EQ1BepVoMA3zM1B82nambMPBfcqa6VwHetJm/oElUCzhuh5mYuH0Km8NOvfRl5bJjrzIGMtKPkqOVQCg5C8NX+em5fSOwwV9jZKcQYZuu71UIjDPMvBD2mHrOicGvXMxDQxJG4yLIfAuxEaAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(31686004)(5660300002)(86362001)(31696002)(2906002)(83380400001)(316002)(66476007)(8676002)(36756003)(26005)(66556008)(2616005)(82960400001)(66946007)(6512007)(6506007)(38100700002)(6486002)(53546011)(478600001)(8936002)(66574015)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ZaSkY5cE9QT3p5WEsxYVdobEI0K2xBMzdjdTFvSC9Cdi80UnpQdkUzVXRs?=
 =?utf-8?B?ZWNSeEhaYm5LeVpyemkwU0x4a3Rwbm5xMlhBZlFONnZFWDRPekVZb1VrL2lN?=
 =?utf-8?B?QTh5ODJlMzNpcmE4eUlrZ2NrcUowbGwzWXlwWlkwL0UvOGVEaVVSa2FadzV4?=
 =?utf-8?B?VWxlYWxSNGt1enNxa2p4K1hmSGRXamRGZlFSWUY4N24rMG4wNWpVZCtGMTgv?=
 =?utf-8?B?eXBaVnFNTGVReVc4WFZubnVTaXd0RWdHU2xGdVNHbjFGU2lGY2tYb1p5T3lp?=
 =?utf-8?B?S2srM2NNZWo4cVl3YzdCUzRiY2RxeE90WEdWR2VHQ0E3cUhxeHBJeVRrWEFP?=
 =?utf-8?B?MjZKM1QzTUl5RXdnWSt5U2lUUGZWTmV6UmhDQlFGekZGWHN3dHZ1Q3Z6S25y?=
 =?utf-8?B?UFhYS1pZYy9XMjRlUDR5VXZYamMxQ3hQTXBLVkVoeGJJWnNBZngxZ2dpWGQz?=
 =?utf-8?B?SG9VVnFITFBidjNWK0hsdE1QRlBGSko4T1dtbVhUTGtwN1hHVWVjMFlWdTlv?=
 =?utf-8?B?T2lYR0o3ZGo0MVBqNGFKRlRXR2JVWWVnQVAwUFZ1QWpteE5NaHlRUEdoeEps?=
 =?utf-8?B?SC8rZURTVkFTZE5BZFI4bEFvM2dzMndkNzhFR3c5a0djRkpFUW56U1lCZDdx?=
 =?utf-8?B?aUxNWFdwWU94OGJweHRzdDZVcmlyam5mMW9hTlpsRkp5UWpHaU5OT3JWR3p0?=
 =?utf-8?B?eGtSU290L21sRWw0RC9hSFNGREw4YXcrbEo4R1U4UXJ3UmE0QlZsbEZFRGFN?=
 =?utf-8?B?UmtJamFKUEQxbE13ZVJQdHJ4Vmtkcm85cEFZVVVkaGx5WmtyQXBVeWtjOUFq?=
 =?utf-8?B?UkJBY1VQelJlaGthYUZIS1lIZHVYOFJ2Z0wybTN3aUp5eUd3NllqVkZuRm1N?=
 =?utf-8?B?V0N1L0ErOEt3T3BZV1JXV0piSnBrM21hTzNjNlBWS0k2dVRyaSs2S1NQTHpx?=
 =?utf-8?B?bjRMR053cnhkK00vYjhsK3dZWWZiUmV6R1RWbFFLbmRWeEN5VXNydUYyVUNH?=
 =?utf-8?B?YTh5cHh4QTRCRndvVUNXSTdjaUhwNTVBcExKOW9JeWZxT0JhemxFZGY4QWpY?=
 =?utf-8?B?UTR1QTE0UG1zU0RpUE42LzhscjhtaExjTWpzWjFjNXRiYXptRUZsNjlRSnky?=
 =?utf-8?B?R1VCUTZxQVpURkNVQVZMZnZpQlBBRlVaN2Q1ZDlNVTlPUVhiZ1lGTzZNR1NQ?=
 =?utf-8?B?ZDJ5MjlDUmt5U3B6NmcwOW00Y3JIa3F5ZU85cEMwNVRFS3lNd25seFQ4ZE1j?=
 =?utf-8?B?ekN6NHZwK3V0ZUQvQkhEOUVTZmtSN0FDQ0w3aXgxWW4ydks2cUpmb0M3SFB1?=
 =?utf-8?B?a1NUc2J3ZVNUUmpUK1RSY2ZhOGtLQ2FZM1hhWk5TWWNqRWRUTHB0N24rN05R?=
 =?utf-8?B?bWY0SCtVTFExK1NMNFl0UVpHRFp0VlU3OFZFSDA3cU1EVFQ1eThBMmUrY2FU?=
 =?utf-8?B?clRTOFVBcGFoUUsrMWFhMnZvMVYvZlNWUGhweU9JcjZjUGNpeVQ5MldPc1kv?=
 =?utf-8?B?U25qK2ljZXZOZlVSeHBkYm1qU3lTY21mZG1EbE55NlBYWG9GV05xR0tzRGtm?=
 =?utf-8?B?YWpRWVNEejJFQ29aVnpzRWFDVFFJeGZWU2lYM0UwQVVoMmZaRGpQN0R0ZTFP?=
 =?utf-8?B?Y21OUk9JWmY2bkVHSWtVNm1PZVNtQkdTbE40WEZKV09zQ0l5ZUY2T2VaempQ?=
 =?utf-8?B?Z2ZvVFVSbjFFUk9Sc2VGR3NaVVhzdFdGbmhhWk41N1VyM3pzTUZYejJhTDMx?=
 =?utf-8?B?Zzh1WVU3NFBQY3Vlcis0N2dDMDlKcXRFL1RDd0xpOUFnbDdrL0I3emkxNEZU?=
 =?utf-8?B?d3FldXY4Wk1uWERYb0xGd0lKZitVZDlVZ1luQXR0VWhUa0hxTEZFTGNqRlFv?=
 =?utf-8?B?QitnaytteDBFUzRvc1AyNkU2bEJQVFFsK2xicWswZmQ1UDlTRHFiQzlQaTVi?=
 =?utf-8?B?Z3NsM1UyVGZJa05uWE00SnY1K2JaWEVBdTZrN1doYUsreEpDVGZGSWU2YnN5?=
 =?utf-8?B?UDdJSmNUWiszQUtLY0MycjBKN1V4SzlwNnk0YWxQSTQ1bm5wbEpXUDJaKzAz?=
 =?utf-8?B?T0hVajJ3aW5HelgxcTNxUThBMjVldWFuWFhmR1VJb0lpZkRFTHNPQmZ0cnBi?=
 =?utf-8?Q?Td5ZomXV7o88iOGyOki75W6T+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c7809f-7499-47fa-23af-08dbf824d3bc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:35:25.9098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +chg25b1rH1Bedg4mwDzY45DOGVoFVpP7WuC995hRYBUzGHIsd5EU65ysqNv941l518F6NJ5djTCB1WItdZLwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
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



On 12/8/2023 3:29 AM, Thomas Hellström wrote:
> Add a define for the highest level for which we can encode a huge PTE,
> and use it for page-table building. Also update an assert that checks that
> we don't try to encode for larger sizes.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Brian Welty <brian.welty@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 3 +++
>   drivers/gpu/drm/xe/xe_pt.h | 3 +++
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 35bd7940a571..699a255d75f5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -430,6 +430,9 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>   {
>   	u64 size, dma;
>   
> +	if (level > MAX_HUGEPTE_LEVEL)
> +		return false;
> +
>   	/* Does the virtual range requested cover a huge pte? */
>   	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
>   		return false;
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index d5460e58dbbf..ba2f3325c84d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -18,6 +18,9 @@ struct xe_tile;
>   struct xe_vm;
>   struct xe_vma;
>   
> +/* Largest huge pte is currently 1GiB. May become device dependent. */
> +#define MAX_HUGEPTE_LEVEL 2
> +
>   #define xe_pt_write(xe, map, idx, data) \
>   	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e09050f16f07..f585cc7df071 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1239,7 +1239,7 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
>   
>   static u64 pte_encode_ps(u32 pt_level)
>   {
> -	XE_WARN_ON(pt_level > 2);
> +	XE_WARN_ON(pt_level > MAX_HUGEPTE_LEVEL);
>   
>   	if (pt_level == 1)
>   		return XE_PDE_PS_2M;
