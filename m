Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804E9C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 03:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA3010E132;
	Tue, 27 Aug 2024 03:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUMvq3Wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E2410E132
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 03:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724727911; x=1756263911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=02pTjZi/QEG/yARfAT3G+mGSm7Ng4olHZwcq6i4JxVE=;
 b=cUMvq3WrtyeX1MzvyNGEwkqFRqnIE+KAYHIchogabpjmqPdMANCXZEfH
 HRxoYiRpiwmnW3NeMMl4yqaeGaMJirPQ/m6KvMw5XhpiVy60KPIYBvou+
 TQLotuvT4SobMnJppHc1+J8JArRofBHhVoAUPJ8MwajW80jV/HjY9H7OX
 2bSjrD+keVESZDrAsr97/rMeDGkzly9s6YmQS/PEINTteWjIRS5zchpCs
 dUIcQ9hP78FVFJ3oQJt9mmkIE7spZ7zgZdsbD7BwVyVQ5hoGHtCADNK2F
 OIg91h80SKzSDyQOXUgNNNBc9+TEdPHhJMAEXDyssvfOoAV61uFuV9bzj A==;
X-CSE-ConnectionGUID: vJ9xs0Z+R3a+zdrYkcxmLQ==
X-CSE-MsgGUID: yYHrh6CmRe+yY7pggRVVhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23051457"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23051457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 20:05:10 -0700
X-CSE-ConnectionGUID: vZxb2o9/QoKbpJ022i6nEw==
X-CSE-MsgGUID: 8lG/alVhRVyUGbN4pVohkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62881551"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 20:05:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 20:05:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 20:05:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 20:05:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 20:05:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttgrb8y9SD/a1BAwQGnC464teyyrurQCZuSi/VYgmBEpSCPT2hYUQ02vr/nKjhL1inLbmqJHcyBojFWhZE/TuIF4bq2SzsWx340T3ihAUESwl7pDvCZf0beMVrP4xoEasH8UjmoQYlO5OfeD6ITiEevyDby2Ni6NgBWv3qg5r1PAWHBAF1aR5F5/iaXsEwEBV2MQznInBIwtiT8kZXSBrThUeMupFeAQRIKW3yMl9nPVcePq051pSu6JcY6hFQCp2bYFk8DdHDlx41cZlwTLvpJRAgHSIK7Df0QIZ8TsgVAA1TB7/wVzv+vL/mnr0b+ICSfsmO5ik2SZNPrQUvpGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjQ44MM5gPUf4EaJvNKMCcH5H7K1DP93xXQVMsqsSKY=;
 b=O00PxJmmEawJyqkYYeTMVPuKZMwqkmkF1/Ro6LPfOpLPB6BCXwnqm0hO6mqJ5wkdmYFZsocYvEOZXYSuLUupoFMSTV2JajrCgNdQWeL1borHgP3X3Mu67pWymlcxOdp9ZCoX72uT0kr7eQi+ywaarL6gMwbwIN5klTMD7pLtctEvKTzUDVc+VLd3HvYli+lK2yLGHH2u1FCjOknPBHaCZTJZJMMtA5YRQKOYZIAWR5JX9zYrkUyTD3dpkgjA6MeMRv+XHW//KhVweZjrS6BdlfB5aibXcsLkiS4OH151ddEDLty2wx4nMJHeC++C0B/2AWg74KLLBkuxTI4GRQV1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6475.namprd11.prod.outlook.com (2603:10b6:510:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 27 Aug
 2024 03:05:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 27 Aug 2024
 03:05:06 +0000
Date: Tue, 27 Aug 2024 03:03:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] drm/xe: Replace xe_device_wmb by wmb
Message-ID: <Zs1CFjMA6JcgBBVP@DUT025-TGLU.fm.intel.com>
References: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 680ef492-0565-44de-fe88-08dcc6450d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kVjXZDG8B+r3KVNQ7Bf0Eu4tkDI6JkF4AfKK/sOPq/hXkweuSst0IFcRxP8r?=
 =?us-ascii?Q?xnGzQ/dxPsH4nVswal1kO3uUPZWi4KHoMa6lAxEbGWfvya02iwq2rOq/RxtL?=
 =?us-ascii?Q?f46UhDQhH2uN5w5hq8YMO2aGq+hWbwrTpEURp412tjIPk0tucr8X/Uz/Pgmk?=
 =?us-ascii?Q?chkDXn7Y7vSwX9dicfPH5I3u4fpyo/ZSR3fn19WS6orr9up94msAHWTzhtM/?=
 =?us-ascii?Q?OSccIpjEKpVhUwoTKyLmmN22Q6jYtQLdx1vYNwW/YGDwEYKLF6PG8myRB1vi?=
 =?us-ascii?Q?tsFdDuF0ot7AjkKMb326A0eXeFnsiLn149ocpu5DmkQDnyhf2CjzsLtiwMW0?=
 =?us-ascii?Q?s0A5SllQkR3OYAb6xLqIQmxoY3RjFRNWI6f5pGOg0d8MvONWei9mEqktj/q1?=
 =?us-ascii?Q?bA04A+VzkLLS2BNjDbZu751c+O0n20hcBqnc5ZljcnfFx9iD2OgNk9E//r9+?=
 =?us-ascii?Q?0p9FlK8oZtDw+ZXLDycUJO2I4JRMwOuSDDr4YFB8GFCgFUy/+hZHT9mYwCFo?=
 =?us-ascii?Q?TData+10AipnRSWTWbVRrE12P1OJ1c6XWromPQ53n/38MFI0QQWu6C0iWu0V?=
 =?us-ascii?Q?r+gmJOzabE0S7mt3K11yzntjGYV9tpbGLFPzMIcBEu7+qEB+wV1Y6u2Da3tp?=
 =?us-ascii?Q?QEkZXMLCt48avxBSXxevMUV6MsU/l2knEc3WLhjgPZUHHdOgQjVy6Xtn/ZK2?=
 =?us-ascii?Q?k6VsDRbt1nEJKZhnmdAApJrlPiH3kgv44AmCkkqcoiiFA+kTkdNi8ciBBzwg?=
 =?us-ascii?Q?p6nw4QuKtec2Z3lLZUG9ZVWIGlN1ufhkDt+sWN0t44y2k/pru4ugUo0uCe1G?=
 =?us-ascii?Q?RiiU3PEA6IxpV0ut0Wvk8sPOfTxZ4LXelGKRJwAWGJzxSSXy0BuKqG/nkk0B?=
 =?us-ascii?Q?OJGrWpgDVVgcc6RXFJALyiMRiAm5LIN/GlSyeUHdja7A+W8+c7ETISaBdJNo?=
 =?us-ascii?Q?48HTlI+tRtAjrq1H6dlNs7LKG3IwdVffwVAoDtKRNggY0r+fpdWI+JCHYzmx?=
 =?us-ascii?Q?RKMndIwx+ToG7Dv7Jjh5J/dHIFio45W073e0N3QzyM8YMH6639XmSGZ3o6MF?=
 =?us-ascii?Q?9jxm3bvdd/Dcod0esMnPIC/HbUoDxhfCqnb26HOA6+EV8NTChcHHuhc14uNU?=
 =?us-ascii?Q?XZfPO8CfUuAESNcA0818i0rRBFqRyYn2z3o0E3+LiObW0XXk+zdAwPbEUXlW?=
 =?us-ascii?Q?qdWlKfL9nDF+lmWutn1mQ4/iYI6QiqQUmtZ7or6VWgeUQ7egAoC09hwebCwJ?=
 =?us-ascii?Q?sXaedeSxkSlk4h2JECTlfs1JOHeRitb9giwy+r3NSkumRW8YTYpMPhBMGEnf?=
 =?us-ascii?Q?BpKocNRzlEaD6a/O11Qwhg7+LGWLNjH+mseuQbGoNO2oWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HvBP86hafo2eQbfI8Y6pcoNPLc1Y6u+Ya9zLFORUZr/JKynJ/lHmRVezO3YQ?=
 =?us-ascii?Q?wLhaUUO+ePKoNdCPqzZ+SRoo4Q2Gx719Jj8Kq50st8KovUVdrFXMKf9aH7Z7?=
 =?us-ascii?Q?walYWybL6AScUL2aFcZ4xOcpplCKGV6O5cZptEFRNOZvyo153dt4NC4+ROVG?=
 =?us-ascii?Q?UUtQwRVBxT1GXCK8tB/GsupHKuxHhEbiKH4RuU2poiDPo1EMYuyJkk+6uhcg?=
 =?us-ascii?Q?wnDtWE7lggiJh1xiviK/PuoKzmDDguBuztAjgzuROmoMknpyLWZEgKaQXSFN?=
 =?us-ascii?Q?PLzakFnsv2a1u0NoiyqyzGUw6vWfnfwhK67Hjw3QM2ElltfhVAdSZCQWQ7BK?=
 =?us-ascii?Q?MHfAnvUmsQTvjkuMM9tiL295PdAzq3O//jrAss9aLTCtmEo16DTZRDnJbXHE?=
 =?us-ascii?Q?QkU+QjoiCz+1Ogo3hlTUTui9mNG+okVWDnZZyrgvPzftZuhtSapo+6jlOmGu?=
 =?us-ascii?Q?YTlnxXbWbbWzt7ZOPIRHvRvT7SdGZeaFhmA8uBlY/RkWZoia7DMxv1Kg8/+c?=
 =?us-ascii?Q?OQ/fg/YMDtiNcxAAYjW4bmgZfiNKhv4GYgx5DXQyts+E3esFhSymjAEC9JlT?=
 =?us-ascii?Q?eMkDK1dwCBfC+b7yAfn0DdLc1tUsp6BIu0lcpkX/Tia7pE9OSbh3Q3cewfYC?=
 =?us-ascii?Q?SaaxTXFezKRBcjI+wag6E0tseF1L/UQnNibWnJWusz+BNjAZesVj8aXDp2ix?=
 =?us-ascii?Q?6nnwbM0FfF8ZSyEXcvAMacEEJTWZCvlwggxN+vnjCTjcSECw93S/zRrd6Pgu?=
 =?us-ascii?Q?MTclgidbOCZGo1pBRq2QTnLe9Q6rzzw++wnUZCzYnBaYYQS+c+38gxupytUu?=
 =?us-ascii?Q?uGpjI0Ybmkc8ChjhJj6Lvm+gjE+iAn8aS0l3XCgmc427X+I5btwVa7xGzyUv?=
 =?us-ascii?Q?qDWrGhQU3alZiKQlIch6JAEP1ir1vhPFpRUWRCPpN3xTmiK3YK2pDdjwpJbT?=
 =?us-ascii?Q?EkUVP+5gWXJ/kLbH06zWrJA4X5Gbob6z/w/wvvu9iCLlLc+1irf69p4zMEQY?=
 =?us-ascii?Q?TSUANaITw5cjozXigchQ9RL9O4cMZMBS5849a1lG6A8Aa7wc69twiPbriJU5?=
 =?us-ascii?Q?CgHVHQh3l3kvEV7EWx9rn8ekVXPh8S0VdnUbrDHk+K4n2UUVlJHy6gZzT/Jo?=
 =?us-ascii?Q?Efs3a84ssXSgUlMGnc+HiZnmaOvPXNwiI+Pi0h6USh6ZiR+1VNU8Ljs3gaik?=
 =?us-ascii?Q?SmcIfdOUvBFgVQOxrUg6N8lLJvCeQjcCAm8dK7QcvpkZKt+ZaS8L92JvcsrZ?=
 =?us-ascii?Q?4UQ+TwjfGtpXAgaIGqvtFkyKrtsAJ7832Ooq5uYM7wsvuoX09kReijh23HwC?=
 =?us-ascii?Q?ELnd3Mz/TZ8I6ipOra6dnuiAwfv7a+1hr7gw54ECMXAT8O3L0a/v1MKaiupK?=
 =?us-ascii?Q?f2/mJHwsYDIdp52NpCXhOnUHnVUDXPgyNKuov0OlDF5/0GdN/mQ4YnHejpHC?=
 =?us-ascii?Q?ZHNNb41H1qJXw0owE70T9H96E6R384p7R7dvSoM6yjw6uWyNEIcmI9WtdQKM?=
 =?us-ascii?Q?2WiNRQrISKL+M7oMFMOEGpsh4IsN3Jg+yAeJBmnZ2QnmLPz7MmQPmA88Zig3?=
 =?us-ascii?Q?QE1USBez8WZ+O3sgaZqDGS+TPY/bts7Xmu0mT8TtUJIRgV+pmQzyRszYPf5j?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 680ef492-0565-44de-fe88-08dcc6450d9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:05:06.4429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vc4GCpj/io4uBNmAsVuyN5f+7hdeHOruR8HZXljQ9PtPcRtpgkwD+mpT99BE3rF0a1y8Qvcp+4XJZRL8wN060Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6475
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

On Mon, Aug 26, 2024 at 04:41:00PM -0700, Ashutosh Dixit wrote:
> CI ONLY for now
> 
> In xe_device_wmb(), it is not clear what the purpose of register write

The comment you delete in this patch does explain this. IIRC this the
equivalent of intel_guc_write_barrier in the i915. Also IIRC I added
that in i915 when working on GuC submission chasing extreme corner case
bugs in stress tests. That being said, I can't say with 100% certainity
that is required on all platforms or our usage in Xe in is correct.

> following wmb() is. Replace xe_device_wmb() with just wmb() to see if we
> see any failures in CI.
> 

I would not be comfortable removing this based on CI results. CI is ok,
but typically doesn't catch corner cases bugs which this is supposed to
prevent. To be comfortable removing this I would say CI is green, run a
battery of stress tests on RIL platforms in a loop, and finally confirm
with the hardware team that this in fact is not required.

Matt

> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 18 ------------------
>  drivers/gpu/drm/xe/xe_device.h     |  2 --
>  drivers/gpu/drm/xe/xe_guc_ct.c     |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         |  2 +-
>  6 files changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6db7e082d887..f0154281f3eea 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -800,24 +800,6 @@ void xe_device_shutdown(struct xe_device *xe)
>  {
>  }
>  
> -/**
> - * xe_device_wmb() - Device specific write memory barrier
> - * @xe: the &xe_device
> - *
> - * While wmb() is sufficient for a barrier if we use system memory, on discrete
> - * platforms with device memory we additionally need to issue a register write.
> - * Since it doesn't matter which register we write to, use the read-only VF_CAP
> - * register that is also marked as accessible by the VFs.
> - */
> -void xe_device_wmb(struct xe_device *xe)
> -{
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> -
> -	wmb();
> -	if (IS_DGFX(xe))
> -		xe_mmio_write32(gt, VF_CAP_REG, 0);
> -}
> -
>  /**
>   * xe_device_td_flush() - Flush transient L3 cache entries
>   * @xe: The device
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index f052c06a2d2f5..3be5fa94fa113 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -42,8 +42,6 @@ int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
>  void xe_device_shutdown(struct xe_device *xe);
>  
> -void xe_device_wmb(struct xe_device *xe);
> -
>  static inline struct xe_file *to_xe_file(const struct drm_file *file)
>  {
>  	return file->driver_priv;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f24dd52239268..5ac610f227d88 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -596,7 +596,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	/* Write H2G ensuring visable before descriptor update */
>  	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
>  	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
> -	xe_device_wmb(xe);
> +	wmb();
>  
>  	/* Update local copies */
>  	h2g->info.tail = (tail + full_len) % h2g->info.size;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbbe6a487bbb3..bbf7ec0111642 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -699,7 +699,7 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	q->guc->wqi_tail += wqi_size;
>  	xe_assert(xe, q->guc->wqi_tail <= WQ_SIZE);
>  
> -	xe_device_wmb(xe);
> +	wmb();
>  
>  	map = xe_lrc_parallel_map(q->lrc[0]);
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index cbf54be224c96..06cc1f1e65a1f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1298,7 +1298,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  	}
>  
>  	trace_xe_vm_cpu_bind(vm);
> -	xe_device_wmb(vm->xe);
> +	wmb();
>  
>  	return dma_fence_get_stub();
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bfa4880a1673a..975f174df41c9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3186,7 +3186,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  
>  	for_each_tile(tile, xe, id) {
>  		if (xe_pt_zap_ptes(tile, vma)) {
> -			xe_device_wmb(xe);
> +			wmb();
>  			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
>  							  &fence[fence_id],
>  							  true);
> -- 
> 2.41.0
> 
