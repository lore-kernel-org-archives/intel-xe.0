Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5B5C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 13:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814110EFDF;
	Wed, 12 Aug 2026 13:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONMfzffs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D4310EFE0
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786541750; x=1818077750;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Mkj5iEo2RtMAw54XA6wBeaNAV7T5JyPlH6NQbz0r3TU=;
 b=ONMfzffs6jpIjCN4UTDPffPPsQ/usXayPOHuZI+8MW6AXct6SVoVfRe0
 zrkNiCSxQKErKymuJXOAsNkDtmolG6fHNbsK7D+lqwR9S6ZpfkRE6S+0x
 0Sl8dxazKIcMAuGeKwd7Bnte0e3Cbe2EIe9L1okvAE7eZ5fuAknpwQtat
 nFY/R+2tHD5CAE21tGlx+GcwOmvRC7bX0qZX/mZbEfpWdkmIKWuE9JWff
 ADt2kURV/pQRV8lrXN14K2Ll8khE0P1OJsRPxghOSLdqUfMV5Q2kgAZYL
 CC5kD9/5jih30wy1PIpMzPWolIwxwnJJYHgVSnVP+yYm908LGLKoPPlLz Q==;
X-CSE-ConnectionGUID: 8Lilm75DTTOOq5D7gXd/cw==
X-CSE-MsgGUID: Q8NrKDZpTzeU6E4Em5T07g==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="89620455"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="89620455"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:35:49 -0700
X-CSE-ConnectionGUID: bIrIzn0TTm6GD+t0LPJi6A==
X-CSE-MsgGUID: dMP2Eex6Qly/8ztFu9SKXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="293594320"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:35:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 06:35:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 06:35:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 06:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTcFxfDH9MwtPWaIb0nopXg5NquWqhK3odyU9eFZO7mha/7Prbdd9CI1emFsH6r9dxl3fUWliEfa4Dii+TbkRiJcbJLbvs7WreHwVpsw7gHT5g1e55F9HaX/DcfDvz6Od9SYKjrRGD7gdX4O6d0zWHrdbIZA6xBjAM/RpCfcUOaKZa8y8ghu5JCy3QaYzLkEBmv75TL3/YmzJqS1ioRBXU9rWmPrDr7J9yP+Relhz+GCS+9CoSu/zfN6B9as8MoN0hb8jBhfvp0GjtNGTNRENQuglYBZKXdy6O1orgmtFaELzMIVsVLO+6QEdWYtUZqDi0EBneWTZYkQr+7pG6fZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfcl/pSAn6mJP7yOkDQJfDOSl1ZiQyBuGT4WNnunsfk=;
 b=PLgIbSKFzDASuoYRjggmtnbH/DQmU1arb7Qm8HzwegEEm2ZfmiAmX378rAAr2hyLffQYXFFTPouRrrbdO6E3SpvTz4b9b2W2WjfgEd0nmV9xS3lavFtI3uNx1Z5j3JAco8dnTQoUXRwOGvhgWT9fGKQW+dsHPB/GRJebOgoaqiobLTKxr2yJVSUe/8Xmzv2HFtfq4/Lk2uJ0Kmn96/glLX2EgvQFhGNGpowJ0uAhgmyuIHItjMZDyc4XX20WlJ/4yTyYFtuk7/THT36orKlDSbygtS36NS2M1n4tsrXpN2ilk0vhCaDhRUX6anviSsYkx6fhQgUHr/12SRG7hujLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by MN6PR11MB8195.namprd11.prod.outlook.com (2603:10b6:208:47f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 13:35:43 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Wed, 12 Aug 2026
 13:35:43 +0000
Message-ID: <a0ba4234-5767-4c63-a0e8-1d05540faf99@intel.com>
Date: Wed, 12 Aug 2026 19:05:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <mallesh.koujalagi@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|MN6PR11MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9603ec-7596-4abd-1b11-08def8769b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /l4nP0pARae3/gh8QmPkRujsC8Ep7ObqtKm/zCddAEYTsyLiVaq//WaFMOD8agv4dDrbpXjOHKj5mTy/AwOyo3omVHSqgiKuGhH4K8H4g9kcsy186m/R5qYi3puVKKeKYTfRM3sq61hom43gtomcpLjLKN5y5dH9WEdymuO6Nsrzw0n8KtraMSB+rLJZQyv4B42I48Krx7WTk8uaqjDkZ5KGC1MGTjZ9ObbwUbC50YC+/5PH5vDhpfxaL0Kysv6mHd4zGPuo38JX/kr8B2T7b6e5mnsEkMPyQqU4hSa6i6vcCHHEyU8TpXvms+3ckQpP+/nKhAahkwxPFHRvSnssl4Bz/UBTqZcBmypAQbRWmXITWHr+iQ0+Wjm+UyHILS2T3rLr0h+lk95N4mUgPqoq//Kq6UMoTx7n2Y7DJqaYc8huk2OAZCCSy3vAAr2LZyBChAMGI9bdHFYmx43mEkwRyuBQS4EentO7mq8mvz35qzXEE1HvUVBomyja7ZAKy+pCQ6PtcRkIJLgud1DKxiF5BmcvR9inUolkXwPQPRpnGgLlLTtWc/kahWEgVrBLiH9LhHTP33fwHn0QBgZZfw/HXxNCetOihWOSSKR/8K320cnHB3y03RjFci1rYdWc33K/iSMYiN/jihZ5/gW+3oDQ+Q0smZjbZsYxIgVI5SRVjHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZ3OVp3bmZ1dE9nSGw0dFIvQ0dEaWx4U1VHUGNieTl3SGI1Q0R2TzZicUlE?=
 =?utf-8?B?UXRFT2RIUEloY0xnL2g0ZGpuSkcrM1hSV0tYZ3RiM1AvbE8xNmR5SEVvUUNt?=
 =?utf-8?B?NEZCL0RreW1kSzNMa0pEdGtZc2lHUnlaZWMzNE5kbTl3cVhmMDljZ0pCSDdY?=
 =?utf-8?B?eTVpay9HZm9taVR6SXgxTEdRdzF0ZmhFRnd2SUI3VDJzZDJuMGZld2s1cUZW?=
 =?utf-8?B?WWVJdGg0Vml2dDhHY082bTZycFQveHV6NC9QM0J5ZnV6dUxFWUxJdVVCeHo1?=
 =?utf-8?B?eHZ3eWdkWFBsTDBiMDd1bHBqLzJWd3IwUk1MdXdKRVQ2aUtuS00vWXd6L2ll?=
 =?utf-8?B?RmIyNitZdVltRGZ6VTBpd053aklGWXhoTUhyaUhhQlYvUHA5TE11S2Q3MWEy?=
 =?utf-8?B?bUZLME40QklLZVNyUXM0K1VWd1dSeTVMQlZuUUpDdlAyYjdjcDgveS9YWDhX?=
 =?utf-8?B?bEhWUjVoZDVVcVBOYTk4K05WOTJEa2dmQ1J1eFhXU1dPL3FMTDBUUDhvS3Mr?=
 =?utf-8?B?b3VtZHBVY1M5Q2J5NzM3eGIyQzFONGl0cUhydXM4ZElpLzgxUjVza1RpUGtn?=
 =?utf-8?B?aXVlNkcySWlsT21NN1FiU2RBNnI2dUEyaUNRZ2YrMUxxMDZuTm9VQUx4N0Jn?=
 =?utf-8?B?U1BZejRveis3RVpiRTVzanNodlZobEVaekU5U0loV0Rsa0IyZFFLenhLWWJ1?=
 =?utf-8?B?NW5OWDN3Q2R6MzBQdTRtRFJacmh0RmNFVEFqY1orMm5KL0lqVjJnQzJPZ0dj?=
 =?utf-8?B?VzJJRlpBZncyVDhGZWk0Rkt2U1BncElhcVEvcThzNjNmSDRUUEZGTlptM2Ez?=
 =?utf-8?B?MUxOQmt6a1BZQWd5emtFQXk0WHdYQkFrdVJVdXRIRVozb1lzQ3JDd0w3UnFM?=
 =?utf-8?B?dFdOVzM5dkd2WXVERWRHd01WVklvM2ZHWGxFWkJMbVZISHEwWGthVk85VzZT?=
 =?utf-8?B?Rkd4c0FFSVhkNUhXVExGcXgzamNjY200bkFTZG4xSVJFL3NiZVZoWDYxUjUy?=
 =?utf-8?B?WlFTc1lvK2Y0Ny9WQTU0T3hzLzNzZW5ZdzFBK0JwOHFHWHoyV0VYTmFVN0RV?=
 =?utf-8?B?d1BySEIxRjdGTDR1R0dvaVR6TkxhVGI1RE1manA1dnIrMHlVM3JLazNoOENq?=
 =?utf-8?B?TWNKbm9yUVVYQ1hBUXp3T09wTnhkSWZPdHgzUW9Ka0F2akpxUzRJZGZOQzFu?=
 =?utf-8?B?dEQrcnc0M2poTU01MGZKcUcyNndiSjh3RlZYdEhVeXNHb0liQi9UNktvNjN5?=
 =?utf-8?B?aWFXWHI2dGU4cDArak5ydU0xNG5za2VOMEMvZGlzU3ZuWGlaWmdabWN4NFQy?=
 =?utf-8?B?WGVBdmo5Qnk2VjlTTGR0Qktvc3NFODBNeENQS2JraXJoc2cyeVBJRnhBT2Ir?=
 =?utf-8?B?bk1lV1NqR2FEWG9Ud2c0T0krL0ZHK0s3ZnVZSTZQZ2dkc1MvSEl0K1ZUQWxa?=
 =?utf-8?B?UDFxaDk1Mm1VWU4rT2pSbFYvanlBZXR0VUFMZlBtTER2bEhwZG8zbkRFb2Np?=
 =?utf-8?B?NGloeGlaeS8xbmxIWTN4Q2c5MjhoVitSajJYaTZNb21KOUJTdUxxdWxwUWta?=
 =?utf-8?B?b2VVNjltMGpTck1rMHZha3NrQS91b2RaWGwydmpKOHorY1hiZjNDVk9XTEtx?=
 =?utf-8?B?TXRjTjIwZytYUDRwY2dtQkRCT1k0SzBnYzhkSWRtOC81dDgxZFArZEIwREUz?=
 =?utf-8?B?L2JMNWthYmIvNURaTi9EL09MYURsMlV3NElHWXFNSU1wYmtXOVBPbVZyNGJh?=
 =?utf-8?B?SU9nQ2NteUZDZGNrdnRTSnEreVpVUVJDVHh4dXNjVDRPU3djaERRVXJ2VXdL?=
 =?utf-8?B?S1VnUHRIMjNsckpOWXE2MXBqTGtMaSt4R2tTRnVIdXByNWNJa3E1bnVEdmEx?=
 =?utf-8?B?dUY5N1NkZW5FdGFKQTJRNTlLNFQybnZZRUlrcnMyMys1ZVhHS2NOZnNNRElY?=
 =?utf-8?B?SEtEU1lWWTlpVWZ0VG5qcUwzN0lrTWE0WVB2NUw2aGRuRi9CQ3NlNXBQaFRn?=
 =?utf-8?B?SFplbFRBR2NxL0c5aCszVGZjTVQ1c2s5cHNKRFBVVHZKMS9vUEFLbXNQdENl?=
 =?utf-8?B?eHlwazFTa1l3U1FCS3hqNUNod1RteVZRM09WSXM4aXNqNFo2c2dvNTArd3ZD?=
 =?utf-8?B?Y0V1d0J1aXJXcm1XYXNheVNkaFZFa0MrOGdLYTlVeTN0S29QYlE4cTFaQVJk?=
 =?utf-8?B?Y3ZwSWhURkRTUVV4Y09jRDhxSmJYa2JCVUhrWDBHazNjaXFOMnFhT1pySFli?=
 =?utf-8?B?QUlLZi8vZ2t6K0hxNERZb05jUUhKNlg1OFdlbTl5WHpGdk95L1NDamZlaVRv?=
 =?utf-8?B?TFNrcmhvM0xJWVZJbzhNYVF1bXJ2YzZoanhDNm9ockVuSHJLVXlZaUp1VDBT?=
 =?utf-8?Q?srj5i7a6BjKEZ2qk=3D?=
X-Exchange-RoutingPolicyChecked: YqcirzI84GWlScNySFkKI101LrOwlp6Il9+OkgB/2NGSORqU9g230j4M71gOjhWhVEnL4/0GG1DHdf7JUOFrdFeXIhGLReqvDpvwfGMHFbZgjjuEzEgHzc7RHzYCm1ljfEuffuIDt9mYjGFcgxrKRmCBRJ4mjZbQ8JbVwDUMUdjr2JizoxNfIi/8L7K3mPXPU6qRs7BKzrqEiLdwtN8DMgx15+kJWgOsRiXGCERuvq0IuCNu+YAKh/ooo6TMaoptxcO7yX4y9teeaOe8Bq/J9W6on1FF8JM4Ikt7a3ps4VFmG+3v05oV2XGpfBLQGxzQ8erLciHk9v+4SVdqLUwJGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9603ec-7596-4abd-1b11-08def8769b8e
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:35:43.3681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uXy/jctqc7p66RZSZJ04It2OyRAVVCYeGpmrbdx6/b4VKluf7Heuz1Wo5lcEpYX+rO9rSHxbhKQpBJfj6EPyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8195
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

Hi Umesh,

On 12-08-2026 05:22, Umesh Nerlige Ramappa wrote:
> Use xe_log_err() to report pcode errors using SIGID.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e9125341481b..b35c1a77effd 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -14,6 +14,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_assert.h"
>   #include "xe_device.h"
> +#include "xe_log.h"
>   #include "xe_mmio.h"
>   #include "xe_pcode_api.h"
>   #include "xe_pm.h"
> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>   	}
>   
>   	if (err) {
> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
> -			err_decode, err_str);
> -
> +		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
>   		return err_decode;
>   	}
>   
> @@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>   				true, 50 * 1000, true);
>   	preempt_enable();
>   
> +	if (!status && ret)
> +		xe_log_err(tile, PCODE, ret, "Request timed out on retry");
> +
>   out:
>   	mutex_unlock(&tile->pcode.lock);
>   	return status ? status : ret;
> @@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>   		mutex_unlock(&tile->pcode.lock);
>   
>   	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(xe, PCODE, -ret,
> +			"Initialization timed out after: %d min\n", timeout_us / 60000000);

Is a SIGID needed here? My understanding is that this failure is 
translated into survivability mode, at least during probe.
Also is it correct to log CPER_SEV_RECOVERABLE for this error?

Thanks,
Badal

>   
>   	return ret;
>   }
