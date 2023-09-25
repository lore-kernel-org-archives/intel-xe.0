Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E090CE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 09:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E717A8918D;
	Mon, 25 Sep 2023 09:16:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E54B8918D
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695633366; x=1727169366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=or+WuD97Zfv8ubuf3KdvOjcaqYbj36nIRdNqQCNmPws=;
 b=SzW7MacziiQEzkhbAK//qL8PrCO17yV9vHvjBfoEg37oRUlSGeuDRTAc
 ig0hLxPvzpeihf8AMpX0pZaZb+OkUoTrIoZARlIbmvz23y+tiWFNteE40
 2eRaj+8+6nPkslelu5Ic4Mtgh61mlNhRNEe/mkxD0FSuSVQ2qkn3K5344
 5EKFGm0HATjiBjYuGB8ovtx9JupBGJ7jeAT192/C8Wl1Ll/D8M5+QcJaw
 xvE3fVif+HBDLvgNsGlkkKUWp99arwdR5/h3s9RX0a3xKQNH6SWJSnRRe
 fy9afci7XRETHMMQBsE0lYAPWKDs+CsZr5Vv0U3sVi7/lHxzXoi3J8URB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412136283"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="412136283"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 02:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741866687"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="741866687"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 02:16:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 02:16:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 02:16:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 02:16:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 02:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtYROxiuJhHNLKAhVnCqb0SEWHlyCmP/Q2Bl7hknscvycZK6gptumpBRygPMwVg4lY4DYd0IV1JPpM9ga+qD661Q+1XLJ+g9IIPAjw31RlAaWjW11zI+EgqEiZTUED4L3OWRXrDMG7mWd7sdkNssK0Dt7ATIOfN2v3mtaVUK3SLUkGZMWn9OOeC4n4vhhd6X3NCMtK+pXtLqAuI2yld5ThTVi1fSQ9S8jMzXYN17dELHpZxFbxJvcqfMYKSkxBDkAPFiv0Rnt80nmSuDHXMy1T+NVogABix/NgnbxnqV9DFZO1TxMb0QJ7Bf3n2bqySBeNzWFxBOXZRnqTNLVPRCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trT36t6f1d/7U3r0KcQi0ntRgUEi5uWmwVsGNOCbXjw=;
 b=elWghYpW1JPO9pwTp5oxf77z+RJwpIODM1mpxnS6NiVL+fNsm6M/U0CWOvm7b7l/8hXbR4QSL13JX029pdh1216dFS/SOaiXy6vODRms3esUW+HPt9iI8jHV5he6cPcnc8GJg4M3X/1bQLtn81/0gbf7dwHFNsrKJa0Ts/RaZ/kOnuW8tXTj4Wrl4d1g7qoc+cOhawY+9NjWZjo54t4/fhdUtVs+MOOo2tI+tWGRAlVKqf5vFNR77fkGBKW4WMszq575gfiSoRP1HJxARFD4BKdU9zSkS5QVo2sZBXmJNfm1VF+knj2x79ta3ib7k25zZc+rpv/D4YBrQgJMoUp/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Mon, 25 Sep
 2023 09:15:44 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::47c3:d35d:e598:b83]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::47c3:d35d:e598:b83%4]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 09:15:44 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
Thread-Index: AQHZ7vdt6BEnqkxFwU2zu/dlQscuBbArQWEg
Date: Mon, 25 Sep 2023 09:15:44 +0000
Message-ID: <CY5PR11MB63445AE80355495983540166F4FCA@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
In-Reply-To: <20230924144751.446446-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|DS7PR11MB6125:EE_
x-ms-office365-filtering-correlation-id: ef2300d0-1dc7-4f84-9622-08dbbda7ff21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdsK3cEyjaxCRdZnCwEygHqXRekK7PT5YXwIf7+2BFsO2YMXvnJeF+i9inrLEzNEN1MtlJE1dygRxJH/7PTy6n+AetYt3HKJTDwdTjxUnuqym1kOueyWT10TzEOHT2/umWbRYxDitfkq/VUeJoRjglcgL83Pw2Zt3PHe4dbhyzHjlArw7vMWj2DdaedJnS4wmH4YF2OJLe6YwGCBrDNGIIrPSU0cOTeGMuq9ur1aVYCCFZp/aNAfuv7yYKM/Z/xPQLGGzXZNjCTx/oc/ZFWO0z3UvkbBY0FXG3VtP2WXkmTaoIAyuqgc2/tYWsDrdVqaZDpK/SbIbYOOZrb79mOHAdzVY3C3Bz0HcPzkHO97C9F5nrhL5NngwR8i4N4MOoIpVZTHZ4I0p6KYTzxu3SFdUsQQoE33dmUEehkiNc0eJAtGR/K+7t0KNx3+OGZZyNsafRPrPxb9R6/9KQ6mWOHCVR8bwRR2qSQjMR5jiaCtrHRfwtSymEfVW9u7aagchVbBzGyY0DQF25X7iJNbCdHX6/qkO54pwNKI+LRiJf7Rl7vTHQvlRqs8VdfRkNEeaXkEyKOH/cASK8e/dQuSaqDkEJ5a2ggGGAO7/7gHGG3fFjCVyb3kLiQ/HScfC7uftQjB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(366004)(396003)(230922051799003)(186009)(1800799009)(451199024)(38070700005)(6506007)(53546011)(7696005)(478600001)(83380400001)(8936002)(9686003)(5660300002)(41300700001)(26005)(66446008)(66556008)(110136005)(66946007)(71200400001)(4326008)(316002)(66476007)(2906002)(64756008)(76116006)(107886003)(52536014)(8676002)(38100700002)(33656002)(86362001)(55016003)(82960400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?olA03klGDAgkV0k3hVppheO2jigAwCrQ2jIaNevctftBvyw2LXDT88nhROcu?=
 =?us-ascii?Q?cLOpFJ57yI7laUi4EyfIdxNulhk26cOI/66v2vUnJ44bRpRbXzaeqJaKJxQM?=
 =?us-ascii?Q?srg7YMphu5a4uU42eP2xIebOCVA4q4Qv0UBlQwcmClSsiFl+zOn8LVri6Plo?=
 =?us-ascii?Q?3yu8QOt3e2KiNGxLr6vEoJSYSqR2DrLL/ZaiyIt/PbETp/kpBYAEMHMfYWpB?=
 =?us-ascii?Q?m3JT5p8Znz2g/K6ZxbMZyHO1dkaQaXHFtgaPiJZD15gGv43f4Q2uo4SJnQF4?=
 =?us-ascii?Q?Ce9lrsDnZxr0+2cV9EpQtWK4AmymiTcfIbKNEOf1oDLSLZv0/upxIEY/atk6?=
 =?us-ascii?Q?Mkxuyp7W7ZnRarlZWlVpoMjZlYfeiExTlH14VtzydHQphR1b/19M5U6xFw6M?=
 =?us-ascii?Q?INAqtMBVucLmbViXMLAEtjkS/Fj38IAjNJ+ga6o09iOVXFiP2r2+wDNnxxv5?=
 =?us-ascii?Q?J9TKmJCi9gX00ak5DXD7zwwygTvIVQu7iCl42aS3RYnQey1I6CLyVJlWuOGv?=
 =?us-ascii?Q?YulaBxY8TiYR3mug63DkinztPx7a8P/sC6RKNoZlISGbNTo9iI3NDrUMxCME?=
 =?us-ascii?Q?utjo9DJOCFWNU24FMwVrY9OcCIn21hGy1rLfIV/Ub9iId2X+RrxcwQuI0YW3?=
 =?us-ascii?Q?+ckXRgDopp661YsFiL0XYNGj5st+8dRuv+D5fen7iT4s467mTVujLFwe0N2I?=
 =?us-ascii?Q?EkWuS7FZlcr2sxHjAJRn/lTxYD2wneS2SjhopCZa/7vn4mCimbQGSxkk/hG3?=
 =?us-ascii?Q?i03ucy8VWV6p0dx7htTkWVgQrEd1aVHOVw5YvPvW1e8hj7fViNIYPpZkR809?=
 =?us-ascii?Q?2cBKDDrf9Z6sR9OshZqjbM74aKtlsFSvWLy2EQ0OsG/OK78qRDo45gkYtR3Y?=
 =?us-ascii?Q?iQBeaFl5y7QGP9dHQ3DWUyTA5KtFoaJR1hBgv2KNisT0SqHKWI1Bj6bLLZvu?=
 =?us-ascii?Q?97PivvDMIdNrDF9uC/g7PfBzmn3oyTf5ohKEu0LDChJ8/+ulKfOd2/bHNOP+?=
 =?us-ascii?Q?yYa5B/M5yVb+2OLyhHrHV5y6qIfEBrKRYQLI9QJkkVPFb793zNaxdM6ycbMl?=
 =?us-ascii?Q?vZOeMmweWJXLDFnNm3MXDrWtWNDkMRs7M3W4LgLXICV2t5RMHuzphrrBqtij?=
 =?us-ascii?Q?LBmVR2XFzJEelJ+7vwUkWWlcu4ST2GSIDyRCiY7fm+3GPCQBZrShIi+urXlH?=
 =?us-ascii?Q?OLMAFa9l90I6EHP83X/Nh7IIqN4Zf1NKIdnU7RqtYgSORPm6rYSO2kilOtPh?=
 =?us-ascii?Q?BgzYhzxRhebZPk3ZClW207QziHw26b3iLNWvRoI/IrsZZNPlyhoIbEUT76O/?=
 =?us-ascii?Q?AoQ3sPEeXNU9Lyqjz+O7l/3lP2h0LI+IS1K+LJ44V+pIjrSoygOmCp8zTpAR?=
 =?us-ascii?Q?0t3WQsgmnVPyxTWVBulSH1oNwq0NZ81qAsNdCCvCe5ru7fo37J+TUo/lZVVE?=
 =?us-ascii?Q?p8e6dIzHXmnHe3yzoJjBE+SD9HxnuxpUrVWkdvuRcmpMkYxl4bK9iB7a1gJl?=
 =?us-ascii?Q?x1mrp928setcqlHxeglk6NUFb/DbmXwwahk0FFt3TrKi3oKqygbK/OUjKaD7?=
 =?us-ascii?Q?GrrxFnzsJEHk/8MEmVyp2HOA2Sm7HNy8farKLWBS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2300d0-1dc7-4f84-9622-08dbbda7ff21
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 09:15:44.0397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3m4LFCNzCxsIdv0166HDob44Kz+DnMZjSHqsbt+rp4AQRhlm0xmRUTVjoJpPEtmv+vL1pUv30fe5fp23mCNzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
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
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun=
 R
> Murthy
> Sent: Sunday, September 24, 2023 8:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add module parameter 'fastboot'
>=20
> Fastboot is by default enabled on all Display 9+ platforms.
> Module param is added in xe for controlling the same.

On Xe, we don't have the module param yet. So, there is no
way to change the default what we set here in this patch as of
now. We should modify the statement here.

It should be ok to get rid of the #define and have fastboot disabled
by default for now. But we should work on the task to get the
module param or any other mechanism acceptable by maintainers
to control fastboot feature.

Regards,
Uma Shankar

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 1 +
>  drivers/gpu/drm/xe/xe_display.c      | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index a82f28c6a3a0..f73c0672bd54 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -458,6 +458,7 @@ struct xe_device {
>  		s32 panel_use_ssc;
>  		const char *vbt_firmware;
>  		u32 lvds_channel_mode;
> +		int fastboot;
>  	} params;
>  #endif
>  };
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_disp=
lay.c
> index bb4938a84f47..8a80d85eb104 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -123,6 +123,7 @@ int xe_display_create(struct xe_device *xe)
>  	xe->params.enable_psr2_sel_fetch =3D -1;
>  	xe->params.enable_sagv =3D true;
>  	xe->params.panel_use_ssc =3D -1;
> +	xe->params.fastboot =3D -1;
>=20
>  	err =3D drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
>  	if (err)
> --
> 2.25.1

