Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F40D11192
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554D10E666;
	Wed, 26 Nov 2025 19:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUpKicfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A1A10E666
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183715; x=1795719715;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SQuuwEb3w9ElPNP/VnWaYZL9q/PBGWCoAyFnI/d9Zd4=;
 b=dUpKicfE74VspM7ySMxH9lLH6CU2MkmlBCq0qESuK68Q4rai0cF/cwlH
 zs0/Mz7Hsq4S1vEmeyl6GrXfRocNtff6OCDUEVtPRWS5431X34fmfdcwS
 qtIh7ss9z6fl10pBOSry8oZnNtSZsGtWQAZfCVfX+xOCiuSaAHS5ZX3BI
 a3KFes3pz6XcVaz1n4UCAZbos1LloZ6BsBJ+WIRF4FpRKRefqSmF5gOqh
 T2TYuvY6EaocLcDlEOHvLqhT8HZvf8KyESusm2OM7Nr0d50+fRo4UmAGV
 ysG8T5Jbh9TEmASL74tC31dUBChPHiPgNlxPK4iTeFnDGx1hLv25LDLeM w==;
X-CSE-ConnectionGUID: a7DYk9MySXuhQDaOBC45gg==
X-CSE-MsgGUID: Bs3Ud049T0S9AUHhe2hblg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65416357"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="65416357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 11:01:54 -0800
X-CSE-ConnectionGUID: 1UeVHjQiSfy61Ia4JM1ReA==
X-CSE-MsgGUID: LXHSl/OQR4OUO9ci21LQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="197354707"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 11:01:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 11:01:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 11:01:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 11:01:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5aSzcvZN3LiCI9QT6Ri9jBybjrJGRmogP45TCxpypxbPlUU/YXgsXut/uy21drBpgEKsWYwTEvFvejENW5sMn67mxPVA6Mk+vZsCLtO+p90Dx48z1Jy0T0fFQBaVuewRKndDvBHBB0DJXR+9/xDH4YpMwxKyh/slkys04mDGJ28OeNQR63WHyH9gYcYChAoei+ROChHD22c2NvW+uhgBbx3R5yOfufd22FN0vjsQzQyvFqw0PCJ2dm9UF3UJo4XrBmCIqxz8+ugj51Rcl4mbu8nJEJYUKA6hZo2QsBH7omEKjg1cx9mBlChSrbu41WCPPz+VECdhT0wO5a8w1tfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW8KX5ZjdaED8BlZHR945/8k5ZyigaXxQa8gpzw36jQ=;
 b=daHe9h+PTTsCiqEz8jpMEN+C+Pi/XPtBwyf4iJLeYlDo+O7Xo5UNi84EOzl/beRRGlxvLdgeClJl9vspHup1Q0QVoT9sDVuVuBz2XcA7nh6KL4EPEGqt85VEFgCsmeLjq5dk+fmTcy7/lnHAXKJYiuiorHkbyEiWS+gw5FNPMcVVIkZhVsMjTL1xP3LSHJw4LsXQ+k8MB9JD0GwwEQGOfg9KA/krBGbF8bh3wZFjrfGdQ7JeTuFX7tyoo8/LloF8CVf4F76XmTK+0KttrUcmND4/tkLTtGspdOIBsTqWxB//Brf5tSXtz9OMmeVCRE5j3vIGPyGAKJ1OtES/d4RBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 19:01:47 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 19:01:46 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Mario Kleiner <mario.kleiner.de@gmail.com>, Mike Galbraith
 <umgwanakikbuti@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>
Subject: RE: [PATCH 1/7] drm/i915/display: Make get_vblank_counter use
 intel_de_read_fw()
Thread-Topic: [PATCH 1/7] drm/i915/display: Make get_vblank_counter use
 intel_de_read_fw()
Thread-Index: AQHcTOtRnKVcAo3TuESxwgIOlFMxy7UFc9xg
Date: Wed, 26 Nov 2025 19:01:46 +0000
Message-ID: <DM4PR11MB6360E6FE7D67376B2150C4FAF4DEA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251103174718.139798-1-dev@lankhorst.se>
 <20251103174718.139798-2-dev@lankhorst.se>
In-Reply-To: <20251103174718.139798-2-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SN7PR11MB8282:EE_
x-ms-office365-filtering-correlation-id: 959a09c6-0eba-43f0-a1a2-08de2d1e3f49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?DhCFf7TscmKYP9ctIlI5WLxGHRst9da+lL6v4Ay72t4j4UYepEHEkpZj7FNZ?=
 =?us-ascii?Q?caeWfm6pXtXujIiTMnNJsuSLT1k+5MbqlyINWBARJjacG5UYqdPAYJ5HgSIA?=
 =?us-ascii?Q?MEc0ISPvKdVs8FQe60am9Qy8Nt4rx0sNLFGCCYtMQzYxahlmZ3K/ziHvoEPj?=
 =?us-ascii?Q?rjoDslo1ggTgXJhMdveDZMjH+5K7+o4TJ4DGn/47xdK7kPNXRY+apa5mIdG6?=
 =?us-ascii?Q?unRjXwE6ScZSv4YJtsTZV+zbpI/6IAZaU59oyuNf+JjJNVc40q4VSKZViF3J?=
 =?us-ascii?Q?Z0YDFkYpAIKp17wtT0XbiW7iY5TfgWYzz7SKoM8npdROJ99twwxZrZytcQ3M?=
 =?us-ascii?Q?s7Cf06FBhZnrCkXanhNZnAi+hCXKvkCf5a++F2A0+xZAD9f3Qs0rAjc0WXzm?=
 =?us-ascii?Q?fpeL7J/MA03cuAnU9Rf29zn9Jdc/iLkOSNWwD0B+329+T86fK9FozGi6V24H?=
 =?us-ascii?Q?naYRjzPh/rMtxTG1xhWPS4MIrDpL0BSygFn4iQCXRrVfBVlHn/nAvFCcMOq0?=
 =?us-ascii?Q?ENAKr0sU1B3KAlmi9g2IY9e/wQk7i5ZUv5aBdGFx11CXby7hVQjKnjR8Hf1O?=
 =?us-ascii?Q?+IrTFp80nBzCpJWDZkSCB92bLMFa7YfBFAIaGo+7JpjKpZYTfusep3toMi4f?=
 =?us-ascii?Q?2/JEsa5R1vft7K3qGppd5rRvfg7igtHNUXmANbhSoF8L0mRcqu6WtHBBf4gd?=
 =?us-ascii?Q?+Sxx4/isGB3NIdcp3l7dlylQN9Nk7nywaO0VspvIGDV9I38X7k6zpxmZfKTL?=
 =?us-ascii?Q?KfsAhAgGs+z4GQUrnJJ4HDgEjPvDukqRjuoK14Tn4Rjy1EfPrqfb9qmYd4ah?=
 =?us-ascii?Q?LaL/mM1g+vSVcVU4mjPiT9M442N3GJYLtRMDoGXc3yu3b0dy/OTsnhOcaKbi?=
 =?us-ascii?Q?0NEcotVMZpShonqXGVlWDtxYOtY1Nz6iZ5ey32cvyWcpJVsmSAz7DM3ba8xo?=
 =?us-ascii?Q?Dg7ZIA/yoU2KhP68l9VAPJdyJiBFTAD9rwoWJgo28YbG2H1kOHik6x+KzxCr?=
 =?us-ascii?Q?x4MVvqlpMbo8zuYl5S1kvgibuqWBlIYd6M0bkV3Q93hTFgirwv/7ckjuB+1j?=
 =?us-ascii?Q?6lEs9y4EGmIsp1LW6t+5lA8G5FDE2qh9X6D0WYVR/JjkZ9VHqEcnZ+AfHAQd?=
 =?us-ascii?Q?qlYRD73nANteXjW5g0bDCNlVa05EJD6U6ULiboDGjYS4gyzPRuNFECbmk7/N?=
 =?us-ascii?Q?FrjsPLA4Ru22Ikcns5RKcs4VrSREssLfioevKX1EOEEb9LOounvnRgxDZYAO?=
 =?us-ascii?Q?uUl0DUxIZaN0eubhD9aA1I6hZZ571x6Pi+/zv9BDFhTzyTlpZRHp/qIBWQNm?=
 =?us-ascii?Q?LQcMWAiTyBR6VdHziw8OmAzk0gMI2D765KR25ONrTOxHcnJ1+oWjaSkVbB91?=
 =?us-ascii?Q?idigwQ24PafgbGlUDxgiTgMfG0HOwBAqVnIEhuIcwtA9sE9CICrSa1PFJkRc?=
 =?us-ascii?Q?fI2Ix5nDivpLC8muXaLm1rjjd4OsYfDCv5T0nOyv94/7z2aL3VWIArQRB8G3?=
 =?us-ascii?Q?DNA2mNL3yDkL/doEi6G4qaJS6icQgL+4przE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R+x8JPKcwgDONh6XWy5/vOYqZzolynxPcp1dHy0+WiMNOfMqLSM/ov4VCR6U?=
 =?us-ascii?Q?VwSRE9wMb++47UowltRKMIss+wCsfbfPmojdATDpMtiSg5HJSWwkxWUQMQRw?=
 =?us-ascii?Q?/WA+cBglDU15JsbrTWDCaXCQ47ThdlfQWhhJkyvIq+lhk+KgIJV77HAvwaP5?=
 =?us-ascii?Q?gNa4kUvsjwgkCSDc33ZFD52TI/9A24uQwb40HDarDVSDbjzwESLzq0DqH/Nr?=
 =?us-ascii?Q?cwITjcLRg30lT+lc/PEMT1UFCpwMN+cHx6LWYVXDkWS42KVLoTeQga34rum/?=
 =?us-ascii?Q?mIuPsBssycZhOY/OM0jb9NtIneyQyjnr9HVXL8e9ir4o0eLD4qawl0Yn20ox?=
 =?us-ascii?Q?SSOZG+Lj2jakGABZIIeBIk6fz/RGk+Gbf8EURLoa0+sIFWhwfsYl4NKhp6s8?=
 =?us-ascii?Q?1vhWflhx7O6dDpFCxMtphcEsrVGkB5+1n8iSqvJPztSGiBVXfc3aFmkS05xr?=
 =?us-ascii?Q?ZqaeBQzwmNg+59S4fSzv/vt2foPTHDv/CBovPOBPkzKmRQXFIDfQiEu4KNmx?=
 =?us-ascii?Q?3vud1ivw+gnyMnYw+WMByuGfG7iebwWBqzJSj/w8dnhkdSCkiXn/7sxsytkk?=
 =?us-ascii?Q?LzH/2f7PJ+Oi5Hmg3yc7poF5MoZqgHB1XuMV0VP8ndpnT6bTKbc5Uh4usVFe?=
 =?us-ascii?Q?PVOuSUzQHde1RAjRqbgp0uQDy4+RO8SOVRHI3og3TU7l6nHQiabzUz32cr4V?=
 =?us-ascii?Q?0yeTdqChBAdQgSJTb+Ue0DCEl3to1EQaiWQRIYd2qWUT/5M7HnwyQw0lW0Tu?=
 =?us-ascii?Q?8gkJhPvlcfd2InRSUhebSnoLvGOIW+/mtPNBuqEXFCIOzfqoNYow81ZcSnkM?=
 =?us-ascii?Q?xEZ2z/YmmBJrcgOLNh+VxJi83TkkGjeD+jMEjoVSsopKSYhT5bm9MF6yyMPd?=
 =?us-ascii?Q?0irupRN7gLK1WedmZXVSvuIXa4UaHeZHDuF85WYrN57VDrGfodtG6JgBbzig?=
 =?us-ascii?Q?cP6aYvtpDXn0Mg9M+2ofnprEYXFJAWdhn1ft2yl6IBH1xCfaewD4m64sqhZr?=
 =?us-ascii?Q?kL4GHzwmBB0TP5VKkLECkfAk8tq5FKGfUesQIdPZ/FeRxtXHn4RdbM/zP7ID?=
 =?us-ascii?Q?eSZYAYvKjNBooSeli4lf06My8CRrhXLDNCwKuIpD8osSDF23NuWwLlZfnZgH?=
 =?us-ascii?Q?zWEL2EDFihkMOKQSSBtxVNf1LnvDZECfR5bDqg0VA4c5eB5iajakJglXXiyr?=
 =?us-ascii?Q?uIszQyzZWYboeF6tQRsKopNTeg12AS0a+VP0/pswlWVe/SUqkkio8Qq/jU6e?=
 =?us-ascii?Q?Zn8M5cDnkRrzu+BCuiQH1PyGIPJbTNz+p7uO6fP8VXiN0ff165igfh+QyJ3M?=
 =?us-ascii?Q?8MAXLlipWRLZfgslHUIipTjA9hae5uskV1AV2yX0kexyAQmkCobq61rhjLDT?=
 =?us-ascii?Q?Gf6t1oJyIAkByStoONsnOFGiWEOk6qiuQ4w2Avfv433KEW08UTedJ9SN8bvZ?=
 =?us-ascii?Q?Xr8sa51nCQEeQ/PprFX0AR7Ry5R8jsCdcELZ3ljyCK8dW0/Wn3T4UX0jeZ5b?=
 =?us-ascii?Q?JM776b3ZkpPZtN9BrnEgwLGwcUszwHReQcRGS5ZhbO/iYg+qJWhR/xk9rF+t?=
 =?us-ascii?Q?X4ok506FjIJqZXkgd1Rzzei6xkYD+GOi+wjIN7kP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959a09c6-0eba-43f0-a1a2-08de2d1e3f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 19:01:46.6549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUi42GyUgfHJMyB3sMQsUR69AicjfpEwOR1nnNqDbubh81vU3KkQCqxoRhA7Bw0kuNyNjBaEdYVd5Op/xI7jEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Maar=
ten
> Lankhorst
> Sent: Monday, November 3, 2025 11:17 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>; Mario Kleiner
> <mario.kleiner.de@gmail.com>; Mike Galbraith <umgwanakikbuti@gmail.com>;
> Thomas Gleixner <tglx@linutronix.de>; Sebastian Andrzej Siewior
> <bigeasy@linutronix.de>
> Subject: [PATCH 1/7] drm/i915/display: Make get_vblank_counter use
> intel_de_read_fw()
>=20
> Fixes the following lockdep splat on PREEMPT_RT:
> <3> BUG: sleeping function called from invalid context at
> kernel/locking/spinlock_rt.c:48 <3> in_atomic(): 1, irqs_disabled(): 0, n=
on_block:
> 0, pid: 1373, name: xe_module_load <3> preempt_count: 1, expected: 0 <3> =
RCU
> nest depth: 0, expected: 0 <4> 11 locks held by xe_module_load/1373:
> <4>  #0: ffff888107b691a0 (&dev->mutex){....}-{3:3}, at:
> __driver_attach+0x104/0x220 <4>  #1: ffff88813cd30280 (&dev-
> >clientlist_mutex){+.+.}-{3:3}, at: drm_client_register+0x32/0xe0 <4>  #2=
:
> ffffffff837f88f8 (registration_lock){+.+.}-{3:3}, at: register_framebuffe=
r+0x1b/0x50
> <4>  #3: ffffffff835985e0 (console_lock){+.+.}-{0:0}, at:
> fbcon_fb_registered+0x6f/0x90 <4>  #4: ffff88812589e6a0 (&helper->lock){+=
.+.}-
> {3:3}, at: __drm_fb_helper_restore_fbdev_mode_unlocked+0x7b/0x110
> <4>  #5: ffff88813cd30158 (&dev->master_mutex){+.+.}-{3:3}, at:
> drm_master_internal_acquire+0x20/0x50
> <4>  #6: ffff88812589e488 (&client->modeset_mutex){+.+.}-{3:3}, at:
> drm_client_modeset_commit_locked+0x2a/0x1b0
> <4>  #7: ffffc9000031eef0 (crtc_ww_class_acquire){+.+.}-{0:0}, at:
> drm_client_modeset_commit_atomic+0x4c/0x2b0
> <4>  #8: ffffc9000031ef18 (crtc_ww_class_mutex){+.+.}-{3:3}, at:
> drm_client_modeset_commit_atomic+0x4c/0x2b0
> <4>  #9: ffff888114f7b8b8 (&intel_dp->psr.lock){+.+.}-{3:3}, at:
> intel_psr_lock+0xc5/0xf0 [xe] <4>  #10: ffff88812a0cbbc0 (&wl->lock){+.+.=
}-{2:2},
> at: intel_dmc_wl_get+0x3c/0x140 [xe]
>=20
> This splat will happen otherwise on all tracepoints too, for similar reas=
ons.
>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c
> b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 671f357c65638..2b106ffa3f5f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -133,7 +133,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
>  	if (!vblank->max_vblank_count)
>  		return 0;
>=20
> -	return intel_de_read(display, PIPE_FRMCOUNT_G4X(display, pipe));
> +	return intel_de_read_fw(display, PIPE_FRMCOUNT_G4X(display, pipe));

I think we ensure that power domains etc are up and locking would have been=
 handled by caller,
so this should be ok. Will verify for any corner case and get back.

Regards,
Uma Shankar

>  }
>=20
>  static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc =
*crtc)
> --
> 2.51.0

