Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDA9C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 04:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9BB10E248;
	Wed, 13 Dec 2023 04:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1826E10E248
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 04:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702440845; x=1733976845;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=55jghtl8JcN3v7FO/jypAqFEkXrjLy8Q15Nu7IALDzA=;
 b=lnNcidEqvO3PmJrf+nq0DX9cnlZwiR+GIzuZ8DND7VsRbRFvlyW9sqDV
 +dscnp1julkR5G7P24h0N2ENDwQPpvMJbRoJKG+ZPaM9BEIzxK86GdRdU
 T/uvWSdCTxo1eWUd1XZ+do9qE7grmtwscDxiL27dOr5ce1IXze8w66Ghi
 2dLnpQwYL2iQg0B2WK1je539P2L393YE4IQ81lWxoDK+5YctoMS9cWpIU
 UagY/IP3Nf7pHvlnSXPCsjFKlkkiBrLo7A/zWUHCdnTBb3t+MDCkS3yZv
 IibLge7IdN9R7f3puxGgFFz1xPR4BvbOrGMFKDIFSI/3xGZRvVLRZnL5D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394660838"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="394660838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 20:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749966423"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="749966423"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 20:14:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 20:14:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 20:14:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 20:14:01 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 20:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeQL4X2NaRZp3i+tcA6e3mzuaEte6ULZ/VOIaYPiCyOTuleMt0zq5RuGXH3dcdREaURnkYT6wpUDplLRTBqEAIAhd200JeyAi7XJBfqu0Gn93YeIzRKbHokqLiOyEHSlgwurodSpLLDnWt0GhJTLEHsAWKA7NAhRJk5l1FGU3ytkPGB86rW9vZ4bDWsG+F3LO7BffdxnZmvTNsRKYLrTL33yxBxvNq1OObMQuBiLId4CdipoYHg6jXRXCt6DqbLKVR3b/qDzUIDklf6ZUtdDUK1YFqV7A8SLb5m2LuqmR61ASuOGbs5po8TuIWY7OUBlpXgzsdrzE4mcwBhYfDJxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag2TeA+Sn5/oRZjd25XroQicXKnp5y+lV9bwq0OxBAg=;
 b=UnwbLT7UNIrVTVw6eI6hxBBJ5+AIPeaSL8ARMPf7YGU89HxOLkmP/p4pEjDcs2rnADEegnG+KAm0/2pFcuPGBzFVPX8O8f0Qsuacdaa5HO8GCx+S8SyVUW1UijUwVlb5zCTwjZ45qr4Huvpworgn0r/39VGQwIxCpBHUu97H4Njfp2mgn6fuuR9n4RXIq5uXgrD9gWGZF7TKQCkHKh68SwR5aD8WECYy7roU86KphY/n9WhSUoHNnYhYtwR2amwwCS12T/haGsQRoq06gzlykRZzbrguLVfAsa8NfDtcpjobRl7SzWRQRdoXp2aS2fwRhVKqp5CGsU26X1ZbGUt+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Wed, 13 Dec 2023 04:13:59 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1944:44bf:d17a:a508]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1944:44bf:d17a:a508%6]) with mapi id 15.20.7068.031; Wed, 13 Dec 2023
 04:13:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Topic: [PATCH] drm/xe: Remove vram size info from sysfs
Thread-Index: AQHaLJEx2khPekE0FEWWPo7DPrY6Y7Cml9mg
Date: Wed, 13 Dec 2023 04:13:59 +0000
Message-ID: <SJ1PR11MB620471C7291527E350731CC0818DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM3PR11MB8670:EE_
x-ms-office365-filtering-correlation-id: 0ca72ffc-878e-4d31-afc2-08dbfb91eec6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /cYTgUCWYJ/DPYOhbrONJG7WrzM+hbVfnVfkMjGZQjB3qRHMuRfRCu20SFj+JSYzsE2BOZhYonJ0lT8Y0eYnuNCkwooQzS8IQd/aA6yN2xRj1gBYreDRJa6JanrDd80GEVu2XKwPDHw4YJX2uvRatJ5cUlX8lU8sGDM5Kowi3c3zJtKJHhk44XUqDzHcEUFa7AR/utu32IulsYJvNkoUgDh/J8vPfVPVVpVZXZOe6zHic7Ny86i/FQo5RMCGeTcWp40af6uZiAJrbPkB5tUeCWlHrm/KVx3pA/DdXMC2ABXxSI5qd8woBWeZTWWSUcUW4kAU2YXe/5yHs+5J+josXZ3ZiENaWRQkw0QbSbUsdeTJnOIg+W8l6C3VSuvuwynRY5TfGif1p5744Cw+MFFpwQDh3I1FPK++1ZIjEuaZeZ1yzavWq6BlHDKG48eyMSz80me5fydkBi7xqcNiBbBXI0XVyiRHYSxmSHzW5YuN6wUmj+QN/TCCUkQ40ptbqxZq9Uca7dwgW6Xf1GEza6baO+bAORm9hD5qZOUWlpR+66eyRWpxmeY6d9+Rfpb8yxjJqa5nPcXmnaKIHHaHamufHeu1QUA8bBvuJyjLxXlK+DiVHvmqj8VfojVDKRmzquJv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(55016003)(9686003)(7696005)(6506007)(71200400001)(107886003)(82960400001)(86362001)(33656002)(38070700009)(38100700002)(5660300002)(8936002)(8676002)(52536014)(4326008)(83380400001)(53546011)(122000001)(66476007)(66446008)(64756008)(54906003)(76116006)(66556008)(110136005)(66946007)(41300700001)(2906002)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?auMfY82X41rRMiGqCq8kpCnuisIWKspFb24yy+lPhDDtfNs24ahsi/lCsPOS?=
 =?us-ascii?Q?OIw6tldArK/Ha3YAOYcpkKx/e+3CSqfpvHTl2Hh76dXjxS7SiYz/HsDlsUjp?=
 =?us-ascii?Q?Sm1d7Je9vLtBz9Mn/3ABrWDBwaDSsRGPvnSFUHU7mxHbEJdXzU8+oq9NjIO5?=
 =?us-ascii?Q?bpgfyO1zqj9VDL8Gi6KSKRyJTtL3cInM0HcISUQHHxWDLgGHK8AWAYPwmaLs?=
 =?us-ascii?Q?mRe+et5MdrDFDEzwVvr/QcKOuhLbGIo27+IxiC/aKKPmJFrfYBiDVxFZiK2D?=
 =?us-ascii?Q?miSLU4ogMoAKBGeRSXkN950bR496SW1EDeej0TJH6yPFwQ9AJQI+i6ULAKTS?=
 =?us-ascii?Q?B89w2RAkWIFiY2D0ydxjQSy1Yq1SFC3M/vTnNJmKL2SoxfsdXgKjsVoQueMu?=
 =?us-ascii?Q?AudpqpzW6a/pEpbbTC2NuV6F0hs9z6marYSTAXG5GDWX1oN33srE1jwt3EAX?=
 =?us-ascii?Q?cfC8kjRWMiGZp6V8ZNv/5bMVF0lSoy2cE5Y2Dyf45VCCzJMM8Q9PaoxAXGvj?=
 =?us-ascii?Q?gdWEPK8oOUc73FMaX5+JI2spqZqH4a4Q91RSWNxsUZea448Yrqdf93HT9K5H?=
 =?us-ascii?Q?9LxVO/PXUFm0/mPe5MB31gT4SBii+xK2bslKd/WKGDik8fTJD+Ufu7QZ/hGx?=
 =?us-ascii?Q?QV6oiNi+ZtJTYbkF6gRUcg2CbneMKiQ3N1eMbPc9giZzV6Pv7ZTkgp6I8SHe?=
 =?us-ascii?Q?P7jr6mZa5WREYuGwTaaUw3MP1i61jbW5eJe7Y9MjzW3RkfKueEeMXGl3bK3m?=
 =?us-ascii?Q?JP1A2UPtdr1nJ1RxE+3UJRzLug1P20LdS3PHyy3fqWGFz3sM/ykpLiV3sMsy?=
 =?us-ascii?Q?Db5PHZuCAKja8Mhq0/mXhmmYt1A/W7QWhh4aHb0zdoAJrTjOp3lOVJRSU8YD?=
 =?us-ascii?Q?+jxMGch4xdM+KJ9exz26QTUfSBiR8uvTaTiVHNf6+kDjvB7RxcdmDbP7G5Hl?=
 =?us-ascii?Q?wDuZyd0ins1/jYQ7pKZF+ADw2DuV0W2++J4EeeoFeX504x0TiVQHhxWtZc68?=
 =?us-ascii?Q?ylWLXqkPvhIpVJW1VnShwAbeZJxs2qgBAtn5UyLsLCQlU3KnCvXIaDvWKOn8?=
 =?us-ascii?Q?JI8Yt1LNUZSf0v18w4akdrgTL1sQABDirQgV4xhVt4+ztxzhgLfkx0ynJZfD?=
 =?us-ascii?Q?68HpYaRCUj5yignAFL007X3p/+dCHbN/F7AM6HK47n1isbJoMz8dQBLJjEhD?=
 =?us-ascii?Q?UN/7p6i9Wz/prsT+VzXFOsZIm7wIRTcsS/WsDGsNu5BnaeLjjh1QW99G3Vb/?=
 =?us-ascii?Q?F7UImHbzN7A5hvGFVoLOshrUTIdP80HGidWpo1itADngbkTbGT0d5QZzmOGd?=
 =?us-ascii?Q?7iSgWv9YDS+WynbqyJGuVj6Y7pNmGiNTJEOHSIj39vIsEC93l8/6prjVhSbw?=
 =?us-ascii?Q?vooztv0/O+V78DhGZQW5ljwMPnZ/YvjyDayVcCltLkHqWS7ZN2jFJzT1Q1Fv?=
 =?us-ascii?Q?jgBHOzt4H2FsOKX/Rqcy4srffY3TE6r+9C2pk4exO7KLNtwhfouQTDcjB58U?=
 =?us-ascii?Q?OiAQHw9icmcBFkTLKyS6xdQFl91jXr5n1CXJNBci8bHkQbySctHS9ebq/sqx?=
 =?us-ascii?Q?lvchzMV5WKQ3tN1VskgLi15A55DbXUtQFfI6MIdnwDOE0reJrpqt4WX7jUYf?=
 =?us-ascii?Q?xK6PjPEekjGsx++Y2LaJpPr9ekiq8O4EJnDZo4qmOCot?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca72ffc-878e-4d31-afc2-08dbfb91eec6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 04:13:59.7646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7PeY0OxBi0xLpjjfF3eelHU5ZSoiX9+yMgj3Q8MI1UhdtLElZVeWUtbRTB0FrHcxQrS3LIpuiho3X7nIxS0SUn4ikLLOJWSwL8Yrj/yWFrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodr=
igo
> Vivi
> Sent: Tuesday, December 12, 2023 5:51 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: [PATCH] drm/xe: Remove vram size info from sysfs
>=20
> This information is already part of the query IOCTL.
> Let's not duplicate it here in the sysfs.

This patch was on request from L0 as they wanted actual VRAM size including=
 reserved portion. We should check with UMD team if they require this sysfs=
 or not. I will check.

Tejas
>=20
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..0f8d3e7fce46 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -20,20 +20,6 @@ static const struct kobj_type xe_tile_sysfs_kobj_type =
=3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> -static ssize_t
> -physical_vram_size_bytes_show(struct device *kdev, struct device_attribu=
te
> *attr,
> -			      char *buf)
> -{
> -	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> -
> -	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
> -}
> -
> -static DEVICE_ATTR_RO(physical_vram_size_bytes);
> -
> -static const struct attribute *physical_memsize_attr =3D
> -	&dev_attr_physical_vram_size_bytes.attr;
> -
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_tile *tile =3D arg;
> @@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kt->base;
>=20
> -	if (IS_DGFX(xe) && xe->info.platform !=3D XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> -		drm_warn(&xe->drm,
> -			 "Sysfs creation to read addr_range per tile failed\n");
> -
>  	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> -	if (err) {
> +	if (err)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
> failed, err: %d\n",
>  			 __func__, err);
> -		return;
> -	}
>  }
> --
> 2.43.0

