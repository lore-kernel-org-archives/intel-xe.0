Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E99E6F093
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 22:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6709110E03C;
	Fri,  1 Nov 2024 22:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arG+D2Ri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C449D10E03C
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 22:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730500065; x=1762036065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HQSwwTmL2ykFagjJ72TpZuAecqB9Thbz5aeR3KAo1tk=;
 b=arG+D2Rib1UVr3Kn1QIAPCbNvVttlEzmXQgDViv59ZB4xFdB/W0yTrrY
 rXEhvxrCpV7xbbgVV1qPKmlQRpShSUBvuVYSexYDLsZZ9kIvzFVDpqTo/
 wqm81+LEnGRnWGN3fvTfHOcsMN0UEMkd/lQWhEdxBKMnUCtD7p0HWhYOJ
 vi3WE+zE4F7Qnz1Mvp1SF/SoX9Ur1Xf9y4YT3v8Sv+DGHEDSnCbGqBpwW
 MuuAflpdlx2ssJGaX0tAH7v8HO8B8W1HpP0AQ/n87sghQ+YU2+5MaMOod
 +3kdjWS6DE7qLwD6/SVaSElCDWRxZ9titF70yrAW675l5YREdpAhtIJGG A==;
X-CSE-ConnectionGUID: wKWbyLxBTciVyZZkw4zZtQ==
X-CSE-MsgGUID: hTPtozQCQWOGwuMboP1oHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55671681"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="55671681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 15:27:45 -0700
X-CSE-ConnectionGUID: bL8N9ptbSK+3S8XBnaUFoQ==
X-CSE-MsgGUID: OcV4kB0fR0y6hwhTBwkrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; d="scan'208";a="113867772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 15:27:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 15:27:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 15:27:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 15:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p26sa4IWZ9lmZBGmrJiE1ObZTv9k4863DyjjWhX8sYfGu+3xjUyhglbpdTnUDUlyHtm0w3m5t4hCOHKsUzfFuup42JiHIy08XlEcDi8ZWhEzWOyZQzUO0Hx81wX1OyIWugNq0r0sXSGXPTScfxL+QB3hT1+KmKYEm2bOI62t9gBI9z2aPr5Hzg3y1AwICjw2n0UJ5NDCCr+ReWn8pEudAAILektRyEF7TLCtXKI5HYjh01owUpWysD/EsqzkpVwuiwSU+fzfP7/pK2DPYecFpdcIIQETbHJMJAjxThBafGtgm8om8vdrid7TdSYpCYm2oDkVZha5ukV6b3Hwf9Pxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsTY2Wmc3C93thKQcqLSHxwSK7726KKPDnpdJuoekek=;
 b=jgPZCt/VMTD7hhQ9b8cW8epMzqtJZ2n8b5IENTpOuDLBxpHcJKDrmw6Soaxu+/4Vkmj1dRoj//L9nLNHNaTzcjSJ6OVyM1zAmt195XXGWrtSL6D/E8Aq8PXxwgg+AL7eeyEMCaCDTn5Jed4IfC38zHXM5kXpAfv+AYT1/AswbIs/7eLr5mMXZGuhdxRC5kpLSlIoCI/VhVP9Se4RgU/iZZQK1k4TNfKihLKbpYJUqusDteG6pkCKAbyedxCEoTrKJsqtv+wHnY0i2UY2wBoBOOkzCmY4AZTrDfHwPmeETpr3MKiIppen56WSOE8iCqhFMLuPAsyo6tHIR3SClz6gOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 22:27:41 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 22:27:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Topic: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
Thread-Index: AQHbLKzB8AQjWmaLjkqtEx6VIJSZTrKjAL3A
Date: Fri, 1 Nov 2024 22:27:40 +0000
Message-ID: <CH0PR11MB5444DA92AD029E2A75393F7EE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101222350.108367-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241101222350.108367-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB4961:EE_
x-ms-office365-filtering-correlation-id: 945c3c86-788b-429d-f85f-08dcfac465ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?CuOLD5DXoDK8gvUjWKSdJYEDlGXig6F7hHlo7bV4eHFfgaFnvfOHW7mcGqOm?=
 =?us-ascii?Q?BlNseXklDZBu35OIVa32P72E7QEJTrQwmEPp0DZYqUOYUoHntEi5OFUYLoTo?=
 =?us-ascii?Q?R2UU0fgRG66C9m3KX42yI2EKQl7TYCRdeRJ9N5l9V3FwcVuRuchVyKzaJVKN?=
 =?us-ascii?Q?3EldWnmGouHzdmo1jWKyNvgb/t6XUdeCgut9n5xeQCEYAdroXXuk95yx2+cF?=
 =?us-ascii?Q?/4kWsW3zny0Zgdk2a6v4E+SgFSwTPhtWOv3plo4YgEbTg3OkF+Udi6pm9Nl1?=
 =?us-ascii?Q?gOx1zdHbkMCYMden9XpYQKaw3OsIldiPpdTI5Ki4vPDja9Rnuye+/8LL7Jc/?=
 =?us-ascii?Q?QsyLzwsFK+O/7BpY7eVk7gUCwFmA0dvs5zRQo+7K/r+cPPHja9HhM71Mmf5j?=
 =?us-ascii?Q?tgA1hjK4YKObPKv6KtJL98HGo3ql90JvkKbxIKvTxwObpCUQlFK979ekcb3X?=
 =?us-ascii?Q?wOR0jpEL3WVgf2c4gD4GIMDas4z9gpUJPM/mg8zi8pYH76QqC1uUmKokWiZT?=
 =?us-ascii?Q?Neu5LP88C/Om8gPd7iq62QvtMdtCYJmq4UWV3VD4VBlkSJEZecTfmMFDDxc1?=
 =?us-ascii?Q?lNGX8Sm7JV1Veek/r8M80L1+ZNHuDbgV5E7eanl9jAUmuOIwomALmRByIW0c?=
 =?us-ascii?Q?camlMYelmFqn5bxXDDkCIKVJxYQkSdhC+nIFhLxiQWgWhNaoQafIDXYAm+Uy?=
 =?us-ascii?Q?ulcYBD+Y5RyAfQmPlSbBaAFIGp0w4mdbdQI2lJ7qPVeK26y0X1UsGsEUjInH?=
 =?us-ascii?Q?KdmGirQ0kMOrHgO1ozcTEvzWWVbPgCf7cK/XQQV58YoT/F2E8MeFBKhamggp?=
 =?us-ascii?Q?1+CK4Npjui94LggPrc+EniHjSLgVdEm+WqwcjHHN/2UZ5/sZe9Q+E4XTy7vn?=
 =?us-ascii?Q?JvW2Pk0iHzx/A1jNAzqaPbo9nVpPKQhi4cwP6cQHJ+8GNimgaZVBbN4R+Afb?=
 =?us-ascii?Q?0WCU8ygvBqP132WKTsldoMxFz+BIZlo0/vSBVSziL99roT5cbrZne8RfTE9+?=
 =?us-ascii?Q?1pc7qcXDxAHqdg/hppwPtIhBKOJzHNn+ZuTx0JRctpAS/0Tn1nbkXCdGaQW6?=
 =?us-ascii?Q?Kt308ncxOSVkP5f41dhE2fdfqYtw9B6ZmY5uxzDhR51KWkQyEDeMWSsRLkl5?=
 =?us-ascii?Q?tMY3ga4999zVmu7zqh2NoTSx/xzuKsheLpiJFoQDuY82A8JhEkFLbx5xxTKq?=
 =?us-ascii?Q?jbpJrxLospOQ4Y/QZkIg0A0YU9wrlybcn31z2pMNT5sI+lqyRaDSrbxAg5QG?=
 =?us-ascii?Q?aBDYqd/KDZwXlMQ/GYBcqWdFby1APngNC4z1uvt3sjkCx6H6fQpDpQXx5RHc?=
 =?us-ascii?Q?xHGEv3bRgOOwGr3kOOzzPXx0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i1YjvrpqKopITKjuNzH8ftfHZz07RQzA4YNzT/vm+qXtqTHB1MshCnYNBO1o?=
 =?us-ascii?Q?dP1JaqOgeV8BdFyqbc9VhgkHKSKvNhxAmYs1YFzzqNW3t9QYYEY85ORMaPDi?=
 =?us-ascii?Q?itSkQR+Rc1e4Avdn1Jltsb42kSae988spypZVGmc6UF+jRTNaPv38ZtlQPkR?=
 =?us-ascii?Q?DiUfT8zCX7xZOP7ta5Z3TNGSSqqJNfYgCqT67ZBpec1/ZRWy0D86fjXBNLnI?=
 =?us-ascii?Q?Y5EFj+zRCCPkKk7FdsK2CYKTRP/yrGoyxnOHV0gagm0Cl8IY1SJIt5FCPNpp?=
 =?us-ascii?Q?Z70/TYG8zvJG1SV32H5Ej8XzMWrk6Mam5gHrDqR33aJ5kNfmZ1CXtje5Sy+0?=
 =?us-ascii?Q?EzSpwoBIcrTyWGqpMyv9nMX1Gyk5F3wNm4m1BGSPwmv4wn12jKDdvX9vrVjm?=
 =?us-ascii?Q?hmhLS4duDYmDpGzmGDJhMi8/qWKAUlTZLIIqBg0AgB5nB/Hr524YN0b+5faT?=
 =?us-ascii?Q?uv/68gzIYJ8jlZribICl1NLRpfA6otJ2O2W4+U7/hDtNp6xQ4AKvVeUwz2E6?=
 =?us-ascii?Q?gUGTs1V9QZRSBCDK8kO3S47/Vf30nojWo1xKojrPJcgfofL0ACQHauW3nEpS?=
 =?us-ascii?Q?hCM/7wL+9ZCGj5B5BhBrYS0hBZiCwreyrOO6E9GUvzMY5+LiMJO1A12JoM1Q?=
 =?us-ascii?Q?4kWXn/YnlJ8NIf45Bo0ejK78+wbCq1zJrfKDyFo6/lMDPBYPzhYDTTwDDWh/?=
 =?us-ascii?Q?FD52D/5dx4sBMGEUkJ39sz5GRtB7P+/7XVUrTYYy3GX2cUFquEktGNlMhU9h?=
 =?us-ascii?Q?0vSoelZO2qOCEvxGFxa1G2Unwl8ccD/udKoAXE0DyoxDTf6JS6yCNZjL+++n?=
 =?us-ascii?Q?B2INMWcUYejCFcWHlFlE3NbaCalpbUx3I/+vG/LXKhJya7i6+tAfaj7w1qFR?=
 =?us-ascii?Q?nuIhflOl44+/KXNemg2jIkX45ojWzmzOUK1aTu0VQTQMI4N6xZKipyaZ2Wf7?=
 =?us-ascii?Q?HJ57PgFANkXG7EpjQpsGyh906f2a+vaFM6zSLfEyVIPV4FHPEZdQWJSX6oVy?=
 =?us-ascii?Q?rGMmCWv2f7OAQ6QeDHhNX/uHTJIFUSaEl/UhITgZ5bPB+CbKdqlz+k5+V0u8?=
 =?us-ascii?Q?J6eMHG0rnh/HHt7O4Mf96H9Gyjn4q90THqMAlLtRWAdjVHXXPKDmQgiJ+xgX?=
 =?us-ascii?Q?EWHEBiXKgGXQegB528mdBfrEzM2BaOttTxuAdAffw2nRxmicU2cvvGQmBOIY?=
 =?us-ascii?Q?X/ir0mVytcPQTs+7FA11t8Mjx+mkt3NpKQ5LYNC3rNxbiTY5Xhx3dOD34FZm?=
 =?us-ascii?Q?v5tM27HJWuqmCfXQaXzjkHp0SBBgjoToIj2nJQj2wm7lwQQVTMhVUGQ/sIqM?=
 =?us-ascii?Q?EvVrp+yqELm1M/dX7VJaI1w0APddXCCyW77+bhGwsLZ8HhM11Xj47TIcMyU+?=
 =?us-ascii?Q?naiEh3wctgjq8hpxzF+OoMH1Z0hWrbp0TDZvXVQX+T1TtKrwiKiDU3nky2IQ?=
 =?us-ascii?Q?nV7sNa5+EEmAyzGQk8UhqaIU53KAyBG7t6Gmu95k3tNZT70HQrJvOFFovSZ+?=
 =?us-ascii?Q?CtjZaJoQLS7DzicIsGB7NUug9my9DJCFrBB8VQec8d4fwk5IQSfTqs1wZo84?=
 =?us-ascii?Q?o6+WVuv3pCF0z8iLSIpqhTqb/OGAgBFB56CLtx4G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c3c86-788b-429d-f85f-08dcfac465ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 22:27:40.9956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fa7ndL8E83DyCjm5B3ts2MXH34IucF5nUWDy++CxqMpom4/9YgMBB2F2LxXr7QTRJpBXGgXK+6l5FEKLy89sdOEFHNYFdbDuztIKqo+1BhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Friday, November 1, 2024 3:24 PM
To: intel-xe@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Vishwanathapura, Niranja=
na <niranjana.vishwanathapura@intel.com>; brian.welty@intel.com; Roper, Mat=
thew D <matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com=
>; Harrison, John C <john.c.harrison@intel.com>
Subject: [PATCH v2] drm/xe/xe_guc_ads: Add nonpriv registers to write list
>=20
> When performing a guc_mmio_regset_write, we add all the registers in the
> reg_sr list to the save/restore list, but do not do the same for the
> nonpriv registers.  Add them in.
>=20
> v2:
> - Add all NONPRIV registers to avoid undefined behavior (Harrison)
> - s/whitelist/nonpriv
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Lucas de Marchi <lucas.demarchi@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

Forwarding to correct CCs because I accidentally used the wrong send-email
preset when submitting.
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index 943146e5b460..b0afb89d9d90 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -243,6 +243,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>  			count++;
> =20
> +	count +=3D RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> +
>  	count +=3D ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> =20
>  	if (XE_WA(gt, 1607983814))
> @@ -727,6 +729,11 @@ static unsigned int guc_mmio_regset_write(struct xe_=
guc_ads *ads,
>  	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>  		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
> =20
> +	for (i =3D 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> +		guc_mmio_regset_write_one(ads, regset_map,
> +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> +					  count++);
> +
>  	for (e =3D extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>  		if (e->skip)
>  			continue;
> --=20
> 2.43.0
>=20
>=20
