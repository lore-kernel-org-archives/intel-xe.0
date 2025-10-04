Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10077CAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 04:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF95410E00F;
	Sat,  4 Oct 2025 04:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2tcKAYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A46110E00F
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759552365; x=1791088365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ksVfbsW/gRh2v7Va0TLuIFsCR9FTeVnBrhuwYsTlwl4=;
 b=E2tcKAYUPos5/T3zFmzPs+3wdc18eb8Q//k7+FyOTKTcA7EN4rJz0ANQ
 EoEgGfq5iSvLGlvuep/Ds7EqkjKPJh97JXWIiyXRsiq2fRlaL0bSSgK3N
 NC8Ryu8CqB0LDDezMsINs1+5hB4HWcnB3bVgwPQvvewKkK4nuDr/4vt/a
 ECY1aj988jRSwzzO5ZJvX9XT0+6Y6JRjiHw+5QN8o26zboT66gJB813wB
 2I98Bl/9FopSpFQAvjE/PL1h0PcBPbPWDWi+pJwJScmPSXl8agZ8M1rUR
 ZKcLSr+d3B0EVxspXB0+E0gPDF6eutPPj8VKjttekk4bddCBfB05JAAet g==;
X-CSE-ConnectionGUID: oHJaHkixQaq7L3jLEC4rYQ==
X-CSE-MsgGUID: MuIcapJnRU2rL96ZY+rTaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61994076"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="61994076"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:32:44 -0700
X-CSE-ConnectionGUID: 1+pTF1NvRNyWJPHsz28Xuw==
X-CSE-MsgGUID: AAnpR6QTT3uWGngcMb6jjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="179870224"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 21:32:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:32:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 21:32:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 21:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1IxlDmKaUW2g6lw42r+AWebcqcQ3c7byAS01pRQiFsngtTeBs3+ePq4J8XOOAparD0eFwm7mfImXLrVZ8scGdycN0H8C9B9TvwQmi0eNH29YZH+/SnBzzFz2iiG5Rsem7M/tIz51usOm+tYVrTotRMlJ+vkLj42mDSMJ3nOwaeZ7dUqwcz+8qkuwvp8QYQZshyhnhD4iB+yV7mMdtDKFlip3ZXahF//u4iX8/omgF0EWDXeRkxTWnqBX4U57mZafsR3cc3FQYzdNuHZRvm6h3NajsSnpRvNw8WaUM6g8qhWJh2dhkEZx4HEyy5uvl7Hi7wRswaiaAofwkeIsEg0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PzUJUafsWD2Pbd+eHrO8NnC5jo6XgdKkPuI+1BY07I=;
 b=VZtu0z2oECk+dGU0GLaTy6u9jCDVABhX6r/z1OSMQVKjTkdnqxDsrDUnyigTkqkoYCsURGW8BJasucGNN1iZ+9EoADnyjAgGsBp0R8pTswbXazj5bvkd8/hmSm+3RVKMYNPwoSktxDAAoLwm93JNpl+CxIc0YdrWEv6FuPAYtStnTrd4rqwsU7Q5+/w9haijT8C4roFB22sh27CZY7ZevWoHzniDxOvyrorlRv2FlC7nPkPErlU4wIp0EOQp5NZNgRRKFlBgm0UY/vdl7bxJzpGkNSzdPFprGQd6Txsj7o36GYy1kAB7jbM0/kbhrgs6XQ7Xw1wXTEgnaW9nAo7tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Sat, 4 Oct
 2025 04:32:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.017; Sat, 4 Oct 2025
 04:32:36 +0000
Date: Fri, 3 Oct 2025 21:32:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/34] drm/xe/vf: Add xe_gt_recovery_inprogress helper
Message-ID: <aOCjYV/o5qdJLOY5@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-12-matthew.brost@intel.com>
 <e7a0d5c0-34a1-43f0-9363-f0b721f3a91b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e7a0d5c0-34a1-43f0-9363-f0b721f3a91b@intel.com>
X-ClientProxiedBy: MW4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:303:16d::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 333b47b7-703e-4d2b-d7c9-08de02ff0b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jkwZKPq6NNnp5knpBh1yPemFCgXWsfJzcFRR2V9cjPki4EMg6JQXl2z63mMb?=
 =?us-ascii?Q?cEF53D8phQDjZ8r88cmjv6ooqu0UVJqhDu+qbl+QDcSxNBTdLIw3ifzhjXX+?=
 =?us-ascii?Q?Lgt8WILiRDntRkd5X5PJ0RuehliVHUR25HSgZ6lI147+eS2OVRFrPhVdgOXe?=
 =?us-ascii?Q?LYiWrLnyCQpXnKYvVfyX2J0AFxAZdm2sXOclffmRQevFNw0YjNuKEWq8SFn/?=
 =?us-ascii?Q?tssbKz0RJxzdE+JiWOyuAyYQJB4tJG/vlFLC0e0B5KMErgCNIKBh/KHj4xfi?=
 =?us-ascii?Q?27tHfBvFjcvS9lFHl7KhobsHu5ZpHgzUNf2oRUWNvgtj0uTVJ3QecndhzeAY?=
 =?us-ascii?Q?+HORS8frAUFZXuRvGH7FqQG6g3zbz4PewL+cTHJbb/bOQdGlAsseAnmr5zDe?=
 =?us-ascii?Q?AVBe1RC9IDX/yZD4ua2pViPnW5AYI+mIqGhDfiz9jiZPBTUM0MnmI0L3wpsm?=
 =?us-ascii?Q?uHLtSu6jqsnOJtKoAz4p35p35GRkI6ae2+Rkldb2NWhheFi79BVoSHDCgo0V?=
 =?us-ascii?Q?aywn7qaj6zfi8Bw6CUZTlW0SlT7lY7Smw7y3F5HyMGlXSuxEIQ8hl7HQUUqZ?=
 =?us-ascii?Q?pTG9ivz1ivySPBpoLbcurCHHmH0NNcPhNv3fmHecn+AKn6FwObzLWt20sQuk?=
 =?us-ascii?Q?c9nAyRYbiJD/4kek9RRamavmngDKNtpSbC3FD5XQYID95hv77VxlA3m3WCVR?=
 =?us-ascii?Q?p2YJYCaPhh1LrRtKlX/glKKwi1p+2FZNPITmTD/Z9DR8SdH8YcmmhuOr70+7?=
 =?us-ascii?Q?JSwiDcfNt9LHfOuL+G1nLNehNhzhU8kkBi2MegY4S8s+f8xr/Jl7k8BJiCcX?=
 =?us-ascii?Q?97D/q7OSa5fYopiBrpBw/P8WrVSPqahO+4xeoQxvYvh3yhDK62zgeeiusRT6?=
 =?us-ascii?Q?RG6FN9rPgYKRt4zMfQDzbcbQYpmNsmz7oY4cFugh6YtgUCORj8P4AZ2iMtou?=
 =?us-ascii?Q?sbNPSc0IbaFtlonlDC+LWRdt9shbznEFoXKy5I7+Ry+VcEec/R7Rxz0jaPA4?=
 =?us-ascii?Q?n3t7ZD4iEak3xQQ4V8UeByviOnU6RTieG2yaez+boZGRAOijuCpsNO/gCpX3?=
 =?us-ascii?Q?w3mRlXaEaShHKBJgH8c+DuRRFbLKVMz3NWswfB2L0cKQgjlrZsiJUOw8OL0Q?=
 =?us-ascii?Q?cymqlDTv57rsO4PmDyawWUdhJiNUgarQYrPwIU321jW4rMWyfApingFN0X/i?=
 =?us-ascii?Q?V+72KYbS9G4ycCbKiEfT0pNy0gjpAq73QwTwSHoocIquJ1Q7zp8/54H3NAM/?=
 =?us-ascii?Q?m3ISSlqnw2gTuVewgWJ36ronUpiID5LV0RxqQq60hAWKXQr2MPGxqMZTnlM1?=
 =?us-ascii?Q?mLiUF0UqqT7ZT9ehql7AmliOpMm16jPhQ2lcY12Y4w09JZQ9JfMDIebPuw9e?=
 =?us-ascii?Q?HIWJ3eTKhuz1eh+rd9Y9eyohfgA9K+fF2bljdRG8LKnZSYaClQckDZitNIG0?=
 =?us-ascii?Q?pBqoPT5XUfLj7iOIGmA7Zy7nuso+20y/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YxJtblGakqdk1kpIBxCGES18SkGg2ShLPwjAyc1ymxSOoR4xg8BdRX1T47AY?=
 =?us-ascii?Q?lCXQKtHnAU88baJ0Cd8J8nATfdw7wkzgoGnnwgano84Nvrv19f5PcJexKTyK?=
 =?us-ascii?Q?YiWaHyU3afhMEzy6WLCX5TSA0Xrho0sVP6xVpnXaCvFqEKcmCABLZJGZ5Hov?=
 =?us-ascii?Q?Yh0n+4CmFns+feZcSfeYpBF1jsaFhTPoXfpDkoZslkcr5KYCHo2DBm6CrBt+?=
 =?us-ascii?Q?nJyg4vwf7BAdDvYNuPnT8fbwrba70oJOjHFnc6UpDFdQ0ogK9Lr6B782hU4E?=
 =?us-ascii?Q?7/wI8eCnjdXTvMWAZqfpMQPEVuvQUMrTjJd6tNV//Ne74Of7GJOBffodbPh/?=
 =?us-ascii?Q?On4vpBuuMS6/1ZnNLVRPfEuwn0u/YmD7FvdBI3vJBc47mEnpjwsoSW5DulHy?=
 =?us-ascii?Q?qKfPrN3ZIZ7GHfjGeRwY5mec+oAk+L/HtBQ3T8DnBxdiMYVZDisQNqwc+t+M?=
 =?us-ascii?Q?KsL6ptbtMLsgkDPeWhRoxHyWxRjyj5Ekur831aYsVL9C82B3sqg1UdOcj+Wx?=
 =?us-ascii?Q?nzeKIQsehLyNixbaTFfgynfwolx07C7SlXwNsZqcy9hs4G5mm8DAmEdDFkdT?=
 =?us-ascii?Q?uNsjzYbIuYe/qdrHZGg3cbLfRKnFarGMdeiQcgnvWKVb7GUiED1/emQs7o7X?=
 =?us-ascii?Q?HwMKqws2GJljLzzdKVhe+qwLAzo2j3GfW6omz4NP6AUQN6x8jjBV9hJ/V9Sc?=
 =?us-ascii?Q?CPRh/2t3oPL9xEANtq636lB9Jg4RlJJywlMQK28Wl2PcQnPUow5RKcHeOblE?=
 =?us-ascii?Q?yL5k2Xia63TJzxpMGHQdQZ5/AxXYm/N1sVwoyUUlBsG7qXpNoWFe1M9bfDcm?=
 =?us-ascii?Q?dqgFVR4UU4ky9gu+RaLLKC93mLUP+FuxLyRX9OJo7HeKsNG2bxCpuie/L0Xz?=
 =?us-ascii?Q?fxibVyDspH2uvje2nielsBoEWDlHtEJhMWli8aJ6is8sHiSR8Q15O3ztNrj0?=
 =?us-ascii?Q?/kv0K6DMnOy/v0/xbo0OBS5pUEZv1rwThhczo0p+FAIUsoTcS1cyNPvigEUG?=
 =?us-ascii?Q?VHwp/gDFJfWNojMbUzWHeSr3zUy9C0WjUx706EpeYSCueQmd7ozj3XdWeU3j?=
 =?us-ascii?Q?zIqzJPmzVMG68zFqSAHwFu16mTmfIDMmUH/68dSiD41O3UmwtLJOR4TwwBfH?=
 =?us-ascii?Q?ztbVyz/3aIcvUOUdKMit4uz+OHvDgZdmUIRAz1Xm4T1Tyeg7ikUMdoLkY8AC?=
 =?us-ascii?Q?j16BM2p77rvMhJCDjCKV3M5oDPmdm260mdL9roXALaRou6piAcC8db+9g9mo?=
 =?us-ascii?Q?AVypqiKMyiq645aQxfMNhk10qdesWr2Hhm6bBngXdEXHJrRGJuJq1g+FMfl6?=
 =?us-ascii?Q?5McCbNmDhHIlPKAmP5DZaqr5UxfomkYMbEb4EvHw3Ar1CJC8niBqVkt2/ZLG?=
 =?us-ascii?Q?mHLSaaTQnMbqIPhMTmOD3YyW0MuCd2GkGcKEWEZd+C2cxSzYKAGP2JB3tbyE?=
 =?us-ascii?Q?jskr6E45fADDzq+FN5LGH6DK2TEAzKg6scU0iM4bGpY/FIQxff8dMUJUWcNv?=
 =?us-ascii?Q?a9CGdylNeTThD9JybUnzp/huTr7Yd3lidiPIs+6ei35gN+QrsgDPbvxB5TEu?=
 =?us-ascii?Q?0ph/7QBljFZ4cWCH7fQqKz+Q0lwALZC0IONHg6YQlK5Oke8MVSsUHJ2ywL3z?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333b47b7-703e-4d2b-d7c9-08de02ff0b4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 04:32:36.4231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCKU//myfGsTMeQPFKioJeipvcUQRLYNurip5jHyYoBKTm5Pws9O7+t98Ui0xB+Ga+5M6PfXuhLqgyB4qonedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
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

On Fri, Oct 03, 2025 at 10:40:40AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > Add xe_gt_recovery_inprogress helper.
> > 
> > This helper serves as the singular point to determine whether a GT
> > recovery is currently in progress. Expected callers include the GuC CT
> > layer and the GuC submission layer. Atomically visable as soon as vCPU
> > are unhalted until VF recovery completes.
> > 
> > v3:
> >  - Add GT layer xe_gt_recovery_inprogress (Michal)
> >  - Don't blow up in memirq not enabled (CI)
> >  - Add __memirq_received with clear argument (Michal)
> >  - xe_memirq_sw_int_0_irq_pending rename (Michal)
> >  - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> > v4:
> >  - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 22 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
> >  drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_memirq.h            |  2 +
> >  6 files changed, 93 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 41880979f4de..ee0239b2f48c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -12,6 +12,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_device_types.h"
> > +#include "xe_gt_sriov_vf.h"
> >  #include "xe_hw_engine.h"
> >  
> >  #define for_each_hw_engine(hwe__, gt__, id__) \
> > @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> >  		hwe->instance == gt->usm.reserved_bcs_instance;
> >  }
> >  
> > +/**
> > + * xe_gt_recovery_inprogress() - GT recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if GT recovery in progress, False otherwise
> > + */
> > +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> > +		xe_gt_sriov_vf_recovery_inprogress(gt);
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 0461d5513487..c2be8fc14c88 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -26,6 +26,7 @@
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_lrc.h"
> > +#include "xe_memirq.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_vf.h"
> > @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> >  
> >  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >  	/*
> > @@ -1118,3 +1120,23 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >  	drm_printf(p, "\thandshake:\t%u.%u\n",
> >  		   pf_version->major, pf_version->minor);
> >  }
> > +
> > +/**
> > + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if VF post migration recovery in progress, False otherwise
> > + */
> 
> hmm, I'm little concern about the mismatch between function name and it's logic
> 
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	/* early detection until recovery starts */
> > +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> > +	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> > +		return true;
> 
> as here it may return true even if the recovery didn't start yet
> 
> > +
> > +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> 
> and this is actually the flag that indicates that driver actually is recovering
> 
> maybe (depends on the actual need) we should either:
> 
> * rename this helper to:
> 
> 	xe_gt_sriov_vf_pending_recovery

Let's keep it to a single function. Will rename.

> 
> * or provide two helpers:
> 
> 	xe_gt_sriov_vf_needs_recovery
> 	xe_gt_sriov_vf_recovery_inprogress
> 
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0af1dc769fe0..bb5f8eace19b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >  
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> > +
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index 298dedf4b009..1dfef60ec044 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
> >  	} *regs;
> >  };
> >  
> > +/**
> > + * xe_gt_sriov_vf_migration - VF migration data.
> > + */
> > +struct xe_gt_sriov_vf_migration {
> > +	/** @recovery_inprogress: VF post migration recovery in progress */
> > +	bool recovery_inprogress;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_vf - GT level VF virtualization data.
> >   */
> > @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
> >  	struct xe_gt_sriov_vf_selfconfig self_config;
> >  	/** @runtime: runtime data retrieved from the PF. */
> >  	struct xe_gt_sriov_vf_runtime runtime;
> > +	/** @migration: migration data for the VF. */
> > +	struct xe_gt_sriov_vf_migration migration;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> > index 49c45ec3e83c..2391993634b5 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.c
> > +++ b/drivers/gpu/drm/xe/xe_memirq.c
> > @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
> >  		memirq_set_enable(memirq, true);
> >  }
> >  
> > -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > -			    u16 offset, const char *name)
> > +static bool __memirq_received(struct xe_memirq *memirq,
> > +			      struct iosys_map *vector, u16 offset,
> > +			      const char *name, bool clear)
> >  {
> >  	u8 value;
> >  
> > @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> >  			memirq_err_ratelimited(memirq,
> >  					       "Unexpected memirq value %#x from %s at %u\n",
> >  					       value, name, offset);
> > -		iosys_map_wr(vector, offset, u8, 0x00);
> > +		if (clear)
> > +			iosys_map_wr(vector, offset, u8, 0x00);
> >  	}
> >  
> >  	return value;
> >  }
> >  
> > +static bool memirq_received_noclear(struct xe_memirq *memirq,
> > +				    struct iosys_map *vector,
> > +				    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, false);
> > +}
> > +
> > +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > +			    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, true);
> > +}
> > +
> >  static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> >  				   struct xe_hw_engine *hwe)
> >  {
> > @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> >  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> >  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> >  
> > -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> > +	/*
> > +	 * We must wait to perform the clear operation until after
> > +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> > +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> > +	 */
> > +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> > +				    name)) {
> >  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> > +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> > +	}
> >  }
> >  
> >  /**
> > @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> 
> maybe we should add "guc" to the function name?
> 
> 	xe_memirq_guc_sw_int_0_irq_pending()
> 

Sure.

Matt

> > + * @memirq: the &xe_memirq
> > + * @guc: the &xe_guc to check for IRQ
> > + *
> > + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> > + */
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> > +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> > +
> > +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> > +				       guc_name(guc));
> > +}
> > +
> >  /**
> >   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> >   * @memirq: the &xe_memirq
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> > index 06130650e9d6..a6fffdadef88 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.h
> > +++ b/drivers/gpu/drm/xe/xe_memirq.h
> > @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
> >  
> >  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> >  
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> > +
> >  #endif
> 
