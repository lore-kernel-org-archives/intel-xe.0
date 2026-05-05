Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FA6CD342F
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 07:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BA410E9BC;
	Tue,  5 May 2026 07:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L06KGMnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11F310E150
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777967694; x=1809503694;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DtnnUpGI0lHx5b92lgKiXt+xaHVgJHQ4TZLjXjhd+Qc=;
 b=L06KGMnIXCZW6ByQNsU+ffFey/H2mGyzAqPMvHjKNtiUShyPUQmj+cpT
 sqzuYvtxMLXnDyLcIycGHX1neUSBL3/nmwQaxZe+JE8LUfDihumSuxCrI
 Wk7uq3VsNNwl+vJQSwrAxE4QzMsIyW92/JxFq3f9oGiS+ZSSAkEIBern1
 TeVBW+1+eZAivGQ5t/bz3WNmp5jfmrvV3NY0DfzaIHjQCC004pPaC5g/y
 EJ6BurulOAZ9o19CGg2vYq1GK1XrDu9cISAbe6WzUPGXBspZJIDkxoryn
 qK4jXHyn9xjTL0XcLvIO56VNGeUVgElf4hHdtlgrT4tH1kui9abQDZbdV Q==;
X-CSE-ConnectionGUID: rAcf9eoGTMW9WGjuGHHtCw==
X-CSE-MsgGUID: 3rPSjz3BS2iYGBQls3JggQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82445411"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="82445411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:54:54 -0700
X-CSE-ConnectionGUID: c7yyHEzaRjunCe0dZLNISQ==
X-CSE-MsgGUID: uVpwERLaQSiDzK6izMZ9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="240041921"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:54:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:54:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 00:54:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR4NwdLXCd47fuUVdbMZmT+OxO1uKV9OUcHsaLOXpDz3H1CtSmVpIB1UMD4rgvQwVxRVD5lZiBzUCNlkNwBEKPQlwsljt21N8PBewq8260RvOlh2Zrx8ttW2Gh6EvO8foBquViLQt8ZYJ3ANck/AhvqfNCSjgi4ptJYOk6fmHeJAiHouzELVmadI3B60MWwV0kAlre8CvShytaGvYpEhxaBXaFoAGVlAsMFljO6xiqhjBHy9bpsDjUsUZnJzMr3ONkCu127jKl9iVgDhmrWKCJ31rpT/wUw0M48Adl4P+gD9rJkXcr1oZDnMn1hM+j2vbOYOeZBwwAClA+70Kee20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JByedez/grrOAgylpOD03vWWCHm4BUkDIiMqUhArQgo=;
 b=msSMAQefuZ1AMW4QKwZIvLGzSpiVCh/kYkaRm/UDh3nv7s+T6Ic5GA53pprBr0Zdgyjldd2va5wBl3wznIU/3CEhvmxZfRbILrS+4XdCs+PFY9Bj4ykiFJw47Wq6Uo9ZK/dFOBhVKxctlQx3pVBWbJF6/E3ajE/krPGRXTOaqcb4KC/Vbv+l5x1ENpTHqXeKEZ3oabZRR23uUqOGCuZVymFlX2ekNCfSXoVZ4aMypFWKJQqhwADp8PbRm0JR5Jkr7rTiux/S6pfXJ1rLzx8fccLd1LbH9qq5gFzHBYmx1VbnZ46N1XoslVRh8VD4m8maCRPb9rc9NCUkQFoNbJD+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 07:54:50 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 07:54:49 +0000
Message-ID: <ce83c288-e007-470f-a718-274abbff0fe9@intel.com>
Date: Tue, 5 May 2026 10:54:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] drm/xe/memirq: Make page layout macros private
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-9-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260428142722.582-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0014.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::8)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2819f3-990d-46c7-c831-08deaa7b94ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: DmNRoA9uW1hjCuB8CseuqQlcfF/hhkD4CBo+Rh4AfmTyHfRYeLlBy/Lo2FdeifQen3lWJLg2WovOk6E7CyMPZDNBKCABdnrxfCOOOCZwgIhiX4N40km+bYHAp8Mz4K0ov9r7oUPyKbNtEn8wTTrMWM3W1G57Lq7bTCPz1ErYA+TcS0Fc+ITXqW99IfO6pKCR+4G3SKCWIdMlPwH2lZZflQ+Eg1Mxz2OZ/Z9V1SldDGPtjEVHKAKLxjuQUtXWmS0sMqJVX2buENs4gI/w1rSfQ57FIs3Lc5I+p6LKgLC+PURMWNXA70TPYSYp26JtBAm66sureM5u1O+bFE+mqpb3MIQQwg2+DUPXVRCbnt1rxMFrzEP9YLk9+iwIJPnz2piP+BwoyHXQwPPqutKjmG9G54wAkfJZ75HxUrT7MlyAw54Nkr+6/CQtRgR9jE1eeWxWTk7AY2RFt38n1qXki59JFXUwl3qcnbyA9AojMwich23osiJXRWYBH43ejuBaPXPF00+TGQdOPRNsc1fenNvf/JxlKUij8ayFn6LazC2NQFTqioRuH6kkry9RBV4vfYdJiUi54sBmuyalP48xpVkVzEEMOuhfUA5jhd7l6tLlXmtfbOc9YwPK0i1srgN6RHRVzkOs5NH9QiO23L8v319zFB71xGh9DbO7tt4ySY22fwIUrr5+zXqQAhKLhzj/7Mwz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akViY1NaYjUwa1Zvd214b0hMUExqVVFWUmhPWVhRY1VGUmNwU0RSSGFERHBl?=
 =?utf-8?B?cnl2TXNwMVl5czBXaGpvaDBNa1BmRXVMVVZnZlAxa29vRTVJSjJjb2VLdCtH?=
 =?utf-8?B?R0x6TE9OYWRwbysvbmpIUEx5WmJ3NE1rQjJqaFFMMEZXemY0SkVuU0EwOWFQ?=
 =?utf-8?B?SnY0ZXZMOSsyTDZsYmJFL1hsV28zL2pBaE5EUlZxeGRSdXl1MTBUdjkxNjdw?=
 =?utf-8?B?dmpiSkM0aC9FYkZzTmd6bUpkTFArcklCamhDQ3RFVS91Y1FMZGdkWWkwdW91?=
 =?utf-8?B?dFRhOE1uZng3TlNKZjQ5d3ZtYWo3UnU1MXZGQ0Z6ajkrZ3B0Ni9Kb2t3cW5s?=
 =?utf-8?B?bzBMRXZWVGhhZFNvVVhJajhRYmptYWlOY2JBWk0xMmdnclJVNG14ZXA4ODlm?=
 =?utf-8?B?ZmUremk2UmhTOTBCdmI2SFQra0hoQnBWZkVHM2JpZEVVWXFIRXhzMEk4YUR0?=
 =?utf-8?B?Wnh0KzJwZXg2UWhpYTVHa2t4S1RWSVdLd1p0OVJwalBORzkzdEVOSG96bUpj?=
 =?utf-8?B?bzhWN0FwUVBrTkE1VUNEV2hyUXV1TDEwRVQrMU9OaDdVTUMwdUNJZ25xeWFM?=
 =?utf-8?B?VFVHVmc2QWtKc08raER4emhkcW1xbllxWCsvQ1laeTkwdm1qdU4rTUoxbUI1?=
 =?utf-8?B?Rk0wZTl5K084cER4dWZiUFBpbmpWaHB2d1N5NWE1a1MySUdON2hwNTZ2R2J3?=
 =?utf-8?B?T0h3YjFHcWlZUzEvVG1STldDYzhuMkxYNE5mOEptRVhvdzF6T05zNUJMaWRi?=
 =?utf-8?B?S2xRWHJEc1JqNElXNFAvTlN0RmVwZ1RBVXNwZ2tyeVZHQk1VWmJ6emZqK0p5?=
 =?utf-8?B?TUs1TENmeHRaTi9iU3dtYVVqb2c5aUlHVGV1b0hDK0Joc3hBTVVvWWsrQnlO?=
 =?utf-8?B?Qjh0SHI1N2tHWDVMZ252TEM1VE8wdlhhbWMvejlhSGE0OEtPVEtCazdOaVBV?=
 =?utf-8?B?VG5LQjRTYjFxWGRFZUs2ck5XWkZNdDNvQnJkZGtKOGNrbVZ0RVAyK3I2L1B6?=
 =?utf-8?B?VzlkVlIzaVVpbnR1cyt4QkxUaUM3Y0JVd1ZrM1N5YmpMNUFvRFB1eFk4WDdO?=
 =?utf-8?B?dHNiV0NQVUhCb1hFZ0F6YlF2U0E0SkNmcVlJT04wSS9Ha3JsWXJTMzVHWlNn?=
 =?utf-8?B?WllBZHlJTzV4eGYxNDJDb0R4WjhjQ0RON1FuWVZjT1EwNFE3bTRTZWJLZjZn?=
 =?utf-8?B?YmlMSFh1Um1GOFJpek9CZ1hOQzIzZmQ2RHphZnQ0c3lmd1VwSUs3LzNMTVJv?=
 =?utf-8?B?MmNBTVdyL0xZUFJKK2VKNjNLTFZFbDF6N1pueXk0ODNWVi9jbU83c2dwQnov?=
 =?utf-8?B?TU9laSthaHJyNmUvTFV5U1RNUVJSMHhJSllUU01ERHVwRVpwdDNKaU01ZGNk?=
 =?utf-8?B?Y3h3eTl6S3ZTaUFMbUxucGJUZHNjdktzOFlYYUIxeEowWEwvVXQwc2YwSXFz?=
 =?utf-8?B?bnhxamUwSU9KRThpUGhKQWFJUTdOTXJBdnYwaHFSSXlSVDFmbXU4b0RVczFz?=
 =?utf-8?B?TGdqMlEvOG9UOEhFUCswNGZTZjFjbUt3NzZZUTRzTDlocUE5bG96S3VqcFNq?=
 =?utf-8?B?ampuK2pwY1k3K3VLN09UQnFwUGlHcVJlLzhDdnZtQ2NCV0NRb3IzRG4ybWoz?=
 =?utf-8?B?cGw2ZEFZb3J5ZlA4eE1jK3pDTWRrN0ZicHlDbE51WDkybjR4TnA0dlFkZ0tP?=
 =?utf-8?B?cmJWSkNPSmprVEhKZWFKWlViNGFYaU92d2lMTmVraFA4UFRpRGpxM3BDckhD?=
 =?utf-8?B?NG5Tcm9zWkQ3bUtLYmlIK0NaYXVPT1RvWHhKam1UR29LMUozNHFIRmZlOWw3?=
 =?utf-8?B?Z0xMS3pVRFMxdkE3a0NrUTJIa1prMzFZd3BnNVYvVE5hUEsyY28wN3QvUUY4?=
 =?utf-8?B?eWg4T0xZalVMTlFOWHNScm5SSVJsbUk1cy9tSGxpUUdZVEUzMGNaL1dLYThk?=
 =?utf-8?B?SmErUk5ESjkrTHNjd0tTMnJ5NzNjZWpvdThQWDF5WGpiWG91eHc2WUtjaXdy?=
 =?utf-8?B?aFFpaERIekhTV3poZUFJUXdwckVPamh4bkg2MUpqT29nOFhFU0tvT0pwbVlH?=
 =?utf-8?B?azQ0VjM3OHJyMk83ampJZmF6UVEwNnNWeUY4K2hIMFpyMlNEVERIWWNGd2Jo?=
 =?utf-8?B?NjRFVHg4Zjc3aXp6QklNTXpoVkpreW9jc0tEdzRocEpteHFCZVdDNGdFSHl5?=
 =?utf-8?B?QWxKSXFTcEsrOXZNS3c1T0Foc1QzWTI5Ty9Za0xUbCtvV0FSRVl6cTU5NHVY?=
 =?utf-8?B?SUpwbUxMRmdvZDF2SUVNN0F4UTh1d3hCTTBnOHZpdStPSFdKc3N6NUhyYzVS?=
 =?utf-8?B?MEdTWjNwOHNSVFVsWkNQTE1udDY4NUk4RUpab01hNk1tL0ZzR1ZUQT09?=
X-Exchange-RoutingPolicyChecked: Qv2e+GNZ+j1LmEQuFSSW38qLlH8OKwzfgNi5c/XiBTSl3PkFN5qRdYqqL+ffe/MEyEED/OwA13ZLP9QYvqc4ZRJL38Vl6VmKpch0lnIadJbkWEM13vwF2s46x26k6wNje93FnM3xSpoWVq4Mn0gEXU9Nal5f/Cl9ISOUhn1jFCjvbmIB/bMTJXanDikKdknhpv1VvP2P/MZtQHFngD8ncpcu2CFoI8th4vJtruCsF1+UKtUBqiCP62wiNDsKcwD45I5++0FtMx8wEMnew97sWg6GoPWO/Qd4ugro4/DEIkHqX9hRYC+s/JInHmmgvhSP9eTK1a4sSlPeIrapjG5Ncg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2819f3-990d-46c7-c831-08deaa7b94ea
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 07:54:49.4262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vs09IEN7pu/r2/RiYudNb5tYR8QbaFXEGPQoSpXXbmLFgozjN0fVvN+xZngazGzTkBrEkBQH6ynrn2Boosvp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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

On 4/28/2026 5:27 PM, Michal Wajdeczko wrote:
> There is no need to expose the macros describing memory-based
> interrupts page layouts in the .h file as we only use them in
> the private code. Move them to the .c file near the kernel-doc.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_memirq.c       | 7 +++++++
>  drivers/gpu/drm/xe/xe_memirq_types.h | 7 -------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 811e07136efb..519b36ce2020 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -152,6 +152,13 @@ static const char *guc_name(struct xe_guc *guc)
>   *
>   */
>  
> +/* ISR */
> +#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
> +/* IIR */
> +#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
> +/* IMR */
> +#define XE_MEMIRQ_ENABLE_OFFSET		0x440
> +
>  static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
>  {
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
> index 9d0f6c1cdb9d..02ac938cadb4 100644
> --- a/drivers/gpu/drm/xe/xe_memirq_types.h
> +++ b/drivers/gpu/drm/xe/xe_memirq_types.h
> @@ -10,13 +10,6 @@
>  
>  struct xe_bo;
>  
> -/* ISR */
> -#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
> -/* IIR */
> -#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
> -/* IMR */
> -#define XE_MEMIRQ_ENABLE_OFFSET		0x440
> -
>  /**
>   * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
>   *


