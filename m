Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FD7CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 21:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1D110F0DB;
	Tue, 29 Sep 2026 21:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jtkkv5IT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8810F0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790716070; x=1822252070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTuupdQXBsZOMfFumRYVu0zXKoP27NEg6cpOnUaPu0A=;
 b=Jtkkv5ITvVRivIxnE+LD0n/0F9Ct+KXA6SU7PfgccVyeO8aokJvHw2Tl
 cxfeRwrLey0K66a2J9qLxy87Onp8ZaK9iHHZ5MK77V6Cek04J9Ldx/esB
 xJeGKJFXD86qrIciWZyL0Dl17xWawKKsQre4q09Le2GoXul4HcMk/mnoP
 /1UU3I/ctJ2cU8DTL3vUeYn00IocC3awlvQrlbWaCR7e0Ba0uB2udlDmj
 cT51TCTaUN2vD9paTtd9LI6UBjFxm5K5lPPQaWHXFrbEuLLUvFw3SYrxX
 3AAaNJeLuIEUFJhZdDTKNrpBOPthlcAyPaN49usMzOl4xV4H334T2wTEP Q==;
X-CSE-ConnectionGUID: jav8LBjPQ26oSd3hB152YA==
X-CSE-MsgGUID: zb5nM9BHTV6K2DgMFq7NsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91466790"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91466790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:07:50 -0700
X-CSE-ConnectionGUID: L+FaRXlcT5qjG4hVlyfdPg==
X-CSE-MsgGUID: C/K2RFWlRLeI91nXz41YOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="278823243"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 14:07:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:07:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 14:07:49 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 14:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uptQy+tnLaVVsuEfM9HJ21NfoOlLhEdz+MYT8B1FWs4z4uZtv5IttuX7X2P7uaKtEgYWdS9utbwq8R9SlAz5+JxGTK9x79UaeG4VVGbJdXY3Gb6a9K7QFPRPzurmal4uwFOgF48hSKeIzXOKqznuHGNduTbzRnlf/Liy2of+hU8PvvP4GQDbVbfYXbWr0axaEmx62acBBOm1OZ7Yk/V5w3Wm2ZSCvm6OJYRH4+zRWP/7HfBuRL2JHtuv6edazcJkNqUQOKGDO+zX13Dqu0zDcMv31guz+B14KhuMnNAwfCQTUh38rqEiCvzy2Oub5+XZ3XPnSbiL2lKS0BeFHp7FCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIz63/7HgezAFqhNYsX+hytdOG4NbcwVyCbFxxZY99M=;
 b=eo/+W4PDUttZvCYyyJpzJ0cdgaD7nmQFetT/Rbeh8ARX6XpX5rMIeRlbV32DOwaS2dZS3ZR+aPy9f6RRI0RClx7wQK8mo8hQcjxpinQ01hfnw0v8askvC8qpUZYCgRjc+UldKIiKEXqYsVr3YuzAr6XRv8wsg+kultHuMQcm4yydOz+GTf8aTyJG4nn1vuTebyMzBunpUu0E9AydoyZfjIruFGhJhSBUkIbqE1+O25syWv9OJ9/KAbZqjxLsYhgesNhp/dmdTlw/a7FlmDxoYD5xlbI/EykMA+CZBUfwsNYI/SUMAENJOAYi9VLQ5JmKyJUltpm33PE+WuKVyL6t9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 21:07:44 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 21:07:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zuo,
 Alex" <alex.zuo@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dev@lankhorst.se" <dev@lankhorst.se>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/vm: Do not dma_fence_put zero fences in err_out
 path
Thread-Topic: [PATCH] drm/xe/vm: Do not dma_fence_put zero fences in err_out
 path
Thread-Index: AQHdUFUAYJDTZcm7cEqDiZTZepYTRrbmCmEAgAAAHnA=
Date: Tue, 29 Sep 2026 21:07:44 +0000
Message-ID: <CH0PR11MB53950A31C03573AEF12E8AC3E58C2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260929205606.1076177-1-jonathan.cavitt@intel.com>
 <arwm3uPEnUUmIBXZ@gsse-cloud1.jf.intel.com>
In-Reply-To: <arwm3uPEnUUmIBXZ@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|CH0PR11MB8165:EE_
x-ms-office365-filtering-correlation-id: cdf4092c-4584-40b6-5882-08df1e6db4db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|4143699003|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: MOAVXF49H697fMiZnqKrbPAggw0Vr2TSK0ZHHZBUal3Q5QLuggswndF6jFhjcP6fEjX8nNBFEkTklHAJDEjqm/VESQBMbUaFaY7RZj73BvUVlnZskocSR5Ly0cud3TxHoZA5WChcCRVo4+1nKKKa9K36fRH6+IrM9ovFzccnF/Vg6gWhszT7c7SmPfl3m2JjSeEYhZsLiQb0Nut90JhzYzVd/pnmikPPx/24NxaQ+k7ssRTcYaHOnszrrDy6kOLyFGdDxo0hlesXSOuR1N0KCQLlerxM1R4L98mI2T8cVQo5S8LsA4f3SfF+jwkINqhkjYj9cDJmY8RgivPFkg34Or0G0aP7mAmOE4/tXIH85sftyAmOAO8cbDisIFH3xrUkF0BpirCgBJIAwM0BD3Kz+O9f9Cu6zdiL/BBaOLrSgpJpewW5DOt7IScHUDcFwhSZQC3b9SAvniA5ylgFXTvvaa6noWIL0saVY+q2HAL/J3SP+JZtZDiSlz7MXUqYy9lsqXX5+sp3mUvDth0Ek1/QGrfleGN+hHRDJgxt164nOqb2bQl9b26ErPaPmWt6w/X8NwwjFu6VgDwqNKZQHFxLWeC8lTbqWKhCmygtRlzDxYheWkZdwqasMmp1P1dFIlSHqwbODGogFnm16FivKpa8UMW2bxZ5j/U5XLAvIuEWWKMKMuu9IMeGoXKuBH+a59fA4UmEYwhntJmRFFNL0vWyyUvZISW+AQDW+JN5MdtFirU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/CvhMenS9584GSFGPx3uZiZac5cOLhSDd+TErBLyU3Qk/qyGwOUhfPZ4JPEQ?=
 =?us-ascii?Q?j9NlbM0esuOEB8uS2kByFv5EdzHtssBf5wmUHrj9mat1LnbVjhOVIEWP3lb3?=
 =?us-ascii?Q?gAZJYtmmEjBjLuYX1R0y/qgvWkiND1Sgw/nq0F/Hm6WaaU+RGC8TaM/QV/9p?=
 =?us-ascii?Q?c9YBkfzZH/HAUyK+5Xtc0GJQU16BpxVnhxmE65VW991yjWwYb8wgwE/ylMTD?=
 =?us-ascii?Q?8ao1y4sC+JZngwtCE5m4bC+bmfFQP5L/q+ugzvNi/LIxZ8UKL4m3GEbC1xH1?=
 =?us-ascii?Q?ewYlOeM/KcNQ3KWtx7S9RWezfZBSgaAVSlijF4ep0bPwrsuXWawGsmgWVi8g?=
 =?us-ascii?Q?7VUfnvKi4GaQr0r6im5AYVHUqGzP3WPDHPLXGr4odAqAQuCMsSLYBiy06ncq?=
 =?us-ascii?Q?zGCzaXGg4KU6EJx6QHbzkP1ifvSCFvuUtuTRPfq5traBjKjHEIdd+HjlGMXv?=
 =?us-ascii?Q?U/ktpuGQILHmQ+jSxE4jSPetzQ7BkUTwtJFhQ4utjzZTdsHc8nVfzDJD/WPk?=
 =?us-ascii?Q?ozQW12IC4sTBXamTtou1fWJbvciOXqLVRA9hkNSqRGZV6aaQZdcWMzHcOmhO?=
 =?us-ascii?Q?jUUdRXMUNYgiFdKSDYlsLwsOJnH7n1eRgzv/fMDO/rNvzyrFSm13xTjttlJg?=
 =?us-ascii?Q?9rIOoy9WnoMtizVISEtjFvgQUKo3sftS376vdGgyoI/vsPgulP7KK3MwgUG6?=
 =?us-ascii?Q?2VdZMnjiJIiP762RDFpC8YHid/LYu3jzJuLnCO/FjGuBrxcSM52IZwhRbfn+?=
 =?us-ascii?Q?+DfdM/JXbjYlu8t8xMsYV4lVCqY/x9Mmm+5sRP+3Tfrc6WmtxMskpGeabHvf?=
 =?us-ascii?Q?8xv7sH90iBU4Isw9NwsBzshr/NCr983AiruZs4MqEx4/PptHU3ICLupm9n9K?=
 =?us-ascii?Q?s9gVIT5mHjeQY+3ozj0mQ5N/czkfKGLsOP3dZ+W+eZcVIDYO0F3FTd0LxN0F?=
 =?us-ascii?Q?MgvxdC/cVHVGoj0x2a5Mntbn8gTWpgp1UoW43AKpkAAiyAQNsbkfYHpyGx/t?=
 =?us-ascii?Q?s9pKc609kxaL9brCrXdXbv7hhWbB3TilQ1YDmrCaOEvO83STMR47Za3L1g+t?=
 =?us-ascii?Q?QsB/AkbA+vn48psOzBnIpyKZ6j4eqnJcukGGYaFfe7OHrAOEOyF4enb2rx8x?=
 =?us-ascii?Q?zg4ZjnOsakT2+DQ2NWrpvTrcnjXh967vrb5KR7RCtVh8C9iiVUFz/XyRJt1v?=
 =?us-ascii?Q?FutpD7Ir4Z0OL4oNm7UY5V5gt5G+wcbiaHnCedZ0P89KFj+BTRPdW/j+fCJj?=
 =?us-ascii?Q?fL3Bs1lVjxtTf9JHPqLZYMFX6AypMjiUBQkFlMOCUgO5XPC2awsxH9j9sYMQ?=
 =?us-ascii?Q?2Qpnhf6ngCtlsUA2MBTvQPtCEbjpJ73cR4mYSh986D4yOyEGkGK6pyzqMHkj?=
 =?us-ascii?Q?3PuiI9WBd9iTD0DbgjXc1rt6tXNV5IM96ZvtEF09yyP15ehjWdi9Rsou8Bhe?=
 =?us-ascii?Q?r/OJtMUsiLIKMZVRBA+no1ED6p3Vo2/WeH0Gij0DUz/PgEoLS9+6TXC+da2K?=
 =?us-ascii?Q?dbXpbDdPRDMyMsKZquPuBbhFsQOx35qEQcMVhtR4T3UR4tFnZXfdFy+fYwQC?=
 =?us-ascii?Q?oONl8z6LM91YRSjsNJdciyYqsLruatzztMkmgusDDkg8ke0r4TW3ESzG8pk2?=
 =?us-ascii?Q?ClJpgbiBc9JcyLV355TZgKHWC7v6qBREAS9Q7QZDOFT0pAP4ptTCUKy8FVh6?=
 =?us-ascii?Q?H0nZQhhXbONQ3uK/q657FhgPceXZDuCqKZF2mUvbAhZcKO78DRL4um9tXPtO?=
 =?us-ascii?Q?qVkIh8Exjg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wdoujM4j4terDxZwrZv8EAXgY16dJ1xHkKCPsdT/EoLjrJdjIpFCk3AjbGyoY8MvFAkvEAYxQDKceKodxJ/XFmkiwSK9a/0rpP/BsHmrQv1SzzCFEfPLLsXpp0pqW1WQH+/xlyPJL+XAHwpSgnP0flYXp+YIq1tKKri3WNzhaImKO0IguI6H1VWlY/bzruvd1T7C1EiDv7UCelItIgLHELKqu5tkdtpK2h5rbAfVmZDN3D2h26WoJgvTir5zKmOOQd3m2r+fgKmEFtgPxMowGB0Nd8lzSH7OAqBevAXEcg+as9XEpsrrobcXQ6EXjdcIvc1ihoqEnVnEiwepDHkkFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf4092c-4584-40b6-5882-08df1e6db4db
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 21:07:44.3520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDV2CRmJDW/QbGyqntbfLkLpu3fs6Y3eeyWtTmDq4EKf71Mtb777y9p1drFyga7NM+R+uTk8KkkZ7scWuTQxDk2nuzI8nhvyvhKw2qDjl68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, September 29, 2026 2:00 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Zuo, Alex <alex.zuo@intel.com>; Ghimira=
y, Himal Prasad <himal.prasad.ghimiray@intel.com>; Lin, Shuicheng <shuichen=
g.lin@intel.com>; dev@lankhorst.se
Subject: Re: [PATCH] drm/xe/vm: Do not dma_fence_put zero fences in err_out=
 path
>=20
> On Wed, Sep 30, 2026 at 04:56:06AM +0800, Jonathan Cavitt wrote:
> > It is not necessary to iterate over and dma_fence_put current_fence
> > fences in the err_out path of ops_execute because current_fences cannot
> > be non-zero when jumping to that section of code.
> >=20
> > Caught by static analysis.
> >=20
> > Fixes: f5708e761ed6 ("drm/xe: Add CPU bind layer")
>=20
> No fixes required, as not yet pulled and also isn't a functional issue.

I figured.  I thought I should include it just in case it was necessary to =
connect
the two patches for revert safety purposes (we don't want missing cleanup c=
ode
post-revert if it needed to be reverted for whatever reason), but it seems =
that
worry was unwarranted.

>=20
> I'll drop when merging.

Much appreciated.
-Jonathan Cavitt

>=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 425c678f4480..f159970bd34e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3575,8 +3575,6 @@ static struct dma_fence *ops_execute(struct xe_vm=
 *vm,
> > =20
> >  err_out:
> >  	xe_pt_update_ops_abort(xe, vops);
> > -	while (current_fence)
> > -		dma_fence_put(fences[--current_fence]);
> >  	kfree(fences);
> >  	kfree(cf);
> > =20
> > --=20
> > 2.43.0
> >=20
>=20
