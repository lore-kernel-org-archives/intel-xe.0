Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93599C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 20:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C14C10E565;
	Mon,  3 Feb 2025 20:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjzbZPKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51F810E565
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738614985; x=1770150985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3dShiz9tn42bm3RHXkpxhfvyNAAQzpR6pC1ABvKf+qI=;
 b=bjzbZPKY/OFN0deXwrz0CbL09104rQZiDt8kjV0AYnSY9i7G4D05H5d8
 /gQZdvw909kWtDh3ELsUSenUj1vI4nW7lUusWXfHdNX1qcgUwlbWlbM2c
 Zrn5rXeJyEGfq3nLull9ri1smWPXx/F/sx2L6ZrxV1oikH+4oYO3zbEFL
 WB31G+q8JPeazG6o25H77Qa18Q+nmK3J8tjt+NdPffYHukIIYXtAfaK72
 I0uqukD7EzykOT64hJK1yrOiy6IZc+8sZVB8aa/GQyst58iYEL2itvHoT
 sL8bfeTkbA89Yk+hQ8zSrFOxhliRLvx1xeakQ0I2iDBy7fbdRGhsu3gjJ w==;
X-CSE-ConnectionGUID: G81cLpkXSwWuHscRwTTqgg==
X-CSE-MsgGUID: C2ZR0+y2Tk2VHH2qAIgUhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56660870"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="56660870"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 12:36:24 -0800
X-CSE-ConnectionGUID: IcH4nXUKSQSrqsQJ8W25Aw==
X-CSE-MsgGUID: CZlZcjzqQWWOkCMhF/9lgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="141267648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 12:36:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 12:36:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 12:36:22 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 12:36:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt+bOqMfdOMcUTUtkO5RcT/X4Xuvi2Ek8xBFOANaXdxPCL5WxypUkus2OZ+hQrSWiFPFP1uJEyUkIin3dshnUVfxBxVpi6hnKiToUJi4eKoE3RQRRb0kNT9fIH3oOWGP2zyo33A7IX+cEXBP6klO4gYoEXT7S/wqh729Xf5UXmr6+9t5poKdaISQXq0lnxf/EBtmmYK1C1E6M6amTD3EBE1EtyoQ27XMGhID79v7cEnSJItiZhhqo0KyFZyG8XryxsxS7t8glfdB3rshnMum2WjJB//X5F0VTTj67BRnrdPD5OqQT07Q6S4lGAjoR0y/3Abg4bry0lR0SJ817yZLdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ7eiiSPeWduJl2m2bLh8InjBSGTvRkj+3bhfIe2djc=;
 b=TzI/oj7/NHmPPJiPTkIj8dXuVoeB0A8yJ46hPokPkIKW/ocI/BQIK7/mRpuWaL65UI1FOrlGwtbqWYDF2sJqpu5bGswn+tVw4y9M/xE4uLd7A2+RT0uqUgrBtK4DbEz0GQoLyou5jlFBZlkA524eLGEFWpzHaX1SCHq0IVg8n9uHzOGlbCiAoHZTfLm1+hQf+CUD0EJL8/gViQKWf2pL4iY1Iiqpyg13MuiFtWHNg/wLxuOUjkxTwv95IjK2f8+ko5Y2yMYKXG+CMg4sD4njY8Sh3DOFv7RSJG3XAMSS+OePHUgWuPXGkUaSWgMv9aQdvOiXFfDo5viOAAfC2eqFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 20:36:20 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 20:36:20 +0000
Date: Mon, 3 Feb 2025 15:36:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, Dani Liberman <dliberman@habana.ai>, Ohad Sharabi
 <osharabi@habana.ai>
Subject: Re: [PATCH 2/7] drm/xe: Fix error handling in xe_irq_install()
Message-ID: <Z6Eov6jwLysbktjD@intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|LV1PR11MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 360c09b9-e693-4cf2-6a0c-08dd44926a6c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PkzGPcc/nS6TcxALNhh3pr/2YOjjmPv/J/FOoILceKaRWRcNedj3fxk2e1lC?=
 =?us-ascii?Q?VPjddO4hdsD07YvwBvkEMxK3I9rb0FBVMTW5sqvOojR68jxnpI+ca4f7AioM?=
 =?us-ascii?Q?qlBx8b4WrF1nms+Ia/I/hO5RyoOBQ2Aw5t8Af+uz9qOR/yy3zq+iV9LyUOZh?=
 =?us-ascii?Q?CXH1vLOapWi6L5QJrfpvGQMeFaE5H/4DMxcNrAMtXDrxjPtSbqNTUBJMXWHm?=
 =?us-ascii?Q?yKAAeNTxVTqR6uc5VEBV4Q0o3uLdorYkbs8Tgl5VMHl6yInFVyCDocOAVFjY?=
 =?us-ascii?Q?Ekvf8og5IIj+c+igKoeOwPV6fxSl3rATzC0CishIbpEAs57uqU/a4pQjZhTh?=
 =?us-ascii?Q?QnV3MPkqae38n0AkMunUIUiLUZUxbqd3CZtx7+8IEXix7CjRoeak1oOhSEMQ?=
 =?us-ascii?Q?4Ov5jh50ePEDP8i/NHZlk2T/OdTNPRYpquqF2ApA3YD7OCIWfml7SSHJ16iM?=
 =?us-ascii?Q?MOgRFBONnDd/66B9kzVnZBvdm5p93C/+m1HoknM2XH+UYtH5mFZOPGnRZgAU?=
 =?us-ascii?Q?0j1JGZTQGj+YQkLGT92MKMrQDahEiDhR3HlPKEJf/PbjTHDN3WcPJ/nhYjs3?=
 =?us-ascii?Q?5wvXuGJv7+lnwudqd/1jA8Y+hHecLo3tagEJ1kwBGLy1s6r+ytbm4TUzu/Iz?=
 =?us-ascii?Q?58NozhcZUoIf1zRG3ofWd9jLjdOpl293dKtvjrbBKsmTqUU8XMw6ORXfBm92?=
 =?us-ascii?Q?lEtsANrtPDCkjmFsZfHUBhbzWd4VEP+/janIb5VC/OKL4dBUoSnc7KQls0n2?=
 =?us-ascii?Q?6ukKsTcaDmEpZcOsVktIMyp+GOimdVINKBb6ymiPUVz7D+8h10tY3L/mRcE0?=
 =?us-ascii?Q?kuJZmAEUD/B86h6DdSuJBEphd/jIenF3bez3XT5wa8u3kcDs/GKdxlOBxyTP?=
 =?us-ascii?Q?a4r4hd2jGVs344D6VtjfpG5e/JDE4upXUndBrZ8OpyyEHColWC8fd4IPp+yB?=
 =?us-ascii?Q?w8ksnMTb+6qDu+qSZkvE37LkwIQXx8r38x61GqWOeKkMAnj+PKqxzzZ0Bd7A?=
 =?us-ascii?Q?GmIPGQugZj3XBzU+OyL93Iiz9YqujyYUJirq0gj2hMtCCOsOp1rpgx9sC7ab?=
 =?us-ascii?Q?4SVVNlGrttP0E8FY/rl4rV/pGS1k5Ap2+dD8RxEgg7XLdGCdIveITb0KRPL/?=
 =?us-ascii?Q?c3jyQeK8y4YT2mnuheDgrOwXcKnBzRki4qju71hMZVMlforBP+K7BPth3Bun?=
 =?us-ascii?Q?ydO3Hs8ZAZQGbn2xJcGEsHsun2DuclRefRNqwVwPtOlTN0G7j64nhfXbREYe?=
 =?us-ascii?Q?Dw8qJMjf3n0MaaKm8+f8EimLhyYgXxxN0ovGzKYot5ODdYKPFtfXORBi9wKw?=
 =?us-ascii?Q?1N8Stuy8M1tOM2uA4PXMkMoej+ONKgQv3fuQ5nL//U74CI3kLAmHlwIExLHY?=
 =?us-ascii?Q?xD5UxdgRDP3VVLSyN4caDcqn4Zer?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2XkivxH6IqxEnrGbseHcttsB1l6JGq4bqRQc+XiewvY0dRswUezSdfQQu8d+?=
 =?us-ascii?Q?3OnoRcst05DT4hEL91b0BnPz922tkejp79+BkLcPEbOrhNIn7k10lr00r62U?=
 =?us-ascii?Q?H/2PXTBEIjmGtfDHpxMVnSsnNJyDTCWV3xO9exEYcdn67fMr+9hRavLANfou?=
 =?us-ascii?Q?OLYg1zJFtjsm34kwuh7rJI2KyT5zgPwfO2AffFs8rNJAdvD4VWXBtIwCTNUl?=
 =?us-ascii?Q?Sfyo2VSef98AslFrehv1yZjEfPYk5lFW2hDNdIUpuZgItSYBzCimSJaj7ibA?=
 =?us-ascii?Q?0EwpdYS3UXqQTebg1EBnuHxE/lchLaylmJY93cWQKRjbSyEGei1eUkfylLeD?=
 =?us-ascii?Q?LEXRZCgQnxaBtebPhcZr+27YeQfhyHwSOZ0jkbHflYgovY87xEhcN8OsaEOp?=
 =?us-ascii?Q?0LwcnvlGRj0kNzbsSqKcATmlBk6Wr/gnNAmZR1EDxMZfs8EBIGIrkY7NDQSR?=
 =?us-ascii?Q?VtBhP0zG8hchuiG8RLp8cL5fCbj0LlbrtIPfDhuC12b0gTXVdoTDaLlhfqnV?=
 =?us-ascii?Q?n1mTLWKiWWvLLCyMfOLrDqDhjHp3x1LNf7poKd+eWc/cqrUDQMBFLveIzcHr?=
 =?us-ascii?Q?CKeL6R0pvEmBxiLSIaTHoFVlQQW0Tt8jGuEf/IWD1W4mQgVHVJ9F0X1zBoo+?=
 =?us-ascii?Q?iibLAIDcjWAgddPllyCsrkW8OTF4uIPXMWtnkyqM1py7UWFKqSoE2FgJKhA3?=
 =?us-ascii?Q?WvksKemQvYLOG/jdbgG36NgGWHzNQBWNC20/EXjJY59VpcZQ2sZQDaZvm4hH?=
 =?us-ascii?Q?UM4qH5UX9/FZHsqxQ8OtmLzP+DAzKRdB0fOzgwKOnNnJKM/hGRmPvuMuAaAY?=
 =?us-ascii?Q?Q7Q1XvdxZziOf1vd+uNATZpZ8Zhuw7PVnD3ZGjJ3mz6W/X/ifQCoOaiZSH1s?=
 =?us-ascii?Q?T8AEocNT1ik/eYRUx1EzFctGVV8Aa/XUmWr5tzh3JtHHI7MrhIybT776jme8?=
 =?us-ascii?Q?/RbCnhBQv9gmYw5zOXsLnn6CDTzMN7ssTh0yg2tOqvLncOOozZq47YxT+Pjd?=
 =?us-ascii?Q?agZ5IAOw3RvR7HXZJVJdOW7rGN/ee+/ylEjKJsjxqfXtlgP/yNjXFXccjC3s?=
 =?us-ascii?Q?SSyWTCmZnPVPdAxJkoO8lCtzZn/gTvNZoLOXRqvJw2R6iwIj+zC9W0IPsSDD?=
 =?us-ascii?Q?vHd3/FXyV3U19m9dfV9SA6X0Np0Y1Gbb+JPGPrdwZmj9sp12LmrOXEpdCS45?=
 =?us-ascii?Q?6WgQ/MwwUg4+dvxEwtunEl/BgzDCW0XI3ZeSgDYP9Wbm5gi0jomggMLk5CMg?=
 =?us-ascii?Q?YvzJcDI+2mySCSRyGJ8yUbdzYeYt8jNYWDg96pSlriymNe2rq9FBtY07SGex?=
 =?us-ascii?Q?kJ4BHCg79jISrMfTY5VHhCubml4IfHf4d9rGrOz6WFf3dUOFgbLZD91UZi3Z?=
 =?us-ascii?Q?EelEZ0O8l2kXhRM/BqISIAK7q/o1rytz9iZ2lPiYMMrnYCByzV1HcWz37qBC?=
 =?us-ascii?Q?VfS6sRF/ns8yVTPpCp+pgKpzaOQ7NQ0CY90YYaesnQiCs0y2MMLevFGVgxlI?=
 =?us-ascii?Q?PzamYxsL0txrnUrGLGXsOkf5DH6uEYEFEK9DlS7c4IWBJOYN8oHMYiwMgfUS?=
 =?us-ascii?Q?8lLgnBy/P4Bi3LIxEo64tjS1+BARYiv92FWxwUAtVsd+XVcGqztbteZwz+qu?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 360c09b9-e693-4cf2-6a0c-08dd44926a6c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:36:19.9635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53ZXMtEDIb20FnzSlQCKSWk0TcayvGZunwrQGnrfXL0kXGAx7K/pAoNmS+znshfdAOPrBDA/B+i7r4ZiaXaHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
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

On Fri, Jan 31, 2025 at 02:31:35PM -0800, Lucas De Marchi wrote:
> When devm_add_action_or_reset() fails, it already calls the function
> passed as parameter and that function is already free'ing the irqs.
> Drop the goto and just return.
> 
> The caller, xe_device_probe(), should also do the same thing instead of
> wrongly doing `goto err` and calling the unrelated xe_display_fini()
> function.
> 
> Cc: Dani Liberman <dliberman@habana.ai>
> Cc: Ohad Sharabi <osharabi@habana.ai>
> Fixes: 14d25d8d684d ("drm/xe: change old msi irq api to a new one")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_irq.c    | 14 +-------------
>  2 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 589bbe21c32b4..2e874906d4f31 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -846,7 +846,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	err = xe_irq_install(xe);
>  	if (err)
> -		goto err;
> +		return err;
>  
>  	for_each_gt(gt, xe, id) {
>  		last_gt = id;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 32f5a67a917b5..08552ee3fb94b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -757,19 +757,7 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	xe_irq_postinstall(xe);
>  
> -	err = devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
> -	if (err)
> -		goto free_irq_handler;
> -
> -	return 0;
> -
> -free_irq_handler:
> -	if (xe_device_has_msix(xe))
> -		xe_irq_msix_free(xe);
> -	else
> -		xe_irq_msi_free(xe);
> -
> -	return err;
> +	return devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
>  }
>  
>  static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
> -- 
> 2.48.0
> 
