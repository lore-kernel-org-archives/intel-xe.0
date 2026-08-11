Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D77C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC710E30E;
	Tue, 11 Aug 2026 12:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRL8tFeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FBF10E30E;
 Tue, 11 Aug 2026 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786450636; x=1817986636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tt+QznjgP9n5y0mJ4sE5lyhKLlXmBsBJcYWgXT1JnsU=;
 b=YRL8tFeoYS167VZxfGDPA8a7ptKsE7wbtsXaDVIkR4LVEg4gNdEpB93E
 CAgCu+XTMhz8uQxt08b/QlaWExKdHekcHNfT/71/3tKxe9YQo5CPQNpMc
 9S3DEIMg1u1dp4CrCRw3uFloMFI5MjvqFxNYDFdem25z1lpJn7JXSDtc/
 PPdymGFKlB+xyRzIlcUFQYe5QVwMS9FVtai9J/UGO12kqrmiGLdBVB+6o
 d5Nw/dAUqTMxLJZIicm4T6B3p9pgqXtz9yT+uNvG8JMV5mgaYJH5+FSc5
 ZLyvQ05Ao/knmMtQAT+dsx+xF8chBDYuYrknDdOrNH0f5sMnGVKkNfgjy Q==;
X-CSE-ConnectionGUID: bEHwOiiDSA6eErSRHV6tew==
X-CSE-MsgGUID: pyZIUX/sQ0a1MrUZ+KsDGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104369113"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="104369113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:17:15 -0700
X-CSE-ConnectionGUID: DqsrEdQrTzSNj5N1TGJczQ==
X-CSE-MsgGUID: DACnUITbR5KF3uicQW731A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259058653"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:17:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:17:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 05:17:15 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 05:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovPyxtwFObOKfsQ2cpPmpVIC0LxXmHRgJtAPs72RiavIagPlHmGZ0Ld3598U/hsQVQdBir9StC0MCS8DokXI3bdw8RXbySCjFDuq0C8jqHi85Vle1IiaGpbyvPy2QLDPbis9KNHPTtJ4/R3oNksvNuPlkNMyzv+jAJq6lHPdnUh400TCmqo5SqP3qyo6mGVt5faPsqdDP2V/c1J2OjAc0d8CB8pI4Fv4VXY0NMLBIvJL6O10YEKCk67ZXXSqm7npEw2l5HOgV9bgx31FlKEqCJFFZacTTMyAnjoHU14tQGzHBQHXThHlVLLjPeMHkAvbIhqTVABHx2Ofv7htxqkJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocE+Zxel3DnbQiEsNL0sQgQqUM73VeqUWImML8XfhHQ=;
 b=N/84XTgNodCOBcrcjHtJKGwS96NwvlXaoxENFJZ6ezDfazV9GupBszJ5dbBrJsYx+hS/ei5b4+1HPIXOPbwWdWaoQUPuX17hQj8YF56irtFdAuVYD5QWeuouFXsx0GAX8eUxpyHM+eLlCVclNJ1qwFo1Lf4KGxbMQdo04ZEhih43su+oEogwLocJ/E8EmrHep/l723QQHlUApVdBMbBIBMGtjVrI5Rdmu9JfFTeI+EBGEb/PhcbzHOrJyMFkaJO5ChbG4FSh/JVedumqQDXdTv8hD02CDUkM8PFpZpJYNwQkHTBY2heAyoUT90v03xIYIS67TdJhyl8g4HdsDdpXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA3PR11MB633499.namprd11.prod.outlook.com
 (2603:10b6:208:54a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:17:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:17:12 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Topic: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
Thread-Index: AQHcph3FXUtOQAt/DEKboKxA7pyVubaQNaoAgAmTgNA=
Date: Tue, 11 Aug 2026 12:17:12 +0000
Message-ID: <DS4PPFE901A304FB98A4EA3E8BBA006864EE3DD2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260219094326.34922-1-arun.r.murthy@intel.com>
 <20260225061110.385441-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307A07B980ED412AAFDBCE2BAD32@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA3PR11MB633499:EE_
x-ms-office365-filtering-correlation-id: c88d1eff-0942-49cb-2cf1-08def7a27979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|3023799007|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: M5dz3wYJa8LHpPhupds3amrN02KGIDI4QLYDMw2uotnMHsvQRipLVH91bw/CQ+pRadmQFP1emz19qMkj7dGTmD0huhDcSODTPnb2Vi2JtK10DgZmedsyz+hs1SM33OkHzH3ZMd7lLI8a9XUSBv1+CU76DqwkTLSs/1JfUputFOMLX769xeD0cw4VyvIs/PM18U8FV72tm7Ccu7/bv54ER6hrwEbcBflsFETt2NPq9Q38ISUuajIRIGHogyVs0RN/Dhg3FBMWFXDQJ1HT4EQjDak8LvyPV/acuE7wXjXbMDBL6SajQ6YMfb9UT2gNFFM8U3StcTQPSTTXpihEf+4CoEojoUts3rbnDVJGlbU/u+X/K2VSQPhd3S62y5hWHWTZKjIHE6XVKizaWzo5rO6say6duISlly3yPuWr2W97KQpMXCIzOo5iII64ffO6aVnO15aMytbQ7YOXJNXV9QLJggrQtTsLkls7AooNU1Vwj2R/d8/cCzhGFiN/kxar52BbHJj8ynxBMVz0yVEMppI///DesgtXY5FFXpzuhWHzAS0OrR1ljFSj82ZjtGH2jRGB571LtALjpny/mgUTqMM+JjLbT/yuCyi8Pd3k5V29jPYRGl+yl4ZIy2lG97MR8K2PPGBJpZVvjIDYmgLanX1VQbtWUkJdkIZEWqUWgBoIvnU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FwQOREe7/Qn1F12zDC1ltC2kMggY9W8N0QriuVQgFNFYYKmhm1e8KJrO8+4o?=
 =?us-ascii?Q?EnqVdO7V4DU2fTuM5pmGq4iSTBnO3kYZree0qodoUsJ6QJNZJCNsRVLzkaWQ?=
 =?us-ascii?Q?Ta3jNZnLo4THbQLuvzBgcIQpfh7gmnbSRKBiypHCGwiST8aVDiEvg5+jMt1W?=
 =?us-ascii?Q?Yj9vewBVKNIyUfSFq3u2Jo1v0c+s/8JuFx47iOFbC4VLK3+3KKL/uvakBp/O?=
 =?us-ascii?Q?t6wkEg/JDDQK2ZVWTRBVxawPEYFVPFdb6LY9HuyNDd0urjDoqUnXdAERw0fU?=
 =?us-ascii?Q?yn92LK0G30wKc5pmpurc2EV4wLzhTp4RDt7LIrMJ8e9tcuYalPQfikVb0GJu?=
 =?us-ascii?Q?pdSFJd3peq4VkXR2IwuFkF+zcAN0Kay4dxV+Nx/zSIem3ElztJX9xNEVYA1h?=
 =?us-ascii?Q?Z+rxFtEdzThmfUlUu0p2mZc/DtfDgXak4nxSXeIEHeIeyAuks/rrbOQZi/By?=
 =?us-ascii?Q?gH8hPnEFB3jXoR3LoLN/+KonU8fG+CFw3tYMynuEpHlokFBrPibpm3ppA3Zl?=
 =?us-ascii?Q?0UB088akuZhlUAVC8So7/qc0d3rfw5ywbRTgOl34R/1SViadRWR4oeVCyaKZ?=
 =?us-ascii?Q?KW/iE64lk1u03WYPHsX+nIudwCCVyrzi/3HtRIALmoz1HMyEFV7bK716HtuV?=
 =?us-ascii?Q?8ZMcsw0K/qoQtJH6akdsuUf5jDw1HvyzJYcChGbafNErlPbe4B8y928KNNLJ?=
 =?us-ascii?Q?pb7bS+vU7HXJtfAkdWVdSAaKWlcpcMXfhLIDofcN42s9ewPzOG2GXsKe0mUP?=
 =?us-ascii?Q?PHKAfey/B9+FiwxHH5VKLv1MhryHMRcoT+GKfKYYQQl0iKlhBBlD8NvoXcyj?=
 =?us-ascii?Q?Zo+6sKMZVKagCMSMTKt4lNHHd2VIHiyPNxIhLjEBMyWwbES/MTxfzb8RjKk+?=
 =?us-ascii?Q?MNLeyc6R4DDpPMKsFjO6iw8fkfW6+pUUAouCRGsou3W7i0Zus3tjhLGHjrE2?=
 =?us-ascii?Q?fZ2XERjSZaOPYcTP3l9RabGbJgGgGrG2KQA4C2RZt4eQKVQ6iyBewyDXGJx3?=
 =?us-ascii?Q?HNK/Q3BiFGy966FmMblon7iy1vK3Dr+xW7mFpX6SsIen3mU1gbNEnolgeRDR?=
 =?us-ascii?Q?S5MeJFvGgYG35hyD5xJ9IEWVastRIan513dBjHE2LcMh2uVwy3zSkbAaeyTH?=
 =?us-ascii?Q?9yqhtr6Kscxbg4hGHrlVJD9LvA0b7PQKWjpP8uPXHoBSbfXACp/RMw9RDiO6?=
 =?us-ascii?Q?yz5D61WC6A/ME/a9xEy9IHm31yEPpXSVJimqTNnGvZKob9iTvPSYKbMfkPL1?=
 =?us-ascii?Q?GWaYQAR8NoapvU7vinR0+2vaBXaG+uF1+Tbwq92aL/hbO3GrQmH1woxbz7TS?=
 =?us-ascii?Q?e+TMXf5lio0c/yPObZ6S8CVzlf4eyowyw1vg3HijX+71uHjPp6kVXOJmWrTv?=
 =?us-ascii?Q?5b4DEih8j3mfveMLFcaBlwHIZS1cwSzxJgu318WL/5dEltsM/A6D+uMfUTZk?=
 =?us-ascii?Q?w02JJMXbULRwVi0v/iiyin3snaF9ltGJxNT1pIVvwW/ZcPXn/mBhjUDAxUCF?=
 =?us-ascii?Q?4A/gowRKnmo14h3sZelw/A1AjjXQn6SqId09h4uRUmSKEobODvud2uoEEt5T?=
 =?us-ascii?Q?jx/2/4Hd23gYQT9SyuYK2LVgS2vHRe72rg7zBjnpWdvd0PH1ENQ/hzU4EmGX?=
 =?us-ascii?Q?lkaSddXDi2A9wLY988yFxDOkByna+hNO9C5Gp9aeaEWAMW8s4ZSYanB7DCAh?=
 =?us-ascii?Q?K4ehPtlAH/TvOzxaWi42BTVFBJ7HwPGcSrcFk9dRJlHXKZBnhcUZ3BH0IL2B?=
 =?us-ascii?Q?+iUbK2RGug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jyNRCY8unGVJ/K+dXd/BagGknShx6yGAD8AHyK8W9H2xN9i7DoW7KEI6izhzWDG0FOjjlU9znHaK7wV+p7ipE6F6akoyon3T0nN3JuS9P8GvvyChS5Xye4msAVMbdVxPmJDTp2f4WNpIRTmihFL6IGBig2cEpxPYpqWHTiRH0mjmvyKficlFX9wFv/CAUHxN/dfCSdkTyWyrIr6Zatw4HvZc3fUmaeXlcKKd2d7lw+3cjamQYXwbDJULWjtENVIAxPzHjcMlY15VVlevTFFOZua38QF9OTDoiZHmdBLxfsbqLuTiE19ndqeVn9jpWckhWo8/nH00PZETZtYElL5AQA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88d1eff-0942-49cb-2cf1-08def7a27979
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 12:17:12.7317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knGqmTYeDQkJl/5gafnHaSA1skXFkxu7X/tYBYg9Vj9lF54BQhKgX4colUr9jTrFjsa0y0sXFoXETZH+M7gFgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB633499
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

> Subject: RE: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
>=20
> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: 25 February 2026 11:41
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Nikula, Jani <jani.nikula@intel.com>;
> ville.syrjala@linux.intel.com; Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv3] drm/i915/dp: On DPCD init wake the DPRx for eDP
>=20
> Its observed that on AUX_CH failure, even if the retry is increased to 10=
00, it
> does not succeed. Either the command might be wrong or sink in an
> unknown/sleep state can cause this. So try waking the sink device.
> Before reading the DPCD caps wake the sink for eDP.
>=20
> v2: Use poll_timeout_us (Jani N)
>     Add the reason, why this change is required (Ville)
> v3: Wake sink only for eDP
>     Remove the dpcd probe set to true/false in wake_sink (Imre)
>=20
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16654
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

I think this reply messed up something in patchwork have a look. Moreover i=
ts not building anymore.

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_dp.h |  1 +
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 025e906b63a9..38ea4aad74de 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4705,6 +4705,38 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp=
)
>  	intel_edp_set_data_override_rates(intel_dp);
>  }
>=20
> +/* Spec says to try for 3 times, its doubled to add the software overhea=
d */
> +#define AUX_CH_WAKE_RETRY	6
> +
> +void intel_dp_wake_sink(struct intel_dp *intel_dp) {

Should this be renamed to intel_edp_wake_sink now that its used only for eD=
P
Also I think this function can be made static now.

> +	u8 value =3D 0;
> +	int ret =3D 0;
> +
> +	/*
> +	 * Wake the sink device
> +	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing
> 0x02
> +	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it
> up
> +	 */
> +	ret =3D poll_timeout_us(ret =3D drm_dp_dpcd_readb(&intel_dp->aux,
> DP_SET_POWER, &value),

So we have recently switched from using drm_dp_dpcd_read/writeb to drm_dp_d=
pcd_read/write_byte I think you can have a look at usage and
Replace it with that function here.
Check https://lore.kernel.org/r/20250324-drm-rework-dpcd-access-v4-1-e80ff8=
9593df@oss.qualcomm.com to see what that was required.

Regards,
Suraj Kandpal

> +			      ret > 0,
> +			      1000, AUX_CH_WAKE_RETRY * 1000, true);
> +
> +	/*
> +	 * If sink is in D3 then it may not respond to the AUX tx so
> +	 * wake it up to D3_AUX_ON state
> +	 * If the above poll_timeout_us fails, try waking the sink.
> +	 */
> +	if (value =3D=3D DP_SET_POWER_D3 || ret < 0) {
> +		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1
> sec 2.3.1.2) */
> +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> +				   DP_SET_POWER_D0);
> +		fsleep(1000);
> +		drm_dp_dpcd_writeb(&intel_dp->aux, DP_SET_POWER,
> +				   DP_SET_POWER_D3_AUX_ON);
> +	}
> +}
> +
>  static bool
>  intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector
> *connector)  { @@ -4713,6 +4745,8 @@ intel_edp_init_dpcd(struct intel_dp
> *intel_dp, struct intel_connector *connector
>  	/* this function is meant to be called only once */
>  	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
>=20
> +	intel_dp_wake_sink(intel_dp);
> +
>  	if (drm_dp_read_dpcd_caps(&intel_dp->aux, intel_dp->dpcd) !=3D 0)
>  		return false;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index b0bbd5981f57..3f16077c0cc7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -232,6 +232,7 @@ bool intel_dp_dotclk_valid(struct intel_display
> *display,  bool intel_dp_joiner_candidate_valid(struct intel_connector
> *connector,
>  				     int hdisplay,
>  				     int num_joined_pipes);
> +void intel_dp_wake_sink(struct intel_dp *intel_dp);
>=20
>  #define for_each_joiner_candidate(__connector, __mode,
> __num_joined_pipes) \
>  	for ((__num_joined_pipes) =3D 1; (__num_joined_pipes) <=3D
> (I915_MAX_PIPES); (__num_joined_pipes)++) \
> --
> 2.25.1

