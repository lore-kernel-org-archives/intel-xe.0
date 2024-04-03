Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA85CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 06:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199F410E38A;
	Wed,  3 Apr 2024 06:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuxwaVki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC0810E38A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 06:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712125356; x=1743661356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Se0AXDXLuIUs+yAQcjSYqKGgMcbBsKFsegA3YyinXI4=;
 b=SuxwaVkizFrwo1ddkTpgxPPNu5i5Zf5e7oQDw396bFf1tzzCDj6+hWH/
 LQPXmqnyiNi358Y+cvEX/CuUcJbT67QTz96kY2k0PA3zFAb1+tSDmycKn
 S4UEJsCsv7HMe/PHQBUyVNOs+ri8IMn9SKjo8DzEYg8FWZNh3t0CV+dlE
 Sg2skR1gHK0KTZ50aoWyV6WgtMdeRLIWMfHjqi3sEDAQoKLr0gZT82VK7
 goKx0dRED+fcfNM/g1OXwXRBncVZvZ18C0VqbQqBrePGo7v6zYfS19/iU
 4VBse6tLvPBhDrrf2leT5rEQ6Yx6HPlzEHLug0lEiLA9qVNL0Po6a6zTu Q==;
X-CSE-ConnectionGUID: fZatVp5+SAGyFU4xMVrvnw==
X-CSE-MsgGUID: r7e4Z9B6TLOEjAJnVpbIHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="17911051"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="17911051"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 23:22:35 -0700
X-CSE-ConnectionGUID: D7wMM/5cSEq6Xb372fHprg==
X-CSE-MsgGUID: QWwfZbLkSsWLBRW36uGeOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18221850"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 23:22:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 23:22:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 23:22:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 23:22:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 23:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSj8sdbQum6URWuRNZQrcB7PIyvUpXyGerTP0ovWRPDTegv6JHat4/Ikr2Z3vqiTakaZiFpVhxTeTbov8q6Al/aZlwl5TLHkKwqHoRVvgt49nU75nlRw49QaY8RUteVbsv7QHwSNk5pSv2u7C2bm6Flvkv0bKz2PqYvxbs2T/J5J1E4CImRrDY/f/+QIWkxG4y8C1hgP4Fh/+OS4It5xULatX4FpTkP0dslHJDrKElSbCbCTyrPzR6r/bC8+ysEpszqSrvf5FF5i6AoCGDPCYl+ueu6RS0e49Nbzv7W6rMvftFFEqGDRtbyUqQLfrqq/Bo2gmwxrNU2ZBO836yT+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHgF8bRjoS4s7ZC/CvPb/MLhz+XenmC8l4i1rO8A5io=;
 b=dq5cFhkyh8Ds+hmiM7JmIriItKpm6B0EzlcUpTCiECYgIwdq6BwIjHFe2naoVE4UVPfkn1jkVG3fL/8fQClsG+Jy8DK3AxS6AzJ3SxPtYuqNjAQENRbHOqRNZnrPihLGKM53F9QdjjbTWMbKycJl47Oam0fOvv2n/odLmjF2zB8zU6F6MTEaqiaKY6fV+dvTuXQckwHAwK4RMNhqIE8Nklj7fNdOdZFcmYKhwP/WR+Tow2/AO+cjtXKSf4qaq0yEbXnYlJQF6os6VihP0n2EnXqdcONt3kmYxuAD/kjJJU5SGB0UH36K6sC78BCqojTWT91YjJHxPhfYk3FC/roZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 06:22:31 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::62c7:9385:7a06:188a]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::62c7:9385:7a06:188a%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 06:22:31 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/xe2: Add workaround 18034896535
Thread-Topic: [PATCH] drm/xe/xe2: Add workaround 18034896535
Thread-Index: AQHahMSdQz9okQCAnkqU5wZgpJeNXrFVVrCAgACw1NA=
Date: Wed, 3 Apr 2024 06:22:31 +0000
Message-ID: <DM4PR11MB5293C1345F7F6B2BD014B91B9D3D2@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
 <20240402190105.GD6571@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240402190105.GD6571@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|CO1PR11MB5026:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xibJxOUbxfpvH7R9D3TVBTpdpvRkTfUm9R31TNt/DAFcu0Fv4C9tILQ6lGsVhAVuHd5x/uGqXBDAYXU1iIOTdIm5VS9GlRaUJOFZmyW7IOn2GmRBg9vhRNWlmhUVHfMljwGXzmnEp5BNoAt0KGhZSK3MVaNNGm3Jd0DBAaWaHHIqp6lPiB9LG5Ss+WjnK9fKIWvIihfUxNWMonr1VaDS3irz07aQIr90OZlpT2pL/jdUiLJaxhytpr1yS/K6TQFePEHCb+5Eke996QyGZppIxDgxYl0QXT2TrGjU0TMnz/QjNK1PPLgwJl9PWyGBL8L9SS/t3Zk5YjYj0tPEclZtl95ootvOyyKpPcBuxupX9we6Lz/IQrON+3d+vNxynqLdagqE40K+4i4rQz/6XxK0FOhJFOLViTI7hdkF7YBzzhDwFdW3N0wDJsUuhns/5DsEmQaU4yiDN7DgD/At7UC7seysD0e03K/gu4N1/7ehZeMDUjvliGUutsjpQ/OyBUV81rFY/v2dVhCVBdQv46k9H87XsZdTRSgq6Y8vYzEV8rAuqUdqUHWW7+fZCIbKnFGu9AgDNPT48nu9eRw/wl4R2A0pyh4Yk2crQkbFTM/yDrP6GAJE9eGH9kwprJuMfX3IZEbMLwfrzV1UDC4OrJdCaaWpQ/Al/S1CnW3TC4EQGA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jCyRXntRg+d3tUIbeXBHt7TmjFEfdysYpRQugqg+BtcAsHVFiAtzfABZATzC?=
 =?us-ascii?Q?0X+ktnbZUVoGi8dRdW+gjLzq9PuH3IOq1Dx4+00nLcz3A8uCDZH7tYuu6hQT?=
 =?us-ascii?Q?s6BsaAEz3vNzflPublfMK1AqE2bCYsLfZmBHbmoaiZ4GBrxjMpRwnpDTcZZC?=
 =?us-ascii?Q?xg1nvExoop9uzXF/+MEeofAI9wXHWQQnrCUVn5l+JDNZVK9b1G5zGKKLJ9Br?=
 =?us-ascii?Q?Jr41PrGhYKD+x80znL3UpbLlsgvou3vMeWf3hWQfvuYiEKh1+/fpY1c7E1EF?=
 =?us-ascii?Q?9vj8RkA9Q0tQJqRhWSf/69AXQmF2taiNKfnVsczA85dort2IkLTEUkHfVdnX?=
 =?us-ascii?Q?0nUnn9PDDCW2jS/plmqKVaQHZXHADUBw9O9aDsIlSXLPHqBFdwCuvzbYBV8j?=
 =?us-ascii?Q?/aJxM57efoApK+42YLocEy+DTFp7Ittm0J6nT2kTeaRKpCO9q/VqbIQc5PxS?=
 =?us-ascii?Q?kkzxgijn3tcUw2geCgYRatu/lLxjb2dOZGexaT5IAl5dKbiBy9kB6qttowha?=
 =?us-ascii?Q?ayT9lxHtj/gRc1n+eTk0STkD3hEY+WRuOmmzlAw/YWbZpscQuI8xKReDT2B8?=
 =?us-ascii?Q?JWr224xNf+FzEdS5rE0xZefdK9+6kV27rk7YvZqR3T3+aG2JR/GYjr3zP8we?=
 =?us-ascii?Q?O1YITIWngA/LruugqjFHihEQ5VS1Z4Wr3SzlWEEAhcn/u6mIG2FQIHCXq+zS?=
 =?us-ascii?Q?DZFjwcuCCBZaSSVS8N21/QW5mKhtHbwS/jQ0pm6baGLuPXIpWg8rvKLow0NG?=
 =?us-ascii?Q?ZPZHz7ayG/piC/gZCG94gMCRj9ROwbnbSKWofuTmY4YF1fVASoDb71MsfuE0?=
 =?us-ascii?Q?BKNsifQgb6weMtrIk1K0PbYGlPPh2YRHzfTmIvKW1Tq7kH7J1bkI3Zf8EzKL?=
 =?us-ascii?Q?qTMi5Iki4XPvIPiViZN4/TwriRsaoPzAZ09R+zd3RWhf1f3Pt4LVRfmOYGqK?=
 =?us-ascii?Q?fcdEpDqQtVJ613XnsvA7fjr2JMuWisIO/kv7XP8YuFr1OJEuTq74DXPkRZiy?=
 =?us-ascii?Q?p7ri2tiRPt7tN52repgeY14uabAKFvbBETyOtohRtEHi1ZPBzcEhURx4xiet?=
 =?us-ascii?Q?6phmIh867u3J8HaCzbnD0WDK0i8G6VIFKJ2zhatfcQbAC+dVXCXNm4ia7rel?=
 =?us-ascii?Q?jhryD4yU3ye3wOVURbU7/LUCH0ujFkX4hLcriwfjXJRLbVo67L2hT33RG36N?=
 =?us-ascii?Q?x9Sbq3QtMBFWFrw65NJ2lupcPiB0o6a0xAh1/rKuD+itorA4n56Fj9wEGWp/?=
 =?us-ascii?Q?d4ALFbhMpL0ELzFtlPQD5VlSJi2Q8TkrfurjflicNfc1k5Fqn0jNoWnFS3IZ?=
 =?us-ascii?Q?/ygcsUNTRuZXNoX6sWgLiqCcnWFY+1uAi9Q07RlCjrqx3x+FBVI6eLjDr/pT?=
 =?us-ascii?Q?mz4UUEmuHrAL7M4VAYasBpYivj+eIdxEJDYeu00a6xAAurUAsPXf4bLuhDjP?=
 =?us-ascii?Q?k+ETxvDQdyqeQAWLBttyGMP4jSdja9kJglwZzfV5iaY9ZWCuarhxNfmU4Wut?=
 =?us-ascii?Q?IwMr/+LdP8aBOx6ewPUI6WdEMNZFddM6SOHJUgYPnX8bsDybAzL1vxIPm4QE?=
 =?us-ascii?Q?wndRCtpngUFEA3CkLrZBCpwSrFDp3e31m3tF1RMg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac901b5-9723-4dc2-0324-08dc53a671b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 06:22:31.7240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTmaAPsjyySpWggo4cbrcG+bNmkVNi8xIUibXZObvA5WYUbn2ENaYzmJr1JgSiIEldhIfy9LHhqY0Q39wvobpjyN+1TR1MeKIGvVpE88kO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, April 3, 2024 12:31 AM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: Re: [PATCH] drm/xe/xe2: Add workaround 18034896535
>=20
> On Tue, Apr 02, 2024 at 11:41:29AM +0530, Bommu Krishnaiah wrote:
> > Add 18034896535 as driver permanent workarounds.
> > Also reverting temporary workaround 16021540221.
>=20
> Why are we reverting 16021540221?  It's still listed in the workaround da=
tabase
> and I don't think we're at the point where we want to remove preproductio=
n-
> only workarounds (in fact I don't think we even know yet exactly which
> steppings are considered preproduction).
>=20
> Even when multiple independent workarounds happen to have the same
> implementation, we still implement them all in the driver.  The independe=
nt
> workarounds may extend to future steppings and/or platforms in different =
ways
> and need separate handling.
>=20

My understanding is 16021540221 is setting the workaround for A0, with curr=
ent  workaround(18034896535) set for all, so keeping 16021540221 is redunda=
nt, so I removed it.

In order to keep workaround number(16021540221) should we need old code ?=20

Regards,
Krishna.

> workaround=20
> Matt
>=20
> >
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 74b33a3845f2..4d8e0d64cf42 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5,
> DISABLE_SAMPLE_G_PERFORMANCE))
> >  	},
> > -	{ XE_RTP_NAME("16021540221"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> > +	{ XE_RTP_NAME("18034896535"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> >  	},
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
