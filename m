Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4342E1099B4A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 22:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A7E10E0F8;
	Fri, 20 Mar 2026 22:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBEv/tRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77310E0F8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774046273; x=1805582273;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f2MJUGOqUNtk+t2iqa8cMP9ZN3iVJ0Rg/b58t0trMLs=;
 b=QBEv/tRuVOIR8pZjSGW11iEuO3xDSnz/0GZu0WehDANmjh62DpkexZar
 yhtuHSYCpzH5QuBl+8Y1BxfBHxqgqcG41NQdnvx1Pt/sp0kS26F5HL4YX
 QjbM3DBDhi/zlygz1XC+GUWrZKclJJjwaiFaU15O+A5Rr2ZqXE1yBYb0j
 pQhmufJyoe3sD4xfDl/J3OwpIJXck0pjrTxnSdqq+oxii3hrVDolejbyJ
 hkAF4kxdgYKwoWYuQSfrIl/UGyoRph9brpm1W0l5l4WNfx4mqse0cwnlC
 oSibvBMgl2LYEB6hxWRhGe79l1+7BBXSUqcDykpXDDRIEfmRCra0euR0m A==;
X-CSE-ConnectionGUID: pV/ZICRMTn6M31KiscX+cQ==
X-CSE-MsgGUID: klrnn9Z5TgGqP1qMKO+kBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74155788"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="74155788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 15:37:53 -0700
X-CSE-ConnectionGUID: NeypbUzZR/SOgEqThfcipw==
X-CSE-MsgGUID: 9YsJU1keSsidMc+R92Pbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; d="scan'208";a="223444355"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 15:37:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 15:37:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 15:37:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 15:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IErdiFezRTWIDdv179o3oIgn6c+g4XooRmVC9gzstfb5Yvzu74qr5/bJAHsfR6GKrv3rQb6z4w/FtYUR64oVL1OovYMfPP8swK4U5YTZ7ETnKqh1ird1J8Nop815FtfC7oMhsChEs3cGuXMdkPJOf7ymNGHwVQz7WKE361ACJYOlXaASMuYpRyySG2Gvz1Xm6UQclSjxxH0uoTfn29fyv8auDjuUO9YeeoTUCRdyWHitWYIt8pdJz31SS53V0uW7qewtfZ+iqcp1FVJBTweWoHBXpS/guFfrib1qNt7FYRHAFh6GjEPqefH2/T91f1oBm/LWL7F7p7G4TZqOJB34iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9RV42LpDK+LtpWEZQdXwwc7WJDx+cEvJ/OmkQ1JqS8=;
 b=MZ9Ks4TGlSZm9d5F8fxVIKBIoHxPniQIC8sAEm7R0+AbgnpVasNh7y3UHqgM/rRDI07A85mwTvLNcqkejthnQ/UEzeT24s+lcwBsimJu9hssvYaANd9vnHhIId15N6mR4Lxyw6dH9jq+flDUyppbh+4rHI9mskZKvbaJCAPRUyzsSSIzXoKy8UJI2IJikcWJnmfa/EIVrJWO2rAoMjCNo6uS43OOc6521OHrEW26UwIEfQRUwWhD8LnN2XJKhj6NZ9BCLEJ5t4yx7zIjeg8pBDcnIND8BoKEdsO0KDkjPKdoX+hNO9CeMdYUDojHv1gmswlg4V73jSI31K8bo18Xqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 22:37:49 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 22:37:49 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
Thread-Topic: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
Thread-Index: AQHct4g6f1zHUSCTLE+i3Y9qbZBYn7W3JwjQgAB7CQCAAF+5kA==
Date: Fri, 20 Mar 2026 22:37:48 +0000
Message-ID: <DM4PR11MB6360DDCC0945C842E819F8F5F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-12-tvrtko.ursulin@igalia.com>
 <DM4PR11MB6360AB8F6229F2275BA3309EF44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
 <f0e501df-ea19-41c6-b754-dd4633aa3820@igalia.com>
In-Reply-To: <f0e501df-ea19-41c6-b754-dd4633aa3820@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB7607:EE_
x-ms-office365-filtering-correlation-id: 61418217-5276-4f7c-a53e-08de86d15085
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: hlpl/jmbNGHFGU+/YCVel+mE2+tbWFlR2YNv0Ylg7qCOjRzMSIvZGvb7u3Zm30YWiPgkTp5XQ7i+3wcWBwhsUZtmv/kzc7ycanEFO42OyaxeuhfIe14s5KNYE/aqOoTNYNqQRcOzGx6Pfq6C1NRNPjjF2qbQM8Gvr79m84ng2A3JYWq3Xogn+Kbx4HgzoBXs4WG6LgliPmSnZfYV37R8UJDh54P2VZ4eygLCH+u7Kv16wwX0bk2cQ/y0CCDtilSMikidqnKUZ8A8HulZwOCpH32pSS6Xwgtena4MjP+B1BEvFZ7kk9lszdb7aELP0iA9s0v/5Cj0S98hwYvVTAoYFUJQFpmlFLEs8mbEu1/5FyyaHiYzE3MSFcTF3yyPPJQ9e7cxxGqyNYb4Gh5aPGwZSu+H09qzpLJl9JOx+8uD6wy7uGH9ZymSJdJOyccUDz81eIN8H435wDi1VE/c8ATxskTP/6GBKlxVN2Eac7T3atIwg7vufUMcnVpNm9VSWQ85HW5IGGr6Lm/uTFnk3ud32EhUnSv5sg9+O8uVJ1Ry2tAKHf1gfE/4pc3MBPEpJiKKHCW5IgGDc7pqZmjtDKPQSHNF4sz4r19JhLBZY9j27ELbR7JCi5pc3k4MaqbPUyAE0UfENDei235Q4Vax/EaprX1lYsqELQFnMNS2nwQk1Ws7TE8f6QBrybtixAx0cVIbS5vhXK92teEpCEvaQLA+qJ6mJ8uUhEUlk+8npsP9uiDl8jJvHG06MTxl22fz6NXHr7fxhTLFaGLa+j6ejOrgqDQqbvKjJZAE8nhMtHwulrA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?E8XTUppfwbY1bOOrKxjdU05a41s8iKhb6cOvCQSNqIoJKD+HgnCel/0VyI?=
 =?iso-8859-1?Q?xFNL+5kbchIzwsf2ajcOaCHA+hG9LUFjWRvQCGDAh0lNxJqThaAaE2LRxx?=
 =?iso-8859-1?Q?LI3XRP8Lox4RaM3vNhUQf28yQAnvbMM8Agpnk2mcsW5RxDOf+9QobZK5Da?=
 =?iso-8859-1?Q?pcoc8VnXUHyFBAw5h5wubstKaQta8Ddu0uMqyuLkDi+D7zJ3g+K75SX/Cx?=
 =?iso-8859-1?Q?Dvs40zyoa75/7YQK0/snTEFPQLh0goD1GAJeTOgXRIcPMWUShfRhP0aySK?=
 =?iso-8859-1?Q?jh7agS/BPzq8+Q+SlPn+Ldh2A52MLoGyPXOlW8fKzBEmeKG7bEip9/bFg5?=
 =?iso-8859-1?Q?nUhJN9TSVTmtF7FiOJUaxEwmBSLFDckSqdMwrGbb3Lm5o2417Fhf5udoJz?=
 =?iso-8859-1?Q?NpgxufSi/b52k6g1xbXyqYUtkEh+DgvvjtzwvemGGCFssdF9cEZZ7+1IGm?=
 =?iso-8859-1?Q?MJINRicFiwbHgLjsUSadui4Ga+2l6I1osdFnestwtjvzFYrPT5E8T6/f83?=
 =?iso-8859-1?Q?XcYUm8AxPdOqrw1ifb7m5t/M11YBHtylxu4TqqQT6qgALg3D2a1HJVC7ow?=
 =?iso-8859-1?Q?q2azzwlDX0XHQB5FQjvn4+UsPqmuOMIboCwfKx5VxJ768zBcpp1XjuKZXN?=
 =?iso-8859-1?Q?W5u8bsSVduu17mmg88YcGiVOlcDyInEAZsBAGXptbxpXScbfunQ8vJxq16?=
 =?iso-8859-1?Q?UcfsJK65YUFbTt9cUf8qwVHCH5RQvaKn/k9omMKDrtrTPnwyBTcn6c9FzY?=
 =?iso-8859-1?Q?M4CDIp4RWqiMUxz6nNMB6Ewr+kzJ8mbu89gRfNyBQNecuo98lPWUEcvyY3?=
 =?iso-8859-1?Q?6HMqyxxiRSbGpSUdSAhvyJC6m3gNqfP0f4yeQCTQwCrF/eU23WpepJ/EvO?=
 =?iso-8859-1?Q?vbs/hYKU48g4kRRMOIy65U/52U31NXLEpcJDuGJxH9DSdNJMdhm8TAApR5?=
 =?iso-8859-1?Q?lUqausDpWNNToz3x2eDrUY02jbrJyi4+25BN5Azh7LQTF4ogrHIgICl00z?=
 =?iso-8859-1?Q?nbmhejltvLghAUKoInlVOwPehi5EbhmSADXr/VnnvgEw1i88wUJysjyxg9?=
 =?iso-8859-1?Q?uBqHOJZSW/ENfIdeSQOXrBUlPwjW2kAvHwUkVn9/k7E3rAw7ajRqkiZQtz?=
 =?iso-8859-1?Q?0Jn1E+pgVvrrslj8XIcj3ixtnz1xgS5qjhvT3LAyE8RPa1XPNx4hv54DxY?=
 =?iso-8859-1?Q?t+b0W90r5zJUMvpyX7WRBYFWhw3RTC1oMgWqR2y+st3YZHkJYIp78GgZiY?=
 =?iso-8859-1?Q?C9rpF8GwXjqxUQt60Wmicu6BOwjAYQY8QUIZt0C5+Y3vOzr+q4OVZdoVAs?=
 =?iso-8859-1?Q?SWxnRtrhDY2yba6hlfiVSAqB5olLEHjOOqFwkIwxXIPst1WW2mk/ASU+vz?=
 =?iso-8859-1?Q?vQW0jWrgCKUVyiPy0RbmNwwmb/8HuT322Rc/gABhAuD+7+IgHxcTk6Rkh6?=
 =?iso-8859-1?Q?D1kFyP0YBA/uUJ5a9Hw7m1hqvhhsjV45x4L/PKqzfoodHoOi6tnLh4OBIW?=
 =?iso-8859-1?Q?jS30Qea78HthXlZjIm2doxK/QqKWF/EQ/XddIB3WUodOK9JhZzaLdwC+RR?=
 =?iso-8859-1?Q?KAlEJgqAiumMUgpsopATRTz/civYcsFuT3veX4Zxnm9RrdPofl9PqMdK6a?=
 =?iso-8859-1?Q?A0Y0R5zDn/aIYMmc52iYw6FJLOAgMxIkCW+eLUbP+3ywHl1CTl26QBbMLm?=
 =?iso-8859-1?Q?g4PSeJqxVreTS8NTIUw7zevCL6JFZ10zEzkO8jVptkvaiwYE135Sp5j9p7?=
 =?iso-8859-1?Q?M2BbYtWsGMioSFsyz8MOL72kh1BKap7/sgH7tBjBY3nwZrk98oyIzAoBy1?=
 =?iso-8859-1?Q?zF8yeEQ1bA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: voWj6y4AVznk8FCw5YLBzefB1CAg8GyhB862IPZm/pHfmvVVc8tZCbgx9FVCv982yF4cai1vpoDAQpzUuuQw8jCAEankBinF8azczsnQg8r8Goe4ubaBQYwY4n4k2X0o3nxhUfoldipysxfkBmX7enPb2x7z5lgJDrXe0HoWaiNEzPQv9w33JCSrE8Ypa8l966fic1yHGkUXym0riY1MIhmMKWrTiMIpMsRhwwcnXlmBkhskwjOT8pJpwl7r4AvtdmB5+JKmueN0V+ZX6m7G0GxUYbEWjaIPkMxjnr5NlbP5lchjmlAIiFAzyRWAddvKFScDKvl6faBnhojoJL33Sw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61418217-5276-4f7c-a53e-08de86d15085
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 22:37:49.0226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6NAHni4p/zyjUTes5ACPiEoFpYmvWBgUvrWfi0GCslG+MO8yRSupv9bBNVX63SusPM+TVrmPE45DPufsqDRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
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
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Sent: Friday, March 20, 2026 10:13 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-xe@lists.freedesktop.org
> Cc: kernel-dev@igalia.com; Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com>; Ruhl, Michael J <michael.j.ruhl@intel.com=
>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Hellstr=F6m
> <thomas.hellstrom@linux.intel.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>
> Subject: Re: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
>=20
>=20
> On 20/03/2026 09:24, Shankar, Uma wrote:
> >> -----Original Message-----
> >> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Sent: Thursday, March 19, 2026 3:37 PM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: kernel-dev@igalia.com; Shankar, Uma <uma.shankar@intel.com>;
> >> Tvrtko Ursulin <tvrtko.ursulin@igalia.com>; Juha-Pekka Heikkila
> >> <juhapekka.heikkila@gmail.com>; Ruhl, Michael J
> >> <michael.j.ruhl@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> >> Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Maarten
> >> Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Subject: [PATCH v23 11/12] drm/xe/display: Add support for AuxCCS
> >>
> >> Add support for mapping the auxiliary CCS buffer into the DPT page tab=
les.
> >>
> >> This will allow for better power efficiency by enabling the render
> >> compression frame buffer modifiers such as
> >> I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS
> >> in a following patch.
> >
> > I think the comment will need an update to reflect what is currently
> > been added in this specific patch.
>=20
> What do you have in mind? Is it not true that the patch adds support for =
the
> auxccs plane?

I meant that its handling the linear planes here, so would have been good t=
o call that
out as well. Anyways its implicit, so you can keep the current message.

Regards,
Uma Shankar

> Regards,
>=20
> Tvrtko
>=20
> > However, changes look good to me. With above fixed,
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> >
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 28
> +++++++++++++++++++++++++-
> >>   1 file changed, 27 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> index 23a7ec41f01d..e45a1e7a4670 100644
> >> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >> @@ -56,6 +56,29 @@ write_dpt_padding(struct iosys_map *map, unsigned
> >> int dest, unsigned int pad)
> >>   	return dest + pad * sizeof(u64);
> >>   }
> >>
> >> +static unsigned int
> >> +write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
> >> +			  unsigned int dest,
> >> +			  const struct intel_remapped_plane_info *plane) {
> >> +	struct xe_device *xe =3D xe_bo_device(bo);
> >> +	struct xe_ggtt *ggtt =3D xe_device_get_root_tile(xe)->mem.ggtt;
> >> +	const u64 pte =3D xe_ggtt_encode_pte_flags(ggtt, bo,
> >> +						 xe->pat.idx[XE_CACHE_NONE]);
> >> +	unsigned int offset =3D plane->offset * XE_PAGE_SIZE;
> >> +	unsigned int size =3D plane->size;
> >> +
> >> +	while (size--) {
> >> +		u64 addr =3D xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> >> +
> >> +		iosys_map_wr(map, dest, u64, addr | pte);
> >> +		dest +=3D sizeof(u64);
> >> +		offset +=3D XE_PAGE_SIZE;
> >> +	}
> >> +
> >> +	return dest;
> >> +}
> >> +
> >>   static unsigned int
> >>   write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
> >>   			 unsigned int dest,
> >> @@ -109,7 +132,10 @@ write_dpt_remapped(struct xe_bo *bo,
> >>   			dest =3D write_dpt_padding(map, dest, pad);
> >>   		}
> >>
> >> -		dest =3D write_dpt_remapped_tiled(bo, map, dest, plane);
> >> +		if (plane->linear)
> >> +			dest =3D write_dpt_remapped_linear(bo, map, dest, plane);
> >> +		else
> >> +			dest =3D write_dpt_remapped_tiled(bo, map, dest, plane);
> >>   	}
> >>   }
> >>
> >> --
> >> 2.52.0
> >

