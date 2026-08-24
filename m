Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C37BC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 19:40:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA0710E582;
	Mon, 24 Aug 2026 19:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAONQZe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A4910E196
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787600423; x=1819136423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qWoGihAXThOMTWH0MiBjLSKHqarPonl8AS0SoEYD53o=;
 b=XAONQZe+pZE8gOTDjyh14m0n1bPUXYddFY1rzMNvnq+sGwTmc/gKVvb3
 /duYVbIeBHE3tceRyktHMbcHB3mdiDxs1oBuLE1EJxNSbfVmw8nI/VkSq
 5ng4vhLsnAXttWKLbA2b+VrwWbeBOBfnQ40dvq/cS4mLftNCRkQkiJeXE
 Kru3/gyXl7K90DdnK4mTcXvO+CXKcn4VmqMk20qaO7I/3o4xqqgJVJHE1
 XlWo9LZeLnDPCDFguydA/vspVpsQrxDDmmIyQCdUosu6OLJeUcuBc9/Xy
 h/ARF5bSWIuTtKri14y6up/qcOT2ze4NWS7mdMFvp7DLrGZgyc0CL1hiz g==;
X-CSE-ConnectionGUID: BM4kFs0NRDSsReXahGT4BQ==
X-CSE-MsgGUID: hNhFvUO0RcWgf7wgfoc2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105595604"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="105595604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:40:22 -0700
X-CSE-ConnectionGUID: 90D/tX9UScisJLbnUJlkyg==
X-CSE-MsgGUID: wjBxmJ6kQPuPdyV2GGatnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="269032804"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 12:40:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:40:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 12:40:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 12:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZloTxicBoLEOD7Ez2p/VA0k42siWn4uQq/j/Oqjr4gqbWEf7StTSPWv6A/Qi2y4A9mDlnYDU37lD14ZE75uc4zIqTPI/XMDuhsaYjxeSROg8Igf/H5dCqPbHOFudA7/6Mj5XfUV6u97FanQ0cdA4U8iIgaRutJbd85GG28wcjqR5hGl8HR5RDsQLSRcp3aciSMRtAPoE9beWut+o2gS24Q7LAFW9DVOnx1EbbaMhaFuqjz5RK/Y7g13Dq6Sj5mRIWw/qBSCs9lbvnLEpocF+ycS5QMdYeP0pmmgXBLhVPGYLA8Jn8zp03vL6RAIFu3BIdLc62mTCRDf4/XzhtSs4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxDINdPDAzVdfGp+RIXHCMsmzd74dXAqEOdB8+FV9Yk=;
 b=VqEL/z8W8rK+oU1dHj1avl2homCNIkAMyxjeW3+yd/fRvwBY4B6SoWm3xTVEEaZc6bl5DQF3erhQBsEqCofUnqtojY67nPknkHf637Hg+TyR+lXRIZObtaahqkXMp4rSBmTNh7s53692M4anLwMS9FnnC1KYD/+grrDRoGL+/fzzGO/LJT9FYgNRakOERTaqTUZsWRgEGPNn5oHdxFlEYijc4zEUenh92PZKBdVzQrtCAbn/zT8vI31sYM9U4R3Cb1/pA3Uep7V+uURJTvL12OpINrp8K9eej42ZQMmYEW89q5n1lKFRWFgzc0fH1tzuHk8h4ikF8ok1zPyxk2ShVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 19:40:13 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 19:40:12 +0000
Date: Mon, 24 Aug 2026 15:40:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/pcode: Use int instead of u32 for mailbox status
Message-ID: <aoyeGJThJDYXMlfQ@intel.com>
References: <20260818231140.729887-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260818231140.729887-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a41d41f-e784-4946-cebe-08df0217838b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: elUEaYUirztSML7jV7YgczsdS2wXzhP7skz4UrYmdHWMiyLTRnFdjVQcjj7YJwS0WERnQ8B+gCjyk/URxp+oDvwsrjkNFqDjRy9839l0uI43N8tjtnFCcMe5jELhC1XV8c5hOEIOTbxG4tbHoF9E4OFjR6MLRaSZt/OPOOUcA+0T5s5pxV2dxAuCtByd9/b6JHEqMQFh1RmBgEgjJDz/K8eoUOSH8Zp3zeCYBkSkzgc+G7+UawvpU9i1ePwJbUVHV9YEltuqqdYwIp+qJMmee4fpaEI2fTFBu2sRfr8vilPqQG0xhZDGVC/KjTK/4DVRU2MEP5AqPUbN227xewjOr5N3OA8ogetYFUNgj1qp+G2h1DMG43fMB4ef3XMXvu1ugdZpvHZhi7wpbRWSkW5CxrPLMrenpMD+hVsoe4AqAiZPOp36DRXiyAqiuAiuB+Ei8WQ1nrdtFWQYDrYGAfzB8WKCyASw7+6PDstbFfdTomrM5Ycj7O/0wQKpxyPh6K9+akgACxmIO/4tVF6twlTYZmzpToxyon0fz/U/hS+dZ4i3kGaYPRwtiz63EqyDxCXfXXApKPudbsdyNnF6umFnVZSqyR7BrTmbtg304NcrC7tBcyARbC+rreSuppP5zw8w/oszCJb4rFJM1hOYHGPTfrneGBB5fx7oBLWrX0KogFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzZ84SNd6HaPIbO02+14aYt1u4XUmn93fuofzFC2r6k/6WYyTyNSFgJI1yGu?=
 =?us-ascii?Q?y/5/Tn6Ko4w4scHvijXbAFbjlcsmr4XZhuJgCDJqnDZKAEaOayzFnomVIKhN?=
 =?us-ascii?Q?xVWWXQF0d6UTCsglkEtK9JOzOU5Sr3QCqKEgyDmTW+PHa+F/cp4yYiLMFRYL?=
 =?us-ascii?Q?TRK/3+3voKfOYPO7D6IS8ZZ6w1RGT16GSRlgsp1PILJi50SHT4fcBY/s9Vz7?=
 =?us-ascii?Q?UVHY+BGrF12jxVeUzn2E7T9cPkYGBp3wNYumM6wZvV9ssSOFFmbZkoRLeV+T?=
 =?us-ascii?Q?RJyUFHEEEuVqPIBAoCSzMlollYwyFJSUqJVGkHhyLqJMgJ98AynjqRE9tvMw?=
 =?us-ascii?Q?acwmhf6MpDWjtA2marIScfyCoScWWjs/vxoukEC8muBYTnTPb+oqr/0RKjBO?=
 =?us-ascii?Q?GPUth72+dzJqcg81IMpPcTP1gPIQG74HjBuCTLqmLN59bAvXEZ7acEG3MnAk?=
 =?us-ascii?Q?5vEAjZ2m164pw92mB1jR2yhEX1rip+UdMX1OlVU6h1H3dT6vhSGODtZbHUAL?=
 =?us-ascii?Q?7S6LKvNqCWihgJhxcq0iM4Y8LaGac2rz6GlrR/G/Bas2xnSGd0fceeq6Np4i?=
 =?us-ascii?Q?DfxJdtgjLlQvZ9/KFFiFnMuilIbxJ9rknZI8L6c22j/L0aBVQirw6KFOFSml?=
 =?us-ascii?Q?iJV2TdJOgHi2wvS0dFVgLpIc5lMNCpFxc31y3d+Jf6FsC9AY5GCU8e4IY027?=
 =?us-ascii?Q?123kHb57jKh9x3aHnp140VSxJSdE0Psm76RgA3CXP3DS92Qi7UWg2CGRWAqE?=
 =?us-ascii?Q?jcP5kY5QidmfaVoRVuLKii3GbO2qyA3+xn5Bte7iktUjcm1UIzJHkUYSfS26?=
 =?us-ascii?Q?wv6FpDEdsjBjKm5wsLvMg5WGlWBe40yPp0oAd2/h8vNPOZkYiMJ0aAZnwnCx?=
 =?us-ascii?Q?oXxae+2T74wgPWXUlxwvcOm89bLBTglZtgiAnKHmHdZUKqwe0bQarUH7ZgOh?=
 =?us-ascii?Q?/OOmv9wWFEoJUh2EMWA0kg2CDBGHvn+nd43nEoQRIyWruLEWQPp+OEjSI2iZ?=
 =?us-ascii?Q?R9IrIlClTmMjB5mPmdc7bS9oUOdVucm8lQWRv4NbDpNHm7WQQfd7Y8rQsOeL?=
 =?us-ascii?Q?H+8ehZ95K8/uuI0m+zERd2+vO5Zqw+2taA6TliXVZ+47xoy62YBsDW+3thqm?=
 =?us-ascii?Q?YwFrxH8rcYAx6ljVXyf9AwZ0RZwtxJBS/ugusHE+Ushz29h3RNINYpxWoWM7?=
 =?us-ascii?Q?/3gbG1+6oRyaj3bDTFaWow0WFefdJvKkBT8Gby/uKylK8bDZZiB7z04ReXcY?=
 =?us-ascii?Q?w9P+KSM/PxUVkgC/X1+Jd0nF0uzuKXVU7qEmKRPuRDfvE+2pEDT+WNbZefys?=
 =?us-ascii?Q?Ib2BG+XzVbA4eC03DbP/RP4Gq4YZsuHjkDI6Il9w/e25dh3F6O2mWWzCg6CX?=
 =?us-ascii?Q?J1EXDn8xpzQ6qV3eU1rVpt0ue5kh/NMXs7GA9Ld4ZgqguRcOGw0NqwcOXYYt?=
 =?us-ascii?Q?GcJvSw++TIRf08Sfc4pT6+4gVNgq35+Bvr13VIxBcfebxCAl3cfLGBQsNyhy?=
 =?us-ascii?Q?BDoWyiWPnKMYxpx35sk0sBU4KXlC8l6AQpLpOOShgYykc13kIrVz4552Ygq5?=
 =?us-ascii?Q?2EOpuKB3osOHMdFHS0h+U0F9mslGnOXNDMBJ7yXSV+oYtn1EM5R2fHEybGlC?=
 =?us-ascii?Q?TfAw2qfU5dmMJEqu1GifwFbIF9De6Y4IEeqTW+djIQZqoQG6lX9FN4/8rtAG?=
 =?us-ascii?Q?BGI+oXqMDOM6caS6SC67BJXyoS1i1iOUJZOsxrSK4x11pDz6Zd0Nw0aaW2Fh?=
 =?us-ascii?Q?5aVOqgUxLw=3D=3D?=
X-Exchange-RoutingPolicyChecked: pK5G9J3eVAoGNHaaswohUwefb6RA3lMr9ZUQE63VRfCeKNI0Hou0o6SW5scxepoL5Ww/vc/Xy0nvVQ5OL0sEG78VebGVzFlY8N+G7qWm5HUv9fm1M81Bp4kj2ezzxB0GCNfDOsVSq6Bs97hH+d9LOHvfhWP9/lejXPBM6sqAeMqsSwfQVHGcg6IggmO4N0RLyiNhkJI6w3wsmBWO95X/8Czmd4IWtviMdUgJOStwlUizkXTzFcD95N5vZ7qcjBO6qkkoeMx97MALnBePwreFh/Or9zZTFQrNiJ3zC9pbW/9sL2p96UHLwI5cBWGcY8bOSzxCqIWUW5g7QdVktBSAGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a41d41f-e784-4946-cebe-08df0217838b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 19:40:12.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8MqkeG/mLPFF0/6OwgZG3cbWfNkroPpduP02I1Qjz5o37jiYY+nN3Qzqck97xj0QJ34XQcfcu4sFV1bjCdrvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

On Tue, Aug 18, 2026 at 04:11:41PM -0700, Umesh Nerlige Ramappa wrote:
> Mailbox status is returned as int, but some callers read it as u32
> (likely a typo). Use int instead.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: One more place to convert u32 to int (Sashiko)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing right now...

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e1b8062541a9..5f7fc61c9b97 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -148,7 +148,7 @@ int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>  
>  static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>  			     u32 request, u32 reply_mask, u32 reply,
> -			     u32 *status, bool atomic, int timeout_us, bool locked)
> +			     int *status, bool atomic, int timeout_us, bool locked)
>  {
>  	int slept, wait = 10;
>  
> @@ -196,8 +196,7 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>  int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_base_ms)
>  {
> -	u32 status;
> -	int ret;
> +	int status, ret;
>  
>  	xe_tile_assert(tile, timeout_base_ms <= 3);
>  
> @@ -295,10 +294,10 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>   */
>  int xe_pcode_ready(struct xe_device *xe, bool locked)
>  {
> -	u32 status, request = DGFX_GET_INIT_STATUS;
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	long timeout_us = 3 * 60 * USEC_PER_SEC; /* 3 min */
> -	int ret;
> +	u32 request = DGFX_GET_INIT_STATUS;
> +	int status, ret;
>  
>  	if (xe->info.skip_pcode)
>  		return 0;
> -- 
> 2.51.0
> 
