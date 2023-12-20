Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B188DC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 04:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6996D10E02E;
	Wed, 20 Dec 2023 04:57:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC7A10E02E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 04:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703048243; x=1734584243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=haC/my1UUByp1sjahsMM+RsL2kqAodUHi/+VHxjA/KI=;
 b=NF2ZbwVQ7k2JBt/Ll8rZ5NPAhdQ2tF+Gg1gubeNXJv590GsNslPK4Xi7
 lbGYIR9MOQlxZZW9VI/vc1sXCIZkZRTrO368IISfQ/gvcnL+9E1HSdyEU
 AZK+7oE7SeKzsI3UsO83e5xArHFzYcfAfZbTkXBZb31XC8DlWxl09ygQF
 B3nAw3IBwB2R7e/4vrHwJ1Rzlq+5FfXGHV2SIYPxLL/zXMzxQ1dBzNJcZ
 o/gIFhQkr5p6rSwCFwddHSxiSXfkBg0EhpqHbfiqyw7o1RRlhZz2Da609
 TJyMVPbLly2mv3cADT4GtEzBYk/HNvAWeADvH3qZkVZVu/7l5+BuENYdu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="481951913"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="481951913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 20:57:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="17826073"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 20:57:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:57:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:57:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 20:57:21 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 20:57:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE+xqnsxqN5820QPVD3dy7rdG7dRc8wPwK6udTSyK+OC/QvntHIDV3PX6JQABRwVN3Gkrf/kYrksm/YdHYc/9S8PHJVw8Qd+A3HDk/MCKIc/XV9fLJTEEDPVZx5Tb7XqjcnBK6nbeWCjQYBm6PFpN0CG23P6SjAUrZtOpC0cjgc/gyJ+qL5Vhif1fZZhCmZc+5z0o2YwoSsA9EHPQNv7dfXI9/PT0U3oMtuXaN3oOc1VJr8G/Kv1x9vriLah8KlUNZwpLDgzdvecgXNRGlqHRQxbEnCjU3s/znt4OF/hkoo0siGk7yb5WbnjXiLguKCZVNob2TTdsmIKT7Sk5QKi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI3V7U1xiStMQxLk+dlSntw1mDheHZOnTBy2RiG42e8=;
 b=bMGoB+rizxtx2LLl/r/05MX9wfTcTa/nWvEYz1pI7n9phHHxD8UOauMb0qx2+DQgxmieTC7cUTzCJNcZEgqnWMKUAHFvWCH4JWsuZ2l7DaWztSsI9WHFgGVKycQeSdYzY5c6O4iCpso/Y650mYh9yhMJtWvfvtbHujBkwOATpEB6SdYsNpR80Q5ovKzJS1ZL4YIBNioZzsEAcCzTB2JYz2GYT2Huw0i3OocqjQmd+T+U3aLx/P8oKPauK/LTu8ZvDnhnNd2QttTYZcH/+0n6+3pEwPq2MFBwoTBSNX0araS6AkrGJ8K82IdXGNJZsQE4r5mtI2aTvwsoqS2S6f/+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Wed, 20 Dec 2023 04:57:19 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 04:57:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xelpg: Extend Wa_14019877138 for Graphics 12.7
Thread-Topic: [PATCH] drm/xe/xelpg: Extend Wa_14019877138 for Graphics 12.7
Thread-Index: AQHaMkeNtxzTGqmoLEKHOa7qNesbGLCwy4+AgADRnhA=
Date: Wed, 20 Dec 2023 04:57:18 +0000
Message-ID: <DS7PR11MB619775E82494E006C68584058196A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20231219070018.8931-1-tejas.upadhyay@intel.com>
 <20231219162603.GF1327160@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20231219162603.GF1327160@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|LV8PR11MB8724:EE_
x-ms-office365-filtering-correlation-id: 6384e4a3-19d0-45c6-0ea3-08dc011824ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kfilJQuyWUnPh88hZCA1YnZhTNwjV1ddHaygIaM198+LC+k+YByHLA1gharOer23Gh2QLv4ie1hPeRzM+TQPoaFhE+cMAEK3i3OtMAOu+iHAe4r7v3zch2eQ3mF56AohdxB6GeQIh9N/7bcO23V2FoA7WiuJOprDu4GcL8q2iq6vvglnhrpRLEtmrfWhgeoNfyibLzRafyxUhC5EVyHg6+DVp71vqVpVQdw2A0hKf+bNm5kFzZC60aQ8BfqAPw6Sx8kBawHynncm8G4M2EgY7E5ru/W+Py6ZEBVY4EALZFV/9vwkTuT4FQ9BVoO7ZP/w+tWlJ9v1QLVixXe0J1rSp4mX5dQZNlF3xykqXWBYmir3DR2MDlupwYDIRcixxkKI5ZMHvJkMaIt6x9MCmsfydW7D0Uxdpmd6YBxHBKlVJOoCkanTQJa8+KxDZb7hu/q/mAt94jj0wyGJPszlEiV7ZiFKHYQeAeZk3XklkOyJIDxx5NuqtNdY3FhmNyG62qvLnDGeb4Gnp7vnjhIYpAs7/tv5NDBvJa+VjsfCOZZyK7wF1G8WeXX8cFMHAjIDzJx6JfJsBzp0OQmBWtuJYnu4PuxFDtqP4tF36zElyxto55ZDs2h3DCfKu5wQ3K5AUoIY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(122000001)(38100700002)(71200400001)(83380400001)(86362001)(55016003)(33656002)(38070700009)(82960400001)(9686003)(7696005)(6506007)(478600001)(316002)(66556008)(66946007)(66476007)(66446008)(64756008)(76116006)(6636002)(6862004)(4326008)(8936002)(8676002)(52536014)(5660300002)(2906002)(53546011)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wnQw/xOJF0BHAHnPhGa/lZcWbD4KkKXn+M6oLumpblz5fX5SzpO9KAP4l12O?=
 =?us-ascii?Q?lFvzFL5uj/JKfTk3EF7POtIlL/jyzNezZpX9Jpv7UMehnz7E+q0gR1/rRN5a?=
 =?us-ascii?Q?W1PVZhPWIsbpy6cZoEl68t+4MwB0hDt0YcQyxaRZ+Y+gIROF4ygMNBCJh54J?=
 =?us-ascii?Q?Mv3Pbq8KabkdmEPSQZ+MMGPfAazTZJQvluYxs14VSYEagZ05G7JRrdUale60?=
 =?us-ascii?Q?q4fNQeGV+hvnD2WW2RIFKg3erC/6SfNrJhE7Y/RMRrpLnE7Ov353GKYGc2dV?=
 =?us-ascii?Q?/Btf2kAaQl1Cwww1L0QdQ9g17UB7V5YGuqzQDbxWl8bLx/D+fNyqkGRqm29u?=
 =?us-ascii?Q?gBq+988HkihWB3Fa4Wv/eDBK+3bUA47J0qshD6/sPvYEhPWbwFeHPun0UanU?=
 =?us-ascii?Q?hIgo2xHB/cPcdstuTsaMhKFnhFiLqAyLMWwwa6jsARld6D3dzrN9c5pw4O4n?=
 =?us-ascii?Q?Bn4acPs/sIWL/rGHcipQ6W85QIXcEJcRkSHoxyRUgj/xQw/0SRxNraSkZzMI?=
 =?us-ascii?Q?hp8q2IDoBhpi3W6ib4aRcpuZUIeIVnW0wTGGc525GlNGoTa6yQmlsCL6xRUx?=
 =?us-ascii?Q?suc2IFbNyeXuR0SN0QTQ1oVITWlJvhY6FYO2o+rksTBDH4+dcy9xTh8Q8xb2?=
 =?us-ascii?Q?BA2GLrD6UPmNQx40MP+u74KzFa1dKEJLhsU+kffvsZpJRsVNKDxZsSztizPK?=
 =?us-ascii?Q?HJGVYsfHFymHvV3eHL1xItdboCohFr78F70f0XzFu/Bl7Gw8pPexifdWf146?=
 =?us-ascii?Q?7TMAyn1eIz54Sabvq9F6UegUhTKZufUxYF/tdnye53obWUZw3yWYmmB8cAWR?=
 =?us-ascii?Q?0Yh7PCP9Yg/O+lDDN4+drOtkogkOC4KARZxwxp8/De9IMyyMC4uxIaIv0Wvu?=
 =?us-ascii?Q?elnjDk92/1ezi9T81R9206NUFYGEkQ6rM5v2KPrho+iUcbnfvBUrsHgYK0fl?=
 =?us-ascii?Q?54HjvzvlmLPdTgU2E61/dXaV4ij4h66aW1sDuBfXtS7pW2X1+DMnCQrlW7aj?=
 =?us-ascii?Q?NEnclzbRMDNDDbTWpzcIwncS7+69KlTKUiX1g/+22gT6Qh6JX3RRYoAtvyPV?=
 =?us-ascii?Q?XCLYVJIzcHSMn1bl1ALL6PDtfMoCRA5tXd2G9nHfAd2Mj9Jl2+5NQpQ61iMM?=
 =?us-ascii?Q?W6skRDI8vBTNOIRRZSR0bMBw3Y3CxEP/6TYNXG9uMcqM2nzvtxVlbDElT5Nk?=
 =?us-ascii?Q?8PWYwUbXRrYD/GBXbvNeSupk4gNzbjMtOHkrLf3E+F4uyA9eHl6RYH07HUgG?=
 =?us-ascii?Q?Zv66s1sXmHEMOzXfKbm88TyY5m6HwpXGzJ+EcD/zxiK0twBYIMlVe7gN5q5I?=
 =?us-ascii?Q?6E8wVW3BEzziNyZWnPPHvci6oG/1bTIdvHoMHiel/Bv2uA6w7ylgMLYG6idn?=
 =?us-ascii?Q?x6ckgjkFL/HVTZx4Qc1TyJ6EhEMb6l4GOhWKShLpJrc+49t59WBkdlP9xNID?=
 =?us-ascii?Q?w4xHikO0BD5XPxxMnB7lw25Ac6SAuvJYj6ojCu+wdMUfKtoX8X7niiPwmwme?=
 =?us-ascii?Q?V3u2KpZm9kkb68VULVCUrJgHeRE/EvPsM4neWVG0TZvch3O5A6c918nEDe0E?=
 =?us-ascii?Q?mVl3ageaHMv9i88zsOtB3t6htXP+E4nvC+yZwmuE5BRPfBobcREFAEcYNAYF?=
 =?us-ascii?Q?xRvFChcUCE89/P5OI2vAe9E3c1EyWx830mtyTsZuei2v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6384e4a3-19d0-45c6-0ea3-08dc011824ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 04:57:18.5513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X16Z8lny6N+sEKX7v5GqJjug6+4njXK4Or5cqWa8BDuMP4f/C6uK96IBkQODMDg/fGoghMY+QQi8Ib0n2ylXKqNdU5hu4QtYq7tgO724NIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Tuesday, December 19, 2023 9:56 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/xelpg: Extend Wa_14019877138 for Graphics
> 12.7
>=20
> On Tue, Dec 19, 2023 at 12:30:18PM +0530, Tejas Upadhyay wrote:
> > Wa_14019877138 is also needed for xe_lpg graphics 12.7
>=20
> Driver version numbers aren't decimal numbers, so we shouldn't write "12.=
7"
> (that would correspond to 12.07, rather than the 12.70/12.71 you intended=
).
>=20
> It doesn't look like this workaround is finalized yet for these IP versio=
ns, but
> given that it is already finalized for both newer (Xe2) and older (Xe_HPG=
)
> versions, it's probably safe to assume this will become official on Xe_LP=
G as
> well.  You should probably ping the internal workaround records to make s=
ure
> that's moving forward, but in the meantime it's probably fine to go ahead=
 and
> add this.
>=20
> Aside from avoiding "12.7" in the commit, message,

Ok, I will take care of this while merging.

>=20
>         Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>=20
> Do you have an i915 patch for this?  Since Xe_LPG is used by MTL/ARL,
> i915 is still the official driver where it's important to add this.

Ok, I have not yet checked i915, I will check it and bring this patch there=
 as well if needed.

Tejas
>=20
>=20
> Matt
>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 7d6b86d602c8..3456ca6f7b32 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -536,6 +536,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
> >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> MSAA_OPTIMIZATION_REDUC_DISABLE))
> >  	},
> > +	{ XE_RTP_NAME("14019877138"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
> ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > +	},
> >
> >  	/* Xe2_LPG */
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
