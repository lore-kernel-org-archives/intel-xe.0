Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708BCE81A28
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 14:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569810E138;
	Mon, 16 Feb 2026 14:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjsCdz1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929E210E138
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771250789; x=1802786789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1azkVNtqAerh5R6weJ4Kdzu4dc2HTMzoprHEksvbf90=;
 b=JjsCdz1ZU+JHdntUJ3XWVN3EC6t/lzBVC64d+UC5grm2EvJQLODicwa6
 2PSFbIbtyh7qPHdiK2rT0OTEZvLmHgamFeK7n03xnON5VGTDSdbJnVaxo
 H/lsICYD2RR4RxUQe0eNnxa87KJ6JJWhy8n3CaVAlZlVl4Oj29tHV6ePV
 TnKEnFej0OG7NlgR8T6ReVE8KZbl65n9aO01cHsM02eC0LrNnEbpFKXCz
 oBqaY/Q++Snqr2h6k/vP31mv2u5dz4760eQyhEJ0xwNjmaq9unwLkzcuO
 IeKrw4mVjuMkUfKduOsSeCJdm4VA6gVZgaWFIsir8IVlHg5WYQKzv9r0L A==;
X-CSE-ConnectionGUID: 0N2eZnkySLGzbWAczG6Hcw==
X-CSE-MsgGUID: LdRIDJI5TzWwy1DhZxUlRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83694790"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83694790"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:06:28 -0800
X-CSE-ConnectionGUID: gqZbii4jQsiPD1lwR5VxUQ==
X-CSE-MsgGUID: Oq5TtOymRLGKxZzi5whwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="236638019"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 06:06:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:06:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 06:06:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 06:06:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+Y2DoznQ5ikpiBphKxfAX8viEcQ7rXkiqyKxyCbPiXmz7UrLEAezUCoWmUEI913oMIC0h51BjaSdG7z6cteZ5B2bWDTUw0FJ/OB4I6whl3+y9VkRoXsUHdNzYFZ6bHXH4D3IEHtJ4kGHeUC8CIt76U9A9RIM53GQfc5P9k1wm4YfnhT6OKnZlh4+Gn0XhuKppuZo++PgomTkcYt5tFqAcbx8QMlQPTR4rGpYiY7Sf1StamZt64zVsLh8xMaQ3rOS/OASSO2mLPKLim1SzpVYz1cdM3KIGe70FsJ9eFXzs03AfmiSEeA2y1Lk7JmaZtlnGyO7tBIrTY6LKeBWsRhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDhmaZlk+gHB01VgIowpOAIU/reu/ysESqs8kJl2PJc=;
 b=Aear8PjWIkiRI6Dspv+364WchQHOFOsoMp8Lnv/7uUbivRNDp3QwYbqG1kJORs1phTk6m+V43AEvV/kPs8Wdq/FoRK+QRcg5br2dDY/yjqne0AjpdgtQ5mW4lUatjeyAG5MbCWEVCog3zuIPlQWThd2wu8nRG9oXU5eWd+FzWdsPI72avs4QRS7Ldj8JQiru773xO7Ar02Td/vpoRR0uMvzPzTzl5svxu1IYeywrCd5JaU07RpYkOad0hEphMpGctk4l08PgPJXLqV22iu5la1Ey5QfTaOrG++yFFy450oqy19G/i4GvETDQzNiWEVB9nbf1haYYdenxwDNwOQwgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 14:06:24 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%7]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:06:24 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v1 4/4] drm/xe/sysctrl: Add RAS error injection interface
Thread-Topic: [PATCH v1 4/4] drm/xe/sysctrl: Add RAS error injection interface
Thread-Index: AQHcn0rsvZ99l+dBvkqJB6dIeexrk7WFW5Uw
Date: Mon, 16 Feb 2026 14:06:23 +0000
Message-ID: <BN9PR11MB52424C6D25D04F31948B7650956CA@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260216134757.3891177-6-anoop.c.vijay@intel.com>
 <20260216134757.3891177-10-anoop.c.vijay@intel.com>
In-Reply-To: <20260216134757.3891177-10-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|CY5PR11MB6113:EE_
x-ms-office365-filtering-correlation-id: 0a9ddf64-7e2f-4500-9911-08de6d649181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Nh2uplDo+mW9xEM8ckKDDsfub88ZpM9T4muFnCkUNV4IyBMIyqxoeEXPSc2i?=
 =?us-ascii?Q?8lvC813NqHlSHLBkVIzs8HWky1KIIvZ/YemqmwlWx/N78dvpniXkFwrrB9uy?=
 =?us-ascii?Q?Hfi2t3FeX3fK7Lvjn8uWGjpz/nROQj14iQgT7v/IuXG2BjKf5vw4AKET5YvQ?=
 =?us-ascii?Q?BRFPUoT01sy5RNfnTxAaaHo4uPP1VEEwZYnM6T+EQn2odABZyJ9d3rQ57PEa?=
 =?us-ascii?Q?KWdNncyqqnEFp9L8HMJLhFPtTeTtSzJoEnP6lx2mfzuHr+04tKGvM892EAWG?=
 =?us-ascii?Q?VyJm/U7iSJFpMdhO6FECnA5WwxLftqypT1Z9/F64O1LC95/Z/+OGL6VlAX/Y?=
 =?us-ascii?Q?MsD2fY6Yjf2fYkJv3r932xqw7yBULa1q4CrsYJRrHJqjZXeeDmBWOWskfO4+?=
 =?us-ascii?Q?cL4EsSK02mAwZcdl3znEwKwBaXjsNXireqGg1nIzKigaEGAVUnkl1jAAGuC5?=
 =?us-ascii?Q?80kVUPYgPn4kPzf7/7pFLxlV9Idg9B1jcXEMLA5nNSxQKPDDMrydqNwXhzK0?=
 =?us-ascii?Q?XS4p/5uDP4dHUdAb3t+Yb5n4KSoWSrddcl/LQC/uZ/PPG1K2o+HW1U1mwv3o?=
 =?us-ascii?Q?NpW+caLQZdVkpIQgsVqRiMPcWKJjlmQLNzz49HE1wv4vbu5DkYuyqAYFq/A6?=
 =?us-ascii?Q?q6L7Jc2F9PXSykCzaPmmoEoMe5eujSKByc0Zmnv+x0eGn6nwbrjXJvPGcbkv?=
 =?us-ascii?Q?LJEfKVFd8u0SxlqHlUyIgdSrwcLAnDpYOYxTENjgNn1hhJcoGSkeeT8+5dgJ?=
 =?us-ascii?Q?H51b35vUvrYG1JlsOuM3CgIPUDq+LxCM22UVB2v5v7H/jLrSVvcMWiMjbZvT?=
 =?us-ascii?Q?mme0vSFDKpIJdmIqub6hiUKNjb5AwGHvz1tKqSDJdOLFJ+BjA2Gybh8v/KQL?=
 =?us-ascii?Q?Z2lU91EngbqqmEio0non6eTHBIupo6C6ej+35M1278dD5aeM8GN+k4cAltS0?=
 =?us-ascii?Q?bD0ESgygXvv5rtDOleW+ymwPo0zzfSUs9NcY8qI2WoIicuUfDooUUmi8N+X1?=
 =?us-ascii?Q?B4NZc2SaPAbU+97vwnQm8+I2vJLyFWsShBx4JM7KbhKO2Fo502tQt4hiRPd5?=
 =?us-ascii?Q?1bLqQyvC+7INJLx7AAmT6pQYlH3j8/3YdDuP5dBeWKKAHC5L12KPCTlj9qvL?=
 =?us-ascii?Q?75hZwIY0ZXK/uzQHVGlFxEeiGUQ4x0QxC8w5/U+jYYHvzb5pdfAei1dL3sV6?=
 =?us-ascii?Q?aU9Y5+uvv1kzKzV66BP9duO8JDcmRcJDOjc4vAyOT/xzZP69tVeSds/dyuA2?=
 =?us-ascii?Q?4aOc5ZF04LbZIbDiLAr2qFOZHQN78vEaMQgY44j3dFwHrNpQYnyQMEBymV8a?=
 =?us-ascii?Q?VUcqxh43/T0n3hvrX2wHtTpLQO31yIgQMQnaCOnmXyVh5OltZ0ny+yrQfBgv?=
 =?us-ascii?Q?MyTub9lR3pZ39xVRfM7EXPAp+8xsik9waCvEoCjXEudZqfeO6pRcQB4l+5bw?=
 =?us-ascii?Q?yhS2GkEo03HDZydOsps6P8baYwwSiclcN/RxZIVHRju2f2NTrodX6XwjN/V6?=
 =?us-ascii?Q?5dEWiZ/z40MnO67SLQESy6fnMDQFkaCYtPZRQZaYDg87PVxxbkqcsb7vjpoN?=
 =?us-ascii?Q?2Knu/vYnOfgBcMbMu2JVkmpE0xN6Edi8ZXdYvcYVZSa5l7+KWfd/s2dfs1Wx?=
 =?us-ascii?Q?5h7pWTnNFUvAFn+VL37eRsY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LWv0cDP5f7Fw9m1r9mNVFp3RAZt8W8rRgtcW/xvnPuItH5FeVF0Lv+xaWG+z?=
 =?us-ascii?Q?n0N/6mXSJoOPRsYErZMSAL/Xlxo0T70X+cn7aXjdt7aPdJ4vZ+LS+FIbFToS?=
 =?us-ascii?Q?lcw/MlzIvjmOKMGIGMktNlLSzZu3HhWLXgJsdNv83I8mO+GFwHi8wmkHGhyo?=
 =?us-ascii?Q?JFjTj0ogxwfOgBPMVhUhubJGyTzEtb+XzjvOizhrvPazRVPZCDgvthqy37tB?=
 =?us-ascii?Q?vrYvO3JxSu2YYEwY4sjo8/aiCIEyLGEia7+0g/g3FRXcxQ0TGzM8GAqpjp2K?=
 =?us-ascii?Q?eV1INTGJREJUZzp/XgIljck5V7IzEnR6RoKNvFh5QJAUv7zj+EkEBlHf3qSJ?=
 =?us-ascii?Q?OmZX9MS9cPYPwatgbdIRE3OgAU2pTllxpWjaiU47yge+Ts4Xe1L16T58epP8?=
 =?us-ascii?Q?24ud3w1AP4iVk3+4EHc1+tzVmU16+axGgLZgaY9GTFT84iABl0IBQuc4aYHp?=
 =?us-ascii?Q?7B7HvRztn6NkRhgG9kkDTckFdMok2zG8+7B9XTbfQjeq34mSugEMEPnCM6QU?=
 =?us-ascii?Q?1fiXFkqpDzyUc1aj/ooSx4WT/ZhqDnGbQMcmOuaZa1E78I4Y0aCkSCrMwRmh?=
 =?us-ascii?Q?7IsyBK59MVtXnuzFxgMJVZaxl3B3azg3I7BSj9Bxu2y05hrHmujyB+dJSmJY?=
 =?us-ascii?Q?9kDrN6kqh3Fwfr+hPGzNTu07d5Fi3xw6NCey9/yEZ4wIxp7QBa87rGFzK/S0?=
 =?us-ascii?Q?+yn8BY+2jMTUwVMP+T/yC8GhpAU5uAjTBXiEGbgKmrs8BhO9j3QI7ygUSVKV?=
 =?us-ascii?Q?CUEZ+T6JS//j12N9V9ksRQiGRJy0eYtxWJV5kDvvWKzy4BopwKEnW2GH3Vdo?=
 =?us-ascii?Q?jYORuiDTr38js2j8KXb26Fj/A1l1qeUk2ia84wCs3rCkWCMklgoWhVqc0Bxs?=
 =?us-ascii?Q?yL2A6MqweSgkliOoa4xlVRt6x7lt2dglQrpvWdpMScv77lkle1BvPS5WtyYS?=
 =?us-ascii?Q?006Ng6SNA+6KwGmHwew2632DrkZToflyn9pzW4hA10mNU4z+Zyc7z7hK/iCc?=
 =?us-ascii?Q?GB1tXBVyQYYeeEoPNhbMZ+X6IoDOAK+ecBw0IjxvaXPn83JYJDgfikI06/JM?=
 =?us-ascii?Q?ehs6qbXSgfJBs5KvoOkpKjVmtdCGiwP/ipz32gdeNFFKs8DzFzR3lUviX+O2?=
 =?us-ascii?Q?FEjKUIdDerPRQyXhvU0CCGE1oVc8q5i+0tjXQVcAJhheJmNsFma+ptYTiAIZ?=
 =?us-ascii?Q?/D3lJJ8AHzOIIHs9aeyRst8BfG/XjO+RpRsi7cVt65Lecir4JroZm9sYoK5D?=
 =?us-ascii?Q?hPpcWc/Kd3vZcozVimOYgz5w6TMbOkRlyI7o4/jw25IZyexn8NziiEoA2Bjx?=
 =?us-ascii?Q?OAX/g2JX2n/oVOaWU8TAKFkxdi1vcyfBPMSSRqn0JH0jpJjd2IWkP55Ir8/D?=
 =?us-ascii?Q?Fqr90YQk6IBZox85IuIcaSbqYzjyFzootPOOLcyPw839CwaAfTLtFAV0Ho6O?=
 =?us-ascii?Q?RTEGCIudegIrX6BGZVpQ+DLOKs5HB6yYDoO9Sk7CR6YPV6mbdrzsFCc0q34O?=
 =?us-ascii?Q?m8MZ4xvWCSPGpmvurs6M2Gr+nplxEKV4o4ESfkJLGU2+LPmB0Uui2b5UVtKS?=
 =?us-ascii?Q?BvuTYW36M+q5p5CjnYJgwLfk7M6eC9JWyiWghHYSDgehSZFtbJ1zARSaqCSp?=
 =?us-ascii?Q?8ibAiKEVk77x6LOcFUiwN0VHRLCCz+3eVjksewud3gFaIxErSgGN5T8uN6Bm?=
 =?us-ascii?Q?6fkoS6P7T8yZDB5UuDmrsMEjV+0yBbunPQWMV84Kka/HlXfCcFuOdxqZTOm6?=
 =?us-ascii?Q?b7ZfCACKwA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9ddf64-7e2f-4500-9911-08de6d649181
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 14:06:23.8468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbC/QMtAAGE787++X8RHwULIgDJWjgiEgh358OBYbOmEFyw/hc+Sk0BJivB4Fe3nPgUOZB/jWdYC9hCWROROf7Bn9xCCxgzFc2dhxBzbXys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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
> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
> Sent: Monday, February 16, 2026 7:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
> Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
> <kam.nasim@intel.com>
> Subject: [PATCH v1 4/4] drm/xe/sysctrl: Add RAS error injection interface
>=20
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Add debugfs interface for RAS error injection testing.
> This allows validation of error detection and recovery paths.
>=20
> Command details:
> - Group ID: 0x02 (Diag group)
> - Command ID: 0xFC (error injection)
> - Usage: echo "0x01 0x02 0x03" > /sys/kernel/debug/dri/0/sc/ras_error_inj=
ect
>          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
>=20
How will user know whether error injection was successful ? if failure what=
 is the failure reason ?
Thanks,
Anshuman.
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 55 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_debugfs.h |  3 ++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ++
>  3 files changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index 28e46695c900..d6ffd8a8185f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -136,6 +136,38 @@ static ssize_t xe_sysctrl_cmd_write(struct
> xe_sysctrl_debugfs_entry *entry,
>  	return len;
>  }
>=20
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void
> +*data) {
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +
> +	seq_puts(m, "System Controller RAS Error Injection\n");
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	seq_printf(m, "Command: group=3D0x%02x cmd=3D0x%02x\n",
> +		   entry->group, entry->command);
> +	seq_printf(m, "Status: %d (%s)\n",
> +		   entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras block> <sub block> <Injection Type>
> [params]>\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject  # Check injection status\n");
> +
> +	return 0;
> +}
> +
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file,
> +						 const char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	struct seq_file *m =3D file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +
> +	return xe_sysctrl_cmd_write(entry, ubuf, len); }
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct
> +file *file) {
> +	return single_open(file, xe_sysctrl_ras_error_inject_show,
> +inode->i_private); }
> +
>  static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)  {
>  	struct xe_sysctrl_debugfs_entry *entry =3D m->private; @@ -186,6
> +218,15 @@ static const struct file_operations xe_sysctrl_loopback_fops =
=3D {
>  	.release =3D single_release,
>  };
>=20
> +static const struct file_operations xe_sysctrl_ras_error_inject_fops =3D=
 {
> +	.owner =3D THIS_MODULE,
> +	.open =3D xe_sysctrl_ras_error_inject_open,
> +	.read =3D seq_read,
> +	.write =3D xe_sysctrl_ras_error_inject_write,
> +	.llseek =3D seq_lseek,
> +	.release =3D single_release,
> +};
> +
>  static void xe_sysctrl_register_cmd(struct dentry *root,
>  				    struct xe_sysctrl_debugfs_entry *entry,
>  				    struct xe_sysctrl *sc,
> @@ -235,6 +276,17 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *=
sc,
> struct dentry *parent)
>  		.mode =3D 0644,
>  	};
>=20
> +	static const struct xe_sysctrl_cmd_desc ras_error_inject_desc =3D {
> +		.name =3D "ras_error_inject",
> +		.group =3D XE_SYSCTRL_GROUP_DIAG,
> +		.command =3D XE_SYSCTRL_RAS_ERROR_INJECT_CMD,
> +		.resp_len_type =3D XE_SYSCTRL_RESP_LEN_NONE,
> +		.fixed_resp_len =3D 0,
> +		.user_resp_len =3D 0,
> +		.fops =3D &xe_sysctrl_ras_error_inject_fops,
> +		.mode =3D 0644,
> +	};
> +
>  	root =3D debugfs_create_dir("sc", parent);
>  	if (IS_ERR(root))
>  		return;
> @@ -246,4 +298,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *s=
c,
> struct dentry *parent)
>=20
>  	xe_sysctrl_register_cmd(root, &sc->debugfs.loopback_inv, sc,
>  				&loopback_inv_desc);
> +
> +	xe_sysctrl_register_cmd(root, &sc->debugfs.ras_error_inject, sc,
> +				&ras_error_inject_desc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> index 26bd8c62b916..374aa73b180a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> @@ -14,10 +14,13 @@ struct dentry;
>  struct xe_sysctrl;
>=20
>  #define XE_SYSCTRL_GROUP_CORE		0xFF
> +#define XE_SYSCTRL_GROUP_DIAG		0x02
>=20
>  #define XE_SYSCTRL_LOOPBACK_CMD		0x01
>  #define XE_SYSCTRL_LOOPBACK_INV_CMD	0x03
>=20
> +#define XE_SYSCTRL_RAS_ERROR_INJECT_CMD	0xFC
> +
>  struct xe_sysctrl_cmd_desc {
>  	/** @name: Command name for debugfs file */
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 30d8b34dee47..46e68ea3a32f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -91,6 +91,9 @@ struct xe_sysctrl {
>=20
>  		/** @loopback_inv: Loopback test entry (inverted) */
>  		struct xe_sysctrl_debugfs_entry loopback_inv;
> +
> +		/** @ras_error_inject: RAS error injection entry */
> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>  	} debugfs;
>  };
>=20
> --
> 2.43.0

