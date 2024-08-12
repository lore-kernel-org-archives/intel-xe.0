Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9272C531DC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 17:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9463B10E145;
	Mon, 12 Aug 2024 17:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPyhUxCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EE510E145
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723482708; x=1755018708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mEgeMjlZkZL8Du3aVX7wZs3vVLYiW6LP5y2xanGvRRk=;
 b=CPyhUxCzpt02becAIDNv/9u2kRN5AzydMYzH6Y45VNNdkAjcwUR8WK6v
 p+xZwZEZuDM9XSaqs4sy3GsXkSxnxSYRsn8nIt9/pCoTfcbnw60Klx5bl
 9tM+a19gZU0zWmIEYwC/YUOoMye25WG9QtimUa4YoBHovznkDS3eLEKup
 Q31JeDmCI507b5z7w/rLFRvZYjYssOBbyyf4S7SJ8vNO00Lf8dC+CJciY
 YuZ/YVBmEg+mv7KmY6X1CHuPx2HeSELv+/dt3I2EnIZldLQjOxWH8Vi+P
 GZSZyIDavGR7dlQu9O3RowULVNa03GFkimRiWGHYmagGFc9J+gTCwkObH w==;
X-CSE-ConnectionGUID: KFiOA/kjSjG415zH2FsVjg==
X-CSE-MsgGUID: cBDnqk36TzmUw6w8PhOfwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21413990"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21413990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 10:11:47 -0700
X-CSE-ConnectionGUID: Su77ArdAS5+RyAMLKbH6lQ==
X-CSE-MsgGUID: uHg1U8KWSF+rkK1TgZBSug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="95843740"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 10:11:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 10:11:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 10:11:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 10:11:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU8c7BZl+nVLInIuuLhbAeErl64HGhYFBku5y+lwUDR75GuC97tfqKE4P4TUvuoHg9x8tCfXMlF7aaLBfXBZP5ZF60nLQdyOQojJumN1HmXT3oW8Kcvj6NAe48tSnI2LeHO9YzWsvb4GuNCP4m3BbY7VwvDhXcPvbfjL23gPd3RtExXiNkFtOZNc5deaHDdkgsKZc7NGmU+i58XYCMH59+Jv6e18r/mlSkouKmcUqNKz07UAqAY4NdrEH/9pWJxZ/s01uGMv8QiSbHx82AhnbrnweEhKhv1J9FxWECbUu+sbAfBVTnBxa0VDOwLDizLGnoBhsWDdfbYPJR0ibvQUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yl1avDeu8yCFlv/qUGEzpiczbqHFHvKIGYWnavFP5T0=;
 b=YHWiL+msaDzAJchB50ic767Dc6IfZZeoAfRF2rCtb6hmQbjbFOwIsQ3rvxpJGc1F+TBFilOh3DpOR1WYSaNgkYkn3DLxofaHXoyZhOtPdrBUUi2qPN6H5uoWjCiEGyqTboTmmRxTz00ElyyNYUG0LLZ2tZwc5SlangOnvlDXSCVBe80hYnGXUUtwNYGN0GCBcnSbqAh7cyO2BUY7SdP4mhojn8+JjvVa3BjwSZKsBIN+9W59rbjVVWMzvuJebAE4FgmlvRVZ4jUVT6ToOBuL4/ktp6n5HC91/15tMIAlm71jhdSOUx3GhZ/b29AcjEz3pdMxMPAalcA+VijGoJRjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 17:11:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 17:11:44 +0000
Date: Mon, 12 Aug 2024 10:11:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V2] drm/xe/xe2hpg: Add Wa_14021821874
Message-ID: <20240812171140.GF5774@mdroper-desk1.amr.corp.intel.com>
References: <20240812134117.813670-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240812134117.813670-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 157f3f41-ad49-4383-cc2b-08dcbaf1d71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B8ePs6FVm50ixCaa4J5vyoyw5ENexXwKIGORz24t4X9/i+EKJvdY1zOalakB?=
 =?us-ascii?Q?RGt5mLlb9OSnCO6t15LaJJZbE+svigSVHtJpJRYafOdrFEUo5qTGVCXhCK1t?=
 =?us-ascii?Q?yFzg9cLgrX8YpBl389NqQVOpI4uOdoUq5Ixz/4uFck8OmTn1GaycOZW4v5JW?=
 =?us-ascii?Q?Y/5jx6LLp3c91OC6KHLWZdk8po9VxZZQLpLB3V7S46y4Lb9ekJzXjhC7BvCa?=
 =?us-ascii?Q?CKDNj/w8ep+6E5EZaoCuCXV72LWPWOx3vyoHjZZfPH/PzQrF1tzoPeMLiRpB?=
 =?us-ascii?Q?DC9z3p/LYPzpuiBcLawscYkkn1AY4iYjgjf8hCoPWfE6RcVHq5XTTvg8MSS4?=
 =?us-ascii?Q?hPZadl56f2hqYYmD6hDhllqTOb9CNgodbPdQgFUhxHezatgvGoDfYqVoNEAP?=
 =?us-ascii?Q?WhkJybwM9DlQuewPFsPoH6Oo2uEraRPCd35sLUnHeHxuIPLKDOvV6oR0eDcT?=
 =?us-ascii?Q?uR0DaJEbw/CR22oXxYZ35itjzRzSv7Ml2wvP4F01lShxxyU5O9RM3av53s/v?=
 =?us-ascii?Q?maKTrZuVl2eLvtVeIlQBf1N6kllbDepVUrbw1w2Up/3bG9t+MMqERzGioufb?=
 =?us-ascii?Q?MCA/5drubfRgE2Bt/d+KKFOqKuYiLkou40XopfEVUr5N447Hsgu7kn2LNza8?=
 =?us-ascii?Q?Hmwpmd5zuERc+JGe0UTvMP3N3dDdtwyfCY8qzuzGca07U10eVOIFcJu05OnO?=
 =?us-ascii?Q?PkHdArfqFjfnBVF0dQxTlTQ4mJBTHQXL+gCx5hBYsPkFBYH4eW6F4HKQTkQZ?=
 =?us-ascii?Q?jyG3DuruzG5CzXaKbg1MPEygTR+Ji0vc9UoSBSMGX8yEvkK/Ivv0Qrg0pcZU?=
 =?us-ascii?Q?6uKnRKCSUs9JIQ4vVYL7AiOBnwpw2wmyAljNnQyqjMFrig/N5t7Kc/B8QHOr?=
 =?us-ascii?Q?RTF/1yGLdbN1+dKPgH+ghTse264AKaebd3fgPNfyEFxAITYDx1D5GS2bRf+C?=
 =?us-ascii?Q?Rh+MUyKcwqhUfUEV7FkkBPbzp/jAPKLr4Mxnl1VyDbxKTY1SHoU9OnQTX+I7?=
 =?us-ascii?Q?H8jeWjsqTrg6kTvhWKsBP+tqYbuOLQFyv4BobJVTXP+hjVP9oF0en9lV+qcf?=
 =?us-ascii?Q?KztRl04PRf+h1B36QZY6owPoMC1V1mP5nhnj/THBY11Ujb1OWBJwHDZxOJ0+?=
 =?us-ascii?Q?2X6nsG3kfU+83qtdp9wyT89Qsivsm1SCbUjjkzWrPLE6O3DLZhR6AhcIt0Yn?=
 =?us-ascii?Q?lfUIDC+NnfdeU+zQxvn0VrzH220Vq8Ttk1+4diJunGdp8wDlFu770tgtJW6+?=
 =?us-ascii?Q?bAJKlL397mew/FZDEoH/fjGBE+x/LCWHxWiAJexaDjs8emE7bozJQKah9D8w?=
 =?us-ascii?Q?CVg6OQD9Cgl0BjAYgL9u+tEQyKXZKqc7l2DB+2ZIKa4fmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zka6t4R0uAXC3lU93TNBcQbQ5EuIM/HzuiN9CJ89fZeSaVab1xiXsratPJfM?=
 =?us-ascii?Q?7mjNIw409HYc35AsURHYYT2EADnF7DvP+AlDMEF9xJoUwhgA9U4vHyn/VNvp?=
 =?us-ascii?Q?S95AoXTkNDSNvhaWUM4lLp6r7LdittYFsmNGJwD/rnFQOyQTq25INdhMIzp2?=
 =?us-ascii?Q?MWLCfnmOJSo96JlpBKJHSDOJitBoolk8913X2+7TWMOnm1u8XXkuvghJi9P9?=
 =?us-ascii?Q?Rv3Oesxo7nEHjzh6J/n+eHPZj6c9pZHL7+OCBhmc5+/1Nepy1FETmYL0OTpp?=
 =?us-ascii?Q?WgqA+wkTtJPUaxBlpsSeHgmRywk9Gft+XmLr+fBChnufJtXfS9JU2ipS1JeR?=
 =?us-ascii?Q?09EANRoxo3Q4wIE7WEjruXI+fMemNtt1cOtw0FBEIcZccoUX68D4nTJG+PaA?=
 =?us-ascii?Q?xvWeTc0QGS7Sn02XVAzVvu4vQornbaXU/ZArmUwmGomb0nJKwdtqA2Df5F0l?=
 =?us-ascii?Q?Smmy0A9M3aW9DOqlGTxgxb0Z/dsPvPpPr6PH3xho15f3fs49zy8jime+LlQO?=
 =?us-ascii?Q?oW1C5wtSvK1/95bazgYTVhioZVzmkPtt0Vlma7sSzsua4VFLVA4iCUCKHlyb?=
 =?us-ascii?Q?Ql0flN/Qag2boN6dm/9cMpsRUure0zl6YRif1UkT7SBtrF+p7dBL5jHygBnP?=
 =?us-ascii?Q?6UbCr4FBSWPn5CeJblSjmeYkxLzgw4s9V3Nr8bcVGgob3GSfB/6VSOY5zR7t?=
 =?us-ascii?Q?8JlBg04CevGObF+FGF8C9YrVHYug5DWHTIYcKkSHdaETwMEG0aqOa07zY3ex?=
 =?us-ascii?Q?bXPvWrczQT4mOppZrgQfUyNTp2UKlRei/YgLqGfSkaTcC2IjVntJCGjvsS0o?=
 =?us-ascii?Q?XobUdneXKqOuIBZRKcwOB7/svGi3XJQ6Msdp1EqYOM5v7rtsVYBl8bmli1py?=
 =?us-ascii?Q?N5je9tenRjYvp+g/Jw7KPdrLydGPfuKjStDD4KhOmTsnEglADLWDt+hRVTU+?=
 =?us-ascii?Q?BosmCnTAGdZPqASNwyhsvWKWOkqRVmgjby4D89bsL2ACtE81+Xu4pC8KTCwR?=
 =?us-ascii?Q?GDhDaJMbIdBcHnhGuQNLvy1bUEZFxbVQcU1IgxIsXpAZZkG2Yhe589ErEvBG?=
 =?us-ascii?Q?Hed0VSRASejAWu5ZdiffGPXLRXkiaJt+4Hm1FzhGJI07lC/EX22tNNs5lzU8?=
 =?us-ascii?Q?H1njyvhPCT6bqe+YNE71T3UzjJBh/9nEhVmSqzlx0sru7zRoX5SHuISouZVV?=
 =?us-ascii?Q?4bGnhSo/uExuw1AdCnLwnpgAPXkceHxBnHGcU6e2mnc9R6/qzPm4IVE/nryK?=
 =?us-ascii?Q?xNiEp8vXQ1tirK/KMLVf387IyyzdbcZ0QX+GfdpZ9C83JlY3WXuf2AEl01Zz?=
 =?us-ascii?Q?QGceByyK1pD3hj6QFFoz2l1sj39LcevHr2ibn+g//b8+xLzhnmBT9zKVuvmo?=
 =?us-ascii?Q?x9FvYYr8xrU67VLe923GpVUegsaFLi0JUB0p/4WN/9WYba+sermtWX2SY49y?=
 =?us-ascii?Q?P7Tt0YugDFQOF/UOjSYpIQYfR/J6ZI1b1u3nEQMYtw8SeKipaQv6i8RRBuof?=
 =?us-ascii?Q?dvb1vUvtjdc/2rLPt2NA2RVQQz0b/WLEzHxTZKxuIjhvA4/aTw0RkCwOFa6/?=
 =?us-ascii?Q?fR9LMG7wZszAaNH9FGSLeKHB6mIZtVnxPCl/eAkG5h3dtsZ/0JWQwChyb0jT?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 157f3f41-ad49-4383-cc2b-08dcbaf1d71f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 17:11:43.9832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qzIrCSHfMsHLUTJSE6moM0AooLMNB79CipR5qenz6Wn35aDMWf3s1LKOAJf2UneiUxAbY9eiGGXReXha3Yh7gnxuYn3PshMuMEq3sVbNa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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

On Mon, Aug 12, 2024 at 07:11:17PM +0530, Tejas Upadhyay wrote:
> Wa_14021821874 applies to xe2_hpg
> 
> V2(Himal):
>   - Use space after define
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2c8c4d4218db..5f33dee35f8a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -451,6 +451,7 @@
>  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
>  
>  #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> +#define   STK_ID_RESTRICT			REG_BIT(12)
>  #define   SLM_WMTP_RESTORE			REG_BIT(11)
>  
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 564e32e44e3b..28b7f95b6c2f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -542,6 +542,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
> +	{ XE_RTP_NAME("14021821874"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> +	},
>  
>  	/* Xe2_LPM */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
