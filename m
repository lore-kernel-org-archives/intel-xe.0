Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC7CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 18:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643C310F3C9;
	Mon,  1 Apr 2024 18:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAX6rV2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E57E10F3C9
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711996784; x=1743532784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nsseakwpnLyv7sYJtLjO+6lx99fNkwT7Kp9FY71zgCU=;
 b=hAX6rV2neiwbCtMZGWmAvaOwsxFnHp55vDBJZjNyhaRmrockyN8wurvq
 UspMNDrJxUaNIApcsdvhFlpj8vrn9PqfH9zQK5c+elo3tpRVVt8a5rtbX
 G1s3fu5b69LpNITlj0/36f0aXayH1O33n94w9tmftfCMPVAGo8ogaMeje
 uzzgyiWHyCSciPNtQtAznhwe/mB7xfaGjySnA96Zgi5TF0T+JNSn61Eqy
 AS5Eri7wPT+cCJHMnfgv65eV8rrbBw3zgDRnooVTxKxYxfD0BQzMPsRAH
 PNLVNY3tuYpTuEvgngzvbxcVnbJJXk5VxuommXqLsByjcfzGHuQSb8TiA g==;
X-CSE-ConnectionGUID: 5McmVgYvQnu1f052JZ0t4w==
X-CSE-MsgGUID: +JIwijwHSDCM/BVyI7RpkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17708843"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17708843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 11:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="48794412"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 11:39:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 11:39:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 11:39:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 11:39:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 11:39:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbIhzWL9QW+JdJ10dgxSXdnOHYxQ2yHS2UpwIixgubKy1xxJVtlRWwMsQgyLvmzu8ISbhl77MTn2NUMMOIMaovLK8V2BV9PJwEhh7GHMRZMsBvpwUPx+xel+d0RklTg7MOVIQFPmCXTafhT/T+mZ5W5mLNJAmW1TLcNu5nCxP1ihVNr003/aowQK+8sabnex9AeOq0XvQqTRCpX6kmM9sQ6F9mFV/2ua/jNOA1KC2zR5zSSDFidwK/g2oslO3HGAPipcC7MT6DsELNCk65k1cUaAsvKKZ368nOo8LAsibyfNunQ8ZEfJfo3329e4zdSLkBGBuSvlhXfyQmxR+2XnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvpz0+ySjDSJRNtVnv7sH5mzwIfD78iPjulZ9fTNWsI=;
 b=Ho0JDpj6ZDNTpQlniGfpBkMIiClkZUTWNA/r0vjJQK73/dll65clHfDcFGuTbptgUC/2bdKV37UmLuB94X1AShcExCCNzG4eSLDKLhgfkv4jKSZHpD9DmXmvpKdmQhtigpOc9U93BJz+iTJPZU92dap4pKyUzJ5HWdebyqKZKGpCy2sHZamcnoVqSAsL1gIC968S9gfeWZMXWnUzoXJQZwMLgEN3BNiHHu53hHIIHSoLiLj+Ur4Osm7a6DZZfIh9CUjxqcd7TK6qTe4LyDBge30BlP4e0USCDtakkILdU2tcaPXf77JZUSdyWBRuQbP3WKTMv969/JNIV36DP1qAEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.24; Mon, 1 Apr 2024 18:39:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 18:39:33 +0000
Date: Mon, 1 Apr 2024 18:40:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar,
 Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Chehab, Mauro" <mauro.chehab@intel.com>
Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
Message-ID: <Zgr/nNOny61ftWUk@DUT025-TGLU.fm.intel.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
 <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A2F4E463A264CBCFB37C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991A2F4E463A264CBCFB37C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6432:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cw4n9ucd8xB3Z21b7r1XRpsMQ7+75ipQ96sdOyAr5cPl3L30NyMLTrIHH7ipFoAV0cMsIB3B0xJP257EgpVxp6iox+TYcXvZ21n1Hcq0R0wJQDvVODQrCfc1QuWHxorntJAzOxWXx7qEz1OkvHk5qpQFe7oNoyqdaNrrj79CM0ud7iPb9L/nZCvb6C6mDVCp5NduXAvjmHCVh7Phw8UGnM48T9g3NDHDDppcVVTSDs8xKEwjYrOoqgdVhrU3YbOH2tI9IVUiA1lUKTatyG+UgDB0XppilXAfdkD1FaXM5QUMBsbQJXm76VlKMqZV4g5dy/3d8C5Tkc7mAIJL/DZCWoTQIptWyCPzXKM3rg0aZOV8lQf6UH7FyyoWKyihIyBmm//RcrEGn4B0ZQCZ4loSrtA42gxVraswk9sttiPsJRZXQYne5NtndkA6iQx6+4LVHQN0TYkeDxyW+zSZi4Wonh2k4ubSF6odq/NGJCokPvnJhFFfjA+VP/youVAUCpQdAxj4MvBZZsGRGdCNJdfwoErqYsJdqo6VOYm5LPB5KZOlyBq8w9cs/Kpy6GZKMelTqZ2PQdRh4dsgGciEFoskptP3mBKb5OchPQuzGAritX0LPd99JViL8KDK5kPAGZHH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r6j1BIjX/3/vWILszDSiqUuSGnVHS6MDKPKA6V5PNPLupXslBRwr2JqTiv66?=
 =?us-ascii?Q?kLeLUn0CPVC713z90ozvGH8UHE/63/J3oktCNxidDbIqfQPvrUblz2IBeR+y?=
 =?us-ascii?Q?BVmiVnSM/IopqxtcS8iOckFaoJcOLUArp/oo9jzyW7PAD4sdXR2sabhm9c2F?=
 =?us-ascii?Q?KWDHjy5PZpq9v2osUqD0qpntPbPC3pYAeoMa/zU/yx+RTM952veyPljb5Lyu?=
 =?us-ascii?Q?GUmnpCvlRsX+KKqPTuhLueUB54x2kG5d08r31lUTEh2jEvnr2wkt5jMe72ri?=
 =?us-ascii?Q?Znkd+Hals37DAT+Bq12J8arvmWKDcQgMoQZ6fEA2MgqhFFpE9r5hb99Gc3LO?=
 =?us-ascii?Q?sddw5AAOF74aSBvjynR3nuLOeU7Z1Rc5ysOM2/AFV77KpYMwIYBIHuFl0vsg?=
 =?us-ascii?Q?wU9CizrLHpr9Bm9oHOt+9Sgf/Szg+Ph1c3Z3vYXwWrBCUKKg2Dtw8KMTfu6W?=
 =?us-ascii?Q?5FaAzfVY7e4rUM9MMCwyd302WAqzbyx0U/ihhQDH7BApazkdwt2x4ouELitR?=
 =?us-ascii?Q?oOUdwkS6CbUw1CL5w7YH/lmbhPX8H/XJ1TpbzVvDJla/uvB2djqDbzIOGG3F?=
 =?us-ascii?Q?38nhrtAyczyHxSHr1ouAPkyeS44A+2aKZBXbHOU+Vlg+H4NG0N8piGC7keh7?=
 =?us-ascii?Q?ph4WLAUA06i0mMdJ7M8KUvPiwpoV52EbW8bRsYelWMn+fSzkVueUAdgR5bCQ?=
 =?us-ascii?Q?igtN3mFReuTGNBjqHrFs5Ykf5V8Mmtcet7afQyfCvvURDJr24xe84Hap84Zn?=
 =?us-ascii?Q?EswBB72A9exgOgroumuWKDCK9jOU7AwX1Jtw0m41W8WDkIulhzMlB3DABQUf?=
 =?us-ascii?Q?DINrqH6zEsF9meDS93wUKIuW1W33i5k6a3sDDuRea/n80K1BjCKL5idEvAzH?=
 =?us-ascii?Q?1Qb7+nAsDb3JHrhS3RHhCRMC02op9QOOs4UKJu9PphZcl4OjIBsUQb9Vv+Ko?=
 =?us-ascii?Q?EfTF4QIjrG3WjguJUTxNEKejZBLJUcEBUdwwyygcCwRP8SqsWKHLxUmknE5c?=
 =?us-ascii?Q?wJ4AmDyMM/LykbKzbMNNRnnZCS+DRISAGi1l5C1fk0N38WichHLQvFtVSMe8?=
 =?us-ascii?Q?KqTHYvTmjHQvDTi9brL+Erh4KdZQjUYc8D3hOPSfJNLxm+/fe9WFNXwu0v75?=
 =?us-ascii?Q?n4iK0dmurysN4QJl4poGdSUzljpPyiInqATQ33LMNKfONRb8RoomnuEl0ufs?=
 =?us-ascii?Q?PdZJFj7eQzlGMFIogbXslUJxjCejn/Op73xkDpwCpgvjWEMgA1n+SCs/7uST?=
 =?us-ascii?Q?ZyaCE0bkIIAZDABrPU5Qm/O/XFmrEjjYWwvpcNV+OknP/M0pvPnO7OZXJ+R1?=
 =?us-ascii?Q?biS8iHDfQ9edfFegPHzFj/ZxTJI9/UKWUo0fuNRRCtSivIcHOhd80FbvsiLe?=
 =?us-ascii?Q?8p681zx9eVYFswSigjkLMr6/fZCicmkVJfCzdhVdExyjRrPJFvtiDZyWRbIu?=
 =?us-ascii?Q?/gjWyXIzJts6Ipi67LbRoXjoqTiUoO8t851b3aMjFtKtYRVQU/OVaKXZ4csV?=
 =?us-ascii?Q?Yfm3tuSH0TshHR/URD4pkilHxXi8gtGmUZct2TTm773d0NCHoE24B5mAczpI?=
 =?us-ascii?Q?JH+LLm5mv1ropuImU8UGw9ExK2CVBZzCJcDPffFoxvfB+tVzBlQ0TY7DhqAo?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f79e9e-7d9d-4060-6e12-08dc527b1334
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 18:39:33.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qMqEDZJWoluI8KfSBN+9cb5m4LjcpcgsHHcYEGsdrrTQ2sPNTVy7pgGzAh1exyUmPJv/q30k6anhsyV0VlC6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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

On Mon, Apr 01, 2024 at 10:10:06AM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Sunday, March 31, 2024 5:05 PM
> > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> > <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> > Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
> > 
> > On Mon, Apr 01, 2024 at 12:29:49AM +0530, Bommu Krishnaiah wrote:
> > > Creating the helper functions which can be reused by many tests,
> > > as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> > > are used this helper functions.
> > >
> > 
> > As the author of most these tests and IGTs, I can say while not great to
> > have copy paste between tests I much prefer it to adding helpers to try
> > to jam the needs of each test into the helpers. IMO this just creates a
> > headache in the long run. e.g. Let's say I want to change the behavior
> > of xe_exec_compute_mode but not xe_exec_fault_mode, with shared helpers
> > this gets harder.
> 
> Duplicated codes is not a good practice in software. When you have a fix, you need to fix all the places where you have the duplicated codes.
> 

I understand concept of why to not use duplicate codes but see below the
design philosophy of these tests.

> In the example you give, it depends on how we make the helpers. If the helpers are not abstract well enough, we will run into the problem you said. 
> 
> The helper idea is inherited from i915. With those helpers, we can write a test with less than 50 lines of codes. In many cases, just ~20 lines of code, very easy to read and debug. Just take a look of i915 gem_vm_pagefault.c and i915_svm.c.
>

gem_vm_pagefault.c is 2000 plus lines of code for 27 tests.

The test_exec function in xe_exec_compute_mode is ~150 lines of code
which generates 50+ plus tests. There is power to a single data path
controlled by various flags - this leads to the pattern of testing which
is not directed rather do a bunch of things all at the same time. That
is the intent of tests which use this style of coding (xe_exec_basic,
xe_exec_compute_mode, xe_exec_balancer, xe_exec_fault_mode, and
xe_exec_threads). I've used this style of coding to test hardware /
software over the years (started my career writing functional tests for
hardware) and can say these style of tests are by far the most effective
for finding bugs / producing coverage / confidence.

Also they should be easily extentable, see [1] which adds some new
sections to xe_exec_compute_mode to test [2]. New tests are added by
adding a new flag + update data path with new flags. This is my example
why for these types of tests helpers replacing the data-path is not
ideal.

With all of this, I'm not suggesting helpers are not useful nor I am
suggesting directed testing is not useful (see xe_vm, largely a
directed test one of the most essential tests in the suite) just in this
case I do not think the aforementioned tests will benefit from helpers
as written in this patch.

[1] https://patchwork.freedesktop.org/patch/583145/?series=131211&rev=1
[2] https://patchwork.freedesktop.org/series/130935/

> Xe igt is rather complicated compared above i915 tests. In the past few days, I had to debug into xe-exec-threads, it took me long time to really understand the test. The main reason is, we have a huge function such as test_legacy_mode, and flags is used to control the behavior of the test. This is hard to read, maintain and debug.
> 

Saying something is complicated is a matter of opinion. I think the i915
tests are incomprehensible and can easily understand the Xe tests but
course I wrote the Xe tests... I suspect the inverse is true in the i915
tests...

I will say if xe_exec_threads runs to completion the condfience level in
submission working Xe is very, very high. Again ~1500 lines of code
generates ~120 tests.

> > 
> > I'd much rather leave this as is.
> > 
> > Maybe I can buy a helper or two to program the batches, i.e.
> > insert_store LGTM, but certainly not the logic doing bind, invalidates,
> > loop, etc...
> 
> 
> Let me take a look of the helpers, and see whether we can make it better. Our plan is to use those helpers for system allocator test. We use existing tests to test those helpers because right now we don't have system allocator ready. So let's improve it first. We might end up something which is good for both existing test and coming system allocator test. 
> 

Again I don't like in general predicting the future... But I'd almostly
certainly say a test in the style of afformentioned tests will be
written too with me insisting or writing one myself given my experience
doing so.

Off the top of my head...

- various allocation sizes
- mix mmap / malloc / BO allocations
- aligned / unaligned allocations
- different madvise policies
- allocations that faulted in (CPU touches pages before GPU) or not
  faulted in (no backing store on GPU access)
- races between CPU / GPU access
- sparse access to allocations
- dynamic freeing of allocations
- intentionally leak memory
- invalid addresses
- allocate / GPU fault in more memory than VRAM available causing eviction

All of this within a single function controlled by flags.

Extend to multi-threaded versions with dedicated VMs or a shared VMs.

Extend to multi-process version with dedicated VMs and FDs.

So this will probably be 100s of tests with more or less 1 function
called with different arguments. I bet if a test like this run to
completion confidence in SA design is very, very high.

> We will let you decide whether you want to use those helpers for existing tests. If we can't make something good for existing tests, we will target to using those helpers only for the coming system allocator tests.
>

Always open to improvements but my main point here is - helpers
replacing the data-path is a tricky proposition.

Matt
 
> Thanks,
> Oak
> 
> > 
> > Matt
> > 
> > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
> > >  lib/xe/xe_util.h                   |  48 +++++++
> > >  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
> > >  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
> > >  4 files changed, 282 insertions(+), 329 deletions(-)
> > >
> > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > > index 050162b5e..17cd45e45 100644
> > > --- a/lib/xe/xe_util.c
> > > +++ b/lib/xe/xe_util.c
> > > @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
> > >
> > >  	return strcmp(gt_c_state, "gt-c6") == 0;
> > >  }
> > > +
> > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > +		uint32_t bo_size, uint64_t placement, unsigned int flags)
> > > +{
> > > +	struct cpu_va *data;
> > > +
> > > +	if (flags & USERPTR) {
> > > +		if (flags & INVALIDATE) {
> > > +			data = mmap((void *)MAP_ADDRESS, bo_size,
> > PROT_READ | PROT_WRITE,
> > > +					MAP_SHARED | MAP_FIXED |
> > MAP_ANONYMOUS, -1, 0);
> > > +			igt_assert(data != MAP_FAILED);
> > > +		} else {
> > > +			data = aligned_alloc(xe_get_default_alignment(fd),
> > bo_size);
> > > +			igt_assert(data);
> > > +		}
> > > +	} else {
> > > +		*bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> > placement,
> > > +
> > 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +		data = xe_bo_map(fd, *bo, bo_size);
> > > +	}
> > > +
> > > +	memset(data, 0, bo_size);
> > > +
> > > +	return data;
> > > +}
> > > +
> > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < n_exec_queues; i++) {
> > > +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > +		if (flags & BIND_EXEC_QUEUE)
> > > +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
> > vm, 0);
> > > +		else
> > > +			bind_exec_queues[i] = 0;
> > > +	};
> > > +}
> > > +
> > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
> > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > +		struct cpu_va *data, unsigned int flags)
> > > +{
> > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > ONE_SEC;
> > > +
> > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > +	if (bo)
> > > +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> > bo_size, sync, 1);
> > > +	else
> > > +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> > > +				to_user_pointer(data), addr,
> > > +				bo_size, sync, 1);
> > > +
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > +			bind_exec_queues, fence_timeout);
> > > +	data[0].vm_sync = 0;
> > > +
> > > +	if (flags & PREFETCH) {
> > > +		/* Should move to system memory */
> > > +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> > > +				bo_size, sync, 1, 0);
> > > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > +				bind_exec_queues, fence_timeout);
> > > +		data[0].vm_sync = 0;
> > > +	}
> > > +}
> > > +
> > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i)
> > > +{
> > > +	int b = 0;
> > > +	data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > +	data[i].batch[b++] = dst;
> > > +	data[i].batch[b++] = dst >> 32;
> > > +	data[i].batch[b++] = val;
> > > +	data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > +	igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > +}
> > > +
> > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
> > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > +		int *map_fd, unsigned int flags)
> > > +{
> > > +	int i;
> > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > ONE_SEC;
> > > +
> > > +	for (i = 0; i < n_execs; i++) {
> > > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > +		uint64_t batch_addr = addr + batch_offset;
> > > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > +		uint64_t sdi_addr = addr + sdi_offset;
> > > +		int e = i % n_exec_queues;
> > > +
> > > +		if (flags & INVALID_VA)
> > > +			sdi_addr = 0x1fffffffffff000;
> > > +
> > > +		insert_store(sdi_addr, data, 0xc0ffee, i);
> > > +
> > > +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > +
> > > +		exec->exec_queue_id = exec_queues[e];
> > > +		exec->address = batch_addr;
> > > +		xe_exec(fd, exec);
> > > +
> > > +		if (flags & REBIND && i + 1 != n_execs) {
> > > +			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > +					exec_queues[e], fence_timeout);
> > > +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > +					addr, bo_size, NULL, 0);
> > > +
> > > +			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > +			addr += bo_size;
> > > +
> > > +			if (bo)
> > > +				xe_vm_bind_async(fd, vm,
> > bind_exec_queues[e], bo,
> > > +						0, addr, bo_size, sync, 1);
> > > +			else
> > > +				xe_vm_bind_userptr_async(fd, vm,
> > > +						bind_exec_queues[e],
> > > +						to_user_pointer(data),
> > > +						addr, bo_size, sync, 1);
> > > +
> > > +			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > +					bind_exec_queues[e], fence_timeout);
> > > +			data[0].vm_sync = 0;
> > > +		}
> > > +
> > > +		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > +			if (!(flags & RACE)) {
> > > +				/*
> > > +				 * Wait for exec completion and check data as
> > > +				 * userptr will likely change to different
> > > +				 * physical memory on next mmap call triggering
> > > +				 * an invalidate.
> > > +				 */
> > > +				xe_wait_ufence(fd, &data[i].exec_sync,
> > > +						USER_FENCE_VALUE,
> > exec_queues[e],
> > > +						fence_timeout);
> > > +				igt_assert_eq(data[i].data, 0xc0ffee);
> > > +			} else if (i * 2 != n_execs) {
> > > +				/*
> > > +				 * We issue 1 mmap which races against running
> > > +				 * jobs. No real check here aside from this test
> > > +				 * not faulting on the GPU.
> > > +				 */
> > > +				continue;
> > > +			}
> > > +
> > > +			if (flags & RACE) {
> > > +				*map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > +						0x666);
> > > +				write(*map_fd, data, bo_size);
> > > +				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > +						PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > +						MAP_FIXED, *map_fd, 0);
> > > +			} else {
> > > +				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > +						PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > +						MAP_FIXED |
> > MAP_ANONYMOUS, -1, 0);
> > > +			}
> > > +
> > > +			igt_assert(data != MAP_FAILED);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> > > +		uint32_t bo_size)
> > > +{
> > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > ONE_SEC;
> > > +
> > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> > > +			sync, 1);
> > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > +			bind_exec_queues, fence_timeout);
> > > +}
> > > +
> > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > +		uint32_t *bind_exec_queues, int n_exec_queues)
> > > +{
> > > +	int i;
> > > +
> > > +	for (i = 0; i < n_exec_queues; i++) {
> > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > +		if (bind_exec_queues[i])
> > > +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > +	}
> > > +}
> > > +
> > > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > > index 6480ea01a..aa1b0dcc1 100644
> > > --- a/lib/xe/xe_util.h
> > > +++ b/lib/xe/xe_util.h
> > > @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t
> > bind_engine,
> > >
> > >  bool xe_is_gt_in_c6(int fd, int gt);
> > >
> > > +
> > > +#define USERPTR			(0x1 << 0)
> > > +#define REBIND			(0x1 << 1)
> > > +#define INVALIDATE		(0x1 << 2)
> > > +#define RACE			(0x1 << 3)
> > > +#define BIND_EXEC_QUEUE		(0x1 << 4)
> > > +#define PREFETCH		(0x1 << 5)
> > > +#define INVALID_FAULT		(0x1 << 6)
> > > +#define INVALID_VA		(0x1 << 7)
> > > +#define ENABLE_SCRATCH		(0x1 << 8)
> > > +#define VM_FOR_BO		(0x1 << 9)
> > > +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> > > +
> > > +#define MAX_N_EXEC_QUEUES	16
> > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > +#define MAP_ADDRESS		0x00007fadeadbe000
> > > +
> > > +#define ONE_SEC		MS_TO_NS(1000)
> > > +#define HUNDRED_SEC	MS_TO_NS(100000)
> > > +
> > > +struct cpu_va {
> > > +	uint32_t batch[16];
> > > +	uint64_t pad;
> > > +	uint64_t vm_sync;
> > > +	uint64_t exec_sync;
> > > +	uint32_t data;
> > > +};
> > > +
> > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
> > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > +		struct cpu_va *data, unsigned int flags);
> > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
> > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > +		int *map_fd, unsigned int flags);
> > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i);
> > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > +		struct drm_xe_sync *sync, struct cpu_va *data,
> > > +		uint64_t addr, uint32_t bo_size);
> > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > +		uint32_t *bind_exec_queues, int n_exec_queues);
> > > +
> > >  #endif /* XE_UTIL_H */
> > > diff --git a/tests/intel/xe_exec_compute_mode.c
> > b/tests/intel/xe_exec_compute_mode.c
> > > index 3ec848164..e8d82cc69 100644
> > > --- a/tests/intel/xe_exec_compute_mode.c
> > > +++ b/tests/intel/xe_exec_compute_mode.c
> > > @@ -15,6 +15,7 @@
> > >  #include "igt.h"
> > >  #include "lib/igt_syncobj.h"
> > >  #include "lib/intel_reg.h"
> > > +#include "lib/xe/xe_util.h"
> > >  #include <sys/ioctl.h>
> > >  #include "xe_drm.h"
> > >
> > > @@ -23,15 +24,6 @@
> > >  #include "xe/xe_spin.h"
> > >  #include <string.h>
> > >
> > > -#define MAX_N_EXECQUEUES 	16
> > > -#define USERPTR				(0x1 << 0)
> > > -#define REBIND				(0x1 << 1)
> > > -#define INVALIDATE			(0x1 << 2)
> > > -#define RACE				(0x1 << 3)
> > > -#define BIND_EXECQUEUE		(0x1 << 4)
> > > -#define VM_FOR_BO			(0x1 << 5)
> > > -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> > > -
> > >  /**
> > >   * SUBTEST: twice-%s
> > >   * Description: Run %arg[1] compute machine test twice
> > > @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> > >  {
> > >  	uint32_t vm;
> > >  	uint64_t addr = 0x1a0000;
> > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > >  	struct drm_xe_sync sync[1] = {
> > >  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > >  		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > @@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> > >  		.num_syncs = 1,
> > >  		.syncs = to_user_pointer(sync),
> > >  	};
> > > -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> > > -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> > > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > > +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > >  	size_t bo_size;
> > >  	uint32_t bo = 0;
> > > -	struct {
> > > -		uint32_t batch[16];
> > > -		uint64_t pad;
> > > -		uint64_t vm_sync;
> > > -		uint64_t exec_sync;
> > > -		uint32_t data;
> > > -	} *data;
> > > -	int i, j, b;
> > > +	struct cpu_va *data;
> > > +	int i, j;
> > >  	int map_fd = -1;
> > >  	int64_t fence_timeout;
> > > +	uint64_t placement;
> > >
> > > -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> > > +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > >
> > >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > >  	bo_size = sizeof(*data) * n_execs;
> > >  	bo_size = xe_bb_size(fd, bo_size);
> > >
> > > -	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > -		if (flags & BIND_EXECQUEUE)
> > > -			bind_exec_queues[i] =
> > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > -		else
> > > -			bind_exec_queues[i] = 0;
> > > -	};
> > > +	if (flags & EXEC_QUEUE_EARLY)
> > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > n_exec_queues, eci, flags);
> > >
> > > -	if (flags & USERPTR) {
> > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > -		if (flags & INVALIDATE) {
> > > -			data = mmap((void *)MAP_ADDRESS, bo_size,
> > PROT_READ |
> > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > -				    MAP_ANONYMOUS, -1, 0);
> > > -			igt_assert(data != MAP_FAILED);
> > > -		} else {
> > > -			data = aligned_alloc(xe_get_default_alignment(fd),
> > > -					     bo_size);
> > > -			igt_assert(data);
> > > -		}
> > > -	} else {
> > > -		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> > > -				  bo_size, vram_if_possible(fd, eci->gt_id),
> > > -
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > -		data = xe_bo_map(fd, bo, bo_size);
> > > -	}
> > > -	memset(data, 0, bo_size);
> > > +	placement = vram_if_possible(fd, eci->gt_id);
> > >
> > > -	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > -		if (flags & BIND_EXECQUEUE)
> > > -			bind_exec_queues[i] =
> > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > -		else
> > > -			bind_exec_queues[i] = 0;
> > > -	};
> > > +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > >
> > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -	if (bo)
> > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > > -				 bo_size, sync, 1);
> > > -	else
> > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > -					 to_user_pointer(data), addr,
> > > -					 bo_size, sync, 1);
> > > -#define ONE_SEC	MS_TO_NS(1000)
> > > -#define HUNDRED_SEC	MS_TO_NS(100000)
> > > +	if(!(flags & EXEC_QUEUE_EARLY))
> > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > n_exec_queues, eci, flags);
> > > +
> > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> > flags);
> > >
> > >  	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> > >
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > -		       bind_exec_queues[0], fence_timeout);
> > > -	data[0].vm_sync = 0;
> > > -
> > > -	for (i = 0; i < n_execs; i++) {
> > > -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > -		uint64_t batch_addr = addr + batch_offset;
> > > -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > -		uint64_t sdi_addr = addr + sdi_offset;
> > > -		int e = i % n_exec_queues;
> > > -
> > > -		b = 0;
> > > -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > -		data[i].batch[b++] = sdi_addr;
> > > -		data[i].batch[b++] = sdi_addr >> 32;
> > > -		data[i].batch[b++] = 0xc0ffee;
> > > -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > -
> > > -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > -
> > > -		exec.exec_queue_id = exec_queues[e];
> > > -		exec.address = batch_addr;
> > > -		xe_exec(fd, &exec);
> > > -
> > > -		if (flags & REBIND && i + 1 != n_execs) {
> > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -				       exec_queues[e], fence_timeout);
> > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > -					   addr, bo_size, NULL, 0);
> > > -
> > > -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -			addr += bo_size;
> > > -			if (bo)
> > > -				xe_vm_bind_async(fd, vm,
> > bind_exec_queues[e], bo,
> > > -						 0, addr, bo_size, sync, 1);
> > > -			else
> > > -				xe_vm_bind_userptr_async(fd, vm,
> > > -							 bind_exec_queues[e],
> > > -							 to_user_pointer(data),
> > > -							 addr, bo_size, sync,
> > > -							 1);
> > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       bind_exec_queues[e], fence_timeout);
> > > -			data[0].vm_sync = 0;
> > > -		}
> > > -
> > > -		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > -			if (!(flags & RACE)) {
> > > -				/*
> > > -				 * Wait for exec completion and check data as
> > > -				 * userptr will likely change to different
> > > -				 * physical memory on next mmap call triggering
> > > -				 * an invalidate.
> > > -				 */
> > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > -					       USER_FENCE_VALUE,
> > exec_queues[e],
> > > -					       fence_timeout);
> > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > -			} else if (i * 2 != n_execs) {
> > > -				/*
> > > -				 * We issue 1 mmap which races against running
> > > -				 * jobs. No real check here aside from this test
> > > -				 * not faulting on the GPU.
> > > -				 */
> > > -				continue;
> > > -			}
> > > -
> > > -			if (flags & RACE) {
> > > -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > -					      0x666);
> > > -				write(map_fd, data, bo_size);
> > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > -					    PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > -					    MAP_FIXED, map_fd, 0);
> > > -			} else {
> > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > -					    PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > 0);
> > > -			}
> > > -			igt_assert(data != MAP_FAILED);
> > > -		}
> > > -	}
> > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > flags);
> > >
> > >  	j = flags & INVALIDATE ? n_execs - 1 : 0;
> > >  	for (i = j; i < n_execs; i++)
> > > @@ -264,20 +132,12 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	if (flags & INVALIDATE)
> > >  		usleep(250000);
> > >
> > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > -			   sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > -		       bind_exec_queues[0], fence_timeout);
> > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> > >
> > >  	for (i = j; i < n_execs; i++)
> > >  		igt_assert_eq(data[i].data, 0xc0ffee);
> > >
> > > -	for (i = 0; i < n_exec_queues; i++) {
> > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > -		if (bind_exec_queues[i])
> > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > -	}
> > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > n_exec_queues);
> > >
> > >  	if (bo) {
> > >  		munmap(data, bo_size);
> > > @@ -492,14 +352,14 @@ igt_main
> > >  		{ "userptr-rebind", USERPTR | REBIND },
> > >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > >  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> > > -		{ "bindexecqueue", BIND_EXECQUEUE },
> > > -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> > > -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> > > -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> > USERPTR |
> > > +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> > > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> > > +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> > USERPTR |
> > >  			REBIND },
> > > -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> > USERPTR |
> > > +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> > USERPTR |
> > >  			INVALIDATE },
> > > -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> > USERPTR |
> > > +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> > USERPTR |
> > >  			INVALIDATE | RACE },
> > >  		{ NULL },
> > >  	};
> > > diff --git a/tests/intel/xe_exec_fault_mode.c
> > b/tests/intel/xe_exec_fault_mode.c
> > > index 40fe1743e..7b2fef224 100644
> > > --- a/tests/intel/xe_exec_fault_mode.c
> > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > @@ -16,24 +16,13 @@
> > >  #include "igt.h"
> > >  #include "lib/igt_syncobj.h"
> > >  #include "lib/intel_reg.h"
> > > +#include "lib/xe/xe_util.h"
> > >  #include "xe_drm.h"
> > >
> > >  #include "xe/xe_ioctl.h"
> > >  #include "xe/xe_query.h"
> > >  #include <string.h>
> > >
> > > -#define MAX_N_EXEC_QUEUES	16
> > > -
> > > -#define USERPTR		(0x1 << 0)
> > > -#define REBIND		(0x1 << 1)
> > > -#define INVALIDATE	(0x1 << 2)
> > > -#define RACE		(0x1 << 3)
> > > -#define BIND_EXEC_QUEUE	(0x1 << 4)
> > > -#define PREFETCH	(0x1 << 5)
> > > -#define INVALID_FAULT	(0x1 << 6)
> > > -#define INVALID_VA	(0x1 << 7)
> > > -#define ENABLE_SCRATCH  (0x1 << 8)
> > > -
> > >  /**
> > >   * SUBTEST: invalid-va
> > >   * Description: Access invalid va and check for EIO through user fence.
> > > @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> > >  {
> > >  	uint32_t vm;
> > >  	uint64_t addr = 0x1a0000;
> > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > >  	struct drm_xe_sync sync[1] = {
> > >  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags =
> > DRM_XE_SYNC_FLAG_SIGNAL,
> > >  	          .timeline_value = USER_FENCE_VALUE },
> > > @@ -113,14 +101,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > *eci,
> > >  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > >  	size_t bo_size;
> > >  	uint32_t bo = 0;
> > > -	struct {
> > > -		uint32_t batch[16];
> > > -		uint64_t pad;
> > > -		uint64_t vm_sync;
> > > -		uint64_t exec_sync;
> > > -		uint32_t data;
> > > -	} *data;
> > > -	int i, j, b;
> > > +	struct cpu_va *data;
> > > +	uint64_t placement;
> > > +	int i, j;
> > >  	int map_fd = -1;
> > >
> > >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > > @@ -134,144 +117,19 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  	bo_size = sizeof(*data) * n_execs;
> > >  	bo_size = xe_bb_size(fd, bo_size);
> > >
> > > -	if (flags & USERPTR) {
> > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > -		if (flags & INVALIDATE) {
> > > -			data = mmap((void *)MAP_ADDRESS, bo_size,
> > PROT_READ |
> > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > -				    MAP_ANONYMOUS, -1, 0);
> > > -			igt_assert(data != MAP_FAILED);
> > > -		} else {
> > > -			data = aligned_alloc(xe_get_default_alignment(fd),
> > > -					     bo_size);
> > > -			igt_assert(data);
> > > -		}
> > > -	} else {
> > > -		if (flags & PREFETCH)
> > > -			bo = xe_bo_create(fd, 0, bo_size,
> > > -					  all_memory_regions(fd) |
> > > -					  vram_if_possible(fd, 0),
> > > -
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > -		else
> > > -			bo = xe_bo_create(fd, 0, bo_size,
> > > -					  vram_if_possible(fd, eci->gt_id),
> > > -
> > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > -		data = xe_bo_map(fd, bo, bo_size);
> > > -	}
> > > -	memset(data, 0, bo_size);
> > > -
> > > -	for (i = 0; i < n_exec_queues; i++) {
> > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > -		if (flags & BIND_EXEC_QUEUE)
> > > -			bind_exec_queues[i] =
> > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > -		else
> > > -			bind_exec_queues[i] = 0;
> > > -	};
> > > -
> > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -	if (bo)
> > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > bo_size, sync, 1);
> > > -	else
> > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > -					 to_user_pointer(data), addr,
> > > -					 bo_size, sync, 1);
> > > -#define ONE_SEC	MS_TO_NS(1000)
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > -		       bind_exec_queues[0], ONE_SEC);
> > > -	data[0].vm_sync = 0;
> > > -
> > > -	if (flags & PREFETCH) {
> > > -		/* Should move to system memory */
> > > -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> > > -				     bo_size, sync, 1, 0);
> > > -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > -			       bind_exec_queues[0], ONE_SEC);
> > > -		data[0].vm_sync = 0;
> > > -	}
> > > -
> > > -	for (i = 0; i < n_execs; i++) {
> > > -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > -		uint64_t batch_addr = addr + batch_offset;
> > > -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > -		uint64_t sdi_addr = addr + sdi_offset;
> > > -		int e = i % n_exec_queues;
> > > +	placement = (flags & PREFETCH) ? all_memory_regions(fd) |
> > > +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
> > >
> > > -		b = 0;
> > > -		if (flags & INVALID_VA)
> > > -			sdi_addr = 0x1fffffffffff000;
> > > +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > >
> > > -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > -		data[i].batch[b++] = sdi_addr;
> > > -		data[i].batch[b++] = sdi_addr >> 32;
> > > -		data[i].batch[b++] = 0xc0ffee;
> > > -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > +			n_exec_queues, eci, flags);
> > >
> > > -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> > flags);
> > >
> > > -		exec.exec_queue_id = exec_queues[e];
> > > -		exec.address = batch_addr;
> > > -		xe_exec(fd, &exec);
> > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > flags);
> > >
> > > -		if (flags & REBIND && i + 1 != n_execs) {
> > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > USER_FENCE_VALUE,
> > > -				       exec_queues[e], ONE_SEC);
> > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > -					   addr, bo_size, NULL, 0);
> > > -
> > > -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -			addr += bo_size;
> > > -			if (bo)
> > > -				xe_vm_bind_async(fd, vm,
> > bind_exec_queues[e], bo,
> > > -						 0, addr, bo_size, sync, 1);
> > > -			else
> > > -				xe_vm_bind_userptr_async(fd, vm,
> > > -							 bind_exec_queues[e],
> > > -							 to_user_pointer(data),
> > > -							 addr, bo_size, sync,
> > > -							 1);
> > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > USER_FENCE_VALUE,
> > > -				       bind_exec_queues[e], ONE_SEC);
> > > -			data[0].vm_sync = 0;
> > > -		}
> > > -
> > > -		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > -			if (!(flags & RACE)) {
> > > -				/*
> > > -				 * Wait for exec completion and check data as
> > > -				 * userptr will likely change to different
> > > -				 * physical memory on next mmap call triggering
> > > -				 * an invalidate.
> > > -				 */
> > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > -					       USER_FENCE_VALUE,
> > exec_queues[e],
> > > -					       ONE_SEC);
> > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > -			} else if (i * 2 != n_execs) {
> > > -				/*
> > > -				 * We issue 1 mmap which races against running
> > > -				 * jobs. No real check here aside from this test
> > > -				 * not faulting on the GPU.
> > > -				 */
> > > -				continue;
> > > -			}
> > > -
> > > -			if (flags & RACE) {
> > > -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > -					      0x666);
> > > -				write(map_fd, data, bo_size);
> > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > -					    PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > -					    MAP_FIXED, map_fd, 0);
> > > -			} else {
> > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > -					    PROT_READ | PROT_WRITE,
> > MAP_SHARED |
> > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > 0);
> > > -			}
> > > -			igt_assert(data != MAP_FAILED);
> > > -		}
> > > -	}
> > >  	if (!(flags & INVALID_FAULT)) {
> > >  		int64_t timeout = ONE_SEC;
> > >
> > > @@ -286,22 +144,15 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance *eci,
> > >  							       exec_queues[i %
> > n_exec_queues], &timeout), 0);
> > >  		}
> > >  	}
> > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > -			   sync, 1);
> > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > -		       bind_exec_queues[0], ONE_SEC);
> > > +
> > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> > >
> > >  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> > >  		for (i = j; i < n_execs; i++)
> > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > >  	}
> > >
> > > -	for (i = 0; i < n_exec_queues; i++) {
> > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > -		if (bind_exec_queues[i])
> > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > -	}
> > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > n_exec_queues);
> > >
> > >  	if (bo) {
> > >  		munmap(data, bo_size);
> > > --
> > > 2.25.1
> > >
