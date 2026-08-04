Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14DC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 07:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F97710E8AF;
	Tue,  4 Aug 2026 07:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WupUK81E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16E010E8A9;
 Tue,  4 Aug 2026 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785829831; x=1817365831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T977gntMBnOao95G69MDqc2HLyHvKKy/Y+HLTqTFjXA=;
 b=WupUK81EbQyumIJD2j+jhypCQCvKiiXwlhI7UNP6nIn0oQ6d8dn0dIYh
 NMXkA2YLYEoh/D0FOTBEXpBLp9Of5TYCz/ETFR/R09rzOWreKieuYs9AY
 A7GTIMk7rO+oPlCrTDpbRxRpRflIYLHgF6K8eyXa+bASgHOvDJ/Z9ujuv
 AhjPM6/o5VFVUFA3r/i+J9DgOK9yMxrjpkAI3DbpYFB/Enpd0F6qRJWv0
 MXTp7jLnjc8gsB009i6h1Yo4+cUI+np/KOe2wi7F2fwj5REzsLJl4D8ry
 Vjgm6BCw2Vb2VhzxpK+tz+vlvvz8Ny48alVdqf4slajEhazna2nKuuCDS g==;
X-CSE-ConnectionGUID: a55rSWlgTqaugdIRcjLHpg==
X-CSE-MsgGUID: EMQeXLC/RnGXyIyueonb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86385238"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86385238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:50:30 -0700
X-CSE-ConnectionGUID: OWqbdSuETX+xmvXADKjiUA==
X-CSE-MsgGUID: 9LK0HtNiRPW1FfTdgUm2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="260197334"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:50:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 00:50:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 00:50:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 00:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgIjLDcgANpmtjWewC/OW5dQRFdaZ8Abq6wOylpcYhBGiuCSq1fbfZqTFmywpwXHaDmPika1ab/pHZQpY20Q2o33u9/nfBYYwGD/1nCrcu/FmzIWU6PAc8kKAA1gFXjcvIykQoQ08+lCtyXcBYIcPBhp4HyMtbAKqXfCZ8PpMa5bl4Ltb2jPCw5oWtYayEaA3udL7dvN1si4ZB0XkAWROOlgQdD5FoMRmW2aRQJTZ6WT0CQzMLMOz8M597x6OyIso+x4rx8WplGmmDhaGkJ2UtVllvCX5+WSdyXstb5SmbkNrfbMfKmgbVm/42QMRUqlRMAZYVGbNomFyLzc9igJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yX5ezr3YiARhgmkHj4CHwAQKOOQqqC3U0ijAtfTJ9hM=;
 b=CmzLyuqK5cL4Rw0iWQcsEKHN3rj3acYtUOMIMO9Zw0sZ/Qq5oy32HjK6W2zeXHDAD93xnvzPkr9cMf6Xd8qfimgru1TNUKkVohLiAdqmROO6eODxyRJ1s+waSH5+s0cxIqX2DiwyFczGp1I+ykCmxaLiJdPR03kwhH9gbk1HoVixq4PG/IrXdQfalQIrGgp7zk9Gy4mxFor7bgqsUalbL7A5Oxxn4GmRaNddtwSlfK5gYjUY7vPpFo1eD9SY9XjkXaNLdLw+VXUl2Zvg9US7+x4sv16X0Poe62Qyc40TTlG8TuA8UAZKr770JHDNEMqWOIy0KjWgiZr6VGilMxgprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY8PR11MB7748.namprd11.prod.outlook.com (2603:10b6:930:87::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Tue, 4 Aug 2026 07:50:21 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 07:50:21 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>
Subject: RE: [PATCH 2/2] drm/i915/display: Keep AS SDP flowing when skip
 frames is enabled
Thread-Topic: [PATCH 2/2] drm/i915/display: Keep AS SDP flowing when skip
 frames is enabled
Thread-Index: AQHdI3aoVWrl0DVp8UOtVpkqGtkw2LaNfNIAgAAHT9A=
Date: Tue, 4 Aug 2026 07:50:21 +0000
Message-ID: <DM4PR11MB6360D72489B3C836FFE68E68F4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260803185305.562609-1-uma.shankar@intel.com>
 <20260803185305.562609-3-uma.shankar@intel.com>
 <01943e93-7481-4721-ba09-ee0f0d4ea723@intel.com>
In-Reply-To: <01943e93-7481-4721-ba09-ee0f0d4ea723@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY8PR11MB7748:EE_
x-ms-office365-filtering-correlation-id: 82631a23-e97a-4830-f66c-08def1fd0929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|3023799007|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: oGO9RmEngDGnQDv7wVcmme49KiQpnSqJnmZ7+DD39dgo8OqJqr0WUVeUTkIOLirk2P0u5YxpGq/qr6np2tK2ZVRYBBmCrt3UOhNkYcbBRPsWDEvzltac3VrAe2/ozPksNEj0JGQH+HdIadA5z5PSOzc9ZpI7m6CU9GR8CTGK63htyZpr3a0H/XXNVlQF8+TY/hMsY9S89EhbYoQB/pAhjp/tWsaSgLmak7LZQH1erKcZAibRL0YytZ8hSbQy7w+dR/dboUR6vR8LnOFdXs5uavC8uEkTH9NIn9HTqFFCh43Ho5ks28Vf/xX7odQ8aOWpkD1BAJzpsxbhATOSnkSU3lxHH5tffAwqZYfHQtrlSofwFHZYgDHuaIH0zNJl7Byixt4z7UNkC775ItnaJAxudTEasW5ixTcynWkTnD42PXUKV15SlnCYcG1J3HYPWZLyvzwDvJK9/gKZFX9pMXQO5J8rW/PeOuH+ehLtl5u1yZngIq+a2ljGxuCliZ5AJAkVGzmmE8JRUzYmE37FVpcaWtxC98N4JTupE5S78AqKMwEyEFLDwMMVSR9HoaDFvjsPKGhIdRBnvY9JTK7ZP7Lm4hcKIKOhyH5Zx37ilbVEMhTK4Iogu+aMOy0UbLVnXbKy5fB8c4bC+LdRK/9BEscVrDxa94ZjDZK7Rm2HVhlwuYT+3qNK/PDL7If5h8apf24KwUFfctzqEPHgJ6VsojOBMXj+9j2XsOkQsKgmVeeKEjQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(3023799007)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+xBgts65TkzIIudfwWNVZztOGyaDX8h3XrU9VqK2YoZEuWT3mdlA6uArKbwO?=
 =?us-ascii?Q?r88QBMRGOOrumtm88xqvsNX/xS1GNJNHkgjlujptJJS9ZsnTqxfDV76lNPHp?=
 =?us-ascii?Q?+yot9tM+i16uD2wXCYk13Glx4SjkpBc8X2ODWVWmXQQO+krR8iUew+vtyJpt?=
 =?us-ascii?Q?8InzuFt6b4MxVM8jdQLp46cXEp5kipc9HXdAXEmxaXJ+FQZ3l5XbfsqnX/NG?=
 =?us-ascii?Q?KgBAyuNcmkte8xBTdz85QS4QuCt0+bsbd8NvcmOKNDHOuMQR2i+oeRMfzMsB?=
 =?us-ascii?Q?S6Z8vFqwJ7vkAzsCuWIZEJ6jRGCm0lluBVjWdfjNH/hNWAUXY+U7ie2R18jc?=
 =?us-ascii?Q?CWvFi2LWZGwAt3uo9omF9ovwla1UMIXTjE4Z++j3IUK47fG1tgQpog+2chOS?=
 =?us-ascii?Q?1LkH3Nf9jCZ/+SXU7P6LpxncFF3rlCytZutlLuWRz5BFYYsdheKcZf3EJR8M?=
 =?us-ascii?Q?y/B9cTpoOLj/dz4pf7w6Tc9gye88wadIURcCacYWAy6m7QTB2GwFrOJ38FQV?=
 =?us-ascii?Q?NMhvYxiT9TjJGdzLTOfaoxM0eyO+knbxJkeRhwr8mQr5pmTHdiuwwCXpH0/k?=
 =?us-ascii?Q?ZvZOFApvtNi3fN+tTkNy39CCqCzVnjWDWhWhs+xzyQbWINqUjfdcoZ4nk8Vt?=
 =?us-ascii?Q?tVIO2HtGXeBeMKuQ+1m7wCMouJlC7re6VZ1T83jJGQK7LghH1PBkRvTna2Yq?=
 =?us-ascii?Q?mchXKAggNpsSo3njGYApm1IcwefwtTe4J54HUkrP/H0cAjT1kyPDn0NOpKpx?=
 =?us-ascii?Q?vAfRnWkort7cPbMS1fYWolVVCE2k3z1WkQ+WkbTfqB4jbZoUSZd6MxWqe2qi?=
 =?us-ascii?Q?6flFU7EZ5pg9kKT5Re1og+MybVSxyY34DUuiNLjLX0I4oVNLb4BidDVWcoxN?=
 =?us-ascii?Q?dVSnF4PH9VlCrl3hOEmdj96rVmCVVoi24AIkPwNCPJBq80rNfe1+mI4IASK7?=
 =?us-ascii?Q?c3XP9CaSA+/Fd5aHCsQpvIIYqFpBKR1T10PztMEIgUGjsJ/opp7if6SGUlt+?=
 =?us-ascii?Q?3lWyT6tt6vN+Ho+ENjIKKsXkrgY2h2OD193LI8HgbUFifgUqzfRCG78BoXOo?=
 =?us-ascii?Q?6tNWlSAXVM9AcGtuJ6aoMPnXs/Jew5tLHhe5E4lmeq5Ski9EZt43NvToLdte?=
 =?us-ascii?Q?7L1BFZvnk2ZwGN1+DmCSPacSF5RoBntSTpyDZ/zuGqDi154UOyh+H43Nj+ZM?=
 =?us-ascii?Q?akY9eP+mius4tX0W92SgAoS+RKK1a4v0e0UYwn/zx9Vh/UZH79MnIxcKphFz?=
 =?us-ascii?Q?gqw7jIPk4eWvibXibplhG9VFg/QvUA4RFPQbgh79TNZEydsIXFeuJ9N1jPjd?=
 =?us-ascii?Q?GMnXHyHg51Ak44mi9FBmoSRy6Avt9H6eGwTGdXWMeIRpQdRbtbz5fpGNn2cj?=
 =?us-ascii?Q?2LxmSV8ndqd8VlvsOaLNOciNiuKWEzGPVRQMWOVCrfxzLSV2cNbOmUAAxz19?=
 =?us-ascii?Q?EHoy/e+CW6gY8dO3Jc5MLcCLGZ9pljeZH0ZTBDyCof42g5O6jSSx+5pGxjty?=
 =?us-ascii?Q?Gut4+Hxi4Z3YEj44/CRe8DhU7U05AhA+mhp41JWSAojCEiPChNjHFLzO67YP?=
 =?us-ascii?Q?OoLQiJkO83YWUKhG+cBNSb/3ORPgYDSpGNsu7h91oT/4R7W0EANwKS8XsuRX?=
 =?us-ascii?Q?jI+hev+TqX4yD7F+ft7b7tU8WHlVRgjhJOfExVnQ1WVTh41DdOtf1de85wBa?=
 =?us-ascii?Q?3JLMOA/lENTy8+16/FmV/t2RYvl2IB3QE2Vq5QfNA+cRr8UNH5+isIPiVt4M?=
 =?us-ascii?Q?yuN7bvhDsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gMpK0CO4mnDJ3SLoFLrwzdA8kVUSxMPF+MwZxNx9WSC2KeFe1K1tENqY1s8N8Q2j6HtGzxMIkDFb1LjX7kKjxqrAsabm/UWmHGAECx5kQ/9zkyN9wBdd6rSl7e/TcsvVF3n2J/iga6MN/YVQlYDQkJUVLkI8dgYZl1wJxNWd8jN0HR+gD7MiEzXx2zYptT3yKGB4xJgcZWGHkRaNceSAXtDfFLqwYhLxFgQCF8Z6iIPv+KSaONxqv3+VVsMN58daOXs/lxSG2DT9SFz8hNFu96IUhuEY0cvH9mCTfjIuluQkIGqmjUTXGj+C2ZqrmONQgaElwpF4j8XmvtwvgYwcGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82631a23-e97a-4830-f66c-08def1fd0929
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 07:50:21.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5xJ3OaLarbx984dJuYyovew0W+j9yzs6uKkgt+C+O0Sk33xTWwXHM1eMcv5NbZ4ydNPaunX2sCeE8edoGXXM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7748
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
> From: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> Sent: Tuesday, August 4, 2026 12:52 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Cc: Manna, Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH 2/2] drm/i915/display: Keep AS SDP flowing when skip
> frames is enabled
>=20
> On 8/4/2026 12:23 AM, Uma Shankar wrote:
> > The AS SDP skip-frame mechanism relies on the AS SDP still being
> > transmitted (just less often) while Panel Replay is active, so the
> > source must not stop sending it in the PR active state, nor enter the
> > DC3CO idle protocol which would suppress it entirely.
> >
> > When a non-zero skip-frame count is programmed, leave both
> > PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
> > PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL cleared. The previous
> behaviour
> > (honouring disable_as_sdp_when_pr_active and the DC3CO idle protocol)
> > is retained for the non skip-frame case.
> >
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_alpm.c | 28 +++++++++++++++-------=
-
> >   1 file changed, 19 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> > b/drivers/gpu/drm/i915/display/intel_alpm.c
> > index 0f98f02a1848..7e2292f93e1e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> > @@ -439,21 +439,31 @@ static void lnl_alpm_configure(struct intel_dp
> > *intel_dp,
> >
> >   		if (intel_dp->as_sdp_supported) {
> >   			u32 pr_alpm_ctl =3D
> > get_pr_alpm_as_sdp_transmission_time(crtc_state);
> > +			u32 skip_frames =3D 0;
> > +
> > +			/* AS SDP skip frames field only exists on Xe3LPD+ */
> > +			if (DISPLAY_VER(display) >=3D 35)
> > +				skip_frames =3D
> intel_pr_as_sdp_skip_frames(crtc_state);
> >
> >   			if (crtc_state->link_off_after_as_sdp_when_pr_active)
> >   				pr_alpm_ctl |=3D
> PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> > -			if (crtc_state->disable_as_sdp_when_pr_active)
> > -				pr_alpm_ctl |=3D
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> >
> > -			if (intel_display_power_dc3co_allowed(display))
> > -				pr_alpm_ctl |=3D
> PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> > -			else
> > +			/*
> > +			 * Skip frames needs the AS SDP to keep flowing during
> PR
> > +			 * active, so it is mutually exclusive with disabling AS
> SDP
> > +			 * transmission in active and with the DC3CO idle
> protocol.
> > +			 */
> > +			if (skip_frames) {
> > +				pr_alpm_ctl |=3D
> PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> > +				pr_alpm_ctl &=3D
> > +~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> >   				pr_alpm_ctl &=3D
> ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> > +			} else {
> > +				if (crtc_state->disable_as_sdp_when_pr_active)
> > +					pr_alpm_ctl |=3D
> > +PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> >
> > -			/* AS SDP skip frames field only exists on Xe3LPD+ */
> > -			if (DISPLAY_VER(display) >=3D 35)
> > -				pr_alpm_ctl |=3D
> PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(
> > -					intel_pr_as_sdp_skip_frames(crtc_state));
> > +				if (intel_display_power_dc3co_allowed(display))
> > +					pr_alpm_ctl |=3D
> PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> Do we also need to clear the AS SDP skip frame bits here?

Yeah we should explicitly clear it to 0 here. Will update the same.
Thanks Dibin for the review.

Regards,
Uma Shankar

> Otherwise, LGTM.
>=20
> Regards,
> Dibin
>=20
> > +			}
> >
> >   			intel_de_write(display, PR_ALPM_CTL(display,
> cpu_transcoder),
> >   				       pr_alpm_ctl);

