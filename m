Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD93EEC2AB
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 00:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D16810E07A;
	Tue, 24 Feb 2026 00:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBM9jRZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79B310E07A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771891632; x=1803427632;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=2x4qWssPMSEv29DKpN1QHHSmRHHoikT0MtIdLBnOTV4=;
 b=GBM9jRZ2QCdTHbsa9zQd6WR/UHTc6dcI0mc13VKmFNiASW4T8kmcrjWz
 3E7nA8Sf1hb73WM2Da45uY7I5ltGQaXC/vKoeQtDDyDuLxN4ALc/1Ke6o
 GkRFJqibjgNrArgT4AAd+nVFp53m2u/QPj0gItuVmzWpilBhHpe9/xtW4
 6oYKjBcypTYDjFTgXF/orfti9846Q+qmann+xK8NI9R73A7zZmPX8muzN
 +C362iJ+vLoMVEtmScVk281ydorZMwQgiz5k2ILT7zim1xCMwzPtVHhWr
 GHhXVeykcdWY6ZMa9CkPAnKb9PwSNLQdE0j3oMUu+ExYUX0r99uTRsg3M g==;
X-CSE-ConnectionGUID: DXl2c56bQ7atq+ZY8acZLA==
X-CSE-MsgGUID: hB4JEp3XRbShVmbR4ETjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76729494"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76729494"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:07:12 -0800
X-CSE-ConnectionGUID: uaS13GzBRh+pkB6mHvonmg==
X-CSE-MsgGUID: cnin9rhnRRu6ATZxPJ5Wsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220250356"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:07:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 16:07:11 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 16:07:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 16:07:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xlef+c6aiSkoF6ZzgPkmSNYFUo9DgQyrDg06qbWZCUnvBrc5Hd/yTfzcURmwFRy5ZTaSjHrlKw7Mwz1d+MEIhTALLiO3iDs4ayorjM7+Sztw0TFevDS96M9PoRiTIRGxBmHdqAw5coxhC2IqBw4s6nt78Vq56U1IXHArwoF7OnEgHopxPenLUUKnkO+2UT2tLLFbvZYMYSCp7Ffu831F3UF1F8ZWoVGugW6iMEiiUKTyCxehTGjljDear9SXytujfy6nCx/+QmHD+2w9S1LAf6iYkshJBcmohkjdeFhht2HhcORYWR42H5eog4+C/j/ctEKDDHsOPGdg2zFJxY7dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikyhUk7pVbk5p34IsB24kD7Q1IRnU99PQdo0tlgcep0=;
 b=aULSKfXplflHtYRCRMTlH7aTA0FP7yAyGmOQWpjFUsZuZUjEZMuSCjYy2Gr1t4i5dMKmSg9rNOsjCy257NWC/HKIEEa4l+0FJftyT8sKqVbRcL6rBnyx/2KWfsbbXvOtUHwNzsIRPXIZwsDqXTdMtkvmYWVQ+Xa3OqoTPxisFJxVOQ7207jHuucrt6e9RmLCLz1tKM9lAGWT0l5J8ir5yk6cvC9RL5jyImYpUKy4fwUdf7da5sHYvTok90OMUnpwFejyUu1FRErXGspY1ddR5LW3EhjRz3AiPluqthDerSH2LmboqEdoCNZ1F18DBEVtM8vYXktjs8UA7cXUIt1Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Tue, 24 Feb
 2026 00:07:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 00:07:02 +0000
Date: Mon, 23 Feb 2026 16:07:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 Workaround cleanup & simplification (rev2)
Message-ID: <20260224000700.GJ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <177183143057.273936.10060406247840829974@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177183143057.273936.10060406247840829974@a3b018990fe9>
X-ClientProxiedBy: BY5PR16CA0015.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 75097a4b-8a72-4577-3a4c-08de7338a314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X2WuMc/j7TJySVKRoKjw7aBB+WSCxHRcN2zvfg9mUtXUuBJqlqKkB2j8ESZw?=
 =?us-ascii?Q?xdasuIL1NFx5BXpUHN6uhlEcpK2nMjIOyaipd+rNGYbvQWBlQFqyTS/4opYj?=
 =?us-ascii?Q?1OzG7HA1mUrIwCNL+NdYpMN19qPSoYoNAHbzbQRXEjDOAdAOidIjzDHXGGKS?=
 =?us-ascii?Q?O9dDZBOymdG3uyspl4yuefasujH5CKXHwSFFGDQkpj3z7tz7g+KuG9fHuxnp?=
 =?us-ascii?Q?qEYsedgEDnqh1i3fZP3hZcF3Twt9tap+BzTLKsK0uQqCEaYp70OQvDevAgFL?=
 =?us-ascii?Q?hoz4cu8k0Z1KrHDRnGqTUbZy/aCBRwIb6vQCp+Yr3jxS3Sirv2JWZ4oUK/C3?=
 =?us-ascii?Q?OTRxSUFORwFUQE0ysrI3rwOn3q4gteTVFEHfjNCoFp+IgHJ757frm5LYB8O3?=
 =?us-ascii?Q?HA4t5B6u1bBzrRKY0lvQEeY26bB4z3ENtw7Km962jU67kQRkDIReZw/uBOv6?=
 =?us-ascii?Q?i9u+N9/mZ81Bt8gLEf967IGjl7rLVUdpVDhaZULQ+kX23afE2svFsr/A4/z1?=
 =?us-ascii?Q?TGfSTwJHsQXV932HUpHZhEE42KbDM9uMh04bzi+2l5CTQWGm1nFZXzeE2Tyq?=
 =?us-ascii?Q?I7Wh4IqpUVhc4f8sbPzDAel8fiY/YTRiLxPImHBPUSLl5o+Mvo61q3OvwwNQ?=
 =?us-ascii?Q?HujWic3qhaEVnm46DUVGvvBy0k5Z6ODqiVfdwy6zDtdMZgiZZCRJWu8H2nEH?=
 =?us-ascii?Q?7MhxW/MYUX1RreQkJi9AQNzRx+xmjZi/WU7AuU1vErppkkXn+dmmbQQw4CeW?=
 =?us-ascii?Q?e8s4LtpIByyvGF5jDz86NC12/tpOiuhPdxxuV+lsF0iyL8oKkdCpNBnEvTb3?=
 =?us-ascii?Q?tdOx+De2Gwu83XYakTjx+X/kN5qtkj781gvVTH7fhp1CumYkjv3Rqdqiifry?=
 =?us-ascii?Q?kcp3RIBPVrLaIZe85p8XvnDzNd1y5zcIfw3ufRW/2w+bDOZABN+bOM+yieWQ?=
 =?us-ascii?Q?x5LbKAzU5HBgdB2nW/Y+12CYrGP8rgFXHkU1FygW3z0QsnF0ZdkDDLrUXewF?=
 =?us-ascii?Q?XIaFS7qUewN+qRoDLGGZmkkXTJ6o2iFnqgJbGYyqB0Y+7Tzf2lDGGijRZsD0?=
 =?us-ascii?Q?UZ1knej0eadpT5CqEd104eviMHtsHhBYbJzicmIUZcDgGUrpd0CwWxpWjeu3?=
 =?us-ascii?Q?IW4yXzT582M59X67kULe7mv711yVH8FGczsCha0pkE5Qu1olVnotxoMnukT1?=
 =?us-ascii?Q?69Bina6YyT7mcybsMUKLyWwzP6wOEYVHX0ReJ1qtK4LxfhKf/kXppPhDNntP?=
 =?us-ascii?Q?YhkwkSTPE+iPMrlolfCCBR/qkJ0F3FTEQTS5WQO5G6KGCkGrDpM43e8KNFPB?=
 =?us-ascii?Q?z6OlkY5UwkwgohyZh8QDe09aq3Abg23QmoFwdiO7Z8g9/28Y/6jCN+TCkG8j?=
 =?us-ascii?Q?xgRhzDrMDxqAuZ4DUhfYaW0AjJxlbbwlt1yAU3LU4TqH5VyrkaNQ8jwB3S/Y?=
 =?us-ascii?Q?RrqzSR/rDI59zgZ2PUUCKkof6fNtkewyVpxAOpNQsp1ms9B2eAuW3pfTz+Bi?=
 =?us-ascii?Q?1RT8k5qIxNdyYA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWnTHqartmHOdsYF47KDLYTL6dMKtkZpTY35BGULGxd6haUXcHUF1vaSdGqg?=
 =?us-ascii?Q?uWy/tb2eYYoKNfCTuQPVVZbdq5SkOGkxOTsrD2h/8vEXdKZHZn5OKFGp2Xmt?=
 =?us-ascii?Q?+e46gSil8vVEH4uDH1iD9qh0rPMgh34C4dA+jbNYP4rtj2uzUAolGubZHsJw?=
 =?us-ascii?Q?ttJRv6svUR5w1QCiz0VYgikL/3Abf2/468xXDOQRlT1US1Q+0nMEOaUw+Tcu?=
 =?us-ascii?Q?dJ+HFRy2D2KsT8VQKdQaXxvZD5qW+y+nhlT92+o1bQmSkuajmb3VI9l0fXXU?=
 =?us-ascii?Q?eWP/COGeEta8/pLbtYCMusr3Rr+Yn3veJUSoI32nsWQA0dbWyN3ZWk31ZU0i?=
 =?us-ascii?Q?8YiRS2NQ74Rt078GLjyVt6dUlh/l/XEIzJuxwoVjCTvEz8jNMfm7dhJl1scM?=
 =?us-ascii?Q?wdlIRVom16x2DgXX8laYYVb/Jp82ic7kwoiaw5zwfcMg6mgunFe8B+kgcd21?=
 =?us-ascii?Q?r8/2ce3K7i8UxSYGCrbE7GvFEZbi27WgXB5pAWAtvINLfQcu/m5WkK4F9Muw?=
 =?us-ascii?Q?Y0INKNp7wxLH0Z6XeeAybREhBTE4Rb1rDGMBwQO4EradxCxJu7jQN18MW5zH?=
 =?us-ascii?Q?kBcTfbu6t9zrEPh/trEMxIOA3+Bu4eGpS+JEMwIDtuwXexgep4SgMBaIFh3+?=
 =?us-ascii?Q?DtKDVTYwP6LBeni13kBx1QRkj4gm+/n3BK1wH+ayZzwiaH0TtVt1F5O/QwSg?=
 =?us-ascii?Q?C06ygZkNjr/BkPWzhf9ryhFzZ4fPRWD05C0h6sGfE5cSJivQ17qoJ27ZUUWP?=
 =?us-ascii?Q?OLrQ1KX3XRT5Thpl6XXOz7XKpjMP63h4IiKplXSczvRMw8k2flv4FX3cnQ06?=
 =?us-ascii?Q?GKPBHamhgoG9RgVREfKyKTJueQ9ceed/VlhofM1vlcjdyJmbb6atjNGohj44?=
 =?us-ascii?Q?oXAaORzl+ERaYuSqU+FLiE324X9W7jSankYQAfcDBLZszfVpVS0XNhX7KvVO?=
 =?us-ascii?Q?gFVxBPyHmFSn0WPAwdQnr50RYRXyCFlcubNRQFLzBDGfb6SbN8InY81W2KfY?=
 =?us-ascii?Q?cINmVvJuATXey+ryjzerB5zxijm7kstaxcHoEeN285/2PmfbMNurCrMebteX?=
 =?us-ascii?Q?na6pNifhNRYk9z64CcPJOQNihgI+rKuTnAxSRnyxhSWx70vtbELg1O+jBl6C?=
 =?us-ascii?Q?KeVbidMFbtvpfiQMQI82e1WMsLLDkb74uoJ0es8YDulsP5luKYG/nJH8+LtK?=
 =?us-ascii?Q?BNWq+dcDObwulrRZPADxV6xFe7l98Faa1Dx6qCBSHdN7bJTreCJn8CjX6nDD?=
 =?us-ascii?Q?xjL1RXxmzIqkf+mN/z0QnlJ8YikvY7mLbdpk346DsDCB8q1toyTfJGizl29h?=
 =?us-ascii?Q?vEMOu+f+xKckRna9Qg2MI7DiR9GwYbFGGLAZTX3nzERBpNg05yNnzWH8clQj?=
 =?us-ascii?Q?qM+IVYuMeDIwY8GO01Mfur/6+Z3lR327hn2O8lRio2gvi/ksqTsfMyeWgpja?=
 =?us-ascii?Q?0nWcpiT8EFLzpfNNQfSNo4ZmfOKGNGBYovcf12+WgBoslVcdx+0Bh7z7As6s?=
 =?us-ascii?Q?7j6s1kLUD2RoEQOoyFjlCEwFcPd6br9/RaW+K85nGW3FJCAzdXUH+2wuGTq3?=
 =?us-ascii?Q?znzFX5pbpHRiICo++IVfAhrP0ytr9x2WcPvLVyjeP7rVasFp5iBGiH0kPnVz?=
 =?us-ascii?Q?wmhCSy6P1x7NFCAZeKZ9jNhUZJINQYoCkFry4DOVUCg5oYdj8yQqlaunbkT1?=
 =?us-ascii?Q?UuylchU96bgqnHIJ3xYlUvX9EVZwoICGIHor1r6d7npt0g9UsG2q+vBbAnMg?=
 =?us-ascii?Q?e51AIdArf3LlCIDLMJnO2WPJ2rhbU6M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75097a4b-8a72-4577-3a4c-08de7338a314
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 00:07:02.6532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O62sIHr4oPIBOjg8e9dVamU3k7ceCM6AMm8xZ+FlEMnGoI6CH9+sSs0epS/tsJXYDVmIg4o9lfeR3eaoKwJXnL2K07DwaNBAn6JyRqbpZio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

On Mon, Feb 23, 2026 at 07:23:50AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Workaround cleanup & simplification (rev2)
> URL   : https://patchwork.freedesktop.org/series/161606/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL -> xe-pw-161606v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161606v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161606v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161606v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

System never came back from runtime suspend.  Not related to these
workaround changes.

> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5299


Neither failure is related to this series.  All patches _except_ for:

 - drm/xe: Consolidate workaround entries for Wa_18041344222
 - drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737

are applied to drm-xe-next.  Thanks Bala and Shuicheng for the reviews.


Matt

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13_FULL and xe-pw-161606v2_FULL:
> 
> ### New IGT tests (90) ###
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
>     - Statuses : 2 skip(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161606v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7059])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs (NEW):
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +4 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-1.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969] / [Intel XE#7006])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#6707])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-2/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1424])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#309])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#6266]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +8 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +8 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#1503])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4090])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2426])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#4459]) +1 other test fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4837]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2322]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7136])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7136]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6874])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6874]) +13 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7138])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-userptr-invalidate-race.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2284])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_pm@d3cold-mocs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          [SKIP][51] ([Intel XE#367]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][53] -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6321]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
>     - shard-lnl:          [ABORT][57] -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-lnl-4/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-lnl-8/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          [ABORT][59] -> [PASS][60] +1 other test pass
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][61] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][62] ([Intel XE#3544])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][63] ([Intel XE#2509]) -> [SKIP][64] ([Intel XE#2426])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][65] ([Intel XE#5466]) -> [ABORT][66] ([Intel XE#5466] / [Intel XE#6652])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13 -> xe-pw-161606v2
> 
>   IGT_8764: 8764
>   xe-4582-5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13: 5e550d0427ca648b0bc6fc8fba4e01f47cdb9e13
>   xe-pw-161606v2: 161606v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
