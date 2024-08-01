Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66010C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 14:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357AC10E993;
	Thu,  1 Aug 2024 14:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfz70y1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D13710E991
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523107; x=1754059107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uVCtUA/C/YlW5Lt4vYhekHubVpuCySYHAqNl5r4JwiI=;
 b=dfz70y1QGeZ7LkRvPSiDQDdI3xoQ8Wepg2M3RghzU9dzmWATs8ZcRQNU
 sm49YgGc4UuGWO1SUjvbAIcs/hkbzyfhJspCSgnRPTg1jbmNhjQ+hK6zU
 ARg8zw3OgpegIKXiPJ/3Xg4JCBnG3W0bA++q/KqEZA+bK+BB68wuJzV0c
 pmt7IdEpmbGebGlL+1MZe4gWe5BG6MQbvmeY0S2nTFKC8zQ5W1LS/Slhq
 rKmcYPhU698/+k3PTMrUOPdZuW/VAxarCVZuWIdR3V8fRgUIjzGi99QUt
 eSqxnTlgQYqf3ozlMwg5xxYpXJRjcJ6wYc3hwwkAbQcT8ecRRvNirhUPH Q==;
X-CSE-ConnectionGUID: M86o5+OJQUWZudqjL91WNw==
X-CSE-MsgGUID: kqH1nZd0SMmehAD6vFmeCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="37944206"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="37944206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:38:26 -0700
X-CSE-ConnectionGUID: gYHXaDljSZeTtJ/JS7QD6w==
X-CSE-MsgGUID: ghPV7QTgR3CrJsrw717sgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54711352"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:38:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:38:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:38:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lknXUdGamlzOiytfyWXtJCdoqBZGCap2zP/cxOBc6CTHXAFrvDIuIiRKDmsepxlU0tqDN5Hobaje7gCgFagqIrgcY/YoxgDPEaLogNSc+10R5I0I3V6cFZ7/p1j/SYl9SrN5Gx4U+FyniIuqn4gmlT1U/Sv3d3F42ZauXNrlA32uxYFJH8anNU8wfYxMQ1Z9NLIwctjd1sZRK7Ysjyb6wX+xt+3Rvy+mDmf+NPagW0VzWAtxTEERxqRw2rHn74Udx5EkyCekd+sjwifriFAeo7uHNuPv+xJwUkhBKgNYUaNB24xnI+jGvalthsd5/VwSDEbyOtt6YRuqCGC5WNoXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd5IR5fnmdrJDpSrLJwWTfw3XeXDGfyFlU80wnbkNsU=;
 b=U95Yr9SXK9fN+CwlZCvDqQTAdH3KKnJ2tVPqFc2knYXlvil70Z7C9qEvx2ydvWikVIC3paDZi+E1DksQI9dLIWOdJMhTkmVxYBtXvcM54auCx5ZNS5TRnD7ukeU1Rz3aApLegZw+6Iko2ZaiXwg9oyhXJxE9Ok8uXVMagj3gTShQGupxVJQFxK7VPxSUFFaLfVOxJMimLzTP9h11/DoOZcFTy6yP7PzTLlOScq+wWSPF8t+Usg6jtvI9pGpgE24SJYAnHtU4ym9dc7FT60BpgyINcU5TmnFx6zpt2kMLhgDCsahoC5mrX/dW2eV0vWhtgTJ5P9ik698upAo6lZxIaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 14:37:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 14:37:45 +0000
Date: Thu, 1 Aug 2024 07:37:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkZVTEw6IHN1Y2Nlc3Mg?=
 =?utf-8?Q?for_drm=2Fxe=2Fhwmon?= =?utf-8?Q?=3A?= Fix PL1 disable flow in
 xe_hwmon_power_max_write (rev2)
Message-ID: <20240801143742.GI2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240801112424.1841766-1-karthik.poosa@intel.com>
 <172251955809.488062.17547162860054795323@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172251955809.488062.17547162860054795323@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: a62f7ec2-ba33-4fde-48fc-08dcb23781de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S8gC5VIFRKL6HbZa8L3phXas2tEKPCrZ/0UdFY42qlDe5F60a5Ar5pE8wvRq?=
 =?us-ascii?Q?PAHeBLyAaKZqej0LtBRmOu92qSVb6TLH9ClyjKeAIIEETWpOrZJr8zv6d8ch?=
 =?us-ascii?Q?afenPOYH+7PZ+Ays3tANUlFBoCXEw0cArMJNDjXLCqiAxfN385457VC8koye?=
 =?us-ascii?Q?HjzaB0ocLrCpNgdYKeGCMa09AzrtxbLOx+yZXLm1BikqBbIkHxLawHlj7tj+?=
 =?us-ascii?Q?vOG3KHGoOHFL1SZ4i7Fcxh1DPZJAaG8FmCdouUBAoOs7CPNZYKMBc4Jz4gom?=
 =?us-ascii?Q?o6XgfQwd274ppBWQn7tW2YwQHrMQGgj/cE16SswJoN/0xv/Q3Q6A+l569lgs?=
 =?us-ascii?Q?XAUkxiAt14fa27nqlU+AKPFz5QN4p1taSKvc/4lijYoOtBUuW1aHclsvGmcG?=
 =?us-ascii?Q?gshsNS4TyLnMccyGAN2bMrunsz/tGsDnfCh5FZLTceooBLBYDfirx3rUgYrj?=
 =?us-ascii?Q?ybwmfZGETl1C+w+lwtlVibyIiwAY8WjW7bql4Q5E6olnLz2m0ADtSZqfEgC7?=
 =?us-ascii?Q?Nz/brAsFN4BrY7CD13gUTFebrtDJLxiiBAgRR+ulohasymk1PeeO3/SUsSpW?=
 =?us-ascii?Q?dC4RkrbV0KPnJCUpzdgAXo43D3JX1eHgFc/QIsIloqSLHCxadiVMNJEH7UEn?=
 =?us-ascii?Q?ckqz0d5KFQsLV7BgBWmqVKp6MnY/xSqJLRBQWPN5dfZI3xslm2LLbc+U5m6y?=
 =?us-ascii?Q?9jlkLNO3F+S3GxnAC9Ii7HTqoc8d/a1aWXpSY7w92fN2OtWgouX3/DNenr+O?=
 =?us-ascii?Q?tzGSnFZbFBRVx0WTpTpk3QfmLLWWx37MKlI2+vhjSbuKSBMddSSIObxni/wr?=
 =?us-ascii?Q?oy2nE5jB+tuTxH+u5JhD3RXggEQQnX5a3i2rV+xbw0WDtbJv+/VoGU4EtoiK?=
 =?us-ascii?Q?yIPwBEQI/OYOgtAm3lbrAGEqu9UQdbpxeTQ8NbmfXs5Ft/XpHe3dneQ5x5qp?=
 =?us-ascii?Q?qTqEZhUDA3vnzana3G6Y7EIs8F4ys1+yxcAArI6qZyKlI4A8VAxl4SMwqD5O?=
 =?us-ascii?Q?cvJQxhmncGh7Zw1Gbf7shBLl0Cm/ED0P2v/QfPSUUpLRJsS1YRfOqQj38ZV9?=
 =?us-ascii?Q?5ANZTFa4SpGyp0L0PABzin0r00fcBkIwMaUy4+P+dM9f3Gvbl858l6bxNf8j?=
 =?us-ascii?Q?gdWaWic9b8OuHeHi6VusHTF6V9xDFoNXLHK3OxckN6lf/yEnHkG4j8YYpKUG?=
 =?us-ascii?Q?eEliAvUhcUD/RDWd8es8B246+yFduXAA+fzYwrekUfo7W/MnWyv0XpGRm3sq?=
 =?us-ascii?Q?IofXCUY9aJlwWUOfiRF4QG28C/bnuONMTg+u7Ym+/4qnc6zp7Z0EBHj7Hb2W?=
 =?us-ascii?Q?e2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TM8HM1RItJztakWBKZe4Y2Zno+bKmUBeA7UymjyhGYV9nIfpPty/5rfgm/uU?=
 =?us-ascii?Q?+TvzIFTUsdY0HUyJacPVrOnlv6k1Ph0IhN3RT5kV/fbSPTZwlP/MKyO85v55?=
 =?us-ascii?Q?f/cou7U/j8W16FF+QB9DzdspmPym+GT74zjzmlpwZtmCC4R/gqQR30KIHBdf?=
 =?us-ascii?Q?RNmHuZTlahqrfl8tC51aAc9FrYxwU7KabgrcSTrM2DIdMq5s0y7ZtXVBhPUG?=
 =?us-ascii?Q?FApRSWTT08EFPjerk1T3soQQ5WNFvuwkLLKUJqomta++iiPiDOJxufRNdXhf?=
 =?us-ascii?Q?gaLpuSGLAXmqyYdU5PuqZGGG3/otLxlagFyXD1b6hyo/j4aMXPM/2ZIDFPU9?=
 =?us-ascii?Q?t82Oo5jjG2rMXvxjgwNOGuuugu1fuGG+j4dVV6flWg+EJs/TgatlzKrB5Pk/?=
 =?us-ascii?Q?J7dX7SV4wRjMze4IJ1FPvWOom38IyJCPdl8f5TaOfHQY0MZRUuwROa20Ft/B?=
 =?us-ascii?Q?oWtkfHf8mzVf6ZFzxHzTbe2dpM5nWGm0vRKOf3WUltVwF81QcT2rd4ZrMcsz?=
 =?us-ascii?Q?gbHJ2Qm9ARRv56oDF3XS4IEYeepnUKW22MGvphdY0F0/WKi08EgOaWktJpL6?=
 =?us-ascii?Q?6qLVMRzNy7NCy6OiaCaUkzXqmlylLEBl1JZTDLoBIP+vBJ0qHJBO/qUxV0DE?=
 =?us-ascii?Q?p8guL5uq8X6eVklGqiid2NGIccp9SdT92KgAJXemM9rZpD1TT4zl108D0K9p?=
 =?us-ascii?Q?gUQHsSkPJwcfrvQGiNmX6xBIkrtazyvBB/NifAuonFngTKG2UDOUzqHa49CW?=
 =?us-ascii?Q?AvXmpOuGYvWX+q7ot9euiaH8YWbM0n+B+LSVwEnIhpRvqR5ymKoVnoNBsf4A?=
 =?us-ascii?Q?5KqqUbBoB80zWLVJSmetiucMCfUeEfqr2Nzy1njU20vmZm5P40jI3zuFYowm?=
 =?us-ascii?Q?ZWIftTnLOP41HfPGdTNGD3x540AIhkgFlUCdFzOXiYXD0bdoL+Cngf3MsgbE?=
 =?us-ascii?Q?D+2iCf8Cg94jzLkO3KR8tQeVhFdFPfaVkEeFMuAystfBXomYNLTmfbOYZav4?=
 =?us-ascii?Q?GK/VqWvO9qdu7eD7taDXA6aen9UDLqnhbknMZz6HJlgcPbwj8B+6T0dQ7F6q?=
 =?us-ascii?Q?pSz87OerfNwP97Ev1dWNJv4sl603pT8guywTZKLjhLANfhadXCpjePyPIAuY?=
 =?us-ascii?Q?Sa7+ELD2/49GlWmoltcBRaRjY9qiA4H/OQs2I4XWDitg5Q1Nw2lOK2J9vNj3?=
 =?us-ascii?Q?neA0QWa0u3JDS+nAhIhurvhD6fqGWqmmC5z73n00MNLCa4tBAyatqGpz94I9?=
 =?us-ascii?Q?akapBjt3lttkVOWU+7S+63UQ/7+TLY/Pd8DP1qNlsjkGmyx2aW3IBje1dH/4?=
 =?us-ascii?Q?pbwgYHLQt51Bmm18bfC0AhiSRn+h6OpNsg0Vr4kP4luCAdqK7+fnForLXaUx?=
 =?us-ascii?Q?/y0VWKk2DUQzipYX0yGmOa7mx1c0yVgkyAvSvHdRGZzLbxE9UjyHs7fxCrGX?=
 =?us-ascii?Q?rdTbTWZsUTABUKRwzeb7tpNhpm1W0xGOKq/VVrI+1oNCizxy666JXgBFwbIS?=
 =?us-ascii?Q?4/4AoVYl8KcP5WmKxbVc7Cft5LhNdVgJEf31bTXzJgQ6sO4QQXXP3nh8M5ce?=
 =?us-ascii?Q?w2f83GOJGuFJGSQy++GFAUjOp+eV9aK7m+s2EfwaPcNjjSaJVGpF9+bpiOUm?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a62f7ec2-ba33-4fde-48fc-08dcb23781de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 14:37:45.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9fslSYWB6R66J4U23mSth7P62d3FUIltStwpvNKqBL7Ei5x7XgzY/AWsTypi+6NKAEstI/bQp8Ntqthb2Y3g/r+RpMUePJ4VGYNAYc+MGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
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

On Thu, Aug 01, 2024 at 01:39:18PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/hwmon: Fix PL1 disable flow in xe_hwmon_power_max_write (rev2)
> URL   : https://patchwork.freedesktop.org/series/136756/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d_full -> xe-pw-136756v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): shard-bmg 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136756v2_full:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_content_protection@legacy:
>     - {shard-bmg}:        NOTRUN -> [FAIL][1] +19 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_vblank@wait-forked-hang@pipe-a-dp-2:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-bmg-8/igt@kms_vblank@wait-forked-hang@pipe-a-dp-2.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - {shard-bmg}:        NOTRUN -> [TIMEOUT][3] +5 other tests timeout
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>     - {shard-bmg}:        NOTRUN -> [SKIP][4] +178 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
> 
>   * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][5] +13 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-bmg-6/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136756v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#324])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1033] / [Intel XE#2338])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#306])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#373])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#308])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#1874]) +2 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [FAIL][17] ([Intel XE#1861])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][21] ([Intel XE#616])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#616]) +1 other test fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_plane_cursor@viewport.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#718])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-lnl:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1705]) +1 other test dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#899]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#899]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1126] / [Intel XE#1201])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#261])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][37] -> [TIMEOUT][38] ([Intel XE#1473])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1130] / [Intel XE#1201]) +12 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201]) +51 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#2419])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@xe_oa@polling-small-buf.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          [FAIL][43] ([Intel XE#1426]) -> [PASS][44] +1 other test pass
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][45] ([Intel XE#1426]) -> [PASS][46] +1 other test pass
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][47] ([Intel XE#1874]) -> [PASS][48] +1 other test pass
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
>     - shard-lnl:          [DMESG-FAIL][49] ([Intel XE#324]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          [DMESG-WARN][51] ([Intel XE#324]) -> [PASS][52] +1 other test pass
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [FAIL][53] ([Intel XE#899]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][55] ([Intel XE#1600]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-lnl:          [FAIL][57] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][58] +1 other test pass
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-lnl-4/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][59] ([Intel XE#1358]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-4/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][61] ([Intel XE#1794]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-adlp:         [ABORT][63] ([Intel XE#2310]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Warnings ####
> 
>   * igt@fbdev@nullptr:
>     - shard-dg2-set2:     [SKIP][65] ([Intel XE#2134]) -> [SKIP][66] ([Intel XE#1201] / [Intel XE#2134])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@fbdev@nullptr.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@fbdev@nullptr.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][67] ([Intel XE#1033]) -> [DMESG-WARN][68] ([Intel XE#324])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][69] ([Intel XE#316]) -> [SKIP][70] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][71] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][72] ([Intel XE#316]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][73] ([Intel XE#324]) -> [FAIL][74] ([Intel XE#1204])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][75] ([Intel XE#1231]) -> [DMESG-FAIL][76] ([Intel XE#324])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][77] ([Intel XE#610]) -> [SKIP][78] ([Intel XE#1201] / [Intel XE#610])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][79] ([Intel XE#324]) -> [FAIL][80] ([Intel XE#1242])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][81] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][82] ([Intel XE#1124]) +8 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#1124]) -> [SKIP][84] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#2191]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][87] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][88] ([Intel XE#2191]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#367]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][92] ([Intel XE#367]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#787]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][98] ([Intel XE#1252])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][100] ([Intel XE#787]) +34 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][102] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#1152]) -> [SKIP][104] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#306]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#306])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][108] ([Intel XE#306])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][110] ([Intel XE#373]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#373]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][114] ([Intel XE#307])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][116] ([Intel XE#308]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#308]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#323]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#323])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][122] ([Intel XE#323]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][124] ([Intel XE#1135])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_feature_discovery@psr1.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@busy-flip:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#2423] / [i915#2575]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#2423] / [i915#2575]) +38 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip@busy-flip.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_flip@busy-flip.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#455]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][130] ([Intel XE#651]) +13 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#2351]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#2351]) +11 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#651]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][136] ([Intel XE#658])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][138] ([Intel XE#653]) +18 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#653]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][141] -> [SKIP][142] ([Intel XE#1201]) +48 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][144] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][146] ([Intel XE#498]) +2 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][148] ([Intel XE#2318] / [Intel XE#455]) +5 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][150] ([Intel XE#2318]) +8 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][152] ([Intel XE#1129])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#908]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#908])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][156] ([Intel XE#1489]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1489]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1122]) -> [SKIP][160] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][162] ([Intel XE#929]) +7 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#929]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1149])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][168] ([Intel XE#327])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#327]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][172] ([Intel XE#1729])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][174] ([Intel XE#455]) +5 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-463/igt@kms_vrr@flipline.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#756]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#756])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1123]) -> [SKIP][180] ([Intel XE#1123] / [Intel XE#1201])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1130]) -> [SKIP][182] ([Intel XE#1130] / [Intel XE#1201]) +76 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#288]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][186] ([Intel XE#288]) +12 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#2360]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#2360])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][190] ([Intel XE#2360])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#2229]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#2229])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1192]) -> [SKIP][194] ([Intel XE#1192] / [Intel XE#1201])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][196] ([Intel XE#560])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_media_fill@media-fill.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#512]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#512])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][200] ([Intel XE#2419]) +2 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#2419]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#2419]) +6 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_oa@polling-small-buf.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][204] ([Intel XE#2284])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][206] ([Intel XE#944])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#944]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#944])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d/shard-dg2-432/igt@xe_query@multigpu-query-invalid-query.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/shard-dg2-463/igt@xe_query@multigpu-query-invalid-query.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2332
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2343
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
>   [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2428
>   [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
>   [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/386
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d -> xe-pw-136756v2
> 
>   IGT_7950: 7950
>   xe-1702-8019170840644b0c5a5e64fc6d81792dd2105a2d: 8019170840644b0c5a5e64fc6d81792dd2105a2d
>   xe-pw-136756v2: 136756v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136756v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
