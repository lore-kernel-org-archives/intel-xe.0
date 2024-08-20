Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC7BC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6480710E13B;
	Tue, 20 Aug 2024 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQNlJIvq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489110E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174580; x=1755710580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IeItlqUXAXWQ6t1zwCPdxarHvqf5Gnm1hUhX1ZYt62c=;
 b=dQNlJIvqEMSICCzZx0r0of+V9g/IeKuh84YBdKlS454+ZKhw1ihfyRY7
 kIvmZmTTfQCW2QjgwIbJEL5EH4zhzky07vNOY1jEZdTsg+H8cczfw5QZb
 P8U9eNDYPJG/Q/Vj/V3tVUBdq+x10tU7jg/yMEHBY/eXKqJP5Z66AVhRV
 qGy924pqw42JONXmAmPEBchoPxbj4uh5tN2o3qWaXdAQbSGNfZ0ylwpJW
 8l3l/tVpvpvqqfc4Y/2ODxbthxuau0iLjwuP1GkES8ZTZ+w7MvXgupinv
 YgE73fmc4B8PTB2mJWFOWVmCgvnnaWkks/wkzR7Ica6J3pxXNod9+xSHm Q==;
X-CSE-ConnectionGUID: R7dGIvHjTv25qOUCZtqEZA==
X-CSE-MsgGUID: CkwO6zN3SQirIx6TgWdpoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26364715"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26364715"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:23:00 -0700
X-CSE-ConnectionGUID: n6d2VE15TWWoUQEcaq/1nQ==
X-CSE-MsgGUID: J0I7TNULRzSO/hsgVmJe3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60773825"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 10:23:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 10:22:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 10:22:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:22:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXBgw/LioWX/t16Xtzigs71bn/Nx7VAEK0rbqLjnVs6eXCQEWCQKtBXKbWKzrT5iHMGjOQuH+DAhaX2sLE3qncWOR9CnhKU8zITDJNJDtJ/tAKFNk58BfBcrIhDovHSqFe0Ru66KMAVFKaA2QQ+XW8ojoKjSV0L/BWCuCc2DyX4oysRKQBqhNk4gMMeVRfk/sDhTxImOv3vGJBY2ZE2nDTUtyuYkWfNRC1Z8bMoqR73ukJTsDiNSYszvdT+B/7rBfoVUxNiuhdGz2Nv2ZZTnpjQykqgOEs7NTZ9vPLpBZWIE8JTR5K0IIlZ5RfccCEWbXDXj/EAFMEF6I2ZpJlMMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHF/vEIBd9irHSUHC+jfLt+ynaiwNEE2zhrxf2yExKY=;
 b=qtXMFJp8KDGaRtvISvhUnBv/jRpJwAqiKSAQcFmd4R3Ke9wlOBk5pAqWUHxPX7PzVUM6K6wCUot5IBcpieOeSs5fGFyyAHmiRUSbyFBIRr5DTkHA0kyw0P+TLQL3zsBkwlNFAWdo8ca8EZ4AKeGb9W9d3ZfR7btB1QaMdU/2kabvj5dLi8mmOJ0f9YD61xo51nu9tXCUI7lYRNuxeSuz7fr1uDxKfqr37UV7ECcG3IZfYhxZN3z/TEC8qW9mP10q1/rp/N7j2eWSYfwnVU4dsQ9CElcpDpKRoCMiVsGD49RmKyvuZtXDcP0dAb+eILJTDG0aZkSEoJHL2NYh3HtJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:22:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 17:22:57 +0000
Date: Tue, 20 Aug 2024 10:22:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Invalidate media_gt TLBs
Message-ID: <20240820172254.GL5091@mdroper-desk1.amr.corp.intel.com>
References: <20240820160129.986889-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820160129.986889-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d6ad51-5eca-437c-2579-08dcc13cbb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SC1xF0tyltLxXCvb//vGlbfrvVST7pCX4oEF34ULDaBAa85bZGv1rU1wvgOK?=
 =?us-ascii?Q?w0bEhrf0rh3gKRhnuP1bgsOTBrVsI23KEBPT36wcmkl1jU9hYl2J77s+7QLM?=
 =?us-ascii?Q?LS/RQHHDNtZm9AdYgP2Pnf3WCeD18p6ai2J/5enrDyJAWZxEWAJXpCzJIwmT?=
 =?us-ascii?Q?1yzSaKWmEu5Y9Ff2Utc7B5griLlVnNAEcAkuQKT2Q2ujBVQ6zNq882Xxdecv?=
 =?us-ascii?Q?9X4KTZVb1wYjK8c07qo+6bHN+YG3HAdKiOpOnDxbo58NHP1toVwLeCbRV6CK?=
 =?us-ascii?Q?yEL+e6MV1B8Axv7laH1Q2o0s6OVRCj8TQAo7GzTrhxrIT+1vmRiz7efbdat9?=
 =?us-ascii?Q?ZfS5DG5dsna5nSINjsO772UUqzduH46o8Y2fHhbQTfHwKCHX0RVnD0WjIKfo?=
 =?us-ascii?Q?EMAnOvp1WBobNm/L0Ik4/GqxiRhqiN/n7+6gyIn5ZEFfXw0b5VFjnb/WSth1?=
 =?us-ascii?Q?aEiGga4AFJgdVvk7Y6+gocteV4YPHCVnm6CGNhzFkOSHRcakgeefO4b+AGYG?=
 =?us-ascii?Q?a/oKq2mTzKF3wiub2sYK9DInnO6PHw0L473+rmm5FQAoYcp/lsRLKiF9sjdC?=
 =?us-ascii?Q?J/whXttGB/oShPShRdVPaUqji710rQncNa2kYhuvnXsOlXevtCn9OrwLbQg6?=
 =?us-ascii?Q?V7JZzIvdWj9c2iB+jn8xfjZ6cUbY8lvhOaLOumKjFi6wQZPo7f2eYAXN8Jiu?=
 =?us-ascii?Q?bT+JuQclxXsqFMTelDeDOMm6VjN90jh8wFEBiEzIKrMhzYn811hNuYMXFyZj?=
 =?us-ascii?Q?iPVV5sYpgAZdNnSDXoDsPJ4zf8ahW95419btyipwrsfHxX5us3r4tHiIzm9p?=
 =?us-ascii?Q?hHFDoxlxlZ2t263kvQFQB8O0nxgYPohPG3RK4ZMWQ4L5iVsGmJqAQLbiFS6u?=
 =?us-ascii?Q?pCNtWiwEr6vttL27SD9u+sZLFAOVDwDJeBA1hGcib/yFM5aVxgmZTqA0yB18?=
 =?us-ascii?Q?7Gy3+v+kEau1JNfSKULlFnovrRXGQuTs3ZewrEu9g+HA/ENXdWozZI9HIEOX?=
 =?us-ascii?Q?fcZjgWDdo/wL/mydAIUsnJj91uz+gpb5Cv8sYiwVrNV0lixryKRe6dTXAK0j?=
 =?us-ascii?Q?k+1hLehS6Pgb6lagpgAKdnI+hzEru/QPfTq0+zMx0AE1OFrBbtMBpzYTze8J?=
 =?us-ascii?Q?qpUxVsrwugWKQakZSuApKcMeVkuF+3Y63Iyd1Xx3PHgoJ+azqNYFDb7fyRts?=
 =?us-ascii?Q?6yjBNB2N5QiAFdLXo/ZtGcbAc8opl93FeH3lB8T802hVyk9JTRi8y/+QKS9V?=
 =?us-ascii?Q?MVREuoR4Wd00DVAWVp4323dZ+i4nSCu17qCbSDFk0tYrm8isOwHxP6fvl5Dt?=
 =?us-ascii?Q?MdmXcoo7WFo4I3blH9gavP+MxdQpzt7sGqOWFw/xSPAENQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4PvYjQBA6xQVf7TFzxyWeDI2kP3MijzvuE4QHnFpX5cooMaW2pfo2vlzHjQK?=
 =?us-ascii?Q?59bK3frkHxw/Dlsp8fhz6qmd4t3c4Hxp3s1iaVkQAdKbozvN0lCAYauD9y+U?=
 =?us-ascii?Q?r7kImV2rykslO4tlMcvDxAjMUxvQ/4CfJ53UMmQodL+XMn1XGqI4h0nektFQ?=
 =?us-ascii?Q?ctpmppPSoVX3L7MOhevu0RmQbdOr4tGqMOirez+pIppPdWRsFCedfVyJkCDS?=
 =?us-ascii?Q?VLZkqNNMcbqoTZukDLQEKS3k6eiSuszaqCtVC5mKwlJH+vOkTE6wAmdBve7V?=
 =?us-ascii?Q?rGpWsNa35mtLsMFoxLAsaZezrYCPIrEV8ouJXZmm3DiVq7qfL1tdTAqdiYch?=
 =?us-ascii?Q?UYKJ0BJl3XiGwDxGw2xQX/0lvXm/dOiPQ7vRXNbrRdzVEEc9Zkp6/8gI2XqE?=
 =?us-ascii?Q?sqOecwLHbKlceAa8Pg8xEvameuHRtWQa/2WNpu7dKFRVb+SIpCt2gmbJ8bnm?=
 =?us-ascii?Q?Fo0gH2BXyryRx6ZDwsmP/DCvnrk483TOxL53hlP/Tkgq7W1xmOdVMjG6wZbp?=
 =?us-ascii?Q?CbpYOjAT/t478V4vmIUDRX2MSG+5KRjvavL3n3RkSrxwc1RiVNizFJpq87qi?=
 =?us-ascii?Q?OYiL5JgoYvr203A9f/rcIUF3JHWobAHrNtlFbb8oXVr3AOBXqkgClwDiQOU5?=
 =?us-ascii?Q?uyEKV/2DdUB3R7uzmXh4nrLVWz1xdsLMNwY2kERdAUvoVnQjGO4tfCofNpIc?=
 =?us-ascii?Q?zLQG07SHQz6V/iZwkoSfPoV+owZ6IapA/AqVQYxLM8usY6PcKT+MtV/oYOfM?=
 =?us-ascii?Q?ZFhAXSr4byi2K5O3UPm1JB77sm0tDQci7Odk4G1qmW7KF9f0UgV3zzK0IhOF?=
 =?us-ascii?Q?0zHMGJEqOzuJAGtyVhBJslNi26bVpYtAyvdNNgYJReTO68FpSZbft/n5dHR0?=
 =?us-ascii?Q?K7csUNihIbVcZDgi/DTaC6TWn6l3b+9sW42tOLMG1odWr5367CB9jPxwFv4y?=
 =?us-ascii?Q?4fe5SgNt8CdjbgQh37BWUhbrH8VCpuIU74SYquEB1tBPmggGnVoFV1J3L5ph?=
 =?us-ascii?Q?mEF8C8b4qjO06zKz6h3KTbwRhnlkcn7cnj5e7GRLufc+qlHkxtO51184fvVP?=
 =?us-ascii?Q?L+OB82s0yUc20QeVtdA5FJYRP9MOuAjoRjAsjAHIUwRwp2G7NCPTLTZd6NFp?=
 =?us-ascii?Q?ipSMRoMNeDqd/HJFDZVrqGNH4SF93bPnWfTwCmOeBBVd0BORR6dOI+B5t90/?=
 =?us-ascii?Q?2/Paa1v1nOZ/fw7WVsQkSss67ZtfV53GZYeiMa6uCGZ/zQ29WL7kK2mcJYGq?=
 =?us-ascii?Q?0JvmjHQyX2hiDzfFJSvvyM1KH+S+W7KugwHc7Ip2thd/LBAUT5V8C5X/fYuQ?=
 =?us-ascii?Q?7w/XJ/yMlFsVH4CvrE2xrh2EywrIrzDiM/NHAVSQOIHhta+X5H5tW00Ha1hu?=
 =?us-ascii?Q?wTBmUIfUBAWVjLk5fW4J46h96X6nTH2uzGfSbShgapO8UEFw4VFXo/FFL9Ct?=
 =?us-ascii?Q?Oh/gqbbjvSBkFpFj106RLaDzUrRbPpFQPijUMC4gTeHh5oLHwLXoqbkgIHaL?=
 =?us-ascii?Q?WYt3BGRytxhnd9QVwXCvKsU7jCKzMmDDVbOVQJpww2xu/feSe3oNuLrADe+p?=
 =?us-ascii?Q?96oo26AzbF6/6kByDQYy/8m8yumuTLtX/dAHPfUxpr31Fbv2JMMBoYaJhIPY?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d6ad51-5eca-437c-2579-08dcc13cbb73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:22:56.9571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0EN2QysfcbPvzVY6lQEN4jTZakrZkSYeytqA0hpSeZ0I9M/8nx4ODUm5eKUBq4sj61Guym7LpZW1+ZGrW+pKKAhJP2IkQlORp1K64ebVf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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

On Tue, Aug 20, 2024 at 09:01:29AM -0700, Matthew Brost wrote:
> Testing on LNL has shown media TLBs need to be invalidated via the GuC,
> update xe_vm_invalidate_vma appropriately.
> 
> v2: Fix 2 tile case
> v3: Include missing local changm
> 
> Fixes: 3330361543fc ("drm/xe/lnl: Add LNL platform definition")

Is this the right Fixes line?  This may have been discovered in testing
on LNL, but presumably the fix applies to MTL as well since we also have
a standalone media GT there too, and we've had MTL support in the driver
since before LNL was added.

Of course both platforms are under force_probe at the moment (and MTL
will be forever since it's officially supported by i915 instead of Xe),
so it probably doesn't really matter too much for backporting purposes
and such.


Matt

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1bfd0b6e955..4cc13eddb6b3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3158,9 +3158,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  {
>  	struct xe_device *xe = xe_vma_vm(vma)->xe;
>  	struct xe_tile *tile;
> -	struct xe_gt_tlb_invalidation_fence fence[XE_MAX_TILES_PER_DEVICE];
> -	u32 tile_needs_invalidate = 0;
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
>  	u8 id;
> +	u32 fence_id = 0;
>  	int ret = 0;
>  
>  	xe_assert(xe, !xe_vma_is_null(vma));
> @@ -3188,27 +3189,37 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  		if (xe_pt_zap_ptes(tile, vma)) {
>  			xe_device_wmb(xe);
>  			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> -							  &fence[id], true);
> +							  &fence[fence_id],
> +							  true);
>  
> -			/*
> -			 * FIXME: We potentially need to invalidate multiple
> -			 * GTs within the tile
> -			 */
>  			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
> -							 &fence[id], vma);
> +							 &fence[fence_id], vma);
>  			if (ret < 0) {
> -				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
>  				goto wait;
>  			}
> +			++fence_id;
>  
> -			tile_needs_invalidate |= BIT(id);
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id],
> +							  true);
> +
> +			ret = xe_gt_tlb_invalidation_vma(tile->media_gt,
> +							 &fence[fence_id], vma);
> +			if (ret < 0) {
> +				xe_gt_tlb_invalidation_fence_fini(&fence[fence_id]);
> +				goto wait;
> +			}
> +			++fence_id;
>  		}
>  	}
>  
>  wait:
> -	for_each_tile(tile, xe, id)
> -		if (tile_needs_invalidate & BIT(id))
> -			xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
>  
>  	vma->tile_invalidated = vma->tile_mask;
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
