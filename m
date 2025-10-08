Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68BCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892EE10E11A;
	Wed,  8 Oct 2025 11:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIX9yG/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4910E11A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924548; x=1791460548;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zT6A+BtrV2iFrOO1KjwmpLbvl7L+h+LmXJgISxgsUBU=;
 b=RIX9yG/hPZiyH7rkhhVURKs5d0loXJ5zknd+uUGYm0ST7P6WOTcANoAz
 p15fBeOQsfwCdIVZJxkGcDb4O/dvj/cAc5K8TGz9V/9XB76mQSU+A9O5j
 4brv61d+ye0LAn3g/z2t4XAOwthFT27OASfF3nQt7Rxq4axNzyURh34DJ
 m1QL/eJ4SWDPU1NaNWNp0simx569Ln86k8Eg8vfzhankyWS1N9B2OWtH2
 DRUlg3ohEJLU7tzXM3rB5BE4XfTYVajXXBfUYrko7OaHHhfqHiSYBtLT2
 lK27a1iXAc7ac2IuuUw6MVcF7dn7p0KdVdXlwhr+YT2ZiMLfR5Vl3/PaT A==;
X-CSE-ConnectionGUID: I7TujuLBTOWHJPu0aG/ZXg==
X-CSE-MsgGUID: 6PQ72+DyRTOkjbcgB5fl6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72729271"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="72729271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:55:47 -0700
X-CSE-ConnectionGUID: 4oHr5OOrTPq7yXtwagpZLg==
X-CSE-MsgGUID: nvvLY5M+SU2Coe6Yu39qRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180015896"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:55:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:55:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 04:55:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 04:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQt6KgQfZCvW1ms9BORBpBSRm7PgNqsFetdC85EuQGbipTiHZSwzxMAST/spow82SBhpvPQQI6i4esNaUtwBAYvHhuEyQ41iEc1XrMMNsrXNFw+KwLcBBJqAu3BSV290Ga+RsLMwP/moIhkRh9s3rzzSPH0NmRuALFO8+IVhG4GIZVj8U7f9aukymFt0XY8IXSTeYhnWCH62MSEFcZmCCsfxj/aAvx004he+4gR0yyEQAXwUbkrNWg+eSE56iH5nFEXmeVNTazvD9qb8nr4MH3xyQ1lkuAhPUXg8NMm8PF0rrNRdbb8Xoop0f5XcAObcyinZX4aZaGX7Xxig9iykww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaz+tbvM6Q+D9cwk+6UKXKXslHLPtlmdRnH7Q7pyB+s=;
 b=PDevFmAZng8OnDJeA/2A65oYacMh1xz9yUajdY0XACZAk/EukXlaoTL1XRARocUPpwVUm8Pv+5xOv6GH6hla8/7SPL5LNqKkg79hOL1XHnMmR9aVa3ZrlQvmJvfr45Y6xM+r/J1YUHeEpWWExq0ZZLgHtk9OWrREfCBEbqoK559Fp6H+x9+kDyzkUb7ArZGA6dmjG+uUyLSCV/uCsdSqrAyHf2t0OX8Bz59J5vRjD6rwqZn0bS33wU+ViRr2ymAf4z7FvBdWUYLsfroWAEp0/cj2JOi5Pi28u+Ag3gJtVnRxUYmXdhD4hQ9hA/UzCqVjVMtyLfm1AlE5JvV3vGM8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 11:55:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 11:55:43 +0000
Date: Wed, 8 Oct 2025 13:55:36 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Fix an error path
Message-ID: <aOZRMGpSUeC-IbUn@fdugast-desk>
References: <20250910160939.103473-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910160939.103473-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6e8939-f1b4-4827-5675-08de06619c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HikgsTtDl8sBx9WzpfdtRlDRU4ri4L8aIL2aUzjT6Xo9Scx20+4/jOhcXd?=
 =?iso-8859-1?Q?5WB/5soUy/LsrgsrqTamEV6XiO4R1duE948sYOZbVRPie66SlhsM0irKfA?=
 =?iso-8859-1?Q?0guwZ6kozjkCkE9nQZLoy3dW2Hy7BFI0czXMg2UldNkaOPaatC8Sw3wKrp?=
 =?iso-8859-1?Q?p9b7ZzjrvK3XQi3hGgPgYp2JVdye78QXZyvRFmbYJFKWKhwpd7GPHWyybD?=
 =?iso-8859-1?Q?tyzQjarGQ3VUvwcnEHeGR2WkEO+Xm0/nyGWwyF/8WqSy7WbPehHcLp/6+H?=
 =?iso-8859-1?Q?tQbfIz9UPTKJLkhIatGZAmUlQ4tfcQp4cTEjatWSAUFnu7buQaT5URQJ8X?=
 =?iso-8859-1?Q?Glc7U+MceP9S+2N3NFamET5/zIah824TkfojcDDg4mexUiuKmXMpW5hrxg?=
 =?iso-8859-1?Q?hdZHqM48vIBjy5pfEXUUtkzWFGvvx5vNCtE5ruzU5R3olhnKhTeP7hrXwa?=
 =?iso-8859-1?Q?KWbHxeslzt3y2ZCRlIXRJziHvoKWusf84fSLGby665h0Fi5S/AOVULwRLt?=
 =?iso-8859-1?Q?D5ZlZirr3/PzoC8FqB0oVSpvAaj0m5VP6K+WWhAr/R2+qvWRVfclC4y51j?=
 =?iso-8859-1?Q?Sm4MMTHsg27/FZU7otYeCqsjCL4Nsnbou3HCBL2zuHP5ebm+Taza1nntGp?=
 =?iso-8859-1?Q?Ob/+DuvZAVZqpY4d9HZjtB9HX+ndDGMCV1h2digr3Ye1bERcFHMhJ2eSgC?=
 =?iso-8859-1?Q?/joDxTJI/BhdB/xaYH6PafJYhK3Lf1pBF/dpQYMcRECdO/YOCwI5NdJOjd?=
 =?iso-8859-1?Q?tQNSjmDofzcyx+Q573Nvn7h45csabzL6R4/5NFkybb08fL74YWcL6Q/NnG?=
 =?iso-8859-1?Q?TZhQwrf859aEGnxBUF9Z0JGsjCCYBgr9/qKtaKePbWQnRjaKQbY4Cj/2dM?=
 =?iso-8859-1?Q?weUV5GIq0/7n0kvH62d50XdnEOusZZo6ACqp5yht3MvrZbj4o1wP85/FG1?=
 =?iso-8859-1?Q?+5DTrnQw6exbMg1xExgbIa30N5EMri9VBc0gRUenoE7GeHTq04KTV4nikB?=
 =?iso-8859-1?Q?Go96IkBw8UeMIuwxhC1TdgYRwo86E8FIgHDUaFRhJrmMnlgplN3kchi7CZ?=
 =?iso-8859-1?Q?BbIDii3jj1nQMEtcclf5Tof9v76zEKQDd1EpOL8l9CbkHaZv8vI8YS12NO?=
 =?iso-8859-1?Q?R0vXxtmckdYW25IEDvUYpUfhRELzfI7JCqNr5sB/FaYn+sTKrNk3+nYVWw?=
 =?iso-8859-1?Q?UG/MiCmNWBELHuf7Xp5zvl+q96wBjaGdqOeQe91Udx34Bju9zKHWyHuKFw?=
 =?iso-8859-1?Q?C529a8fvHp5hnifeu0uzmWAiPZ1FITr+1G4lN7UY3hBu0zJsxM8xdi22Ut?=
 =?iso-8859-1?Q?6r2jTHcfgPX02qnWcs3qWnvQ1uw7b9dy8pbnuhAOADvdaB+f2JNcXFnOkz?=
 =?iso-8859-1?Q?3pmKBbnNW3eMwoJ2LLJYIL7amIdMvheizT9kTzK8jVSTSCtEP984vz7Ah7?=
 =?iso-8859-1?Q?9Fua5SWpV/gogiTO9mAtirM7OiTkn4Q68RUrMTLqd+pL7D90uPOJUSm167?=
 =?iso-8859-1?Q?aaJL6C61WPiE27NQmf8OUt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JNsITPnG2tQZm4+5mo1Xv3h8b6NX6DV1cc+p8Gcu3gsDoPrxDmh2VwqDRA?=
 =?iso-8859-1?Q?9TxDN3ZpINmtBkb2jh/86fDtTJihoKPmyh6jp2BNfpSgrVROTdSVjS4LJj?=
 =?iso-8859-1?Q?qR/B7MA0dKkJmVu//nBNs693vcHT9Q/wwhrizbPMsNChHlxOFkboTzGjss?=
 =?iso-8859-1?Q?QtZ0+DK2y1bPe69cQkTnHtMwzh7fMiyvaVBUKEz8XDp2eCy9q7YYliUkq5?=
 =?iso-8859-1?Q?LMmwmCwpTyvV5AI1ZSiDAMeI4PzmogrTFYCOxNnhSeJ3oFvV33usHK0O0L?=
 =?iso-8859-1?Q?48ICURfbJ7+HZV7SLG9pKpyKPOuAvR4Q5xgG9h7wxNXFzikMOW4r4wN4nc?=
 =?iso-8859-1?Q?jgKL/trRTekuN+19OhLNekRvZ+jTed+UyRACBjK3PoQmWNzYl0+5VbGXB8?=
 =?iso-8859-1?Q?PEc9vM045wPF6eMIhJT/l3i7FHxf+sv8P783Fq1UP8lg2s8T9329nO8ddZ?=
 =?iso-8859-1?Q?N0Z85VITizUIPGM9hkykSdjwg8+y6k8sHPSO4aynJI7v7L/fKvl5VHgzP/?=
 =?iso-8859-1?Q?O6kQd5pAlxjwldZ8dEFA+tS3gCb8eKXvObzL9AbcyYstJvCLEDBvO5vU+Y?=
 =?iso-8859-1?Q?Bl04a+Xlbw1waPEVJJjguX+vTg1XXdbvKsP+nt0hddtAdv7zePiaM0bRFM?=
 =?iso-8859-1?Q?k3Un5a0MiryrP56eZi6M5kVb3wk33R4x09WkV0f7Ptw4TIgB3qAr8CJu2y?=
 =?iso-8859-1?Q?JwMmLqyCiPJi1zyGSDSbxk68iOhS7u296TCr/SsxmFSM8sy3EhB/I87uFS?=
 =?iso-8859-1?Q?9wLFO2Un2lHkJVXMioj6BEl6dqyzTtIcZdCBv1AkZUDSa969zDwF86BRVn?=
 =?iso-8859-1?Q?smDQ8Spp+QjmPZ5wE4K5Rw4/6hkClL4p5gWSxwOB/ttPpmhp+hSGHbvbhb?=
 =?iso-8859-1?Q?8Ch2QN4q4ngfqzzpLG/yYKrC7k1hccLEvOCoKXWtSDqrICFdR5Jp2lQgyJ?=
 =?iso-8859-1?Q?dcT3nRUPM3dw5HSQr3ZHGn2iphMwZKY1m3uwVYe8bP1HbL33ewRL8QH0Wm?=
 =?iso-8859-1?Q?JelLJgGBfSAC/J1xnXKp8JSeNSw27VxTILKnHj7tHxILj7lUS+UctcOMZy?=
 =?iso-8859-1?Q?hfnN5scIf6xRCJ91FJZ2JK1s6kglsnyk4BZzLvFOlRFmVLxI3Op77pwO0N?=
 =?iso-8859-1?Q?gACMfS8q4kFPoLpWKGAAXBGsIsXgUAt4uBeJDYosD3YjVeqerFhcWkcOly?=
 =?iso-8859-1?Q?mDt382YuMEoIvy5P89CZK+VP8EX4LvOekna7CA9wNwyCwE+2KuV5ort7ba?=
 =?iso-8859-1?Q?rWYZlFryjS/5DwL7Yc8rE38SrpBvnRtuu2fMmrZQrwgqEUNhfnZZZDbL7E?=
 =?iso-8859-1?Q?Db2RcDLHKrKnurlTbuC/TCSOXiXAztYKvbmU83biY3rFCzKSRN6eyObiuI?=
 =?iso-8859-1?Q?lb0Qxf6Mop0wYWh6fJm4Y1FtpOZMCiXl+VymAlaIiNwNAXQhacg88OEKA6?=
 =?iso-8859-1?Q?UQMhov1Y3Va8Haxd9JdTXsUhTfst0dGipty/u3UoRl4nUaOC5zlQm9GCUF?=
 =?iso-8859-1?Q?pjHc4E2ilH4ek3BiiOrt9XmviUDxn3N6xrhJDt3KCPOXfezmlLY0gC5RdS?=
 =?iso-8859-1?Q?1fICl63TOmwdq9wq2WVo+I52LHn9Pvwf+MI5SbvY16WFhqCVuI62oonWYG?=
 =?iso-8859-1?Q?6r6omoJE42EQRS6aprjPbALJ/JfY6NvY0Dzcm9ih8c7VDlP9zbMLpkHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6e8939-f1b4-4827-5675-08de06619c17
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 11:55:43.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z96YPak7Rv0Y4DO1QSgJJfc/CMWbEqfKtfQ6FG/NOw6/GEk58LIZwr/4nFQ+kqLZF4DA8K81hvqffMq6hIxuyT3x3/RFBpsTroRHbPHOCcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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

On Wed, Sep 10, 2025 at 06:09:39PM +0200, Thomas Hellström wrote:
> The exhaustive eviction accidently changed an error path goto to
> a return. Fix this.
> 
> Fixes: 59eabff2a352 ("drm/xe: Convert xe_bo_create_pin_map() for exhaustive eviction")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6fad5d469629..1ffff251d763 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -425,7 +425,7 @@ int xe_migrate_init(struct xe_migrate *m)
>  		xe_validation_retry_on_oom(&ctx, &err);
>  	}
>  	if (err)
> -		return err;
> +		goto err_out;
>  
>  	if (xe->info.has_usm) {
>  		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> -- 
> 2.51.0
> 
