Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B5C77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4010E348;
	Tue,  6 Jun 2023 12:58:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097B110E346
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686056297; x=1717592297;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jFO8VnSFtqyqS8cgvqF7rt68hUzMrUzW3R9Aq/KDIbw=;
 b=cdES7cXcHesdn7p8Qv39MuGVX3hWhLlTQhN/DXyqemTgnmH+5h0g9h9v
 ckYDE3RyUICbJ5MvjcMCw7D6cLPNFlHnFdU/qHH2I0wtmWQKB2yGQLI6a
 jyemohaU1cLelyVeYoGnzJqegCTs0EriTnkyUVoaB3GYKSanUGw2VRchk
 ULC1XfNirQDKuqwU7GNdHzhC1nOGA6y/AnqcbInK5dBK2l428bhWyN4xt
 KCBi8IIZVe9KO7JvOBhgay6MtpZb6PfSVZ3+2CljxGkRWRAWiLeigR8gp
 JbVgkzok2G3HIxOML5yT/EQkFgsltM0OWwLRVBgPMFpH11+v5UsO25r+8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341301706"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341301706"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="955742234"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="955742234"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jun 2023 05:58:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 05:58:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 05:58:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 05:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axfvwY5C9FhoAq7rf9Idw/j0a3YSv0W3E1aHpqOriRlBHfZiKdE4DKmgoZTCg93XyDXMnEgkVECC+uhkBcZQBrNQvclFlwueDARxYtG+K2loAqk3z0g3aXUtODMnlcJg8g18yV02d3wi4NA1Dpw/P2sbZLQ96AyBSUBfvt40xHkSzLrhk5D/sBM2gSI4GVz4jvyG0GoOrn2J26O7Zl8u42lCkfKYDpWh35856DUNonA5tXGdef62CIle9Ou0FC6BwnzNDCUG4znB4fKvQ//BEic0S3RclHaOnmyHYnkigP7553gbL15RCczSV8FZoRFvHmM3vGgB1MO+GApIPDrzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfcXH2GxOJWrwdXsCCXweoIAoH7u2dmpKEgVUUnzvv8=;
 b=ec6rAsrwyE+18cHBvqqi3sRE7c/Gd78fjxVolz7IdbM6MIuW64nxWpOR3i/C0XSfSriazoMEQHu/m0q5BeOZBYoGNRIlDZOFAOD/tGPqQURiwn1TIvz4dts+ON2R7jIQQfYBj3Is/ngo9jp3MzDIL1D0xND7qxzAHFDyJhf/c0vc5hlv0+V/YV+W4PYv9N4cz1TlBPSebseNqKfGuBA+uYiNjWDhCDZ3qEC+JeFmoxf3WBogw3OxqTK3fpGl/1ZHeMzQ093MeNsEZj1+SUgoeBOrVFUguU2EG87AFD4SXlJjvgelmeOISaAYxGTqdsFpPKHhNRDmsEe2TNzWmjTp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Tue, 6 Jun
 2023 12:58:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 12:58:13 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQgAASFICAAAWnoA==
Date: Tue, 6 Jun 2023 12:58:12 +0000
Message-ID: <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA2PR11MB5194:EE_
x-ms-office365-filtering-correlation-id: e9316d56-b2e5-4ca8-241c-08db668dafdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hLN3WasWre4LfC8xkz8w8wOeohMb/X4Q9Lbx8TLNyhOtOGesGeKaTiDvnMRbw4NQfEcCm0k+ivkIYLTAZAzXqIfUM/tITBJESwrNWF1FwG6wydLSOHzLo1eFxzpGxp5z5ho3OP1aQfjsXK3V++aKwXq5j0Hl8cDNVhi3tm7N6wmUKhvJZiOIWX5qeCEM/RbtfW0R2a1unig4EPxWvewABn0dC/F8fWu3OfuiYLIWDRdJ0SePObc8ypM+2NtidLPxzyUeDMFDea+tXcwrA5DLX9i0JJdm7MxjuROhz1hcMpXEYJ1r3GwPVV4ohawZMtkYI8qi+3Nw+NIAvAtVOOAyFu75D5+y8Ep0O8nmjZrt3617LvJncDPJR9836VmZ2sZE1ZKYskm+ptb1hXnjhSCC3ZXE+VzTs/1CFH/0cm9pxM81OHnvv6koLBwtWxbyH4DkUVRZA8aTrWKPTn2kFn3JEwy83aLYq4GhvaQkBUXD3BQPZ9iGpJvpJpDGaBA/xu9zskGp+FwzhJ1Z+Z1O6cqS7IOCyhNrl1luZWIqbd21hmvq6K3myKAqmSD2rfoNZ5Pph9FgnjVRoQj/hh2ay3PEL4kCFWj2/RpyNb+THAmdxXRkMQ5WLAZ+/oW0aw5aIHj2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(186003)(478600001)(26005)(6506007)(53546011)(9686003)(83380400001)(7696005)(55016003)(33656002)(316002)(8676002)(8936002)(38070700005)(86362001)(41300700001)(38100700002)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(122000001)(82960400001)(2906002)(52536014)(5660300002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qhqp5vCFXJULBsQ+1zPYkpxQPRgOhK7mRrboQBWfCbVzxEslfxivof9Dx6hh?=
 =?us-ascii?Q?eYp/Ck5EWBfax5rQ8RH+rLwRkoClFiW4GrRjsrfVI898zzIOQkrl0MEm0pNh?=
 =?us-ascii?Q?qmiDhGL7YNNhg2KN3pRydZfc55hTknRJH+MXAuB1FJn4Em84RWHRiOp2sYsW?=
 =?us-ascii?Q?NsYLstCvliafkfr/ido9j8TK+FcpRD+VwbwcZdy79L/HK/oEDwe8Oj7CL8kZ?=
 =?us-ascii?Q?vsMuWB2x1hH7mlMohMp5qrZIUSIOVXNUQC76eBS+NfbHIFfjfAqOV9K01FrH?=
 =?us-ascii?Q?iluwsjC3S6JCFj54F35jH+4iMOkxqZt1aIkas4ELuiMQWVyLgENsmVsYBZam?=
 =?us-ascii?Q?gF08Vu/fX6qX10Fpwla8mFWzwOI7LimfXVUKKnmkYwcCkOjs07gxkBa1229n?=
 =?us-ascii?Q?+5VaKDWSZVa8ZvAEPGzTCK0ww6hHDo10/PUZzJ3u+DasL0uILDzRL0Cyf1nl?=
 =?us-ascii?Q?eqQJ70NLdE16ulGnp6hRjsCekkEfPWYAx7OyFxv6lUnJ09M8D2NjwFScDY8v?=
 =?us-ascii?Q?bs/8cvag9OIbGnF+NU5kE0mbd1VG/rKEesFsRY/0Nikx71d5PvXzC3Yoza4P?=
 =?us-ascii?Q?235bWZWA5Wlwy5b05Ym+AbFn9CbrQrjXgRQuItvZesz/GISL7ZjVeyEcj8UO?=
 =?us-ascii?Q?b4BBYjTHd6rXVRN0zHwsYpzHL0CQpbY8ApoS6GHAlv4jN9J4600YHr2cPLlb?=
 =?us-ascii?Q?jIlqMnJ0YewdjfMlC4Ar5zbrqAfewO4/iJQhaYCCykitmTIuAIMgZh3QVVB+?=
 =?us-ascii?Q?HQZwIqeXcH8srelRb3FrAmUOn+ipgd4X/0OoiV7k4Iw+gac5RZwaWnoBNhGi?=
 =?us-ascii?Q?oE49dHO/U1JAGcOMJShIHVoc5v4X3tol4WXkWG4RO+9ONwA/ZBo/0vYzzmYd?=
 =?us-ascii?Q?7UC7pjIBRJyNr6ALbddhJX5GCQoyA92YGpTUaukLsgaX9Y6B7g3XpTYH9Pyn?=
 =?us-ascii?Q?kKsCyKdnwlJ6sCiGaIwXYmS2INkdu+JvHKi4qngD57jzGoA9sDiuQMPW/Xj9?=
 =?us-ascii?Q?DHP6yJsO/3Avix3uvqItjoURtlxnbK+uWl9WDBkxhr/zarzI2P3x1z/LCErZ?=
 =?us-ascii?Q?XETPYk9xdBSkHSIhqgQs8awvkgJWyAxYAE7mwGscyO9LAZSpcnLjiRhJr0JU?=
 =?us-ascii?Q?UoennKepKaBdwvRgxeVu22109sISl2S0xQ7yJdBPMJNheEfvRh0YiX47P6M1?=
 =?us-ascii?Q?czuh9ukjIobc7BEpXbl0klHQvSarl3ajBVNtMTrfveq7mb64eadZAoOObe5Q?=
 =?us-ascii?Q?lYDr9mUx/WQffjOQqhpU1tlDbKlAU9iFkvcUXTkOv2XYqkFyS66z4RotdgeA?=
 =?us-ascii?Q?VZncliKBlIxS+NdWJ/7CqCJYmrKtqd/OWsje4WYm/SM/iivnSc/0+l8X1UPP?=
 =?us-ascii?Q?8FuGGfYFBgCiT5yz+c2iWZ173SXMJQ3PRjZgi7Mqz7ogPFPvzD32qEUelbwO?=
 =?us-ascii?Q?CCaIhhAfJ0PKNo32HNkplLKBG59dwN3OxHZNZcOmiEkyJWSts6K6pSGQZlLP?=
 =?us-ascii?Q?l1pPOiMzaaCb7xjD+hjLXu8A65Smw+zwUl3Dt/Lrv6Y1j9MjWJckA9BWmf0C?=
 =?us-ascii?Q?71GPR/Zflo2tQ9f8209b0piY4UQRDr6BN9sdtzYqMEZqBHS7rSirinwkXFg1?=
 =?us-ascii?Q?Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9316d56-b2e5-4ca8-241c-08db668dafdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:58:12.9849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRrPa7d7zHZUe0KcGO+OP4MiXeqNdfVjMqs721FIqwkeeahw/WYYNpQCI3UPvZLBT8qXC2HB/oRZH1dHG9fSevShNjU8320yzsNrxAaYJD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 06 June 2023 18:06
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > Sent: Tuesday, June 6, 2023 5:07 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > Tejas Upadhyay
> > > Sent: 06 June 2023 16:43
> > > To: intel-xe@lists.freedesktop.org
> > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > > per tile memory size
> > >
> > > Add sysfs entry to read per tile physical memory including stolen
> memory.
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > ++++++++++++++++++++++++++++
> > >  3 files changed, 53 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index db61da4d6212..7b5443aebd00 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -107,6 +107,11 @@ struct xe_tile {
> > >
> > >  	/** @mem: memory management info for tile */
> > >  	struct {
> > > +		/**
> > > +		 * @actual_physical_mem: Track actual LMEM size
> > > +		 * including stolen mem for tile
> > > +		 */
> > > +		resource_size_t actual_physical_mem;
> > >  		/**
> > >  		 * @vram: VRAM info for tile.
> > >  		 *
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > >  		if (err)
> > >  			return err;
> > >
> > > +		tile->mem.actual_physical_mem =3D tile_size;
> > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > tile_offset;
> > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > index 821bd49de277..d48c599e8cc1 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type =
=3D {
> > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > >  };
> > >
> > > +typedef ssize_t (*show)(struct device *dev, struct device_attribute
> > > +*attr, char *buf);
> > > +
> > > +struct xe_ext_attr {
> > > +	struct device_attribute attr;
> > > +	show xe_show;
> > > +};
> > > +
> > > +	static ssize_t
> > > +xe_sysfs_show(struct device *dev, struct device_attribute *attr,
> > > +char
> > > +*buf) {
> > > +	ssize_t value;
> > > +	struct xe_ext_attr *ea =3D container_of(attr, struct xe_ext_attr,
> > > +attr);
> > > +
> > > +	value =3D ea->xe_show(dev, attr, buf);
> > > +
> > > +	return value;
> > > +}
> > > +
> > > +	static ssize_t
> > > +addr_range_show(struct device *kdev, struct device_attribute *attr,
> > > +char *buf) {
> > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > +
> > > +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> > > }
> > > +
> > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name, 0444,
> > > +xe_sysfs_show, NULL), _show}
> > > +
> > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > +
> > > +static const struct attribute *addr_range_attrs[] =3D {
> > > +	&dev_attr_addr_range.attr.attr,
> > > +	NULL
> > > +};
> > > +
> > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> > >  	struct xe_tile *tile =3D arg;
> > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > >
> > >  	tile->sysfs =3D &kg->base;
> > >
> > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > +		drm_err(&tile_to_xe(tile)->drm,
> > > +			"Setting up sysfs to read total physical memory per
> > > tile failed\n");
> > > +		goto err_object;
> > Will do kobject_put and return 0. Which is wrong.
> > Better to do kobject_put and return err here.
>=20
> I don't think I have any action to do based on error, clean up was alread=
y
> done. Am I missing something here?

In case of sysfs creation failure, you goto err_object do the cleanup and r=
eturn 0.=20
Should you be returning 0 incase of sysfs creation failure ?
>=20
> Thanks,
> Tejas
> > > +	}
> > > +
> > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > tile_sysfs_fini, tile);
> > >  	if (err)
> > >  		return err;
> > >
> > > +	if (0) {
> > > +err_object:
> > > +		kobject_put(&kg->base);
> > > +	}
> > >  	return 0;
> > >  }
> > > --
> > > 2.25.1

