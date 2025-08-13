Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE37CA0EC4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 05:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E454010E1B1;
	Wed, 13 Aug 2025 05:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4pCBPnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D9110E1B1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 05:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755063915; x=1786599915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ucd3Xq8iXdNaPd2WX+7Mc0uw3zT8pkC5FJ/yXjGlNSc=;
 b=W4pCBPnGSLJTWVIO3FQ8qMF0YRsHPYJhNrjcGXqJvTpSs2aPES/QZvdb
 AVNQENEheF5zWpVNk65xH/IeT/BnA3iHcwa1xfR019URCwRCQeYGkmb3c
 FDV6eLKbHYnDsK9Z9h+ffifTFjF4WRYJQNO4wIypQjj4MGHqOBQOS/zv3
 jkwp8kBkZ1qDK3tK1qPEnbmyZU86ioF/PLKvxyDZDFv/lRsHGtrkW6YHg
 wyg4MXHP4681OIFKgvpZPLYP1vzttq/Mp+XywkIfp6WiHvUqpsfqFtQJS
 /qET+dr66yQF747pi1yd2lvIWWgkceNJvlx/nb2FNDk/S5VJ+msiXxleQ A==;
X-CSE-ConnectionGUID: a3u9ZIrFSjOSkvfDqosMdg==
X-CSE-MsgGUID: PHxdLJIKTxuAhrK5sbPmlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57428255"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57428255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:45:15 -0700
X-CSE-ConnectionGUID: X4tU42imTkqkAk9dQkO2Xw==
X-CSE-MsgGUID: Ae8sXMONRL2BYl0ZXA1xcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166655867"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 22:45:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 22:45:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 22:45:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 22:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xplb3pThs5TaEco0/dciCSB8gVp/r5236JxIQZfo9AIaHvoh6SelezGAmk3hU4VZO03hfDAhWKS+eraJhd8qHo9LyfGy72ewzciiiNSwHR6xHpJoH2kMndeQ2rYwZcrgazkH9atdG0Embjce8Ut2Nw5xLYOdM4h/Dho1v15dB0t8wmpthfR0rCJ2kIYAUp8kBzo/pJlphBWEpvXL5DDtMnFfOsocfsJJKZre/7Fx6tYyM65ZoRyKk7AihEML+cWUhZGHtyqtwgQv3FEVIcywwn950Pa/RRcU47MExikNr2rnbeYUloq5sNB07Y2GtCb0YN5mWSKoZa8oGxtFQ5/XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UioGH99Mcmw/Rw6ywasAG30KCzXoR9i9AZ3n0Xd2kOw=;
 b=Ll5rcJvl/C5CqlM83jtOKgTnofDsktYxjuZUeMnNhkFrinQtrXyR4LqiwBll/FdkG0VfHLF+PkeSw3Y7pFuLE6gbKyNTzI1l02X8za2SavGLQp0bcJb89wG9S+yFt/4Tz9j44IPsgjnCIiwD4dpO9zxLXcdu3sVGxfv6FQX/iEk5nEG6ucWXdZBXmTu/zXLR32EHSeeHwoPwNuRQyKfyhd723tKXzVZo/IEFoG4j1eL6vZXUdWrDVXCkRf9ntFbrzCLHY7YkLkg6qtxyRbWYsGL271udmyLixn4gzZB0hEeoHP2lOAhZubiQU+QPiqn3rlHlywLXxEfB7T06ZXTkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.14; Wed, 13 Aug 2025 05:45:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 05:45:12 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Bai, Zongyao" <zongyao.bai@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Bai, Zongyao" <zongyao.bai@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Thread-Topic: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to
 replace sleep action
Thread-Index: AQHb81yj6dh0szDkmU2x5cEn+hTp6rRgQ7Mw
Date: Wed, 13 Aug 2025 05:45:12 +0000
Message-ID: <CH3PR11MB8434490F972AF758DF78E02D8D2AA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250712184126.378709-1-zongyao.bai@intel.com>
In-Reply-To: <20250712184126.378709-1-zongyao.bai@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB6519:EE_
x-ms-office365-filtering-correlation-id: eb8a0594-38cd-4187-dcf1-08ddda2c9231
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RiSMRtIFckvTSn0a+zHqIh/rOdHJolIu+vs09CR3AkbUnndPP5b4N4WQ3rUe?=
 =?us-ascii?Q?FYNDuIZFOEoZrrFkFLSYMN0nwoHZjQ2mCAwAiGfbsoD2ONm4apqUSow/k+BG?=
 =?us-ascii?Q?a5dvPEeQepDYyXmBWmaxdZjWh/GfYFBukINsg8CmlKlIfU16/MjA1nYyIrb0?=
 =?us-ascii?Q?nnxcuWO380zpKSKPE6NgbbArCChBP3vhehrXd+INzdLIShrLcrz2MqtUqdEK?=
 =?us-ascii?Q?nDWNSJxq/dyXv88M5yhTI2bssXRSwGaCsnzkbDjzJCzn7DZdVUf8OmCgSwdm?=
 =?us-ascii?Q?WY8hb7kJO9LJdhuIdD4MQIYrsxZt70o1MvhMvI+bbiqcAxavUulbcAGyZ2BT?=
 =?us-ascii?Q?b5epV8vRa1nGNYFiCxcUKKhXXiL7ruuYFUPPutVQOXYY0EIzFVjOAmOGc/tC?=
 =?us-ascii?Q?SkNOvM6RqbVsyxaJBfZeEfxEEmzw3BZrEO+zlTmo7VOK1xaBi+qlnU3wklCM?=
 =?us-ascii?Q?RGU4EUPDH5mhOwnnocT7UBSIZjA2jspYkcaPJq3Fiq6ok5s54FvZsU8i4kjh?=
 =?us-ascii?Q?oov5/MKyLhOER34cdLYFmp1rWc6Z3AxYTF3cbM1vQf07f6NJSKxPshftlIjp?=
 =?us-ascii?Q?L/uHVmDe8IZzoxokYACyBC/nFFL29zPPMl9tC01ePxzPQKIxy80T9DQkSmkc?=
 =?us-ascii?Q?DlEe6oeeM3lODdyXNPrmlY1Y5I+de0yO8MB++Ep/C4iiTA4ZWTsP8Uf04wNn?=
 =?us-ascii?Q?cAJiye0JDkFnr9IafuYCHlTj9Myi8viIt3E5a+6A+LZ4WAMwd6nXqDzqoiKK?=
 =?us-ascii?Q?wYSGoTZANEM8U1SPyRvK10sVHPJ3DmQ2hfIFSBO4XvaIoGqlpSTtSUxO526n?=
 =?us-ascii?Q?0xdNC0hCSXMdrOvLeiMCw0wXJjH1QDhKIW/LLwGuvKHaZRyG71gMTl6YeEM1?=
 =?us-ascii?Q?D3wLIrA+UeGCnxWcbJy8FDZchodrs6uET2VKq0+iir+m6kC86AwATCAkwo08?=
 =?us-ascii?Q?AoQ2pP16HXLYPE51fRwfkmGDBjyWmrJwEwn9VM7+z36crXCLQ6im43DIP9I1?=
 =?us-ascii?Q?xEp12VX86AfQopUSjn7dxzJD9K20qbD+DIzJvov4OOQ2esJNGCrcjpmw/Iac?=
 =?us-ascii?Q?bMeqXitfdJFKknJfAIMu/PSszFGO0A1kuYom3e1iwhlC6MChpMt00s0bTh80?=
 =?us-ascii?Q?RKO2JeL99LOPaetw30ffNMbtERyRTL/t+KGFRNS8YWmYewhcKNsoySRXlALl?=
 =?us-ascii?Q?13A1cPVETrnHrP4ikacYUPaf9uukN98YumC0VKUazljAazQACoMzYTg808NW?=
 =?us-ascii?Q?cbVFNl7gRWHc8NN0c0c5mYqGOyd/AbAuUkV8IATxPHBvqybIr03ltYMC8rxr?=
 =?us-ascii?Q?VkV1QWySpBiAXy9GY9flxPttqNNlgmqeukmbIRm0QWMdtjxLUlg/uWhwt5X2?=
 =?us-ascii?Q?IDRR6z/4ODYAGE+oxn4boMO3dwo9/9ELozoiu7kQSnG+f3zMVzUCcyEXvZ0K?=
 =?us-ascii?Q?JhVKNCY0dEQZd7VPyhEZjEUcox6cn5FVKdsWjJehWCra0aI6X5Iy6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jtfNtCAaH2P/HIcSVwVyRoXsMtA8KXhF/aDYY5rCLqz62vexJvAaylNGgYMf?=
 =?us-ascii?Q?8PL59mVYDmSHShUEQT/0fHEfcNP2aBRt7oEIk1d4cRiLHZYn0Ec02Lu+IkL8?=
 =?us-ascii?Q?yO0AKL3/nIwMMyG7WqBfLINMu4PULQifkEV/PbalQQ5zuZ9giOFjR8EApC1f?=
 =?us-ascii?Q?V6WqCe0w7codMrkGty/rw07s7Q/6Xd3NhLps4C0li5Pc+ns614t21MS/Wpqr?=
 =?us-ascii?Q?FYYyRbv6YffdqfHhdq/z2HL4cqmRe8hI9pxicF1k66md/C3C+mbhrgZqGSq+?=
 =?us-ascii?Q?hIjcCPjt8uxK/T21L/pC22/0MD3hAilcmzGYD9eVGHCc5I1/Mr8LbIsiwlMm?=
 =?us-ascii?Q?pq1N5BkHDKH+iQY9j5MRrHhjR3i50sdkUaND0xq8XSrKOwRvYhDmMbOycLka?=
 =?us-ascii?Q?Axsbc7O6SN02SRJ/boGF3ecIMl1uTEvEBQZFXicfk9ooNEyuG22nbF1bC5Hx?=
 =?us-ascii?Q?r/eSI7cM/X0gAcTo741gGuI4yqAadl8uHZixLbD+CGLXe+2a4VOOZmD01MYg?=
 =?us-ascii?Q?FD5kfmMZrPw2FPVDqfeZ81BUu9hROWW/BptkFsHZIz91MICp7D7rd9qZXEql?=
 =?us-ascii?Q?flvKRhT9DeMay+lOhwOEf1+kJuC84KMj8Zgmbo1w/vT1NmLwrYcYdEvPCkbI?=
 =?us-ascii?Q?gLK7bQ2k5g7cLOLwmJXM9bifYG+Cf8NkjSYsWVs+DR8NuIOabT7WU6TS/9wY?=
 =?us-ascii?Q?uJPCNBUBmep+kxssFj5SMiBlerzKK2OpmmUoVNShjkKD0YR5i/IafJUs4+GY?=
 =?us-ascii?Q?ZmQ4PXpqhBXeBaScrbZlTAT6EQ9ch0eh6bGNLp85LN1MaDdrxFfJR5v2YBlt?=
 =?us-ascii?Q?NABWeCQ6vpBqt8XpPNk3i4peIGMjYaXadfrtFDnVxGuMKMRRKmvNzNSpvRiS?=
 =?us-ascii?Q?xQGYgM3DfTShNZ2jYFJ/1nsTsef/wGhvGbEcT1bbE4vvp7UTAph/ErHBwa5I?=
 =?us-ascii?Q?05Y8Z8x3z+G1SbIy1s3rzUzdmU+rmy0Lf24wE9FsRcyghC7sFVKy/FQEJvw6?=
 =?us-ascii?Q?0Eeu7lszbS6JLj0xIhAwXqVCz1ctozG//F+6pYNS5ielNm2/XLkQv0W85LiX?=
 =?us-ascii?Q?97ImHlYlFNyiMYhc7eqo8kW/D7sL4rBMPq2fPosr3gh26zvHWe1gjBMOZdMv?=
 =?us-ascii?Q?ZpT0gj8rGjWn9XRd3Emyyufg6qcr3gj3cVv1j3V+7+TLod9QMXIcpPNZGaIy?=
 =?us-ascii?Q?6Pp1TuiA5oMUuDynwpOk3/d2n+g9RP/+G2KoXCcp1po21B49QVPvufWS5v1+?=
 =?us-ascii?Q?vnUME+kToPYBKwUjpktu/XPCvVVjeX7M8RrzG/r5Suer/gvTCEiKUp5vBa7s?=
 =?us-ascii?Q?xDDtj2ib1H7enoyelW6OTvX6R1H/7I1AR17EmCTNHDJP27R9MHMKwqMO+Qnu?=
 =?us-ascii?Q?Vm78MeTxZVv8+PBnA5B1PasmLpk9/NG8yV44szqvBRSGFvdLqqoPD0X/0llM?=
 =?us-ascii?Q?xQMCnOkzX0JF4MS620BPuBAYvbzgO/PYCyLeRwkik/TAm3TKqqUGxquQb0vr?=
 =?us-ascii?Q?sVranWtOyZFqe6ciLSbApGlMWA2ecabAyCrjmRWydxLOucDWMx+A45Mxwyqt?=
 =?us-ascii?Q?dnEejJwufmoAm2P8G6PqnJ2lRMQJoHH0h3YdElxljJR3fN017RjZvz55SEiL?=
 =?us-ascii?Q?VEwsTvZI62JjC/ay8uErM9Q3vsQPfr09fdgq8w1JL9sR2zLezqfimxaiVRlo?=
 =?us-ascii?Q?nDVmCA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8a0594-38cd-4187-dcf1-08ddda2c9231
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 05:45:12.2313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHU6dviJJby85z+Oa2vF2v5ywzu48X6zSyGdLqk+Tq5gCqoOFmIQalbJBooTJZFAYjwIqx01HiEnKP/qIRuYyXIJ3hooOtJCMrkZqA3AxDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Zongyao Bai
> Sent: 13 July 2025 12:11 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Bai, Zongyao <zongyao.bai@intel.com>
> Subject: [PATCH] tests/intel/xe_exec_balancer: use xe_wait_ufence to repl=
ace
> sleep action
>=20
>     In the test_cm() function, for cases with the INVALIDATE flag,
>     use sleep 0.25 seconds to allow all tasks to complete their jobs.
>     However, this time is sometimes insufficient.
>=20
>     In this patch, xe_wait_ufence (referred to as "fence" for short) acti=
ons are
> added
>     for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
>     The changes are as follows:
>         When flags hit nothing: =3D> No change
>              -- all n_exec tasks operate with a fence.
>         When flags include INVALIDATE but do not include RACE: =3D> No ch=
ange
>              -- the last n_exec task operates with a fence.
>         When flags include both INVALIDATE and RACE =3D> New in this patc=
h
>              -- n_execs/2 + 1 tasks operate with a fence.
>              -- at least the last n_exec task operates with a fence
>     Furthermore, modify the xe_wait_ufence timeout value from 1s to
> INT64_MAX.
>     It helps avoid the fence timetout error.
>=20
>     With the above changes, all n_exec tasks operate with a fence,
>     allowing us to remove the sleep part.
>=20
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel/xe_exec_balancer.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balance=
r.c
> index 1747e207c..8b397038a 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -527,14 +527,17 @@ test_cm(int fd, int gt, int class, int n_exec_queue=
s,
> int n_execs,
>  		}
>  	}
>=20
> -	j =3D flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> +	/* Wait for all execs to complete, and the xe_wait_ufence need to be
> run at least once. */
> +	if (flags & INVALIDATE && n_execs) {
> +		j =3D flags & RACE ? (n_execs/2 + 1) : n_execs-1;
> +		if (j >=3D n_execs)
> +			j =3D n_execs - 1;
> +	} else {
> +		j =3D 0;
> +	}
j never goes beyond n_execs, maximum it will be equal to n_execs (example n=
_execs =3D 2). So, in that case it can be modified to this format=20
j =3D flags & INVALIDATE && n_execs ? (!(flags & RACE) ? n_execs - 1 : min(=
n_execs / 2 + 1, n_execs - 1)) : 0;

>  	for (i =3D j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -			       exec_queues[i % n_exec_queues],
> NSEC_PER_SEC);
> -
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		usleep(250000);
> +			       exec_queues[i % n_exec_queues], INT64_MAX);
>=20
>  	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> --
> 2.43.0

