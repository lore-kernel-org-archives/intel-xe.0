Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B50BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009C510E990;
	Fri,  8 Dec 2023 05:03:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2069310E9D6
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702011808; x=1733547808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Vd0wgGkcXgdV2/F3utJ/TYuOmC2LIyoE++OFs4DhZg=;
 b=CDUwrcZ3BZw8fKVWTpF1nNvRxBpaRdBqb9hFMIHPuHyP/vzLQasMDiHd
 449pBtm1cLaAaLwnFqznm55XghajNXIbjv/jSI9hXXLffB3O7D6+hn3Wo
 R6Mdug7b7KLZSbUiOgROQ9wl+P8co+dhiU2SgfuQHYRY2keGk7dNsvZwL
 8ID4x8NsWULzTSZhwz3Rm7f0nCCG3YRMH23IfI9M7I7hAK/e2r5smKJnX
 lTK1tce+0O/ABKySBUJotpk+U2b4NMlPfhDYdBqkRiwfBOxKAXkOLN2CV
 fMGKbzLRc3ZEBB/3V+rGklwO3hDnbL+rIveZjyUyrnAfyXeyT8/QeA9AP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373857441"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="373857441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:03:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772009028"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="772009028"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:03:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:03:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:03:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:03:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:03:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0EiCu/zSgCJDzRSr5Eo1bLgH3zCB+4hg8ix+bIosl+e0Mcy4MDExOxMmXO+bA7dXV5+/6cf9UXSOeO4Hs4WQbBTKjgkB4j/7GFgjhgHonVdsCED9AhwE0ZEGCduwi3huK8wAxl+7WLMCEKo9KWdbVdQ4dO/lsSNp9zoEEz+XLdVhorpV1qCVvj6FcGqJ5+QhTHhU6GmK6ESbF6JI8sVZO7Zy0/On4VmtdNmTTYnnEqTElG1T6fhll+ft0bU3ceXE0NzLAeSmtXk+6mr0lrZTmPIX5e8PhIebmBEnccPy2de5ECrOOQvHX4gFeFpWJrHSk+0NzjmHbr69xNcMJU8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/0vGhh17E3GnW9K8jDgDzxUQOcZkKjj9y0tw/qsIo4=;
 b=SSXi38Bm6kKkqUUMgBZJ8hEl54x3ZHY76Uh8unrFtNtaWWEns+7jtLhv7b2UkWbkxpeRYxW9TIJ0udMN/8Dn4Es/rgqu/NQRAxGPOOjwKz3mZpWIDlRA3JAXKJ8Ez3r8ETdhcBCDmuz/WwlCNuRqSf5YnOrpXNzzcAbGbsJWvarIAabQ2zrUs4Bt6ZF5NXJltDN42aPY+cISHhd28tljGsd7jskn3vaM5QKEvcHM+5yOIrAj5VDlHQSwJeQ1fVuP9n1gBAOfQg/16LJdVwvTjF613+9Ku5PIoNlX0TmPalPRc1jsV6dxeHPE6evkBbhn19AX4SFpAmztjpKKNQf0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB7274.namprd11.prod.outlook.com (2603:10b6:610:140::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:03:18 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 05:03:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [v3 1/2] drm/xe: Add a new memory directory under tile
Thread-Topic: [v3 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaKR6fNKdGlUEMC0CrghroNxq/z7Cez/Jg
Date: Fri, 8 Dec 2023 05:03:18 +0000
Message-ID: <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB7274:EE_
x-ms-office365-filtering-correlation-id: 0a007d86-a82d-4f1d-d820-08dbf7aafe60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ummcgrdRo9c73zwnSYn7NOIT8Gfyn91whg8cdIYfSzQE8jhhHUlfPd4p36i797CJ/xu3R89WHRnt2UjHty0zyZwf6xgbtfvgV/6pZFQG7g0dHl84ahrNCpiDScBiMcIVtqYl4BjSi8kzvXjAxLq2WrjBlHj5NUWlEMmG4W1wnBEYc1Vxgd/JU+c+FmmEAGr23ljrWHT4Xgt+SMMon/dohK6f6pG4fCIxs+thmje/Htk+BsruAeB1pKG/EAvKWtxEj35MwL5Eu7H75GVXimunAWqzNUF58BZlVaAx5Qb4dc6X7AazTRotWzu8Imqolxst0pQ9BFYXv4dCCkaDzm54L9xTnLx1+YsAaFOCUexG/sEPAo+COdJldYiK8zEHoK9GS2/HcTXggdRNotqOKeUEZ8N2EaoCjvBvwn1qbvydQhroaKxfEq4AZ4uH5GgCP3+VIAF1keUfkPP85AASlEDIYfkVZ755qxyNv7nqsoEDpFKwo6vITQpJ5a1ojC/JK/8koIyKnGt8XTl2oYu/KvdSEU7Yfy58Qqgf+3CfFBGOt5ujx3RaRTHzUSbYcsi/j40r4xfgAYWCt2dkAGdZ7YyPonpgJSmXiknOB5SoYJl7/l51KvYlcb7RKAFeSPaj5dS+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(7696005)(53546011)(6506007)(71200400001)(478600001)(52536014)(5660300002)(66446008)(66946007)(76116006)(2906002)(64756008)(66556008)(66476007)(110136005)(316002)(54906003)(4326008)(8676002)(8936002)(83380400001)(82960400001)(38070700009)(55016003)(122000001)(38100700002)(107886003)(41300700001)(33656002)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/8kSrw+xH1p6YB5onvLFhMzKMTMdrITPI1NFkCH6Y+g9naLUD/vAzdaDwOMi?=
 =?us-ascii?Q?DKMooNIxJo82UP21EKotGmmzmIQRpkuE9KegB/35QheGJmuZ9a0JCqClmKIC?=
 =?us-ascii?Q?SE+hlcGEt4DAQyIAqZ90LZqRQDc8ysL1EU0Q5lIeit6MSHIG7Wu0zIoLuMzs?=
 =?us-ascii?Q?WMMDnyUziyObHyahmRwFh53pJwncegIT4rMlnd8I17ra1hBN4Z+Ao2z3q4FK?=
 =?us-ascii?Q?+PQw36hglJ3YzulvLWxMWUcNWnBoxDw0YTaCgej6yaxZWj06WJWZ4OnFeCe6?=
 =?us-ascii?Q?knNMqNmCANbhEu6wkjK5tJGTVd3nKSIjDQy8VdAnT5RgLetkbUx8uQVmB56z?=
 =?us-ascii?Q?/cswilpbNYKgFiuLb8KhYBblD8WnHmCr+mEHACg4hoGcChVLNhLs1LQFxP9M?=
 =?us-ascii?Q?WiRX/iKRPjtD3zmcVvIFvvvtFiCbI46cWdUnuGJyNOnkjRzhNBMntrNq5d6m?=
 =?us-ascii?Q?i4AWTYMkwcvtpycBYnYUlxM0FSLIO40ENCZ6TTSNTprsmW2PO1TVK4PU2Ezw?=
 =?us-ascii?Q?4aBFpeFvWf+PKFlABPfX38UgPB54IFyI4e9KSPO5yo6sFgzeaAPNnccdCBW5?=
 =?us-ascii?Q?EYNWTU9VvK9bphOPN8hIhFY4Z5Sdbus96ATPjTRQQCBsgPS6ZMINVAhI+pI0?=
 =?us-ascii?Q?rNlc764bsIhEBOfNbGYRs3PT28pT/56G5etY6RMf2rP2Vs4VhWfgZBaFDzql?=
 =?us-ascii?Q?giarv5JJYLYBGmDNwemOLyyxinjMMVLZdZO3lOPOqOQY+ED8EebVhphUGPiU?=
 =?us-ascii?Q?Dwa+YDm1dD0ylDQzAq8cJR57ZTssiK4OJEVec/YSoRLAs/rosJ2rhmsdfAFU?=
 =?us-ascii?Q?eBNuAeKbSkntL6fn8QaIHFwOGZ22Ysbh1ia5CBloWaj30Wmom9l1GFcEX2Mp?=
 =?us-ascii?Q?woRQ2jvwtOQd0DPM/bMbNP1ztMNXf9siZTxE1k+M4p1uMDiucMfmttarJwz5?=
 =?us-ascii?Q?W8J26hXjDJzBqLiKlM0pzbPXv24BeOsDME7xcRTFYTiOZygnpepPACcXGQkZ?=
 =?us-ascii?Q?ilIGZWI/nlXcnlEY+4WsRVnYY42cLUkz/eaeQPnETHvL/j6gLsf3FEv9oQ1m?=
 =?us-ascii?Q?o5Cbmw+xLJH2SEVLzlVgkJJalshFP1rnaTmo/d2rnD8GELtyNHRULUhR0E4b?=
 =?us-ascii?Q?ePvNEV8pZRInvR7DKW4ggaLNDHYNK1Zc21qnRFmLa9o4rP3HmR36iwjDSDkC?=
 =?us-ascii?Q?EeSUHDBjm6exSOKKIAUziYAp0TY6JIg4iEt6ZGEsSMExQJteym6N5th/Kt2+?=
 =?us-ascii?Q?bWmG1FziiQ2S/CmFlTHB3/U83TUxRvA1ADIhIV9jfvWjPJIZ1ndlueIeuWjA?=
 =?us-ascii?Q?dgb3XYbWOk3CKEg7Fox7ZndsUxlxGgxF3Wj8GJCJGw9IGTJyMhHAdKiKQh6P?=
 =?us-ascii?Q?C3rHTZqt0i2BNqVKZAq2E0XTcSgKXRwReJSw/eZ3ab3l4OfOamoUk6ACCOQD?=
 =?us-ascii?Q?B6mI/opBQsYn9m5a2hELIbM4LAelGL5upUTP3InMYhkqXpTtxc3F00zgZW/X?=
 =?us-ascii?Q?smY2A7EEwX+wjakcmq8CWOqg2ymm+Ij8/2fh660cl4JbhpLdDnrxIOj98a/t?=
 =?us-ascii?Q?TwfMGtlGdFvhO7l5Y4baA71uGzB7vLZ1kfgcUmBuzqg8Fa26aRyI89wNwxDY?=
 =?us-ascii?Q?/Vn4lf3lMqijq0ic1I4oZtIMFKsrig/o/kS5iwNGe+z5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a007d86-a82d-4f1d-d820-08dbf7aafe60
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 05:03:18.7184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8RG8j4AWKSlQTgG46gekoJiUh3tbjukUBfSGkYzpOHV2yu3xXKq3ly+2YWkxpSa6oMSL4P3pzbs6Zuq8aA19hH2E1YAqVaPolo3LauqgVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7274
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
> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Sent: Thursday, December 7, 2023 8:48 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>=20
> Add a new memory directory under /device/tile<n> and move
> physical_vram_size attribute to the new directory.
>=20
> New hierarchy:
>=20
> /device/tile<n>/memory/physical_vram_size_bytes
>=20
> v2: Fix heading typo (Riana)
>     Fix cleanup error on unload/reload cycle
>=20
> v3: Fix reload error with kobject_put in place
>     of kobject_del (Tejas)
>=20
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 16376607c68f..64be1f3a38a9 100644
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

As Christmas is approaching, you might want to adjust this in Christmas tre=
e order.

>=20
>  	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
>  }
> @@ -36,8 +37,10 @@ static const struct attribute *physical_memsize_attr =
=3D
>=20
>  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> -	struct xe_tile *tile =3D arg;
> +	struct kobject *kobj =3D arg;
> +	struct xe_tile *tile =3D kobj_to_tile(kobj->parent);

Ditto

>=20
> +	kobject_put(kobj);
>  	kobject_put(tile->sysfs);
>  }
>=20
> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>  	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct device *dev =3D xe->drm.dev;
>  	struct kobj_tile *kt;
> +	struct kobject *kobj;
>  	int err;
>=20
>  	kt =3D kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@ void
> xe_tile_sysfs_init(struct xe_tile *tile)
>=20
>  	tile->sysfs =3D &kt->base;
>=20
> -	if (IS_DGFX(xe) && xe->info.platform !=3D XE_DG1 &&
> -	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> +	kobj =3D kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
> ENOMEM);
> +	}

{ } is not required here.

Tejas
> +
> +	if (kobj && IS_DGFX(xe) && xe->info.platform !=3D XE_DG1 &&
> +	    sysfs_create_file(kobj, physical_memsize_attr))
>  		drm_warn(&xe->drm,
>  			 "Sysfs creation to read addr_range per tile failed\n");
>=20
> -	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> +	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, kobj);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
> failed, err: %d\n",
>  			 __func__, err);
> --
> 2.25.1

