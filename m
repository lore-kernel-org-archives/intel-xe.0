Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCE2D711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9FD10EB05;
	Thu, 18 Dec 2025 22:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGDGV0qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA0910E47A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766098028; x=1797634028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eBKC0WmoqczcqId5uII3MCA6BUPX0KRz3stkoJXyhnQ=;
 b=aGDGV0qsYZ9SvGhEQXNQBr5HLX90RQlfEB8/fEv10iTlFFO/r2IjG4bJ
 H425R1dbjdmNhTQmQ/4K3PV01irFGO8pO6U3wPxjbMkkmw7mspvsyv/qf
 x4juZSO2U9cdsBeMQUj66VSbcWjMLKHhSeaEn+au4V+l3DTOyESPeVHdx
 AcBCgRpM3um2+XJZvIIWkGZFPpenG0Oj4LkR34C4mYjGGKTVm3pAs+Mbd
 QALvok6GfuIZ1y2OjKSdOPXz1vmrIrl9hxZ3q4Xihm9SvAN93WuthnRBf
 sry0fVG8R0KRzw7wLLp1gL+zDWC5OGnAZ7ON5g3/UZMOAsAj3IOtutzHg A==;
X-CSE-ConnectionGUID: kCAA6k6sR8uDdldywq7whQ==
X-CSE-MsgGUID: Urrtirs2RjufHIMFXbCPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85482788"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="85482788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:47:08 -0800
X-CSE-ConnectionGUID: UDfrKTRoSsaHtfrIdpRxAg==
X-CSE-MsgGUID: kQoQVzuLQrSwMdU0jeI6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203788869"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:47:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:47:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:47:06 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:47:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy5V681NpiUb13SVb/Ymh1dDQ/cbUBNFam8GCXJMiyKVmEMGZEe+RGM0MGv4LSYVvWEJUZ+sU0bMh9G71BOt774l7qCvGHxuC+4I0+OgRILIULOEeKNhxZSo4mWS4qx49SZLulrS4CTLhCUp8V82Tbzyogs68gbjZszpXW15Q8+L/TX1GB/Yn+mXmZT+DTxnsY8+WgJgszIgrk7B0X8LtH0EWOSddo47ovxikE3WGquHVkgEnCXuJl8alQ2mJ99ZAeh++wXCcppGgkYeBfsw1RKys9KVwoN6NmOvsIQ92Z2nopYEC/vvaboz+ScxWqXIYmgwWr6gVqvAakwlBkspOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlsNeBLloiJ0L14SnGSOmRySGTy3JIlyzBtNTPMFtrI=;
 b=TBScRNMwoOBD4PxCGpGPWi23iCwyUOqLcNCSgcQHDmZShAgq4zp5vis1k9UPup4tq4hDxN8xMPizS71137YIObUVIpIQF5d9H5dW7m48QNQoK05fdKof/yeGOmIxWWyeXUGscWNoFv2SLfNs1Jv5oDtal4ag4BxqEZECJ4MAADqVjaItWeXoWB1DzjW6NO5Bmfo+k1OhC9mypNCIhY273aTpielJ4+5BFje3bQJwhmKoQx2KVosffCrxjamSPFOyTAFlP7rBhSr2NI6SEGha4vSgx2FkQLCFwUG0DUpbKgVrXXYHseXQSueECEWzYiXmUZz0Am732HlqD+TYOeY5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 22:47:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:47:02 +0000
Date: Thu, 18 Dec 2025 17:46:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/xe_survivability: Remove unused index
Message-ID: <aUSEYp8o-XgqSsSK@intel.com>
References: <20251218105151.586575-4-riana.tauro@intel.com>
 <20251218105151.586575-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251218105151.586575-5-riana.tauro@intel.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: db3829d2-9081-4833-99f4-08de3e875c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sawdz3Zdck61c1uWeHAKv0iqgbBeGL2+tUXQRlU68H0RxH72O+4+0x95fo4d?=
 =?us-ascii?Q?fbOqfNdaZiXMhkElRU+nBzsqHaDAJqCkDT8QuVlZ6DDWuaqYt984jPRZA5Bj?=
 =?us-ascii?Q?F2GVKz5j1xdkTa+CYepptqMqlM/G4yuhxDhDojzaEzeUVplSfLQhlAyfdn48?=
 =?us-ascii?Q?f6EbL8wBNJhAXfhhJsQ9LNUPNX4ptoKGVHI2v6tEKJ6kbJPgosbL/R2xfBeY?=
 =?us-ascii?Q?vz9qTclymAsLBQ+90R5/oKpq8+0fzhmR6CQEXOL473TZLxdDmfh6amOxuhve?=
 =?us-ascii?Q?zKRGPmdUsUrTt2o7cC4X1tZNNMUQG50Og6mAlGLc5Mf955ZIXfM5/M2HW1s6?=
 =?us-ascii?Q?pwvA7/tGcOJ6rF7EPN908eumtQ6cS1XH3NRP3GDQA6/bvumnQAjBtZJSEGV8?=
 =?us-ascii?Q?EgO46KK6DF8UJngJe00Fy3rlU27KTxUxmQj3tw/wb7cCG3uQMdMB9KAtipAE?=
 =?us-ascii?Q?rIPCTFEiiZS8bhRyaaBTJwJ/lGW26+z6T3hKBayr6uC808iWgvHVvJfHy//z?=
 =?us-ascii?Q?RnVt2ZnIQy/9aoE1V2qUT/hlt3o+7/J/NvDAlEVtAqbF9dO7CxkYygLUwSXx?=
 =?us-ascii?Q?LyzYPihjAq8a0g+TJc76y+w9H8ovkH617ZTomEeU1m6LPINjsorUAsqMKKJI?=
 =?us-ascii?Q?KBk+CVZ6nlL4baDIlSbQLhe4wG1pEpL7TNBU4CiFZnZpP9GCpAfLJQX7La47?=
 =?us-ascii?Q?1wgQLVCanALxe9M+70ZM9fSj3dcG5c7+2qzqxCto5A36dwhJT5x5EtUscZQU?=
 =?us-ascii?Q?9kPvq7vfEXL+sMJ+GSzoR+Y3wQ4wOn0bEUQlVfDyJT+k5wQLqJ1px5+gnoeT?=
 =?us-ascii?Q?pxfKlddL+UrIM62A7PjwEq456FGc17HGOClXL0g82fz7+z6grKw2wiJCRRXg?=
 =?us-ascii?Q?IAsPxHX27yPumf050n+Bmn/M9CQPmIQ/d3NNfuxGQEvCYHnuUBM9a31TR+EB?=
 =?us-ascii?Q?c+VnsEDMxMTODAX4tfKQHBlKjQeder8qu26Z3TUfb06XsADfDbKREjyJa47U?=
 =?us-ascii?Q?+DHZKoIKH0NrmnALQPQ4rnIC3loAj9+zB/omINIeA33ex7JcZo3x6RFuzUNe?=
 =?us-ascii?Q?Nk5ohwk1Xhlsq0M6g7Ft6w7CotitvwRbvbdQjt0i1ePhdt5vv5m2gduqJwTN?=
 =?us-ascii?Q?nBbeOWY+T5QK+4poZHV4RgaxECX93mCqT7mYBO5YZwZOx9vkR6vsJyVm0KoK?=
 =?us-ascii?Q?sO2O9fzuHbLHzkUsjytF0igQcWR7E7XoHiEI9rq6REIzHcs/wwcqQFRzV4hY?=
 =?us-ascii?Q?kzK/JutyNW/b0nd8uZSjQBbFnMxpZdo94rnPXZ3LVuV5qyA5shoML3lBkgw0?=
 =?us-ascii?Q?dl8m3Yn66jVwWVcCssdz1wRBNhnsgk0WJGd43db7VTiHLyTLKHPD4lbSideM?=
 =?us-ascii?Q?sSIghx/15Ai5Idv712SbxFKzYFQKk1P6EnnYmgq8ZhBUvGzgUwvMbfl0Pczy?=
 =?us-ascii?Q?9Ttbh3HWxcQiYeml1kFKJ8SHiYD0fscjaJK2H7GMqf/EhNW0oV87Zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WlXWi2BLlL9BrzO7pxi/x6FO7QeJYUx1acAA0AJch0/xeSD9MXLNpvfzUL9x?=
 =?us-ascii?Q?E30oKn1g8ByAWXEKIqkQuC3xC7zV9ME9Kdx8laM4406USgOgX0Q8+PqvusyC?=
 =?us-ascii?Q?+iHcHXYin7w2qJdPDFtjEfSlH09uuDdKuZ2UDJ2AW9ShEbryXXnuq5bxWtu0?=
 =?us-ascii?Q?J0GaW0/GGH0tFOl5IIO7xhX2d08I2spkVDHJmiqm0ySXGUTKJ1lNVoSepiJF?=
 =?us-ascii?Q?cBMTSaH+Vj9q8OxwnlX/+UC5O0GM7QLabWLyMu/osOj9LNOlfLQDklqHFXrl?=
 =?us-ascii?Q?GPmIzrihMU/YmloZ43svl/VrChR4aSsg0wAZVlvG5gRARGVYcqfSrAQw5ha5?=
 =?us-ascii?Q?EYiGHuJR8IYOkaxxtAJaRdMPJgfN/IP9eoa/VwvFTWJbVVSHcAs2n5dMpF2Z?=
 =?us-ascii?Q?lLuYthEsnQkt5tvOcTCRgTZuAHRBuJ6atzh5KxHtmhDhUOaxHGm6/oZG+MSD?=
 =?us-ascii?Q?JvB/W0G2Qy4Ou4t1XwtUaUxKVVGvMUYZLjP5ic3pemnyx+II6wwZ4/8/chQP?=
 =?us-ascii?Q?crzjO9uSVKX7EjYs3U7tG2V75d4f7F6lRqHAoyaSa3qI5EzeGYhWnayBFfWn?=
 =?us-ascii?Q?ZnikMqQFwhy416DPntzoq1LNTf4YGwq/40R8Isz3hcbq/ZM1coFoMMn75FZq?=
 =?us-ascii?Q?7yyZ5wZ6yaeOqkjLrUFFjf/Yh0g0RaRbcaC308WLhvu0hdk3YRylitberOse?=
 =?us-ascii?Q?45TvCl7Gee6GsqCW2mUDzS/NZFjr0EgrZ2JJ0+zjwJgU0qe7Z0C3Zr6tA4Rk?=
 =?us-ascii?Q?p6jwgybQTucZYClRWZiGelSke2XuLqbdjL/bO0mG1Fn/Yg5HaGviVbhtguJG?=
 =?us-ascii?Q?v4LhAtq98PAuQnnjg9MwEDgxS5IGCd/8G/NQL8LYEJxdhv5VMqufZjBOmQCB?=
 =?us-ascii?Q?DIqxK5H9HGFKvp0a37nryPMjghH2jMLB09Qaw9uIK2l8K7shu0oh0YQOd8ya?=
 =?us-ascii?Q?uQ8/w6W68FSzB01wIOEs+AcPuLMBVN6Bo0B7i3BM+aqd7eNX1xoyLSmN2PHQ?=
 =?us-ascii?Q?U20qz3wrEYSxj9H3zhI5hI13SBWVo5yp6otRkZTbjc3qSIg3T5+7Da8AFClh?=
 =?us-ascii?Q?//btNj8n4XvhIKvHUWLBM477ytVXJudjHGZATVmMeX5nJLoy+ce/nFCUjTrk?=
 =?us-ascii?Q?3TjH7lL4JTdhsZpg1SdMOzYWA53MxSK4D9l1LLX+y/GUPaNyI9zpE6bhvzln?=
 =?us-ascii?Q?lYDOUPJ1fUN6ieYmJSEdh01/K7KymZCpkETLJ3SmVKGAiYU7YNOZTr+3lgAj?=
 =?us-ascii?Q?D6eStSc7aIRkbnD1Ouynn9IAx17SKHvpsgZX30/qTvqZjHLaI1pSz2FyHSem?=
 =?us-ascii?Q?BqNPkj2NoRB28xnOs23cdVXR3NEU8KU34v4JElYvdmyLQ9Fea4CjFuzz7nhA?=
 =?us-ascii?Q?XO8o/ajqOjz+IP/AB8jpJKvLYIUvrtOMF2A8nmmiRv9hfFnGukjJjQyTS+dF?=
 =?us-ascii?Q?l8iuTRuqfTkFt/7AnAp6rL1wa9CE+7V4skImrXQthdXJGYTjrymODm+pdF9e?=
 =?us-ascii?Q?nsNh24o6RmlcghadXTr/FVtpBQKzgYlImQEgeVY/w8eyXQl/bhyS4r0gpthq?=
 =?us-ascii?Q?UgqjFhVW6fz0hXj2JhIKQUiVFNabkz46bWbMvmpy0EKJhiK1wyIG2SZQFzN1?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db3829d2-9081-4833-99f4-08de3e875c23
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:47:02.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gK+jmIHkaSOA5o7M9HUT8CsuoGSPbjy6TSVGjfcIDzoIECN1ttKW5DPC7cgotnrFGj5vh7VXv+WKV6yvbXn6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

On Thu, Dec 18, 2025 at 04:21:53PM +0530, Riana Tauro wrote:
> Remove unused index variable and fix for loop.
> 
> Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/intel-xe/20251210075757.GA1206705@ax162/
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

applying this patch right now...  will hold the other patch...

> ---
> v2: remove unnecessary offset helper (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 7520d7b7f9b8..2869866537ad 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -128,11 +128,6 @@ xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribu
>  	return container_of(attr, struct xe_survivability_attribute, attr);
>  }
>  
> -static u32 aux_history_offset(u32 reg_value)
> -{
> -	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
> -}
> -
>  static void set_survivability_info(struct xe_mmio *mmio, u32  *info, int id)
>  {
>  	info[id] = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
> @@ -144,7 +139,6 @@ static void populate_survivability_info(struct xe_device *xe)
>  	u32 *info = survivability->info;
>  	struct xe_mmio *mmio;
>  	u32 id = 0, reg_value;
> -	int index;
>  
>  	mmio = xe_root_tile_mmio(xe);
>  	set_survivability_info(mmio, info, CAPABILITY_INFO);
> @@ -162,13 +156,12 @@ static void populate_survivability_info(struct xe_device *xe)
>  			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>  	}
>  
> +	/* Traverse the linked list of aux info registers */
>  	if (reg_value & AUXINFO_SUPPORT) {
> -		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> -
> -		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
> +		for (id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> +		     id >= AUX_INFO0 && id < MAX_SCRATCH_REG;
> +		     id =  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
>  			set_survivability_info(mmio, info, id);
> -			id = aux_history_offset(info[id]);
> -		}
>  	}
>  }
>  
> -- 
> 2.47.1
> 
