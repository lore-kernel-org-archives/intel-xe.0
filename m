Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED2C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 11:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DD810E6E0;
	Wed,  6 Dec 2023 11:54:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1484110E6E0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701863638; x=1733399638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/IrBSvtak4va4NMuaPstn2YGY7M2zG+Rf8lUlyq9Leo=;
 b=BB3vYiyL5Biip8HvfV8Jp7q1H4uyhKevn0wJQchi7tsR3NzXLmqL+Cqc
 rVbBBY7js+weY7yOuS4DlH5Ya3cCn/NMeWtrw6NW1m8IB9+iOV1QQZ0Y1
 mPLbhT+m7/ulUIqn5ukT41lhPdgYdSmy08Vh96vPV3PHTziNMy4eou/y7
 Kb/+cZ/cGYVeRaGbU43zhZOc3ZaLmCn0ih2eBQxNcTqfQC1dLb/atcfnv
 Xa94HqMAOFKMjqE0VVQObMfXQmbq081yOOudxQFPz7yUzWxk9h9mZ7Mt4
 WK/Gt0EV4tho4jgY8wdwpH1OqPhUmPmPhk6LLOP+ODHWiNeRF1G57m4C7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7400410"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="7400410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="915162095"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="915162095"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 03:53:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 03:53:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 03:53:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 03:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYjftdEeG5IwL1Lc7qpuyQ3CXg0F5zG0pR4vw4V+lJ28VABAsofVisBiP5KfL5P1/pMhnN9oIhpWszctpxUmxLjbI4vIN6ErfNSrdPzuGMuaReknxkiL5dlsnQyMM5nO78PVcrRCye85KCpGPyxElTRk0X3+1uKa9LNtZLq9ZtiF6pXmCf6xg1sN+ziVFEJJyE81kGarK2vBE5J7rw2aG5WsVB5k/QFfQKG9gZ0ORTNjPTkIffYdJJV35EgQJ3Zee90iD+lq+6mBAFcSO1akwmbVnQX1dNzd0FvdHR+Rvr6dINQVKx3vi2R2XhvtMyWZX8acf58KS0FyY/Au8NRe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgcWL5mxJgSxqj8RIo8YIFQqUHkT4+ueAF9ParIdAdk=;
 b=YI6EEwllHPtE3kYKpaw6KOSqbzATH8EEfgQBHK+LBE9XdieCBRX0hK0viOkGqf9YGbwwc/AZdr9ZVXMrELXwpnFL2MFLAacWxoJmyo3LYbV4DR7Xj8ALMJo7/PDKheWTlt5VQNywieZmLKC9QwMtZJMb/t9J7P+qiK2EXGRpdQ3bCg1minIa8IkNn2/OADp2SFQL88c6fCDySfIUqeGvlo3d61HKrZp7z2cxFHhjoskDTikUPbK2KXBUYAEj9nBRHkf08voPU1wU6w3VN9kepav0bWe4G/HDnrnetrCbZpeQ7Bt7EsurxrCWK49chhd9lr8jygC2o4zadm2gNMiNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:53:47 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::a226:f114:4de2:5762%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 11:53:47 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaJ/1jO1rxrLgPNEe2077hXrJawLCcIWAg
Date: Wed, 6 Dec 2023 11:53:47 +0000
Message-ID: <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM6PR11MB4532:EE_
x-ms-office365-filtering-correlation-id: 5cb1a3c3-d4d7-4c03-7116-08dbf652019e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Com+SfQbES0slZtbLz6gnblOvRW7XjFfMgmaMzhPboVoOkttUzDEpHx6KrwnPJh4CykBGqyluPEOnsueqtBTKamrRbtHzMugDTr2ZZX2QNsZpjCGtVO3XsqIABgc/cvxk/sMYQgZbe93DLHTExvJIYuucaFe/fJkbz+M91FMxlNASW2Vj4kwaou9It8pET2OMDGIY2kEgL4JUvsIkaf1SffqxmmAM9XbPrKkt/dZ3eZZ0PaBIHTajlYHgVZgmaZJJcrrNHFkD1/hDR64Oy1BmlcFDfhcEM/Rc4aShi8SGAc7OhYB8alwx3G6zyApKxfp99vi/T31oSZkn+GTBVG+r6V19W99v4c1Yphdmo7oOgXidyxOwuExfefUkTipdNsbTc6+GCZk+JXHN/uwuHUkb4UAA0vVbaHYA8XiEqFHg//EO8/hNEjpc+G+AXg+VnRz+74VEIkgt85ItvY2fm+419OiAdlmeFL5br8j6THC2FM5sH0wtMTOlykIxnbqkMQwHkOkT7j5kfZAZTzplNg7ioacrVGD9J5tbIzErSNrtheu88HIP2RVT4A6Q5N0NGLeSUHULqgOc1jZDoN0uV50eAInVKPskdrnMhXlYz6HSpbL+V/LJ3VUoghj9YBSESk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38070700009)(33656002)(82960400001)(2906002)(86362001)(26005)(55016003)(83380400001)(122000001)(38100700002)(5660300002)(7696005)(9686003)(478600001)(6506007)(71200400001)(107886003)(8936002)(8676002)(52536014)(4326008)(41300700001)(53546011)(76116006)(54906003)(110136005)(64756008)(66476007)(316002)(66946007)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yvM6kpnUTvTRVNX1VuLllByyb91b8yny207QCl3pk3NPTD4QX5QMQQ6dSy45?=
 =?us-ascii?Q?A5d0+0HQx/8bu9iASi+FAjYETnrj6RrbgMnLL/WDgjPhw/akPQC+fClpajRi?=
 =?us-ascii?Q?rKDIvyliuC41ucVHcSP4Rt2+/19TaRsJ94CcgIBacizgWV4nxJ7UqdkqFzeo?=
 =?us-ascii?Q?Sml3txHqCQpPrSiyR1gUh85DlkOpQHM5aXysrr5rNJI5I/xKTYITOOOgVJKz?=
 =?us-ascii?Q?t08p4DDaubULlv3e0IXqlqHZLPdYXOS+uCbQGOnUasgaVqHdWkpwJj3XLxqj?=
 =?us-ascii?Q?IRCKgwOsJ7RHmqJFd6Tr38gaLtDAZYtmyWrVSig3TqvjxizbfDWYbr0458QJ?=
 =?us-ascii?Q?4JRTD/kYsOCzAlSEil0atIlKc7Oot3YBA1e9wj+mndFWz/TynhUOcbZMUDKg?=
 =?us-ascii?Q?p9/hON+S7xsZ5966MSBMsqffdO23wuHR1ajNQXE/ZH4DiDPHNoB3kD4rGPLG?=
 =?us-ascii?Q?X5Owhk+3wxAXSH/VpIG9ELqWuVoWLHTXmoNIKxdTf61XH8HwAxrZTZOi/qYv?=
 =?us-ascii?Q?wA16MOZ6cHqfmg3tkBbxZpy4JOw1hCkYRtuqT7i8bxA7eMeLrHmTbBm+ighU?=
 =?us-ascii?Q?wvxCo4HY/VIgbw7AFTpTTtVgQqt62az5FWVmUAMTWuFjwq/47DcY86qoLLX1?=
 =?us-ascii?Q?MSj0YqtyVw1RI6AmI/W3+/IU9PX2b3jdA2Bj9WoeyoqixMduHp/OClnFpDxg?=
 =?us-ascii?Q?6zBB0eVtZDmPAYs8UFhT67P1s9yb3MNuHflpyqMada7Qv98XfxDhr0UF6hjF?=
 =?us-ascii?Q?QymKx5yeLidbexLwTOHW+v/1m6dXKX8uuWi+SHTCqQzpXBv6O6GlkapP3M+8?=
 =?us-ascii?Q?fUVX3fOqYfK63R3rVTa1By60A8DMxsHm4IyOJd3VH8BR3/7Q2wa/0TimH2dU?=
 =?us-ascii?Q?fooD7RT8+twG0992wE4sta07TUlGUoOqC6CDW83qkQCK5FtF4/1VEoiqjSYP?=
 =?us-ascii?Q?XEEM86IhQRVQsYx+yAAAUc6zl9UlJRUt077K6gj2U2NFNIsFEY2dy84UIVzt?=
 =?us-ascii?Q?KZT9qfPf9wygeNKIQR8peVW0/pUfLr3b9COgT3vTdSbl4d8aI6fwyyHO/onQ?=
 =?us-ascii?Q?A7T2qaR25dewQZU2X6Tp2d1/SGe1ngC+SCF1Vd7VvpDQZyZVXLoWLNa0HqFH?=
 =?us-ascii?Q?5+XwaoCsqFe4/j1Uo9YNmpw3W7Tbk0Dpz6m7+Nx/4CiFBiLVoNanNH0dk6j9?=
 =?us-ascii?Q?O9aeWRY4zQ8SBcWdZdX/iSYZB/8jFHfG7/X0aPyiRSDPiMGEaO65sDisS2WO?=
 =?us-ascii?Q?cyifkGgAzt1sYSxOdom7ZKKHuZ8d6tkfFHBVs/VZ7J9+RfMDF/s7PRLzkS+J?=
 =?us-ascii?Q?iHS3XPg1aRgA7/c4gYx9Qom1irKBIi1pBrJpT5U2lS2d2CCVdxQ9Mzp/Sxvd?=
 =?us-ascii?Q?mLfpLCWVvmajnPWI6ElXGUbMONbl8NsOnz/K2+b1AWqji2sFwdumpzLL+FbZ?=
 =?us-ascii?Q?yQm447UHR0AMEQsLcuscO+kKOt0CP3x9SqisYiuqH0yPEZlT2F99b4xT9+B2?=
 =?us-ascii?Q?mTS285u38ukqtLBltwUFg8hm+5pOLzP0aKrdNYex3Hyaox16vtQWdUIylq8e?=
 =?us-ascii?Q?eK29PkHxVApzvJEezEkPPw7602/oKlQb0eVxfaIh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb1a3c3-d4d7-4c03-7116-08dbf652019e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 11:53:47.7811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzTSqbrkWZmq3M7RH/MHw0G3er4neNEAGdhNL+xHcBIfgn+7z66JlH/R+Y22CSnF3wLf72e6wIPJvz3gDlq+bsVwLV1bLtRcN/cwX02hj2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Suja=
ritha
> Sundaresan
> Sent: Wednesday, December 6, 2023 10:18 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under til=
e
>=20
> Add a new memory directory under /device/tile<n> and move physical_vram_s=
ize
> attribute to the new directory.
>=20
> New hierarchy:
>=20
> /device/tile<n>/memory/physical_vram_size_bytes
>=20
> v2: Fix heading typo (Riana)
>     Fix cleanup error on unload/reload cycle
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..e8ce4d9270e6 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -24,7 +24,8 @@ static ssize_t
>  physical_vram_size_bytes_show(struct device *kdev, struct device_attribu=
te
> *attr,
>  			      char *buf)
>  {
> -	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> +	struct kobject *kobj =3D &kdev->kobj;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);
>=20
>  	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
>  }
> @@ -38,7 +39,7 @@ static void tile_sysfs_fini(struct drm_device *drm, voi=
d
> *arg)  {
>  	struct xe_tile *tile =3D arg;
>=20
> -	kobject_put(tile->sysfs);
> +	kobject_del(tile->sysfs);
Why kobekct_del instead of kobject_put?
Thanks,
Anshuman Gupta.
>  }
>=20
>  void xe_tile_sysfs_init(struct xe_tile *tile) @@ -46,6 +47,7 @@ void
> xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct device *dev =3D xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>=20
>  	kt =3D kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,8 +66,15 @@ void
> xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kt->base;
>=20
> +	kobj =3D kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
> ENOMEM);
> +		return;
> +	}
> +
>  	if (IS_DGFX(xe) && xe->info.platform !=3D XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> +	    sysfs_create_file(kobj, physical_memsize_attr))
>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>=20
> --
> 2.25.1

