Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B33C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568B210F064;
	Wed,  2 Sep 2026 08:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKeI5WL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC2110F04C;
 Wed,  2 Sep 2026 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788336061; x=1819872061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o9doHcJLZxamMF+bxBIUKdH+Q1hLN7BpkgK5MWNmF0I=;
 b=GKeI5WL8Y353xUNmdiDcbTNsG0uuiO4SSaQxNTMWd4WeDI7ZGcnmRslf
 6linAi1M0CaITC1JCzjVqwy15bg3Y2wcAp3R8BZUuRGmjYXMjABN+SKIy
 QGyljlq1kxL2YAVdkxNeXjPZk7kNjLtmio8qtJN/GW8pKYTYLJqVmiULZ
 B1aMiONXmkdaApR3gNa0XHt4uFQGs9pipO20ZxdGoMRF27Twzl8z3q7V1
 uVV725mX2keUdIia6fd/uHaqWFmDC88tjTd2A5PaJlUo6z+mX3EVmXYWK
 mFmIbelCV0y37AbiG2FypQw1tgJ7wrYZThrwquEv6uvo4XE7HJqr1bT23 w==;
X-CSE-ConnectionGUID: BuhcICiDRfyH5qWUgNgvZw==
X-CSE-MsgGUID: +bdsX+rjTzCnowwbZtXL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106154597"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106154597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:01:00 -0700
X-CSE-ConnectionGUID: UAAjCVQNSTa1/to7fX4Yrg==
X-CSE-MsgGUID: LOUvOza6QNy5nhUwzI66Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="267563053"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:01:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:00:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:00:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8LE7WJHK515GjN4QXgvBxi6ZX/3/5kSugB6CuJzJl3RuQDat1PYdcI682lKf4QdhQLHJo6fYU5z5NlNDfPavUkyg6Cem0SUuP4tXNAZIvOnTwAo94Yt57G2iePzywCLnamiVGvCeqh55RPdWr0VPIruVLaXJbY9Mk1qwEckTh0I0foFnGAK6zZuu6348j0yLdSC+o4jxshn6+gjz287rnEhzJ4XjR7o3J/qNVkO7gM3kBnZD36UbbJlRHAmtt3tZcKEyrWMBor2aVD9nZTwOe5c9aqooV7xq5Hj7W2KFJjAFpqzmlbAw4FOY/aM3Z0w4QkErJE7j+/UpPW2gioI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOoFRQI03a4ob5QS8cZsgOzc4SdpZgJwyNpa2B2vrjc=;
 b=t05FObU250k4luzTAZxiNDiLD03YnaDCDoYRUQyQTumrC2Z3rAYjYH4+nyRrPXIOBXimR7cQDf3Qx2lVIi4EVg8hty6nqeoL0ISJWgP6RCuoRLOrBKUygjStnRAufOSZ7CgiCdtGNrvdMSxY1LJquv2+Q8ocP7x2YK7yAbo7YxHt+prtBGX44PwcMB62XgaCcrWSrG8l0meRONPleLNHntqebSesJ7vcBdXiIjpmYucR/xwSsLpQLjYDf4aC9uPBDcEo4HeAIr66DLwD8x+9evbDRNGaEwn6s+Ig3UzVV8reKedDWbiHJgW22PuwizzOB0bjtJRmg2zhAn2/VejcQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 2 Sep
 2026 08:00:50 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:00:48 +0000
Message-ID: <8e295111-5bf6-4683-8aa8-c6fd99a2411c@intel.com>
Date: Wed, 2 Sep 2026 13:30:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio
 bandwidth
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Vinod
 Govindapillai" <vinod.govindapillai@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20260901103639.617757-1-chaitanya.kumar.borah@intel.com>
 <20260901103639.617757-3-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260901103639.617757-3-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::6) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dab8071-a55f-479d-22fe-08df08c84c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|3023799007|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 47VEfpDtfLSHEuRD8irdRmhq+WPccKSRg5K8DLW6W0LeEMm83+kQYpGFeQ8plAgWr27b/Yb+AnJoievxZiY8DMWp4QEhA8b3Hzy2tWavNDxj0nhx4s6q/rz2cNTH7r5TEL34ZiHkZBeok1AzFNXOJzQsVnG5ztWQURZN9LsEfpGSIyY2KPYz9s8MJiB5qaMWiWA38HhAJrqu2BAuHg4Yz8js0o55SDYqW93gIoPajWOT09EJWB3kwanPjya0n2Z7HuhtRC9lpvdcm4sGNmfulk5ZQ7XhW64ioHz1FpVchvH/upQM0dYW98qv5g2285d9OzdeAd0B3ASc8XERTb6BEc3I/hlDvFJb2xodFy5jGMo5VC0lhrxi0IfEYnuBGUO6DECQ4bqADbGnGHU0yooXIgH5pPv7wfnXpst4c/tnzWgfjRlXI89iFSRrxBsYH1Gxx9dd0FezuaZ6FYHn2dzSaL0vCzdemFNP96yvcKX9O+VIjvoo4EHBB2f0ofdeoiadK5WlDQk0ax4xD1gsoZNronyRxBljgeEH25FfUBiflgByvDW+TI3x9M1/2c3kg6PEWite7HDquJ4J8EFTLZvcLz95Zt4bvrh4xsTF4egKCEjV5e5W26QvnNbLUb15gk+uBUni3BZC4DfENLDu1Rkh4CokAa6GBaJW4tcXV9woxhs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWxIMC95dHdPR0xhQ0g3R1hhcEtKZ210QTMwZUJqdFhvaHhUdnRjTnF3emcv?=
 =?utf-8?B?MU1wbUFqdjBjNjkzdGNVZWY1Wld6OUt2OWtweWc2c0VtUjJIRGozeTJic2dm?=
 =?utf-8?B?bllMcm82dGlLSXRlMVo5UURpbzJmNlJ0b3g0ZnFDUU1na1lML1oybHhEbE1y?=
 =?utf-8?B?cENkTm13RXJVcXU5Nm1WVnRjekt3R0RzakNZSk5sYXpyTXJ3dWN0amF3VlZt?=
 =?utf-8?B?eGFKdGNuK1IvSmpEQWNCR21pRDV4WjdJYTFicXkyQmZDbWdySTdpeUw1Wmwx?=
 =?utf-8?B?VFhVbHZrNWJlMm1idDRtaCt1NWNYcHN5ditEeXowWENFZ0FpSHc2aFZqdnRD?=
 =?utf-8?B?emxFeCtDOTEveGhsOG1oWGVSQ0VTTm5BRDFZVFBlRlZML0poRjJEV01vMzhq?=
 =?utf-8?B?RW1kMjZ3d0RYN1NLVzZmOTd6ZjdFK2drTWQvOXc2QitYOHBDOGdaM3MrT3RZ?=
 =?utf-8?B?cFA3UVlLUy9jUUl4Z3ZkZzFaNzBGQ1hpZFNmYmJGSS9NOVhJb1N0OWp2Q0dj?=
 =?utf-8?B?TmwzN25Xd2piNm5XTUZrSkt1ekRyU1dmUHV0Um1lMjg4bVN2MXpXei80c1RX?=
 =?utf-8?B?cXBuenFneFR3UCtlc2RzT05OMTM1NVVHQkZCZ1JPK1FIeFNMZmV0eXFhK0ZX?=
 =?utf-8?B?NEFmNXluL0UzYmpjRGhBRjBSTlM1SmlaZEIwV2hSZmFmYjF2SkxWT25qRXFF?=
 =?utf-8?B?RThBdVc4dFFTSTVmVFVQYTFnZUx5RGhYRzk4TVVKSlJwN1pxUDVFaVYva2Qv?=
 =?utf-8?B?WTVKRUFSNWFiVlAxWmFuaDVuRUR5ZmtML0lLR0YxamhCSUlnQ3djY3BkMjBC?=
 =?utf-8?B?UkJEODhQYVR5Vkdra0dFN0RWTTNSMjNsVUZXTWFNTVNkS1dKZVJML29OMTcw?=
 =?utf-8?B?eTQ0Q0tNZ3hwUFVtR2hyY01KeVJ2MmpXTlNrVFBPbGlnaHUwTHdOV1k4UThT?=
 =?utf-8?B?c0RiMC9uZ0ppQTVqYjdyNzhJY2ZHNDBUSkVJcEZPZENCbEFTbnZJejhwUk0z?=
 =?utf-8?B?cGE4SDFWaVByMVRGZVpQV0V0NlIxNVpyb2JqM1dRZlcxNnE0Zm12RTV0ajN1?=
 =?utf-8?B?djBSUEhyVklqMzRlV2ltc3g1NXcwZ0oycE41QWNrRjVzNUdSWHdneDZiQUJE?=
 =?utf-8?B?WlluTUZYWkRiYVVOVU5xUm1CeHVNOUV6TnVIWG5DeWZlNDZlVGpseEZ1eWVQ?=
 =?utf-8?B?OGhCZWw4a0h4V1Q3Qk5rUGV0MklhV29TdnU2WkRta3psQlJVdno0akc3cGFT?=
 =?utf-8?B?K2dud3p0TGFoSW9hUnJRQzFVNThhMU9ORVpLNEtISzBMZUZNTFM5MWhUdzRv?=
 =?utf-8?B?TWt6K1h1blRBQ0YxTTF6UGgwQnpyNlFRM1BxY21RUjF4OVVIOFFkR2V0T2Ns?=
 =?utf-8?B?WTl3N3R4eU5neDVjYzdJK1RJWWFsVXFhUG9QTlRSTlQ0R2JSVUREVDFKdml1?=
 =?utf-8?B?eVQ3cjFiazR2R3ZLNTBDQ2FVc00zVWlWeVBmUCtMQ2lES2JGQTRXdlpsbysw?=
 =?utf-8?B?RkJ1UkRReXpxM2JLc1RuV1F4ZW1iWnhqQkFpV1poeHFDRVorWStyRTJwN1JN?=
 =?utf-8?B?dHZ5THcvWHo3Z2krT0RROUJvYjkwdmZ0NEJCSmZlUFFIeW0vdW9MaGM5TzJJ?=
 =?utf-8?B?T0JKdWVzT0JOYVUyS0JOR1JyWWJHMVE5TnRBckRVZlpieU9GUXE3aEVjcHp3?=
 =?utf-8?B?ZnlUSUhlRit1bVkyejZDL3JHbWs3V2U2TFl4bllLdlpvMXYxN3hOdXlsNlBG?=
 =?utf-8?B?Qy9sazlYdi9QQnJaOEllcUQ5eGJQdXROTC82dG5CUW5nQTVaRHhocWNFRnZH?=
 =?utf-8?B?Nkdua2RJWkNwQlE0dHBjeS93Ny9SVS9ZWkJJaHdBaUY2ZnkrY0lhVDBzWjBt?=
 =?utf-8?B?dFlOQm5jN0dqVXBENEUxcUJwdTZhMlhFRDNHVVVsS3NBWWo0VjdYVXFYNmNJ?=
 =?utf-8?B?cit3UWkxYjZYbzE3TkZyY0xrWUFvckdDTjhSMExzVnRDYmhDcWdWd0VSUzRl?=
 =?utf-8?B?eE5LNm9oQTE4dU8wcSttdlNLZHRMdWh3N1FtZmRJVW9mL3dveG90UC9TdFU0?=
 =?utf-8?B?NmFtdm1VNDVleUlZSTdRUUZZOU9WTk5pOEJSNzE0TnpxNWpHajhldktucy9k?=
 =?utf-8?B?RlMvNW1EZHRFMUg3VEY1L081aGVCSHF2ZHN5THdwS1pHMXB1Y1B1N0tIWUNv?=
 =?utf-8?B?QkdidEdhWHkzOHJub1QwMFZNaHh4V3dkYUVTVGtvaW8rcENjS21NUUI1c1VM?=
 =?utf-8?B?NzRGVGRBRUdtQy9tTWRoTzl2RlQwUGp0cE5NSjBiUjRZYjJrbi9xL0ZUQy95?=
 =?utf-8?B?a1BPbXNzRkplWUZJOStKK1NDQWc3YXFkZGphWHBlN3dTOWlXQnJIRmdISGxZ?=
 =?utf-8?Q?klJnd1yl8tY88QdQ=3D?=
X-Exchange-RoutingPolicyChecked: JN0Dw7nScv1aNXd/dViOeGvp3nq0m6dsPlk8JpBrxAcBUI4+mDyRdmBxcTRX47qqExtgjL5xUnZOHdGWLFH6qt/lZiSxnQyp+ABoYEYHzpRDOBot+hUo7Zj13BFgkza4H0vuyHyWAAYUKHtQ/bvGkvEmovJvWAbJfCndxUFtmm674Db9ersiHUXDkSKPTcj05j8QogcK0tKr0hsy9ik02g0CPiRM8Jq0C4w64OnqTdzqTgtGLqbyR0sPuemPL5VXAkJdZtlEy9SiUp7/Z0+oeWgubyfMf6lBg+Ds9s0dSWqq9EG3UY65NL0VFfgVgKO+ezD8KbekzB13hH4D3DvU5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dab8071-a55f-479d-22fe-08df08c84c4b
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:00:48.1111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nOOTmCnZ86K3BxdSN9XPGzAdaS1s9K2ES8ZOjQSTeuwf9ndzWcrBtq2AhTfxmWafFTNoeB9q4NDZMrzgNe9NKITKpBZsZ5KIORA5uq50qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
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


On 9/1/2026 4:06 PM, Chaitanya Kumar Borah wrote:
> Add bandwidth check to determine whether a given audio sample rate and
> channel count can be carried within the hblank period for HDMI TMDS mode.
>
> Use this check to prune unsupported sample rates from each SAD in the
> ELD during intel_audio_compute_config(). SADs with no remaining
> supported rates are removed entirely.
>
> Sample rates are pruned rather than channel counts, since compressed
> formats (e.g. AC-3) are associated with specific channel counts.
>
> v2:
>   - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
>     do_div() truncating the 64-bit divisor to 32-bit, which caused
>     audio_packets_line to be wildly inflated and all SADs to be pruned.
>   - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.
>     (Remove it when BW calculations for FRL are added.)
>
> v3:
>   - Rebase
>
> v4:
>   - Rework SAD removal into a single-pass, two-pointer compaction
>     instead of memmove-ing the tail on every removal. (Jani)
>
> v5:
>   - Drop the FRL guard, i915 doesn't support FRL yet. (Ankit)
>   - s/required_tmds/hblank_audio_min (Ankit)
>   - Add HDMI_TMDS_AUDIO_PACKETS_LINE_MAX macro
>     instead of a magic number 18. (Ankit)
>   - Use drm_eld_sad_get()/drm_eld_sad_set() instead of
>     raw ELD byte access. (Ankit)
>   - Drop extra blank line. (Ankit)
>
> BSpec: 68944
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Assisted-by: GitHub-Copilot:claude-opus-4.6
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>


LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_audio.c | 153 +++++++++++++++++++++
>   1 file changed, 153 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index eae76e961105..32f8c5e55319 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -697,6 +697,156 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
>   	mutex_unlock(&display->audio.mutex);
>   }
>   
> +#define HDMI_TMDS_AUDIO_PACKETS_LINE_MAX	18
> +
> +static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crtc_state,
> +				      int available_tmds,
> +				      int audio_rate, int channels)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	int pixel_clk_max_hz;
> +	int audio_pkt_factor;
> +	u64 audio_pkt_rate_x4_x1000;
> +	int audio_packets_line;
> +	int hblank_overhead;
> +	int hblank_audio_min;
> +
> +	/*
> +	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
> +	 *
> +	 * Step 1: pixelclk_max = nominal_pixel_rate * (1 + 0.5%)
> +	 * crtc_clock (kHz) * 1000 * 1.005 = crtc_clock * 1005 (Hz)
> +	 */
> +	pixel_clk_max_hz = mode->crtc_clock * 1005;
> +
> +	/*
> +	 * Steps 3-4: Audio Packet Rate.
> +	 *   R_AP = (audio_rate * AP + 2 * acrrate_max) * (1 + 1000 / 1e6)
> +	 *        = (audio_rate * AP + 2*1500) * 1.001
> +	 *
> +	 * AP = 0.25 (2ch) or 1.0 (3-8ch); acrrate_max = 1500 Hz (max ACR
> +	 * packet transmission rate per HDMI spec)
> +	 *
> +	 * Scale by 4*1000 to stay integer:
> +	 *  x4: eliminates AP=0.25 -> audio_pkt_factor=1(2ch) or 4(3-8ch),
> +	 *      scaled acrrate_max: 2 * 1500 * 4 = 12000
> +	 *  x1000: eliminates 1.001 -> *1000*1.001 = *1001
> +	 *
> +	 * R_AP * 4 * 1000 = (audio_rate * audio_pkt_factor + 12000) * 1001
> +	 */
> +	audio_pkt_factor = (channels <= 2) ? 1 : 4;
> +	audio_pkt_rate_x4_x1000 = (u64)(audio_rate * audio_pkt_factor + 12000) * 1001;
> +
> +	/*
> +	 * Steps 2+5-6: Audio packets per line.
> +	 *   AudioPackets_Line = CEIL[R_AP * htotal / f_pixelclk_max]
> +	 *
> +	 * With audio_pkt_rate_x4_x1000 = R_AP * 4 * 1000:
> +	 *   = CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_max_hz)]
> +	 */
> +	audio_packets_line = DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mode->htotal,
> +						(u64)4 * 1000 * pixel_clk_max_hz);
> +
> +	/*
> +	 * Steps 7-9: Hblank overhead.
> +	 * Standard:  2*dip_guardband + 2*control_period + video_guardband
> +	 *          = 2*2 + 2*12 + 2 = 30
> +	 * HDCP 1.x:  rekey_period + dip_guardband + control_period + video_guardband
> +	 *          = 58 + 2 + 12 + 2 = 74
> +	 *
> +	 * Always use HDCP 1.x worst case (74) since HDCP can be toggled
> +	 * via fastset without compute_config.
> +	 */
> +	hblank_overhead = 74;
> +
> +	/*
> +	 * Step 10: Required TMDS cycles for Audio.
> +	 *  32 TMDS clock cycles per audio packet.
> +	 *   Hblank_audio_min = 32 * AudioPackets_Line + Hblank_overhead
> +	 */
> +	hblank_audio_min = 32 * audio_packets_line + hblank_overhead;
> +
> +	/*
> +	 * Part 3: audio supported if Hblank_audio_min <= TB_blank and
> +	 * audio packets per line <= Maximum allowed packets per line
> +	 */
> +	return hblank_audio_min <= available_tmds &&
> +	       audio_packets_line <= HDMI_TMDS_AUDIO_PACKETS_LINE_MAX;
> +}
> +
> +static void intel_audio_hdmi_eld_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	static const int sad_freqs[] = {
> +		32000, 44100, 48000, 88200, 96000, 176400, 192000
> +	};
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	int hblank = mode->htotal - mode->hdisplay;
> +	int bpc = crtc_state->pipe_bpp / 3;
> +	int ycbcr_420_divider = (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) ? 2 : 1;
> +	int available_tmds;
> +	u8 *eld = crtc_state->eld;
> +	int mnl = drm_eld_mnl(eld);
> +	int sad_count = drm_eld_sad_count(eld);
> +	int src, dst = 0;
> +
> +	/*
> +	 * Part 1: Calculate available TMDS clock cycles (TB_blank).
> +	 *
> +	 * TB_blank = CEILING[hblank * K_CD / K_420]
> +	 *
> +	 * K_CD = 1 for YCbCr4:2:2, bpc / 8 otherwise.
> +	 * K_420 = 2 for YCbCr4:2:0, 1 otherwise.
> +	 * Rearranged: CEILING[hblank * bpc / (8 * K_420)]
> +	 *
> +	 * TODO: As and when support for YCbCr4:2:2 is added, set bpc = 8
> +	 * to achieve K_CD = 1
> +	 */
> +	available_tmds = DIV_ROUND_UP(hblank * bpc, 8 * ycbcr_420_divider);
> +
> +	/*
> +	 * Walk all SADs once, keeping the ones with at least one supported
> +	 * rate and compacting them down to a contiguous [0, dst) range.
> +	 */
> +	for (src = 0; src < sad_count; src++) {
> +		struct cea_sad sad;
> +		u8 new_freq_mask = 0;
> +		int channels;
> +		int bit;
> +
> +		drm_eld_sad_get(eld, src, &sad);
> +		channels = sad.channels + 1;
> +
> +		for (bit = 0; bit < 7; bit++) {
> +			if (!(sad.freq & BIT(bit)))
> +				continue;
> +			if (hdmi_audio_rate_supported(crtc_state, available_tmds,
> +						      sad_freqs[bit], channels))
> +				new_freq_mask |= BIT(bit);
> +		}
> +
> +		if (!new_freq_mask)
> +			continue;
> +
> +		sad.freq = new_freq_mask;
> +		drm_eld_sad_set(eld, dst, &sad);
> +		dst++;
> +	}
> +
> +	/* Clear the now-unused tail */
> +	if (dst != sad_count)
> +		memset(&eld[DRM_ELD_CEA_SAD(mnl, dst)], 0, (sad_count - dst) * 3);
> +
> +	sad_count = dst;
> +
> +	/* Update SAD count in ELD header */
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &= ~DRM_ELD_SAD_COUNT_MASK;
> +	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= sad_count << DRM_ELD_SAD_COUNT_SHIFT;
> +
> +	/* Recalculate baseline ELD length (in dwords) */
> +	eld[DRM_ELD_BASELINE_ELD_LEN] =
> +		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
> +}
> +
>   static
>   bool intel_audio_needs_cpu_transcoder_id(const struct intel_crtc_state *crtc_state)
>   {
> @@ -725,6 +875,9 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>   	BUILD_BUG_ON(sizeof(crtc_state->eld) != sizeof(connector->eld));
>   	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>   
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
> +		intel_audio_hdmi_eld_compute_config(crtc_state);
> +
>   	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>   	mutex_unlock(&connector->eld_mutex);
>   
