Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BEEC77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42710E13A;
	Tue,  6 Jun 2023 13:24:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1810E13A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686057863; x=1717593863;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nF6gpWmtHfgeEGrdGkkgi+7bFqCLotlKmCbpuQszGoE=;
 b=lnj4U4pkh3/bFqk0OtkGGDMR1gmyTpICX0Cg8MnBhFvTkNQEMdELHIXS
 0tAAlhTaB7ni6XAMOl9Nf+uPDyl7QjGoaUQ96hFok4g3JG9of8PcthEug
 digLcbnwIM/GVbRKpnZA0QtOSZGxEm+pW4QJb6JNKUBnECLskdSoe9ooX
 dHvXuNCMK7vyyR/th2LBTpzQlWINCV4Ra/ByD+5aYKW9dtq5VcmSIXp3l
 6ztf31oxY6Q3YSTz5pcT3IJFPV+2mvzwMDT9/voAOTWTyHzqY4a9zSpZA
 vSs2y6acs0hLIS4ZYqKSFPOD5bXrw0yvDldI2pMH8Ge50WsrbvWsSCJ5R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422497127"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="422497127"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686542860"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="686542860"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 06 Jun 2023 06:21:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:21:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:21:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:21:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOJSd8dcZFrTWp7jV7wuTDveuKCMPTTiZ3fDH0C9y56asVGJz979OCj/k+T7ocK0pVUHhbUFBpbcG09c821Mu03l8hyR6OOudKLQSwqI/X4+Zv68nrnlrZlt84H796ARi3Crm8udKkzYcUqVoGIElvjBKxjzRfqQmWHKq+ukGgAEFQ6n+/SJBcQV4Aa+m53xmFxghMtXafL6kx11YuLBzAa0umYG9PgPV9TC6fIm/ZjGYuCoYcVTP+hU6ZHbcIClCTvyRXmA+hIM1hAM/6k8PjLmSDcdi7VCPQGFGL9axD7mYb4EOrehhwfg1kXZAYzZ0T8tNs1B9+mP694ovecf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR1rskotBYrCVXHs54ArINKaCCwkVVqCxjteNoHPVtE=;
 b=PDpo5GU78cjL+j9PLUBcgPeldZS69Ivabj+unxuR1hmwc/05vDa2r/TAf+tCWI/Ar+5LhRGwuuHRmU3XrYpce7lQp8IL7w94m9nP5JFcl8Fo+FYSX8jL4OW8/EI3mVB66i2tnkICbIpFl15q/1Yg+ti/jbH+9psCJCpPYizHFR42K3/p7t2zQ6QRDZcrvszdI/ZNFy7a9DdjC0AD7kmU+qwz4aA/4/rvTlh3pBcKMgnvbLU8Ned20QEVQ7C3pfCv3NGdcfqaTB1TeQb+ASadOoiSD9IImdcvMjv+Zi1/1E72KocPj6nSSyo4rRBE4IwYoHnujoezptSzbDybqLEcFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 13:21:30 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 13:21:30 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcXkDYuNuVE5EG7O9XvY827Ea99pbSAgAAQO9CAAAZcAIAABjLA
Date: Tue, 6 Jun 2023 13:21:30 +0000
Message-ID: <SJ1PR11MB62049EDFE0038555A7D2BFC18152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW6PR11MB8437:EE_
x-ms-office365-filtering-correlation-id: 726902cd-ab77-4f2a-04bf-08db6690f0c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rmj7u8zw1E6XsAzci4Wy7UIXxF9mkiifaV+6m5RE6seJ6MVJY2IkS3jLhzoCzoDlwazoTwvHalU+ejYlCt2JSJSdDL5nCA2e3P5M0LFfUBh8WGxa34rO7LHKGWqbnuusdsuYNYtRC91OPEOty5MJ4WvEWylZqdbrPPxT0Z7a9KFunbH4XgLxzOKUGJuV3jxiAK7rVb71qK/pLQ6gqzxHqnqF0rLDwitqhegatyP9nSuzdriTt/X57OGMJ0e51eA36AfV382DzWJMQhO21Nm99CKcZmufQhp1oWCOPh+f9eY9utz+QbcpvNyVB9xYm7nVBahS2njIYe3k5wMy/XJi3Cdl+e6Rt/9PK7VOEO4oASyRQeMj2ekEVJPFR4WFhahVrkkxbg9JulqoHOz4o6zm2OzqeH/Uuc7vFSX9k53weycvAaX3VBrxDRSJL7PiJENtYANZCQrBVU8jwzzytt1ZYDAywmI8hbmYeRiggvf2VuRh7iqegLHiWZV+bnJyYXAmPE622Fz+lBJ27pcTsVHUqPJpv6CKlgSwooLMvdbU6BCVBh6/ijlXrLwh0tHSBLvdprtOjC+Whc/jHoVNM5KNGxScoU0YLF9UP8Qfd42xbPmTYbWe23SzCLxV5rrAQffQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(26005)(6506007)(53546011)(9686003)(122000001)(52536014)(83380400001)(86362001)(186003)(2906002)(33656002)(5660300002)(8676002)(55016003)(38070700005)(8936002)(316002)(41300700001)(76116006)(64756008)(66476007)(66946007)(66446008)(66556008)(71200400001)(38100700002)(82960400001)(110136005)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xieVpeIH0ZxvjQX1bEQJOEINSu1eLCsTFJba12pSSN7gNtu9Ui96aTfSpA9W?=
 =?us-ascii?Q?B8hqjS0SWJ8JkvET/1YeoVhgOxTJf5k+5pQDLnWvIhNRKxKbz7hTI6+nx6SN?=
 =?us-ascii?Q?/MLifEctkw2ZTpqM1Vh0pfkcb7iLqX6P7AxQS898bYSy1X1pODFSD75h+vey?=
 =?us-ascii?Q?bb4pdFKM5K9MmnSJdr0ji+cuUPP4gewvIKKUJGg6AQziOdXUpxlMmDnLrUod?=
 =?us-ascii?Q?hLujnxx6n8QZulp7Qv2llfZ3P9Ciu/9lDKidSo2OXxHn4HL1XveYTiCdseoG?=
 =?us-ascii?Q?a2HdxgUa80NMj+ACbtz0R0v0uakIuKfVYWLvK7CUTgeIPekjy9b55IZRDQm+?=
 =?us-ascii?Q?1KDubRmMBQvHPSYyZLvp00BqxDWtWQDEncVrtFX1Zl+ltp/fFLoC2M/jeCEk?=
 =?us-ascii?Q?/DQOVeY+1u7bNQs3BmpqFBY5J4DrCFzRYARx0sHmuH6vGddoSADsi6qF8d9r?=
 =?us-ascii?Q?7gGdRtH7jnDjMc3ZYLntDy+9Unx+VCQtckXjVcnqwlFo21jnq24u5guvaYQw?=
 =?us-ascii?Q?E6EReeVj7waj5ZWXjuUmNTDC/KRenuN7WqaqOW6FR+1TQZkrVE9s/m84O+I7?=
 =?us-ascii?Q?/n+HCLkKjasDZpta9KL9wVoQQVHgkxRgIDYkFa9kHMP1msMHezsLcmeVyfJK?=
 =?us-ascii?Q?ToyNURP933PUkPE9U2aScGiXriL5sDGcDAtRMmcK0KB76DUjcy4DXXggdD7P?=
 =?us-ascii?Q?r88CHcpHntWtO6hhuWr0urxy4IJ3DO9OOXSjDhrGO5886U019MyWVfEbJbEa?=
 =?us-ascii?Q?17wIqnH7bmxbJYDA1IVhsOJwKxlV8Chja0fk0prGRK+NUq26TGKcx+LwWvJI?=
 =?us-ascii?Q?JcCXNSKp2mOEdh31y72gIFOwSneGSbqMqMmK3KNvI5tE6id7waMFQsXjy3NC?=
 =?us-ascii?Q?52aNkGqBxMFi4FEB3Bd86Sazb5n1m6TuOnNICr1TzaYQUEWuwuiPMXBkVMQU?=
 =?us-ascii?Q?+pHAT3I6Q5s0DMxrHL4JfH5xcgCAYg80gIsKPWdqfWoI3xYiAozB3NQmSimG?=
 =?us-ascii?Q?i7fPK058Ts0wO8xWqmQMOZg9SbLCoZXBpOtwazdIutqJxWT4jDns6gVjDYWv?=
 =?us-ascii?Q?NGcCv7zI3hqYnhF0aacYMuBw6yQPbOFoaA9hAecGBAygI8djj1jCSpwhSkxp?=
 =?us-ascii?Q?g+NV8vnUXWBQlpYTvSn4VDplq43mAZ6J1y1maAR301Hgnk7DughSITz6nhAN?=
 =?us-ascii?Q?ZSN8sMSAA2otUVoEhcL7b+/FZUd0ixVR9Y8ZylGtTT7mD+AFRtrchUiOMaCr?=
 =?us-ascii?Q?6UsMl/KUVyez0ulnD8HEUwxm88mAMcKVJiG5kuAMNAxQhEpLMe9YlslFglFn?=
 =?us-ascii?Q?swAzg8CsvaZNh5lHZ/v/iLA2s7hWORIr90pcI0/Pj4obZNjZRaN6pUQsgr3B?=
 =?us-ascii?Q?ZkdS4uMzc1kNmnovHJ3zs2nN2AGl01MpZVvh2TdksFoMFJIS9JEgeBbiOzIk?=
 =?us-ascii?Q?vQwslP3hf7xiNIhHaf+1zfH4gE8SewLF2/5TKSK4wUaziCYVzivPpmG0QbGY?=
 =?us-ascii?Q?s/vA8oTrbj4E99MQUFPviIauVL362TY17CatDMdSJEc7XecwwHw3BcnNwjPP?=
 =?us-ascii?Q?xZsDApqcJAnbe2bjZJ+GuEZZFf/leV8Vnf59GM6F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726902cd-ab77-4f2a-04bf-08db6690f0c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:21:30.3578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QJeluvt5j2UdXOEGcM/OsdrpIeRGEbh4b90rmhOvMa1+4MfDfpluQZPvF2J/fX/3foTRA1++XEArdxcgtx7MARjgAe1sj9fJe7GFdCMrZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, June 6, 2023 6:28 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: 06 June 2023 18:06
> > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf
> > > > Of Tejas Upadhyay
> > > > Sent: 06 June 2023 16:43
> > > > To: intel-xe@lists.freedesktop.org
> > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > > > per tile memory size
> > > >
> > > > Add sysfs entry to read per tile physical memory including stolen
> > memory.
> > > >
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > ++++++++++++++++++++++++++++
> > > >  3 files changed, 53 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index db61da4d6212..7b5443aebd00 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > >
> > > >  	/** @mem: memory management info for tile */
> > > >  	struct {
> > > > +		/**
> > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > +		 * including stolen mem for tile
> > > > +		 */
> > > > +		resource_size_t actual_physical_mem;
> > > >  		/**
> > > >  		 * @vram: VRAM info for tile.
> > > >  		 *
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >  		if (err)
> > > >  			return err;
> > > >
> > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > tile_offset;
> > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > index 821bd49de277..d48c599e8cc1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_type =
=3D {
> > > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > > >  };
> > > >
> > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > +device_attribute *attr, char *buf);
> > > > +
> > > > +struct xe_ext_attr {
> > > > +	struct device_attribute attr;
> > > > +	show xe_show;
> > > > +};
> > > > +
> > > > +	static ssize_t
> > > > +xe_sysfs_show(struct device *dev, struct device_attribute *attr,
> > > > +char
> > > > +*buf) {
> > > > +	ssize_t value;
> > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct xe_ext_attr,
> > > > +attr);
> > > > +
> > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > +
> > > > +	return value;
> > > > +}
> > > > +
> > > > +	static ssize_t
> > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > +*attr, char *buf) {
> > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > +
> > > > +	return sysfs_emit(buf, "%pa\n", &tile->mem.actual_physical_mem);
> > > > }
> > > > +
> > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name, 0444,
> > > > +xe_sysfs_show, NULL), _show}
> > > > +
> > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > +
> > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > +	&dev_attr_addr_range.attr.attr,
> > > > +	NULL
> > > > +};
> > > > +
> > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> > > >  	struct xe_tile *tile =3D arg;
> > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > > >
> > > >  	tile->sysfs =3D &kg->base;
> > > >
> > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > +			"Setting up sysfs to read total physical memory per
> > > > tile failed\n");
> > > > +		goto err_object;
> > > Will do kobject_put and return 0. Which is wrong.
> > > Better to do kobject_put and return err here.
> >
> > I don't think I have any action to do based on error, clean up was
> > already done. Am I missing something here?
>=20
> In case of sysfs creation failure, you goto err_object do the cleanup and
> return 0.
> Should you be returning 0 incase of sysfs creation failure ?

I am saying it does not make difference as we don't handle err outside of t=
his API. So does not matter we return err or not.

Thanks,
Tejas
> >
> > Thanks,
> > Tejas
> > > > +	}
> > > > +
> > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > tile_sysfs_fini, tile);
> > > >  	if (err)
> > > >  		return err;
> > > >
> > > > +	if (0) {
> > > > +err_object:
> > > > +		kobject_put(&kg->base);
> > > > +	}
> > > >  	return 0;
> > > >  }
> > > > --
> > > > 2.25.1

