Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC112C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773710F3AC;
	Fri,  7 Aug 2026 07:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RD7QRTzP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0C710F3AC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786089167; x=1817625167;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=G79hcQS63fTnardwU+SY2eEXRNdXSPTkJScZSmOUwPU=;
 b=RD7QRTzPe15/UKerz4iqwRDnA+K4SvOjs8IkYoUpChm3xiEtX4UT0/kz
 TQ0w1npIXwRZHEkLR4tWyohvEGGR9Z3abgdm1gLxhWjRGrpa2ZDmzwt3L
 +S17pPNzJaR5UIOM+I754z79dGPu5WaJfnrdQZPXO6fRJnf+ejleXsGN1
 zIM6hAZBb9aRdGACZJorZcj8wMT1qo8Ntl1wBebVxhiQ6Oyg6/LWuiYyr
 CjPXJexoF2NCE8mK3BKk2iF6kx0RaZPxJP2Cwha/ts0WpRk8XO7bqGPsu
 hCZZohhz1Q4GnxIgMZ+Um6BzOv/u585CKp2Z4cY0B4UkGSKp658aarnNb Q==;
X-CSE-ConnectionGUID: LsQn+fe5QzqUZ0aMxcZwQw==
X-CSE-MsgGUID: 3BHcvv2KTl6LqRNNJbmqqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89220518"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="89220518"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:52:44 -0700
X-CSE-ConnectionGUID: g6aW4yYVQ/O6sbUisXKcUQ==
X-CSE-MsgGUID: WyDfn7YeQVKamNpMvjWKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="287012334"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:52:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:52:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:52:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2p1VPstHEA7P+cX1AoP/4x/JN5Njjg80z6hSvdizAG8EX5lDti1HtGXeMJmIbvVhem450A/Ll8ospEUtn1tr5IMMx0qPPIhNiOOIvfqnaVuguk+/6r6B0mbMgO8H8oYPu2vEbMr5XeyE8Ke5Eds0pju3IVRKXloZNLf6S85L9G/TGVTaSPUDbD6NLAenp7XUy4FDog7+y6TojjOmYqGmbBNudHWvW4D4igD4+pB4K/lVmXLjx2IaBFjpxlBZA76p6ajUXWtoN6eIh2iSwrEQ3RqpyTZ4lVzPoSQczlluzcOX3Qgi0/SKq9ZcJT84WwGaMF3fLJztIZ9R8nFWE7Cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjkzogRB7uGTo42qBkBoC//O/YlSgovKEc2GRDm0DSk=;
 b=McCssWCB6+XCTwfHGx0+mExqsR4SVeSiP4G5AlduST5H3svBJu54YGs+ZzFc5gvCUzvSTPqJgoyfraEtRGx7rdHUYSbTHc7L2nV1Pib44fGxJ1rMkrjVkWEmZyu0sET2B0n8zr0+8mWGDSEe0MT1ElkJh/fXQiP6HH+bz0+9vartuRitgNu11s6cR+lpdKWUqRoxse70JNHRbsCnkVvKy1PIRld1m6VoQuJbl/KUsmoJLlkYdNhlY8dWy4R23uopsJxzQyFBI9V9Ip3dwHUB9lFH8kw4lYj7gpfxn29f88SqeJHZ4PB0DFutcEGQ6zhF5Gs45n0B2Qq3zwuY8jhCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:52:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:52:39 +0000
Date: Fri, 7 Aug 2026 09:52:36 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Add _locked variant of the contexts bulk
 config function
Message-ID: <20260807075236.b3llemip3o6jwr2l@intel.com>
References: <20260805154733.604-1-michal.wajdeczko@intel.com>
 <20260805154733.604-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805154733.604-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIVP296CA0064.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 743ff730-c8d0-4d3b-811d-08def458da95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iMhifyxeO+MatnUd/rY7H6c5ghfrmVwb52UY99pi1SPD8QM874+DTcJHsI9BDQPnwdg4nRiKlz42Hae2MWnveJ7UKnwT8MW+Q8SV65MiFmAUy1Jb3SranQgklZOyP/izRBTNIS2r1FuKkbrki1yCmXfjaengWh/IP/dWBBT0wl8JG7Ut7yr0PYXnVmfBZC+7ruDqoVkWL0RxUHa1pDy4izW3x/Z5JHIzYtIFapFnbUL1ZVYN67Bv8NXKiHWSs71jn8Kf98sxSQzx8HWUAJ9ftFkzH++TlfYoTO8740SbRPL6AChXhCHItGb8UTd5fbf1yHuYGX8uJoK0+2a8cg3kl0vtro3H3f21vPwwH10Ald4KzNi2CiYAu+33kAmt73thRxyhV6hJRvQgbVaiLr82VEJx8/bXwaQlgd91lVMLhOvkI7eyAToMPWibYJKGzoqF9HJFsS1gNwKk6lkqZhkdVjJ1WyA9JBYzQrW3r63/zNOCa0KSdA8munCs2lTaesYm55Q9PL155CUcD3IT4tRih9xVHUdXQzjr4jgmPmuOyuFHHGAv+S8UYQ7FVO/EndAGPc7pdelGwL/5OU8skcOSzpDmNpjiD8OwIoR9J0orVnWb3Cf3CuLBHpFc9AsmWiyryZ9KVuzBFiNeKuY55QGCchfKFmRxqZrZeK5WD05CnGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1M5QXo5bVdVQjBPTms2SHVKY2xDWXlia1lrOWhEUnVLaGxQMHh2aGllRWEr?=
 =?utf-8?B?TFIrWVpwZXdIRU9KdStxQVI5clVpMkh3QVArQzBldkNMNC8ybUFzUWhkMSs4?=
 =?utf-8?B?UitxL01MdVRXU2hVV2JFSXVtU2hpZGpBU1N1Nktab2JXekw1cmE1ZURFUTBp?=
 =?utf-8?B?UHArVTI2eHo0dlcyS2ZRZTl2WkFaTGhqcDV6MWZja0ZUWm81SGxpUUhuZ1Vi?=
 =?utf-8?B?VWp3NmQzMHZwMVhEZTM3K2JBREM3NkNzOTJGTTlKeDZRQXRRenc2R2xzV0tJ?=
 =?utf-8?B?em1qamJLK2dLZnJObmdvZGg1cjl3STZUYjFsMVU5TU5MWTZGOXpwVU9PZDZW?=
 =?utf-8?B?ZkFUNnRsZkYrTktZaW5Dc1BNKzIrM3h1dDkwV1NzN2NzeEZoMWduYW55M3Np?=
 =?utf-8?B?VlpZYTNxajFQQ3lDQUZOZjRUUXY4ME1GZ01sT3NyTlhCelFqUzZSbUtlMExY?=
 =?utf-8?B?WTFGUTByMXUyRmpYN1hGUU9nYlZ4RXZpZi95SkhJSXI1TThtSWZOSzQ5VmxK?=
 =?utf-8?B?SG8zb3NXK3gvSFo2aTZ3M2FRMVpkK0djaWYzaGM2azZHWDROYVhJdVNKbVdU?=
 =?utf-8?B?cVNXODhGQnpQNDR2Qk5EVE5Jb1lNUTYvRHQ1TTh3dG1QeU5WWXVwT1pWZysr?=
 =?utf-8?B?anp5OVNmYUNNaUxkRHI3alV3RkZoY3hrZDcxK1VYaWRna3NmeFRpUnR1cUdG?=
 =?utf-8?B?MnU1aUFOSFc3VnJEL21WdXdsRGlBNHJEVGtHa1BNSncwZklLV3Y2bzdXNzRl?=
 =?utf-8?B?NENYeWtvKzhPaWNHTDl1clc2dklyU1J4eURkL2VRWVBZUHpUQUhvS3Q0RG1w?=
 =?utf-8?B?NmFlZWJpbUZ3V1RlOGdHYUlobEsvWEs3SndZNFZzdjNPa1JrUXhLYmMyN3dT?=
 =?utf-8?B?QVg0MG9wU0VVM1RIZ3JHbmhrWXBOcDN4cGZ4dGFZeFpRc01xYmZwMUxzU1hN?=
 =?utf-8?B?UFJVV2lWdGxmSDJjeGN2eXBuR3JiYTIrNzVBM3hWa283VlNFQ2V3b2lXdi9m?=
 =?utf-8?B?dG0zbCtGR2xCeTlkR2ZvOTFmc2svYnZVMHJ5QXM2V3FPWjY5M2NKMWxVZnVu?=
 =?utf-8?B?MVN2KzIvYmRVeUV4L1hhcGFaY3l3SFR6ZEhnZ251T3dkZUUwU29yRHRDTGlj?=
 =?utf-8?B?cnhSTHBSSVZYMUZneWJHT2swVURKU1RMVHVnSzR5NkRBbmRNaTJpS1RBMi9U?=
 =?utf-8?B?WktuTW9zK3AwWnZXa3NHTklHb05GM3lTM296czBhRThTS3JPd2lud2lmOVpi?=
 =?utf-8?B?TUJFSU9RWHNNQ3RiSUdlYkdENU10UVMvVmhVTUxPZXBVSlhSU1V1cXRrQTIz?=
 =?utf-8?B?alIyZThiQ2ErcTh0Ym1vajJhdHh5ZjVjMUNFd0RkcThxTERjVXdGRkxFTHRN?=
 =?utf-8?B?RXl3bmFLeEVvLzROaXZLVEIxVnNPQkNDNXllc24rWCtKMnlVNFBTcFBNa2Iw?=
 =?utf-8?B?QTROUnJ3Q04yeGEyZGNXTkhWWGM1NnNyOFJ0dm5vZ01SdkhUc2pTN1hNN1pZ?=
 =?utf-8?B?d0lxcmZBRnBORzE1dlFNZnFkZmoyUDdoZXNMNXA2R1hWWXl4OC9xOTFmRXds?=
 =?utf-8?B?WGRUU2JzQnZCZUg2M0xZSks2UHhZV3NzM1ZWWjZadW5pcXg5OGU3b2pBVUww?=
 =?utf-8?B?M0dESkZKeXhHTm9ydGNuYnJQSTFYWkdtQVVmSXBwN1R1OUFta0drczhJNVAw?=
 =?utf-8?B?b2VQODNvbTlIRkNCeWNNY05Db0Nzalk3YXlqWWNveEJkR1lseXNkdFhpc1lS?=
 =?utf-8?B?U3d6WnNRVTNpbXRLUEZwdVBXQ1dyTENGeVptKzVOcUpFTDRVWWpkREUvbkJ5?=
 =?utf-8?B?dmJ2VDgrcnhnTDlpNWl0TUFhN0VFZm5aUW0yOU9oSy9WME1FMENEYithYzBE?=
 =?utf-8?B?MjVjMForZGZaYWNlUXk0RDlSaUdjL280VHBCMzNtTDJXdGp2ZmZsek9iTWRB?=
 =?utf-8?B?cU9DNGVzUE52TG1PTDNEckVvRWhiRXpqL2J5c2l4MjFaNmtKMGt3ZmppMEc1?=
 =?utf-8?B?cTVvNFJVbmF6ZXJ1MWZXYkVSa3FlQ2Jybi9Va2Ywd0UvVUhKR0VKRk5SM215?=
 =?utf-8?B?TnBpZUNPaVZlM0FsTGlGbEs3ZzFtME9LV25qdlg0ZGVYUHJ2d1dkMDhWRWNz?=
 =?utf-8?B?Yk53Tm1wc0hjYjFoOURlVXhCL0JNUWRmZ21uMkVFb3NhSWRQMTg0YitPZU9I?=
 =?utf-8?B?cG1jbGFDZnpmNEZKZ3llMU5ZbytNTXQ5eVZscUJ6S0IwSVNIL3pNclR0Y2Uy?=
 =?utf-8?B?OUpUVnd6TEFzcnBESi8yOCs5bk1XODVmam9ZYldja0krMy9sVmozY2plakpl?=
 =?utf-8?B?WVVrTkRFTzBESjd0U3kyaitsQTVTZHR0eUVNSVBkTTZvZ0Zrc3pxd2pzdmlh?=
 =?utf-8?Q?na4E9bTPEHpAcAxk=3D?=
X-Exchange-RoutingPolicyChecked: LQ3RevklcG8uhjyCMpSXhXgW5st+14wUR1dDzZ622Xndh/iJWevpai0Q1M4k7VGbHzLwxaWcOdSbR9IcYp0tnYdCLvMqL9NrjuNJWI20ys7Pn8Lwu8f7jrQ9SFbmtmQ1uuPZNUg+vWu+mwxXHoVWL5ELgWVi0AUKW9Krf++puVN5PFPB3Apg2iEnna8R9SQoYx9O2i8wlP0LutUYaWUSvwoGrbRSLxr7K+q3PVApNtRVpp6huFGy8eZBPIsLFWuzlA78d669VeBzmMyW7JwC7fbhVx7H//sBBt9+scNv+eLv5PzCsKrzEcXPMx0s/XVancg5XbfWeQ8Rl70VxG5OTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ff730-c8d0-4d3b-811d-08def458da95
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:52:39.6216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmUB6D2CutcGiC+YB31HvKn3BM0z/7DTITJfK/jk7t8W+ckgWP4fWOGL4iocllANY7Ck541pTpn/ks40ZGuYUgfjMAEOOGiqFcKCRtvw2pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sie-05 17:47:32 +0200]:
> We will soon want to provision all VFs, including their GuC context
> IDs config, in one step. Split existing GuC IDs bulk configuration
> function into two functions, one of which will expect the master
> lock to be already taken. Use this new function in the fair GuC IDs
> provisioning.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 47623315d615..4976d8c018ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1116,7 +1116,7 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_bulk_set_ctxs - Provision many VFs with GuC context IDs.
> + * xe_gt_sriov_pf_config_bulk_set_ctxs_locked() - Provision many VFs with GuC context IDs.
>   * @gt: the &xe_gt
>   * @vfid: starting VF identifier
>   * @num_vfs: number of VFs to provision
> @@ -1126,30 +1126,48 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs, u32 num_ctxs)
> +int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs, u32 num_ctxs)
>  {
>  	unsigned int n;
>  	int err = 0;
>  
>  	xe_gt_assert(gt, vfid);
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	if (!num_vfs)
>  		return 0;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	for (n = vfid; n < vfid + num_vfs; n++) {
>  		err = pf_provision_vf_ctxs(gt, n, num_ctxs);
>  		if (err)
>  			break;
>  	}
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_ctxs,
> -					   xe_gt_sriov_pf_config_get_ctxs,
> +					   pf_get_vf_config_ctxs,
>  					   "GuC context IDs", no_unit, n, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_ctxs() - Provision many VFs with GuC context IDs.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier
> + * @num_vfs: number of VFs to provision
> + * @num_ctxs: requested number of GuC contexts IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u32 num_ctxs)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_bulk_set_ctxs_locked(gt, vfid, num_vfs, num_ctxs);
> +}
> +
>  static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> @@ -1198,10 +1216,9 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, num_vfs);
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	fair = pf_estimate_fair_ctxs(gt, num_vfs);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
>  	if (!fair)
>  		return -ENOSPC;
>  
> @@ -1210,7 +1227,7 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>  		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
>  				 "GuC context IDs", fair, profile);
>  
> -	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
> +	return xe_gt_sriov_pf_config_bulk_set_ctxs_locked(gt, vfid, num_vfs, fair);
>  }
>  
>  static u32 pf_get_min_spare_dbs(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 3741202908ee..a14ca7bf7e4d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -26,6 +26,8 @@ int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_
>  int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>  					u32 num_ctxs);
> +int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs, u32 num_ctxs);
>  
>  u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs);
> -- 
> 2.47.1
> 


Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


-- 
