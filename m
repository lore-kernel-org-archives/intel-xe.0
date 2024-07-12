Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A425DC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 22:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE110E1AB;
	Fri, 12 Jul 2024 22:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1UYibdD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492F410E1AB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720822352; x=1752358352;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9jKAuLgTzOPKLeGXBf+iyB24uMEcf2DPekYTorKRmdo=;
 b=T1UYibdDQOoQdwK4pNFfk7baJvFB0MeGUR3d0eSsGDc15tclta/nyODp
 bAd2qY+0/WB6lsfzwbvPZY5sfXo7LFq+MLoFmcW1AUU7lT479xeQHTVb8
 jgjFijO/JILx+KZXnBcxsdNe61vba3K31C9ikl/C/VZAxNIXLS/HkUzxt
 xCXDtVglCoGv/W3oZEXodarx94PvxAlVj5EfXc981Velg5gGvDYD3tBfb
 Z3VeEaQMLrg9/zrYB3i8nedbXdn5rXAXYRVenRNTWsJpjhiKqjzTSclcY
 ue8jmx3Nu1DkZhkyauZR231uvujaJC8Tg/ZKBLTufP/kYkzIOoueRzPwd A==;
X-CSE-ConnectionGUID: XvffnfhoTKe434c7e+kSxw==
X-CSE-MsgGUID: TN+/AgkjRTajt7C4eJAGTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28875607"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="28875607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:12:31 -0700
X-CSE-ConnectionGUID: b11hrve6STaOAS+PeceQkw==
X-CSE-MsgGUID: ojJMI18FTiqx8pfCEztHmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="48927096"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 15:12:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 15:12:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 15:12:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 15:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1a/DwHZ1TapLTitn4vhI+/y4GlUEpneqD1+xcx1swDTjpabCi0MoGxibrJi94RJJsFE4P5Dg0gyYHwwa5zCgw3O62Tvj0CypzBJ91abFMrEim63o2PNcfZ/dJZH0psCS4kEhmFKhWGyoPnICLya99BEZZKcGnRQaXds5mJf7nPzgUon0zgSRysxoU2aWErz5/TjkkXLDEzrl5FyEvHfkkh9uA0Tjb61kxFjQnExdeMjOXsQYTQiN/vCb6B00M5xp17l834sIOFRXiVK93rhT+JrBHOf37OgHAcGuDZB9eBnems7/zUrI7NxXVgS/PU1A08YdIx6fbeZfD8TaevzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ15JcB2e4a9/Q/PfHx6ALbN2UvhjM4w7mLVl+Zk+a0=;
 b=t9FYa8/2Q8UokBBpKuCJYZHWnZzAk71zVyJkILMvu7JndtRja36paNSYIDATISNuc4nrLfvm7umStK5W5oHOB/0iPOGSuZUNirxTdzNnTcbkckzSaMW8IkzPhxdm64PBUjHVFtjK6qyjq2NUH2aJPxIOQJ4FraJUaDOsTwRl/l3cRD58DugeGgJjvekqVAYYPeOmNUCzMLhdhqXQv97spvNQyQIGLkPA2CRTrM+ROwudkds6CwBmAM72uvayeZFZsGh3cVJb6L0Evdo0of+VhghZQ8OS8V//gIgGkvRH27sY/JxuXOSnG0Xy25tu1kHqrcfQnlGfO/VpFEzfiSsHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 22:12:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.024; Fri, 12 Jul 2024
 22:12:27 +0000
Date: Fri, 12 Jul 2024 22:11:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 01/14] drm/xe: Make exec_queue_kill safe to call twice
Message-ID: <ZpGqGUsECblGxJCI@DUT025-TGLU.fm.intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240712212901.2684239-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fbcb9e-0eec-4ae4-dd55-08dca2bfb71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?15gIlfXVvBRh9bqKNViD2qGIR4XIzvEydyccGnKjyZNrePZMcJUTfSTu+Tni?=
 =?us-ascii?Q?LCy4+Rz/LiHJb8Q+Xp6h7HtcaZHg4eyxK03/nRidIEyh3ORUO4OI3kG05lMv?=
 =?us-ascii?Q?pMluX7x9X9apnMHTdaS57jX3dbJjsIsh00MlOwp14TPiWQ8ZZRWhNAjmGj0m?=
 =?us-ascii?Q?Bntdo20wOVEf5oe5jqVH3/C4ifS+RD3+Wb+UoJs3G8AD6SuPBEu8Sjc10xCx?=
 =?us-ascii?Q?aM+efTmJ2htwP5bqJ9b4xP3dAlc68tXxFCR154/5x8SCJE0k08f7KAUChKRF?=
 =?us-ascii?Q?tUuFC/oFkVpvdf9+aw4GT6Iar1G7CZaf0lRnaL1AqUy2EZungb7mXAYDXrsB?=
 =?us-ascii?Q?TmiXH710LpbZ8EeDEcO2n3/ED0L1tWksUrhlZfOuzIkp0whvUBpEo5weB3Xc?=
 =?us-ascii?Q?NRk5e/SEFIY129cqSbEKZO5AFHDTMOiDiKmP14XBBbu5vquqh30y16Xe1FEd?=
 =?us-ascii?Q?rCee9mCSzUu97MbfRR6EzCEtMQHLOFBZENoiqGsoYQtlgDXMWmB76oznX53i?=
 =?us-ascii?Q?RkrtqatjhJZSkyncj5YXOFkF5OkuWwllh4phKgHic9vvGOxA1wEoSiDt8+ln?=
 =?us-ascii?Q?SwWv6HKUn0Xb1QQZDZwMPJ6CbrS0Tb7y0Z5waaElVwSOMI4zxT7tGfuGNF5l?=
 =?us-ascii?Q?IDdC/c2ZrEACzk0U2ggs+bh+WG0igIhuG6NUqQqEdlX0gOcIm4BmZVdwodg9?=
 =?us-ascii?Q?lqSokELyOED6Iy3foV5tOtwiMlo+ewyo9vTbHWQYCu8mHUvcogkZKagSXeBA?=
 =?us-ascii?Q?GZefmMSSRoNBpuwsUpCwBfkzBHpOfUVezGoq9TRwxgY655QBGd8RaZS7coMO?=
 =?us-ascii?Q?+THnOWN229J49PYFJBzFb2RIXURKOSGZZ2MrO87ziQEqaVnnFCHAyRHfxXax?=
 =?us-ascii?Q?oO5idCUHsprRENtJLYBm4vU2G+wWYJR8LXF0PZk1RGRleu7Dwe9c75l4jS4a?=
 =?us-ascii?Q?0aOGUhEwMTVPZREC6qq+qcN5XQvTHWl7OrKzjeuNdTUcLm540jEDvoF0LFEX?=
 =?us-ascii?Q?N3iw+YyJ2yxBI2jTqG7vSWoEJNYWWHkCp5AECA9ccei3zXG4wEL4aq8bLtDk?=
 =?us-ascii?Q?cX0OC8T0guxBLvEPji5FIVaSAJ8NWCQPoYWUGZBUhpNY1ck1DRugLflL9M54?=
 =?us-ascii?Q?za2Zuzkkfq1vH3GBVRSgASHWNjDjzZnOp8lzFZOZ84HpUNCCttUMRHnmx2ob?=
 =?us-ascii?Q?HSnCyuF1zdR4DPcX0uSXWZEI+48/vgieaLrBmuqCLehOI8St3uRkq3Voj4BX?=
 =?us-ascii?Q?rep1LIa5KPFfttk/cfWzKfhXo2maH4LTt6zeOFOOW8e5cIG5Bq/mlqwr5/1c?=
 =?us-ascii?Q?mblBHr7alxyaeXiQ9hY6389/0noAXI2EHOntRiTPPnMwnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HcmjjlkaeylJNvF3mmHPQUsKzAa927w7keHuNNX4FNlKS4f7Xv2AtsKPD3iI?=
 =?us-ascii?Q?ghMADlqIiRJTtcF+aw4pUYek2wVNwQdKoVaujpKvXNtVwihv++sFZUNNSxms?=
 =?us-ascii?Q?KcNCXxPWYEHZfvw018GIajaeBQpllL6a6vmkToYEq1m+i0rQiqUWONmDRbIj?=
 =?us-ascii?Q?ySXko234SnuNxNKhNnbzqJTuSWsz1ImYyYoMFDR7vkZvXrm/dZDXjzmLB1Gb?=
 =?us-ascii?Q?dmOaqmClBXB7vvFqFEIp3oimCT29WMu/ZAU5kcH9gscy+fD1uXcgtG/ho0Ro?=
 =?us-ascii?Q?eShCzSf5gfuCZ4cPcoOatsOqAbBf6ab8VoHFX7rbkhSet7uTv+P1R9KBOw/g?=
 =?us-ascii?Q?H1s45FmnG5FaWsGsddpwB9froqxHysAdmyp11ou9R41U9bJWRDTsidHS1lZ0?=
 =?us-ascii?Q?cEOXbW9Gqjo1YE/92TiDoYCQy7M6jJvoEZT/oGwFrcHcr+P7yQDtc5wnWMeu?=
 =?us-ascii?Q?5T4KR9wlckDF5scjEAKOfvHeOoHLrDWSr45ETNoujn514dmkcwbammOHj4pz?=
 =?us-ascii?Q?TfP7SM+NVSG7zzIChH8v1j2CGc7JbUr+ne16NAxCzN/mmqT0Bm/5giEy/Z74?=
 =?us-ascii?Q?9BSt13BI719v6wbzcPc8Z341feTi4VHyg2Pv19DTqjBw/vd5Q+Y7AjS/f0wJ?=
 =?us-ascii?Q?Ke7Y6S74kx/fs+XShnAI9VIDnX1tffgjZWcFWGYyRNv3TrgQW0k3Kr6e/2fa?=
 =?us-ascii?Q?zXOVwD/znIy4OUE6cABeUp9Kg4rCCI7G/fP/B3aY1cDaOGypP+Cb3c5vksPN?=
 =?us-ascii?Q?eTiNYkRP4YaDiHD3ZhCts7RHouKrFMoUC3tpZjNwilLdykeAmDdk5QoW+xRn?=
 =?us-ascii?Q?+rAGVnogObZIK59lMf4bJmCJeT+s9+Sod+mHv+uq41GSmRjz044zXBn3Pa+Q?=
 =?us-ascii?Q?1ey/ChWqO4v1dkam7mOPCfESuP7QunoQV0nNu3dneb6Z5pOaJNVyOc3eK4BS?=
 =?us-ascii?Q?nDoyCL+SJuS/pCEn9nQxxknPQBBA+psCpOn+pKboKurqASZhZ/tGABNoCn+d?=
 =?us-ascii?Q?DST6EFVpp5hYPrKeGVAmtpXM8OEGMMZ+VLYj/ep3ZIYmwXavC/WYyg/8CQzX?=
 =?us-ascii?Q?XYOtDREgUlff8YA3Fmhn8W+iwXh29wcCMJSIL1L4eCH8mUkUfiK5n1vcugWA?=
 =?us-ascii?Q?kAGl0S0c4MtxGHjQtBAzH+zaaJQI5ZBKAdYTlmeYWOQ2JNHpZdidEJRZipmI?=
 =?us-ascii?Q?3dOJuiB/piOSXjUjqYA7Lmigqieb2afx3i09X4e9GsogrcgAcE5kwOazk07Q?=
 =?us-ascii?Q?u5URMDkhMSDt/iNNeOHyjsF4QACIA/KabrewUTIpdCrLDVDXVe4tkhIgQPGg?=
 =?us-ascii?Q?G4c7MqxvPJgbcfbPTAucumM/ilvvyJ+nXtY4w2ydRpTTz1Qd0zCp1XtHJF+M?=
 =?us-ascii?Q?a+kcJzA0utxxODvJMI5nbT9yKi8t98NMIcsXmqBrYuYLWj8aEsUjDmn8zB4M?=
 =?us-ascii?Q?wLecErYgxRqHIau9pLH7eh/ZKSJrCZUyJpQ/5LJ2R3Q92Eg3k4dDJxDR8vVA?=
 =?us-ascii?Q?wzxWu41vUCBcwcQg1HExRXKlpXq6c284JWOJbNw3sJT24AKJoaMsbaSCicKE?=
 =?us-ascii?Q?Mz3ermnjMCPl807OapUM0U5LJCIKy4O0gm8pqCioZyoc91vkUzBLZ7uL+rGd?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fbcb9e-0eec-4ae4-dd55-08dca2bfb71f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 22:12:27.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP7HlwoqDO8GNsCvVCTdfNTozG165MhB9VpeaVMuFIgN6DnKyLzl535cKVMoJlGsomkHqTBWZd8+TUF1lzgZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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

On Fri, Jul 12, 2024 at 02:28:45PM -0700, Daniele Ceraolo Spurio wrote:
> An upcoming PXP patch will kill queues at runtime when a PXP
> invalidation event occurs, so we need exec_queue_kill to be safe to call
> multiple times.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Not opposed this patch but is this really required for PXP as PXP queue
are not in LR mode are they?

Either way, I'm open to accepting this as xe_exec_queue_kill probably
should be safe to call twice anyways.

Matt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b166fa03684..02f684c0330d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -280,8 +280,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		return;
>  
>  	down_write(&vm->lock);
> -	list_del(&q->lr.link);
> -	--vm->preempt.num_exec_queues;
> +	if (!list_empty(&q->lr.link)) {
> +		list_del_init(&q->lr.link);
> +		--vm->preempt.num_exec_queues;
> +	}
>  	if (q->lr.pfence) {
>  		dma_fence_enable_sw_signaling(q->lr.pfence);
>  		dma_fence_put(q->lr.pfence);
> -- 
> 2.43.0
> 
