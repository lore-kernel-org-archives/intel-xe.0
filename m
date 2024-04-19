Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A15C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 20:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161F1120D9;
	Fri, 19 Apr 2024 20:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMCDc5Bw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F53B1120D9
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713558293; x=1745094293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hw60H0Ol4IscqatkLZXUy4vpkFfDTEsBFAZZCY1XSo4=;
 b=IMCDc5BweiqzLDHsANTuWFjwlQp5EswBxKIZrQTeLm+ijyNJGPsXtw/D
 bJZ5uWd1iyoopnUUggCOO9npTK+ZF5yq3sBvLeAHaRAoJT2Us+op/FUgi
 SFzuTzW8Ys2YvwBGj1isuH+FFYFy7T6IvJfScM0XSbBkFbM3JdtXetEdG
 Q+5JPWW8MLC8j4l9VFUFVlRYvK0PaIBuKGfW1wlFCFD9WOpXjzP0ryOIg
 9ce0GXhiMpXjY9QmRYSd4MQRrABcHwNMXF6/xZAsqQtvRm4s2SFJS1sHA
 LdD3/NbyunHaVLw6rzu4+rCwOJ+QwdExSSDXwgtTDkFVpBG9lL9uEn0FH g==;
X-CSE-ConnectionGUID: 9roZKIhDTeGHGlSXaXBGfQ==
X-CSE-MsgGUID: ZAPYIva5Seafe+nP+QS+YQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="13018711"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="13018711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 13:24:52 -0700
X-CSE-ConnectionGUID: g+iWty/8THiugsg0zJX0jg==
X-CSE-MsgGUID: /ItniSKZTbuxoiALOJOdxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="46729912"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 13:24:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 13:24:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 13:24:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 13:24:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAl84LbS8vi6uNXre8wScD6fvjizOxMElvEOz+qws/7mxYLBaRNudlEnToKpdwoO6HwF7L/+I4anvzMtZVHkMWiqq9sbL9oGqQ9lRGmNjCk+MjCYP0RS5euAv3FdqKPauxd3UuBhc9OahwRhJU/VE9Mmyy4p+cyst6jlDoJFQEhiUSDZgQUbDpsNxvF5N62oYY8ZV9xd6A57bylCanNWYI965WqKCIO25IEyvNsksDwAC9xmPQRWLTG5uCuUeVa9c4+Ms39UGNTwSKqRmsJr/WthH0LzWZj2hTRqq2tQs1lHGRWTupqwhAIZUsLXwiL1QGW2Q8Iv+TkAXF47PYpWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNYsvWgfY+L7h82w8uQ0CscHrV80UGz/9Ln7Mer/osY=;
 b=QNu6aL5WNsTk5q2fwCoRUmbhoGjMBrlBIF+zkP3X0YuwxoTc7/qMyL6nLd5XQtdYhr3QmrkJOdFgrzRNdrzWoAvf2FYa+XYYnEV+LpuhEyvq8xOziHMgQ6udUQzpnBujliI9tXgHU5olm2z7CrS9SdVbhEJk3BqYJenmnkjjm+eob8fLAEu7+i1Ys+o5tnnNICp7TT3xs0eD0k+O4z/zMAuSdUpFkG2dbE5hYAbGtC8MsMxMtuoPDq8WsHklHWVc90eHMX857UGE6FKFfKJKujECTid4AKXjWukryPPmb7E38IVy/EmarqDVXUUUZ0+y3NDORP78XJzsqR+wh55Kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 19 Apr
 2024 20:24:47 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 20:24:47 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 5/7] drm/xe: Introduce has_device_atomics_on_smem
 device info
Thread-Topic: [PATCH v3 5/7] drm/xe: Introduce has_device_atomics_on_smem
 device info
Thread-Index: AQHaj0avghgciU7au0m0vR8FOzH6rrFwDsXA
Date: Fri, 19 Apr 2024 20:24:47 +0000
Message-ID: <SA1PR11MB69914276B111072228721025920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-6-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-6-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7204:EE_
x-ms-office365-filtering-correlation-id: faa33d76-1fb7-43f8-afaf-08dc60aec213
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OG4mVT3iupg5jEoqxHt5cPkfyJSw9PvobCTiW7+pkk0UBLBfBak8aeyj8ynX4bO+vanHSIx8ctMhEtjI3bhr99MTroLdQJNOu6SOIiuPdoHK0kJz9V4AWTTUaRRmrUTH10CyoUP078/osRgZJODAlawpAx3rC/S2k57I1+sMR1qtwGkGN5Fk0FF72+3zEmZi72X6SuHztTH1lOtih7VUJ1oeWU7D+b/AbwiUbalm7dGH5Wip0ky4nbyWJFAavrb+3S0qCijA0KompD2gTqomAPSuLM2shCUiPCBKlJeJ3/YthIkjiFgXNVVz1+qs+bTOynHtC70jSZKIA+BQupu6enEht7Zk7GtwKyKfqZrD35Qt3NzdbNb70e41bEsIq7Q5VhZzdx4bCIUlKPyq27EWjQvE2hir2sLTQtlOHWxINtTAdlMCD8i7ryPeUL7WDgzET8I0LyGgul4M33rMW2tnb9ZSZ41tfYG+PqUnykQJVFVH053uGFD9aEsPFGGz7o8m2G3hk9fVc6lJo2ho3tYmv3Fim7kcC4mDRyWn/oPTcm5HkiKuVbirbt61Qx9fSRKinhwWZLIz4m0sKAp4jj8hBLl6vfgpvG8W2T7iGGUG0ewE4E55byt4wVpp1b54P1Z/8/3b5gg2M8fK+xSB8TOi6dFQ9hs/1HE0Eo2BrjAvbwJNbme7ozZj6xSpuN1Kh0VdZCuEbfd9xKpl/xhroFtCaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rIwK2k0Wv4lS42dT+/6/l11fy/EG4wFE2iYw7kW+rZeiw4m1+NWMLeQBcHE0?=
 =?us-ascii?Q?xvNlxg92i4wxrF1IKi5m7sk6ub1aSS0hdB8tp9nRjeDJMH8DytOq7fhJbEBt?=
 =?us-ascii?Q?xRkWnQiyQzTDI9qC2SDRVszbxUl55F+3m3YgJQlGLSiIIxeRxHw0dLwc1GY3?=
 =?us-ascii?Q?QHuC4ZWEZjjcDaeSyCFCZXst/D9dMXMl6dQSfgBvMIsmhpS6SpcNXsWQV5Ob?=
 =?us-ascii?Q?KxOR799fwAdrZAl0FjDWdeDWEBN0jVDLKPnxMdquhCOb7INVCYqz9bXJLhsI?=
 =?us-ascii?Q?czka4zYBOsaK06WS0JDvl3E4pptMaYEsE1hLDP6udjj15KbEiLXJlBqak4TU?=
 =?us-ascii?Q?Nawhgwg+Qxyw6MqRmOxv99j9A8i582cVpYnsopl+ETQnT/r/W1bkbIgTn/RQ?=
 =?us-ascii?Q?zLbp+sCgnkZWHqA3NFtvUIKvSdXNI7Hh9HhTJJjTv5C0u2Ozgzf8eULNcX1/?=
 =?us-ascii?Q?jhZkE2CblZLM+ZjNb0djWJ2PA8X5YTRyqnlIofhroJLRg8+MHx24W//ajmpy?=
 =?us-ascii?Q?OSWIdaDKEepDJ4IHt+pEY9vaM1Qwz5lRmTxA7ARZ8E8zVutcbk9DA1ovf4QZ?=
 =?us-ascii?Q?/u/EmUyITc0r6A9gWU+TqSjTgjsG1UC68AH2CnJrlBiHmv/rMkSP/2Bxa6eE?=
 =?us-ascii?Q?6ie5/z+YxxqvdCjlwVLw6w8zsotgzeefjgx2Koq0ClIWSh5Rhb5jiCQPxJAS?=
 =?us-ascii?Q?sNQRUBRZNwJ7ZpWlRpL4YVzd4eEoF1oO3fIYxjnhzk70uUotrEfJe9k2ZUVd?=
 =?us-ascii?Q?p4hky0VuG6VR+8z3UND6ks0VlS3cPc8TmIrWVP+gAqOvKKQxXwP59gvfIWp0?=
 =?us-ascii?Q?8OgzAheqs9OtOB+DmfObaz+GwTZXn2mS+zA0+N9KvkIxC2ebzMU7Breqby95?=
 =?us-ascii?Q?Qg+VBbYuw6nFmbMorZZm37+FJ1qgp6S2p4q/0wBrB5sc1epvJoF3X6gGqO2m?=
 =?us-ascii?Q?Vp4aEup5UOkpihSJBycE+DCZ412vR7Hydkcit8jnZRFgvzi9hKAibZjR2eBl?=
 =?us-ascii?Q?u96ofD+/82dOVioi2taVpF5XHwKYr7bozSr1LMuyoTqODq6WMd9HB9Oh3Dkb?=
 =?us-ascii?Q?a5qFZy82PkTC93I9S9W+KWv2M4nEwb1Abh+DiNrvqTVn0q3l6XQ86Ohb+rWH?=
 =?us-ascii?Q?DZSCTBk5xe1IiU4QHQQZNpb0DOe/5kmB35epmE+afD7e6cMVX+zoBr5Zbchi?=
 =?us-ascii?Q?2EUhTFEy6lMYzTSK1NBaCva0+OHV9aypxwx7GevmDx+sc44HEtsZoaTNd20O?=
 =?us-ascii?Q?jmpQye0D/tNiUEtk8ZZPvNUdxOj4eZziy2U4/N9o1DZESCROcHGYSbAkY/Ec?=
 =?us-ascii?Q?s9WywOKBMNXGMJT234NP0CcvZS1fjM4ijJQUZH3LGr+WNMTUZjcLwTqC12V0?=
 =?us-ascii?Q?TklheqhdQ6HPeSgqEuuqj8Vibkdbrcb3bh/X19YuHiiZMR/+70hmGigNKTe/?=
 =?us-ascii?Q?mOW8zO+XA8mKwMUgeUwezDAVI3n23jNwN5hH6HdAvSbq8tAh4wtENdD6c4dH?=
 =?us-ascii?Q?Z2BMskedeoQ8emPBSD8pOGHV11i74qsrv/G1VFwQFc+fkfZRiCoGW1IBGLcn?=
 =?us-ascii?Q?xp+ggCjvXEtYvQtRoChr78U/Fmbv6PNWdx5FkDlX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa33d76-1fb7-43f8-afaf-08dc60aec213
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 20:24:47.5957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COKhPB7fTmEyb9wRmUE7Jh5oHQ0SWnRzoeo2JUldkz+IGqomlgNexFCgDQo1ODl1c5GXN/oh3NWyXt2hEfNb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
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

Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 5/7] drm/xe: Introduce has_device_atomics_on_smem
> device info
>=20
> Add has_device_atomics_on_smem to specify that a device
> supports device atomics on system memory. Currently XE2
> supports this so set this for XE2.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index bde42fe288ff..c06be1e00f1a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -283,6 +283,8 @@ struct xe_device {
>  		u8 skip_guc_pc:1;
>  		/** @info.has_atomic_enable_pte_bit: Device has atomic
> enable PTE bit */
>  		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_device_atomics_on_smem: Supports device
> atomics on SMEM */
> +		u8 has_device_atomics_on_smem:1;
>=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9cf45559b915..34eb4bbc2366 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -630,6 +630,8 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.vm_max_level =3D graphics_desc->vm_max_level;
>  	xe->info.has_asid =3D graphics_desc->has_asid;
>  	xe->info.has_atomic_enable_pte_bit =3D graphics_desc-
> >has_atomic_enable_pte_bit;
> +	if (GRAPHICS_VER(xe) >=3D 20)
> +		xe->info.has_device_atomics_on_smem =3D 1;
>  	xe->info.has_flat_ccs =3D graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation =3D graphics_desc-
> >has_range_tlb_invalidation;
>  	xe->info.has_usm =3D graphics_desc->has_usm;
> --
> 2.42.0

