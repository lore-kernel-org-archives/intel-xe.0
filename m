Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50852C3064D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 13:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA28F10E12D;
	Wed, 26 Jun 2024 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jc3k5/J3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3CC10E12D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 13:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719410083; x=1750946083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zkHHZ6/7ASMb51HpHDHk3nqz9HXQtJ4JJK8vEUOoX9c=;
 b=jc3k5/J3bBb3mggDekBQ6IIxqAySz9baZ68f6AjR2PCOh2qlV/kiFXar
 vI+cwiMxsWYl8+l75ivSdWH7Yd2LL+Hg4cNBmKyrcURdY23Rs/WoYj66R
 G69NWUSU4JWCNnNvGppBYYN7F+ap73Ym+LES1cWXwPVjsGx4FCtTkSAwk
 PFShPsYrm1aEB92ldXb6Q8puh4OUx7Wrw+zRHZdUTQxsTGIRVOs6UyjsQ
 nCYUSaqYHCIfGvY9D/YKdnxB32gYVqPRw/cHR6m4OWNb79UfAcqIKzNSA
 ZnV6JfQYYbZpj/zuTHc8xC7XVCJNCoybnQ+cp08gUl034qHWtfR+kLvzT Q==;
X-CSE-ConnectionGUID: DYpUn477RGOJ7vbWauXS/Q==
X-CSE-MsgGUID: Gnu2eqDTSaOGMb5relArNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16310021"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="16310021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 06:54:42 -0700
X-CSE-ConnectionGUID: ZjaQ8gEyQuykFAHta4Wh4A==
X-CSE-MsgGUID: EyEthd30Sj2Cu7vDr/FCdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43819013"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 06:54:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 06:54:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 06:54:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 06:54:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 06:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHWjn4i/IGvDliVuuBtiAekYzACgHzy0ytHMVGfQ+pjtByuzkLbACY1VuVuiA9f7ZagDvEkWKQFAwV4TaaPyTWEaV3bV9VQwjs6eIrgGFbFGYyvuyHbySQYvCpM1oNXcHkF9Cbm9CKkrZ2uhliesuIkFQPVmpHyeY0fAA/5Dv7tsKNn2uXDfBevPfjHTogX6KSQq034XAsehKji5IM02zUyfuGkuvBe9OyZ91VWiZ4fjvSHMW7I9euz4peWRYXAEfSa5gcutvt8E5jPyFYJka6PCPa3IhsHHU8PfWilBPdIbUqmnLYjpUvoZsJR/4sGnLqs8/S9HgUfOF57IOuZF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjyXYmh07DBpcCb+DEVKrl1WL20NSkk10ZpONho83cg=;
 b=CoyTwlteDcFtWFEsgGlPc7JUtBWbfR17k6uXsUZP5ZJ6WeAHrfljf8waR0gaGNfHZG9NQMB9j8jU1bm9VpMYGDtHdiZEKNALaIeHCsCQuZXr2I2OQKZ1z1tgO78jLZT4xmZM3N0m2KPuBe5DeHZEuiJ5Hx0t2G0QxgXd1ICP6yQchkD+N5zI0SjPGyrE4/nB40vo/t8H/oo4POjaJSeWz8RqGWInX9dkKtfKNfcAt156TXkTNnW9sHOBXIeyrQhtw8O5o61kYyAuWCJDkODnrHYfg4ou0mg0NigUFrlZpF+lghDBK54D+4R+41IOAxMWGjzhsOys/CHtcajeNlyT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 13:54:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 13:54:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
 the stream exec queue
Thread-Topic: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
 the stream exec queue
Thread-Index: AQHax26rcHs/e3vfHk6X0OB8RP9MyLHZXRqAgABPdwCAACHbsA==
Date: Wed, 26 Jun 2024 13:54:30 +0000
Message-ID: <SJ1PR11MB62045AE49B6C38C57CAD313A81D62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
 <20240626021343.1054590-3-ashutosh.dixit@intel.com>
 <ZnuF81Eh7t8AK4KF@orsosgc001> <87h6dggmzn.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87h6dggmzn.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7068:EE_
x-ms-office365-filtering-correlation-id: 7166d78f-7225-4e9c-f7ca-08dc95e780c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|376012|366014|1800799022|38070700016;
x-microsoft-antispam-message-info: =?us-ascii?Q?0AxrZyxrrb2BIatI9grDWaUjk/2w2+xwszW+Rh842IruQrfjG5+3ysc7z5pc?=
 =?us-ascii?Q?2HTPVvNLTFCtvrlXwIRu4wuv6TChXZfAhcFOCi8/a+bRnpYKRGulwRo+7hxt?=
 =?us-ascii?Q?ycZNXcaSJM2NQo3HQmIk/pCLFlHYUJeZVO8368MK0VHgmmuzeAR8Yc5Ujfuf?=
 =?us-ascii?Q?6tTyLa6mqC4JPKIU/LzQGxSWuKjsGqxwIikyrpaDPBkb3Nqv7BPnrqfZ/5xD?=
 =?us-ascii?Q?lK/hIL91EKOC+l21W95RKx2R/ZP2RWCBjGnNLp3DW1T3ksxaG8yJ+4HfXhKA?=
 =?us-ascii?Q?32sWYT7VAIaF3B/3oYHoOyACJpAlbgCybDNVBljHcvj3J0tRMsMEBo90wFB1?=
 =?us-ascii?Q?00P7uqEa20Yg2pcYJsTI4H/ZEWpiGah1Nf9zAFrfRTZTyoOd+PHnD1WI3lWR?=
 =?us-ascii?Q?fMARKSOGSTFmBzRuiBUiRYSOi6DudkbDvsWhn52aiivzT2rcXqh95Pg1MdnJ?=
 =?us-ascii?Q?GocjwOKxR0b4Y4qI96EL5rjF8itNCCUQ1jcp0CIxZcMqorAePGJhOaxgbUXg?=
 =?us-ascii?Q?7ntNM6H33NEyKnsXNqgTQD2tMYgp4ip2GZzGuisdeNOO5RNwC5BJhTPaH6+b?=
 =?us-ascii?Q?GcqQiwzUyKVsuK0e2TF4H69lLJlXb3AX8kGVDHh0CSx/EpER8uGtk1QsUauq?=
 =?us-ascii?Q?R5PuGndmZrwAL4UoklSNCi6l65h2GIcm9NqUchgG99gMESdDGKviEcwLS7qJ?=
 =?us-ascii?Q?BxjkKKoSzWjuGVJ17QgRWoRp/InQDs5nvwm1HZcTGBwtOrpZb+novC3sWGqP?=
 =?us-ascii?Q?89zbX75yJzE9OziAlq1LoHQom6vs3fXW3yvTV3VUs0VgyoI56aU8uTUcCMB8?=
 =?us-ascii?Q?+L9nR8QyVlGlh4ddM1ACcFCmD+QbrJi9K+WLXg6nIw4RPjmvPUlbPk+XAUTa?=
 =?us-ascii?Q?ETU7UiNuqJefUneBLf7uSSG7zRMwnUHjFGmlrjgTI7HDRSshacNj1XsAALqU?=
 =?us-ascii?Q?grtFfRLy7wqNp5guuuu5WotJAaOHil5fY1BqQfQAdmOEcVDiyXnlm+sds1sZ?=
 =?us-ascii?Q?nVx/Vh4f3cSDx2PZSwZca0w1phO2vZWI0u3mnSE2m5s4KFwFgTYzyDyFyHEy?=
 =?us-ascii?Q?MYrw3tm9MYB7QYwZ43RIrECoRR8UxwQ4QDn6uzMoPWF8Z02Ur1A3Gy3E7k/c?=
 =?us-ascii?Q?nDFqmHgLzzVxY+izem4zgkpdl9II/SojATKMHFXeuXwXCmnjDtmSRLy0rqrz?=
 =?us-ascii?Q?gP66Kkrtk5JMXDW+DxNsGibCGFbf2s22saLUYF1P9MTRXQgwopbrFCwTGyRr?=
 =?us-ascii?Q?BhL5AULxLZN2viplnHwCbgxSimK8w47qGYzzitdjw7j5mSmRtkSxif4CQNeL?=
 =?us-ascii?Q?1D5osbBZRz0ITc2URvEC09Yz5Jz1G3ZFkR67YWDfc5cZVQwxBj5JDzWz/12h?=
 =?us-ascii?Q?eStdoU0l0f/N+a0DibiAvZMjldwg5t4UEHRUpYz1vzm7UR6tSg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(376012)(366014)(1800799022)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M8JNA+wHkvuY3SEpiuLkbBUI7pu+W3j2OLqf3M+03/BPepaak2adfP8CkXRZ?=
 =?us-ascii?Q?EaK4XDbZfC+UVDLCOiS8Rozcc3fDlvWqVAva/JhYFZjhp2QSE6R9cgZgkFKN?=
 =?us-ascii?Q?0VfJojg7x0tN+1fplqDNhBVSm0Vb83TWABBLbpmNfDqA96KhU88jf4eOJow1?=
 =?us-ascii?Q?0kRadRo52a+75U2DtjQUB85xTklMrs3+gKp5C+fkrFXbk7Zmw+lJJUr9ACfE?=
 =?us-ascii?Q?roGEU/oFfUsWgU76E4pFMPANSFZW8kamSWW2/5eYlX6bxXLqI6Rcc4GHjyZJ?=
 =?us-ascii?Q?E+iSzatVKWUMFgVbHneqNQ1ovw2+tMllb4oJx5ykE3rxLBFXOuR8SNZy4fZb?=
 =?us-ascii?Q?UUJOhJQxBTQ2f1wFJ77aDalrjOTMK2ihZE6eXuI0MYxSll1Jf7Rsg8NL30Ff?=
 =?us-ascii?Q?hQanP7ir4C5fBJDHuFNI64HYJs5KTUA0kT97+HryIwwC3lBfIrnvT/lZ37md?=
 =?us-ascii?Q?VzA96ATVdOd4IbpTrHFNMLu2BIfJbVbHGkhvomC7U2T5O0Jn8TBrD5ft+OzP?=
 =?us-ascii?Q?sRCLqDe4WL5nGVFJyFIi9b4fz/dEonLr43z7ZTwp+tv2wc8R72P6GcsxC5Me?=
 =?us-ascii?Q?Lo29Vd0VWEu423fqoVAPktOl+dhSck0eii2Ku/OL6rAKZxIT9j7HfmDSB2u9?=
 =?us-ascii?Q?Nsr8Pj4lQMHWV8FaRqNbYLdP6nB9vXtzsSCP7uNErDF6O3XxW2/A6SQ0HQ8j?=
 =?us-ascii?Q?4etyNskIe6PdunGytvVdZeSq8yanown1XMCev1YWdvymKeAtSrwjv5DPIdc4?=
 =?us-ascii?Q?gycOn6eb/L/LrL1mCm+6QBS0H0dNy4jvWIjRvt10i6xKcIF0heWhvAWJ/cEN?=
 =?us-ascii?Q?9H7NXozdCU2enaPyop1g0Hn6eHkXpsWbOCNC7Uc5wbu4ABHBrGLUq1hqIDqO?=
 =?us-ascii?Q?B7gLtvKyDL3DuhKbi1bxrDquEkTbjNz5MsVTQOdVqYtDBmgNjZL4Q/bCJC02?=
 =?us-ascii?Q?+9iYvhte1cfyV3wfzd8Q2jqNrLJ/Ww5mjS7Eb0ZtEdHHbJ6Hdir0Au5fZbHT?=
 =?us-ascii?Q?zXGnFzy4V31xM1pARGZsBrFtuLJeyTYdqzDRiQzV0b0mVVCFSGTA6HNRSKQG?=
 =?us-ascii?Q?Q5O5CDgkgJrCh1u6n1w/TAtVnR5F/Gv86QBi6w43eFq7sPRTjAF/hgMyQi//?=
 =?us-ascii?Q?P8bFZUXV2D5KwriYvHlel6kOp8G9JaLoBH5i28scxD9F6hqB470Ta2gKN78G?=
 =?us-ascii?Q?dFg565EZvYbNubR35IjQ5LpmvgRpIACZ9tAlCQ81ksLkJ2Zc7iAb9Ls/plW1?=
 =?us-ascii?Q?mZL3LlkHEtuWqmlxcF/unJg5j1VfhaeBJulfM6gHFDZnomJToSnJ1yCF0hzi?=
 =?us-ascii?Q?sIdZoRm1wzDgDvMiZXbTk599OiYIaG2ETKCXnSPidjXoq3NltkN0kgUzLCqp?=
 =?us-ascii?Q?++LCazWT3L8BQsE7+cy5rr3e7LGPqRZh3HIL+yTnztfkJ5FhVmLVMveXhR66?=
 =?us-ascii?Q?TArstlWkNCi9frSGPX1oLPv6wR180msJsV9FaNrwbdWQt1IkUzYPkClEXhjE?=
 =?us-ascii?Q?p8JvlazbWXAWJNVMXe/unsT+hbneTHnZ6qG5FXPPvrbFQjx/SQctOt+lvLW3?=
 =?us-ascii?Q?t4x+Bg/DN21Fwv3cMmSeHF3i+Y4ndU0PSYvypOHQ+kIXncYvg6Hcwgl+RAL/?=
 =?us-ascii?Q?F3bv6w40UDL+V/KO8FsKJn2EUoCJVniLAnJIRZOCcypu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7166d78f-7225-4e9c-f7ca-08dc95e780c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 13:54:31.0136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePNIj1fePy2tFvpP8VyY3duc6seZelHdJ2QsiRO70KG1sEj0o76obP9DH53duxQvYserQFPZ+6x1PyDGP/PtsgcN+JGvT7M58dSeOT4YAsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Wednesday, June 26, 2024 1:22 PM
> To: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: Re: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled =
on
> the stream exec queue
>=20
> On Tue, 25 Jun 2024 20:07:31 -0700, Umesh Nerlige Ramappa wrote:
> >
>=20
> Hi Umesh (and also Matt),
>=20
> > On Tue, Jun 25, 2024 at 07:13:43PM -0700, Ashutosh Dixit wrote:
> > > Mesa VK_KHR_performance_query use case requires preemption and
> > > timeslicing to be disabled for the stream exec queue. Implement this
> > > functionality here.
> > >
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_oa.c       | 70
> +++++++++++++++++++++++++++++++-
> > > drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
> > > include/uapi/drm/xe_drm.h        |  6 +++
> > > 3 files changed, 78 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > index a68659fd5386..1147035af039 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > @@ -80,6 +80,7 @@ struct xe_oa_open_param {
> > >	int engine_instance;
> > >	struct xe_exec_queue *exec_q;
> > >	struct xe_hw_engine *hwe;
> > > +	bool no_preempt;
> > > };
> > >
> > > struct xe_oa_config_bo {
> > > @@ -1013,11 +1014,55 @@ static void xe_oa_stream_disable(struct
> xe_oa_stream *stream)
> > >		hrtimer_cancel(&stream->poll_check_timer);
> > > }
> > >
> > > +static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream
> > > +*stream) {
> > > +	struct xe_exec_queue *q =3D stream->exec_q;
> > > +	int ret1, ret2;
> > > +
> > > +	/* Best effort recovery: try to revert both to original, irrespecti=
ve of
> error */
> > > +	ret1 =3D q->ops->set_timeslice(q, stream->hwe->eclass-
> >sched_props.timeslice_us);
> > > +	ret2 =3D q->ops->set_preempt_timeout(q, stream->hwe->eclass-
> >sched_props.preempt_timeout_us);
> > > +	if (ret1 || ret2)
> > > +		goto err;
> > > +	return 0;
> > > +err:
> > > +	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret1 ?:
> > > +ret2);
> >
> > Maybe print both rets or something that allows us to know which one
> failed.
> >
> > drm_dbg(&stream->oa->xe->drm, "%s failed ret1 =3D %d, ret2 =3D %d\n",
> > __func__, ret1, ret2);
>=20
> Sure.

I think its better to handle each return value with dbg message in its own =
branch with custom message, or append existing dbg message with some readbl=
e string based on return value. For example,
drm_dbg(&stream->oa->xe->drm, "set %s failed ret=3D %d\n", __func__, ret1? =
"timesliec":"preemt", ret1?:ret2);

>=20
> >
> > > +	return ret1 ?: ret2;
> > > +}
> > > +
> > > +static int xe_oa_disable_preempt_timeslice(struct xe_oa_stream
> > > +*stream) {
> > > +	struct xe_exec_queue *q =3D stream->exec_q;
> > > +	int ret;
> > > +
> > > +	/* Setting values to 0 will disable timeslice and preempt_timeout *=
/
> > > +	ret =3D q->ops->set_timeslice(q, 0);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	ret =3D q->ops->set_preempt_timeout(q, 0);
> > > +	if (ret)
> > > +		goto err;
> > > +
> > > +	return 0;
> > > +err:
> > > +	xe_oa_enable_preempt_timeslice(stream);
> > > +	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret);
> > > +	return ret;
> >
> > 1) I think the same parameters are also exposed via sysfs and they may
> > be applied at the engine or class level by the user. I believe context
> > level granularity is only available to KMD.
>=20
> Correct.

Yes, context level granularity is with KMD only during context creation.

>=20
> > Hence, for the duration of the OA use case (from open to close of the
> > stream fd), how do you make sure that someone else is not undoing what
> > you did here?  I don't see anyone calling these hooks though. The only
> > place where these params are applied to the context are when the
> > context is registered (likely when user creates the queue). Better to
> > have someone from GuC team or Matt confirm that this is okay as is.
>=20
> Correct, this implemenation is assuming that at present there are no othe=
r
> callers of set_timeslice() and set_preempt_timeout() ops (except when the
> exec queue is created, which is prior to what is happening here). So the
> question of "someone else undoing what is done here" only arises if there
> were other callers. And also, as you observed, exec queue properties are =
not
> directly modified via sysfs, sysfs only modifies the engine class attribu=
tes. So
> IMO we are good here till other callers of those ops appear and I think i=
t is
> better to handle those scenarios at that time?
>=20
> > 2) The other aspect I worry about is synchronization between sysfs
> > modifying the underlying scheduling params and OA trying to modify
> > them at the some other time. The set hooks themselves don't use any
> > locks and I think it is because these params are modified in select
> > places where concurrency may not be an issue. With OA, we may have to
> > do some sync OR at least rule out potential concurrency issues. Again,
> > we should understand when these params may be applied outside of OA.
>=20
> Actually, I agree, this is good point and there is a concurrency issue. B=
ut it is
> not specific to OA. The issue already exists when an exec queue is create=
d
> (sysfs is written to, concurrently with __xe_exec_queue_alloc). So rightf=
ully
> some locking should be introduced to handle this. We can decide if we wan=
t
> to do this before merging this patch, or do it later since it is a pre-ex=
isting
> issue (it would need to be done in all places where concurrent read/write=
's of
> sysfs written values are happening).
>=20
> @Brost, Matthew any comments? Also Cc: @@Upadhyay, Tejas.

What we set through user level is context specific setting and what sysfs s=
ets is engine class specific, both are different. However KMD takes first e=
ngine class specific timeout setting and then on top of that user extension=
 properties are applied, so I think no sync up issue here.

Thanks,
Tejas
>=20
> Thanks.
> --
> Ashutosh
>=20
>=20
> >
> > Thanks,
> > Umesh
> >
> > > +}
> > > +
> > > static int xe_oa_enable_locked(struct xe_oa_stream *stream)  {
> > >	if (stream->enabled)
> > >		return 0;
> > >
> > > +	if (stream->no_preempt) {
> > > +		int ret =3D xe_oa_disable_preempt_timeslice(stream);
> > > +
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > >	xe_oa_stream_enable(stream);
> > >
> > >	stream->enabled =3D true;
> > > @@ -1026,13 +1071,18 @@ static int xe_oa_enable_locked(struct
> > >xe_oa_stream *stream)
> > >
> > > static int xe_oa_disable_locked(struct xe_oa_stream *stream) {
> > > +	int ret =3D 0;
> > > +
> > >	if (!stream->enabled)
> > >		return 0;
> > >
> > >	xe_oa_stream_disable(stream);
> > >
> > > +	if (stream->no_preempt)
> > > +		ret =3D xe_oa_enable_preempt_timeslice(stream);
> > > +
> > >	stream->enabled =3D false;
> > > -	return 0;
> > > +	return ret;
> > > }
> > >
> > > static long xe_oa_config_locked(struct xe_oa_stream *stream, u64
> > >arg)  @@ -1307,6 +1357,7 @@ static int xe_oa_stream_init(struct
> xe_oa_stream *stream,
> > >	stream->sample =3D param->sample;
> > >	stream->periodic =3D param->period_exponent > 0;
> > >	stream->period_exponent =3D param->period_exponent;
> > > +	stream->no_preempt =3D param->no_preempt;
> > >
> > >	/*
> > >	 * For Xe2+, when overrun mode is enabled, there are no partial
> > >reports at the end  @@ -1651,6 +1702,13 @@ static int
> xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> > >	return 0;
> > > }
> > >
> > > +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> > > +				struct xe_oa_open_param *param) {
> > > +	param->no_preempt =3D value;
> > > +	return 0;
> > > +}
> > > +
> > > typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> > >				     struct xe_oa_open_param *param);  static
> const
> > >xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {  @@ -1662,6
> > >+1720,7 @@ static const xe_oa_set_property_fn
> xe_oa_set_property_funcs[] =3D {
> > >	[DRM_XE_OA_PROPERTY_OA_DISABLED] =3D xe_oa_set_prop_disabled,
> > >	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D
> xe_oa_set_prop_exec_queue_id,
> > >	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D
> > >xe_oa_set_prop_engine_instance,
> > > +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_no_preempt,
> > > };
> > >
> > > static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64
> > >extension,  @@ -1766,6 +1825,15 @@ int xe_oa_stream_open_ioctl(struct
> drm_device *dev, u64 data, struct drm_file *f
> > >	if (param.exec_q && !param.sample)
> > >		privileged_op =3D false;
> > >
> > > +	if (param.no_preempt) {
> > > +		if (!param.exec_q) {
> > > +			drm_dbg(&oa->xe->drm, "Preemption disable
> without exec_q!\n");
> > > +			ret =3D -EINVAL;
> > > +			goto err_exec_q;
> > > +		}
> > > +		privileged_op =3D true;
> > > +	}
> > > +
> > >	if (privileged_op && xe_perf_stream_paranoid &&
> !perfmon_capable()) {
> > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe
> perf stream\n");
> > >		ret =3D -EACCES;
> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h
> > >b/drivers/gpu/drm/xe/xe_oa_types.h
> > > index 706d45577dae..540c3ec53a6d 100644
> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> > > @@ -235,5 +235,8 @@ struct xe_oa_stream {
> > >
> > >	/** @oa_status: temporary storage for oa_status register value */
> > >	u32 oa_status;
> > > +
> > > +	/** @no_preempt: Whether preemption and timeslicing is disabled
> for stream exec_q */
> > > +	u32 no_preempt;
> > > };
> > > #endif
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index b410553faa9b..12eaa8532b5c 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
> > >	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will
> default to 0.
> > >	 */
> > >	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> > > +
> > > +	/**
> > > +	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and
> timeslicing
> > > +	 * to be disabled for the stream exec queue.
> > > +	 */
> > > +	DRM_XE_OA_PROPERTY_NO_PREEMPT,
> > > };
> > >
> > > /**
> > > --
> > > 2.41.0
> > >
