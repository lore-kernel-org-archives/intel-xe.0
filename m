Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E0FC54F51
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 20:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2303210E5EB;
	Tue, 28 Jul 2026 20:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXpJM0Yl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4010E5EB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 20:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785272328; x=1816808328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZMs8xsV79whdKVBhhI1mQYiTieUciKN5KufDw809Vkg=;
 b=SXpJM0YlQscdn4uc2/6qFt1KwdCkQUdv+vF4LaAlCTFuBSasWq/yNo32
 2bjlUCiyilb6kVMPsc6urP1yRnsjllrKc+g4hWPlWRXXSNQtOWlrmgCtl
 jsdqS7cYp6LQPW2sWPEUkd+GpaLXO42IpE11TpMFsYl29IICaOGnaUJke
 Mj6cjJfcSC+BrunhM8cll85Pjbt4/dFnWUFEmMBORXCYQGbmWH5N78o/W
 YT4raL6zwFBkfznTTmS0wI5gpYvOeP8yYFOXi1sNI9A6/JYduoBjN2vhV
 o+Q8FWelL/YLN+OpgzfH3Es9P0ne/pPmC1P8hmiaN5dN+mIWZ3FEsdbA/ g==;
X-CSE-ConnectionGUID: VGDdAor2TFe3UwPYjgVdbA==
X-CSE-MsgGUID: NzkDJDV0TaOijEmR5m4YxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85952471"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="85952471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 13:58:47 -0700
X-CSE-ConnectionGUID: DJFt6sebRoWNA2RyWF7mfQ==
X-CSE-MsgGUID: HbRBPmg7Tx2AIv8nkWxZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="264827704"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 13:58:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:58:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 13:58:46 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 13:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTSf8y3oFCVQgKrqSy9Ymvj0UwNBNX1XdzfECk8n7ITyDL8O4uJHYAAmDAnh5g3eYNDKvTWG730newuPhIu6pz9G/yrp4p/4B+kk0VOAiSFpN3Brr840vOcSvQkngyokGhvY7wGXZLZGh0eqo6Ixmb6KFOu8/e4oagU176EEYi2yaoCwhN+qEwGRcI6McQAnb2nkY1+veYhB03KST5zb6w0mbAqSmXQruD3Gr0U2q+AjM2EUmanQbc5ybd/1NvpN/KxwUyKs+4HVivET/rhz7AtNZh9gyVqLzgJIt1qbvy8gbLSSgAzswM9MuFiS9HEhT23prINOzF9NHLkbGt8jMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzFgXsxLLbHk8bh14n6GCBhxfG5/P0ck0okyVUSBtEI=;
 b=d9vgdkX3dwbHuLfeo2QJVunKeEIVfgYjeuh526bjzN92f3r92Y1ik94DHO0YSLXSuAz0Fsif8Pw+XgiD9QU/+7BGp4oCnqfYasL5u09EOt04HJ3/TMzj8tH76pyGgwBKtoko/4nH095/OLIC5V7RsHmqKBoGWG3DqM+fzs7ypmwRqtm2KBvkjL1jgqRGxuMaHxrBLDEhhnir9i+7c3FGquZO7xOQlCqyoSCDuW9srUujISyNKxYHp9xJH82qBzmpUefBWQmwNyATGr//NFA5/6LlZaZ7satiFY4/rmKkkEZ0uRhAYKRh+LhvF1rTmqBqrGydyg8nCiDGlTiEVcmekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB9721.namprd11.prod.outlook.com (2603:10b6:510:3a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 20:58:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:58:36 +0000
Date: Tue, 28 Jul 2026 13:57:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for
 first media slice
Message-ID: <20260728205710.GA8279@mdroper-desk1.amr.corp.intel.com>
References: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
 <20260727172712.2877706-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260727172712.2877706-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: 582e27fd-1a3a-45ab-09ca-08deeceafe1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 63p4pDuGRyeg8RsFM/FmZEQHsagsjAwZMv+2IE5yOMPZ7SiqFccDviofCWU9F94ameyA4jC0bpqxZPgeyaNxnSgSax8CcMcUKY8RxAUHV7KkLecTO4VUUlZOjXGWSPefA3VQqdjpIeW7qKEJzITndx1BFwW+SMuu0+MeZNUiluvAlLIdoBDi+UsJ8g52zrjzSVerjFmaoeH+U2AppqC5sXu01pwhNTjJv7FAltg+LfFQ+otUaPCMYdK3qxWfnf1eIhVCdpS+M1aUj4dHXN5AmGrdiRkVWmD1D2gizK5to4KWihugVct1/MUePIfFbh5acNT+JgfyRJRSCrqkZNFgXHX0S/p7JXCHZdnGAKzRhcTuKk6Vt8dxhKumd5qQVGvLTeAdgPBPtm9TzN+HuHbSvfZ4lqbaV9L+dKvzoi8rULOJET3GIUZmmjbPb2BXyZQqD/JYZFF6JDkdROR+DJzONQT85EL3kndYvh5buvZNif4eqiTstOjlRVotTdPUAJcurODE5bNVCPRaJsAPxV6rsh8nUBp9l1dLS/rJ1yTmXHyX7TG0/UPMNaKdy9+a8BYmiQz3pFDy1tfaEMkldMmCUWvNXTq43163d0hzJF87dlNTGtp2yDSyTRA6ZfM5VRVHjCsu4oqdKvLNI2gW/guryIFlGnHNIrsKHdyjlcFjIUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+DK7Z8s7J477CATs9ed5lGbAJCbJJ7NlqVv/FIbMF3Cjpb5jOcN7L5uekXU?=
 =?us-ascii?Q?EF0C3TzA4sah3c1IeoVYlwaBGuxftFQ5B+j/03e0ejBe7lrUtiIyBZYcCxGh?=
 =?us-ascii?Q?uSY+TGfnmSvGfniUA+v9VajyBxPcaaI0gbQMI6+Vwat22LfUtaGr9FPyN3iW?=
 =?us-ascii?Q?zH530URfO0DXNlIjJRDHOxKctNlreGhG2awQ3/p2WVbGOXO2ZaLqrUUmtwOc?=
 =?us-ascii?Q?JG9ezbvop2MyjxZdBlJDLw9SLJYzPYuY/5VWxCSObtwbew4Rd//vT63nuKPO?=
 =?us-ascii?Q?YXmFftIyWEPngjmRRORRLWV3sHxuJQqW1mqZZGZzKvZaSa29ecWMp45zutlb?=
 =?us-ascii?Q?Pl2KWaBKTy0gxkqVXq1763dhlR4Taijv3zon+N5h06De9pfnbI4SJi0FBzdc?=
 =?us-ascii?Q?iSKLPIM2DAiiQ5TnvWmf8ALuvmvEsQvBc5S+vQCNRN3AIjB7BmVSD6rk2JJk?=
 =?us-ascii?Q?yYuWnUhyrD80dbqQaz5HSlpkaVG3cLWUBoPHe8q8xRa/UG9KvzO7hgesGOCX?=
 =?us-ascii?Q?wKgAFAVQZ7g3maknQngDlLfBqY2WPNcD/0gQtIf3x17hMD7pC4tD3bawIEmu?=
 =?us-ascii?Q?2WytZZRvCn4H2hxBgbumxQXAqh/whrojZwW3bc2LpAev9XyOPVupcFqbP14G?=
 =?us-ascii?Q?p0hAgHx4ZsMtChpP0o5ATbUwDkjUQazdXr9d09mnqIEejJRRcHJl9iyjpVjw?=
 =?us-ascii?Q?t15WjGS0GM9eERsqhfixekMWs5GZjxcCULVTO31ML0m4xU8Kjr+/Xn5NISD/?=
 =?us-ascii?Q?tJN2jqbpFG/1YNunlvWVssUDrtVYE0u7rdfnZ70pcks2xKFo53BgKXXMNpkU?=
 =?us-ascii?Q?+VxtdQ0k9C+e3Dx/y0jjCDnWDp4NWVuFysiZSVsUY/+lBwEQ/kNIGHbmV/Em?=
 =?us-ascii?Q?yIQagvKcLd93ZMvZCGnlmWqckieQQCtxoE3gSZEki0R7DBIHbzPsWZErmUIo?=
 =?us-ascii?Q?gOcQ95cWeG7fkIUp8hEvBDcWVTycIFCDIFgik/ZGzmbwzQJr8BLRFz1+TouH?=
 =?us-ascii?Q?DF/AFMEgEBoy0xkQplkTfdFfO/hu0z+JkrHR1n88tSNrFDmXFTnCI6HBCNne?=
 =?us-ascii?Q?i5I3MUFC+yr/K9G9qlvvp71Iqnvy5NTaYgvqkqPLZ7+xOYALrVkj0Tzb9YCT?=
 =?us-ascii?Q?Lthp7KP5i7N041TmMWNT4HEBFdiCx33Th/WX4sy07e6sjxA21ThghyfqQX1h?=
 =?us-ascii?Q?2d6IHvlw+c/VOWSa/+iF+FKOuIXyg2CH4fofdvH8121QC8kFWP1cMXtPXM9x?=
 =?us-ascii?Q?r7c/OUVGxSyzsMOzVVMd7Ebgqmjjx9lCpaZve0Kbl43ibmSgm/4djTLvNj34?=
 =?us-ascii?Q?qbuL8KLBZuGBz31Q7fDDxCYcl+Tmn8um6T8NzJEEmShOyIbBOXL7/nzd7ssP?=
 =?us-ascii?Q?YVeIfklMTJfDbDyy1pCv8P6Xr2TTB3nGHUlPCpscuzngskwz14Rt738WyfYd?=
 =?us-ascii?Q?TjbT3wMqMjiqHaT5RNDHhltKWfGNVTTpJrLbJNQ2cNyyS55fOzL5VQu0uKil?=
 =?us-ascii?Q?4wA8HEer+reOHA8Rqm3Bio63UU8X1eLa2JDV73ITdX+AXsqFHtX2dMai/Idj?=
 =?us-ascii?Q?luU33mSppSmFWVlFVpULh8gAjHwfHEXInfWAHbhbP2seTuhMLeFTPf7jN+ht?=
 =?us-ascii?Q?uFmlt/9MBqUJkwdNW8s3EKgWqfdqcFgjl0trWrzmt9FgyPYiG9JFiKskdMEi?=
 =?us-ascii?Q?2bbwaO/ClBIDjdaooQ9oZ4WgIHjMwM2KtEeekvU14cCw1mS4Jd1LVc8LeWM5?=
 =?us-ascii?Q?WUcnEE2VPDyxRDGBhD+Ubjva/16WnIw=3D?=
X-Exchange-RoutingPolicyChecked: kYeTg3W+tWY2M5BUWqexkfoewtNVtlKU+CInx6IDJ3CgXmQmTQFlpewDGhgt+skgTLjOoDUc5169Cbusod83tejAjPztOYuHL9x4jTkmbcWu8q0COlmw6p6BVx1A+jMvHLt2I/Zqorx3aQtXzUUXphhxih9GLgaikpn82mxF/Lp/0cPTwNAlSFTXHmW5oTSAxvN38BVCbE9rhqXiOnSUfcxtIgoDzE4JuwTxqasuOavZFcLBDWS57rt3hFSTHqvb7u5bPpCRoNs2wR/ky0jADPlx7reFJ0tKi2rhmwXlWBElHUxkv9hLRREkXOiVOT1Xo5Yd/2Y2kpLuu4XEUdYl3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 582e27fd-1a3a-45ab-09ca-08deeceafe1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:58:36.5795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVVTKjsw22grXLfGmqnJlAkfXYd5jG9lECmymj4DZoFD1URJJMlo7w+59NdRdYjLcQ/cG7Vk8LmNygfRDtNgiBfFs7ZCo312cuttRfLGRBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9721
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

On Mon, Jul 27, 2026 at 10:27:11AM -0700, Ashutosh Dixit wrote:
> vcs1 and vecs1 may also be present on the first media slice, so take
> vcs1/vecs1 also into account when determining if the first media slice is
> absent.
> 
> Bspec: 67103, 77977
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
> v2: Bug fix
> v3: Fix for BMG (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 9799ffadf85d2..8beb4006cd891 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -452,11 +452,15 @@ static void init_steering_dss(struct xe_gt *gt)
>  
>  static void init_steering_oaddrm(struct xe_gt *gt)
>  {
> +	u64 hwe_mask = XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0;
> +
> +	if (MEDIA_VERx100(gt_to_xe(gt)) >= 3500)

This will work as a short-term bandaid, but fundamentally the media
configuration isn't really a case where "old platforms were always 1/1/1
and new platforms will probably always be 2/2/2."  It's something that
can easily vary platform-by-platform or even SKU-by-SKU (e.g., bspec
70819 still shows some what was originally planned in the past for
different SKUs of a platform, even though that platform eventually
settled on something simpler).  If I recall correctly, there were also
configurations like 2/1/1 used on older platforms like DG2, but we
didn't need to worry about SCMI or OADDRM steering for MCR purposes on
those platforms so it just never came up in the code.

I'm okay landing this patch as a short-term fix for NVL and CRI, but we
should add a TODO comment or something indicating that we really should
move the "VD per SCMI" and "VE per SCMI" values into our media
descriptors so that we can easily pick the appropriate config on a
per-release / per-SKU manner to ensure we think about it on a
release-by-release basis when enabling new platforms and IP versions in
the future.


Matt

> +		hwe_mask |= XE_HW_ENGINE_VCS1 | XE_HW_ENGINE_VECS1;
>  	/*
>  	 * First instance is only terminated if the entire first media slice
> -	 * is absent (i.e., no VCS0 or VECS0).
> +	 * is absent (i.e., no engines in hwe_mask).
>  	 */
> -	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
> +	if (gt->info.engine_mask & hwe_mask)
>  		gt->steering[OADDRM].group_target = 0;
>  	else
>  		gt->steering[OADDRM].group_target = 1;
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
