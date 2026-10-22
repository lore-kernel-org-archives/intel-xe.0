Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE4606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 02:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S/DeOi5e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8866F10E242;
	Thu, 22 Oct 2026 02:42:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701B310E242;
 Thu, 22 Oct 2026 02:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792636966; x=1824172966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F71bjt64HN4BqbmjOi5PvKnJo35C2l6aOXkjZuFitVg=;
 b=S/DeOi5eAjnTtkRE7LTujGDZkxSsjH9IoJbZDnbMcjoJfdyj8qM10hE3
 VxqyPYwiK8he9T+6jXdrR9VO3VIjTxmDGwaIcPRIurw6qB10NnsfIEtZG
 RFiu+qpTm4EhLGjTXi26JF9icYO+D8K98gUICF7zePKzg9qMEbyN1LjF1
 /NTaGyCfcc83toe6wXtG3nhN5dHS37Jg0d6QcRAGADYUsWQb1RS4RlmaC
 wL87khEh6Dtq3qCXPR3RQdMI+5ICknFCvm0cXtOjh9GjsODshgthoblxw
 PjXrSbUgzT3ImdnYGirn1TCmLartUwLThdWjKIzvt38QixRnIoX3Tn8Tz Q==;
X-CSE-ConnectionGUID: 8QJQiGyDQVGUrpIYZsJmjQ==
X-CSE-MsgGUID: mPj8/jYXRcOYSZQWm6PuHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1277326"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1277326"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:42:46 -0700
X-CSE-ConnectionGUID: NSd9nLcSRbCBFxLgp/uUXw==
X-CSE-MsgGUID: 61isOvTzQGu7fvGCjnahoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5005473"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 19:42:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:42:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 19:42:44 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 19:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5GuBLppDm9HvgK5kfvFECfTUCpz1g89t/+Oc+wzoZAKXuV92DPUCUbRryMoXmRfbdBPE+VaK5Brn1UFCSi4QjCcJRbYeRfMS626q8LfRDvMU6B0qnQCy1NO9bJkiXzPxahWc/yJnpw4BInGTj8QgdUfAwwhsX21eJnd9mespmw3bSSDD7FPkjK+Vy1fcKFvvL9oknI/2GgHVfWWmrguxl3hp1t9DMiwAMpcdkiLUYGTlx8Lpal2nd1Bzu2l3ONjHZZJABYVzArAawqC59+spzd+hXIp2/bnMaB1d5e21M8aC5ugEdNnMnyjNpqbdbbwGeaDf8BgzQAZN/pPkhnViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z2+veshmSCPgDC/w7pEAOAs/D4TW/SgBbcF1JlZ1do=;
 b=EBN2fGbdMClm2VGaYFMaCUotcAcjCvagMQpSzi9W/Tp6oPqM3BmU6nBAfFoxiWlScYKPDo2VYpJXElUHOg+SPOA7PPFvZfCfTkU7PLPx4vmCdPADIUQKtQDeJXsanNAsWjdWM1U2oPuh5FC59yA2lgXN2BbN/JaqXabWRra08kMBzcs15TwC3OsA7G46o0Oflmr2U8LjkmwVy+zkiMFl7jAl85oTP4t3XywiiKzH1ZCgEMX44gchrLgN/IdW98Fmzd1HXcr8ZSilis/MVcQc+Ifir7ChkJNOQl3J+FXl3knYxp6UAQFMaDP1QY5yrGkMVW0CBAMWRQPNVc59VzkTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH8PR11MB8038.namprd11.prod.outlook.com
 (2603:10b6:510:25e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 02:42:29 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Thu, 22 Oct 2026
 02:42:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYS1Q2TMInZYMEEuHQbtGV2denrcIN+OAgACjf2A=
Date: Thu, 22 Oct 2026 02:42:28 +0000
Message-ID: <DS4PPFE901A304FBDA4A054BD979EADE0ABE3652@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261021072438.1164249-1-suraj.kandpal@intel.com>
 <20261021072438.1164249-9-suraj.kandpal@intel.com>
 <BYAPR11MB37833527B31B2A81A4D5BA15B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB37833527B31B2A81A4D5BA15B2662@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH8PR11MB8038:EE_
x-ms-office365-filtering-correlation-id: bd330fd8-a3c0-4f7f-f1db-08df2fe61cc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261021123027099003|38070700021|56012099006|260925022911599003|11063799006|260925021911599003|260925021311599003|5023799004|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007|261021121427099003;
x-microsoft-antispam-message-info: nqagUaiaAH1JtD0VJYRY/E8KNVOgf5hWSvbhs3q3ZYTEKwV7h9pITetJ6ES7+SX29wF1Lu850aM9rZoWiyhEHHvqbyken83QDZurTxyH+1HNTeklSeY+txZZ9IvyQOULWIUu5ht1yeYAWvlKO28GlKzEw5EimecGQmI7VU/jeVrAxxODjdS+ogU6vDrWQCrNyCfNjaSWKwsQt9b7Rj0rXYFUSBJMckJN7GVVT4Ir1JaLYR0PyuXhFvnSKpz/IOdq7k8kpBO/RwD+O1gY5ubcE14GXPcoGV2leocUYg9ADCuPvrMYuk/ER9dwhYOhu8LHsNWy3ZeZH+fKiApNZnhurB4jdzjFu0XBtAnEq9nti6HrlHe7nld/zBn0pCBU52rPqLTxi21X3pnV1MgDyD2pqmqBuOgPn2zscDpv23J5JdUMo1yt2wPElTiL202g03YrDKLCD0uKHvoR134pHxQC0HG0fcNrbv67+caarBZxapc3TYJKXsXVKniSlw1FM312pQMecBbBb2xg9YSAEiQh5EzqxWts7d+TZ9kUBlRvju1ZHV2914jZbcdpgfX1jMNfm8getEIEPt7t01ZTaZTVMIQGVB4m1NR4iR6wktKIxDPJArwBFvaqPhATsXS7eleGqgYyY4sMWPRHkcXCt+hlgIEdc+BIQiT6A5y3jDTNaW2qvaDp+iTUfkjVUMBhbKnjvPXnaQcd4FtlzJV5XM2pmYrvIcOhi5oFi8H0Y/0PQ7U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261021123027099003)(38070700021)(56012099006)(260925022911599003)(11063799006)(260925021911599003)(260925021311599003)(5023799004)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q8Z8zucANqgoJBkg3H3s0m0DZ1RjPWjFgdbd2ZotubRuEAMLqLnFplDoIn3h?=
 =?us-ascii?Q?emkkWuIg1263f4uh/7hX3rGmxw8vsYL/Ce1X6uEsV01Km/EWk1yu3FDii/eO?=
 =?us-ascii?Q?MZ+GmmVRDaUJmc9yQzYgS4+uuA6JPwaAw1SNzTwjRMpK9IdAeEagXOfkyuZq?=
 =?us-ascii?Q?i47oESmYhtD1Hglz1vW9iaVvMZKhhgahMqfu8L5h+wQ1heVOOxg1DbejfRdS?=
 =?us-ascii?Q?JNrucgiqUFhw6FzEmbB2n8Yfcinufdhc7FcuG8FGCp+n/eU1O4O2HXWLf5Km?=
 =?us-ascii?Q?p7/CuzklvMIPNW5PHpJqpPEQUmwC8QAkATjGhPGfenluJ2esbx6hwr9wZ5r6?=
 =?us-ascii?Q?tfZUnfyKoktcbexkBrrFRcEhcaZsf/T6jAjLfBH01z3rwrlna2P2ubjzR1ZO?=
 =?us-ascii?Q?jCs7rH9/m40ASnj4cAeo/3YajnqlyNLBy8ztr8YfULopDoBW+OOzg1ugrFqR?=
 =?us-ascii?Q?2OYZkEfHeVPbtmqoz8IDlA/AV2fsBf7fvCB+FToPgpDpbK1cB9xBT/3ueq93?=
 =?us-ascii?Q?q5V8eUcQ2vndEBrz2htfW8lHRWGJ9VEMFIWS7Kn8IMZOG5fRmTvGQ1fd1AYy?=
 =?us-ascii?Q?jbfn00r9jYlU8xrgBaHt2V2AmnZA5FZEEeTFWNNL1viFUrM2Zok1DQaC9Ubo?=
 =?us-ascii?Q?u7BFMkW5BF+TErtK2fjojhDpE2kH/gX9fezKyhq2rG3HitO+Tqxe4CNcBLWj?=
 =?us-ascii?Q?4WuAjW+JC+jBD7fAikp7rGOi3MbjHJg5RoOhOziNFYDoEqZL8eBzZJUthDG1?=
 =?us-ascii?Q?5X4QIgctLNM0zIKO1B7pu2hgorypPA0s1krMF8T9TKJ8hNCmvTxwJMjnPx8Q?=
 =?us-ascii?Q?eE//4VJckDBK4D7jPutzxqa8unmm5A9862rcnEOkonh+0RuMvRczCeZqhMo5?=
 =?us-ascii?Q?70jAfI2LfDdRj85IiqmVpLmkLA7zxNJQ213AwN+Lyer9TBLerQdImC2QucJ2?=
 =?us-ascii?Q?3fx9Eca2pO2Y+zBpQcCv1Rkfjm8klYEP40Llfb5wcM9N0K5WzT/X5JhbXi1Y?=
 =?us-ascii?Q?XyzyLUW74+1WHKyPkY8pCK0+/F4eRktCLvG9HRHWOdvx8hq2RL7Aw/K7wBDs?=
 =?us-ascii?Q?CT5NfnS8JDAIPU7fjZr+6km8Z3+ZVi5f1ddmjO3on7eBtZHKpgrh2G4SvGuu?=
 =?us-ascii?Q?pXYUUGaqKRp7jIUmAdcHc4WixiKpPbPEx1li6m/WsDI32j1cu7lNJb2Vn5Wo?=
 =?us-ascii?Q?Rx163fQu4NaslZPpEpmRUhirPo2KP6A99Ku/kV2gd4WpieBZ/9Jj6QzVAZlH?=
 =?us-ascii?Q?rRRs8biXW9VgapQxOXNbfjL5n9rj/n5Megiub0iR5/3cKDvDAPV3BiDU4DGB?=
 =?us-ascii?Q?F2wWAkQZsfc/3zhQz3DjxHisTWsIYUozURF6+yi+/9GVgqiqqclUi8Y9M/UN?=
 =?us-ascii?Q?YB6XxbcZoKrrhivWJqW07nO36d81/YKzbw3ujUJmq3p9sLukGF5tRto4iOY5?=
 =?us-ascii?Q?jQ+KjMCvxqFlpr76Wxgfwhx6JCV5ib/HVbjG4d/gK4e+Xc7hVHePioliz124?=
 =?us-ascii?Q?vVL/IjUi3Y1F6gqRb8I8flX006u1R+aSdG7xMajjW5jpLqHOE5GYW8+QSNsY?=
 =?us-ascii?Q?yjWyl0phytU5GECn9uSFBRzSixsvi8mfehmcS1pVFgyAe0n7rroRGC0bZJ+x?=
 =?us-ascii?Q?4JR2F9lvOQYJjZkuh4I2Vyq9pHgYnX3UsFBlFCy0x1J/0y7Ol19juiuJ24qQ?=
 =?us-ascii?Q?FEynHCUf1eHx2SKBzq6T0+jTShQ8ntjFY7daxhQAxCQTGRxxANtHH6SvEzs5?=
 =?us-ascii?Q?DAnUS1DWDg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B70kimK/kGySaqv/mWiNarN6G7NDhd5svJjviBi0ENqjpe44dH7LSOke+s3iJ2Z2KubMZVG1tf+t+349Cg2jrlsWRyO0OpI9qCemLyyL1mf1RUbRdKA8kwVaO2BXJdkvSycLXY/OMm1PWhkQnQI+7TkzbExoWV6zHVSGf/Te0AHMXLLkigfXNZr711ORphB3jiTMCdqVE4CWsF2MA7kFdTBtnWmpUIdk9ui0i5gUVkahylqN059MaFsNpB0xMRj9eTPkbjlK+n3EQypjPRpqWTKSvljKtP4ZseFrEEsO6Z/Mo8ZSlO4Z9Zkuvie/k08lH3m3pa/yX7nR/3F+5iHcaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd330fd8-a3c0-4f7f-f1db-08df2fe61cc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 02:42:28.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrq1lbpXnkSdfD0DORnN7JKaRuwyfgMOef7hBhVOkfvWHinZN0EiLl2sGWmR1DWF7uTvlD9PJUV2pNwFQQlmnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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
> From: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com=
>
> Sent: 21 October 2026 22:27
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-gfx@lists.freedesktop=
.org;
> intel-xe@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v6 08/11] drm/i915/display: Add bits for Wa_140217687=
92
> for linkm/n ratio > 10
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Sent: 21 October 2026 12:55
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> > Cc: Golani, Mitulkumar Ajitkumar
> > <mitulkumar.ajitkumar.golani@intel.com>;
> > Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>
> > Subject: [PATCH v6 08/11] drm/i915/display: Add bits for
> > Wa_14021768792 for linkm/n ratio > 10
> >
> > From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >
> > To support a Link M/N ratio between 10.0 and 15.0, for some BMG
> > ultrajoiner cases we need Wa_14021768792.
> >
> > To bypass the hardware limitation within the Timing Generator DDA
> > (TGDDA), we need to program the LINKM and LINKN registers as defined in
> the WA.
> > Along with this we also need the relevant bits in HDMI_EMP_DATA and
> > CHICKEN_TRANS.
> >
> > Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to
> > track if we need to bypass the Link M/N ratio limit in the intel_link_m=
_n
> structure.
> >
> > Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold
> > INT(Link M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
> >
> > The workaround is limited to transcoder A. Check the transcoder rather
> > than the pipe: for a single pipe the two are the same, but the joiner
> > secondaries read the M/N back through the primary's transcoder, so a
> > pipe check would have them report the workaround as not applied while
> > their state, copied from the primary, has it applied.
> >
> > CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N,
> since
> > writing LINK_N arms the double buffered update of the M/N registers,
> > and all of the programming has to be done before the transcoder is
> enabled.
> > Both are also explicitly cleared when the mechanism is not in use, so
> > that state cannot leak from a previous modeset.
> >
> > Only bypass_m_n_ratio_limit is compared by the state checker, not the
> > ratio integer and fraction themselves. That is deliberate: both are
> > derived from Link M and Link N, which are compared already, so the
> > thing worth verifying is whether the workaround ended up being applied =
or
> not.
> >
> > Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
> > are not double buffered, so the flag has to be compared outside the
> > fastset exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
> > Otherwise a seamless M/N update could switch the DDA out of the
> > workaround on a live transcoder, with the Link M/N values only
> > following at the next MSA.
> >
> > v2:
> > -Drop the drm_WARN_ON() on the extended LINK_N field in intel_get_m_n()=
:
> > it is derived from Link M and Link N, so the state checker comparison
> > of those and of bypass_m_n_ratio_limit already covers it. (Sashiko)
> > -Compare bypass_m_n_ratio_limit unconditionally, so that a change to
> > it forces a full modeset instead of being applied during a seamless
> > M/N fastset. (Sashiko)
> > v3:
> > -Check for transcoder A instead of pipe A, so that the joiner
> > secondaries read the flag back the same as the primary. (Mitul) -Drop
> > bypass_m_n_ratio_limit from intel_compare_link_m_n(), the
> > unconditional
> > PIPE_CONF_CHECK_BOOL() already compares it. (Mitul) -Print
> > bypass_m_n_ratio_limit in the crtc state dump. (Mitul)
> >
> > Bspec: 49266
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  .../drm/i915/display/intel_crtc_state_dump.c  |  6 +-
> > drivers/gpu/drm/i915/display/intel_display.c  | 82 ++++++++++++++++++-
> > drivers/gpu/drm/i915/display/intel_display.h  |  2 +
> > .../gpu/drm/i915/display/intel_display_regs.h | 10 +++
> >  .../drm/i915/display/intel_display_types.h    |  2 +
> >  5 files changed, 99 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> > b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> > index 92675a88b969..c51b21222dc6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> > @@ -36,10 +36,12 @@ intel_dump_m_n_config(struct drm_printer *p,
> >  		      const char *id, unsigned int lane_count,
> >  		      const struct intel_link_m_n *m_n)  {
> > -	drm_printf(p, "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u,
> > link_n: %u, tu: %u\n",
> > +	drm_printf(p,
> > +		   "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n:
> > %u,
> > +tu: %u, bypass_m_n_ratio_limit: %s\n",
> >  		   id, lane_count,
> >  		   m_n->data_m, m_n->data_n,
> > -		   m_n->link_m, m_n->link_n, m_n->tu);
> > +		   m_n->link_m, m_n->link_n, m_n->tu,
> > +		   str_yes_no(m_n->bypass_m_n_ratio_limit));
>=20
> Please add dump as part of separate patch ?
>=20
> >  }
> >
> >  static void
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 461b81bf8341..ecc0e5ec181a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
> >  	m_n->tu =3D 1;
> >  }
> >
> > +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> > +	if (!m_n->link_n)
> > +		return 0;
> > +
> > +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> > +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m, m_n-
> > >link_n)); }
> > +
> >  void intel_set_m_n(struct intel_display *display,
> >  		   const struct intel_link_m_n *m_n,
> >  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -2726,7
> > +2735,9 @@ void intel_set_m_n(struct intel_display *display,
> >  	intel_de_write(display, data_n_reg, m_n->data_n);
> >  	intel_de_write(display, link_m_reg, m_n->link_m);
> >
> > -	if (DISPLAY_VER(display) >=3D 14)
> > +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> > +		link_n |=3D
> > PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> > +	else if (DISPLAY_VER(display) >=3D 14)
> >  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
> >  	else
> >  		link_n &=3D DATA_LINK_M_N_MASK;
> > @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> > intel_display *display,
> >  	return IS_DISPLAY_VER(display, 5, 7) ||
> > display->platform.cherryview; }
> >
> > +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> > +				     enum transcoder transcoder,
> > +				     const struct intel_link_m_n *m_n) {
> > +	struct intel_display *display =3D to_intel_display(crtc);
> > +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> > +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> > +
> > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > +		return;
> > +
> > +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> > +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > link_m_frac));
> > +
> > +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> > +		     DP_ENHANCED_TGDDA_ENABLE,
> > +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> > +
> >  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
> >  				    enum transcoder transcoder,
> >  				    const struct intel_link_m_n *m_n) @@ -
> > 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct
> > intel_crtc *crtc,
> >  	struct intel_display *display =3D to_intel_display(crtc);
> >  	enum pipe pipe =3D crtc->pipe;
> >
> > +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> > +
> >  	if (DISPLAY_VER(display) >=3D 5)
> >  		intel_set_m_n(display, m_n,
> >  			      PIPE_DATA_M1(display, transcoder), @@ -3504,6
> > +3537,49 @@ void intel_get_m_n(struct intel_display *display,
> >  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> > data_m_reg)) + 1;  }
> >
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio,
> > +					enum transcoder transcoder)
> > +{
> > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > +		return false;
> > +
> > +	if (m_n_ratio > 15)
> > +		return false;
> > +
> > +	if (transcoder !=3D TRANSCODER_A)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> > +				    enum transcoder transcoder,
> > +				    struct intel_link_m_n *m_n)
> > +{
> > +	struct intel_display *display =3D to_intel_display(crtc);
> > +	u32 link_m_frac;
> > +	int m_n_ratio;
> > +
> > +	if (!m_n->link_n)
> > +		return;
> > +
> > +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> > +
> > +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> > transcoder))
> > +		return;
> > +
> > +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> > +	      DP_ENHANCED_TGDDA_ENABLE))
> > +		return;
> > +
> > +	link_m_frac =3D
> > REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> > +				    intel_de_read(display,
> > HDMI_EMP_DATA(display, transcoder)));
> > +
> > +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> > +		m_n->bypass_m_n_ratio_limit =3D true; }
> > +
> >  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
> >  				    enum transcoder transcoder,
> >  				    struct intel_link_m_n *m_n)
> > @@ -3521,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> > intel_crtc *crtc,
> >  		intel_get_m_n(display, m_n,
> >  			      PIPE_DATA_M_G4X(pipe),
> > PIPE_DATA_N_G4X(pipe),
> >  			      PIPE_LINK_M_G4X(pipe),
> > PIPE_LINK_N_G4X(pipe));
> > +
> > +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
> >  }
> >
> >  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, @@
> > -5445,6
> > +5523,8 @@ intel_pipe_config_compare(const struct intel_crtc_state
> > *current_config,
> >  		PIPE_CONF_CHECK_M_N(dp_m2_n2);
> >  	}
> >
> > +	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
> > +
> >  	PIPE_CONF_CHECK_X(output_types);
> >
> >  	PIPE_CONF_CHECK_I(framestart_delay);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> > b/drivers/gpu/drm/i915/display/intel_display.h
> > index 404168f4213b..d53b7b4a80e7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> > intel_display *display);  int intel_crtc_num_joined_pipes(const struct
> > intel_crtc_state *crtc_state);  void intel_display_compute_link_m_n(u32
> *link_m, u32 *link_n,
> >  				    int pixel_clock, int link_symbol_clock);
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio, enum transcoder
> > transcoder);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > index 983a0d9dcb9c..bbdbc27629d7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > @@ -550,6 +550,11 @@
> >  #define _TRANS_MULT_B		0x6102c
> >  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv,
> (trans),
> > _TRANS_MULT_A)
> >
> > +#define _HDMI_EMP_DATA_A	0x600d8
> > +#define _HDMI_EMP_DATA_B	0x610d8
> > +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> > +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> > (trans), _HDMI_EMP_DATA_A)
> > +
> >  /* Hotplug control (945+ only) */
> >  #define PORT_HOTPLUG_EN(dev_priv)
> > 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
> >  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> > @@ -1192,6 +1197,10 @@
> >  #define _PIPEB_LINK_N1		0x61044
> >  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
> >  #define  PIPE_LINK_N1_EXTENDED(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> > +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> > +#define  PIPE_LINK_N1_EXT_CEIL(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> > +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> > +#define  PIPE_LINK_N1_EXT_INT(val)
> > 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))  #define
> > PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> > _PIPEA_LINK_N1)
> >
> >  #define _PIPEA_LINK_M2		0x60048
> > @@ -1710,6 +1719,7 @@
> >  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
> >  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
> >  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> > +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
> >  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
> >  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 8f9fb2603638..d0748837ce97 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -985,6 +985,8 @@ struct intel_link_m_n {
> >  	u32 data_n;
> >  	u32 link_m;
> >  	u32 link_n;
> > +	/* Wa_14021768792 for linkm/n ratio > 10 */
> > +	bool bypass_m_n_ratio_limit;
>=20
> This patch seems to combine register definitions, workaround programming,
> state readback, and state dump output. Could we split these into smaller
> logical patches where practical ?

Sure will try break them down

Regards,
Suraj Kandpal

>=20
> >  };
> >
> >  struct intel_csc_matrix {
> > --
> > 2.34.1

