Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CB2CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371110F297;
	Mon,  1 Apr 2024 16:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJchOA9D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7C10F297
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987851; x=1743523851;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oMeGrWcuIYPrNplK9fLQ8iQ7m4zXMnHp6VpwZxqYuyI=;
 b=DJchOA9Dfdx4gUNega2z7aXcwVmvLVh1jhVrPETPagqhpxtiBpa6rj5X
 o2jDrjKGfKJgnmoyb+HnzVeUY9OmECTRJLajnus2NnzqkxydlBpFamNRY
 xtNNZBzPqcDd5TafYlTDRTI3fER2rkq+E5UojoN60V9DYJ+vfw9vUqhLR
 RrfB8EbFEPhfTaTwh1PjiwaxYsMm4xpZCOVw6kpmnZ+4QTlQE2CWcS8vl
 X4wUURYAhPw5NO6TRQE86Oa52b93q05sKFo/ngMi0a/iS+3uv+2E9AKOM
 NAr+IEGiB0FDDC7Tq8m6ueAH2ngr6FfcKj6OllEtFDunNyWrbeC7iTOQI A==;
X-CSE-ConnectionGUID: SHmW9T6GSQODvrvVinxfpw==
X-CSE-MsgGUID: w0KBVItlRfa9ob/vcfm7iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7018795"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7018795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17825705"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:10:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:10:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:10:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+3HYYXcmsBh6TH6K8P+5ymW3rncFUM8m40LPwKxJu0V6sbjznPWmKxP8v5h4N2cJP6Nbh0A4lK8wU36i1tjqC9zuyAXhkZ/zgcc5MB4xX5oZnA++MkZqmIywRQ9l4BAbO5bnP0EXO/hcRMG/7lZUTMnEaljaX7eYdQrbrb3jTHw5vn7azMaDSgB7e1MwfT18cuB1OSnWTnMEj533A5uBA/xQA4768DUUoYXgUjA/kbWPx8WL1oemGMhu0T4Gg5Z9AtqutCyk7DgIh0Sk7XpcflghboNo29S3iqMsMURfNydNhn7Yv9xywavDfoef35oBUvQJPNBrchbgSEbxgoe0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX/ny15ymAp0YWAaoV9hHuHJeSvBtKbZK/dI0vspy3I=;
 b=YFdwcnfPIOsPz2BBA2r+qM88JwzAfR3sUKnu4BSIiq3uo1TrHzBfOwiOcKzBKNsjB1EAH3OjssiwL23UbUlDRwfMY0lj97+lIy1bz2ByHxJkdP8HjuLpfbozZ8Li+G4tS91mQUydZk/SetTym5+LFbwm83eu76s34O2WTJwnSMv8s9blTdYHsMUxRs+WQl2kfdmuLrMXhq1w4MSOGDI6ZVsVmUJwwt9WjT1lEGuVvIUHW5DG6bEwMmCjUHBbYUfwv+8obaDIp42f1ivuiAdVOxv9McYCZskMMBkIOkiqAHDxJtNLp3Wp3FKACZdINIfa32X/Z08p5xdN2xWsIHDojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 1 Apr
 2024 16:09:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:09:19 +0000
Date: Mon, 1 Apr 2024 09:09:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18033852989
Message-ID: <20240401160916.GA6574@mdroper-desk1.amr.corp.intel.com>
References: <20240401052142.3799284-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240401052142.3799284-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6903:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PgKMKvEdbwPdVtUr3mT/fS0K+/TG+lIzYhQ6PIQT2MEYmnhm1tcj/mhQ5eclb/lfKsE+loMJeCEwV7jgFaPX4PjdP0uyip2t9RnGkcc4ZjypNWsjVqM9neQqcOiIFsMY/p1tiz/ryNg0eNm/yp3YjTThs7HSsb3gj0VX6zsGYCqS3PkAzOcuKTFpAete2nNlCQ7UWFLWGtUYNcY3khekvYw+BJm/gwSF8Is6hoSCgQ6p/fNdXWLcnF6XBpi9elyvGGiMwFjwgYs+4d5aeMUGhZw/3EuHj3eYkUqbKF3PhJWjIM7teCflo7f5sTU6ZkoREvbOcWism2iCulRACazwpHz1pytE4qDxJUhw2TScZVxgo4MR7FXDwA5LtaqCIin0g7HG//o1owdwWbbfM/hZpjUFzj259QiPF3VUjW/3fgwJgXbHA0D/TWK55HvbEcecbQxr/XbexqpaWqABrMj4jug2W7KA7bzY1ba1Rg5IOepIMLsPCg8DGCkNGhsubQzO3BnWboxTuJTO7gbt4N3GPi5wy7iccLiSX00n7xnhLWbTA/Gq3D4dPe9qdA1wPLToUqMcpqKyp/CE5VXUYaHKetdPoTVaNPnH8359GJV9UesXOZ3m6m4u+rzewDCwsRPMeuArVUVddbLl+DqauFoFkxANKy9tPu67/+4fCSoEvt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UFr8EZXPtTg1Oz0RSPuGk7dyLzu/+N1zOqloI5gHdttJTOWZIlJmC2ipRwYq?=
 =?us-ascii?Q?rZjRDUl8ujy7ZelFdMl6U4AHVwpFlrSHgqRPwa0sijjRk6sqCWu3IFyRY38A?=
 =?us-ascii?Q?0Zm+La++dhUaJB0FcP8RQJEowGTt+CphbBk71GmGyW2lRkRncKp0qv/hwYAe?=
 =?us-ascii?Q?HqMzmFUwepc6isZwDT6lotsrD6hR+7cOxs+AyIpgF8jycYndxJxYulXW50Ux?=
 =?us-ascii?Q?ElJ00Prqv7ZU03Rw0+AoQ13Da43lMHPUXAJ2c/G5D9+M3wFFvH1/Y6bLaEBW?=
 =?us-ascii?Q?sDx270lwY/5MM7kFtirAm2bk4aV2/CzGFy3sCGW3Y4LdyB5q62MOC7WQQw6T?=
 =?us-ascii?Q?heFfGaaTMu4S9BT7lYbp1xjmeP6xuEBGBOFVTyEGLE/Ud8S/VQWDRAgRoT6z?=
 =?us-ascii?Q?nGAySgjRPbbUxAv97xoe9aZUSNWvjwE9OhdhrVqveSF3PjcXJUf6eQIaHVAy?=
 =?us-ascii?Q?h7MWtLjH3elEt9t7yepmkkMj2QD98tGX+Vepoygljn5JvK9dM8oAWcvpYSu/?=
 =?us-ascii?Q?HBlrna/vmIIRx9caOA63bsxxA17tNxGP+JbfceCROyrWhSxrqxzCk/MyHC3Q?=
 =?us-ascii?Q?8ilINaUqZsKx68uVZ4JtV8U1as7ZutPPoJpxgnJeFx3hs0Ox1VdsgZwaWpnD?=
 =?us-ascii?Q?IOPe9j3+SKxtMAcXONg4rcxpEU/jB8gb6RgZYSwRW1WDoDcKSv7KqmvVkhYN?=
 =?us-ascii?Q?K6GZ95MArteyUYtkWDuMqolDtWkyZyATj7cbuioNAJaBnXGSmi9odJwN/yZk?=
 =?us-ascii?Q?hoN+W3xPOaHrMJ/bJxIHdh3VODdYeJEAcyr26xFPdtignHnDwQtXaY7CzBJg?=
 =?us-ascii?Q?dBM7R1jMhcjsdTWcjwspkesKRSNef9QythVIqjWJUnfaJyNGvaeA4YC3kgtl?=
 =?us-ascii?Q?zSnc2gzDBTl5l3pK0p/JjvkoOisUbwQ+hmSy7iZiCrOtCdtImd61uv3RCFaW?=
 =?us-ascii?Q?JYbMU/S0sVhRmpBxu2KTIS6TQ82Y9j4K4RpTESCoq8k7QIQIln7GWbGpXpR3?=
 =?us-ascii?Q?MXMAji8geAUaik1LDuGeb8wbyIzvIKYJtHryOPqCzgQcVGfcrS4y9PTLk132?=
 =?us-ascii?Q?7ce/Bg+aarOv3LUW01UKrwgX+93Xjynnvajvlddf13zhR+dP8ajnQ0cJfehT?=
 =?us-ascii?Q?E00WrDxJgOEQ3ExonFcQ1mtnj/ZnRlMZC55A1QBOli0xKxq/HHxqTaQ546fh?=
 =?us-ascii?Q?e7LVreRAv/w+vKSFEs4h1YEqqjA9dQubrWDOf1YuFSEdX8w5kb6liO/7LWyc?=
 =?us-ascii?Q?cqVCTFi+gb0mP1YbV4TkQzj2wDGAqWf500njzIAlnndMtFY7tu8hbHkY9bBT?=
 =?us-ascii?Q?bXLeuKRJGJE5GshReUz8uCQ4VZB/tESQZkanzMKRRJDcGxx07mYC4JVRHiDI?=
 =?us-ascii?Q?6bqYt11dN25YHXNblquyMtXo8ErbrP9Z9xMSoPU0/H+JmAZwmsYMOPTBs1yf?=
 =?us-ascii?Q?rKqmZsJ+IFJcsnLSp+3Lcm+PbwQpp0xlJToBCOMR7SmZ0zkuTfbn6EeCy4Bt?=
 =?us-ascii?Q?zlQmz+ZZPTIagzBm69MtU2Cn1XVH2RoV/T9Cegk4D7tCE5Ykjer9DPZf9UgS?=
 =?us-ascii?Q?XA4sPwUG0Y10TDnbxIgUNICRCdvcs27g6a21ZsfFvcds3YvtKH9txandbzGr?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7aff8ca-3773-4c99-cae6-08dc52661615
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 16:09:19.2375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggZub9rv1XUayqUJDE8Q4K/pAf15ilMziLkHyiXckffAGiIzuqgLqO13az3rWmMFAILcbUvza6W68vZzVTAGHJTsMCxeiGHQZy2CTNrPkso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

On Mon, Apr 01, 2024 at 10:51:42AM +0530, Himal Prasad Ghimiray wrote:
> This workaround applies to Graphics 20.04 as RCS
> engine workaround.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d5b21f03beaa..9728d9da9931 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -98,6 +98,7 @@
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)

It looks like this is a masked register, but we're missing the
XE_REG_OPTION_MASKED flag on the definition here.  Without that, the bit
progamming below won't actually take effect.


Matt

> +#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..c904e55ced9c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
>  	},
> +	{ XE_RTP_NAME("18033852989"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
