Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E70CCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 21:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9D510E853;
	Wed, 22 Oct 2025 21:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INZSvKL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E7710E853
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 21:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761168161; x=1792704161;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n/VtOQtbYsWpZDhTqToe2Z4VW+na8y2hYfT2DB/TXGM=;
 b=INZSvKL9bgu5EvRN46W/xXwSOuCtbPDNautRCJUK6t/3T6OAramBdhv5
 rfAkKFRkDmASZmA+1pCv1mRyEzv42gfTc5KpMeAUP+i3naOCanF5WuKY8
 jqSJ04GhaNGy2L3O8J6wMRnVziqImj24kihjly2LwKUWknRZCMTSC8Xw3
 hOgP8XgGCMUGQdKT2yvQ0KDaM/c3n9cmo/C+4EdpSMOiWWEq1Or3NYDtn
 ULaONIGCu79reWkJuh0C2kZ//ofuRJVgWy+3WN5wlsmaZ4/bjh+bL6C3T
 6+WP6iaIC6BhIQj/jxm8NfaRCiV0sIB7tb51PAU5233Bumeye4gN46Ddx A==;
X-CSE-ConnectionGUID: +2F2n4DpQsKuNumbYlJmZA==
X-CSE-MsgGUID: 4s0GadXJSNSuVviZWRzsgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66971981"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="66971981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:22:40 -0700
X-CSE-ConnectionGUID: cSdjeHOnTGCocn/D/2jmcw==
X-CSE-MsgGUID: mQw+LZHDQ/qX/j8mNSZOAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183916771"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:22:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 14:22:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 14:22:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 14:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t22cAKA97N/YJCopt1oUKetA4jm5v3tdRMmdfXEGwGYnyw2bAz7op22Q++1H27bffknrCvjf4eSzRlQn8wNw0f+AUWyYvCKd8IJAOABZM2NRomCp6j6Mj3jCHuicuRjPvV9JHzAgZHM+x1EVSI83S1rjZjc9HG1QhyzCPFsmsWLoNAxK14m2nPfDOQm/bjdk86G3ZGn1DFGMjK3VwAhtI/VQi9uJSITbZQ4Lr6+/1WlBcmqajdGSOEyfx20dnO1IGo7bw8k92xFmVw8U/2KHsXUxWIRqOEBwbDv5dUVdXNpLjGDQoIB4KEi5ZI/5I/U6Tt/QWFzwfbhsIVbPVegTeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/VtOQtbYsWpZDhTqToe2Z4VW+na8y2hYfT2DB/TXGM=;
 b=fX8KB2Jn9cXE8nNCJ7TFxfgR77kM0mpSgqme5QhVq01vNczkKsiiGRXZUQ2Lwoue52PDci/aTtiZc1fFZRh/j515Q/iPp5FQOCHCkeix61SkzhuSdzM58n6P4wy8V9HFqxnGjnoomrnj5bEP3pTa0z/ZXpuiBo99S0hzbLpBGcD19StAI6uly/PtZYV01pG9VdwBqaZClLsvyM6sbjcEQ/PtkPctyYWAy1EyeeEQVz5VBYyuSe/D2AQQyK/qDWN6t0OrnezOKIssJTlsyMeYecPE77wFvDcRgbkCTXnf2v7f2QZXMvxk6fILOq2H2MNg3Wxok7aenKDzQLFwXWpfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 21:22:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 21:22:37 +0000
Date: Wed, 22 Oct 2025 16:22:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/12] drm/xe/cri: Add new performance limit reasons bits
Message-ID: <dnwbzcvllnbgzsetw4hzwe6t7uo5tlcww2ks3yfbbldnnvgrg7@y323rbzzffll>
References: <20251021-cri-v1-4-bf11e61d9f49@intel.com>
 <aPh6S_8bv345QPR0@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aPh6S_8bv345QPR0@black.igk.intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: e61065fc-530c-42d2-16c7-08de11b11fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CBafQCywrXWWOdlvFL85B/BMqn6v//otfGFZeTubZLvRmbmYYyGO34g4PrmT?=
 =?us-ascii?Q?PiSU0hjCyji5j2h33ky6d7EHG9wWt1qu6mBF1aiK677F2GRsaAtcgPkRxol3?=
 =?us-ascii?Q?0yrrvv4yx1XRA1eLpJuJbs4q6MjIgR0eT2FnL2rD7Kk+uzVb+FXsI8yMOYGo?=
 =?us-ascii?Q?JjaJSmC12Iw2AKtgbBA4YAsKFsKxyvmSmEmmUu62ynmSNcgBtypPJ6KiR5sn?=
 =?us-ascii?Q?e5KCFh67BjKTwuydFyVFgy6PnbdW2PjtZv0B+8JsUeljAyyZNCAQT4mbauih?=
 =?us-ascii?Q?LF1e9X7KWDnN+RIckxGJqF8IyFZP4XPw5VnWRumNmrlyhHrQ9atjv0S/MTAI?=
 =?us-ascii?Q?pGFsWJql/tCWl3nwtr7nku+l2LEWB2/ry5DqgqmSzcAujQi29cNT5x8WWzdr?=
 =?us-ascii?Q?oDnAoGI3XNg5SH0WVStdKBWrsM4kSTCXtSS7UgZWelGlbu9tcGsuJ52CAiO7?=
 =?us-ascii?Q?Y4t/EjA1Fi5cxm2srJiKPdZLyxmTTGOQbAHstRVQwwyLVhezmq+RqE4DCpNd?=
 =?us-ascii?Q?So6AeMWCPzVEx6VgnzgJnrp7FGRWDPovD7/T7FHcfRYvDQo0YtiveRPY2nfJ?=
 =?us-ascii?Q?JSNrymjzEnD8iMrYjy8jJ6eX74a7cNl5+N+nFNzpNLTaYU4dpLQAp4EKo1YZ?=
 =?us-ascii?Q?E3pzfMBT/xrORZSQNo5wxsrTsG6W/F0XcypRfhiC9YshL4FXPTa0coh4HVUA?=
 =?us-ascii?Q?QijyOck1CQcsTSO8aTw/w86TGXHQFRDe+O1PQrgd1Y/NYeG3TNKQc7FKW51j?=
 =?us-ascii?Q?Rgxb0qkOnUTtrE431Hzp0Xq9M9WkNE/ahDzyqXgKFN6jklz9+k79eMoh3pG7?=
 =?us-ascii?Q?B927fSzkzmQQgTg3uJbuKYt3VVdBgiWLqkcwOCL6Q0ItiEWR0qZwyX4c2AKk?=
 =?us-ascii?Q?7kvhVvNVeXCd67jh0sI88dMX7fP4lopQ1GGThaVZDjGZv5cU7qhgtvYws03k?=
 =?us-ascii?Q?XarGk+P7kfmXQ74wqtevURa7vt2OTQHpEmNnK0J3WcJG1d3rWzbeRir6TYOy?=
 =?us-ascii?Q?dCQHH7NIllIvVP6MrOmBwtPLZkYdVMMYaXHzxjx6ACj4jUAhevwxHwsusxMm?=
 =?us-ascii?Q?6kjOl1KiM3ndpw/PnFxSuS2VSL+2RpHOrAii33ToNjU2iXdpOYJaGC/rVNFF?=
 =?us-ascii?Q?HUSfxZNATGQD4rdCNL6l9Gothv6DQ/zPZROHLyIZf8tLDRgbZ9GqqLYigzPO?=
 =?us-ascii?Q?OOAr52ZxuduNs4EUTlipTRrI8ssfeLSln1ahVUnIHDjFxr5VXiJUQObPCIfu?=
 =?us-ascii?Q?IJFXjNMhkZ9z1bZylUQvnRbtSJGbY/wvmka2FCjvRjTKaftv5hcW+PmaYQnZ?=
 =?us-ascii?Q?1In5HOim7qH9JqsSBy0CctDbaqLmsbxRdjLQSuIH/l6mXZA+w4zQIgL21Q8C?=
 =?us-ascii?Q?DRskin3nK+he72wC/DoTYJ/hWp/FRgRdx2a5Fkxe87pdEmkR22l/bjjBzjWm?=
 =?us-ascii?Q?KDsT+Qf5q/dmp8GDyM9ka0Ejf6+krnJV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xy4rxXZ3knkMTZrQfnGPR7g6OmM8wzregK9SfvEMe4FS8LYFfJa3HanWQzHE?=
 =?us-ascii?Q?4V1T8qfaJtbFX6u5VOdLbItHO9TBkG41EZGz0YTsTwyjcEaVk8xYlUm4qYD2?=
 =?us-ascii?Q?RU12TKiyGSN1t0my5bjOE6Of9H1ihq25ogNnDo2RFztZHdoL7KSzWkFe1OLO?=
 =?us-ascii?Q?S+IBxA61+8T5JejenxH3GPjc3Xk7LjrcubEE9gP6vNbhKBgPxRChkwv4XmmA?=
 =?us-ascii?Q?PEdHVb6P/DTgWl7xNv3nJMUHS8IcZPCcWRkOJyY4asurveINWLzZAu+7OBa6?=
 =?us-ascii?Q?cckpwC6gjaDAPD57e7cyPMOqT+L7d+FS4IaRikp5FEbr8NW2aXtoCs1D50CE?=
 =?us-ascii?Q?5DtQL/stokGUBfVgMSAL9rHRvv3RW0avv5DTRr2p2uV3DLB31NxU3zF51ELf?=
 =?us-ascii?Q?4TLSpr0KjL5M5pzr5VVKbFOQT2JVHShsVRkFQcgJqlhRNWhK6qUMwRI5mDdT?=
 =?us-ascii?Q?FoOTn6sg3j7xpzFzYkhDWv/i/eLHoE0qZjhO/eqAkdCVgu1JT5UfHQepnLoB?=
 =?us-ascii?Q?kUfEI+KhKKawfji7qGsd0DsiZWiDrBIFeaIKYc5POvmXlaYQwFipvPZI05bI?=
 =?us-ascii?Q?ZSyY/mnYaQcM7c4he5yhuBsLeAFF4NdWM+JoOkiOr9MPgmztu0F1fYcd+Vfg?=
 =?us-ascii?Q?Lo69im4yij3QlWxaRWEwNcO4pPeCNbNcGC0qHRyObDo5GV/acVY4sB5yJz0X?=
 =?us-ascii?Q?awCYu4r6dGrt6hBIcTzILOPExJUw2Va4sBDvLAUlY2qZEhgYEZOt1IySDV6h?=
 =?us-ascii?Q?wplfPrHB0c+kZlseEmZUmlJoN6xXlnFVTZBQzsyPlCN7UZY0Zq95zke5TKDQ?=
 =?us-ascii?Q?mMimhRKrEwy0eBpcrjHeiehalBk8OAUem3WGKS7eTP6Oz9YJ3c6+LQfMwFk6?=
 =?us-ascii?Q?y2ZQat2BPIEqr4c0qKQ7BBFm09rBxTI7HO6GIlTQGWbpUdDHpFIkCR3g6GSl?=
 =?us-ascii?Q?frJSdHxgP9jP6117deTn2LxC6c3iWjrMw/cqwmMs9h03x7UzUkrdW7zlh17P?=
 =?us-ascii?Q?ZREXhK3wqg2zqSO59jAPkicqctl0dp1b/loD9Kg5MnHfYhJVuLvIoJnLr5Bp?=
 =?us-ascii?Q?w409C5mKiUFjqWl8rh5ymMT1/ZYJOJ/TASZtkm1X9GolpXbtSA0EB23ywIDf?=
 =?us-ascii?Q?G7M/Sqj3eYTuXekA3EVN1Tju9aqFw7GmPSkE0gDHrWD/haT+CYaGEPXZv05F?=
 =?us-ascii?Q?SlirMxPN82omg5Z8AiedkXJJiYVnHfSaL9T+OMJ7uuDLWKC4eWlfpLbo5jtX?=
 =?us-ascii?Q?ga4yhHdjrZ9t6YBJVKL09356kj/pSGtUw5f9jaqU8hxMsu2pOaXBcPRr3dHz?=
 =?us-ascii?Q?2yf3BcNL4+AKuKXDOAjhdyHfZYjZ5/OzZB/EMmUAf/LdBj7ZMPGBI4rE9/4+?=
 =?us-ascii?Q?ZupcsB/cevAYPx+nqRIcFc6pgjh1tl/B5XGVc68By6QF/a2EhLDRvdBPcD8F?=
 =?us-ascii?Q?X/cTZPp67Pe9Y8swStOClNGDPedrx604AvWi05NsKZT6WK+/yp03e7AapQAe?=
 =?us-ascii?Q?TYZKQgLc19kaJQX/dAXcRKFTC1NeBCsLAH4Yv9N80hRlnly4CcVL0mqTVjVS?=
 =?us-ascii?Q?vhqDr2yMAWMHMaMHiW2dUdw5KIAivRTH8JYjoJd9n7Ksd9nsFmZZz64RtFom?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e61065fc-530c-42d2-16c7-08de11b11fa0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 21:22:37.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNsqebO2WCVyutJDCM68hJF+nfjAUJMkwOEdJcTTK5eCmwfNR8L+LTPTUSZLW+VCkqzIMsuKKR9d1VslO9IOwf8z5rxNMxktLogNtdQONa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
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

On Wed, Oct 22, 2025 at 08:31:39AM +0200, Raag Jadav wrote:
>On Tue, Oct 21, 2025 at 10:17:36PM -0700, Sk Anirban wrote:
>> Add support for additional performance limit reasons in
>> GT0_PERF_LIMIT_REASONS register.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>> There are some improvements to be made here before applying to reduce
>> the amount of code for one platform. I plan to take a look on that for
>> v2.
>
>Yes, I had planned this but there were some concerns related to backporting
>(in case there arises such a requirement). I'll leave the final call to you.

Not sure for what version it would be backported. It would certainly not
be a clean backport due to other parts of the code. Also, if we do the
cleanup as soon as we notice it will be needed, then hopefully the
kernel version will be already old enough that the other parts on top
apply cleanly. However, since now adding the refactor before the
CRI-specific part would only make it harder to apply, I will do some
minimal cleanup squashed in this patch and tidy up things on top.

thanks
Lucas De Marchi

>
>Raag
>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
