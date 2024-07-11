Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2C5C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D0410EBB2;
	Thu, 11 Jul 2024 21:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPA9ZPu6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5127710EBB2
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720735030; x=1752271030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QQakBy2guD+MdXVzgR6OEFdVsksr9F9TQtZ3z/9IMtk=;
 b=BPA9ZPu6RomIBRwr88Lbh5hcATiJbSkp3C1IPr+liA4AnpxaJ4qflPro
 rJ6WVaNcN1o9hy1jtQBTVhgfyPH5bofHuyNYkMJh8B3oXO1snzeOhcXHx
 r5e7BEv6h94pBu/IoaB0T0FadZvF/UQewtlpFigJtdxsWzEw2NO2vda6R
 zacCC0Jau52eBvIHCp03rnP1U74G1p4lMNWpV6GXCu5NCsE7M/SmLb4sG
 Cn0i0gwzKzN7taKbBUZ50x5Uh1QkSZ0Blkc6IJJC4MGwF6Ow9eKHM1chA
 XZqA1ean9VF2xkhVOsbq9b1bwPB7bwmKiLqAIrA5+YQ2wLByunCx176wB A==;
X-CSE-ConnectionGUID: xcBcy0ACT+2iC1MMQIR4mA==
X-CSE-MsgGUID: GEiRLo4eRHS1g44Nb/WekQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="12509642"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="12509642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:57:10 -0700
X-CSE-ConnectionGUID: N6U0m1WwQRSTRO7g5JTOgQ==
X-CSE-MsgGUID: WWGp8dMNQ5+LBwxst7tTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="48593659"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 14:57:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 14:57:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 14:57:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 14:57:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1phdSXWrfumLFfsc8izRMjvAPBvXKcl4kVbMjwPIfYTz+cU2UfEryY1mL96lz9S/Vj1HixQgy4dEGMDi7mfOhOVEL0P17Ks2jDsrgWu34Hl43QNOYtLZoigqwvzTaMtdUxMrU03ua8hGUjY/OlMDiFwaRZEcTFNLJi+lW3o3L7hi2fAS9rDuUrJHl7fc/V4rPLbKzJuFHtdk701jWvKnMxogCP6QDJqSeNkDX/TQq5u5qbsB02sS4TNcV6GAoaDHYPZYkwgsM/03h0UbsYpQVp7hXPKcJOR9IQM6E+9u6ScyvEFh/aF919bImazjZjPw5gKNorWBEJqL7WhrpM8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RwJU59rjwxzzdRvlKGBfL7Mjg2aATqOn314ILCCPmE=;
 b=nG4P333Kl054sGTgFlD0CkfFA8scvBFpHIo907Uz03gnOqpLta01Wns7KNT349/Fsen+33R/fWaFT0TSMpsqGAWd7JXaVaFGunQuz7NNtQYjjaAeksDkUo6g6DwsJORhPEGR7wZzaWEiJEnVMIK/0GtIvBi2M/KbzzOrw0AbqhHUftGECXFu+COOSDwmP2BM9z7BXyo+JNifbvWL0x1C6LGw/VrirLTYOzaEMUbma05ilmkFwEWQKxZjRMtmy0HqzxXKq2oKA+eJxi+VdHwbp/7ACvQNeLFVgz+df849a5NG/GUPg2yVn67tvT+dIvCk1Fm47vPMPLR3fWFj098Y1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 21:57:06 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 21:57:06 +0000
Date: Thu, 11 Jul 2024 17:57:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <ZpBVL6swLx_ht6lw@intel.com>
References: <20240704061203.3464835-1-riana.tauro@intel.com>
 <20240704061203.3464835-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240704061203.3464835-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b50fb7-b830-4beb-b0f5-08dca1f467c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4wYcppTwTz6XxK1G0szEr7wOerbnvBBC4VLLAg++DWaJ+gmO19XPB90nufL+?=
 =?us-ascii?Q?CtKUX+WvhKGM/QpI0/uBsj2Pv58qXd24Jk1hWMjz11ZkeHegaSlBmkmhoxkg?=
 =?us-ascii?Q?dYuKQKVPhHkcW4to3ov5LPpt0dHlgwa9HQFx0nlDxELJezKAlQxM2sifdMfq?=
 =?us-ascii?Q?8GLTqB76yZAaGL4B5xyD+KwgJg9QyhsU2CtbfYpH9xSRpIwNCjcm7g8/6b1T?=
 =?us-ascii?Q?J02X9olfmOn4o8RAGj3IA1CuT98yLBvRIqHtb75w3M4DwaWzd72Zd/ZRze2m?=
 =?us-ascii?Q?hgZ1hiUgYC3lgxkyVR6d1CCmC5nxs7ftVBWj6DKYsAabzVd88EbckzobtFYc?=
 =?us-ascii?Q?OURr8MeqO9SbaXUlwqgBUS4NCpvdXM7q/odGifZsfnwxO0+1gtdbRtDcFD5Q?=
 =?us-ascii?Q?NXawiJaIBK263OWpS58pWeTsJX/44W/MMSRUN8Ab6JwkN4T8lHybuC23QA2k?=
 =?us-ascii?Q?YN+XtN2rAs7xsiMVL3qEbbdxT2sgjWXVNWF5OhhOtrnItvXLR+j2/WamB38W?=
 =?us-ascii?Q?zhJSFkcISazzoUIiM4W1tDff072d8VtwurzL7sUdhFinUJ+tMlfLuYc+0/MV?=
 =?us-ascii?Q?q2M4T1h9tKAQ+ctOQtR3T7GS4RXmJyvjelFyTEp5d1/a7+Nz9jIsbSLyeIA5?=
 =?us-ascii?Q?tvXBHseFEtStqYLYQgU4BC7zOw/tigUmvgWk69XAQgjV6LVJyBGOZgFeDCBc?=
 =?us-ascii?Q?cGM/iG8krVoS6+e5FwTJ0nMLuQnxdULwcJnA14li0EEGjFoLr7vuOvglGvFp?=
 =?us-ascii?Q?ee3BJtvumB0Su11KsqlJfe73iyQuhlvZ0y4lrOvgym1r1scVEAwfepnPISeb?=
 =?us-ascii?Q?w9eRYLnHA1saBxWaNyULklSQ7aOWCM0N27eqgWviwyQE8qSSYhFelntc3Pcx?=
 =?us-ascii?Q?0vSKvZMBiSwT1ktgowxHnaOF04lxgYlzjbD7h6V4RetwVO4uPEJy9l0qqLye?=
 =?us-ascii?Q?o8dqbRHKrZJpAIt7c4hngCTKZJagI0Q5ZR+H2yVa5Z/tD9/IlWIpZikvo+zX?=
 =?us-ascii?Q?/F2ZG5G7swMsS53S5VrbKNXJ7kxMLLT3IawLEzLfqXvxD9P5dxgCq1OqRK2I?=
 =?us-ascii?Q?O0nrkKbkV1UKNnaDURAXFG+0VVG5F7UWanUF9Bik/wRrcPGqk3gMpEQb0AAY?=
 =?us-ascii?Q?aorVJJSrR4eBPerW4OkV4Diz1xjJAb2p1A2WNLVVrgR3kmPrScLY4gE5byIP?=
 =?us-ascii?Q?NdWCGEkIzZpqRwDVNaGPz8oTt1TdLrlk61pq26x+f5KXuwMa8TPY/YMWHutE?=
 =?us-ascii?Q?wuYXReQg7koHzJnMdbFCstDf6h7YRNRWlkf+vxPX322VvNb2qfaxcVCq+Jr0?=
 =?us-ascii?Q?VX91y7t0yzZBJb1NPqbcFLqRWFvv0H+qjsolGRBBFd5n/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+KXTYW1NF+RTwbkkSd/k8j8DZfdSDGl6Bev0552T+JML/OBeoKk6ByJpiVPj?=
 =?us-ascii?Q?plS6a5ZO0UoQIBi9+w4zfDWOtwYytNS3OoQcjNidtZ4Jz6mlaFgtUC+OMGA3?=
 =?us-ascii?Q?Lh9iQ8xt5J4XN6L2vw4zeF+ywft/75T7ZJWmmkXbxqa6IYDw2lVqB07xYRog?=
 =?us-ascii?Q?WmQCoum9BB5yUoxNueULNsjJZ5F3efJgtwhhaKO6Iy6rKbdBxOzZaZZSd75h?=
 =?us-ascii?Q?UiP+JYfDNKfRve7xoaiXugcDu36i2Xx+MbaT8FIBF8KxOr+ZV7VqVk1jBY1d?=
 =?us-ascii?Q?Pa66YTMdB4ql4ak1jGClN0jQhACvHVNsEWYlnyzeMwPPkwtcGB1IjaGTWZxU?=
 =?us-ascii?Q?9yE5zJYkKE7XnPr8RB15Ov2FuQdbyY7g1c7G24OEKSmgPhZRyC8frd8FdhzO?=
 =?us-ascii?Q?NAfDWP8izvwsygZJ75jaJOcHXHCcH5wzqIbzpJ88qy38jOhXJPODpbVfESZ3?=
 =?us-ascii?Q?54U3WwPZTjoq3HrK1D6cJFkPtapuqPTbKlIDTWCU6Fk0n6bgdJTJdAvDRpIt?=
 =?us-ascii?Q?NkH7DkyGHMpivdMrG4VYpIXBow9Zd004TRRlnhBeNQc2GQ5gihlEDAjusyFm?=
 =?us-ascii?Q?vBH1floea4uEQtu8Eruv9ZBBwwe232Gey3ccK/mGhB8/Iz526kwBNzlqZ4c8?=
 =?us-ascii?Q?RJYJLL+XKyMdruGlKj3NZEosrDVJIQ2/6TcHH+bhs+Cu3yZtA08aJ4cVly7c?=
 =?us-ascii?Q?K7Lf1QzxzJzPA63IevrYizxS3cFU59NgdvQabrWCty8fwFrLh9sPScMU/WPP?=
 =?us-ascii?Q?yYE4YKsN1tjvZ6zf+lqsTALZbhf2n3+VDub37JuCn/4cFAvCSLrZkpMrIYid?=
 =?us-ascii?Q?ByGAiqFYDvCWVmvXO5gfh5CFacw4lUEnwgokTb8+3rBZD7D5faNa52L+3pIh?=
 =?us-ascii?Q?TEkAxsg5aPIUOg8cE4ygvvmgdWUxF47V+eYFC01MHNJNrkUy17zaSwRTDBA7?=
 =?us-ascii?Q?YBFcl/hDUDv2Dpk1TM+FrN46ky4E/P+v6TAJ5Fs4yK7mlceCEy5bYWgzjavG?=
 =?us-ascii?Q?DDpeP2zaIXqT/l3wkJda2aDjI9FeXsvmMTMZ7zcheoRnOJl5hFmMAQcuucEB?=
 =?us-ascii?Q?F8ydF8WjLpE/ToYS4H3TekA/IS4B74FO3zdgJGDeCX4I7oEBJGqdDiU439a4?=
 =?us-ascii?Q?zUyua5e0cjEhLt6hovp3JjnB9A7rA4Hh1ttlNwKePLpIU0Z0G4TLo1hc9fWL?=
 =?us-ascii?Q?UtKI4x/KC5UACkWYWzI/ZNCdF7hNN5203m8Gn+51caMtn/rZ88wtP88RZ1IT?=
 =?us-ascii?Q?Rga3StMzwlp4uD62Jg34lDNexXmrkyYQtGMe0IHcBUq2A3XHLqIfYCAMHZWo?=
 =?us-ascii?Q?g33A7X+a5ccRY/eVQBiMf07edliiesY5+/a+CiVWATI2ffm2wFvPRUnNp64a?=
 =?us-ascii?Q?f1vvdekaaAw538c1eTSr19Jy/TJKF5NeuIoNvOseAZ8NodZ5zsOBbVNBpBlY?=
 =?us-ascii?Q?iURyhrlcDq6pqyfEL/RocgLJVEqfeIy1QcPBF/CAtKUkRmN/xnihl+Bavua8?=
 =?us-ascii?Q?qapPtPW2w7IhbtqE7vRWiRymStTeq6AuuEDKUT92oTdPXInQfdknIgQKwlsl?=
 =?us-ascii?Q?R+xQoOeZY/UKlDLmYZQKATpFBVgtgVqhEjUQVVrr1fHeZM0ThcUjd+Z6lcv1?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b50fb7-b830-4beb-b0f5-08dca1f467c0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 21:57:06.6706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ+KKKkYB1dscrgUO+IkO6D572T5RoyCrWV6M+W/leYIn0RPkhVrZOiJG1+mFs1g4IST8NCC7pg9PpkTmcHKGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
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

On Thu, Jul 04, 2024 at 11:42:03AM +0530, Riana Tauro wrote:
> Currently GuC is reloaded for both runtime suspend and system suspend.
> For D3hot <-> D0 transitions no power is lost on suspend and GuC reload
> is not necessary.
> 
> Remove GuC reload from D3Hot path and only enable/disable CTB
> communication.
> 
> v2: rebase
> 
> v3: fix commit message
>     add kernel-doc for gt suspend and resume methods
>     fix comment
>     do not split register and enable calls of CT (Michal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  | 33 +++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt.h  |  4 +--
>  drivers/gpu/drm/xe/xe_guc.c | 69 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc.h |  4 ++-
>  drivers/gpu/drm/xe/xe_pm.c  |  8 ++---
>  drivers/gpu/drm/xe/xe_uc.c  | 32 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_uc.h  |  2 ++
>  7 files changed, 133 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 29e8ea94d05e..4da84e288faa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -779,8 +779,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
> -int xe_gt_suspend(struct xe_gt *gt)
> +/**
> + * xe_gt_suspend - Suspend helper for GT
> + * @gt: the GT object
> + * @runtime: indicates the type of suspend (runtime - 1 / system - 0)
> + *
> + * Returns 0 for success, negative error code otherwise.

'Return:' is the right directive for the kernel doc.

> + */
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "suspending\n");
> @@ -790,7 +798,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = xe_uc_suspend(&gt->uc);
> +	if (runtime && !xe->d3cold.allowed)
> +		err = xe_uc_runtime_suspend(&gt->uc);
> +	else
> +		err = xe_uc_suspend(&gt->uc);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> @@ -828,8 +840,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> -int xe_gt_resume(struct xe_gt *gt)
> +/**
> + * xe_gt_resume - Resume helper for GT
> + * @gt: the GT object
> + * @runtime: indicates the type of resume (runtime - 1 / system - 0)
> + *
> + * Returns 0 for success, negative error code otherwise.

ditto

> + */
> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	int err;
>  
>  	xe_gt_dbg(gt, "resuming\n");
> @@ -837,7 +857,12 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> -	err = do_gt_restart(gt);
> +	/* GuC is still alive at D3hot, no need to reload it */
> +	if (runtime && !xe->d3cold.allowed)
> +		xe_uc_runtime_resume(&gt->uc);
> +	else
> +		err = do_gt_restart(gt);
> +
>  	if (err)
>  		goto err_force_wake;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 1123fdfc4ebc..4c942e4716ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  void xe_gt_record_user_engines(struct xe_gt *gt);
>  
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
> -int xe_gt_suspend(struct xe_gt *gt);
> -int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index eb655cee19f7..6408f9dfe855 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
>  	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>  }
>  
> -int xe_guc_enable_communication(struct xe_guc *guc)
> +/**
> + * xe_guc_enable_communication - Enable CTB communication with GuC
> + * @guc: GuC object
> + * @ctb_register: true to register CTB, false otherwise
> + *
> + * Enables GuC CTB Communication and IRQ
> + *
> + * Return: 0 on success, negative error code on error.

negative error otherwise

(to avoid error error)

> + */
> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	int err;
> @@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> -	if (err)
> -		return err;
> +	if (ctb_register) {
> +		err = xe_guc_ct_enable(&guc->ct);
> +		if (err)
> +			return err;
> +	} else {
> +		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);

this could be done in a separate patch telling it is a preparation for
the upcoming case.

while the first patch in this series could be squashed in this one...

> +	}
>  
>  	guc_handle_mmio_msg(guc);
>  
> @@ -1101,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +/**
> + * xe_guc_runtime_suspend - GuC runtime suspend
> + * @guc: GuC object
> + *
> + * This function waits for any outstanding CTB
> + * and disables CTB communication before entering
> + * D3Hot
> + *
> + * Return: 0 on success, negative error code on error.

ditto

> + */
> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	/*
> +	 * Wait for any outstanding CTB before tearing down communication
> +	 * with GuC.
> +	 */
> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
> +		return -ETIMEDOUT;
> +
> +	/* Disable CTB */
> +	xe_guc_ct_disable(&guc->ct);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_guc_runtime_resume - GuC runtime resume
> + * @guc: GuC object
> + *
> + * This function enables CTB communication
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Power is not lost when resuming from D3Hot,
> +	 * hence it is not necessary to reload GuC
> +	 * everytime. Only enable interrupts and
> +	 * CTB communication during resume
> +	 */
> +	xe_guc_enable_communication(guc, false);
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index af59c9545753..9ff87991f2df 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -20,8 +20,10 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> -int xe_guc_enable_communication(struct xe_guc *guc);
> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
>  int xe_guc_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index de3b5df65e48..070d28d193c7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	xe_display_pm_suspend(xe, false);
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, false);
>  		if (err) {
>  			xe_display_pm_resume(xe, false);
>  			goto err;
> @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	xe_display_pm_resume(xe, false);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, false);
>  
>  	err = xe_bo_restore_user(xe);
>  	if (err)
> @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_suspend(gt, true);
>  		if (err)
>  			goto out;
>  	}
> @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_resume(gt, true);
>  
>  	if (xe->d3cold.allowed) {
>  		xe_display_pm_resume(xe, true);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0f240534fb72..cbae9bf03baf 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>  	if (err)
>  		return err;
>  
> -	err = xe_guc_enable_communication(&uc->guc);
> +	err = xe_guc_enable_communication(&uc->guc, true);
>  	if (err)
>  		return err;
>  
> @@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(&uc->guc);
> +	ret = xe_guc_enable_communication(&uc->guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend - uC runtime suspend
> + * @uc: uC object
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume - uC runtime resume
> + * @uc: uC object
> + *
> + * Called while resuming from D3Hot
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_remove() - Clean up the UC structures before driver removal
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 11856f24e6f9..dd483ea43b9b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>  int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_runtime_suspend(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.40.0
> 
