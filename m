Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3E606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PEfT8f1d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC2510E2C4;
	Wed, 21 Oct 2026 05:34:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77AD10E2C4;
 Wed, 21 Oct 2026 05:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792560872; x=1824096872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0VHyGZ91C5e2QKuxvrjlzmnJRLALFlXaKlBPQg8LuR4=;
 b=PEfT8f1d1i49iMIPXFtphHl5Kq6HQpxzGC6DLwmUY/OkyitX2fzTlszc
 RAu/AlDNbHLiUd4ZClgBUYyT24t1Ph7wkj9TZJJq1ar3uWTSWbBuCvwbH
 Sdpv9lxZ+ssOsts0hVqJuumpdqdfdk22zROz/aMjXAPgdxL7tHj+AWUUi
 4ZrrVK71+6Q4P1b8go7uk7FZC9i9EIsADpDngFN+BzFJiUaMVNB8clA7+
 Jnk9ToTZ5uEL2/R01JV884y0lZtuRVNddywF8XtEIgE6SLFoc9QVGp3RW
 kRkf5bkEAYjsYygiQeMCQ1u4VgBiYN7aW2jGvYdAWLI9EnlKGcnUYnbzY w==;
X-CSE-ConnectionGUID: fDYb6PBGRVKa1n+XPoodbg==
X-CSE-MsgGUID: 1t7osYYTTvSxNmqtWQTRNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1169545"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1169545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:34:32 -0700
X-CSE-ConnectionGUID: OOaOy6pERPq7+pmTrivBkA==
X-CSE-MsgGUID: pKLZhw4cQYi/HrDzldh25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3342771"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:34:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:34:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:34:31 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:34:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+GVi7rqzklLJ1lHJ4hlNCV3uw6KMiMHsCb6GQEerChbi8MjcbBt4sC6pAlrlRiFMku7OaVlrs3DKsvMhNxrKHBWqc4C1HVTs4PVzT4XqLp7TYqEsjP3kKNRiacYfHNBgymsLasZv71lL1GXNUEiD1Ytpt9WhgNWjKrLX0CGFJ7Gna7NyrTj6AedShTKLB8alkutoygg0wXX+PMLY6CRdUUWxgmtjWlM7oN3s+cEUAJp3Oy8I+yzipW6InAxC141DRLHlrKMKtkbnsJd8soNjjiLxWCgroS4KT/cn0eTO23P7Hx787o+lvRXbcQmSyX0oMInvdIALVpOUf4nOpqQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHI8x7x6qpeqcH7SiOk+gcifgzJJ9N9BMrR5OoH7iS8=;
 b=ddcQUHHLlmSdXaLiXyhZj++tlmwaBR8F+Ur+B5e12AUahBM7eY921Fk0NOfG3yXqiELHqJle8wyNKn3cZ9O7Bui+vtZklUXtDX0fy08fcHtQ8+XrAdiuPZiiWgyZhOY9ImuIqtI0thuDiVOrWWo2FhLLVvdIvTq2bXoz9ecFWMzWTy1kxdY0cgX3XclKhDIEoOkuRSURzBTK2KCmCWkkd6ekSwYd2A98yWz3Y0SJ3QpgdXgFwpcJQicUZSvYvRTLHiDbx/SFNJRl06KZVqrL3nGlSt6FQvHcxDopmd4sj6Hi9TbiEEWQIup2NbN9S3tIfTbffsq2iQsUl5iZdkOxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SN7PR11MB7492.namprd11.prod.outlook.com
 (2603:10b6:806:347::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 21 Oct
 2026 05:33:23 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 05:33:22 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v4 07/10] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdRmKCnQDR8+ko90GSGgHt9wFq27b/PVeAgAhvC5A=
Date: Wed, 21 Oct 2026 05:33:22 +0000
Message-ID: <DS4PPFE901A304FC14F604241B3D821A174E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-8-suraj.kandpal@intel.com>
 <BYAPR11MB378384A05D976F750B979347B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB378384A05D976F750B979347B29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SN7PR11MB7492:EE_
x-ms-office365-filtering-correlation-id: 0ad656b4-a38d-41a5-f566-08df2f34d2a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|376014|1800799024|366016|6133799003|22082099003|10067099003|3023799007|18002099003|4143699003|260925021911599003|260925021311599003|5023799004|260925022911599003|11063799006|261009223027099003|56012099006|38070700021;
x-microsoft-antispam-message-info: r27i1j9Moyg6ijHp9wsMxf/kpuOcISy2JujLQUfpZ5GGcAKzrCzZDjcrBncIe8YR3nrd8/ErS+sYUJ1d5DN2CbgZo140BOdnWWEQpifT9UiQXLUZXEcnOVwu6fne1SOKCzrdhdjvMFk0XYMkJJ0kzCdrSOtpW98h/O3/aYprHZbgDcsgQUUI1W07BVDO41kMkob2ue30fT30hkY6XStb4I9tk/mkx3mpmIJ8LbVsy34eqgL4M9e5agNGLHPvbnVIewhlTqBsHfiub5RNKqV67Ra5J9x329RbU/m/VU9KuqVyvOMb23LmUkJa115wsocPIwbo1aRRcnxkDJfp89FIqaEODUTOeYtJcENsAZlUEitgYE4GOy/msOmUP2ahw96+NAzAuSf2exVpIhYVjpCWDlaQfmZG+bVIb3D1WgrXKLh1X1grn3ETw+rG8AYFhRDijWsOjjDdk6z+m72Iv9tamLjvL0SwLTTglKKDYdKEdfllf+ev+0s0d6fvWkbjPJnpg3py8vEH06TgAi659HqfOk712BgUdEykjRYcFzDSOAFOsZ9vdOlX4VNviaffuLE+xTym5F2Yrf1mNUJerziobX37I6ThOrpsa37M/RZnEW3VngPilWLcTLVgZRVTZEDqWT7cZkU6VljEmnLk1WsEFd22JSw5dQvKAkGahaqlQhdrsM62M/6kVUbm5HEoWXRXqMTSaexUQunGdN5cypqRFaMSegz5MZkTDFxeyjREDSw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(6133799003)(22082099003)(10067099003)(3023799007)(18002099003)(4143699003)(260925021911599003)(260925021311599003)(5023799004)(260925022911599003)(11063799006)(261009223027099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v2DnFlhFuWJhSjqLxBMI8mwFit+Rlb30rqlHaYcuSB4Cv08UcQeBAeOOYhh+?=
 =?us-ascii?Q?PfKGkK/CocDr8wUl/v6FjDgb/N5m0bkno3i8KiOEw2OpMPmRnP+mUHfUIoY5?=
 =?us-ascii?Q?bVfXi3xdGuru6lY3MWHxtV5PeohDSoQ6AKp6eAhKviSTHaau8wqMUUmkGBBO?=
 =?us-ascii?Q?JqfwsucosLIuRnv+85OAD0gU4LRcLgXcNN7KUcZu66nJcdIbl97ln36O+cGk?=
 =?us-ascii?Q?xSC4KbmX+mZN3C1xEkLWfvnVAdi4w9Lbvmf1wpT4Bv2ZfDk5RfG2GBF+dInR?=
 =?us-ascii?Q?v3pzg4osjELa6W1LT1a/tv1VPOG2BPzeV1TPRor7Ww/MFKVipt6k6RA48hz9?=
 =?us-ascii?Q?vRtpURQfcLM9H5SDUtCvELn4l6MbTtS0kBZpbexbNSBVImv0imAtPzk6aEFr?=
 =?us-ascii?Q?AUmlU3CCvNGO9cCYq/up+h81qb/P88ZBJ2AitBlMppzzCLyyT1yFXXPlOwmC?=
 =?us-ascii?Q?Qri8QNWPINi9wVI+skKR86mWgdGIV0P5sQDQ4TQoDIeex+Fdf579rv2tFcaP?=
 =?us-ascii?Q?yDDqFMm2J/gIKauhU9dlpBIpGpas4GgVw3SPyl+Hk0WT+pgKNrRSNN2QkdIg?=
 =?us-ascii?Q?7t0eCOr51tnjIYJxphF36iQbShE6GejZi0MdSdpcmvmco0OCRM7zd4PFL7Rp?=
 =?us-ascii?Q?HubVdstemTyvAohMZ44dYZJZK1itBNo/6zSoqUC2lZKvYX+nuFAPsG1NVgY+?=
 =?us-ascii?Q?erLmr5QyZHV7Tlu/xk203vlKTAQK4IKnSSTfTyhYNkbEg7wv5wvu3HxzMQtM?=
 =?us-ascii?Q?iCanBkFpxb4t6miCAvGtIuTVb427lVQDw3+F8mk+WXdBqrdf2Rf3i/xj7S7v?=
 =?us-ascii?Q?tX7kx+i1Aq+SuMNsZtdz/z68jBy5Dj5kCvV4GmISPxV639rQcwhjc2KbmYXX?=
 =?us-ascii?Q?NAmGo+r446uG3tWN1f6ObuaA8NDWJGgdWe910Kp09/jhevbmwBMbIYhHLtOL?=
 =?us-ascii?Q?Ow8/Zm6FglNrPC2iI1mqp+wwiS81XO9d4tmLfG84hCn8XZkYezAfpiHBDP4A?=
 =?us-ascii?Q?HleaoAnnvNMUfAoVeKltXPLhZL3+dJZ7bRjwLWzCPu1xlJnKyMP6Jz+3AliK?=
 =?us-ascii?Q?D3XywW243Pf6+D+Ep6QNq3iEmtKoRa6s5VrTWlGzkdjzFDTEbXwKi1FRpLrh?=
 =?us-ascii?Q?tnSUekSHkYHC0JA5hLrhsvLNZZRxVZrcejjKm0z6o8OXdLl9WJ4NkMqI35kG?=
 =?us-ascii?Q?Q7I957mQdTpigfAlEBfsh8XhV/4XGfwQggubbRjK6iHs3z3DQ6OWrPMPmvH/?=
 =?us-ascii?Q?L1ldUjPA71T3YHYAHMP3LgeassrsKy0VV64IiThk+u81dLDc5EsPL0+NHbSy?=
 =?us-ascii?Q?jkm/iwVLB5U7cqqRJDDYC4WAdxUrr9IeCefDNpzEGCZtbwIAGOkvJCG/wi8/?=
 =?us-ascii?Q?GGBKIzFqcjm11EZwvdHCTaOI3XVQubV58E0I6YXkD8iXxO2DSLWHiowpfPum?=
 =?us-ascii?Q?/yST9Osn+t2u4OBJ9taDp+XlIEBC+4qGt/B+bVXuEmwaI3zn5kB0YeAqU/64?=
 =?us-ascii?Q?27Eqq1qb/dMduSptIVBNp+UpQgy2ZX0IrWJs94+KsEsbMC8ygNouhxjWiICy?=
 =?us-ascii?Q?vbdkjnFAGxfkdjunJ7GXSvSmVdwFCxnIvaV7wVewbzJLpHCeu/wUz1bPcDbs?=
 =?us-ascii?Q?ykWvw5vvfIwNtL27XgSeXYR31fznhlf9MV1RE7oKJnH+lumUYnb7u24X00zO?=
 =?us-ascii?Q?pKzE9J+Tt/gfoF7wPq+Anntzx8PBlioymJkS0n1YHMX4kcnQlIu79PcKdZjU?=
 =?us-ascii?Q?2IZb/SvN3VEHxut/ldMxDRs8LtVCTP4In+0TIk6MzyH7a/ZReBPTc2UsfbSi?=
x-ms-exchange-antispam-messagedata-1: /k0ycjnXbAf0og==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: suHe+awqsV6KGC8mtJ9hB2H3ot62IHeiQ3hUqlzi9BKRsV8BbmMGutL3rAMYSgxOf6CmSk9baWBweawprRpxgBIzEtE3rGkIYEfsbLAEVmkUEdNIYykILQoO6BrwSVhEOxBJg0yyIDE9oh7RMIqylkNzuEUzqS8O6xJRMSSw1inJbEmvKucsFqUJTCme9o4AyZGA4CqhOWXc9CzPVlJ5HfSzGlqPmMAC6MC3rRIT9Kj8MX5ZRIszJruSL2qB3cdgPBo/A8FXWYVUiEOjllWRYMVsWVyQRkzytrTOQ+PGQet+g4YjQH+n+FK5Lzy4rxaw/Me4L+s4RUXxrvUhiPEcjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad656b4-a38d-41a5-f566-08df2f34d2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:33:22.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxu4YcvSGREL0wXfpx4UCPPpYIgOuDfvZ3myeSLprmZwIKq6n8Tlj0ngcpcMm2/Jk6lUBiaiU9C8P5ZII3UIRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7492
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: 16 October 2026 02:08
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH v4 07/10] drm/i915/display: Add bits for
> Wa_14021768792 for linkm/n ratio > 10
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: 17 September 2026 10:37
> > To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH v4 07/10] drm/i915/display: Add bits for
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
> > thing worth verifying is whether the workaround ended up being applied
> or not.
> >
> > Unlike the rest of the M/N registers, CHICKEN_TRANS and
> HDMI_EMP_DATA
> > are not double buffered, so the flag has to be compared outside the
> > fastset exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
> > Otherwise a seamless M/N update could switch the DDA out of the
> > workaround on a live transcoder, with the Link M/N values only
> > following at the next MSA.
> >
> > v2:
> > -Drop the drm_WARN_ON() on the extended LINK_N field in
> intel_get_m_n():
> > it is derived from Link M and Link N, so the state checker comparison
> > of those and of bypass_m_n_ratio_limit already covers it. (Sashiko)
> > -Compare bypass_m_n_ratio_limit unconditionally, so that a change to
> > it forces a full modeset instead of being applied during a seamless
> > M/N fastset. (Sashiko)
> >
> > Bspec: 49266
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c  | 93
> > ++++++++++++++++++- drivers/gpu/drm/i915/display/intel_display.h  |  2
> > + .../gpu/drm/i915/display/intel_display_regs.h | 10 ++
> >  .../drm/i915/display/intel_display_types.h    |  2 +
> >  4 files changed, 102 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 6d2025e10995..1e9d8943626a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2706,6 +2706,15 @@ void intel_zero_m_n(struct intel_link_m_n
> *m_n)
> >  	m_n->tu =3D 1;
> >  }
> >
> > +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> > +	if (!m_n->link_n)
> > +		return 0;
> > +
> > +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> > +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m,
> > m_n->link_n)); }
> > +
> >  void intel_set_m_n(struct intel_display *display,
> >  		   const struct intel_link_m_n *m_n,
> >  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -
> > 2717,7 +2726,9 @@ void intel_set_m_n(struct intel_display *display,
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
> > @@ -2738,6 +2749,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
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
> > 2745,6 +2776,8 @@ void intel_cpu_transcoder_set_m1_n1(struct
> > intel_crtc *crtc,
> >  	struct intel_display *display =3D to_intel_display(crtc);
> >  	enum pipe pipe =3D crtc->pipe;
> >
> > +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> > +
> >  	if (DISPLAY_VER(display) >=3D 5)
> >  		intel_set_m_n(display, m_n,
> >  			      PIPE_DATA_M1(display, transcoder), @@ -3495,6
> > +3528,49 @@ void intel_get_m_n(struct intel_display *display,
> >  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> > data_m_reg)) + 1;  }
> >
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio,
> > +					enum pipe pipe)
> > +{
> > +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> > +		return false;
> > +
> > +	if (m_n_ratio > 15)
> > +		return false;
> > +
> > +	if (pipe !=3D PIPE_A)
> > +		return false;
>=20
> Could we check whether this should use the transcoder (TRANSCODER_A)
> instead of crtc->pipe ?

Sure will move check t
> For ultrajoiner, could the secondary pipes report bypass=3Dfalse even tho=
ugh
> their computed state, copied from the primary, has bypass=3Dtrue ?
>=20
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
> > +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc-
> > >pipe))
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
> > @@ -3512,6 +3588,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
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
> > -5002,7
> > +5080,8 @@ intel_compare_link_m_n(const struct intel_link_m_n *m_n,
> >  		m_n->data_m =3D=3D m2_n2->data_m &&
> >  		m_n->data_n =3D=3D m2_n2->data_n &&
> >  		m_n->link_m =3D=3D m2_n2->link_m &&
> > -		m_n->link_n =3D=3D m2_n2->link_n;
> > +		m_n->link_n =3D=3D m2_n2->link_n &&
> > +		m_n->bypass_m_n_ratio_limit =3D=3D m2_n2-
> > >bypass_m_n_ratio_limit;
> >  }
> >
> >  static bool
> > @@ -5277,18 +5356,20 @@ intel_pipe_config_compare(const struct
> > intel_crtc_state *current_config,
> >  	if (!intel_compare_link_m_n(&current_config->name, \
> >  				    &pipe_config->name)) { \
> >  		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
> > -				     "(expected tu %i data %i/%i link %i/%i, " \
> > -				     "found tu %i, data %i/%i link %i/%i)", \
> > +				     "(expected tu %i data %i/%i link %i/%i
> > m_n_bypass %s, " \
> > +				     "found tu %i, data %i/%i link %i/%i
> > m_n_bypass %s)", \
> >  				     current_config->name.tu, \
> >  				     current_config->name.data_m, \
> >  				     current_config->name.data_n, \
> >  				     current_config->name.link_m, \
> >  				     current_config->name.link_n, \
> > +				     str_yes_no(current_config-
> > >name.bypass_m_n_ratio_limit), \
> >  				     pipe_config->name.tu, \
> >  				     pipe_config->name.data_m, \
> >  				     pipe_config->name.data_n, \
> >  				     pipe_config->name.link_m, \
> > -				     pipe_config->name.link_n); \
> > +				     pipe_config->name.link_n, \
> > +				     str_yes_no(pipe_config-
> > >name.bypass_m_n_ratio_limit)); \
> >  		ret =3D false; \
> >  	} \
> >  } while (0)
> > @@ -5436,6 +5517,8 @@ intel_pipe_config_compare(const struct
> > intel_crtc_state *current_config,
> >  		PIPE_CONF_CHECK_M_N(dp_m2_n2);
> >  	}
> >
> > +	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
>=20
> The flag is compared twice. The unconditional BOOL check is enough.

Sure will do it=20

>=20
> Please also print it in intel_crtc_state_dump().

Will add it.

Regards,
Suraj Kandpal

>=20
> > +
> >  	PIPE_CONF_CHECK_X(output_types);
> >
> >  	PIPE_CONF_CHECK_I(framestart_delay);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.h
> > b/drivers/gpu/drm/i915/display/intel_display.h
> > index 404168f4213b..55e676655120 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> > intel_display *display);  int intel_crtc_num_joined_pipes(const struct
> > intel_crtc_state *crtc_state);  void
> > intel_display_compute_link_m_n(u32
> > *link_m, u32 *link_n,
> >  				    int pixel_clock, int link_symbol_clock);
> > +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> > +					int m_n_ratio, enum pipe pipe);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> > b/drivers/gpu/drm/i915/display/intel_display_regs.h
> > index 57f388c958b4..81f9661357b6 100644
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
> > index a5f18ac8a7d0..7a5286db977e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -985,6 +985,8 @@ struct intel_link_m_n {
> >  	u32 data_n;
> >  	u32 link_m;
> >  	u32 link_n;
> > +	/* Wa_14021768792 for linkm/n ratio > 10 */
> > +	bool bypass_m_n_ratio_limit;
> >  };
> >
> >  struct intel_csc_matrix {
> > --
> > 2.34.1

