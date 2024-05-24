Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66ACC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708A010EA1B;
	Fri, 24 May 2024 19:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQvqJFqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96610EA92
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716579913; x=1748115913;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8cl663ONyhZS/G1BJCdnx56FUoIi7VmzS8FDwYZKc/o=;
 b=AQvqJFqCqSKcWM2921Nw3DXTm9YUykJbPkekpmgTM363ktSYkTMEJAYp
 UkMRnJECZqk5asS/KVmtGEUhh94nTew+XfMjATkIXWt+WBptBeqlnD2ge
 2G/jx0xOkJQhDLw3B/ktqLmKmtNXGM5iT84uVl0GhnWgQbWxSx4SStKMp
 wZW0WFtHWMF1h/ZaASqgAgsFz1KedvQ1K9ak3n7Z1HcGMdVlY8xdpkUip
 Lc1uP3vENRAGHKvjYQSihP/svSp84dTc9UmT5fc+HTc+vJHXtGauSaiVF
 gnDy2D2OOnIWSZH8zGUL0O5/vW5TYQi9MLK/bmJTbXAvBgdiX3S4DONq2 Q==;
X-CSE-ConnectionGUID: oGUwZk4cT5m53eUj6EXQ6Q==
X-CSE-MsgGUID: WYjhKX90R96oA9wVEapiew==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24100298"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="24100298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:45:10 -0700
X-CSE-ConnectionGUID: aOMpNUl6TaySLedvZy3bcg==
X-CSE-MsgGUID: 4ORLRegpTXyPm8D/3U60SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38913061"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 12:45:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:45:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:45:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 12:45:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 12:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ1JDqfHd5NNmV3ltcD9O9nBMgpJN+s20/Co3mVKzhYad18Ty90xlHoyfHcouNLmTuablu65QeBVLtH+eMQddQ7JJwF0TjFizd5+EEyQjs0O7sdJ5FkXFpyMVY4UjbHLJGlSWfpDljL0KnQD6cydracpYoFs8tJbgsuBDTEOrsplxt8abD4TW4dGwhuEHFtZ5qmcu8Q7VIjsQWuAFu806gHc9a9XT8Dhzz6DFRtFbFT8abW8Jov7fFQEW4mT0bnCHy3ubqQniNydcViVcQhdhx9ThT8rJf3GyZoC8gmfXU1oh0G9P/d6IqAju6RH0xNkbMF2/9/ydVtQcfRxCYWgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzJEMVaWmkJiWqzLdVtvTFgxTQNM+dro21oOf+TYKmM=;
 b=lKpJ1RCLkLVxyJGCf5LSC0aGkzvaORx9R2a7MibaiaDoa1KZMnqayt60c1LgSt8gkiiSGvBD8hOGRdOEu1qYWQ50G6dbh9Q/NKlI4by8m3vwAhJTSkFGwE89se/j3JtQj3kdczYAaUpduDW9CJtCvu27opq3CtzyMVeIYZYkbhg4aMWzDZawfj3Sfqv+c9plGXzE2PbwcYPnb38GljVJ3rlESeuIK40EkDYGM5cDNXlNF7wtU/zEUrtzv5HddICvDXC4Y83ItiOEvqjvjsmf0L/ogjy1rGIwxc7pP1fL7fnG21pmp7IbWBEg98kbq834wTB+sU6GaJ4494fzR7yG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26; Fri, 24 May
 2024 19:45:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 19:45:04 +0000
Date: Fri, 24 May 2024 15:45:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Don't initialize fences at
 xe_sched_job_create()
Message-ID: <ZlDuPLAHRJOeVBSH@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-4-thomas.hellstrom@linux.intel.com>
 <ZlCSNtSd67eXcqBk@intel.com>
 <96e1e573e0be75b29d0935c69a32158d6f20d1d5.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96e1e573e0be75b29d0935c69a32158d6f20d1d5.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 56338d3b-25ba-421a-5787-08dc7c2a01e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cJJZ9SYA9WkXJlfFHZ99XmQZhcBjjHHAleipRSQC/WbzDK3WXHohM9jgRp?=
 =?iso-8859-1?Q?LNiy9JmDX44HaPfw/7VWW5lYxrJ3o/8YUNOMuxKZu6BYgxIknbMyzZTkCY?=
 =?iso-8859-1?Q?cf9QBge6rtYLZl3YVsDb1cS8YemL1aCYaYEoZrxMxGqGl5HZIwsOiBvf1f?=
 =?iso-8859-1?Q?sDkdEeOCAaH1J98N2ggDhpcGwQDbE9VCd9bO+WvPRjKvEburIot3B6ONlY?=
 =?iso-8859-1?Q?o4ucDVXGmfZZbI9U4n2odxSLIfjm+sWg6pd7rp5mpVRqC4P7l8iwAcE0xL?=
 =?iso-8859-1?Q?oCN1VRvRlGRUVGpzPr665/Z6FWBQYKiH7cycZ62ibZbgkfm131SWbDR7fF?=
 =?iso-8859-1?Q?xKg74/GlUH7eZLSMpzYbiFB3GipkVnxlS8O9XQ8YIO3HfBaWwsYeF/4tdD?=
 =?iso-8859-1?Q?609eN0nXjrnbvaqcxx0sgQBgovDGDJnCzzXxlOy1O8NyVHOm4TsgAQct9i?=
 =?iso-8859-1?Q?K9R6dxEDKxig+GOo/v5oRZdDjssCRxjKYKZ2p4bs/USqsL/qIcYXmh2XJH?=
 =?iso-8859-1?Q?ZsNEB17PzKom+KRRCMzptuYrvVs75ESW91hKtpqaIeI9g7G3J31wNjYz4B?=
 =?iso-8859-1?Q?CuFtDRm+iQrWM6SWfBb/bWCfuEWXXjd7/9+S5lJUvmA/d4nPyalefgRp6b?=
 =?iso-8859-1?Q?Wt6MCbnDkGrLFl4soOcAtkwt8QnqfGz1PLdUiFC4BxcdOkfVTtiyhKKBka?=
 =?iso-8859-1?Q?jcjbOkI1K0X2eDVvjTogGwLfvn3Cqcl6zV1680nDhxmVS6VsOprocvvukd?=
 =?iso-8859-1?Q?z3pssbLYhyqoy1rpUWArNwUCTmuTJIxIYabQu52Cso/FZSUjqSRSYIswLC?=
 =?iso-8859-1?Q?9ha6mbsfG8CjqDHssnIc9/7/90WTFQDo2gWhleWgc4jpVpm9vP3Dxi7PQM?=
 =?iso-8859-1?Q?29nYUm18MlKj/hn9E+3Wfr3LcX8BPlanCSy3HdBjIhXOzc3gqAfJhz5A9T?=
 =?iso-8859-1?Q?fe6U1rVhr+61I5DA/Zj+KckH2SPB4+LWkkAPk+0LBUaJOjOoyvyKg3mz4D?=
 =?iso-8859-1?Q?bCl+FhMkcbsch4EAkphMqQ5NCsVs5u9DMKbfcrXN7jWAyUNIvP8tTyQM8k?=
 =?iso-8859-1?Q?WuFt8GhqY1E4Fs+sSutjAmBLrSfTdKuntn50/vYB8LNWcvR5YqoR6rDkpW?=
 =?iso-8859-1?Q?SqdVM6IsDG6EY/lREoNa4cZSdXHdjz5dAhHH3F0Gdt4O0ljzniO01ItHFQ?=
 =?iso-8859-1?Q?Yl+7qorGIawjPg70e+Cf4z4fhy+lOq6en892n7xnfX7pU1Tg7g6WHAhSWY?=
 =?iso-8859-1?Q?Pp6ZDFVt0gZw+vzFjweE99aAKqZVq0XyuBkDPbpfhU6+wwzp2zOYq+qUen?=
 =?iso-8859-1?Q?Et7lsctS8elXqVHkD2zE3M/CDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OKXk63KGZ2wqi+edjyaytck4vDwNHx8cmZdHgssZL4oIUOZyBSkf27GgkK?=
 =?iso-8859-1?Q?lT6fY2LkJOVoWXv9qYHTN3+6FLi7uedZBpvXYbZsa4EF+wLiX0trrOCyKc?=
 =?iso-8859-1?Q?zYpHmfe7Z7/shq3BNw3veCVI8NbtATGVLigKWEcKAfzo9EuCUL80zllOpm?=
 =?iso-8859-1?Q?AEanKJ2KTzlMoTvhYZFlfxbQUg60YepIqqOtS+9bTjYqzhEgnE8px//c2A?=
 =?iso-8859-1?Q?695ZhZUJvk9wet1nQZhqipu0Bk4x1r8Rnl0ybwhwtvJjx+ALwM5GW01Jt0?=
 =?iso-8859-1?Q?XSQ4Na7pmjLPx4M0nM+GywPfV8MS5ouVaReBPiyTYIPpCaWZjy8JTXMcFg?=
 =?iso-8859-1?Q?7ESRVRsxKL6Z3Il/X7CEMY/yv8S7SBIfhfbMAr3gzYvNocEuD41LTj/CFM?=
 =?iso-8859-1?Q?16rRmfM1u+mNd1XDzi+K5tj8gxesyzSF00GbAFVUClej/v7xad9jPokdP1?=
 =?iso-8859-1?Q?6YA5Di9Qq3RZ3WeEqZflhm+3viStLbJQUqU3mAEEfCD7UnXljjcrCn4v/K?=
 =?iso-8859-1?Q?IXvxl/Kv+taTHzV8p5Tv3nnW0VmGFKTxcRrzF5YDgyNV1GJEKgD/ckcK3e?=
 =?iso-8859-1?Q?+UqcUsf3Y4NZlkvnFwp6UPdhg3m/PJvj+49sBsps6zZbf6ozUJWThiksKs?=
 =?iso-8859-1?Q?ziLD0+L1lQmAvKTiOxH9OjUI8BXU6tTUcnu9uU5tpIq8wqE3K4Bx9cEkyP?=
 =?iso-8859-1?Q?HjscBbrgM6QFF5xz9Thpp/D3Lg9yZHHeK5GuLxpbj5xAlLOPtiftOsCq+k?=
 =?iso-8859-1?Q?bXVoEEptTt+CfLb/sJ2JS59UFUS9Uq8bNPf13yIbJQ06M9N72CW36Hk/q3?=
 =?iso-8859-1?Q?S0en4X53yS2BpJGs6ks+NFKZiv4zwHa9ibb5SuMrlbhB91gJDkBytL4B19?=
 =?iso-8859-1?Q?vhJLghgywRDYmsoICB1hTUpcD2ykO4XwuxnIqiAPyhQU3DmAFeGp1wKAgu?=
 =?iso-8859-1?Q?WCIT723Hxa7xe+puPRXaqMc1YoI4i0+ECLcfZYuuhR8btITcy/2yDEQD+m?=
 =?iso-8859-1?Q?v5aNSfzOuZhoM49Vs6aeFlAEvmKLMugZmY4pX/PSOskWlmzHI+pdhIRi1O?=
 =?iso-8859-1?Q?eT98F4Yj926a+c4ru4zDK315tY71W5EzMKgzlV0gD7v+g0cW0dK6le2Uq7?=
 =?iso-8859-1?Q?aPlK1TtDX93Cy1fSV7dy+jniuRRi+bZB804t1/QAx6gEzwS+PZyLAqpyeS?=
 =?iso-8859-1?Q?c9LNleO6VlMlMBpUB32fSeBh90loBPfZDPUexQCIMKCp7XcMCfus7EdyOi?=
 =?iso-8859-1?Q?6nkWxocy8/87UVPtxzqkP9ZTGTl39I5gGdoNDJW1t9vo7QjqHKg0UdcES1?=
 =?iso-8859-1?Q?K8rUw31mqMeXGZzLzRjLQlJ9YsHfAFBbt6DJ9rKrpase5gFCT5U49NY67v?=
 =?iso-8859-1?Q?IDq17Kfd+tRMqenuwbAa/+E6H/4rMmqwks8W0b4pXmmqOuNrO59QIHekEF?=
 =?iso-8859-1?Q?SLAzfpEucmMLKxBmBEIOsqbV1uM0vD8rX9vhNhOPx851d3OoXv/hdrxLcx?=
 =?iso-8859-1?Q?PR4zsL89F0mqYdmrBD6Qxi2XL+/QwXCZE4jE0qYKXEOQSKE3Xv4sE9Jn7S?=
 =?iso-8859-1?Q?mZN6yChllGhrlV9RiG62YpxiTPFgy1VED38nbLXSWuuWOCQvxjS1SnMqyg?=
 =?iso-8859-1?Q?ZH49tJBkUDDazoFt2YZf/B8wlezAD++RdcCA5mX0/vPCEUfVJDJ49NEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56338d3b-25ba-421a-5787-08dc7c2a01e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 19:45:04.4504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzQneqtyIBB3a4kNg7qEBFjALh614UD0yTQ7AAojjKMIfYCHFUoim9VRRnPfBp/OaFT6ZDmm11cyzlKf5QVnDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

On Fri, May 24, 2024 at 03:22:33PM +0200, Thomas Hellström wrote:
> Hi, Rodrigo.
> 
> Thanks for reviewing.
> 
> On Fri, 2024-05-24 at 09:12 -0400, Rodrigo Vivi wrote:
> > On Fri, May 24, 2024 at 09:19:38AM +0200, Thomas Hellström wrote:
> > > Pre-allocate but don't initialize fences at xe_sched_job_create(),
> > > and initialize / arm them instead at xe_sched_job_arm(). This
> > > makes it possible to move xe_sched_job_create() with its memory
> > > allocation out of any lock that is required for fence
> > > initialization, and that may not allow memory allocation under it.
> > > 
> > > Replaces the struct dma_fence_array for parallell jobs with a
> > > struct dma_fence_chain, since the former doesn't allow
> > > a split-up between allocation and initialization.
> > 
> > I'm wondering if it would be possible/better to split this change
> > in a separate patch.
> 
> It's possible to do it as a prereq, but then we'd have to remove all
> the new code since we'd had to allocate and initialize in _job_create()
> to be really consistent. So I think it is better here.
> 
> > 
> > > 
> > > v2:
> > > - Rebase.
> > > - Don't always use the first lrc when initializing parallel
> > >   lrc fences.
> > > - Use dma_fence_chain_contained() to access the lrc fences.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |   5 -
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  10 --
> > >  drivers/gpu/drm/xe/xe_ring_ops.c         |  12 +-
> > >  drivers/gpu/drm/xe/xe_sched_job.c        | 159 +++++++++++++------
> > > ----
> > >  drivers/gpu/drm/xe/xe_sched_job_types.h  |  18 ++-
> > >  drivers/gpu/drm/xe/xe_trace.h            |   2 +-
> > >  6 files changed, 113 insertions(+), 93 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index e8bf250f5b6a..e3cebec3de24 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -96,11 +96,6 @@ static struct xe_exec_queue
> > > *__xe_exec_queue_alloc(struct xe_device *xe,
> > >  		}
> > >  	}
> > >  
> > > -	if (xe_exec_queue_is_parallel(q)) {
> > > -		q->parallel.composite_fence_ctx =
> > > dma_fence_context_alloc(1);
> > > -		q->parallel.composite_fence_seqno = 0;
> > > -	}
> > > -
> > >  	return q;
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index ee78d497d838..f0c40e8ad80a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -103,16 +103,6 @@ struct xe_exec_queue {
> > >  		struct xe_guc_exec_queue *guc;
> > >  	};
> > >  
> > > -	/**
> > > -	 * @parallel: parallel submission state
> > > -	 */
> > > -	struct {
> > > -		/** @parallel.composite_fence_ctx: context
> > > composite fence */
> > > -		u64 composite_fence_ctx;
> > > -		/** @parallel.composite_fence_seqno: seqno for
> > > composite fence */
> > > -		u32 composite_fence_seqno;
> > > -	} parallel;
> > > -
> > >  	/** @sched_props: scheduling properties */
> > >  	struct {
> > >  		/** @sched_props.timeslice_us: timeslice period in
> > > micro-seconds */
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index 2705d1f9d572..f75756e7a87b 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -366,7 +366,7 @@ static void emit_migration_job_gen12(struct
> > > xe_sched_job *job,
> > >  
> > >  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again
> > > below */
> > >  
> > > -	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
> > > +	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
> > >  
> > >  	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
> > >  		/* XXX: Do we need this? Leaving for now. */
> > > @@ -375,7 +375,7 @@ static void emit_migration_job_gen12(struct
> > > xe_sched_job *job,
> > >  		dw[i++] = preparser_disable(false);
> > >  	}
> > >  
> > > -	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
> > > +	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
> > >  
> > >  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job-
> > > >migrate_flush_flags |
> > >  		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> > > @@ -397,7 +397,7 @@ static void emit_job_gen12_gsc(struct
> > > xe_sched_job *job)
> > >  	xe_gt_assert(gt, job->q->width <= 1); /* no parallel
> > > submission for GSCCS */
> > >  
> > >  	__emit_job_gen12_simple(job, job->q->lrc,
> > > -				job->batch_addr[0],
> > > +				job->ptrs[0].batch_addr,
> > >  				xe_sched_job_lrc_seqno(job));
> > >  }
> > >  
> > > @@ -413,7 +413,7 @@ static void emit_job_gen12_copy(struct
> > > xe_sched_job *job)
> > >  
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_simple(job, job->q->lrc + i,
> > > -					job->batch_addr[i],
> > > +					job->ptrs[i].batch_addr,
> > >  					xe_sched_job_lrc_seqno(job
> > > ));
> > >  }
> > >  
> > > @@ -424,7 +424,7 @@ static void emit_job_gen12_video(struct
> > > xe_sched_job *job)
> > >  	/* FIXME: Not doing parallel handshake for now */
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_video(job, job->q->lrc + i,
> > > -				       job->batch_addr[i],
> > > +				       job->ptrs[i].batch_addr,
> > >  				      
> > > xe_sched_job_lrc_seqno(job));
> > >  }
> > >  
> > > @@ -434,7 +434,7 @@ static void
> > > emit_job_gen12_render_compute(struct xe_sched_job *job)
> > >  
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_render_compute(job, job->q->lrc +
> > > i,
> > > -						job-
> > > >batch_addr[i],
> > > +						job-
> > > >ptrs[i].batch_addr,
> > >  						xe_sched_job_lrc_s
> > > eqno(job));
> > >  }
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > > b/drivers/gpu/drm/xe/xe_sched_job.c
> > > index 874450be327e..4537c7f9099f 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > @@ -6,7 +6,7 @@
> > >  #include "xe_sched_job.h"
> > >  
> > >  #include <drm/xe_drm.h>
> > > -#include <linux/dma-fence-array.h>
> > > +#include <linux/dma-fence-chain.h>
> > >  #include <linux/slab.h>
> > >  
> > >  #include "xe_device.h"
> > > @@ -29,7 +29,7 @@ int __init xe_sched_job_module_init(void)
> > >  	xe_sched_job_slab =
> > >  		kmem_cache_create("xe_sched_job",
> > >  				  sizeof(struct xe_sched_job) +
> > > -				  sizeof(u64), 0,
> > > +				  sizeof(struct xe_job_ptrs), 0,
> > >  				  SLAB_HWCACHE_ALIGN, NULL);
> > >  	if (!xe_sched_job_slab)
> > >  		return -ENOMEM;
> > > @@ -37,7 +37,7 @@ int __init xe_sched_job_module_init(void)
> > >  	xe_sched_job_parallel_slab =
> > >  		kmem_cache_create("xe_sched_job_parallel",
> > >  				  sizeof(struct xe_sched_job) +
> > > -				  sizeof(u64) *
> > > +				  sizeof(struct xe_job_ptrs) *
> > >  				  XE_HW_ENGINE_MAX_INSTANCE, 0,
> > >  				  SLAB_HWCACHE_ALIGN, NULL);
> > >  	if (!xe_sched_job_parallel_slab) {
> > > @@ -79,26 +79,33 @@ static struct xe_device *job_to_xe(struct
> > > xe_sched_job *job)
> > >  	return gt_to_xe(job->q->gt);
> > >  }
> > >  
> > > +/* Free unused pre-allocated fences */
> > > +static void xe_sched_job_free_fences(struct xe_sched_job *job)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < job->q->width; ++i) {
> > > +		struct xe_job_ptrs *ptrs = &job->ptrs[i];
> > > +
> > > +		if (ptrs->lrc_fence)
> > > +			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> > > +		if (ptrs->chain_fence)
> > > +			dma_fence_chain_free(ptrs->chain_fence);
> > > +	}
> > > +}
> > > +
> > >  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> > >  					 u64 *batch_addr)
> > >  {
> > > -	struct xe_sched_job *job;
> > > -	struct dma_fence **fences;
> > >  	bool is_migration = xe_sched_job_is_migration(q);
> > > +	struct xe_sched_job *job;
> > >  	int err;
> > > -	int i, j;
> > > +	int i;
> > >  	u32 width;
> > >  
> > >  	/* only a kernel context can submit a vm-less job */
> > >  	XE_WARN_ON(!q->vm && !(q->flags &
> > > EXEC_QUEUE_FLAG_KERNEL));
> > >  
> > > -	/* Migration and kernel engines have their own locking */
> > > -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > > EXEC_QUEUE_FLAG_VM))) {
> > > -		lockdep_assert_held(&q->vm->lock);
> > > -		if (!xe_vm_in_lr_mode(q->vm))
> > > -			xe_vm_assert_held(q->vm);
> > > -	}
> > > -
> > >  	job = job_alloc(xe_exec_queue_is_parallel(q) ||
> > > is_migration);
> > >  	if (!job)
> > >  		return ERR_PTR(-ENOMEM);
> > > @@ -111,43 +118,25 @@ struct xe_sched_job
> > > *xe_sched_job_create(struct xe_exec_queue *q,
> > >  	if (err)
> > >  		goto err_free;
> > >  
> > > -	if (!xe_exec_queue_is_parallel(q)) {
> > > -		job->fence = xe_lrc_create_seqno_fence(q->lrc);
> > > -		if (IS_ERR(job->fence)) {
> > > -			err = PTR_ERR(job->fence);
> > > -			goto err_sched_job;
> > > -		}
> > > -		job->lrc_seqno = job->fence->seqno;
> > > -	} else {
> > > -		struct dma_fence_array *cf;
> > > +	for (i = 0; i < q->width; ++i) {
> > > +		struct dma_fence *fence =
> > > xe_lrc_alloc_seqno_fence();
> > > +		struct dma_fence_chain *chain;
> > >  
> > > -		fences = kmalloc_array(q->width, sizeof(*fences),
> > > GFP_KERNEL);
> > > -		if (!fences) {
> > > -			err = -ENOMEM;
> > > +		if (IS_ERR(fence)) {
> > > +			err = PTR_ERR(fence);
> > >  			goto err_sched_job;
> > >  		}
> > > +		job->ptrs[i].lrc_fence = fence;
> > >  
> > > -		for (j = 0; j < q->width; ++j) {
> > > -			fences[j] = xe_lrc_create_seqno_fence(q-
> > > >lrc + j);
> > > -			if (IS_ERR(fences[j])) {
> > > -				err = PTR_ERR(fences[j]);
> > > -				goto err_fences;
> > > -			}
> > > -			if (!j)
> > > -				job->lrc_seqno = fences[0]->seqno;
> > > -		}
> > > +		if (i + 1 == q->width)
> > > +			continue;
> > >  
> > > -		cf = dma_fence_array_create(q->width, fences,
> > > -					    q-
> > > >parallel.composite_fence_ctx,
> > > -					    q-
> > > >parallel.composite_fence_seqno++,
> > > -					    false);
> > > -		if (!cf) {
> > > -			--q->parallel.composite_fence_seqno;
> > > +		chain = dma_fence_chain_alloc();
> > > +		if (!chain) {
> > >  			err = -ENOMEM;
> > > -			goto err_fences;
> > > +			goto err_sched_job;
> > >  		}
> > > -
> > > -		job->fence = &cf->base;
> > > +		job->ptrs[i].chain_fence = chain;
> > >  	}
> > >  
> > >  	width = q->width;
> > > @@ -155,19 +144,14 @@ struct xe_sched_job
> > > *xe_sched_job_create(struct xe_exec_queue *q,
> > >  		width = 2;
> > >  
> > >  	for (i = 0; i < width; ++i)
> > > -		job->batch_addr[i] = batch_addr[i];
> > > +		job->ptrs[i].batch_addr = batch_addr[i];
> > >  
> > >  	xe_pm_runtime_get_noresume(job_to_xe(job));
> > >  	trace_xe_sched_job_create(job);
> > >  	return job;
> > >  
> > > -err_fences:
> > > -	for (j = j - 1; j >= 0; --j) {
> > > -		--q->lrc[j].fence_ctx.next_seqno;
> > > -		dma_fence_put(fences[j]);
> > > -	}
> > > -	kfree(fences);
> > >  err_sched_job:
> > > +	xe_sched_job_free_fences(job);
> > >  	drm_sched_job_cleanup(&job->drm);
> > >  err_free:
> > >  	xe_exec_queue_put(q);
> > > @@ -188,6 +172,7 @@ void xe_sched_job_destroy(struct kref *ref)
> > >  		container_of(ref, struct xe_sched_job, refcount);
> > >  	struct xe_device *xe = job_to_xe(job);
> > >  
> > > +	xe_sched_job_free_fences(job);
> > >  	xe_exec_queue_put(job->q);
> > >  	dma_fence_put(job->fence);
> > >  	drm_sched_job_cleanup(&job->drm);
> > > @@ -195,27 +180,32 @@ void xe_sched_job_destroy(struct kref *ref)
> > >  	xe_pm_runtime_put(xe);
> > >  }
> > >  
> > > -void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> > > +/* Set the error status under the fence to avoid racing with
> > > signaling */
> > > +static bool xe_fence_set_error(struct dma_fence *fence, int error)
> > >  {
> > > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > > >flags))
> > > -		return;
> > > +	unsigned long irq_flags;
> > > +	bool signaled;
> > >  
> > > -	dma_fence_set_error(job->fence, error);
> > > +	spin_lock_irqsave(fence->lock, irq_flags);
> > > +	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > > >flags);
> > > +	if (!signaled)
> > > +		dma_fence_set_error(fence, error);
> > > +	spin_unlock_irqrestore(fence->lock, irq_flags);
> > > +
> > > +	return signaled;
> > > +}
> > >  
> > > -	if (dma_fence_is_array(job->fence)) {
> > > -		struct dma_fence_array *array =
> > > -			to_dma_fence_array(job->fence);
> > > -		struct dma_fence **child = array->fences;
> > > -		unsigned int nchild = array->num_fences;
> > > +void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> > > +{
> > > +	if (xe_fence_set_error(job->fence, error))
> > > +		return;
> > >  
> > > -		do {
> > > -			struct dma_fence *current_fence =
> > > *child++;
> > > +	if (dma_fence_is_chain(job->fence)) {
> > > +		struct dma_fence *iter;
> > >  
> > > -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > > -				     &current_fence->flags))
> > > -				continue;
> > > -			dma_fence_set_error(current_fence, error);
> > > -		} while (--nchild);
> > > +		dma_fence_chain_for_each(iter, job->fence)
> > > +			xe_fence_set_error(dma_fence_chain_contain
> > > ed(iter),
> > > +					   error);
> > >  	}
> > >  
> > >  	trace_xe_sched_job_set_error(job);
> > > @@ -230,7 +220,7 @@ bool xe_sched_job_started(struct xe_sched_job
> > > *job)
> > >  
> > >  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > >  				     xe_lrc_start_seqno(lrc),
> > > -				     dma_fence_array_first(job-
> > > >fence)->ops);
> > > +				    
> > > dma_fence_chain_contained(job->fence)->ops);
> > >  }
> > >  
> > >  bool xe_sched_job_completed(struct xe_sched_job *job)
> > > @@ -244,13 +234,24 @@ bool xe_sched_job_completed(struct
> > > xe_sched_job *job)
> > >  
> > >  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > >  				     xe_lrc_seqno(lrc),
> > > -				     dma_fence_array_first(job-
> > > >fence)->ops);
> > > +				    
> > > dma_fence_chain_contained(job->fence)->ops);
> > >  }
> > >  
> > >  void xe_sched_job_arm(struct xe_sched_job *job)
> > >  {
> > >  	struct xe_exec_queue *q = job->q;
> > > +	struct dma_fence *fence, *prev;
> > >  	struct xe_vm *vm = q->vm;
> > > +	u64 seqno = 0;
> > > +	int i;
> > > +
> > > +	/* Migration and kernel engines have their own locking */
> > > +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
> > > +	    !(q->flags & (EXEC_QUEUE_FLAG_KERNEL |
> > > EXEC_QUEUE_FLAG_VM))) {
> > > +		lockdep_assert_held(&q->vm->lock);
> > > +		if (!xe_vm_in_lr_mode(q->vm))
> > > +			xe_vm_assert_held(q->vm);
> > > +	}
> > >  
> > >  	if (vm && !xe_sched_job_is_migration(q) &&
> > > !xe_vm_in_lr_mode(vm) &&
> > >  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q-
> > > >tlb_flush_seqno)) {
> > > @@ -259,6 +260,25 @@ void xe_sched_job_arm(struct xe_sched_job
> > > *job)
> > >  		job->ring_ops_flush_tlb = true;
> > >  	}
> > >  
> > > +	/* Arm the pre-allocated fences */
> > > +	for (i = 0; i < q->width; prev = fence, ++i) {
> > > +		struct dma_fence_chain *chain;
> > > +
> > > +		fence = job->ptrs[i].lrc_fence;
> > > +		xe_lrc_init_seqno_fence(&q->lrc[i], fence);
> > > +		job->ptrs[i].lrc_fence = NULL;
> > > +		if (!i) {
> > > +			job->lrc_seqno = fence->seqno;
> > 
> > same question of the first patch remains here...
> 
> I answered in the first patch thread.
> 
> 
> > 
> > > +			continue;
> > 
> > but here my doubt goes a bit beyond on why you only init
> > the chain the non-first one.
> 
> The fence chain structure combines two fences into one.
> Either two LRC fences, or a previous fence chain plus a LRC fence.
> So on the first iteration, we don't yet have two fences to combine, so
> that step is skipped. There's always one fence chain less than LRC
> fences, and on non-parallel jobs there is no fence chain at all.

it makes sense. Thanks for all the explanations.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks,
> Thomas
> 
> > 
> > > +		}
> > > +
> > > +		chain = job->ptrs[i - 1].chain_fence;
> > > +		dma_fence_chain_init(chain, prev, fence, seqno++);
> > > +		job->ptrs[i - 1].chain_fence = NULL;
> > > +		fence = &chain->base;
> > > +	}
> > > +
> > > +	job->fence = fence;
> > >  	drm_sched_job_arm(&job->drm);
> > >  }
> > >  
> > > @@ -318,7 +338,8 @@ xe_sched_job_snapshot_capture(struct
> > > xe_sched_job *job)
> > >  
> > >  	snapshot->batch_addr_len = q->width;
> > >  	for (i = 0; i < q->width; i++)
> > > -		snapshot->batch_addr[i] =
> > > xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
> > > +		snapshot->batch_addr[i] =
> > > +			xe_device_uncanonicalize_addr(xe, job-
> > > >ptrs[i].batch_addr);
> > >  
> > >  	return snapshot;
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > index 990ddac55ed6..0d3f76fb05ce 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > @@ -11,6 +11,20 @@
> > >  #include <drm/gpu_scheduler.h>
> > >  
> > >  struct xe_exec_queue;
> > > +struct dma_fence;
> > > +struct dma_fence_chain;
> > > +
> > > +/**
> > > + * struct xe_job_ptrs - Per hw engine instance data
> > > + */
> > > +struct xe_job_ptrs {
> > > +	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> > > +	struct dma_fence *lrc_fence;
> > > +	/** @chain_fence: Pre-allocated ninitialized fence chain
> > > node. */
> > > +	struct dma_fence_chain *chain_fence;
> > > +	/** @batch_addr: Batch buffer address. */
> > > +	u64 batch_addr;
> > > +};
> > >  
> > >  /**
> > >   * struct xe_sched_job - XE schedule job (batch buffer tracking)
> > > @@ -43,8 +57,8 @@ struct xe_sched_job {
> > >  	u32 migrate_flush_flags;
> > >  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB
> > > before payload. */
> > >  	bool ring_ops_flush_tlb;
> > > -	/** @batch_addr: batch buffer address of job */
> > > -	u64 batch_addr[];
> > > +	/** @ptrs: per instance pointers. */
> > > +	struct xe_job_ptrs ptrs[];
> > 
> > instance and ptrs sounds so generic here...
> > I'm bad with names as well... but I'm wondering if it wouldn't be
> > better
> > to s/xe_sched_job *job/xe_sched_jobs *jobs/
> > and then this one here is 'a' job: struct xe_job job[];
> > 
> > Another bad option xe_batches_and_fences batches_and_fences[]; :/
> > 
> > >  };
> > >  
> > >  struct xe_sched_job_snapshot {
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > b/drivers/gpu/drm/xe/xe_trace.h
> > > index 6c6cecc58f63..450f407c66e8 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -272,7 +272,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > >  			   __entry->flags = job->q->flags;
> > >  			   __entry->error = job->fence->error;
> > >  			   __entry->fence = job->fence;
> > > -			   __entry->batch_addr = (u64)job-
> > > >batch_addr[0];
> > > +			   __entry->batch_addr = (u64)job-
> > > >ptrs[0].batch_addr;
> > >  			   ),
> > >  
> > >  		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u,
> > > guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x,
> > > error=%d",
> > > -- 
> > > 2.44.0
> > > 
> 
