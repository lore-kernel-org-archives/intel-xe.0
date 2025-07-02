Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5BC77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017CF10E6FF;
	Wed,  2 Jul 2025 13:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loFIWe/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0446110E71B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751462763; x=1782998763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZgWKQ3bzAyyzWmt7Vtl2DaWzEDVE1M7n6hNpFHVJAwA=;
 b=loFIWe/9z7qtgJKdYiUHCAuq7vuIYEnRwu8NMGWocadIKWt2PIYcffOr
 IyZ7rl7gFRBx3C3QanKRg5P2cdZ7Bx6vX8wqDvPHwm01JIUqAbMv7uHJS
 LfG95eG2P/jsGkRz8KSNL0B+FwNgLoYIUi1TGIGucGD5zMnmL2UNTGzkX
 pdNQRopm5wp/OP79c7mGaU4n1livSctZrTK555LbmiyrXqLvSZA9upT5S
 G63ouBgCSmxAgXWJiq35QSeqB0yF81jKvXg0iHlAYuDbSF2mQ8Y+3aAyX
 PRJdE65GRyg4BXw2MLTgI6elfl2JffkAZ4mke9Vgs+KmCFvfE9vcp8Ztp A==;
X-CSE-ConnectionGUID: 6UaO6+GvTvSf6nTzRXQ2Eg==
X-CSE-MsgGUID: +kyk2bUuSZivzICDKaFUpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53898422"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53898422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:26:03 -0700
X-CSE-ConnectionGUID: sCS0RgwET86P/lSM8/a77A==
X-CSE-MsgGUID: hRtsJFW2Qdy8k4vqzzArPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="191244213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:26:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:26:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 06:26:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvW3V5ANV00hN4HRBeDea9OIdii93ErXSkoOXMOBli0MM/q0XVjvquABUh5QUoMFnrF9dEsxxAb+LUG+BRvk8bSf0p+SvPRYFaL/k6zKf0MYHipoPxO4T6Pj1ueLCaeo55e5xAsUQ0i88hR+JeubyuqLDduVFoe4Pfm+5cnkMfe+koceNAGDkBh8c/rNZ+d9XjMhkmJ6OQTxOcF+H6uQNiSXVK0irqJaagL+tGYpnFYeERvSFKD8QQe4+Lo8G+/W0r9f1pnef/rWmpAicQz+W78rz6M6sliFVxIZ6WSzfWPWcszKhMglDMyS/Cjt5t6lKep8M/Y84BqMYYYlhw0KTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mo0hz2feiyUYPjiDzWWsw6TNznXsZaMvasSV8NvD7Xg=;
 b=GHGpNBrO670cFTCw7hh9rVJ6U8o8WbUWXupM7ZmV0b7118O3KbjUpvH0qp10ssaIPyLkgj/k0+a4fFFlh5S0S6dHZ372674B84Mjhw/HWe8Rrw2ibhijBq2iVzov7kUflFX+S4GwHSCA4AAAnEnD32HhF/DND8E3xa+BIQpJg3wGAP/qTVdiaKcOgCrjs6wZeRb5e6MVjunaMvLJDBVptH4zopYEUpJ5hGlDIFQq3v5jwS5HMmAAvSCBMtYXwMCnxoEhNWdoAMV9Ii0IHBAFuKmJBiqs3fx0g0W+CFPP1XCOsKWi5wwf5Ucq4zdmT8HYaKhC2SZhaYlpRjKYLzjLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN2PR11MB4581.namprd11.prod.outlook.com (2603:10b6:208:26c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:25:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 13:25:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk, Konstantin"
 <konstantin.sinyuk@intel.com>, "Avizrat, Yaron" <yaron.avizrat@intel.com>,
 "Haimovski, Moti" <moti.haimovski@intel.com>, "Freiman, Didi"
 <didi.freiman@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
Thread-Topic: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
Thread-Index: AQHb5SAF971fuL49FUC2U9VZVclW5LQe3msg
Date: Wed, 2 Jul 2025 13:25:17 +0000
Message-ID: <SJ1PR11MB620416C3A3736C7F9DCD070F8140A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250624155221.208338-1-ilia.levi@intel.com>
In-Reply-To: <20250624155221.208338-1-ilia.levi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN2PR11MB4581:EE_
x-ms-office365-filtering-correlation-id: 88ee69f3-f164-4b6b-e491-08ddb96be2ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Nsl9Fl5Bq6vz+6UC4s6NQ0OjVnCZw88ae8beUVRi5yK1I0I3T0zNu+Q72yf4?=
 =?us-ascii?Q?WaGx2dlGLQtBE7POP41KSOKin7BHDNXmahCoiUu6btR+t3O4NlEP9GoJzTF8?=
 =?us-ascii?Q?FN/s0logpapdWRQYUPYNyWZ7R9AKbuBjFEm1kBOfpHgvz243RyQyTKCiOnIS?=
 =?us-ascii?Q?FQfptCGyFvGHH9EYanT39bBBmW0zDLVWJT3H60k/U0PcD5sy1+gQ2IMYg67K?=
 =?us-ascii?Q?wJObt6bEONuh9Le4fJFDGBdTl75HwE7HpXGxD/DTg5AhZzQrX7orqMYzuBns?=
 =?us-ascii?Q?jIgcxQM0gF828/LcAafH+JcJXchXRqQZNHpnWKGLkbsNVBiJ2j/+o2sCAC7r?=
 =?us-ascii?Q?ziRKYZH8XS7RCMxnHjBi1pk/oQ+coidKt5MeYAbKkQX4fcMxes0WUX5i1Q/y?=
 =?us-ascii?Q?BO+EghyJLDjpskUFHQuQ4y2ki86gjGaexY3tvj9rXvhFrGuCPfZOY6+xh/ss?=
 =?us-ascii?Q?xCzkfcvpja5o4/n31LFWGmNu3q4hvjUbcD9gxHiAgeVSLOzIfP91ziLE+u1R?=
 =?us-ascii?Q?lVH7a0PVb7Szb8XQi9Nc/TneZMRxu/pfXsYhIMunWoV3gtLnHz+CG1D0lL6R?=
 =?us-ascii?Q?2QFyTocYlHsVOdhG8wH5vorJSq7+MTFBhA+62+d7MtoRDY49qANH/3ltobM+?=
 =?us-ascii?Q?maJfMlDFV3Ex7sqNbfvLH/tSBmmg/GIt/qzvJDPJBkuyMSfWuMqwUGYHN0Or?=
 =?us-ascii?Q?meLdlVIvaK0So5aIZgm303rZlreXYTpP1I97PTt02ybfUgnq1csHWepWh2xd?=
 =?us-ascii?Q?cb859CFXJlJN0QMhNW6t8n8AGdEW6kBadCPEFhf4bqmPed1OOUr/ZLJYKPx4?=
 =?us-ascii?Q?zUbcgqK9mJVNxd6aUA5BLFucSCARYMTDEcWMdsF+B+2rJ6LEiZL44hXFeEBK?=
 =?us-ascii?Q?f0NwEBQpi4j4QlSNXMmtObPOC2jOIx9lK9beuABF2GYDy2Pk+5o/NulMSPhS?=
 =?us-ascii?Q?AuvYQnh1CDCR+/KxQHS1UB63FI15S9byPq8CJnWzxFnTM2xCDjHoWnQiaWHE?=
 =?us-ascii?Q?k2FPWcbV4e9TqqdsloVVg7eQ9bccvkMcuKe46yz8C6I5VxbQ+WImWaM9XYLT?=
 =?us-ascii?Q?Loo5v0gKIAU2WK3OlgAhrLfun+8hG6+o5hsI2zG1ppFaSCD6p5mbyB2Gr1Ll?=
 =?us-ascii?Q?ZQR/CdSloOuWmS8OIrtMNSjxOUHpNVazpfdBukkV2RfzahcDXyLvxdBr5kN1?=
 =?us-ascii?Q?TpR7FHOVGrjYhuyoHNeBpB7/zTXZn00sV9UD6IKGm/pwON2+7kLdLcqB07GP?=
 =?us-ascii?Q?G3QpY9KPGUIF5tXBWA5Z6b0NZFjx83GrR/xDwk6j8N6c/AkBjIFlldm4DNfD?=
 =?us-ascii?Q?GmADCR+zrItS+FvBj+/52L8YdF6F8DmoljUcQPGjNzETlchKCXQwvFc3w2V7?=
 =?us-ascii?Q?2BH08uSbgCFcQMot3sbRh00SPjsQdaUvPRgD7md53llVkccBPpPdhSplQRuq?=
 =?us-ascii?Q?aH2REcOFoEFbW2dq8Vm2Rzt3KzLur0369JoEFdUYclz3Ep2XS5CCwNX+xm7K?=
 =?us-ascii?Q?HqZntN8HXGTg+Mo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XUgeS1SbPelpPmTpdEKchkd0cjahsRZ/3hZofYHSXLiYtPpjcd+uq1twSI//?=
 =?us-ascii?Q?jGtrbKdxd3jA26nXOOtQ3nnRhsmhF/WGlbrnvii7haejHKAIWkOy7j5ItiVf?=
 =?us-ascii?Q?mxscTb5XlswWUm8vAaYSFXFeX/LR2DuwLGSQAjx9PrERBFiUKPF+PqVwGXcy?=
 =?us-ascii?Q?LHj4y6nnqkjKuL3DaXTQK3QPah3PGXMibD0F9AA73LljCt7A23+YoDWOrp/C?=
 =?us-ascii?Q?Bm/D5KA35G6HtudS4WxO/w0PVzyGVDFan12GNYH8ZdKeX0O085anzwk6XaHj?=
 =?us-ascii?Q?9HK6tVTCZWhIMfsEUpRmVnWQt6k2W2QJ6eGDTYAWG5CZ9ENS2DGU4D/n6hZx?=
 =?us-ascii?Q?Fd2QsRVTxIxkmkM1Kp2vUecT3XlTkemAGGVMG5h8vUvZUUMosE/ICPhkIUz9?=
 =?us-ascii?Q?OtgnTQ5lCuZ2iOzL98S8cLRLqvIw2T3oNW558FhqzpjSu0487feVMI+ey71a?=
 =?us-ascii?Q?DIy6NTrXRJW2CEWoN+vmS0Ze7FmOSXAkhyabyFQz1tFhfzvO+VsbC0xx4QBJ?=
 =?us-ascii?Q?PwDlcaWndiId/kYOZCwjpeM7hshHjuNuoYRA2aYdG+UV450/BBGBMXpAtGXf?=
 =?us-ascii?Q?/e7bwHpse/J5ZbIAE5+FCRsqOc+DChEj9yyphGikHhX2vLL7YwLeOwjz99cL?=
 =?us-ascii?Q?ChWfkdZF6L7G4Fw/AlURgPp2IivY3VuSyr+8/CHaUa9lMFEly122hjl3fA1U?=
 =?us-ascii?Q?sGaoFjA9YLh9P+zN76ZXVmNycWByBWoBFiaca26u4hm1Accew3lxqBThEayA?=
 =?us-ascii?Q?dvE+963OC9htZNsizV7Bawxqwf7X7gAOnBZ+3tuZlUGl1QU3mbvb9YZyFMCO?=
 =?us-ascii?Q?w23p3g5X5aueYgbPkqkibQ9GJEkyoHp1g3ZcbWY1AXxcEZm/XoTl5SSAZfU7?=
 =?us-ascii?Q?Gtk2bjeLhesQdQjZyo+TVBxFuoedQQezssBaWsZ9rSFuK1hGJYmGFiZlPlxn?=
 =?us-ascii?Q?JGmB16/RxYPDZxZW4rZFXISNMYZNEwlvjXM44p0J/qRI2a/jSZXtNf78igZg?=
 =?us-ascii?Q?pJAQImwjzmrAH3LRhqUXaWW4wl9R0imQOBASkcE1Vm6rA9ul+3bd6b0ViawE?=
 =?us-ascii?Q?lhk2UCEDKnbNUO25YwLNvxG+2ivUzzGJ7OZw2uaqw1m2SLWgwjy3mYLfyIGd?=
 =?us-ascii?Q?V1Mp+sAydhgb2MD6GnjDjT8cvp2eqKVBnULiLyWGzV8AipT/VaggJMRNIkaN?=
 =?us-ascii?Q?2eQhuTeSUoc0gWS/r+s3T+y9rgpsaioh7N/75a56le88mIwu7RmZ8voXx9I2?=
 =?us-ascii?Q?04rCR3aGxat+XiKeg9nnZp7ySVxsE4pXxTPbQKw1FT4aiEMa4vvEdKlPeyZP?=
 =?us-ascii?Q?kEqzMxsfcKRVr3uMCLmxIto9D49LJY9Woa0T6zkZpcmfBfmCwvPW1A69XS6T?=
 =?us-ascii?Q?8i0wtswLG7e9tjMJiAkqiq7MKQ8mifaFMEhfY+cssaN0SfQjpZSheJ0vMqK2?=
 =?us-ascii?Q?YhKbjbgZWoiM7x7zBTOU5p/u9xuJRmYpyXg1uCm4Ke6HnJ8feYimrgsC3Ch2?=
 =?us-ascii?Q?RCSGvi/Ipd8Ds4Z0m1EOgttPLAVA5sKwkPCJaso2gEUyT237LIIkJZsCIbGp?=
 =?us-ascii?Q?SdV+5mk0VZMDsj4zqrYK4dq8L/85bmEOA0863fK5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ee69f3-f164-4b6b-e491-08ddb96be2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 13:25:17.1676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AQfg37WCP/hDhNIAR+sD4NxlB0WStHrQ7xuyvAdRlPNyAAaAW9h4mgvQ4RsPLyfs2pER7j0d8SsO9xf3+qzBgBJWLmxzvYgzPO/RsdYT4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4581
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
> From: Levi, Ilia <ilia.levi@intel.com>
> Sent: 24 June 2025 21:22
> To: intel-xe@lists.freedesktop.org
> Cc: Levi, Ilia <ilia.levi@intel.com>; Elbaz, Koby <koby.elbaz@intel.com>;=
 Sinyuk,
> Konstantin <konstantin.sinyuk@intel.com>; Avizrat, Yaron
> <yaron.avizrat@intel.com>; Haimovski, Moti <moti.haimovski@intel.com>;
> Freiman, Didi <didi.freiman@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Auld, Matthew <matthew.auld@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
>=20
> Allow the driver to expose hardware register spaces to userspace through
> GEM objects with fake mmap offsets. This can be useful for userspace-
> firmware communication, debugging, etc.
>=20
> v2: Minor doc fix (CI)
> v3: Enforce MAP_SHARED (Tejas)
>     Add fault handler with dummy page (Tejas, Matt Auld)
>     Store physical address instead of xe_mmio in the GEM object (MattB)
>=20
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  14 ++
>  drivers/gpu/drm/xe/xe_mmio.c         | 210
> +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.h         |   4 +
>  3 files changed, 228 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..22a567c5f0de 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,6 +10,7 @@
>=20
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_device.h>
>=20
> @@ -162,6 +163,19 @@ struct xe_mmio {
>  	u32 adj_offset;
>  };
>=20
> +/**
> + * struct xe_mmio_gem - GEM wrapper for xe_mmio
> + *
> + * A GEM object for exposing xe_mmio instance to userspace via mmap.
> + */
> +struct xe_mmio_gem {
> +	/** @base: GEM object base */
> +	struct drm_gem_object base;
> +
> +	/** @phys_addr: The physical address of the exposed MMIO region */
> +	phys_addr_t phys_addr;
> +};
> +
>  /**
>   * struct xe_tile - hardware tile structure
>   *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..3298ab0f1fb4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -10,6 +10,7 @@
>  #include <linux/minmax.h>
>  #include <linux/pci.h>
>=20
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>=20
> @@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio,
> struct xe_reg reg, u32 mask, u32 va  {
>  	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val,
> atomic, false);  }
> +
> +/**
> + * DOC: Exposing MMIO regions to userspace
> + *
> + * In certain cases, the driver may allow userspace to mmap a portion of=
 the
> hardware registers.
> + *
> + * This can be done as follows:
> + * 1. Define an xe_mmio instance that represents this portion.
> + * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able
> fake offset.
> + * 3. Use drm_vma_node_offset_addr() on the created GEM object to
> retrieve the fake offset.
> + * 4. Provide the fake offset to userspace.
> + * 5. Userspace can call mmap with the fake offset. The length provided =
to
> mmap
> + *    must match the size of the xe_mmio instance.
> + * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to
> release the GEM object.
> + *
> + * Limitations: The exposed xe_mmio must be page-aligned with regards to=
 its
> BAR offset and size.
> + *
> + * WARNING: Exposing MMIO regions to userspace can have security and
> stability implications.
> + * Make sure not to expose any sensitive registers.
> + */
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *); static int
> +xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
> +
> +static const struct vm_operations_struct vm_ops =3D {
> +	.open =3D drm_gem_vm_open,
> +	.close =3D drm_gem_vm_close,
> +	.fault =3D xe_mmio_gem_vm_fault,
> +};
> +
> +static const struct drm_gem_object_funcs xe_mmio_gem_funcs =3D {
> +	.free =3D xe_mmio_gem_free,
> +	.mmap =3D xe_mmio_gem_mmap,
> +	.vm_ops =3D &vm_ops,
> +};
> +
> +static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object
> +*obj) {
> +	return container_of(obj, struct xe_mmio_gem, base); }
> +
> +static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio) {
> +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
> +
> +	/*
> +	 * All MMIO instances are currently on PCI BAR 0, so we can do the
> trick below.
> +	 * In the future we may want to store the physical address in struct
> xe_mmio.
> +	 */
> +	return pci_resource_start(to_pci_dev(xe->drm.dev),
> GTTMMADR_BAR) +
> +		(uintptr_t)(mmio->regs - xe->mmio.regs); }

Can you please elaborate which physical addresses mapped here!

> +
> +/**
> + * xe_mmio_gem_create - Expose an MMIO region to userspace
> + * @mmio: xe_mmio instance
> + * @file: DRM file descriptor
> + *
> + * This function creates a GEM object with an mmap-able fake offset
> +that wraps
> + * the provided xe_mmio instance.
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +struct xe_mmio_gem *
> +xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file) {
> +	struct xe_device *xe =3D tile_to_xe(mmio->tile);
> +	size_t size =3D mmio->regs_size;
> +	struct xe_mmio_gem *obj;
> +	struct drm_gem_object *base;
> +	phys_addr_t phys_addr =3D xe_mmio_phys_addr(mmio);
> +	int err;
> +
> +	if ((phys_addr % PAGE_SIZE !=3D 0) || (size % PAGE_SIZE !=3D 0))
> +		return ERR_PTR(-EINVAL);
> +
> +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	base =3D &obj->base;
> +	base->funcs =3D &xe_mmio_gem_funcs;
> +	obj->phys_addr =3D phys_addr;
> +
> +	drm_gem_private_object_init(&xe->drm, base, size);
> +
> +	err =3D drm_gem_create_mmap_offset(base);
> +	if (err)
> +		goto free_gem;
> +
> +	err =3D drm_vma_node_allow(&base->vma_node, file);
> +	if (err)
> +		goto free_gem;
> +
> +	return obj;
> +
> +free_gem:
> +	xe_mmio_gem_free(base);
> +	return ERR_PTR(err);
> +}
> +
> +static void xe_mmio_gem_free(struct drm_gem_object *base) {
> +	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> +

We can release fake offset here!

Tejas
> +	drm_gem_object_release(base);
> +	kfree(obj);
> +}
> +
> +/**
> + * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
> + * @gem: the GEM object to destroy
> + *
> + * This function releases resources associated with the GEM object
> +created by
> + * xe_mmio_gem_create().
> + *
> + * See: "Exposing MMIO regions to userspace"
> + */
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem) {
> +	xe_mmio_gem_free(&gem->base);
> +}
> +
> +static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct
> +vm_area_struct *vma) {
> +	if (vma->vm_end - vma->vm_start !=3D base->size)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & VM_SHARED) =3D=3D 0)
> +		return -EINVAL;
> +
> +	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
> +	vma->vm_pgoff =3D 0;
> +	vma->vm_page_prot =3D pgprot_noncached(vm_get_page_prot(vma-
> >vm_flags));
> +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND |
> VM_DONTDUMP |
> +		     VM_DONTCOPY | VM_NORESERVE);
> +
> +	/* Defer actual mapping to the fault handler. */
> +	return 0;
> +}
> +
> +static void xe_mmio_gem_release_dummy_page(struct drm_device *dev,
> void
> +*res) {
> +	__free_page((struct page *)res);
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct
> vm_area_struct
> +*vma) {
> +	struct drm_gem_object *base =3D vma->vm_private_data;
> +	struct drm_device *dev =3D base->dev;
> +	vm_fault_t ret =3D VM_FAULT_NOPAGE;
> +	struct page *page;
> +	unsigned long pfn;
> +	unsigned long i;
> +
> +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!page)
> +		return VM_FAULT_OOM;
> +
> +	if (drmm_add_action_or_reset(dev,
> xe_mmio_gem_release_dummy_page, page))
> +		return VM_FAULT_OOM;
> +
> +	pfn =3D page_to_pfn(page);
> +
> +	/* Map the entire VMA to the same dummy page */
> +	for (i =3D 0; i < base->size; i +=3D PAGE_SIZE) {
> +		unsigned long addr =3D vma->vm_start + i;
> +
> +		ret =3D vmf_insert_pfn(vma, addr, pfn);
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf) {
> +	struct vm_area_struct *vma =3D vmf->vma;
> +	struct drm_gem_object *base =3D vma->vm_private_data;
> +	struct xe_mmio_gem *obj =3D to_xe_mmio_gem(base);
> +	struct drm_device *dev =3D base->dev;
> +	vm_fault_t ret =3D VM_FAULT_NOPAGE;
> +	unsigned long i;
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx)) {
> +		/*
> +		 * Provide a dummy page to avoid SIGBUS for events such as
> hot-unplug.
> +		 * This gives the userspace the option to recover instead of
> crashing.
> +		 * It is assumed the userspace will receive the notification via
> some
> +		 * other channel (e.g. drm uevent).
> +		 */
> +		return xe_mmio_gem_vm_fault_dummy_page(vma);
> +	}
> +
> +	for (i =3D 0; i < base->size; i +=3D PAGE_SIZE) {
> +		unsigned long addr =3D vma->vm_start + i;
> +		unsigned long phys_addr =3D obj->phys_addr + i;
> +
> +		ret =3D vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
> +		if (ret & VM_FAULT_ERROR)
> +			break;
> +	}
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index c151ba569003..2990bbcef24d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -8,6 +8,7 @@
>=20
>  #include "xe_gt_types.h"
>=20
> +struct drm_file;
>  struct xe_device;
>  struct xe_reg;
>=20
> @@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct
> xe_device *xe)
>  	return &xe->tiles[0].mmio;
>  }
>=20
> +struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct
> +drm_file *file); void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> +
>  #endif
> --
> 2.43.0

