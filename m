Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CA3C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 13:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B9F10E3E4;
	Tue, 27 May 2025 13:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXErPfdr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC2910E145
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748351432; x=1779887432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z0gySShzzllfIK5ZhrhUEdiNkxMGiokfq40v+Xz/UjU=;
 b=hXErPfdryozTQ0Ya5J3UWedcWVLZn5QoHPIAzUa0akCrbJBngTgJOyi7
 XZIV1mSQjzBo4DKKr0rvDpZi3k6uc1jHDC0g1OrfwlCz3RM6DQPWkf+ZL
 M11X982czkLQrAYqWijzrWdqrSjropRB38kky/5uY1Tygmz60UbmBERtG
 HK378KmZubooW9ORSfSUH8wYh42GXadve7piInVRz5AA1VJM/k4LnU2QH
 HoyxupaKAZ+5mmxM5Tfa2nVek+9gtcbfqO8vJiHciYvMBvkoPUqjPZ9Tj
 Jnn7k1wk2Th9+ox1H8nk5ROe5N/Ob5d+vsOOPu74bkoqzZjDnYnxn+46T A==;
X-CSE-ConnectionGUID: uTVyjk/yRpOKBMPpWaeQkQ==
X-CSE-MsgGUID: HdH2W2VpRoChvvQgHLLt8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54147293"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="54147293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:10:32 -0700
X-CSE-ConnectionGUID: M0NF5nOMR42k407+E4vPIw==
X-CSE-MsgGUID: q0pJDc4oQaKNxLpv9HaW7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143780931"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:10:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 06:10:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 06:10:31 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.46)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 06:10:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA9PULErPtpSUYV4T8JSGJojtgpBM66Gc3xAjkrPFbqtxilPd6F6nYbF7EZ6Lo2KC0eJD13kt7ZJjP1pPMvB0cxbGwLKqCkR+8Ghpu0J9Xe/QH6dXRy3FUuPcFoZGmOE9WA3+c5YGpy0Sgo/kjGd63jD9N3FdTZiSqXZse25XpTr+hwHDIYOhV61/MgConRlam2K0FZ4+w7bL6EtCKch5eGq303AebeERGA8fJ9RThWallbpZEh9nYkSAfiMUNnJtNuVeT3wepNugin8fcpDbxhUATDMFRV94QLh6VMO58Pv2WkulUPFcNu9av3C+ry5qJgcFepzbVKsedMo3f6oqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ebptCStaIngx3Owg2GtRgTqnrpjk6aYRdbHNP3haAg=;
 b=jo5agvUwg4zbFfJIf5liqLW7hVrMeKaGc7yNI/ZsuUZ7wJUqyuxILda/8G2j987loG7qJ6TEfZYyi25jLuvkF4wVB634xqHPmhGc6+9EfFEsPEVsHUXmAiRylD8Wn5SBfXDGWj09jphOanqRFWP/9Q3zBrPoSkaSPPgK7hx9lzxSo1Fr0lQ2+wSTC61oPVr3SJbd/R2+7Mlu4SyNG3p3nLl33OsRr95X7xmMfIozmstrwQBCelpivMCJZGP72Qjees+HryEnkoHWpUb5pMozQYp9zrNTB0+SWxwsAnWYVvj60bPFqPg7AEl7OzggoeerWLjMd4NtfxSVuO3FeSB+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 13:10:26 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 13:10:25 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
Thread-Topic: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
Thread-Index: AQHbyRSTUV3sEpKaeUqwksFJPBs3ILPmfCqw
Date: Tue, 27 May 2025 13:10:25 +0000
Message-ID: <LV3PR11MB8695C380854DAA1F7F585B87F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-4-tomasz.lis@intel.com>
In-Reply-To: <20250519231925.3196154-4-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS0PR11MB7483:EE_
x-ms-office365-filtering-correlation-id: 909eb1a3-c4ce-40fb-a32b-08dd9d1fd86f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NXjcPoKkZrd6Yd317DglF+BfLJqUQ6kHZ7uk8ic+tSVcb7zQPglVsYQnIkNZ?=
 =?us-ascii?Q?DSM1Eo4K5gk6zD+Op70Qtep3uSLBN/EK88n+uFiJ0rkZOcReLtAQlyTPpME9?=
 =?us-ascii?Q?qyGfeRiVTDvMHTI8N/CaQr8YW6L+T27Ag6dH2sMxPnP+P262nEFGfQtUcBza?=
 =?us-ascii?Q?QkHJBIBIQ/J5CNWVvpZuGdzN9Ac4nNfEtB7XT+0Y7OChrh2ofgXKzW+Fjh4L?=
 =?us-ascii?Q?89xR7HPf2pdiG5gSZr089mlDb9nTOMiX7LzpBN058uAiBUgVOfs8Y2FRwOZY?=
 =?us-ascii?Q?Q3oyM6duJWUPw283D8pZ5OoK7gzFvt5agtaEAYz62NTwDMtkB4rS+79Jvhdt?=
 =?us-ascii?Q?eO6YOSJOcZ9vsPMOdGY/ovBYLZvb1GhmvAjT1v/uHKEpykjmSf6w+QJBGxvJ?=
 =?us-ascii?Q?Or7xASsDZK26pcROTdqnH325EzEmgGXqAPDxbiR8on55rTWq3a26rLMjHkV6?=
 =?us-ascii?Q?uw1nj7GzCjRH2HtX6zj28+gGQXrA14wD3nxNyQMhzowyil5cOEn9oA77AH6h?=
 =?us-ascii?Q?E/KPahldMBB4bYmfGnpWoEWzsQj/K8CaAKczW6IQGVxSZUD67pdHk+DCTE1X?=
 =?us-ascii?Q?Hg6icP0bdelRpNe2VQ2pVafV9FudTYY/21TTEwFgqLPwTjYRZ5kNGvaMA+eR?=
 =?us-ascii?Q?+Kv0B05lMm98R5YvvKEr2Zgmvg1e0fyuYqKP5rbznz1kMR4D+VuFIxwwTPQN?=
 =?us-ascii?Q?m23mQWgz2IAdhw4Msn/wwnaDNyw5cEa58STS7jR34LgbDz8B6VnTvLaCi+y2?=
 =?us-ascii?Q?mUvtZzll0MeANH2Wahouss4J1bL2+gnxEBNRwpZz4JbV1RuMwa5saQGRVYcY?=
 =?us-ascii?Q?2SKFNLfjCb18GyVAmcvp/WyIQTH0W4eCLWEQNvWt++h5prNUtVkonVFDSmq8?=
 =?us-ascii?Q?Dd0vv+NLwkaqN/e6TWRVPPF8PyuUo1OfKRysIONcfKGH9Mi1E0daoiyXG/cx?=
 =?us-ascii?Q?fdPuj8RTB3E+AGg7gTrAoECyNQmBtN4tnYd8vaRG04ckRbRIvU4nQHrF9rZ9?=
 =?us-ascii?Q?AxwXtwGA77X6PlfCZ4U+joYcNyQ5JH0oIz/oVj7yJzjzm0bfhvtRt6keV1K8?=
 =?us-ascii?Q?K2JVfflFAFbYFuOtpdV6hCwcTAggOk8nPgEeExq+6ssv8hem8ylG1H7jsejk?=
 =?us-ascii?Q?2QPk9Q6CzZa5kRQC3h0X9eFQhGbqk96LhbV4zKWnDppTBOO3HBjRfq34DakF?=
 =?us-ascii?Q?a6IYb3AvM36DYOsIkpCDmEkv1PBW5WMNwAhYk4zT4/zY/vbxa09GryKr41vz?=
 =?us-ascii?Q?qbT2Pyy0Fd9LP+kmVwj81pMWPbI1lvbxSJI1a4kDzxNly8U3CReZp8JXWz1n?=
 =?us-ascii?Q?A1R2wOhOd7QAP54DzqI45yNnaQ4RhYTy7J+ZVAyELV1KhyJpNYjH4651Ei9y?=
 =?us-ascii?Q?NbQMH7/BsA4XBSC8/55XAFL7y1npU5LITGz3Zysk8dqxbRKpvevnDiBs6eYO?=
 =?us-ascii?Q?Gso/cyvBqhiwyhAlO2mf/VR9RHcvozLN8JpgPLDL1fiEi5KAlOYmhSmy4A/X?=
 =?us-ascii?Q?I3GBspGiakWQvJk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dp/HyGlgQgASldbiZfKzFMcl4vYn1ODqiNVr7tFQlOi5vl1R3qDK/4MlJUsQ?=
 =?us-ascii?Q?fM9eVmwi4FB0ZLMBMWpy0Re27R1+l5e+yH/OoOUfAi4aKtMHa+61YI5wVPGy?=
 =?us-ascii?Q?FnNut8n2d/QMIJkb507myfxqfGgJwcj7Swzyi8680pD7plKaHfkzAJkcTDAe?=
 =?us-ascii?Q?xpz3BAYWW+GFFdW+pHojl9pckj3+T8SrbQ+vgmucNf1q9VQUkjmpEw2PHWJX?=
 =?us-ascii?Q?0nxh8Ai6jHzUqCVEnYgs9LPmy7RSpBwUFCm0F2cmyJyqPzr7lun8Mz5EnX0H?=
 =?us-ascii?Q?zYkEU2bkwJxvC79bSrxpbSZQgaXmI4V9U2Gp1l+CQZ/1cjIPG3a+UJ9m3Vuf?=
 =?us-ascii?Q?uoV0k+7etbLRf7dY6VJxXSHRanULJEIwp1L7gRJa7WlejkN46SUYgx0/uh5R?=
 =?us-ascii?Q?kujc32P4SiGiRRclXKDYoL4JcgBHL2ZZ3F2yYUSbXwbcMSvUVa0gMKGrNw2U?=
 =?us-ascii?Q?qwG6rs+v6cz1dOcTvcTvvCaJd+G4sQBXhc/4Bgj8WvtwZAZt8+XNKp0qDBGn?=
 =?us-ascii?Q?nWopFcRFqbdaDV3SKvfWXmZCOLP01H2Lu6QvNw+sva/OSW0AOQ+Bgn0qPzaI?=
 =?us-ascii?Q?iWP4/0GNYMX7A8X8Vf1KXLMdogQVVD8vVPZJWfbtjYPa+Sc9iaerG5mqJ+eK?=
 =?us-ascii?Q?k6H8l2n9ldjUbnMc0k3GFFxVL58eTXM976Kg0KvgoS5LBtPpei3ZMILS0BA7?=
 =?us-ascii?Q?PPUFcEG9bLfJT1NZEsY7L/Y2EfTmw14Q4kV6TypisxqGjlN5y5esX2rKqxsX?=
 =?us-ascii?Q?wF1BaFVESHKAieMc7Ot358/hI+11Nc9vs1jIRfh565Hdxn/SHt22ONwmc6p2?=
 =?us-ascii?Q?ubrxDujyjPFlQwJMYR2Tnod8BuUrgWWTr+wIi4CsoFlWfj5SS8fUI8+fIqxi?=
 =?us-ascii?Q?H3oor70oliq3KLbjrBogkmr9g8ORTRqfnMEUGDXOIWCJ+Shy4fa6WdcIu6OR?=
 =?us-ascii?Q?YWPTmSwBBy7swCNR4bvcSOpsfYChP1UQI0FXFpzgv8YMISQaa47o4FaFCGob?=
 =?us-ascii?Q?4OBt+kZeUQS3pAiMrTmGhkJ5hxgUTGpXQlw5LcD5pnyKnxQNS/gP65BTWN58?=
 =?us-ascii?Q?9QOPz72ublU1lFymalxeDOKvueK2fBbZQCC4yVpswUeRV4Qk/gjDcEqSmDEI?=
 =?us-ascii?Q?pHZDQti3PNGhMbA/SaeajGBeQS66kyUepv3aQfzw2sM7UZ3JGlLq6gnNLT4L?=
 =?us-ascii?Q?7m4b1YyWIzVVTq6h1kqaVyloToAJlHiOg13zExR0rezfiXRK8rFYXc483EGk?=
 =?us-ascii?Q?Pvvuz03vGPh0ex/Xs9y9f9tcLTwpN0dEJ1bz4gXzrJPjNKjrE3JWBhd9cHkU?=
 =?us-ascii?Q?3CCT3TyN+6usVil6QFjRcQ2nCgSHGe7Mz7zSGAXwakJyHhWD+sKF87J2xOiJ?=
 =?us-ascii?Q?Z1Di5EUWtwHTPgD/GrqXkiuqqCkzIuX9YbS6ma3NdTRqj8zIw8AMBS45Cfqf?=
 =?us-ascii?Q?l/CtGW/AbOFf8I6bFsXKAC9U2xFwDkfq/SwONUc1mEmMrndt12MADoFXfR8R?=
 =?us-ascii?Q?JlL3aAIahPjGbaPJJgmfOIY1DSvezQZlMaPwPANY4SIl2ganjfqyh1cMml0h?=
 =?us-ascii?Q?6MONzt0BSzg3P2bPdG4kH0YIp5AJQXmsJWnOsKliBxfZUDTpOkHrcNk2qyeB?=
 =?us-ascii?Q?MQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909eb1a3-c4ce-40fb-a32b-08dd9d1fd86f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 13:10:25.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWiPvgw/RNeqhzRVltoFZDShXfU2CP8BZqTLo+WODeFNzEk1OVfjeug5pdepv8i4kYIF10x2lqEt1sZZgqVb9EW+E+ZPY1P62CbCZZgg3PE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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
> Subject: [PATCH v3 3/7] drm/xe/vf: Pause submissions during RESFIX fixups
>=20
> While applying post-migration fixups to VF, GuC will not respond
> to any commands. This means submissions have no way of finishing.
>=20
> To avoid acquiring additional resources and then stalling
> on hardware access, pause the submission work. This will
> decrease the chance of depleting resources, and speed up
> the recovery.
>=20
> v2: Commented xe_irq_resume() call
> v3: Typo fix
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 13 +++++++++
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 35 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h    |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c      | 42 +++++++++++++++++++++++++++
>  5 files changed, 93 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 869b43a4151d..455ccaf17314 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -101,6 +101,19 @@ void xe_sched_submission_stop(struct
> xe_gpu_scheduler *sched)
>  	cancel_work_sync(&sched->work_process_msg);
>  }
>=20
> +/**
> + * xe_sched_submission_stop_async - Stop further runs of submission task=
s
> on a scheduler.
> + * @sched: the &xe_gpu_scheduler struct instance
> + *
> + * This call disables further runs of scheduling work queue. It does not=
 wait
> + * for any in-progress runs to finish, only makes sure no further runs h=
appen
> + * afterwards.
> + */
> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched)
> +{
> +	drm_sched_wqueue_stop(&sched->base);
> +}
> +
>  void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
>  {
>  	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index c250ea773491..d78b4e8203f9 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -21,6 +21,7 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
>=20
>  void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
>  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
> +void xe_sched_submission_stop_async(struct xe_gpu_scheduler *sched);
>=20
>  void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80f748baad3f..6f280333de13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1811,6 +1811,19 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>=20
>  }
>=20
> +/**
> + * xe_guc_submit_pause - Stop further runs of submission tasks on given
> GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> + */
> +void xe_guc_submit_pause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_stop_async(&q->guc->sched);
> +}
> +
>  static void guc_exec_queue_start(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> @@ -1851,6 +1864,28 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  	return 0;
>  }
>=20
> +static void guc_exec_queue_unpause(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> +
> +	xe_sched_submission_start(sched);
> +}
> +
> +/**
> + * xe_guc_submit_unpause - Allow further runs of submission tasks on giv=
en
> GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> + */
> +void xe_guc_submit_unpause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		guc_exec_queue_unpause(q);
> +
> +	wake_up_all(&guc->ct.wq);
> +}
> +
>  static struct xe_exec_queue *
>  g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..f1cf271492ae 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -18,6 +18,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_pause(struct xe_guc *guc);
> +void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>=20
>  int xe_guc_read_stopped(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 099a395fbf59..fcd82a0fda48 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -11,6 +11,8 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_submit.h"
> +#include "xe_irq.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -134,6 +136,44 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>  }
>=20
> +/**
> + * vf_post_migration_shutdown - Stop the driver activities after VF migr=
ation.
> + * @xe: the &xe_device struct instance
> + *
> + * After this VM is migrated and assigned to a new VF, it is running on =
a new
> + * hardware, and therefore many hardware-dependent states and related
> structures
> + * require fixups. Without fixups, the hardware cannot do any work, and
> therefore
> + * all GPU pipelines are stalled.
> + * Stop some of kernel activities to make the fixup process faster.
> + */
> +static void vf_post_migration_shutdown(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_submit_pause(&gt->uc.guc);
> +}
> +
Since all GPU activities are stopped, no interrupts are expected from HW. S=
o, is there an issue
If we suspend all interrupts from XE by calling xe_irq_suspend()?
I saw a comment from Michal Wajdeczko in rev-1 of this series, but do not s=
ee details here.
-Satya.
> +/**
> + * vf_post_migration_kickstart - Re-start the driver activities under ne=
w
> hardware.
> + * @xe: the &xe_device struct instance
> + *
> + * After we have finished with all post-migration fixups, restart the dr=
iver
> + * activities to continue feeding the GPU with workloads.
> + */
> +static void vf_post_migration_kickstart(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	/* make sure interrupts on the new HW are properly set */
> +	xe_irq_resume(xe);
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_submit_unpause(&gt->uc.guc);
> +}
> +
>  /**
>   * xe_sriov_vf_post_migration_reset_guc_state - Reset VF state in all Gu=
Cs.
>   * @xe: the &xe_device struct instance
> @@ -247,6 +287,7 @@ static void vf_post_migration_recovery(struct
> xe_device *xe)
>=20
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	xe_pm_runtime_get(xe);
> +	vf_post_migration_shutdown(xe);
>  	err =3D vf_post_migration_requery_guc(xe);
>  	if (vf_post_migration_imminent(xe))
>  		goto defer;
> @@ -258,6 +299,7 @@ static void vf_post_migration_recovery(struct
> xe_device *xe)
>  	if (need_fixups)
>  		vf_post_migration_fixup_ctb(xe);
>=20
> +	vf_post_migration_kickstart(xe);
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
> --
> 2.25.1

