Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EEE10FCAE4
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 21:10:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A5D10E2D8;
	Wed,  1 Apr 2026 21:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDaJf4cR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2365710E2D8
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775077842; x=1806613842;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ia27UuqsBMO8Nr2VcQGry5KHZs5C99od0lgn/v3iv78=;
 b=FDaJf4cRrP3qrOxfl90/UixKFxbMWv2tRiVdzMMhKV3VcdVbmJUITwfu
 jpi+JQNkUq1X1UhNIgYJe5iwB4YYhdbtAYY9c1cynpfwWhR21oFkp3jRA
 aM838VlqYdv3VFU16ROfY3LVylbwEt3nAMklrflCLoCFn4OWExVP7mv7f
 aAeTOBcLhvINDvm1abEDQXJe+PQYyTG/A7CRBYaKyJI3BqIPalWeqDK66
 3nz6wPfXZohlqKgH11IehlaKYbOrNS362NRG/xyO/vu7aHdXezoR1hFmQ
 yDWQ6iJbIUu2VnoG4zKIOzjRGsJLGc8hdAVmsOT45bZZxCct35I5bAEI4 w==;
X-CSE-ConnectionGUID: FhSpIVSyR1eeqfnFCkKQUQ==
X-CSE-MsgGUID: k97tL47QR02JTU50HlKW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93519014"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="93519014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:10:42 -0700
X-CSE-ConnectionGUID: zHlfisBLTK6msd9e8BSEvg==
X-CSE-MsgGUID: dRUooeHzR6eOKXsgXzi/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223494322"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 14:10:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:10:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 14:10:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 14:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj81aclX7cL8YszEx9YOs7Z0ApghLXg0tylvTe0y+CENoNjLFvQRRv2XQjSYQa4AKXg1n8XiGHymmJmf+1WCyPSIS0KGoZ2B9Q8unKMB6iJBXqtrWOoDpFcTtSwXNf5l+kB+0oaVrXJemr6qFG+voi8Mizmlj8WErX9Qr8/thh3F/sZa66HyLGT/6qhhDmctcUWGO0Aff3HaRyntn+lAX0MH+20dSIttrW+c4ZWzP2c3bvK629D/XaZoVclL0qnVXBNlNl7Up4C94JL6geSKrsPGyamdJcZK8iY6hEKDVyYrQZpNstd/pMQTAR4nlhWJe/ZPqAtF9Edquaeawg8NTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkRW4YBxlue30m+UwkPrCnIqDgy5nm5MCESXIj0/tv4=;
 b=Xbwz397BoBxWHpJcpNU/BHT05bo+O0h9v1STb3vz8SeERJg43oZ0ZZyFflUDrWhIl309YyZzsKeJyh9FxcS/b4Ecg5MQ8CCed8FBUwJZOqHRmoPRjsdPvJsrsbNCAvwCBum41kMQDVOtyNWZ6GhCFnPTf+4AJ6ekRKsnYgDGM4mVtfFUQt6NyTYD/V7fLLD1ZVB5wjUKsw0xp9EiF9iOtS4qthY+atPLARJdhf9RON+ufLin+ArISxycB65w2fbnN+DBTbrPu6lFaAHkvo5uNqZxzXKHUa9zlBaHPudGRuuT1W2RQ2s/jTqjOwQ24LKM1kEbkoK6YX6fmOyXpdDb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPFBF67129C1.namprd11.prod.outlook.com (2603:10b6:f:fc02::49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 21:10:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 21:10:38 +0000
Date: Wed, 1 Apr 2026 14:10:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 08/15] drm/xe: Implement xe_access_counter_queue_work
Message-ID: <ac2Jy0G6+Q9bnMmo@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPFBF67129C1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5b9f9c-0631-4cca-b30b-08de90331fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: a3w94sZK3+tSwUw9960FfN5ELNrTXYjVDCp3x84ELxSuGg50REhWxOkTmlUoGexpcvB7ShtFpXfXbLAo2sCXdOmBaTCxnCrk1l1Y4B5GTfIbhph0jxOaoKUS6/T06oI13CycOeFCI1Znpex3UB+b7x8ahQ/+BDpO5BgqmbmmjfzPZC7zDsLOq8tE4M6v5coGiG5Hho0vch4pae7XwiZP8e/wMPXcudcSn9c08Drv9HFdSveRUqqXbtvYKj6cmBZ6hWMwckYPvI5a4aDrmp/yvEzMXNODoo2JkpSFx6e2UEBlW1Yck68NpLx/qM5xJrvx8uav6JV4RQSSMgp76fxY5v+A6Hk7feP9j00yH1710pwZsDaVKzKWeNg2tcnSWFPf+A+x6Dsr9rBaMlmtIVmLnfKa/P4fOfQ2eBZrXj4iwzXtIQRM+1QnMkw7tFRAnjXiN3nNUoHuiH/XTVjN4kFg8PWi+9bPfkt411xYWiHzB4ZzFZnRNNnonX4aDVa+BNunvb9HTHfSk1GwXhPKLGyA4R73IS63y6QxhUvUy+qft6oFSAjTnhEo3vgy/BdqqRyELo6YHcpyj0fJh7+w6lSA59q6Ltu9632clscnG07wt6t6PJR/6oFSYTL+hUrSzbiIFOEbCcfEtNneZKVAfm5N4HYDFuhpqjdcPIF0Bm8MNZLYDyEbebbN8qMkIOUnh/F/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i+dF0meOR3qZhK1QtaKFzQIFu52XjEySPbi1mT6j0HtFS2m+xsF0MkO69jP2?=
 =?us-ascii?Q?KwJtbkcgRmcAAM1jUVCRZszDBS6KnCdFz51IU45414IB7kZlWe7IEsSAeEig?=
 =?us-ascii?Q?UOc7V4G8ZCWnHsy3GrWjeH4sZbNbStXfRK6XhLMzU77Kb4fsYBMhdHPnn23r?=
 =?us-ascii?Q?VgXoGQepC7IwpdljS00n4y5lhg2w+H4Yu8JkNZuRv4HKAwfnGeSE+nvjJYYG?=
 =?us-ascii?Q?PFWUAWHZsKW6md8eOCPe8LQzbqf00bxt5PWjKj2Fhp4wJ9tPSfDG93ckvO26?=
 =?us-ascii?Q?+ZXKq3QjKkZHyMcY1i70sT9fMBSQAvEz+Vto7DgzFPskFobazZJjXu/z+DVt?=
 =?us-ascii?Q?KMmqAiHUCCXc0jrggG16Qhennzi/wf29D3Bx56+GjR6zjIuYf62FxY+nkLMU?=
 =?us-ascii?Q?Xxad5dnY3dlf0aNd26OM5xhlGqk69J1oII6xUXKQHMhpvlMXKreDBpLFZL2a?=
 =?us-ascii?Q?cvn1dfQ5MzV98x9ByRTPTXJTDVmdqwaRe8SPzusu4A+kCSO3K4V9MRgMn1kn?=
 =?us-ascii?Q?1EWKvZORbfQjuMigwAhTxGS6ZRBGjLRnpZgfyfNfPyT6iMLWAVf0VerAm/RM?=
 =?us-ascii?Q?NjG6WlDTKR7pTHAVwo6eM3WQheCRZVG7A9p4vE/gzICWsPocmP3lr6v+P9RN?=
 =?us-ascii?Q?vb4MkZSSXJ5Q7x75K1cCLg/6tO2gRM7ZjQirJGZnLE1DQmeKPZPxlLb9lYrP?=
 =?us-ascii?Q?fkI8w/G9TwqJQYg1Nxm7+xAU0Ilf8DJX0lDLQt40nrVHcxotjjNWsqamKrTq?=
 =?us-ascii?Q?WQIOFmBxmax1/TD1/7FOcyN5IX/ag8oZtWqt1bXpGZcUSN0HN9YK3u7qR3RI?=
 =?us-ascii?Q?5RltvIRIsCVxbYaPlkd8HdU00gWZwBHr+4yeiYOFMvMh4esleFkh8qSPPMi1?=
 =?us-ascii?Q?FOkQLA5xAlgfcTE2A8Mr/dPzQCxJzTrzR2Hha/3NkcS9eMKmED/39ncMFBoF?=
 =?us-ascii?Q?f6/uV2yWUwosdHTsiCmE+OyPHUumaGlyd40+hyCKcXzBWcjdGyRDbhR6Rdvd?=
 =?us-ascii?Q?qgG4l7XGK5PsW5uy2IKZfUoaWa7+Wh7QIiggmOBPDxLLyCfYmpSkfmgp8fPx?=
 =?us-ascii?Q?w22pnWv+Top+MRLuDVbcwRqH26ftMmjdDyL0YTVO7UIvv4mBbsnfMGyUh7eL?=
 =?us-ascii?Q?34a2uanRzYZI36kv1E9PlUvk52jgKy959UWUrymOlPhSoeWEM6Xlt6uJDIbk?=
 =?us-ascii?Q?mtw/mU/SjGEV/QEzCEJ3/aiiFKmPaVE5HuJFXyIP6rlTd2qsXwbnN3qo7YQ2?=
 =?us-ascii?Q?lgpEb55f5pM728RYKhXPYs4HQekGweJGpuPV2l9TPgwDDjVRGzT43aw4k9lO?=
 =?us-ascii?Q?Hrxv3ns3nnKQTYaOurkPByI6odVFvfSmMvG0xtbS8Dy9lvVeD0aFfV2g9EJ7?=
 =?us-ascii?Q?BmLk4POq+xmweF32byGytbjTcdptZYpZOHF/Acv7Nh6qJzIGKb7IG5Wt9PM+?=
 =?us-ascii?Q?fWbf8X5XoRyPNoek5DM6cdNbJqUzVxQz4pEVpvmEPi1/o+9yi5Wb4BYGasTb?=
 =?us-ascii?Q?qT+cgL5G1sRduKjMDSPQtVjSLGLDzjh7SBWoAtmV1fi/Y4XeRU4XklCERr9A?=
 =?us-ascii?Q?1nQgrunrrEMMaq6F86DBbJ9+8zgveaLPvpsKUoCmRZIkxuWAHKX1cKIlLku/?=
 =?us-ascii?Q?EIHQOKSKqHFlJQSLP+8I4PlOCSmqZcQ9wU26zmUNZGk9eo/faRXc8q+h4x29?=
 =?us-ascii?Q?QdirCu0USSCnuIV4rIlQ0NosYC/EFskmrBR3GtFA6QwPqYrKFfXtgiAYBQEG?=
 =?us-ascii?Q?SgUgnQneJz3mFaCo5zxE7vrGKdBdgkw=3D?=
X-Exchange-RoutingPolicyChecked: AHo5Fypnsi28xo6kSOg5aNCPisl4ibbTBjiqOi4Ne22K3e5QILdQmHYf6W2ibhamfkU2Tm4qZDLCzB4Rr58WwMCsEAnnF4j18j9Hhnt1N+6kRTTYkOLgO9JjulgdQ405BxTbNflmflYd0yl5LTh67muJZulpXE8KIxQf8Z02ecAb3OXYUa9MKLJhOb26R2FsUrry2uov0RJxVlw6mdsOyTPa0TgRD7WJgpfaBhW2YMIGgSIWUBk6F8CzMpiB0mjjQ0UpYLGI7lPYxZht/4rjxA3C8LHaS001IJrlatP17G32eIwDa0VqIQ8+VIFMp+9rHUX/PzyNMMkk8fRvnGEjtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5b9f9c-0631-4cca-b30b-08de90331fbf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 21:10:38.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XrpyoBT5+vNqJymHMenLhaBuZIYHDrFa8t7kVGcYvHpLYr9UHN+NQEpeYbDGL752ysGiPicIMxI4qWc+ABCbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBF67129C1
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

On Wed, Mar 18, 2026 at 01:14:49PM +0530, Himal Prasad Ghimiray wrote:
> Implement worker function to dequeue and process access counter
> notifications and migrate bo based vma to vram and rebind it.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Not a complete review - that will take a bit more time but one quick
comment below.

> ---
>  drivers/gpu/drm/xe/xe_access_counter.c | 139 ++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index a2ce9dc45d05..9eb9917d8da7 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -11,7 +11,10 @@
>  #include "xe_access_counter.h"
>  #include "xe_access_counter_types.h"
>  #include "xe_device.h"
> +#include "xe_gt_printk.h"
> +#include "xe_hw_engine.h"
>  #include "xe_usm_queue.h"
> +#include "xe_vm.h"
>  
>  /**
>   * DOC: Xe access counters
> @@ -33,9 +36,143 @@ static int xe_access_counter_entry_size(void)
>  	return roundup_pow_of_two(sizeof(struct xe_access_counter));
>  }
>  
> +static int xe_access_counter_sub_granularity_in_byte(int val)
> +{
> +	return xe_access_counter_granularity_in_byte(val) / 32;
> +}
> +
> +static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
> +						struct xe_access_counter *ac)
> +{
> +	u64 page_va;
> +
> +	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
> +		page_va = ac->consumer.va_range_base;
> +	} else {
> +		page_va = ac->consumer.va_range_base +
> +			  (ffs(ac->consumer.sub_granularity) - 1) *
> +			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
> +	}
> +
> +	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
> +}
> +
> +static void xe_access_counter_print(struct xe_access_counter *ac)
> +{
> +	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
> +		  "\tVA Range Base: 0x%08x%08x\n"
> +		  "\tCounter Type: %d\n"
> +		  "\tGranularity: %d\n"
> +		  "\tSub-Granularity: 0x%08x\n"
> +		  "\tEngineClass: %d %s\n"
> +		  "\tEngineInstance: %d\n",
> +		  ac->consumer.xe3.asid,
> +		  upper_32_bits(ac->consumer.va_range_base),
> +		  lower_32_bits(ac->consumer.va_range_base),
> +		  ac->consumer.counter_type,
> +		  ac->consumer.granularity,
> +		  ac->consumer.sub_granularity,
> +		  ac->consumer.xe3.engine_class,
> +		  xe_hw_engine_class_to_str(ac->consumer.xe3.engine_class),
> +		  ac->consumer.xe3.engine_instance);
> +}
> +
> +static int xe_access_counter_service(struct xe_access_counter *ac)
> +{
> +	struct xe_gt *gt = ac->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct dma_fence *fence;
> +	struct xe_vm *vm;
> +	struct xe_vma *vma;
> +	int err = 0;
> +
> +	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> +		return -EINVAL;
> +
> +	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.xe3.asid);
> +	if (IS_ERR(vm))
> +		return PTR_ERR(vm);
> +
> +	down_write(&vm->lock);
> +
> +	if (xe_vm_is_closed(vm)) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +	/* Lookup VMA */
> +	vma = xe_access_counter_get_vma(vm, ac);
> +	if (!vma) {
> +		err = -EINVAL;
> +		goto unlock_vm;
> +	}
> +
> +	/* TODO: Handle svm vma's  */
> +	if (xe_vma_has_no_bo(vma))
> +		goto unlock_vm;
> +
> +	/* Lock VM and BOs dma-resv */
> +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
> +		if (err)
> +			break;
> +
> +		xe_vm_set_validation_exec(vm, &exec);
> +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> +		xe_vm_set_validation_exec(vm, NULL);
> +		if (IS_ERR(fence))
> +			err = PTR_ERR(fence);
> +	}
> +
> +	if (!err && !IS_ERR(fence)) {
> +		dma_fence_wait(fence, false);
> +		dma_fence_put(fence);
> +	}

You can move the dma_fence_wait()/put outside all of the locks taken here.
xe_pagefault_handle_vma() also unnecessarily waits under locks, but that
will be refactored a bit in [1]. Even there, I should probably move the
dma_fence_wait() completely outside vm->lock, which is held in read mode
after [1].

Best to get the semantics of this new layer right upfront.

Matt

[1] https://patchwork.freedesktop.org/patch/707294/?series=162167&rev=4

> +
> +	xe_validation_ctx_fini(&ctx);
> +
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +
> +	return err;
> +}
> +
>  static void xe_access_counter_queue_work_func(struct work_struct *w)
>  {
> -	/* TODO: Implement */
> +	struct xe_usm_queue *ac_queue =
> +		container_of(w, typeof(*ac_queue), worker);
> +	struct xe_access_counter ac = {};
> +	unsigned long threshold;
> +
> +#define USM_QUEUE_MAX_RUNTIME_MS	20
> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> +
> +	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
> +		int err;
> +
> +		if (!ac.gt)	/* Access counter squashed during reset */
> +			continue;
> +
> +		err = xe_access_counter_service(&ac);
> +		if (err) {
> +			xe_access_counter_print(&ac);
> +			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
> +				  ERR_PTR(err));
> +		}
> +
> +		if (time_after(jiffies, threshold) &&
> +		    ac_queue->tail != ac_queue->head) {
> +			queue_work(gt_to_xe(ac.gt)->usm.pf_wq, w);
> +			break;
> +		}
> +	}
> +#undef USM_QUEUE_MAX_RUNTIME_MS
>  }
>  
>  static int xe_access_counter_queue_init(struct xe_device *xe,
> -- 
> 2.34.1
> 
