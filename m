Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C43EDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788710E8EE;
	Tue, 10 Sep 2024 18:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVSiDXe1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED97610E8EE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993753; x=1757529753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PAd+ffZ59y1GH2GbsmfOmc70ozKOtl+kCUovvCoiICY=;
 b=hVSiDXe1oOmvGo+0alsXSEg4tZsMnZLm4wWDPqVFbFC0pN3S0x7sBm6z
 YzefTiQYVTQqHyzQek5p/H25O/0c5sUbes6xFS+Gsa3mPNsNL5gRmizgV
 WqgjzlEDfs4jEuZXWJg1XjURFP5qpKLPlN4URjak54BxtwIjqqTrNkfuc
 sNmE7aXKQs0VEor/k8JP+dQu+6wKsFDK1M+tETiedaPVwib9oVzdezyi6
 1Y1GApqpoG0eqiBsiw6tCil9dgBP4hgcXIohOrJgUOrJALj+u9OmTkoPV
 KIVmj+AvaNelCezzbMoe7EQUpqz39hVPW4D6yWReoxjZm7RM5/sFy1K4d w==;
X-CSE-ConnectionGUID: ZnanOsUeSf+bmaZPq4H8iw==
X-CSE-MsgGUID: rh1VMMyHQQ+I0aVL/BTCyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35904810"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="35904810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:42:33 -0700
X-CSE-ConnectionGUID: ETTxL7vXSy6TK6UIfA/GCQ==
X-CSE-MsgGUID: YE10tBH/RvelUdelrYU59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71884499"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:42:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:42:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vir7sa6j19o5y+VU1I6O5vlKt5XnMEOWwm9UkZlF9U2j1wgkFwh9knF8Ezq0Z5iNxsrASVlU3V3/wuuud/urki9l3IdptU/AYDU4D6/XtbkgtZDV65ghxYwT/CpCFVtdW69joNd3mToifhG7rkT4oB7sGdy4JMOAfHuSFOjhvAjwZ8/2wyeTdLr+4e/2q8+s0SRsz18iqy14v/7L8Pc4e+qUAgHgNcch7FvALusdmgJTWqhSM7gymDZwBwtuYS5lDXln9aX4X3pQWqPAN3kcwXN9JRvbMonyWr8wTNDqh/rtO0Ddje87W6j8Ca0PhsMLLoOwPARdIb2PyqFJki40Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXl5h/euaNF7QZnaMMvzJGnQMyQmNfdxpB74tSuoRXo=;
 b=tpIzInHiE3H1xGbUzxXTkprvK6liozt6pNATn10yqwtoKp6d/Qt8zzl6YXxsvGrWr/aIZZtCdWB+W0xDRY0e/0YoEv4jK8IKVyYkH4Pa070PrGh1TSlE/w8z1Nae5gqWdwfbe2WzIYNqsfkINOpD6LovDl7MKVVsdoB08plnwJZUTvTXNCc+Of1T9voZpQ6AY1kjTsaQ/pWjF9EV96c8Y/pj6EPiKRpuIlek86VYMscuxyeNRlKdCqiwwpY2ua7NbmRcCK628JX0KBQVIlKk8bp76/Qp+/AWMR3LwfmnSzZjDK2eUJ8UEQwDpFD/00xFsfA6+lj7iyT/rFrFzoatIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:42:24 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:42:24 +0000
Date: Tue, 10 Sep 2024 14:42:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 20/43] drm/xe/uc: Convert register access to use xe_mmio
Message-ID: <ZuCTDe9cVkiUcvN0@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-65-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-65-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5c2c2a-e745-460f-d793-08dcd1c84fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5UO/kCgQgHNsZFl5nFLJihDhq0psGRsaBkztrpMQ1peN6Wp7dA2Z1bxNfRJk?=
 =?us-ascii?Q?OAf4wsKni6aN/f/O7Usg9Lfzga4Nmea91wDokN6L6dw2GSSGZGIQWT7LWU8S?=
 =?us-ascii?Q?ED4oxO7Z9xZQRv53Dxozs2Uh9t7Gm+GyQwwhdwfp/E493LzF0bQ0yLK0+KmY?=
 =?us-ascii?Q?1DY/HkFUXXyUbInEalks8zw4hdkF6k8GVBUxgk/myJ933z/WSg7L9ywtIsIm?=
 =?us-ascii?Q?hAcxT6nTTIxzAardwOQrrUNM+NY8mFa1Yu6EUtm33bD1qJv6NwjdBykso8pm?=
 =?us-ascii?Q?U8ErZ6tEm/E+ke1s2/s+jEOeDVyzkvE32Ga5qpSuOswMqQ556bRys8dBnQeS?=
 =?us-ascii?Q?hEbb2BvjDoODHwR/EsMOozUuvOwCMEqwrvGZBmOlD6najvxvWPupy7bX/PYm?=
 =?us-ascii?Q?5DabqWYWR9MvS90T7r87LRucgy1BHyWWPOndaK0s/ZfUEvwj2kdpllm6HG1y?=
 =?us-ascii?Q?wBSWvqurfmdpTmRJNXf45wxUqvKWiOy3gKK4bgyA9HU/LmzfQi9iW4fNjITk?=
 =?us-ascii?Q?5giQFNABOLKjDSpLT2VxJSsQT8WWou3RCcl8zH5nSm5kiUeTeMexQtiYIOpj?=
 =?us-ascii?Q?ks7TSl4AmGMHd+qPqPD1xj0EG1kSEJ5daWdaIuBq9cLhBE/8Incql0SRENLZ?=
 =?us-ascii?Q?FIpJKwpSVTTCArTj2DLspSBfop7DR0kX+pUk3niR6/bTL9qh4rtS9MVPVI9Y?=
 =?us-ascii?Q?9puz06t3seb1ySmkk5S3b5gYm9FjpnI9JIS1657hxTTGzxwhA5FVbPylcSNs?=
 =?us-ascii?Q?C0llPFOCeGsiw6rF17Bj30lniwGQ/iofvCtulrNX+T1YkXMtx2oyMtRN4F7g?=
 =?us-ascii?Q?yy7gCduSjyOa9QIWIGRir/05yRJCnHs+JI5WJxV00A7r2lqXMN1uigGQ1wdU?=
 =?us-ascii?Q?sh57I4wNUDDLN30qHuzSLqWInSQSRQAcLE0AhFtV2n9EK4z0dogubq5fQoOZ?=
 =?us-ascii?Q?OlegzVYAyu4d0GIDjlS7Vfo7ZDYESdnpZQp5g0xBgDHaRNC+w3NtGnAvytTi?=
 =?us-ascii?Q?bzyITSmAEN+w8JYEi1n2+su+GebwZcLJtdOoP9Hd1mwZHv8KK0Zu60+vOTxn?=
 =?us-ascii?Q?deaXO/tcJrxpv4lFPl++DwFipd8Ecp/lLmVP51RM8h+XmR5lg12vIEmEp75R?=
 =?us-ascii?Q?KpV/F8Ho519GYQDfergZ7fjnTtzS375bybptZ2bxgjCOLvbyh/Gne19gxDFZ?=
 =?us-ascii?Q?PKPsUlpPAmRYiJDl4cBR5oqphEKvV2mnuH1GR6nnF1biyZ8reTReftgjNcz4?=
 =?us-ascii?Q?mcLfkbV/aAtQjma5EBrw7zaiLd17u4hMvjw+gzSIIIsgYE+HcC650PPH8WJe?=
 =?us-ascii?Q?Iho/23KSgUs/WRlwAUGdSnM1WOCjMJ9u4pVFS1HmbEWIDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6wU/drN20QxIhqy1NG84jh9Xz8Nec7VpqGO8S3Ro/yItXJ6VWMm1HSKrHmC?=
 =?us-ascii?Q?8sQC4IB9vJBRIwcs31EosXS+26WA7vLaWlRGiVSLUh1OWDS22Uk0JQx4TGWX?=
 =?us-ascii?Q?gV/zGSAhM7LN4s9e3TRLorcYbLSKHMtICuluTDxrLTC9mV0lrg3M+r6RwiHo?=
 =?us-ascii?Q?hKjHA4bX1dQrMaVRW31YXkmlu4gPLqjKQhUuyn46aYKZXvFMgYgu0grkGmhJ?=
 =?us-ascii?Q?CCDEeQAYyrFuZusARdG7v6OSYKh4O1R5GBbtBcyTQHlKd93S4JEljWoxM5ez?=
 =?us-ascii?Q?aBvkrRi/BBnir/+JTtkuyixQ2VN+s+pSiNnSEpu/YDrXnbVymFldX3cpAHNd?=
 =?us-ascii?Q?rUrPLwDfBBulef0qw6FP9FDMie0qUlurRLozGQB72y2kXH0i26Siv/1VjO23?=
 =?us-ascii?Q?0edUswlCuPwVYvPa0PB2iQeZpk4D36YDogRKt/GEPlWEYwDOb7IvrlAsmrz7?=
 =?us-ascii?Q?uk033VCe0/0KgN/LtEHTTJXavQzUMw1aKzx4vpC4j0GdUC6iHNCf2CGgbwV9?=
 =?us-ascii?Q?Knt49uvB66vG11JE9tTKIHNf0sop33DFrslX38owUMwLbCrSNOxYSe3OXmVP?=
 =?us-ascii?Q?daaSf4Ws07v10KCLn/h2jfZ5RUaAvSMzAbvCQc9zDjsRRIjMHL+UIOXXuFtp?=
 =?us-ascii?Q?RjiLAY3AQuLHaNQQq/q1d3ZAkF3c07TD6CAD+lmkggkkSCDvQnnBzX+Fa7W6?=
 =?us-ascii?Q?2MouXmcCfg+EylsrBnLtfeg5wi4FI/6s+/8MOCxh1Xbp5wT1Cy94XLDEqggh?=
 =?us-ascii?Q?pQ8gKoYrvq2tiRtsKSt+duGbbm1yY0nMoLLekAkN0ncoQ1nbMw+uSORoQJ9w?=
 =?us-ascii?Q?PYrAfqELdf4TonZ1kGolWbPcYNA/ZSl/Uq5n2Aa/uKzL8v/Z4u5imRahDMzz?=
 =?us-ascii?Q?WRpYS1TiODhej6RA1h2bbl8sd4S59MwZNm0ujJXyaUiyTc5rf/zTGRCh1N32?=
 =?us-ascii?Q?GWf+HWKQuL3OFv6MYjbzjIZOcxpUaO3e7S0PBqfDk0EQ8jfjX3uCUO8kxdTD?=
 =?us-ascii?Q?O1nkuV78fwPwl4zCLBC8LLTugcIhDluGiRULdQbC1jzpy/xhUQU79QpF8DVE?=
 =?us-ascii?Q?S/xVgAo9SOz8ToExFtjrJ0FKCfc2lTt4N5z/UPfagx4Iuu07YbwAd1cVfZ0F?=
 =?us-ascii?Q?zlCjxT1Z5vGwAy66DcB2i7OQ9YLaB9u87OD/lP3+vnzQNUjnO/cssblSP+uP?=
 =?us-ascii?Q?Xun9nGoJ+CUxzu6o4wQatKLGSzo+aa4786I2tcfUEgPEERdaasyb/aM1TbLU?=
 =?us-ascii?Q?Bk1X0FfwjuDbs29IQn/b0KD0x48ya06eFu1hDveKIDTbInMOliQSu2kBgkJE?=
 =?us-ascii?Q?i5+suKiaW4C8fAE+E7u3jQjE5NgWEjtKw4Rp4bb2CXTCnLTWvUuKtx72rkIV?=
 =?us-ascii?Q?y2NJXVng/4ennX1/86vfDKdKJX4IfENrKjp1+OgARhHPx6sXztDTBE3Px/YF?=
 =?us-ascii?Q?u/ArOUrb+ImzgXyc6Fa8rPuXN644RAA3EWuXPzu1mogs5bek5bxMjuhIi5pi?=
 =?us-ascii?Q?YEF2ry3n+OPaWlDjFfH425IlgHbWb3gEs/A3cqhRAqBF+WM9gD7AYbHxZA4W?=
 =?us-ascii?Q?tRt8VcbDwLJITS1jW6IDLmQZF5jHVJmeXbWuNRuUxDIHI6/zbxrxgPR0Z6Pf?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5c2c2a-e745-460f-d793-08dcd1c84fb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:42:24.3499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqISjhzBXGHm1GyXo1qXn3Nr+dwcCYRv5BgQbR5KjG4Ypi6lkAN3SambVUvlV0GonHstKRrBYqXrYqRnWzQssQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Fri, Sep 06, 2024 at 05:08:09PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 821b46c9b4ee..eab9456e051f 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -807,6 +807,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  {
>  	struct xe_device *xe = uc_fw_to_xe(uc_fw);
>  	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u64 src_offset;
>  	u32 dma_ctrl;
>  	int ret;
> @@ -815,34 +816,34 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>  
>  	/* Set the source address for the uCode */
>  	src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
> -	xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
> -	xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
> +	xe_mmio_write32(mmio, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
> +	xe_mmio_write32(mmio, DMA_ADDR_0_HIGH,
>  			upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
>  
>  	/* Set the DMA destination */
> -	xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
> -	xe_mmio_write32(gt, DMA_ADDR_1_HIGH, DMA_ADDRESS_SPACE_WOPCM);
> +	xe_mmio_write32(mmio, DMA_ADDR_1_LOW, offset);
> +	xe_mmio_write32(mmio, DMA_ADDR_1_HIGH, DMA_ADDRESS_SPACE_WOPCM);
>  
>  	/*
>  	 * Set the transfer size. The header plus uCode will be copied to WOPCM
>  	 * via DMA, excluding any other components
>  	 */
> -	xe_mmio_write32(gt, DMA_COPY_SIZE,
> +	xe_mmio_write32(mmio, DMA_COPY_SIZE,
>  			sizeof(struct uc_css_header) + uc_fw->ucode_size);
>  
>  	/* Start the DMA */
> -	xe_mmio_write32(gt, DMA_CTRL,
> +	xe_mmio_write32(mmio, DMA_CTRL,
>  			_MASKED_BIT_ENABLE(dma_flags | START_DMA));
>  
>  	/* Wait for DMA to finish */
> -	ret = xe_mmio_wait32(gt, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
> +	ret = xe_mmio_wait32(mmio, DMA_CTRL, START_DMA, 0, 100000, &dma_ctrl,
>  			     false);
>  	if (ret)
>  		drm_err(&xe->drm, "DMA for %s fw failed, DMA_CTRL=%u\n",
>  			xe_uc_fw_type_repr(uc_fw->type), dma_ctrl);
>  
>  	/* Disable the bits once DMA is over */
> -	xe_mmio_write32(gt, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
> +	xe_mmio_write32(mmio, DMA_CTRL, _MASKED_BIT_DISABLE(dma_flags));
>  
>  	return ret;
>  }
> -- 
> 2.45.2
> 
