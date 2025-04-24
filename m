Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BDFC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 21:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6310E872;
	Thu, 24 Apr 2025 21:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXeoREqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1A310E872
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745530894; x=1777066894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8sEYzoIFURHZA3dB2YHR2FWd1abDua3PWedjqIZljmM=;
 b=HXeoREqd+Kpailr397tyX3J6XF0belcL9OFU9pWf+o3WSa762Y99P4KV
 9x1m7MaS5PbR8IUj0jJ6FD/fs8i8HEgl11v9oIPsXfdo0RGaIOQiTSr8G
 qXocpW99bJpH7t1Tgd7fuRTAd1nCP+1WYU/n7wYznbcQs3hns4mifLLcD
 TAm1Wd0S6H/MPotVa53WWScc6rlMfwV4yMY+t0oJH5N40IHr0EYJ8+rGs
 bP8HuDkk6i1jYX9J3Xci4JzSMhcMASSUVmkXrmVtft6aVDS28XhjjyusK
 ln/iG6Bb1RS4TTnvRQfD0Ws9BN6HCnaJFfQoXXwFDDuW1habCHOLflVN3 A==;
X-CSE-ConnectionGUID: /km4+LrTSaKiqPpi1IPVng==
X-CSE-MsgGUID: 8kUcVFn5SfCtLE3v9cFqyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34806432"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="34806432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:41:34 -0700
X-CSE-ConnectionGUID: bV6XoLYhRrmUJjyT8mlceQ==
X-CSE-MsgGUID: /EVjE5KXSdigqNfyE4DQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="133042840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 14:41:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 14:41:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 14:41:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 14:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGtBTDTblTq9W1d4HgZ7IGBy+k+xmLGO0bSZZkLH5jrpDjDV3zv95/kgwsv+fKfwFmvOlpZehbOSavW/SrDxchZWfuD2XVo3t4aLbrjj8yFxrZxS8fONQw+uniW/F725UESt1+XeA/ygeEiJUFWBGAbklc1oZC05Zt6sMjUS1UAxSbE/fTXPdSf6MRIgvCvLxLr37vgU8f6QbwHyfAt7QVmWv2HNsIxPbFpUQmEaTzJG6i/bAWlCJe6nnueq81e9ezUYNgd6D0r1bO00hFlWjWKkj4WFwtiI3J3I7hNeU6i2UE+wI8bsuaD6GNilZsrokXJnuaraMnIZchGHrlXsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r+yId25IwjxAd35Wb281NTMpaOtrWvb3aKrwLSkt9A=;
 b=l1uWrtnB7Fx/PtLMou/RLnQbVJM8khN5CliCACzP/be1po06ARiGNTUsOY4ApfsDpI3DQMrrWAFDHNO+lAV/2XWXitvccGcNeQeTfkfHp7id/ZHcCGwMBEZ5l3VuvaSebVMOT6Ph6NFTJC+bT0/XF49vKs1UUPaQ3T9vykn/RQpwYKsger77PsbMbbopHJQ0LR4y9HGaa9J/0+E6sQDDVMXwVAucsAakdBl5CZd4uFQjOkDpGU8IdgUjRJpOFbtOXeUuFp4s2dtbX66m46o46xXZHpN0AXXkG63wplV/hWWlMedKE1YvGTcE/87dY/z2FhZOk93txNgSsjFjc968pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF10DD61CAD.namprd11.prod.outlook.com (2603:10b6:f:fc00::f08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 21:41:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 21:41:31 +0000
Date: Thu, 24 Apr 2025 14:42:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Validate wedged_mode modparam input
Message-ID: <aAqwXCxXHtUcDF5H@lstrano-desk.jf.intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
 <20250424143043.937-3-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143043.937-3-lukasz.laguna@intel.com>
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF10DD61CAD:EE_
X-MS-Office365-Filtering-Correlation-Id: c889aa76-fad4-4bee-12d0-08dd8378c71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F41FPnOexxolVTfMXn3vKy5dOuQrlZfEzT1NU0YUFtk47ftI+6dymPJa5qyW?=
 =?us-ascii?Q?XFmLsU5BQRgRK6umv4k0RFcufBfhW28YwgXKb6sVsmeQWIoFctq2ePsFD+dH?=
 =?us-ascii?Q?8pHT6WD/EqD/12QX8l0hIQZauuUfjgXe/B6OWlzxWkdlGhzA7CInTJNpq8MA?=
 =?us-ascii?Q?uEkoMHBcKDiU+pJxJa1GvDtTqMeaFcLtxuRyO0ne0/FjemUT1pm9O7CJLIoQ?=
 =?us-ascii?Q?OCjD95BQjKd0nGOxrCifE6xYJHZf7AdHPBW35qGP3wAlx8qiJ/r7URE/lZD1?=
 =?us-ascii?Q?ZiLTQxb0vCwkBM987cGFDLhRfKFnSG0erUKMZA6OEp0Ck3DtVheexgtH9S8b?=
 =?us-ascii?Q?N0c+/kICv9YS5Q0HHHriwac0hb7Ft0JEdFmDqDHscjLqa6NP5PWp7okD386Y?=
 =?us-ascii?Q?RJhXEgzAM/HZe5e7RHlbOkpa7rgRRWjmpmTBMD/lxL2IRHiLaSFiRk6iSTS3?=
 =?us-ascii?Q?ciQqso3XiA4Ykms28ZRW5yhPYJ1JLXgxMf6OEYa9G9o+HstuZYo19iQan2Bg?=
 =?us-ascii?Q?HcG8aXWcIvJ7KQalCYPeM6LbrH+jOI70zWc7Akwrlg87jHMOtndlGTXqP8jn?=
 =?us-ascii?Q?h5jZ/9brU2BrwZHnoOHMhTHYGbVTOVwX3NzHGYgY3BcPGFptV6dtBasMGdpD?=
 =?us-ascii?Q?aJ/xTBkEr/nbgBqXUvrrBnMW32If9sozvYh9WWF+0QNO9EUKMEaytdE3SZlg?=
 =?us-ascii?Q?sqMbYMtcywQW5ZEK+ATLtWOJ71xr0Vpl/RYg5zU+TdLAMR4FmFLnxEnpKupN?=
 =?us-ascii?Q?TMMNapKMXVAS9W0cl9XU4/oj/B5mXKSEmYGY2QbpDSu9d6pD87Qs2fwLrpD/?=
 =?us-ascii?Q?UNOVJ4ojexpwAUsFvmBUeNnoIvxN4vdj1kh1Ir5GwUzBlGcndKsBw4KPrnUK?=
 =?us-ascii?Q?PRPLBQrUZxCE0uy2h41kar2+x2wVazYqMY/6lYoWhLZvkAOim6svNknGtUEH?=
 =?us-ascii?Q?jGOvGCax+qg6UITKx23ZG5D/Ib+VYU5LKetxk7z8YiMasYEbaEXNlh/3QIih?=
 =?us-ascii?Q?qs1VviyVh49lqxQ3+8TvwXx+VOx5XYSpe+5Na33JRDAR179sTIVFbl/dfW1q?=
 =?us-ascii?Q?7pSJrRNA4q1HW6zHLjvruO8bTTsUIgtfcoyETRhqAMWXxeyi6HsHc/RqBAPk?=
 =?us-ascii?Q?yG3dsRsGEORtyOWMCaJbnd40+cdcl1RBkCvudrfL0DLXirwBdwfMcOH1jsSm?=
 =?us-ascii?Q?uPlAmlS9Dm7IO0eynBatoSFJgJngwT5mRSGh1zBtuMqGC9L6AS4Ep3S9D1sq?=
 =?us-ascii?Q?9vjA/ZP9IMOwRHt/mGL+mfUgHYcP0cYK9cW0OY6oS5DD06fftOEo+W8NWHEd?=
 =?us-ascii?Q?4mkN2mTqAdBhJrjGTkQhtvLr8Hsucc3JmrE/dx4SjsMJ1ceh8jaRxPohG4aU?=
 =?us-ascii?Q?tuz1V0QdJGkwOeLVblc3gCE8mRKfkB/0PKhamw1CyffotnyO+Vr60ge7SKps?=
 =?us-ascii?Q?90XrftOcC3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kF+V9sEjssJizKIoL9CqG3hfMbkil8GlImSERg5dvfL64AC2rpu9H7TRVwNT?=
 =?us-ascii?Q?+6Z513IP+xtzSfKYFp4ZCx4PrDDUMVAWhguj9fEOHHIBqXZkq66OhGZTMZKO?=
 =?us-ascii?Q?yhXlLXDnY+VB6GZUg39oQ4dcUEMJCCx+gCHp7we/Ywp0jM6T3FDPgOfgw6d7?=
 =?us-ascii?Q?UwJDaMwwk9LNLk7nUbIrV3ZvDoGxyEDGORH/Hr5BjfUDzUHxNGfNHXPCKAyu?=
 =?us-ascii?Q?4dN1HDmgaKBQWFwiWOH3N0BWfJj16GKCCDUtgtIkwuH5VP9Fh3FkPRGCnluH?=
 =?us-ascii?Q?G+gnuQW62qPwuYFOwpFYFRY0jcIFNTq5Zrt8xGqOelIumOZaIEfKGHVooafu?=
 =?us-ascii?Q?/mGgZPhIuja8zcXQYjo6aBcyDR2lN5X4IGajV7L8uszTEDdMi30tGHL1AHn2?=
 =?us-ascii?Q?ZefJ2rCx1hhdQDVtEagVn45x5KkcBj8OAYF3K1kzGiHIERDT7XBt9y0vQtxA?=
 =?us-ascii?Q?daQbSs75BvCynFNTNhZuUefr508jYjlpDxTZwGioeYmd0LwI3BFr8MlT9LVz?=
 =?us-ascii?Q?zfgpR+Nuas6x4nO2bIN9WUWSsbsEANb3/EFu3geLYlmLILloTyH6dvyNslhr?=
 =?us-ascii?Q?kRVoO/hJ4sUerkFZKPlA2ev0R9bHfH9TdBI7XBUwSXkNTn/+dp6iOgQaC4OC?=
 =?us-ascii?Q?KQudy1iAEkIRwp0o1ropWjf7cRv4pIgOJXxxVIRyx3L3k/7le+5tbyFGO2H+?=
 =?us-ascii?Q?Gg0MwMdx00JHUU+sOu62qkvUXmWN5GN2WOQJWjqpA0MhDaZ2/y/43zVRgTu1?=
 =?us-ascii?Q?jHQgHgnGSVcVNvslQaYlyz2ItRztUiVKElzJOk/QJguOLJEndm8HuPUJajHH?=
 =?us-ascii?Q?w8Uj5iO2F8oKTOaRgRT9MthGPnEpyjSVetAHIpwr6TUi2tv6YBJ4qskHnVAx?=
 =?us-ascii?Q?PHwI2yzSzpTu40km3Od/z1ZR/DYRPRWewGfWmbEga0fNFUHAh2nS23NsY0DX?=
 =?us-ascii?Q?UemQBLWTGRGmUJ1LtOp/xzhb6+dhU1eM/GPL0moUkJttG/nYvgQpd1WEuLxL?=
 =?us-ascii?Q?zUP4hhGpP0XfhA6lwBOK2hhk2PR1mmf4xj+16q/00BeygHvQbN2R8zwrtewu?=
 =?us-ascii?Q?niRV8q4Vaicc/TBu3vbPDetLSyc+xemwPLn9l5QZ/jIPFEkzjwk0eaQPrR1B?=
 =?us-ascii?Q?pRk3aUl2WkkSEXbVRQ1E6WMYFeHUhD/2RjjZ8PtmMC8SuXzZ9borsWcdnyPk?=
 =?us-ascii?Q?nonF4MZ2tNZBtG+o+KyMDjKXa3T2ef14qvlpGzA4Rg9MQGNPAog3adKkGWCy?=
 =?us-ascii?Q?kg3IAupMiRiENTnFEUZ/Y7KoBmG90XHvY1/UEiLUOdQzpCeEBMQDa9Q+dQO+?=
 =?us-ascii?Q?HrVxyGNpczITiMDXl5o2COIVaNc/rRWzs+kiZiRg7J4u4K+46qOj9we1BBkp?=
 =?us-ascii?Q?TADzwaRT8OMAQW+nn9+22G93ilPQZFX+yhYagQPNrZJnCqWU03xNGHq3+mKQ?=
 =?us-ascii?Q?L0+PDaC20+g599n8INjtuFkYmnBtp2Hs9HLN2R5HknUfjKVaEmcL03uxiyX9?=
 =?us-ascii?Q?iLMse3KQtEvaXxBlsAvOFd/O3dqWjheAJwTFTp4XFHIs6/20h2jh6sZIBz3x?=
 =?us-ascii?Q?alvBAiIIliGubUQpI3mUUhHgfqI88L6TAHr8Zs4QPcRzf8pb7+tf6+kfCSze?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c889aa76-fad4-4bee-12d0-08dd8378c71a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:41:31.7813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AW27T1EcNTHX7eqyFxs2cH6boRSEE911FWJ0sV+KwMOXWLjkIBhHySiiJU5Kv6IAJdwnjxigMQrHw9aMGymfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF10DD61CAD
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

On Thu, Apr 24, 2025 at 04:30:41PM +0200, Lukasz Laguna wrote:
> Check correctness of the wedged_mode module parameter input. If the
> value is out of the expected range (>2), set the default (1) and log a
> debug message.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c      | 7 ++++++-
>  drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>  drivers/gpu/drm/xe/xe_module.c      | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..d2de6936cc20 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -731,7 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	if (xe_modparam.wedged_mode > 2) {

Maybe out of scope, but while we are here I think rather than magic 0, 1, 2
for wedged mode sprikled over the driver can we add defines for 0, 1, 2?

Something like:

#define XE_WEDGED_MODE_DISABLED		0
#define XE_WEDGED_MODE_FATAL_ERROR	1
#define XE_WEDGED_MODE_FIRST_HANG	2

Matt

> +		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
> +		xe->wedged.mode = 1; /* default */
> +	} else {
> +		xe->wedged.mode = xe_modparam.wedged_mode;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 859a3ba91be5..a471cf55ad8d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1856,7 +1856,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	if (xe->wedged.mode == 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..b1b9bb2056ae 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -71,7 +71,7 @@ MODULE_PARM_DESC(max_vfs,
>  		 "(0 = no VFs [default]; N = allow up to N VFs)");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>  
> -- 
> 2.40.0
> 
