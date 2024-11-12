Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32D4D597B7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 23:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBF010E1BA;
	Tue, 12 Nov 2024 23:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h63zTDyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63D10E1BA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 23:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731454701; x=1762990701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=94ee6L9yUDix4ITCkodWh3z5bWgQm78SPTOSf+QBisw=;
 b=h63zTDyiUgY/LnMfsnYL5fvf0uiJRTaPP0wvTDVPFH3A1B3ZQehLM0X6
 /kFSmJlssiZTym0qBk0oJIEe4GYIXyAQ3R3CmUd5S7Qnc6PU6JgvScKf4
 /2kj5jkw0dmwv0oDvRQNlblVoUySQR5r8p1MazSdnwrhRpgh2wJrNRVsJ
 /d9DBd3QIMORcG0xfjBrZXp66usXm9Z05cXzCJXVjfOgjifOU0LevrO17
 ZBoLef+JjUhv9fxUJa417yT8T3f1uuzD++lQcpAkYeDgq3r/usY8hxOmi
 VfUVkaJxwXMts9h6Yvc+qoDPNa68kzoMzLoLyt2Qf9cx/flucJ/WUTgX2 w==;
X-CSE-ConnectionGUID: wjaufFxDSICzcT9D2YmHDA==
X-CSE-MsgGUID: lUbtBRf3TPGgLl+q2dxe0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53872775"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53872775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 15:38:21 -0800
X-CSE-ConnectionGUID: LxgqKTKFQka+DSz7QBxMtg==
X-CSE-MsgGUID: ZkOzWJlqQsqoLcuAuWuzrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88096064"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 15:38:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 15:38:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 15:38:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 15:38:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQC6tDzLYIJnUyrwM/1kBOyMxDf51J+KXti9Oy/oSwyo57Z4R9TcNULgkQWWSysRRIV6wPE2FagV/1GoekrHKrR1UDs9M4m7I7jgqfTRxo4jnn42KymG2UswgvJ8FkUsxy9I18QBBrJawuBwVFoP5Rzg/4sdsBEoykDV5bDtSrpf3Tf2USxA0V03Glib/LU7P42m6W6lchuTlBaFqi91vj+SMaDCHVIsmDZv6DhzMvVG0Bdm3l7wkYwxbP6XzcF1zFp7dlnmDjcSMXUQxQKeUs0hygznbCdcmqnIGOsf49FVg/b5JTnHEbRU/cxa79grOzSUXE1IyNfrjQAndO4Hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj0p/Sg8kdm1g/do7AHRDmA7OEX1G6E0fPLw1lf6jyc=;
 b=y5GZ12yVDJuPjvmKieCAEHjOqcoJV+5jeg90xNIC5mj/rW3RwnWEk3F0nbMRSZbziqdBokV+rmi4NgbNgMpQb0J8wvYyPXcTa9oZ1pYvXRUUoZ1pv5JvxcSjGxIHoltx/6nH7ZRi+pj3QVcwHmdlwQjpWqKQyWvc4x85KhjUNC28xrK4ySdZOsDMifCDlUdioK2VB5nKtK0ruPU0OjJl3DNci+2tpHYEN0e8ZEEivP9t2DKdkbXc5+eF/RDwG+5ln1jSDuDm4U8nYSZjAIdsym6Axa36N1siYjJEdc29a/G9V6FvFHloG06ZUF+2qbQQtPpzmsCIC1OJ0JdvIWyVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 23:38:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 23:38:17 +0000
Date: Tue, 12 Nov 2024 15:38:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/xe_lrc: Fix context descriptors
Message-ID: <20241112233815.GL5725@mdroper-desk1.amr.corp.intel.com>
References: <20241112224947.69243-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241112224947.69243-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5cfbf1-df8c-4b4d-5b5e-08dd037315a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VzjC0+drf3DQkd34oWKLDOdou1qksgIf32L/S0JS4M4ewRysO/wzqeeRFabg?=
 =?us-ascii?Q?sSMVOQ1j0pp9/cBLA+DKIN3HjlSwsQJqKU+dvPHPqs+RS30QuLoCnCGM4Ieb?=
 =?us-ascii?Q?GcVcpdJGRDwWdb5UuViADqZyRQqUWqdmEVpnNNIzi73J7UJZ5DUtL4zp8AKh?=
 =?us-ascii?Q?Pwgr4b2FiEtArSSKZ+PGXgb3Z5gHLK5ipHBgY8BDeC0Rd+ZvmQZgeJ7tTSK4?=
 =?us-ascii?Q?m0qON0k1T1khDyrc/y/N+LudSNs1HDs/vMQJZXQtEW26al29v2WnCJqJV3ep?=
 =?us-ascii?Q?l4AJJ3Wvvd0nm0aOqeg2smxSnr2rHLBatnU21AP9215oZbGf6YZJ7L349tlR?=
 =?us-ascii?Q?0CsA9PBfj+0sioRyAochWqO1YOGdqIncNVrP77O/m0nZGCUvkE9T8ki8DE1I?=
 =?us-ascii?Q?ZVwj27oFZIdpuN6Ot4r1JQb0PRDnDbNSbYSinDvxXVWOo9yHkis2val0zIIC?=
 =?us-ascii?Q?cP100jRAW15f6lwRGe8jzHJa1BzlyosYGr6JaRI6t3pzNAY9x4P9XH6G1nS/?=
 =?us-ascii?Q?kYyacpOjrKJq7ykXrCwyhpqGuEKtIGGPf+GsyeIgEnFwc1QyYOvmh+HNohON?=
 =?us-ascii?Q?x/wvFx4KT1q1ryp6lDhWoF58NO/vYc/LGlTZwxEnBQPm+9s4LQSeSqEy/ctd?=
 =?us-ascii?Q?g6Bt5VjuXRtHRHX2eolZ6+aB+r6LB/MUFshzD5jJomLXLBeXx3t8wiA0Oqm9?=
 =?us-ascii?Q?FvAp0DZBqjyyd5w53AD7oJOQhXuZG5XXV56MJwxr9MT/M+2y36Tj0RwyJ+5k?=
 =?us-ascii?Q?EqLW9NAYYltIEGofLNiS+c/+I7Zc/WORgTQ2rcNW1hePwjw1jwlk4C8V89Tq?=
 =?us-ascii?Q?ERvnJZPLYWGmA8QCxBKjLRXWQ2KLwi1yWmOBI0mW9osy5zp3nuWZJJ8/YjVB?=
 =?us-ascii?Q?h50/o0/wJI2IFZELwb8NSB7iagwPKhDMiEc5hfTfW325lF2XXl+drLT1irVa?=
 =?us-ascii?Q?impQBOR7sQCLUx0HntEzcbTKXGnVTUjhCWJNBt4Rdhbgzvt9Z12unzkxKw4x?=
 =?us-ascii?Q?k+LkAmFJEHCc6uiv6SyZVduXdVmF/yPQtxxG9iFm+46j9nbardF+LfpIbA0d?=
 =?us-ascii?Q?FYbZsmu30wXwvU5Ltf5ILGjT82Dml6WVcCpkPl+u2hIfjPXA1Dtn4leCO+yq?=
 =?us-ascii?Q?BxHbvNgCooO2Rn2n+P3VgsFkGLYJ/gaPQeukPou/VCrwFEOcS5anImlapc3F?=
 =?us-ascii?Q?T0/oSo7j8bevFy4bfuZwnLeN/io4/8Gug+4B51jKLZTCnY3Gc8RseKmlZUJp?=
 =?us-ascii?Q?NYcgeqT67nPf8aWc2x8/MibzZ9kwgLla/mze+4YtZyRuQBE2BegvqqQ/92Mi?=
 =?us-ascii?Q?ZYd7O5OuktAlcvBB7+8YkAK0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e3edhm3mu/p6B/i6XfGbr+4Kwaj30SekI4B/bJoPQC2c3w+LzCWEYkKSybV6?=
 =?us-ascii?Q?SJ5kBi2rYrYZiPU3XOncTKRKGA5zAR4jjcC73rqbf9seWv6hUFganw74q99v?=
 =?us-ascii?Q?BC5mZnylANs9AAALB9RXVMS3cEdK9v9xscRPnorzMNKP0iVlMJ9kBxAOIHU6?=
 =?us-ascii?Q?c/UHCXmDuE0R5Y6ieBzpqlmIaYSY7xg1h12Y+y8xbmQ7sBxKwnqvmPzaTpRD?=
 =?us-ascii?Q?hvlPgcco1KPtO6hd7FWONjgTSLGGqt0+2pcONhjO1AF092jlgA5v9u6BruiX?=
 =?us-ascii?Q?XawL/VJdmzwxULdoH1dASALuJDMOMp1UbmvJsDLRyzRss5qHyvdVkq5byPJd?=
 =?us-ascii?Q?3cuTpHg41G+MBx092EnYE10/igx56Jd+lLfAz+lVNfszhsjCZdG8/vsr7DBI?=
 =?us-ascii?Q?cfbHZ4EpLkVao1ByIL8VXHEdvfxhZXizP6ToBuouCFx4vM9hTbvZMR+54Lhv?=
 =?us-ascii?Q?vjb3942m53nZV4GL8w5QUdkmerwBf0VmvUEB5UjRobXz1ST5D51B9qSjkTxa?=
 =?us-ascii?Q?16FOgwOLYCGkDevDrfQnPCDXQNerTsFcbT9K+ttvNUJXA8jQqRxsgr5MapBh?=
 =?us-ascii?Q?oFIc6rtRGJZlJWhLvTWizghmWNeGCpNK7xx7XLbNxNxqlNvuTGsRPOUT5UP2?=
 =?us-ascii?Q?EIadCEOFvJfjkpxo6TJq5jGDuLLnNyrzKlnrKm5zFbVXi7RvY2UHbe3P2Vky?=
 =?us-ascii?Q?ZwCZ/VwD3EmCCBcXjx0Bb/rJVI+M5QlSgMhOYGFQ37T+QcrnvLZft4XYegh0?=
 =?us-ascii?Q?6nwVnzTl8r9BhXQHVCDO891WT0Daj6mGmqJX8SGWU9O+774Mo+8jbr2O4Oy0?=
 =?us-ascii?Q?Rf+J1+mVf4m25lizhb+kwycnXHEPFuv2dAeSD9WdBVLAzPkRKsV1lnhKeJ0a?=
 =?us-ascii?Q?ZUsF2jGX14JDEvd8jOQmn/tUIFZYINWqDwvDM4jAi6QWMIUW3x4HF+SLT37p?=
 =?us-ascii?Q?b9nhM1Ja9uZQpVJ+2LhBofjw7y7nwWFDoPq3mvmp5u6sPQSN7DV5ClhJ2cPj?=
 =?us-ascii?Q?7U72HcM3LWqhzqHmxuTEPpLTGp8fcBKmXWGIbDS/05p/ap+o6+9+fzqCxzIt?=
 =?us-ascii?Q?wx6HodC8gpoHOu3HBHcyGkfCBEXaETbVn78dRTo67mzQMY1hO5iG63ZGj+s/?=
 =?us-ascii?Q?tnzW5X5FDEGu5y7WA18LQRXiAo7HxDbU3EpYQ0AjmBENe95DdfRsIbvm4D8d?=
 =?us-ascii?Q?FBTYjIlNp6PTofDyoZc+rrmuWYIPdKKzz62K8MSBDEgBlT+P2vOz/SZQ4OVT?=
 =?us-ascii?Q?KZ66x48Ne6PsVLMBG0e/D9lFMzrQRI5QIEV2qyBm7axfXwmVjp+Rp7g3mEiJ?=
 =?us-ascii?Q?PKhgZ8sVWBfMVkLZi/MtX1cXsQZ/VzJcl927xEQ6QxDh46fW2LHJ+DQ5VvT2?=
 =?us-ascii?Q?T4O6ao8bsU12F0KzmQqaTq4Hw5OaW3aoGIjC5kRXDkX0d04OtNOnDmCsD6lH?=
 =?us-ascii?Q?MjZg9t/K0pWH20VFzPYB/ulgMXsINC+T94Moh5pStV31XK1qRNX0lb9laBQ7?=
 =?us-ascii?Q?SgaINXIQ/eTLdylpoYNpbJnztquZltHbll1FBOP7H50mFlVPh4NsmH8TObxQ?=
 =?us-ascii?Q?OnHERpSbQWFaf8dspVlIoh8n92i/dAW6SOKV06u24kBQ0OZzfmnT/sMYW/mt?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5cfbf1-df8c-4b4d-5b5e-08dd037315a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 23:38:17.7530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxsXpsa4HNuvQEkSkmbyezelf2Xfo9U5bOWEnlXW70+fVVwp+RjCiU877JAY1lntnMT9VDtXIEGTiqkfZB7ymnwz3N8w4VwfUImgrsswYjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Tue, Nov 12, 2024 at 10:49:47PM +0000, Jonathan Cavitt wrote:
> The direct and indirect context descriptors in xe_lrc_snapshot have
> various problems:
> 
> - context_desc uses an incomplete 32-bit offset into the GGTT at which
>   the LRC resides.  This is not the same thing as the descriptor itself,
>   which is reported by the function xe_lrc_descriptor.
> 
> - indirect_context_desc currently only reports the indirect ring state,
>   as described at xe_lrc_indirect_ring_ggtt_addr.  The variable name
>   does not accurately reflect its purpose and should be changed.
> 
> Fix these issues.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 6 +++---
>  drivers/gpu/drm/xe/xe_lrc.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 4b65da77c6e0..c280f46fbd75 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1635,8 +1635,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> +	snapshot->context_desc = xe_lrc_descriptor(lrc);
> +	snapshot->indirect_ring_state = xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
>  	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> @@ -1694,7 +1694,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  
>  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> -		   snapshot->indirect_context_desc);
> +		   snapshot->indirect_ring_state);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
>  	drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
>  		   snapshot->tail.internal, snapshot->tail.memory);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 40d8f6906d3e..c281bd690846 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -25,7 +25,7 @@ struct xe_lrc_snapshot {
>  	unsigned long lrc_size, lrc_offset;
>  
>  	u32 context_desc;

We also need to change this to a u64 now that we're actually saving the
full 64-bit descriptor.


Matt

> -	u32 indirect_context_desc;
> +	u32 indirect_ring_state;
>  	u32 head;
>  	struct {
>  		u32 internal;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
