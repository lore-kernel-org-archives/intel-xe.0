Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDDBCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 22:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298C10F614;
	Mon,  1 Apr 2024 22:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqtLBLuw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAFB10F614
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712010707; x=1743546707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cCisg7j7+UHBlQltXAPnhPFJf23WrFOWav/kTycR1ms=;
 b=RqtLBLuwUBM1+2b4WO46rtlw92XeMDFESjOUslddABEGODmcnkbI5nSO
 OmglvFGmu9G210JgKY30Lc5AeJuD495Da0YNex+QObfKj1P2wpDEhzElu
 ZsEIL/FkH2stMEE7RTGxjDkDdY4agaDyMc+mOKp2mZ34hKhILYJZ9Clfp
 F/8igN497FVIcDLeAIK9bc2AC+zl5MMhjRt781yH8aI8hM0NoRLiWlysz
 Tx2vEDKeQgQeVoKAGclB/0NMs7b3l3k5embiOZSEa3+k34M9YUUimJEPQ
 XHskB9t9NhA0SMctEJs2fP+Gno3ZcYlnhe511SAMVPtY8bYbfrgUV/hiu A==;
X-CSE-ConnectionGUID: KgSlkSuZRjqBQoCljmtFhQ==
X-CSE-MsgGUID: zFCLQSKLTxaAgSXRko+BMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7274209"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7274209"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 15:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="22590075"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 15:31:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 15:31:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 15:31:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 15:31:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 15:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyuLwyLe6P+h7c5dssh6kEVn31OsXWdigQVP1a9NsiNjLmDFW4exa7s5tJONsXZAQ3TpwZcctoMMI7XcHgJ67qTii4hXLaYIzcBAC+FFVA4dGygWLisQhKzSE81tsp1VksCIMvRgaR0YlaNOCcNH600+aA8JUzzP/e8uW43S8KKl+Ys6GqJLcDfS6lA6+YHPde5pR8dATrcJC/s3WKQ1eXdEb29qMIALq0+Mn4Gh9zV0Ok9sPePtBP3SZM+C/Au530hE1uQFmwXN9QfItCy8hWEyzOTYAiuHhIQjqdNbCDaIL1viW5N1PnBVAMMmujEjMyh/wJsaeM/RhN51OCgXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k28ibpIyPZvCs2t8zmh0eiTTrwe009OZOESnvrur9k=;
 b=YviDcW/z3LQ63CoJCgLF6Fp34dqurVe8RH68h38icrjjqdjBR++8KLMYB/02ZwOlTgXlNPn710LocmbHOFrCHf3AojUXsjbPT+v/TJ7PV9C7MON/hL/EMAOrK8z7t3q1BsXAFH2yTxurDznYZTVkzsvopmjaJtZ7ziwx783n9c3IZmdRHi4vHi75OTHVZat8Au1gYNKnfmQUNg+mua8b1w8GFU+VV7tpwVlLTlalYMjoDGmp70VMwUVhsnF3++i5TbJGhUG2VDSHv2jg+BXZY0IypIX8BY+Xog7JZx9jpb7yoQHxhqg5fS/qQyljf4POWU9OVGJRHGQujaMFPXaX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Mon, 1 Apr
 2024 22:31:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 22:31:38 +0000
Date: Mon, 1 Apr 2024 22:32:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar,
 Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Chehab, Mauro" <mauro.chehab@intel.com>
Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
Message-ID: <Zgs1/NwTZtLWA6BI@DUT025-TGLU.fm.intel.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
 <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A2F4E463A264CBCFB37C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zgr/nNOny61ftWUk@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69919A5C5DC3DD340B5BC0CE923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69919A5C5DC3DD340B5BC0CE923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8763:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xuqzqaaPYozhtFLN496JK2pgwl1G8FQ8gR1AcDQSISpzgTkdA9n4X04Nw2MpG9wMtFxMlm6PR9BO6xtfB1z3GOa3yKkIipjQtyO1fC15/sfR3LLYgHMa7fsKo+mCLJKEK379EcJkUrCSRFevzYHSf6NJWuhQ8XAGhhoVzVrxD3xcLHHjZTzfG+Es3QHaTDiFx5P0s4DbY7/EEKg8u/UVLPhVr16c/u3ZVeEopsWnVe8B0OZhtmuSwOYyiCIwNzgbI9ksSbh6dR7Qid/ydzhbW+ubWmdWXye6ZRAF9pA3/RhDY+jEi5FZXhj00hSCIklHq+SgqkhMW/hhh4nn0A4ke5lZgg6zIFf9+LLFE1fz8/NE0A6yt08waFokwZ0QlzAtt1TIj7TBGGGpuRWxi/sTBTk+h6hUaWoIyDDiUff84el0cVzujnIKuQ1C9QeMbmtenxNrq7Nh5YZiNe15vTa/wWlsvaHMa+z09IW/7QuSnYXDDDC+hKVO9qxQNLK8Vc6GciRHr+GpkaoIIn3JeoooO9K9I4NA9J/DXnyv5giDU7dkry8rSINeKBH5gVY3Tyc7olmIlg98xI3aEi6PFgSvWFXHXMB5kPcLBMl9mBWmnme8D4c5mORJwT1F1s4NTTXY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HZktIBzKKmB7+qZrY8sO3clhCoe22KF0A+X9mc4SG6smSEgfPbKCNvUACzMZ?=
 =?us-ascii?Q?kwB51eaEGqiT+yAXOMRCR8ZduDlpfLFjUwXUyE+K8aeYLLbB5d+ffsHKS9ub?=
 =?us-ascii?Q?q0iG7ELmB2/NcceVi8t18XIKdfaH4781njByMdl80kDisyRgXeqN/9N75Krp?=
 =?us-ascii?Q?eMafB/ZlOt4AyBZ2d115AtkSkmxc+XveocbpFxJoEF7Zle6KAPEn0FCR0qNH?=
 =?us-ascii?Q?5WJP6AwZ+/jjSLS87FDIZiMPN/rNm+nLtixU4uvIsA8V2kxy/xnNMLZDhXj+?=
 =?us-ascii?Q?lxp0AF9B+pB5u/Doo3gV0EQ+0w8Mig+JWnT5GHy0cJZ2dNujuL8BQaJLrL44?=
 =?us-ascii?Q?vp4/owzBOVvHk8Lrfg4QCzQib/GdEwIzCO9HpriU+EuSVC3lusHugO08Fnty?=
 =?us-ascii?Q?JmZoRAs1qvyElvKbvz/NH5xlGSoxcWMUqPe6CK1dnP+UPvMkSOXDbV3B+07D?=
 =?us-ascii?Q?LAXgqr23oUSF6+dFBaUIh0Pjmdqf/d83xrKqCff5c/nVFhLPt8UJUFFOf0z8?=
 =?us-ascii?Q?2Hq4Ld7WywcDBEYtm6rtKGlOxzr/n4kAnaiU14Y4Rh2FVWQAq/t6gecaMim6?=
 =?us-ascii?Q?rHcv8FFPO4ZowdE9XKbxx8r3IDZxwJBo8f7SCPfzJEYGZisMt8oVUVkPt94I?=
 =?us-ascii?Q?jInyIl7WgWXtToMwFlXFMmbY6WiF/kybds5MQt5ljkhkfJcDzhFaWFh9roXg?=
 =?us-ascii?Q?k/4bq/GTEqGU3PKTwTZbIa3wkVzbNNRqVFVn9uToUynMCVoH6DaUdzfafGhO?=
 =?us-ascii?Q?g2ON1eTOUxOjO0kYllWqV0QNOUpvKCNxQrL1pr8rtCFNBnfqPmMQLpC4vcLV?=
 =?us-ascii?Q?TzjtA5MsmMQiIP/z0EXfq3bIEVHxyB5iBAw6piUeByh/ciEInK+vH0x/qSP8?=
 =?us-ascii?Q?ughxDJCY+8PgbPQXD1HNsgASMDSvwndCjtXgsiT8VLzu/EcQFnYBo6MDYjLp?=
 =?us-ascii?Q?Lj5eZ58/iB0z7UNhPcspNPXmcHNX6YToyXcjwGJXLWAPCjOGCHY+a4DPXBUE?=
 =?us-ascii?Q?ewrKB3uWKdvDWX9McDdXK5lKVeqE8YmHsrgsFwTyJeKiLLbG1MS95KQhzGAd?=
 =?us-ascii?Q?yjOVHE04nAkkjpK6v/7G7Y6pN10rJFsRYbxbLpJsyCvhDvguP2fGbpGQHs+E?=
 =?us-ascii?Q?WYq4F0R9OozaF6QRGbf6I3Ju38cExjXOXUl57T0suiUCRhuoOknvKyKQB+gl?=
 =?us-ascii?Q?WOod9+RLT4/Q9YZzCcH79IIJtIuj2gu+X5dLEWUKr4m65Nfo07tWye+4W598?=
 =?us-ascii?Q?t9o31MjYy9oBcgU+k0f0Is0esuHQ7iug99KQLd2vNwpxA7PvSUBl1ZwK6+x7?=
 =?us-ascii?Q?JAe0DPIttzbj1BhBEribP95Inqef2XR9mHyOQo5yrz4uxGnBCJTuoB2QMH3u?=
 =?us-ascii?Q?j2mlqDvo67pDORyK9IpGFakQbffQTi9pL42FcPerVX5owOJ9Cu8R7XOl982v?=
 =?us-ascii?Q?w7XH9I+rEQa/E2erYkYO17x17UAEmLjpO+x3JXwPEieW2ZImwdbY6mnNHk79?=
 =?us-ascii?Q?nOv0yHB7jQWXGWoTTfoQtA3VZebv972E3BAyeTXkiwpqzc7A3LN754igCpQO?=
 =?us-ascii?Q?Ew8ci5VFv9uxeT1gcso8F88e9DzZ7BuN8cwr2X9xaxEEAO/8ZYm0/Rtf5c1p?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 312e323d-bb23-43f2-4e00-08dc529b7ee8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 22:31:38.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sj3k61X5IM+ffufdJ3sJLdn7lW1TryaCcjPL8XQR0LSU8lS/lFsLKSPw0KkNIDvTngeh3eaDw5qSXUyXbreEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
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

On Mon, Apr 01, 2024 at 02:28:58PM -0600, Zeng, Oak wrote:
> Hi Matt
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Monday, April 1, 2024 2:40 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; intel-
> > xe@lists.freedesktop.org; Kumar, Janga Rahul <janga.rahul.kumar@intel.com>;
> > Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Chehab, Mauro
> > <mauro.chehab@intel.com>
> > Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
> > 
> > On Mon, Apr 01, 2024 at 10:10:06AM -0600, Zeng, Oak wrote:
> > > Hi Matt,
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Sunday, March 31, 2024 5:05 PM
> > > > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> > > > <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> > > > <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> > > > Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
> > > >
> > > > On Mon, Apr 01, 2024 at 12:29:49AM +0530, Bommu Krishnaiah wrote:
> > > > > Creating the helper functions which can be reused by many tests,
> > > > > as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> > > > > are used this helper functions.
> > > > >
> > > >
> > > > As the author of most these tests and IGTs, I can say while not great to
> > > > have copy paste between tests I much prefer it to adding helpers to try
> > > > to jam the needs of each test into the helpers. IMO this just creates a
> > > > headache in the long run. e.g. Let's say I want to change the behavior
> > > > of xe_exec_compute_mode but not xe_exec_fault_mode, with shared
> > helpers
> > > > this gets harder.
> > >
> > > Duplicated codes is not a good practice in software. When you have a fix, you
> > need to fix all the places where you have the duplicated codes.
> > >
> > 
> > I understand concept of why to not use duplicate codes but see below the
> > design philosophy of these tests.
> > 
> > > In the example you give, it depends on how we make the helpers. If the
> > helpers are not abstract well enough, we will run into the problem you said.
> > >
> > > The helper idea is inherited from i915. With those helpers, we can write a test
> > with less than 50 lines of codes. In many cases, just ~20 lines of code, very easy to
> > read and debug. Just take a look of i915 gem_vm_pagefault.c and i915_svm.c.
> > >
> > 
> > gem_vm_pagefault.c is 2000 plus lines of code for 27 tests.
> > 
> > The test_exec function in xe_exec_compute_mode is ~150 lines of code
> > which generates 50+ plus tests. There is power to a single data path
> > controlled by various flags - this leads to the pattern of testing which
> > is not directed rather do a bunch of things all at the same time. That
> > is the intent of tests which use this style of coding (xe_exec_basic,
> > xe_exec_compute_mode, xe_exec_balancer, xe_exec_fault_mode, and
> > xe_exec_threads). I've used this style of coding to test hardware /
> > software over the years (started my career writing functional tests for
> > hardware) and can say these style of tests are by far the most effective
> > for finding bugs / producing coverage / confidence.
> 
> 
> Yes, I was also amazed by the efficiency of the xe style test. But that doesn't prohibit we introduce a few helpers.
> 
> As said in the other thread of this code review, I agree we can continue this style for the existing test. I also asked Krishna to remove some big helpers. The idea is, we will introduce a few simple helpers (mainly for the system allocator tests which will take another style: each test is simple, but overall has less test/LOC efficiency). 
> 
> We will apply those helpers for the existing tests but won't change your coding style. 
> 
> > 
> > Also they should be easily extentable, see [1] which adds some new
> > sections to xe_exec_compute_mode to test [2]. New tests are added by
> > adding a new flag + update data path with new flags. This is my example
> > why for these types of tests helpers replacing the data-path is not
> > ideal.
> > 
> > With all of this, I'm not suggesting helpers are not useful nor I am
> > suggesting directed testing is not useful (see xe_vm, largely a
> > directed test one of the most essential tests in the suite) just in this
> > case I do not think the aforementioned tests will benefit from helpers
> > as written in this patch.
> 
> Sure. Let's Krishna rework on the helpers and let's see what we get. As said, our goal is not to simplify the existing test, nor to change the coding style of existing test. 
> 
> Whether we can apply helpers to existing tests? It all depends on how we abstract the helpers well enough. I believe helpers such as create and map buffer, create and fill command buffer, submit command buffer etc can simplify things a little. But lets wait for Krishna's improvement and see.
>

That roughly what I think - BO / memory allocation, programming batches are where
we can improve these tests with helpers.

Matt

> 
> 
> > 
> > [1] https://patchwork.freedesktop.org/patch/583145/?series=131211&rev=1
> > [2] https://patchwork.freedesktop.org/series/130935/
> > 
> > > Xe igt is rather complicated compared above i915 tests. In the past few days, I
> > had to debug into xe-exec-threads, it took me long time to really understand the
> > test. The main reason is, we have a huge function such as test_legacy_mode, and
> > flags is used to control the behavior of the test. This is hard to read, maintain and
> > debug.
> > >
> > 
> > Saying something is complicated is a matter of opinion. I think the i915
> > tests are incomprehensible and can easily understand the Xe tests but
> > course I wrote the Xe tests... I suspect the inverse is true in the i915
> > tests...
> > 
> > I will say if xe_exec_threads runs to completion the condfience level in
> > submission working Xe is very, very high. Again ~1500 lines of code
> > generates ~120 tests.
> 
> Agreed. Most of the i915 tests are also the same style as you coded for xe. Just those two I mentioned above used another style. I have no doubt of the efficiency of that style. As said, I don't have any intension to change this style.
> 
> > 
> > > >
> > > > I'd much rather leave this as is.
> > > >
> > > > Maybe I can buy a helper or two to program the batches, i.e.
> > > > insert_store LGTM, but certainly not the logic doing bind, invalidates,
> > > > loop, etc...
> > >
> > >
> > > Let me take a look of the helpers, and see whether we can make it better. Our
> > plan is to use those helpers for system allocator test. We use existing tests to test
> > those helpers because right now we don't have system allocator ready. So let's
> > improve it first. We might end up something which is good for both existing test
> > and coming system allocator test.
> > >
> > 
> > Again I don't like in general predicting the future... But I'd almostly
> > certainly say a test in the style of afformentioned tests will be
> > written too with me insisting or writing one myself given my experience
> > doing so.
> > 
> > Off the top of my head...
> > 
> > - various allocation sizes
> > - mix mmap / malloc / BO allocations
> > - aligned / unaligned allocations
> > - different madvise policies
> > - allocations that faulted in (CPU touches pages before GPU) or not
> >   faulted in (no backing store on GPU access)
> > - races between CPU / GPU access
> > - sparse access to allocations
> > - dynamic freeing of allocations
> > - intentionally leak memory
> > - invalid addresses
> > - allocate / GPU fault in more memory than VRAM available causing eviction
> > 
> > All of this within a single function controlled by flags.
> 
> In the coding style I preferred, each of above lines will be one function, vs single function controlled by flags. I am pretty sure my style will be more readable but at the cost of more LOC.
> 
> Again, I think both styles works. Both have its pros and cons. I don't have any intension to change the coding style of existing tests.
> 
> 
> > 
> > Extend to multi-threaded versions with dedicated VMs or a shared VMs.
> > 
> > Extend to multi-process version with dedicated VMs and FDs.
> > 
> > So this will probably be 100s of tests with more or less 1 function
> > called with different arguments. I bet if a test like this run to
> > completion confidence in SA design is very, very high.
> > 
> > > We will let you decide whether you want to use those helpers for existing tests.
> > If we can't make something good for existing tests, we will target to using those
> > helpers only for the coming system allocator tests.
> > >
> > 
> > Always open to improvements but my main point here is - helpers
> > replacing the data-path is a tricky proposition.
> 
> Again, we will not change the data path.
> 
> Oak
> 
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > Oak
> > >
> > > >
> > > > Matt
> > > >
> > > > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > > > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > > > ---
> > > > >  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
> > > > >  lib/xe/xe_util.h                   |  48 +++++++
> > > > >  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
> > > > >  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
> > > > >  4 files changed, 282 insertions(+), 329 deletions(-)
> > > > >
> > > > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > > > > index 050162b5e..17cd45e45 100644
> > > > > --- a/lib/xe/xe_util.c
> > > > > +++ b/lib/xe/xe_util.c
> > > > > @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
> > > > >
> > > > >  	return strcmp(gt_c_state, "gt-c6") == 0;
> > > > >  }
> > > > > +
> > > > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > > > +		uint32_t bo_size, uint64_t placement, unsigned int flags)
> > > > > +{
> > > > > +	struct cpu_va *data;
> > > > > +
> > > > > +	if (flags & USERPTR) {
> > > > > +		if (flags & INVALIDATE) {
> > > > > +			data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > PROT_READ | PROT_WRITE,
> > > > > +					MAP_SHARED | MAP_FIXED |
> > > > MAP_ANONYMOUS, -1, 0);
> > > > > +			igt_assert(data != MAP_FAILED);
> > > > > +		} else {
> > > > > +			data = aligned_alloc(xe_get_default_alignment(fd),
> > > > bo_size);
> > > > > +			igt_assert(data);
> > > > > +		}
> > > > > +	} else {
> > > > > +		*bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> > > > placement,
> > > > > +
> > > > 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > +		data = xe_bo_map(fd, *bo, bo_size);
> > > > > +	}
> > > > > +
> > > > > +	memset(data, 0, bo_size);
> > > > > +
> > > > > +	return data;
> > > > > +}
> > > > > +
> > > > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i = 0; i < n_exec_queues; i++) {
> > > > > +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > > > +		if (flags & BIND_EXEC_QUEUE)
> > > > > +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
> > > > vm, 0);
> > > > > +		else
> > > > > +			bind_exec_queues[i] = 0;
> > > > > +	};
> > > > > +}
> > > > > +
> > > > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > uint32_t bo,
> > > > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > > > +		struct cpu_va *data, unsigned int flags)
> > > > > +{
> > > > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > > > ONE_SEC;
> > > > > +
> > > > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > +	if (bo)
> > > > > +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> > > > bo_size, sync, 1);
> > > > > +	else
> > > > > +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> > > > > +				to_user_pointer(data), addr,
> > > > > +				bo_size, sync, 1);
> > > > > +
> > > > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > +			bind_exec_queues, fence_timeout);
> > > > > +	data[0].vm_sync = 0;
> > > > > +
> > > > > +	if (flags & PREFETCH) {
> > > > > +		/* Should move to system memory */
> > > > > +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> > > > > +				bo_size, sync, 1, 0);
> > > > > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > +				bind_exec_queues, fence_timeout);
> > > > > +		data[0].vm_sync = 0;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i)
> > > > > +{
> > > > > +	int b = 0;
> > > > > +	data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > > > +	data[i].batch[b++] = dst;
> > > > > +	data[i].batch[b++] = dst >> 32;
> > > > > +	data[i].batch[b++] = val;
> > > > > +	data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > > > +	igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > > > +}
> > > > > +
> > > > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int
> > n_execs,
> > > > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > > > +		int *map_fd, unsigned int flags)
> > > > > +{
> > > > > +	int i;
> > > > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > > > ONE_SEC;
> > > > > +
> > > > > +	for (i = 0; i < n_execs; i++) {
> > > > > +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > > > +		uint64_t batch_addr = addr + batch_offset;
> > > > > +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > > > +		uint64_t sdi_addr = addr + sdi_offset;
> > > > > +		int e = i % n_exec_queues;
> > > > > +
> > > > > +		if (flags & INVALID_VA)
> > > > > +			sdi_addr = 0x1fffffffffff000;
> > > > > +
> > > > > +		insert_store(sdi_addr, data, 0xc0ffee, i);
> > > > > +
> > > > > +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > > > +
> > > > > +		exec->exec_queue_id = exec_queues[e];
> > > > > +		exec->address = batch_addr;
> > > > > +		xe_exec(fd, exec);
> > > > > +
> > > > > +		if (flags & REBIND && i + 1 != n_execs) {
> > > > > +			xe_wait_ufence(fd, &data[i].exec_sync,
> > > > USER_FENCE_VALUE,
> > > > > +					exec_queues[e], fence_timeout);
> > > > > +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > > +					addr, bo_size, NULL, 0);
> > > > > +
> > > > > +			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > +			addr += bo_size;
> > > > > +
> > > > > +			if (bo)
> > > > > +				xe_vm_bind_async(fd, vm,
> > > > bind_exec_queues[e], bo,
> > > > > +						0, addr, bo_size, sync, 1);
> > > > > +			else
> > > > > +				xe_vm_bind_userptr_async(fd, vm,
> > > > > +						bind_exec_queues[e],
> > > > > +						to_user_pointer(data),
> > > > > +						addr, bo_size, sync, 1);
> > > > > +
> > > > > +			xe_wait_ufence(fd, &data[0].vm_sync,
> > > > USER_FENCE_VALUE,
> > > > > +					bind_exec_queues[e], fence_timeout);
> > > > > +			data[0].vm_sync = 0;
> > > > > +		}
> > > > > +
> > > > > +		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > > > +			if (!(flags & RACE)) {
> > > > > +				/*
> > > > > +				 * Wait for exec completion and check data as
> > > > > +				 * userptr will likely change to different
> > > > > +				 * physical memory on next mmap call triggering
> > > > > +				 * an invalidate.
> > > > > +				 */
> > > > > +				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > > +						USER_FENCE_VALUE,
> > > > exec_queues[e],
> > > > > +						fence_timeout);
> > > > > +				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > > +			} else if (i * 2 != n_execs) {
> > > > > +				/*
> > > > > +				 * We issue 1 mmap which races against running
> > > > > +				 * jobs. No real check here aside from this test
> > > > > +				 * not faulting on the GPU.
> > > > > +				 */
> > > > > +				continue;
> > > > > +			}
> > > > > +
> > > > > +			if (flags & RACE) {
> > > > > +				*map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > > > +						0x666);
> > > > > +				write(*map_fd, data, bo_size);
> > > > > +				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > +						PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > +						MAP_FIXED, *map_fd, 0);
> > > > > +			} else {
> > > > > +				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > +						PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > +						MAP_FIXED |
> > > > MAP_ANONYMOUS, -1, 0);
> > > > > +			}
> > > > > +
> > > > > +			igt_assert(data != MAP_FAILED);
> > > > > +		}
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > > > +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> > > > > +		uint32_t bo_size)
> > > > > +{
> > > > > +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC :
> > > > ONE_SEC;
> > > > > +
> > > > > +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> > > > > +			sync, 1);
> > > > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > +			bind_exec_queues, fence_timeout);
> > > > > +}
> > > > > +
> > > > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > > > +		uint32_t *bind_exec_queues, int n_exec_queues)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i = 0; i < n_exec_queues; i++) {
> > > > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > > +		if (bind_exec_queues[i])
> > > > > +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > > > > index 6480ea01a..aa1b0dcc1 100644
> > > > > --- a/lib/xe/xe_util.h
> > > > > +++ b/lib/xe/xe_util.h
> > > > > @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm,
> > uint32_t
> > > > bind_engine,
> > > > >
> > > > >  bool xe_is_gt_in_c6(int fd, int gt);
> > > > >
> > > > > +
> > > > > +#define USERPTR			(0x1 << 0)
> > > > > +#define REBIND			(0x1 << 1)
> > > > > +#define INVALIDATE		(0x1 << 2)
> > > > > +#define RACE			(0x1 << 3)
> > > > > +#define BIND_EXEC_QUEUE		(0x1 << 4)
> > > > > +#define PREFETCH		(0x1 << 5)
> > > > > +#define INVALID_FAULT		(0x1 << 6)
> > > > > +#define INVALID_VA		(0x1 << 7)
> > > > > +#define ENABLE_SCRATCH		(0x1 << 8)
> > > > > +#define VM_FOR_BO		(0x1 << 9)
> > > > > +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> > > > > +
> > > > > +#define MAX_N_EXEC_QUEUES	16
> > > > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > > > +#define MAP_ADDRESS		0x00007fadeadbe000
> > > > > +
> > > > > +#define ONE_SEC		MS_TO_NS(1000)
> > > > > +#define HUNDRED_SEC	MS_TO_NS(100000)
> > > > > +
> > > > > +struct cpu_va {
> > > > > +	uint32_t batch[16];
> > > > > +	uint64_t pad;
> > > > > +	uint64_t vm_sync;
> > > > > +	uint64_t exec_sync;
> > > > > +	uint32_t data;
> > > > > +};
> > > > > +
> > > > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > > > +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> > > > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> > > > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > uint32_t bo,
> > > > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > > > +		struct cpu_va *data, unsigned int flags);
> > > > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int
> > n_execs,
> > > > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > > > +		int *map_fd, unsigned int flags);
> > > > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i);
> > > > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > > > +		struct drm_xe_sync *sync, struct cpu_va *data,
> > > > > +		uint64_t addr, uint32_t bo_size);
> > > > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > > > +		uint32_t *bind_exec_queues, int n_exec_queues);
> > > > > +
> > > > >  #endif /* XE_UTIL_H */
> > > > > diff --git a/tests/intel/xe_exec_compute_mode.c
> > > > b/tests/intel/xe_exec_compute_mode.c
> > > > > index 3ec848164..e8d82cc69 100644
> > > > > --- a/tests/intel/xe_exec_compute_mode.c
> > > > > +++ b/tests/intel/xe_exec_compute_mode.c
> > > > > @@ -15,6 +15,7 @@
> > > > >  #include "igt.h"
> > > > >  #include "lib/igt_syncobj.h"
> > > > >  #include "lib/intel_reg.h"
> > > > > +#include "lib/xe/xe_util.h"
> > > > >  #include <sys/ioctl.h>
> > > > >  #include "xe_drm.h"
> > > > >
> > > > > @@ -23,15 +24,6 @@
> > > > >  #include "xe/xe_spin.h"
> > > > >  #include <string.h>
> > > > >
> > > > > -#define MAX_N_EXECQUEUES 	16
> > > > > -#define USERPTR				(0x1 << 0)
> > > > > -#define REBIND				(0x1 << 1)
> > > > > -#define INVALIDATE			(0x1 << 2)
> > > > > -#define RACE				(0x1 << 3)
> > > > > -#define BIND_EXECQUEUE		(0x1 << 4)
> > > > > -#define VM_FOR_BO			(0x1 << 5)
> > > > > -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> > > > > -
> > > > >  /**
> > > > >   * SUBTEST: twice-%s
> > > > >   * Description: Run %arg[1] compute machine test twice
> > > > > @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > > > *eci,
> > > > >  {
> > > > >  	uint32_t vm;
> > > > >  	uint64_t addr = 0x1a0000;
> > > > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > > >  	struct drm_xe_sync sync[1] = {
> > > > >  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> > > > >  		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > > > @@ -99,161 +90,38 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance
> > > > *eci,
> > > > >  		.num_syncs = 1,
> > > > >  		.syncs = to_user_pointer(sync),
> > > > >  	};
> > > > > -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> > > > > -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> > > > > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > > > > +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > > > >  	size_t bo_size;
> > > > >  	uint32_t bo = 0;
> > > > > -	struct {
> > > > > -		uint32_t batch[16];
> > > > > -		uint64_t pad;
> > > > > -		uint64_t vm_sync;
> > > > > -		uint64_t exec_sync;
> > > > > -		uint32_t data;
> > > > > -	} *data;
> > > > > -	int i, j, b;
> > > > > +	struct cpu_va *data;
> > > > > +	int i, j;
> > > > >  	int map_fd = -1;
> > > > >  	int64_t fence_timeout;
> > > > > +	uint64_t placement;
> > > > >
> > > > > -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> > > > > +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > > > >
> > > > >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > > > >  	bo_size = sizeof(*data) * n_execs;
> > > > >  	bo_size = xe_bb_size(fd, bo_size);
> > > > >
> > > > > -	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> > > > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > > > -		if (flags & BIND_EXECQUEUE)
> > > > > -			bind_exec_queues[i] =
> > > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > > -		else
> > > > > -			bind_exec_queues[i] = 0;
> > > > > -	};
> > > > > +	if (flags & EXEC_QUEUE_EARLY)
> > > > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > > n_exec_queues, eci, flags);
> > > > >
> > > > > -	if (flags & USERPTR) {
> > > > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > > > -		if (flags & INVALIDATE) {
> > > > > -			data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > PROT_READ |
> > > > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > > > -				    MAP_ANONYMOUS, -1, 0);
> > > > > -			igt_assert(data != MAP_FAILED);
> > > > > -		} else {
> > > > > -			data = aligned_alloc(xe_get_default_alignment(fd),
> > > > > -					     bo_size);
> > > > > -			igt_assert(data);
> > > > > -		}
> > > > > -	} else {
> > > > > -		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> > > > > -				  bo_size, vram_if_possible(fd, eci->gt_id),
> > > > > -
> > > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > -		data = xe_bo_map(fd, bo, bo_size);
> > > > > -	}
> > > > > -	memset(data, 0, bo_size);
> > > > > +	placement = vram_if_possible(fd, eci->gt_id);
> > > > >
> > > > > -	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> > > > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > > > -		if (flags & BIND_EXECQUEUE)
> > > > > -			bind_exec_queues[i] =
> > > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > > -		else
> > > > > -			bind_exec_queues[i] = 0;
> > > > > -	};
> > > > > +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > > > >
> > > > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -	if (bo)
> > > > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > > > > -				 bo_size, sync, 1);
> > > > > -	else
> > > > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > > > -					 to_user_pointer(data), addr,
> > > > > -					 bo_size, sync, 1);
> > > > > -#define ONE_SEC	MS_TO_NS(1000)
> > > > > -#define HUNDRED_SEC	MS_TO_NS(100000)
> > > > > +	if(!(flags & EXEC_QUEUE_EARLY))
> > > > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > > n_exec_queues, eci, flags);
> > > > > +
> > > > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> > > > flags);
> > > > >
> > > > >  	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> > > > >
> > > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > -		       bind_exec_queues[0], fence_timeout);
> > > > > -	data[0].vm_sync = 0;
> > > > > -
> > > > > -	for (i = 0; i < n_execs; i++) {
> > > > > -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > > > -		uint64_t batch_addr = addr + batch_offset;
> > > > > -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > > > -		uint64_t sdi_addr = addr + sdi_offset;
> > > > > -		int e = i % n_exec_queues;
> > > > > -
> > > > > -		b = 0;
> > > > > -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > > > -		data[i].batch[b++] = sdi_addr;
> > > > > -		data[i].batch[b++] = sdi_addr >> 32;
> > > > > -		data[i].batch[b++] = 0xc0ffee;
> > > > > -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > > > -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > > > -
> > > > > -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > > > -
> > > > > -		exec.exec_queue_id = exec_queues[e];
> > > > > -		exec.address = batch_addr;
> > > > > -		xe_exec(fd, &exec);
> > > > > -
> > > > > -		if (flags & REBIND && i + 1 != n_execs) {
> > > > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > > > USER_FENCE_VALUE,
> > > > > -				       exec_queues[e], fence_timeout);
> > > > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > > -					   addr, bo_size, NULL, 0);
> > > > > -
> > > > > -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -			addr += bo_size;
> > > > > -			if (bo)
> > > > > -				xe_vm_bind_async(fd, vm,
> > > > bind_exec_queues[e], bo,
> > > > > -						 0, addr, bo_size, sync, 1);
> > > > > -			else
> > > > > -				xe_vm_bind_userptr_async(fd, vm,
> > > > > -							 bind_exec_queues[e],
> > > > > -							 to_user_pointer(data),
> > > > > -							 addr, bo_size, sync,
> > > > > -							 1);
> > > > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > > > USER_FENCE_VALUE,
> > > > > -				       bind_exec_queues[e], fence_timeout);
> > > > > -			data[0].vm_sync = 0;
> > > > > -		}
> > > > > -
> > > > > -		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > > > -			if (!(flags & RACE)) {
> > > > > -				/*
> > > > > -				 * Wait for exec completion and check data as
> > > > > -				 * userptr will likely change to different
> > > > > -				 * physical memory on next mmap call triggering
> > > > > -				 * an invalidate.
> > > > > -				 */
> > > > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > > -					       USER_FENCE_VALUE,
> > > > exec_queues[e],
> > > > > -					       fence_timeout);
> > > > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > > -			} else if (i * 2 != n_execs) {
> > > > > -				/*
> > > > > -				 * We issue 1 mmap which races against running
> > > > > -				 * jobs. No real check here aside from this test
> > > > > -				 * not faulting on the GPU.
> > > > > -				 */
> > > > > -				continue;
> > > > > -			}
> > > > > -
> > > > > -			if (flags & RACE) {
> > > > > -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > > > -					      0x666);
> > > > > -				write(map_fd, data, bo_size);
> > > > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > -					    PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > -					    MAP_FIXED, map_fd, 0);
> > > > > -			} else {
> > > > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > -					    PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > > > 0);
> > > > > -			}
> > > > > -			igt_assert(data != MAP_FAILED);
> > > > > -		}
> > > > > -	}
> > > > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > > > flags);
> > > > >
> > > > >  	j = flags & INVALIDATE ? n_execs - 1 : 0;
> > > > >  	for (i = j; i < n_execs; i++)
> > > > > @@ -264,20 +132,12 @@ test_exec(int fd, struct
> > > > drm_xe_engine_class_instance *eci,
> > > > >  	if (flags & INVALIDATE)
> > > > >  		usleep(250000);
> > > > >
> > > > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > > > -			   sync, 1);
> > > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > -		       bind_exec_queues[0], fence_timeout);
> > > > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> > > > >
> > > > >  	for (i = j; i < n_execs; i++)
> > > > >  		igt_assert_eq(data[i].data, 0xc0ffee);
> > > > >
> > > > > -	for (i = 0; i < n_exec_queues; i++) {
> > > > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > > -		if (bind_exec_queues[i])
> > > > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > > -	}
> > > > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > > > n_exec_queues);
> > > > >
> > > > >  	if (bo) {
> > > > >  		munmap(data, bo_size);
> > > > > @@ -492,14 +352,14 @@ igt_main
> > > > >  		{ "userptr-rebind", USERPTR | REBIND },
> > > > >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > > > >  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> > > > > -		{ "bindexecqueue", BIND_EXECQUEUE },
> > > > > -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> > > > > -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> > > > > -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> > > > USERPTR |
> > > > > +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > > > > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> > > > > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> > > > > +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> > > > USERPTR |
> > > > >  			REBIND },
> > > > > -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> > > > USERPTR |
> > > > > +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> > > > USERPTR |
> > > > >  			INVALIDATE },
> > > > > -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> > > > USERPTR |
> > > > > +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> > > > USERPTR |
> > > > >  			INVALIDATE | RACE },
> > > > >  		{ NULL },
> > > > >  	};
> > > > > diff --git a/tests/intel/xe_exec_fault_mode.c
> > > > b/tests/intel/xe_exec_fault_mode.c
> > > > > index 40fe1743e..7b2fef224 100644
> > > > > --- a/tests/intel/xe_exec_fault_mode.c
> > > > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > > > @@ -16,24 +16,13 @@
> > > > >  #include "igt.h"
> > > > >  #include "lib/igt_syncobj.h"
> > > > >  #include "lib/intel_reg.h"
> > > > > +#include "lib/xe/xe_util.h"
> > > > >  #include "xe_drm.h"
> > > > >
> > > > >  #include "xe/xe_ioctl.h"
> > > > >  #include "xe/xe_query.h"
> > > > >  #include <string.h>
> > > > >
> > > > > -#define MAX_N_EXEC_QUEUES	16
> > > > > -
> > > > > -#define USERPTR		(0x1 << 0)
> > > > > -#define REBIND		(0x1 << 1)
> > > > > -#define INVALIDATE	(0x1 << 2)
> > > > > -#define RACE		(0x1 << 3)
> > > > > -#define BIND_EXEC_QUEUE	(0x1 << 4)
> > > > > -#define PREFETCH	(0x1 << 5)
> > > > > -#define INVALID_FAULT	(0x1 << 6)
> > > > > -#define INVALID_VA	(0x1 << 7)
> > > > > -#define ENABLE_SCRATCH  (0x1 << 8)
> > > > > -
> > > > >  /**
> > > > >   * SUBTEST: invalid-va
> > > > >   * Description: Access invalid va and check for EIO through user fence.
> > > > > @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> > > > *eci,
> > > > >  {
> > > > >  	uint32_t vm;
> > > > >  	uint64_t addr = 0x1a0000;
> > > > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > > >  	struct drm_xe_sync sync[1] = {
> > > > >  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags =
> > > > DRM_XE_SYNC_FLAG_SIGNAL,
> > > > >  	          .timeline_value = USER_FENCE_VALUE },
> > > > > @@ -113,14 +101,9 @@ test_exec(int fd, struct
> > drm_xe_engine_class_instance
> > > > *eci,
> > > > >  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > > > >  	size_t bo_size;
> > > > >  	uint32_t bo = 0;
> > > > > -	struct {
> > > > > -		uint32_t batch[16];
> > > > > -		uint64_t pad;
> > > > > -		uint64_t vm_sync;
> > > > > -		uint64_t exec_sync;
> > > > > -		uint32_t data;
> > > > > -	} *data;
> > > > > -	int i, j, b;
> > > > > +	struct cpu_va *data;
> > > > > +	uint64_t placement;
> > > > > +	int i, j;
> > > > >  	int map_fd = -1;
> > > > >
> > > > >  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> > > > > @@ -134,144 +117,19 @@ test_exec(int fd, struct
> > > > drm_xe_engine_class_instance *eci,
> > > > >  	bo_size = sizeof(*data) * n_execs;
> > > > >  	bo_size = xe_bb_size(fd, bo_size);
> > > > >
> > > > > -	if (flags & USERPTR) {
> > > > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > > > -		if (flags & INVALIDATE) {
> > > > > -			data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > PROT_READ |
> > > > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > > > -				    MAP_ANONYMOUS, -1, 0);
> > > > > -			igt_assert(data != MAP_FAILED);
> > > > > -		} else {
> > > > > -			data = aligned_alloc(xe_get_default_alignment(fd),
> > > > > -					     bo_size);
> > > > > -			igt_assert(data);
> > > > > -		}
> > > > > -	} else {
> > > > > -		if (flags & PREFETCH)
> > > > > -			bo = xe_bo_create(fd, 0, bo_size,
> > > > > -					  all_memory_regions(fd) |
> > > > > -					  vram_if_possible(fd, 0),
> > > > > -
> > > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > -		else
> > > > > -			bo = xe_bo_create(fd, 0, bo_size,
> > > > > -					  vram_if_possible(fd, eci->gt_id),
> > > > > -
> > > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > > -		data = xe_bo_map(fd, bo, bo_size);
> > > > > -	}
> > > > > -	memset(data, 0, bo_size);
> > > > > -
> > > > > -	for (i = 0; i < n_exec_queues; i++) {
> > > > > -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> > > > > -		if (flags & BIND_EXEC_QUEUE)
> > > > > -			bind_exec_queues[i] =
> > > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > > -		else
> > > > > -			bind_exec_queues[i] = 0;
> > > > > -	};
> > > > > -
> > > > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -	if (bo)
> > > > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > > > bo_size, sync, 1);
> > > > > -	else
> > > > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > > > -					 to_user_pointer(data), addr,
> > > > > -					 bo_size, sync, 1);
> > > > > -#define ONE_SEC	MS_TO_NS(1000)
> > > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > -		       bind_exec_queues[0], ONE_SEC);
> > > > > -	data[0].vm_sync = 0;
> > > > > -
> > > > > -	if (flags & PREFETCH) {
> > > > > -		/* Should move to system memory */
> > > > > -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> > > > > -				     bo_size, sync, 1, 0);
> > > > > -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > -			       bind_exec_queues[0], ONE_SEC);
> > > > > -		data[0].vm_sync = 0;
> > > > > -	}
> > > > > -
> > > > > -	for (i = 0; i < n_execs; i++) {
> > > > > -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> > > > > -		uint64_t batch_addr = addr + batch_offset;
> > > > > -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> > > > > -		uint64_t sdi_addr = addr + sdi_offset;
> > > > > -		int e = i % n_exec_queues;
> > > > > +	placement = (flags & PREFETCH) ? all_memory_regions(fd) |
> > > > > +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
> > > > >
> > > > > -		b = 0;
> > > > > -		if (flags & INVALID_VA)
> > > > > -			sdi_addr = 0x1fffffffffff000;
> > > > > +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > > > >
> > > > > -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > > > -		data[i].batch[b++] = sdi_addr;
> > > > > -		data[i].batch[b++] = sdi_addr >> 32;
> > > > > -		data[i].batch[b++] = 0xc0ffee;
> > > > > -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> > > > > -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> > > > > +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > > > +			n_exec_queues, eci, flags);
> > > > >
> > > > > -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> > > > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data,
> > > > flags);
> > > > >
> > > > > -		exec.exec_queue_id = exec_queues[e];
> > > > > -		exec.address = batch_addr;
> > > > > -		xe_exec(fd, &exec);
> > > > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > > > flags);
> > > > >
> > > > > -		if (flags & REBIND && i + 1 != n_execs) {
> > > > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > > > USER_FENCE_VALUE,
> > > > > -				       exec_queues[e], ONE_SEC);
> > > > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > > -					   addr, bo_size, NULL, 0);
> > > > > -
> > > > > -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -			addr += bo_size;
> > > > > -			if (bo)
> > > > > -				xe_vm_bind_async(fd, vm,
> > > > bind_exec_queues[e], bo,
> > > > > -						 0, addr, bo_size, sync, 1);
> > > > > -			else
> > > > > -				xe_vm_bind_userptr_async(fd, vm,
> > > > > -							 bind_exec_queues[e],
> > > > > -							 to_user_pointer(data),
> > > > > -							 addr, bo_size, sync,
> > > > > -							 1);
> > > > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > > > USER_FENCE_VALUE,
> > > > > -				       bind_exec_queues[e], ONE_SEC);
> > > > > -			data[0].vm_sync = 0;
> > > > > -		}
> > > > > -
> > > > > -		if (flags & INVALIDATE && i + 1 != n_execs) {
> > > > > -			if (!(flags & RACE)) {
> > > > > -				/*
> > > > > -				 * Wait for exec completion and check data as
> > > > > -				 * userptr will likely change to different
> > > > > -				 * physical memory on next mmap call triggering
> > > > > -				 * an invalidate.
> > > > > -				 */
> > > > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > > -					       USER_FENCE_VALUE,
> > > > exec_queues[e],
> > > > > -					       ONE_SEC);
> > > > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > > -			} else if (i * 2 != n_execs) {
> > > > > -				/*
> > > > > -				 * We issue 1 mmap which races against running
> > > > > -				 * jobs. No real check here aside from this test
> > > > > -				 * not faulting on the GPU.
> > > > > -				 */
> > > > > -				continue;
> > > > > -			}
> > > > > -
> > > > > -			if (flags & RACE) {
> > > > > -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> > > > > -					      0x666);
> > > > > -				write(map_fd, data, bo_size);
> > > > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > -					    PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > -					    MAP_FIXED, map_fd, 0);
> > > > > -			} else {
> > > > > -				data = mmap((void *)MAP_ADDRESS, bo_size,
> > > > > -					    PROT_READ | PROT_WRITE,
> > > > MAP_SHARED |
> > > > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > > > 0);
> > > > > -			}
> > > > > -			igt_assert(data != MAP_FAILED);
> > > > > -		}
> > > > > -	}
> > > > >  	if (!(flags & INVALID_FAULT)) {
> > > > >  		int64_t timeout = ONE_SEC;
> > > > >
> > > > > @@ -286,22 +144,15 @@ test_exec(int fd, struct
> > > > drm_xe_engine_class_instance *eci,
> > > > >  							       exec_queues[i %
> > > > n_exec_queues], &timeout), 0);
> > > > >  		}
> > > > >  	}
> > > > > -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> > > > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > > > -			   sync, 1);
> > > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > > -		       bind_exec_queues[0], ONE_SEC);
> > > > > +
> > > > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> > > > >
> > > > >  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> > > > >  		for (i = j; i < n_execs; i++)
> > > > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > >  	}
> > > > >
> > > > > -	for (i = 0; i < n_exec_queues; i++) {
> > > > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > > -		if (bind_exec_queues[i])
> > > > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > > -	}
> > > > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > > > n_exec_queues);
> > > > >
> > > > >  	if (bo) {
> > > > >  		munmap(data, bo_size);
> > > > > --
> > > > > 2.25.1
> > > > >
