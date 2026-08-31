Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75E6C61DE8
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 05:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31710E5E7;
	Mon, 31 Aug 2026 05:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCwlPE8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE1A10E5E7
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 05:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788154343; x=1819690343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iPjhhGTyGLBTL6M8LFSsZD0NyfsVoLC7YWMqbS97S5w=;
 b=SCwlPE8RuZ9v8ZFRSvAbVFdSxKOQkFbwmLCiI9SoD1f5E4h7lDYLUCpN
 ZcC9URSVxmJ2hEID2nKjm3BHJfB0OE8s3eStUVyfpi56ltOPBuALBnBgO
 ahXdMA/HM/kLCmCxBxbxPfdZG0nVzVo9bYaUYeEbsE3yA9803HEcYGXuq
 OQlKupWN6/qll2gCpd6bJWJ8Va3G5oGjJtJa5XBMNfKQYpDCWSzV7am4F
 PsZM2n1tjsKwfceKvcmun8N0waaCh5LwR95PXrzklo8SKJvJaCBFbnjQl
 9kV87sjgoW20cpfb+5xvgG+xB9buG4IUCXizezRU6pfF6g9XbzRK9y0X4 w==;
X-CSE-ConnectionGUID: GbjP1k9DTkqskhcbvML0kA==
X-CSE-MsgGUID: zduKfTbDR0KPwxDwZCgWpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99149778"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="99149778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:32:22 -0700
X-CSE-ConnectionGUID: dy1IgR6aSfCiaOu8FhJs6g==
X-CSE-MsgGUID: tXY1mfQzRB6aUxeO+js8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="268133391"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:32:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:32:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 22:32:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeyNgsP6WSmVnJNoKWVSQHmGDWyOrlAsOSJ1A34KELxmlWqRt9m7g5XMljDaxgvU9HGqfFIB/+DNGPeZL+cYSAvUPx2SEQ+hPGrkLj6/Qqr7ab1WiK5JdvlwcGBIIqh65rsTRiIv3qE4ir1ldUd76Yehwnr1iga+LlqdUNU9tnbYcCW+wHfd0uRVM7PscejvV4CXplHTGvRjhXVM4JLQvYiawbnIVmaFUBcX10nuLttmHe3uQy15KNNmvKTnIh1KDayvIOBkh9mkohLe1ZSP0IqgSQDYWkFVa0BvezWT7QOfHtUIU11DqNDZhEJD5pbCVYhRmQO2GqRJtJpzhc3gqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+xHFcRlhfiOwghvRriZAEzIFO/tIZjB8VonWITlEoo=;
 b=trULF/P/QT8JOyL5MXHF6uz8A5Z222SifCYZFp/2J4rsHKKLqzsArpTeU8JJPYY5zwsjQc924MUTiDRArdv0kxnLqwHIMIVSjxax1Q2T7Wp64RP+fuyk2lhdAvHuBbCGk26dHuuKTlet0/PAMQm/zghLQ87Xq5qBBigk6hpF1JKcyjvEOPXYj+la1ia2BqURXWDkotM8tgY8dpIYXTQNwlcWgYnixHTmpfV++NkPDAa6siB7vilOO3iejl0NJ1WFqBn1AR0xouUWl3ZGMED2DepvBz6+WKHed5vqNtOVIdol4kXJoEf8Wgx5yvtG+OT703f2HM7eNxnzjofYB2WVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPFA424F92C2.namprd11.prod.outlook.com (2603:10b6:f:fc02::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:32:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:32:14 +0000
Message-ID: <16d977c9-9ded-4d61-babd-b71f56e427da@intel.com>
Date: Mon, 31 Aug 2026 11:02:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pcode: Introduce xe_pcode_read_timeout() API
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260729171546.3368457-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0333.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPFA424F92C2:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0e07cc-56b6-4133-50ce-08df0721366e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: kYHm/R8qBQ7qzgLryovzI4ntWQiiDlOt35rPgDZi942Y3rjmKdbC5iCHttGM+1pYZoxYamDP2MRSUA2v9Zx0InpnJV68wJoq9Nc9c7o1WSbSndNBz0wzUc+OaGnKjQHmN7HWgW1rFijtrZdBWtRxAbG/8uUHUxEkhx/eKHZ+jZ8RYGfpq89ErrCh4M19BSilnryGuHvl3X0PC3pBm4FhViiRlOL3NF4HXpkF/bk4q4ruD6eDU3yL6UeWC/1DrEy/xCLqB0UsRKL3qu4IK/v1pNGTugGwV9/eNCPSkbv6H4nwR3Ml6HDcz1e/kQs1chnbm1rCvB1jNtwlcucKYM/DIYKM/chcYvt7yXkj0pS+yN7jQwFFYreqY6oVaXGFA2djOTvNIB7wLPJoZ6sPg5BsjCN7lBLmRGO5dGT10feLyK0XlP5MJZq37p/9XuVYG8MviMIkKfGqvUEk8vghVWaKpsxvuWHaDmUgOHLo9XGC8tBNH6rfzjNxzUGil9EPgSHCVJIlCqW5Eco7rQvkjE3Y5dUVYkOJkw3pBEXmcY1fL/lO5++C0kN4nn3orL6nbrwl/QNjSXI4jbWEO6lAGXhwfx8gY65ODUovHLfVofPCGVZ0pG+4sG+7pvhblnLFsXQfsUFD6pNVUBj7mlrlg0ZsS/BZxtDKz0S/L2y/L1NAYRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJwbGJteHhQM2JobjZDbDF0bnh3dGE2b2RkMzRlenA4aTZQc2M1VkVMdWpz?=
 =?utf-8?B?MXRVTDB1eUhzWUp0Ti9yNTV6eHZyVFNsNGtNVkFJUnZZR1NEVTBUclkyOEc0?=
 =?utf-8?B?K096b2xYSk4rVU9PUEJhaHc2M3NhVm5PYW93S080cGRWV2ptVXBxajRkbFJO?=
 =?utf-8?B?RnJwYXJBT1EzNDNjU29mZGNOeTZSd01pS3A0dDdDYk9qcUc2SXVpY0xhM1d5?=
 =?utf-8?B?RUxiWlZSQVN0Q2lxOFVEZlJxNTI0Y1prL2o0Z2xjbTN2Q0pxL05SblpvRE4w?=
 =?utf-8?B?cE0ydUlCd0tRVlNHbzlMOURPNVZualMvTlduSG5xbTBZT044Z3d6eEFEOTFQ?=
 =?utf-8?B?NmllUGVrVWJiMEdpVkRNZWRQUkFOd2pVbUxkUXFmcDN1OGY4dDREQXFhMGdY?=
 =?utf-8?B?d1R0YjNmWFJxQWNac2FSMWY4LzNMS2RZakMzWWZFaW5YbytjYURmTlFYNmhs?=
 =?utf-8?B?Slg4RUJhQUQ2Nnh5L0xKd0ZTMjlPc3VXMlRyWkY5ODBPM1E4K01kS3FYckpG?=
 =?utf-8?B?ckJyUmt1NFFaM3BCNnoxS3A2YTFaYVE5bE9UZUpveUV5T1lxUURscmpwVEJp?=
 =?utf-8?B?QncvYWJqNHJ5RDd2YVNsWEY1OGswSERQRDdsdmRHWGZIV2VnRVZOYXlpZXBF?=
 =?utf-8?B?eWhNSS8yT2wvV0pabi9yN2hJNmZHeVhvTGVGdEl4bC96a0JCeTNaYk4vUDJ1?=
 =?utf-8?B?c0NybE03ZUNCZUp2WlB0L2svTmNVSUIrZm84RElpa2tRak5zVHo5UzVURUsv?=
 =?utf-8?B?cHlLWlE2YTRINVJKTDQ4TDBJYU01SkJqTjMrLzhCcnFmcVRHNkJHUDFVblZ4?=
 =?utf-8?B?alNCSVROSWxidGg4SG5rdUhzNDlXZUtkclY5SDA2Q2tXaWsyV28vSEloVUpN?=
 =?utf-8?B?S0NKYzR3ZnM2RVVneUJMaTVuQlQ5dGNVYlVDQTUwbjhVZWZjRTVxbkVRVk5s?=
 =?utf-8?B?NTNWZ3F5b20zSk9Ca3RhbVRBakF1RmlFN0dDbXBPTEJ0dVdBemlZWWlKcWFn?=
 =?utf-8?B?My8ycHQ4azFDR1lIYXlyeTFqRUdpU29LeGE3T0tGQ0ZkN3A2TGRHdFlaWTNJ?=
 =?utf-8?B?ZXcrMmU5bjQ1NEhQaDVleVlzd2NjSzh5RnNFLzVWdDVaZzNWUnI4bnYvbEdy?=
 =?utf-8?B?OUhzc2RxbXlKL2hhRlZKVGFQZ1l2Vys5bkZzTTVOaHJJOVcydHorTTVDZzVU?=
 =?utf-8?B?Q3VsanVkWlRMWlk1dnc0eGd3M0w4WFJrQllyZnhtV3JSVnFwTVVFVDdVMzZB?=
 =?utf-8?B?R043Zk8zVytBdWllQkpMSFI4NHN2cFBYZzg5NG1sTFJrWFJmTisyd0hmZWFN?=
 =?utf-8?B?cGdkcDMxcmowTDI0V0MrQmdVYUxidGpydHpZNW9RSW1NcmlzZFZHZXB0QXc0?=
 =?utf-8?B?U3N5ZkFjaEdkT3M4bkE5dnprYzZQenlBUUltSTdkUGl3WnpaUzVmVGR3NkQ3?=
 =?utf-8?B?QkQyUmIwU0xoenhxUVQ2U2J3enJKS3Y2eHFKWm4vQnZwL2JRUmdrWEFDSHlI?=
 =?utf-8?B?L2xKR09uSFZ6NjdsZ2V1T1paN2NqV05pTU1NaElQSHNMalBCVXBHc0ZXUHlh?=
 =?utf-8?B?S3ZCQno1MitabFBMZW45bkZkNmFpUEoyQ1dWKy9vZ0VYNnJKaTMyM0R5eXov?=
 =?utf-8?B?Q1pEemJqdmFQeVY5UFdtajFFWkUrcVYybnYwRGVzY2t4NjlmT1BxcXlHbENS?=
 =?utf-8?B?WlUzeVdSVGVXbFBSR09GRDczdk4waDN0M3pycU1HVHkvd3lPSE5pUFZ5UWYv?=
 =?utf-8?B?SSt0d1NvQjhJclZQWS9lREJIVW9saFVEOVFPaUp2amdrWnMzTHNaTTdINnY3?=
 =?utf-8?B?MmtBTlBxMXBFWWI1NGhaOVp2YncyclpNeGxBeS81OU5uNXI3R1VUL01uZFVn?=
 =?utf-8?B?ZFVPMXo5bVZjNm1PNzgvN0pvTkFsY2ZwKzFwZ0JWM1hWVXZ4eGRLanN6c3dF?=
 =?utf-8?B?WmVYVHZhTitsQWxDeGJjdVNaZ1hweGxBOU02N2dHK1k2K1RMYkxYNk8xeHJt?=
 =?utf-8?B?ZmxDZEtoL3B3c1phaVlsbG81bGx0RFU3VkdnZnNQZFdDK1lxcW9hcm9XZDNW?=
 =?utf-8?B?M0ZCVmVIOGRieU1mRTBRc2wvSENUbkw1SFFGY1dRMjVaS3Rpd3NzN2hMWDRX?=
 =?utf-8?B?RzdUdlVENkJBQlRLY0RtZDhTTTVUSHhNOEVLR1lZSUpWbGcwbGdBUmxrZDk5?=
 =?utf-8?B?b1I5ZjE0YTI3cEtNNU9MWExzQlMxTWRnUEo4RHFvd3o1WXVxeG9KTTBKSXJK?=
 =?utf-8?B?SDBpN3dUSExVTlFLZ2hCbWtaOUhrVlFiS1JRbnRPRlZkS2JKT29sbFA2RDdI?=
 =?utf-8?B?NjFsaE1oU0dsVmxndUpFbFgya1FiNVo3Z1JaRjVhSjA2ek5VSXhWdz09?=
X-Exchange-RoutingPolicyChecked: kCWwOXNQw8s+AXbhhxV2aU9fO+xwoiFZJVT3SzHcaLOKWGG2NkBdpLdXZS3eUsPijhXvzz0IWvhcPEg7LQt7ZDLBsUbCVME6FSi5cF58jjNrDwwtNr6suwzS/HN7a5v7xqUFriYTSmPOTzMp8jYPq6C3Y9/kt1uaeBuwVD5UPtQ98Perv82buoue6BIVY4M5+7syHdFjbgII868ti6G/YOt9VYC+YUP/uu6F0Kb1QDOMNBHrGSHDMS5GT8Y1rV22PI8ErWkExehUw7v/cn2J8wPhNIcHYQbsZ0jwzSvtcXaphxXmI7PXSD9Lt1hBq7I9wDRX0e3bWQTc8xVZSYUo6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0e07cc-56b6-4133-50ce-08df0721366e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:32:14.0054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3b9BCxTFBvobPBX2qw5medxCk5urn97qa0oS39+m21xinXzQCvJS5bctZgmwQzWCkMqCfHbefEPQUMHiuhsakQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA424F92C2
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


On 29-07-2026 22:45, Karthik Poosa wrote:
> Add the xe_pcode_read_timeout() helper to allow callers to specify
> custom timeout values for pcode read operations.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode.c | 11 +++++++++++
>   drivers/gpu/drm/xe/xe_pcode.h |  1 +
>   2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb..7386113e60b3 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -147,6 +147,17 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>   	return err;
>   }

Any non-static functions should have a kernel-doc

>   
> +int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u32 timeout_ms)
> +{
> +	int err;

s/err/ret

Thanks
Riana

> +
> +	mutex_lock(&tile->pcode.lock);
> +	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
> +	mutex_unlock(&tile->pcode.lock);
> +
> +	return err;
> +}
> +
>   static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>   			     u32 request, u32 reply_mask, u32 reply,
>   			     u32 *status, bool atomic, int timeout_us, bool locked)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 8fb3e4ba13a6..c9647c5f305e 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -24,6 +24,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
>   int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>   				 u32 max_gt_freq);
>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> +int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u32 timeout_ms);
>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>   			   int timeout_ms);
>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
