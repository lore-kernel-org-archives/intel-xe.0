Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F56EC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 20:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4AC10E249;
	Wed,  7 May 2025 20:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aInL5CCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3F110E249
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746650197; x=1778186197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KvPMEIlEnTtm70Ycj9N89qcaOOFUFlhyE7zhp0tL0z0=;
 b=aInL5CCEBGxHQm27Aa2SdRqNY9E22xxTrSmmejPe4twZry5WrQArj/lj
 swnTCaEMUGjXvLlCgEWYuvTIwLpW3ddWoKCX2HfIItQ05aMgoW69GLij0
 srz6Alv4Mn753Rv3uP4ezV6St2Yoo9kqNqkWmEi93Uh6uvQa9g/02W1FW
 54OoPlYXy4ut43JBtoweMNl89HPzPeMCSBoTQdRu/7ca3SPgEXNQMFwrS
 WeLHbdhBMBCN4j5XIlN0mL0UUUPV/hOnOe41cdGFZVY47MlT0df3IC+JY
 EPYXeb9P6LnEdt4stayzyghSFd0EXTjp6G/F6YIkIblpXNsMvJhzfMNuB g==;
X-CSE-ConnectionGUID: M20OrVimScy9HFoW785BOA==
X-CSE-MsgGUID: heKkfHa5SSqh5gMtziL0Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59396483"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="59396483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:37 -0700
X-CSE-ConnectionGUID: kP8/0yOsRAWYFzNVUv0fxA==
X-CSE-MsgGUID: Vr02ab8qSjaX7booce+aAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="141038337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 13:36:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ss/K1wLLGhao+oDcDB0bqkhCHhd+0c+Ev29iO48S9M8yi874ynZRzk/GfzV59c0eYxiIg2dtyqeBrhVg+s1rp86XVUSMO2noSSgkBmzNgaXP/o6DoWmG5+R05fA3C0tHOLF5r4yPXYYOHnxeW7RbymLHiqmtR+g3V2AJuZ3YS8WhRqNwrbL7V8d8O5tRDBBp8tvA3BesyEdf8y7JT46s4jjW9U2Rb5EaAdtaxoklTphNnK9g82ugA7oMrU/oggJxe2vbMLvpddqXogPYs9wrXmZHKk9TNvzvi+HEkxVccmZHpPJ21GGrjmjdUqyzihD9cDTbdlTmgPhy3B+QDQvBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3NubJRZZorVAnP/Uiy9eva74E3ezuNxn3ue+B8MN2o=;
 b=gaqFfJWByGfkiB8cZ3l6DHo3nEjSolkBKiKO4Do+esxi90FxkmkdQu7GtSecVCkryOQBFMJhXWAczMSd75AzsvQGU1zBqp4NLEotKUoML83jmIktjPZpZt2lIRzemedAd0OG5BRRsjmcfheGCl1C5tx7RTLguElZyCWVAXUsaO1Os4rIe1ntVfpuaTQLyUkIvkKbgZFPNGSv3XKdHu/EyRhPOk+m3A3Y5+Ie0UsjqtzpFQfYHgpDX3+4maHXLbwuUKCS1xXhGJ4wHXAVWET/OFq5oZgUJ3IW5BYAGuyUspF1I8CGl4bb34kFHZI41Jbm3iQCAp9reTPq6yn0mW86qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 20:36:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 20:36:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Venkatesh Reddy, Sushma"
 <sushma.venkatesh.reddy@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap
 properties
Thread-Topic: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap
 properties
Thread-Index: AQHbv4yqa2kmly98qEyANTM18ol2U7PHm1gQ
Date: Wed, 7 May 2025 20:36:28 +0000
Message-ID: <CH0PR11MB54443926ECC62F6A064CDF9AE588A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250507201539.1316770-1-matthew.brost@intel.com>
 <20250507201539.1316770-3-matthew.brost@intel.com>
In-Reply-To: <20250507201539.1316770-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB7886:EE_
x-ms-office365-filtering-correlation-id: ec4d1fc6-166a-449d-6c63-08dd8da6d82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?DhcWUkjcnpuvUUxrmQU8y2yOD0b6R+Oq76MLSpd/xtVkJRpOSyP/A3Ojda?=
 =?iso-8859-1?Q?ADRNqD/y9OGJIUHQKtJwkGBG92dIIxLrkXiP+MoWzHgjpW5Lj0X0CYT4n5?=
 =?iso-8859-1?Q?cpc9D0bedH01MxaUlW9Bemqxes1+NJBm3FPUqVo0LcykXvwq1XJG14sZFO?=
 =?iso-8859-1?Q?rzHOfWdKrwOS0PGCkhzXrmncA07p2YoCdomhUXv1Z061+F9Ql/1FejBKg3?=
 =?iso-8859-1?Q?s4x4GIABF1xLoFglzYSSjBH4uo5qOohQELpRKlZidmnnHCf7OIuBhIa1Vg?=
 =?iso-8859-1?Q?0dHTcC+fqulSZJ9z38aATLm1xxyuY3EH3RhW6HDkE6B1FABalH0S5ZGqZE?=
 =?iso-8859-1?Q?xRZseutmJFWmfMpVwI9DorxFAo5Vi5hkxNDWJ8XwrpZjOtCM6pJAUIo/Aa?=
 =?iso-8859-1?Q?JIMRuC5TNfHsYfaey+lJ9PSZKZ+xK/fR/5+oysUUcPRSQW1gP0NIPOZwtM?=
 =?iso-8859-1?Q?5EK8S5cl7C44EOTWLEAyLe3bjfdEUBCtmCXdYlJjgExVm2LS7FbjcizO2i?=
 =?iso-8859-1?Q?Z94k4MNTtWvOfg/2qSxPSC3a9l1NxVCig+TlYDlz1bTSW6qyjnO/npD3pi?=
 =?iso-8859-1?Q?0GJLoF5mspKRg3ESnKW/S6ru7vKPm4XCejf4cEJUEf+x6ejJEu1ATByAgX?=
 =?iso-8859-1?Q?yhuQ+Bc/rutOrB+OwyKE4rAocaHc58kk1wWd5xWXPMlX9EBxrHRfZfqZab?=
 =?iso-8859-1?Q?b+UqvmrDudk5i/A/u2Sb9ET7cyFdMOfCqjChp4iWk6lfx0vuooEoZDnNBr?=
 =?iso-8859-1?Q?+8oR9BpbE514Gv2Ma3bMBcnjF396UYFSvsNAZ6KBkljybRlckp4894F1TT?=
 =?iso-8859-1?Q?ADNy0cZbiOh1dr3GLZwjRq9cxTUO+szqWVex2bz1e8PYR6RX6y3cqPdzX1?=
 =?iso-8859-1?Q?nRD1q1Wgvj7s23RY2gaex10xUUEcsU8d/y2aYxgAV/QfZiwlHaWZ+U9zR0?=
 =?iso-8859-1?Q?eSx6Hcn1K4Sg/2nWaQiDXj6VYPqcF732WcCsiM6bDy6WFqIEiaEJJznVY6?=
 =?iso-8859-1?Q?cT6m6q7KK7pNLag/W0JpnywGdD7zMVWYFB6x62m4Mg1uarcLjxYUFzRLzi?=
 =?iso-8859-1?Q?MYqVn37pqGAqYEZ7KdkU9MrStudXjQU+V9Z+hY+epy+2utmPeZxeBUCLYi?=
 =?iso-8859-1?Q?bTjgvm8u1UbDbmEluwVk0Pr5T/R/1DerxAw3+LnqEuyBtAU7l8QWOyuiZ6?=
 =?iso-8859-1?Q?ZAtwIjsQdhEJSh0fSWqVJEEo+i8HUVEz3RkOzInN7KZIiLpkN+/vjfnJ02?=
 =?iso-8859-1?Q?v+FUWCOusZpRlpQi5SdgehcrDjLgC3G54tguRRF+7IjrfJer32M14anUxF?=
 =?iso-8859-1?Q?H0VtW7Bm1LJn2LocqiZuPTSFZRx/kjz/0bcYFkARgYAuR9acW2fQ2mlasG?=
 =?iso-8859-1?Q?FyptKmTcTVVj8rSmdxoE8J+vnt8EjDxPsBzM7jhWOAnxQEvNyHg2bCM+33?=
 =?iso-8859-1?Q?NjUpEL+VPAsTGZjjjVEjKZJ5qD8hB2CTrNtJiLUMLJRMH1hiqSpSAXoNKW?=
 =?iso-8859-1?Q?0gzgQ4ohEyAhVOmdyf+B/ykT7t5UarEPIWff/uof4SP6mCrTg7NI5Ew7xO?=
 =?iso-8859-1?Q?0rABCTg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AsAdusS+nawtto1JyzpZvYRLSFsbHoYXM/qT85Afpj1WsNh1So7oAmLX+A?=
 =?iso-8859-1?Q?t0giTqCLtuLTWGhcdKIICXUgoGOuyAWPAR8MoKOlf6SXJh8yz3L0G47CeX?=
 =?iso-8859-1?Q?b74roCMyaIt/ksYqPkkq1569l7HNGZZ25NhTZ+5P/AVgb+86W2qY6HFy8c?=
 =?iso-8859-1?Q?9m+81u9ZC35QwibhJbzr1qfomYF+vaEvNiLNtBw/HwESmWfjt8eMjogjIl?=
 =?iso-8859-1?Q?MeSq0WMzfJkwlbbRO9WkSNaqBDyhjhMzyehHSi8D8P6gRnXiOzoU8A0d93?=
 =?iso-8859-1?Q?aST0rK5vLyqGx/Y4Mnf9T6PiGdeN1q8h8fsgs5hToOq9WQEjNwsQodCf81?=
 =?iso-8859-1?Q?4Lo80XqWDCvmwH63OeASr1dBGycUZSuWxRzkGv5CyW009+B0q0494i01ot?=
 =?iso-8859-1?Q?9HNG2R+sJiRIyvuoq57syGx15x2NoWmeGpwvT1ZUKGiXlloY/P0f5SSGQ2?=
 =?iso-8859-1?Q?Z+IfZIOuA40TG2kdKC31iPdhosvmr2U08fF/5vJGXeUWt6M0UKYQB164lI?=
 =?iso-8859-1?Q?Q80BArY1jBo8ZFy04Ryv9QA18CGKZyRMrCW7zhTwQc/Q2ZVJkexfZn78qo?=
 =?iso-8859-1?Q?1Wf/RVD+8lBA4pX/zp72ejWwMl/6Ua7F0lIb+VN2ZB+aUxcYKUUzj2e/qd?=
 =?iso-8859-1?Q?VJHQ12h3QDWMAhxzSRC2H4BvQkpyPdZsBzv/jL2xMzSmRSz7RHbQYItxKI?=
 =?iso-8859-1?Q?LZDCzvDuY2Y95OY6pmo9zpKVh2BS6UsaHuPv5ou7J1Ypajlp672YrxtQrc?=
 =?iso-8859-1?Q?PTvea6xcWfuAmrE45mjVctAQ6czZaNZjtw/SF+2xKPJ+a7iDUaJfBCo+df?=
 =?iso-8859-1?Q?F93t/dEjk81J/rrRYHtaWbcPWL7MR2+ZU6YR3JESDCcc1yfHjGfpghpkHS?=
 =?iso-8859-1?Q?KCrV9ufevdbI6pAU/GFtxUS0KzalbIeYvN4unBd8ATW0Pu27+Zz8eFAvGs?=
 =?iso-8859-1?Q?76+IlkwsW48AjOQN0QdjUMddqJeH4L19H6PqvU1PHpFU1kBQIgqOZlUyfr?=
 =?iso-8859-1?Q?r81HipI9pe7yZbnvbDs19brnoUPR+PdgM+aS75WC8grmcMVh+p7zBrAUux?=
 =?iso-8859-1?Q?/TDHJPR99u8WmuywRfLguRfPoDEDKMYkLy11WastWCDn8/gk1sF3wfeXyP?=
 =?iso-8859-1?Q?olhRgNNpfXByY3/Lxry0BeJU+k54iPWpMJNraAEiUkBqLNJEmZiuwfIe86?=
 =?iso-8859-1?Q?CTu+VnZEhwdlsBIXQFCHRvM1sN8pRVzioJU2m2bcu6LxHJg8weAzhR2nX9?=
 =?iso-8859-1?Q?2KNqxJqLpJV6ErW5uzaIWcu7goZTUgHAZI0I7jRh2e5mXKIANXvGJNg2FJ?=
 =?iso-8859-1?Q?3iF9lmzdYMLBlmdK7p8bTKur+5r32gURIOuzmy+zO5KW/oHRfiLsjvHTHE?=
 =?iso-8859-1?Q?LEkHW/rdQ1u5GoQvXi/UZ9G4hSHyQB6Fr9aKWC4RdqXyM8GcElvVSnPVDc?=
 =?iso-8859-1?Q?pIA8BmedY4SRRLBCNTWjN4+J3BbUXu1tBFMjjEq+lY3Y0wZtAsYnBe++7h?=
 =?iso-8859-1?Q?aJ2Jm+a8oNGjvVlUoqR3KBZH5pjMXugdr5Mf9BVptVmVI9gCDPHp03PrW2?=
 =?iso-8859-1?Q?4vFaRJSIxhlG+vcYtxaQlv+KoM8H+7RCPk9+DNgt088pRcXhsMxwRQCySR?=
 =?iso-8859-1?Q?bZhNaFJhiSiuChm70T0Fl7PGnONBT8Eri6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4d1fc6-166a-449d-6c63-08dd8da6d82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 20:36:28.6950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cwl+tbjkZ/39V94HAf9+soThjEQLlGsUECdC2syUQT5W23Jcr8TNao5CErl6kPzOnkYks2FZ+Cepxm+Rx3aNL0BoptsTfQmebMvSMjQRHpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, May 7, 2025 1:16 PM
To: intel-xe@lists.freedesktop.org
Cc: Souza, Jose <jose.souza@intel.com>; Santa, Carlos <carlos.santa@intel.c=
om>; Venkatesh Reddy, Sushma <sushma.venkatesh.reddy@intel.com>
Subject: [PATCH v4 2/9] drm/xe: Add "null_sparse" type to VM snap propertie=
s
>=20
> Add "null_sparse" type to VM snap properties indicating the VMA reads
> zero and writes are droppped. This is useful information for debug and
> will help build a robust GPU hang replay tool.
>=20
> The current format is:
>=20
> [<vma address>]: <permissions>|<type>
>=20
> Permissions has two options, either "read_only" or "read_write".
>=20
> Type has three options, either "userptr", "null_sparse", or "bo".
>=20
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Admittedly, this looks like it could or should be squashed with
the previous patch in this series, but it's not a blocking request.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ddeec681f71f..95c51834c620 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3729,6 +3729,7 @@ struct xe_vm_snapshot {
>  		unsigned long len;
>  #define XE_VM_SNAP_FLAG_USERPTR		BIT(0)
>  #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
> +#define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
>  		unsigned long flags;
>  		struct xe_bo *bo;
>  		void *data;
> @@ -3786,6 +3787,8 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struc=
t xe_vm *vm)
> =20
>  			snap->snap[i].bo_ofs =3D xe_vma_userptr(vma);
>  			snap->snap[i].flags |=3D XE_VM_SNAP_FLAG_USERPTR;
> +		} else if (xe_vma_is_null(vma)) {
> +			snap->snap[i].flags |=3D XE_VM_SNAP_FLAG_IS_NULL;
>  		} else {
>  			snap->snap[i].data =3D ERR_PTR(-ENOENT);
>  		}
> @@ -3806,7 +3809,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_sn=
apshot *snap)
>  		struct xe_bo *bo =3D snap->snap[i].bo;
>  		int err;
> =20
> -		if (IS_ERR(snap->snap[i].data))
> +		if (IS_ERR(snap->snap[i].data) ||
> +		    snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
>  			continue;
> =20
>  		snap->snap[i].data =3D kvmalloc(snap->snap[i].len, GFP_USER);
> @@ -3858,6 +3862,8 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
>  			   "read_only" : "read_write",
> +			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
> +			   "null_sparse" :
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
>  			   "userptr" : "bo");
> =20
> @@ -3867,6 +3873,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *sn=
ap, struct drm_printer *p)
>  			continue;
>  		}
> =20
> +		if (snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL)
> +			continue;
> +
>  		drm_printf(p, "[%llx].data: ", snap->snap[i].ofs);
> =20
>  		for (j =3D 0; j < snap->snap[i].len; j +=3D sizeof(u32)) {
> --=20
> 2.34.1
>=20
>=20
