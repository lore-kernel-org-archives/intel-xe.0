Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AFDC77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 06:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A880110E347;
	Tue, 30 May 2023 06:51:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491310E347
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685429502; x=1716965502;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TzWKdk/JV0gOpYRP0vrvLhwunCXRKD7J/aq2zdALHUQ=;
 b=fS1aTM0gGs8MhsXop2cdT3eLNYOnD8R+yk8m9JeJFFsxSi4o1wM62Dh6
 KGx/IYVHxTA8wnUD9mT0+D5UnIBnbn6XaF0fatzqVIjJ1+s6boijhkwbk
 zY+P+K+IITcvi4WEd/ili/CJ+hBy+kSkQPrwrB+iQZCnSxaSTMPG3y2vt
 zFLCyXLZncw8SOpK81fcqx0+rb23ybUlWOXB/8H4GcBBDnIhmHoDMjOaC
 V6Ksr2j+y3VS4WgQtX7xvlBawFqnFztQSbkkJ+zw9ICfV+HA9ybY3w4v9
 jZZQ5LfNzj93KSNQZzkwdLcyGBZYmA340L20egugC1mr1UOo5gP0GHe6o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352333251"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="352333251"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 23:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706298865"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="706298865"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 29 May 2023 23:51:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 23:51:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 23:51:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 23:51:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 23:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAejyKP7d+PMv8ZXKuyiRYB5weOP6EMtcqc0FA5smLpI6AeRXLZ4I5CBoAPbqHdPgln9GsEmtueIQUl+Ml/Edssnv8BlBdNm9i3iVe0U+DayIPdji7CFYFSjARkKat113afrEHOfs0lMz8At/W1mA3ozbROXOmGWc99VXuNqF+TTJ2oNwnkE4JX40lniloGWfYiHY5KiQex1Mid3Q4s+31kImlLyedLliZeLgGkxase+xKKbUjodiy9zBp6w9uMtWItCrQ5hNKIDGaG1q0QNTSvEh/xfPDNnwv4/NGrqEelAi7M1WWex9y4hnfh6S5/g4qfBWqRP+H/w2eZ/QbMrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0e7EEcuD+H2hpopk1It1TOkHPwVQaTRmqNaHfs8nc8=;
 b=B73GqF6kGe8q1sTl8g+hT1+NAU7VmQOW+twiyENcxwh/Im9aGsMPwmk6+BYMOQE7W1iwcAsO5W9cNfTdjHhRtAAttIziukf8J+4BGRLS32x7VDgDpElr0BLXWnJcJSHKkgz1WzMZUCDE2wZJhO3ATGyA68JMEeEPHsLHhVj5fKnKxrh9eUP5W7QAXgBBXgxgpUJBar+L6+syJ4Zg8HfULDIydycvJ2U6o83e60nVxKf4XCohVXF0Eq2fYwT3IjondQ0hMF53bq9jeC0tK3x66YVPNolPi0063l2oIJAJjFxJvcW6y2udTIoQWUislaxtq00klZNqwNT5UkYIFb6z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6)
 by SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 06:51:31 +0000
Received: from BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b]) by BL1PR11MB5480.namprd11.prod.outlook.com
 ([fe80::7313:20af:ba84:eb1b%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 06:51:31 +0000
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnA442CWcpcwU+iRKJIP+adcq9xFVWAgAAAXsCAAXB3AA==
Date: Tue, 30 May 2023 06:51:31 +0000
Message-ID: <BL1PR11MB5480D96FD947D16F4E140DA68C4B9@BL1PR11MB5480.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5480:EE_|SN7PR11MB7140:EE_
x-ms-office365-filtering-correlation-id: d08553ba-ad99-4c42-bcd3-08db60da4d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X5C9TesnT7xgpaTmnloexbAKY/OAzoKqekVWbzKfV1jlqMgA7TP9CJFXHU1EVRDu4xMyXCjNU2jdRKWGbc+1jH5n+1OjOsV65L9XPmsZn8ZBNNanXzYQofQhpN4w3HCLPchDUknOpb9Xo69d5mN+JUZ9v7YJpzuHJHh9u3zgltDtOLW7iq3/vFBABWsGdbbFXGAWFHsTq+RaiSJlIMvq1mg7cMpnQ+e3xTzMB0gk1mftvs9wcQy0gTgq4XxP4q1mVUMqC8PZA8Rl766T+iqGMYwII5W2oxh8eRBcgDrK+UiHbXHosRkgVgC02h0Ev2imMGUoVyVtKMBtGvcvzjyOfBBbRp90M4cq7MtIZX+7dviidgACWdRx3mZN9MV5zTU13sxRPCb1XwCFAwqUkffRG6ylHH0prejruM76Q3T2jxE5/dWzmQBfrwhS1za1ZDzHfwDxoysEY/WmeQWRTvdcNdzcw6zAA2caUq0RbM5azY/wxgFy18C1JXq1FlXDXPWRa6jLFO0N4jBo4vCuZp2gmjCPTtIP0WK4xvGluvk6P0wvybZGSYeIJDgkhHHkjYVG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5480.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(82960400001)(122000001)(478600001)(38100700002)(86362001)(38070700005)(66446008)(66946007)(76116006)(66556008)(83380400001)(66476007)(64756008)(54906003)(110136005)(4326008)(6636002)(71200400001)(2906002)(9686003)(53546011)(7696005)(33656002)(186003)(26005)(316002)(6506007)(41300700001)(107886003)(5660300002)(52536014)(966005)(8676002)(8936002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9fdKiRS96oNRxn9KUaYXmvpSWS05Bsabmhclcw8N50iVeU8XueCpnv0uZwzk?=
 =?us-ascii?Q?rnX+MlMxosmDtTM84TCRq73nEU1NW11OPi+s0UHjDdFnAf/MYbyknO6zCu9J?=
 =?us-ascii?Q?LtnxjG4EENBvajZlYWQTB3Ufv/rFp3swGN9Jc4Sd0oKhgLQUjJMSB0Us2xEx?=
 =?us-ascii?Q?uwsBE1z9xqtrQ1eN2OlTuIrU+rI9zbWjaOKcL6bbkILMBoVZh7CC8e/ow5E1?=
 =?us-ascii?Q?bwlBGiBzKt2Yx7kpXhLf7OgYUpFr9CMfFbjrLRD24UmttPxGGO6gJVQOtGjy?=
 =?us-ascii?Q?YyLd/GumZM5jOhD92ZLgPM9fayOFuhjeqfYIYqz5CgOj1UvVqWBs+Iy/enO/?=
 =?us-ascii?Q?1omywVMSp0jLbj2Mw6g+PoLB8KrO/mIiFihszDgPRYkFfPAU6jtkTM0rJOL2?=
 =?us-ascii?Q?0z6iNjaqcq2NysRXcxxhs1va4WberBRAi8TN3p5mVL1DlUAAT2PNVJEbZ+eS?=
 =?us-ascii?Q?0WuUD3O6iANOXrSSA610F7J6OQmmteQlTSbABCmTYBWc7EIMem9hOfqIleZs?=
 =?us-ascii?Q?dKREzAz1+lFaG4ZDlqyA2JUULIdodZAuFuz0+se6yKurK5FLku9s41+FCpno?=
 =?us-ascii?Q?8Us6axZId9fCOBdMX9km/C1l+sxPtqbSsXIIJuEC937Wv5lVHWahHetNhpIe?=
 =?us-ascii?Q?brxc1AkWcwvDLbO+pS6Sjj5G4/P6uU1ilTFMkOIjdYtMhRgLDyHIfECGeQus?=
 =?us-ascii?Q?hity8Dzo6d36wPtjXxfxH2B+O+fj4/TBL6ZAFvQqB9xfKNyxOkV8wnYiXxP+?=
 =?us-ascii?Q?Nh9F9y5MW75OKoCzSrD2viLhABWf7voZk/81uK8ieJeTk7XAVCR0//sBNniy?=
 =?us-ascii?Q?OeJngJxWNWdrEsp3I5Y+WkruplMMANfGNqxt+tTNRpcykU6NFWD+d+sskocu?=
 =?us-ascii?Q?WoHdVHqUUAskNN4dbGeAH4NsgHXc666iRobqu6WshWPf7cPWYGVaz/b+9QN7?=
 =?us-ascii?Q?t37IfnXLoGSSj1QrMHzdB7ne9K8TArakyPOmEoBgzYMPAnUXGtCUhRUfG+T8?=
 =?us-ascii?Q?jy0mXHc8wCMqP2mdhBj3UNwa8UBUZ5f1pkrqj7Zo2Ys6Sm/M1yVFEYebiOFY?=
 =?us-ascii?Q?Bns/I/tXfFTRMzXkJmO7ZBXKW/YXscCepoHeXfwwL8yZ71muY3eHhnVYTygQ?=
 =?us-ascii?Q?DAc+HMK5qxzbhK3eVJSM4MjbVRwddxb5u/rJucsIXdsZN2ByThqHONUKVVPY?=
 =?us-ascii?Q?239vD8GfH1drOV4/unP4lCPAMbRcMdTqGzevSOnGNNRIT+2e5eswHEQGMTPF?=
 =?us-ascii?Q?1erjLiwzKokwxzRXjvyu4GM9ZGRwWYfzIe2XYJjDVxRYqF8nwIlppxEDtGLP?=
 =?us-ascii?Q?UPo+Mf7FS8tzf7NcqrMEsNsux7t0y1/KNq9uEI6YVjCzOhUETVdzo2rnC3tS?=
 =?us-ascii?Q?TwAcOpPU2Dkeykq1NNUMN7Vbbfx+ONpZikOI9eG5dQc6EqT/9qCAOei6xz0D?=
 =?us-ascii?Q?hDFts90GZSaLrlTOoVLumZCp35bJtGYPXTlQ1lkcjL3sMdGM793k8DxDFxun?=
 =?us-ascii?Q?pYnXQPJYRUGeDLBf0CRrbVsej0tyOB55Rkyv6y9fO7ImZr8+O0j5XMpJ2Bsb?=
 =?us-ascii?Q?JJxBw2IL9IhX2Ac4oHzgNwjF8VupYhoJCn5+r/b41VZXV10SBXVodkw1FpQK?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08553ba-ad99-4c42-bcd3-08db60da4d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 06:51:31.5557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypFA0ecbOjvT7ar6JhBJjvnUPEpm2p5qwtVXoQr+jLNlJbDxZ8TDHFKOgscz867dyssLCUsbeVw0ElbeiCre3l38IoM0tKxN0vceYpLa41Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Iddamsetty, Aravind
> Sent: Monday, May 29, 2023 2:15 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: Monday, May 29, 2023 2:10 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> > Roper, Matthew D <matthew.d.roper@intel.com>
> > Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
> > memory size
> >
> > Initiating discussion on sysfs path for this inline below :
> >
> > > -----Original Message-----
> > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Sent: Thursday, May 4, 2023 4:50 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> > > <aravind.iddamsetty@intel.com>
> > > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> > > size
> > >
> > > Add sysfs entry to read per gt physical memory in total including
> > > stolen memory.
> > >
> > > The sysfs entry added can be read using:
> > > cat /sys/class/drm/card1/gt/gt0/addr_range
> > > cat /sys/class/drm/card1/gt/gt1/addr_range
> >
> > We already have gt#num directory created under device folder, should
> > we create addr_range under that only. I think that would be straight
> > forward to start with.  For example,
> >
> > /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.
> > 0/
> > drm/card1/gt0/addr_range
> >
> > Initiating discussion there to conclude on path on this sysfs entry as
> > well as scheduler interface entries as well as under "engine" folder un=
der
> card1.

Also, now with Matt's " Separate GT and tile" series addr_range is associat=
ed=20
to a tile rather than gt.  We might have to introduce "tile" in sysfs

Thanks,
Aravind.

>=20
> Scheduler/engine entries are not related to this feature let's discuss th=
em
> separately.
>=20
> Thanks,
> Aravind.
>=20
> >
> > Please provide your inputs.
> >
> > Thanks,
> > Tejas
> > >
> > > As it involves drm_class, it required movement in xe_device init
> > > flow, patch for same is part of this series.
> > >
> > > Actual physical memory per GT was dependent on infra patch from
> > > Ruhl, Michael J, so I have added it as part of this series to pass
> > > through pre-
> > merge.
> > > Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
> > >
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > >
> > > Tejas Upadhyay (3):
> > >   drm/xe: Rework multi tile device memory initialization
> > >   drm/xe: Register drm device prior to gt init
> > >   drm/xe: Add sysfs entry to report per gt memory size
> > >
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> > >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> > >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> > >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> > >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> > >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> > >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> > >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> > >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++---------=
--
> > >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> > >  12 files changed, 291 insertions(+), 164 deletions(-)
> > >
> > > --
> > > 2.25.1

