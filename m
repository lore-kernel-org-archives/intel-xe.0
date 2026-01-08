Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFCDD1D47D
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 16:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F34E10E36A;
	Thu,  8 Jan 2026 16:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbBKPf9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4C610E36A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767889370; x=1799425370;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4MMxTLt07JA8sFYSaZtuDxhSOWQgHk3WiQZocCrN49M=;
 b=SbBKPf9Tfhz0H4/nptljJV619h8C8yDfKhtpj8zj2vAoyPRXpTZWzVYI
 RyxPUw0plKhgKRyhC/LGPTm7xZR+enzL58Fr3upnxJ4YmWFQpxWt+TOWh
 z8JLV0V2hsf0uEDjerRGKjJKMeh6KDWkU7BtEvIaxRt8AZbUoHto+3yuW
 Ab9/UndvaPWPOhXgydmXBrH3ffvEkWimhbuI3we8OFKMqhCcuxO9P4495
 B0rfANkMkTQRMbCYjby95rEOwUz2UcyJfOI73LXmTxozpROmt8p+UNU3u
 8ssBk5MohQZ4Xt5/KYELCNzCf1PMbQqF+qor13mhvLeXhUkGqLRYsEBy2 g==;
X-CSE-ConnectionGUID: GMXWEh6oT+ShBDrbTUZM6g==
X-CSE-MsgGUID: Ed2Ebo90Rnah+hx47+s68g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73117815"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73117815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:22:49 -0800
X-CSE-ConnectionGUID: 5B4k8Lf3ToCNhWmnOjPf8A==
X-CSE-MsgGUID: rq7CQWnRSx66IftIJg2f3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202861466"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 08:22:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:22:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 08:22:48 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 08:22:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3k7bCFEWgwpDtBUktMzPS1OP9tEcTFjff5zOZKjO7UR7Kogy9HEzBanTW2TO/+lYxi0R+4CZWeuXcJ/9v0v4crJabC+lt1uOzaTLCE3FmUF2/UK4zBU2/3jBAs21YPQanAQGAYbcCLQ5WS7rESeVEInFzmphiN615LA2p8zszqDSL9pZSm7vOJkJoozFoG3PRKvCC2CvbPrQA70cEfTy6L0MeSojlpuLpe1ygyVIUbHh8QHe+w9MhvIv9dxp3eNHvRWn00BnbtTpDRp6N4q6BDn5Ydash9Dl/eQLzURHuiqWqV3tD2kQpj90RrbTdzIvVLAnQDQ4WHxD7OaHudWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwEIK1fyxroWY2X84J1mdAsPhAisT0UoPtzmf/1DvgE=;
 b=ZU8TQLLFEVqNWiXiPjbDqKukZnUcxBIr+pMdg67hGbPfmbLAdMoMt7V4qvmZYCrI0fSHLYBQlYFzI7rMDRSmqSeS78qRaixPRVlJvqGgHtUsFDu94TsqviDkrha34vxDzcSoRPmLXTfqgnXMX1upeJWJLDTIP3GB4N+E4Eyty5i3JCxV27QGXwj4Ghzrc3hZopRULU4/SIXNuai7IY3Jw4EQZ1Br/HaFH4rPlJJtg0x5WdiPXiG2heXcR4X6GZW2BeQAKGu4wJXyfSfUeAsQc0Pgk2fgnGbfW3mkS0XgRZzEmA2qHrQiD/AVH0hD6C3GpU3xy5qYRISqEA0CgfRx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:22:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 8 Jan 2026
 16:22:46 +0000
Date: Thu, 8 Jan 2026 08:22:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Fix page reclaim entry handling for large
 pages
Message-ID: <aV/Z1L7NSOOnV8M0@lstrano-desk.jf.intel.com>
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
 <20260107010447.4125005-9-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107010447.4125005-9-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d521f57-4e76-4a54-5478-08de4ed228be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aB6z5OQDAht3x5n5FjMM/3jAjb2H5LtmRE+hEzQQ2aPGGQn7b8WBPXDuGC9t?=
 =?us-ascii?Q?ho0YHsJHc3+LtoU3tL06rMjfFvhOQen4gtDG8Tah97d2QtWR1NTv/rQSRpqV?=
 =?us-ascii?Q?wKBpdUzVn02+s0rSKFQ5482FW3YFcVBuxNYZ8YJGUQh1a9NImjsiI4KwIrd8?=
 =?us-ascii?Q?upEqSTvx2l75o/GuWg5uM7uuQgEoesW3MAR6+PG3iXEbGaenyPkJf+HAfARr?=
 =?us-ascii?Q?pPamorctJHcIoC9Zlb9L7Jr6oV3dm9qPYil1vtfurTTmTrMJ22gUQ/aoE88M?=
 =?us-ascii?Q?EK9z/ck1IN3GG8xH/+3PKdVoNjB1sZaJMex8gDpZa48j8xc7jQ6HDh0vJkne?=
 =?us-ascii?Q?G+RpNxZ5AUj4LmSzxjZgukD24MK1ld4i5wUFQn64Se675v9fMjhU1bwzCPN+?=
 =?us-ascii?Q?5GN0m4Hij6RcUQzus33M6E8OOudUF+ayWoXn6PIoi/3zvdikoeguNWqmWPG2?=
 =?us-ascii?Q?4UlJU9riKA9ZcMcB4WlW9ypNuRBmXm5rX+2wqSMJD6BLSvkG6kAEp/h+jS25?=
 =?us-ascii?Q?Xz0pfA07TIXapSkFqaAZySf1FiVZEwha/0IbgnhNt0iVNQuieEzObFjnpReT?=
 =?us-ascii?Q?d9D93PzAG8jc/lUP8CA2K6PyhpWlse12askd/75s89KIq/9lPrsLY4Ewo3Ra?=
 =?us-ascii?Q?T46RF6Gc7Nbq3MykmmWNopBSWXtZmovs1jM6jwc7LJDBpb3IEqTLWxRt8UQR?=
 =?us-ascii?Q?hjQjIn48gEMaEUXoCf+zuxVzhaCODKhCx4g2Ivy260BTZADr/ou93eJ20FUg?=
 =?us-ascii?Q?Euh+hmozsmu7AgPC+nb1a53MapvFXRGMNtkqe8nWXhf2Jr1Wu3HoJpKqIpGK?=
 =?us-ascii?Q?bIHHLK7wYKBrEL5sjdRpt96l4MH5PltxpMPz2lpmy8rc4YRqw5BbrE8oLzJ8?=
 =?us-ascii?Q?DMZF48fuwuwjRscaju2mw2FKRHk5+qo0SLfJGnWGxgW+Nw6mmtwAy77B5feG?=
 =?us-ascii?Q?nN40mkjK+oOiDUEaG+706EU9zpnU6u3Dmut/F46CkNPze6uwPqbvdgfyWksU?=
 =?us-ascii?Q?PZZEgbIscwfZstSS8CrU98wQYIKNah95Id3MiJz/l+OmN7aWUVXto1o1rJNP?=
 =?us-ascii?Q?erSc57DYdWQrSvTbcxGmxH7jCz7l+28tDte1RLASc7Bm8vIdVd11LLRdOnRK?=
 =?us-ascii?Q?HmHamgMl5i14lMCg/xngXd6ZdGHFy+jiIePzTxVpiVIE/aOxGiJOEX01PMoB?=
 =?us-ascii?Q?491y/Z1zkHd7Y/NGKQ85Bz0h97DO16XtbBoQyrGQsQhkA6SL+V+C6APvaDAJ?=
 =?us-ascii?Q?UiArfgOARM6/CjQCDm3qiYI1oquVBrV75S6kvaSGtGeeYaPvVKnb43PR2lrp?=
 =?us-ascii?Q?6FaQ+FiE6IJ5bhwUMNsbAiQJYukvr8EJxVeMcwWPZ29lt8dm7r4/5SHkEFzn?=
 =?us-ascii?Q?AQF4DPB4RRB4pZwzkY3MvQgJ1wVylJshAY6HBGYDxCgCFWaWtfzssPJFWjUI?=
 =?us-ascii?Q?jvmSHJQXWauK57sU/3ckza0USmuIy/kJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2EuBkdh6DFJCzIi+p/bMrDt8HQQDhVFbrvDAehXChJ0+rBFdYqncjoLQ3K6n?=
 =?us-ascii?Q?+wrjZlIjOs4pcpVzFgVh8auKYi9OWZ0H8Y6hVRjWPxXKqs/aazUAZxeoPkUV?=
 =?us-ascii?Q?csXgyOHLBTPsiYYSliHZ9wDJiSAvmHQPvWKeCgQ2GTFd0oD6Z4f5GdHydV1J?=
 =?us-ascii?Q?nS+3nadwSHyEEsEGoyqkFEmiD7+bbKqRfyk9xR7S4HZ8EsgGyFmG7hBkMwNO?=
 =?us-ascii?Q?RX2y05BZGkuToHgXOkHVMdlCRhAv0VzwA8qwnJFP5BzvPQCdSv1CT7BqSEbH?=
 =?us-ascii?Q?Em37VZc4VqUl1S38NhSetL8kGZSEUN8BJVKsaxqA9xvEGYdUC85vY/1fHv5l?=
 =?us-ascii?Q?UPMTT4gZVg7jmbkco1b+KLlRnrqzORdiPS2AFLSB8lBpgLQiQlfRvQY60IEw?=
 =?us-ascii?Q?NnLuI1ngBjdNnp9nVVEMHHHPnypnZCQ106RZihQv7wW1HzWAcoDG/VrRtlAd?=
 =?us-ascii?Q?2kSdAxQ+ynvP6lYNGUx0EFkyZmRPLetlPgdbYeMmuvsj56zla2keGr6h+gsx?=
 =?us-ascii?Q?vEiA43+5Kgd3Lhm3XjnYyiZj4pQkehO6j+EfCgFAY2YwdM91piwo7ZcLIrcy?=
 =?us-ascii?Q?6POU9dU2nOw7uor7uxKKK4pPxe0x1SwgV/WX1237H6Bn1eWC6xzVyR+mimEh?=
 =?us-ascii?Q?wyTNhY43A28IAW1ssMobdr+LkBCLPpu4iY19XEjwZ2IH13SNJu0239tyH8LW?=
 =?us-ascii?Q?hkbnttyiSQZvnnW/8bN2TE3CzbTJjHXipxFZAZUXQMjJltGfhj4PwJnYiHrH?=
 =?us-ascii?Q?vV4Uuxw+Wcti4JooUNGXrmvLyIhnpIBXS9sxaCHMWIHg1fNfJ078YP6N0YdS?=
 =?us-ascii?Q?DU3CoCbkEpy56SyqiGmfEtotAPRNcBFUYUE7dmjx2vweMYqFxVJwP6CzSBme?=
 =?us-ascii?Q?6p6NOm4z4uVCX9nUyvd5RldN8YFDgTagL//WnhSBCEgGmwr56Qn4N6HYGowe?=
 =?us-ascii?Q?XPvfr5IddWA8nDqjBQAIieFpZYkVpxhp/+Fci1PUfgJNFFXnmURGFiyflEQn?=
 =?us-ascii?Q?IEHTPNamBWiA2JVsGhZkSY0xh21hlCF7KfdcKbcOihbEcMTRoeIo8dPLo9+E?=
 =?us-ascii?Q?leZQ8Alnc7nsen4dP7bJGyixZeeyqS9cV7q1t0Tifjn0gyTQD1tlv7VOdYR/?=
 =?us-ascii?Q?eZDVW7ke2LDv+OLVefGv95cqdCXmU1eTYqsBQejRyr/gAeL3ei9DIrDg5B9X?=
 =?us-ascii?Q?vdmPYiN6+tt9foes6P6se6Pilge2R/P9M6ww7BC/M14ab8cPEtRxNp5cGxPI?=
 =?us-ascii?Q?3TTHZ0bvwDQx1HC8b5HhoR/L4YVMniOjJrCRLMNLE7HLqo+7H/FzYxFLnBXj?=
 =?us-ascii?Q?qGACZfA4RTDSP1FHm++jhzPpLQeGFotKlyvXlO2EeBhLFSs1HwgMNy3U9j+I?=
 =?us-ascii?Q?9LfQX9CIJAJoaNvfq5iaVytM0vATwYV40U4b0gNwvyNhXbjqvbGdxznKhhFs?=
 =?us-ascii?Q?QpmnqQlfE3B+yiOGvWQPOsBILvD1sOPakUeoEcFcr3njl8a7EprgW1rlWCkH?=
 =?us-ascii?Q?rAWxwaxcut9n7m1xQm7eU1YU2ErqBKE56UrwCBfdBn2AnRDujlklONMDqwCq?=
 =?us-ascii?Q?GZ+ILI5BpPkMQapgRGHkuU9u8mGMq5kAZMxvblDiO3TlGQbM0TYlOSm9HFMm?=
 =?us-ascii?Q?0sI8f4C2u3eFmvFSwN5IQkoKoulOaPVO1ONKAYunqfnFkYzADtI9tQ/ZfXv0?=
 =?us-ascii?Q?BEkqw1AHv0c1EAoP3G6sCzejGsUchdITXSQO+ezV7ZYWctRLxMyIcClDODqR?=
 =?us-ascii?Q?QTp53vKulMD2zAxuUcflTj3P0rKIi4E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d521f57-4e76-4a54-5478-08de4ed228be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:22:46.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ht551f4qOPsY3Z7GxUAzUrKsavyl5OzwAXBWUyqa2H4UH3Mq7ShxxXXKYxDdyADI7fhD8stf67Wv2e+ZkOsJXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

On Wed, Jan 07, 2026 at 09:04:51AM +0800, Brian Nguyen wrote:
> For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages and
> are all considered leaf nodes, so existing check was falsely adding
> multiple 64KB pages to PRL.
> 
> For larger entries such as 2MB PDE, the check for pte->base.children is
> insufficient since this array is always  defined for page directory,
> level 1 and above, so perform a check on the entry itself pointing to
> the correct page.
> 
> For unmaps, if the range is properly covered by the page full directory,
> page walker may finish without walking to the leaf nodes.
> 
> For example, a 1G range can be fully covered by 512 2MB pages if
> alignment allows. In this case, the page walker will walk until
> it reaches this corresponding directory which can correlate to the 1GB
> range. Page walker will simply complete its walk and the individual 2MB
> PDE leaves won't get accessed.
> 
> In this case, PRL invalidation is also required, so add a check to see if
> pt entry cover the entire range since the walker will complete the walk.
> 
> There are possible race conditions that will cause driver to read a pte
> that hasn't been written to yet. The 2 scenarios are:
>  - Another issued TLB invalidation such as from userptr or MMU notifier.
>  - Dependencies on original bind that has yet to be executed with an
>    unbind on that job.
> 
> The expectation is these race conditions are likely rare cases so simply
> perform a fallback to full PPC flush invalidation instead.
> 
> v2:
>  - Reword commit and updated zero-pte handling. (Matthew B)
> 
> v3:
>  - Rework if statement for abort case with additional comments. (Matthew B)
> 
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 64 ++++++++++++++++++++++++++++----------
>  1 file changed, 47 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2752a5a48a97..a53944957be4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
>  	return false;
>  }
>  
> -/* Huge 2MB leaf lives directly in a level-1 table and has no children */
> -static bool is_2m_pte(struct xe_pt *pte)
> -{
> -	return pte->level == 1 && !pte->base.children;
> -}
> -
>  /* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
>  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
>  ({									\
> @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  				  u64 pte, struct xe_pt *xe_child)
>  {
>  	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> -	u64 phys_page = (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> +	u64 phys_page = phys_addr >> XE_PTE_SHIFT;
>  	int num_entries = prl->num_entries;
>  	u32 reclamation_size;
>  
> @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_tile *tile,
>  	 */
>  	if (xe_child->level == 0 && !(pte & XE_PTE_PS64)) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> +		xe_tile_assert(tile, phys_addr % SZ_4K == 0);
>  	} else if (xe_child->level == 0) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> -	} else if (is_2m_pte(xe_child)) {
> +		xe_tile_assert(tile, phys_addr % SZ_64K == 0);
> +	} else if (xe_child->level == 1 && pte & XE_PDE_PS_2M) {
>  		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> +		xe_tile_assert(tile, phys_addr % SZ_2M == 0);
>  	} else {
>  		xe_page_reclaim_list_abort(tile->primary_gt, prl,
>  					   "unsupported PTE level=%u pte=%#llx",
> @@ -1647,20 +1645,40 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	struct xe_pt_stage_unbind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
>  	struct xe_device *xe = tile_to_xe(xe_walk->tile);
> +	pgoff_t first = xe_pt_offset(addr, xe_child->level, walk);
> +	bool killed;
>  
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
>  	/* Check for leaf node */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> -	    !xe_child->base.children) {
> +	    (!xe_child->base.children || !xe_child->base.children[first])) {
>  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> -		pgoff_t first = xe_pt_offset(addr, 0, walk);
> -		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> +		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
>  
>  		for (pgoff_t i = 0; i < count; i++) {
>  			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
>  			int ret;
>  
> +			/*
> +			 * In rare scenarios, pte may not be written yet due to racy conditions.
> +			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
> +			 */
> +			if (!pte) {
> +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +							   "found zero pte at addr=%#llx", addr);
> +				break;
> +			}
> +
> +			/* Ensure it is a defined page */
> +			xe_tile_assert(xe_walk->tile,
> +				       xe_child->level == 0 ||
> +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +
> +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
> +			if (pte & XE_PTE_PS64)
> +				i += 15; /* Skip other 15 consecutive 4K pages in the 64K page */
> +
>  			/* Account for NULL terminated entry on end (-1) */
>  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
>  				ret = generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> @@ -1677,12 +1695,24 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		}
>  	}
>  
> -	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> -		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> -					   "kill at level=%u addr=%#llx next=%#llx num_live=%u\n",
> -					   level, addr, next, xe_child->num_live);
> +	killed = xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> +
> +	/*
> +	 * Verify PRL is active and if entry is not a leaf pte (base.children conditions),
> +	 * there is a potential need to invalidate the PRL if any PTE (num_live) are dropped.
> +	 */
> +	if (xe_walk->prl && level > 1 && xe_child->num_live &&
> +	    xe_child->base.children && xe_child->base.children[first]) {
> +		bool covered = xe_pt_covers(addr, next, xe_child->level, &xe_walk->base);
> +
> +		/*
> +		 * If aborting page walk early (kill) or page walk completes the full range
> +		 * we need to invalidate the PRL.
> +		 */
> +		if (killed || covered)
> +			xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> +						   "kill at level=%u addr=%#llx next=%#llx num_live=%u",
> +						   level, addr, next, xe_child->num_live);
>  	}
>  
>  	return 0;
> -- 
> 2.52.0
> 
