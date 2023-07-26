Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E98C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C24B10E4CE;
	Wed, 26 Jul 2023 23:46:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEE510E4CE
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 23:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690415162; x=1721951162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BzPEFAyWONlCu3T4T6G+IqvtU79GWnH2EzWU9/Nruc4=;
 b=AiB3k6JbSvhu3cpYyzbG22VGKu8Fq9xTLqihkdBKnlgWJdGNDtQnTU/0
 eokaP7f5eNK9KSDnmpYHSARdtr8eYSdLxh/zY2uBOYKR6afLLviVhptTn
 Vq0+V95l2sNYaj2CDSXr3HYm8K8Iv9MnYdX+YA0cWQLXHROK4iyeqfwSS
 CwMNHauV/wRd/FwUf9hC9QUxFBL+WAVtN6uv7IrDoLZ+dYjHrTqJ5UbBj
 W5EhNvZ2FA+fHnnVEYK/+I8NUfaCzcBySNRo9o13GUz9kwjC3TRhTNYav
 VSTps5+/sRNd00zDleB9jrXeYhPcVVegEiZUjC7VMINe8gGMae0BEQJiA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348439448"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="348439448"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 16:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="703933372"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="703933372"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2023 16:46:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 16:46:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 16:46:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 16:46:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 16:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZrJvHD2X/lbggR+Nr3Y21AuGulJXUvDJiiwQSdHew0C4/8b5goEKmVGT4C2T/r8vmoZaXkDtjeQ5Xij++FN5XjyfHGvSOlhlYA0qtWXfottJyMHAGsGCqs46lP4zhwIYfKvLxqweMlTwyTRsjvQfjyJk8xOB69LOP56rOTJRTsPQ5M+hsccEpBijzpkBvQwDIz9ssUA9MMf5PiQFAj/v6ppWAMLmulLfZizhuQBAu8YjqrNvIOWVd24QMmaTZLInL7bvOrPummDHrwnRYLt8vXlJIQeVpohRywyTpZH3iymr75R8lKrbfJO3TOminUy64TXMoC/Twr0A1WTeM9QLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL3PTcr0C40AThHB8OObNWsAS/cjl1HINAZbRk2M1F8=;
 b=R8fjDtuKen+/lnpJn+cwaZqMTBR6f/eEDjPhcn/NGjSX5zYUD/JBpvGmWBMBj4SMtiNENmTZJCLBV6ZS9jMRkO3rCTacCzCfBBCDyXkyGR576lM4PPr4fVjHjPpDy/mCqWD3DYdp4TckhXe0U69D+VucfypcHzIpieNwt6dtdTRmU5GeqUYF7A3X/zpXTKP3lL4Cz8PNC9D6uBoH/r6VpUjzmpsKes4ipnLRC4tQ0PF6dD/qDlGpxk20pJSXpcCKkPkOgJJqQaNZHagDRt8IgAit5vWj87w5y6rnYTL1v6+ttTLZa+JuVRziRSJwGWvDDWTLSdr1v4aQ7v64hw6iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 23:45:53 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 23:45:53 +0000
Date: Wed, 26 Jul 2023 16:45:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230726234550.GB209733@mdroper-desk1.amr.corp.intel.com>
References: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726222528.366732-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b5891f-3c36-4831-2edc-08db8e327321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ssZ+3znQdB+jzZAIPCEoXR91SoGy4E9fz/sATb5tpOuufs9s6URotu04a0gzPBpHoK4qWT4twsNyEua7eXS0UKvLnhDnbEG+k36ujReavjmJ8dwHQVr+8WUFOt2FfbiPjA+yJ9FI9W8W5T1yUL2e8uKOUqAH17hAjtOkZ1S5gJor4pPxsJoeODb8YCjSGmLq00sqxhmMhQYB29dL8/XAKJtcFAdVoxaG9JyKjL72+2USbUdEvfrJGbkbIJv/na3O1+GPDlLATSfwowEmXEAJtd29eb/O3FuSEs6C50NlB7x/48kqInJdkZnnx44F6KijIJaKIWxNHDzCsdz/OXjjnTpNQpyqaqDboda9jbxQ4pD8+0GjN0S8CmD20Jbn6hWwwKtugBuyu1P0xJRQSACYLhMz0z/1j1P1I0jiDwSwal9N+vJvJTdw4Y+ZhK7lt4R0B6hw7mZmfyEd/UBROty9cn+iIOfcqd3g6i/lSMOYGHvSlONvO58sm3e7fhty4Derilaa/WXDMnCRHB9XpsLQfl7FVRFmnwz1XIMsHtkkp7kdxXUo5VJy2MVrblrwbY1b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(478600001)(6512007)(6486002)(6506007)(186003)(2906002)(26005)(66946007)(107886003)(1076003)(41300700001)(66556008)(8676002)(5660300002)(66476007)(6636002)(6862004)(8936002)(4326008)(316002)(82960400001)(38100700002)(86362001)(83380400001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MDKWoe5MRsMmqMMM+2/evFr+ilBvtyMuRF+GZmjeGSSqOI9JvqTkL07wSccu?=
 =?us-ascii?Q?W5cFqM6zAP7EED3WbB6z0FBY68tdlrQhGlW08Z7LicCeSkNLpj7Gh9yk8WCX?=
 =?us-ascii?Q?4CNt8dfFGB0i5MEENwT4V1mVUkQzrtG/oZ3unz1WUhkUjFOWz2CK/gzRGCKx?=
 =?us-ascii?Q?BhbqeVYexNRnKy3NECGG62olZfLG6YuEsIGmVoPcAh7EQOekycx8r+ZqkHl8?=
 =?us-ascii?Q?Tt/Aa519/kWRuGUctxVLNGFPeMhgadD7IiRZFJHU96qjzirOJHkyXrsBnJVv?=
 =?us-ascii?Q?XG92tUXZveL0qMniUOhYw9KNb69q981D4zrYzfDUuNFiDtDABiR+cxGqIw+h?=
 =?us-ascii?Q?uX7xCRUZG5Z7W5MRsCNFeu0ia+oCnPaC2DYj5YWgv+7VB3QBz+DJLDU0q7XF?=
 =?us-ascii?Q?tjsOEAICSrkE/kjnfTvEzJIUqAGtoPuA6A15anj1agJtKXXDAXXWYdKjYgXN?=
 =?us-ascii?Q?x2K8cW62QHs3zwQZVcRQEgHzdf7XNRfuw+AT1+kR12C0uTv8QICd499H0i8g?=
 =?us-ascii?Q?v7vXf9ITG6cAv7mRaPew2ouwlkieNTF+gY3nebWomF1nyGDkCSeLoaRdvcpj?=
 =?us-ascii?Q?MxRCxUHcaPmnGHPXPM4Hil/NkTTwsedhLWgyuIN/34myjcuEKG/6vL0UvZ9z?=
 =?us-ascii?Q?O4M6rVEbW2JGkcGd4KqwU2JD35ifG62VHItPkM2xX23B2r9j7/bUdGsKK3t3?=
 =?us-ascii?Q?rXK68dCnMo0+8WjsDfNOcGTyovGZmKwSG25rpyfm2x5ZDUjr2WOh9pHUnr3+?=
 =?us-ascii?Q?m+NqWVAxwRUDT0i71F55YeABEHeQ65wDMJEYk7Y4KjPWjAKJpXZNBsR7az4N?=
 =?us-ascii?Q?lJxACNeXZzkdVvQOK3LrHW5IUKAnPCj7MnEYMOxFiPcRbhyycuyqtFDvbKU9?=
 =?us-ascii?Q?+q7I1zJE4ztisATaoczXJzr1FkvSgqfc5DHLGsB4kKdTNjE1KG95AUs8+kr1?=
 =?us-ascii?Q?NeOWsRhb30lKnVtEyVKvG9gC/LbdZ5ZHZst/womhJcSu20EJ8UQE3kmzosOP?=
 =?us-ascii?Q?5/3zFJgotOf1J1b0NacDq4s6r17wkWzyh9TjPsU3mlorIqqGuaWZAnR1OKk7?=
 =?us-ascii?Q?5glfzZOs6HWu4HBM0CwsklrJqQdsPOvjz+/1yZrZycJ3bGLoEKoXFrZsVeSL?=
 =?us-ascii?Q?qIaEKTyZ6HKLYxdpq9xmesS9LTA0O8fvg2dY4JGEFwRcPISxMHwRi+42OohH?=
 =?us-ascii?Q?LIIU3WlDA07yiATLlnUggfUy8hiQVptkcyhDWT9P7q0YG/2+p0vugvPfyMF6?=
 =?us-ascii?Q?ajKdrZoO6tXWBXiJJm2+WCl0uvv6zI6N7wm8J/yUQ6Tp8p0O3Ycpa8GbHKDP?=
 =?us-ascii?Q?0sqBt0RM8ZrdZapsmHCzu0L1pJVH3FqVv8DStDz4GKIFSWUkv323/iDRFE60?=
 =?us-ascii?Q?PcEopbWXpfxk+z4lGgcSn3n8/2ZICTFQ3gswZZyFDkC+Jg1p5WDINfmExmvg?=
 =?us-ascii?Q?phfx+LafHmFvudpw6dMKybF/d66OFIYJMlVByxLWnpJScZFtWo2wdIiYxMeE?=
 =?us-ascii?Q?ePXDtCmfp+n4LSoBqvHwsaLgYHq4z2yUM8kpmE3nrE0Z8D5VpSUV5OsWSHyI?=
 =?us-ascii?Q?yxAkANDyWH1suX7t/iPZWbNj6BppHrvzGIX+i+B8fiNEeTHBkYpqb8JzO5z9?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b5891f-3c36-4831-2edc-08db8e327321
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 23:45:53.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeJub6+Pwllt+Lb0CCmVfNeL/H38hW12wdrl+HY+GM5Tn8szKQFhduQINMJKvg7twUKkXYERL7L1pPhk2AYpdEzUSkECv7atGwOskxnB+cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix mcr semaphore locking for MTL
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 03:25:28PM -0700, Daniele Ceraolo Spurio wrote:
> in commit 8604f978f45b ("drm/xe: Convert xe_mmio_wait32 to us so we can
> stop using wait_for_us.") the mcr semaphore register read was
> accidentally switched from waiting for the register to go to 1 to
> waiting for the register to go to 0, so we need to flip it back.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index c56815af0686..9eb7a6a1348d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -420,10 +420,11 @@ static void mcr_lock(struct xe_gt *gt)
>  	/*
>  	 * Starting with MTL we also need to grab a semaphore register
>  	 * to synchronize with external agents (e.g., firmware) that now
> -	 * shares the same steering control register.
> +	 * shares the same steering control register. The semaphore is obtained
> +	 * when a read to the relevant register returns 1.
>  	 */
>  	if (GRAPHICS_VERx100(xe) >= 1270)
> -		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
> +		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0x1, 0x1, 10, NULL,
>  				     true);
>  
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
> @@ -431,7 +432,7 @@ static void mcr_lock(struct xe_gt *gt)
>  
>  static void mcr_unlock(struct xe_gt *gt)
>  {
> -	/* Release hardware semaphore */
> +	/* Release hardware semaphore - this is done by writing 1 to the register */
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
>  		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
>  
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
