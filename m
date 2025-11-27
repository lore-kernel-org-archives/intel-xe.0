Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26370D11183
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 10:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25F010E183;
	Thu, 27 Nov 2025 10:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9p/18ZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABF210E183
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764240414; x=1795776414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oyyvVPLG2JHbBRHoduvYoVN4NlmZuz5W6M9H6zzaPiM=;
 b=a9p/18ZBUNBJ2euMMzRvqN94JjFiBSoVYHP4nXHjbErZsa+9eE9JxBO2
 nEAHJWY+8xqT8iD9fRTWJPUisNhfRjlKVbEV8OxNJk6k1yigUdrc3D1Y9
 laiakKnn706kO9hWNfP4XYyiPMhovV88U2ZoH7vgWY9MKX10Fp/PsVZWA
 OP/+p41NNdT7SYuXi8fOcweNp/yzJI6o54A8EhJTN/ax06lW9vKHhFL99
 m/zhNWjIduajxDyVdcF8a851IEH3Uf57vRMhRuou0pAqLL7NH+U6iGhPB
 3GUZCiOC03m1TzgAwjJjx8MMUv2KLvbOGLcJiJNS9g6ueKKPUNVBt+iaz w==;
X-CSE-ConnectionGUID: 5/rMedqnRamohvxjEYLh3w==
X-CSE-MsgGUID: 5QawmcKYSpCRo18jOP1Njg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70152944"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70152944"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:46:53 -0800
X-CSE-ConnectionGUID: asOBNY/6SXCHhV22+M/p9Q==
X-CSE-MsgGUID: vJmlhrP9RvqXd9tLRBKW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193108706"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:46:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 02:46:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 02:46:53 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 02:46:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/XZpxXipiI+y5X0n0Gh3LYOxco72Vm8XAhiQlPQWbRR/rLB5HA1CqqETJO2TP6M2K0L5cdOAE+lKMze8dpjiOuPi4D6B5c7fC8pM27NV4V6qmEY1F10+XkkKn1B0ls9McGvShXUWjLMdWuQNCeXJt2NXaSzKcZ38TWBpHzaKujG45CgyzbWyuxmk7/atHmDJ1kVJjWgOriVsecjZ22+Tj7RXAsMhe84+5XLDiVGDmES8+Wj/aMowAVyudukGquS4/r0HdXT52hAkeEkwBTCvHhYmgZgqFe/F8k3poMagOgENGiVJlQRhDtN4EzD7/HTm2IEVdVtS7KMQRRmsldaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmdaKW8ClRKJZlgiPO3QigObnQHdDGFW8T/ZE0tgNLU=;
 b=DyREy2dijxofOj5q1g0pwXhVtC3rq62K7kOW4jUjPCvMmPpwG3q/sVmjbshKKth3L+3d0538+pvyc8bq3my7lO6yKHShx9aBU6yXGh2u33q7EuCedcCfq61w6wh7LlALrjcIz5v0N8TPbRCW7Y7ojKz7BdczwTurXUbNL6cwNkzVeqIKrU2AuVp3Tf2w7kxurLP28nYY6K3n/ADADwKdxviGQuN+K+/SexFqTMj3Wg20Tz2HAq8ffVnPM9E0Q4Rfk53WGwjebVWTgNnLFGWjtvZ52DHxqZgzJ9YmbUba1lqw8nySYY/7Ac8A/RTshjW3xooTx/ArWG78Yd3CUMZ0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA4PR11MB9347.namprd11.prod.outlook.com (2603:10b6:208:565::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 10:46:43 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 10:46:43 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>, "K
 V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
Thread-Topic: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
Thread-Index: AQHcXXT+rkQ/3nZVfUO2sVKvLo+m8LUGWxsQ
Date: Thu, 27 Nov 2025 10:46:43 +0000
Message-ID: <LV3PR11MB8695F2D970C3371714FE4DB0F9DFA@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20251124190237.20503-1-lukasz.laguna@intel.com>
 <20251124190237.20503-5-lukasz.laguna@intel.com>
In-Reply-To: <20251124190237.20503-5-lukasz.laguna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|IA4PR11MB9347:EE_
x-ms-office365-filtering-correlation-id: d77a7475-6cf8-4cac-a1c1-08de2da24110
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?iuJ04xFzv/z192yX8Zn8mx4tRhQSPzNW//qWpzQPhabLtJWGwzJLM/IUuM?=
 =?iso-8859-1?Q?gdPgFpk1hBaJq78mdkMu0dphhMCK50OVnS8ik1wh8kZFfhivAhkhnTgILV?=
 =?iso-8859-1?Q?mXbfx7Bc73v3MSwdmeHqcricRxax1/Ra5TlZX1zfFq4K1+fgz+81dVAsoq?=
 =?iso-8859-1?Q?e35LnlCvLnyseqr72SwBxMy1QUh4ih4aVA4K5cJ/2rWtVITgYoOQceGd6z?=
 =?iso-8859-1?Q?/218iJYiQen4yW/96sAN3JIgm9RAJMpMhRXbLfyRRbzBBdt2QaitcPgs1x?=
 =?iso-8859-1?Q?s57Z2JRVyafccvO6UZVoS/q4UERZTfXPnsOqGugv2xdyNd/KgYR6iJpkH3?=
 =?iso-8859-1?Q?1OMS6mJc30lkCoyKb1zJ8qT0DuDPFcToAC59KN1F8etlK6qIoFqwBCjQGA?=
 =?iso-8859-1?Q?Ch/93UyBYqDRDjMCvWkkXhrD76Try4aequV1FKtPfKMIFAXe1YuRbaBitD?=
 =?iso-8859-1?Q?ai0AnyYDiG0p34m6nw+PxdduXGNBJpAwdfVrImMQX5IYXwpAh6P/wVgdsx?=
 =?iso-8859-1?Q?5DSefHWs7WM0hyMY9ZW9K69G2KWwpkWw1bWGXCkCBLyQZgfo+x+8tsHc1s?=
 =?iso-8859-1?Q?TCaYVHpLGDqg8brTZoItJLY3ss5JYVz5xiwx2R1W76sNvdOB9W3TWRmrot?=
 =?iso-8859-1?Q?ehxfwFIUGSWn7xA8Hd7cPl+ka8smUlJwa/u5KJrljymHnRuK0KWOpc5Hur?=
 =?iso-8859-1?Q?Lgc5E73rQCxG580Ttq0dGiR+HRSBDeaYqh83zNL3Ik1xYqydeoRqeQ1cKY?=
 =?iso-8859-1?Q?eeaVX2IcA7rUAsqLs3VXiQXyBovyti9xMbpApcyMMc1kvEz3XUxkd8QN/a?=
 =?iso-8859-1?Q?mzKiHvLOmZzaV64LNWcKwYxTMzeaEq4l8zrPCcuy6jJIJAXfEr1YLMH0Sb?=
 =?iso-8859-1?Q?AOs5Dpf9e4j/sDxoXeHC5Eeb7WuG4MSYmn9BDkF3AxBVqwc3qio4CE+jR8?=
 =?iso-8859-1?Q?pb3o0FKP5E/84PTd9T3ezKYoNe6pcjVeL93cSeYOL77VO/eGP10URRomnC?=
 =?iso-8859-1?Q?DvP/b/7S6FGXIeEy3j98pQ1gnD9jPbrHsT12Q3icVr1JdJ67WZM2mxcBSk?=
 =?iso-8859-1?Q?7fKvsNULJTaDWBYJPY4IdxH7Wlj+Pp5OwseLanLLI88WQStbDP4tAFJVPM?=
 =?iso-8859-1?Q?RDkcrRcN9CaWtUri+X3H4/Y638WHlDoaArHDQYYJyKZVKmikBjgQrb206u?=
 =?iso-8859-1?Q?1Ywcwk3fQ4Mcy2stmGuObi2z3OSgdaN2d3MadzflJtr3VrCVfWqtDBqkeN?=
 =?iso-8859-1?Q?n6hKo2pK24iOst8PAzpAa9iF4o4abjd5+cxgTzkkBXEujxPyLjLCADFcIc?=
 =?iso-8859-1?Q?Eg0MAylfKcEj+ZgNJJOWSBrLLckNJRE0F62Z+3AjgJvRojSKmhZ1VKtnP0?=
 =?iso-8859-1?Q?Veg7y6KmKSnX2HVrjFIiOrjoWyEXhKz8QlE1EvzphK7YozMK/KMcu6mAgs?=
 =?iso-8859-1?Q?GUz/swrUA5/FNdEdgNuSL3mhxGxSNkvFFgBvv9b0lLdNlzw7Ok6Be9rxg2?=
 =?iso-8859-1?Q?u9shPu9LgrgRmLikiqtH6KFJcish9GCqqx/QBF/zFNhv2mKRtK/B/IR3An?=
 =?iso-8859-1?Q?0s485nc10gNd+j4rWuPsB6czvBNk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vQIEWWNz/W2ErP8YpPNGRQ1XSoSglkt9bi4ul5SvjVHYxap2ET9kqr8ZY5?=
 =?iso-8859-1?Q?IsYdjwrLlwPcijQDBk8YBKjiuMLDIa2ppa82a56UVNMlQ9khvtlOEZ3iDl?=
 =?iso-8859-1?Q?nozF4Pf7IBk6as1x/gbA5Vv+6NAdv3Rx04gF3esyn/sJX7JZ3lxrGVtB4B?=
 =?iso-8859-1?Q?reR/sULxalZY8mNkgjg60GY+t18XHUzHrmiVTjZ4FrIieakYQGJQwUL96y?=
 =?iso-8859-1?Q?ByG/QasjcSMIdk39ws/ghV725Z62dH/2fF6XQ7s/x0UlQUr9gDlcjt1CsT?=
 =?iso-8859-1?Q?yR01J1Sgj3gtDkPQ8sGsQVmm9UTe6PJrHUhVm0Np6VITVs4cdfIB4pRGng?=
 =?iso-8859-1?Q?p9Xz1ccQt/tDDeawVuLCbQSHLxgxwuoXAffRKab6O80OH1DZ+ooRXjh0FM?=
 =?iso-8859-1?Q?ssuGJ0kiBfCM4gdxF2tmuVkoTkZReO7Sl4KF3LQIHzaABJw/GsRJQtIKFM?=
 =?iso-8859-1?Q?fwCuPigTHe2NMKpQuFdRc22yGydIsZGcTR9l7EgZbN9d/oyVDI0awosmpT?=
 =?iso-8859-1?Q?PXr+YC/LTGt1eON+ubETn7Mm0zYacmgbFDFuNGc3hT37RJEdTdYdReObN6?=
 =?iso-8859-1?Q?sTKgXwZW1sqebNHsK54PQHu6nBSngaZfvJvUxdiSi9SE2ajEfsytFyPzPX?=
 =?iso-8859-1?Q?zWrL1JMAO5LcuegYDxLlhdjOXESi0/qRAfeSNwD8DyeyLt/n+FMxi5H3cf?=
 =?iso-8859-1?Q?vYcgZZeoj0hw5hiuC8US9kq57C6Czl/8oh57AHacK3zIYlBPsYB+zYGNAq?=
 =?iso-8859-1?Q?wQrtrxTHkui0oFVydJf/eJJt9DBMTcti+VaUEbzIrNRd1Q00XlexGX7G42?=
 =?iso-8859-1?Q?Ou/pKbURigkuHehOFL912wOGIZVeby5TPaxPNgLlDIgq6/5VtXgTmRiKnd?=
 =?iso-8859-1?Q?se/f0TI9xxT89wW3uLigZlM30RhxGcj3+UsBaGzPeSvYzjoA2IU9F+sj+3?=
 =?iso-8859-1?Q?T1aBajJEyBy9ozwujm3dfVtaJhOSFLLFuiev52S2nHLg7JRDjHau0oWaCO?=
 =?iso-8859-1?Q?q8S0p9X2GEyiPjH5QHy/l4RhPTWqE+5RgkuUZQE4m5bx09eqoKKHO4oUdm?=
 =?iso-8859-1?Q?oabo8lQ94OgW3i61RAnYbdLsJjlkZb7Je3LrtD4PYp/IzPNmeZVjzc6GQc?=
 =?iso-8859-1?Q?1KV4WmvwHVOkQ/ZaKYVrbG5oaOWDL6Yabbw2CQWSw/H4tjoYSZq5TG0h9g?=
 =?iso-8859-1?Q?p9JuVD3P112al/zUrga+vwixtWjiD0do5hykoWM+zdoylG4I1hw5LAWZoU?=
 =?iso-8859-1?Q?bwFsnDW77JAoS8zNuPMZxB0UUt3ueZ+ZJoxUdiBPNJP6oBJo4cnIp/qchG?=
 =?iso-8859-1?Q?SNwn3maaR8o50xraq3Tur9GsErrx7xABMCKGS7p8Na14n+GE1IgaXv5WCi?=
 =?iso-8859-1?Q?PRz55zFDjkVEoBhhaUc5CFma9RvvuE3TnzIDAYphv3GNzf3EgcQ4moyHRR?=
 =?iso-8859-1?Q?snKFhNEwL3EtjUwcNqv7GIBY3gmzA8FVvqTaTAAvjhqd3vuX7se6gnehRD?=
 =?iso-8859-1?Q?qOVkWWyXhJOd9wZmaNCqg+UQESKZIRQtxZ31y5HX0g+5ZJcKg74POTt1AE?=
 =?iso-8859-1?Q?mgm75Iayfl+uPOUWNV5J3hqu9DGlksRrJa3SPWN7+vgbnrU6LWvXjRov0F?=
 =?iso-8859-1?Q?x99CjamUQlRBREqWOhIFdErmvfh2IIaYkYPK57tuED7/dit0epO5+i+Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d77a7475-6cf8-4cac-a1c1-08de2da24110
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 10:46:43.2182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZx6w+wVcBmHSg8v0y8uo5sKd+KApyqx6sh8E5XsLxwmdXbMY8mu9BerFe1pL0G7RYvKKeNXIxpy3SdrMUWa0naeHwvAC41zo4p10KJeu40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9347
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Luka=
sz
> Laguna
> Sent: Tuesday, November 25, 2025 12:33 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
> <piotr.piorkowski@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
> Subject: [PATCH v3 4/4] drm/xe/pf: Handle MERT catastrophic errors
>=20
> The MERT block triggers an interrupt when a catastrophic error occurs.
> Update the interrupt handler to read the MERT catastrophic error type
> and log appropriate debug message.
>=20
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> Reviewed-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> ---
> v3:
>  - use FIELD_GET() for consistency
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_mert.c           | 11 +++++++++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index aef66c04901d..c345e11ceea8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -10,6 +10,11 @@
>=20
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>=20
> +#define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> +#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16,
> 9)
> +#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
> +#define     MERT_TLB_CT_LMTT_FAULT		0x05
> +
>  #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
>  #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 304cc8421999..f7689e922953 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -55,10 +55,21 @@ void xe_mert_irq_handler(struct xe_device *xe, u32
> master_ctl)
>  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
>  	unsigned long flags;
>  	u32 reg_val;
> +	u8 err;
>=20
>  	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>  		return;
>=20
> +	reg_val =3D xe_mmio_read32(&tile->mmio,
> MERT_TLB_CT_INTR_ERR_ID_PORT);
> +	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT,
> 0);
> +
> +	err =3D FIELD_GET(MERT_TLB_CT_ERROR_MASK, reg_val);
> +	if (err =3D=3D MERT_TLB_CT_LMTT_FAULT)
> +		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault
> (VF%u)\n",
> +			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
> +	else if (err)
> +		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected
> fault (0x%x)\n", err);
> +
Shouldn't we log with drm_err when catastrophic error is received?
-Satya.
>  	spin_lock_irqsave(&tile->mert.lock, flags);
>  	if (tile->mert.tlb_inv_triggered) {
>  		reg_val =3D xe_mmio_read32(&tile->mmio,
> MERT_TLB_INV_DESC_A);
> --
> 2.40.0

