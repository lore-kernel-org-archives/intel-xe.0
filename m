Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC29BEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 05:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6EB10E35A;
	Wed, 28 Jun 2023 05:49:55 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0594A10E360
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687931394; x=1719467394;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6DY/9bT2hYV7SzboYcq1cdlbPUQY2ERCqHaJVRSTgRE=;
 b=hkTnoEB0VNGDGnX5JCaqSMoo56WCzwReeGC3Za58m0nxp/YJdk9lQlj3
 /DU9Oy7V7FJdQRLCMXwxMAa88AwgAjXekHzyr3UvKCemijIvaYXqjihVA
 8QQcQvalSEdtByaTTESIaNKc/oFsVZHZerZHtymIZ3KJmd45w9U+hnBga
 TUw/es8cFXdPz8W4062TW0rUomKTNiyYWmM5mAkSdihEnfpALaK5mc5xZ
 gLtl3sHwGYox450SzP0BeOXLdAOjj582AbHxeXM3g9iizO30R+M0Krrw/
 utjaH8UpcCNHNmmeFma0TbxnCdJrWuWMx9fKlwsnfkOWtNwIkGyfLYno3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359256572"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="359256572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 22:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694151794"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="694151794"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 22:49:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 22:49:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 22:49:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 22:49:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 22:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGChdDPMQhQQ8A8fH0qwupOhCLuvtrigC6kajGGBf7f6cS39hQV0Xj/JzQ4umNy3D/LmXAnrfEhBWTsxXa5q8d9MZISqoB7b2L+hlJKVIi2ElKkxbvqlgZn6CEc3ydLAoE/gW1SnhDeKKMr2To9QN2ViL7bn4rx1dzB08bVgoRsXThpG/Vbg5vGutGedxRFJjRUSUP55T8SfoSsjZMDRKx+EaBIXOwuMg61Y5GjkaVf5GwCDasbAvKwJEfHx5QTBeCLJ8ccK9OyqzMFF0x1sUNQ0zJqMHycIIabqKq6vFbuTpIQP5+WS+axGa386LgBfz3KR11NRdhISWcYgkGVywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hs2Yn4vSm6FvHqZuFUN6c0GmUbnYG4l6FPQ8qL2SY0=;
 b=ZSkSFfH+jgbEvTKWuaECi6JeEvwNNJ1VUpZGsBKuenmw9WFKPz0HwNu9l3qovjmDenABAQqMXrxZBYSJiHGSsEdDmMjieD6NVeoTzFwlyHymxhQTkov2p1xynVZ24kKkKAMmcEu6j9XcyANq+HzB6TtoDEOpnnfg/O74ZhGyoTEjYKYw+GKjYe4SVNhzI7arnrFDS+dow8v671h5Wh0gvznzZjJ/hlrUEk5c15pGhanBcqImMWHkblcuakdeO180m3UtdUCMNt3Pd9c2mGOVFJv/UttdH2u1oEWaRHU2pRrIIUr+MTdSrxvyV+wq7BowEDBW0glHz/R0lNm/cw0KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 05:49:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 05:49:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH V4 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZpNpO7ye09XNOgU69LEpxrIo57a+e+wKAgADDoDA=
Date: Wed, 28 Jun 2023 05:49:43 +0000
Message-ID: <SJ1PR11MB620477BAE8D581C355DF3E6D8124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
 <20230622072818.3182423-4-tejas.upadhyay@intel.com>
 <dxt5pxqhv7qhmi23klipxtyrd54mnoe4dbjjapcydvil2252ie@ztanzg5r3raq>
In-Reply-To: <dxt5pxqhv7qhmi23klipxtyrd54mnoe4dbjjapcydvil2252ie@ztanzg5r3raq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB6395:EE_
x-ms-office365-filtering-correlation-id: c6675514-1dc4-4683-8655-08db779b78e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOilH1RT0YpeLA5TP/LiR5F15g+izPkb5yXJLaaii+HMgYdppbny/89cq2LMlSBD8XvTSlZg0fR1a3KX7YqRUmunhaYCFsifmu9LO1xgENsm9WT/IemTq5jICzxgEzSTWAi+9BcMDC4xMoT8Zj4fsHAA01v1Ux2ydXNRSbLNUkgJ7viOHoSqH156eYPRXiDUIoIBLwXk5zqbyl0KBL6CUjFTY5HYHvK0bAEnaoLVgmtmPvkO+Fz3qorDlua2aEU6fnTopwABji0Lw6jkQhtQTTU1smJK3ZY+D2P5mKG2nf89KFbd1E3IeiOIOpZscgKBuIOU9/Qe9AWhdv1ZJmStUdUtyDremOghsl4fuhyJDAe55zMXhag8+9pFXvmv5FUuIXp/+ngLgxuNB8/HUME/Hf5BZo+aq5dnb5GWeN0I0uJKEXqcq200Uuq7DMq9CLscGCcFMOwZIPt7ChZ4huYJVMTvEqZIsF9BHp/8E9Yhbtwhuv4JwEJ0KU32HpnxI68fAHnTbtNKhbOuyiBOtoqZq6shgpV8zEU/6vhpbG5NONxcx6h9JJUH7f4KxvmatEz6C0ghJjsqBipAwjqyQEfwB9fzmiWSNKxiquLue7gOd3PQpwofmM6UFcI/a+tbEMbP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(66446008)(38070700005)(26005)(66556008)(66476007)(33656002)(122000001)(5660300002)(52536014)(6862004)(86362001)(8936002)(41300700001)(4326008)(316002)(6636002)(8676002)(82960400001)(66946007)(76116006)(55016003)(64756008)(38100700002)(6506007)(53546011)(9686003)(186003)(2906002)(71200400001)(83380400001)(7696005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nZgZikF3xpLElle55qWz2OAA+uTs0JINCf+prIkaHHvuoHgDJ4+bn+ntWvAJ?=
 =?us-ascii?Q?gIO/uiRFjplw2oLJNqDXz45bWsvAv5vg2fknjurNIUP89y6X5ZXwp++Xb7M/?=
 =?us-ascii?Q?OZGRTmrEeJDYnEpxIbTzWVIuX8tb+fWxgAKWWNHUoOmEbSfFTUL1FSdo08yd?=
 =?us-ascii?Q?HOZ3EA6Yr+IIA0x3dulJLEjR+xGPRkZ4JPN3joHxY992W3cG7oWEOM3g+6de?=
 =?us-ascii?Q?j92TPABEN0UD+9lMGYBBOQRN2ryW8ZoPzeJMRHorljNqiZjnjcQr4ZPI45+i?=
 =?us-ascii?Q?WYEqA/HHJmx/x1AqkKH5Y5LMZkU1RSUcPnXLufZ/EHdYjWiWmz5iRBOn1uc/?=
 =?us-ascii?Q?faMzqOX+d6n5ys347KX6iLqh7gZsINZgEBaaNiJi5KQvv065e7oI3qCMMbfT?=
 =?us-ascii?Q?Oj/nxPTs45BQBVBTtR902U2d+VvqYSepAQbRIZwXlyyiVumG2sa22Nh5ZbZu?=
 =?us-ascii?Q?i4A/qCdkmYhgP4mFdNt+KYox3DhSKWdgbUZwxhNYNNBgUWkImfL0fg2xDQ5i?=
 =?us-ascii?Q?jKnGBiwFiTLbDYR0bGFjVJ0Ic6/ams1v7v6x0S2djUnahzB+GI22PJHYMIzz?=
 =?us-ascii?Q?7bzUNBy5bxwQxmt3qe8Rh62hD3QPydaHr8xbgXHQIYkkqmlks4vaoq0sJx/h?=
 =?us-ascii?Q?MFbe2AXZnUU01TEVWeQDipzYq/EyPZw6eXBWAEuNUXfQknJws2a4oNKTrR8M?=
 =?us-ascii?Q?8+boP5RO/rSZHdZ9IxqxbMmyGTzVILyJBoxoG33hYouqCFgohLJ2nM1IPlBv?=
 =?us-ascii?Q?9uGYYGPSMlouHtANTIUVTmPJLbpAKkFUg6iljT0YdypNNpJIHKExF65aWVut?=
 =?us-ascii?Q?ooENuP9BA0F0cLcG0VOjhMFhVHaOo3EuFAvvrHJkJSbYHfg/NlgNTKML2CVt?=
 =?us-ascii?Q?JUT4UxyvcPDgbQNGU0OkjpvhHcvq5nm7CqMkBzeyqP8fk2SAR7bTR9eJWSKp?=
 =?us-ascii?Q?mrz317TzBzLfAfVjb5q8KF88VTv2bzrdD4H2S3WsgiV9Tib78pocatZ6bSzL?=
 =?us-ascii?Q?5BQG8NRNrtWNmp9Gx5OQG/oL842Od2dsorUGTBZQhWamn3TZ2nM+5QEqox8t?=
 =?us-ascii?Q?4QC7g+g/VPG44Sj+Qbdnjq9cJMm4TvnEL8HOEjDh/hEfuk0S+M1Yq94+wVSK?=
 =?us-ascii?Q?MKv9orXGGCKaccHw5AUiPftBbdTSs3O43xnm0oJQTRvIrvC1/Rm45cmGzG1J?=
 =?us-ascii?Q?XYcwUiZbvfzl+w65OrzW0uJFuSW/H3J9Hi4PRO1BIpKyOUYaf/p2jDS+2QNY?=
 =?us-ascii?Q?C9P01b8E8SP0+dxwF77KVqDQMegWgm/K44wGG/ZY2Zm6WdrTmfrIDbh2W+Jm?=
 =?us-ascii?Q?quY3NoB+T+YZ6RpA18pHCtB6U+XeJQodAixrE0GyiafnaNqHjHWru3FpdCrq?=
 =?us-ascii?Q?OYLVJxvd2aAZ4E9LdDfLHZVHi/VFfiFMDfImXBHDTdJE5lwkAAk6VR9I14Et?=
 =?us-ascii?Q?KtMfK90qcz1nkSyQCBDYi1sz2SDPoxreua241PlftPf8Ur/jVNT78c6Xm7dj?=
 =?us-ascii?Q?BinbSQqP3SEVD5ZOdEqRYjpZOiguqoqbNeUoWNjHkRSjnbeAcNTejbyHG7NZ?=
 =?us-ascii?Q?QI0e7Hd8oroSzwxQRY9ycYMoR0JYE1VHVGESNMIm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6675514-1dc4-4683-8655-08db779b78e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 05:49:43.4872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozDkBgW4MWDr1DyZbclVmKVwGPIF2Np3gNf8Gk9DjbaeJyIyfyyuZEFDjx0aZIKBEXAq5gY0aLIid+slaYQQODHiApC8KDev4LJ+zexSbi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V4 3/3] drm/xe: Add sysfs entry to report per
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, June 27, 2023 11:38 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH V4 3/3] drm/xe: Add sysfs entry to report =
per
> tile memory size
>=20
> On Thu, Jun 22, 2023 at 12:58:18PM +0530, Tejas Upadhyay wrote:
> >Add sysfs entry to read per tile physical memory including stolen
> >memory.
> >
> >V4:
> >  - %s/addr_range/physical_vram_size_byes, make it
> >    user readable name - Joonas/Aravind
> >  - Display in bytes - Joonas/Aravind
> >V3:
> >  - Exclude DG1, replace sysfs_create_file/files - Aravind
> >V2:
> >  - Use DEVICE_ATTR_RO - Aravind
> >  - Dont put kobj on sysfs_file_create fail - Himal
> >  - Skip addr_range sysfs create for non dgfx - Himal
> >
> >Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> > drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > drivers/gpu/drm/xe/xe_tile_sysfs.c   | 19 +++++++++++++++++++
> > 3 files changed, 26 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> >b/drivers/gpu/drm/xe/xe_device_types.h
> >index f2d4298fb0a1..dada97352330 100644
> >--- a/drivers/gpu/drm/xe/xe_device_types.h
> >+++ b/drivers/gpu/drm/xe/xe_device_types.h
> >@@ -108,6 +108,12 @@ struct xe_tile {
> >
> > 	/** @mem: memory management info for tile */
> > 	struct {
> >+		/**
> >+		 * @actual_physical_mem: Track actual VRAM size
> >+		 * including stolen mem for tile
> >+		 */
> >+		resource_size_t actual_physical_mem;
>=20
> should probably be inside the vram struct below? Then you probably need t=
o
> tweak this doc
>=20
> 	/** @size: size of VRAM. */
> 	resource_size_t size;
>=20
> to explain how these are different... i.e. that while your physical_vram_=
size
> doesn't exclude anything, "size" excludes reserved portions (e.g. the sto=
len
> memory).  So...
>=20
> vram {
> 	io_size - vram that can be accessed by the CPU through the io
> mapping
> 	size - probably rename to "usable_size"?, the total vram minus
> reserved
> 	       portions
> 	actual_physical_size - ...
> }

I agree, name "size" confused me when I looked at vram code logic first, us=
able_size give more meaning to it. I will change accordingly, thanks!

Tejas
>=20
> Lucas De Marchi
>=20
> >+
> > 		/**
> > 		 * @vram: VRAM info for tile.
> > 		 *
> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> >b/drivers/gpu/drm/xe/xe_mmio.c index f1336803b915..4bb8e8c3080e
> 100644
> >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >@@ -277,6 +277,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > 		if (err)
> > 			return err;
> >
> >+		tile->mem.actual_physical_mem =3D tile_size;
> > 		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> tile_offset;
> > 		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> >
> >diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >index 386c6accd4dd..6b559e2f2f7b 100644
> >--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> >@@ -20,6 +20,20 @@ static struct kobj_type xe_tile_sysfs_kobj_type =3D {
> > 	.sysfs_ops =3D &kobj_sysfs_ops,
> > };
> >
> >+static ssize_t
> >+physical_vram_size_bytes_show(struct device *kdev, struct
> device_attribute *attr,
> >+			      char *buf)
> >+{
> >+	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> >+
> >+	return sysfs_emit(buf, "%llu\n", tile->mem.actual_physical_mem); }
> >+
> >+static DEVICE_ATTR_RO(physical_vram_size_bytes);
> >+
> >+static const struct attribute *physical_memsize_attr =3D
> >+	&dev_attr_physical_vram_size_bytes.attr;
> >+
> > static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> > 	struct xe_tile *tile =3D arg;
> >@@ -50,6 +64,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> >
> > 	tile->sysfs =3D &kt->base;
> >
> >+	if (IS_DGFX(xe) && xe->info.platform !=3D XE_DG1 &&
> >+	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
> >+		drm_warn(&xe->drm,
> >+			 "Sysfs creation to read addr_range per tile failed\n");
> >+
> > 	err =3D drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> > 	if (err) {
> > 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset
> failed, err: %d\n",
> >--
> >2.25.1
> >
