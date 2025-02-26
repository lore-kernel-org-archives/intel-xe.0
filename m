Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E56C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 22:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB63810E2AA;
	Wed, 26 Feb 2025 22:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnAhA30t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E83810E2AA
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 22:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740607967; x=1772143967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lEmW2iLH8OqxAKMeOLUuDxSWvTBhtkc5aFsjQm8zj4Q=;
 b=jnAhA30tkzSi6GlAuxHeMyeuZLVh/OXn3zlpiSxiWxK4WbYiRCriYWal
 SjlLntUmpUjqGQfnJY/DaA3h8O1Nm7aVnTdGxmoQ8mpUp6wbseWfFJVhS
 T8c5z0OU2d1+94LbCLvB92XxwckHuAnt6l0F41ul7N/G/PQtvQ+XMvG3b
 YRQMhRDVV6J81PSBP30V7CBMZUR4uKgpCTxMfjxDxb11Yo77tmHsH0m1W
 sISe9vy8JWIB3lWxp05W8i4gJ97ytEkCre4LK7vrdkRB5TENk2zE/LBaZ
 zk1yiyTPQPkRURRPIVEEhFtfW/6/EBbiRswTB78Rz7/wSElufBIGJQn4I g==;
X-CSE-ConnectionGUID: IX1s4R8PQNi7la/TQ8123g==
X-CSE-MsgGUID: w4zrgyAtRQCdLu2TqSrcxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44305125"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44305125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:12:46 -0800
X-CSE-ConnectionGUID: ZaPhen0nS6WrZnYh7N6neQ==
X-CSE-MsgGUID: K9n+aSzYRGGHx2slxg73wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117749072"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:12:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Feb 2025 14:12:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 14:12:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 14:12:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+erFiE/jtH9oBdlqLCgh6q7psyJT+RdrYJbYegY1gZdF2eJ41WOjiDL0BZ0u0PuHeJpHuGksK27pFOOgGrXNydsvnqg11SZxr+jdOTqrQ0xiK7nLZb+j1qitWTxEPYiLvQEMrJCSW3R8Bn9KghVe7ALgjWV++m7PatqgSOt/DxPQnUCT+f84VbyPTWRAiQpQSqWl4+kew02WfDc0RamNtZSwbXcDZVpx7BKke2bT67PlhY6+rrRpm8kaapSA1OreiYaZxkfRxoznKND4iDkjJkqmN/sZEZqgEf01gAX9a29tUg0rQMc5yYyh4iny65ACtlTCNoqq8DpULsAYkzDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBCa3Hv88z5B3uGYo9oTxJm9tvYmZMzTCyR9KpM9iW4=;
 b=iht5nmj+RqYnBfkXAVKadPrLYuTMSlQBxbA0iIKFIxKrnmOAZnwop/aSGJWiVQUCZ1NGMxV/rDmwwOjrXuj26pSMQdAvUkx+qfJVTRQUWQoaTZUc3DPCm9imLw+hk0/XCmfa3WAUgjZaTH8XRPotgj759v/J/C0DJ9LYDaSYBB4if1jDno6nK57SVQ10RPyeSzt361sGDuTwcisGx/ZSvMusPRmc28PyKdajvtgWzkRrnLv21oY1M1uTu+S1mAnWPSvDSoU4DL0M49esAnRZ55rBYvdqF15C+XCD9IjXtLmr7+bw7EUF7qZOfPTVu8Z5E3o9ItLfZkTsCx/asDIiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by SA2PR11MB4812.namprd11.prod.outlook.com (2603:10b6:806:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 22:12:14 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 22:12:14 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Topic: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Thread-Index: AQHbfbwrj/uQWTd/80muAvF5Iv6UubNYqMsAgAGPlTA=
Date: Wed, 26 Feb 2025 22:12:14 +0000
Message-ID: <MN2PR11MB47288A74BEB2EA729C1A45A092C22@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-3-oak.zeng@intel.com>
 <Z74/7JpxfZf5LIQN@lstrano-desk.jf.intel.com>
In-Reply-To: <Z74/7JpxfZf5LIQN@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|SA2PR11MB4812:EE_
x-ms-office365-filtering-correlation-id: 24422957-6145-44ee-27ce-08dd56b29fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kNJj+3nz+HA0g7XQ6eHkLWhVTtjGyztJAVG9eY2f5M11AcgtTY5z6YctB2On?=
 =?us-ascii?Q?pD0GB1B+nFzVgy1OcN4MRPG5U2XizPGUp3ca4uOFqD/W9+sMMV7eVfolaK48?=
 =?us-ascii?Q?Zlm/gK5NHEwcQoDEYfWJpvXtyXvms7bZZ0tMUqOdSNregc9M53ld6neQkOKn?=
 =?us-ascii?Q?H6KSP/7JpOyMzYCBj95d+x/35uZVjgYWGD4SwyIGhMVbG5WC0y9apkyySziZ?=
 =?us-ascii?Q?OFolOtCn/RRBdaeF9ywPKhAY/+nrC0T3kzoMtqNTp+b7HA24F/qz0mqIFylh?=
 =?us-ascii?Q?vgLuV4bYBenlY4/oRGW+FrV5pbua9nqcDwlmST66JXHzXXeWhOWDNMhPCZrD?=
 =?us-ascii?Q?Dlhlm4Twca2/J3j+kVVjkyOjshgaP+4sO+DIyzIbR83ijbCbyeZUztMfSuaa?=
 =?us-ascii?Q?H+bZrgs4GZY2xMEpIPk8y8VhTUBrLQsBVeP5zirV/2+PRbJPHOmMmJADrfrB?=
 =?us-ascii?Q?C6rmV/ZZuDN/KX3fh+819afDt7VuYdu1WeDewHEuZYTWo7380StVvnwv0gtO?=
 =?us-ascii?Q?L0Yxrp4GzXyiUKcvfYA6KwJ+cxVAkcz7nJe4k/2NKl4LslueoXFaPSch6PHj?=
 =?us-ascii?Q?MuUG2oDlJ3gmIRkiLIv5BZnBxVWASofg56reBEXg33NkiQiLluVLwfvYIfkj?=
 =?us-ascii?Q?fLyIeds/qZMs6eZMhiKRSQZPhLte04BO39klXDTvMRPS1fg6KiThrcyczl4S?=
 =?us-ascii?Q?XmmtGCggM4cuZp76JbKB/zyPDpzgIGi/DtRYucJYpRLqF3e1U2B+kZe9WPcn?=
 =?us-ascii?Q?iffkJJNDYKgS1XMm55pboJaR5OCJgKW4IqJTP4UbnADrjQhfDAFCjiZCOMg0?=
 =?us-ascii?Q?kfU6qvf9bROuQHVoJNpGQ+f4Rkk9bb8XF9TN4RKBQj8VU8CbJ7nkYO0U+Sq8?=
 =?us-ascii?Q?hJtBeikz8gHjknnnCZGBD6LiyQM5JtZbsKJv2DR6TtfeKoy+9zPlMDZLz25L?=
 =?us-ascii?Q?zicwIDr1bIml8GelmVJOd/WpwWX3L0T1460WcPBJZCgR4G1vI6rdybDg8pJs?=
 =?us-ascii?Q?z9tuNQUSCRW+nNhsxZ+iHyZesyFhA6Amdq1MpiDPVOeybkrc525jckiYGZF1?=
 =?us-ascii?Q?tXEu2qpOCN4YyXRu6tzrPoLZ+Gni3vM1wGwSoHr0Mu1YTECAYnTIZsbpcwVv?=
 =?us-ascii?Q?QwkuF95TGWVEHftMSNSN4cKY8mHG/jjUvTX8oe7pjQGUAodRafvbVqRs+m04?=
 =?us-ascii?Q?DTLALSnRtKK6yhdwGSEQRJmdq9lIsjTilCewABND0o/8Anu3v0LSAGuNpEpx?=
 =?us-ascii?Q?JTFWupe45Dnj08d2bhQ3CUDUCUThjk5zJsQu5UjZjJmWpE3YfccNS11WN/vZ?=
 =?us-ascii?Q?KV7iULxY1VfQqqPE3tFRzJFlQkB4vn0S1SLgcFtwY/sO0Yt8Qv6/AV8afWYZ?=
 =?us-ascii?Q?Z1dTE0+tgJ9xpYnQw+6EnoaJvcoT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vhMjJgFuoT1780K1pRhhFCtVKDJ44xqWQD7hdxTZ1vZKoH7h67i/mawfm+G6?=
 =?us-ascii?Q?zHqG++u3bqvMnpAa+WmlHGQHesZw/3D4KgZHWrjChJMs/VUtk1fhGQCYqzlS?=
 =?us-ascii?Q?mZamLjCgBkzWApVGkrxWQX7PdxsXFe/UPWPWjTW0dGmU+E691+3OXKgI7QU4?=
 =?us-ascii?Q?cDPE9E/rAdyp61g/4kUsIcindHwAMncxBy4g1D9275xmEqqc7D45+hpnfr/3?=
 =?us-ascii?Q?kNiUNfrPf9Ur10fC4CQJp/OPt1KGqoSfmCRNpbWZ8EVb8n+EuNKeJoJRAWGW?=
 =?us-ascii?Q?W5VboxRNvoTCeRwkftxCvXz8O5HCEdPoKhgqPaUekRNFSA+Y26yMsmedNsRo?=
 =?us-ascii?Q?uEpLPPlXMU0Ue4EpHA0FtzOT9AUE52o4TDAYI/9YiNIsDEzrp6QDl1ibwbwl?=
 =?us-ascii?Q?56lezie0x1eM4XHKKc0lfQhzguvieHGAyAbncS8ofy+RH3Y1sdlI4rz9Vsds?=
 =?us-ascii?Q?6srwGEqHmv2+n2FfngLQw9qy9kGEdxFPow5d5sJQdskgfyfEY4siikZJKuve?=
 =?us-ascii?Q?we4um5iIBnkcCvtxrck3/Z3w8HP5CoE7SJLkmCJpo1Wwb3vuXBibn/TRiKMF?=
 =?us-ascii?Q?KwKB0zibqcCLUv37oQoczrrGco5YLG3/L2kryBteR6UkwsG6ViKNkKjxVEWt?=
 =?us-ascii?Q?0qFWO7K/FUrqSrTVESxW1SIWQ+ihis9gYVL7LVWhdh8xoJRasWoGirrxgtV1?=
 =?us-ascii?Q?AurAnnKbXNlL+8Nh6GZpapqpfN/mQERP8Dn/Z01XP0O99ZnIOLmBQzZKyNwc?=
 =?us-ascii?Q?7SSCvt5tDAxdQTPEKG7hbt9HqGIjTZdzQ0y2KddTrC+AeyKaByH2oj8JCYCy?=
 =?us-ascii?Q?C2tSegxKAlGb/poOih8ANrdB4yzCc923a7Bja57eRNyTvYHwX0pn4vlIW/F4?=
 =?us-ascii?Q?4TyA2eB3fkVEIduD1yeHOwc/dsE9YcWmB37UyEGkS8GJM7+GiEiUb7ZaQXgG?=
 =?us-ascii?Q?XYIooR0yTCk9E/brRbqlucN8JME/lkiUo6O1Rsw9ky6lQ3sQEOzdf4XK6PnI?=
 =?us-ascii?Q?8CT7hP3G8BXvFflRSzEvqCZ86ldL+dJbR7W7PA2kX4x+ZvYpeHxPTxNuFZP/?=
 =?us-ascii?Q?qeIXQeO1CpRdw0A78XAx6PoDS57MJl5lGIDOFvdlG+fSXHFDbyW9tAv2nXij?=
 =?us-ascii?Q?mSseKJN6xrAsj9c1AoobygDt6GOoJ89N5iLicHPzhuSaAEml99hjUXTOGgRv?=
 =?us-ascii?Q?85bJuSCiwq34mGpILwNxWRSIgb23AadVseIB4eS+Sj6+Gn8GEl2xFsmNKyj2?=
 =?us-ascii?Q?UjcPkNpQmdJcFWimnLO7gFJrCbv2YMaAqxLTWE4OTDlVshsLbP8u9TzcIVs2?=
 =?us-ascii?Q?2GuNXEFhwy21R7Cjk8MSSNsvrzjUs+fE96O5zAto8wZgsaT8Rb/GVtAiHFnC?=
 =?us-ascii?Q?wONH/wVT/FW5e2FJws/942ZcV50P8Fl43dguT0hjkCILCCNOxIyNIbX8Dn1K?=
 =?us-ascii?Q?EfQZ2fmPnY6ugIF9r6DFmBNg9ZXcvLe6fAiH2ZSNJRsJnG+TyU8fGuY2W0qX?=
 =?us-ascii?Q?8aGXZ1ZbmtpkEBCKanSXS5u89Pw8ZIWprvqCgAj4QE7Re+wRqUrciOZzxqXC?=
 =?us-ascii?Q?UX42xTaP0lYPY/bwZGA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24422957-6145-44ee-27ce-08dd56b29fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 22:12:14.0579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPIwfjQ1Wevqj8rYEY0VGmwUQelX3kjqxNpS2r8VhktB32M+7Fu9C5nAU5u4xT9DRTbWhxQ5PidvUOEB34U0Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4812
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: February 25, 2025 5:11 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org;
> Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> <jonathan.cavitt@intel.com>
> Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault
> mode for certain platform
>=20
> On Wed, Feb 12, 2025 at 09:23:31PM -0500, Oak Zeng wrote:
>=20
> I replied to the wrong versions... Please generate the patches with:
>=20
> git format-patch -v<n>
>=20
> Where <n> is the version number. This will help avoiding replying to
> the
> wrong patch.
>=20
> Copy / pasting my reply here...
>=20
> > Normally scratch page is not allowed when a vm is operate under
> page
> > fault mode, i.e., in the existing codes,
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> > and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual
> exclusive. The reason
> > is fault mode relies on recoverable page to work, while scratch page
> > can mute recoverable page fault.
> >
> > On xe2 and xe3, out of bound prefetch can cause page fault and
> further
> > system hang because xekmd can't resolve such page fault. SYCL and
> OCL
> > language runtime requires out of bound prefetch to be silently
> dropped
> > without causing any functional problem, thus the existing behavior
> > doesn't meet language runtime requirement.
> >
> > At the same time, HW prefetching can cause page fault interrupt.
> Due to
> > page fault interrupt overhead (i.e., need Guc and KMD involved to
> fix
> > the page fault), HW prefetching can be slowed by many orders of
> magnitude.
> >
> > Fix those problems by allowing scratch page under fault mode for
> xe2 and
> > xe3. With scratch page in place, HW prefetching could always hit
> scratch
> > page instead of causing interrupt.
> >
> > A side effect is, scratch page could hide application program error.
> > Application out of bound accesses are hided by scratch page
> mapping,
> > instead of get reported to user.
> >
>=20
> I'd include the IGT information in the cover letter, not the patch.
>=20
> > igt test: https://patchwork.freedesktop.org/series/144334/. Test
> result on
> > BMG:
> >
> > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > Using IGT_SRANDOM=3D1738684805 for randomisation
> > Opened device: /dev/dri/card0
> > Starting subtest: scratch-fault
> > Subtest scratch-fault: SUCCESS (0.080s)
> >
> > Without this series, the test result is:
> >
> > root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-
> public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> > IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> > Using IGT_SRANDOM=3D1738686046 for randomisation
> > Opened device: /dev/dri/card0
> > Starting subtest: scratch-fault
> > (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure
> function test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> > (xe_exec_fault_mode:5047) CRITICAL: Failed assertion:
> __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull,
> exec_queues[i % n_exec_queues], &timeout) =3D=3D 0
> > (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> > (xe_exec_fault_mode:5047) CRITICAL: error: -62 !=3D 0
> > Stack trace:
> >   #0 ../lib/igt_core.c:2266 __igt_fail_assert()
> >   #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
> >   #2 ../tests/intel/xe_exec_fault_mode.c:537
> __igt_unique____real_main407()
> >   #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
> >   #4 ../sysdeps/nptl/libc_start_call_main.h:74
> __libc_start_call_main()
> >   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> >   #6 [_start+0x2e]
> > Subtest scratch-fault failed.
> >
> > v2: Refine commit message (Thomas)
> >
> > v3: Move the scratch page flag check to after scratch page wa
> (Thomas)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> b/drivers/gpu/drm/xe/xe_vm.c
> > index 813d893d9b63..c2dfd0ade403 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1766,7 +1766,8 @@ int xe_vm_create_ioctl(struct drm_device
> *dev, void *data,
> >  		return -EINVAL;
> >
> >  	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> > -			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> > +			 args->flags &
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> > +			 !(NEEDS_SCRATCH(xe))))
>=20
> Same comment as patch #1, I'd drop this macro.
>=20
> Do we need a query uAPI so the UMD can test upon process open if
> the VM
> supports scratch page + faults?

Introducing a query API seems a little overkill to me.=20

Maybe I can add a little comment in the xe_drm.h, saying scratch and fault
Flags are normally mutual exclusive except on xe2/3?


Or should we just not restrict VM
> scratch page + faults ever and have it choose based on platform
> recommnedation?
>=20

I think having above checking/restriction is still helpful.

Oak

> Matt
>=20
> >  		return -EINVAL;
> >
> >  	if (XE_IOCTL_DBG(xe, !(args->flags &
> DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> > --
> > 2.26.3
> >
