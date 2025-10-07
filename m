Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF0CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A09E10E6F4;
	Tue,  7 Oct 2025 17:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iH926qaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126A110E6F4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759856934; x=1791392934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uW7rP36SUECvpKcqE/fYgwowGARV31NXyay7AzeE498=;
 b=iH926qaFCDQ3DxP5IMRX2G3MunNtpFBIiMnmtR+JV7I5ozqrkGew42B9
 jHHFcCup9om4ttEYz7RPhPxBR3JoONSQeL41P6mc8yFCrZZ1IdbhQLs5W
 RwVwOO3molXKejMVt2cLrxXclC8lis00krzUkg6l+fxzs+8WR5r/LzqJK
 mnBboBu8ftrD55qtYSfC7tGr3ouDT+z2+8dyvOpKTUkqbdKTlA16FTMpn
 OlLE2idMA5WvX2Mo03aYSn+1Tv4j8lrJ1K8YfsGRx3y2SO7ecmO8yi+v+
 Wq1FtIVmk+m61RflhWWpT5Su03zz97liKiTHZTrbPk1ci2kh9CeVh8Y6o Q==;
X-CSE-ConnectionGUID: IFbu15byR3myl/hGzUubqQ==
X-CSE-MsgGUID: ILxu1jEuQVe820HAHF1hVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73470350"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73470350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:08:54 -0700
X-CSE-ConnectionGUID: fviX1ruSSNqneqegH73bug==
X-CSE-MsgGUID: xz4TmQxFTiKYrcbtebg3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180618179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:08:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:08:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:08:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/qgG3KOPY+CRb35yy0x65KuAdNePqhQEuoc4L7VBUbpN5EdzI9pV88/scG0xpw2IgBLoLDz30lAspkbzVtwdd3MiENLHu4kemkCs05TPpPCA8IbKmOwjTktOoyI3aKJnKMN6U2X5X29za/5z5SzWe5wHkeaTJ7Vw/f/0HAxOVyMebrMckwwZd34qk2aTmWRN2Gi//aBxyC9Vu2F7gwUt7+hTVr8toip2I2ctjzcZyVxAwlAFUgwrELW27UWvuAAmgiidhEOb2n3T2wBXpW8+OMolNj36xgxDR+129g23Wy2Or83asGvdXumD4pH9c7WRzenGSWm6so8PTg6KIBwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cIM9C2TdaIlgK0As59sN6bJ31nFAE2JmoUQFyf+eXw=;
 b=dkuvrEouGystT05sZ+2ScKk3Kd0Z5lsthBGFqtESk0NocRKtSrNFzUOqHN+f2s3+LM/+NB6y/A2Kjx7fhQzhNSUPiBR5kWn9p5SqtMnv/jUK7M5bSaxUhFxG72T1zLDV8vrTi+t0vwY2M6wrAkNSauUy8lfAcoFyDDN71e5goBEyHMaY+yYAWcTYc3oLt6ZlLvNSsN3QnHtW36Rs1VtqHVkya2eOiTgSSkLjLImJDrjuMoi0TC7LBV5aePJUigZeCTwC7Vg/eXuZkjdKNbeltOad2iMKyS57ALsLtKZMwOefA4AeEUxIHEk+0nBnv0XWkfTrd8EKd8tMv99dBOHG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPFACFC9C99E.namprd11.prod.outlook.com (2603:10b6:f:fc02::47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 7 Oct
 2025 17:08:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:08:41 +0000
Date: Tue, 7 Oct 2025 12:08:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
Message-ID: <ybfj4vmezjeg4wyyacyluri4gznmahrpzgk5nn4db3ma32qmai@wvkya2ufpvfu>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
 <pfqh62crf6qveer36aofmwom2zh7ihvqezaedmnsvb3lof7rjk@rnkpsetbrsb6>
 <b8f3e9b3-5665-418b-ad21-eac33886ebce@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8f3e9b3-5665-418b-ad21-eac33886ebce@intel.com>
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPFACFC9C99E:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ca7f96-1b49-4406-4f0d-08de05c42a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MyyCSlXwisF3HmIb3OWA2/MhK9tS3QVQPY3fFTNqxElaLEDxzf6qMEY6ei?=
 =?iso-8859-1?Q?OtziDlcUKHnljfQ7ljivzmWb9aMcUnVqwG9YVdW4lXO12bFdhNIzRuZxhD?=
 =?iso-8859-1?Q?rqf5IPc/8ofDphXeL0y2QvgF2fuR7EgbW60WFyLxq5SvPe/JpNB+DcPakJ?=
 =?iso-8859-1?Q?bWQJNBotfcd3eWMC/xlAIwwb7n/8qg+BzjfYgrYPVSB/CCuzUzpUHVr3++?=
 =?iso-8859-1?Q?iIUup3XPE89Ozo/2jdAwqBA7k7Pc2u0fp8Yywsyf1ZQvuuDRbeZan62kls?=
 =?iso-8859-1?Q?UQdptM7fhrp/XDqbnBTv8Fzwp0LnqDw61747ETDkTMO4wuMemeayiW8Eaj?=
 =?iso-8859-1?Q?bzCYJd59T1ZSPVnuVAzN8LWav4/gcfdenR1kSi5toBmKH3lDpzjJ/YT8mv?=
 =?iso-8859-1?Q?bl6HtncVovXhs93/81HwowfVyxiOreQqmiSc4yDO41qkS4r4UJBL9Wx/k0?=
 =?iso-8859-1?Q?9v7iCjFhjXm/O12FD3/ZY409NH9/Hvl2pbJa9Spr1/IZdLBzft27t+ATex?=
 =?iso-8859-1?Q?AUWm/W0jw+cSmZ5pI3dzjHmjNgndqQ+d27iAqEAaKHSnS5Htjkm4V+fVSc?=
 =?iso-8859-1?Q?fQZ7G+TCCQ3KRoX50YL0owVsX0mVAt3BUd6164QWKNXCQpOYoyIQVvQntA?=
 =?iso-8859-1?Q?I6VNVwc3dPwF4bwRjjgY+Jzg+guCKj3KVBTQ7z15mVF+ZHdEJjtd50athG?=
 =?iso-8859-1?Q?1LoNqpFBbbZ4uTpU33BjOcofFx/Rc6ZqlthAddSrjQfhfhurCupymFJnC8?=
 =?iso-8859-1?Q?PAx5fAWwf3lSO58xkehH5lx897H1xPz+pnh2jxmaFxu4yNX3Bok+vuEkIL?=
 =?iso-8859-1?Q?MLedCMPhVCmDHRrIewnCitbTpH6hjitEWCmN1RGJdYAtHhHxdlpdXgGJk7?=
 =?iso-8859-1?Q?Vh2ulZvyFKa173/edpGFwLrrRz8Y6ZuCr5ziqNI5foBg6f0nexI/gCvJEc?=
 =?iso-8859-1?Q?W9aXhXy3upUHCPCKi+y5j3fRtF2FAZ8Q4MJpH16rhrcvd1qNK3/37DKnjj?=
 =?iso-8859-1?Q?5Rjfmnzbb6r2RMNzsPi6z2hWmN/SmRFrfI/KmJO7HCi7JOWfqKe2H+Hwyb?=
 =?iso-8859-1?Q?+F2WVh5eJpDmOjSpsq7nfgZnV40IarNKm0KNCOxSBptRWAgwZxnU5BaLxH?=
 =?iso-8859-1?Q?leSnu4bEa/Qpc18vlXf1BYsxavU3OMlVf2LkZQ5sSrPXVRVOMyTJTdojkU?=
 =?iso-8859-1?Q?rtvy6J+VEwThBNS7SeixxmhG2sNB6PwOrDr1mz+Be12yjCh/ryuOo7yILg?=
 =?iso-8859-1?Q?YWG7m73GbO54KImNs5Pm77OUfDm7hnal2C2au39TgbYF481i4/wEgLbdr1?=
 =?iso-8859-1?Q?14KCQPG7DMX1Smf+Qo757DvzDya5MbrYwFleDm/lGKOGTg2RTzBiJu6zWa?=
 =?iso-8859-1?Q?J19H/rmIUOtAaKJtRt+3VO1m0l/JwIjspS93GEr6+hVjraGm1ZcVIbaGbv?=
 =?iso-8859-1?Q?MqNt/h/0aZReZsk8xiC65Kw3XWEp7oRZ4foBdjmS1HL4AAWIrz0uRrnONC?=
 =?iso-8859-1?Q?u51iMBNIDUNplLIVSjOiTq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Fbr2B08LC542V/ajtBKoOC7nAwBfgOkSZfOCug5bQDX7oVDu8r8j2KiSV5?=
 =?iso-8859-1?Q?/4XLLbpDp8qo0myolVsyISqzZDUgYvEFEIWNxu716DipJxwqVJyH5O+ANx?=
 =?iso-8859-1?Q?DVFFRkzsv2QzV0I1jr/LtPiF16FgCABY6GStQpAgIdT9c5sk1/zbseUdA3?=
 =?iso-8859-1?Q?HtrzUw9RKvyLqxYGlQLYg3KzMiDpW+Zw1MRFdkyKMBqc1k5FxFb9Ga7Rwe?=
 =?iso-8859-1?Q?ETtQnXKzBxtlerVoummPtDfpbo0EBwZzWe5V95IYSGyGAKJ5Q+dkzbRxKz?=
 =?iso-8859-1?Q?Jk5makC626vMd0IcfBzjFIFWmA3YsAETg9vgaDfR2aZmpzTYiLE2sOJiIo?=
 =?iso-8859-1?Q?z5dfiJCSCOpcr6mo7M84DtMCguJNEAGF3XnsP39pg9JoxtjyWb0fXByhwN?=
 =?iso-8859-1?Q?54K+KhWi/yTcMx2zroBJYoN8+GLOp2OJ8BaA6ZWXMMyIJCeTMc429jGtym?=
 =?iso-8859-1?Q?hwVeOztzBeaxVGv3Myjz9LRfdHdi5NSRTjv028jw7wCxme7NXtpVgGnuqN?=
 =?iso-8859-1?Q?/sWBNG9hSPid8xN6pREbHLcRUowCPTy8kzJxdxxFpGLrlxOUHE+FRjU5ig?=
 =?iso-8859-1?Q?0iK59SYDCBVXyoqpRNorIU46xd8kGO3JIlUPReIO5rMhBH1ALzJGpSKGcA?=
 =?iso-8859-1?Q?wh2Ocefl1FNkuRdxInSxp3/JFWIjKDMbGynTTTwUofUT5CPKK+k/PHTbfI?=
 =?iso-8859-1?Q?4eamkMXfDRP8JprOn5c/d5Y6hcR1jl2A7jMWVBlUB9MHdSwnwTgoVRSxw9?=
 =?iso-8859-1?Q?U/IwuYSY02dF3KEgtDGESOIT13T8hSFqzv5v8yL6KgHsIjTW2RRuH4R1Ix?=
 =?iso-8859-1?Q?kKR0Lncxj8TCWiRkz4urxrPb2c//OJSbJ+jnNBC1BFgmuYIiuzFeB+6spl?=
 =?iso-8859-1?Q?QAXD5W7q1FMgc01j/TFEAN8aTpN269EP81miH88eL2iskBVYQQU2IiYhtN?=
 =?iso-8859-1?Q?A+2L0u4z/r5BTpIt3sNiwvTUTMhqahkLyhz+ZYR9q+K0AXbfRRuEWfTWxs?=
 =?iso-8859-1?Q?0q2wnw31pF0zxV2yiBB6b3UDyawcUHxfykq7RMRQ284hOuvxiIMmf5EmP4?=
 =?iso-8859-1?Q?wLgTUTa0zp9xIc9eTdN2nTznaJJGqyErQIA0YxcEXuz2s+wgcgQu6sdNIR?=
 =?iso-8859-1?Q?U0khYvZXYb8ck0cVVCD3TSwGMNWD85G49kwJefb3r6vH9MT4YIEpB/XbHj?=
 =?iso-8859-1?Q?RwNPMVOtowMCe0Km2ZczVkEcTJz7ZPmxvehDDQwwHQlUb6R1PSt4DaamLn?=
 =?iso-8859-1?Q?lWn3IlFId68R7fA5H8l1OwW2PIwnab8lEVZm+QTNRybI4AuoLE+yNQfe7x?=
 =?iso-8859-1?Q?8zhr88Muk3Dv1Ch+VcoIe15OChhk4VpFMlDiDf30ETBYcVlUOPdHI7xlEM?=
 =?iso-8859-1?Q?9teFG3l2EuHA5mfD168q4U1kQjF6DAXaAVM06RhyrRxTl4kiXNafrv6ufE?=
 =?iso-8859-1?Q?ZzSigMdkE3LecAb2+JbXFHflXXbOUiDXFGNAnNZ/jZgzQR7aY55DoOc9gn?=
 =?iso-8859-1?Q?tyCIX+6CQw3UShp45ESeeIvBBUDfqqKZU6SVtbVk+yAqgAqrNtAQlOXRlX?=
 =?iso-8859-1?Q?6eOdzc0mM4D7Ol4nlvyS1nuIqKBhF8WyPaigVjdZBiCgWHpAvhCY1rvwbE?=
 =?iso-8859-1?Q?zZvor9+wUHeIWdVBLKGVDGPsRu45Tdul36eJLELo+QjWxTt2r2hxbqfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ca7f96-1b49-4406-4f0d-08de05c42a03
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:08:41.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRSwPxBfa50gLTbd915HQvODVtRLa6YFRtIm0embHS98ZyVsYFgGYnKR3yi3vJ9NtEaGoeDK2HWMdK8LCJoacTILiBOyL6V/UyJpoZ0lgpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFACFC9C99E
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

On Tue, Oct 07, 2025 at 12:44:59PM -0400, Dong, Zhanjun wrote:
>
>
>On 2025-10-02 12:00 p.m., Lucas De Marchi wrote:
>>On Thu, Oct 02, 2025 at 11:03:01AM -0400, Zhanjun Dong wrote:
>>>Add prefix to GuC log buffer macros to follow Xe naming styles.
>>>Remove helper functions, replaced with macros.
>>>
>>>Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
>>>drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
>>>drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
>>>drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
>>>4 files changed, 36 insertions(+), 77 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index d5adbbb013ec..b0ea9a13847a 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>>>    u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>>>    u32 flags;
>>>
>>>-    #if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>>+    #if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>>
>>can you also add a patch to remove the excess use of parenthesis and
>>indentation? Should ahave been:
>>
>>#if XE_GUC_LOG_CRASH_BUFFER_SIZE % SZ_1M == 0
>>
>
>In case of CRASH_BUFFER_SIZE defined with expression like:
>
>SZ_2M - SZ_1M

but it's not defined like that. If you need to define it like that then
the right define would be:

#define XE_GUC_LOG_CRASH_BUFFER_SIZE (SZ_2M - SZ_1M)

so the callers may use normal precedence rules without worrying how it's
implemented.

Lucas De Marchi

>
>expanded macro would be
>  #if  SZ_2M - SZ_1M % SZ_1M == 0
>
>due to '%' op is higher than '-'
>SZ_1M % SZ_1M is 0
>SZ_2M - 0 is SZ_2M
>SZ_2M != 0
>Result: false
>
>That gives us unwantted result, expected should be:
>(SZ_2M - SZ_1M)  % SZ_1M == 0
>Result: true
>
>We might still need parenthesis to prevent operator precedence issues
>
>>
>>
>>>    #define LOG_UNIT SZ_1M
>>>    #define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>>>    #else
>>>@@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct 
>>>xe_guc *guc)
>>>    #define LOG_FLAG 0
>>>    #endif
>>>
>>>-    #if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>>+    #if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>>
>>ditto
>>
>>>    #define CAPTURE_UNIT SZ_1M
>>>    #define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>>>    #else
>>>@@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct 
>>>xe_guc *guc)
>>>    #define CAPTURE_FLAG 0
>>>    #endif
>>>
>>>-    BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
>>>-    BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
>>>-    BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
>>>-    BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
>>>-    BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
>>>-    BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>>>+    BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
>>>+    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
>>>+    BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
>>>+    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, 
>>>LOG_UNIT));
>>>+    BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
>>>+    BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, 
>>>CAPTURE_UNIT));
>>>
>>>    flags = GUC_LOG_VALID |
>>>        GUC_LOG_NOTIFY_ON_HALF_FULL |
>>>        CAPTURE_FLAG |
>>>        LOG_FLAG |
>>>-        FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
>>>-        FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>-        FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / 
>>>CAPTURE_UNIT - 1) |
>>>+        FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / 
>>>LOG_UNIT - 1) |
>>>+        FIELD_PREP(GUC_LOG_DEBUG, 
>>>XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
>>>+        FIELD_PREP(GUC_LOG_CAPTURE, 
>>>XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
>>>        FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>>>
>>>    #undef LOG_UNIT
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c 
>>>b/drivers/gpu/drm/xe/ xe_guc_capture.c
>>>index 243dad3e2418..acb95a93b530 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>>@@ -816,7 +816,7 @@ static void check_guc_capture_size(struct 
>>>xe_guc *guc)
>>>{
>>>    int capture_size = guc_capture_output_size_est(guc);
>>>    int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
>>>-    u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
>>>+    u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>
>>>    /*
>>>     * NOTE: capture_size is much smaller than the capture region
>>>@@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, 
>>>struct __guc_capture_parsed_output *no
>>> *                  ADS module also calls separately for PF vs VF.
>>> *
>>> *     --> alloc B: GuC output capture buf (registered via 
>>>guc_init_params(log_param))
>>>- *                  Size = #define CAPTURE_BUFFER_SIZE (warns if 
>>>on too-small)
>>>+ *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE 
>>>(warns if on too-small)
>>> *                  Note2: 'x 3' to hold multiple capture groups
>>> *
>>> * GUC Runtime notify capture:
>>>@@ -1368,7 +1368,7 @@ static void 
>>>__guc_capture_process_output(struct xe_guc *guc)
>>>    xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc- 
>>>>log.bo->vmap,
>>>               log_buf_state_offset, sizeof(struct 
>>>guc_log_buffer_state));
>>>
>>>-    buffer_size = xe_guc_get_log_buffer_size(&guc->log, 
>>>GUC_LOG_BUFFER_CAPTURE);
>>>+    buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>>>    read_offset = log_buf_state_local.read_ptr;
>>>    write_offset = log_buf_state_local.sampled_write_ptr;
>>>    full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, 
>>>log_buf_state_local.flags);
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>>>xe_guc_log.c
>>>index c01ccb35dc75..fa1d490dca0d 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>@@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>>>     *  |     Capture state header      |
>>>     *  +-------------------------------+ 96B
>>>     *  |                               |
>>>-     *  +===============================+ PAGE_SIZE (4KB)
>>>+     *  +===============================+ 4KB
>>>+     *  |          Event logs           |
>>>+     *  +===============================+ + 
>>>XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE
>>>     *  |        Crash Dump logs        |
>>>-     *  +===============================+ + CRASH_SIZE
>>>-     *  |          Debug logs           |
>>>-     *  +===============================+ + DEBUG_SIZE
>>
>>what happened with DEBUG_SIZE? in drivers/gpu/drm/xe/xe_guc.c it's
>>referred as DEBUG_BUFFER_SIZE
>>
>>Lucas De Marchi
>>
>>>+     *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
>>>     *  |         Capture logs          |
>>>-     *  +===============================+ + CAPTURE_SIZE
>>>+     *  +===============================+ + 
>>>XE_GUC_LOG_CAPTURE_BUFFER_SIZE
>>>     */
>>>-    return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
>>>-        CAPTURE_BUFFER_SIZE;
>>>+    return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + 
>>>XE_GUC_LOG_CRASH_BUFFER_SIZE +
>>>+        XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>
>The comment in layout is DEBUG_SIZE, while code is DEBUG_BUFFER_SIZE,
>will cleanup in next rev
>
>Regards,
>Zhanjun Dong
>
>>>}
>>>
>>>#define GUC_LOG_CHUNK_SIZE    SZ_2M
>>>@@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>>>
>>>ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>>>
>>>-static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
>>>-{
>>>-    return CRASH_BUFFER_SIZE;
>>>-}
>>>-
>>>-static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
>>>-{
>>>-    return DEBUG_BUFFER_SIZE;
>>>-}
>>>-
>>>-/**
>>>- * xe_guc_log_section_size_capture - Get capture buffer size 
>>>within log sections.
>>>- * @log: The log object.
>>>- *
>>>- * This function will return the capture buffer size within log 
>>>sections.
>>>- *
>>>- * Return: capture buffer size.
>>>- */
>>>-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
>>>-{
>>>-    return CAPTURE_BUFFER_SIZE;
>>>-}
>>>-
>>>-/**
>>>- * xe_guc_get_log_buffer_size - Get log buffer size for a type.
>>>- * @log: The log object.
>>>- * @type: The log buffer type
>>>- *
>>>- * Return: buffer size.
>>>- */
>>>-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>>>guc_log_buffer_type type)
>>>-{
>>>-    switch (type) {
>>>-    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>-        return xe_guc_log_section_size_crash(log);
>>>-    case GUC_LOG_BUFFER_DEBUG:
>>>-        return xe_guc_log_section_size_debug(log);
>>>-    case GUC_LOG_BUFFER_CAPTURE:
>>>-        return xe_guc_log_section_size_capture(log);
>>>-    }
>>>-    return 0;
>>>-}
>>>-
>>>/**
>>> * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>>> * @log: The log object.
>>>@@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct 
>>>xe_guc_log *log, enum guc_log_buffer_type
>>> */
>>>u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>>>guc_log_buffer_type type)
>>>{
>>>-    enum guc_log_buffer_type i;
>>>    u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>
>>>-    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < 
>>>GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>-        if (i == type)
>>>-            break;
>>>-        offset += xe_guc_get_log_buffer_size(log, i);
>>>+    switch (type) {
>>>+    case GUC_LOG_BUFFER_CAPTURE:
>>>+        offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>>>+        fallthrough;
>>>+    case GUC_LOG_BUFFER_CRASH_DUMP:
>>>+        offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>>>+        fallthrough;
>>>+    case GUC_LOG_BUFFER_DEBUG:
>>>+        break;
>>>    }
>>>
>>>    return offset;
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/ 
>>>xe_guc_log.h
>>>index 98a47ac42b08..0cc059cedb9c 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_log.h
>>>+++ b/drivers/gpu/drm/xe/xe_guc_log.h
>>>@@ -13,13 +13,13 @@ struct drm_printer;
>>>struct xe_device;
>>>
>>>#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>>>-#define CRASH_BUFFER_SIZE       SZ_1M
>>>-#define DEBUG_BUFFER_SIZE       SZ_8M
>>>-#define CAPTURE_BUFFER_SIZE     SZ_2M
>>>+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_8M
>>>+#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_1M
>>>+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_2M
>>>#else
>>>-#define CRASH_BUFFER_SIZE    SZ_16K
>>>-#define DEBUG_BUFFER_SIZE    SZ_64K
>>>-#define CAPTURE_BUFFER_SIZE    SZ_1M
>>>+#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE    SZ_64K
>>>+#define XE_GUC_LOG_CRASH_BUFFER_SIZE        SZ_16K
>>>+#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE        SZ_1M
>>>#endif
>>>/*
>>> * While we're using plain log level in i915, GuC controls are 
>>>much more...
>>>@@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>>>    return log->level;
>>>}
>>>
>>>-u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
>>>-u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum 
>>>guc_log_buffer_type type);
>>>u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum 
>>>guc_log_buffer_type type);
>>>bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>>>                   enum guc_log_buffer_type type,
>>>-- 
>>>2.34.1
>>>
>
