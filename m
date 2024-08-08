Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E45DC52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 21:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589A510E81A;
	Thu,  8 Aug 2024 21:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXUeH0Lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E2110E81A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723151794; x=1754687794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lWpJwor0YNJPVbPEilM77YoBEhvaRI1zHBXudtqgkjc=;
 b=jXUeH0LcyFX/Ijbm+gzz67YIb4bW9FRHScxYi9lu2oCTSRwH/+1jGeaN
 rtQs+PsuAInlP/M+2v2BHajgOas5n4whYTjJ83E2lnalB9u6ZdLv+byk9
 ULZM6jfqUlCaQYVoc2GWH+esdtpwEAueGFyj0sOuDpPlpRnGLGFKx3sG6
 70S/hr3XSfb75HMijdrgZR8tmLB0X53UvSWawrJNExNy9k2760WGvhN6U
 lnmW9/RXrFAoR1qYeh2jVWLeWnKnuD+F/vwVZ9rtIxrva7oDE7Unu/p9h
 AsdYp7y5Txa4FXeiPAudX5hZybKt/DQibhEEnwKHaKg5+phKGG8IuuDCt Q==;
X-CSE-ConnectionGUID: sH+a4fpIRYG0mJZSoNt9Ig==
X-CSE-MsgGUID: bWFmbLw8TauKE64Khq3R2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43822019"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="43822019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 14:16:33 -0700
X-CSE-ConnectionGUID: 4tBrhOOXRym/2U9UNqkNZg==
X-CSE-MsgGUID: FJQjJROmQWKtBAX3TwXL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57589665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 14:16:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:16:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 14:16:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 14:16:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 14:16:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbExhvw5LJUl1HY+Gbimiq1iDk6DSnKhlcaJ7d0eIQCsF2gH4o9kJ+8+BOYjgAP027zQzc3kacWrGv7uTTB1RdrUrvsV+brFkBHYv+2I1Q6pzFQBl96QWaeGlMMdDu7rW8N2Kkk9Khu6s6vl2ZsCaJru1tpTdsXmTUVkjXkhe0Fa72CBg1bDfCHng2/bh5FNPuqUEZ1eIx7L8it460Hr0bTsMumHkfjHeFU0yEwZad5Fwc74hy9CyejeawQRXavp3/4g/P7buYs3Ms+942EBiPSZZQrVSSlPOWdNtOIfVK5hO+teW960p5kOOq3/UNomRla1JxqDv98ZJ2JK0WdGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOKloxtVL3sXzrIccPwNdwepctSRWgrjsp6VzUWk5c0=;
 b=xh2iz2G3odZ4VGoFtqxyD7X16IPvDtQFccK+wVus1ud0AF+BVtid1xi2U9mi2b/Hnm4lCEf2qq+v9t6AeFoRlYkx/msvXJbkdfulDkWB7C8rog0wIcpbjOub9NY+9h2XxdGDU2aaj8gQbIyOMGk0ar3ohfkb0SubpN1ZnQxmLrMC0Ck6yuJ4fnCt2jpID6nmyrgSUybNE+g+93dO1UUtBSsshDSQFvIdUnz+DBzrK+o7WL6RPZ2yQu36AxnEqzdAfQloddEZM3EMC+Ec+WqSHN038M7Ed+NwEff+H9FFc7OCt+ZqVx0jsWDij4+fvYRK6H6DNY6Sm0y9lY1Lt+4eUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 8 Aug
 2024 21:16:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 21:16:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 5/8] drm/xe/oa: Signal output fences
Thread-Topic: [PATCH 5/8] drm/xe/oa: Signal output fences
Thread-Index: AQHa6bpOS5IDsHI800S3vs6JZv2Y7LId2xPw
Date: Thu, 8 Aug 2024 21:16:24 +0000
Message-ID: <CH0PR11MB5444000252E518D9E70884B7E5B92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
 <20240808174139.4027534-6-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-6-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB7144:EE_
x-ms-office365-filtering-correlation-id: 2b527e62-59b3-486b-498e-08dcb7ef5bc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TK71adjozHyDlq5D+vk5LSYU7wWo6jrCcxeZn02CMwJ+XS58N8OvxY5ABW++?=
 =?us-ascii?Q?S8ljrnowZfAxl8fzGyjtaUOB6YYPpdKkJYxzBcFsFyX0uP9FbEQFkFMMzto/?=
 =?us-ascii?Q?+5STHdUfcEnRa78lY71iQrFPH+Ot0hPTozd18HwFoS+R3XBLOrA/3YMERiZj?=
 =?us-ascii?Q?sTgOw+lCC1TvFHHlLcWa67q8zClN2BwCYOW0lIvDt/haCSyYA9yuO3RNStIQ?=
 =?us-ascii?Q?bHRf3TN8R/y40Dsd1ZPt6iAlsQpX/AfoyAURQHZgadNESK7HGT/QX6GUsci+?=
 =?us-ascii?Q?KnVVlaL0lABIULS1yTiNhZEogGj7VYe0ZWFNJLAhXazxAsxuhFduLKpLZmQE?=
 =?us-ascii?Q?xrL0XaG9j8PrUZZZRcmQnSwy2pIPMMwn4q6+aDLsUgm7Ho01YV23OwudBRT1?=
 =?us-ascii?Q?mrutVt6krjNgq4D52/n7nfHbPr+ZD5oHbrcrrSxbfgOSM9WArw2PUbYJQj7A?=
 =?us-ascii?Q?eJtx593txs2VgU6TNqE0vtrKxsPREMmjdtJr8vFGUOAKM9CkBUrgcq5d6f9z?=
 =?us-ascii?Q?q1oRL1O2NX2v0l8kPAyAi3bERjXKcCx8J8k1hEYuCboKgwxCLylyJq906769?=
 =?us-ascii?Q?23LYLBOWsN8Ucm5s9Vkju/LToe6oifaFWTzsDoA67YY4NnDjT9HIsRWpSyWv?=
 =?us-ascii?Q?tZ0RVlXVbXKg2aP/pt/dPa+HMA7aykYtfLqBAFCtLqsruTg8o2XDdyEwQUft?=
 =?us-ascii?Q?zuTzA5DdMa5FnSzC64M57aRoYgkJd8ZU4Sy4kyoSwbNpJ7JdbmTA1AISIEtx?=
 =?us-ascii?Q?1Ht547EMg/mGe/UNPrXKOnJvt+Rdob8wJKRMNnSWGMMFqlvezNutCxQmkAlU?=
 =?us-ascii?Q?/D7jX/J1LJWrAVHVxoialwnE23VhDOWzDWWjtbrNTN/WQJQtXyE2JMAvzr/o?=
 =?us-ascii?Q?mf021zxAiBnQ61Y82XwcJU0LNNw3J10HGFQZ4deU56cFmqJeHmn9AxjbOZVd?=
 =?us-ascii?Q?71Iy1RpTdaam6BcZg9P3UOvb2lyotaeSDt27nX8KyuCkmxVIMawDSZC6WaWe?=
 =?us-ascii?Q?ZC+4bEbguE2ELHz2qBypjOtfs+t3g+e+6abbsTDZm7Q3+EtMNbAqMB6Gqf90?=
 =?us-ascii?Q?b9l5de9qR5IYldh+FHKERrByZBXQLfCwVFDJtvK8/0ilb7OKmVgxK4LVPnN4?=
 =?us-ascii?Q?nk8ACXQqYpIJWLT6OZ9WtUari1s/F3ggRQpZX3BMfGGHfN2OheCIQ4z7p13t?=
 =?us-ascii?Q?9nnaQp9YYcCOwvor2+Q6uFIPZ+z+EtOcxdo1Gss0LC6VQ9PcUnpZqEJWO5MB?=
 =?us-ascii?Q?fdiVSqLR4ioDqC5M4u4iRSA1bGHnCYShGvYrb+fXkAgsLe94pAJWDvJDCdhZ?=
 =?us-ascii?Q?ogh4/cTT2WCkWpXh5UxWfK0g2GO/N4elnkG5qjZn8RvR6niK9W2IpgpwITUi?=
 =?us-ascii?Q?HDUa5NtNBcZkmLaQOL6aqjCblWyHC8VYJfEThuiJalVTGOOe3A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Tm9XCADPOyFQrH5etWXK0SmEHc0RY2S+gsuTNBlML6c8yIKBHiEJA3egIg8?=
 =?us-ascii?Q?H8Im9dO2Bn59PKu7/Oy7uKDd/U0OO4Dd/k9E/gpeoIQwsutxJCyWi9YW43uj?=
 =?us-ascii?Q?XDor5OInBywQzb6LjQjSgdT1SIp9XtFqHNEsLcigfnMVsJyJz2NqOyUQrfKi?=
 =?us-ascii?Q?uxF3bvhEhoezy5qpE6TUh1I/Js2GE+AEXeSYycqzFAfYghfGN9acbjb3TiYK?=
 =?us-ascii?Q?iKJyAzLaaFMuhaOGOc0BG4FACMQusAs4uyFRa8stXZs4+Ls9fqRCXpiyrns4?=
 =?us-ascii?Q?CY2h2NuqYv0c/50kwJfdWWwmvqbwBKWBv7ftnZ8N+1rqB2A+4PTUNICFrEWR?=
 =?us-ascii?Q?1Hi85pjbBZg3KFscAYCtpJwNMQ2Ife1h52zIC3WSNrfMZt5ISHmv3IK19QI1?=
 =?us-ascii?Q?QyKz+fulB7Q//g0ph3w8bn5dHkfUgzIOxMb1SH/D4vyaQE7QX9TsR/LZijT8?=
 =?us-ascii?Q?y//gjaIIBHCqjL+yTO+G+junjUyy8Qhx9zUJolZSDYC2eD+kXfqPs16MCIHi?=
 =?us-ascii?Q?hokg/jj4hWL8S1S4Ws9d8Emn/oK2ZSajnRuBvYVYuH7qmam2NyiZacOfw3uG?=
 =?us-ascii?Q?oXl5VmAEBddgdFpsEwu9pSvhuLFrhbqEboEDL4/2NiZ0wDsq2ZsXREUG4BPf?=
 =?us-ascii?Q?ISzXsV/cgmz/KWwNm8pbPOluXmOgKwzTLKZBx/xBag9lO3kw9y6OceoGhMeJ?=
 =?us-ascii?Q?7DBfTdabcrubF5naoEZjvcfxkNDsUWaHVG+mD682IF77Iy7aNwqTSTe2CeWp?=
 =?us-ascii?Q?8Rwk9m1AsA/DeK5Ng3Sb61dCxKHYFSGoCQdsZsg6bdBvR/m9pz1ESxU+J1SB?=
 =?us-ascii?Q?4ZXh24mO7BIeOaQyC0UXPwQgN9AliMr2VOSQijfpz2n0hJmNsNAwrDMKKHxX?=
 =?us-ascii?Q?ArkYkbdQ3MjI3yNf/Iu9c3I9bp6pEO46OAUms8edXPXvQj0IqTf1j7TQEyK5?=
 =?us-ascii?Q?1QApNWiQVTsokkMTOnPSD/CNxyl/n4Fr8CfT+nMdgkuDho0U5dzVWKmM9Xnk?=
 =?us-ascii?Q?O3qr9oT3VHBEJSJSIB85qZjG1xybEyhA3JPfpZ6+bENCtRnon4Dpu+MQ4Y2s?=
 =?us-ascii?Q?uvGauFL4s0bl/bHO8o4cp20FTsZRm3mAHoZ46CjxZETk+C50O98pOjgyCGYN?=
 =?us-ascii?Q?MvhRD0JuIAHCHFbw9z48+/OhniyNnCtatQZGyDYUFin7ZPAyNLtXJFn6oDyu?=
 =?us-ascii?Q?b/1CgaVtPnox/yJhLzHl5P375mgx5ofD0GQGHpFBr2EqV6lfm2Rjjsh7+hnJ?=
 =?us-ascii?Q?1EwOibAGt8+i1rsPFQiEZG9wEqUhtFGD/IGffK/CGgs+LKp/VN25JvENwkrE?=
 =?us-ascii?Q?w54n1tu0euZum9RiXZnA0eJ6fW8vX/iE9UPwbQ+vdncS8QYYghew8perDT5P?=
 =?us-ascii?Q?KarQLv6H23Z3s+/SO86SGECblJsiQsDSS1SagG3TTDX2ChZ4KEaNukmK0oJD?=
 =?us-ascii?Q?RK+U/C/tomP85Uzm43lE7vvDLoajJIw4IomYt00SwmW9kR3wCNWD7ZxZ23le?=
 =?us-ascii?Q?GkH/GE2wBlRVaTqmBFuVXkjDayJkhwrbwtzxwlSkJRVnehiMFJ5PEttlkCNq?=
 =?us-ascii?Q?3koxGWXcXs/kWqGkyZibqMY3NsXgUJXpnE//0L2i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b527e62-59b3-486b-498e-08dcb7ef5bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 21:16:24.3909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grfhRXCmH2T5uTsRcMUAMnVYvpQrh2mKUIj2SgwpwBQn3MMdCoENwAlvzSM9jDHjeWFwTaPY06fqrhTWnVbMOmZWzS0mTWswvFUO833nOMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh Dixit
Sent: Thursday, August 8, 2024 10:42 AM
To: intel-xe@lists.freedesktop.org
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Souza, Jose <=
jose.souza@intel.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Subject: [PATCH 5/8] drm/xe/oa: Signal output fences
>=20
> Complete 'struct xe_oa_fence' to include the dma_fence used to signal
> output fences in the xe_sync array. The fences are signalled
> asynchronously. When there are no output fences to signal, the OA
> configuration wait is synchronously re-introduced into the ioctl.

s/signalled/signaled

Also, it might be best to elaborate on why the dma_fence base
and spinlock_t lock weren't added as a part of patch 2, when
the xe_oa_fence was initially declared.

Otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 416e031ac454b..bc421cd0af6ba 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -96,6 +96,10 @@ struct xe_oa_config_bo {
>  };
> =20
>  struct xe_oa_fence {
> +	/* @base: dma fence base */
> +	struct dma_fence base;
> +	/* @lock: lock for the fence */
> +	spinlock_t lock;
>  	/* @xe: pointer to xe device */
>  	struct xe_device *xe;
>  	/* @work: work to signal that OA configuration is applied */
> @@ -953,9 +957,26 @@ static void xe_oa_fence_work_fn(struct work_struct *=
w)
>  	/* Additional empirical delay needed for NOA programming after register=
s are written */
>  	usleep_range(us, 2 * us);
> =20
> -	kfree(ofence);
> +	/* Now signal fence to indicate new OA configuration is active */
> +	dma_fence_signal(&ofence->base);
> +	dma_fence_put(&ofence->base);
>  }
> =20
> +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> +{
> +	return "xe_oa";
> +}
> +
> +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static const struct dma_fence_ops xe_oa_fence_ops =3D {
> +	.get_driver_name =3D xe_oa_get_driver_name,
> +	.get_timeline_name =3D xe_oa_get_timeline_name,
> +};
> +
>  static struct xe_oa_fence *xe_oa_fence_init(struct xe_device *xe, struct=
 dma_fence *config_fence)
>  {
>  	struct xe_oa_fence *ofence;
> @@ -967,6 +988,8 @@ static struct xe_oa_fence *xe_oa_fence_init(struct xe=
_device *xe, struct dma_fen
>  	ofence->xe =3D xe;
>  	INIT_WORK(&ofence->work, xe_oa_fence_work_fn);
>  	ofence->config_fence =3D config_fence;
> +	spin_lock_init(&ofence->lock);
> +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
> =20
>  	return ofence;
>  }
> @@ -975,8 +998,8 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *=
stream, struct xe_oa_config
>  {
>  	struct xe_oa_config_bo *oa_bo;
>  	struct xe_oa_fence *ofence;
> +	int i, err, num_signal =3D 0;
>  	struct dma_fence *fence;
> -	int err;
> =20
>  	/* Emit OA configuration batch */
>  	oa_bo =3D xe_oa_alloc_config_buffer(stream, config);
> @@ -989,13 +1012,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_strea=
m *stream, struct xe_oa_config
>  	if (err)
>  		goto exit;
> =20
> +	/* Initialize and set fence to signal */
>  	ofence =3D xe_oa_fence_init(stream->oa->xe, fence);
>  	if (IS_ERR(ofence)) {
>  		err =3D PTR_ERR(ofence);
>  		goto put_fence;
>  	}
> =20
> -	xe_oa_fence_work_fn(&ofence->work);
> +	for (i =3D 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> +
> +	/* Schedule work to signal the fence */
> +	queue_work(system_unbound_wq, &ofence->work);
> +
> +	/* If nothing needs to be signaled we wait synchronously */
> +	for (i =3D 0; i < stream->num_syncs; i++)
> +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +			num_signal++;
> +	if (!num_signal)
> +		flush_work(&ofence->work);
> +
> +	/* Done with syncs */
> +	for (i =3D 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
> =20
>  	return 0;
>  put_fence:
> --=20
> 2.41.0
>=20
>=20
