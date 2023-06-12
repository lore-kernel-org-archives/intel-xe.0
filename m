Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0170C7EE23
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 07:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CFA10E164;
	Mon, 12 Jun 2023 07:18:51 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D67510E164
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686554329; x=1718090329;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uMGXDFrewqvwtCfq/FI/7L25+oMnYs7LaelKJSSEX7g=;
 b=Ly65m5AfNgnrFAhgj80rDdZaCNcMzjveoCpkNDxqQklYnjT4DyCRKWW1
 bbWUKGB8GuDW5D64LSFktb6engQHy1wnRgSWCuXCffGVgQgeMWYiRSXp0
 T8++xo5YdoOYJXS2HuGEuNTCMZqYN4rPOriK2kGl2MZugP4YnCOV5pPXT
 JznrPcZRsrfRnNkl5Xeu04Fi8N0jzSc5hudbA+fHVlOUcdGrXfi21RgX6
 +GQWqPcFjj8pkSE9F3d89ZSB3K+JulKABB3C359scrnU4shiMl+lF3C/R
 H4l0MrVCM2d9WACJjV2CDD8cL9QGGuv46+JF85Rjf2ZhWTRRuSIh6Zo/P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="338330134"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="338330134"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 00:18:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744223133"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="744223133"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 00:18:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 00:18:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 00:18:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 00:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frt3GxeMYODY/DOxhoWCGWL9i58/suwVUs+rnWCGbFv9ip8Y56Q6j2p4YjxMMS2lkxvkZnV7RR/BxofKoA/kF8GnB8HwXZoAoG6qLHzeYWcdtcnpYTQUSNQ9b5P6ptXKq8rjCT5b3W7rCLHds6KVd653jNRyCDdWD4vftK+DYWhifYIJOSvX+w6DSLx3+NuROh89qtc0pm0mnUb+lv0HK/WdJDbydlvpeHhMyCtsJoFkXh+hR2p32Z4kWtg18K10n1247PYhCRgJ6d2ZjyLEzrIwKus+QLGo5yQ+ISAjYviAFRlgWDFmOOjylfO5QhvB0i+lgNQYl7Vl/4vezSBfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vB9RPhNiEolrQ74Es/ZpinPRm6prUDShK7+f9WsiSIE=;
 b=F7fRbHRDS5evAMI0NVcORL9iIEkl7QhjktLkKaJx7yVcvGFFa5nQfd2IdG65KS7tUEvJ6pZgl5ofgtuhgHoEp4ubhkUZM75v2BeTbKyLiW88kYIee2pAF7Lgi0hjo+H/cqvWtHDyqMTNO/TYW1iVmSwsTm5UvU9DvLgp8hgJw+B3U1pm7ZwzbpGN169K1bjPDkm5oMYmoFukrusA+tvUACtiapzsaH6kJBNGFNMBK3N7CVlQD/ePal4ALbkZ3sNX0nX79KJizwM7hMAZdfWsA/wOVHZ6gFNPpvmCVC9EOHdpDPKMOLSp26Pi4xbuXEwye+iNd9fuQq61ZiZ3SOdGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 07:18:44 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:18:44 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
Thread-Topic: [RFC PATCH 6/6] drm/xe/hwmon: Expose power1_max_interval
Thread-Index: AQHZmHTdnCfZN1D9kkailSUQ3VHyZ6+GyaZQ
Date: Mon, 12 Jun 2023 07:18:44 +0000
Message-ID: <CY5PR11MB6211FF6E6377D7E8D8694F8D9554A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-7-badal.nilawar@intel.com>
In-Reply-To: <20230606125057.838618-7-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: joonas.lahtinen@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|MW3PR11MB4732:EE_
x-ms-office365-filtering-correlation-id: 8b8fb6a1-d45c-45c9-cac5-08db6b1541ba
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uNk2jrOo2EGhUNYcZqvSnnenOGcv01zeNl2m+LqczWmLsp7akS29X9j2Pj/Exk24OuEogqnOrXWDZHx9+VmFtYnXCtqKP/jG9H+q9ACNP14tUoB1wfHlduBfEQL3MJbDITFOasUwhGAs/MQ1QgD9ju3K2yxRCv7/t91A1OK/sirh9FH+kWyoR8p3XCirVSdBjyCPaBKY85gPpd/iBDOqe3FJEOviQ+1chkYaKzL3hGViC2e/dgSu1hoaBEOgIn7TV6LxinoqMbhbW06Tm9fkgvTLg2efPRIca/Ts7xB7ElX9kOzzQ93IlrB2vHCquS2oX1FYiblj5YDIVxl8lIIC3hojzDSiSOaFbNgHdSrKuOQmyxa6r+ODRqEsUseowOhj80+L6avn0RVTRt8uzz7lMCLAwy0tt62xabqm+0R10DSW5v6LyH1GT8xs7IuqLzEKVJ7O4OR2vxv9qNLK99a27ZwNhCWqXSG4XezJDOHPO9s3Nwcc59fQBTNsAFeiaqQF15LSU8DaQB9SGNK3hkd4kd95y+c7B0KmYDev8e4oBhqEFJrixvbQ1lOs1Vn+3K9aRzBKjbGP5OYfnv9NhPPB1vLmqjHIs6nxmYSq6DcrvzeLzSVkWt9eg+UElt1XkCOu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(83380400001)(82960400001)(33656002)(38100700002)(86362001)(122000001)(38070700005)(55016003)(478600001)(110136005)(54906003)(4326008)(7696005)(71200400001)(8936002)(8676002)(2906002)(5660300002)(52536014)(66556008)(66946007)(64756008)(66476007)(66446008)(76116006)(41300700001)(316002)(53546011)(186003)(6506007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?20mebMzj2F9gl4oXZou328+bVG+cN+PuYTybxy05dw3Z1kj36UG5Fefa3Xyj?=
 =?us-ascii?Q?U9HcJwuVzSeErjwJR8KHUIQLN2wwZ5rqe1cAw5exoUacnVIClxFZdRosfgzn?=
 =?us-ascii?Q?bdqk+dAQJyyez0t0xauFghj5/YCUq1B80M3JQSoFsR0r1kFtoHVkpOh643bc?=
 =?us-ascii?Q?6lLlPj+LGNiFJu8GIvB6P6xp9R9QcI8NVutMxkWoXSN+5Vc8C6bPesB/XMPR?=
 =?us-ascii?Q?hjRpHlJ4SV7+v1jHSprglYC4oNIyOWHED6pNcYRDr39Q4zEukiNW8TmOfWlF?=
 =?us-ascii?Q?NoiFCImawXDaLIedeaynYg1LPxaiRlC9Z0qYLRNzGp/AJTxKiF2xGgFAIDje?=
 =?us-ascii?Q?ut5O/RnWC6nVJ49pLp1nNf5YErcxvYenw07X875toKIgbicnMSJvWjNUgUhU?=
 =?us-ascii?Q?/vTivdjBW1G0lNXqDmc4OUUgLs++EIBh5tP3Vw5dl7MuBWz0tqGLoBIvsQlq?=
 =?us-ascii?Q?Vh/4uV/JIwikk7Q2z/QkO97trRhMNRNjWM2Xmwnh8EwFBykHwEeuxjT6k2We?=
 =?us-ascii?Q?4UjnzCyvslJSk35i4G2B1gVKRGaH7B5s5jduBNBWHBAi0fIWOzENR6/+Uex5?=
 =?us-ascii?Q?Lk4XEpME3f4Uiq6mbKjzx7FX1Z/N3LNZ6q4C7IglIOE1P86oJSHVqG9QPNUQ?=
 =?us-ascii?Q?7LyJoj8aWedUMoUHEOrzVeTJ724pOmkQOAAxSfY2QmmilSBAs1UIvF7vs3AP?=
 =?us-ascii?Q?ZhET/Yhu5vUHzbprimaPXBaEUmIWN8LW3X1cqI3gqfmHv5/kHNyjpaP7lTVJ?=
 =?us-ascii?Q?bqWWLU71K9WUayHoNIS+ldFbMKJTkucY9ZUzD/k1uNIcoCm6BFMuGBBtYDeo?=
 =?us-ascii?Q?rqHSDlf+C0ccwri7rS8N49WXQtGi8zx6ijpmSNaiN8L4XwlmaFR49ZPNHB68?=
 =?us-ascii?Q?dC01GXyWqv3g8GYhFHIv5WeTllFBYSx7HoRh6QJDCdQkb9BBjOsV2pVqCZou?=
 =?us-ascii?Q?GKkee37Vsutc+3GLom5Lse7Uh89V5Grq+1j+xt5L9FDi6xIEDOi6gOGMtLnM?=
 =?us-ascii?Q?Oks1PFVX96H+xTgvsr1WVOnejWkmxyC6kekmu26mEY9WfIsCBdagewGxOlR5?=
 =?us-ascii?Q?+Qq4QfK/KMxrOe7QracgrjdvZrkSdVk6c8ydOCryI4efsic0Fi07y6266tdu?=
 =?us-ascii?Q?XCXzYoL4uJaTfU8iilihXoFzpo3o8zpQ4idKdLMAsCOM8fkMgfEgTQSAWGMQ?=
 =?us-ascii?Q?2yRV8jY6af4YB8S3OxIjrA3U0yrozUQrTjtRadinudt/FPI7enpYnvfBUMUO?=
 =?us-ascii?Q?hRW+wXjB+kCo23/5WX2OKtel1eOP8mOAtYwQpoe+tvZuikAkP68MYDkgswAu?=
 =?us-ascii?Q?SbNGLDKo9s+Rm0RdULbRgMvDsAuOkvV+kv/+PuZMmZJKrHAGMaS5H9hzlrMI?=
 =?us-ascii?Q?mV20XJ4maZVj1yim0RHjNFxvZ7PbXimnLnu38x2RJAWxVdEnUNntH5Bc9PK6?=
 =?us-ascii?Q?dILutRmSu/8TK34d1e+ZJrMGKW27b1YhhGI6Zl9hQs4UBy6zsT2O6YljQLGa?=
 =?us-ascii?Q?oQIh1eQdrwjK9042XW8ts2cIoT9lTmK+RNo6rn6/cgNPA70XWKYxTJ/iqkRB?=
 =?us-ascii?Q?67qgkv7bsNoXZGxhuY1vAnFk+acZqJmJks86zDUJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8fb6a1-d45c-45c9-cac5-08db6b1541ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 07:18:44.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbO+3eePq9Vdf4hZ0dVojLo3j5Wi/+BK5SxuqtAPcbcu7tJyFuLFRDcig3I/z7tiUYdjWZvkYLdKag/6kYgdHGMy/S4XC+3302BgzSSle7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 6/6] drm/xe/hwmon: Expose
 power1_max_interval
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Tuesday, June 6, 2023 6:21 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Nikula, Jani <jani.nikula@intel.com>
> Subject: [RFC PATCH 6/6] drm/xe/hwmon: Expose power1_max_interval
>=20
> Expose power1_max_interval, that is the tau corresponding to PL1, as a
> custom hwmon attribute. Some bit manipulation is needed because of the
> format of PKG_PWR_LIM_1_TIME in PACKAGE_RAPL_LIMIT register (1.x *
> power(2,y))
>=20
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 ++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 127 +++++++++++++++++-
>  3 files changed, 145 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 64c09aa0689d..5e9542d4ece4 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -64,3 +64,14 @@ Description:	RO. Energy input of device or gt in
> microjoules.
>  		for the gt.
>=20
>  		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 093be7401a95..8e8e2a3eda49 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -20,11 +20,16 @@
>=20
>  #define PCU_CR_PACKAGE_POWER_SKU
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
>  #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +#define   PKG_MAX_WIN				GENMASK_ULL(54,
> 48)
> +#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
> +
>=20
>  #define PCU_CR_PACKAGE_POWER_SKU_UNIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>  #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
>  #define   PKG_MIN_PWR				GENMASK_ULL(30,
> 16)
>  #define   PKG_MAX_PWR				GENMASK_ULL(46,
> 32)
> +#define   PKG_TIME_UNIT				REG_GENMASK(19,
> 16)
>  #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
>=20
>  #define PCU_CR_PACKAGE_ENERGY_STATUS
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
> @@ -32,6 +37,9 @@
>  #define PCU_CR_PACKAGE_RAPL_LIMIT
> 	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>  #define   PKG_PWR_LIM_1				REG_GENMASK(14,
> 0)
>  #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23,
> 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
> 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
> 17)
>=20
>  #endif
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 63721a27081c..0c8d58eeef56
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -48,6 +48,7 @@ enum hwm_reg_operation {
>  #define SF_CURR		1000
>  #define SF_VOLTAGE	1000
>  #define SF_ENERGY	1000000
> +#define SF_TIME		1000
>=20
>  struct hwm_energy_info {
>  	u32 reg_val_prev;
> @@ -71,6 +72,7 @@ struct xe_hwmon {
>  	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
>  	int scl_shift_power;
>  	int scl_shift_energy;
> +	int scl_shift_time;
>  };
>=20
>  struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum
> hwm_reg_name reg_name) @@ -337,6 +339,128 @@ hwm_energy(struct
> hwm_drvdata *ddat, long *energy)
>  	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>  }
>=20
> +static ssize_t
> +hwm_power1_max_interval_show(struct device *dev, struct
> device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
> +	struct xe_hwmon *hwmon =3D ddat->hwmon;
> +	u32 r, x, y, x_w =3D 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit,
> +			  reg_read, &r, 0, 0);
> +
> +	x =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y =3D REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau =3D 1.x * power(2,y), x =3D bits(23:22), y =3D bits(21:17)
> +	 *     =3D (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 =3D (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 =3D ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time +
> x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out); }
> +
> +static ssize_t
> +hwm_power1_max_interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count) {
> +	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
> +	struct xe_hwmon *hwmon =3D ddat->hwmon;
> +	u32 x, y, rxy, x_w =3D 2; /* 2 bits */
> +	u64 tau4, r, max_win;
> +	unsigned long val;
> +	int ret;
> +
> +	ret =3D kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Max HW supported tau in '1.x * power(2,y)' format, x =3D 0, y =3D 0x=
12
> +	 * The hwmon->scl_shift_time default of 0xa results in a max tau of
> 256 seconds
> +	 */
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	/*
> +	 * val must be < max in hwmon interface units. The steps below are
> +	 * explained in hwm_power1_max_interval_show()
> +	 */
> +	r =3D FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	x =3D REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y =3D REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 =3D ((1 << x_w) | x) << y;
> +	max_win =3D mul_u64_u32_shr(tau4, SF_TIME, hwmon-
> >scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val =3D DIV_ROUND_CLOSEST_ULL((u64)val << hwmon-
> >scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val) {
> +		/* Avoid ilog2(0) */
> +		y =3D 0;
> +		x =3D 0;
> +	} else {
> +		y =3D ilog2(val);
> +		/* x =3D (val - (1 << y)) >> (y - 2); */
> +		x =3D (val - (1ul << y)) << x_w >> y;
> +	}
> +
> +	rxy =3D REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) |
> +REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, (u32 *)&r,
> +			  PKG_PWR_LIM_1_TIME, rxy);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  hwm_power1_max_interval_show,
> +			  hwm_power1_max_interval_store, 0);
> +
This adds a custom attribute to HWMON, how does it qualify for "DRM subsyst=
em "Open Source Userspace Requirements"=20
@Joonas Lahtinen what are your inputs on above ? This is very specific to I=
ntel GPU.=20
Br,
Anshuman.
> +static struct attribute *hwm_attributes[] =3D {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t hwm_attributes_visible(struct kobject *kobj,
> +				      struct attribute *attr, int index) {
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct hwm_drvdata *ddat =3D dev_get_drvdata(dev);
> +	u32 reg_val;
> +
> +	if (attr =3D=3D &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		return process_hwmon_reg(ddat, pkg_rapl_limit,
> +					 reg_read, &reg_val, 0, 0) ? 0 : attr-
> >mode;
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group hwm_attrgroup =3D {
> +	.attrs =3D hwm_attributes,
> +	.is_visible =3D hwm_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwm_groups[] =3D {
> +	&hwm_attrgroup,
> +	NULL
> +};
> +
>  static const struct hwmon_channel_info *hwm_info[] =3D {
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX |
> HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT), @@ -729,6
> +853,7 @@ hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>  	if (!ret) {
>  		hwmon->scl_shift_power =3D
> REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>  		hwmon->scl_shift_energy =3D
> REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +		hwmon->scl_shift_time =3D REG_FIELD_GET(PKG_TIME_UNIT,
> val_sku_unit);
>  	}
>=20
>  	/*
> @@ -792,7 +917,7 @@ void xe_hwmon_register(struct xe_device *xe)
>  	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ddat-
> >name,
>  							 ddat,
>  							 &hwm_chip_info,
> -							 NULL);
> +							 hwm_groups);
>=20
>  	if (IS_ERR(hwmon_dev)) {
>  		xe->hwmon =3D NULL;
> --
> 2.25.1

