Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59985C3ABC9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 20:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A0710E5ED;
	Tue, 13 May 2025 20:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vb8Kk499";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AEC10E5E3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747169859; x=1778705859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/yzCfc+QXtXaOa9GJy9QTi1xKNS8raUfM/yFj6nPhgk=;
 b=Vb8Kk499lpiJPzMNBffSw3VsQH1I0lT11U/ym5+a3kafLbkHuuD+1f/C
 9UQE+Hv4hHpWCsj4HQbw4VUAjVlXPMwU/YcsWSzxWNueZ5UyPD9n/YTwL
 r5s0chb0Ag06W3DYtlWpuMS+EOx3l1abHw/CE76287C6R+9yMf5bz7M0M
 ogK6nE0/J1L1PPEZGPblR6oGl3fZXhjAa/CIoMTfBriWn4za5zDJg4qw4
 yvNd+Ys8KRZDSKfrmakX5Ac3CB+OPDfS/FFEo0VaKyW6sB/w2z71XMw3I
 a3ny4xdaPa1fGD23rkisZA8eI67yBKEEaTCQjVHfKGc4MnbnimBnGwhzi Q==;
X-CSE-ConnectionGUID: swPEK07NSPyRjRtBa4bvwg==
X-CSE-MsgGUID: SJ9D60A+T1G/B0qQTduk3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="71542945"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="71542945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:57:37 -0700
X-CSE-ConnectionGUID: 1KQbNshhTjeci5RHOg6IWg==
X-CSE-MsgGUID: 9lxhRhTeRjio9JKsriwMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137551403"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 13:57:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 13:57:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 13:57:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 13:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRHVlWjYe6ekNABZUBTHz7qLPwrJgrJzomG5SPXppGQy622jEw4opmPesVkaUn0D1hqq4yUcxHHtUYhw7x1Nq/nTY5jhK29YwVuxUmqljctkcRXMlU5h3zcxzYvuQSu95T74tPUcE5N0Qgg9NMe0uMyOKMYyo8isD8DfTZggviZinVdl7hpGApkBv7OruX+FvEVHU4b46sjwDq/a7lOz1aNBUzSxsO5nYEQr4uOCfWOe367WoxIEDtD3CFPSviwDvLgl/ThAIB5YW4bs8StaRPd2aZeDPOW01uC58YfksFZPMB/+cgjJd3QWb+yP7w3KblAo+zXOdas4tCG1kRDu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2TRiCsOZ1mCj4FZz50OuSPsV/aR7o9SLnXZrgkUtoI=;
 b=DCSDt4FSRE0LMutIW/QuuROnQm2IWK8jfkXVKKh9nri3ZQsbAnnOl9kD3b54H0FACiXjvoxnNHExTlMhWrmjGfaW3WHNhEEL2/ozgD/HDLh4kS8Bbru53Srg3y15kgPzEDeD1wqCXgE4c7T7hwYm11EWZi0vUeuiMuaszS0/09XnsUmgR6hcoUPbWrsub849z5KCSYR5ydIdr3g3z973AvjOOnWjcOQg68u6VKiY7D3JeEih0Z/dSZ1TyQ1nzF2ha3gEZAd0wIa9r834GNxDkZ43KGubqKDR/iB+qkw0z9Hz50x2Kp/0VxiTxb+LzZkluRiYcuTe2KUCm6p3jheb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPFE70B31BEF.namprd11.prod.outlook.com (2603:10b6:f:fc02::5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 20:57:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Tue, 13 May 2025
 20:57:05 +0000
Date: Tue, 13 May 2025 15:57:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc: Unblock GuC buffer cache for all modes
Message-ID: <yudo5sent6vc64goxvqrg45e3pio3h6s2kbkr5qr3wvuovdfbe@t6zpw4ivveyi>
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
 <20250512220018.172-2-michal.wajdeczko@intel.com>
 <aCJyKEpaPHvz/noD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aCJyKEpaPHvz/noD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPFE70B31BEF:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edb7741-1643-4165-6d99-08dd9260b7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPMRR8/mI0w1R5eub8xVlD5Xg/k7uHmufEOfP38SZDuI/De3KuuiFKZgC2AB?=
 =?us-ascii?Q?82e6QoXzNpQnFCnTt5IYSNo/zXJVEW59CaOh9gAR3Ua5tl8ZgOePd8RIlkN9?=
 =?us-ascii?Q?7zF0q8z74TpsB7teHFmzUbzn09rsohmfBoQTXx/FgIW6I5fkzQ1L5PvA+KbV?=
 =?us-ascii?Q?aBk6WFIac+oYggUi4P7yYfofVbyASFDenz2bG6+a8GmBqxheZqZ5bWF8UYIu?=
 =?us-ascii?Q?bGWoEfBnTMCOWH8BC4alf7aR2KvyGr8sKSF0d7oNMrMKFl9INL9vmghNw6kL?=
 =?us-ascii?Q?HXe6ogf+LzUKFnvtSw3Vl77LlCR15Db0FBumfMArZPaSjg1kE9YJoSshhMaJ?=
 =?us-ascii?Q?Be+5tpJdZSACTw9047cJ9hDKRKLlLZy8O/qvkfiuGpb21JEOdnW+oVS6BlZT?=
 =?us-ascii?Q?q+6G59BXvRx6OsACBuyiwJG1Pz98UfPV0WPQJQ3lT62q+BR6wednYCjRWdr9?=
 =?us-ascii?Q?1Hu/dlFbCtyjnHxhoL/nMkzfd/Gs/MZITGm85/b34o3Jto2OHUgViDzlGJFp?=
 =?us-ascii?Q?Afxye/o5EoDRo1a2FeFZyUBqOVK92XdvrOibjzB12ARYpTc1evpeifdFSSCV?=
 =?us-ascii?Q?nTczWwse7hoWvKf59cWWyNI49C6IohqpSrbpRaGxwGp8CTmRYOOu+2MYqhcU?=
 =?us-ascii?Q?jXD+DC3mlhoOUqP3v0Zbr9VVc5WCHw81jp53v+p/xRiW41Qrzp/HJ6muk/a6?=
 =?us-ascii?Q?9BE97SOr0aEVOcLk2Z+CKq641lPwZPetA/Xe6A+dfaobM5dL4tUuZZAvN3Il?=
 =?us-ascii?Q?AVvzpjoQKJG7qz9Osna16qROBm82oMeqCazcQX7qM+ZPgqo8RTiR4WMj58RK?=
 =?us-ascii?Q?E8V46C8lnqrm/RApuwQUkBXom72V3ZU1nfc2Wf0xbAJjV11qHU9O+z0ZW11Y?=
 =?us-ascii?Q?gT2bITlzk76Mqb5vIPIYZuMIUzjDQCAXxibuoaEMWxGRdIdBmcIJVS0bMx3Z?=
 =?us-ascii?Q?aQO4XZdQ8E9Mu4gIltqpIaf5TSYBj3lWvJcX6uNCGD/yLczwJshGcgkkE7on?=
 =?us-ascii?Q?+upPe3fUVWfiYllwyKF+PyyRJWj+FxLH3d6TfuUpZmWNEIugAQf/40DnXmGC?=
 =?us-ascii?Q?NPzbCmezMFtGiC2Tqfo8fh2KVXawlKuM1bdzPxWP3K0J+R1zn8fwlVZa5uXs?=
 =?us-ascii?Q?C7sD8agUdGHD0VqUraaxj7XFc6HxN/UpuZ78wDC/4I0ueLjww1sNH+SC4L0e?=
 =?us-ascii?Q?0iwnStQ2p/NZ1SIFbQ0MGDjrPZvkCTdyPHClg0TtYw1x/CSHfXcFb2l9jVXl?=
 =?us-ascii?Q?cWYF9czejQ+iCdl0/O8tZTGqZtg0LlF6p7k7JVsUKQbxRl3Y/kJKH6SlAk2x?=
 =?us-ascii?Q?zQZvE+OlFTko6+rcBa0fn2R7Cf1QSL1B7SoFoWI5D303rRNqEcfswzNkcFZa?=
 =?us-ascii?Q?kI30YAtFeSwhpdMcT8ae9PoYsJ5ITDBBvpVLoBiRsJlqZLhU4Z/ySPJZAPBe?=
 =?us-ascii?Q?vML9U7nNxn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bTrLrT+Z3ryVe/CyFCdsjIZ6zaMl1mCu+Xon4cYYbIDonB2pTH6FbfYxNy/q?=
 =?us-ascii?Q?VZ2T044/Aa2xL/kT7lpaL7tj+l6YkTomDziOfVt8MCTfMtAoWdzZ7LaB1S+r?=
 =?us-ascii?Q?CR+1DLlGIluVI2NM6jg0mXGi4XxekjbcDxZBi4cdjeIyscyML/Ho6AuUV2+p?=
 =?us-ascii?Q?XYbbZoq60kiYjd4kG5+5KFSwvghooSxbXIn2ajOyj/+6UfhXwMt8KdkwknyU?=
 =?us-ascii?Q?5mTbQqbWfopJLB4t6kbwPN0MdVuyL5M/q7F/G8Pxis655xV2tB5LLuz5uMDY?=
 =?us-ascii?Q?qn7IHVkwU6blBoq1L/O4712rC1OrDfps/7U3BOrJbe/YQ2dMNcaYj/A+DifX?=
 =?us-ascii?Q?AFlq+XR++pdrEgvvSd4shSDl154TvWZs7X/HS2D/Hc1EVM9cYQ8ezE8cpfJa?=
 =?us-ascii?Q?X/Cb3EWDcSb2Z3GAr3iJ5ZegDHyNcnfI3ucZ8FJUn9nBYpMagHBf3C1EsfmG?=
 =?us-ascii?Q?H9A3lnOItHGiYRmE15DFt4ZVbiJZgFxEAOEmcTn6wXWwSJ7n0dDt3y/9ard8?=
 =?us-ascii?Q?owXcyJI3CbTR4wRYwuljTms7d1PTy1ktheHotBqeXhtNFlDZd09SoGvPolBa?=
 =?us-ascii?Q?pvK20CNHGZgRYVf1z4Std2GwqJyebgKVXJpnBr2b/LY7nFANm4ayNgahJarJ?=
 =?us-ascii?Q?ynDKCsSIr3azEg0M6b4WdsyPDcHejDp8KyGOcHuKuWG+sIPEMb7IaWbrIgYG?=
 =?us-ascii?Q?FnrnRU1DVOxgA06PDgOEfI2lo0Sk5xR2IK1bdkx+/V4SC7h9kWR4ygjmQ4j7?=
 =?us-ascii?Q?bP21gPhw3CBHdynP6d6EzNLglZHUYsNava1nVKM1AQFXPS+c9KF1ANhtyZQ8?=
 =?us-ascii?Q?mSRCij+WySxReCBpsWWvddiKHnI+ag5MExVdmuFfJ3zdMbjJtba47ZPFDvxO?=
 =?us-ascii?Q?flFtgk2e3sPeWTp5T8E+XQpa3LA743fmz46PbeQiGfj+eGTmTHCJ2zTPjArA?=
 =?us-ascii?Q?VgS3SffQ8B4edy1AXgI/aaeLGSAhZ3ZXcjkGXp9XJ9aWaUtYkw0GOLigu2kS?=
 =?us-ascii?Q?eI5HNTnxs7HWojlZGwIuJFSbIEgxbgC/9TWY8vqATzqWzwcHGPYVD19p0qjt?=
 =?us-ascii?Q?f1WvlGpYdOvndALZVd8Gw4z1vCpkIVr4TmlR8g7ZCy++QGCzLRLbhnz3pPDP?=
 =?us-ascii?Q?opo0X33DzyHXhHXTzgNmLh4lBOWlnQmICmJFt5u9oHXBlZh45Bj0Gxmiyqbg?=
 =?us-ascii?Q?rVsUQr10xIzf29BeACIridRn9jwzTtWP+ACuZ4emY7cubpoUxI6YcH2//npO?=
 =?us-ascii?Q?FrhxU1nnoIYgHTpN8miAeAYizz0t6oVMtH8mBD3LtsHKPQDWWKrBiIwNDBq/?=
 =?us-ascii?Q?b+QOzWCnbMa/KUoAZOsJ5VS5jXBp8jPJruTTvjZz6R07cX6FxuLWDfTAPdYi?=
 =?us-ascii?Q?8pEHt6MPwuuzTQzPs9pYAXuGgtW2jCtQ1VelmUk/26MxhvuJGPsPsUzHnyjQ?=
 =?us-ascii?Q?l3JEnemkwok/W2o4D/R/GiQsCleNX3WNRX8OkMPdULSmmv4s4suMnWtOr5M+?=
 =?us-ascii?Q?k3kzeQA5tBJy9u1Ja3j48ZQJauv1a9LVA8tUS7O9QPsG8t8l8qOZwstCAmi/?=
 =?us-ascii?Q?ArgLoGwi9uu1ohIWjmTCFA/S8yq++VIRviQMPbbW3ch9WULbh1v3EKYajbGv?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edb7741-1643-4165-6d99-08dd9260b7ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:57:05.4181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBY+4GGaLG7uVQLM6RtdyY7GcbPw3on/1JGRfFH0af2DdJ2hyVFSqpWCeB2zyi9U+Jd8IYp1SvEzsKrfkWPZmYl5y4swqGQxeGKDPRF0+i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE70B31BEF
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

On Mon, May 12, 2025 at 03:11:52PM -0700, Matthew Brost wrote:
>On Tue, May 13, 2025 at 12:00:17AM +0200, Michal Wajdeczko wrote:
>> Today we were using GuC buffer cache only in the PF mode, but
>> shortly we will want to use it also in native and VF mode.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>Should we mark these patches as fixes? A malicious user could consume
>all the VRAM on the device by changing wedged mode via debugfs enough
>times...

allowing the user hang the entire gpu by setting wedged_mode and then
saying it's a malicious user that could consume the entire vram
is odd. The entire gpu already belongs to that user by letting it play
with wedged_mode. We can backport it, but given it's wedged_mode and via
debugfs only, I don't think it's super important.

I took a look on what it'd be needed to go back to 6.12 and it would
require not only 696bfdf273ea ("drm/xe/guc: Introduce the GuC Buffer Cache"),
but also 5994018ecffc ("drm/xe/guc: Fix sizeof(32) typo") and
ae8b507fb8bb ("drm/xe/sa: Allow creating suballocator with custom guard
size") and even that may not be sufficient. It's a lot of new feature to
backport and with a chance of introducing a real bug when doing so. It's
a snowball and IMO not worth it.

Lucas De Marchi

>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c     | 4 ++++
>>  drivers/gpu/drm/xe/xe_guc_buf.c | 4 ----
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index bac5471a1a78..350434a8b953 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -710,6 +710,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>  	if (err)
>>  		return err;
>>
>> +	err = xe_guc_buf_cache_init(&guc->buf);
>> +	if (err)
>> +		return err;
>> +
>>  	/* XXX xe_guc_db_mgr_init not needed for now */
>>
>>  	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
>> index 0193c94dd6a0..14a07dca48e7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
>> @@ -37,10 +37,6 @@ int xe_guc_buf_cache_init(struct xe_guc_buf_cache *cache)
>>  	struct xe_gt *gt = cache_to_gt(cache);
>>  	struct xe_sa_manager *sam;
>>
>> -	/* XXX: currently it's useful only for the PF actions */
>> -	if (!IS_SRIOV_PF(gt_to_xe(gt)))
>> -		return 0;
>> -
>>  	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), SZ_8K, 0, sizeof(u32));
>>  	if (IS_ERR(sam))
>>  		return PTR_ERR(sam);
>> --
>> 2.47.1
>>
