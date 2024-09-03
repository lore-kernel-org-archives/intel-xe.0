Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3BCCD342F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 06:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7876910E3D5;
	Tue,  3 Sep 2024 06:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxOlGC4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EF310E3D5
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725345032; x=1756881032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPIcoMrwDITCfjfAkhGo6Bdg8m6bIngmeJ/eltNhmPg=;
 b=MxOlGC4q10VWI8IyPX1qN+yIii2AyfNqQ8wmDIn4uDIBzLXDHOTyenNY
 vLwuiPEkHVL1nIu3TiXvyMNbAqY2kgK8rNZUtOskXEKG+NNUG6SaUyCcZ
 Zdrx+v5SdmSMcxpCheq8Ec3wH9HCTw+CybAKeUKIIszzO8qmIv8GfdVRK
 9s6kABIo88x+JIBaqh72xXZBBFR9TALos/Br+Z4kA9DNuw1lidQa/48SJ
 BTOg3MN01roxlfvGNFX/6A1v4clawSpv72Z5RnJdytT+plOoFHtPPdkY4
 zufevlhy8jGoFwOiwgzI2kUqQQpmBLsrxb5YrMk8G4w97jT8icsVi2UZD A==;
X-CSE-ConnectionGUID: T4tIj7fTTpC+EGGyHmHkTQ==
X-CSE-MsgGUID: ilHU4P8JTWKpLe3mTbhuDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24104996"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="24104996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 23:28:58 -0700
X-CSE-ConnectionGUID: IWOHlXBKQWW9Z3Lj7s+kXQ==
X-CSE-MsgGUID: tPR4SAspTVG9jEBb29BLPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; d="scan'208";a="64429030"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Sep 2024 23:28:58 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 23:28:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 23:28:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 23:28:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBQFgqFb1WGkEyYNzRyHP1P3tuhCStQAnBKJRIS1TrVMP/qXzCrlqeWliXsz8AWJFuRNiGFKbFfvfiLo/rG0V+GeSDgKsSUPyy+0BKNd5JEJuNCMmGoUnE42/cP7m2+GEZAsXp4dtdhLdVPC0YLyWxOoddLfJERFJQkdx4jSOWE25snEnQHc63WB6YtX64jq3RvAuO6QjU2dDU66iSxPQC3NqOzkYmb7gXXZ5aozelNFFGJ1yOc0BiYFsGhOQymhOsJRzDX0CRdD1/6fgRsEwLGkK0Zl0Jts5kaX77q/9QXxvkJXqx/h1dKVUFpkPX8EN2j6jGFg671zIs/KNUJv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhlG5rHIXZOAxAWH+FWiTcfZOUNpAUGTNkeJ1o9s1/o=;
 b=eLNKsZNFq34v7t59DVghp1BqizUtge6KW+A/s6XjRRZK67jpRrKdts3d1TQZaBbD74RW889KbEsjOOjP5j0eXeMMIWb0Rl4Ux7APgsxRFZ49DPdFqox0+dS5qVwbrVXAKKkF8HhVC18+JKjvklxoMhXJ4Axr9iOxuqg/FMHSodaTJQPrVDnkuCNyXSAtegIJnhewX49dcQSbiAyyZ6M7kdhf2thpla1TbgbnR2JMCqHImWUkc1g/F57BZo3pqaZQBIsFC3QSgraxOoF6lfsFvfQebnAuL/APeLAOWABC47mZwpC2Y8poCjaWVvjPG0gN5e9VgqOdzdOxbRrvAaUrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 06:28:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 06:28:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules for
 i915/Xe Driver
Thread-Topic: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
 for i915/Xe Driver
Thread-Index: AQHa/UOmwZnLEiJl+kCHE913zQii1rJFmhRw
Date: Tue, 3 Sep 2024 06:28:54 +0000
Message-ID: <SJ1PR11MB620431508E06662033257E0481932@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240902141041.18467-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS0PR11MB7312:EE_
x-ms-office365-filtering-correlation-id: da484dfe-0857-40c1-8150-08dccbe1aedc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?zT/LV8DyFyojpBf1TWiOkSYBA7TdUN3fK8wsKngCeLHex/a3/Ufgqb9Qhy5E?=
 =?us-ascii?Q?2UTWKgi1afy9Dg1lRwt1ZKKBZ6oCLMVcnm7YEI0w7ocyQf2Cm3NUThZ6WH10?=
 =?us-ascii?Q?70g9ijx6Xj+4w+ayT5qc09LnT0ViSn51p4u6MIDcwYWfMbkDL2EcSC1618L6?=
 =?us-ascii?Q?dWPZF8LTJ7szz9or6b0Rr0i1uqdMNqbuzN3dUui6j3natWXE4EiQMRS9d8ok?=
 =?us-ascii?Q?lIt93m4Lwg/45T5QJNLxWvX5PnNkt8bFUWUXQezmlIhpPXks2NocCmx9f1xV?=
 =?us-ascii?Q?vouOUtMg3IkM7R3XD1oIWlWGVHDbEax8C1RrIS6v5HI7tB4Lz7BJP2sykSUA?=
 =?us-ascii?Q?OZvgsZnismArt5lLEVZEEqqB4K3q1p8le/kJ1XckM0pLnD8yRqIGXHKAgQE1?=
 =?us-ascii?Q?tf766otc4ddsTXIkx02N1l/IXbE/f0KOHOmHSgxX0OnKN94Y7eDdV3wte+7k?=
 =?us-ascii?Q?yp1ksgAt7w65TSD7D+3QEHGgePMJnK2AxPM1yyEo54SN0tiMEWnz6tFqYWa2?=
 =?us-ascii?Q?mZb/OfC46R0ozvYms29T+zDy4aiXsxMWaMrdxhWmdDNb+EwwYwemVnBfVy7L?=
 =?us-ascii?Q?lq3+Co82EX6LwJ/gqwZ2NkIR3fj7Nl30EVtgyeyxIwmy6ONJN2BZ7wIon8Fj?=
 =?us-ascii?Q?KwjNIar1QYJqzhWI2/th/EMkhbGUhGerIrVhZ8l7lK/K/jqnw7Wnhc3s8o+i?=
 =?us-ascii?Q?JeFS+97JncLHAqf6hrKubGw0pI9sBxbmOd28SDn1dowig1NqUvMWUbcs4Qxj?=
 =?us-ascii?Q?m0/uIARNHYb4WcXQNRwKQbmbdatLPw7Ktcdec1sqlCo9R9SUwc42T+wQFVB7?=
 =?us-ascii?Q?daF8mtUJcn2Imp9XMhfoawaZduWIs8DqeicBOiGIUD6DbjyIPubWmij74LuP?=
 =?us-ascii?Q?6WqZj9iqNVAlujzH05mtOZliAHPug0m23cYJ5s2Hpaub2vOytlBbdyVo+KBJ?=
 =?us-ascii?Q?Bal3aztYxLdSH+xNSoCTSgfIGfwoh9xb3rwI1H0DCYDbNe+U/U4XqQ2Jidjy?=
 =?us-ascii?Q?6VagmEc0vuQ9cuDSjLVbvGaTdEJdbCgGK1SQzYKcexyVyru7EI6HXcKEzOah?=
 =?us-ascii?Q?vqW+/Ej4suAr31cavMwe+1UhshT+iL+U/sFMom/7vGoByDUbEVuZgelUjS+S?=
 =?us-ascii?Q?gVGPVUQIhc0VHlqDrSk+iHatJWLhq/WxPaKp2Cct79GYf8YKWLB6FzFZT8lW?=
 =?us-ascii?Q?weNGGbF4phgC8uBQXRDNvQO4fiodhQ2emRl2XKHAVAED9HXdJZJqhuX2J+7X?=
 =?us-ascii?Q?Tos5BjGCOCENL6V5jEhXkULjG4xqhWvGJ3jquYHo1LPZcGmjsrheysOmiNn9?=
 =?us-ascii?Q?SneXtoHBbt0jcfDBakrYh3wUMeIDMA/MZC3u4ol7ZgcPT5cBeNn6SG6I939D?=
 =?us-ascii?Q?JaqhEVY5znFOq4fjCGinRieEb+M2szMlN7qjtmj2h9wKigO/vQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fCbZQBFsRA6dxzYhDvH6A2cFoHgraA1NvV/cXijS89b1S/X1juXMQbksH4xA?=
 =?us-ascii?Q?RRBdoLWTGV1RX0tJc1e/hsY75qAnr7iP+6Dh3XX5t+WEwmlK5ESRr81B+gqI?=
 =?us-ascii?Q?eoGlAW3u18vrWCdQdLZWRMMUQdZZh8gdjhIUms2bP3spzhAXiRiMd5mVOWJz?=
 =?us-ascii?Q?+2WmvfhcZJQKJcVeXeCMS3i/ho7IH+nilZT836A5oWpTI62DhmiyzECvgdkc?=
 =?us-ascii?Q?E5tCqmL8GvaeYoBOrGT2TAPpzigLLxgkp0so+FnrnLGsAPkUBivDGzRYF/ST?=
 =?us-ascii?Q?kNpa3cttChX6vq88upUvO42LQsFz48T2JYl9RsqJL5RLWNWHCJfqt49zr9ou?=
 =?us-ascii?Q?Kyt4Fl6+YxbDarx1q0nz45zI70XAfLKxE5i2u3nix0zUUpoIVoWWMzxDISHh?=
 =?us-ascii?Q?nGnLdjq3EhbDv+xeIYl+H+dBdEJwl+l5i60roH16juu5+7+yBMKg4m/uncC+?=
 =?us-ascii?Q?cWAkPUOVNJDPIgOEBtUjbMPtmJ3HgHZaOffDGRynvBCNh+Z9MF4p9cl7cvbY?=
 =?us-ascii?Q?TnRs2LAc+YSgArfFLqTCRrFiPG5IqI4emFtVDkAbzocJ3vfc0GzAWFb5jqh5?=
 =?us-ascii?Q?x+FIK6zp6eZU6NfnuB7imPvMcwvX/nFVYX8j0qzVMTOhrVudLwRK7OsV6Be8?=
 =?us-ascii?Q?6DXjNP/ybKTGUAta7Vy2n8FEPC6Ow1H1KHNIwVfYFJrNXUE2IYEj+JWhOTl1?=
 =?us-ascii?Q?YplM8dx0YZhhT3icoEhyU5WewFQnVuMJhxgalPfFBN668S/qH7TuMqS6zvOT?=
 =?us-ascii?Q?HSMSIKJgc8cvku+ayP/hYeAvITOeRjz/Qbf9VYJ6tCTTBAqfT9b9vF1N1/N/?=
 =?us-ascii?Q?Qq6NrYsGaJuQ2G70d94iO6qRvHSBJiJbirXf0WFqvO4fECt9FDQnL8Zu8Xef?=
 =?us-ascii?Q?w5w8X6UE5EvDHZV60FeBgsC3HE0mJdynd04nL4jIxNjdJzYMeL0JO7QyDF9v?=
 =?us-ascii?Q?r6bO/qekiC+IqsmYZrwbJt5nYTvVqU0jWPLwsaTQoZ6djb2yd9Tgn3AvdHUp?=
 =?us-ascii?Q?UKRsfnTC29/y0NGtOyp557qBky6DHdq6tT7bljEJlcwnlz3pUJvJbEagXwyq?=
 =?us-ascii?Q?55ZFOkbBITl7PacAqKAk7iyj3XNGRpSPHiQ8hQkhMmrmfZ4sra/dvoEKptz7?=
 =?us-ascii?Q?Oyqiehfv2lgAouswdmt5qEzRkcPzTxWdSm7uiNKIIFCFwZa7aJDayNq241J4?=
 =?us-ascii?Q?zNE5uv4W6MylcGOfCnHeulN4kSNOvZR/tSRTmZiHROiFrSk0J5B8QCiqRq3K?=
 =?us-ascii?Q?cUhcO7rSHmyLKLVSKSarB6RAno1zg11Ot20uhXL30bDzX5afRzx04RO+2kq+?=
 =?us-ascii?Q?e7cWqINERYPTLz9tkzeEbnOje9ATAMoldtdCdOSPTH3ytau2F+LkdKOh9W3O?=
 =?us-ascii?Q?lP7Fuez75e1LwsEgVujtWOj1sUDxZP/IWHnlDJQPt1vlYZK/LjJ0hd9bWEE+?=
 =?us-ascii?Q?l0P/kOUqzM4t6vxfYmEhOC8GnVEuHHe3Kff+5IguR3rp0wF9in1hUWkcPlQ/?=
 =?us-ascii?Q?8Y4ehfOR8KfPCocyvNbGIF2DbNv9mtBb5sAqHpS4SnOax/3v/eUpKzsT7G3G?=
 =?us-ascii?Q?MIn87SEcMdlx1SOoEx9AU0JoxQUcbVONk/Md52Rj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da484dfe-0857-40c1-8150-08dccbe1aedc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 06:28:54.1200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxKCN23nvgUedWqsZe19+nFYe4aXke6VhKqLV9iUAWwYDmDbGrDCPCFyDDzpg1kXBDToNodfeSY6Q3hqmS4P8TBKlUSWWScvaSzgBjSMtFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bomm=
u
> Krishnaiah
> Sent: Monday, September 2, 2024 7:41 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH] drm: Ensure Proper Unload/Reload Order of MEI Modules
> for i915/Xe Driver
>=20
> This update addresses the unload/reload sequence of MEI modules in
> relation to the i915/Xe graphics driver. On platforms where the MEI hardw=
are
> is integrated with the graphics device (e.g., DG2/BMG), the MEI modules
> depend on the i915/Xe driver. Conversely, on newer platforms like CLS, wh=
ere
> the MEI hardware is separate, this dependency does not exist.
>=20
> The changes introduced ensure that MEI modules are unloaded and reloaded
> in the correct order based on platform-specific dependencies. This is
> achieved by adding a MODULE_SOFTDEP directive to the i915 and Xe module
> code.
>=20
> These changes enhance the robustness of MEI module handling across
> different hardware platforms, ensuring that the i915/Xe driver can be cle=
anly
> unloaded and reloaded without issues.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_module.c | 2 ++
>  drivers/gpu/drm/xe/xe_module.c     | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_module.c
> b/drivers/gpu/drm/i915/i915_module.c
> index 65acd7bf75d0..2ad079ad35db 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -75,6 +75,8 @@ static const struct {
>  };
>  static int init_progress;
>=20
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");
> +
>  static int __init i915_init(void)
>  {
>  	int err, i;
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c index bfc3deebdaa2..5633ea1841b7
> 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -127,6 +127,8 @@ static void xe_call_exit_func(unsigned int i)
>  	init_funcs[i].exit();
>  }
>=20
> +MODULE_SOFTDEP("pre: mei_gsc_proxy mei_gsc");

Ok, I read it again, its " MEI modules depend on the i915/Xe driver ", shou=
ld it be reverse? I got confused.

> +
>  static int __init xe_init(void)
>  {
>  	int err, i;
> --
> 2.25.1

