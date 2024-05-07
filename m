Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A72C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 10:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863EB10EA98;
	Tue,  7 May 2024 10:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAWQ1CGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAD310EA98
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715078347; x=1746614347;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OvF2O7D20pBDNwyaal5cy1sj45eop3bFmKkGxLi1Nzo=;
 b=GAWQ1CGp2iA58EvvgFtktLf0m4Da01Lqu8fFbIUjLC4ynBmfee+74u7S
 W597X0No+61bVx0u2iSSCpkWgLIlAxpSlpJmMQC5Hd/nmaBFhrgM5nzuh
 0VVdijGyFSC3vwBDQweF72qLIwSkeDXybc6uDBZQBql1a4lzrEjKjSrj7
 ThDvpohHFFSJ+4vfMWrGzpwtd+8X1IFke7XhiBsTtEdUAwCUqXs0Pzi2E
 1sVAHSKWOl2Vl3vnqOQP43Y46XMJ0mhaUAQmisXo+yfAzVpoPTBsjzhP7
 Xh5ktGR5NqR4uFKChS8T3uu2RXjCuIepvxec2/Cn3zcqUsAP+rR6UnVdx A==;
X-CSE-ConnectionGUID: yZCTqptYReClKfS2pVDDRg==
X-CSE-MsgGUID: KlaVQ56yQmWUCp1vbQz+KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11025507"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="11025507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 03:39:03 -0700
X-CSE-ConnectionGUID: eSQ4rTScQAilHRw8ecAPGA==
X-CSE-MsgGUID: 6D/bV6NlRhe+tkMMy8E5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="28366005"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 03:35:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 03:35:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 03:35:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 03:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhE/oqG6VW1+l5qBiX7iQaiaycMpi9td4uK17QJyAxiUKx/8NML7lVZ0RkjhbtMFEmUZ5uPKcpnMZlGms7rMeN/+++5qOdci6H99XU2T630OzrjnFqNoYcoB6DEjFBQuUM5C6R0xpP0Zm6cHF7Q7TBK9Mj0L+G50SR5J9zWe++UinJKCoUvvXC9+cGoLDVdLnn6LcjnRb9b32onWEE0+kRhHqt9qKj4SpOVcBGkp+hvi4kvL4EQEbiWVKQ+Y7ZcKldNgkdTbIqnbVew0uHhBVNdhLx1shTP1HObPAdP1+6uUrh1JaywAc0MAC8fxJyHPFkiDINsFmyFxJioRvw2aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5qwkGyjp3iW5XT+d896klm83mpBQaUve4juyfHHn1Y=;
 b=CTSPdkX0p0PcbQtnKBGk6wvIegrOVzQr994p0dW3WDwjDja0N78cncBkYmEbJ+vroeHFheZK7JRwQXK8V+ymgSAVSLeUmEyTicVDNsFGfNcLl4CZMkaKJseur57ahWfrTFleKXtEPFzTBxTbLvMkNPUAGQ9+qikjtLkT4kiNI72kjDjdSd86XER0ysAYita34YgAV97NXD3otTWW6OW1v+QHN8IIvNX4tcEKTHlzC7mD30x3rdtD17vQZ5o1AqKrMCHENoj9FtlfgyafouDBpxVhAOjC+XMiIIGkEzOVi8x7dca+IZXM2HwdUW7IhOuPZh4+9z3Q7uMn70jld7zKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 10:35:57 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 10:35:55 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
Thread-Topic: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
Thread-Index: AQHanY4D6BSaPH/snUa3U9rpmOY4CbGLmQWA
Date: Tue, 7 May 2024 10:35:55 +0000
Message-ID: <CY5PR11MB6211F1100FE2776643449B3195E42@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-7-rodrigo.vivi@intel.com>
In-Reply-To: <20240503191309.7022-7-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA1PR11MB8491:EE_
x-ms-office365-filtering-correlation-id: a62795b2-2d1a-4e40-f656-08dc6e8179f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?9F4WAQX7S0TzZ2JFbkEkkXW2hJune7RS6eaHeiJUwxDP6nxeNqWaZ/i+fNz3?=
 =?us-ascii?Q?Mb8pvQjm13kMHU0rInIyNR4MncoWXGIQe3JHwQV8XhMaOfQGQlix2fHHZtfL?=
 =?us-ascii?Q?Eb8AF+UK4MWU3CK4ZMAAqOEIpTxHoZtg9UIjpoDT99kld4vUuqUUiGeJAs1O?=
 =?us-ascii?Q?lw4hibrBaI3LQNozj/mjQjY7QaOhLWKgPaV+QZ0akq2e6YEHRu8UFK2KGJfQ?=
 =?us-ascii?Q?JdRh8f40sYJca78MqKz2tzq99K5eUr97jkxNne+Z3m/541Cl9k1mJpwP6kdK?=
 =?us-ascii?Q?Z2j3VJkZswZXkPYjr5WtU3gD06/Su24/KMuawUF6ezVJ+v/oEWqYQ8Eg5O34?=
 =?us-ascii?Q?ptfNlLN8bd9nH4/HFvQX1Io5/qe7n7+S6pRZCppsGSJw5kSc32PHyib2a5Je?=
 =?us-ascii?Q?arXCjTLu0LA01oLOi00Z+fnbfcbMWPYvK2ajwgr2yhXs6M73636C7Po1Qrx4?=
 =?us-ascii?Q?h1s2FdVyg+kkwaIxYVhTS3Heyhq55i9Yj03Qa0EwMnzlxaUJF6HUE21NlM1z?=
 =?us-ascii?Q?WOcqwxoQX+RTOUNMXXNam18jY0BJWJwijlyjdq7RaZth/wv7aFKszfqV/tyz?=
 =?us-ascii?Q?tEWsjgT1zUlR4Bv+fpvPxRSzKWIocgsNH/XQ7V+zzAv7owXVLoV1f5gA+1OD?=
 =?us-ascii?Q?bcCOyiGwvSqoVo2DxClkbDYAhytyAfy7FBDZs8AsKvvhQhDqbmiwFJAnDf3S?=
 =?us-ascii?Q?YqOMBna+JdxgYgTpu4uNNzEE3JEfD32gMdG/9PXnOIR1NFXj7MTWLy8XmBFK?=
 =?us-ascii?Q?HQ7taj3QRGUbo0BuZrPmz9eABwZtjy4TOBiFdfD7wCalDACZuV8V+eRRX8gy?=
 =?us-ascii?Q?vh+9ht3XvcLT8C+9lYVA7gE+RpQWvJCvjHOHYzKRxAn9CpZwTIVTYKyWgZYs?=
 =?us-ascii?Q?upE4IU+fhot17ewR1Nxi2klNkH4jiu83T+NM7F5MuAfua2Oxr2K0TP0NJG03?=
 =?us-ascii?Q?XQTvvjU34RZQEZp47r5cD8lVEkvFhxex9rlMbwqzhzgeVRXpbeQk3RPtGZam?=
 =?us-ascii?Q?qFuIgsNYbURDVcMf+Ml2ZLJVcBXr/4HLtHcQhTtF3IdvtUWmUgCncrYuuEGh?=
 =?us-ascii?Q?hFwAjaCJNcAxffWMRYNuzR5QpjML+85ItVidJb0QwnPHBkz1qGDcTO+lDL2l?=
 =?us-ascii?Q?7MnIlw+GrI1jTAv0Y6pcm2mHuca4iHw37+Ou/a2bBP8kAuMQPkCQRxLHSDO2?=
 =?us-ascii?Q?fIax8zOoHOKiaYyQZL9gOBtGB2Ph0tL/EMj1XDpX8Zu4SQwqp1Sgpj64BOoO?=
 =?us-ascii?Q?TXJKjrTlxs+SvZd7R6Ys1r98RWNentIVIBPi4U370IqwOplmQvVVx/ezx0bT?=
 =?us-ascii?Q?fsdsryQvz4OBuxXQF4Ii/vNSCwOOT5a4lSXTUdiywJQXIQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LqbM5W88bouOMgJ/tgJQMiA86TmJ1ky/lh8/6w496DXWdPV1RH8c+LseK+IU?=
 =?us-ascii?Q?LJ0sBIHUKPvHLdQoh4bVFbE7pw2C4GnyafWU+vKMKSU1n5q0SW/L3egxMlZl?=
 =?us-ascii?Q?SuTJJw+QjokpOLPELvTplSGOcEnZHZaHOEv8vdK35H+iGQ7UR9wudybpVAP4?=
 =?us-ascii?Q?xacilmr844nxB3pfJ7Oz0NAfoxIQ1GisrS2480DD1f3UMkMJMrh5wCInz0Xr?=
 =?us-ascii?Q?RgqYfIIexUP2djbMRhW+FEcyG2ltvDfu7A0GLFahh7WYQSEVWu0zdErnLVr/?=
 =?us-ascii?Q?TPiYTz95cenrYts5vymMiFY5P0TZhKIR3LxgYE5TUop3ebamnG0gZit17+bY?=
 =?us-ascii?Q?PwesaPJrcBaIk6Wk4wKm3E6/LQFaRAzr0+8krAun4oSLNFLHxNcZC37OqKGT?=
 =?us-ascii?Q?vhSAv3fC/cKDGZ8InKQHGR4cPicabWHF0KdlQa7Ap8u6EyVEro2skSBleKCx?=
 =?us-ascii?Q?3ncFxLDZR3CiUcjcYRcSnu38WScpca7H+7oF2wy6+0h2ToSfDtaY9iCX7Ih3?=
 =?us-ascii?Q?gE6dAE8QzsXeaJXRm0Rnrg2sdJyCH0X0hfL9GPZvuuUMY7kYk/o7OQMe0NcY?=
 =?us-ascii?Q?zTxp8n18P6N95yrIeeZgdoXkHDDu69fEeI8psJzUKSt4kVqdbzgarHOdDuM+?=
 =?us-ascii?Q?mG6C1WGla55OyHZ1MEQVCpiD5I+dWDOGhpFz2jlAgRQr9lZ3GlOMh2ieFD+Z?=
 =?us-ascii?Q?S/erAY97SGHhL5pgfTZAv51T3rBR7SQ8rxyJSXC3G83lT8tw/ZfB5EdiiGTW?=
 =?us-ascii?Q?VYOcMg0TZ8mVJVqLElCIQSO5jORDgwKU7NLND/z79OyhbQyhJVMd9bbOPddF?=
 =?us-ascii?Q?uRRzcLriit+wiDAFsogujyjhIhvPQe72l3YRF5XfzdA4lcFvjTLpXzEXd+fy?=
 =?us-ascii?Q?+pLHuTSBGbzp3yXOqIkMPZWf2Qpg144zOOpHjFMY9JTBBYK+r/xYr52QFdjk?=
 =?us-ascii?Q?rF2yKkgS61Us02qw1j0MlEM2z0+4asUA2UrCI9YCAgjqd6LGgZn84GlSegUJ?=
 =?us-ascii?Q?61rMgm+DRyPNuprRzYSnmBTSEeI7u4tSJTI+50NyFaN6s2NOoR8XTwnoO6hr?=
 =?us-ascii?Q?+sC6DWQZMkQENTwFM17QPmZsa1RMY24PuVBeIGNMotowMCnuDtk7YCwrwBtf?=
 =?us-ascii?Q?el1WOtQiL536zMeAecw5fkMkpCZaFnZdoGWZJGWRj/CZNoS6cYKXzkD8UQMR?=
 =?us-ascii?Q?TE9keZhYLNNuwzfc7C2hqqParIkUnTR2OCx5GKyuIgvaKf1ZW0oyIU6RUDqS?=
 =?us-ascii?Q?RyTNxTVes7F1iVFFmqJQ3BXAdRGVFNmfHRYq/R0lzE92G2G85QssIiiC+b+y?=
 =?us-ascii?Q?djCAPH4gVRHnQawXINrheUsULhLWWweK6ni8Tn6ibpFEbKlz+A1KdsQcAi7q?=
 =?us-ascii?Q?6KYH0RjziarqKncvb4ayEZMliOq0Dmw1BUbEoerwjS8hTa+uEg9Wi7+1B/Ro?=
 =?us-ascii?Q?kHvJYP7zEha3zPVF4Ukk9gW1LHlWY8EQtEkvG+lOdg2kHfF45fTs4SCTCd9w?=
 =?us-ascii?Q?dKL7fuNl8G/VNsY+tz8eQRe3wFzkrwaGjTQN7XfkeOauzzurhCY2swb4nP0b?=
 =?us-ascii?Q?QiIYmyWUAWk5wcwrMAZKGHjmSvzcNizi6enDUmnl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62795b2-2d1a-4e40-f656-08dc6e8179f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 10:35:55.5504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvDb/BtiUK2TL9zOalXRvWEHMz9yrYE22OYvl4kn+lugSATvSzQRVC9zzdqtjGk18cZJVJY05aWsVLoGMa5W2WsXN9bWD9SONtP495fDvT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Saturday, May 4, 2024 12:43 AM
> To: intel-xe@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Dugast, Francois <francois.dugast@intel.com>;
> thomas.hellstrom@linux.intel.com; Auld, Matthew
> <matthew.auld@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
>=20
> GuC reset status is not reliable for this purpose and it is once in a whi=
le
> ending up in a situation of D3Cold, where power_reset is false and withou=
t
> the proper memory restoration the GuC reload and Display will fail to com=
e
> back from D3Cold.
>=20
> So, let's do a full restoration of everything if we have a risk of losing=
 power,
> without further optimizations.
>=20
> v2: also remove the gut_in_reset function (Anshuman)
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ---
>  drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
>  drivers/gpu/drm/xe/xe_guc.h          |  1 -
>  drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
>  4 files changed, 2 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 0f68c55ea405..863ba49fedea 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -427,9 +427,6 @@ struct xe_device {
>  		/** @d3cold.allowed: Indicates if d3cold is a valid device
> state */
>  		bool allowed;
>=20
> -		/** @d3cold.power_lost: Indicates if card has really lost
> power. */
> -		bool power_lost;
> -
>  		/**
>  		 * @d3cold.vram_threshold:
>  		 *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> 0c9938e0ab8c..7860b720a99c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,30 +938,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct
> drm_printer *p)
>  	xe_guc_ct_print(&guc->ct, p, false);
>  	xe_guc_submit_print(guc, p);
>  }
> -
> -/**
> - * xe_guc_in_reset() - Detect if GuC MIA is in reset.
> - * @guc: The GuC object
> - *
> - * This function detects runtime resume from d3cold by leveraging
> - * GUC_STATUS, GUC doesn't get reset during d3hot,
> - * it strictly to be called from RPM resume handler.
> - *
> - * Return: true if failed to get forcewake or GuC MIA is in Reset,
> - * otherwise false.
> - */
> -bool xe_guc_in_reset(struct xe_guc *guc) -{
> -	struct xe_gt *gt =3D guc_to_gt(guc);
> -	u32 status;
> -	int err;
> -
> -	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return true;
> -
> -	status =3D xe_mmio_read32(gt, GUC_STATUS);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -
> -	return  status & GS_MIA_IN_RESET;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index a3c92b74a3d5..af59c9545753 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);  void
> xe_guc_stop_prepare(struct xe_guc *guc);  void xe_guc_stop(struct xe_guc
> *guc);  int xe_guc_start(struct xe_guc *guc); -bool xe_guc_in_reset(struc=
t
> xe_guc *guc);
>=20
>  static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class clas=
s)  {
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> 8500dc93f695..fa099a8981e7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>=20
>  	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>=20
> -	/*
> -	 * It can be possible that xe has allowed d3cold but other pcie
> devices
> -	 * in gfx card soc would have blocked d3cold, therefore card has not
> -	 * really lost power. Detecting primary Gt power is sufficient.
> -	 */
> -	gt =3D xe_device_get_gt(xe, 0);
> -	xe->d3cold.power_lost =3D xe_guc_in_reset(&gt->uc.guc);
> -
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
>  		err =3D xe_pcode_ready(xe, true);
>  		if (err)
>  			goto out;
> @@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
>=20
> -	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +	if (xe->d3cold.allowed) {
>  		xe_display_pm_resume(xe, true);
>  		err =3D xe_bo_restore_user(xe);
>  		if (err)
> --
> 2.44.0

