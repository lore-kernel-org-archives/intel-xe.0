Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F34E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1370610E824;
	Tue, 10 Dec 2024 08:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxehgBha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AD010E824;
 Tue, 10 Dec 2024 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733819948; x=1765355948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ra9sW7W5U904ijNm2wQvb0Ib+RvS/NUKYCW7qMSMIAs=;
 b=bxehgBhaItjRZZNMbCiItvCInRjWXjRZFYtuf5ELiYRYTJvEphuDs6F8
 vYf85KCqYU7S8/SR+QPcNFEKd0MjvANu9/KCliCIfP2tHrKU4BK7zqT2q
 pBN0cjos4ltwrwA0HbSDJyNSU9S00xsYb4xFuFvyKOlW1dRwoax4xhbHz
 0sMn1GDbR8N7uJ8oXBqEctGPDYoGW/tgfs0woHCShmhpY02jiKMsKRCPb
 N1nZBxupYDgWlRfvf1+t+XNzlq85uOxhPvirRjNiTau2cTIQGRFsguyMS
 Q6PbdGdrJSTm+wk7yRM3FLKgq6qeezaSx44JKhGXeqwe6G31yxejkmWI1 Q==;
X-CSE-ConnectionGUID: 6Sv0vk+YTsm/v02rRRRs0Q==
X-CSE-MsgGUID: U5+t7sjKTK6qMtDu281GQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34286194"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34286194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 00:39:08 -0800
X-CSE-ConnectionGUID: mcoAEBLnQyqOyBxD/t2Pyg==
X-CSE-MsgGUID: FyB/uLdYRrmUhVQ6yCQJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100378526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 00:39:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 00:39:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 00:39:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 00:39:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxrzataQyb+ZKyf321DMq/qaycc4QWbUjOJ13cKssky4m4IlOgF3chouGo2C/HlfvVD9GFA2M/3QkQWufGKqCvNu0hN6lXKSVQzBH59qi+5cIHlCyg1mILVDKyQ41M7j1jOCP+OPd6qRiHeBjKDhPuBs+CCWJTbWAH0VdEpgUpgRqHahadlto8wNaJ2hCl2+Aj+MzGySs7MG4o4pS74zeEjID58aXT+nysufZNiQE5UliBF8SU8hurDaDqFTk/TahEP8PvlJExrj2t+zlYPer8g5az1pOCIZ+Ss94Ut/LRkHpqKiryvN07o0oxa4b4ZK0AeWpGCPEZE81EBA593new==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t86qzuifkMMwMKfkF3VMcjViYVpdgRs1CL1Qi0q7O5g=;
 b=HBwcNjRUfmR1kUBI6MPf0JmKfyBkvqHrn0EkozCNI10we6Bs0F93CfX47rICW5XUoAyDELztJG0vM0gYVfXDL35MbITUo1XJRWgROMWi3hK8r1Ef8bvbni5aE3ea2NxTor3CRlXFvTcwD6wy6bdzUOegGlOSyi1a2zwnfo3EKiQUGrt3hzRpm3vToYzNsA98NP+/ImHh0FYdaOp+Vb3y9xQCrEf0m2/WkYxJyLx1AgC3AUxId03YWJnY8ofy1E3vralogGSQc9lkriZqCkFe2QJJnO56wvPl5+sC876mrUX3PmbqJM5pbP+MG8GYPl4KLvfd2/Cm6B947Ju4rjvlLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 08:39:04 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 08:39:04 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Maslak,
 Jan" <jan.maslak@intel.com>
Subject: RE: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Thread-Topic: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Thread-Index: AQHbShe8cI5ICXNyREu5L3nHcfY9wbLeSoaAgAAV3QCAAMiTAA==
Date: Tue, 10 Dec 2024 08:39:04 +0000
Message-ID: <SJ1PR11MB6204B0BAE50616FBD2690FFB813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
 <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
 <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB4904:EE_
x-ms-office365-filtering-correlation-id: 7734d273-af92-4582-69d3-08dd18f61a73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3INbth7P0qf9rYC9ejjeJLPLYowzjVZwJAs/CcVhMhzZSsjdvxaGbr2m2czs?=
 =?us-ascii?Q?o1zZSqVTYkujN2IMC1NyIc0w4g1Bt2TM2+BSLJq9D93BldciozFLWImth01I?=
 =?us-ascii?Q?mOuFQddANyUeIMLPmFUJYMQZlC3HufdMIYIeNF3XUEQ1PPpHM5hbGJty8Adk?=
 =?us-ascii?Q?i8PwcW+NBwDFP5I5QxzY1tTBnOxw9/xOir3EI1jbSICEnnNivfXwPpj7+vMp?=
 =?us-ascii?Q?NKb0DevCVdrf/wtxkXYk9PhrcXd6aHnCY/0RiCax5jIEqNEHYjZRVRGIjmqH?=
 =?us-ascii?Q?4qE3g3EmvtdLw9XpbQ8GMNtZTFe/YKu/ucmhz94e4mcbrebrO8jFlfnukwr+?=
 =?us-ascii?Q?3LuFEteWwLYdW2hq+Ed1WSukv9IY+T23FOyAyEkYYCDwATYZYI4Fn4nXIcNY?=
 =?us-ascii?Q?pR4WR8RUOapfzOA8vUnj2uWuNU9rJuPT3kilrU0oEwsZL7BY4QsRvWEwyrhe?=
 =?us-ascii?Q?V0mgt5aFX73mpANM3+Dx1bJJ4AtHGuLmAftX7g8Iki4Z2LH3t0cnjvgTSyFT?=
 =?us-ascii?Q?y5K+B+mzWEuOvgaQd1vlSlCoQpDJkurz30nCjghgO/2c/Jhkd44Ndv4uxDGl?=
 =?us-ascii?Q?uY2NjJf9Lbvpuv5Dwh8WcZsUaV+CMbxps8wJsn3LKJPLU2aVt3T75Dl4lou5?=
 =?us-ascii?Q?o3VuG7mESJFfpI3awmh2be8z59AHJVSp63mA1sqk91YZuVh0XaU+2WA3ZPM7?=
 =?us-ascii?Q?tKTH/NVjjqyUxs9hXnqxUYfepwQNA02/BpFSH0JXdDE3U05hXPk9C8AVeYjD?=
 =?us-ascii?Q?faknHHV1Z/d9ZkhqRrbt1h1EqV/lUWJAwl3Vdu5SixLRcVkpr3IQ3fRFLR53?=
 =?us-ascii?Q?3Mc3OoBAhDG+T5ocUd7hH15K5kbvtc+eJL2aHTeBffs+imypLhZ+jQ89iwxf?=
 =?us-ascii?Q?i9JzBFscezm0R5Y0j8XwD6iVsN8qv+NPaFrFLd44xJybY2aNjkUny1UA18z+?=
 =?us-ascii?Q?shS2srF3svkAOQcSw0uzexF9R+nHOex3Cq6c+w18FyizipuC9cS91UUhnOdg?=
 =?us-ascii?Q?dK3yzSgQ0rYJ/EwwaOUXP+LimvzaEr4XJqyfOFARiVc1kQ90qiWeLoKiCJkv?=
 =?us-ascii?Q?dVHB+k6fxdk07PISvKpuRI0nzpx8PUnFBMvn1XMO5iJ0ZwDIOv6DopURqHzj?=
 =?us-ascii?Q?7JOvEFC3s953GowSWThOSF3hc7X25aYs5iwpJXR9MAWDffn1tuZaQv+s7HD2?=
 =?us-ascii?Q?W3NfOnj6ZX0LdYN0DdqrLbEn0MbgBxbklhHCGis8T9/D2c2P7MyExD0Z2yx+?=
 =?us-ascii?Q?Yd9H9E3x0uI9KqkB+twrpiJNVowFuvwV8PQxecxC4zpKSA9wUgSCC0Oha23z?=
 =?us-ascii?Q?QmQh6pt7e8Rv0mIlo/zhZBWs44i43fxajHInNt/Pzwq0LXdY+H//tw3KCNRT?=
 =?us-ascii?Q?AKfAzM4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f2CFNZC5oW/2yWxAQjRyc6yghdXQXlFAGiXpbPjYOvjYn/lKfhi29iQeYzjh?=
 =?us-ascii?Q?JARhePQv9K0RumyDzmFEfLzzZ4vJutfLCOa7fVxsp4OpWgLuWCb7YZvGjEP+?=
 =?us-ascii?Q?9TlLynZuzUWnRt3TJYAbmwJyLI3B5TwNKPLAItLneUiWuPjznKEEd/Na/rzK?=
 =?us-ascii?Q?r4If/JLBN8FvqukgeZWDZuG5RomZL1jMb1DSLaapRI4VzhphpbfpTMsfcZvy?=
 =?us-ascii?Q?B3uAuTT7Cer+JW9SWAKaxpzNX+PxY7ih/Q4wl9Yr32xgY40UbM+VmNYF4IfA?=
 =?us-ascii?Q?J3V7QMNTLF1P9UE7uu9C+Vdjn/ugQ2x3q1MYQZui8VJdHD/9q9oUyzrSVL+J?=
 =?us-ascii?Q?RxsLyTmZ/RHlmrygMgzTcoaNo14WHos5M0b0GKJRaBs7j3opzJJzJ1bBpKGe?=
 =?us-ascii?Q?mUmVVrfVZf8RRO4DEuQHcEE7yRMeqSqwTcmvYkrX764zrpRxopK7cs12c79S?=
 =?us-ascii?Q?kNUTGvb38Km+wJ5ZuDenssL3f6p9W1mMLrpLP50NheYBSX6Qs6ySgKEEEPsx?=
 =?us-ascii?Q?JwAPL5xcFP+mcAg4se8esVf6R/OBjr/DSYSk6iXqcUWcstEV9qSWCGjZYRnU?=
 =?us-ascii?Q?eLkIhUu/NH1Y4Tq9XI5jn7SbjzPvZfl7qtyI9T83/26wPRpf8vQwdWzPpdIz?=
 =?us-ascii?Q?54DB0yv0GewUFUxGlNOcrV2vuKtHsjOd2aeoNq5KIqZnw98Ky2QmzJsFZD1G?=
 =?us-ascii?Q?L7d7LsIoM8XxfD34uWaQ4qMK3DBm3CNbLHdRAj7qniqHWQWNyNvkOAhEYXPI?=
 =?us-ascii?Q?jvKY7+5vCzjJlV+ujQYwVW+OnSiTehwKH2GbW0L8+DgbYaAaEr9GhwI1XpIf?=
 =?us-ascii?Q?ZnjhQ7Pxh0nCa06ljNqeUBO0tex7lbQHcEg6nB6NQxkDPBh/TbEqSeJu/93O?=
 =?us-ascii?Q?RLhqpcd8b7vNO9eIbPnQbBlrhJQzoYTYQ7BhmK4kllzUU+a45AbzRzde+r3t?=
 =?us-ascii?Q?EZLxJF5ZvQ0JxRSOAz0p9LveFChuAY4U+rGE6m7Ylaee4cqnQt0wUyCryMIP?=
 =?us-ascii?Q?QUKGpedZslipxJgAor4T1uwzU6jPQ2B01NyLPuMso6qeYk8dD1XRk/gbsC1f?=
 =?us-ascii?Q?X4vo6Pijx30ywXVWvgZMKutsdYKhvl7M0RhigeOrDR2zUKLKDZJKsyy8FXT7?=
 =?us-ascii?Q?4Ywo47IhgjV+V6rZeOk/6mSjdFZVJJRxftFRftXC4mFdJrL9EfC5g5AGcUOV?=
 =?us-ascii?Q?SKTGQv37ngV+xK907DAsIj0kaHpWoh/Y8mBJIZZG+gn23liVEU+RLChCjY5h?=
 =?us-ascii?Q?Mjm3rB+hmXRP76HLgpxwpDlMYIHk4kLez36sXedw5xWEZf/gM/N/jyz6Whmw?=
 =?us-ascii?Q?VsHCd95bY/htziysF/pN4kyNQ7Kz8UlzqDQICFy/x6YM4aHHivvs7I2JTrA4?=
 =?us-ascii?Q?9zmIktoMgE8GmYIhPZ+9DpxsvUo9BEiyHKInzJTtDWusMqHxgQcUKIVvv/6K?=
 =?us-ascii?Q?A19Kn/ksqOi6PFwwgwQnMfEoJ/9BUuXzZxCMs7sT9GJtDVfEjpUkx/1YBCpR?=
 =?us-ascii?Q?xm/MzFLYwXkGM9wNaocDj5YocpUuLgX67ixwUBUP5MD+6aj2rP8Ba+Wm5JLa?=
 =?us-ascii?Q?gCXIvvybaZwgdWKy/T4MRDcEq4rX5Uv1K8gJ+L3w?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7734d273-af92-4582-69d3-08dd18f61a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 08:39:04.0828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SroF+g3hVSmjiSR258Mug7PTgfGnzWlklvds7Z7MLZhXwfjiB+TRpA1b9UvryOwkwETSiqRwhN6iFK8AeeNxolE5sx9GzC1uM+ROB+P7Lrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4904
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, December 10, 2024 2:08 AM
> To: Harrison, John C <john.c.harrison@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Maslak, Jan
> <jan.maslak@intel.com>
> Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
>=20
> On Mon, Dec 09, 2024 at 11:20:07AM -0800, John Harrison wrote:
> > On 12/9/2024 00:57, Tejas Upadhyay wrote:
> > > There are hardware platforms which are not supporting hwconfig
> > > table, for example ADLS. Querying hwconfig on unsupported platforms
> > > leads to assert and failure for some of tests like,
> > > ./build/tests/xe_module_load --r load
> > The module reload test should not be querying the hwconfig table?!
>=20
> See the Fixes: line; that patch made it so that anything calling
> xe_device_get() will fetch and cache the hwconfig (and assert if it's
> missing).  xe_module load calls __drm_open_driver ->
> __drm_open_driver_another -> xe_device_get so it does indeed fetch the
> hwconfig table now and hit the assertion added by that patch.
>=20
> I don't know if always grabbing and caching the hwconfig was actually a
> good idea or not.  As we've seen here, the hwconfig may legitimately be
> NULL, so as we remove the assertion here, we still need to do
> NULL-checks at the point the hwconfig gets used to truly be safe.
>=20
> >
> > But the hwconfig test itself should be failing on platforms which do no=
t
> > have a table. That is intentional. There is no platform which is POR fo=
r the
> > Xe driver which does not support hwconfig tables. So the test is suppos=
ed
> to
> > fail if it ever does not get a valid table.
>=20
> The Xe driver is only officially supported on the Xe2 platforms and
> beyond, but it can still load and run on some pre-Xe2 platforms that
> people were using as development platforms; some of those don't support
> hwconfig.  And even though our CI setup is only trying to test a subset
> of those platforms that do contain hwconfig, note that our DG2 setups
> also have an ADL-S igpu that also gets probed during module load, and
> that's what leads to the CI failures that were reported here.
>=20
>=20
> Maybe XeKMD is mature enough now (and we have enough real platforms for
> testing now) that we could prune the list of platforms that Xe is
> willing to load on with unofficial support.  E.g., drop the unofficial
> support for TGL, RKL, and ADL-S since those platforms don't have
> hwconfig and I don't think any of our developers are still using them as
> development vehicles at this point.  That's probably a separate
> discussion from the patch at hand though.
>=20

We can go with this patch or skip hwconfig considerations for unsupported p=
latforms like KMD is doing, but in the end it will also need same kind of c=
hanges.

Or if we plan to remove pre-xe2 platforms completely from CI then no change=
 needed.=20

Tejas

>=20
> Matt
>=20
> >
> > John.
> >
> > >
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Jan Maslak <jan.maslak@intel.com>
> > > Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >   lib/xe/xe_query.c | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index f3731d9d3..8f0a5392c 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd,
> uint32_t *hwconfig_size)
> > >   	/* Perform the initial query to get the size */
> > >   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> 0);
> > > -	igt_assert_neq(query.size, 0);
> > > +	if (!query.size)
> > > +		return NULL;
> > >   	hwconfig =3D malloc(query.size);
> > >   	igt_assert(hwconfig);
> > > @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum
> intel_hwconfig attribute, uint32
> > >   	igt_assert(xe_dev);
> > >   	hwconfig =3D xe_dev->hwconfig;
> > > -	igt_assert(hwconfig);
> > > +	if (!hwconfig)
> > > +		return NULL;
> > >   	/* Extract the value from the hwconfig */
> > >   	pos =3D 0;
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
