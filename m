Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF69DC982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 16:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F0010E958;
	Fri, 18 Sep 2026 16:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EToFpfGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ABE10E951;
 Fri, 18 Sep 2026 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789749620; x=1821285620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cWbd8ozVTiM96Q82oZPyzlsAZRRspEyy5oTkQS9fM1M=;
 b=EToFpfGjvHMUlLtynitxdCcCpts8eN/EBRI+30xiUp52m0fC6AfyqV88
 FyN07OSIH3PLHo+FSwmXn3CvlkH9zCKmqd5e2skKTirGIcIcKTpQ9Lsdi
 dofk+O9QlFbl6Sn0UrVB05RC1Zs/ZIpjJSoS8y2FD6iGkA33ayZiN2y7I
 otEaExZ2ET+7Pyu9V9dlp0oNDG8mq0zFaNuTaKz5bi4blPgeTaoGVo4ox
 c6Dfuupu1oyDAenwfDFyHu1EYNFTKWl2CXWuvemUjvmekEyZhMlADAHBH
 DK6YqzseBKF79Bhi5vw52s2Yd9zg7hv+j+1VwD9+nL3uNjAbUw/N6cz4J Q==;
X-CSE-ConnectionGUID: hTLAEsi9TryaJqh1YPg5rA==
X-CSE-MsgGUID: ponr9m0XQOiMi4ejYNZN9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="94102261"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="94102261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:40:20 -0700
X-CSE-ConnectionGUID: 699DrVOITU2hgdyZ3UlswA==
X-CSE-MsgGUID: bwQJziO3RuaHLhb65n0yug==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 09:40:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:40:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:40:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTyo34szizNtO/vXcDTl1VzokyY1z3X5k1Dkb57eed7PcU4f33UhU91t1qR0dPDcxMMK+jVOZrcfbAqITyrIuaR+2U6E+N9m0MJmp9jJEv9krMfGX581w1WxTHl07yryPFLmyOamAsuxHpMjp4cVQOtijmWDvMjsZ/Cq7WOnbXmEKr0RbVNmtSlbRxveQzMP1/ltYhV22t5rp6uB5jfj12UAlw+HebixDGJatmaEbxsLoTN8Nvq+4Oaa7ZO2hM81jcsqLGAyelk39v0kRabK4is3gXv3MlWf/eFgjVONQ1cwBKqGu7tHWMlr1lRFnwjwumOVYO6LaJ5viCfgt2bQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBK8vVJqzwYOOF15qENOhIeCfM18O8YbquNVk5Odgfs=;
 b=DwXe7DSC/hn6+DDktxfYDgkU8UF88KArhy2egD/kSdj5wTYdLLVAMwNerFKF1QNU6ZNzyR8DZO6RHR/8qNZRMxdQFE+AIr89QX7YhVI4CkbJ2tEGGWNx4WFCNLAvVH8ha2U2zNJ2D6uRNsAE7QQ4dPO444I6XPGx4/mHfR7NTxKA0nsZnm33F9IyTQ4XJ3Kbgne2Woz4ItmS6pagG+10y3hgWv/i2UN92Q9J2RYrdrNg5e3imEFkmk3LzfaRgEcJiGBIVaZ5RorecR1vBUA+WoKMUMZ2jHWSnXPPwoGieyc5K3YZq/BXEKcSRsjZSQfj8MmuL6L3Rqt8s/ZOA+xaXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH3PPF10E309DEE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d08) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:40:17 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:40:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Topic: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Thread-Index: AQHdRzhdVLsn3FabEEKhj5Fa7KTMM7bUcN0AgAAZNuA=
Date: Fri, 18 Sep 2026 16:40:16 +0000
Message-ID: <DS4PPFE901A304FE62FBAEF0617589BA0F7E3872@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
 <aq1UFD8toza-u2pl@ideak-desk.lan>
In-Reply-To: <aq1UFD8toza-u2pl@ideak-desk.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH3PPF10E309DEE:EE_
x-ms-office365-filtering-correlation-id: 347babe3-7f93-4bbb-ea5d-08df15a38525
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|10067099003|38070700021|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: zyZ6DKfeJIB7oonocE1DKVJsoMtHu/KQVts3Xq+KIfSAcnPSi98wjCfd5gUSAhupmZvDWsSvn3PwzFyqlrH7D/q8tHaLj+jorJy/rpeoAj0Kg645v3pqUXsGWDLPXav9zJ9bjpL+k1+x5LAyluXabca4KWteuBI65P6mHEYh1UM5MD34wElA9MBEfjFzainamoG35Y17pbydBE/i99QyEEZVGAVJjnKAQoUp96Oc/RnzQraBPZVTDgfKPU6lno/86+tfkZhNhclaLAawKTt3SnJuUuUaiGEEshLu5cDgc8ShQMVrFcNehlu8o4qUNE6HFXG+som0D7gbd2aoz/VwXWz5E/bUtSroJmlN80vO1jrj+SFSOCbMZhz//iIN2a7Yc1a0VBWEao3tIb0AtYhWq9dxBCv5MQGNLs/7EeF+GRVw3OV/ZgP0GF710/Y0VAWFd/PymGhmsoMZIqwnFX4/viOOlJw7iu+PTHFD9VIuFpHXXFoHS4guIQvazARdBAAMwWgCN4nkchmvQi0kb5XcCYsNMArwzBUePhEJOi57aBDMh2buzieD1BBQvtzrC0aSg90fwFBkCLuD3AiWR6Khqactl8RHbTAaVkNViVODe4dRz+LJwp8TEVRoZfaQaCx4GuMgZQyTArAvj6qvzNxGq12naHkcLnPw0HJR7fYwCqQBqK1v6DzHQAL89BLpxz8rWi2jzLx+BguqNKLrL5qTaU+vWyw1Ty906HGpSDeJ6l8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(38070700021)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UE4uhwXf/hU4yqQSgVBN6QpwXThRPrQA9ggE2EeRfAZCm55NqRlz3N4X09k9?=
 =?us-ascii?Q?4vggMTazZEpDXqsVAoqRf6TGzpuU0qgwJuJJ8S2WE+3THNED+YfC/rTjV1OB?=
 =?us-ascii?Q?MSe7tVe+tBFIj9SFx+rKJczSBLyI1g0P//SHaPatkXi1F1E1NS3LSjO1bk18?=
 =?us-ascii?Q?VNGAOr1gYkntwr/R0Udxb2xg1PihLhyR2ZcY4v2sKL9SsNlPLlAxbahPb7Q3?=
 =?us-ascii?Q?oIE045vWA+0uvArMJ395PURW0Wp6+xOyhb0kuorH3b6mtxxQLlMdxyN48Woa?=
 =?us-ascii?Q?yQ9ZMwaOQQgLa8nywidS8kXo9tiMozuB7Oum73ulIAUnZvor/DYUVqBuDGe4?=
 =?us-ascii?Q?P3dpp0T6dsW3MC3bZzfIvSmzorcRXoxLb6/ZEnnmMrK5T+L/4kCizWwo95Un?=
 =?us-ascii?Q?yJeSrlIJ7e9bgz+XcRFOXxqfreP3dk4m+TWyf4GZTYbnbpnxw3sfdd8vC+2f?=
 =?us-ascii?Q?Q/YTezReFsu2gjuHk9u1MTGOKpehzMnsFVmiPZcRhEFkTxPm5ns7CDoNxHiV?=
 =?us-ascii?Q?8MKMHViBcZzoppSAJ7ZLXpENYLM/bQ5z1BvryduI/HzEcM6sVmjv7Uzoq9vm?=
 =?us-ascii?Q?yi+LjbfU1YeMs32TlyT/uJTjwwHAZxZzBk+QHt49eGwx3wFGxFwOU+aCp07Y?=
 =?us-ascii?Q?LLkj+LFtm4jINYWr3WSzII/sLXcEo/2UZ8Qk9GDZQ6oNwu+iErSB5paL69NV?=
 =?us-ascii?Q?XH0ifU2BeON19A+IygY6yieCMO9Z8FyklH+FcjosHaO3oQEaE7t2tHI7SrX3?=
 =?us-ascii?Q?D543jpt/CI6Fx3TvmlRYZymTe3JIV0mOsPlxeVnZqh1tsOJ5np0ieY7B3iOO?=
 =?us-ascii?Q?Rfa66slrXCVO/k9vuIiymr1ap7rh7lucTINlXeT8svjpd0IxDfrQdNX2CzWJ?=
 =?us-ascii?Q?1BZGaEjGYMJEbkAsFuZVyUvp2nc6cKxafued7/VTG/RdYeokIxMjxFIWXYaE?=
 =?us-ascii?Q?a3c2kTos1IMs5vyfRjl3DY00NUB8CXYBkL8KCQ6bNZnG8GFYKPtDubsFO7DD?=
 =?us-ascii?Q?TJhPztX5x92iKZivZyHUNAxiLgvK9Es0w7qOsoT/5dXE9lLsElXwSIgBmMYz?=
 =?us-ascii?Q?S3VlvUrzQDf7sTdHrkivymm2KF5ikjR8KEFnZ2YaVE5KzMQxRIUNmbRWNmzu?=
 =?us-ascii?Q?Up1iFvCHPpNcYJnsBqwz3mUgmvRsUTeZtWcWOMobUBPkV/TDoxlEyeCSOAxP?=
 =?us-ascii?Q?+FOEz5rsyfK/ESiBcy6MEuzC4o7U2g7weK44A0KklyJuvzDwSpztdH/Mngow?=
 =?us-ascii?Q?UWTzXfVs0U/l6vCohZhnvCHPkPQDQUPdFv68gxp7Hz8tBD6Yj73Txfj1a328?=
 =?us-ascii?Q?CwL3wYLDR/SxSc5nOv4rKHkYX261BUNSyII2pEtZYeJjKscY6Ws4hidXWfYD?=
 =?us-ascii?Q?aXQPIhCxHYvRS8SA56KRY/iLbgVEkF9LFRDivmrjwe6EDUxCB1wxZvv6OFQF?=
 =?us-ascii?Q?9siO7rFBhykdtAB990MWM52BR2kCk9cHqsh3AhHZUcX/JEcPkV9GkzCiL8po?=
 =?us-ascii?Q?/3/6jWKVvMf7TC84VbZBCfgbOUEITYYeIsSSA9ylPtoLxZgP/Je+2XKFpmIN?=
 =?us-ascii?Q?PV89b6L4/bRIOvzkzq8DOo9O04g5kyTgIwvFavb1Tc6mJ0hmiwYag+zfY63s?=
 =?us-ascii?Q?tcNLCM4qt+iD1dt7+EYntTfd+KduGi+kyjvjSJIu03Rrk/OR5ncZ1RHU7Uji?=
 =?us-ascii?Q?fHmWjoJAY+SQE1ijCEQw3lgOR+y0P2FZ8An4Bmu+ncud93AbXvlicrovugHI?=
 =?us-ascii?Q?olPwNDI6Gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hXv5r6xweHos2lrhFwONlRdySjERq4g2BH2AfcXPOfnu6EzuFR1pE69XD2+XBLkLOgF7dgN/R/L81mmwC/pvOeMjaWBv5CnoqwmocEdNbexlo9aPJgA+02IYjI59T1MXjYGnub2oZL6TZss6+riiAx1jIudnFWCQsbh9GS2HJ/oYZoRkygkLXjnmjwaKEFqxsYY0jEab+CevJ8ulXckUqYOxBV0NjnUhxOpomu+WXDJBwu1KIqKLns6wkfodX+MhGjQY/SW8lkVLVxfNyVFl/HvHc0a05Rm1+MxcN9ZCIE9K4+w9ks6/y3IfbtdCY3Zab0itewlOgUGDA1M0E/Q+MQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 347babe3-7f93-4bbb-ea5d-08df15a38525
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 16:40:16.7420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odM039Tj1RtV69DQiAyEUeqHmXeH1SfoSETT+cqGcYKc4LQcoY+hIimH2wm+aVRD0b5WOCpOeUJNwbesQwWm+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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

> Subject: Re: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
>=20
> On Fri, Sep 18, 2026 at 12:08:29PM +0530, Suraj Kandpal wrote:
> > From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
> > for SNPS PHY Aux will be always up. But from Xe3p LT PHY was
> > introduced which powers down the PHY. Which means we need to make sure
> > "Disable DC5/6" of AUX Programming sequence is honored.
> > Disable Dc5/6 when programming AUX.
> >
> > Bspec: 68851, 68967
> > Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> > v1 -> v2:
> > -Fix commit message (Arun)
> > -Fix the if typo (Arun, Sashiko)
> >
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > index 3cb07b0a901c..879b203f9258 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	u32 aux_clock_divider;
> >  	enum intel_display_power_domain aux_domain;
> >  	struct ref_tracker *aux_wakeref;
> > +	struct ref_tracker *dc_off_wakeref =3D NULL;
> >  	struct ref_tracker *pps_wakeref =3D NULL;
> >  	int i, ret, recv_bytes;
> >  	int try, clock =3D 0;
> > @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >
> >  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
> >
> > +	if (HAS_LT_PHY(display))
> > +		dc_off_wakeref =3D intel_display_power_get(display,
> > +POWER_DOMAIN_DC_OFF);
>=20
> Please don't do this. There is already a way to enable all dependent powe=
r wells
> for a power domain, in this case for the above AUX domain, which would do=
 the
> correct thing whenever the AUX domain is enabled; as opposed to the above
> special casing of the AUX transfer. For NVL+ setting that dependency woul=
d be
> something like:
>=20
> I915_DECL_PW_DOMAINS(nvl_pwdoms_dc_off,
>         POWER_DOMAIN_DC_OFF,
>         XE3LPD_PW_2_POWER_DOMAINS,
>         XE3LPD_PW_C_POWER_DOMAINS,
>         XE3LPD_PW_D_POWER_DOMAINS,
>         POWER_DOMAIN_AUDIO_MMIO,
>         POWER_DOMAIN_AUDIO_PLAYBACK,
>         POWER_DOMAIN_AUX_A, \
>         POWER_DOMAIN_AUX_B, \
>         POWER_DOMAIN_AUX_USBC1, \
>         POWER_DOMAIN_AUX_USBC2, \
>         POWER_DOMAIN_AUX_USBC3, \
>         POWER_DOMAIN_AUX_USBC4, \
>         POWER_DOMAIN_AUX_TBT1, \
>         POWER_DOMAIN_AUX_TBT2, \
>         POWER_DOMAIN_AUX_TBT3, \
>         POWER_DOMAIN_AUX_TBT4, \
>         POWER_DOMAIN_INIT);
>=20
> static const struct i915_power_well_desc nvl_power_wells_dcoff[] =3D {
>         {
>                 .instances =3D &I915_PW_INSTANCES(
>                         I915_PW("DC_off", &nvl_pwdoms_dc_off,
>                                 .id =3D SKL_DISP_DC_OFF),
>                 ),
>                 .ops =3D &gen9_dc_off_power_well_ops,
>         },
> };
>=20
> static const struct i915_power_well_desc_list nvl_power_wells[] =3D {
>         I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
>         I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
>         I915_PW_DESCRIPTORS(nvl_power_wells_dcoff),
>         I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
>         I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
>         I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
> };
>=20
> and using nvl_power_wells[] on NVL and platforms with the above DC_OFF
> dependency.

Sure will update the code test it and resend patch=20

Regards,
Suraj Kandpal

>=20
> > +
> >  	/*
> >  	 * The PPS state needs to be locked for:
> >  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> > @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	if (pps_wakeref)
> >  		intel_pps_unlock(intel_dp, pps_wakeref);
> >
> > +	if (dc_off_wakeref)
> > +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF,
> > +dc_off_wakeref);
> > +
> >  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
> >  out_unlock:
> >  	intel_digital_port_unlock(encoder);
> > --
> > 2.34.1
> >
