Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0070C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 05:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407DE10F99D;
	Tue, 15 Sep 2026 05:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDan+bOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168710F99D;
 Tue, 15 Sep 2026 05:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789450863; x=1820986863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f6r8fFD2pJYxUIhATEcJGmvVSKmmvhYoawvG+egCNw8=;
 b=XDan+bOcRkFpVqKv8g2I+Ce2LFJO8Rq4o6huybYjHhiMLzr8tVzAgHbe
 gHmGhB3YQRleybx+0ZThUBBTSz8PE/63FqcH8qWGUIfDdUI8jisaUkTJ0
 KuCGCmlCcUmmx/K49hhe1Mils8ci09gms9rbIkIbebg6ppNNm1W7TlT6S
 5pv9wIvTV15xkbASOxkWl+N7r2ZBj4Jb6QmUKiTMKvkRSW4Vx6WsQjclc
 N8ZkxEpU8j2l5xgVrhPibI5CtkjWMkEVEK8jiDshyczKJ+Fm0q1MUZ4FA
 Wp70tfZp3zJOqcitrloKIOGviMU3wbdxUuNs1Bph5uF9Lju+sDHCCTqym Q==;
X-CSE-ConnectionGUID: Cw2d4daFQ9OTSTLMN+FenQ==
X-CSE-MsgGUID: cHDfRTP3T16zWEeNZsKT0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101155370"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101155370"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:41:03 -0700
X-CSE-ConnectionGUID: DTYKPHpDS4KMYXKYkuH+WQ==
X-CSE-MsgGUID: oEizeVOSSGGCD1Ag72Q2SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269574868"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:41:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:41:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:41:02 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTQicjyqHf6idDLqmpguPEr4eXxAbdY5kBnN2IsA2JKX1iihsDSJfrTlKISUwK7Nc+h1f1695HPPWB/5ttxFLSdGtWwL2bsaJIhSXLxTtEXrNbeeu48VrDWLj6zw/BvbbVRMASxooOUPMxf3XmFT1pyVjRdWC5LryyKF/Ptu8C1uV6IOYJ5+ilooDR6RB5HspcKPhhBZVwZECpinSEaGHXcw/8414o7HCFwoC4jLullXu2f0h+Y5yn1/a/iepNKiZjaIPHuIVEDL9kkScRBoSexri3gvPaaOoUrQE/MIXl8R6y7kanUQIp556cP45hGOA6f6RfM/Cq7GOyDVhuzHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huGUMZQJsLE5Ysyv+GL97ge0eNnGtzfQpWbAE91eCc8=;
 b=vLs7+ylQMEcXSCZJFWqMWYwGnSw0UWWzeFIPVRwVeYw/0/NBR4c2S6zkquSXtv9UIkOmIp7QwUIyMADe7wRLJXiTqE2Z610Cpe+TFySISkCrrPwzb0P8eVLoAX8oEv7H05P6U9jW0QS9SBGCsW4it+xgYGxApAOR/4q4eKAeDDis6hfzNQ7T7Oz931iXsfH3CemSzsL1sU+QQd9rOTle6VbemL2nKauW1bkHHUS3hgslHAI/L3AvzI1FgR5HsAjYvMCCaf1+KE+wHhIKfhfxRSM7/D+q9EM2po1nzGFQPfUItitcHFNM/hLUEde90ygoJF3LUk9n/gD5rkWviMUfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:40:59 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 05:40:59 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v1] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdNsvGSZRRVPFRI0mXYOec3HZDkra+IUGAgBERPJA=
Date: Tue, 15 Sep 2026 05:40:59 +0000
Message-ID: <IA1PR11MB63483C7E60F0DE698C5D6E65B2BA2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
 <b9fa5fcc600b2a9b669d8e643d47dbb3a62c6036@intel.com>
In-Reply-To: <b9fa5fcc600b2a9b669d8e643d47dbb3a62c6036@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: c0c2647d-fca8-4f47-cfc2-08df12ebebb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: XLp6DlyfXWWeqGQPCi3lBduq7sx4xKB8pd9GTHVU/db9eciBpzcCCU1KYM5amUZNsN2mRC9vSU1JUUVLVD03Pq9/J6Mty+lQ42qV8uNDqwoLzgyrdNImG83dRy+RxGP2UsrZ+pOjTg4JDxY967Pgv6SEix8/xxGMl03lOsUEgcGzaXpnf268dQIR3+WBvRkCyoolk2uIf8vgKNT/CZcSjSxyQgURJuTE1oXPCIxeCkWmH6Q9vEnFTmFsV632iNeZEDTHnHkjjEhn4ezS1akSwA84fp9wDKRysjmvutCZL7XQRXz9SsmWDGlVTAvKUzjk3HUjg7AED6EpFGysu2GopN3lq9GKJBRh6sId5V45BmL/0Ga+jgALaioBFTN3tmWV93EDctbt5Ypov+Vp7XOQVOe91Yu7Z4Q4Gmg0/kcT3GSZqOAAHMOnjLj3OXgvWV68BmzOaYkK62nNgQqX986E+lPE0mTGIKS9lPstUdeiIa8IZEBGm0voylllak+nop1sVyV7P+OxEE119YndfJ3BKMOJp7+DGy0bdVMv3vgvUZDDiitfAj99TsOlfzR3B1e/XoSlgwos88uOcpCbj4DFNrq4kdYITHFiOevNOuyQUIC698nMeqYylnJ1ymNYvu+eu4gECR5ZXX7K7a8CDK4Can0gf3PIQLtvSJScMDUAsWbTpHooykfHxL7yynKnf+99e5Gce9+f5cuVG23fue42EB16rgIjw6JOchfRyqP88ps=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XnKctUdGxzUKiv4hKsgPjKRncZmdoEfwJgJ8XEHoEU2Yl0s/gSTfPdTlK8EF?=
 =?us-ascii?Q?Npl8BIb6mOBf0hmEwQIaSeslORwYm/l1gykUn2erkFh3NZba+2Osa89PfW02?=
 =?us-ascii?Q?7GStfabpjDlB0lFLYgl+/RUU4/p/qjbKMVoGunjWHdiPfZxrAc+zh+jqL+V9?=
 =?us-ascii?Q?UKti68nQmGjhogIaDlRuHGiwU66SRSWLqmmeWDeVbqg8ZGyETvhcx2VeYtoQ?=
 =?us-ascii?Q?H78xq4UPODK1tN08pHy6bwaZMLBV3NdEdUZVnbHsUz7HVwAsRajooqDdFzNn?=
 =?us-ascii?Q?zsDCvxms1WXh9E0Prk2WIrGiavyDyNXUK6jmluD3GWHwKp0Cs+MfPKD3Toeq?=
 =?us-ascii?Q?mg6FjiHEVKnshuiTMbsEj3nA6+s1sDDXZTgeKnnFGqHLvLA1Au9lndRGrEA2?=
 =?us-ascii?Q?Uiy6dIQAubGhq+uIeh9lLOjdmdN3SQoVTCcnvLMolNU3D6C0XXNbdGX5qjcS?=
 =?us-ascii?Q?kDmxwmMDGW+pfr/AuPaXPdCSubBhtAFwCcFGi4Jj6aRFA8sFbiNZ+K+5xJIU?=
 =?us-ascii?Q?S+DD0TwUQCFSQJICYIqoD3HIM3odhnGmSGrAT2bOFNYCATXsC3E/EKzeOvxt?=
 =?us-ascii?Q?p1xfTsMFvfc+z/6i9La5kqBwstV42gX6XYjy9314pnpxl40aLpc/itBuZ9zB?=
 =?us-ascii?Q?TjplC6bgsdzHKX+aohRf0uJwkMK/VEekr/ab70EkmghJ6ocm/v8QDBZGLbCz?=
 =?us-ascii?Q?ggHsaaN/xL91LS7JuJfrVoDfwrkjlCodTBUr3Fa9ZbpraBYvaDizC3lTXAB9?=
 =?us-ascii?Q?5y1DZcWQFJQtGNzuh1UQgeGdjZgVZmctfNGRi5jqvco6K2PCHKbrfSjP0YrU?=
 =?us-ascii?Q?W1oO+M5ypSmuVBBynE46lYdo/VZj32/Q6x6H54C/UOkXalfZqdTogFOHx+y7?=
 =?us-ascii?Q?Flt+U2mkyFWPNVUUUYdkZ0Aghq+U62uD+C4Cx395rNvSqNayLufSpwtQIUkS?=
 =?us-ascii?Q?Kjuxsn8/NYHevgLAP5u1hHWt7knS98xmdEP1ikCXNhlIh+PjW+SCvH5pavf4?=
 =?us-ascii?Q?0fqyRxbD8Gjkv04wTmRslhz/QF64Ti8TiuWVLACpcV+YJOdM7V1ijWW0/OWO?=
 =?us-ascii?Q?zJdxD5x8z9CGkP0fUp2vUVO0O52uB6DJ2wIdDzOs+tQlHRqpiNMeM0vy0Hp8?=
 =?us-ascii?Q?BpXyi0/ul82k3sNWiSq3jdTasUt20fSawcOOXjRiXWZm9Rl4J5ptHEKYjwHP?=
 =?us-ascii?Q?A47Pg4DJ3tQ4Sf4H/RFwCckVOWOzGjyeSai4cITRyp2elb4wsGHDjft63Eba?=
 =?us-ascii?Q?kf+L4h2QmoVSB/tVwbGJtca0X9gveMs0GzxeKWQY379Ai+yMwi6kfrccIsh+?=
 =?us-ascii?Q?MXaUJXKMbVl0IzeqxWB8XSq3cBk7WymFAvx5uEs0RmVEnvvJZj1RdvgAmU5d?=
 =?us-ascii?Q?aOJ7Mdwl8THzcTevD6pGae0ayUx6UudlTMMQwm1s0az+ozz9Ool9ZjQVvYbb?=
 =?us-ascii?Q?XWgg1rmYHCukALjiW+kG85acYcfRfkHqrd6lTR0XHKUnqJNm4Hhhhxvn5rZ/?=
 =?us-ascii?Q?Cw/UBVpv3fjaK/CAFSXyjmsRCEJwf8NrS8+eqONfX3IKVoQbH2KzSr2eGWoy?=
 =?us-ascii?Q?e0BKc9OM7C5Ijqoc77/ZjnyIObSTIkpCXHvNX8F8Msf7BAh6JDMdqc4JkAfq?=
 =?us-ascii?Q?9pLNzvZ7BP+WJLj6rnL4LcQasHoDZeSGx0J0QHgeCKZyzAkHCSbh9sE/q2fZ?=
 =?us-ascii?Q?oOeXh+hrrVnoQcDzmhITgPawvuRAGqE261L7JeTKGJwom3as6nuaJvq90vo7?=
 =?us-ascii?Q?u8cO3/Elirnl3ru0vzzLH86wUD3kkQo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xtFSJOBqoD7dAqjOFgZGSE4jA9JuxbFM+OOVu73QqQahffDUC8/Y13Uo0knBxfU91N/WmAcleEp/8zOHamUUb8atXm2ci9zniEuIG1PcA/1ZD0BJMtoIRDGSeiHz4fTix/WsUdlHwvHTIX2mGd9Z0JU7lSxWFiFSwnXZ74akchWrUlyOKWxQ5iNiNCxDvqog1qRDNGljZU84v5nUcYmPcYogdONIRL4qxQ+uz1YY49r5/HUIXXdj334hsZEuwGg867FVGOt9VnmZOQlrtGN1KZzKV1omyluihqWpqrIvyLqRXuV7oG2IWWoEi5QDb8mMY2iBnROG2ID7KsmxqKFnag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c2647d-fca8-4f47-cfc2-08df12ebebb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:40:59.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+QBcMXvUSi/9zH+gBkX237+eun5o8xxEIwHfrf4iYp+Ev+gAd5bxaWnIxMY0xANyb2heJlZWsPol8Wq6oi+yzdbraLyMczfK2kqQvHtTvG5+VgamDqtEA0VVp7Yo8fx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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
> Sent: 04 September 2026 13:59
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH v1] drm/i915/display: Add command line param for DC
> balance
>=20
> On Fri, 28 Aug 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> wrote:
> > Add a new module parameter 'enable_dc_balance' to allow enabling or
> > disabling the VRR DC balance feature at runtime. The DC balance
> > computation in intel_vrr_dc_balance_compute_config() now honours this
> > parameter, so the feature can be toggled without recompiling.
>=20
> Why? Everything in the commit message above is obvious, and can be trivia=
lly
> deduced from the code changes, but I'm none the wiser why this change is
> needed.
>=20
> Also, what's the specific need for this to be a module parameter? No new
> module parameters should be added without strong justification. Could thi=
s
> be a debugfs knob instead?
>=20
> Module parameters are, as the name suggests, per module, not per device.
>=20
>=20
> BR,
> Jani.

Hello Jani,
=20
We have observed timing-related issues with DC balance on some panel/TCON
combinations and are working with the DMC firmware team on a fix. We are al=
so=20
identifying affected TCONs for appropriate quirks.
=20
Until this analysis is complete, we want to keep DC balance disabled by def=
ault to=20
preserve existing VRR behavior. The module parameter provides a boot-time o=
pt-in=20
for configurations where it is needed.
=20
I believe a module parameter is preferable to debugfs since this decision m=
ay need=20
to be made from the initial display configuration rather than as a runtime =
debug control.

Thanks,
Mitul
>=20
> >
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
> > drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
> >  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
> >  3 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
> > b/drivers/gpu/drm/i915/display/intel_display_params.c
> > index 2aed110c5b09..ed3aa84c5d43 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> > @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr,
> int, 0400,
> >  	"(0=3Ddisabled, 1=3Denable up to PSR1, 2=3Denable up to PSR2) "
> >  	"Default: -1 (use per-chip default)");
> >
> > +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
> > +	"Enable DC Balance (0=3Ddisabled, 1=3Denable). Default: 1 (use per-ch=
ip
> > +default)");
> > +
> >  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
> >  	"Enable Panel Replay (0=3Ddisabled, 1=3Denabled). Default: -1 (use
> > per-chip default)");
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
> > b/drivers/gpu/drm/i915/display/intel_display_params.h
> > index b95ecf728daa..8c28c27e2c46 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -46,6 +46,7 @@ struct drm_printer;
> >  	param(bool, enable_dp_mst, true, 0600) \
> >  	param(int, enable_fbc, -1, 0600) \
> >  	param(int, enable_psr, -1, 0600) \
> > +	param(int, enable_dc_balance, false, 0600) \
> >  	param(int, enable_panel_replay, -1, 0600) \
> >  	param(bool, psr_safest_params, false, 0400) \
> >  	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
> > a/drivers/gpu/drm/i915/display/intel_vrr.c
> > b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index e36db1174440..1698c54e258b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const
> > struct intel_crtc_state *crtc_st  static void
> > intel_vrr_dc_balance_compute_config(struct intel_crtc_state
> > *crtc_state)  {
> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> >  	int guardband_usec, adjustment_usec;
> >  	struct drm_display_mode *adjusted_mode =3D
> > &crtc_state->hw.adjusted_mode;
> >
> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
> >vrr.enable)
> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> > +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
> >  		return;
> >
> >  	crtc_state->vrr.dc_balance.vmax =3D crtc_state->vrr.vmax;
>=20
> --
> Jani Nikula, Intel
