Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BDCA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034310E0C2;
	Mon, 12 Oct 2026 05:38:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917E610E0C2;
 Mon, 12 Oct 2026 05:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791783499; x=1823319499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hUsgvuIJgFbyiw5tjnTyVFcm/YHeXGx7sUU2Xo5lNQs=;
 b=GjKtNQOEG+9ZK95r6zn+v81C5gsLqAodFH5TGV7Iq7qLC+tc/wAuWNI8
 Gvkb76Pl+9ztr14AjE8Zn0bts8mwlyxIbksAgBS87fg5rv12o32KsegWa
 +G6/vfk6gT7aOLIPZjk10W8uKNQ0/PVtCE44YLL2fOTfu5FCs0f9mFF9/
 3CT1kpFt0ICK/1LUmyQdpT6/kCW421QDwGCDlwofQkYnZ9PCcw588vLIY
 BDCDvU/5tKyGBw3RGqM4GpaJFl8hia9s4c5ZgB9i/JUVQPmv/XCrLWHwc
 kf4rvyhSdQgpd2Q7OJrdvPAzUyPJO9umN0i4NAyFYmFd6SJfGsp5ZP7QH A==;
X-CSE-ConnectionGUID: eSutWuQGTWKZQPElVzWzrA==
X-CSE-MsgGUID: ASYvhotKQbKu7KAPX/ELtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="491011"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="491011"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:38:19 -0700
X-CSE-ConnectionGUID: 9fp6S7zFQrWmBWQvNLE0TQ==
X-CSE-MsgGUID: le9rpl1LRpmaNjA1fiFK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="939881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:38:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:38:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 11 Oct 2026 22:38:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 11 Oct 2026 22:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kqho4MqzaM5lby8G1jvzJqxE5ppXKUtEUHmDnHU3GRbRokG5qwdoh9T+h8NjAPpbVfMyroj+hh5tPG9EFz2Qxchx4PxNAxS9zVQgL7FM/6XAjigwspnivN5epf54BVlvkueAU2XVngHdutumDvrFdtGGE+ca6g6bzaNbLgctOgOulX8rVro5n7I9nJqCCkr8dKZDHKTeQs8FeZG7NJetI/R8oyOI31WLE8yJOL1JRwoUaxzFnR3xzfyeEclEeeLPznNrwcyyG+0R3/3tpOrUa8Hh7Fe0TMCa4XjTKk4SLJX2AyYuSUcOe1niLgfwxhpi7PxGV+ibxLzALqNsqT9ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxWeMY7CFHnaRlnlOuKI76Zs6FIu+KPmnkc1Dx0OBmE=;
 b=lWz8iBe0glROt7TmLdnCJRjHsUscCS0ltp7VBXBErPUR5B80ytEJpY+Z1wVGuMso03EYMJe+wRHXCc2Ez90viOBuuHYI5ixGyxPpVbH3agmBu8vTADv8W3DC7r4GbMTqbgmIE32p7Ir6njJzCRKvbITUVl61v+jHj+IjjN+hZAoPfvn+s+1yi++XyuKaXnVxLsqcwxI0Exr+7UdzApy/80rT0aoGPpdF5NzbB0PxWObvYcchbmntEyhsICU5k4GvF6FtZqtai1U59ByN3lBPkxX2TgtyrrW+zawsvuWgl6TCbH5F3sbKtmz0b+h3wQxn4mYFU/kDDlUXzOVoomHNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LVTPR11MB9887.namprd11.prod.outlook.com
 (2603:10b6:408:3c3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 05:38:16 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 05:38:16 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nautiyal, 
 Ankit K" <ankit.k.nautiyal@intel.com>, "arun.r.murthy@intel.comm"
 <arun.r.murthy@intel.comm>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Topic: [PATCH] drm/i915/pps: Don't block DC states while the VDD
 override is held
Thread-Index: AQHdTxBX5NbRXFSSbkKXLjZW4RbJ/Lbjq4kAgAAARwCADK1wAIABQVvA
Date: Mon, 12 Oct 2026 05:38:16 +0000
Message-ID: <DS4PPFE901A304FB85B62952D8D702EE805E39F2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260928061211.2764543-1-suraj.kandpal@intel.com>
 <03e6056ddce4ff7c7e6f0dafdfe42a75e0beb203@intel.com>
 <DS4PPFE901A304F2F30F230DF7378468608E38D2@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <asTKYt20sv0MZWTR@ideak-desk.lan>
In-Reply-To: <asTKYt20sv0MZWTR@ideak-desk.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LVTPR11MB9887:EE_
x-ms-office365-filtering-correlation-id: d499c7ae-ee44-4639-0753-08df282303ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|5023799004|38070700021|56012099006|18002099003|22082099003|261009223027099003|3023799007|10067099003;
x-microsoft-antispam-message-info: XOXMl6fnXs9aj/CPKRdgZqNToKrmP34vFvJAva4EU/z1nJN5ylNwCJUMQUtdjbT+t0SD94oEekaKHiS+a0svcaKSQDXz2NA+QP4khM2tP/dwR8SyMpxDQDtbQ0D9wTiYQuMo4zjD/1boKzX+f84JI1chnG9jq/wucrnlie6hdnTETy4oNOmmKX0NCVLfCr+qfaGwbEOk/MrdceE2m9E/zkCL+uqvWRkoYujli1SezXZ+k+yu5/tqCcSU8ALK95gfDGxcb+CZurakJSKPgq4xhoYKXHnr7BjwSEcyI7PTWp2tlXmasNzJhDXAdGuNVVKuK6Y/UCyWjS8e0B2DSYdJOFClBv5x71GCBK7+sI4SpRNMAnsvSJOXco/fcRtI397e8xSNleNW7InuxdjlzN1/zXg7AFCInjc1wgCnoc/bPMepep/0pRujRShWna2UpGVtUhh3UKrm6fXw1JhHyUALJvrRSCOm385N2LQdnisQuQ0g73cqdRVP4yIbIHGQq6N/zQeCsqyR3gFD4eew+f1++vrjWHsAxZNBwSsp5cVls+3pbP5WivxlHHqZ+NTb5HioTQ29yAT70W9bqSdkVxL8RSEI7vMN+PS/sLOcbzMkRyVvnb8SOFWiambsigKI5p2RlBD5SFHkHGDp67yVRLSNzaJzSZl2sZLRJvLn6GlZeVzfaNVIzxs71C0tgfFob0CrivHkCdHRxjOYU+YgYyaqVlm6BWjAQLCGS0viaDEUPcw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(5023799004)(38070700021)(56012099006)(18002099003)(22082099003)(261009223027099003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5U9CkFlrMmnroS5G/4JLBVolerEIQNnHQEkCr57fkR3awm2VYZDejfGmFO4w?=
 =?us-ascii?Q?Q38WZTERm0+zAfB2If7xxLxwPkjFFvkoFu9QFMefAdvRn/wTstRkRGr06Jrz?=
 =?us-ascii?Q?ws7DvkErDGxp418AhmQX+BpGLj7jQuOa93i8o04ojxfFzKiI2yAHqNOqzPb5?=
 =?us-ascii?Q?1GXOP4pmmRuFtXbt/slvWbuR5iXlKtAHiNuoNV6OnIFkT/OM7kKtF561z2nS?=
 =?us-ascii?Q?AuZOaDKQdE2Ux7vWAC3WTU/AKm2TeoO1ZjsEz5VdtD67iDAW/OA5XqK/KRG8?=
 =?us-ascii?Q?amSYyV6mZd5UqoAeZpnWReGY8Q7jekXfeqY5ljUYjoxylMpKzLV/na7QJihi?=
 =?us-ascii?Q?3BRGoG7LgXFceRR80evu5oRAAeMh+sqKhtamhKJ6lI++soHbGQu/PQ7clvEx?=
 =?us-ascii?Q?FkXS8pH5K3OQHJS0hSrm+EAmEmgM/MzsmyQVjY149SjJS5fZ9ClrgLj4SJdW?=
 =?us-ascii?Q?yj2DRNrNqiv7MA14+KAsb4FWJNcpTguGt5vzrw8cIkcyPucfHTmytWmAWdpq?=
 =?us-ascii?Q?PQ49m6phuBtIucKwMZCJDgT+nPs0SdxAgsMNvjb6BEGEhGrC9cr1CqZ4R0l8?=
 =?us-ascii?Q?jMlzhuNn/cvJ/12QW/gCaaIjkEM6KGWi5tzQb9AWWjeKZYrbgdX0PBp/njw6?=
 =?us-ascii?Q?6RWjzlDZNDoG0GydNtWheCbzUt06ib2D0XSoNC5fSJU2IGqnHuVArVjmE2Ak?=
 =?us-ascii?Q?h0loSTN2fZcRzGULo1POl6j2K922KX6cacIurCidedVsIZTWFB2z0M41KvoA?=
 =?us-ascii?Q?IUO2LShNRo9fpN1Y6iesnQv4GJv3FZwpIHP4JdkBKVX80VXHFVUaxa97W5pu?=
 =?us-ascii?Q?dbJcxxJlBMjgRS4JKqa03unjdy3S+8uPDHG44va4Qv1LwIhf0Ft/g6vYFj/0?=
 =?us-ascii?Q?R/vWlOoUcb1CFtYqjAx0SOJlvWKHxOfSWvee2YGWbCqp5GLWT5qXlDa3LkYP?=
 =?us-ascii?Q?WDQgJZ0MTqd1/fjklV/PF4UsMOEWjUEmCeDgs6iLHpaF/ZICTvSDATsKj49N?=
 =?us-ascii?Q?fksK7901qFnu/Mh4lZ6Cj/r0iRy28qdnazn4h87RaacFzSPWb63dHjgJGGWC?=
 =?us-ascii?Q?d+mH+qtD9BoulfBGlzPJtpE/ZK0kc4Sw+1ahQdO+VexNlpP/oked/yyrYwUF?=
 =?us-ascii?Q?nCz92qCNYFheG8sdYngr/1Igwy+aCULFUvRPuoRbrSHXpIhGo4uzKcQ+8Eu0?=
 =?us-ascii?Q?GWpgQNxJ75nIoAMRQPbgS51WUm46G1E8+rz+LotkobxqY+yyop/rH/SMqtrX?=
 =?us-ascii?Q?W1SrLriYFrCFB9MfriMPZeIoXJpue/vYvxLlpsxFbhJRgsgDACoUJkqKNLxx?=
 =?us-ascii?Q?TQAkjnt0JymWjmgpjyabjBddyKWZe3iyZrgO4hh9vLKCs1DhXJAT/Hx10xLW?=
 =?us-ascii?Q?NIDt0JIHo6CBTihXstZnc6S1Y1BFcrKen7e3xC2dZbuY2OE0A46z/54Teyka?=
 =?us-ascii?Q?3/V1ndj67KlDzieuP8snwJ2PoDFSnpI+u8kXydtZs0w00SkvVi3t9vCQ0qaW?=
 =?us-ascii?Q?5nnOSPRo5TWK4IOUOEAfkOD/yUgnz2SgqUrDgt22AwzSNe+65/4vkxWeDLSv?=
 =?us-ascii?Q?/s76PduZi8TP087xFCm7Ss5ySWctFteSgUFTiWxEbLXPLbML/8pAr2w02US/?=
 =?us-ascii?Q?leedqG0v7Dm1ppKdxFojsHeyb9OW/tSkobwEdrz1+twam6oLi+NH0wUj30AM?=
 =?us-ascii?Q?+bBSz133MX7xT1k6J/bdGILFX6aMn6MtXbDRSW8fGR9Iiwkc/BmGwHaJjGIb?=
 =?us-ascii?Q?iQNC+r1Rhw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4iEsJPk28/xSQZ0MDbiNSgQbkbINytdMF+RINITydgowi4WdNNutRGXPcNVScNkf/eCZQmnbZLZ4kyZeWcsFBZ1osyuERtMRW/XJm4d8twnYopcNcfPpf8TbwOkpKnukPP/HCeetyIAEGCMqzp5ZS1CotbtQrKgqaVLlCgk9ry5UvieIYCpqRplDz32hBy5KKi/vDVw/XXE41sQ07nPa3AOzi20jYT0K6govUCdRjXi4t2F69pFnBauHGVzVb0vA70RO6bHS2+nC1inHJWAec42QVpKD67Ko20pL7FDXpDBVkiInVOW937/8x72n6hGhgFoyP1b7yJSOPRXN/L5kQA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d499c7ae-ee44-4639-0753-08df282303ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 05:38:16.4260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLOtEhqGLWEPA5tP/S49GvxbyIHCi9RqgUqm8pZdbX/wDXzjuetEvt0ZsAK2bWpaNuaqwnrUE0UJc75cJs20Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9887
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

> Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the VDD
> override is held
>=20
> On Mon, Sep 28, 2026 at 11:44:13AM +0300, Kandpal, Suraj wrote:
> > > arun.r.murthy@intel.comm; Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Subject: Re: [PATCH] drm/i915/pps: Don't block DC states while the
> > > VDD override is held
> > >
> > > On Mon, 28 Sep 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > > > intel_pps_vdd_on_unlocked() takes the AUX power domain and holds
> > > > it until
> > > > edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5
> > > > ms after the last AUX transfer. That is seconds on a typical panel.
> > > > The AUX domains now block DC states on Xe3p_LPD, so that reference
> > > > keeps DC_off up for all of it. DC3co arms with a 1 ms put delay
> > > > and never gets a window, and its residency counter does not increme=
nt.
> > > > Nothing in the panel power sequence needs DC states off for as
> > > > long as the override is held. Take AUX IO instead, which powers up
> > > > the same well without blocking DC states, the same split
> > > > intel_ddi_main_link_aux_domain() makes for PSR. AUX transfers
> > > > still take the DC state blocking domain around each transfer.
>=20
> What causes the continuous AUX transfers which leads to "DC3co never
> getting a window"?

Nothing - bad wording on my part. Sorry. There's no continuous AUX
traffic. One transfer is enough because what's long is the release.=20
Ill reword the commit message accordingly.
intel_pps_vdd_on_unlocked() grabs AUX_A, and the matching
intel_pps_vdd_off_unlocked(false) only schedules the drop,
panel_power_cycle_delay * 5 ms out.. AUX_A is in
xe3plpd_pwdoms_dc_off so DC_off stays referenced for
that whole time and nothing can enter any DC state, DC3co included.
The override  needs the AUX well powered not DC states blocked - which is t=
he
distinction the comment in intel_ddi_main_link_aux_domain() already
makes for PSR. Transfers still take the DC-state-blocking domain around
each transfer, so nothing changes there.
Also Ramanaidu observed on kms vrr @lobf-dc3co subtest the dc3co counters s=
topped incrementing,
they were increment prior to commit mentioned in fixes.
The patch provided seems to be fixing these issues.

Regards,
Suraj Kandpal

=20
> > > > Bspec: 49277
> > > > Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to
> > > > DC_off")
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_pps.c | 21
> > > > +++++++++++++++++----
> > > >  1 file changed, 17 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_pps.c
> > > > b/drivers/gpu/drm/i915/display/intel_pps.c
> > > > index d4c98b150fa2..bdbaa10bce23 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_pps.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> > > > @@ -11,6 +11,7 @@
> > > >  #include "g4x_dp.h"
> > > >  #include "intel_de.h"
> > > >  #include "intel_display_jiffies.h"
> > > > +#include "intel_display_power.h"
> > > >  #include "intel_display_power_well.h"
> > > >  #include "intel_display_regs.h"
> > > >  #include "intel_display_types.h"
> > > > @@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct
> > > > intel_dp
> > > *intel_dp)
> > > >  	return control;
> > > >  }
> > > >
> > > > +static enum intel_display_power_domain
> > > > +intel_pps_vdd_power_domain(struct intel_dp *intel_dp) {
> > > > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > > > +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
> > > > +
> > > > +	if (DISPLAY_VER(display) >=3D 35 &&
> > > > +!intel_encoder_is_tc(&dig_port-
> > > >base))
> > > > +		return intel_display_power_aux_io_domain(display,
> > > > +dig_port->aux_ch);
> > >
> > > Seems like this is something that the power domain framework should
> > > take care of instead of hacking together locally.
> >
> > Actually it does not at least not for Xe3p which now has DC_OFF when
> > taking AUX domain, Because of that when PPS take AUX power domain it
> > also takes DC_OFF(exiting DC states) which is not required And since
> > it keeps the reference for longer than what a normal aux transaction wo=
uld
> DC3CO does not increment its Counter.
> >
> > >
> > > Cc: Imre, which you should pretty much always do when doing anything
> > > related to power domains.
> > >
> >
> > Sure will keep in mind going forward.
> >
> > Regards,
> > Suraj Kandpal
> >
> > >
> > > BR,
> > > Jani.
> > >
> > > > +
> > > > +	return intel_aux_power_domain(dig_port); }
> > > > +
> > > >  /*
> > > >   * Must be paired with intel_pps_vdd_off_unlocked().
> > > >   * Must hold pps_mutex around the whole on/off sequence.
> > > > @@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp
> > > > *intel_dp)
> > > >
> > > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > > >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > > > -
> > > intel_aux_power_domain(dig_port));
> > > > +
> > > intel_pps_vdd_power_domain(intel_dp));
> > > >
> > > >  	pp_stat_reg =3D _pp_stat_reg(intel_dp);
> > > >  	pp_ctrl_reg =3D _pp_ctrl_reg(intel_dp); @@ -862,7 +875,7 @@ stati=
c
> > > > void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
> > > >  	}
> > > >
> > > >  	intel_display_power_put(display,
> > > > -				intel_aux_power_domain(dig_port),
> > > > +				intel_pps_vdd_power_domain(intel_dp),
> > > >  				fetch_and_zero(&intel_dp-
> > > >pps.vdd_wakeref));
> > > >  }
> > > >
> > > > @@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp
> > > > *intel_dp)
> > > >
> > > >  	/* We got a reference when we enabled the VDD. */
> > > >  	intel_display_power_put(display,
> > > > -				intel_aux_power_domain(dig_port),
> > > > +				intel_pps_vdd_power_domain(intel_dp),
> > > >  				fetch_and_zero(&intel_dp-
> > > >pps.vdd_wakeref));
> > > >  }
> > > >
> > > > @@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp
> > > *intel_dp)
> > > >  		    pps_name(intel_dp));
> > > >  	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
> > > >  	intel_dp->pps.vdd_wakeref =3D intel_display_power_get(display,
> > > > -
> > > intel_aux_power_domain(dig_port));
> > > > +
> > > intel_pps_vdd_power_domain(intel_dp));
> > > >  }
> > > >
> > > >  bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
> > >
> > > --
> > > Jani Nikula, Intel
