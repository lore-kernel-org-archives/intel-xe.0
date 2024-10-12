Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A48CD1A431
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 05:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFA510E077;
	Sat, 12 Oct 2024 05:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uef/c4mV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812410E077
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728709769; x=1760245769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f7TALJ3LXOsdBxl4WmANOU83yJttyOnDg7d7oOqNOpk=;
 b=Uef/c4mVeNi3HnceWpjsVKfI+axOXOlXR0FLKt0jdzSvw2ZiH1tJ+Yt/
 sFCVX6m+uS0Rw/k9RxoHWfTPcPThb3Ee4aSCKRX20w+zcY6wk+qhXPBXM
 Uhvbvkk3e+TDiAd766ZuoDFkuIDSfEH+B/bQuotGmkbBIUZ7Q1fA4ET/A
 FCl6EFfxr8gHZLFyg3KetgPNFXAYw46M5xeXHI7SGcoxOORBVOLRgOx88
 A4OamGec41RkLgIfReaFaVgmDUDdemZL0wnqOpzelZy+4/uLF2Ai7CBcS
 XON09FXpXZoIfaboCyag1OqqATKk5VLjnZX3r7UT6SsCsrOzW/RBKjVXE g==;
X-CSE-ConnectionGUID: LWwUFj7jRRmKfjVfJCefUw==
X-CSE-MsgGUID: AIkTw8+mQBaU94a2inZNOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32027917"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="32027917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 22:09:29 -0700
X-CSE-ConnectionGUID: H9+Z6zeoQ5WGAL2LMue+jw==
X-CSE-MsgGUID: MSQH04cnSOOhjhDf9g0RTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="81650946"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 22:09:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 22:09:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 22:09:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 22:09:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 22:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA64EhJ/iODqR/MzoEiKH8EaqG+LQnFiXEh6nsO6LT7FXvGkzhyIW6DywAXGEBJVTzoUgl6QD0hRuGbP7PoUtfgK6F5IINtl2No6HqRdmyYhsI4MaZPb4j7IA+fFCtPfiEu8G4vMCd+7Gr12hMpO3HYjtAckoICI59WijFvL4CGy2V7ONqFOuimqXmDS/XJvTisedMuwBws62mJXQ9CeaEF1UjDGw6cCoXQT89Nd2ElAmJ4nmjmsPyLxKGRalNGa8irpEzrV0CzThU9wWa+qZ40ChZj0OPeui7mckYRuXpxC4651SQstNGmwh9a79+q3b0uD+L9WvCMdfYua8FH0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sb+FO83ZfkOkvn/Y9XDRjWjp+/mbToKdUBax5ukbpS8=;
 b=vpxetvaLOsnZMf5ITytutM3J68Y+njgwvp2qO9Hqgrv6wHDzywbuJAAMpZ0Vu3MhrV/fHDFZhYeTPSNkrreUX+BgEYxK0onJFbZoObgou8ehF82GMOMCIAI7RCn3m6/ZK76xbcThX27GTq/o5QnsUfGEg+edYtInfDt09qF8h7NSC4o2Giy+zTcLj5b9DqkL1e2q9IKJWqCuQPBZkamdOVZeiGpQSZJIDFq13n2cQ8veIr9ukBQCvqTxUlooGMvsxnCB+A/Hx6vt+5bvhvwEH+vvDNWe3XWaZgFTl0U39ju4PPPq62elfw6X+BJkD3PGaTTZEXnp5QiivafO2jHrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7899.namprd11.prod.outlook.com (2603:10b6:930:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 05:09:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 05:09:25 +0000
Date: Sat, 12 Oct 2024 05:09:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>, Alex Zuo <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe: Log unreliable MMIO reads during forcewake
Message-ID: <ZwoEbQAQolLNLbeq@DUT025-TGLU.fm.intel.com>
References: <20241012033445.1090373-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241012033445.1090373-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: cee101a4-5dae-4c4f-fd88-08dcea7c0a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+43GCc8ZWaonMZOEO8e3iW57WZ4vkIHeCr2nlqPHIE+FmUap6fL1qaDg6SEd?=
 =?us-ascii?Q?58ce3gJwuyF3Bm1Kerk5eyXHHlCt2bb6H9qDLDVBGqSOYJ4sEIOtBZ+0N7M+?=
 =?us-ascii?Q?e/7EuW/jd0A6JsVIPb7EiUno23ln//2UevzZrLGs1SmzF0ZkWBMG42JOMOrV?=
 =?us-ascii?Q?VglC8ddy9aVP4SVfQCwt34/w2AKUF+i1N/4DV4R/Y1oduuibwGalmVx/o6W9?=
 =?us-ascii?Q?/Wlk38fxAX6lZz8oki6UHMWycpwDPpUiYe2XpQfpKcgqK41KUvu1jrQ+Nty+?=
 =?us-ascii?Q?xCsiNm+5ch9nCvbo4U0g+YfiprRSMZomBEuskuZsoGeK4BNlFFkwuQxFMc8K?=
 =?us-ascii?Q?dmhwYRDvXSTqrUccQJePlMLUrZlSu982MuWdtcZP/BHgN3R9EjOZp3Zu+nQR?=
 =?us-ascii?Q?o3jJYDIvvWTq6EzOeqsNkl7+4CLvInfX4ezpOdRcb567WCpus8ppMNzjzeYp?=
 =?us-ascii?Q?FsHPViA+pB1rtMCvRhd1u24EMyERnfKggrOobOxTdfzNXcLlaoPW6dlwVbB+?=
 =?us-ascii?Q?sAYG3n7XqCcYzIwTEiVhtpy9AUT+pUCErIuN3k6HJ7e+vB63FAutLITCfU6k?=
 =?us-ascii?Q?EblFZ7wAjvpSP5r91scTfwI9VJpxC+yLD20qRJ3bgCJGuoEUBOGepYPnfH67?=
 =?us-ascii?Q?+jPkEhjXxRsF8B9P/Sr4VP07PkOfx3in3S4Z/GBVbzbyK3MHs0ywTUWrj0MB?=
 =?us-ascii?Q?ISa/VWWOYkxWgqFr7k2ywN+lHxheoGMvQQNHmn3zBSBqVNQ5XvsZPPLp+Yu7?=
 =?us-ascii?Q?tcyZGg73f536B3RBpYmTmtPiYUx8GXmTwa98rT5m6eSXSctbAhx5nBEQJFR1?=
 =?us-ascii?Q?VPOwutTO2QVpVt/m/+Dc23at8D5goS+mPDnQxumaClStrRxsBFi694hUAqy/?=
 =?us-ascii?Q?3pNoNpx74+geWVPiwVoBMzH20PlOC/IRqlo65XuXDSeG4wgwe0jSODtMUz5t?=
 =?us-ascii?Q?wyCxN5FX0bQ9BdlNYUMbvM9V13hvTMK6ook6w3bp3HpF/tblELgL/P3kr2uN?=
 =?us-ascii?Q?pFMtrdg6eieSfH/HRnwN4odP8oUg8QNJioGZ8Jzx8WEdC1gIdKyi/AAPS742?=
 =?us-ascii?Q?w0dWYVtUFId6ZznVQskRAWSiblYmUScbD8uQ4VT9GTHQWUfrG38OF++4wwFL?=
 =?us-ascii?Q?K80uKp1s7DkH9F+zNvFH/V6nXRwkHGZD/YC6SmwE25XLDPZXN8fBSjDM5M/O?=
 =?us-ascii?Q?Az0+sYDX7yfOweF98IWic4rv75V32V780/+am7aZdraIaHM4DGNQsCFEWsVp?=
 =?us-ascii?Q?H2aDPlCZ8ZF87poLSpu/OUdgiYb2+Zm3Oe1teT8sOw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Q7wzXT/UabbuNPR3kBVUgfqfyo6OzUXTXiKBHN4BK+XSk011ib1qj4igHyi?=
 =?us-ascii?Q?Qve54fES9JITDs2r21lQvWKGuR3VwlrYuEUfieadGgKY/dNZrcbITDlIitkK?=
 =?us-ascii?Q?IGWXXDLUykp18dA1fPgSn7KsGC2UIiIl0/F7tqqHUT5bTFMQEIcLdwtthJZJ?=
 =?us-ascii?Q?fBSj1JOfGL9/Y6F7GVm8Mz/pHA0xqfakKnWfDg9dF+n/9DNyVVxNPAnDWwuT?=
 =?us-ascii?Q?oAWzhI2T5wHnekbI2LSqiWNwXxj0C0vQpP0tHJK4jreicFMmXFJ4Upg3jtzE?=
 =?us-ascii?Q?invWjNG6cwGV71BpQ9pFr93oGucyi7TLxygG6tdkGZH8G0P0g8fvZC1JZc+y?=
 =?us-ascii?Q?5La8yC+2y4YI+aokK0ADPBc7XMVMIavoVriS4msK9qggwRgVNi/TXzUZimhN?=
 =?us-ascii?Q?C2zUTRfz+Ojemi+E1ljWSg6GnB/fvzcxWex7HU3atPAY3VE+oGUHdygfiJfh?=
 =?us-ascii?Q?3QRTy/2cnjTdPNJ5hKpcmfh2bZInVTcEqNjh9B+d4Ib/7pzXC0pb+XsoztDV?=
 =?us-ascii?Q?tXHMghtGktvrDEufSoXfhVg004GDHk6i/XKOLfXrHrWTv3KVjdz+GDGZ0afE?=
 =?us-ascii?Q?vxwfQCxwLMKEGqFMZ3NTXlAPsF7jkaEpvP1v57LgEpn7WtVnXd2bRJbOHSUV?=
 =?us-ascii?Q?OTHEbYyrryPPwUPaXL0l14uPj7Dyan7pD+NnlC/hTE8af3Y6O0ph0UGWoo4c?=
 =?us-ascii?Q?fQNoWS/bIanYdI/Xo1obkb5XmZJzeJewHthib4Z32vKH7OAVfL0PNx60RKwh?=
 =?us-ascii?Q?KiRVkZO5E/D4ZKg8COy6n3USanw1q4XnDNYsPP+j68KwYMFU+pbE/7c4RxxS?=
 =?us-ascii?Q?UP1wxKRnzBDlOHkiLm2yZhiBU3kk/6xXgogIzwspzAv3QyPWvuMHq0YnHnnr?=
 =?us-ascii?Q?BOH4RIrEHtSVuS4dbwJ/HOCXpkRe+XynBMSl7zGd68YXucrn2su2B/b1tB4J?=
 =?us-ascii?Q?Fib6kEas36D6Td2XiCefQuqa54AMMmZ/UjJuwaLQLM+B/71amfcefpdycQik?=
 =?us-ascii?Q?M1I8q13slfxgr8CqrWsMg7mQ+Z0JqbPG9vwLBLY+31b9Iki+y5i78UTqmIw7?=
 =?us-ascii?Q?ofXAOXl8rU77rREJ9WRwsOTwlPyD3tbnGoKITXfthYjOwF/vhasRMCskPkRO?=
 =?us-ascii?Q?O1hWpjQMoa/AAWM2c+hSOkoitn1res/1UPlz8oEoyylcYC+u5gVM2SyxheH+?=
 =?us-ascii?Q?mIr535+54e/nhiYWy0X6nt07YkKReWdEfTWMQRbnCFVt4NZRoy2ewgVNtssk?=
 =?us-ascii?Q?f9t2umag/Ygv6KKII5p4YuRqYCbO8R/SZDv1VKctXLkmzaKosq1ubJx5VGU2?=
 =?us-ascii?Q?AlCiaHRD6LrDnXyOwunrf2dmRdPLBP01CH9P3NPSxg55OlQzVtoCeq6Sh/Fh?=
 =?us-ascii?Q?44zlwtGCbWpRwXkQ2XvFkQCTIYzO2kHEt44Z2+K8ld5x3KzP8WqXT2Hs2E63?=
 =?us-ascii?Q?1SHMBHqIk+dgWf6tzHHHmrB9OnaKiUdEI1N5cAWQipEbIPlMFNEWfjGeAFWy?=
 =?us-ascii?Q?KfR7G01UQTeyey+OAEq64mpRnHkyZTE/tI3BSeLcGHivD8QsQgzmgzM7piLF?=
 =?us-ascii?Q?nryIr3/0Tah697PapfB4ph074aXrish6UWqCeRtgjfnBcV/jwPxtGWmbpIYf?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cee101a4-5dae-4c4f-fd88-08dcea7c0a9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 05:09:25.5640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyorHU3uJQOI5DHvy1CMzSM/9LOTbXrZXm6PnEO4RU85AsKf4RYx3hxNzEo6Fjz24aDNcKcZmHbVCsnSkNAY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7899
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

On Sat, Oct 12, 2024 at 03:34:45AM +0000, Shuicheng Lin wrote:
> In some cases, when the driver attempts to read an MMIO register,
> the hardware may return 0xFFFFFFFF. The current force wake path
> code treats this as a valid response, as it only checks the BIT.
> However, 0xFFFFFFFF should be considered an invalid value, indicating
> a potential issue. To address this, we should add a log entry to
> highlight this condition.
> 
> Suggested-by: Alex Zuo <alex.zuo@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..46f36d05293a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -114,6 +114,10 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  	ret = xe_mmio_wait32(&gt->mmio, domain->reg_ack, domain->val, wake ? domain->val : 0,
>  			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
>  			     &value, true);
> +	if (value == ~0)
> +		xe_gt_notice(gt,
> +			     "Force wake domain %d: %s. MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
> +			     domain->id, str_wake_sleep(wake));

Set the ret value (-EIO) to kick the error to upper layers?

>  	if (ret)

Then...

if (ret)
	...
else if (value == ~0)
	...
	ret = -EIO;

Matt

>  		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
>  			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
> -- 
> 2.25.1
> 
