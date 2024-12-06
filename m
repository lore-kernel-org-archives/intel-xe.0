Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC27E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 18:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD64A10E13A;
	Fri,  6 Dec 2024 18:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXslDm81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4EE10E13A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733508582; x=1765044582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XSuRrdMtFQMbdbPBZ7fHN9+TQVPD3zzf28qW3AjRtzg=;
 b=bXslDm81NlQ+WBuW3J2rSc9S9Y/0DLOBLW3H7eB3shMTtYH4D9sqiH98
 LxlPiNDlfn0yBcfcQmBeGfI8f0Z07qe9E4wc8/MvlWO0p3hHYO+vNxM4B
 xIobBkoO4nv62sOv5O+YR5Fhku6AuvAxhC13yB2rtY8KBzwdLT2joqYrs
 rBlkxkZ7f9m4vUhxbsClzmwTmG8kGtgX3al2EiR1c1k+gG8yaTwkNJTRZ
 ikY1715x6i9EY1jgkmH6XZFMfGVuhztIldkPxYTHa+0gaKvTBZGWhpipY
 TWm8WWel7U0Y+u3odM14lmVcwy87hTdSfpI9yVLbEpsJ8YZ9UchOn30nK Q==;
X-CSE-ConnectionGUID: ZFDxSj+ORTe0jauL/kBsgg==
X-CSE-MsgGUID: T7uVGfyKTsmJFFYCRNxImg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33790732"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33790732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 10:09:41 -0800
X-CSE-ConnectionGUID: hac4jFwLQaeqpOBOBIl5XA==
X-CSE-MsgGUID: +i271fMhSM29vE/VLjUNGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="98535760"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 10:09:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 10:09:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 10:09:40 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 10:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e88lylgStLFqTYpmWbu+v/Sp7opDr771Eyg45GY/Fc1CtP0cszWA3BjrOuVHxpiu6lwN48svT+GQa0yTLjIRGtGTFOAQR0jyweKKLcxA0emEf68D50ZPlMk6643HVed7sA2CB4k6fA6AdpdO2tj5PGC7J/Oad4gKACU39ZZNZs04GGPumMnV2HQHdzLIv7SIb/u2zhZrDGk9cIt0MLR5XBRV6nJgFIwJVygTM4bA4VbeQS0a36VzskAo0LoQVWqcxamf6g5F2p7zmbmuPfvPGpc075na4XgUb12rrv4OEVOz0GcW4IugnZzlDYcDS6A9AB/KFQbq25BUK2Z4cWya8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KVogp+eKndS/5hOO674hQpADO7IckKRvNs2FVrz+Pk=;
 b=QmZVDfUCHGv9qJ1ZtvU9YQoPm5PJAKA7iDxtIkhmyIIMg5144xBPVBJVNUJnDvFELoFtekO5vX4TfvEd5VWhp1g9HS2Gu/TTGWKi84jlCq/k5d8SEhYPNaM+HGHQFa1fHhdFXZQZoPklHmiEREEa4F4oFM9yMpeWgqsNCjyNdViMXv8MqQEwDTxouD0L3wqlvr77mCkXlkp0b5yhP7tM+WRQo7bIzjojymhW/xxZNEXjtxPFyiN79Zhk3/rYaVbNHbRGeBw6nI6m0+XCGwwyb6/zDa5QFW1x/yxHjBMnKn5qi2OmaF5nhVdvl1fUdrZmf31W1ua7KK5OxJoQyUYetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 18:09:37 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 18:09:37 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_sync: Add debug printing to check_ufence
Thread-Topic: [PATCH] drm/xe/xe_sync: Add debug printing to check_ufence
Thread-Index: AQHbRPLu+lsyNJKgXkSnAQ46E9COOLLZXEiAgAAsQkA=
Date: Fri, 6 Dec 2024 18:09:37 +0000
Message-ID: <CH0PR11MB5444FFFCB09DC25E76C56046E5312@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241202194631.106940-1-jonathan.cavitt@intel.com>
 <Z1MXbTAqX11wbRmY@intel.com>
In-Reply-To: <Z1MXbTAqX11wbRmY@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB7965:EE_
x-ms-office365-filtering-correlation-id: 84a4f219-6d75-4894-15de-08dd1621253c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qnZy7wjFjTjkb/lpv08unVhbMSSfr2AI/eg/xQ3rDXl5iRZmF/n3ePf1fwWp?=
 =?us-ascii?Q?lrdzz6Ng7Rg9cc/Kg4NYl+tBkmwZjPbg04CFyanjAzfxAn8ozOsgy2kyzImH?=
 =?us-ascii?Q?Z+4/7uPioZGdmsxxXzmju8uIMaovgAebrAR3s0hGZvC7hUiFREcBELHxzfyO?=
 =?us-ascii?Q?t05RcU+VkNRCo5o0PaKSLKF06sS3dwtBtbJNuMs2xO0Qc2Ytryx+hTS5ASwS?=
 =?us-ascii?Q?FNnch2U/ioz1Tqh6WMjz82KPNJtVUhJfzvGoFRTJLHYBAWSqVkkFo/W/QY7T?=
 =?us-ascii?Q?uxZdbV6zTlvcQvyCXQW9J+yyaCASuUDvc1/oRiOaAwgo9B/ToLkxBwIcLdRZ?=
 =?us-ascii?Q?YoaV46bYTfPswbI3plh39soPH5rWUZSsrNcXZFMUIHS4ihzKS565AKDVc2ic?=
 =?us-ascii?Q?amBZ8tZ42ClqgjrGhvpqp5cJJZhhygTL2P0q+GkXRoP76m+IjHLIE6YIavk8?=
 =?us-ascii?Q?wAan9OcSpBRkxdO2KGXf1oHaA3VmHXCxgBy3XBFSOzHrTHNDdMTb4Xqjmwmt?=
 =?us-ascii?Q?i1HSLwVIMLG0i6mmJZUZcyZd0s1UOkkmRCVOqDmADSW5vfmj/USb1E8ZlNhP?=
 =?us-ascii?Q?cWX2Yg2MJS4uCZSNkdo/n0phvCkF877jGdi3eabupp9nLpreLXbkgGlsNTRb?=
 =?us-ascii?Q?M3bCCWZspf4kGUQh1Yv+7t11agQvS+r4oi/BZ1KZMMZn+OAR/hzUYSUvUraW?=
 =?us-ascii?Q?aNOrBa+mIuTxeZ5vRKEYw81N5ypDNnvZKYThZQj3BE8BvjAF9eJbAzvKJzdX?=
 =?us-ascii?Q?vXKhVFODQ851cWHxRu49OwRaGKtYeXVYRHMHleJmYtqMJF58N/NOzgRlynVR?=
 =?us-ascii?Q?iMD/RoGxuKlUX1k6nPpXn6+EkCED4TBdq6b/rd98//4TBw8wMmJWE5Bvf0uf?=
 =?us-ascii?Q?gNq/9bOvFQbYyid/4t2WwyV2N3NP2cAULXaw2ps9IZTIu3t55NttVD2C0R1W?=
 =?us-ascii?Q?Eg3i1WQjCNmH2bv5aN2HzscGaqK7JacgETdBW+BL7AUavhhcjGqji4KniVut?=
 =?us-ascii?Q?RLmE9aKKsYTdDvs3/FjcKMLyTDebQRmYLpfm2o3Nvdiaj95MOKQFoKw89ksj?=
 =?us-ascii?Q?fSq7AEfQMDEy1OYLzcPl3nbYOo4ev61qeUwXS/FYgkWdhtOHg4p+z8kheNWD?=
 =?us-ascii?Q?nn08m5U5yUohHNd+c4sGRfI2aksSHJQtT8sQ8dapIg9YQubFCSahQpKf52yu?=
 =?us-ascii?Q?wHJN2ZK+UrsCqsTvk5uCISD4rit3Rcb6XDK4NMNYSxtxK7X9R1tvpy5xhozg?=
 =?us-ascii?Q?vTrJXSANYtHaIcLoCiSenzbwZxl27+D2dVXpOt3m3T45Fij9lxvHEpQnCXZl?=
 =?us-ascii?Q?KcnSFl1CzKNODO6sAqfkaTk+274C67hVgrNxewM2np0Z/FzyCQFcBlwQXkF+?=
 =?us-ascii?Q?CkwFOmb5FzAv5QGvakPFlwwnNPKIdVmmy0+Olx1/3gYbIDy0Pw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YptCs/UZsLBbM4WrA+5dcHbIQns/zw5AK+RHleKmxY6ZuToiC+vi4P3yG73x?=
 =?us-ascii?Q?eZXDUc4+rLTJZwJT6QGAKB/oP1wRXuTcDKNcyPKiwx5TvFXu3bvqSsZFyakJ?=
 =?us-ascii?Q?2fMHfEbkWSX/W6ySdxGvNtiVGJ9mcqsBwqGxloHO2SAAWYrvAzm2yaCnKhl9?=
 =?us-ascii?Q?pNIw8ZGbUHD9t2bnzFm9VV4q+5JXreEojj+Av7bzkbU/HNU1r46O9lQv5OAa?=
 =?us-ascii?Q?C9h++Z6itcsNiJI02h5P4qMMnqXwV8cGzoGuPWjbPtkP1nYsP4l93uMblLTa?=
 =?us-ascii?Q?Nc05xc1iWayCrDil2YG8ew51vcgBva9Uxk9UjvyTsACAPNucBfXB1xgHafGr?=
 =?us-ascii?Q?OuH6CioFoC/a9tF3+PifA4szuoyozrOdvRm2RJRTICeIs8d8JPaiG8om0fNI?=
 =?us-ascii?Q?GY79NhA4yNiGcWpVjPb16pWuOBGNcFOFrEQZ3UWSvwQOhEbfj/566STcJBqP?=
 =?us-ascii?Q?Cbc5lgTtVYiXGD2KI1JX3E0SF7EdtfGXuHI1Q60V3Uflng8RQcHQ+fwgkUni?=
 =?us-ascii?Q?Iio808psIVvn5WOhETatQzjKaufY6ISvNTzzEt8c/gZm5rmlkzAJPCSB1H2y?=
 =?us-ascii?Q?kUWj8mIMiZz3RRlPwVTukfNHAoNRw2ZrytGzfXQdejE+ZXgebb2qi5xr9IFi?=
 =?us-ascii?Q?5J7OppDtr7W8iAV/9XElcBY0UH6wxWNH6TMcRrllPB4qQwpN1edN79xAm7kw?=
 =?us-ascii?Q?LrHNYOUMlV2QgJM7wShdtTl6dLKk1O3WfTKPrktU8jTGp+KIHX/DoDOpsALE?=
 =?us-ascii?Q?rvmimkbvDSiuwB5iDvgzOvJfemb6tkw3m8a1SS2B54iNgnMmGLWjHdU3nifk?=
 =?us-ascii?Q?EqR3Mn7A3qxc+p00Ie2YJMhDhyBzK+C94IPqLGSbbaDhLSWypzX2F1Qjogye?=
 =?us-ascii?Q?OImAHkOmFtuAeds+Jstp6zlTwGCdxUEQxF70D49hJ0SyJM81LgSctnkB82FP?=
 =?us-ascii?Q?umlEsTVanpHNmVKW3JJlWmyecB/Iuczi9uEI92/DYRzW1INkeYbjhN3R9O7u?=
 =?us-ascii?Q?pMoJZHTxdC2mJ0+hm+i6uY0O8AW9ffdkKGrUTGBNrCgeKCMorpZMrvIvRxAz?=
 =?us-ascii?Q?CLGgN/1uJ2DoAgr8bS+nvDBgAAi42xOZl90ixUEKQcfv29DxCQIFzFA222s8?=
 =?us-ascii?Q?J8wl0KBlSJ0yZxgaPhFaCf3mJkumLhn74N4Q6VlDh+OC1Y+IZMrxhd3eJSZT?=
 =?us-ascii?Q?iumDdEJlanEHRZrxKrpFL/0J+E/G6b4QYluqS1Ohhdgw8ahSAMN98X3Tq8KY?=
 =?us-ascii?Q?vMY35c+DuFr9bgZPlwTOqDfn44HvwJTcK0xtaNALNYepeRM0isqwv17yzyNc?=
 =?us-ascii?Q?JKpZ5cTaPdTA3BOgWUpD7Yc5a32JkqtnOxWCW4QTeXzfj9SY7onWUdTLJ5wZ?=
 =?us-ascii?Q?bkZqD1gp899ad8ssm6O86ut6+iqETw3c0ZhyTG0Lzkq9rn4YfGOzHlsmr4MG?=
 =?us-ascii?Q?o8jdRBofEL3wZ55ZgO5bVXio7EdjosQ9cLJo4QyHooKsSLxtTk6Oir1U6URn?=
 =?us-ascii?Q?ZPHNqCrKCC9tIw8Rxmggoxcl1pi24VPdoosPzM+z6Tzzkj/P4KDQyXjQlG9x?=
 =?us-ascii?Q?dEhL/aW/ueYk3c1WuxAF76q0TG6rbdlA+vPFavPW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a4f219-6d75-4894-15de-08dd1621253c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 18:09:37.0526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctnJiye2KfOXKzujsvpyAvyuHd5yXCAQ92iZ6ZD5tWqCU+dOf1eYFFjtukFyKMvgW9x1djMQQCTVOlCIsddvdcLy6wTm40jEMKnCjvVqvXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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

-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Friday, December 6, 2024 7:26 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_sync: Add debug printing to check_ufence
>=20
> On Mon, Dec 02, 2024 at 07:46:31PM +0000, Jonathan Cavitt wrote:
> > The xe_sync helper function check_ufence can occasionally report EBUSY
> > if the ufence has not been signalled yet.  EBUSY is a non-fatal error
> > value for the function, so it is not desireable to warn in cases where
> > EBUSY is reported because it is up to the user to decide if EBUSY is a
> > fatal error in their use cases.  However, we can and should report EBUS=
Y
> > to the debug logs for diagnostic purposes.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 610226c7c1ce..09ab7111e091 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2400,7 +2400,7 @@ static int op_lock_and_prep(struct drm_exec *exec=
, struct xe_vm *vm,
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		err =3D check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> > -		if (err)
> > +		if (XE_IOCTL_DBG(vm->xe, err))
>=20
> this macro is good for ioctl arguments check, not for errors dbg during i=
octl
> path...
>=20
> If really needed and not in a very critical latency path=20

It's not "strictly" necessary, but it would help with some diagnostics and =
shouldn't
incur any noticeable overhead, especially in the non-error cases.

> then we should add the dbg call directly I believe...

Understood.  I'll use vm_dbg instead.
-Jonathan Cavitt

>=20
> >  			break;
> > =20
> >  		err =3D vma_lock_and_validate(exec,
> > @@ -2413,7 +2413,7 @@ static int op_lock_and_prep(struct drm_exec *exec=
, struct xe_vm *vm,
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> >  		err =3D check_ufence(gpuva_to_vma(op->base.unmap.va));
> > -		if (err)
> > +		if (XE_IOCTL_DBG(vm->xe, err))
> >  			break;
> > =20
> >  		err =3D vma_lock_and_validate(exec,
> > --=20
> > 2.43.0
> >=20
>=20
