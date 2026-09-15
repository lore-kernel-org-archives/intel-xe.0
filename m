Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7057C88E53
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 05:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1E310F969;
	Tue, 15 Sep 2026 05:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1h08LJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7428610F969;
 Tue, 15 Sep 2026 05:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789449063; x=1820985063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WRODqESep1FbtVh5LG5MMPJvoPuBj+nglpfcIMtOYI0=;
 b=j1h08LJ+p2lrDtI3BDj5wBofkpocQfC5tKunn2+rBVNRiv18yYT7nwbB
 5hvovZU3HemVCzpnAtnZyu4hE7KFqxME94hb+O6QVExyz3INeXDRxf8sY
 8f8OHbGIq372b8Orlf+jcfiDdjiMt8X2kk7RWbACkquLD5vA7cO8B4QWf
 XGHtb/9/KhMW3cg68isPO2L2vvo7viShaTKL8pkPcKe+Rjb+hRUs3d6qI
 npn0scNgq2i+zq9DtzpVjak2cH1vDSocNutJlc3UbcabvJOY0yNSdxXkM
 2MrB4oRdyTy49+K0BcRfsYkbB6DJsCTEgTspT0wZmNmC7BGXF+i3ISOx0 w==;
X-CSE-ConnectionGUID: rDo2frowSAq6Qum6YtHXOw==
X-CSE-MsgGUID: g4rI1lbvTDuloIXi3UhR2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88940910"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88940910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:11:03 -0700
X-CSE-ConnectionGUID: eEZl0TQ2RZyA9gA1PtPegA==
X-CSE-MsgGUID: OIkyn8w0TryBmXpyIA41Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296338013"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:11:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:11:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:11:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cu+3K8jlBPHcUE/A6yA6WDzLDrUfI+2wIUOIt4SuC7U/nbLuoK5GTttJ53bYr+MeVQFRen3KpqbeptVd6/+V1tLTmXrzSPnkegcSs46hS5MuiYJERjEMGNwX1waAlgqw7enJk9K82G0JKgoHs/JmCdh1Pp4g3JMYpQiylA6KIpdbTNhzFcRttfbh/hnGM29I82Nz17Bjbwn4EEebm3mhavI7vIpP5Um8BIm0vm2VT14b1HSCOk1TP9qcEUQlOixxdxOiNwwUMtJVuMvmX6lpEAkL4JwoxBFpAAj85BcavkLa9SSqMwus/rTQIjsiWDezyGCczONKQr+XP42Hgxjwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOjbpGvq4Iy2m59dSZJzfoYdIf55DwUB4UGvC0cZXUk=;
 b=P2OtcP2ja1KIx5xOMHBX4kgYFAUfCXNzHIiDBg0F7wn5AKtH6nJ9UzqWafrCDYx/7GTypXakZrgLfdH2Qi1+YIDgnJD33N0dHUhyIGcIunW74OJjBRnMZXKAFJgeBCIAzdoBoFrsvRpFsrn7LnE8j5Fdn6hR9J2kjtNCujyMaG2x7/bioPG2GbK4EDwaJanzvduk9j1hp+psv4m6i8MEUIRe471TEKEqaUhF/WbbaSIBFAB6DRojA1tiKKaBbny9A3Y8Pghl4t8NxF+zKNkr+B5tMd53Vejw1zt9UPh4Sq/wRY8mbQVFxVDR/HuXB50P/KaKYmrojzUO4A1xE9HHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SA3PR11MB245380.namprd11.prod.outlook.com
 (2603:10b6:806:52d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:11:00 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 05:10:59 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Topic: [PATCH 01/10] drm/i915/display: Add helper to compute link M/N
 ratio for reuse
Thread-Index: AQHdQaQg389uNdczOEupK8a/jvJQMbbJPN0AgAABEwCABd9ZkA==
Date: Tue, 15 Sep 2026 05:10:59 +0000
Message-ID: <DS4PPFE901A304F4B1F7A22CF105DC67F4CE3BA2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
 <20260911041449.3699400-2-suraj.kandpal@intel.com>
 <123bd5fd897e0c5d7d956d2cc94eb8cec6d7f91c@intel.com>
 <7fdf17c66751d921b26c64c3ea25060fb4f9db54@intel.com>
In-Reply-To: <7fdf17c66751d921b26c64c3ea25060fb4f9db54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SA3PR11MB245380:EE_
x-ms-office365-filtering-correlation-id: e6786310-8cd9-436e-cc2d-08df12e7bb3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: OzxnB5GSouo6d30NOloYgSg68eKN7I90DAsjY5SfkcZIOvOGF7RljZvK9TqvwjTIxAFT23pHeZALpn21hppPWhigPPa5w4VmwzcZoSm0EuqVQJ9TF0qzikpiszSZrEbxMrnhSU20OcdQJi69/03SqzQC5toQw2gTALSwOln+DZp85F5K64lq/pQQ+EGE87uFzu5P2vPyj+rArt82hhE+dA6yJvbkcTLU83MhDDaE780VRgtX0VeBXopzfTOKKuyDLHq+VWVHAGe5AvBf7dq4bHi1mVrNMZ9kE6sUN/y3eR3inAZKLnrea9FZr905DgbXI229wvSDyZ4i6RU/uyy1phbXv90BAvvnaGtFEXd2lB3leOyaVwGF1+SuMyD6Y/Czj4W379MUboY8ilMMIQJbc629/B4VejUR018ft36GoNcT3cY4uKbXLfiAYB9O8vmVXr4K5GcdNFd72UxbZPlfkqWXJNzMV400y3RX8em60G9h/xU2AUEhIhG1ykU/VoU0qNOQg7auciqG2bPoahMhfCnIAiKVivFwaJdW6OjhXIzjwp6JIBy1RMDqOLjGig4HqiZ8SS8ji+hICKer7f5y1lhW9xMmBsdiro02vUkM9vsF/f0uFv9YcBWRXXA4/8Cg3eSzWnuH3wQLHjM7gjRf7ttC1TWalhTbw3TfuVMcfWKsQ7E9HztUPThzc06u/RAkcJngpEoHHTnbp0W7tbhcDwbtqzg57uz2qfCYhd8ejFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+jfrUyJ8a7QWqmo6TegAbAccXruGIYhtkTqoD6cjvOLMi4f/AhgbalUlbx9i?=
 =?us-ascii?Q?UAcEFf545kE1TRXK7Wn1jxEBL1eJJivm5Ije6i+fsvRpayZb/E+5bh5WbVQV?=
 =?us-ascii?Q?gxMn27P3i+x1j3kKesmqYFh0dPx2X0VcCIIZkcIMLfIxQsWLqrstUSDdJj8E?=
 =?us-ascii?Q?StXXu5sFxd0T++kCbjzXXjT8/g2o7jIvvO8iWYHeEqhMFNAEB2CCtITu0Ka8?=
 =?us-ascii?Q?FwE6PmPXMVweJ/GWBqO6VeUAKSsWBM7mtXrGYUiLTG3FQ8XhE75zU+b3ZPZF?=
 =?us-ascii?Q?Qa+kqI3usvZU3G1OnX8dSsj4ojyKy52+aUoa7XyhhMXeB2bsvbm0JqRXt2PS?=
 =?us-ascii?Q?mx4RyXy8C/zocvBwK7/CyHiLPTwBOY6fIOPpOHwGFqJOPxU9vlHNMfWZAmlC?=
 =?us-ascii?Q?qTcEuVNNvyGuhNN4OI2Zv7jvs64HrXmX0csO+0CJlWE6sRcH7PVWmBPRxggi?=
 =?us-ascii?Q?id1mqzPNX3ZY/yqkm7DL96Z85H71ArvPby6zymFKfDQEZOYhyFyZ8kg8d3P6?=
 =?us-ascii?Q?0Vz1g+BpAL1f3/oE9k6+U91kyxO7UtL51MLiO/BEWFRxO5ffDU8Jad86sBJc?=
 =?us-ascii?Q?6UHhJah7zNecgHWM89LE5csUXd+Fi+eeCWKEQ3IIVnt8ZSftytgtz0anm9xJ?=
 =?us-ascii?Q?nimDaLGxvz2GszN7wLkdNoZoNHQ0PmAxfXwsI4LYiuc0FCsx9LHBdS1p2LNK?=
 =?us-ascii?Q?D13y/x3up9lfO19ZNQJFpa3/LtyH5Vybhtl51ud6vhEghVBRTxxL0IqVb4S3?=
 =?us-ascii?Q?JWVteeIDNP04KbrYGbOc8kbmD0tPr+Ep9+C8og1zILuVkJGP1vhzDavhgds1?=
 =?us-ascii?Q?nAaEGnJbPzsFnG+v9k2LaW6jfO0xYpR+cEdDtC8/nXTB8O5FL6KcJp3yFiOV?=
 =?us-ascii?Q?fTxKUnoq/ib+eYiuTUIw4JStgmNKWOiGNaMJhUKNZYHa5se9mttvkEHCF+Md?=
 =?us-ascii?Q?1wf6IoS+rvXDW1sL4ikL+Gfb+D+qlzztrS9YAxDroTiBvxDBYzvVXBH2UEq4?=
 =?us-ascii?Q?5nj7ZhqVY579huntcs1ml2Pty1DE99t0+6c874SBHgV/EB0DK/Ur94VkCezL?=
 =?us-ascii?Q?6tEHUh/saEhRv/WFIAxeK01vVB1tSv6h67SRy+CwaLj4PXZ9eojZR81nvIlR?=
 =?us-ascii?Q?sxSicRWjUYGvglSTLZ7v3UIhi27VbgXFNVoEP4AXcq85as83qY0yl/xjMiZo?=
 =?us-ascii?Q?HBzru0GSvboVRsDwn4LA49oAO3k3wBp+/XI1Sw7dEnI4+tXfK+a1CemmTD8M?=
 =?us-ascii?Q?hOR9SsMnuoQSV1f9/lyP/MCSQ4LLd4rwqrwCtDGHdvfuQaXG4MxOPrBTKXV4?=
 =?us-ascii?Q?m9eGuCVa8PXp9YdK/E6pkCn8EF+orW+qOzAF6wuTkNoI2eQL7i+u8QZMujpn?=
 =?us-ascii?Q?aKen3wklGKiF4X6z/2UjiY1+EOMvvecRh6z35RD8T0F3Zx+bllU8SFiw1dgX?=
 =?us-ascii?Q?8kE22s64yYzlhsrybPYMlt2hFWfQx+5Bs7db9dAZZeCdbOx3tAOlx21HNgAr?=
 =?us-ascii?Q?Hpssa8d5ndBQbDmIhRoedzCKXhar7Z3BrPvMgYWXjAF+Z9dPO3MNR80k1r3f?=
 =?us-ascii?Q?5+DjkuHMBBkuo4s9RzjUR2jHbEPDQMcHnpK4D6vRF4+MfJAI0EBQuJWRLv/6?=
 =?us-ascii?Q?MHO6jRBixxpPOIwFrHVo1Oz5bdVjbi7B1UX4QvSz8F8mCt0bLb5JnMFEayPp?=
 =?us-ascii?Q?RFxEu4whq4V8neXvLUfrD/XZRrCw8+uUAX/lABU+5iph2dRIV90fPd6pnvZ0?=
 =?us-ascii?Q?v59uC8lNmA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wpo0/JcuwTIfoee3Hc4tldwNeSEJw2Ba9WoigSWeC9u+4rv4H4SibxNv+7oHQeHbWVDnb//McqLHQyqwD+vUC4eqrNs9PiaM/Rzoh5yjqVgiIYnhen8mlhOrtXou/uGUMlQjtZ0URYextRDXnawAFU1D8b9iI6WAYqotB2/NX3VguwddiD1h55n5u2tmR3ZjGyEdO3CPegzC1mzY3vRqWfvfi/Pl1PA5Yyd1JAgY0I3tPrpr+pfBvydbeiiuPFw1pB6dGixV7IJEM/NoReko2PPLyDC4QbrZ6M9m8eodvIo0kNboeD+Vx9+gverldd5296fiaB1dI2G4hw3o8xnHFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6786310-8cd9-436e-cc2d-08df12e7bb3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:10:59.7179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HI2GPpv1B4fF2Db86viPYkPqUHB51C7oi71YoCLXtQffNvz2oqe6C0kRfnVzPzzaMbtjaJ7p4NDICQSduBa4YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB245380
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

> Subject: Re: [PATCH 01/10] drm/i915/display: Add helper to compute link M=
/N
> ratio for reuse
>=20
> On Fri, 11 Sep 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Fri, 11 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> >> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >>
> >> Introduce `intel_display_get_link_m_n()` to compute the link M/N
> >> ratio
> >
> > Please drop the backticks. IMO it's just ugly fluff in commit messages.
> >
> >> based on pixel clock and link clock. This logic was previously
> >> embedded within `intel_link_compute_m_n()`.
> >>
> >> The new helper allows reuse of link M/N computation in other contexts
> >> without requiring the full data M/N calculation.
> >>
> >> No functional changes intended.
> >>
> >> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
> >>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> >> b/drivers/gpu/drm/i915/display/intel_display.c
> >> index fc30a455bed3..b5682c196646 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_display.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> >> @@ -2633,13 +2633,24 @@ static void compute_m_n(u32 *ret_m, u32
> *ret_n,
> >>  	intel_reduce_m_n_ratio(ret_m, ret_n);  }
> >>
> >> +static
> >> +void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
> >> +				u32 pixel_clock,
> >> +				u32 link_clock)
> >
> > Now we have two functions:
> >
> > - intel_display_get_link_m_n()
> > - intel_link_compute_m_n()
> >
> > in which one is a part of the other, but the names are quite different.
> >
> > Why? Shouldn't the names be somewhat similar?
> >
> > BR,
> > Jani.
> >
> >
> >> +{
> >> +	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
>=20
> Moreover, this is now DP specific.
>=20
> Maybe you need a different abstraction level to keep the DP link symbol c=
lock
> stuff inside intel_dp.c.

I have Renamed it to intel_display_compute_link_m_n() and made it take the =
link
symbol clock instead of the link rate, so intel_dp_link_symbol_clock()
moves out to the callers.

But intel_link_compute_m_n() itself still calls intel_dp_effective_data_rat=
e()
and friends, so that only moves the DP bits up a level. Did you want more?
It's also used by ilk_fdi_compute_config(), so I wasn't sure moving it into
intel_dp.c is right either.

This will probably require precursor patches refoactoring and addressing th=
ese issues.
Any suggestions?

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
> >> +
> >> +	compute_m_n(link_m, link_n,
> >> +		    pixel_clock, link_symbol_clock,
> >> +		    0x80000);
> >> +}
> >> +
> >>  void
> >>  intel_link_compute_m_n(u16 bits_per_pixel_x16, int nlanes,
> >>  		       int pixel_clock, int link_clock,
> >>  		       int bw_overhead,
> >>  		       struct intel_link_m_n *m_n)  {
> >> -	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
> >>  	u32 data_m =3D intel_dp_effective_data_rate(pixel_clock,
> bits_per_pixel_x16,
> >>  						  bw_overhead);
> >>  	u32 data_n =3D drm_dp_max_dprx_data_rate(link_clock, nlanes); @@
> >> -2656,9 +2667,8 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int
> nlanes,
> >>  		    data_m, data_n,
> >>  		    0x8000000);
> >>
> >> -	compute_m_n(&m_n->link_m, &m_n->link_n,
> >> -		    pixel_clock, link_symbol_clock,
> >> -		    0x80000);
> >> +	intel_display_get_link_m_n(&m_n->link_m, &m_n->link_n,
> >> +				   pixel_clock, link_clock);
> >>  }
> >>
> >>  void intel_panel_sanitize_ssc(struct intel_display *display)
>=20
> --
> Jani Nikula, Intel
