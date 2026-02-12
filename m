Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D3EDF04A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 06:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B9A10E6D9;
	Thu, 12 Feb 2026 06:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot2+5gUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396F10E6D9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 06:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770877139; x=1802413139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eHYr5pPX/JqV/oOHmHIDqqOzvjFezqyHf8+X+Nw3OMM=;
 b=Ot2+5gUNw26hW4s1xRYFKYh4Vn/HKO/JHw5+XrTUUdW6s22/GrsQB94h
 FMQTYstQvHBFmRxn4HGNPPOBTpOfourdhke48Ca1nMuGfpdYNiAqUped5
 vIOC5h2O2Dac/CalAj0E0qRLvg3JfIqtN7+fxXrrBdqwx9LL7i1S4lNs5
 mLSkr0Rdgcc4TT2cygir/vGpTz2rGIXAbTorVGBJXqJGTnOKXD+ZqfURu
 aSMqxr6DJpPTMr67kxXifOzhBzWDO9JlkFGsEW5xlwkEwrp5serUSEXjY
 XEilUVjXCyeT2PPy2auR1+F2DljVNDejBePyklaU9u/0atnppGkC/2zps g==;
X-CSE-ConnectionGUID: YRwfZKK9QA6+N/Lq6PFs6Q==
X-CSE-MsgGUID: ovwCAvDnTDe9C0NodWlzCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75667067"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75667067"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:18:59 -0800
X-CSE-ConnectionGUID: /BlmKXFCTqK67dqIM95a/A==
X-CSE-MsgGUID: n7bXCTqxQZSQ1HT2BfTBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212327677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 22:18:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 22:18:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 22:18:58 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 22:18:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFW/vztkeihNtDTLKW9H8KMKmP4RacMY3LDuCQETXRHIzcpCmOhZ5OTAc2XRFzVlS/IDXbQTfGSIQXL0ptaUiP34gXbfov+Y+I0Uvs54hM0kLip6Cbu6xjvR6AA6KAYOq7GP/MZGxXuK1wuGIQB0beTlufqJZOBLkLLJ9dx5IILnh7KkooFYKVHU3t+esZY9+ZjNpKuSIC9LCRiFL8XwJwxWLH4UM2YhyToKXJXrOMb+ZWFPzbBKPVJvG8hktvNNLrHEMTkpmp3dxTlVhCZjxULVVP9n2VLS8Awvnz7Wbtl5wkv4zjOxxeiYeeemdQGodUMuDupmUTzOJH0zt+imWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIEPQdxnW1jMTvjDz5p9T3F+IUq0tv5fT71U3keghBw=;
 b=kSIs6Yr8a5pp2fRF0mIPMclW+7rL0S9m7P9S/hTI8z/WlWeEcnjo+wGUzMhE5HqwkIGf6bVvHXIQ6My6zSTu0QT+NIzSfHEptmnbU/rmXEAPcDqmiCQ8TeUm+Pp4Kva3T3+GQDvvRE/cxLBCxQz9j8piPTWmcwtn8omk/j93xSTD0Uy6ZAnALuPxTLR3v9HWaLkGiBQ/8wC1w+dsitijWfAdYSBYpwRYkIBhdzXagKeUZ6doxdDHVOE6xl88dl2UOHkYRWMgH9wjixETKze2OtMurnspkpMDgGDAceRA4jlGUgvarAV1Ay7HPTUOxQQk43oQrFCbibza72vn5CxQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:18:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 06:18:56 +0000
Date: Wed, 11 Feb 2026 22:18:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v2] drm/xe/bo: Redirect faults to dummy page for wedged
 device
Message-ID: <aY1wzdGSnjp0RJvJ@lstrano-desk.jf.intel.com>
References: <20260212055622.2054991-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212055622.2054991-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:303:8f::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b6378d-27a1-46fa-cdd0-08de69fe99f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5rsPiKrs28crXaWdJ6YNaiqZIgHsRDmGtjDqPJoMvrvF9pt5ScKKv1syztHE?=
 =?us-ascii?Q?HSrgoraGy61n1RuZ6FqIC706wEBMinfNiC8mdNa80G8ZLAJA8D6jVGisPIPI?=
 =?us-ascii?Q?SRQxLfVi5lR0um+omqRZt3xXwCRBttqWQqbqB2tPfGPX64z92jVD7qPJPEdd?=
 =?us-ascii?Q?VGOJn/keecx3RPXO1yArQn8iT/BVUlP6g6ophpakhyDC2dOEGiw7+yf+LGDm?=
 =?us-ascii?Q?3w3uYed5ucOAiUIdz1DwdOMYRCWpn+Z8lTjnb3zlZZEbruLuLHBszN86TSUY?=
 =?us-ascii?Q?s1VAcooML5jRmsvyMc0Kq2fil1C6vPEldupR2/LnmSYDVEdYna4idx/sbFH8?=
 =?us-ascii?Q?1Q+9pem+mZXDGG67KJlXZMqX72YCmuBPdUyIn6hghQTdnv7ZKk7moUejbNpr?=
 =?us-ascii?Q?zM4tiT8vSsfJ+t4wg01+R3LSVVWEIjYs+BxpYIVEV+lq96jXZwh2hpzA1Rlo?=
 =?us-ascii?Q?/5L/rsMijE3WTQtWGriiYUM5MoMi+4602FnZTFlxzB7InS+ep4gu25gqpdaC?=
 =?us-ascii?Q?KLckiCyXH0IHLbtbWfBKaukRkDsEbOYeJ/TEIxydkEIBgxRg5KBGIZLAjb9V?=
 =?us-ascii?Q?SPq3YWjPtNqXLuYvLt8jPnVGKuVVC3DHmRuNp91xt3UcaoH46s7j3w2a/MAT?=
 =?us-ascii?Q?lFAooamfEN9bF4Za/euKW2HjjNq2ODG8h47Umj3uD5fI3eT5OR6gvmDlqTRz?=
 =?us-ascii?Q?Pt0TlJHAN2X+FpbCGKUxwgPZ0kqz6ux1bBvxkue3X1IoDLfCTrSrhfdtvCSg?=
 =?us-ascii?Q?HAKgyFwZVcpdTx8Bu4RsGxCDvzxWaQPFh8vM4Ow5ULqLrRUqfydYLoRFNn/l?=
 =?us-ascii?Q?XdrMzSb4uplzGy05/NoeS86jCuM4RQ2L6JFnfpICqmgt/9UEAWlourLKqDGo?=
 =?us-ascii?Q?FEBBNja7eA08yaGN3tKthZDVGZC3MgGkl5iQy4meNbdEw06FpnhtGU5G2y7g?=
 =?us-ascii?Q?RAflLbM3U6A5stUYPSSm2oWAQ5bJwd5NDVfllMdPDl8JVON1qluBwHumgP/w?=
 =?us-ascii?Q?tXMffSyZjjgfAai+4cVcGRXmnQ9MeiXbaEd9yp6MKt37vaH41LD5nBYDUFKQ?=
 =?us-ascii?Q?XI6imvBQklkQ2bg+55fzMa+DMHfU/jnQ+MJbvzpvIy6TBO3xoi0J6btpohL4?=
 =?us-ascii?Q?O4gdoH3/NVunEWPRL27R59y5yObibwkYNPx1MXiTdkAOIuaR2vllR2ynBJ6A?=
 =?us-ascii?Q?2R8q6npxiFTyDDEjTudDfMSZQENk/as5BixSHZWSX9/0pJK8v4AXtGAGNsXN?=
 =?us-ascii?Q?ksS49n785pKW/PmacopgOsqOtyJOTJv7Y6RPpm2Kti87H/8eI8MngL+NjSuP?=
 =?us-ascii?Q?KGtA0Y5CdqgHMBLd2iKdNuu5BM30R/ytylQZ99TJ2h65zIQU+TwcFfjSpZYG?=
 =?us-ascii?Q?WbL2BQMYkIpi/wv/TdBm137bW0VsSUh6YV8TpTirl/Cwwd+jlztu8Y4DmeSI?=
 =?us-ascii?Q?NmeUf2cfCeNQuU/aOrgWrsKisokSOwrVgvSK+oy7XR4ap/GOzhpcD3KxQqdo?=
 =?us-ascii?Q?UISYcqwZCUWbrruxCbcVvnGrbeDCPaevi9pAl/35D8q4bGRiIueR0XV5K1sO?=
 =?us-ascii?Q?IGGJNNGUyQY9OKFRu3s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lsn7Clo7kSPwOo39OJt16dJ9TllTL4qfzmW79pUZ/aYMbzjKETtWCvyakQHY?=
 =?us-ascii?Q?94ANAwa12aqdKX2LzBwC4dIvbihxUMAj3oJaIGvJIeD48ZsETRByfC1Q1PWt?=
 =?us-ascii?Q?RAhbnY+aPydtbktX8c39E8/J5xpfcU1R+qEyqNbzIOXCBFU9oDpM3l2uxXey?=
 =?us-ascii?Q?qLQLIf6/IZSsExedOgSYbol1vprAdQQdfeHZ4TDiryzSNNh8JxkoXyfARpzR?=
 =?us-ascii?Q?0FfdA1PXQ6kNxXnIlG/3vwbbzlu+XNMJJDO1MXhbWjGBe/v46ZN7LOlozbf9?=
 =?us-ascii?Q?yCuEigHBLNBu/I/SaxT34xJmCLkxSvJtA22IoDTyl0K8cPFbgcucB19D7pBy?=
 =?us-ascii?Q?G6mxI30hacoMenaLWgvQr54EIvputGboFqMf2itXTiYR8OUdcOLEWY86i195?=
 =?us-ascii?Q?DtkER3IZlXqkvz4R1K7ekyy6TFZaLDaX+Fg49OYXtLe6YN7AOU4fMrnYc+rX?=
 =?us-ascii?Q?LiW0Dv8boN1z3saQN/CqFWzXc5pid6MBnBC17FPij+x1MR0cg761mXKzE4J0?=
 =?us-ascii?Q?hokRBTr8bav8p3WlYT97YxOH3VFquNX7OBN9dI2Gvlc9yd6XyRkfBZS4Hwt8?=
 =?us-ascii?Q?6sTYid9IU801GBDMiMmhv0vXzLdXvLrarublESGthHvqvoofYHqA5EauUjjs?=
 =?us-ascii?Q?shuEO3Bk38424eTzZc4ehwOX1Tz4/raXbW1Lh15J1kt1Qae6ziFmKSmkz1a/?=
 =?us-ascii?Q?ttJCjCpphmb8bNelAVQErRwpDQ7LIdy6daVYDG5UYezcKHpDbyg7cKZ46vtO?=
 =?us-ascii?Q?mT+wkvC/CIlhx7cjiZu2d+4fXA39Ils59XjC9vRf/rdBRcy1gxp3b5FjGiHn?=
 =?us-ascii?Q?kW9xIiy+/DYRqOmjfy0qYVrFlBfJjlzHUJQMpsfyfZjeoipjSu9zDMbsvTZQ?=
 =?us-ascii?Q?a1RIJhgW99Fk/ORO6sDRGed39I3jOJL6kZiz7muHDti1E4dbWVNNzPzqmdLD?=
 =?us-ascii?Q?kFb+DNkiAsW7DzLmXpJx/PXh7/85oevN+2vi/sEzZq7ak+kZFlgRrNaYiLCS?=
 =?us-ascii?Q?VMQKjrRj5Cd4jCIQlHUbmFvMjYj0JbVdQUE9eN2YgO0DibvY5PXWCeelddoO?=
 =?us-ascii?Q?IPThFU6usSeZAXD56EnMgy6rFsOnnJI9mGTci5GerA6zW7Jw7f8ucpY2k7ci?=
 =?us-ascii?Q?RiNTQoUWbbufTOtd8p+AzpYWuL7LupadO7xLXNyh/IUoDp85LZ7N2mPEEgcw?=
 =?us-ascii?Q?0OZi5eNeDgENM1X3+9a0LmW0+rLR3UdtvUqc5z1bYTWqXWKtZ8g5IaDNCFko?=
 =?us-ascii?Q?RfDRNmuFuI8k/n+EMlj2/5DkeOVIwgxTdQQLyELEsIOlqB30669kZ+HvOvDa?=
 =?us-ascii?Q?ZGQ2c5OfCIRmHf94VGqussqdtjE38Eyho9lJdTn2YYW2laD1hmpG9JrmQcU2?=
 =?us-ascii?Q?ixBn+m1YV01WxQR+RnZGpn14CTJXYWRQ+q66sG1pD+WC3+t05imWGF05KNZQ?=
 =?us-ascii?Q?oHWvU2MlRrUAbNUh49REZJqxVrEmBK0cvmPZ1TWXtavs7PT6GgbxAQQmFX4k?=
 =?us-ascii?Q?urLZixuHTjkOymeZ03YJNnbSwFbai7poqTjzT2jgfVisIDuK75q/8q3gnuDa?=
 =?us-ascii?Q?WQkU9QWa6LmJL0eV3rey9AEnL80TFvm3wIjySioL90ckKindinpUsvlHYtUG?=
 =?us-ascii?Q?vsV5Aq4Xn9VtFRyS2020Xv0TjbS89jsA6TI2shHzBk3hSSS0k7WeE2RKCyLZ?=
 =?us-ascii?Q?F01ApkRhofoWGUJLNJQEmdytFfqVPUdDKhKSRskd1NOFZonZAiGqSfjKeTAA?=
 =?us-ascii?Q?ZROkAy50Eu3CYCSshJvzmt0Mr0JE8dE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b6378d-27a1-46fa-cdd0-08de69fe99f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:18:56.0427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psj1nw/iFRshyvsJAorPTemgo3luLOS+MY0ni6yt2H6aeL6WuaJGvwLptKbjwEICG8khNC25uy9O+GPIPQHKvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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

On Thu, Feb 12, 2026 at 11:26:22AM +0530, Raag Jadav wrote:
> As per uapi documentation[1], the prerequisite for wedged device is to
> redirected page faults to a dummy page. Follow it.
> 
> [1] Documentation/gpu/drm-uapi.rst
> 
> v2: Add uapi reference and fixes tag (Matthew Brost)
> 
> Fixes: 7bc00751f877 ("drm/xe: Use device wedged event")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cb8a177ec02b..d6c2cb959cdd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1941,7 +1941,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  	int err = 0;
>  	int idx;
>  
> -	if (!drm_dev_enter(&xe->drm, &idx))
> +	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
>  		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
>  	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> -- 
> 2.43.0
> 
