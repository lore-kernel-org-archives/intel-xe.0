Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052CC83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 05:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E39D10E4B5;
	Wed, 30 Aug 2023 05:14:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5564410E4B5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 05:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693372461; x=1724908461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dV+8YZWBXt1E0jTGaA5GnuwJO4pnIgMcXiHJ7tOqy/s=;
 b=VtY/QAQqnWQHIMft3hOZn9Q9E3MhGCvi8WljW0h4wZ/D/IUpf+4Z7nG/
 w+EmChYpV6bdLmTLoKeiGUHxGNXOWxbSFQFAvpU6bPGhwwfFSPUPmGlrt
 KpM4G1mouVgLvV8BqTVdyUx/51ZcT7TvKA99pAOl722/I2NvdyOUvE4DS
 lndpE8qrYKhOoLURelcXnC/TIC5crsTusx3j85J0IzhN9dk3p947z85eE
 tA1FjBc+LJ8APBgSrRp6cRhWKNScT38EFmWU5GyToa5+NlJgOyXfxI2Yf
 SZZ3xkaD3jeh6cCUdT4sPJ3/OtU8NZz+MiQV2H6tDrOSgizY6pxLRE3vk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406546147"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="406546147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 22:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742091234"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="742091234"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 22:14:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 22:14:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 22:14:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 22:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed9c8NDmj1kYgKseRHlJgQ22/ERlfqJuaL/8PyN5vYGZ3KxZeecsFwMdgrDXhiZIlwujomKjrOaOd3AvzQYM006KGu1n5MWRpxpwDKbv/UuzzAx8e0k6reqyI69DntzoOywZpfTb3IytK2g+ORz7+8pJ/TPIPPG+2m6Hb/mRPtYSI2a6JYLLK2vD0KXsTHZjDi5Uc0VBhOXTwoyul6fvRBJ2Q4AtdK7TuhTdTor/RW0CEjpL8/gtZyBxYZ2Y04+r0EsGFlW/ZFJpY6G+tHYqaS/9X3zc0yXWpMbJddWsl1MLDrrfnDiGKcayvOT/Xq/CJ1U7eWNaMTQ3B7q5NhSyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEXZQFwYSpZmQ2GL9JJ74OzjxLEp/4bpamYt2kieTSs=;
 b=kELRzsHExPElnhI4qL1nVEwOsqGNpC5Y3UaAv2JEqZSMfFt8oYRFulicLHYOwIAaO5/wcjNL4S4/+AN6Xm9lWkqc0aAkXBs0dr3wbQ87lSr6RWQDIVNTe/XoyveJkZkKE9H2/NEqJdkGIyoQuzzhjYDtQ61vpgF2qA5EdLTxf9+HAG8B6cO8fgYU6q832fxgZywBWCt2NRk6gfd5lNefSLWcyJKC9VSus1dXXhqDBzzbKZVXvEAhXe+XIn8GjNETLxiIf6kFpiq4KCqKIy47IP2Md96dqP3UpbcDK/u0jwYCbnIGktgCR6OaCCHQVDzF/mGlwK7yswmJm3HiZTEGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 05:14:12 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::a135:2fd5:e14a:ae87%7]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 05:14:12 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>
Thread-Topic: [RFC 3/5] drm/xe: move pat_table into device info
Thread-Index: AQHZ2pYP9gEzCu8b20WkkEI4yhwuKrACS9Ug
Date: Wed, 30 Aug 2023 05:14:12 +0000
Message-ID: <PH0PR11MB5782AF5C7B8A67E4C3226DD382E6A@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
In-Reply-To: <20230829162840.73444-10-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|CY8PR11MB7107:EE_
x-ms-office365-filtering-correlation-id: d8f4b737-78b7-4920-bac3-08dba917f2c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XN8A32ZR4rXB1xb3xybt4LSi9jTn8WtP3CjjoB5/Xke1OBbPEuRne6ug98jYJ5LRh6mMhwNlaGM+k/vvWKagdc+Lrg8GbUlKj0cTG0EhtbDudAu7o7M1Prghs3qpfNe8UzvF3p+Lqv2ap+8I4OY9vllYTrSBxLe9mhETlB90JZWNsIA/5gNvLYx99pX+i5M1J2YeARNpl4ndpiceIW95dKWGBJ6oSDnSMrzW1zIb+4+T0y/G+3oL6mte01W8rXfRRdZSxI+qgyJ8cEk5Q7wYCGETI1cNHTMHT/pSapIEKUyE0r5FrLWMfe2vFh+oeMopR0CjI13pVDuW9qUkZIcB4Z7YU4UA3je53DwNbJVoehaV6RafdTnq2MY+7M2tX1hoUwAy3AiC1TRKi6xHQspNSpTnU8LcAD8e+meFthKq2KSzti4PJyjZDPo69XtdN+r6fq1zRuKhVNApSoWKcfBW8zhUDmw17ClYR5UefGyOsY7JvbxaLW1sh1x0P+M01qKpSiHndSfmthooLbSHU/odjudRHmznhBedpke56jYGICFbX9MterM7f0CP/WGphvs9XXNTgjIvmEzh6bzOTnfpaXHVy2A7Ej+YJXFR56Bs8cy5FrGK1DWYt5H4qSTMFrhu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(186009)(1800799009)(451199024)(7696005)(71200400001)(9686003)(6506007)(4326008)(33656002)(86362001)(38100700002)(82960400001)(38070700005)(2906002)(122000001)(55016003)(76116006)(83380400001)(26005)(478600001)(53546011)(41300700001)(52536014)(66556008)(6862004)(8936002)(8676002)(5660300002)(66946007)(66476007)(54906003)(316002)(66446008)(6636002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ax76JjUGq91CkbaX3j4eOkfmvKAw398nA039BS5qhhbkTODZjuNMgpMtHR3i?=
 =?us-ascii?Q?vXH6eKNbxegMug5Kc2WASirIsHEbX8+D5Kf2rM+x3ikMPi+HXPlqXIiWx+F7?=
 =?us-ascii?Q?Cy6wUE4qGd3i4RTBzDq/8Vy61oPVKE6ZnRNqHSymYtoevCL7vZ4UgyIOKNY8?=
 =?us-ascii?Q?OzI421zWkEkZtj4VcI/RuPShqHUvAXTQbUYbxY8t9Q58WFCaZZ8koLJz3ASm?=
 =?us-ascii?Q?/wIukZYZpt9KBlrgSgb7Gkc8QZQy3s8RhT2ZRnm4I8SALLCJekK5H3CsOyya?=
 =?us-ascii?Q?XaGg2YHDlh1fOnAwxVTuNR22svajstFUx0sInEKBtdeUS2QQtntlVkZ/vYfg?=
 =?us-ascii?Q?r0H7/hAliI/0kmDD/OZsN4TmYfBd0y4azvpWULd6CQTjeWScSR/KpnUHDbSw?=
 =?us-ascii?Q?Sfjmm7ng8w13Vr0YIJEOWW8BGS3yLz1+RefE1kElctblwDMggUuYXNeqHXRV?=
 =?us-ascii?Q?qfYQomR3lFK3BUuhzAJ/vnszEEx5bkUnvIx3Ved6tC61xkABxxK57YzUotfC?=
 =?us-ascii?Q?l+IrtNn4tejMWk9GJqfcOugi1yzSE5XSq+QbUosvN1cYdc16WczhqhW5HYgP?=
 =?us-ascii?Q?ijeWeizB7lTTpbDjPB8rV+Q2PyvyqZlZ65dLHu2X9JGv18y6fs0VBG68EhJa?=
 =?us-ascii?Q?lZCEc70TcdIAkjY+9IdmYkhmbz5PsRZA+fGALn3eT1ePu4et2vMD5YkB6yTq?=
 =?us-ascii?Q?XQDr/C/FM4kxEgKrQHdw4VeuOC9trbppdiQwxXc5IrJP0mdKRg9KlT85Uxgx?=
 =?us-ascii?Q?ktxa8Rzmqpbz83HxjFSaMXEDsV6FAT2QAt2iMt5XZdBQGFBxfXYdacIlBJMr?=
 =?us-ascii?Q?5mJg9jzzvTJ1/kIVZMpY7jniljAXdGuSuBjFmpBtf1DXnDUyeqRkxQWsofhO?=
 =?us-ascii?Q?EgJYgUCAeZ0E3NjWKFK+6ztu0YgfOe822IFAZyxQDvJ3TPv84U0jo5A+MgL3?=
 =?us-ascii?Q?8isuiua4qgk07f2y4MwNtVlPFFMRNqrFWMt81aoURnj0dvccB38qh0ekZQVH?=
 =?us-ascii?Q?6Oti8Dv6202M8knW3xeHO6rwmQjDg/10SB5a86ESzjeQReRoU9LpA1o4KH1C?=
 =?us-ascii?Q?OU5bDUfNU70n6XbzjWn7Ce+ZQbvlK9knkcjwwpdBSmeqzbMvJLhRhRFwOs+/?=
 =?us-ascii?Q?U1Q6mI8Ap3hq3tXvMrKYdY2H41m2bh7oWGsceUOaJyalqRrullA+kXGV39dS?=
 =?us-ascii?Q?+UAODSj0y6n73Qswwa0WqPbxJ5sw/M82y8PtDlmjjSFQn1j2QkNUIzUAnlHa?=
 =?us-ascii?Q?LZRE/CWAb9/2E6SHwiA24XjgdYk300xxNJ+A2WJDqMqVSfSajj+o7NJhZhFx?=
 =?us-ascii?Q?1wWi3H5wLDSU8aVv3KuVOhaE9gL4F7U5m59EWIjkTpQZOI8vo7S/+EtU1mDh?=
 =?us-ascii?Q?qGMqFkYZFzpqj764A3cozs0JKT+lWaEL7CiLyBsLZ6ShHPh3iA88mdYDU9Da?=
 =?us-ascii?Q?nYLCaomBHDTot/cmpm+QhlhkXB7Zjl6W7iuWrbKjJoPtFc2VWwbf74inwKK5?=
 =?us-ascii?Q?CZs6SkUY+3Fec+DTLeBcwW13whbX749CiBC7jzjS1Cac4vU7s/vbOwdJIDno?=
 =?us-ascii?Q?PstvEVfsQTgwf/IWPQDpNrsEGyO4oCEu5evu05Ue?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f4b737-78b7-4920-bac3-08dba917f2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 05:14:12.5067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFGCgrudGI/Luffbo5SgObjGk7kNDECoWYivhdrFS/DhjadttVlEvdAK92LeZq3yyJIcJ9jjsVLlEG+QZ/z+Gf2zBd4oGSdo/LK5K8nJcd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: Tuesday, August 29, 2023 9:29 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Mishra, Pallavi <pallavi.mishra@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [RFC 3/5] drm/xe: move pat_table into device info
>=20
> We need to able to know the max pat_index range for a given platform, as =
well
> being able to lookup the pat_index for a given platform in upcoming vm_bi=
nd
> uapi, where userspace can directly provide the pat_index. Move the platfo=
rm
> definition of the pat_table into the device info with the idea of encodin=
g more
> information about each pat_index in a future patch.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_pat.h          |  3 ++-
>  drivers/gpu/drm/xe/xe_pci.c          |  6 +++++
>  4 files changed, 36 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 5037b8c180b8..06235da647bb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -238,6 +238,9 @@ struct xe_device {
>  		/** @enable_display: display enabled */
>  		u8 enable_display:1;
>=20
> +		const u32 *pat_table;
> +		int pat_table_n_entries;
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		const struct intel_display_device_info *display;
>  		struct intel_display_runtime_info display_runtime; diff --git
> a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
> a468655db956..f19f5d8dcd94 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt,
> const u32 table[], int n_entries)
>  	}
>  }
>=20
> -void xe_pat_init(struct xe_gt *gt)
> +int xe_pat_fill_info(struct xe_device *xe)
>  {
> -	struct xe_device *xe =3D gt_to_xe(gt);
> -
>  	if (xe->info.platform =3D=3D XE_METEORLAKE) {
> -		/*
> -		 * SAMedia register offsets are adjusted by the write methods
> -		 * and they target registers that are not MCR, while for normal
> -		 * GT they are MCR
> -		 */
> -		if (xe_gt_is_media_type(gt))
> -			program_pat(gt, mtl_pat_table,
> ARRAY_SIZE(mtl_pat_table));
> -		else
> -			program_pat_mcr(gt, mtl_pat_table,
> ARRAY_SIZE(mtl_pat_table));
> +		xe->info.pat_table =3D mtl_pat_table;
> +		xe->info.pat_table_n_entries =3D ARRAY_SIZE(mtl_pat_table);
>  	} else if (xe->info.platform =3D=3D XE_PVC || xe->info.platform =3D=3D =
XE_DG2)
> {
> -		program_pat_mcr(gt, pvc_pat_table,
> ARRAY_SIZE(pvc_pat_table));
> +		xe->info.pat_table =3D pvc_pat_table;
> +		xe->info.pat_table_n_entries =3D ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <=3D 1210) {
> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
> +		xe->info.pat_table =3D tgl_pat_table;
> +		xe->info.pat_table_n_entries =3D ARRAY_SIZE(tgl_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> @@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
>  		 */
>  		drm_err(&xe->drm, "Missing PAT table for platform with
> graphics version %d.%2d!\n",
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return -ENODEV;
>  	}
> +
> +	return 0;
> +}
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	/*
> +	 * SAMedia register offsets are adjusted by the write methods
> +	 * and they target registers that are not MCR, while for normal
> +	 * GT they are MCR.
> +	 */
> +	if (xe_gt_is_media_type(gt) || GRAPHICS_VERx100(xe) < 1255)
> +		program_pat(gt, xe->info.pat_table, xe-
> >info.pat_table_n_entries);
> +	else
> +		program_pat_mcr(gt, xe->info.pat_table,
> +xe->info.pat_table_n_entries);
>  }
>=20
>  void xe_pte_pat_init(struct xe_device *xe) diff --git
> a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h index
> 54022f591621..9ab059758ad1 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -26,8 +26,9 @@
>  #define XELPG_PAT_WB_CACHE_1_WAY       3
>=20
>  struct xe_gt;
> -extern struct xe_device *xe;
> +struct xe_device;
>=20
> +int xe_pat_fill_info(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  void xe_pte_pat_init(struct xe_device *xe);  unsigned int
> xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache); diff -=
-git
> a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
> 791107dec045..24f2021aae22 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -22,6 +22,7 @@
>  #include "xe_gt.h"
>  #include "xe_macros.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> @@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u8 id;
> +	int err;
>=20
>  	xe->info.platform =3D desc->platform;
>  	xe->info.subplatform =3D subplatform_desc ?
> @@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.enable_display =3D IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> &&
>  				  enable_display &&
>  				  desc->has_display;
> +
> +	err =3D xe_pat_fill_info(xe);
> +	if (err)
> +		return err;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> --
> 2.41.0
=20

