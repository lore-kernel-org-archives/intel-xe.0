Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B28EC143A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 13:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777D310E7C7;
	Tue,  3 Mar 2026 13:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaO2Vse2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC8910E7C7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772543103; x=1804079103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dIa+fawzqS7gBvgrkNuG2ZwsBgFsG32wKzxDg8csE7Q=;
 b=OaO2Vse2YBe0Mgw5JgW3h83edSuzKadHaGpIouH+hrRMszyQzAAp7yel
 pNDFqpveDTCceSpjYLSw6VzK5o6Bnl2T9V3cDdA4q9axH+r2bQSnO+biX
 y99tvvP/T71iLaqBuiw51S7Oy5VZSkF1GQqHQFaiyei3Wvf7I1Hhe2V3a
 e9cwo/AhhVUEGSrSw3uMlJwYEJEIElaweDsk9BX17yk4Db0ZqDti0Xsy7
 uOR6LKpvV02lwPAbMxcQmktqGnfJNj8WMqMKq4UNaJRihiNVHANHhwQqf
 MeAlJBQrdq5cDEdfdkfVBJ2jsNFbHLoHhbTg/ezGsyDcNEW6PP5hBvIAV Q==;
X-CSE-ConnectionGUID: uTpiyR4WTB6CziiWFIaANg==
X-CSE-MsgGUID: 5TgtreLXQNu0f/gZLidUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73448912"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73448912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:05:02 -0800
X-CSE-ConnectionGUID: RdhNct02RtCGxT/l1eqMDQ==
X-CSE-MsgGUID: Fv2iAjWFRni7wm8hbKUBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215080221"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:05:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:05:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 05:05:01 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:05:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB/cb7xbtXkhg+hOqqAY8NldB/96Rj9a17rDOEJmv2E6CNcMfTGlE+2tRFQUr5j2pL29YU6QzPcz0sW59HgIb9FWLnjFzQ3aEiff+IeHh2+O1oydnuBPOSwcwLreDqZG03VvegVsNcKy+KV3TDs58SMWLYsDFk1rMMgCADW/TdxY5ITcItabVxdJryk50xdipykkgq/k2KSMnmKdEfL6a7y/ovSRnbdcUXCBEYdjCuTSUm1g/8wnIagFzQFWCMCFWWkkJtzvsgzrYACdhICvHnewBKBt6GyHKKJzsWYpA7K/YPtLHNZIHMbznrjbTb0yP2tS8RzJSTXiO7p5NKpOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEzlFlOSHhDjolXDcIEtaPvZ0vzXos5f1TF2SriPSt0=;
 b=PKzvQX/Kylup8wPjCNZ7DFKPqrSq+/iT38SbN3j8ljvwWBkoctVEKiHV0eCuZmGpVuK6PJPsznNwqOCtHqtsYqo6jBpTFdt/4Qqa98A7UxNF4ZpjYBJ6rE1R+li+SwtIW91tRi3TaNtiLktdw5onrGepu3AssHmYy6MoTqsE9zfSJoJF3fFIDQLNKtAQERrbHz+Q13fP3RGObKWyaDPYUobhWtHmb5616wd7QmAA+D+O/GakysP/uBhTyZkxp1b7q1VD4jlcBWOk0GXmDqX8K93kKVKX0N4b3kCTulfXaeu9XRXx+VcwxsWMm4hSMxJASCDl2UJCJWIunBmU5GdslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 3 Mar
 2026 13:04:56 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 13:04:56 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add Wa_14026578760
Thread-Topic: [PATCH v2] drm/xe: Add Wa_14026578760
Thread-Index: AQHcqf+/oxzOS1mkvkWJfWt9eVJ2J7Wcx/yA
Date: Tue, 3 Mar 2026 13:04:56 +0000
Message-ID: <SJ1PR11MB6204E511401990FE42D3AC44817FA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260302044738.2936976-1-varun.gupta@intel.com>
In-Reply-To: <20260302044738.2936976-1-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|BL1PR11MB5956:EE_
x-ms-office365-filtering-correlation-id: 7bb6cefd-d3b9-4350-44c5-08de792577c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: M7qK0TG8ZOegCyyC9gx9RsVmpMrtfG4lQvHRwU2B+8NfI6U5lojr32uWcUI4RSDmqpKm12QCsQqtXfTQ8M11lksjhMu4xu/+gb7oANZTTHUyvwGg+z4OqFucJorRFVh6B5f8lEbCqFmG85mT4H7vuOMXXGXUdXWlCtTBnT2L7x5Di61pf1vz/OPvr040z44DvMxlXDYIuK05wflWuOLuORpO1a1G6C1UVJ06Z9dFfhv+D/T5FGYHkaIgNUA1d/CypV/XZ/huKR6WzXaCr6S3hTSAPklSFckeZE7psmWV6Gp3dcTi7SDsdr8tKvI/n27PBxhG+ThLldUDhlPuhV1gTqOoLv8Y7ubSDkCkCe82YSe8tm70dHFB5FtXdyekbF8++CQtMdexiFYU5KJGNm6npBSzFlI+X/rhDpeKYUMwGofYnKy7rP5rZqIRWBwspoBq1vcFIVX59MXUsU0EQexPzBRD639q9QzKazOmT9nZP365l69CwvHd0850uiQNBLOVyDyg2OzM0m2r6+3Z4a6th7bcrhdLVcOOKdZbPRTk0m3STLKXRsZReGogk/rLhVm6/LsIrlkKg+L+Bm/aFmKeEOV9/fifzi9Hz07EzaVvTfM+R3QOWzwpfs7Ve42LHeVWAQmikf1S2+wr1mIKGSmtggDz39zEMLNtJjUNmUdi2pIUz526hl69E5k73McaLrhpk7O4nG4nopZ2Qa66hN7svbxi7JRq29bb3EH1Js/MA+f8qK5PAQgpvbroqqktjItyNaUcWNaBl1bjyMzQe7PBF166OoChVcSqrBatdC0A0Ds=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KCBp8hRZoP6YXn5FQI5YNEJm5t6Lld+Pv9hq2QareDD9a30ysmzFBxqs7jQ1?=
 =?us-ascii?Q?1pZvNOV9dBTMiCs2TwRBsIQNnn0FMW9lWwMxf8iuJjk4QQ5tFt5OxZ3M29my?=
 =?us-ascii?Q?rKm0whcgG4B0k8JEgeqyV0vrGsq+T52IeiYzTfbPteTvTcYpUFg1spjko/3k?=
 =?us-ascii?Q?6Hv+nrZ6rpi7R5Fin1iKz6ZLu+0gg6GvunxDqdcjyQ4yZ6tVeR9IYqKsvyx0?=
 =?us-ascii?Q?1YUXN6WsLw2VRfzsOG183AQ1/vtnstT8BPMwHWPlYa1kb6V4ww0eTvwTQOuL?=
 =?us-ascii?Q?k1cUhM/pSR6dpZlC6cHV9NeGHYUegWgtwt328TDANy7tW6ExqZb3MCIOOE3s?=
 =?us-ascii?Q?tHA2ZDgf1E8kb3CLkWdAOAR5CUz1aWDVrfiwY4qeIHJsJX7UZQW6gpv+/86x?=
 =?us-ascii?Q?tvZaW8UxX0EDpCDsK8t1lUAnKiCuQo4xVlsG76WWz8mCYL5BDlAe9qejMmRQ?=
 =?us-ascii?Q?RNomTshh3RjVf2zZZXH44DT/CHuYQrPc721VWAvLcThX/+ceOuZgLkVaSL/M?=
 =?us-ascii?Q?cxDKj9mMr3MeOnRw+VlIJ8AKxp2do5poS0A/lqyXASFmMharNpRtSGFXuOy2?=
 =?us-ascii?Q?Ir46/HtSgepJ+J3Z28Kya7ZHqt2rSubuHphEd0dhGkODEQmBN5eJi/NxKrXF?=
 =?us-ascii?Q?WJFW+Qj6gWMZx2nTG78lPx5RSkx28+XEpaJ2t7xD0/tI3rtEAI/ZIqhjXgL/?=
 =?us-ascii?Q?Bdxdv57Z5DqfcbZRd7Z+kfiew14n9WlnfoLaWDw9PeVcl7fJRDrMJUWCKAPS?=
 =?us-ascii?Q?yfMVvhg4UecEoFIJcI4aVW8SaZ7Q3AtwDIw8D3FJJjGYxqLZesGATNZVxd6O?=
 =?us-ascii?Q?C0gGGWOqmcw0BZModJLGMhCyqQnKQxByHm/6/YVF/hy+sea1FxMFy52ihzE0?=
 =?us-ascii?Q?A4j8iZ5ky1TINDG7LNLqQEbdEA+6IclTZng364ORZzGImC7gZl9EuHPcRTcT?=
 =?us-ascii?Q?+EzrMN5DmKSwBN5/X/K9EwikNvWaacb2bsjS32vSefz3Tp7oJcbuCsPakDVC?=
 =?us-ascii?Q?2P1XbOoaVLu/3SDlngJRFBa2/D7FMrOfDdPhX+bKUjQUpk+QdHU3B5zgg+Tl?=
 =?us-ascii?Q?yIttwhI3PXYJlK3NE6RvBMSvYVrjc6NE5iHCRw0C0ihOEX98daGgOucleL8T?=
 =?us-ascii?Q?PagAG3ZH1tfYt/mwp9I6AOEWI07vCAdMHiUfPqRfhvA6bm4w/W+4x4JiJEMT?=
 =?us-ascii?Q?AEeLjknyDDE8sFMnamoMSQr/rVvOJHj+2TqZiwBuB47aZGmfompxfS3ywHoY?=
 =?us-ascii?Q?pl8uGMx5zmpntsNhwTTk0ug1aPs8cEX22Rewpx9+xhShG+n3FJlQsYMT2JID?=
 =?us-ascii?Q?9DuuKJlKtCUYyHnDwtPZLFWNPDt8GFrVVKKQeeaF5twDEU56hSxQT5Wg4zGY?=
 =?us-ascii?Q?aoed4mvG1UGov6tZDRQU/IgVsTmTZOb7rREa1V8bnABPRjVzjwTDu7WqRhYD?=
 =?us-ascii?Q?3ExubrM4Qp07W/ttLQogarWEMhDnO1ecKZ72Zn865yZN6Qh1cyw7+W9kuSfV?=
 =?us-ascii?Q?Epthb+i+s3FTmNkFKefBlU4VwDUIDqcbU6GUDK5p9hCBaSPPczGcKkOfpCwu?=
 =?us-ascii?Q?Er0wvpJaqu5dX+ijmszI26+Ey4ozgSUgcrD0tqaeNYDPYwWvE1PxzHyIRmLw?=
 =?us-ascii?Q?wz5fEJqpo3g+eSRVZV+XAtJHrUkf35ZgazsguAcNrBxPZnB+5rFm+HnyqitS?=
 =?us-ascii?Q?YA4p9VSBNWpFCsyl5U1hgVvivj7Q7KoNFio5YDeenAL8N9wkpnRjX2iFl1vi?=
 =?us-ascii?Q?wzMjGvaHeg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb6cefd-d3b9-4350-44c5-08de792577c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 13:04:56.2851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ti5aJnXfIqnu+8bOGNG9/xoIDpWWSymwXdmdkXyC+WO8p1pDZsya5hBZhOedJpsU1OkXz0O1agLZRsrkar3/3I28IMOmsdyiG6Vp+5BVP14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 02 March 2026 10:18
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v2] drm/xe: Add Wa_14026578760
>=20
> Add GT workaround Wa_14026578760 for graphics versions 35.10, 35.11
> and media version 35.03.
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
> v2:
>  - Fix register define ordering (Matt Roper)
>  - Broaden workaround scope to cover graphics 35.10, 35.11 and media
>    35.03 per workaround database (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..c70dbf7e4e7c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -100,6 +100,9 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>=20
> +#define GAMSTLB_CTRL
> 	XE_REG_MCR(0x477c)
> +#define   DIS_PEND_GPA_LINK			REG_BIT(13)
> +
>  #define GAMSTLB_CTRL2
> 	XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 26950b8a7543..dc780368c452 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -164,6 +164,11 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  		       MEDIA_VERSION_RANGE(1301, 3500)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN,
> DISABLE_SIGNALING_ENGINES))
>  	},
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511), OR,
> +		       MEDIA_VERSION(3503)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL, DIS_PEND_GPA_LINK))

For media, you need to use register offset starting 0x38_. Currently it is =
pointing graphics only.

Tejas
> +	},
>=20
>  	/* DG1 */
>=20
> --
> 2.43.0

