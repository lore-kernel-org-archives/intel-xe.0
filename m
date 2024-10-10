Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10739CEDDB8
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 03:41:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF10B10E83D;
	Thu, 10 Oct 2024 03:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bH6dHT6L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5DD10E83D
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 03:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728531711; x=1760067711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NQichGKe5n+Bc0x3TO9WtrGgw2+N1ezc+dfyPpld9X0=;
 b=bH6dHT6LELAas3fTebSzq6q8ZfgMWmJ75UIcZa5aXkBmS3A9avYNX4+f
 VKFAg13/jk7TaDItIKuv91gHfbQF9AwDvEmzOtIrVT37xZNQq7VkPhFD4
 mb18aHesYdJu2iQOHjkRMaYcuRfZPzPR1ROkwwTL2n3F7HvhYhmsh3H+/
 NuRBtZ7RPszb8TWZxnmHHBHLi9r0iTy9tjcAlkVQ4zxjdy51r1L8X7GgD
 2Ftyq4wszastBGFRtuOJUe42aqgoDTHL+uUAhYczznmOAf6/35CFkVh8+
 VEiyAcbxuENWmWQlz0LBpQGpALczCn97c4gjB99HbKYWf9+1hlw7W7KO7 g==;
X-CSE-ConnectionGUID: T5Guvc+/TgiVUnkLGnLEFg==
X-CSE-MsgGUID: icIjIUaMTGexf0gVlpMsqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27746864"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="27746864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 20:41:51 -0700
X-CSE-ConnectionGUID: 5ZD3EEXFTmSe37UvCtcS/g==
X-CSE-MsgGUID: r6kDsyj0QM6bDt7Jo13f7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="107194067"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 20:41:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 20:41:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 20:41:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 20:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0C69FFHJknyxFjPWyMswoOf0GiVZCOyLr9E+LPptWrNZeWayFqVQoYTwlgLNlWEiM/vpUPQW5KUvlKnFK82pTOOOz/iowbHMjdzq/UF0h0o1WHgwFw+bMqo6EylejGPKPEd96uneN0MpggE942DCfGimA14RG+KtWvR4TeR36y6N/YLXu3W+7Kv+GoAB37u9N3rxLxX+HXnLEcdaKf5ZN/AoVaIFEB2r3KjP4xYEwtfIwfe/0+RhWuX2AEVVWVUWCHDtSKXz1ph7B+NjB4yjm1jaRnnCCVAYUh6q6Re9t8QjlC8rttE0KBaRbROWkLe3e7svbvha/wAfS108570qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1uQ0PcBesW48SKIoczIYxRZtgwvyLyYaBFxwXidUQA=;
 b=Kp/BGfiuZ2jM+Zu4FJm709QIlUQ3XXIB51N9OqyGrYeBNpFlYttXSnG9L4HZwbc0/bzlf+ynYV1I8LH43EbvLrxrCiYJP6JPkfbz5DabTzrB8QCoYmZFcDSz44FZlrSJY/tK5T5rzlFuLN6auM+SAXORCkjl1yyfowGuitxcdWanIKZUqsm7rXSKpfnGsPEVZg7ua6SDX0j9f/bxn0qGyUknJAWLCiI14ZWpnVAAIjddTgU3TD5zFvxXRGhkaimDaCuM5FIRExBvaePgxZ1EM4TygctKidQK+uiQGRz7hzzxpUcUNGziLBhO/7TMEpQGVbZ8Fh9bc1B2daFgkPXqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 03:41:48 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 03:41:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Hogander, 
 Jouni" <jouni.hogander@intel.com>
CC: "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/i915/psr: Implement WA to help reach PC10
Thread-Topic: [PATCH] drm/i915/psr: Implement WA to help reach PC10
Thread-Index: AQHbFaSgCvThjqHPQUiPv4PzvyLGobJ59CmAgASUVICAANfi4A==
Date: Thu, 10 Oct 2024 03:41:48 +0000
Message-ID: <SN7PR11MB675019D7D0344FCD40446332E3782@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241003145337.1673715-2-suraj.kandpal@intel.com>
 <20241006164934.1689930-2-suraj.kandpal@intel.com> <87o73t8hdg.fsf@intel.com>
In-Reply-To: <87o73t8hdg.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jouni.hogander@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: ff6cebf8-507d-4bf0-b866-08dce8dd786f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2UWVazYPs7N3dE2Xu7khXOUG1cnprgy2Y4isG9SsbbN9NMGy9PmlIs/w0BV5?=
 =?us-ascii?Q?78mMDUAVXJ3G0GbuU4iHo5kXAJ3VW4j0+VOGEYwxZHX5eh+T6xL9X46+aMJd?=
 =?us-ascii?Q?V6Fu7Jw5LncA/DX6WeXxYbmxc/GNBe8NZ8W/uwO87lyM4wbImDasYBJ9vgoD?=
 =?us-ascii?Q?kyFA+S1cSvlwuHxcv7IdQPx8nZeWPyzAmEjGkR0NX4ys7BtKHtYzLBFqDnzn?=
 =?us-ascii?Q?dEdq5v/JBlszs4DkBb1vYczCajJYwXqLL3aauv3jzD9MMjRJOAUggv1mvHmL?=
 =?us-ascii?Q?aTUuqgXd21Cyj7nebpbSEv5W/lHxRMEmKHTaZToHyd+EsVImnSr8GebZg3lb?=
 =?us-ascii?Q?EsENjpIdkmsO1rUggJMgOgtHf4VoaAaZLhspQjMfKpVISTgkLLan7RrI8C0t?=
 =?us-ascii?Q?VFbZJOAdly04DpYjlfVHmm9e8i/bUqU8eJpukfUg0DZGJaDNDgzkKOn6+wxb?=
 =?us-ascii?Q?JtlkwfR05HgspZe376KJ0hVYGTLC9zkMkA0r96ul5MmVX1TdYUmyXALCBLNy?=
 =?us-ascii?Q?12Z1/X12cLUKv1dae6fr2yeG00w1ztbLjI+IkerKlMvxHHvFPCWJ11wY8u8g?=
 =?us-ascii?Q?fNQC2Id17Ps/0FHyJk8jOk2HeYN5ye8aNQlRmadWER22vQqIvQ82SqZTzTYI?=
 =?us-ascii?Q?2liC0FU9Ifs6uI5WdvtDdkmZAKme34WV2l9ZvW7xWM34gw5HjEwLr+ApBkhu?=
 =?us-ascii?Q?Khpj3m1+llcbIvvCR+WjlqlzsM30bbTdo/2BZi+pFpXnRCiOGktB99BwooU7?=
 =?us-ascii?Q?OMAJRYgC1GkLj2anav7yWjnu+RN92XHfgkFXwe+nSNLWThlNb7SmfAvTERgO?=
 =?us-ascii?Q?mMgIIP/lKueNoNCLCKgBUvC7LGoeh30kC613N8EFSot5UZNI2W0gh5ZPKEEi?=
 =?us-ascii?Q?XcaCXewwNXIAzvBl9ID7e8t9t0X5yymgbRtW7UCEQqmenZlPeC5rt8/Z/tqc?=
 =?us-ascii?Q?fuHwhuC2rBOWG3b0UfoytSJoj4jUgR2me0bPp+s8G+Ih7WEmQnrVXN9Vx9Rm?=
 =?us-ascii?Q?MY+PNoMKyLQ7fN4ewez7VhIjl+JxNT54gBmiv/7zwNo03k8Qgp9ATcqwJfOx?=
 =?us-ascii?Q?acvj2obYM3ZU2DGWGGFxZTnoorfPfiueba/mweOJ+yapKKuzBng3QeH+oVWY?=
 =?us-ascii?Q?Z7EN8W7nmALfYlWv/0VLPb9JMIwtiRA6zDNC2qdvHdN9emVwcBPYQdzbtw48?=
 =?us-ascii?Q?yIL49Q4ehbMVS+OHod4c1UN6gBbjBYclCoX52k5kNri1VcDzsYzizgyV1GBG?=
 =?us-ascii?Q?1LNBnsx7Eg2KTljqtFxRpOhjZXB1DXcP/2W6v8UFnV6lV16RFgUX3Sp+wPHS?=
 =?us-ascii?Q?fPxR8vwsS6fkojBXzjnWs03bZCPP2qvkZteZXNT3MebZ6Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qnMYWBcNnUDaf1npxZA2EHFXTB0QpSnC99sRzqlahwo8+6oDr2QsyPPipwE7?=
 =?us-ascii?Q?tmpjuV0C+Mb3rOJoMxRI5NPhOHtsqgpy3IbVPCm5OU3LzaIiIF/84dGhO+Gf?=
 =?us-ascii?Q?xS5v1SVbTbkAZsY0dRt0YlNZhTE+/EEVT4nDUIgvIpVurnoDzmY3MHfFZNQ7?=
 =?us-ascii?Q?dcG5HBnz5030A+FVFHAqwoUB3RKPxp+YnBa3txnfoNi2+tOmyMjTFlRUpBos?=
 =?us-ascii?Q?NTn5j63MRgY/ZIdk879cFZHgW15EH+mkIhmk6TYIzH/1oFlxE4c9NUg+ogVY?=
 =?us-ascii?Q?WRsgB4tXd4S2fdEXnVa6G8TpvWoDiPQO1YtUPUnM3EVhQW1A0N2wc7gPX/FF?=
 =?us-ascii?Q?D1nEV32rn0LqyKXbZhvnSNUkwqvDPLZpxnl7DvLrVbXIMPj30XMEnuHS6ql4?=
 =?us-ascii?Q?F4zCUV7Kf31C4fN/cFKR5oRmI+/hY+ASvpmP6p0WelLU96VpOeE7NOWVyZq+?=
 =?us-ascii?Q?5iNi0TG9/IGZa7239dxWAFzpWhsmXd7wUtToLZuBZWYFC8Kuj/qJhHutNtpZ?=
 =?us-ascii?Q?7CszJHJel+N6Gm3ARuK0i6Mw3Do1e6rRNqFYA57DPgmasQjrF/a3V9lBNKjA?=
 =?us-ascii?Q?UoZne+3QBGJswJDAZq0KnFolwpVCmLV25TvJHNg7Op8A3119S7prz32LTU1l?=
 =?us-ascii?Q?kZkw8nPG8B8Ts9PDEEI4I0t6QrZLBJ3Qjl5gkzc7NztQjx+fAbF4YaOR6dAC?=
 =?us-ascii?Q?T2R0j1jUAEDwRW+xxgzfsdekTTcJOzoTbVfNQ7GJYnGPlAXXjcG016+NXD6I?=
 =?us-ascii?Q?yfOHNFmd+lV0U3CRNdTEqNgxvfFELpXE/odHA7ILk4iAs4FPOmOosSTyl7Dt?=
 =?us-ascii?Q?mEcIz7wWx5Aar0HhnxHDhtbNg7UbffmRYmdMoCXIB9HpTsIMNofvV42OHfdc?=
 =?us-ascii?Q?4yBPJg2y2FTGRBtgCODGp5NtzrDjiixem/dL6IJ3jnpx05tzOocP32RQ/TeU?=
 =?us-ascii?Q?CyEukGHbc8/99tzvg/fYMXQ73VhUCqguPVe/DctXluFEruwm3Lae3n2kKdFI?=
 =?us-ascii?Q?EHzRoHgynbupjAlhL3rOwDyA0YdurbJS1/G8nniUFJ1HaZWNG8HSk+4ZsIHq?=
 =?us-ascii?Q?tG7AdnQdhSHg2ssZyQRIaY6nIHLY7OCk/etVBbYZNYX9pfvTnGbzEbypoOxF?=
 =?us-ascii?Q?3YrzEM/bq/FwZdb3Rb1er5NH7yv6YrIHzP2yvzhRHUHqJkbYW2M+zhV4qEKR?=
 =?us-ascii?Q?Ey87wklWD9zOjA7ryrglpv8Pd60Q3igPn1EWnMiSGXEJ/kJXWtantAnalyF+?=
 =?us-ascii?Q?XMkD71h7VlOFMXjAvxva22kJrnfXJERqm/nOAbbyj98o7qIYWvLfUb0L5WiA?=
 =?us-ascii?Q?McymtntP/BWbkfzEwwW7lN7usw3VEiMlwZ9fuu/xt/AV13H0WVvGL+CaHHN5?=
 =?us-ascii?Q?+lKIASfC66ovulesR8SJogNAWqjeNIu98FlL0I+EhSs65J0Imc2iPJG9hITn?=
 =?us-ascii?Q?lAtIS2AeQMfq+lH73MxcViAWYSzzxhzm/HVyVI7Vysx3Oem2iggJA7Gv+2GL?=
 =?us-ascii?Q?V0C1XCjXvXiwkM1VTHsbX1vrdG1UOrF898VO1g9tpkKhRlQ8RYaTGJz5ZfEz?=
 =?us-ascii?Q?cofGvATTS23/6mWjrPbe5lGHUPOM2uHUkygz5ua6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6cebf8-507d-4bf0-b866-08dce8dd786f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 03:41:48.5590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B6TMeTC5arTDMHpZnRY1+puwKdH8njiHSV+XSFNJJLdzAPsu1RYX4Hhm/LDIETFbBtG2jwENP5QOKUrkUb46Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, October 9, 2024 8:16 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Hogander, Jouni
> <jouni.hogander@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: Re: [PATCH] drm/i915/psr: Implement WA to help reach PC10
>=20
> On Sun, 06 Oct 2024, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > To reach PC10 when PKG_C_LATENCY is configure we must do the
> following
> > things
> > 1) Enter PSR1 only when delayed_vblank < 6 lines and DC5 can be
> > entered
> > 2) Allow PSR2 deep sleep when DC5 can be entered
> > 3) DC5 can be entered when all transocoder have either PSR1, PSR2 or
> > eDP 1.5 PR ALPM enabled and VBI is disabled and flips and pushes are
> > not happening.
> >
> > --v2
> > -Add debug prints
> >
> > WA: 22019444797
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   3 +
> >  .../drm/i915/display/intel_display_types.h    |   3 +
> >  drivers/gpu/drm/i915/display/intel_psr.c      | 117 +++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_psr.h      |   2 +
> >  4 files changed, 124 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> > b/drivers/gpu/drm/i915/display/intel_ddi.c
> > index fe1ded6707f9..cbd71c136c8d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -4368,6 +4368,9 @@ static int intel_ddi_compute_config_late(struct
> intel_encoder *encoder,
> >  			port_sync_transcoders & ~BIT(crtc_state-
> >cpu_transcoder);
> >  	}
> >
> > +	if (intel_encoder_is_dp(encoder))
> > +		intel_psr_compute_config_late(encoder, crtc_state);
> > +
> >  	return 0;
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 17fc21f6ae36..7fb3eeb0e0f2 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1576,6 +1576,9 @@ struct intel_psr {
> >  #define I915_PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
> >
> >  	u32 debug;
> > +	bool is_dpkgc_configured;
> > +	bool is_dc5_entry_possible;
> > +	bool is_wa_delayed_vblank_limit;
> >  	bool sink_support;
> >  	bool source_support;
> >  	bool enabled;
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > b/drivers/gpu/drm/i915/display/intel_psr.c
> > index 8e9f068b9b2b..9b77045df228 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_damage_helper.h>
> >  #include <drm/drm_debugfs.h>
> > +#include <drm/drm_vblank.h>
> >
> >  #include "i915_drv.h"
> >  #include "i915_reg.h"
> > @@ -896,6 +897,82 @@ static u8 psr_compute_idle_frames(struct
> intel_dp *intel_dp)
> >  	return idle_frames;
> >  }
> >
> > +static bool
> > +intel_psr_check_wa_delayed_vblank(const struct drm_display_mode
> > +*adjusted_mode) {
> > +	return (adjusted_mode->crtc_vblank_start -
> > +adjusted_mode->crtc_vdisplay) >=3D 6; }
> > +
> > +/*
> > + * PKG_C_LATENCY is configured only when DISPLAY_VER >=3D 20 and
> > + * VRR is not enabled
> > + */
> > +static bool intel_psr_is_dpkgc_configured(struct intel_display *displa=
y,
> > +					  struct intel_crtc_state *crtc_state) {
> > +	if (DISPLAY_VER(display) < 20 || crtc_state->vrr.enable)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool wa_22019444797_psr1_check(const struct intel_crtc_state
> *crtc_state,
> > +				      struct intel_psr *psr)
> > +{
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> > +
> > +	if (DISPLAY_VER(display) =3D=3D 20 && psr->is_dpkgc_configured &&
> > +	    (psr->is_wa_delayed_vblank_limit || !psr->is_dc5_entry_possible)
> &&
> > +	   !crtc_state->has_sel_update && !crtc_state->has_panel_replay) {
> > +		drm_dbg_kms(display->drm,
> > +			    "Wa 22019444797 requirement met PSR1
> disabled\n");
> > +		return true;
> > +	} else {
> > +		return false;
> > +	}
> > +}
> > +
> > +/*
> > + * DC5 entry is only possible if vblank interrupt is disabled
> > + * and either psr1, psr2, edp 1.5 pr alpm is enabled on all
> > + * enabled encoders.
> > + */
> > +static bool
> > +intel_psr_is_dc5_entry_possible(struct intel_display *display,
> > +				struct intel_crtc_state *crtc_state) {
> > +	struct intel_crtc *intel_crtc;
> > +
> > +	if ((display->power.domains.target_dc_state &
> > +	     DC_STATE_EN_UPTO_DC5_DC6_MASK) =3D=3D 0)
> > +		return false;
> > +
> > +	if (!crtc_state->has_psr && !crtc_state->has_sel_update &&
> > +	    !crtc_state->has_panel_replay)
> > +		return false;
> > +
> > +	for_each_intel_crtc(display->drm, intel_crtc) {
> > +		struct drm_crtc *crtc =3D &intel_crtc->base;
> > +		struct drm_vblank_crtc *vblank;
> > +		struct intel_encoder *encoder;
> > +
> > +		if (!intel_crtc->active)
> > +			continue;
> > +
> > +		vblank =3D drm_crtc_vblank_crtc(crtc);
> > +
> > +		if (vblank->enabled)
> > +			return false;
> > +
> > +		for_each_encoder_on_crtc(display->drm, crtc, encoder)
> > +			if (encoder->type !=3D INTEL_OUTPUT_EDP ||
> > +			    !CAN_PSR(enc_to_intel_dp(encoder)))
> > +				return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  static void hsw_activate_psr1(struct intel_dp *intel_dp)  {
> >  	struct intel_display *display =3D to_intel_display(intel_dp); @@
> > -1008,7 +1085,18 @@ static void hsw_activate_psr2(struct intel_dp
> *intel_dp)
> >  	u32 val =3D EDP_PSR2_ENABLE;
> >  	u32 psr_val =3D 0;
> >
> > -	val |=3D EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> > +	/*
> > +	 * Wa_22019444797
> > +	 * TODO: Disable idle frames when vblank gets enabled while
> > +	 * PSR2 is enabled
> > +	 */
> > +	if (DISPLAY_VER(dev_priv) !=3D 20 ||
> > +	    !intel_dp->psr.is_dpkgc_configured ||
> > +	    intel_dp->psr.is_dc5_entry_possible)
> > +		val |=3D
> EDP_PSR2_IDLE_FRAMES(psr_compute_idle_frames(intel_dp));
> > +	else
> > +		drm_dbg_kms(display->drm,
> > +			    "Wa 22019444797 requirement met PSR2 deep
> sleep disabled\n");
> >
> >  	if (DISPLAY_VER(display) < 14 && !IS_ALDERLAKE_P(dev_priv))
> >  		val |=3D EDP_SU_TRACK_ENABLE;
> > @@ -1686,6 +1774,24 @@ void intel_psr_compute_config(struct intel_dp
> *intel_dp,
> >  	crtc_state->has_sel_update =3D intel_sel_update_config_valid(intel_dp=
,
> > crtc_state);  }
> >
> > +void intel_psr_compute_config_late(struct intel_encoder *intel_encoder=
,
> > +				   struct intel_crtc_state *crtc_state) {
> > +	struct intel_display *display =3D to_intel_display(intel_encoder);
> > +	struct intel_dp *dp =3D enc_to_intel_dp(intel_encoder);
> > +
> > +	if (DISPLAY_VER(display) =3D=3D 20) {
> > +		mutex_lock(&dp->psr.lock);
> > +		dp->psr.is_dpkgc_configured =3D
> > +			intel_psr_is_dpkgc_configured(display, crtc_state);
> > +		dp->psr.is_dc5_entry_possible =3D
> > +			intel_psr_is_dc5_entry_possible(display, crtc_state);
> > +		dp->psr.is_wa_delayed_vblank_limit =3D
> > +			intel_psr_check_wa_delayed_vblank(&crtc_state-
> >hw.adjusted_mode);
>=20
> Compute config should only change the crtc state.

Hi Jani,
I see your point the reason for having this here is because as Jouni sugges=
ted that we get the crtc_state completely filled out
Only after compute config so calling all these functions there may end up g=
iving us misleading results. That's why we ended up using
Compute config late path to get these variables filled up. Also trying to f=
ill these up in pre/post plane update gave the wrong
Dc5_entry_possible result since at that point vblank gets enabled.
@Hogander, Jouni what do you think?

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> > +		mutex_unlock(&dp->psr.lock);
> > +	}
> > +}
> > +
> >  void intel_psr_get_config(struct intel_encoder *encoder,
> >  			  struct intel_crtc_state *pipe_config)  { @@ -2742,6
> +2848,7 @@
> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> >  		 * - Changing between PSR versions
> >  		 * - Region Early Transport changing
> >  		 * - Display WA #1136: skl, bxt
> > +		 * - Display WA_22019444797
> >  		 */
> >  		needs_to_disable |=3D
> intel_crtc_needs_modeset(new_crtc_state);
> >  		needs_to_disable |=3D !new_crtc_state->has_psr; @@ -2751,6
> +2858,8 @@
> > void intel_psr_pre_plane_update(struct intel_atomic_state *state,
> >  			psr->su_region_et_enabled;
> >  		needs_to_disable |=3D DISPLAY_VER(i915) < 11 &&
> >  			new_crtc_state->wm_level_disabled;
> > +		/* TODO: Disable PSR1 when vblank gets enabled while PSR1
> is enabled */
> > +		needs_to_disable |=3D
> wa_22019444797_psr1_check(new_crtc_state, psr);
> >
> >  		if (psr->enabled && needs_to_disable)
> >  			intel_psr_disable_locked(intel_dp);
> > @@ -2791,6 +2900,12 @@ void intel_psr_post_plane_update(struct
> intel_atomic_state *state,
> >  		keep_disabled |=3D DISPLAY_VER(display) < 11 &&
> >  			crtc_state->wm_level_disabled;
> >
> > +		/*
> > +		 * Wa_22019444797
> > +		 * TODO: Disable PSR1 when vblank gets enabled while PSR1
> is enabled
> > +		 */
> > +		keep_disabled |=3D wa_22019444797_psr1_check(crtc_state,
> psr);
> > +
> >  		if (!psr->enabled && !keep_disabled)
> >  			intel_psr_enable_locked(intel_dp, crtc_state);
> >  		else if (psr->enabled && !crtc_state->wm_level_disabled) diff
> --git
> > a/drivers/gpu/drm/i915/display/intel_psr.h
> > b/drivers/gpu/drm/i915/display/intel_psr.h
> > index 5f26f61f82aa..e0fa04952393 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.h
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.h
> > @@ -47,6 +47,8 @@ void intel_psr_init(struct intel_dp *intel_dp);
> > void intel_psr_compute_config(struct intel_dp *intel_dp,
> >  			      struct intel_crtc_state *crtc_state,
> >  			      struct drm_connector_state *conn_state);
> > +void intel_psr_compute_config_late(struct intel_encoder *intel_encoder=
,
> > +				   struct intel_crtc_state *crtc_state);
> >  void intel_psr_get_config(struct intel_encoder *encoder,
> >  			  struct intel_crtc_state *pipe_config);  void
> > intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir);
>=20
> --
> Jani Nikula, Intel
