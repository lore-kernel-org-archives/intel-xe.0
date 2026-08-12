Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE2C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 10:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EF08922E;
	Wed, 12 Aug 2026 10:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxUkV5g6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C75D8922E;
 Wed, 12 Aug 2026 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786531337; x=1818067337;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lxIQ2411jWSGLBipCWL9le3lmQGn4Yb4+erIErfXtA4=;
 b=SxUkV5g6nsLDKXwLT+8MwtCh8qPnrdlBARq0FiLJ/5ILp/NhvEWI1JQJ
 6ljV/X2T4y8ckoKnBAjfoqbobmytSZiqhP+MI8FxHB2qHH9u0MW8FeYTe
 eXPtDU0S2M5HUsPkUtfrpQpeluPFOtrC5gAYjJHhi655U05C4iMr9hjYA
 ZFOnWUaBYlAB1/MPwEuzhsZRq5rJEAQ3Ghq9g0Op6ehizTrTaCG7YSS4R
 DFc+Q9kXBzmvrKzsW0kNQxKG2kmOK5fc0uaS2Bg3iHl6aSGDLnUhwb7h8
 WZvkZKJyHRHtB6lmCxYeD6STsPfmgS25jfJIp3vYGITq85qmGWDtWoBm0 g==;
X-CSE-ConnectionGUID: ftz8BgOtQweS/Opl7tyHoQ==
X-CSE-MsgGUID: AZBvEEoDTJavA7Ma7MzMsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86955057"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86955057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:42:16 -0700
X-CSE-ConnectionGUID: bcJj3yEmSB61GFEPASfvNQ==
X-CSE-MsgGUID: EJ3AEDGYSAeQ4ewxsquTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="293551343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:42:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:42:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 03:42:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 03:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM2KZMIPy84vrBT9rtrBGCbGFC9/tIIOcce06O2VT1dBARHHLyW18jNvvHylRXjTAe5jqxaefnO9u41/nzeQy0fVt7Um0WvyxZgXY+ME6koJrIi4kPRZwTG5jyiUAfBe43vB2K10Vf7g/egL52xkOLN8A45Im7D3otPlGrw5VSfb/VO4xGEjSUZWn1Bp3jrkzCSMjri/NrRmrDfAUPPjbG1mp4FhTREZ99JJwG0qDwbN6B3ANULS5i7NzOjE0poq2QdvqN7z9V2dBnC9e2tE1McCzNaQjiroomSulSuZy+Qt9mE2kU6Eg1BOFGZ6mqKF3L3jflvnrIN49/eGgU+ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLpNtlmaCw5AqttUYFqYQVJVD97/zhKcb4RP+KSVSQE=;
 b=g0qwYTcYBe9FjeEGGDrICH703P7bHYxUPsRy4Bg9Eol7DjeWExh5vY1YTYvZ9Utn/WnikV59WTnXf2vgbppOSIX7iVnH/jYGgJiy01xt0vGQ2UlhZYzispxdP+FP0Ce1cxb7szFD7uUUFcXAqLbcIkwapdL16esqMam1D1H+fspTTDwxWM2Al/l8A7K4L+u+Lfyvb+52q2g1Pxf1uhQ/q2DKk7W71yaoLhHIuKXXbLVrRej/st0ZT26/+WrgFbRvujylOrcDPS0L58eXgsigDLdm93HiQ0ItPKbXl0TxnghzDC+jnfx6GFy+xr3xUe50dthYP20Ee8wMk0zjx5dICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 by PH3PPF6B7063D92.namprd11.prod.outlook.com (2603:10b6:518:1::d2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 10:42:13 +0000
Received: from MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494]) by MW4PR11MB6887.namprd11.prod.outlook.com
 ([fe80::91f5:637d:7c4a:6494%6]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 10:42:12 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Topic: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
Thread-Index: AQHdKj/nCFyvhVx+Gk2OYLa7AjJgkraaMu8AgAACgbA=
Date: Wed, 12 Aug 2026 10:42:12 +0000
Message-ID: <MW4PR11MB688720289D3B3CD86834A345E3DC2@MW4PR11MB6887.namprd11.prod.outlook.com>
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
 <0958cc7e77d3c1bc717aa88bf8d74bf04c498822@intel.com>
In-Reply-To: <0958cc7e77d3c1bc717aa88bf8d74bf04c498822@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6887:EE_|PH3PPF6B7063D92:EE_
x-ms-office365-filtering-correlation-id: 02d24fa9-80f2-4707-a4e4-08def85e5e5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|38070700021|56012099006|10067099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: layaH8fJSGCyapxgEsWQ3yCtkqI/pvbxDz/R8i6EfhB7aNMAOtWO9q+AhSRMJbfYweM5FfvDh6NmPam3rW4k2Zf+H74co8SWmQhpktFRtDbvV0wP0R1OxXKbtjBhGw22QPZwvGutHtsnyDrnimonzzrAf8WapzIYt56cKNB3PSR4wGcHXLYrkvQwMorFOxHGTBMf3U400PFByLUBqqiZNLfbFBW6z8yIBE2EONzJNYr2Mn9qqTSyhrsHKzbAN+Dti9J3Yo5KrkjKGnn+r343+xupa2luX6wYII1DNuzv5nOl6p4b8YhSHgiAK8Y64AnQQNU3t9UANHUu3zcy/hG0zzl69RsavbAq4SaQBBJ/VLSLhOdFWPwWYGMmyqK35vfG2uIlEj1jxwB1zC/WBF2v3jGrFaJgNbP+ZCAE71LslJXJCaVm1Uw3P3V9mOh+739HTKmwrEHTKGJMn0P66g6JTKrwnaR4+uC7y536Ld1YBD8cAk/G+4XY+dTvBz7/wEXNk1cevnxFMndIm46qL4MUisynGvYeJLWcRfdKrERFu8Lz4docvUpZod2d7bB7sEbte9vrpqUI4P2XG72gZauhbZtS/N94rJiKqGcr0ycEK00GpIfmTN/baJJTuaTozKEsd9PQdqxxoFWa7fBUJiy4OQ7RKlOrXHvq+HE4eryc3D0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6887.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(38070700021)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f7W3vGOrkf5JvxJbP8X2zL0csIctn41wDekDgYFB3xNp25eQ7rbq89SvQRse?=
 =?us-ascii?Q?Vkhib7+fEyuoSc8MXiBw6fFKJQXM8pJMRvvmqnYUd436V+a26HYXeURZWDYv?=
 =?us-ascii?Q?yLRP1sqX1dM1C5yDDuTA6x4LWxeeHrLawxkmMTKZav4WS1qAJ+hwcjZQQYv/?=
 =?us-ascii?Q?0N7psXrEbPEdq+kkmQk9RnQEeR/mgqACh9B8BXnVDVAGY7vLwOLAQAXpmSfe?=
 =?us-ascii?Q?Iv7mN3X6LtAGuoFvIzTBJXUQywfzRlbO0Aqt3SpNG2Kr7Ydq0DY87f+LzJXl?=
 =?us-ascii?Q?bZ1cLTbiNpob6128rvd4ZgIvJL0oH0L7cuUHaCZYGhVre34pH3j5w1pQ6Z2h?=
 =?us-ascii?Q?uxXTdfo4bSJXaWzy/7Ws73L1AjLoTIrCmFasAxqktpJd9jYInChQgz+78LXx?=
 =?us-ascii?Q?GWLTGa3xLZ0GwSbaUWDa7b8n+f3Pjb3MFjxwrbz+qMi9ARVF3WV47s9NZCa/?=
 =?us-ascii?Q?+VhZXsPXAhbPEce8cWC0tA5z70sWgRD3XNkBs/adGISyJcSo7fuCj9X88GZx?=
 =?us-ascii?Q?Ad83ilxClo4PLlgq5ts1D/C2swBj8jwC16ESVQBYcAfbfe1c2Ybkwg83nf8o?=
 =?us-ascii?Q?vgi1vTTnbWih0HmnDqKIzavdfd12zxfAoaSXRceswVtSh+/ldlVQq7lo9S2p?=
 =?us-ascii?Q?rXgczovhClZypj9zARa1VrPd+X4A+Nv96kc86dwQAXiPNzxxGZzoMjQ+YUC0?=
 =?us-ascii?Q?xN/+3VQWAwKOBawC66ZSct1iaRXubAkSbZPVHDYdXRc9sYHHh+jSUh/Yn7XW?=
 =?us-ascii?Q?gKkDi6fv9W4eE4W5U0bDr9EAlafyJ4Kad98in80TiNxyR29s5dK+5bNqd+UC?=
 =?us-ascii?Q?nKWF/PckzbAnbkXbVAN50sRQe7QqJQKXi+Xijgtkxn4kqIsUZZQgZg4hVSno?=
 =?us-ascii?Q?l40phQW0oUQWuEyjYhWWhH751Gd6NpwE8oVV5IxuNkBUBZHB2unSsFIm8gWD?=
 =?us-ascii?Q?ydQlQmQ5+4wSba0GGPT6MNzKfBkONx12EVrIwwIZS4Lk4LpnK01oZJCPjBpg?=
 =?us-ascii?Q?4cGCA3WJh8jEnWVSNL306wNN6RslKS9smFVaJl/UsOJ0NvbkPuBOr06GOqK3?=
 =?us-ascii?Q?LekUk9WKVhk7J+wnghCiVAX6AyOvyMzpPiqz/GcWba/kDnesaWxWy19Yihz1?=
 =?us-ascii?Q?vAAtLO2HYMeLRS/Ab5G2XFqbKULeYOhBwlTaShg63GdfsEhDBEZRfsNBfB+b?=
 =?us-ascii?Q?ebXDB+w530LNUFIC5WHhZWvZb46tgLoIRCti7QHttvfxE6FhVo8HnAnp3vuk?=
 =?us-ascii?Q?zAEQMJaJahRM2dHalpXlCaAhtDBnddb0hQw1LfFKajRc9DE2WjWRM+MXLhJn?=
 =?us-ascii?Q?sdO4ExSn5m6jukSLCrANLmZFHPppc8PgZxFIlWYawE/Nwj35I70EjR+fLX8m?=
 =?us-ascii?Q?QnTlMxsZ/r/YZetfvvb7YSdeiwyoT07/MlGBPc3zg1uGtJjtk6LOq6s62+H+?=
 =?us-ascii?Q?mLh3S6Akmtv7Xmh8LA8diveILljqP9n8/+CkbPdsJx4qadjPelP2He6kcW98?=
 =?us-ascii?Q?nW1LdUSp2dgYRskKMErACOSbfkJROfCVt9gPU4FM/F3Y5X5U9nij3v7T1MPE?=
 =?us-ascii?Q?3yugguHeEjKFgFLqaR6UotMKxYgigasfLav9/tB6kMFB/kGXa2e9FcaoLtdZ?=
 =?us-ascii?Q?sS5yxyQG0mAyq1vuy+0AYvjhpZRwPAvbgFJwlXcYxdGhyXZ0uXbyQMlxpctV?=
 =?us-ascii?Q?6WmblB5wW29BB/TU/yIGIbfd/gX00WRrajB4ar8BaZnWcPW6babPig9R9oEy?=
 =?us-ascii?Q?yl/iPMZzow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AFp/U+Mp61UKinha8guxupNiJ82F8FdN5RbyD49wIV+E4cKewcRjE6DhhOYJg+HDfx3FDEN32OC+2nu9Rg0Yp3QuqFGoZHzTbrTcE0opfqB7MLR4VaMsYcll8kRWpecfLdxAGWd5iP1J4vQGJsIONBSqZo1paz3D+fTniR32+sO/37KmcUNWLyJS7ppsbEIM3qOzTy9+U5OC4RR8Zrti5hwbEgqDlPFwfidV+KMG+BYpo9zJwhNUSh6ySWD6Z2u99IVama5zTS1cRrdghTIkOuI2xZ/fODHCfR4nzxJUcPs+JScB6Y6fb2OzJuklpT6+AgJ3iqt6TpTikdZP6J6v6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6887.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d24fa9-80f2-4707-a4e4-08def85e5e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 10:42:12.6635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r6degZbcqOXXv6Ef+HAA3ZdpvfZUATWTZuZqUqRj0sJUi40nmEJ9MjptrNHlwPNuhaBlBzFvIdxSKaL8AV/oyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6B7063D92
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
> Sent: Wednesday, August 12, 2026 3:47 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
> disable
>=20
> On Wed, 12 Aug 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
> > icl_plane_disable_sel_fetch_arm() wrote SEL_FETCH_PLANE_CTL =3D 0 only
> > when crtc_state->enable_psr2_sel_fetch was set.  If a plane was
> > disabled after selective fetch had been turned off, the guard fired
> > early and left the register's enable bit set in hardware.
>=20
> Why doesn't the selective fetch disable change the bit?
>=20
During disable path icl_plane_disable_sel_fetch_arm is called and here we h=
ave a condition :
if (!crtc_state->enable_psr2_sel_fetch)
                return;
	=09
So if the plane is disabled after selective fetch has already been turned o=
ff, this returns early and the enable bit is left set in hardware.

Turning selective fetch back on does not repair it: icl_plane_update_sel_fe=
tch_arm() only runs for planes that are in the update mask and visible. A p=
lane disabled during the off window is neither, so its stale bit is never r=
ewritten, it just becomes live again.

From logs: plane 1A after being disabled:
 plane 1 ddb (0 - 0) CTL=3D0x00000000 SURF=3D0x00000000 SURFLIVE=3D0x000000=
00
                      SEL_FETCH_PLANE_CTL=3D0x80000000

Thanks and Regards,
Nemesa

> > The bit is harmless until selective fetch is re-enabled.  When it is,
> > the hardware resumes fetching for the now-disabled plane and keeps its
> > old DDB range reserved.
> >
> > Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch configuration
> > into plane source files")
> > Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739
>=20
> Missing space after :.
>=20
> > Assisted-by: GitHub-Copilot:claude-opus-4.6
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index 07a683293352..afc1df1b84a4 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -885,7 +885,13 @@ static void icl_plane_disable_sel_fetch_arm(struct
> intel_dsb *dsb,
> >  	struct intel_display *display =3D to_intel_display(plane);
> >  	enum pipe pipe =3D plane->pipe;
> >
> > -	if (!crtc_state->enable_psr2_sel_fetch)
> > +	/*
> > +	 * Clear this whenever the hardware has selective fetch, not just whe=
n
> > +	 * the current state uses it. The plane may have been enabled with
> > +	 * selective fetch earlier and had its enable bit orphaned when the
> > +	 * feature was switched off.
> > +	 */
> > +	if (!HAS_PSR2_SEL_FETCH(display))
> >  		return;
> >
> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
> > plane->id), 0);
>=20
> --
> Jani Nikula, Intel
