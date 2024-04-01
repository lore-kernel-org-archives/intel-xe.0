Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C1DCD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 20:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB88210F4DC;
	Mon,  1 Apr 2024 20:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOeDTdDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3583110F4DC
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712003346; x=1743539346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VvFcrbWoBr1d+RlhLY8i+Kqa2kfhVTDdaa4grSHqQAY=;
 b=dOeDTdDkwvS2cAzkYLUY/RfX+sjPy8Nf9VGjh1Pu2dcPRLdKVTlqd6Ze
 doM4kHXVf8qLYiKyFxqYJT8wQagLiPj9qQCPhhYmLyHNgZtcFPV/2LA2x
 CEDGfbxHjsaGm0/T2J13Opyk8pZ98JuxDs3v6qoxW6vng4LDCPLTTwxxo
 pC02KHlh5gdOusfqJr7cWDi8MPDf4JNHi+gL+roAnHy4FjNhLKI/nXoNc
 k4frJ1pweofuyl2HnnclIZUgC+JEEcpqIoAZa+FDe3B1Rl9PHoWR8c9Ef
 iEUx0pAfiKVeW5qAcGzm/Pg8gsRplg4uZtuq4jV0wMwNJUBdubIdPcBUK A==;
X-CSE-ConnectionGUID: 5cZnpeWHSeaTcS/DhCom6A==
X-CSE-MsgGUID: j4Mm04dJSb6df8mpIbpOig==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10107955"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="10107955"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 13:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="18281197"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 13:29:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 13:29:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 13:29:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 13:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWFClnhHYRruDIGEFn2k4qcFwr0FpJgKO1/5/ca5pZHGuLA9bULYIvj5jC11Elv7rVUOUpNgAARYZaaPpA/F6za+82HRNDTWGyojUK5uEnftw6V2UWsyUpQ68J6VA98m9B+vbLmZOwUFq3uXgp4dX37vWPNQ5IGZom8b2vwEJv7PsIdtUKXEXxdnPDM/XEoLc+8BYp2zANvKjlmrvNc+9K8UNanANjXmCuSzb3Yo9e2rGF4kfU43fG9jojxSRC7WhHnnB01LNuDrQLmR0GyfE/At/E/89aFxuk/L2jbOJT7CWH6i0vVLP2ZzSJLWcRWC9tCCLQyH6d8taEjwPKNK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IH53VKnSYkQTcx4KfA7lLvGOxPSi98MOz2sFRNnxJE=;
 b=AvOrgQ6fVjEcDxTIKwvEb3j5FXKct+0ldN0Q3WNJKJ1bn72rCyO1L1JZ7Kdq96xWWw883QZGgTCb0knCANiyArGCPWx5sH4hTxt3D7rDMNnBT8iY3b1XBsmcHB8VZuq/ns9j+CyFNAYNU7R9ds4lZvDWx0xpUno2xihMO5Zam3axjDhUTZ666gDFomxM7qhyoVg1HgHOrzi5688ultRxI0PPX6/yKQUcLL+matMnRw2yRwIUKdIvsauqvfOh1TQ1tl4N7dhQs/tw6X55FwlsSsMGPLput8rKq1RCTKmTf7ZrIpxgLbxY0NCEgzoIbnJu3xOTnUPBb3yb+nEtM9sFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 20:28:58 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 1 Apr 2024
 20:28:58 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar,
 Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Chehab, Mauro" <mauro.chehab@intel.com>
Subject: RE: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Topic: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Index: AQHag52eNekFIIWaZEqEJrIYt+hn07FSVwWAgAE4UiCAADGQAIAAFk+A
Date: Mon, 1 Apr 2024 20:28:58 +0000
Message-ID: <SA1PR11MB69919A5C5DC3DD340B5BC0CE923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
 <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A2F4E463A264CBCFB37C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zgr/nNOny61ftWUk@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zgr/nNOny61ftWUk@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ2PR11MB7599:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Duf0cE4DBaTAUPJrnMiS5hfL0ZrJ+M10W+dMkQPUOX4OW6yXhInyZ8yHKTYAdfHSPxvM5B4cxAanOcAbWexVpGfjFfDmg/lwWjRnEI0QmIiPpn+NuZBvGHrwSZrUbjoIin2ryVwmcukku7UYshWKvhY7+tda7vwQnLbZezZ5nJI23P6brZPk8vmrTDCbf3jEr3YdkJbu8DHms8Udt88MYnd3KACejodHURn56Q1AEojoiI6dhA6Sam+RM3rawWgy9oLqViqiVy/xXcvZibGPmKm9X7ka5b8HtpKDccaxL9jXqd15FrD0DND2OEmQnVTBUSQ05bSFro9CFy93nM56C5RKyClj25eXxN86Um7oKfi4UjZvsnL4Aw99ZmIpNvv5woEPprVI2v78yM/KF7WZBB8y+5ajgDvD0/zma7omXGNQ1UH2HmUfTzopUci0xTgIG6e71hQ0FpxYZsbPeAlAAbWeV0Cc8Z6KSFa37nXwiffyV2akcdfgIAyVTCAoX8RpMoZQLqHmZk6xf2XgDhlKOT26DwLAf6aKz4EgqRUxqxsWFgqVWJxMn0C65sG95DcJ1T44lBGvvkVh6BT7BL82OdRftDXEiH/jGy4YwHfmd0+ogkqL4KefBX9ctLKoeCnC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fbXj0QC/PlRvuQeTHl0eYAwpFuIXUVMRBz8rUmXvNtEC95NSue+78FYvWN+s?=
 =?us-ascii?Q?nvBakTiufQ79IC2ggRL4LJiln7au0+We9Wdd710plFB7NPDjphxLQm8zh3Y4?=
 =?us-ascii?Q?aBKm1HMj5VB/WcLhQ+VQ3lPIk/AHCB54TGFfRB+RiXp/aP+OeeFeBDVE1sR7?=
 =?us-ascii?Q?D/Muu/t2uDilDw/wpnvWI4TEQ0hivTsP6g1Ow7OCM+JHNKE62FkGEeDiZTtW?=
 =?us-ascii?Q?stUlfXbt7IpTnnk/4ffubFabZWD6agN91qtu20JRNih4amF55LCmjFsRFeuY?=
 =?us-ascii?Q?ABqkPr/1DETsax2AGlgQnkVtQWk6140Z1uIdXiLXA8KtN5f97APn3vQugHAa?=
 =?us-ascii?Q?rn2xKd8Akq/LLktU1FN+D23JHk8bEQG6EZjytkuwkfWDmZRD4n4rNatodko+?=
 =?us-ascii?Q?K0UAtYl9qBb6/cUeUGoQKznB/1T5yj27uCGNXwj+6egTw/NDMSpMzajISqqa?=
 =?us-ascii?Q?VnF6/rkKZgMSEIohyklIXs2pO+NbMqzXHqwWYckdscxc0rctE7FIo8cONZrB?=
 =?us-ascii?Q?vvyuHo7YqMA2BrKjidI7LcUzkZ4vc78joWtZw0XPiURXVTM9Aq4nNglQ5z/X?=
 =?us-ascii?Q?CPuj6NCDNveLoODOeOlMEgSznJk6pV15x5w/iUqZqriIgaygX5Dozdktyb1q?=
 =?us-ascii?Q?Wc19/Prf0/JZnduk4RSk+bceReVRCpN3V/9V4SRASkKyJ5gX46kK/8oUYtHR?=
 =?us-ascii?Q?u/2XhGoj979d/t6p/V7m3gRArIVbt60mEyDlfozGCQU51X3u2y875SQb2sVo?=
 =?us-ascii?Q?jYwA13Og0SO8OPpZNytDkkH+xD+/DIShL46WnCNgvURZBr/eXehm46iGtQpi?=
 =?us-ascii?Q?/FB6Sz/RDlpkwzs5JmM0IxkRqL3Pg7sBWz9fQaBtM2V0b1lO9oq5tFaq/MEX?=
 =?us-ascii?Q?vbebI0ywF+PCRMGfS3FQwRaGSOGAcMg0dBBiBSO05zojGK44n8w2zEiYdwvG?=
 =?us-ascii?Q?HC+o9PkkyN6MlaH7M+JoVQfznOhwbKW/4C9IFm3lAJAwc4/3bwMBM37WJ6HD?=
 =?us-ascii?Q?HqDCQIeIq6dDVozH1y/9OpaeL/YecYuR+ISDSb/yWKvVp/Tg1F0uk7/1DSWG?=
 =?us-ascii?Q?D/Bc4e8JTvinPTQGgGWt5mllWuMvKrqYVAYy9Pi/aD4P43b18GXsoUW5LOUP?=
 =?us-ascii?Q?c81I8VGA3MBuT5ABphOcjrNMRto6yXbSLVBPNGv/1FwR1b+yK6kj8PsKY2E1?=
 =?us-ascii?Q?1jRLmcie4h/+DKl3lGPwNcYr16kgn11KHFSQ3u+pBM5OFbvrh2tjEDytcoSl?=
 =?us-ascii?Q?8/F4G1DbJlSr7fZNxixH1PVeAHXpgpn/LokwGA6o9nT3aGgQpoHSViw8ukeh?=
 =?us-ascii?Q?sbQAdhoOXNnhrWn48BbBh04OPz0qqsurPPo9lhG311klSa6JaoFJ1WWRDqTU?=
 =?us-ascii?Q?V8Yc58IRwQ00j6ardk/UW4++QyZwFIFwGxsRmP1lkj6jWwlrmxQR/xSZXpqJ?=
 =?us-ascii?Q?YKRwFmUyIbaCtQN5A4wEzyDRkQMcqUUAqauUw+S9lma+cHqXzWU1HUVLYirh?=
 =?us-ascii?Q?2NkaHb/8fTmof7Xza/6tjAJ0lp8RqkkMq0gix6FbTouEYbM1sUSq6eY8N08L?=
 =?us-ascii?Q?RbTLsJ+2vcPZFE8PjGg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd3de5-e480-49ac-6e94-08dc528a5be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 20:28:58.0640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/o4i9evgte68AxK2/eUnoUtD1ZB3litTBAQ/AeHZVa9F8gYT5kmv286dGJFzwgvoBzVtoGZG0ES0ddljIJmDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7599
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

Hi Matt

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, April 1, 2024 2:40 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; intel-
> xe@lists.freedesktop.org; Kumar, Janga Rahul <janga.rahul.kumar@intel.com=
>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Chehab, Mauro
> <mauro.chehab@intel.com>
> Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
>=20
> On Mon, Apr 01, 2024 at 10:10:06AM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Sunday, March 31, 2024 5:05 PM
> > > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> > > <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> > > Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
> > >
> > > On Mon, Apr 01, 2024 at 12:29:49AM +0530, Bommu Krishnaiah wrote:
> > > > Creating the helper functions which can be reused by many tests,
> > > > as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> > > > are used this helper functions.
> > > >
> > >
> > > As the author of most these tests and IGTs, I can say while not great=
 to
> > > have copy paste between tests I much prefer it to adding helpers to t=
ry
> > > to jam the needs of each test into the helpers. IMO this just creates=
 a
> > > headache in the long run. e.g. Let's say I want to change the behavio=
r
> > > of xe_exec_compute_mode but not xe_exec_fault_mode, with shared
> helpers
> > > this gets harder.
> >
> > Duplicated codes is not a good practice in software. When you have a fi=
x, you
> need to fix all the places where you have the duplicated codes.
> >
>=20
> I understand concept of why to not use duplicate codes but see below the
> design philosophy of these tests.
>=20
> > In the example you give, it depends on how we make the helpers. If the
> helpers are not abstract well enough, we will run into the problem you sa=
id.
> >
> > The helper idea is inherited from i915. With those helpers, we can writ=
e a test
> with less than 50 lines of codes. In many cases, just ~20 lines of code, =
very easy to
> read and debug. Just take a look of i915 gem_vm_pagefault.c and i915_svm.=
c.
> >
>=20
> gem_vm_pagefault.c is 2000 plus lines of code for 27 tests.
>=20
> The test_exec function in xe_exec_compute_mode is ~150 lines of code
> which generates 50+ plus tests. There is power to a single data path
> controlled by various flags - this leads to the pattern of testing which
> is not directed rather do a bunch of things all at the same time. That
> is the intent of tests which use this style of coding (xe_exec_basic,
> xe_exec_compute_mode, xe_exec_balancer, xe_exec_fault_mode, and
> xe_exec_threads). I've used this style of coding to test hardware /
> software over the years (started my career writing functional tests for
> hardware) and can say these style of tests are by far the most effective
> for finding bugs / producing coverage / confidence.


Yes, I was also amazed by the efficiency of the xe style test. But that doe=
sn't prohibit we introduce a few helpers.

As said in the other thread of this code review, I agree we can continue th=
is style for the existing test. I also asked Krishna to remove some big hel=
pers. The idea is, we will introduce a few simple helpers (mainly for the s=
ystem allocator tests which will take another style: each test is simple, b=
ut overall has less test/LOC efficiency).=20

We will apply those helpers for the existing tests but won't change your co=
ding style.=20

>=20
> Also they should be easily extentable, see [1] which adds some new
> sections to xe_exec_compute_mode to test [2]. New tests are added by
> adding a new flag + update data path with new flags. This is my example
> why for these types of tests helpers replacing the data-path is not
> ideal.
>=20
> With all of this, I'm not suggesting helpers are not useful nor I am
> suggesting directed testing is not useful (see xe_vm, largely a
> directed test one of the most essential tests in the suite) just in this
> case I do not think the aforementioned tests will benefit from helpers
> as written in this patch.

Sure. Let's Krishna rework on the helpers and let's see what we get. As sai=
d, our goal is not to simplify the existing test, nor to change the coding =
style of existing test.=20

Whether we can apply helpers to existing tests? It all depends on how we ab=
stract the helpers well enough. I believe helpers such as create and map bu=
ffer, create and fill command buffer, submit command buffer etc can simplif=
y things a little. But lets wait for Krishna's improvement and see.



>=20
> [1] https://patchwork.freedesktop.org/patch/583145/?series=3D131211&rev=
=3D1
> [2] https://patchwork.freedesktop.org/series/130935/
>=20
> > Xe igt is rather complicated compared above i915 tests. In the past few=
 days, I
> had to debug into xe-exec-threads, it took me long time to really underst=
and the
> test. The main reason is, we have a huge function such as test_legacy_mod=
e, and
> flags is used to control the behavior of the test. This is hard to read, =
maintain and
> debug.
> >
>=20
> Saying something is complicated is a matter of opinion. I think the i915
> tests are incomprehensible and can easily understand the Xe tests but
> course I wrote the Xe tests... I suspect the inverse is true in the i915
> tests...
>=20
> I will say if xe_exec_threads runs to completion the condfience level in
> submission working Xe is very, very high. Again ~1500 lines of code
> generates ~120 tests.

Agreed. Most of the i915 tests are also the same style as you coded for xe.=
 Just those two I mentioned above used another style. I have no doubt of th=
e efficiency of that style. As said, I don't have any intension to change t=
his style.

>=20
> > >
> > > I'd much rather leave this as is.
> > >
> > > Maybe I can buy a helper or two to program the batches, i.e.
> > > insert_store LGTM, but certainly not the logic doing bind, invalidate=
s,
> > > loop, etc...
> >
> >
> > Let me take a look of the helpers, and see whether we can make it bette=
r. Our
> plan is to use those helpers for system allocator test. We use existing t=
ests to test
> those helpers because right now we don't have system allocator ready. So =
let's
> improve it first. We might end up something which is good for both existi=
ng test
> and coming system allocator test.
> >
>=20
> Again I don't like in general predicting the future... But I'd almostly
> certainly say a test in the style of afformentioned tests will be
> written too with me insisting or writing one myself given my experience
> doing so.
>=20
> Off the top of my head...
>=20
> - various allocation sizes
> - mix mmap / malloc / BO allocations
> - aligned / unaligned allocations
> - different madvise policies
> - allocations that faulted in (CPU touches pages before GPU) or not
>   faulted in (no backing store on GPU access)
> - races between CPU / GPU access
> - sparse access to allocations
> - dynamic freeing of allocations
> - intentionally leak memory
> - invalid addresses
> - allocate / GPU fault in more memory than VRAM available causing evictio=
n
>=20
> All of this within a single function controlled by flags.

In the coding style I preferred, each of above lines will be one function, =
vs single function controlled by flags. I am pretty sure my style will be m=
ore readable but at the cost of more LOC.

Again, I think both styles works. Both have its pros and cons. I don't have=
 any intension to change the coding style of existing tests.


>=20
> Extend to multi-threaded versions with dedicated VMs or a shared VMs.
>=20
> Extend to multi-process version with dedicated VMs and FDs.
>=20
> So this will probably be 100s of tests with more or less 1 function
> called with different arguments. I bet if a test like this run to
> completion confidence in SA design is very, very high.
>=20
> > We will let you decide whether you want to use those helpers for existi=
ng tests.
> If we can't make something good for existing tests, we will target to usi=
ng those
> helpers only for the coming system allocator tests.
> >
>=20
> Always open to improvements but my main point here is - helpers
> replacing the data-path is a tricky proposition.

Again, we will not change the data path.

Oak


>=20
> Matt
>=20
> > Thanks,
> > Oak
> >
> > >
> > > Matt
> > >
> > > > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > > > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++=
++++
> > > >  lib/xe/xe_util.h                   |  48 +++++++
> > > >  tests/intel/xe_exec_compute_mode.c | 190 ++++---------------------=
---
> > > >  tests/intel/xe_exec_fault_mode.c   | 179 +++----------------------=
-
> > > >  4 files changed, 282 insertions(+), 329 deletions(-)
> > > >
> > > > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > > > index 050162b5e..17cd45e45 100644
> > > > --- a/lib/xe/xe_util.c
> > > > +++ b/lib/xe/xe_util.c
> > > > @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
> > > >
> > > >  	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;
> > > >  }
> > > > +
> > > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > > +		uint32_t bo_size, uint64_t placement, unsigned int flags)
> > > > +{
> > > > +	struct cpu_va *data;
> > > > +
> > > > +	if (flags & USERPTR) {
> > > > +		if (flags & INVALIDATE) {
> > > > +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > PROT_READ | PROT_WRITE,
> > > > +					MAP_SHARED | MAP_FIXED |
> > > MAP_ANONYMOUS, -1, 0);
> > > > +			igt_assert(data !=3D MAP_FAILED);
> > > > +		} else {
> > > > +			data =3D aligned_alloc(xe_get_default_alignment(fd),
> > > bo_size);
> > > > +			igt_assert(data);
> > > > +		}
> > > > +	} else {
> > > > +		*bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> > > placement,
> > > > +
> > > 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > +		data =3D xe_bo_map(fd, *bo, bo_size);
> > > > +	}
> > > > +
> > > > +	memset(data, 0, bo_size);
> > > > +
> > > > +	return data;
> > > > +}
> > > > +
> > > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	for (i =3D 0; i < n_exec_queues; i++) {
> > > > +		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > > > +		if (flags & BIND_EXEC_QUEUE)
> > > > +			bind_exec_queues[i] =3D xe_bind_exec_queue_create(fd,
> > > vm, 0);
> > > > +		else
> > > > +			bind_exec_queues[i] =3D 0;
> > > > +	};
> > > > +}
> > > > +
> > > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> uint32_t bo,
> > > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > > +		struct cpu_va *data, unsigned int flags)
> > > > +{
> > > > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> > > ONE_SEC;
> > > > +
> > > > +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > +	if (bo)
> > > > +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> > > bo_size, sync, 1);
> > > > +	else
> > > > +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> > > > +				to_user_pointer(data), addr,
> > > > +				bo_size, sync, 1);
> > > > +
> > > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > +			bind_exec_queues, fence_timeout);
> > > > +	data[0].vm_sync =3D 0;
> > > > +
> > > > +	if (flags & PREFETCH) {
> > > > +		/* Should move to system memory */
> > > > +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> > > > +				bo_size, sync, 1, 0);
> > > > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > +				bind_exec_queues, fence_timeout);
> > > > +		data[0].vm_sync =3D 0;
> > > > +	}
> > > > +}
> > > > +
> > > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val,=
 int i)
> > > > +{
> > > > +	int b =3D 0;
> > > > +	data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > > > +	data[i].batch[b++] =3D dst;
> > > > +	data[i].batch[b++] =3D dst >> 32;
> > > > +	data[i].batch[b++] =3D val;
> > > > +	data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > > > +	igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > > > +}
> > > > +
> > > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int
> n_execs,
> > > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > > +		int *map_fd, unsigned int flags)
> > > > +{
> > > > +	int i;
> > > > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> > > ONE_SEC;
> > > > +
> > > > +	for (i =3D 0; i < n_execs; i++) {
> > > > +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > > > +		uint64_t batch_addr =3D addr + batch_offset;
> > > > +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > > > +		uint64_t sdi_addr =3D addr + sdi_offset;
> > > > +		int e =3D i % n_exec_queues;
> > > > +
> > > > +		if (flags & INVALID_VA)
> > > > +			sdi_addr =3D 0x1fffffffffff000;
> > > > +
> > > > +		insert_store(sdi_addr, data, 0xc0ffee, i);
> > > > +
> > > > +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)dat=
a;
> > > > +
> > > > +		exec->exec_queue_id =3D exec_queues[e];
> > > > +		exec->address =3D batch_addr;
> > > > +		xe_exec(fd, exec);
> > > > +
> > > > +		if (flags & REBIND && i + 1 !=3D n_execs) {
> > > > +			xe_wait_ufence(fd, &data[i].exec_sync,
> > > USER_FENCE_VALUE,
> > > > +					exec_queues[e], fence_timeout);
> > > > +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > +					addr, bo_size, NULL, 0);
> > > > +
> > > > +			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > +			addr +=3D bo_size;
> > > > +
> > > > +			if (bo)
> > > > +				xe_vm_bind_async(fd, vm,
> > > bind_exec_queues[e], bo,
> > > > +						0, addr, bo_size, sync, 1);
> > > > +			else
> > > > +				xe_vm_bind_userptr_async(fd, vm,
> > > > +						bind_exec_queues[e],
> > > > +						to_user_pointer(data),
> > > > +						addr, bo_size, sync, 1);
> > > > +
> > > > +			xe_wait_ufence(fd, &data[0].vm_sync,
> > > USER_FENCE_VALUE,
> > > > +					bind_exec_queues[e], fence_timeout);
> > > > +			data[0].vm_sync =3D 0;
> > > > +		}
> > > > +
> > > > +		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > > > +			if (!(flags & RACE)) {
> > > > +				/*
> > > > +				 * Wait for exec completion and check data as
> > > > +				 * userptr will likely change to different
> > > > +				 * physical memory on next mmap call triggering
> > > > +				 * an invalidate.
> > > > +				 */
> > > > +				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > +						USER_FENCE_VALUE,
> > > exec_queues[e],
> > > > +						fence_timeout);
> > > > +				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > +			} else if (i * 2 !=3D n_execs) {
> > > > +				/*
> > > > +				 * We issue 1 mmap which races against running
> > > > +				 * jobs. No real check here aside from this test
> > > > +				 * not faulting on the GPU.
> > > > +				 */
> > > > +				continue;
> > > > +			}
> > > > +
> > > > +			if (flags & RACE) {
> > > > +				*map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > > > +						0x666);
> > > > +				write(*map_fd, data, bo_size);
> > > > +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > +						PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > +						MAP_FIXED, *map_fd, 0);
> > > > +			} else {
> > > > +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > +						PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > +						MAP_FIXED |
> > > MAP_ANONYMOUS, -1, 0);
> > > > +			}
> > > > +
> > > > +			igt_assert(data !=3D MAP_FAILED);
> > > > +		}
> > > > +	}
> > > > +}
> > > > +
> > > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > > +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> > > > +		uint32_t bo_size)
> > > > +{
> > > > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> > > ONE_SEC;
> > > > +
> > > > +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> > > > +			sync, 1);
> > > > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > +			bind_exec_queues, fence_timeout);
> > > > +}
> > > > +
> > > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > > +		uint32_t *bind_exec_queues, int n_exec_queues)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	for (i =3D 0; i < n_exec_queues; i++) {
> > > > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > +		if (bind_exec_queues[i])
> > > > +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > +	}
> > > > +}
> > > > +
> > > > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > > > index 6480ea01a..aa1b0dcc1 100644
> > > > --- a/lib/xe/xe_util.h
> > > > +++ b/lib/xe/xe_util.h
> > > > @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm,
> uint32_t
> > > bind_engine,
> > > >
> > > >  bool xe_is_gt_in_c6(int fd, int gt);
> > > >
> > > > +
> > > > +#define USERPTR			(0x1 << 0)
> > > > +#define REBIND			(0x1 << 1)
> > > > +#define INVALIDATE		(0x1 << 2)
> > > > +#define RACE			(0x1 << 3)
> > > > +#define BIND_EXEC_QUEUE		(0x1 << 4)
> > > > +#define PREFETCH		(0x1 << 5)
> > > > +#define INVALID_FAULT		(0x1 << 6)
> > > > +#define INVALID_VA		(0x1 << 7)
> > > > +#define ENABLE_SCRATCH		(0x1 << 8)
> > > > +#define VM_FOR_BO		(0x1 << 9)
> > > > +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> > > > +
> > > > +#define MAX_N_EXEC_QUEUES	16
> > > > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > > +#define MAP_ADDRESS		0x00007fadeadbe000
> > > > +
> > > > +#define ONE_SEC		MS_TO_NS(1000)
> > > > +#define HUNDRED_SEC	MS_TO_NS(100000)
> > > > +
> > > > +struct cpu_va {
> > > > +	uint32_t batch[16];
> > > > +	uint64_t pad;
> > > > +	uint64_t vm_sync;
> > > > +	uint64_t exec_sync;
> > > > +	uint32_t data;
> > > > +};
> > > > +
> > > > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > > > +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> > > > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > > > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > > > +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> > > > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> uint32_t bo,
> > > > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > > > +		struct cpu_va *data, unsigned int flags);
> > > > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int
> n_execs,
> > > > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > > > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > > > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > > > +		int *map_fd, unsigned int flags);
> > > > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val,=
 int i);
> > > > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > > > +		struct drm_xe_sync *sync, struct cpu_va *data,
> > > > +		uint64_t addr, uint32_t bo_size);
> > > > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > > > +		uint32_t *bind_exec_queues, int n_exec_queues);
> > > > +
> > > >  #endif /* XE_UTIL_H */
> > > > diff --git a/tests/intel/xe_exec_compute_mode.c
> > > b/tests/intel/xe_exec_compute_mode.c
> > > > index 3ec848164..e8d82cc69 100644
> > > > --- a/tests/intel/xe_exec_compute_mode.c
> > > > +++ b/tests/intel/xe_exec_compute_mode.c
> > > > @@ -15,6 +15,7 @@
> > > >  #include "igt.h"
> > > >  #include "lib/igt_syncobj.h"
> > > >  #include "lib/intel_reg.h"
> > > > +#include "lib/xe/xe_util.h"
> > > >  #include <sys/ioctl.h>
> > > >  #include "xe_drm.h"
> > > >
> > > > @@ -23,15 +24,6 @@
> > > >  #include "xe/xe_spin.h"
> > > >  #include <string.h>
> > > >
> > > > -#define MAX_N_EXECQUEUES 	16
> > > > -#define USERPTR				(0x1 << 0)
> > > > -#define REBIND				(0x1 << 1)
> > > > -#define INVALIDATE			(0x1 << 2)
> > > > -#define RACE				(0x1 << 3)
> > > > -#define BIND_EXECQUEUE		(0x1 << 4)
> > > > -#define VM_FOR_BO			(0x1 << 5)
> > > > -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> > > > -
> > > >  /**
> > > >   * SUBTEST: twice-%s
> > > >   * Description: Run %arg[1] compute machine test twice
> > > > @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_inst=
ance
> > > *eci,
> > > >  {
> > > >  	uint32_t vm;
> > > >  	uint64_t addr =3D 0x1a0000;
> > > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > >  	struct drm_xe_sync sync[1] =3D {
> > > >  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> > > >  		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > > > @@ -99,161 +90,38 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance
> > > *eci,
> > > >  		.num_syncs =3D 1,
> > > >  		.syncs =3D to_user_pointer(sync),
> > > >  	};
> > > > -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> > > > -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> > > > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > > > +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > > >  	size_t bo_size;
> > > >  	uint32_t bo =3D 0;
> > > > -	struct {
> > > > -		uint32_t batch[16];
> > > > -		uint64_t pad;
> > > > -		uint64_t vm_sync;
> > > > -		uint64_t exec_sync;
> > > > -		uint32_t data;
> > > > -	} *data;
> > > > -	int i, j, b;
> > > > +	struct cpu_va *data;
> > > > +	int i, j;
> > > >  	int map_fd =3D -1;
> > > >  	int64_t fence_timeout;
> > > > +	uint64_t placement;
> > > >
> > > > -	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
> > > > +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> > > >
> > > >  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> > > >  	bo_size =3D sizeof(*data) * n_execs;
> > > >  	bo_size =3D xe_bb_size(fd, bo_size);
> > > >
> > > > -	for (i =3D 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i+=
+) {
> > > > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > > > -		if (flags & BIND_EXECQUEUE)
> > > > -			bind_exec_queues[i] =3D
> > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > -		else
> > > > -			bind_exec_queues[i] =3D 0;
> > > > -	};
> > > > +	if (flags & EXEC_QUEUE_EARLY)
> > > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > n_exec_queues, eci, flags);
> > > >
> > > > -	if (flags & USERPTR) {
> > > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > > -		if (flags & INVALIDATE) {
> > > > -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > PROT_READ |
> > > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > > -				    MAP_ANONYMOUS, -1, 0);
> > > > -			igt_assert(data !=3D MAP_FAILED);
> > > > -		} else {
> > > > -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> > > > -					     bo_size);
> > > > -			igt_assert(data);
> > > > -		}
> > > > -	} else {
> > > > -		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> > > > -				  bo_size, vram_if_possible(fd, eci->gt_id),
> > > > -
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > -		data =3D xe_bo_map(fd, bo, bo_size);
> > > > -	}
> > > > -	memset(data, 0, bo_size);
> > > > +	placement =3D vram_if_possible(fd, eci->gt_id);
> > > >
> > > > -	for (i =3D 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i=
++) {
> > > > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > > > -		if (flags & BIND_EXECQUEUE)
> > > > -			bind_exec_queues[i] =3D
> > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > -		else
> > > > -			bind_exec_queues[i] =3D 0;
> > > > -	};
> > > > +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > > >
> > > > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -	if (bo)
> > > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > > > -				 bo_size, sync, 1);
> > > > -	else
> > > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > > -					 to_user_pointer(data), addr,
> > > > -					 bo_size, sync, 1);
> > > > -#define ONE_SEC	MS_TO_NS(1000)
> > > > -#define HUNDRED_SEC	MS_TO_NS(100000)
> > > > +	if(!(flags & EXEC_QUEUE_EARLY))
> > > > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > n_exec_queues, eci, flags);
> > > > +
> > > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, =
data,
> > > flags);
> > > >
> > > >  	fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC=
;
> > > >
> > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > -		       bind_exec_queues[0], fence_timeout);
> > > > -	data[0].vm_sync =3D 0;
> > > > -
> > > > -	for (i =3D 0; i < n_execs; i++) {
> > > > -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > > > -		uint64_t batch_addr =3D addr + batch_offset;
> > > > -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > > > -		uint64_t sdi_addr =3D addr + sdi_offset;
> > > > -		int e =3D i % n_exec_queues;
> > > > -
> > > > -		b =3D 0;
> > > > -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > > > -		data[i].batch[b++] =3D sdi_addr;
> > > > -		data[i].batch[b++] =3D sdi_addr >> 32;
> > > > -		data[i].batch[b++] =3D 0xc0ffee;
> > > > -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > > > -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > > > -
> > > > -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)dat=
a;
> > > > -
> > > > -		exec.exec_queue_id =3D exec_queues[e];
> > > > -		exec.address =3D batch_addr;
> > > > -		xe_exec(fd, &exec);
> > > > -
> > > > -		if (flags & REBIND && i + 1 !=3D n_execs) {
> > > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > > USER_FENCE_VALUE,
> > > > -				       exec_queues[e], fence_timeout);
> > > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > -					   addr, bo_size, NULL, 0);
> > > > -
> > > > -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -			addr +=3D bo_size;
> > > > -			if (bo)
> > > > -				xe_vm_bind_async(fd, vm,
> > > bind_exec_queues[e], bo,
> > > > -						 0, addr, bo_size, sync, 1);
> > > > -			else
> > > > -				xe_vm_bind_userptr_async(fd, vm,
> > > > -							 bind_exec_queues[e],
> > > > -							 to_user_pointer(data),
> > > > -							 addr, bo_size, sync,
> > > > -							 1);
> > > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > > USER_FENCE_VALUE,
> > > > -				       bind_exec_queues[e], fence_timeout);
> > > > -			data[0].vm_sync =3D 0;
> > > > -		}
> > > > -
> > > > -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > > > -			if (!(flags & RACE)) {
> > > > -				/*
> > > > -				 * Wait for exec completion and check data as
> > > > -				 * userptr will likely change to different
> > > > -				 * physical memory on next mmap call triggering
> > > > -				 * an invalidate.
> > > > -				 */
> > > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > -					       USER_FENCE_VALUE,
> > > exec_queues[e],
> > > > -					       fence_timeout);
> > > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > -			} else if (i * 2 !=3D n_execs) {
> > > > -				/*
> > > > -				 * We issue 1 mmap which races against running
> > > > -				 * jobs. No real check here aside from this test
> > > > -				 * not faulting on the GPU.
> > > > -				 */
> > > > -				continue;
> > > > -			}
> > > > -
> > > > -			if (flags & RACE) {
> > > > -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > > > -					      0x666);
> > > > -				write(map_fd, data, bo_size);
> > > > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > -					    PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > -					    MAP_FIXED, map_fd, 0);
> > > > -			} else {
> > > > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > -					    PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > > 0);
> > > > -			}
> > > > -			igt_assert(data !=3D MAP_FAILED);
> > > > -		}
> > > > -	}
> > > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > > flags);
> > > >
> > > >  	j =3D flags & INVALIDATE ? n_execs - 1 : 0;
> > > >  	for (i =3D j; i < n_execs; i++)
> > > > @@ -264,20 +132,12 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > > >  	if (flags & INVALIDATE)
> > > >  		usleep(250000);
> > > >
> > > > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > > -			   sync, 1);
> > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > -		       bind_exec_queues[0], fence_timeout);
> > > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_si=
ze);
> > > >
> > > >  	for (i =3D j; i < n_execs; i++)
> > > >  		igt_assert_eq(data[i].data, 0xc0ffee);
> > > >
> > > > -	for (i =3D 0; i < n_exec_queues; i++) {
> > > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > -		if (bind_exec_queues[i])
> > > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > -	}
> > > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > > n_exec_queues);
> > > >
> > > >  	if (bo) {
> > > >  		munmap(data, bo_size);
> > > > @@ -492,14 +352,14 @@ igt_main
> > > >  		{ "userptr-rebind", USERPTR | REBIND },
> > > >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> > > >  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> > > > -		{ "bindexecqueue", BIND_EXECQUEUE },
> > > > -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> > > > -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> > > > -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> > > USERPTR |
> > > > +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > > > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> > > > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> > > > +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> > > USERPTR |
> > > >  			REBIND },
> > > > -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> > > USERPTR |
> > > > +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> > > USERPTR |
> > > >  			INVALIDATE },
> > > > -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> > > USERPTR |
> > > > +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> > > USERPTR |
> > > >  			INVALIDATE | RACE },
> > > >  		{ NULL },
> > > >  	};
> > > > diff --git a/tests/intel/xe_exec_fault_mode.c
> > > b/tests/intel/xe_exec_fault_mode.c
> > > > index 40fe1743e..7b2fef224 100644
> > > > --- a/tests/intel/xe_exec_fault_mode.c
> > > > +++ b/tests/intel/xe_exec_fault_mode.c
> > > > @@ -16,24 +16,13 @@
> > > >  #include "igt.h"
> > > >  #include "lib/igt_syncobj.h"
> > > >  #include "lib/intel_reg.h"
> > > > +#include "lib/xe/xe_util.h"
> > > >  #include "xe_drm.h"
> > > >
> > > >  #include "xe/xe_ioctl.h"
> > > >  #include "xe/xe_query.h"
> > > >  #include <string.h>
> > > >
> > > > -#define MAX_N_EXEC_QUEUES	16
> > > > -
> > > > -#define USERPTR		(0x1 << 0)
> > > > -#define REBIND		(0x1 << 1)
> > > > -#define INVALIDATE	(0x1 << 2)
> > > > -#define RACE		(0x1 << 3)
> > > > -#define BIND_EXEC_QUEUE	(0x1 << 4)
> > > > -#define PREFETCH	(0x1 << 5)
> > > > -#define INVALID_FAULT	(0x1 << 6)
> > > > -#define INVALID_VA	(0x1 << 7)
> > > > -#define ENABLE_SCRATCH  (0x1 << 8)
> > > > -
> > > >  /**
> > > >   * SUBTEST: invalid-va
> > > >   * Description: Access invalid va and check for EIO through user f=
ence.
> > > > @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_inst=
ance
> > > *eci,
> > > >  {
> > > >  	uint32_t vm;
> > > >  	uint64_t addr =3D 0x1a0000;
> > > > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > > >  	struct drm_xe_sync sync[1] =3D {
> > > >  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> > > DRM_XE_SYNC_FLAG_SIGNAL,
> > > >  	          .timeline_value =3D USER_FENCE_VALUE },
> > > > @@ -113,14 +101,9 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance
> > > *eci,
> > > >  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> > > >  	size_t bo_size;
> > > >  	uint32_t bo =3D 0;
> > > > -	struct {
> > > > -		uint32_t batch[16];
> > > > -		uint64_t pad;
> > > > -		uint64_t vm_sync;
> > > > -		uint64_t exec_sync;
> > > > -		uint32_t data;
> > > > -	} *data;
> > > > -	int i, j, b;
> > > > +	struct cpu_va *data;
> > > > +	uint64_t placement;
> > > > +	int i, j;
> > > >  	int map_fd =3D -1;
> > > >
> > > >  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> > > > @@ -134,144 +117,19 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > > >  	bo_size =3D sizeof(*data) * n_execs;
> > > >  	bo_size =3D xe_bb_size(fd, bo_size);
> > > >
> > > > -	if (flags & USERPTR) {
> > > > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > > > -		if (flags & INVALIDATE) {
> > > > -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > PROT_READ |
> > > > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > > > -				    MAP_ANONYMOUS, -1, 0);
> > > > -			igt_assert(data !=3D MAP_FAILED);
> > > > -		} else {
> > > > -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> > > > -					     bo_size);
> > > > -			igt_assert(data);
> > > > -		}
> > > > -	} else {
> > > > -		if (flags & PREFETCH)
> > > > -			bo =3D xe_bo_create(fd, 0, bo_size,
> > > > -					  all_memory_regions(fd) |
> > > > -					  vram_if_possible(fd, 0),
> > > > -
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > -		else
> > > > -			bo =3D xe_bo_create(fd, 0, bo_size,
> > > > -					  vram_if_possible(fd, eci->gt_id),
> > > > -
> > > DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > -		data =3D xe_bo_map(fd, bo, bo_size);
> > > > -	}
> > > > -	memset(data, 0, bo_size);
> > > > -
> > > > -	for (i =3D 0; i < n_exec_queues; i++) {
> > > > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > > > -		if (flags & BIND_EXEC_QUEUE)
> > > > -			bind_exec_queues[i] =3D
> > > > -				xe_bind_exec_queue_create(fd, vm, 0);
> > > > -		else
> > > > -			bind_exec_queues[i] =3D 0;
> > > > -	};
> > > > -
> > > > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -	if (bo)
> > > > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > > bo_size, sync, 1);
> > > > -	else
> > > > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > > > -					 to_user_pointer(data), addr,
> > > > -					 bo_size, sync, 1);
> > > > -#define ONE_SEC	MS_TO_NS(1000)
> > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > -		       bind_exec_queues[0], ONE_SEC);
> > > > -	data[0].vm_sync =3D 0;
> > > > -
> > > > -	if (flags & PREFETCH) {
> > > > -		/* Should move to system memory */
> > > > -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> > > > -				     bo_size, sync, 1, 0);
> > > > -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > -			       bind_exec_queues[0], ONE_SEC);
> > > > -		data[0].vm_sync =3D 0;
> > > > -	}
> > > > -
> > > > -	for (i =3D 0; i < n_execs; i++) {
> > > > -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > > > -		uint64_t batch_addr =3D addr + batch_offset;
> > > > -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > > > -		uint64_t sdi_addr =3D addr + sdi_offset;
> > > > -		int e =3D i % n_exec_queues;
> > > > +	placement =3D (flags & PREFETCH) ? all_memory_regions(fd) |
> > > > +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
> > > >
> > > > -		b =3D 0;
> > > > -		if (flags & INVALID_VA)
> > > > -			sdi_addr =3D 0x1fffffffffff000;
> > > > +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> > > >
> > > > -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > > > -		data[i].batch[b++] =3D sdi_addr;
> > > > -		data[i].batch[b++] =3D sdi_addr >> 32;
> > > > -		data[i].batch[b++] =3D 0xc0ffee;
> > > > -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > > > -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > > > +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > > > +			n_exec_queues, eci, flags);
> > > >
> > > > -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)dat=
a;
> > > > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, =
data,
> > > flags);
> > > >
> > > > -		exec.exec_queue_id =3D exec_queues[e];
> > > > -		exec.address =3D batch_addr;
> > > > -		xe_exec(fd, &exec);
> > > > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > > > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> > > flags);
> > > >
> > > > -		if (flags & REBIND && i + 1 !=3D n_execs) {
> > > > -			xe_wait_ufence(fd, &data[i].exec_sync,
> > > USER_FENCE_VALUE,
> > > > -				       exec_queues[e], ONE_SEC);
> > > > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > > > -					   addr, bo_size, NULL, 0);
> > > > -
> > > > -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -			addr +=3D bo_size;
> > > > -			if (bo)
> > > > -				xe_vm_bind_async(fd, vm,
> > > bind_exec_queues[e], bo,
> > > > -						 0, addr, bo_size, sync, 1);
> > > > -			else
> > > > -				xe_vm_bind_userptr_async(fd, vm,
> > > > -							 bind_exec_queues[e],
> > > > -							 to_user_pointer(data),
> > > > -							 addr, bo_size, sync,
> > > > -							 1);
> > > > -			xe_wait_ufence(fd, &data[0].vm_sync,
> > > USER_FENCE_VALUE,
> > > > -				       bind_exec_queues[e], ONE_SEC);
> > > > -			data[0].vm_sync =3D 0;
> > > > -		}
> > > > -
> > > > -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > > > -			if (!(flags & RACE)) {
> > > > -				/*
> > > > -				 * Wait for exec completion and check data as
> > > > -				 * userptr will likely change to different
> > > > -				 * physical memory on next mmap call triggering
> > > > -				 * an invalidate.
> > > > -				 */
> > > > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > > > -					       USER_FENCE_VALUE,
> > > exec_queues[e],
> > > > -					       ONE_SEC);
> > > > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > > > -			} else if (i * 2 !=3D n_execs) {
> > > > -				/*
> > > > -				 * We issue 1 mmap which races against running
> > > > -				 * jobs. No real check here aside from this test
> > > > -				 * not faulting on the GPU.
> > > > -				 */
> > > > -				continue;
> > > > -			}
> > > > -
> > > > -			if (flags & RACE) {
> > > > -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > > > -					      0x666);
> > > > -				write(map_fd, data, bo_size);
> > > > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > -					    PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > -					    MAP_FIXED, map_fd, 0);
> > > > -			} else {
> > > > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > > > -					    PROT_READ | PROT_WRITE,
> > > MAP_SHARED |
> > > > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> > > 0);
> > > > -			}
> > > > -			igt_assert(data !=3D MAP_FAILED);
> > > > -		}
> > > > -	}
> > > >  	if (!(flags & INVALID_FAULT)) {
> > > >  		int64_t timeout =3D ONE_SEC;
> > > >
> > > > @@ -286,22 +144,15 @@ test_exec(int fd, struct
> > > drm_xe_engine_class_instance *eci,
> > > >  							       exec_queues[i %
> > > n_exec_queues], &timeout), 0);
> > > >  		}
> > > >  	}
> > > > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > > > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > > > -			   sync, 1);
> > > > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > > > -		       bind_exec_queues[0], ONE_SEC);
> > > > +
> > > > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_si=
ze);
> > > >
> > > >  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> > > >  		for (i =3D j; i < n_execs; i++)
> > > >  				igt_assert_eq(data[i].data, 0xc0ffee);
> > > >  	}
> > > >
> > > > -	for (i =3D 0; i < n_exec_queues; i++) {
> > > > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > > > -		if (bind_exec_queues[i])
> > > > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > > > -	}
> > > > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> > > n_exec_queues);
> > > >
> > > >  	if (bo) {
> > > >  		munmap(data, bo_size);
> > > > --
> > > > 2.25.1
> > > >
