Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30F1C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF9310E38B;
	Thu, 10 Jul 2025 21:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OccZslG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3406A10E38B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752182974; x=1783718974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ujBrYnG8yqmdsHR5xaRL2SGwxBeFgrpTUyE35e7+AME=;
 b=OccZslG5qS38TGe1g3rG5qQ8n3s1QKiYBSyCD8H8cvAiFI6NbrkNK+rk
 ygKW+mhm/O4fXG/p3jduiBIaVA4Uu05inOaEjp+QCiPC03AL3E2x10Bs0
 IBU7c15e1RKX3GJuQzw9Al7m2KFlJxUvdNO/MWBICUD4STL5iijvo4hAz
 KjJKYN33mA0CFtg4TH9r+ANFkh/GBT4Le43BXIvjj3yT0T69ZIfkEBskl
 bEmIgaHJlaA3SPkeR80WuQ0S9wDwQVizeewNL8VY3IlXCgjdUqao6mARD
 JrY4Fs99qZkECRJaJhXzFwLDZA7RnpkVH2eKM4Zc2IbIiABY3uqK/2Mbb g==;
X-CSE-ConnectionGUID: UGFltJ3WSHK9AYbSUD5StA==
X-CSE-MsgGUID: 5+FQEiF7RTmr3PPb7VUKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54449308"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54449308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:29:33 -0700
X-CSE-ConnectionGUID: BkoN7CJDRWWNR1FqqwxiSQ==
X-CSE-MsgGUID: LRC2wjIzT4aSi8MHRAW5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160756584"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:29:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:29:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 14:29:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGzoN96O2uXoPbW85lTE+zIdgFvzNhfCfMmDZxSn9686fFeMCCk10oxf7wNydcxHeW4x0xAb+G6aqWrxPSMiuJRU0L69ndAkd/O8Z7WuaPw7OBAYkwYgzjDQa8qtIQUIpXH7MlU3i42ncBb2S+QhYk4tp88YY7U2qgruHzEps4s1FuudLDoJTnj38YkJZsP3Z+clhoYYH93PZw0BrUs8s40kHAhHkIb++Nh5J2VDvl18d5VmwhX3PJbJy6K9L4Tfy5rMH2oBLEn+HXEmG2wDJl2fpbgGOB/kA/LPt6ICuY6wu1qESpGvhhAuBc65t7eQYVczEtwspfFh4lo2GwBycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RkyQ9Esf10kq3G0VfqbLhND0Mia5OTPsLhmNj32Ffc=;
 b=f2VoguEtiBWg3KY86g9Bm9lpSqFsN86hjX3uv7H3keEyl1DtiaMg4f38UUksB8kQk8FW4Gw/lYhQiCrl30kId29gX9T+HIkcOENLDmYeNh8CBKvSkJOrLCXQNudhUJ2lj3/vc9PArJNSfNoevYyfjsZOuO68bGqFCl5UCZIWzveZbtvqjagvt+4fJDUho8intgCpsh5I444VVP8TH6vOdl1R5mnnAKlyJxDaiwmmHmL+qRYJ8PyTWYang7I7a2/QDNJIEv57vEpkNcXm3ZEMgMjpJ7aK3AEemsOli0MHyjPidqgvYNulIke96i6/MX7x+sHlnS7o4czUUbKxNurLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 21:29:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 21:29:30 +0000
Date: Thu, 10 Jul 2025 17:29:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Message-ID: <aHAwt7pfSBG3Q7F0@intel.com>
References: <20250710205413.1105595-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710205413.1105595-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYYPR11MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbcf4f2-2ee2-4118-08bd-08ddbff8daf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5jV3WsTzjVw4wdp5SvTSWSX7uVBeDdYb23K7MOYGkOxF4FwljGXOc+0sNI2T?=
 =?us-ascii?Q?rNPceesPhGa6BeNlkfjGMdUkUG2CKpBq36JfQ7/SRbmYEhFLcYoLg73kx1g5?=
 =?us-ascii?Q?G8gPM36x0ikcZBExPMrXisAaoWvgmfgDTzXjyueMDYl9nzsAAfihPtvO1Qg8?=
 =?us-ascii?Q?hY+oLex0qnXvx64NMCb3tFhO7JI3njUJshu0i3MtcbVZil6c7eiBdSBE6ySy?=
 =?us-ascii?Q?pgM76ZUfRH4VsQ0aVOFrnyneAFk9ouHS0JCHgobvDye8uWwQVtgTbHrd5cg5?=
 =?us-ascii?Q?zPyQKAlJ9DEZynbf9JxRdw76y/T+myjr3CgrUqekhHsIyKTIjqNDZUzfNb9C?=
 =?us-ascii?Q?O2W8jXVUzRCN0NbtqSGacReOZAD6/T8SJO3eSxMo5N2f4ldxgrMy07E1AiJm?=
 =?us-ascii?Q?Zt6WQGSb5R+Pb4iInvI3vXOJsZrFAtfZaNV/kYWMWeIj10Z+UkOEaYhhWoEq?=
 =?us-ascii?Q?Ws6t7zfxHhumN85CvbVBZoO0/b7GjjXw6xxD1r8rBf9WvEHIzA2efw+t9rrk?=
 =?us-ascii?Q?UA3W7LsIJehbLgGhwViwksQA9Y6BbGvHaoC1sSM5/Cl36v1lB4BLsGm3JMK2?=
 =?us-ascii?Q?gDBcJwVjwFOJXqLcr1SXm8LyZoq0G2jgK+bpJlHohOx+VMULf6iirNzt/9wW?=
 =?us-ascii?Q?hjHUeTSlv174KfiB5mkFcKULdpivw8pJe5p1h4A2a1v2lCXRXrE9Nj2IVgg0?=
 =?us-ascii?Q?wGUxmcE7McBk6cHbve8c56pqneL8LP1/mjpuAG3Scj4/OQSpB+RZtYdKB3f+?=
 =?us-ascii?Q?XU7/PVnTnO9QkT7mtVXg1oQvNxFTSkcdM2PeKJK/6o7aqeJ/vSFde+I5oZfk?=
 =?us-ascii?Q?hXuqcT5Fu6ytTL0VS+/AWht/mETMCqRAzRijdZXMLKWvAAPKaRZ/lYvv+x03?=
 =?us-ascii?Q?wGTKk1TsIRoB1lFqOAifO8j+VK3Rb0Vz+UzN/r0XcmUzpxeihWYhb/07A8px?=
 =?us-ascii?Q?MLYVPf0dkUXqy0DM9x7u8hBl4XDr1UzhzwA2zoQ2/1ZAGwgEj7nsDG7kN6I6?=
 =?us-ascii?Q?46+vfcaxnxX+3/SQxIHqPb1dm+2iBHrG0zxkkghouNQMWtd1i8Oq3Fy4R6S1?=
 =?us-ascii?Q?ythv51U4W6Gz3igo+WYLTxt2PiUksXpZuBDgUF3IOQvqVmrTPuXDk3UybVR6?=
 =?us-ascii?Q?+VxHJW0GsBkcgyiKJpj0DMC7xmJ4Pf6a0J/cGqpVqdgi9l8MtU+pd9w7MmTG?=
 =?us-ascii?Q?3RV1mB3jBKJeRI7kTdPcA7N6xMULDrO4FVHCYZv2unDqmjXdtn6wF5xEumrv?=
 =?us-ascii?Q?j4sjTP6YmrmyvRy5ECWk3iB9dY8nRJnY9PtQXyB0UeOKyNTzNWbRiEHqH0qe?=
 =?us-ascii?Q?9AqPuKTtsn4pF6rsx84mBLVdeLKQJk+V+iHcKtxul6+jxmlm5QMpoJSzlTa1?=
 =?us-ascii?Q?LadBLPbutU2Rok9T386bfkGf9ZTzFIdrrrfBvt7E1nlLJGYLIHVAnEoQIYaZ?=
 =?us-ascii?Q?6gNOgOMRfk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bXuHpX8vwshOWWYqWYto3xqd1f/1914Hy+9K3wO+A2guXeJo/HLoVA0vk4pf?=
 =?us-ascii?Q?c5jh885Cs0uxvhQmIHEmnRLbf7NgX4oWpbgfPUmBQGgdKE27cw0EQLoKOCaJ?=
 =?us-ascii?Q?LIf8zedvEeKVyTQ4MxHmgvph+Pbow9aLzRe7K09G/VipnmEPTUMRhe1B7CC2?=
 =?us-ascii?Q?uT7zTvDNnS/h9tdwDt+9Sue2IJBQwguuxGMalHk7X4gQOoZhyZULVv4QF77f?=
 =?us-ascii?Q?j/BardSH7mKfqjPBKVnNdl10jKrva1fpwgN4RHELW6OpD4jBGOmsU0eKjwbZ?=
 =?us-ascii?Q?Mlqeklniwmbet5pcdXww3rPGZlbOpQYKo3ceQuPjFVtW4cZV34s+3MlMC7RP?=
 =?us-ascii?Q?XyxePeQ/tIqfeWjdVNDcr12QpuRpK8XWkGi7SXNfRdJaTRJYS2Q6noPG+8nL?=
 =?us-ascii?Q?hEZrgNYe1PFSqng/8uEkZ038scyxlW4OxswYqGe9U9roZlV7JnTeL9xv2Bge?=
 =?us-ascii?Q?Ia0xph18NgzrmDjN1jZxdcMdhBMrjKNq+hXanxcpAt0FDggv5espC3tr0Q4L?=
 =?us-ascii?Q?FajhUz0lAe+mqBKp1E8NdpAwNvggey139/5z8xbS2FdBusGcWUB9MM63ckZp?=
 =?us-ascii?Q?Cy4Pu9zNsQ7LJ7oGi52HoTjYw6WA52OH+p56PyKZnTLKhW4O2sMRzAHoBxvk?=
 =?us-ascii?Q?t6lZAAWoddQ4jV7jJfTrDyrS8lGEpBC/Sp04OZDRDH1wxIpUe7lAAIdpDtEP?=
 =?us-ascii?Q?+F+W2GGfLjHmLiftPXULS5ytizgselOK0ssgIVJZlWw1C87+dH56PLOgf3EN?=
 =?us-ascii?Q?2rsQJA2y7sF4EK39ayNwgpaLgIA1TcVXJE/e1kNdKog7JuCnFm2UQ3tM77bX?=
 =?us-ascii?Q?7tM91WGleMUOkFg5eEXPIak2gN4x57lU/EA4BfTnoCFvI7LNkTfjJFOjbzHD?=
 =?us-ascii?Q?sme0IYHK/Gc73HkHKY2ma3hYua7zucTdGgrB5dNaRIM1lHwlogEqEkOvivOp?=
 =?us-ascii?Q?ug8zCasSCKozyIf1maM8mdWFbrLbq54MYoidGeMwlNt24eJxc88Xus8Yjg2Y?=
 =?us-ascii?Q?L1clUgIAfJMg5GPyqvvhySEmM9zK/Z2RI+n3wvbeLVy9OpHi/aAk1izWynjy?=
 =?us-ascii?Q?fhwKJhc68oFZP+9cfswUxbVmq2+AHRFeQQVJ18Y86Qg6LkLysTmpWsc6VBEw?=
 =?us-ascii?Q?00f5OdVLSRhW/2/jiRBOhZxXGuneJ16XBMVwP6Srn/BoJS+SanVH7RFuUPKK?=
 =?us-ascii?Q?Gf7Zx4nKMPgu1GuQDOgo7QCGedCOnToWvdtoOI49rTOaP9uQmlrZdVi4cBvM?=
 =?us-ascii?Q?YnkNm46fP6JLaYMlzqyRvUXPF6xnyLwdGqdq6j1jBH3oBlrINn4BehA9JsSU?=
 =?us-ascii?Q?/nsUTGN03R7CRW0cLWgP+Tt6WMWNHgmGki7nYoklMD6feI4jGhDeNKlPbDEA?=
 =?us-ascii?Q?vxaJKawd5uvwvbzkBlLhdDtkiDfXWtitW3xTAim0zR+ItU170PLyjlOpM3Fp?=
 =?us-ascii?Q?CHEy6G+9J/sWHE+pNSr+pecuvE2LC3yxNWxgGQa7cF7bj0eplPxfXITfK0Hy?=
 =?us-ascii?Q?4hjAHdEjLMvjE8m2GPLii39X3u+RY9IHpiMKj2k34cf2O2yI8o+HuG8dYJyP?=
 =?us-ascii?Q?AEQ87o5BshNkXyiAaXsMuhgn0RJ2iFXW8elT2ltta5pv6MPcFgx0HHEARuWk?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbcf4f2-2ee2-4118-08bd-08ddbff8daf9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 21:29:30.5167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm59ZDuZdggYX4T9KCbc1fPPPPEPbbYr6SHmbFdg+y/8vT6893ULKCn3cVDk9Osj8qJuLCUdwyMnPpGf2OBCog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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

On Thu, Jul 10, 2025 at 01:54:13PM -0700, Matthew Brost wrote:
> The prefetch code was referencing CONFIG_DRM_XE_DEVMEM_MIRROR, which has
> been replaced by CONFIG_DRM_XE_PAGEMAP. As a result, prefetches were
> limited to SRAM. Update the code to use CONFIG_DRM_XE_PAGEMAP instead of
> the deprecated option.
> 
> Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e875ea4658a9..2035604121e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2380,7 +2380,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  			ctx.read_only = xe_vma_read_only(vma);
>  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> -					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  
>  			for_each_tile(tile, vm->xe, id)
>  				tile_mask |= 0x1 << id;
> @@ -2887,7 +2887,7 @@ static int check_ufence(struct xe_vma *vma)
>  
>  static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  {
> -	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
>  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  	int err = 0;
>  
> -- 
> 2.34.1
> 
