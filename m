Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC63FCD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 04:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D010F1D0;
	Thu, 21 May 2026 04:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVdsW7+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9F310F1D0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 04:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779336421; x=1810872421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PtKBn9qleokc62/jdlIIE/3AXVL0EP2dC+Wjbxdn9xk=;
 b=cVdsW7+r7L3n3jIgS+SkbsSuMqibTrO20S4DhUh4nYpuTO0/OpD07IDx
 FacLrSW+sMX0939fBhDNmdp7appk6OdXKaytF6NPeIgf0BXLlzFsumIeg
 evKxunm/2Sd0Wy59TeK8xR4ix0m4dApIebGgl6CfItEm9YDv7HvePxaZP
 Olqm/ctA3arUzCigXIFk4fxnSJgr0QHGSC+JmFaWLX9WXoJOyx8of1oyt
 YnpnY0FUMD+Y83fQ/NjJ1Drggizwy5jEbPMIunClkBmCw02pVAvAIeteO
 efVcgQaQYa7H5FnNsKbf5w61t9jTiX7MAVpYBKqV3fY1MbIpj5zopwKIF w==;
X-CSE-ConnectionGUID: VtJznlEpTXONG+d0CezYag==
X-CSE-MsgGUID: MEJw2KIrS72N4pj/lzS55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90824836"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="90824836"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 21:07:01 -0700
X-CSE-ConnectionGUID: RzPT/qFtQwGdW/FHd/LTAg==
X-CSE-MsgGUID: 4e/WjU5HT4WOnEbAnJoBdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="235993747"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 21:07:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 21:07:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 21:07:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 21:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhVFF1aUcWRCLpMMns3PS9x+x7pqUnIkY4iYTbGdiCisApJChFLv7F7tdp7XLIeInlQ7IcVzKhojJrU/U66HBvxeeKLrCVZm45hTaxSsnguBtnoBEY4pXIqS9D7JFXG8evbuc3rfXOuLEvuvZ/3NTnaia1mxiUWRMnrWWWYSuSsT1VjMmoWABdC5dqK73vxBAtDB5AcQndser0iMQskJPc2VucD+J6tlJVuQAgdzcWiigambxicibNn6CMBqipOTrZDzE29ZQV46FDE5g06MnlcNZzT1TaRUtUJMLKERrY+WNnQHmTAeUINrZws7kAewyJrVW0Ay3rcBethlmlFkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYt1OkfmvkZu45iNPfhsF3XTH82UIu9J0JlgWL8WK6E=;
 b=GqLjpEmrmE0EG8WipXt1EjHmj9/RGR8GqpKgRX5NkuWZv6ngxS7PteM0LmRhinosT91sfSgEd21ozidAotcG+2aAZefwlSMfno7jXGPtXau6V5LaFMQe91asg9TkWD5y6WXEJHEJRA6Gjsx1vBVbCmIk60nDHXT8bAnFQEaUlmedI0rAOVyPuAunUXUDpixdkeyMTpBJVX85gbrP55K4+coAO3jZB66UUpqrioJB2ULOE6yIfvxQaoINcX/2ORIK4YHk6vF9sgX7EBaWaPnMSdrXzigAkMQa/KJcqMlc8x5h0xSBsSbXe73STV3Kg43hctI0QRx88n9zo1/fe3UekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 04:05:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%2]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 04:05:57 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: RE: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Topic: [PATCHv2] drm/xe: Check for dead config space on reading all 1s
Thread-Index: AQHc50Adahfj7t4fZU+Jf7gOmxxfV7YVzQuAgAB8kpCAAO7agIAApvWg
Date: Thu, 21 May 2026 04:05:56 +0000
Message-ID: <IA0PR11MB730701C0FC9C80B656DA30E9BA0E2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260512060128.209698-1-arun.r.murthy@intel.com>
 <20260519033104.480503-1-arun.r.murthy@intel.com>
 <20260519202629.GI3397116@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7307AE528ACCF3DC54AA4072BA012@IA0PR11MB7307.namprd11.prod.outlook.com>
 <20260520180713.GD3379914@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260520180713.GD3379914@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CO1PR11MB5204:EE_
x-ms-office365-filtering-correlation-id: a67d8312-52b1-4d8f-387b-08deb6ee42a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|11063799006|4143699003|56012099003|18002099003|22082099003|13003099007|6133799003;
x-microsoft-antispam-message-info: IwPSc8tCuPBft6IoyQ6HTFIOW+MydEYK1hy6aoLRViQyoJ1+FklvK/b5PH51oiV7+LhprHSd5RrDXuaCI4vbo735vNVTKJnEp71/6Np3kka45X162uNVcsPa6YnNbhnZt1KwzwOaZCewsMFL5jgVP4tLEEphL9y5YOP8Bbt9/CBpdbNq1dDoaLrWrziUm9Ev7uULqHWSW8H60PRKahMKLrFI6ruQ3ndXJApAAFmcNlMgbB08YfCEvhAMddaZ2TmcVsH3igKkJdWAD1NIqdnYcFf8GD8ZvtH//Bx8i2eUwde4lSSmLmorKITzfZJouwXeYTVcv7gYEnvkOfSs/yXwaeIEiJ7Any0fXdq30pzLmP/SHOGAwYU3Llo6BcbeenQLyJEc1SNq3X7kFejqcH80+11i/2TJGOFgXSlZo3WN08CaGFrNW1mFMjAH791ZwjjyZrx6/0lzS5QjbGYyrYyVoeWkQcMknkqYnrt9dg8cGrHb7ARLHTrbMWzyjJh1sp/RcQ54mJ1Bl62vSXY3/j0hS911k4DqqBFGmvh57WHTOnyWQrSpV+1Pqe92M1uY32h1A3aeFANf9ZYOK1v2rUq5eNePJ8S9LT+qH3dfCZ7P3HgchqobTcYx75nVg6lY2UcnSEbWAU05u42S5LgPbLv2lw1ic6o3ckLIJ4ioiK5e+UN1qYa3ujVjefbUxsAVCt1fZf1yIlxg8n+OrIvVt43dtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(4143699003)(56012099003)(18002099003)(22082099003)(13003099007)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NUU3xOfMj6vwSssAhUHcMjhiFbodJBU0fX8n1Ibh8nx8DvC9BlGgad2ZuOOm?=
 =?us-ascii?Q?xIV/1DOccfjBWent+zFtcPlX+/SM1lhBLtSXQANE5yjo+dHc7yp1JNl/C5HN?=
 =?us-ascii?Q?StEL5By+2aj5amFZcCi7StnnLjdnJfycAgITrNhACkb0DZ2JE7RF4TbpYAAR?=
 =?us-ascii?Q?lJbcj8SY38Eeq+FLwLLdOcSODnz9WOd7m4jjvGoWQvVuarxSZ3IWv/q6MGYQ?=
 =?us-ascii?Q?7FxAwCDyAQzTfOw5bXjZlMvg2W+HjgYWS0Wmif0r/3y2VFBU0NuH5h61Y5cF?=
 =?us-ascii?Q?ey7NucMfb4a93ri3lboyoFlESJeP29ePqBzpN2uUe3PLlSuUxkxnz3lLYn2j?=
 =?us-ascii?Q?541+XbJ65B6u0lpc7RaFkxkNKP0w3thRoAKsBTz0kJcCiwN5fLBM1Tf0qq7X?=
 =?us-ascii?Q?FiAKaN0WPpNhYX741AB4P5rvZU37VkHE/SS4EDitK7Fdpz4CFvKFJcTTktGA?=
 =?us-ascii?Q?AdH3Y6eUgEYv5Ew+6lJivZJZA2EXGOKN1XCCUgZr8Z4gK+uVRD2UnIqotoOp?=
 =?us-ascii?Q?u102T+kCmGd/vCMf0YgwTheEh6EMyAvgSrWOiR2aAaL1quwPahIy7y+EPqSB?=
 =?us-ascii?Q?srLdhIDsWDhUoB5tqD4JodwffEGY7FoA/DisTA88nQjdf350sfJJnGcrFAvF?=
 =?us-ascii?Q?RpIoU2ObsFWpo2t03aDw34htjLdNsP8Tmja0P67HcOa9ncECqhSFHWnJRNLY?=
 =?us-ascii?Q?/KF/H8vwt8mxsxOEbWnrFSI4cK3Zytvb7gfjnZM7ZKLT30k0Z7ei/F8VHVXk?=
 =?us-ascii?Q?IzSR9fdX0Dghkp15EyNQBW8YpdyYeHPwwnThx2Z5Ylc438MijKBO/rJIRp7+?=
 =?us-ascii?Q?3mBHUrMqixMHvKNkT7LJMSFM2zw2HefUL9nbxPF7snoM77MkiM0MTAdFeWRH?=
 =?us-ascii?Q?gqJ07oJ4VfSVZzHsmWQkMV+lQw5Hkp2Gcwo4/IdfWkc34LGGPsMH/7y8jMNY?=
 =?us-ascii?Q?2vOqbeHZtGMRh0GiGOKcWiVud6UyEdK5znCqf8OSrsjLp65CudidEjqxaeJk?=
 =?us-ascii?Q?63SFLe6RWq+fh5J7gpodSi2PTTEz943VoD5mxy53y1dQB2YP61ys1L0U9SBi?=
 =?us-ascii?Q?cWt9mRMapgx+NdEER0ALPrFbDkjkaehb1BE8f0HdNLZiy/Q8a5TzAOEmzZQe?=
 =?us-ascii?Q?Avcxdr7+NFUm+R93uXvWNIgpvx23kTUSc7NdX3QhkonWHpUMk/2rNjoO0t0r?=
 =?us-ascii?Q?rYWzKNXWOEqYwoPTuloXUB4+vFv+m95KKyDOdjrCLPngPIbPNBJcXoSfSDXC?=
 =?us-ascii?Q?kgGjSt1A10XhoVuElPgY5+QCBM9FMb/MY6w/JON9rfNcO25fPLKCQvza1vNi?=
 =?us-ascii?Q?VQJZsjSjc2Sqs6AMyWeLZxSwLhsssf1cy/u73Wd1xXnqbvJ03ge1AMbf5M8C?=
 =?us-ascii?Q?VNjTWwQ8yrk6t2R1TMaFB/dQ63jn0xO0qWa6aYiAhA3jMDrXX9BPwqGYV69p?=
 =?us-ascii?Q?A/v5lnUu8cLqo5CgEixz0Za8/wPPXYLuu3Bn0KZG91Ypbowey6j+tG7OcyHl?=
 =?us-ascii?Q?xv8LwvIhWvAz5qIzj1+eQUGn5uRzauyQ5eiGfye/vwPWBxHP31b1+74RfyBh?=
 =?us-ascii?Q?B+kN+9v2FrlDPLYZIP3LLrnSBbnupv+cAYpzXYVm5cLcVLAz2Bl/zShQDYS9?=
 =?us-ascii?Q?zgspXaSFfYa+zklTiYClc7CffeUJIxbp7hrH/GSB9otChigkm6oNS7wuHgMQ?=
 =?us-ascii?Q?sELJA26GIBD1e23qFIaPt14vSH89jO3g7SBx7U77mwIDbJJM0lIMBl3Qz/xm?=
 =?us-ascii?Q?6t+HGf7qiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EhOLEbkgh/ftsi0B10Qurnh88EGLCdXjH/xhlOGhXavxI0YC5X37DWq2ZCD4geB2lbM6nnWYWfsjKfCfRicjQ4i/wKzSqr9kDPZwGcuB5JQg7Nb6Iyf4HIzbzBD9HbdL6iACVBg5zM330VBmkoH3SBuV6XCgR0xb0AJHeNc2KDq8I/SmsfymZwN3j4myBqSHGFbO9cA4Cyq9dM0wwnffGU3S7WrpuUjhjWgACZ2M+mFvw0ESo9nA5uKHufZA9uPxw6R347z8w9dnqOCkzOv3ICSuRwhCSejLSbZrE/DTvxVkWLAHzn6CSn/CGE+ihD1pjMSrnhFI8wHJ4yshwhKvIA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67d8312-52b1-4d8f-387b-08deb6ee42a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 04:05:56.9541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y8WZu9Fsqh5KhvJE1wv4Y4CY4TRPjsZ+Y7Sq/Rr2g0x2Cdv8YlLdcg9RVV9vT3SdWJbiDJ8B4SQxhTk1WQEMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 20, 2026 11:37 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> <michal.wajdeczko@intel.com>
> Subject: Re: [PATCHv2] drm/xe: Check for dead config space on reading all=
 1s
>=20
> On Tue, May 19, 2026 at 09:42:36PM -0700, Murthy, Arun R wrote:
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: Wednesday, May 20, 2026 1:56 AM
> > > To: Murthy, Arun R <arun.r.murthy@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Wajdeczko, Michal
> > > <michal.wajdeczko@intel.com>
> > > Subject: Re: [PATCHv2] drm/xe: Check for dead config space on
> > > reading all 1s
> > >
> > > On Tue, May 19, 2026 at 09:01:04AM +0530, Arun R Murthy wrote:
> > > > After ioremap the BAR mapped address is read once as a sanity
> > > > check and if found to be all 1s then return avoiding the driver
> > > > initialization of a dead device.
> > > >
> > > > v2: Move the sanity check to mmio_probe_early() - Michal
> > > >
> > > > Closes:
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
> > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > b/drivers/gpu/drm/xe/xe_mmio.c index 78adb303b663..d206e3720eed
> > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -90,6 +90,7 @@ int xe_mmio_probe_early(struct xe_device *xe)  {
> > > >  	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> > > >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > > > +	u32 sanity =3D 0;
> > > >
> > > >  	/*
> > > >  	 * Map the entire BAR.
> > > > @@ -103,6 +104,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
> > > >  		return -EIO;
> > > >  	}
> > > >
> > > > +	/*
> > > > +	 * If the parent PCIe bridge failed to leave D3cold, or the devic=
e
> > > > +	 * fell off the bus, MMIO reads return all-ones. Detect that here
> > > > +	 * before any other subsystem (SR-IOV, GuC, pcode...) consumes a
> > > > +	 * bogus 0xFFFFFFFF.
> > > > +	 */
> > > > +	sanity =3D readl(xe->mmio.regs);
> > > > +	if (sanity =3D=3D U32_MAX && !pci_device_is_present(pdev)) {
> > >
> > > Was the && here intended or was that supposed to be an ||?  I think
> > > if the device isn't "present" the read would _always_ be a failure
> > > and get terminated with ~0?  For that matter, is this the right
> > > place to be checking this?  I guess there can be surprise device
> > > removal at absolultely any time, but the most common time this would
> > > come back as false would be if the device got removed during a
> > > system suspend; the code you're adding here only runs on probe and
> > > not on resume flows.  I think it would be pretty rare to see
> > > pci_device_is_present() already return false here in the probe path
> > > if we just got a successful return from pci_enable_device()?
> > >
> > Sorry should have been ||
> > The reason for having this check over here in early probe is to detect =
the dead
> config space and return early.
> > This is the scenario that the user is observing in the issue
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
>=20
> In that bug, it looks like we already detected and reported the failure t=
o leave
> D3 ("xe 0000:03:00.0: Unable to change power state from D3cold to D0, dev=
ice
> inaccessible") so it seems like rather than re-checking again here we sho=
uld just
> have been handling that error and bailing out before we even get to this =
point?
>=20
>=20
Ok, will have this sanity in xe_pci_probe and bail out the early probe.

Thanks and Regards,
Arun R Murthy
--------------------
