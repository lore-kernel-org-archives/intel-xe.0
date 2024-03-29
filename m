Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFCFCD1283
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 16:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B066B1127C4;
	Fri, 29 Mar 2024 16:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXYMeYoa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F55A1127CC
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711731091; x=1743267091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GmBveek4A+dJCMYCI3v44fb4H0cLIrdYyunjK6JD7aw=;
 b=LXYMeYoaXYIHtSNLyUdTJKvEF1tO3xlG/kbDqVy7tROtAOF/zIrhE3u/
 pCFKGq8z1XqlEkN8fP5OhUDQLMDZUbu1n1KZRivMToTpJVr3sswLkJT6N
 b2/4BIo2BCVurIA7sSE7gfjETKTFlpQweUTQ829e9Dpu+aAED576Nr1KT
 UDc17R2ObqtQniuczFvvVB7ZIAvQnVSsNv1etxIJtzNHqoIAaYV2YDbXR
 1bUPfJ6Nc58nZb8GYgxZwzlo98/4iIaVSMpJ70fYHZ2FXqkZbQSFj3YGl
 30+NJcokTwWZ11wFm8lYVRNlMIx6UTdNerON1rpMIH4QzJCJXwQFRPV5i g==;
X-CSE-ConnectionGUID: KUjDSVOTTdiJIS3WHZOEGQ==
X-CSE-MsgGUID: NjUIEDDPQsupX9IizLR6Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10737324"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="10737324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 09:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17001026"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 09:51:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 09:51:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 09:51:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 09:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VooUnSON4Fb49cZSA05jJIDY/CUUZbWmrFEeWbzzmPLEqwuVexAgScRsrEB26/9rPJudTMt7IqkZTHAaUfyteTLuoWE/YOKLEG4gmf9DoZe3INF8XO10G4PFelnigio/QCqDLPlhU7B1Tw57ILdkiSRjHUaLtYRQXw1LtSvZLsmF36WQdjUpSnan+YqQJz36IjjR2GFmXJYs9DycTetqq0x6MXH7GY2NAJdGDZjtvqXutws9FT188sa7izFnP0lOmOfiANuRCRN7G8WerhI/2NuVBlXBbxR4OusXDepg26mTkfzSe/y3TBY0pFr65NtiBsdtblxAx5JW+zhOrybnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azW81D3/K+jaTKLjRMAljQZLbb+4Et1n8BjaQoWZaZI=;
 b=jPDFZROdNTcZg6NOvWY1ugiFOKi+L8qwURlDR/PmPrptBPwn3l1P1Na++AMeRE0DbTJ2wczrbAAQEEW3cNrULrimzAIDKbQeHsk2t3X1gtx5LUz5zOPlGUoNN2Yumlmv1S9fSUOiD9hnkq6Ffkdo4Cc/6Bscb1i/CL4kwBNxsrnelosY4tPXMNhUFJzLrQnU+QBecTFpUJNVV3uL3qp+lAceaSX4l8x1gVJqE+9vp9oJFzkc4XW851hv9nBqk2Gn1GivV0YfmebB5r5BAw6BqTqxyEaD8oyD3sTYIzg1KX51BQ3bCJ/x5pknFBEsw/r6KcKXx4mLlYS1sJcgRwwiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 16:51:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 16:51:26 +0000
Date: Fri, 29 Mar 2024 16:52:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <htejun@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 0/3] Rework work queue usage
Message-ID: <Zgbx0cWZXvpT29ql@DUT025-TGLU.fm.intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
 <ZgXBcpRv_FTIoq91@slm.duckdns.org>
 <ZgXFYWuukcLjMtmf@DUT025-TGLU.fm.intel.com>
 <ZgXHonaCuJgnCJgR@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZgXHonaCuJgnCJgR@slm.duckdns.org>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7972:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcwJTvZLIATUdZHKnSgClAFcWdsvhUcZU19Xo3lHb5rCPE48J0tsoh4Sq9gF1AuFEcOMMZnMzEh/Fj8cgyTWxdQYxpSB0JWDbttYLZPbHyKl4jbypLyYE1YbGlqzZucKcKW8vrebUmaa7IrQ6BLbazv7PrxDctmG1Jw9QZPfoRSaDbSd3R5fFVoQfLCG2PZMd9s1C0Vi93PAI2O+/QABT77ZHbfhzbvWFkYlVM+T1Qriq91fPUV/gRKJt1a55dz8dyoEwWZ7BQrezIoXccFNCvgzi9XZvhpMUTtOqBIp7Zlr86WEl+wz+Aa9zXM4f1zUWdM8zRrLaJ1pXMknTVu1o5C0p93HeI6cwfC043RQVoRuiQEbaHsB1UkojqpjgfD/c+iHFxF+cGGz9ipIbvmpy8v+QxmBE61omhHbRQ3FrJ6759D+JvlzA0pSpLdsWHiJz2thvN0hsHVIrWW7AtlemLv3pxtx3MsO5vnBpA93nOcJgtfpbz3Mwx09VlFXR9lmkpzlKtreg3RMwropF0T3qluRKEZvhB3kx5Ld4iTxsByt8wbfIzE427kLFimRThC/02sQYc8tG0kxVV/gGsD7RYEktdEgzETYcWzXq5SNrA46E95rGi4crc92pNV2EO94zamALFVd9oB5nNNXEOqSZYW+RPUzayniy3hwKawkWgc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?628zxfdksd0NUpKnB1lelSdNmlf2z5GUHTRflctc+Sn1DJfi1hYW88/ZSHxU?=
 =?us-ascii?Q?SoVQ1ev6eynWIN4hY2T9VucfNqFwNoWMzq0ittbbMHL3bvKI/qadnpkEuxb1?=
 =?us-ascii?Q?B/s1g4ah7f8fjnJwwjZJOs2nTacMf4JUt0bclfZncDk2aQiDetF2Rd33h3bs?=
 =?us-ascii?Q?gQ/Yg1uMjuJsMglttuVbOG63K3EaNTLm3cglimILDwjoeSiBAT5yuByNUqEN?=
 =?us-ascii?Q?mCNzqkfA7V5usdzMi16J2R3Iigk75rS2xP7+SUl8wtC+Lcx55F5KWS1qTOgu?=
 =?us-ascii?Q?KNHmX0daZgQRkiucG15QM2t7xJNFy/v3lneEXIByZrkaCy+ub2812BDNs74F?=
 =?us-ascii?Q?pGv6x74kzw9gDe25A7dqxSXPubz2Jj53IV8vf1H5BqdiGSRhF8LWzNc4XdqO?=
 =?us-ascii?Q?6OsBcNqfC++/pJXn99lDfBVjK638F2jNfY0wqIQIeXbnj4AA7Hf70x0HhOZe?=
 =?us-ascii?Q?8dTcU0Rh1UuCh0/fFSs3sn80j1N1pZMybByvr/pWZtqajVKxYIZ/Z5ByRkUN?=
 =?us-ascii?Q?pWe3+1CNT9rdvVKki0kGiawVsqQOQf1g+XE8Lo0ypfv3MtchYK9Qfa+7qNs9?=
 =?us-ascii?Q?31vMLSCy4ZO3DRYA81PDRcVFzFMcdHlB1zuYRtuHPNWRSXnov3YkK4kXENgM?=
 =?us-ascii?Q?hIkwwWugUb2HAZ76QjGRQarbkgWCJ0itA4G9qPod6ZHkrnhh9eqiQay80qOb?=
 =?us-ascii?Q?ldumDxLTFSOWpQ5t7dhAo1Tz6t/4fetStghJLB+nBfVQa4lW/8JY+KHgznJZ?=
 =?us-ascii?Q?39DedQmswOCd9pQp1Hmw954RHgf9IvbLlsMMWc10Za5nAV8cTYGYH6+YkTEJ?=
 =?us-ascii?Q?bogxEjYJ3oYLoTuk9lazQaGNtHpzQZXoYtfGjTzEbBFLz9lOHwOY7SceDQ+q?=
 =?us-ascii?Q?daV4JVTm31vn59BHYZKJSldKBW4gtOrRDpH6o00D3Oda4zppl1DN10vUJh1l?=
 =?us-ascii?Q?Sua/7fd/9tIh7YNB7CWmUeCfCpWKF4zOFOOkvqcIYhFXBTpI90GJWtj4yuh0?=
 =?us-ascii?Q?F4WW1DxQSP96OtlJpTQYWCo31b5u0WBzZc/CTMWZ11OoRL4fvv8jaQuyc3Og?=
 =?us-ascii?Q?kBTdEnG+P/AtKxgL9mm/1niZ+M4HVVYN8jflmNRQrMb3UvlpyT8b91H70LJF?=
 =?us-ascii?Q?mBEgfCiPZqf4vvqpwnt5Z58jGtBxetNmpjkcYy30cj0daqAzgqGB/AGSTaXE?=
 =?us-ascii?Q?gY2YM4sb0h7y5buhsNQQiKxYQl7vYvCjxrmmrO0J8hJFzL7fhf6PS0xMFW9p?=
 =?us-ascii?Q?yT+TDpKdd2U5gH8lX2eWAv6/PdIxHDND+Z8YE8vpFvkptjhsos1WtXr2RgyW?=
 =?us-ascii?Q?MiK+O1yPMwNgRdpGx2gXFFLsK/p1E/1YSSorWYY4yaMol5bJT3ERbFpFroY2?=
 =?us-ascii?Q?yXnfqz+SNPZx+kyg0PwRGRsXMxlHm6qRYoi8HbgwAUUaOuT/juoJbGjGvoIm?=
 =?us-ascii?Q?4zPKk05nzoaU6WcOWzPSg+Bi1aGbqCO9B7BBj8etQshtyDzjHv5Vjp/LitLP?=
 =?us-ascii?Q?bIJz8jUfSIazPIQKqEpvAf6P7T8Ey3GWFwOlIoIAgLNp8YucthHOQ4abawAe?=
 =?us-ascii?Q?Si7aROw9XDq1yqbCxl4NlnS2pqOIlPQxBTnIrG8XObBS383SYrGg4IgkR7EB?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9af3312-3095-47b2-f5a8-08dc501078f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 16:51:26.0324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ/HRZHR17Yf36QpqgeIMQ194gGec2ivXGG6sJRrYSwGArjhAXOp9T5N9wXSwzdcMbjRnp2kvKHs+TS34tKXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Thu, Mar 28, 2024 at 09:40:18AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Thu, Mar 28, 2024 at 07:30:41PM +0000, Matthew Brost wrote:
> > The test creates 100s of exec queues that all can be preempted in
> > parallel. In the current code this results in each exec queue kicking a
> > worker which is scheduled on the system_unbound_wq, these workers wait
> > and sleep (using a waitqueue) on signaling from another worker. The
> > other worker, which is also scheduled system_unbound_wq, is processing a
> > queue which interacts with the GPU. I'm thinking the worker which
> > interacts with hardware gets straved by the waiter resulting in a
> > deadlock.
> > 
> > This patch changes the waiters to uses a device private ordered work
> > queue so at most we have 1 waiter a time. Regardless of the new work
> > queue behavior this a better design.
> > 
> > It is beyond my knowledge if the old behavior, albiet poorly designed,
> > should still work with the work queue changes in 6.9.
> 
> Ah, okay, I think you're hitting the max_active limit which regulates the
> maximum number of work items which can be in flight at any given time. Is
> the test machine a NUMA setup by any chance?
> 

Not a NUMA setup in this case.

> We went through a couple changes in terms of how max_active is enforced on
> NUMA machines. Originally, we applied it per-node, ie. if you have
> max_active of 16, each node would be able to have 16 work items in flight at
> any given time. While introducing the affinity stuff, the enforcement became
> per-CPU - ie. each CPU would get 16 work items, which didn't turn out well
> for some workloads. v6.9 changes it so that it's always applied to the whole
> system for unbound workqueues whether NUMA or not.
> 
> system_unbound_wq is created with max_active set at WQ_MAX_ACTIVE which
> happens to be 512. If you stuff more concurrent work items into it which
> have inter-dependency - ie. completion of one work item depends on another,
> it can deadlock, which isn't too unlikely given a lot of basic kernle infra
> depends on system_unbound_wq.
>

That appears to what is happening before my series.

> > > > I think we need some of this information in the commit message in patch
> > > > 1. Because patch 1 simply says it's moving to a device private wq to
> > > > avoid hogging the system one, but the issue is much more serious.
> > > > 
> > > > Also, is the "Fixes:"  really correct? It seems more like a regression
> > > > from the wq changes and there could be other drivers showing similar
> > > > issues now. But it could alos be my lack of understanding of the real
> > > > issue.
> > > 
> > > I don't have enough context to tell whether this is a workqueue problem but
> > > if so we should definitely fix workqueue.
> > 
> > It is beyond my knowledge if the old behavior, albeit poorly designed,
> > should still work with the work queue changes in 6.9.
> 
> So, yeah, in this case, it makes sense to separate it out to a separate
> workqueue.
>

Agree. Thanks for your time.

Matt
 
> Thanks.
> 
> -- 
> tejun
