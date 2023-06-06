Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC828C7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 11:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5F610E32D;
	Tue,  6 Jun 2023 11:37:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47E10E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686051474; x=1717587474;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=d89WYKRICHF6lugEt5KADCYGrs7tTX86J4shaWld8II=;
 b=BKg+l2ipHRlPpV4YPE8deLEBBpFBpVTw6TWhMizF5dwNwDaOndQ+lezL
 uMjK3Hd0bJHlaWAPXVKagrNEpdNrS1wqExnpOaPErIWdAJUk5cjCwZqcS
 fc+Ophg4OKadT5ZpwnQmezWOohqpGi9xECf5DL9YO61lW8s5hOVxjnI7C
 y9i5gk/2AD/GXYPYAzR3WA1NXJDoi7gq4oug4q1sbGLJPmZiqeLtD/2Up
 bW8eubpofPxN1WR3a6T1UUfhaa763UangRnY8sY6f3pm9fTlv8vhKmwuC
 Jb76roAhISCXa33dDY1WODQfPOF5Fb+tYiz+PERCTCRmDECBeiKKf7RWe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="443022234"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="443022234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:37:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712177137"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="712177137"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2023 04:37:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 04:37:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 04:37:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 04:37:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtczJzDCzSouqt++E30Q4YNu7TlPW5DA40PlHpjg9js15nU6SoC4NKPf1lqXQRkSpqopJOZ8rJ58bPOUPPcwITuoBx8rMx2fIbJ3QQ3JqlQr+23AGKVJyLOpADhNF2ar1T2c0yiMUQLA6ohcQTlUBEfS02dIOkWKe15lq0IpMjL+H6L4S62ygiP1LWnIfBwNq9WTcx4RkFPC81VapkbekH4HG066P/89CMgeDlWiWsVpkcmLLAcUnwjriXmGyt7f2p1yxiF66mL7I5bjDn2I3waQHWPzObP1qIlFLK4CFPSaTu57pL5ZzrXhEwjMvBV0x4GR+QuDugdk4MJ0m+hDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ottpnQ633hx6n4qdkiO9xEDxs5S7V7zoKNRIuTg4kV0=;
 b=SrcPZa2oQpr4q6LvgqKBE2OC+jshrGnDA36/c40aL1VTW0a0mIFvjntkbagfPQXA+5nFKxyxthJTdodf/xQtwkcN23Vy7qewD1TUZXGkEk0+RQybKSoE7IjJO/iOyoQsFMIqG6fe69cLFNM9DiHVYVZ9Izo79J8nxuuBbGrLt21RKuuhyHI9O77A6Jc0D3grAmuE720XAhl0lFY+FGatPxOwnFJ2Zx/tlJtQJi2kHX6boLqQIqTLDZqKBlA12ssjNLxz5TT0DcTmjycrAdNO94zBbnYqWW+yWhi1tlJM9YKo2hafaCXd1znc3p3bjNAxwwlwSTZxqzqXDiOm+TBjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Tue, 6 Jun
 2023 11:37:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 11:37:21 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQ
Date: Tue, 6 Jun 2023 11:37:21 +0000
Message-ID: <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
In-Reply-To: <20230606111255.2072426-4-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|MW4PR11MB7055:EE_
x-ms-office365-filtering-correlation-id: 25a1a670-8f94-475d-cbb9-08db6682644d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GBSzvvonNBdC6Fmi0CWcpKKwz/zJk+/s7b5W4yisd849YU53Ua7T3iQRquCS/T1BNHC0ONHe1UIEHAYnQYjZ3LTtBTpzMJ4pvxljbfuW7xLS8B5/SNsKf/tDlBCXZIdUaJzivuDPr0E7Jw3l9362y7HrJnPwZxAyOso9HPS++Xtpv3g5s2Zzvzza6x1K/iF/XZH3bKmiDJWd2x7fmHgbpo9kk9ZUBvAye09kGBAAnmmQXiDKVmyuwNnJSPjTaM8gdebjh8IezOwAMTHsVu5aWz8IfwKt09Aj1GVu7C3d+fAbDpZm10fHuDs29ZFhDwZgi6CUzyZNoXQkJBHfk5NYpffMHWPSJNEPp7PompuVmHWHd8EhK/tthvaTYjqvPkM0DdM2lWLC4NQeOGOJJoCndC6gN/mNVzJFk3Toqlc4eHWgtEuDX6eziPOeLifDxIoxJLRSgbnYwBhPjtPQgdsRpBnzfiFjPTKXU4PMdo7P/zFoq4sXi5YRYNAAQcWLP6IEQLWV4FnEx50lo33rsl0cA7fScmome0GYr1KQQ9M4XGD7iUO5pi9DGvOUR0cWTNQ3B0ScvVkjrUyG+Vv9ybrVftGhrKyxXwHZ/zMcXP/YMeAiOoWPV4QYe7wvgO9Q7H8+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(86362001)(64756008)(316002)(33656002)(7696005)(66446008)(41300700001)(66946007)(66556008)(76116006)(66476007)(71200400001)(110136005)(478600001)(38070700005)(55016003)(26005)(5660300002)(2906002)(186003)(52536014)(83380400001)(122000001)(6506007)(8676002)(8936002)(82960400001)(9686003)(53546011)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X1OslkafKlP4sVgFjpqs3JLcfGOJerEREfrxqtQrGgATnHsWdzlof8PRkhs+?=
 =?us-ascii?Q?XZCODkKkLpV94UIfLxdjdeVmmbSpO5kTwP2fqbv0KjuzCngieWthLeKB3TBD?=
 =?us-ascii?Q?Ecudh8s0CHQ/KOcDmnIR0iWwDnz17VPoBDggZhJvpWJFTQmR9o83zFa7yaO2?=
 =?us-ascii?Q?OEUVzdm35TZ5vQ+aIA354dX3+203OSoQ27lkkEs5exYAD/y6xqZ0VgYSaRS6?=
 =?us-ascii?Q?U5irhtX7kWJ8f0JgLkqRvnf/MrgoEhafc4dcmX7pqkaJAiLejB1sc5iDVsMR?=
 =?us-ascii?Q?jVdqjr8yWmTjYNNwlRT418CeCJCywtNWYipfJl9/UI06D/yI+jzuCs1NIAmD?=
 =?us-ascii?Q?26o41JaHgc+MDkHKv6NUiyHNGOygUMghNp+oaMA7HWl1skOWFI8dl8s6nRo8?=
 =?us-ascii?Q?YimwbfqgydmgHaacyPMLrfr2w+EkWDYMzBL7dKiJv4RXTQ/Fa7El6sQ/av4V?=
 =?us-ascii?Q?wCF1ZfVAwg//8vfNYcm+J5vINUAqEewxwG/TS81vtLOuWkg1m6ctcpGEGgZ3?=
 =?us-ascii?Q?GyLjA4hgIZ6ACejc6MjBeZ7hjrwTV4GT8QHivoNBKXKYc2nV324/w4aW0/iH?=
 =?us-ascii?Q?uA760zFlA+dFQSM4RH5S6YszQ089VUNp5T7UbAJ0qATPbDh8eRWLTeiwHNt2?=
 =?us-ascii?Q?6Mm+XK8DhgKCXmjpwJlpghQJn19p2O+nHzxA7A6OzEqXtlaAoUS+Xr9A93La?=
 =?us-ascii?Q?MQi2oJWer+YGPWgc49ult3iwsVCeA4rzjtlrSClfPvrx+PM8getPxDyymDKS?=
 =?us-ascii?Q?3gB9liQEpmXDY9Q/ciZubKd1+oXQDvs3amToz1GWmhdi668aeAoJCSNu/73B?=
 =?us-ascii?Q?1zOiz6O8QATDuyJovsffn8hE7bdy8sMxGpgwSHN2P4CBzY7a4pS/c7dyppqB?=
 =?us-ascii?Q?RkGpeO3dFW75cvIaaJeW7UaImZ5dhKAabin2spZqVR0+ACxWnZ474+bNTQCS?=
 =?us-ascii?Q?Ox6kFT6sDkmTZ027qWES/IAJVjNEZzfWH7jQbq4l5anYebSKmXcZ3V2ymQga?=
 =?us-ascii?Q?IVdFXKCBCE8LYEms92nJmipD19dB4oB0UnteoJI2LfdUq3DBr2X/kmnMAdDq?=
 =?us-ascii?Q?ZPZYiymw5KnwNeWg4Y+nhgpYxjix0uOYI9Rz4m4HdesK5Lgk9XtE+Sj/rEA4?=
 =?us-ascii?Q?AqFlNqtMKkhZzDH2s7M+mKRmFqCOUFqBeS6zjXbUaXff69tT6Rg3oNXsF4W4?=
 =?us-ascii?Q?D2wqXUODXac6Rr5HhHBHi6cOb0/XJKoLVhHAx8xdoi2J74HnyWamesU99BzS?=
 =?us-ascii?Q?se3ygDb4V+V2kONuB+AsrbqCOGcWIEC+kW8MCXcYvclCVeLhoUuaML/UNdn0?=
 =?us-ascii?Q?SVDqm5aoIR2R4v+Pb1Eg0cjbp5bzIDuPiTSuQMGBY+ai5zl5NzkKO+Py//5I?=
 =?us-ascii?Q?t1EUaOLBewXp+RCisBK9hsKCkR0TT6wablwUXX+FsoITrXUhi+DPi730CHzZ?=
 =?us-ascii?Q?QSzpi0ur5gMhErV8XGLeJ5Nv1tTj+M+7CNG0O1HiLlGURA5tNPA8NpPUsp02?=
 =?us-ascii?Q?BGSWhWCOrB5EbXxRqOrA88L0o8dg1caoqL+pBHoS+qdzWXMaOyGttKSiy64U?=
 =?us-ascii?Q?eh2L66vF7VsQuWZEAiyxF9t+j2bof2pceRfWOY4DkoIDh+zdTAABfHyrQDXn?=
 =?us-ascii?Q?ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a1a670-8f94-475d-cbb9-08db6682644d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 11:37:21.7358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzJh/NsykvEf8VpLDN9kD/n9+jX8+C8ZZ9G6yD0prbkhCM1AFn5edU1PXieWihyxGhs8VvO6XKfscATCYcN1btwdT5Ej8fCwdXi0GAQkDb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Teja=
s
> Upadhyay
> Sent: 06 June 2023 16:43
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per til=
e
> memory size
>=20
> Add sysfs entry to read per tile physical memory including stolen memory.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
>  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> ++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index db61da4d6212..7b5443aebd00 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,11 @@ struct xe_tile {
>=20
>  	/** @mem: memory management info for tile */
>  	struct {
> +		/**
> +		 * @actual_physical_mem: Track actual LMEM size
> +		 * including stolen mem for tile
> +		 */
> +		resource_size_t actual_physical_mem;
>  		/**
>  		 * @vram: VRAM info for tile.
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		if (err)
>  			return err;
>=20
> +		tile->mem.actual_physical_mem =3D tile_size;
>  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> tile_offset;
>  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 821bd49de277..d48c599e8cc1 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type =3D {
>  	.sysfs_ops =3D &kobj_sysfs_ops,
>  };
>=20
> +typedef ssize_t (*show)(struct device *dev, struct device_attribute
> +*attr, char *buf);
> +
> +struct xe_ext_attr {
> +	struct device_attribute attr;
> +	show xe_show;
> +};
> +
> +	static ssize_t
> +xe_sysfs_show(struct device *dev, struct device_attribute *attr, char
> +*buf) {
> +	ssize_t value;
> +	struct xe_ext_attr *ea =3D container_of(attr, struct xe_ext_attr, attr)=
;
> +
> +	value =3D ea->xe_show(dev, attr, buf);
> +
> +	return value;
> +}
> +
> +	static ssize_t
> +addr_range_show(struct device *kdev, struct device_attribute *attr,
> +char *buf) {
> +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> +
> +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> }
> +
> +#define XE_DEVICE_ATTR_RO(_name, _show) \
> +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name, 0444,
> +xe_sysfs_show, NULL), _show}
> +
> +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> +
> +static const struct attribute *addr_range_attrs[] =3D {
> +	&dev_attr_addr_range.attr.attr,
> +	NULL
> +};
> +
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
>  	struct xe_tile *tile =3D arg;
> @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kg->base;
>=20
> +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> +		drm_err(&tile_to_xe(tile)->drm,
> +			"Setting up sysfs to read total physical memory per
> tile failed\n");
> +		goto err_object;
Will do kobject_put and return 0. Which is wrong.=20
Better to do kobject_put and return err here.
> +	}
> +
>  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> tile_sysfs_fini, tile);
>  	if (err)
>  		return err;
>=20
> +	if (0) {
> +err_object:
> +		kobject_put(&kg->base);
> +	}
>  	return 0;
>  }
> --
> 2.25.1

