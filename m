Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE0606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjGaDoHf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=FgLDU5Mz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132D710E581;
	Mon, 23 Nov 2026 20:02:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24FC10E581
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795464162; x=1827000162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=snq42IuJ6N+0pX7Qf10T42Q6b/aqClwtdYUwCAT2Zpc=;
 b=gjGaDoHfr9tsy6HNz6bV7DgUajpJXp8SYBs2pAHZZDZEabEv2L3IpS77
 MjPlPqM1JkKmV4t8Bg5faWIvefGjPqwWvhJvkYlxV1ba6aSGAFsfpOkQH
 0THO8m9mufrKsCTIWPfWLd7Y5ZbOc1Ves20EPG1fw3PgZ+Uz35iGl2O6X
 UrhGF4zT86SfqXqaUDdVKggL4x2jhoQUDBxyDzuFdkjA9S7a/UeP3L5jn
 mUh0VqDxddv42B9D3+ba3fX1joY5u/9MZuQTKdYnd2c3diu0FJsNDCMX/
 5A6mxWkjnpVleUOMt99+yv6TLOyiZAgCXlXqy4On2wLA271aAwl9DZ15t A==;
X-CSE-ConnectionGUID: xCdUCQabSIGbOw75UQji6A==
X-CSE-MsgGUID: Z4oZzHZKR0mWamaDzOdwaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4172243"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4172243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:02:41 -0800
X-CSE-ConnectionGUID: DZ/VGJ7tQGWyJnuYE++4EA==
X-CSE-MsgGUID: bxvwbvzBR0y7ovJEhh29NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11257773"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:02:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 12:02:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 12:02:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 12:02:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvMP7l/KGO3+HX/vxPOK+q0aWKdSb5f7tlOGffJOAbA5303prLc4gvy1Ct1DinGFrRm/LcOlRUap1NWXVi56NpnNZo70W+48mQxlVPERD06DxUmqxOsb5GDvRl3Eogw0kCUifWPBVGBzEBvWHsFyF33MMVQs2HKNkSqRGZzItSD956ykqjlLDns2fYRsfl9NRIVimM1Jz+pHmcWubTJLSfxwJWYFpj3JgynChcbRESyLs5Ehvfxjfr6WpESMEkfAJKudzzAYXK1yMn57nuWiqhnw5ydEttw3+ebutmOITpjzQMg5MfnLH7OqZzysAJWd9WiPL5+fX3KIR7EMR2EOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAQTbRqSxcnEParmmj2BDzdljduMbZqgO4A4/KvjOyo=;
 b=wBOmxI1Gv46I1zBKzPdubYvIJP2tinxoK/WlC1sqhPDSHNRWy5EV8mejO/la7HmY3zT7RkRSxflvA7CPUTQVt/q5yR9CbdKodPwTC40VvMGPNZyDgdjUeLJ2K+m40oBUI1vkntZK3wFJt2LPEVfpVRZSGlBJgR7tyBmWny4uQ677AzpP7++V0FjQd6oZQT2S/vadRcpUB7yQsY7pFrkaV/KpWreq6rLN4Z+WhA+hI1/KmdBRQo0MefkqxySW3J7i1DUee9lDMOGtE45RBRBBGGRL6jHx/0ZYHODy3FeICyMZ1hwIn4KHPYBjtPCNU/FQ0pl9pt+xXWCZWCr66UOD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAQTbRqSxcnEParmmj2BDzdljduMbZqgO4A4/KvjOyo=;
 b=FgLDU5MzOgsQrIvPo8BFw8+lvjq3CpB+nacZe9F9Og+8iyfGFVrBiPvXRsKBHHfCg523HfK7koMIoyXoOkx49XOQoVYJJzFSmQvRgtQDTz/c0nLkT9lGq58GKpeHaLEbduy8Ls8AN1a1GbCTFS0gznr0JjhKsysrOSVqtzwZxoU=
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) by SA1PR11MB8326.namprd11.prod.outlook.com
 (2603:10b6:806:379::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 20:02:23 +0000
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::e489:366a:1177:5a0a]) by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::e489:366a:1177:5a0a%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:02:23 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v4 1/2] drm/xe: Store GMD_ID as a struct
Thread-Topic: [PATCH v4 1/2] drm/xe: Store GMD_ID as a struct
Thread-Index: AQHdcWqbwCo0693rzE+G7wrku3cjOLcyWvgAgAm+SpA=
Date: Mon, 23 Nov 2026 20:02:23 +0000
Message-ID: <SJ5PPFC0624F2CA8CAD7CC57324DC6F258482452@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20261110232328.842758-1-pallavi.mishra@intel.com>
 <20261110232328.842758-2-pallavi.mishra@intel.com> <87se0z7d45.fsf@intel.com>
In-Reply-To: <87se0z7d45.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFC0624F2CA:EE_|SA1PR11MB8326:EE_
x-ms-office365-filtering-correlation-id: c5197c45-2fee-4d5d-9be9-08df499cb089
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10070799003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|261026121527099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261022105027099003|261022075727099003|261021135927099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: CfxNwrpfrHyYB56ov9kMaHmZbzqn6peuFvwHamAFm245FMHDKHioH2eekttYwi56SBj3Acdn6w53ENwFg04HgecmlK51uyW5HP2x0lZJtIfdlx/DvULGwP6UIY8VANBsInQtcP3PHf2QSLDZ9AGQ/7zOXyu2Y4Ztqh3/3GIfzckNeYL24ue3hH7gGk6r3xtdbXw7SwEuc+XXyjPIFSmzSEe4EameqPDCdUdPZ0X5SVL3wAf40YkKsv8FdfTc6qapMCcLL0OEChJcT8n9neHbemAynoSCqmvzqIGVy0d5/gatRkwNrOy5sLU7y6wtjF14jTreUPaw/LQrq0ZUvEJODZ7uYH9ZAd7P3us/U491kRxi6+B1RBpXCOhzjdg1/WyD4A95upvRmlknLI6JjLFu+DcSho8hs4h0ZCejUvqKgGpPjVhw/OnuC5T+Q1LdJdJbfXkyIKhG+49KiK4C1pFhI/5saVByGHyE4jA8jwRKeSYPR+EB+gPXYDzDX0uDJ9FOA03y3X0E3dCVcorh6IXU08OFabVYPjPL+y+/KsJQSNIw7f3gcQGL8KWDMm4pFVHGEsc1hJV4MxwDBuiyq1ZcupNr67WwBpvPqOvB+rudCHmxoDbOgxMiNQTGY1YIl9Ge0Vc4bbGkZYTXi7NNE0KW3bz17bKKvpq1vXhfRA1/PPYHL4LeZhMnhz90bQ/5bVahXW6jOPlrzZ51+kcmlJBqA4SyDGdKoM88R9EUJ+PjNcw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFC0624F2CA.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021135927099003)(261026140227099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KB0o6nP9i4Fn89IHCNRclU/mosNGcdMJc1NT64bOsUkNIzUNRIL90D+MwF?=
 =?iso-8859-1?Q?BhDLk9LroieEWSH0VHF+Bmt2TFZg0RFixWj027cGOH5Qh6x0B+96KGMd4M?=
 =?iso-8859-1?Q?QkWcHwjV78qZ8r9XLk5jQqT0mjFDBe4V9ZIhKfKBxuOvEnwYC8r3sFHWCI?=
 =?iso-8859-1?Q?aAk++JILLB+vX6ai+RXs/Uto9FRrCY4p2UdaTVCVJ3tbCgV1XIZ06VKrqn?=
 =?iso-8859-1?Q?92Ako8lliA7JxrOYZwIEqGMWmPHk7mwrUyQFiHJZLxKc2oSRNY3AB+dXt1?=
 =?iso-8859-1?Q?NOaWTiUbwYUtKCHVjbGG0h8dNowKlkciIB8KJExyPWDFwYL7g+y/WTW1TG?=
 =?iso-8859-1?Q?8zElNaJUCIqGNuswlKGrdP8g29disLmJIDMqtCb6/V6568+kpUsC07vBPP?=
 =?iso-8859-1?Q?xHDxGy31ccikIXwm4pa6BtQ8mTMR5PnhWlnIyyrsz4cXX19+hXZWS6xOUH?=
 =?iso-8859-1?Q?RQB55u7rAt01cCkHpDhKKPzclXYLZHlOtsJyRz1fO4sPmL1MYug67BhTaw?=
 =?iso-8859-1?Q?8M2MoudQkU+i/i8NTClZqOUBe9cL0YavibTF73F8Y3wankf50Sgve/V/Nj?=
 =?iso-8859-1?Q?9j3jQ+Y6oJL32tNo/ETzndw6OVWsN2NQdjdT0HRC1gvWk3po1iDbnBS4Fh?=
 =?iso-8859-1?Q?Zl1LCY88weZ8mvA3Y39mdoxuj7IHxXRBCBHY+w8OOUbDIctbqE7ypBrmsm?=
 =?iso-8859-1?Q?2Q7R5r4Ht00eW6qhyq0oet4Tcd899ybYmsP6MTFED6ZpzzTnVE3xCjyvL7?=
 =?iso-8859-1?Q?C1mcpbu70JWLHNfct9XBw35EuU7z8SZPRIZ/mca5UoQZg4NLgFkglEPWLd?=
 =?iso-8859-1?Q?eZmZ0L6BJjYipbRhrlwCrPJWAnncvca1jEH29zTOTwa73rwWLzu7XjXhAw?=
 =?iso-8859-1?Q?s3umzdnKmwXFyQ7XBwXhid3t0yJhm4SW9D+/3e/UvKsesbgC4fbAefifiR?=
 =?iso-8859-1?Q?EBygP9xXO+H2yrClsQU05vlB45K1SYrEd4hVscxbP9tZsNqKBPWHCaSDjX?=
 =?iso-8859-1?Q?E8EjtwOhiGUBbOOS5T09qcp+7IlfIYxre/oce3j/1ZoNIUdMV7HPh3cAYw?=
 =?iso-8859-1?Q?/ZC6YkGV2tuiX0XIlU3FWcZEaHi2Y+41jLPLE6gW5EXJKvh5AwvdezrtLi?=
 =?iso-8859-1?Q?QKwFWmZeW/wSQxy/V8P+OnW7i87KDOCg2cUNKs0D4oVVjDIOIt+trJAmeX?=
 =?iso-8859-1?Q?iVgnuNY4Tdf8Ky3WedSWCXbj70ameAQU5DR6PRn+VcUUf/t5g6ADh5Pc66?=
 =?iso-8859-1?Q?Qa68TUaxe7mJCWJTa5e5i8RJhaXD96ED/a2J+sFZNc7guMAhclOU7GoVdC?=
 =?iso-8859-1?Q?fkBtVpToPuHpvbWpHk7dsbBkzeU4oQMjKn/CsMkbi87x3KjCxiGj40Exaa?=
 =?iso-8859-1?Q?mQzyXGWo5BHYzRhDTYNv47pxvYRGeT84lra5JBSmqB39OpCBQRTurB4vSQ?=
 =?iso-8859-1?Q?f/CTnggjzTxHJJIXH82k5fwSStZTQMskc6mn0RF4w1rGEVzZtdEiPWlhgG?=
 =?iso-8859-1?Q?37Xv1T7300EKnGlk9agWaGTsONsrLCCm4fNqFHyOpJXvFm3FpScXXudNtL?=
 =?iso-8859-1?Q?OwGGq8h1onU+KYJm8O6Wrm7OFLWV4weEyH2gtsxDRwC15o+nlLZbEeNsKG?=
 =?iso-8859-1?Q?ViUCszdW4448Kgp7w+p7jH646VXpzDFVc2Zom6XDr4e0Gy3Pw3s/cKpG4y?=
 =?iso-8859-1?Q?vanwsDsKgLpKeBbt1pnunhNaCQrJk0YtIfOVJqM8iIApAkpkjYG8XwwjfM?=
 =?iso-8859-1?Q?n8O1fwMvqI2MSodygs+BQ1J74CoyDpDWxfsDTAXQJo+QGN+an/QZuKyDK4?=
 =?iso-8859-1?Q?0peOam1vKLjMXX1448gufcX59F6YZXa+u/2DQn6bFk/qY7xVDSzcRhwj0D?=
 =?iso-8859-1?Q?2p?=
x-ms-exchange-antispam-messagedata-1: JShn2PTeWdMdlg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z73oHO/c+IfeM91ggLObE2zh0WBu2TF6iYZe4vR2OcdLj9Cm123d9v3h524nHyg3sQf0tMy0DnK+la0YCbBOVsswWILQW9L05X4vX6OShGH1dD6YQN6j7QuY4GCZBKOtzD2KuJuuIcDbYHl408NqWLBy6d8oK+qzymL75jrwZYwUh+o5Wpg2Vhsx90ejcHv6B1ZuVQHVeb9FrCXkkS8s7OZSASAHTWDAgRaQouDnihqfVPJHCH6snZrSuZuR0F4ui6Nksbt9f4ajt8h3TyTby3sv1aCUkrWEDy4eTH38Ky8vwHxIJ8IXFYMrdgigAa/StBjRfuD3oVRecXV6PekOyw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC0624F2CA.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5197c45-2fee-4d5d-9be9-08df499cb089
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:02:23.5046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcDY340VHQ9S1YfjM8aykQg9xlfTamhjehAXCAG0cE+PgZ3DczpR/5/7q7xjX5QC5E9Z/jZc68tiRkgBCs/mYga9oB0E012iW1xfzP8iQsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: Tuesday, November 17, 2026 6:21 AM
> To: Mishra, Pallavi <pallavi.mishra@intel.com>; intel-xe@lists.freedeskto=
p.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [PATCH v4 1/2] drm/xe: Store GMD_ID as a struct
>=20
> Pallavi Mishra <pallavi.mishra@intel.com> writes:
>=20
> > Replace gt->info.gmdid with struct xe_gmdid so the register value and
> > subunit stay together. Read GMD_ID once before GuC upload and use the
> > stored subunit instead of another MMIO read. Platforms without the
> > register store zero.
>=20
> I think this commit is doing 2 different things and could arguably be
> split: (1) move the read/store of the GMD_ID to an earlier point in the
> initialization; (2) use a struct type to represent the GMD_ID.
>=20
> Note, however, that the following patch moves the read/store to happen ev=
en
> earlier, making (1) unnecessary.
>=20
> I think it would be better if we re-organized this into the following
> patches:
>=20
>  (A) "drm/xe: Read GMD_ID only once", which would, similarly to patch
>      #2, would do the reading of the GMD_ID values during handle_gmdid()
>      and assign to the GT info.  In this same patch, we would also drop
>      the extra reads of GMD_ID to use the value in the GT info.
>=20
>  (B) A follow-up patch to turn the u32 gmdid member into a
>      struct.  However, as I mentioned further down, I'm not sure that's
>      much better than simply using a u32 value with the correct
>      REG_FIELD_GET() calls.
>=20
> If we follow this suggestion, some of my comments below might not apply
> anymore, but I thought it would be still worth sharing those consideratio=
ns. :-
> )

I think I'll go with (A) and leave (B) out for now.

I'll send v5 as a single patch. gt->info.gmdid stays a u32, filled from the=
 value already read in handle_gmdid(), and the other GMD_ID reads use that.=
 The subip field is decoded with REG_FIELD_GET() on the stored value. The h=
elper goes away, so the comment remarks no longer apply, and xe_query.c is =
not changed.

I can send the decoded-field struct later if you or the maintainers still w=
ant it.

- Pallavi

> > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c   |  6 +++---
> >  drivers/gpu/drm/xe/xe_gt.c       | 21 +++++++++++++++------
> >  drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++++++++--
> >  drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
> >  drivers/gpu/drm/xe/xe_query.c    | 11 +++++------
> >  5 files changed, 43 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index 273e2c45fea9..36d659b4eabd
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1321,9 +1321,9 @@ void xe_device_snapshot_print(struct xe_device
> *xe, struct drm_printer *p)
> >  		drm_printf(p, "\tType: %s\n",
> >  			   gt->info.type =3D=3D XE_GT_TYPE_MAIN ? "main" :
> "media");
> >  		drm_printf(p, "\tIP ver: %u.%u.%u\n",
> > -			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt-
> >info.gmdid),
> > -			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt-
> >info.gmdid),
> > -			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
> > +			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt-
> >info.gmdid.value),
> > +			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt-
> >info.gmdid.value),
> > +			   REG_FIELD_GET(GMD_ID_REVID, gt-
> >info.gmdid.value));
> >  		drm_printf(p, "\tCS reference clock: %u\n", gt-
> >info.reference_clock);
> >  	}
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 671b87f1b9e9..becc82566457 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -534,6 +534,19 @@ static void dump_pat_on_error(struct xe_gt *gt)
> >  	xe_pat_dump(gt, &p);
> >  }
> >
> > +/*
> > + * Store GMD_ID before GuC upload. Main GAMCTRL consumes the stored
> > +subunit
> > + * field during upload. Pre-MTL platforms do not implement the
> > +register, so
>=20
> I believe the first two sentences are better suited to the call site than=
 the
> function definition, since they seem to explain why the function is calle=
d at a
> speficic point in time.  That said, I think such an explanation in the co=
mmit
> message should be enough for this case.
>=20
> The last sentence could be moved to the xe_mmio_read32() call, but I thin=
k it
> could be rephrased a bit: "Read GMD_ID unconditionally, since pre-MTL
> platforms, without the GMD_ID register, will correctly return zero."
>=20
> > + * the read returns zero.
> > + */
> > +static void xe_gt_read_gmdid(struct xe_gt *gt) {
> > +	u32 raw =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > +
> > +	gt->info.gmdid.value =3D raw;
> > +	gt->info.gmdid.subip =3D REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
> raw); }
> > +
> >  static int gt_init_with_gt_forcewake(struct xe_gt *gt)  {
> >  	int err;
> > @@ -542,6 +555,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *=
gt)
> >  	if (!fw_ref.domains)
> >  		return -ETIMEDOUT;
> >
> > +	xe_gt_read_gmdid(gt);
> > +
> >  	err =3D xe_uc_init(&gt->uc);
> >  	if (err)
> >  		return err;
> > @@ -580,12 +595,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt
> *gt)
> >  	if (err)
> >  		return err;
> >
> > -	/*
> > -	 * Stash hardware-reported version.  Since this register does not exi=
st
> > -	 * on pre-MTL platforms, reading it there will (correctly) return 0.
> > -	 */
> > -	gt->info.gmdid =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > -
> >  	if (GRAPHICS_VER(gt_to_xe(gt)) >=3D 20 && xe_gt_is_main_type(gt))
> >  		gt->info.has_wmtp_disabled =3D !!(xe_mmio_read32(&gt-
> >mmio, XEHP_FUSE4) &
> >  			CFEG_WMTP_DISABLE);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index c00a7c171f80..7bfcd806aac6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -120,6 +120,19 @@ enum xe_steering_type {
> >  		 const struct xe_gt * : (const struct xe_device
> *)(gt_to_tile(gt__)->xe),	\
> >  		 struct xe_gt * : gt_to_tile(gt__)->xe)
> >
> > +/**
> > + * struct xe_gmdid - GMD_ID register contents
> > + *
> > + * Zero on platforms that do not implement GMD_ID, matching a read of
> > +the
> > + * unimplemented register.
> > + */
> > +struct xe_gmdid {
> > +	/** @value: GMD_ID register value */
> > +	u32 value;
> > +	/** @subip: GMD_ID[13:6]; subunit indicator on media version 35,
> else reserved */
> > +	u8 subip;
>=20
> This is similar to what was proposed in v1 in the sense that we are addin=
g an
> extra member (namely "subip"), adding redudant data that would also be
> already available in the "value" member.
>=20
> If we were to create the struct xe_gmdid, I think it should have the sepa=
rate
> members.  Something like:
>=20
> struct xe_gmdid {
> 	u32 revid:6;
> 	u32 subip:8;
> 	u32 rel:8;
> 	u32 arch:10;
> }
>=20
> And then use the right REG_FIELD_GET() calls when defining its value (I
> believe assigning the register value directly could be problematic becaus=
e of
> endianness issues).
>=20
> That said, I'm still not sure if this is much better than simply storing =
the gmdid
> value directly as a u32 value and using REG_FIELD_GET() whenever needed.
>=20
> Adding maintainers to the discussion here in order to get their technical
> input.
>=20
> > +};
> > +
> >  /**
> >   * struct xe_gt - A "Graphics Technology" unit of the GPU
> >   *
> > @@ -151,8 +164,8 @@ struct xe_gt {
> >  		 * See @user_engines.mask
> >  		 */
> >  		u64 engine_mask;
> > -		/** @info.gmdid: raw GMD_ID value from hardware */
> > -		u32 gmdid;
> > +		/** @info.gmdid: GMD_ID register contents for this GT */
> > +		struct xe_gmdid gmdid;
> >  		/**
> >  		 * @info.multi_queue_engine_class_mask: Bitmask of engine
> classes with
> >  		 * multi queue support enabled.
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 300126e6624f..9b060aa2890e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1888,18 +1888,16 @@ bool
> xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> >  	/*
> >  	 * For Xe3p media gt (35), the GuC and the CS subunits may be still
> Xe3
> >  	 * that lacks the Main GAMCTRL support. Reserved bits from the
> GMD_ID
> > -	 * inform the IP version of the subunits.
> > +	 * inform the IP version of the subunits. Those bits are stored in
> > +	 * gt->info.gmdid.subip and are reserved on other IPs.
> >  	 */
> >  	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) =3D=3D 35) {
> > -		u32 val =3D xe_mmio_read32(&gt->mmio, GMD_ID);
> > -		u32 subip =3D REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK,
> val);
> > -
> > -		if (!subip)
> > +		if (!gt->info.gmdid.subip)
> >  			return true;
> >
> > -		xe_gt_WARN(gt, subip !=3D 1,
> > +		xe_gt_WARN(gt, gt->info.gmdid.subip !=3D 1,
> >  			   "GMD_ID has unknown value in the SUBIP_FLAG
> field - 0x%x\n",
> > -			   subip);
> > +			   gt->info.gmdid.subip);
> >
> >  		return false;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > b/drivers/gpu/drm/xe/xe_query.c index dc975f595368..ec621be77a18
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -424,12 +424,11 @@ static int query_gt_list(struct xe_device *xe, st=
ruct
> drm_xe_device_query *query
> >  			gt_list->gt_list[iter].near_mem_regions;
> >
> >  		gt_list->gt_list[iter].ip_ver_major =3D
> > -			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt-
> >info.gmdid);
> > -		gt_list->gt_list[iter].ip_ver_minor =3D
> > -			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt-
> >info.gmdid);
> > -		gt_list->gt_list[iter].ip_ver_rev =3D
> > -			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
> > -
> > +				REG_FIELD_GET(GMD_ID_ARCH_MASK, gt-
> >info.gmdid.value);
> > +			gt_list->gt_list[iter].ip_ver_minor =3D
> > +				REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt-
> >info.gmdid.value);
> > +			gt_list->gt_list[iter].ip_ver_rev =3D
> > +				REG_FIELD_GET(GMD_ID_REVID, gt-
> >info.gmdid.value);
>=20
> Indentation issues here?
>=20
> --
> Gustavo Sousa
>=20
> >  		iter++;
> >  	}
> >
> > --
> > 2.43.0
