Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0541C3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 08:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BF510E08B;
	Wed, 17 Jul 2024 08:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqhWjBqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBF910E08B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721203891; x=1752739891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZSyd4cKZp/69F7XwGGt6V7tGCUG8CtSxK1SoNheJ+RY=;
 b=jqhWjBqHhFaxDQC6ktXm+0SbjVvRja8JEGnabrK4SrrtrMmtk6MP1Eyp
 xjhvWH3UoNgSUZ5v7wICNYJ9GC4y5CogEUZEFajXrd3ZsGtguuF1wHQOd
 P8f3eVr9+2ZFy/OuGf9JiRr7ziLRZzRkWVtOKgGcP2kqd+gEc0hvUkhI5
 GOFw2CNsztAzTbnSMd6mKavTqxcF1j75yFpSV2ViZhgtj+/J1WDYZeJ5f
 TkATUtosFKboG8YQ3VmtY4QE5AY9M7adCV5MdML7aymlDGU8wecEk4+SB
 v1PtcUPMJCVRnadXCUYQFVkG1H+iHlAHd6Mo7MhXZzsdpGAuIDMxw5zPd g==;
X-CSE-ConnectionGUID: P4SWGtMhRtizw6/LPgf6AQ==
X-CSE-MsgGUID: lbu5oNyJRFybDoZuD4A1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="41212302"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="41212302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 01:11:30 -0700
X-CSE-ConnectionGUID: Ha50NMXXRrSiVYeu9+EV9w==
X-CSE-MsgGUID: NOelN/waTW2aa1kPOmmVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50109096"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 01:11:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 01:11:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 01:11:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 01:11:20 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 01:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdol3hKShn21ah7Z0ioZO0eHiWbyv50e54pBMd9rdRJViiuEMz8MKiFIXJ/UOBz/cXZ/ZTNu0kaEJ/OCLjPuerXeZcnaA6FSJK96xHDS0s/AR8nb9yuE6Xp79ChPObY8ehN2jDpCxeybFT/z1KixCO8WzCn874GFGA2GwN0LzhKKkd1uNGGClJHPNTPGg+6ADKOqClB/NbnWNzituu+Ce9D4W9w7k6SPCrOHoc7olf6f2h4TiltzvzKEoSkTM0nuxKkZiQqEGUxSh7RWpYmuPSZoECAtDITnYoWx+C8sOjM1Vwv7L7Di5CVjBd4GfOijzoRoTC9AOIsrf79wRMBJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itd6T67TTQNxR6xanL/swSAFjqWI3qFkHseWWAndAYU=;
 b=Yatvpba9QdTMWQksHPa7hwmD+UcfSTSLHa5ix7Qk8VO1pqwt1ZQVBWseA9kue58wpUIp8iuz6f0uU3OvT40B41+TsNDDvQRy4rH8LKBAxx0t1gIu2DhnSHO6RdV+xlVUYckv/uePqXMrk4qyKs7nUVueBAFUJZdn4RIn/995v9Gl0oR+ZMz9e1Ji5J18doZHPHrV439mBSppJLm5OI5vjMmmmMIxsjsRY2B6ME9ZuW9AnRqcCzL5Bchz2Bc1pKtPL85g90cQRJB48I+SaxGVqF/JngT5a38BF4oBGyBO1MzJLl7vNcLzlWb1kg3/buBebA2w53EiLBnkNKx9RwTSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7173.namprd11.prod.outlook.com (2603:10b6:208:41b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 08:11:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 08:11:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2: Use XE_WA() check
Thread-Topic: [PATCH] drm/xe/xe2: Use XE_WA() check
Thread-Index: AQHa12ToZ/P9dxA0GEOu9UAZ6Ob3JrH5ePeAgAEZk0A=
Date: Wed, 17 Jul 2024 08:11:17 +0000
Message-ID: <SJ1PR11MB620439B3B9049981E888F9CC81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240716094635.3427833-1-tejas.upadhyay@intel.com>
 <cm2vbsok4yidxxslztwg2c6v6i67s6lh4trjeznzx35l5uwkty@ykgepq6ispdr>
In-Reply-To: <cm2vbsok4yidxxslztwg2c6v6i67s6lh4trjeznzx35l5uwkty@ykgepq6ispdr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7173:EE_
x-ms-office365-filtering-correlation-id: 5e832bd8-7326-43ac-bf2d-08dca6380885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?pcIhfI1i6jIYCrNQXgofI2+PipMRoKoArAWV/j+O0C5xzQARnv8dOV+1pwU/?=
 =?us-ascii?Q?9q6q7xkuCAqlt6BzS8osuN+fU0Cgr+T3/vEKwTvZQG7O3gOfk74phLz4EcFx?=
 =?us-ascii?Q?2MOZBrvzUnivcCXbmc9JB8S4jYSO0HvKd4gN312+JMkSog5CktrVZ6WeM1gp?=
 =?us-ascii?Q?qUwDQjc3l10TI93LzD9JEZ3GfQU0V9hRPX9fW4AuOca79QR6MPnT11E8DrQF?=
 =?us-ascii?Q?0b0cntTvbrsBg5em728x1WXreI4Zo5BJ0ThLh2S4sfB7UbJBpTBQwUPpQmJ6?=
 =?us-ascii?Q?FyceQ/D7sz2Pab+ro5vYdpWUIvr0pQNJGGTmeo4qxcEcJnVLk3U2RXeRaCmW?=
 =?us-ascii?Q?MmgSb8DnHKlQ46AJzHYsG6Ov7w3g92c3ilYPDqCXoNRwauTZ8auKiKPTe+ln?=
 =?us-ascii?Q?XZk6MsyBxy3Jg2NoEBcXvUquFiBiiw+mFgP2jTvFex9YMsg4UBXXIcJSAdCx?=
 =?us-ascii?Q?k52gmg5sg54O6XV8+of9eZxXLpsRsdoHYkZkXopBCsekh0mTRx4hSuuq54tP?=
 =?us-ascii?Q?RmAGCVfw5e4FA4AYBBg+pKmeeUJIGWKYXpFyyB/DU7E+tn1huW2SyNWPdfB8?=
 =?us-ascii?Q?4cTdNhnqbGQWAjojKjbaufpAN+lav2Wf+ZtjKm5BdnXotCeuyLtpoj5QOEDx?=
 =?us-ascii?Q?bA3oLh/iv+ehZVLAPbZuHoNGD4O3sPQF9Z1JiBDHk176sIf1ATbSWZJqa0jg?=
 =?us-ascii?Q?q3rKuER4LO6FWQi/DnO+eOkS05VbV8YuAuFXXwtrqp4T4cATKqWuZG1RO2Kp?=
 =?us-ascii?Q?ob1ZX8HUN755IQaAsON3d08GWrYaH9PhCN/rS9V/lkv+tepSiuIkjAltjjQH?=
 =?us-ascii?Q?0VaEDkTQRSCvKTiMkZTewAUHk6RhRnBOtFUNDMlKGNk9UPWh5S5BYWLshoPo?=
 =?us-ascii?Q?AyUE6vrGMhHFEExwCo5ozCAhEnq5PCnSxT1u2w1kYMI+/KB+WkNb4oc0Slyu?=
 =?us-ascii?Q?uUIliNgYO755IOe7mRgcDkRvBZ25iFSGMBjTT19Q8aPramzJuXRR6KcIYqlL?=
 =?us-ascii?Q?JrfyWpYLAxpp4gr6DX4GpcvrHqZEeK9xzK+JxuWmG6xpXyEcU5j1oc2NSoFK?=
 =?us-ascii?Q?0wd8Aar5yqmussZxORE1BzrWGTC7U1tz7ueWt9rUEKc0S5L8WAN3aoWi7PO3?=
 =?us-ascii?Q?Smyr/hKaJceM6tGz/RoZ+FCF00mPry7yU7V7OqEffKEjPRjo48TFCScQRc1X?=
 =?us-ascii?Q?UDNsJUAbVu0xPaENfnR+rLAYjo5wJf6q59y7lzpH6bja/NjC8nXH2gFzceS+?=
 =?us-ascii?Q?S1lYoHosAHdMrDcZqCrN+4VCUmzXz2Nhi/sc6ATl/KcNuH5o1oVJ+TrwIY0S?=
 =?us-ascii?Q?K/eMkPUm0kP4qgELwhdUjD2k9frMIIf7Zj52xfUwa6HDuEAOb1bX9hy7OtGY?=
 =?us-ascii?Q?uZDwV9k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LXEukD+JWLKMUvl9OBl/LJFnFJ7UFoHqJcQa/OuzuD20vCPW8DxO/ixOxZ1a?=
 =?us-ascii?Q?ZHieZb9lCJB+/zQ0J/S2akrU5n1UDvyruTG8nBvGvspmiTdgMCbQiR+C+fwV?=
 =?us-ascii?Q?yD540eS0un/mTwT2uwubLufEZWSF3nOFKuqC1mUu8ebEwp1hbDk0VzYmN4Zw?=
 =?us-ascii?Q?I8GthYCMSbBaIRSJ1/mPqYpbLPR9Nib61h6zZvrVLkcJKV/zAaPEgnFFZpxC?=
 =?us-ascii?Q?S+8T7pBue7trkLa7Ndw1/mtl6P+HnWmm0BmuGTuzUlMRVdJQdOdaf27hQ45R?=
 =?us-ascii?Q?6cFFJpKNnqeXovbfAwbQfD8wcu46porvo/Erlieeui4JSphJlT4NBjy/bJsG?=
 =?us-ascii?Q?c++o2MunN1VFCpbP3ZSnjJjnxL19k5Hl5HODHMN/NEyLRE4RqQZ/EwJVVroQ?=
 =?us-ascii?Q?3M4tna2/KyjxgTJFtHrXGWnoLms2M599fFXEO9NZjUewHBw+f6BaJHDwWFWu?=
 =?us-ascii?Q?5gfBiZ0xKfBbYIVJJQem+5SCzSxpM8ehDx1p8b4Jt0g0FegdVTXErHP4nwJD?=
 =?us-ascii?Q?V8qEG07YACtJIeDa8NvXtyUzaM5ONshP/mH19LGs0LKUUKih4Sx3ckqpz2FD?=
 =?us-ascii?Q?0mo1BHQ9fsx7vlG0l/D3dmPFmRzSCoZWgI69Hu0Q8g5m/evMEjPs/s21784w?=
 =?us-ascii?Q?Ha/ClOT9XDnIIooLNv3I68+kp2DkGSrGeED+XkKtkEIkPoKAjgM3tWODQxkq?=
 =?us-ascii?Q?yNh3399Ts8nAJIeqjyRd0i7qH498yLJ2j9DjT/8/75YZjdz4fHChmc2rBl+c?=
 =?us-ascii?Q?SgDRTT1c72P/j5qMYe2estnLKjlUE9o/P4nZw85Jx8TMZ1I6qD9YG9bYW/EN?=
 =?us-ascii?Q?BPOe+gqppjFrj2B6SVXJxXgJ8qfYvjk8X8tSUlk1cAXQrzEEVYvogbKtAqBu?=
 =?us-ascii?Q?MDjKfZ6oIWBzDVfjNfH2F+V+iH13JbiEPWR0/XYrL2U7pgDvFHzfAQx67X50?=
 =?us-ascii?Q?dSIPB4aNh3mZwg8o7coF8q2eNIGnwxbyJGH3H0delv5k9VIg90b4cgzn2N3q?=
 =?us-ascii?Q?73eMgmFFnuQoJpXA82Odaxp6oIR5jyBDkK7dNy7Pi9jdtWF9hBxZooweZIGQ?=
 =?us-ascii?Q?bbXIKt+V7tklv9vDUZrF3Fwmmk/6nxtEE46sQUMj7jH+w/YBqOqYBBgdRRcF?=
 =?us-ascii?Q?WM8Zc2XLpHiP15Z+vgzEQkXLaU0Fu1lNhvvR9JdENhuUSYdjpAqZsmJfCfeW?=
 =?us-ascii?Q?5IJXLmJTNlDPsyp6g6MQOcnnhGKuUFHZQVsxxUL0LgRSwhkvt7MM8f2N21aC?=
 =?us-ascii?Q?lRlmfVcMHZtCBBitF8lKxiu+ApdgPy06qi25BuM+eIRVz/Rv2B9R1yN6sbey?=
 =?us-ascii?Q?PFw2torfiqYPuCgnV56iBs4iEDgleZTA4ciqTNPxrCdTbnG4QS+9U3uImvAw?=
 =?us-ascii?Q?1TcZWVUHloRVgvWUD8/lrUONq8ZFctoV+auWzq0FVj447FqIB4a1P/LvEYWA?=
 =?us-ascii?Q?K01ruiC5yhAtUgCaQxwSXXL5NrheMhLVfn+KEnYImgNVA9bTGlc3ntxOSnE3?=
 =?us-ascii?Q?bydkYQtLQfv8a3QpZvmnLmALjiLb8Z6iB0WYblJwB2fZBHYo+y8D6FncLK1d?=
 =?us-ascii?Q?6u7RtlDs/mys4vGx4XeQQSwW2T7Xz9zPYXRKqgdB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e832bd8-7326-43ac-bf2d-08dca6380885
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 08:11:17.0753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOw7eFlIQCwrhsjsdgeua5wl/lJ/enWCjUxMSLyUh99d8cW9LMStHmWW/qshSeNd64Q33UZdjpfnuKoJ08ErGRxgiI0zwy2Of4iMG3XhnSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7173
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, July 16, 2024 8:52 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/xe/xe2: Use XE_WA() check
>=20
> On Tue, Jul 16, 2024 at 03:16:35PM GMT, Tejas Upadhyay wrote:
> >Use XE_WA as used elsewhere.
> >
> >Fixes: 86c5b70a9c0c ("drm/xe/xe2: Add Wa_15015404425")
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_mmio.c       | 5 ++++-
> > drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> > 2 files changed, 5 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> >b/drivers/gpu/drm/xe/xe_mmio.c index ea3c37d3e13f..1138934cf969
> 100644
> >--- a/drivers/gpu/drm/xe/xe_mmio.c
> >+++ b/drivers/gpu/drm/xe/xe_mmio.c
> >@@ -13,6 +13,8 @@
> > #include <drm/drm_managed.h>
> > #include <drm/drm_print.h>
> >
> >+#include <generated/xe_wa_oob.h>
> >+
> > #include "regs/xe_bars.h"
> > #include "regs/xe_regs.h"
> > #include "xe_device.h"
> >@@ -22,6 +24,7 @@
> > #include "xe_macros.h"
> > #include "xe_sriov.h"
> > #include "xe_trace.h"
> >+#include "xe_wa.h"
> >
> > static void tiles_fini(void *arg)
> > {
> >@@ -127,7 +130,7 @@ static void mmio_flush_pending_writes(struct xe_gt
> *gt)
> > 	struct xe_tile *tile =3D gt_to_tile(gt);
> > 	int i;
> >
> >-	if (tile->xe->info.platform !=3D XE_LUNARLAKE)
> >+	if (!XE_WA(gt, 15015404425))
>=20
> I'm not sure we can actually call it that early as we have the following =
call
> chain on init:
>=20
> xe_device_probe_early()
>    xe_mmio_init()
> ...
> xe_device_probe()
>    xe_sriov_init()
>    xe_mmio_probe_tiles() <<<<
>    xe_gt_init_early()
>      xe_wa_process_oob()
>=20
> xe_mmio_probe_tiles() does call xe_mmio_read64_2x32() on
> xe_root_mmio_gt(). From a quick grep I'm not sure there are other cases.
> Can you rebase on https://patchwork.freedesktop.org/series/136146/
> to make sure the assert doesn't trigger?
>=20
> So... although xe_wa_process_oob() is called very early on gt init, there=
 are
> still cases in which it may not be safe. At least for that mtcfg reg read=
, I think
> it's odd to call xe_mmio_* before actually setting up the mmio regs per t=
ile.
>=20
> And just after writting the above I noticed the
>=20
> 	if (tile_count =3D=3D 1)
> 		goto add_mmio_ext;
>=20
> uggh, that neeeds to be properly refactored, although doesn't invalidate =
the
> reasoning above.

I got this, better to have check for future as well. With rebase do we want=
 to get your patch merged first and then mine. Or you want me to send both =
as 1 series after rebase?

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> > 		return;
> >
> > 	/* 4 dummy writes */
> >diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >index 08f7336881e3..3d0e0779a833 100644
> >--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> >+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> >@@ -30,3 +30,4 @@
> > 22019338487	MEDIA_VERSION(2000)
> > 		GRAPHICS_VERSION(2001)
> > 16023588340	GRAPHICS_VERSION(2001)
> >+15015404425	GRAPHICS_VERSION(2004)
> >--
> >2.25.1
> >
