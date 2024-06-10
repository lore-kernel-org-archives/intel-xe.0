Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44FAC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3EB10E48E;
	Mon, 10 Jun 2024 16:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjXpaf6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32B910E48E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037392; x=1749573392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fM1ZkLwSnKnbmq7r3Umkuf76WMKrtbIMXPM8EryNmSs=;
 b=cjXpaf6omrP70/H2zbQE4mDQrrQrjOn4wk5sszItUW3PwyEqG9MgcmOD
 xYK4QiPz/EkGtm6XfSiFWcnGXB8ilxXJNXbGrFwleCirQOdDk1GVS3KgY
 6d72pkyuZgA0AVo5LdNmzOYRMZY8GSKDWDX/etI1ilDTUcAXrqTY4DU7T
 x1UytMi3at2iGaJMoMxWR1GPa0uUWS2IKBR4ubb7aqVVJbMSMBa5iu8Xj
 p4Jr7dCH/Loo/pAlNx8Fwjhtc1A8c0enFd4xKGlgcViQRgDeZCGSWCw/o
 quZrk0Ll0ZkuEgKBA4D1KSIUJVDg5Z4Lv/Zhx21bMDq0p+o1hxJxo+1U+ g==;
X-CSE-ConnectionGUID: DJNJdaO3RwWpIonni4Rr4A==
X-CSE-MsgGUID: qFD0++dKRUWz9tP3rt3vPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26127357"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="26127357"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:36:32 -0700
X-CSE-ConnectionGUID: Pm/r7CEvTDuMacDnnctc9Q==
X-CSE-MsgGUID: f0mFEiPTRraxUWMe3xQBWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44046003"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 09:36:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:36:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 09:36:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 09:36:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 09:36:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrEVuyqIi3pSURiIAc/k7viETMA3eFzE9043+CyiA9D/IEfrxAwgTihMd3RulnTg64dZR/v3WZ6MAxsR22LuA9NAy29iju7HmD4qk3V0HW5fmaUSC8oxZKfPt5mdo2pRmktTZ0HcUHjjgELHPNzn/i0kxBnA1rQwLJRen1KepA5AhOqO55RP5n52n0WotSrpj9MX4yj40qK3WrKkF+0amiI/fAJ8Er7u5EXVfgdCvs2DzSyGfQbpiLHOY1dXeYRHXP7wHk5xQ0Wlk97f3CjbqKpCCi/nnY8UWbpnKNfaIAhdMd5Y3SQ9PJuAiwHaV+HtEReLfVZHnWCnUqL8TilDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTYl0E5mKyMi2HRadZUgXe1ksVE9nbMbm+D0iLwSELw=;
 b=Oci/oieXutRS1fQ0RXeO2rv7gnOXYrZETcHilRhMmdo6ifoHjMsNXNRnFt5GF24p2kmeKK2ogw/iciwUKy1b+cA30RHogr8pl/xcegpNfHtUlqfmglcJcadTwCUpjyJXxTra7FRV3GYv6AtnfXTMVuGfAsusEa6UNFhPkw3wANtR6oaFqIDHewH5S4DnxTMwOXmI3HW7RxiWAGMRIqtWnF68SYuePrmWbAoFGZMsmJLCXigDDLgfbs8+oPkTGA227nei58+eVRZS03v3oTZGHDljZrmCpeHiahTVk7CNnTxgNKXOcU2074lBSYjt6NO32AqKEaBU7kq/X9KD95g4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 16:36:26 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 16:36:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
Thread-Topic: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
Thread-Index: AQHau0EXuEh3+qwHSUuyCmU+SZRQPbHBMf3w
Date: Mon, 10 Jun 2024 16:36:26 +0000
Message-ID: <CH0PR11MB5444A8A9DDE4BC86ECFE91A9E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-7-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB5044:EE_
x-ms-office365-filtering-correlation-id: ec4df2b4-3d90-4d31-4c8e-08dc896b790d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?GVnFi4VZC89qM9pLwhfsLGpoPKu5bAe714INNuzoUgbMo2hEmV2SfQVAl8m3?=
 =?us-ascii?Q?uZEi2yYGwWD0F9Fj4cntlReN/7EpggftxRRjSUhdnKiF9FMnDsSjTCkgY11p?=
 =?us-ascii?Q?TsXGRqA9YTFl4LRmyigHbD351yKigBrRXPIOrJMSsXkmSJU/frYNfemiyxo1?=
 =?us-ascii?Q?I6PNAQJQ0QQMN/8b4FBUgoXXivAbvPM+LEmLlTVzlK51oavxM+f4LZW1ytVR?=
 =?us-ascii?Q?wkc5Bky2QMF+gEtfSW9EWqKGsNwodV4apmu4mqqsNbmQLKbaxXsb/IWf/VpC?=
 =?us-ascii?Q?lkLsvAswk0JoPYIrMUpBwoYIvGedmfD+DKRzpzG8EF8P6tfHVIgcsbFO2lkP?=
 =?us-ascii?Q?h0L7T7xF2/tvt3XicOW74kJ+iFU7F9lVCzkXavA0S4WXBg95F33LXhdCojxY?=
 =?us-ascii?Q?MPdKNV+NauIrPZnCiZvyWXSojupZ5BbtnDmSE7VV6wZjzXbQ7JBFno9tUwvN?=
 =?us-ascii?Q?bhorft6RGTs9/PCByNrBSbBIJozV5SLRbGqCqx/L9m8RAgsSP7Jhijz2omAb?=
 =?us-ascii?Q?seKWwECBi7NLJ+3K7jeCb79UtORbRroFB+lEoug61L1iDUKajTyoYvf9qEoX?=
 =?us-ascii?Q?cH/gvMG67MHF2v9b0WLhfLDIFZohG1pzwuj1B+82tMGmRrzoBJ8ckGpGw8x5?=
 =?us-ascii?Q?1t/Ww7+pRMPWs5Bo9t+2BMsHAcNcah3BhhYudHYXCMwWT9R2cLbEttts/i0Z?=
 =?us-ascii?Q?xSAK1iOdC1WrQeOXB6jMIlS1Chwq84rae9ghMv13p/fEMzsF7yAru/j+y8f4?=
 =?us-ascii?Q?4x7AtqsDVELSg6GNIITUkH0Ooq5d8y1M/QygkAYg7zRzsH33EtO4r66NUFYO?=
 =?us-ascii?Q?TEBXnYOHSFndrJ92YVESJJk90569yU4eAVbtG1cO6ui+oKjZb/BpkS/HsWse?=
 =?us-ascii?Q?FOohi0NIP2oodj6Ipy7k6iJ9BSqhK4HBdMhTTW/vFF5Q/mG2X/CVWxPkoF73?=
 =?us-ascii?Q?6I2/s39Sa3rFgYv3aSoO47ZRZyvNiVVYeZgBztzR+XIMfbEKlJGOppAdQfTr?=
 =?us-ascii?Q?Ojh6ocivaA0yx9FuLP5Ne/sVpCHrUkxNfcw35Zxz+wY2n/M2EWoHH3ZPISE0?=
 =?us-ascii?Q?hdMr+iyxwe/jvsfpprhJq1CW/XwwIEQ5214ahJQbzl/T+7AfYXMOcsrfsAus?=
 =?us-ascii?Q?FIEvqcWFHrfvGCqfDUCdZqAAR9UgSmcdteb2FYfED0bBxa1FIGvT35XnDp5X?=
 =?us-ascii?Q?QXGXdGI70ktpwOxZIedLltSuwPXY09eqVEQMO1+MOG06Zu5a/5IlefR2NG7+?=
 =?us-ascii?Q?zm0f/4bYqVMLA5XvvgDFOEADdWaLHIOPIBEAYoOAZwwkJTY/Sri0vbEs+VFD?=
 =?us-ascii?Q?6lrrUcog/IjLWHGqeMg+cb6v1RIgKCH7FkvNIxCMaaxFAmaN07nq+hOtBs2f?=
 =?us-ascii?Q?Xuf+S6E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/hSUe4DU4LtwD95jYMc8MQgc8egdLi0qYtlkm74BH8m1hgbhGTlzXn3LBj3C?=
 =?us-ascii?Q?hjbgxgROmxz3kvgyLXhH3vpyRQjcrO4HL3Wa3nQCvDhlkfbbDdQNP8eRCVF3?=
 =?us-ascii?Q?Yr6GAWARBqEQqEECiCQi+wxhA/BnusMyoPVClJs2gwjc/QVu6NQmRAAEs86X?=
 =?us-ascii?Q?8CDWkeLiWqGet36qpdXfOVHBAbm5n44TIH4LDh2sQRc5nWcLNSd7NOj+dfeo?=
 =?us-ascii?Q?07tAn0W43ZkreIO0Ne9G+af1vpkNgZcR8PYFdeS8efBdkwvV1vf39iA+WC1s?=
 =?us-ascii?Q?P6VfwWilNSbzRA5v5CtJq7cLY2Vlf8300BkDtfxRimZHzgPiAJOAPVGZrbXc?=
 =?us-ascii?Q?EBfFTJMZDvrLKlsAUZf89/mqXPGZ5Ub7W252Nd6UYiKE0uZODdlxhJSlfmeY?=
 =?us-ascii?Q?wyzF5gaR0PC2GLA3LAKjVuyDc0fz+qJ+h0YR/4n+HKp4fLh2QrEZ7LtVAnM2?=
 =?us-ascii?Q?GuIb8x0FJppH3M4iuFXtfeW1VKjlc7djAimLlBRyqQxcz79QxVlQbk1jLiDD?=
 =?us-ascii?Q?JTQ+iyzU19cVM95HzlSBX8tK2aj2DgXCmJqPQl45NUKUCAGqu2cPBbfXVwXU?=
 =?us-ascii?Q?OH119PwQiqcsWFBuyV4z39j82OMuAKxZEFTL0P88oXRuqH1LAqqY8J1tLs6z?=
 =?us-ascii?Q?/X3bkHZAE7Iu7wmrNQaAXdb9BG057H23Dj8HSUPg2oZgaHK8qfjg0rEydd0V?=
 =?us-ascii?Q?E1Lp7UrgmBr3s2jrrLqHl+sHx3QMMiL82q8+ElvERBaR090BRMJbPvwFQitI?=
 =?us-ascii?Q?g6R60gDazjhRGnnlPOlGxps6zrblcJTt9CWfXsordOtzNH1xn3y+O69tmq6S?=
 =?us-ascii?Q?Lq1GJ+KP2no2xY1nOY3FXYkdLH4gHYg/XihhYU0fKtx7iaTQWuSBh0orY2e7?=
 =?us-ascii?Q?KREBMVEmb2ZHY4qM3DYoPjfzS1Mmy8t0gHr/XTJS9cRWwVKvoMy9WB9jqDIT?=
 =?us-ascii?Q?o4Oub6u3bBVnNxa9GQyKrK2D0ZOKviS2pWtpErcfIiwXrcak0hx7OaKVysfu?=
 =?us-ascii?Q?6cjltRjAnWxh5xY0kwAK0csX7LcPrKEmgGCeJufaXpThRSPZYXjZ2hZ07nVt?=
 =?us-ascii?Q?sDz9ySm2vs68wCi06bia0wkukI9tK7jUMvxySkFTInS+Xap1xCnNdS3aSylL?=
 =?us-ascii?Q?SuybhnxArexk6auOYpdTd4wymflytN/k99/Zr0CfR62nOB/3LGXj4GsorfQN?=
 =?us-ascii?Q?WBuiaJiypcLh6kuVat4lIe4cnm8tADUZyhRHd29bvtX2hhWFjJYrDPiWVxMp?=
 =?us-ascii?Q?DpHkMvude4syCSLlhCKLEcTKZV9a1UNQQYsJKFuNFcf48g05ruMrPvHFs5v8?=
 =?us-ascii?Q?3D/4+l5UHhP/eX0uZH2h20rMLptjSi1LRT/Zybi82TKUsRnBdg3fcy9e64po?=
 =?us-ascii?Q?y2CpVA0uUWImTOqDpmC4JYs7x6FY9kOznHr72uViQdDf5L+CAjBkHN8VUXpF?=
 =?us-ascii?Q?wYQDyknDAHUgOXahGk+vH6KTYMaBIGUcc0nrQUFCB9VG2RyUk/UXPOgHQyUC?=
 =?us-ascii?Q?9t7FjI1jK+2n+z49srrz2q5TbAMfejASKIGLvT33c2XUJ1E7UNEU3C2nlTbK?=
 =?us-ascii?Q?D4tbsyz1PEPdhJirL8IdBanIcZPTHnIQ45vvFu0E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4df2b4-3d90-4d31-4c8e-08dc896b790d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 16:36:26.4986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzNcieM0nacpTko4tHmnuM1DsX6PKEx8xRRZgS4JjNvpSMbWIyOoh7ODTArQE8YoKnkX8SgkeK56BFyvRssuGpEQoRZlV2Hdl8m4v0WdTrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
>=20
> Include G2H handler name when an unexpected error state messages.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Having a separation for these two error messages is a good idea.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 4464ba337d12..766ff8e48dde 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u=
32 *msg, u32 len)
> =20
>  	if (unlikely(!exec_queue_pending_enable(q) &&
>  		     !exec_queue_pending_disable(q))) {
> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> -			atomic_read(&q->guc->state));
> +		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=
=3D%d",
> +			atomic_read(&q->guc->state), q->guc->id);
>  		return -EPROTO;
>  	}
> =20
> @@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *g=
uc, u32 *msg, u32 len)
> =20
>  	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>  	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> -			atomic_read(&q->guc->state));
> +		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, gu=
c_id=3D%d",
> +			atomic_read(&q->guc->state), q->guc->id);
>  		return -EPROTO;
>  	}
> =20
> --=20
> 2.34.1
>=20
>=20
