Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9A4C021A6
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 10:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26F110E1FC;
	Mon, 24 Feb 2025 10:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfRHeMYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E555210E252
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740392532; x=1771928532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UW4A4g7VoQFKI7hvc6eXQpxQChyOBREoFA0krhyuWVY=;
 b=LfRHeMYvElSrMFP+U+UVAWhdKElLYBEZOXCKQMc0gP8m4C4vdXQV1W8B
 rsY4sCAi1Gl1d90vDNj6V1B6k5vTfmHdNGAhQDJOEJsxQHryw1XvIXr2i
 BoHaaN9jUCgyNh/B93Fxca3YaCRwwEbVuyDzGDjZFY5nkdWAiGaUycRAT
 /C+DZNt14KwvXg/pyxuZUi/UR4if7FLOeVqbAnbryrhWhZxFBMMSl26/2
 SjQBc1KsooNQ2gp6R1LO3pcGjF6WXpWA8Ro4FvyCoBZqYCCzwtlb298RE
 9GscXGMbDzJWb8VRksPh9vOVhk82qWbBrNnxPAynRZxLpcrzW1qB0pzmh g==;
X-CSE-ConnectionGUID: cg0n73tCSW+4ErenyU58hA==
X-CSE-MsgGUID: GXsLjeKOQxKZYW6uKuNznw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="28738357"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28738357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:22:12 -0800
X-CSE-ConnectionGUID: 5RwrMgnXQoqVlmfZYXMmUA==
X-CSE-MsgGUID: HEBJDR3UQFyTpz3tXk2sLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146904182"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:22:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 02:22:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 02:22:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 02:22:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=poM43rOxE5Uv349LpVjPX9Gt6hzVkq5wTlMH2iT8yA2ojrTENw0XMsfxxdMeJbyehe9SVWrAFyjgLC/zpg+CT+xwAJK3KX4tsLBa0VUjlPHexwGQfcBWxIN7FyX9TqdywXyQhtMRkmXSQtmuzmMQIVpH1bFt6DMLz0fUlsnoJ9YgPCbQEbfRZ4XcRlBM5l+W0685GMpY960d6XtqScwMzlkDMkryECIHLIH0aDITfD07fIv4xUP98YU5xOTrvWqzTwlNQiik08jTENsPgcir+/P0w/CtGsj6aIAlwThNpqYqDyFtlor2fAJwjVQwls+pu3byZxyJy5L6o+qK2E34IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5snw92nXj3qHsyct2F5odFmOuxOO25AEmwmrczpp/XI=;
 b=FLgwnDZT2b375V9eAS6NftFkXr8VQr+Bft7mV8usMco0VSAnUGd2cmIj4nfXcUAQD3X1IYj0Y986AK20Q/5pJEbK8aBk/1l+MgpVG3s2VafMGmlLeVxljzznEwBggVMal/+RcN9FPeJHpcpOyNVPOl8nnBmAFqR1D6PnjHK+Y3DuLPGGpX4MP5LoaFmAevM8/NhDuiFn7nJ2UvyI4BNlJ4hV39cZJKDGXbk6xJjBfZYO5RniY0nLXxdbrH2uT1qJNXCNpQa9SKMTt/PgDdbKjpjP/8TaD+lszg3y1WCMnryo9ZbKGfAUxL9fzd/dFEJM9UNMLndODuWAHah2OOKMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7743.namprd11.prod.outlook.com (2603:10b6:208:401::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:22:03 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:22:03 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: RE: [PATCH] drm/xe: Make sure scheduler is ready before submission
Thread-Topic: [PATCH] drm/xe: Make sure scheduler is ready before submission
Thread-Index: AQHbg5OFd5Hy8GZwc0eM+vmwe4f3FrNSA6aAgADm5BCAAuzBAIAAAv+AgABp48A=
Date: Mon, 24 Feb 2025 10:22:03 +0000
Message-ID: <SJ1PR11MB620409130F50F23AE26A0BFB81C02@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250220123859.291523-1-tejas.upadhyay@intel.com>
 <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
 <SJ1PR11MB62049A747DD815101D9DEB7381C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <Z7vsfEZsAotWoSmm@lstrano-desk.jf.intel.com>
 <Z7vu/0o/rrqVB5N+@lstrano-desk.jf.intel.com>
In-Reply-To: <Z7vu/0o/rrqVB5N+@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7743:EE_
x-ms-office365-filtering-correlation-id: 59cca630-b033-47e5-256c-08dd54bd14e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yr3yBchbchI3Q8tGRqC/GXDk8mXPk80Vcb8yKI0PBvz3C95lL+7Xg4nv3oSc?=
 =?us-ascii?Q?Y0efvl3gePTewToNTC0c5p5PLmS9r35Ccu3SHbNpANvCBNT96TTT/Ogybfco?=
 =?us-ascii?Q?/ikLdGiiI5sS9YyM+20DfNAFrUJIjN8OSAe4fJ2wHkKFPzBoxhMvNVpx+fsP?=
 =?us-ascii?Q?7KvwYOdf5MztG7eONfy12wTqFhPC3Pk8ThQQN0lCdBcu2rBpV1Jnp2fIEHU9?=
 =?us-ascii?Q?QF7VkLoOKeynFUVsAtsczSk6b1/ekjGIOZUqyInuiAS29P9hHYiKJTY4zqT5?=
 =?us-ascii?Q?WOzi/GspTMtrY7Zq3YBIKIV9lP/x5CsllyfmpXxJ0q0tzkHEgMz8UHxICJl6?=
 =?us-ascii?Q?Y6HEokmT0mZcRqi1SCwtklZiKalNHsAxvU1Jht/40DBLyKq3ep0KllY5G8xL?=
 =?us-ascii?Q?uooGw0Ar7sMSJ4hgbnKM5s9iPHTY3Ao0RYlVrgOmdt8cxi1ILwfDF1jPHXD6?=
 =?us-ascii?Q?+J1S071fNIZO/DoahLxQ4Gd57iywKsoNwvPPNIRx+kb9RxV4XcXTTKVeL/9U?=
 =?us-ascii?Q?8/BPmKxU9VaQkUXmtQzcPT0aZT9hNF4BGwmrfd1/9ogUSjk70kN6uT9rNALn?=
 =?us-ascii?Q?Zes1uQMW2XntRPUnbu8ZKdelMUJnkcDja8Y9scgkogGiffG6SR/sFifCFnmH?=
 =?us-ascii?Q?pHMQ7o4WceazQuRwh8lFmWYEY3rgyjjp9yfdBYuP1lMleNXlaBDAuJ5rxvlp?=
 =?us-ascii?Q?n5HE/SjmJRecRRB7sb/4pwm3Nexo4PqBmbs8592b+2keyCG73KM74BeGJlKY?=
 =?us-ascii?Q?RM43AP6svvpFaSLGvwtLmTUByG6HSoMO3IPoNG3hAb/T03oxxkDM8crFCGfU?=
 =?us-ascii?Q?xD+4vLa9R6Hjek1hw7Jq/pwcL0FdXiWqwIuw2sE6B+IPVKWFzsNvCi6yHpvD?=
 =?us-ascii?Q?jY7/QcJDmaaNMTu3cqStn/aZa72l4YMutSekhT26z7bm1pcqYtLjzbCFPOb1?=
 =?us-ascii?Q?FIw4fLGg49Fv5b6Dh4+IegXM3wJVG3bq8+PONfIhEYcC0kDXFBrrbyN/5zqy?=
 =?us-ascii?Q?PqeWTlduMn2jfF2VqpVxwQCN835B6SiKdleG8eEKpkc0tfPViIIol0npaObk?=
 =?us-ascii?Q?gcTGuPth21G2Uknp4hY65Wxx6DRXEFVANfbGHm8Nd11krmhqxqEuGqe8TM/R?=
 =?us-ascii?Q?DggS08HvXaPdNJ2k6m3uv9CtS1oLVeDmcCtewgCOdjpozXD2YQDmf3NTYmCJ?=
 =?us-ascii?Q?9fzJfaG8+WoczphJeXg4jfDFCpjnHziNMVGjKQhBWnD79CBTC5malEEbpfnc?=
 =?us-ascii?Q?Dphluacbw5kyfwbNEHWiybOucGDgbmla/ctZdGN6gCICCwyVmHacLr2mo5r6?=
 =?us-ascii?Q?CwObDyBZXgAeBKfZYow+6XvbkfhU5Sz5t4JjN8fG2QcHxx/bFHuV04O3KzTo?=
 =?us-ascii?Q?dVmJlo37cnXOGQ7d/TWhuxB4N+XHbarRhLqbBTtskwjsODvppA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FNIPO6CgAZXmAhaqTkN022iTbO9G7MYlmE07oww/+OsZYEpK0p9TIAlHtN6d?=
 =?us-ascii?Q?iAY8v6PqZYoNM5p6/ro+o05qMSSjIw7wIeW7buYHlHSsxHIkG5tBxTijwWTY?=
 =?us-ascii?Q?luLazSuRBb7cW2HFMZQGT9QkaVDOdAaxuWTXuCuQnuQwZ+CtDgJ+W4erDWBl?=
 =?us-ascii?Q?5EcZIPL4UdT8e+y2iu8bgzNl0PxWVq+rGhzB8NjSupTqlhquB88po80J5aWP?=
 =?us-ascii?Q?3U80ZMH7AetPRiJzHHgvyPGHDm+ulYDQ1ybSj8/eSQahqpsnefg7afVJb0uU?=
 =?us-ascii?Q?4iaevQgsBnjGGQctoHwUmxYka3k7wVedSem3PVWArYBCBvnKAWGdWrQtXPgw?=
 =?us-ascii?Q?l+9zr4cuJG4VZ5/z7nuiSnyqz48Lc5Y4uUEkCuZjejfE/EYrMmv1U/qwWBpL?=
 =?us-ascii?Q?xIrcLjXV/S9xx8Y55SMN6ZHQkFS9oVHNAkAvLUR74Y1syQL5Sqpb37qP9P+Z?=
 =?us-ascii?Q?cmXJux1Ybd9YoPPTu3+pApPB+VayOjaSTVSpFL8LtvuVL+fTsl1bnd6m2ZGf?=
 =?us-ascii?Q?g4zFZiAUAfVDzloQ4jjxtyE5R0t1i2aCIrIfvqh5sMYrqx4v10PyFbvyhozr?=
 =?us-ascii?Q?/J5hxq8SR0UmM1Mtu5nIWJnxu3HOqPLEicZIHoSh/pREa8vHZ/Pgxt9WbW1g?=
 =?us-ascii?Q?XZJ2APwi1/ylhkcAkRLJ3GXKYH3D8JbtiC5ShRgyoEMwHJpvGdjh0sVC2Nrq?=
 =?us-ascii?Q?w6sWZ80GkuvAKyGxu7GE7NC8g4UAsGC8UMJwPK62fQv3KF8Q5nqqRuGIrimw?=
 =?us-ascii?Q?TOzGzZKeUCtFDdLWJQM+mPvSx9V/SW8fyxf5SsM5jFCva9PKRJPlgsLTXyfS?=
 =?us-ascii?Q?hPDkmSZWRSCMtSBiewySI5Xy3mRurUxPjghQtR+WmE33ETOGDy/jEx47VmLo?=
 =?us-ascii?Q?3GXRdrlnK07KFPKrPlJ/3gH3zBIHWn5GpgpuQvhPrWS/G5PdjcAEZnTM57mD?=
 =?us-ascii?Q?GFukgCKscyQraE/oRheY0FtJLmf2VSs6ireN1xepS8+rrEH0jV/vYG7FIkOl?=
 =?us-ascii?Q?mLVU3HZlC//floPM+RA3cvR3m+heV1RhBGwf0Yk1EQd6lJPxaEAzcttZiEWA?=
 =?us-ascii?Q?IIsF1wDxV+xEim5fw1ubqaDb67w9Ry2kdimsrn+i61yU8sNd47RwAZ2GZVOv?=
 =?us-ascii?Q?q5xuihTNN0oSXqeclqCEpUQlhCDuZxE8W0HpOe29D89LHeCf+VdD1bAL6Btm?=
 =?us-ascii?Q?2R/Ep0a3Qxc5Xvl5rz5WzGUkjPJ/tthf0xqDYq9Fyd0+eNg4OqiJtO6Ar82n?=
 =?us-ascii?Q?Tf0/JpXwDKMj3FlWZPQkQCWiMgtrevaUxhv6zVL5fuzRKRrCYN3m5eDc11kb?=
 =?us-ascii?Q?aluWBkqkN8w+doiymWapVBOww9xlbLgte4mWYyEOxhMvYaEocZ0FBWbhq2Tb?=
 =?us-ascii?Q?qSSKdk5l/1AolQF7AzIMrlh5EWr1GIUPOdyP8sc66dXKB2EJMMsEg8hGPQBW?=
 =?us-ascii?Q?AkGfC5iZNE5eEXaaiM+WDgpmqgju6jtayuuTlmFlmPbe9wfIu00KPpqRlVlw?=
 =?us-ascii?Q?qvsIlkmKxshcr9AWZ7SnIclwz9gULDe699JBtNgQWh0NdYdcAV/AoBfIWGUt?=
 =?us-ascii?Q?RgOuxiZDNpPS6ZyGB3HHSm/eAj9nLfJ6L1ZhLJ5d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cca630-b033-47e5-256c-08dd54bd14e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:22:03.2275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMo7NbZpG2FgZi4uv8Q4YzMtP3tVh/ujKMATs8GUAhYTozSBmb/hOKsiiFmoH+LnGCnv9e7FUdEjbBkxyhu2wcFR75V73KPxAvXaHRFK11M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7743
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Monday, February 24, 2025 9:31 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>
> Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submissi=
on
>=20
> On Sun, Feb 23, 2025 at 07:50:20PM -0800, Matthew Brost wrote:
> > On Sat, Feb 22, 2025 at 12:17:51AM -0700, Upadhyay, Tejas wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Friday, February 21, 2025 10:54 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > > <himal.prasad.ghimiray@intel.com>; Nilawar, Badal
> > > > <badal.nilawar@intel.com>
> > > > Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before
> > > > submission
> > > >
> > > > On Thu, Feb 20, 2025 at 06:08:59PM +0530, Tejas Upadhyay wrote:
> > > > > Async call to __guc_exec_queue_fini_async frees scheduler while
> > > > > some scheduler submission would have already started.
> > > > > To handle such small window race case, submission should only
> > > > > start when scheduler is ready.
> > > > >
> > > > > It will help to solve below which is not easily reproducible,
> > > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
> > > > >
> > > >
> > > > I don't think this help. We can only enter
> > > > xe_sched_submission_start if exec queue is in
> > > > &guc->submission_state.exec_queue_lookup and remove the exec queue
> > > > under a mutex in release_guc_id before we call xe_sched_fini which
> > > > flips the ready state to false. We then immediately free the schedu=
ler -
> we'd be getting a UAF in xe_sched_submission_start anyways.
> >
> > This assessment isn't exactly correct. Rather we should not be calling
> > start after we call stop in xe_exec_queue_fini.
> >
> > > >
> > > > The gitlab issue looks like a memory corruption. Basically it is
> > > > saying a variable which is a bool is reading 107 which shouldn't be
> possible.
> > >
> > > It gets issue, while accessing drm_sched_rq *rq, look at below,
> > >
> > > static struct drm_sched_entity *
> > > drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> > >                                 struct drm_sched_rq *rq) {
> > >         struct rb_node *rb;
> > >
> > >         spin_lock(&rq->lock); --> here it crashes
> > >
> > > Async free of sched_rq happens at,
> > >  void xe_sched_fini(struct xe_gpu_scheduler *sched) {
> > >         xe_sched_submission_stop(sched);
> > >         drm_sched_fini(&sched->base); --> here it frees sched_rq and
> > > marks sched_ready =3D false) }
> > >
> > > It looks like inbetween drm_sched_fini and xe_exec_queue_fini we are
> > > hitting this issue, which might be avoided with check mentioned here
> > > in patch. I saw similar check being done but other drivers look
> > > below in drivers/gpu/drm/amd/amdgpu/amdgpu_job.c,
> >
> > We shouldn't be calling start after xe_exec_queue_fini here. If we
> > are, that is the bug.
> >
> > >                         if (amdgpu_ring_sched_ready(ring))
> > >                                 drm_sched_start(&ring->sched, 0);
> > >
> > >
> > > Dump stack details :
> > > [ 1481.378550]
> > >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [ 1481.385791] BUG: KASAN: slab-use-after-free in __lock_acquire
> > > (kernel/locking/lockdep.c:5089) [ 1481.392598] Read of size 8 at
> > > addr ffff88812352a7a0 by task kworker/u128:11/2827
> > >
> > > [ 1481.401506] CPU: 17 UID: 0 PID: 2827 Comm: kworker/u128:11 Not
> > > tainted 6.13.0xe-ptl+ #1 [ 1481.409475] Hardware name: Intel
> > > Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB,
> > > BIOS RPLSFWI1.R00.5045.A00.2401260733 01/26/2024 [ 1481.422824]
> Workqueue:  drm_sched_run_job_work [gpu_sched] [ 1481.428348] Call
> Trace:
> > > [ 1481.430803]  <TASK>
> > > [ 1481.432913] dump_stack_lvl (lib/dump_stack.c:123) [ 1481.436589]
> > > print_report (mm/kasan/report.c:379 mm/kasan/report.c:489) [
> > > 1481.440206] ? __virt_addr_valid
> > > (./arch/x86/include/asm/preempt.h:94 ./include/linux/rcupdate.h:964
> > > ./include/linux/mmzone.h:2058 arch/x86/mm/physaddr.c:65) [
> > > 1481.444511] ? __lock_acquire (kernel/locking/lockdep.c:5089) [
> > > 1481.448527] kasan_report (mm/kasan/report.c:604) [ 1481.452141] ?
> > > __lock_acquire (kernel/locking/lockdep.c:5089) [ 1481.456181]
> > > __lock_acquire (kernel/locking/lockdep.c:5089) [ 1481.460030] ?
> > > check_chain_key (kernel/locking/lockdep.c:3967) [ 1481.464137] ?
> > > __lock_acquire (kernel/locking/lockdep.c:5240) [ 1481.468240] ?
> > > __pfx___lock_acquire (kernel/locking/lockdep.c:5077) [ 1481.472604]
> > > lock_acquire (kernel/locking/lockdep.c:467
> > > kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814) [
> > > 1481.476331] ? drm_sched_run_job_work
> > > (drivers/gpu/drm/scheduler/sched_main.c:344
> > > drivers/gpu/drm/scheduler/sched_main.c:1068
> > > drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched [
> > > 1481.482099] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817) [
> > > 1481.486292] ? lock_acquire (kernel/locking/lockdep.c:467
> > > kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814) [
> > > 1481.490143] ? process_one_work (kernel/workqueue.c:3212) [
> > > 1481.494360] _raw_spin_lock (./include/linux/spinlock_api_smp.h:134
> > > kernel/locking/spinlock.c:154) [ 1481.498061] ?
> > > drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main.c:344
> > > drivers/gpu/drm/scheduler/sched_main.c:1068
> > > drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched [
> > > 1481.503825] drm_sched_run_job_work
> > > (drivers/gpu/drm/scheduler/sched_main.c:344
> > > drivers/gpu/drm/scheduler/sched_main.c:1068
> > > drivers/gpu/drm/scheduler/sched_main.c:1199) gpu_sched
> >
> > This worker is flushed via xe_sched_submission_stop in xe_sched_fini.
> > Again we shouldn't be calling xe_sched_submission_start after this. If
> > we are, this is a bug. We'd still get a UAF if we did this too as the
> > scheduler memory is immediately freed after calling xe_sched_fini too.
> >
>=20
> Maybe add a cancel_work_sync(&ge->sched.base.work_tdr) in
> __guc_exec_queue_fini_asyns before calling xe_sched_fini.

Hmm, this looks to be good solution, as I am suspecting Job_timeout is only=
 triggering the submission start again in that narrow race area before exec=
_queue_fini and after sched_fini. Looks like this should also help. Let me =
test this.

Tejas
>=20
> Matt
>=20
> > Matt
> >
> > > [ 1481.509428] process_one_work (kernel/workqueue.c:3236) [
> > > 1481.513477] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817) [
> > > 1481.517693] ? __pfx_process_one_work (kernel/workqueue.c:3138) [
> > > 1481.522275] ? __list_add_valid_or_report (lib/list_debug.c:32) [
> > > 1481.527155] worker_thread (kernel/workqueue.c:3311
> > > kernel/workqueue.c:3398) [ 1481.530966] ? __pfx_worker_thread
> > > (kernel/workqueue.c:3344) [ 1481.535243] kthread
> > > (kernel/kthread.c:389) [ 1481.538510] ? kthread
> > > (kernel/kthread.c:374) [ 1481.541824] ? __pfx_kthread
> > > (kernel/kthread.c:342) [ 1481.545569] ret_from_fork
> > > (arch/x86/kernel/process.c:147) [ 1481.549203] ? __pfx_kthread
> > > (kernel/kthread.c:342) [ 1481.552986] ret_from_fork_asm
> > > (arch/x86/entry/entry_64.S:257) [ 1481.556918]  </TASK>
> > >
> > > [ 1481.560615] Allocated by task 8713:
> > > [ 1481.564099] kasan_save_stack (mm/kasan/common.c:48) [
> > > 1481.564104] kasan_save_track (./arch/x86/include/asm/current.h:49
> > > mm/kasan/common.c:60 mm/kasan/common.c:69) [ 1481.564108]
> > > __kasan_kmalloc (mm/kasan/common.c:398) [ 1481.564112]
> > > drm_sched_init (drivers/gpu/drm/scheduler/sched_main.c:1314)
> > > gpu_sched [ 1481.564121] guc_exec_queue_init
> > > (drivers/gpu/drm/xe/xe_guc_submit.c:1445 (discriminator 6)) xe [
> > > 1481.564349] xe_exec_queue_create
> > > (drivers/gpu/drm/xe/xe_exec_queue.c:152
> > > drivers/gpu/drm/xe/xe_exec_queue.c:183) xe [ 1481.564563]
> > > xe_exec_queue_create_ioctl (drivers/gpu/drm/xe/xe_exec_queue.c:687)
> > > xe [ 1481.564777] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:796)
> > > drm [ 1481.564859] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:894) drm [
> > > 1481.564937] xe_drm_ioctl (drivers/gpu/drm/xe/xe_device.c:210) xe [
> > > 1481.565149] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:906
> > > fs/ioctl.c:892 fs/ioctl.c:892) [ 1481.565154] do_syscall_64
> > > (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) [
> > > 1481.565159] entry_SYSCALL_64_after_hwframe
> > > (arch/x86/entry/entry_64.S:130)
> > >
> > > Tejas
> > > >
> > > > Matt
> > > >
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > > index 50361b4638f9..42ca3c4a299a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > > @@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler
> > > > > *sched)
> > > > >
> > > > >  void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
> > > > > {
> > > > > +	/* Async call to __guc_exec_queue_fini_async frees scheduler
> > > > > +	 * while some scheduler submission would have already
> started.
> > > > > +	 * To handle such small window race case, submission should
> only
> > > > > +	 * start when scheduler is ready.
> > > > > +	 */
> > > > > +	if (!drm_sched_wqueue_ready(&sched->base))
> > > > > +		return;
> > > > > +
> > > > >  	drm_sched_wqueue_start(&sched->base);
> > > > >  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
> > > > }
> > > > > --
> > > > > 2.34.1
> > > > >
