Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF04CCEFC35
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72010E1BA;
	Tue,  8 Oct 2024 17:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICyXZFKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DB710E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728408869; x=1759944869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5m4U+QWQydn9WdxK5DUgd/MKUDNqIQ+5ZiYUP3JU+Pg=;
 b=ICyXZFKggKlVFMkNW9uM5Gs3UDmAO562TB8zIIxjhjP/Bm01VXgVbIIz
 fC1Q6uIip7H/PG7XeD5eH81hITjU+AL57FxBb0WvJV9Ng2yQi/BuVMyh/
 9n4lWRE/o832rYNnKpN9aHlCcdIKsv0yGsZzb24zsgqiPzVhqrgpmdsM3
 XdkbLbEweb1p4lJSdGtWYXS361/LkRSwyzC3eJcI9fukXtvyjJKAWkJTg
 41IMtKyzO3AgEtol8DfUw+a9Tm/Jh8kOTt90Qg5yQQI5mK68aEzTgrEj+
 v9hYVf4ROuQ/6FI1CQ4pnT2VeR7D7Dk+c+wg7T2U0kkXdGxHENCXusyVo g==;
X-CSE-ConnectionGUID: IEYN5PGfR/CZGWWCJg4MkQ==
X-CSE-MsgGUID: USTtS/qyT6a3B1RNB2f1mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50165799"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="50165799"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:34:28 -0700
X-CSE-ConnectionGUID: get0omF2TTSLA+JekXF3IA==
X-CSE-MsgGUID: TWO8M/7uQdyNmvbw2UYD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="113393616"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:34:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:34:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:34:26 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiH12dHLy7Lm9ugoDk3wKMSOUnXRGPKsoLyFIHVFyDsk6IMyFVrg+M7wcdeV68rTyPLnCCPJuniPADy/gGfPRgDaEfGKsPD+yq45/G7TNnYi9CMAACZdncCaTT4hIWfoq2FmmgSDDyc6428/2cwqnoi333io0Iuk0Bz+cjkG2UIcw+21Ls4B6AJNEqoqYu5SruH+Xl9I3Bawlq84WMv5+0+ycnUuLaY6/Vupwt9yuCCh1MMAYBESF6xNN2Kyb2fjMWnBRi2DuGZgO8LcYvLKOra00Kiayyo8KoiZg9brrx8VUjO//cE1c/FEIEu9PVZILfWSS4TCVmF3qGh0c0gjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWFaoJEEWDzNQgqOoaA+DtAHZw4YJCtXXTc+5rvux9M=;
 b=tHNc85YKapOAJ/NQ39sE8SbLcOnM1k9WEBpfAx9fEZo5nwF5Ry7xbVYUC1y46yTJz8snBk6q5ICMjzd6flsJEahH2pLZlci8jkZnHekex5Lb1NOu6xa6ydf47gU3z0c1ILKKBm0Qipm3j+fQdsKWI64uCyAplDKmswPgnq5FuAV/LwB7gDMpgvB+kMzR66woZSZDUx6DZLRhkoqdDYNgme/NQBKXBfBmwD0KLGWc/itvXg4gLXagYCoDUOmz2ELqajLTluleFoTzNYVEOS9du1atadlLh4gv59Dg+cR3EclyCyV/2PZnRpjnIWdA/nkqHvIy5o1j6mmCPUmxp4zzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 17:34:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 17:34:17 +0000
Date: Tue, 8 Oct 2024 13:34:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rui.zhang@intel.com>, <jani.saarinen@intel.com>,
 <srinivas.pandruvada@intel.com>
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline
 timer during lapic timer shutdown
Message-ID: <ZwVtFJzWMUrTwg5C@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241007135242.3028131-1-karthik.poosa@intel.com>
X-ClientProxiedBy: MW3PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:303:2b::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW6PR11MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d76ca8e-97a0-4772-ee9a-08dce7bf6ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HxoskVpF1cREtLgfjfI4ZeOyBAL00lT1JDuviBEQi7baduqZb6nHeldgmU46?=
 =?us-ascii?Q?j8Ck6RZk/M8xlvJnu6lkv7IoXDKCnxlFVsJIO9ri35EEZma8rHZ9b+3CIu0S?=
 =?us-ascii?Q?AUhHKkZwa24WyYMfmMSkBEGh+1kkcvNh13do2YTZx9r18b/QBRmrudNt7JFP?=
 =?us-ascii?Q?x3xNtXelYpTGH0uhcnoLiuefd4ZNFE4uivGY3U6mbDUY6Vco4OT10Z5Iux8l?=
 =?us-ascii?Q?wEwXvxEq6bu7qC+F9XNbs5OmXYivG99BeUZ2qsapYMJ047CEfJjwlwk6Z+uP?=
 =?us-ascii?Q?VvMIanpsV5RthrJ6YMCwTmFrh8xn2ciXGbnGru/y6w3cA4ZVeOIYifxsNbcH?=
 =?us-ascii?Q?aDFvGZc/bNXao4a+OGpWVItxTT0r7aqvOWMNgB+FHvssRy4FGJcQ7eO9Qvs6?=
 =?us-ascii?Q?TYEJKI1xmA2jyIHU7A8pwPSMP3mMDY2GVEnpQE7jZWQLV6OLK56y7IwO4LMj?=
 =?us-ascii?Q?wdYAANckQ0JJJNUGutwqdkJvkyiB8lO+SSoGe6O0qud6iMCjaJXzuup/jkUG?=
 =?us-ascii?Q?+JtWOLiL3kKkrPaZzHGLtWfe6yJE7hL9BfWbCpR+JHs+rrH4n2AdlSJBiVPP?=
 =?us-ascii?Q?gzdo9BGm+w3RrP/CDw5k8dH8cxLMaLBlV+8hn2ks49F4tNXZfi3dHybwKmgO?=
 =?us-ascii?Q?0HQKT8gRWP/RYPorCf7t2Qip0F6Ha0ooYfUavY1GML/lvlwjq/OOUJXVf0bf?=
 =?us-ascii?Q?dSsjQIHsw3F4XjYebKwbdJ/JmDUC4wX4Lp1tKH11gyVM2Smu/h08DOkwuTV5?=
 =?us-ascii?Q?nUEiPP1wpPi5EksNypKWuFcET7krOOnx4KZnHrAlfB7uXf5lXfW3b0OA+kpv?=
 =?us-ascii?Q?+w2/EJhOmzH/L+QDY2rSHZsHj1jKJp5+TNCem31jnUcMMxcmjRp7m4auI0dR?=
 =?us-ascii?Q?cOP7fuk2gtdVk/l3mRDqiKZCfqhpFgADX+dKCCfsisurs+iCIY6E/GpKnPjJ?=
 =?us-ascii?Q?fz2u/rrxGSsU/odxhxIb9KqJFN5Ea1ZW3r9dmWYZB754TqV/u2fT8MnMLo/V?=
 =?us-ascii?Q?lkzWNGpL/ZKwIf9p0DDYflzkQfxa+KdveFQun9Uqpywy9w8nofheOvFsWX3O?=
 =?us-ascii?Q?sQZFSgpMbNw2WlDf3NPEYa9YV0Xt58AP9PmtBq7MscaHmn9G5WWVrh6YOczq?=
 =?us-ascii?Q?Ru+S/JajdvJc866nRoGuc/X7AyxGT4Jl7pU5HR4OB8YyhffQWvCorJvkBspV?=
 =?us-ascii?Q?AOBNL+N2Q/clfI9sIqlU6AViCMNco6rCd17KO2jiBPxYaMCDXbl1Wpz6+68?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rfu6KmEpI+xQOa1UqLM1XY+ZwDOe3dBDLCXiYLx6PNBSMF1B/zG6kuwBot3Z?=
 =?us-ascii?Q?MSc7mSIMU27Ku5RD4mDGqmzExW8W9e/iKAq+dtfpL2xrrdeER9+IjGHmMZRl?=
 =?us-ascii?Q?9pnAK+fFvdsCO373f5wwdt+Ap5vdvt1D5RS008m5KnySpPKcQzO4xlMA+4th?=
 =?us-ascii?Q?MptVR1P38WkzVsIM50JjvnM5altDXl2frqbPxpt9ogOcEND+wbpeYyFPIOEk?=
 =?us-ascii?Q?JqpzytJkEcWxt/CpbRrGkt1o184/L3oVkx1N3Z8uBENS/9tyb/GGcre0zyXb?=
 =?us-ascii?Q?CmP3EGitjIFxmQJZhEGCVkU5xXJjuu4GaaXtZT5TtqAwtyqUVwJFA0POACTO?=
 =?us-ascii?Q?e6YDhq/cTMToXzvec9ReaD0QlKMgODH++Ws3NUEYw3cH6KhqSf1TZG//G5dF?=
 =?us-ascii?Q?qiL4tHewdvSIiVy2VNEDC6Od9VK/uqtU2ekwWrzc0rI7mQ0MvQl/vUgOiKXU?=
 =?us-ascii?Q?hikN3Tx8Tnx12BUcJuvGobzSG3Q3XyuRUSpxPGTOL6XmUhpSTh019OCUr5yQ?=
 =?us-ascii?Q?p0ddkYg0dNt58/VDQ04HELOwGrrYkK0RYVumTY1nmbrfqPgCS9OksePGRTV5?=
 =?us-ascii?Q?pLfldTlOxjtzK3JqyTcUtv/kAxxpE2Yc44kJnHySD16vkEevR4CqgkOJO4r9?=
 =?us-ascii?Q?2GXKOp+NHLRE8qdg3U7Ya8K6s1vrCnRZW82bmxSKXPKx/+Yfw1k+wMKjkdX5?=
 =?us-ascii?Q?YU3zIbnq7xdUPmEV3daqBj7BF9ysHAlmFbX82kMD8VlRr8wYuPgoDCixFbzn?=
 =?us-ascii?Q?6BvcDXNENhGMggxR0RV1amvqCA21bfukEKu8VWyBIpgZaH2Bpz/h6ZEQ9HvO?=
 =?us-ascii?Q?4JeBjdPzhKQTgcy0ttNsvXU4t1VbPA9vPwoQUB8iDW3ZxENLvpMJHqsr2Wbo?=
 =?us-ascii?Q?YH7Ea1UqkNpudXxAKE2hEEGLjT6Eu8SHvLr/L/ifyGnqHxG1HosK/MP/5YhD?=
 =?us-ascii?Q?APBulLazRPytL63e5ERUtJ+QGPknqdNAbpq3Gb2lgQFJgMHobubYhTjkYmqA?=
 =?us-ascii?Q?WUHvRUAWMM2qnPPQETrb+HHCyhGA4UwsY8VHnQ/uvovNvO9k7F9Nw2/qyE3R?=
 =?us-ascii?Q?WP3FlyXtd7eAUs36LHdR90lY7pEMIcLM4+MZS/mbi3uuDbNM9rjaIqbWvO+y?=
 =?us-ascii?Q?YE3Q2MhBI6fTWPx8m8CkA/FOzFDFlr/pCKI3t/0APU0h13cgB5OkQCn47b69?=
 =?us-ascii?Q?zf3BjsZ4xzlQJBTvdBjHZm63buZ4JpTq20nH8F77ToncxYq/uCs7+HD6NfPK?=
 =?us-ascii?Q?c4fw2BTusid37frfLwZV7d0hEIv+So+uKAAtIwGnzhMb5Z8cBqGwfO9DVKiN?=
 =?us-ascii?Q?398YlTmMOErza3ys4wkqHnVwf3NqAtYGsGunrZudMVeQSgsvCcwTDncCu1KX?=
 =?us-ascii?Q?GsIx6VpDLuIMvGrxRcute9IEZoZTJkzz/QmPs2WXmioVUl+5rrP2zTRIpQNP?=
 =?us-ascii?Q?Mcr9nDJLNQ6XDJ67YVVpdz9u9bvq2rlisThZfeDRsdRwA/LynH79/e82iS3f?=
 =?us-ascii?Q?BlGjesoTG1qXbkJMrdUqGD+gCthvlOxhO+krUsNIH82yKlSZ3NFLRorm4kEf?=
 =?us-ascii?Q?XANo9/P8Gia3YDAH8TmPhS87ltz67dYA+x831zeRWG5ll2nsNT531RxShO75?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d76ca8e-97a0-4772-ee9a-08dce7bf6ee2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:34:17.2163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GVIICDHy7nLLNvz1nopeEBLU2oYpx5/pv/sUqGkXZjbiq1ZRatz19tBL0Aj3uw87qiXt1FbwKX9OQPRb0DA3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
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

On Mon, Oct 07, 2024 at 07:22:42PM +0530, Karthik Poosa wrote:
> From: Zhang Rui <rui.zhang@intel.com>
> 
> This is a core-for-CI patch for
> https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
> 
> According to Intel SDM, for the local APIC timer,
> 1. "The initial-count register is a read-write register. A write of 0 to
>    the initial-count register effectively stops the local APIC timer, in
>    both one-shot and periodic mode."
> 2. "In TSC deadline mode, writes to the initial-count register are
>    ignored; and current-count register always reads 0. Instead, timer
>    behavior is controlled using the IA32_TSC_DEADLINE MSR."
>    "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR disarms
>    the local-APIC timer."
> 
> Current code in lapic_timer_shutdown() writes 0 to the initial-count
> register. This stops the local APIC timer for one-shot and periodic mode
> only. In TSC deadline mode, the timer is not properly stopped.
> 
> Some CPUs are affected by this and they are woke up by the armed timer
> in s2idle in TSC deadline mode.
> 
> Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0 to
> MSR_IA32_TSC_DEADLINE.
> 
> Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when available")
> Link: https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/

The problem I see here is that this seems stalled. No review there. Is that merged
in some branch and moving upstream and to stable?

Cc: Zhang Rui <rui.zhang@intel.com>

> References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344

The right reference link we should have in this topic/core-for-CI patch
is: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2766
showing the why we need the patch.

https://drm.pages.freedesktop.org/maintainer-tools/committer/core-for-CI.html

But was this really confirmed?

Anyway, I'm hesitant here mostly because I don't believe we should add this patch
if that is not getting propagated to Linus and/or stable trees.

> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> 
> ---
>  arch/x86/kernel/apic/apic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
> index 6513c53c9459..d1006531729a 100644
> --- a/arch/x86/kernel/apic/apic.c
> +++ b/arch/x86/kernel/apic/apic.c
> @@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct clock_event_device *evt)
>  	v |= (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
>  	apic_write(APIC_LVTT, v);
>  	apic_write(APIC_TMICT, 0);
> +
> +	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
> +		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
> +
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 
