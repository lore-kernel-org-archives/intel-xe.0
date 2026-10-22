Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F922606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+Ik8Pvq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E557210E3FA;
	Thu, 22 Oct 2026 17:32:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95AC10E3FA;
 Thu, 22 Oct 2026 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690338; x=1824226338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oCIvDqbBd8QBy6WyR3LeSWIryRMNr5co8B0U1TfoPC0=;
 b=Q+Ik8PvqbMfr/u3UWQZ57u86FXbnGnk7hU1GRbFFGIOi6Rj2lkquM8/w
 y26XCCRArEIlkczFpzg1nn/agg2tuOMLrfvPQSZyhbTOkrtPKnDmLTBQa
 hBEZxJAQaQEoGFPlpz7ewIoO4lokK+/F5oxXBlTvTa6YbERTuIzRkuv41
 X7mtLGWChdrHWnCGESfG7PUOcBVq7OKXrnG0PfyNtFcGjadUJIvdK6thc
 xf3Q6mF6L51HPGaW+4KWE/JKuFSc4BRt1UbMAdKPWei0kPTA8VmbyJ3Y+
 xLME/2fOYjX91bIMe7MbnLnev1TDrRItBautMnWXCjKIhK7PgjHbcZBFP w==;
X-CSE-ConnectionGUID: +OVd2nJ1SxajcrJfqQmfXg==
X-CSE-MsgGUID: m7lXXnZ7ShypMV3A4owsPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1435025"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1435025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:32:06 -0700
X-CSE-ConnectionGUID: 5J9W2rpNT0qdnmoirNcuXQ==
X-CSE-MsgGUID: 91MsLLYtTJmKOB3u3Tpc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3290183"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:32:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:32:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 10:32:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 10:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zT/SKqrXqJBqmPWJfJUK1WKdXcEoW90xW4Ly53MBRwGJeR7ldYfES56Hc/gltzs1xoQWvIabThOE/XbiuASoIVNVeBOsP8HZfijIqcveTUuCo2PnQfgwsxCtGeCq6ChggK5CZ8BXweuLHa/zHwqUopVYKxjGRQkPxQ5yVG/tFO/6E4ZCvtCuSVoGbB3PlPx7T6tR69WoC9NBC8RCzohjysSKllnMx24c+j/U2K5WVmDPXqhrUMqoHYpoTWTugbJXTC3iKCU17ezdJAhXNlQ/ZunE1hjFQbS4jySy8aBBiJ7StHfi2EEv6p6QKopgRnNhqpyBAwt7L4aEHB14llfj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7F3fM1e99gxJe1XkeYXDpwLRrdJqZxIqTVeBA8MQQGY=;
 b=HO5GTCknaCiW68wbXwZ0fp5Vcqmf2AvOXQZNlE6SZLBTNsOxcZy60VQvlmHZ/ZZ3joWEq53Zq5zYfCYfrC4jzP4SKb5eH/x4QRnug6uCkgIh8C1/t6VyDKjLTm6kouVWUyS6AOpwHaIUtKH4s1ZVec3Lan2amuW9ZN67/heEUa+A7mnKgFNBNwkvSkpZfjmc8VH55zqVaj1yotfb9GtRQPuWkiRJBfSHISCZ6QpyXGt5peJDa1phIOn9W+ogxUFw+5UhayKVp4Z77yUn+17f9kOsr0Kesvsb1Zg+SIFr61LUsB1oDjzAWGxFF4Zmus3Q6EqJOoGghVXc2cQsptngUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3783.namprd11.prod.outlook.com (2603:10b6:a03:f5::12)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 17:32:02 +0000
Received: from BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13]) by BYAPR11MB3783.namprd11.prod.outlook.com
 ([fe80::fc32:42c6:f275:4f13%6]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 17:32:01 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Topic: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
 for linkm/n ratio > 10
Thread-Index: AQHdYdSv8BTQ5PKPcku+vkGAlxuh2LcJ0lSw
Date: Thu, 22 Oct 2026 17:32:01 +0000
Message-ID: <BYAPR11MB37830FEF13F6A9C523A0B9C1B2652@BYAPR11MB3783.namprd11.prod.outlook.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
 <20261022032247.1378809-9-suraj.kandpal@intel.com>
In-Reply-To: <20261022032247.1378809-9-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3783:EE_|CH0PR11MB5252:EE_
x-ms-office365-filtering-correlation-id: 7135ebfe-7e48-425f-f505-08df306261ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|5023799004|11063799006|38070700021|4143699003|260925022911599003|260925021911599003|260925021311599003|18002099003|6133799003|22082099003|10067099003|261022113327099002|261021123027099003|261022075727099002|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info: C9ELYcs9MRkMiwk1UnsIf1AtOmD/iuhOZ0pl4N2MUV0yQ6po9ajzZ943nqdqxB3sM3qN77t6lXqVKxByLRmpDQ8rGSiaJpniMBvnPEXZgOCZvJnSztyL9f1wb7EaSsLvxUkqx627mlQf6R5slEXI2f5qNTyaaoRd+tunfN9s+u2d7HjcM+QA1TPGW1AznAkVxK4uN5lRX07r2iSI8HjOWXRsMIbmC8GL+PR4fmPqRdPuLybU4hHFKhAMfUIpQxHVdIoO3PtkYXAqsPsh2qgogY7q60izndGKmnjiGjulLboGdvf7ldI0p/pl23IVaJOkr+DzoX35uElSu4gnKvpBnFmQXA/a5RhjAXm7+8B/ZJQ8diYyDvFy37Wf/ML4npG2zoAGKdUk1bE7VqNIWVcziJ4ydvDqLvR31PuCe+JOPBNSnoj1tYP642mCsS0EEXXY+eBMVjmJM5JAReSl+aKZx/pgbSaiLWa75ykAof5rmFONN1v91EGqcuXC6K2RHGgu10mHIQlYXPPLc1Lhrr8+xSohOhBmCAczkUtrivJ7i7ug5MRP1cjulkefCUPgrSy1OJQ6pi17z1Mf/4tgbe1rmqZpk8GdBORsVeH6jOq0LN922H2P/Gor0fxm8patI90uPFjs1a0iZR4Oqnv+z6FF2doxOlA0/SIq16P+yh5TZGWqn72jlUC55HZYFLGH5sWUgWTXZQZHWpqScnPpOoGnVhy3Wkw2NJirucoPlf8zU3w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3783.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(38070700021)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(6133799003)(22082099003)(10067099003)(261022113327099002)(261021123027099003)(261022075727099002)(261021121427099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GUIQwc6KfOvsUPmng7rj/rD37m6iF4JJMCPr7JmXUDdJxTyNZUPLLvQHz1fe?=
 =?us-ascii?Q?dAymkgQ7k1vuuuzazGpDl7kHEw0ON8LOo+To3/ufPIUc91WjDsOLNSK9g86T?=
 =?us-ascii?Q?liy/3QVEE7TGuDfgs4RTuHxTLX+7PhXLqyFIk6H+Sxt/Wq5DHXmijsDJEChO?=
 =?us-ascii?Q?48XuV7mq1JgqWJohN3xKAp1hymBExW6gquKn64adZnpzAPGf1DTuguIVmILa?=
 =?us-ascii?Q?RaV4ExwLAeKB+m7XjMPgq38+bmGLhaPALf2E3C/dvYwDZbE0cKeRgfithhdS?=
 =?us-ascii?Q?yVmZPREImakEp9sNfzyTo3/j4lO3uSNybHWgwF81XGOV/5QKr9eUw9Gckt+I?=
 =?us-ascii?Q?GwMxfVzC/55JQ+71PwvjDZIN322GULt6uYH448y6uE6RlWy0R57qJxfaf0eu?=
 =?us-ascii?Q?uwN5hehrEcz5kAJBalJYLmp0iThyQP7+WPQvaQvu1EzitbBzFiuik/c4TUmJ?=
 =?us-ascii?Q?Jpu3oPnY8bM+A4PKNXtDVkgp4Rd0rphtkb8fGElUwteksx3kSBM188l/yY00?=
 =?us-ascii?Q?PA5ge0el1pGqukB0BbgCHfMT6A11nGc5/zJ363mupMa+qJTzhGlSHAdEZ227?=
 =?us-ascii?Q?7zVyhottGJpO20zjhTOHKMDYMVPUVshUiFebwz6qEZ+sq4qZGhMl0CIbVHko?=
 =?us-ascii?Q?9gPuWG9nZtZWW5RSQCBD2/tvtSCQvmzL6zD+X1lI1yhJJKu7RAzYKTYCvqXC?=
 =?us-ascii?Q?5vtx3/QBww/eCU+K18/2e6dziykOptLBQcU2dbe7pKrviyZshD+ii+rqKdMx?=
 =?us-ascii?Q?ZIBRSHUC0DV4+oTwh2JouYwhOSeftUFQZpmPh2rHxlUPWzbJJVXsm742Hem8?=
 =?us-ascii?Q?CbAKe4ivHlz4A1vHu2WyDcfzErN33lhGezL6PYLkglfvIZLO6zNu/KEalB7g?=
 =?us-ascii?Q?+kIWPNTFpzWgTO+kmJ87A8s6R6vYN94ex/SJtglPcIP8P0gPt2KxLr4JFadj?=
 =?us-ascii?Q?yQGNcBBy+qDaoM+J4GArgzAK1JXyUNH69gjL2E5VbUfALlxeCh65OmAYiAKo?=
 =?us-ascii?Q?B8CRPGA5PskQGj/KLFfHrzXuXzfJP0UmeeEPFYhDnryrYQNNXxZqUS7/IiGn?=
 =?us-ascii?Q?sHqEiWHwYnyYnLyBo2zqxH2GRsVBy4oT4OIxLwvo8RYK98CYxuQrGPReXpkd?=
 =?us-ascii?Q?DLnP/IAbQB6q3CzChRkqFpeKcHwiwH2Tk9HMYiin/wcRBb+YRAg5Johtaqtx?=
 =?us-ascii?Q?beo3iV0vYOSg4NibDNNuWH7DH4E+D3hgd0YHdZk6KhYai65nS4yptZmySnCv?=
 =?us-ascii?Q?XGnDOFE4XG0XtZTQLOWwp7SZ69hvyp61z3THztfqL559JMB/+SmAN5KXTEuo?=
 =?us-ascii?Q?j4NpZQ4PvZyzyw1BdiHAMtQrJzVQbtr+CeoFGj5jyPHk6PSDOcytSWWw7dgZ?=
 =?us-ascii?Q?WNSAl34Dwn9kJae3EdP3QhTOAFXdRjj1Oxf69Vp6eMcT8xLULwDYtiFcTPep?=
 =?us-ascii?Q?iYIW5bG2KHGwC0+t6I5EgUojLf0bqaqaFMoHIW0COzOKX/kcoMzwrjKkSyof?=
 =?us-ascii?Q?q8gF2SSrGZUYlT6JyVH4bar/eec47Juj6QdLJ04OKNdEDEdAM5LVzQZBiT2a?=
 =?us-ascii?Q?Q6+COBt80HdUXYfrAmdgGso/wNztg2SRrpRVKbr5bcYkkMjgf2fWqXSHff8a?=
 =?us-ascii?Q?9KfBoiZabwslTBYzH60dBORn41B9bNTAT3cv7HfboQDSpjT3hGfs+HOwzkBx?=
 =?us-ascii?Q?TrLBjikRZ5UfMxrpp2sFH/191Wc9gup4VsBknAgoSZMXo+r2Gs21Xah7A53g?=
 =?us-ascii?Q?WL0O9o5phz2GIZkxrwtoA/QzWoRnuoE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Tqp+w+iC9ESgi+dZuFB4U4N+n2AnXWTaLCPfBj8+BL0BE+3EoxeOGkDp+qFbwxEyA9E6kJN1Rj1VVmFO/Tjs5oqUakznQJlQCmg0qh6P8OWeq2zOHqNSXHDQkmnOibYYP/y3WZZyM3d34ljpuRTnpJvZoDRKuvv0wpZ+b001UpSoT04ZZRY5n40i3HUQsMXYtmBv7mHkKDC1b5vLptxqELkKSKplAO74NMGsz9q6I14Hc6zPfr4FOrKE7E6zaMfWBonj7Q6dtqBfVrjvM6EM6D2p+5L1TDKJMVAGPz9btmC+Oc2wqzS09tvDDQl7UJOqiRbjFIQovpxKZliyQw8ljQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7135ebfe-7e48-425f-f505-08df306261ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 17:32:01.7426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2RQoYT5f4iWyZs1XM747lOzuGBPSh9+WAIp5N95fvFm3bvfa50JImdLF+wEG4nYif8/um9xAS24xDl2BaihNeJZOAJKA1YodMAvICu/dT/fKaksH1k7WnZIGe2QdJTyu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 22 October 2026 08:53
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v7 08/13] drm/i915/display: Add bits for Wa_14021768792
> for linkm/n ratio > 10
>=20
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>=20
> To support a Link M/N ratio between 10.0 and 15.0, for some BMG ultrajoin=
er
> cases we need Wa_14021768792.
>=20
> To bypass the hardware limitation within the Timing Generator DDA (TGDDA)=
,
> we need to program the LINKM and LINKN registers as defined in the WA.
> Along with this we also need the relevant bits in HDMI_EMP_DATA and
> CHICKEN_TRANS.
>=20
> Add the bits for the WA and a new member 'bypass_m_n_ratio_limit' to trac=
k
> if we need to bypass the Link M/N ratio limit in the intel_link_m_n struc=
ture.
>=20
> Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold INT(L=
ink
> M / Link N) and bits 31:28 hold CEIL(Link M / Link N).
>=20
> The workaround is limited to transcoder A. Check the transcoder rather th=
an
> the pipe: for a single pipe the two are the same, but the joiner secondar=
ies
> read the M/N back through the primary's transcoder, so a pipe check would
> have them report the workaround as not applied while their state, copied
> from the primary, has it applied.
>=20
> CHICKEN_TRANS and HDMI_EMP_DATA are programmed before LINK_N,
> since writing LINK_N arms the double buffered update of the M/N registers=
,
> and all of the programming has to be done before the transcoder is enable=
d.
> Both are also explicitly cleared when the mechanism is not in use, so tha=
t
> state cannot leak from a previous modeset.
>=20
> v2:
> -Drop the drm_WARN_ON() on the extended LINK_N field in intel_get_m_n():
> it is derived from Link M and Link N, so the state checker comparison of =
those
> and of bypass_m_n_ratio_limit already covers it. (Sashiko) -Compare
> bypass_m_n_ratio_limit unconditionally, so that a change to it forces a f=
ull
> modeset instead of being applied during a seamless M/N fastset. (Sashiko)
> v3:
> -Check for transcoder A instead of pipe A, so that the joiner secondaries=
 read
> the flag back the same as the primary. (Mitul) -Drop bypass_m_n_ratio_lim=
it
> from intel_compare_link_m_n(), the unconditional
> PIPE_CONF_CHECK_BOOL() already compares it. (Mitul) -Print
> bypass_m_n_ratio_limit in the crtc state dump. (Mitul)
> v4:
> -Move the state checker comparison and the state dump of
> bypass_m_n_ratio_limit to separate commits. (Mitul)
>=20
> Bspec: 49266
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 80 ++++++++++++++++++-
> drivers/gpu/drm/i915/display/intel_display.h  |  2 +
> .../gpu/drm/i915/display/intel_display_regs.h | 10 +++
>  .../drm/i915/display/intel_display_types.h    |  2 +
>  4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 461b81bf8341..9e9321976a21 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2715,6 +2715,15 @@ void intel_zero_m_n(struct intel_link_m_n *m_n)
>  	m_n->tu =3D 1;
>  }
>=20
> +static u8 bmg_get_link_n_ext(const struct intel_link_m_n *m_n) {
> +	if (!m_n->link_n)
> +		return 0;
> +
> +	return PIPE_LINK_N1_EXT_INT(m_n->link_m / m_n->link_n) |
> +		PIPE_LINK_N1_EXT_CEIL(DIV_ROUND_UP(m_n->link_m,
> m_n->link_n)); }
> +
>  void intel_set_m_n(struct intel_display *display,
>  		   const struct intel_link_m_n *m_n,
>  		   intel_reg_t data_m_reg, intel_reg_t data_n_reg, @@ -
> 2726,7 +2735,9 @@ void intel_set_m_n(struct intel_display *display,
>  	intel_de_write(display, data_n_reg, m_n->data_n);
>  	intel_de_write(display, link_m_reg, m_n->link_m);
>=20
> -	if (DISPLAY_VER(display) >=3D 14)
> +	if (DISPLAY_VER(display) >=3D 14 && m_n->bypass_m_n_ratio_limit)
> +		link_n |=3D
> PIPE_LINK_N1_EXTENDED(bmg_get_link_n_ext(m_n));
> +	else if (DISPLAY_VER(display) >=3D 14)
>  		link_n &=3D ~PIPE_LINK_N1_EXTENDED_MASK;
>  	else
>  		link_n &=3D DATA_LINK_M_N_MASK;
> @@ -2747,6 +2758,26 @@ bool intel_cpu_transcoder_has_m2_n2(struct
> intel_display *display,
>  	return IS_DISPLAY_VER(display, 5, 7) || display->platform.cherryview;
> }
>=20
> +static void bmg_enhanced_tgdda_write(struct intel_crtc *crtc,
> +				     enum transcoder transcoder,
> +				     const struct intel_link_m_n *m_n) {
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	bool enable =3D m_n->bypass_m_n_ratio_limit && m_n->link_n;
> +	u32 link_m_frac =3D enable ? m_n->link_m % m_n->link_n : 0;
> +
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return;
> +
> +	intel_de_rmw(display, HDMI_EMP_DATA(display, transcoder),
> +		     HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +		     REG_FIELD_PREP(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> link_m_frac));
> +
> +	intel_de_rmw(display, CHICKEN_TRANS(display, transcoder),
> +		     DP_ENHANCED_TGDDA_ENABLE,
> +		     enable ? DP_ENHANCED_TGDDA_ENABLE : 0); }
> +
>  void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    const struct intel_link_m_n *m_n) @@ -
> 2754,6 +2785,8 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc
> *crtc,
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	enum pipe pipe =3D crtc->pipe;
>=20
> +	bmg_enhanced_tgdda_write(crtc, transcoder, m_n);
> +
>  	if (DISPLAY_VER(display) >=3D 5)
>  		intel_set_m_n(display, m_n,
>  			      PIPE_DATA_M1(display, transcoder), @@ -3504,6
> +3537,49 @@ void intel_get_m_n(struct intel_display *display,
>  	m_n->tu =3D REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display,
> data_m_reg)) + 1;  }
>=20
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio,
> +					enum transcoder transcoder)
> +{
> +	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14021768792))
> +		return false;
> +
> +	if (m_n_ratio > 15)
> +		return false;
> +
> +	if (transcoder !=3D TRANSCODER_A)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void bmg_enhanced_tgdda_read(struct intel_crtc *crtc,
> +				    enum transcoder transcoder,
> +				    struct intel_link_m_n *m_n)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	u32 link_m_frac;
> +	int m_n_ratio;
> +
> +	if (!m_n->link_n)
> +		return;
> +
> +	m_n_ratio =3D DIV_ROUND_UP(m_n->link_m, m_n->link_n);
> +
> +	if (!intel_display_can_bypass_m_n_limit(display, m_n_ratio,
> transcoder))
> +		return;
> +
> +	if (!(intel_de_read(display, CHICKEN_TRANS(display, transcoder)) &
> +	      DP_ENHANCED_TGDDA_ENABLE))
> +		return;
> +
> +	link_m_frac =3D
> REG_FIELD_GET(HDMI_EMP_DATA_LINK_M_FRAC_MASK,
> +				    intel_de_read(display,
> HDMI_EMP_DATA(display, transcoder)));
> +
> +	if (link_m_frac =3D=3D m_n->link_m % m_n->link_n)
> +		m_n->bypass_m_n_ratio_limit =3D true;
> +}
> +
>  void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
>  				    enum transcoder transcoder,
>  				    struct intel_link_m_n *m_n)
> @@ -3521,6 +3597,8 @@ void intel_cpu_transcoder_get_m1_n1(struct
> intel_crtc *crtc,
>  		intel_get_m_n(display, m_n,
>  			      PIPE_DATA_M_G4X(pipe),
> PIPE_DATA_N_G4X(pipe),
>  			      PIPE_LINK_M_G4X(pipe),
> PIPE_LINK_N_G4X(pipe));
> +
> +	bmg_enhanced_tgdda_read(crtc, transcoder, m_n);
>  }
>=20
>  void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc, diff --git
> a/drivers/gpu/drm/i915/display/intel_display.h
> b/drivers/gpu/drm/i915/display/intel_display.h
> index 404168f4213b..d53b7b4a80e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -525,5 +525,7 @@ bool intel_scanout_needs_vtd_wa(struct
> intel_display *display);  int intel_crtc_num_joined_pipes(const struct
> intel_crtc_state *crtc_state);  void intel_display_compute_link_m_n(u32
> *link_m, u32 *link_n,
>  				    int pixel_clock, int link_symbol_clock);
> +bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
> +					int m_n_ratio, enum transcoder
> transcoder);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h
> b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 983a0d9dcb9c..bbdbc27629d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -550,6 +550,11 @@
>  #define _TRANS_MULT_B		0x6102c
>  #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans),
> _TRANS_MULT_A)
>=20
> +#define _HDMI_EMP_DATA_A	0x600d8
> +#define _HDMI_EMP_DATA_B	0x610d8
> +#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
> +#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display),
> (trans), _HDMI_EMP_DATA_A)
> +
>  /* Hotplug control (945+ only) */
>  #define PORT_HOTPLUG_EN(dev_priv)
> 	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
>  #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
> @@ -1192,6 +1197,10 @@
>  #define _PIPEB_LINK_N1		0x61044
>  #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
>  #define  PIPE_LINK_N1_EXTENDED(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
> +#define  PIPE_LINK_N1_EXT_CEIL(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
> +#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
> +#define  PIPE_LINK_N1_EXT_INT(val)
> 	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))
>  #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran,
> _PIPEA_LINK_N1)
>=20
>  #define _PIPEA_LINK_M2		0x60048
> @@ -1710,6 +1719,7 @@
>  #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
>  #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
>  #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
> +#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
>  #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
>  #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 8f9fb2603638..d0748837ce97 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -985,6 +985,8 @@ struct intel_link_m_n {
>  	u32 data_n;
>  	u32 link_m;
>  	u32 link_n;
> +	/* Wa_14021768792 for linkm/n ratio > 10 */
> +	bool bypass_m_n_ratio_limit;

This commit still combines register definitions, WA programming, the bypass=
 helper and readback.
For reviewability, could it be split into: (1) register definitions, (2) th=
e bypass_m_n_ratio_limit member
plus write-side programming, (3) readback together with the state checker c=
ompare
(fold `drm/i915/display: Compare bypass_m_n_ratio_limit in the state checke=
r` into it),
with the dump staying separate ?

I'd keep the compare after the readout rather than before, so it doesn't la=
nd without anything that sets the flag.

Not a blocker; the current order is bisect-safe.

>  };
>=20
>  struct intel_csc_matrix {
> --
> 2.34.1

