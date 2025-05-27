Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471A1C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 11:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF410E466;
	Tue, 27 May 2025 11:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6Ukc0sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8EB10E466
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347000; x=1779883000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CQP/4PoyV7i3ZG0P7ZC8sE2prvuJ8Ric0GWy9Jp+upg=;
 b=L6Ukc0sgPGOfUvHEBFo+5BVZhoAobB13OcsxsNCvfvBbRkowQKdjILmu
 j7ja59hPiHTr+LWdHOQ0N05ReB8ZMnUbVCgd9tIZKaqxU4ZwEfBdmHuud
 1v2W+LmEbuPNTM7WGQagoPTTCWAeTInSp99f2AlwsrXE/JmTb7Lx1C31v
 GR4q2Je9C46K6sIqF7TtPLO9O+aKR/zWfAFhQYpDqaEKaIkcjK57Q1EY8
 IkAUKHfZaI3pfP8Jei5co5kLFKcsabSV/tDK43Dwka/xAp2M6WTuk2CuD
 /2MLUrZtZdhBQY1fOda/J1qpI/gSIUDM+3sDYyFanh/zgsH56MqLRbwKl Q==;
X-CSE-ConnectionGUID: fk+FxKOhSN+R8ufMwUyLjw==
X-CSE-MsgGUID: I0P4DU0ATuuGeQkOav3DLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60992891"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="60992891"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 04:56:40 -0700
X-CSE-ConnectionGUID: UiUEYURWRjixQE1/MRXBAA==
X-CSE-MsgGUID: CdCdP7G6TKKPw4EwOdEwmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143754519"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 04:56:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 04:56:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 04:56:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.46)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 04:56:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qban7gmasHX21ELiZGc/KevtBtTwU43eSPl2RFhpA80HVQPREt4NWFoQXuQH4sug7e0jw9RGD3r1LN4V7vBPVuwZQqUn8eTt7FA3AMlakxg3Wu7CabROEWESE1d0UvW3JiIZOnhTzLeUwl7o4ARYF645kAvHJcaSVQaAgn1l0W+B4Qk/lhEpekM0dTAbIzT1Z3Atj8ZYUK2lbiC7XCph1NAIzhjohjzcpKDIjH8OrfK7AnhY0l5JR5s4YkqYE1ia0x1oiWomAUNtdegyYiCYVLEiyvM+1PR4cFdH6uwXuiQDjmPNWgDWrh7n+v5FeLiDeLZXUGU0NopLy1oW2EopWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2l7vpaKjx6yOxyDBqRGngcl7LHQQNsqlMKtzuQdOeI=;
 b=SrblehmbPD9mW7JWtKpCP+2IQWpB4uCvSbdr/He3R/OykFoApIjKhh3eV/zUPAfNdv68h5YsWcAH6N0vzAADPl3ndOJv8loMQIgIXU4KW+PtM/ceGmEvJyQqLL5au/gnb/BfgBA2MqYf2Nfz5+AM8KiEd2U9wHGQC/xFoS0gE2MPYxGRbrxnuuEKAqrhxhKbB9eGW2wUtHnuDDJgKcq1XxiqaMkRX1rhcezVnR84Q0O/SHoOZPq55SDsDCbq+zIt5skqmrY5CwDynm0qMLcI6JrNN+P3GHwShjK0ZHUzpjrv0K9if+uxpFYYKtD9lYB5GrG5ANACzzyoXb23GFRBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 11:56:34 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 11:56:34 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
Thread-Topic: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not
 enabled
Thread-Index: AQHbyRSTL3wUOM+oekWQJFXbxHnwpLPmZnMA
Date: Tue, 27 May 2025 11:56:34 +0000
Message-ID: <LV3PR11MB86950BF30DA68B8F5277FB73F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-3-tomasz.lis@intel.com>
In-Reply-To: <20250519231925.3196154-3-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA1PR11MB8099:EE_
x-ms-office365-filtering-correlation-id: f5ca83d1-1497-4443-74bd-08dd9d15871e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?HIg84fxOmAR+s/1OfV8JTiTT9LK3OdLK9rNehOu4Oh+idSLENznu3YsnNfJs?=
 =?us-ascii?Q?g/DIjVfXJMJgnCTn+H8NB4tyrQB5qUleMi3fx+LAd1WMEV4z3CLl0+mkO0sI?=
 =?us-ascii?Q?9wr0Z94Rl43ilA/rJCJIM44Xz+dk04yz4UEEbZXoxABn/gV5SxEbm1r1qvLH?=
 =?us-ascii?Q?DZ7l9efvCx/UAqw5ow53GgdxzcDO8VoKXACaGlrEHf3kpwLqpTuSr4PEibYe?=
 =?us-ascii?Q?ikfuTL2mWH8cMqLrV1vuQSGbUvPjmMPPKuogillUkQqU1F2ZSVdnPh4PvqTy?=
 =?us-ascii?Q?LZwIwo81Z806pAWWY8XhbP++mRTCf1cc/Y5crVc9VBuoFW/RXV21zp8PHBIF?=
 =?us-ascii?Q?6KITpy2t7/A3Pv7sXPb+xJ0lzlTL4pD5NrXrUdRjLl9dJjUQKCnunZ1vXuGh?=
 =?us-ascii?Q?25S1fg67dP85/W75UKKApGtiwqBkZeM8TWWTmG6KyuV8JLlDwBapnwz+2myu?=
 =?us-ascii?Q?c42X+Un3oPADd/+qBMpTwCMiIhOB37H7Kgczq+Ruul7NMPoQc/l4rsqlCZoJ?=
 =?us-ascii?Q?9LrAPllich7Gl8IKDhJEljB82EgCj3IfOtFGJRoBnLQuWy8wAw/ZLBT4U0HJ?=
 =?us-ascii?Q?2X7Dp3M22u6J+ekJLeo7GIKa+8+a40M/lV8zUbeWCiXer7IGhZuAGV4rywyp?=
 =?us-ascii?Q?x/JIIB0+031TkdjFl1p7ngQZsGNeIvumsCjOw4shriK9U3QqpjDtIG5PCdIH?=
 =?us-ascii?Q?hok3vrZ7yr38HK07g66JdEUymnmZrfOXqmMwRLvU4zudsC/WEqP6LMk4w1Oz?=
 =?us-ascii?Q?wOvsOm2KpqlqotJJ5Lk//0Oh/2EKrz/9Od3HrFhwvaWstLiz+Ymchov3LS1p?=
 =?us-ascii?Q?0JWr3//coTL0OTHOXKJyDgVRiO/A+9+kPRWkKo0JYS+V4J2xle+1MlFWgqtP?=
 =?us-ascii?Q?M8xV1CCax2G6fuITsP4nEeMrSE9ZVSD2kNrAFzybddNs7WDdhT+rLoAGZAH5?=
 =?us-ascii?Q?rC8a5UHn+Job/VkjWSLifaJXqCD5r+5nf4QYgoOrJFL0mbJUR4YYl163plQ/?=
 =?us-ascii?Q?5EhBrqdTQSzodryQshn1DE74lKG2SLlXefRX8dpYQmWhUn28zkHjNGVTgCg5?=
 =?us-ascii?Q?t+faTaFkEj7CTSx1wvZ+mL7hGsCFHcn1dkp0l/OBpw/bDaWfKmINejpUrv3/?=
 =?us-ascii?Q?/ySwIETlazFjpTU3nSyqCDYdXuGKhLFRIpMtOpUWaief3ywimbjqEan9X2ln?=
 =?us-ascii?Q?KBvxvAmRTgUH+9GfCZWf9L6T7biR10ObKkDFVkZZGU6ApMCkznnMxbVSPb6t?=
 =?us-ascii?Q?+7OsWzDqoB8ZKNgwazEyzk3P7uDt05GXCq+c1Te8x/LEtuxUm9tgDp6OMb45?=
 =?us-ascii?Q?XzLYAsVIs7aFUSu0PgMnqAySF20jJOr05U4gfg/hkAI7/6ZiB6A0dT6RpJZy?=
 =?us-ascii?Q?9vB0+/gyrtQO2TsMIfGeJUOwSi6aq8L0b6KGXtxl2r1IJwZBYqU6ELPUXaCG?=
 =?us-ascii?Q?ngUUFIAtjTYdrwoORZ/NEZRhHbNOd5RL7wdXrYnpznxjftxtunFf4OuKFUky?=
 =?us-ascii?Q?/pSSXdLzEbsJhZ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NO0Mcmfnz6ViJTE2XD1aTv6sJd/SgRx7u7wJffluFhPRm89wh3vZG44o0e7d?=
 =?us-ascii?Q?yltzLBUlrdz+usxT4/UVH9T46Sr8+tdIOyyRBfZBO0dYEiJpR4iR0xD06eAE?=
 =?us-ascii?Q?xTJgAfufZC6v3YwczHQErtHg+LbGLw9vywUX/vsl4OUPw6xuxctn3TjckeLY?=
 =?us-ascii?Q?BybNir0RtXRfo3OHwtuyadQe3LbHw3M+cF+SDtXR90HdlT1bYPHu6OMQu2jM?=
 =?us-ascii?Q?lJoEI9oQzuurNd8snmPgFvl4YURoWD6jPaYdLEV/MZo0cLUxNO7NhMFQe5hc?=
 =?us-ascii?Q?5TAVPKF3X/yxHDTCOTLnbx76r3vIbrwX+i/JFWkQsVLyr44ZsTynJ1wcstET?=
 =?us-ascii?Q?0ksmJ++hAHvFrrzEZj7CsNwfrZN35XCjuUm46/YfwgWjQaouQ0oQm/SzyQ2T?=
 =?us-ascii?Q?D+pQg9lwP5sWf2YtJVrd+BB++dRQJ3/g5vmUjSWpEg0IeHcPT4p4FOuBylMX?=
 =?us-ascii?Q?trsf1Ij83DkoqGddKGeIph3Qv7Yo8f0IISosbCVF2UDS0DxnNO/F5w3BtNdn?=
 =?us-ascii?Q?BVu3P4bdTsO9ll3YpUKe05cEojoCuqpL2fLa91rAtFqg0MNg8T3eaXy6G3ij?=
 =?us-ascii?Q?HdgI6Cb+7r+xM9g/F42TCa7LDIumFKaofciuiN5vaeq8n1CnM63I6a3agVKo?=
 =?us-ascii?Q?ke8/oO1ux8t9asG77leTUfDYnIvlXzz4jADv0SUm51mrBT0xUp1pbwqosYgM?=
 =?us-ascii?Q?sSmmB+4A21dTg1K7uLFm28eB/SP5fIE9ZTNnf+9+0ukC3Mc/ebid3KRf4Ket?=
 =?us-ascii?Q?mA06ZDVnLDRqI2Zt6gFYL2q4n4pfe3incw9rtBmhDCwuVMNKYH7fe15vbKZT?=
 =?us-ascii?Q?f3c0dO1Tv0/I8Cm3rxdDPZO2TlRgMYg+/CXmGJBrIZukNDjqvr7n3rrnukQQ?=
 =?us-ascii?Q?dwn5awUe+EVgqg/485gCGemqf20Ia76W+RNUbAs92HCS1Wprxt4knhBGXyt7?=
 =?us-ascii?Q?t9lNlOFAZFrXYJ8Q1du2tY6VgWCFePzzE3zj6WkVjp0YDkemcgLbcLSRZsnI?=
 =?us-ascii?Q?9Dgn3pPh1lF0Uq2LUYfkQm4+0+fulkmO+nDDWtH/KqbUyr1+ILSHM/8FGWAe?=
 =?us-ascii?Q?4oMmjsuhLDkaI0zv/ofQwkQ5YuZSNacd9pIdXUykaD5uvOKor1uLL/KU5QRV?=
 =?us-ascii?Q?F2Sx66YnBNMdLNdfJCN39faZyDS9nG8mqP8LNfZFN+9H6W0Dsl5nqwDAWaH9?=
 =?us-ascii?Q?v+sMARtTHzz+xdmIyx+i5IVmG4XZiM0K509BfxmZyZJajgQrvRaweZr2HlNz?=
 =?us-ascii?Q?3DJbaMIHxtSKVi/5C1tByKOd1PVfmhPDZ853fRB/unW50BQz9lzr+zAOKilp?=
 =?us-ascii?Q?KREiBdQY+mhhoT08UJhqqW7dLVYzXalntpIoM3i+wvDvYEYrv5AtWvaDirWT?=
 =?us-ascii?Q?cgtGnv9tk41pJj97MVfths1yGepinsbZTV3Z3nBeW4WjDW8rRxmvDuMDzUyd?=
 =?us-ascii?Q?WqqaicVSR/Iv/nw4ix7ewZ6yrp6dPOo+Qvl8X4dAiQ0cursgaNCyDFSQJ2r8?=
 =?us-ascii?Q?ueIfp7uBeAuWNAC7Giy91mzhW9wxo/hCDajdlsrbTmjPm6K4aIxTnociF4oq?=
 =?us-ascii?Q?Zfi+ZMVnPhNgRhWtXomFXrDz9mNtOAdBwPzrfJ+aUvdeZnI3OWxuAhinQRDq?=
 =?us-ascii?Q?ew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ca83d1-1497-4443-74bd-08dd9d15871e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 11:56:34.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZzLJa74sVc2JlqUi0mRyNL1k4oRyPNJNTORXBt0R0QCxJb4WoBFphwd/Mx6ZUm0SSm8nU8KMzVBPBf4kHoE4Hoooi3mPsl8ZSfUWpx3H6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
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

Hi
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Toma=
sz
> Lis
> Sent: Tuesday, May 20, 2025 4:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
> <piotr.piorkowski@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v3 2/7] drm/xe/vf: Finish RESFIX by reset if CTB not enab=
led
>=20
> The RESFIX state should be achievable only when CTB communication is
> enabled. If CTB was disabled and we still got it, then either we're
> dealing with unclean initial state, or the driver is not currently
> functional. In these cases, exit the RESFIX state by reset.
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>  3 files changed, 27 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ff7ae1a5f16..b9af112ca771 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_mmio.h"
> @@ -932,6 +933,15 @@ void xe_gt_sriov_vf_migrated_event_handler(struct
> xe_gt *gt)
>=20
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>=20
> +	if (!xe_guc_ct_enabled(&gt->uc.guc.ct)) {
> +		/*
> +		 * If at driver init, ignore migration which happened
> +		 * before the driver was loaded.
> +		 */
nit: Can we rephrase description in simple terms like below?
"During driver initialization, ignore migration that happened before driver=
 was loaded."

> +		xe_sriov_vf_post_migration_reset_guc_state(xe);
> +		return;
> +	}
> +
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
>  	 * We need to be certain that if all flags were set, at least one
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 2674fa948fda..099a395fbf59 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -134,6 +134,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  }
>=20
> +/**
> + * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all Gu=
Cs.
> + * @xe: the &xe_device struct instance
> + *
> + * This function sends VF state reset to GuC, as a way of exiting RESFIX
> + * state if a proper post-migration recovery procedure has failed.
> + */
nit: Can we rephrase description in simple terms like below?
" This function sends a VF state reset to GuC to exit the RESFIX state when=
 the appropriate
 post-migration recovery procedure has failed."

Apart from above nits, LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_reset_async(gt);
> +}
> +
>  /**
>   * vf_post_migration_requery_guc - Re-query GuC for current VF provision=
ing.
>   * @xe: the &xe_device struct instance
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h
> b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 7b8622cff2b7..ba846af34a13 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -10,5 +10,6 @@ struct xe_device;
>=20
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
> +void xe_sriov_vf_post_migration_reset_guc_state(struct xe_device *xe);
>=20
>  #endif
> --
> 2.25.1

