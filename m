Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F3ECD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B67510F298;
	Mon,  1 Apr 2024 16:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO34A3us";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72B110F298
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711987901; x=1743523901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hzbEcyFpGU12B97JNeWEFU78iqagpr1bIABh7u+eN7Y=;
 b=AO34A3uswpynlrVoauHRD0VceXqxyf0rt107GCrJkEvhW4uACklPnHeT
 OZf+LUuZ1LzVMBU4eovXaegh64GMKN0mDyJEc2Xff//CO8RgYO3RS1FhE
 mwdYNatJkUFbULmgA9Z17Io3JlhWH0cUmIgduzrWNsA0F+2zFcmDaJx4H
 3y7o1AB24pg2VRnKiG7KoUdOI6eVYJX61F4QRWUNEx4OYw4NorLWeSahq
 7zMkgbAXXfI2IOFxEwDqR1YiJ37nFMYaGfmb9u9sP3lWyk2r1VzUBoGUu
 fs2UI+0ugBZ1oST5tPdnrZHU28OTiOlzE540c5KZfsoV63XTesguxXiNB Q==;
X-CSE-ConnectionGUID: dUibP+DSTIuQWXWJNgK1nw==
X-CSE-MsgGUID: 8pfhSoa5TEKqD+Y1EEtGww==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7055698"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7055698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="22504593"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:11:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:11:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:11:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:11:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaGazTQ5hKorJ+82EcqJPMOMMQwfH0ZgtkasbwR5zgpu85qSaqts7i6mAR8cfOtffjFcgLj6B6UbfuXPT7Q/Q6WBr+W/H92z7kxAyoUy1hdaAkM94oODoisCL7oPR04A8lUjSVAhqZJv9ePidzLKyl5ew7dmmSobPU575/MApdj6KdGGtxHghW4DHed8yrhldHkp2nULX9eYx7P+WJKZ/KfFk9JwUXsOLj9U0R/xoWAhdH/j+bERa+PFExkjf70IIuimshDX0N/qx/i6YSu3vr8RX+TNtYL8zxlrMGoZUuXfus6z5vEiXeqBFQiMZvCkbEqHFTXotnbdzQt4U5EDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8SDybGZwKFpcREiCIFpQ2fyHA3nAWe7NIqMstS4fG4=;
 b=IV11sWUzGBK7z8eBkh+w6/vlFqJqgjcf22daQiE2Tjdor93UFrpqkxxSRcgeJXaF2fX5Xzb6y/56HcGeqgd4yhH3VF8AALkFUek1pTt6zUQ0UoohbZd12QPDdzuefrUysf3um9u3PYCFyBn4pQ4+WtCV70XntinOCbV+YDaoQepZbyefIThnF6qqmDcI8z4h8+9e/xk7eECQLKOUWmWsRNsRRY+hNp3N8Wb+ZI8WLmPdwJ8bTADERAKJy78qvlLFX4GtqV8ZqrnySUg0tL55JsZILj7tacoKUoQkrly2cy04pWYnuUzEwApt+rumEuGikdUm4sdAaiOQuJRaHkKmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 16:10:07 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 1 Apr 2024
 16:10:06 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar, 
 Janga Rahul" <janga.rahul.kumar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Chehab, Mauro" <mauro.chehab@intel.com>
Subject: RE: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Topic: [PATCH] lib/xe/xe_util: Creating the helper functions
Thread-Index: AQHag52eNekFIIWaZEqEJrIYt+hn07FSVwWAgAE4UiA=
Date: Mon, 1 Apr 2024 16:10:06 +0000
Message-ID: <SA1PR11MB6991A2F4E463A264CBCFB37C923F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
 <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB8477:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmBdZYwxnnLRc8eMODUJKFJaJz3XPO14VGdzOKvwlZrMNY+VOkkViSas+w8ekSZS9UF3XRgGQRgWFT/KiH/2bEMbl4o75/q/4YMKTa7x4DJBpcTNatvbfk1hnAsQp6NrGK+TL1ll60s+uGfxUwqgVaDl9EdEC0wmg76dROiZgN4Xr1FXxX4kmFzxn5F0Gfx893gucWRXXbrJ8TNxvY/m/aAb362N6xFl3LCNiVWstUa7+58WezI77GUH6dlxTa3fLvw1mqp/HRLe0FEqgzwb38teE2tkCUOA1J47cvhf79URpm/my0Asl/ojti//Bf2On/YOxZm5Lhkqv9mI6kQLFknKsE7zc8s9fB29YxwIFA5/FUrE4uYgl1Q3pGuYErix5kH8YWZN/PtjaStPBRMh6KREjxo2hCMTNj64N1z1PBZEJSkrNhxDWS9Ui/wL5yZFmjk71ntlU1PO9SbTXmgINYYZ61J4hEC26AZxctNVZHIvp/TWmpZqPxAOgNoyVUSre7a64od9XnPQZRuKtksvh7VfEHiWKuW9NRSkksA2uR5NLoWOoDNrUvBC8Y/9Ffr214eT7UX3USv4/RMB4Uc/eRax6UMtjdGsUBV1kvsSyr4kZQWUYCfhi9nPP/9L7gfGqQsgIgJd9VT76mf+R9sOYv82f/lpGJ4lv5cprOGvUpM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TBQ0iXTay09ivNKQcVuE2g3spyWah1N24rrhohUrYqHtb/Et1fZsfOLwnZci?=
 =?us-ascii?Q?+y48ukVMSCA9crLgQVbIwrHQ7PJlFFs0CRr1DCecsHRukUC0sJBMiLjmBVWw?=
 =?us-ascii?Q?+Nf0qERfZAwg7mVF5gs8zV2PxOild9FyMFej+AxXqmRFb1Hgoe0nvEk9nwz1?=
 =?us-ascii?Q?0v87CWPfw8MCroN4eJXzqt8GYEYeAL3+Fl3D6stMiWcJQhw9GoT42MrMwShH?=
 =?us-ascii?Q?umKdbhx8DF6Mqz3dHXIYKPj8FBDYLrZAmlmtK3f+UxYhhfSTiXOjOAlYjsWs?=
 =?us-ascii?Q?Q+bAXhMVg7Hn0SZ4inUjQTBBpbe3Ka6/JFJM4U4jpH30yoInEnfZF2yUS+Q8?=
 =?us-ascii?Q?ATsQBoa/XlGI9apXTGqTZMtiHZLxWnWLMJVvvi41KjkXjCTvvIbkycUFE62W?=
 =?us-ascii?Q?+8iBSeLmGDGfzrqafc+OGm/8hPKKx1R88PI9qfl/adU3Ifq/6Igd4nKvD4Jg?=
 =?us-ascii?Q?4+AcRfpmSJyWffPKu+Fo7wyrjRLNF4b+si84Vbc3aK4Ysm4v3ZZB7+2gGle/?=
 =?us-ascii?Q?eWBaoRZaUkhQBzLr4QH12U1GHP84phsbrqe+RPTzD6l1PV/ldgwCmY7Qo/v4?=
 =?us-ascii?Q?Q0rCd+eijyr4/P0JtXDiYl8Yi1dAbCPQm6GJ1K0ewX/R5HOm3en8KGgArwZp?=
 =?us-ascii?Q?R8ik4ITjBJV7zvvynISKi4/XYZOFGjBfhRkhwrs0bMKw07Wh0fhmepyi9/R0?=
 =?us-ascii?Q?Eqma+yg0YVU1MeRSmn7nTU99ZQlE+zYBT9BshVjx2EZBjTaO3+XnzDLRshsD?=
 =?us-ascii?Q?xjBZ009mKyuwgWeo1aiYsfmrb86U33C/uML3tjH0V+eh/SaLWivHF5OPOGcE?=
 =?us-ascii?Q?BZMwEM0iHi0IuE1QaHPwd9R+2Yoy9DtFOFjApNXwoIIazhJkmtKwkTgrZ6b5?=
 =?us-ascii?Q?nPkEjDPK5izkD5jFsP87r0xC52WYGFeN9RkHLCC+WZ4Psgl3Fnahc9sTZo8w?=
 =?us-ascii?Q?FUXyugpptVf+pWDGwVrZNclv31+lbPgEa0YPvcpYT50CXgxKorn2hOW3icT2?=
 =?us-ascii?Q?QZBewzs5KOFfDE0gfoEYNeeBpFS4+xGRgrAUw3LSUmyOFe8a4IDa1IKV3BWM?=
 =?us-ascii?Q?v+GB6cFKBxMgo3+uk5u1iEmN98Gt0HImoTK9k5ApxCtSbbRollng7q3SziVc?=
 =?us-ascii?Q?BckTGtL+X9n/EixcpaSO6LMj92L2Qrg6Jz3CCJZCSU9JWcea4DQnl++nPzYQ?=
 =?us-ascii?Q?qdNad6H0Gflng1ayCE6pXjGTGEao1iVO3gJ/hHLmnNYlDcSCsrpLwjS/d8Wv?=
 =?us-ascii?Q?0/NHqWtEOXb+z9PaShIHvC0nzJiMNexWtCLSlgMZT7FemHfqiyIDZq+G7Lrz?=
 =?us-ascii?Q?d9eWh1e4MLHtzQhg8dqMWKyx5P9TcpQxmwILKgb45rtA0OaWfK0eqc0gKRRy?=
 =?us-ascii?Q?YCSKT8mQh5JaKvdStvGnpp8EJHyVg4a/B6fcUN0mY5EktnEIjW9inDHemZbs?=
 =?us-ascii?Q?gvWta8GGu/tfHdyiWL2MAMsIcPAZsqPxkJjYcPnHdUgVqOTUrzN3dZZSzMJt?=
 =?us-ascii?Q?M8KGIwhOFIe9P+DKyy4zFSo5eyq/RNg4HdXKt0IrvZvWdpvkcbJkNqM0TJpm?=
 =?us-ascii?Q?1TNMHFa0WPilOXR+NyU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2074bc1-c734-4f35-03ad-08dc5266328f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 16:10:06.7592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: udMNZLpWnkiUHpTNuxHkaJiIGXXdNsex2c6FAiGQVcYagVaStwm5dPPrv9UedCdUxsqBfodem/NMSdwpAczl5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Sunday, March 31, 2024 5:05 PM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
>=20
> On Mon, Apr 01, 2024 at 12:29:49AM +0530, Bommu Krishnaiah wrote:
> > Creating the helper functions which can be reused by many tests,
> > as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> > are used this helper functions.
> >
>=20
> As the author of most these tests and IGTs, I can say while not great to
> have copy paste between tests I much prefer it to adding helpers to try
> to jam the needs of each test into the helpers. IMO this just creates a
> headache in the long run. e.g. Let's say I want to change the behavior
> of xe_exec_compute_mode but not xe_exec_fault_mode, with shared helpers
> this gets harder.

Duplicated codes is not a good practice in software. When you have a fix, y=
ou need to fix all the places where you have the duplicated codes.

In the example you give, it depends on how we make the helpers. If the help=
ers are not abstract well enough, we will run into the problem you said.=20

The helper idea is inherited from i915. With those helpers, we can write a =
test with less than 50 lines of codes. In many cases, just ~20 lines of cod=
e, very easy to read and debug. Just take a look of i915 gem_vm_pagefault.c=
 and i915_svm.c.

Xe igt is rather complicated compared above i915 tests. In the past few day=
s, I had to debug into xe-exec-threads, it took me long time to really unde=
rstand the test. The main reason is, we have a huge function such as test_l=
egacy_mode, and flags is used to control the behavior of the test. This is =
hard to read, maintain and debug.

>=20
> I'd much rather leave this as is.
>=20
> Maybe I can buy a helper or two to program the batches, i.e.
> insert_store LGTM, but certainly not the logic doing bind, invalidates,
> loop, etc...


Let me take a look of the helpers, and see whether we can make it better. O=
ur plan is to use those helpers for system allocator test. We use existing =
tests to test those helpers because right now we don't have system allocato=
r ready. So let's improve it first. We might end up something which is good=
 for both existing test and coming system allocator test.=20

We will let you decide whether you want to use those helpers for existing t=
ests. If we can't make something good for existing tests, we will target to=
 using those helpers only for the coming system allocator tests.

Thanks,
Oak

>=20
> Matt
>=20
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
> >  lib/xe/xe_util.h                   |  48 +++++++
> >  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
> >  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
> >  4 files changed, 282 insertions(+), 329 deletions(-)
> >
> > diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> > index 050162b5e..17cd45e45 100644
> > --- a/lib/xe/xe_util.c
> > +++ b/lib/xe/xe_util.c
> > @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
> >
> >  	return strcmp(gt_c_state, "gt-c6") =3D=3D 0;
> >  }
> > +
> > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > +		uint32_t bo_size, uint64_t placement, unsigned int flags)
> > +{
> > +	struct cpu_va *data;
> > +
> > +	if (flags & USERPTR) {
> > +		if (flags & INVALIDATE) {
> > +			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ | PROT_WRITE,
> > +					MAP_SHARED | MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> > +			igt_assert(data !=3D MAP_FAILED);
> > +		} else {
> > +			data =3D aligned_alloc(xe_get_default_alignment(fd),
> bo_size);
> > +			igt_assert(data);
> > +		}
> > +	} else {
> > +		*bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size,
> placement,
> > +
> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +		data =3D xe_bo_map(fd, *bo, bo_size);
> > +	}
> > +
> > +	memset(data, 0, bo_size);
> > +
> > +	return data;
> > +}
> > +
> > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < n_exec_queues; i++) {
> > +		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > +		if (flags & BIND_EXEC_QUEUE)
> > +			bind_exec_queues[i] =3D xe_bind_exec_queue_create(fd,
> vm, 0);
> > +		else
> > +			bind_exec_queues[i] =3D 0;
> > +	};
> > +}
> > +
> > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32=
_t bo,
> > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > +		struct cpu_va *data, unsigned int flags)
> > +{
> > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> > +
> > +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > +	if (bo)
> > +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr,
> bo_size, sync, 1);
> > +	else
> > +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> > +				to_user_pointer(data), addr,
> > +				bo_size, sync, 1);
> > +
> > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > +			bind_exec_queues, fence_timeout);
> > +	data[0].vm_sync =3D 0;
> > +
> > +	if (flags & PREFETCH) {
> > +		/* Should move to system memory */
> > +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> > +				bo_size, sync, 1, 0);
> > +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > +				bind_exec_queues, fence_timeout);
> > +		data[0].vm_sync =3D 0;
> > +	}
> > +}
> > +
> > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int=
 i)
> > +{
> > +	int b =3D 0;
> > +	data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > +	data[i].batch[b++] =3D dst;
> > +	data[i].batch[b++] =3D dst >> 32;
> > +	data[i].batch[b++] =3D val;
> > +	data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > +	igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > +}
> > +
> > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_e=
xecs,
> > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > +		int *map_fd, unsigned int flags)
> > +{
> > +	int i;
> > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> > +
> > +	for (i =3D 0; i < n_execs; i++) {
> > +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > +		uint64_t batch_addr =3D addr + batch_offset;
> > +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > +		uint64_t sdi_addr =3D addr + sdi_offset;
> > +		int e =3D i % n_exec_queues;
> > +
> > +		if (flags & INVALID_VA)
> > +			sdi_addr =3D 0x1fffffffffff000;
> > +
> > +		insert_store(sdi_addr, data, 0xc0ffee, i);
> > +
> > +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> > +
> > +		exec->exec_queue_id =3D exec_queues[e];
> > +		exec->address =3D batch_addr;
> > +		xe_exec(fd, exec);
> > +
> > +		if (flags & REBIND && i + 1 !=3D n_execs) {
> > +			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> > +					exec_queues[e], fence_timeout);
> > +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > +					addr, bo_size, NULL, 0);
> > +
> > +			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > +			addr +=3D bo_size;
> > +
> > +			if (bo)
> > +				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> > +						0, addr, bo_size, sync, 1);
> > +			else
> > +				xe_vm_bind_userptr_async(fd, vm,
> > +						bind_exec_queues[e],
> > +						to_user_pointer(data),
> > +						addr, bo_size, sync, 1);
> > +
> > +			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> > +					bind_exec_queues[e], fence_timeout);
> > +			data[0].vm_sync =3D 0;
> > +		}
> > +
> > +		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > +			if (!(flags & RACE)) {
> > +				/*
> > +				 * Wait for exec completion and check data as
> > +				 * userptr will likely change to different
> > +				 * physical memory on next mmap call triggering
> > +				 * an invalidate.
> > +				 */
> > +				xe_wait_ufence(fd, &data[i].exec_sync,
> > +						USER_FENCE_VALUE,
> exec_queues[e],
> > +						fence_timeout);
> > +				igt_assert_eq(data[i].data, 0xc0ffee);
> > +			} else if (i * 2 !=3D n_execs) {
> > +				/*
> > +				 * We issue 1 mmap which races against running
> > +				 * jobs. No real check here aside from this test
> > +				 * not faulting on the GPU.
> > +				 */
> > +				continue;
> > +			}
> > +
> > +			if (flags & RACE) {
> > +				*map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > +						0x666);
> > +				write(*map_fd, data, bo_size);
> > +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > +						MAP_FIXED, *map_fd, 0);
> > +			} else {
> > +				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > +						PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > +						MAP_FIXED |
> MAP_ANONYMOUS, -1, 0);
> > +			}
> > +
> > +			igt_assert(data !=3D MAP_FAILED);
> > +		}
> > +	}
> > +}
> > +
> > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> > +		uint32_t bo_size)
> > +{
> > +	int64_t fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC :
> ONE_SEC;
> > +
> > +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> > +			sync, 1);
> > +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > +			bind_exec_queues, fence_timeout);
> > +}
> > +
> > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > +		uint32_t *bind_exec_queues, int n_exec_queues)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < n_exec_queues; i++) {
> > +		xe_exec_queue_destroy(fd, exec_queues[i]);
> > +		if (bind_exec_queues[i])
> > +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > +	}
> > +}
> > +
> > diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> > index 6480ea01a..aa1b0dcc1 100644
> > --- a/lib/xe/xe_util.h
> > +++ b/lib/xe/xe_util.h
> > @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint3=
2_t
> bind_engine,
> >
> >  bool xe_is_gt_in_c6(int fd, int gt);
> >
> > +
> > +#define USERPTR			(0x1 << 0)
> > +#define REBIND			(0x1 << 1)
> > +#define INVALIDATE		(0x1 << 2)
> > +#define RACE			(0x1 << 3)
> > +#define BIND_EXEC_QUEUE		(0x1 << 4)
> > +#define PREFETCH		(0x1 << 5)
> > +#define INVALID_FAULT		(0x1 << 6)
> > +#define INVALID_VA		(0x1 << 7)
> > +#define ENABLE_SCRATCH		(0x1 << 8)
> > +#define VM_FOR_BO		(0x1 << 9)
> > +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> > +
> > +#define MAX_N_EXEC_QUEUES	16
> > +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> > +#define MAP_ADDRESS		0x00007fadeadbe000
> > +
> > +#define ONE_SEC		MS_TO_NS(1000)
> > +#define HUNDRED_SEC	MS_TO_NS(100000)
> > +
> > +struct cpu_va {
> > +	uint32_t batch[16];
> > +	uint64_t pad;
> > +	uint64_t vm_sync;
> > +	uint64_t exec_sync;
> > +	uint32_t data;
> > +};
> > +
> > +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> > +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> > +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> > +		uint32_t *bind_exec_queues, int n_exec_queues,
> > +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> > +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32=
_t bo,
> > +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> > +		struct cpu_va *data, unsigned int flags);
> > +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_e=
xecs,
> > +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> > +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> > +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> > +		int *map_fd, unsigned int flags);
> > +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int=
 i);
> > +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> > +		struct drm_xe_sync *sync, struct cpu_va *data,
> > +		uint64_t addr, uint32_t bo_size);
> > +void destory_exec_queue(int fd, uint32_t *exec_queues,
> > +		uint32_t *bind_exec_queues, int n_exec_queues);
> > +
> >  #endif /* XE_UTIL_H */
> > diff --git a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> > index 3ec848164..e8d82cc69 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -15,6 +15,7 @@
> >  #include "igt.h"
> >  #include "lib/igt_syncobj.h"
> >  #include "lib/intel_reg.h"
> > +#include "lib/xe/xe_util.h"
> >  #include <sys/ioctl.h>
> >  #include "xe_drm.h"
> >
> > @@ -23,15 +24,6 @@
> >  #include "xe/xe_spin.h"
> >  #include <string.h>
> >
> > -#define MAX_N_EXECQUEUES 	16
> > -#define USERPTR				(0x1 << 0)
> > -#define REBIND				(0x1 << 1)
> > -#define INVALIDATE			(0x1 << 2)
> > -#define RACE				(0x1 << 3)
> > -#define BIND_EXECQUEUE		(0x1 << 4)
> > -#define VM_FOR_BO			(0x1 << 5)
> > -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> > -
> >  /**
> >   * SUBTEST: twice-%s
> >   * Description: Run %arg[1] compute machine test twice
> > @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
> >  {
> >  	uint32_t vm;
> >  	uint64_t addr =3D 0x1a0000;
> > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> >  	struct drm_xe_sync sync[1] =3D {
> >  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE,
> >  		  .flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> > @@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_insta=
nce
> *eci,
> >  		.num_syncs =3D 1,
> >  		.syncs =3D to_user_pointer(sync),
> >  	};
> > -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> > -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> >  	size_t bo_size;
> >  	uint32_t bo =3D 0;
> > -	struct {
> > -		uint32_t batch[16];
> > -		uint64_t pad;
> > -		uint64_t vm_sync;
> > -		uint64_t exec_sync;
> > -		uint32_t data;
> > -	} *data;
> > -	int i, j, b;
> > +	struct cpu_va *data;
> > +	int i, j;
> >  	int map_fd =3D -1;
> >  	int64_t fence_timeout;
> > +	uint64_t placement;
> >
> > -	igt_assert(n_exec_queues <=3D MAX_N_EXECQUEUES);
> > +	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> >
> >  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> >  	bo_size =3D sizeof(*data) * n_execs;
> >  	bo_size =3D xe_bb_size(fd, bo_size);
> >
> > -	for (i =3D 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > -		if (flags & BIND_EXECQUEUE)
> > -			bind_exec_queues[i] =3D
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > -		else
> > -			bind_exec_queues[i] =3D 0;
> > -	};
> > +	if (flags & EXEC_QUEUE_EARLY)
> > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> n_exec_queues, eci, flags);
> >
> > -	if (flags & USERPTR) {
> > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > -		if (flags & INVALIDATE) {
> > -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > -				    MAP_ANONYMOUS, -1, 0);
> > -			igt_assert(data !=3D MAP_FAILED);
> > -		} else {
> > -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> > -					     bo_size);
> > -			igt_assert(data);
> > -		}
> > -	} else {
> > -		bo =3D xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> > -				  bo_size, vram_if_possible(fd, eci->gt_id),
> > -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > -		data =3D xe_bo_map(fd, bo, bo_size);
> > -	}
> > -	memset(data, 0, bo_size);
> > +	placement =3D vram_if_possible(fd, eci->gt_id);
> >
> > -	for (i =3D 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) =
{
> > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > -		if (flags & BIND_EXECQUEUE)
> > -			bind_exec_queues[i] =3D
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > -		else
> > -			bind_exec_queues[i] =3D 0;
> > -	};
> > +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> >
> > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -	if (bo)
> > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> > -				 bo_size, sync, 1);
> > -	else
> > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > -					 to_user_pointer(data), addr,
> > -					 bo_size, sync, 1);
> > -#define ONE_SEC	MS_TO_NS(1000)
> > -#define HUNDRED_SEC	MS_TO_NS(100000)
> > +	if(!(flags & EXEC_QUEUE_EARLY))
> > +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> n_exec_queues, eci, flags);
> > +
> > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data=
,
> flags);
> >
> >  	fence_timeout =3D igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> >
> > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > -		       bind_exec_queues[0], fence_timeout);
> > -	data[0].vm_sync =3D 0;
> > -
> > -	for (i =3D 0; i < n_execs; i++) {
> > -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > -		uint64_t batch_addr =3D addr + batch_offset;
> > -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > -		uint64_t sdi_addr =3D addr + sdi_offset;
> > -		int e =3D i % n_exec_queues;
> > -
> > -		b =3D 0;
> > -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > -		data[i].batch[b++] =3D sdi_addr;
> > -		data[i].batch[b++] =3D sdi_addr >> 32;
> > -		data[i].batch[b++] =3D 0xc0ffee;
> > -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > -
> > -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> > -
> > -		exec.exec_queue_id =3D exec_queues[e];
> > -		exec.address =3D batch_addr;
> > -		xe_exec(fd, &exec);
> > -
> > -		if (flags & REBIND && i + 1 !=3D n_execs) {
> > -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> > -				       exec_queues[e], fence_timeout);
> > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > -					   addr, bo_size, NULL, 0);
> > -
> > -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -			addr +=3D bo_size;
> > -			if (bo)
> > -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> > -						 0, addr, bo_size, sync, 1);
> > -			else
> > -				xe_vm_bind_userptr_async(fd, vm,
> > -							 bind_exec_queues[e],
> > -							 to_user_pointer(data),
> > -							 addr, bo_size, sync,
> > -							 1);
> > -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> > -				       bind_exec_queues[e], fence_timeout);
> > -			data[0].vm_sync =3D 0;
> > -		}
> > -
> > -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > -			if (!(flags & RACE)) {
> > -				/*
> > -				 * Wait for exec completion and check data as
> > -				 * userptr will likely change to different
> > -				 * physical memory on next mmap call triggering
> > -				 * an invalidate.
> > -				 */
> > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > -					       USER_FENCE_VALUE,
> exec_queues[e],
> > -					       fence_timeout);
> > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > -			} else if (i * 2 !=3D n_execs) {
> > -				/*
> > -				 * We issue 1 mmap which races against running
> > -				 * jobs. No real check here aside from this test
> > -				 * not faulting on the GPU.
> > -				 */
> > -				continue;
> > -			}
> > -
> > -			if (flags & RACE) {
> > -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > -					      0x666);
> > -				write(map_fd, data, bo_size);
> > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > -					    MAP_FIXED, map_fd, 0);
> > -			} else {
> > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> 0);
> > -			}
> > -			igt_assert(data !=3D MAP_FAILED);
> > -		}
> > -	}
> > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> flags);
> >
> >  	j =3D flags & INVALIDATE ? n_execs - 1 : 0;
> >  	for (i =3D j; i < n_execs; i++)
> > @@ -264,20 +132,12 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
> >  	if (flags & INVALIDATE)
> >  		usleep(250000);
> >
> > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > -			   sync, 1);
> > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > -		       bind_exec_queues[0], fence_timeout);
> > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> >
> >  	for (i =3D j; i < n_execs; i++)
> >  		igt_assert_eq(data[i].data, 0xc0ffee);
> >
> > -	for (i =3D 0; i < n_exec_queues; i++) {
> > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > -		if (bind_exec_queues[i])
> > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > -	}
> > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
> >
> >  	if (bo) {
> >  		munmap(data, bo_size);
> > @@ -492,14 +352,14 @@ igt_main
> >  		{ "userptr-rebind", USERPTR | REBIND },
> >  		{ "userptr-invalidate", USERPTR | INVALIDATE },
> >  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> > -		{ "bindexecqueue", BIND_EXECQUEUE },
> > -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> > -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> > -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE |
> USERPTR |
> > +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> > +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> > +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> > +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE |
> USERPTR |
> >  			REBIND },
> > -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE |
> USERPTR |
> > +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE |
> USERPTR |
> >  			INVALIDATE },
> > -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE |
> USERPTR |
> > +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
> USERPTR |
> >  			INVALIDATE | RACE },
> >  		{ NULL },
> >  	};
> > diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> > index 40fe1743e..7b2fef224 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -16,24 +16,13 @@
> >  #include "igt.h"
> >  #include "lib/igt_syncobj.h"
> >  #include "lib/intel_reg.h"
> > +#include "lib/xe/xe_util.h"
> >  #include "xe_drm.h"
> >
> >  #include "xe/xe_ioctl.h"
> >  #include "xe/xe_query.h"
> >  #include <string.h>
> >
> > -#define MAX_N_EXEC_QUEUES	16
> > -
> > -#define USERPTR		(0x1 << 0)
> > -#define REBIND		(0x1 << 1)
> > -#define INVALIDATE	(0x1 << 2)
> > -#define RACE		(0x1 << 3)
> > -#define BIND_EXEC_QUEUE	(0x1 << 4)
> > -#define PREFETCH	(0x1 << 5)
> > -#define INVALID_FAULT	(0x1 << 6)
> > -#define INVALID_VA	(0x1 << 7)
> > -#define ENABLE_SCRATCH  (0x1 << 8)
> > -
> >  /**
> >   * SUBTEST: invalid-va
> >   * Description: Access invalid va and check for EIO through user fence=
.
> > @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance
> *eci,
> >  {
> >  	uint32_t vm;
> >  	uint64_t addr =3D 0x1a0000;
> > -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> >  	struct drm_xe_sync sync[1] =3D {
> >  		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> >  	          .timeline_value =3D USER_FENCE_VALUE },
> > @@ -113,14 +101,9 @@ test_exec(int fd, struct drm_xe_engine_class_insta=
nce
> *eci,
> >  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> >  	size_t bo_size;
> >  	uint32_t bo =3D 0;
> > -	struct {
> > -		uint32_t batch[16];
> > -		uint64_t pad;
> > -		uint64_t vm_sync;
> > -		uint64_t exec_sync;
> > -		uint32_t data;
> > -	} *data;
> > -	int i, j, b;
> > +	struct cpu_va *data;
> > +	uint64_t placement;
> > +	int i, j;
> >  	int map_fd =3D -1;
> >
> >  	igt_assert(n_exec_queues <=3D MAX_N_EXEC_QUEUES);
> > @@ -134,144 +117,19 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
> >  	bo_size =3D sizeof(*data) * n_execs;
> >  	bo_size =3D xe_bb_size(fd, bo_size);
> >
> > -	if (flags & USERPTR) {
> > -#define	MAP_ADDRESS	0x00007fadeadbe000
> > -		if (flags & INVALIDATE) {
> > -			data =3D mmap((void *)MAP_ADDRESS, bo_size,
> PROT_READ |
> > -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> > -				    MAP_ANONYMOUS, -1, 0);
> > -			igt_assert(data !=3D MAP_FAILED);
> > -		} else {
> > -			data =3D aligned_alloc(xe_get_default_alignment(fd),
> > -					     bo_size);
> > -			igt_assert(data);
> > -		}
> > -	} else {
> > -		if (flags & PREFETCH)
> > -			bo =3D xe_bo_create(fd, 0, bo_size,
> > -					  all_memory_regions(fd) |
> > -					  vram_if_possible(fd, 0),
> > -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > -		else
> > -			bo =3D xe_bo_create(fd, 0, bo_size,
> > -					  vram_if_possible(fd, eci->gt_id),
> > -
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > -		data =3D xe_bo_map(fd, bo, bo_size);
> > -	}
> > -	memset(data, 0, bo_size);
> > -
> > -	for (i =3D 0; i < n_exec_queues; i++) {
> > -		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> > -		if (flags & BIND_EXEC_QUEUE)
> > -			bind_exec_queues[i] =3D
> > -				xe_bind_exec_queue_create(fd, vm, 0);
> > -		else
> > -			bind_exec_queues[i] =3D 0;
> > -	};
> > -
> > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -	if (bo)
> > -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> bo_size, sync, 1);
> > -	else
> > -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> > -					 to_user_pointer(data), addr,
> > -					 bo_size, sync, 1);
> > -#define ONE_SEC	MS_TO_NS(1000)
> > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > -		       bind_exec_queues[0], ONE_SEC);
> > -	data[0].vm_sync =3D 0;
> > -
> > -	if (flags & PREFETCH) {
> > -		/* Should move to system memory */
> > -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> > -				     bo_size, sync, 1, 0);
> > -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > -			       bind_exec_queues[0], ONE_SEC);
> > -		data[0].vm_sync =3D 0;
> > -	}
> > -
> > -	for (i =3D 0; i < n_execs; i++) {
> > -		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > -		uint64_t batch_addr =3D addr + batch_offset;
> > -		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> > -		uint64_t sdi_addr =3D addr + sdi_offset;
> > -		int e =3D i % n_exec_queues;
> > +	placement =3D (flags & PREFETCH) ? all_memory_regions(fd) |
> > +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
> >
> > -		b =3D 0;
> > -		if (flags & INVALID_VA)
> > -			sdi_addr =3D 0x1fffffffffff000;
> > +	data =3D create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
> >
> > -		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> > -		data[i].batch[b++] =3D sdi_addr;
> > -		data[i].batch[b++] =3D sdi_addr >> 32;
> > -		data[i].batch[b++] =3D 0xc0ffee;
> > -		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> > -		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> > +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> > +			n_exec_queues, eci, flags);
> >
> > -		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
> > +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data=
,
> flags);
> >
> > -		exec.exec_queue_id =3D exec_queues[e];
> > -		exec.address =3D batch_addr;
> > -		xe_exec(fd, &exec);
> > +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> > +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd,
> flags);
> >
> > -		if (flags & REBIND && i + 1 !=3D n_execs) {
> > -			xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> > -				       exec_queues[e], ONE_SEC);
> > -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> > -					   addr, bo_size, NULL, 0);
> > -
> > -			sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -			addr +=3D bo_size;
> > -			if (bo)
> > -				xe_vm_bind_async(fd, vm,
> bind_exec_queues[e], bo,
> > -						 0, addr, bo_size, sync, 1);
> > -			else
> > -				xe_vm_bind_userptr_async(fd, vm,
> > -							 bind_exec_queues[e],
> > -							 to_user_pointer(data),
> > -							 addr, bo_size, sync,
> > -							 1);
> > -			xe_wait_ufence(fd, &data[0].vm_sync,
> USER_FENCE_VALUE,
> > -				       bind_exec_queues[e], ONE_SEC);
> > -			data[0].vm_sync =3D 0;
> > -		}
> > -
> > -		if (flags & INVALIDATE && i + 1 !=3D n_execs) {
> > -			if (!(flags & RACE)) {
> > -				/*
> > -				 * Wait for exec completion and check data as
> > -				 * userptr will likely change to different
> > -				 * physical memory on next mmap call triggering
> > -				 * an invalidate.
> > -				 */
> > -				xe_wait_ufence(fd, &data[i].exec_sync,
> > -					       USER_FENCE_VALUE,
> exec_queues[e],
> > -					       ONE_SEC);
> > -				igt_assert_eq(data[i].data, 0xc0ffee);
> > -			} else if (i * 2 !=3D n_execs) {
> > -				/*
> > -				 * We issue 1 mmap which races against running
> > -				 * jobs. No real check here aside from this test
> > -				 * not faulting on the GPU.
> > -				 */
> > -				continue;
> > -			}
> > -
> > -			if (flags & RACE) {
> > -				map_fd =3D open("/tmp", O_TMPFILE | O_RDWR,
> > -					      0x666);
> > -				write(map_fd, data, bo_size);
> > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > -					    MAP_FIXED, map_fd, 0);
> > -			} else {
> > -				data =3D mmap((void *)MAP_ADDRESS, bo_size,
> > -					    PROT_READ | PROT_WRITE,
> MAP_SHARED |
> > -					    MAP_FIXED | MAP_ANONYMOUS, -1,
> 0);
> > -			}
> > -			igt_assert(data !=3D MAP_FAILED);
> > -		}
> > -	}
> >  	if (!(flags & INVALID_FAULT)) {
> >  		int64_t timeout =3D ONE_SEC;
> >
> > @@ -286,22 +144,15 @@ test_exec(int fd, struct
> drm_xe_engine_class_instance *eci,
> >  							       exec_queues[i %
> n_exec_queues], &timeout), 0);
> >  		}
> >  	}
> > -	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> > -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> > -			   sync, 1);
> > -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> > -		       bind_exec_queues[0], ONE_SEC);
> > +
> > +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
> >
> >  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
> >  		for (i =3D j; i < n_execs; i++)
> >  				igt_assert_eq(data[i].data, 0xc0ffee);
> >  	}
> >
> > -	for (i =3D 0; i < n_exec_queues; i++) {
> > -		xe_exec_queue_destroy(fd, exec_queues[i]);
> > -		if (bind_exec_queues[i])
> > -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> > -	}
> > +	destory_exec_queue(fd, exec_queues, bind_exec_queues,
> n_exec_queues);
> >
> >  	if (bo) {
> >  		munmap(data, bo_size);
> > --
> > 2.25.1
> >
