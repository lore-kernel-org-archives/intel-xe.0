Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4ACC25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 11:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190D610E357;
	Thu,  9 May 2024 11:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuJUSIHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA69D10E3EE
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715254585; x=1746790585;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r9Bgo1psOEIsB38GLiOOPn1NcWU2VX4RjRmmF6Ts2LU=;
 b=HuJUSIHrQZ3V3EumI74rCqQiXho1lb58SmmNJnN7WlrfPIu2+3+3zQ2W
 yz6TTTooj3N4wVg/S9mBYpZQLhGx4/eWqFSZP6wpUVKHpdKQ9eFHkWWl4
 JmKtV9gN9KLC7YxyDlf0NglRNnhaYfwV3O9z/ONVC5EregMnihsVVlVkD
 g4S831Mvhi0KAdzIz3eHNj2UCSDmGc+UH49yrlL54aYTgyqDfMdktMEZy
 7yfpIVkll5grqP+70pALDrvRebUoc9aIGtPUcHa9TMI9ndo4wPnKfMN4j
 ndR8tK1tYASWdEmAxPG/kjpEQxYIsZRwTacDsRfZa1qvgADayXGSX9Y79 w==;
X-CSE-ConnectionGUID: 6e/QxOVMRwmK1UMD+lnfgQ==
X-CSE-MsgGUID: TXYCDqqOQlKW05+3/2l9lQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28681312"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="28681312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:36:25 -0700
X-CSE-ConnectionGUID: lInMIUnKTQu1fvX+lgEgAg==
X-CSE-MsgGUID: ub9X20MFSzmogbjKGXevNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="29590213"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 04:36:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:36:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 04:36:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 04:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwncX10Tp4G+dq6cNfjSIA5oRxJKEobY8sZ+31ZfGuPRwga+2qgJmb8A/8ueYoT5ma2vYBIBszhpaTCn9lhCy4cYXhRa0LX/3G1EdmRyso1SnIDGAxzWpMD6g5tlae91fOfleKzbEt1RkgUOeoSd7HOlFYxNObPtQVgGdqgYo2qvHUlH+9wyXp5qfWiF7Pi5Un35pt66/UWTcLZpkTgZcuSwg9C0sPJsnjlO+XyTpVFB/LH1IMDkDtcs9rkcUdGm/LYanSPMTixEs3+Q9qfjbZhKXj7NIP7efpr+q9Hp9WNvj7pp1Wu7BkrXUnPcT0nCeWzwBf9wcu/YtM7puP9tnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CovUSKGXmGmal15f+v6nG3ZkJjCSYhaSnSprigIgTwM=;
 b=fNe8jMT37w/ZpLVK5Gv0RGyWQvdYv+2Ef7ZuyhvPGMnjk/v9H7ZPt9qT60qRo3gEOi7Juyqx/QZJ+95bNQGwOVeZwAnGVncvMV9grPK+vd6bQNjnvNdlGLxgElRbzF5rambo3izG/vl+PbbA5d1GTuuSyI1bYkgx0WjHoIOzbwIb+xSYqB15z1herZQQc+3FFoXqA7pk8mOBxF358FsbVcu0eMixXRegiuXYhbNOhnudAR34dBmU+nBS+mAW4xAbeV8ICl2ywmak4jLBssGAGlo3tyJYuVdzSige+DrGNsqftUeYGQ8XjF9B4CqrKEKDiu7ZPyyHdFFDbf2PqPMOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 11:36:21 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%3]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 11:36:20 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 5/7] drm/xe: Prepare display for D3Cold
Thread-Topic: [PATCH 5/7] drm/xe: Prepare display for D3Cold
Thread-Index: AQHaoYNZaAOgLgZOx0K7KwE1WxJXCLGOwBHg
Date: Thu, 9 May 2024 11:36:20 +0000
Message-ID: <CY5PR11MB621196AB206554B4B79CC9A795E62@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
 <20240508200707.375414-5-rodrigo.vivi@intel.com>
In-Reply-To: <20240508200707.375414-5-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH7PR11MB8275:EE_
x-ms-office365-filtering-correlation-id: 24b4065e-2544-433c-db00-08dc701c3f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?hPlud1J1FkEMdVMzDNmDHcraZ9od5gkH6wLiTbyOlEz2iq2s85+1BycC2mGB?=
 =?us-ascii?Q?vBco3WrfHwlQExy2Xhjq/8enzTeH6LuaQFRAdWOdNz0MDZZwankmOn3jmjed?=
 =?us-ascii?Q?eXjcdhUxF05TS2exOVHyAEvQWUpFZktz+svV2yGMEFn9uBvQuY0TlvryPCcl?=
 =?us-ascii?Q?DvKTDTtqrzimp9QyWcGq3BTqGyD2HWq9Cyqk9d07YDwItbB7Q3VttadkcE7J?=
 =?us-ascii?Q?kg35BWkkrItWwONskTKyCqcqIj6b8unzisDbJYhwpWllU2zWvbjRYSXYQ2W7?=
 =?us-ascii?Q?OO7PeSxg5/dpOJPpmrsQ6SyQQDwRMBgJvR02TiNmnANF6WZJgcnpxwIecRix?=
 =?us-ascii?Q?9p068n57th6uJCcnSFeLdnowI28iQaLRvJ0bBrGpv/RAe6nRU4GFodwcOSXk?=
 =?us-ascii?Q?U5kusCMzekn7sThMZax9ICvRJsz8hrMXDjX/j1/wMBPtAGd8btCz1Vp9e/oX?=
 =?us-ascii?Q?AhDNkkhi4D8GevEQuHE7EDeV+nAiEBj6arCze7USirUhhVWewwEDB0BkXtbB?=
 =?us-ascii?Q?Sd6L5+dKr9w5yIvQJqpQuL96PrukJDU6Kfd5tD59aOopj0HXgMD/hHchWY1l?=
 =?us-ascii?Q?BCFXFbHzBaS6OCOIojQ+nMXG8wvNcM+wzPmSjcA3rEcrNmGmhX8IovfUcC+F?=
 =?us-ascii?Q?OtAjPcOXrVknqzBmFgnyyNVWWyIDV/S59MZyfp+4NXrfSblWoF/zCveuXXmC?=
 =?us-ascii?Q?EBH6PdlJfx2i+HdNcj1w4TrcjK2VPbo3jyzl2aEslXcFDVhHLFBFcPjnUq/+?=
 =?us-ascii?Q?KIxZBUVWKruMDiMrWt9ExIBhM64oMkooVm0Nc06c7LERJW9CLyIYVacXQmJ3?=
 =?us-ascii?Q?x4e9aoR39BnBoKAkN/DYryagFT/sQYTgr868UIhT8nLUKo5x9XS6MHUeWzLb?=
 =?us-ascii?Q?PZgzzLQUDTbykl8Dk73KP5x6narN10EDwFHJBUJ8KVvuCqk3zbuOZ3vCUhL1?=
 =?us-ascii?Q?efGBuB9EVPwmuS6I63SW77xfenToLNvXnjzeMtL+q956ssdm3khlx0i/LgAu?=
 =?us-ascii?Q?+7/R+8E5av+Zi3tyaZWF/BbzQVOh/8namsBeHkdvZHO3x4ca1FU3HgoJvA4j?=
 =?us-ascii?Q?wFBiYd4aa2j97dVZ+f5k3MTyrDBX3OHka25I4a9H9OzFGpSM6e26yli+HorO?=
 =?us-ascii?Q?xNiltz7qYyhZ5BoLPXVKyKrh56IwGDPxv4smbfLUNv8o9Glxe/YYyDMTBMoo?=
 =?us-ascii?Q?7XAM7h/ciS9hPGwEJhfcHdrUWHPWo+1+kxZyxjrVL9BTkxe5dZxlhp74cdyp?=
 =?us-ascii?Q?7m83wWS8kjEqwbNYGbpqLvZ1oOe8wKx/a6/wZC+DtGNx++5M3ANpdmkPeNE/?=
 =?us-ascii?Q?0F8kYoi9yvyv+IVhyvZurFtfQW3TvleyZ360dhGTyFRLpA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2qFi8xWZuZjjkOBpq9/DNzIYTjz/n+jjp03D2br9sCTyJbZe0dLeMPwm0xtD?=
 =?us-ascii?Q?c5AnrIzHUcAGRsVl+PCgiI7KItpERTCDj5LNZXy24IMF25TmM7YXuBgNmO5k?=
 =?us-ascii?Q?z4cMfwPUmIpsM1ROg1vaBzS6Lt/u580KNcYGcMnlBnMCnu5GtEcFzxpz3uG/?=
 =?us-ascii?Q?FRXmBJ25Zxe1cgIFOtnGiNq589U9AZmP/iVT0hLF8UXZtt/RdG735nqOuj/W?=
 =?us-ascii?Q?fEgqeO3Y/NH5KgM4R2b/F2pRSdhlL8gEAqM6U7OJ0ggJ6BGLQ1/WBqn1AWM+?=
 =?us-ascii?Q?oQ0kaEaMr4Ix6jJhecr5RZKPYWJITTx4o8atcuPI2KOtzHo+VNngbt9h6CV3?=
 =?us-ascii?Q?f5QTVEffgV/1EtTEDPb6h5p3royEj7e8I9WRgWlYvRkxdyjs340PkYOTVwbf?=
 =?us-ascii?Q?RXMfmJMb+diPIC0mwbtSrzK3vY3T5QqAhR5fPZfMw6m5HnU+Rmk+AfU4dPOu?=
 =?us-ascii?Q?NbwrvxR4GQsoM5nQ708ob9cYyBWh12XX5J+OIKm6ecwkwNZSdDBUgGl6UU9k?=
 =?us-ascii?Q?LPERXDqafcAcCyg7+6pgTfu0vxqjpKF99lD7BWM1oV10yXxYrEQjAj1CCBY/?=
 =?us-ascii?Q?ZvclrLbhCtIK7IU1G2zXlpMO/w2P7htvxW3jJukPKj10I9Bamw38OYANLCD9?=
 =?us-ascii?Q?AyOdmNDRZoDEf/jrwucQ4KuWRGdmG/3B370xHjhI6AnfZaOxsNvrw0uEvvvG?=
 =?us-ascii?Q?bhvHxNQ7rKp8NRMBONX/l7Pys7EuIF1kzOiMJ4/BKLgZz94quNo2DsQmU/j7?=
 =?us-ascii?Q?fpGU8Nav2+6dnPSMA6tKVHjuIVni6WQC7YiUEhVUvYOAi1vQ06nKxxXGdB0c?=
 =?us-ascii?Q?+bbwQrB/B6VTDQ+Ah+Va9+W0yiw59gMnMKVaHA1YKQoKihWNW0gwj2gsPN1h?=
 =?us-ascii?Q?hDDJJ/0UOHLlr7ox7ETQth7Ow9F6AERilctnqRGJIs7S1SlSkSc6LlRt0MGl?=
 =?us-ascii?Q?JI2EMGHBLCCLx1PX1/5FprXjSPu8PpHaG3kKlAXWd34P2D76XHBCS6iCo6Ah?=
 =?us-ascii?Q?TBZcBHVCS5ZkmncX255VZEMHc0OqW0msyzcbuTNDFCZQenHSB8+mBHTP3u17?=
 =?us-ascii?Q?3E9B7qqDdTYbv4YpNKN7C3qUEmVQNT8nmOCjCjICaGasMCfyz8TL75dgNikn?=
 =?us-ascii?Q?0Tz/d0zSq+oJZ/2CowOza6EyxbclmI4odTp3GqZKFjwqQtUxO5U8wPi8FkbH?=
 =?us-ascii?Q?Xe0YLu26b9NAcTaKpTdNISUavu13mFDX6nLoqXjc2kpaDfs0oyOinzDtHOQO?=
 =?us-ascii?Q?xGH7I13n0vETT7Ws3607bubgN/XOa2pT8OzJP8d4Q1rTLaBC3Ig59olLgIGQ?=
 =?us-ascii?Q?ID1SJ2cFnZYY8Wq59esPYjN/xZ7rjPqRvc38IS9G8QvWp6bVjdmxuouueTap?=
 =?us-ascii?Q?WR+X1a3Hf1U5OPlGgnkDWc54kt9v65J6rwLkGQ3ckZ+T4fbvpSkSPCswHeZk?=
 =?us-ascii?Q?LkZl8tiBMjMj5+OqM3QtmHnikKxZZbDnDzsdkaYjxqDx3DP/ie161VsVcMm4?=
 =?us-ascii?Q?VS7p3zFaD4j/1ehqGiSL3K5/ZiB7Whe+VGHgNvkgBc+sFbd+COr1+MrSGjzA?=
 =?us-ascii?Q?r4j5c2afDXSW0GwDhn1NRth8zmXsGk8vg7WSm76r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b4065e-2544-433c-db00-08dc701c3f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 11:36:20.7794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UP4MwXEkAMs8qJulCAGlXWXh94OCy87IvwPzjctCl0JWUvL06wU7o2aLLhz4ZTPPvPwUAckFv2/Nv3LH4Q/95fUHrwo3jKK8/qDGQ3lxaEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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
> Sent: Thursday, May 9, 2024 1:37 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH 5/7] drm/xe: Prepare display for D3Cold
>=20
> Prepare power-well and DC handling for a full power lost during D3Cold,
> then sanitize it upon D3->D0.
> Otherwise we get a bunch of state mismatch.
>=20
> Ideally we could leave DC9 enabled and wouldn't need to move DC9->DC0 on
> every runtime resume, however, the disable_DC is part of the power-well
> checks and intrinsic to the dc_off power well. In the future that can be
> detangled so we can have even bigger power savings.
> But for now, let's focus on getting a D3Cold, which saves much more power
> by itself.
>=20
> v2: create new functions to avoid full-suspend-resume path, which would
> result in a deadlock between xe_gem_fault and the modeset-ioctl.
>=20
> v3: Only avoid the full modeset to avoid the race, for a more robust susp=
end-
> resume.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 10 ++++++----
> drivers/gpu/drm/xe/display/xe_display.h |  8 ++++----
>  drivers/gpu/drm/xe/xe_pm.c              | 15 ++++++++++++---
>  3 files changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 0de0566e5b39..4b3fae8b4893 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -300,7 +300,7 @@ static bool suspend_to_idle(void)
>  	return false;
>  }
>=20
> -void xe_display_pm_suspend(struct xe_device *xe)
> +void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  {
>  	bool s2idle =3D suspend_to_idle();
>  	if (!xe->info.enable_display)
> @@ -314,7 +314,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	if (has_display(xe))
>  		drm_kms_helper_poll_disable(&xe->drm);
>=20
> -	intel_display_driver_suspend(xe);
> +	if (!runtime)
> +		intel_display_driver_suspend(xe);
There is one more reason, we won't need full modeset here apart from avoidi=
ng the full moseset,=20
As runtime PM will only trigger after last crtc will be turned off by dpms =
off.
There we already do a full modeset, so we don't need full modeset at runtim=
e suspend/resume.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>=20
>  	intel_dp_mst_suspend(xe);
>=20
> @@ -350,7 +351,7 @@ void xe_display_pm_resume_early(struct xe_device
> *xe)
>  	intel_power_domains_resume(xe);
>  }
>=20
> -void xe_display_pm_resume(struct xe_device *xe)
> +void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  {
>  	if (!xe->info.enable_display)
>  		return;
> @@ -365,7 +366,8 @@ void xe_display_pm_resume(struct xe_device *xe)
>=20
>  	/* MST sideband requires HPD interrupts enabled */
>  	intel_dp_mst_resume(xe);
> -	intel_display_driver_resume(xe);
> +	if (!runtime)
> +		intel_display_driver_resume(xe);
>=20
>  	intel_hpd_poll_disable(xe);
>  	if (has_display(xe))
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h
> b/drivers/gpu/drm/xe/display/xe_display.h
> index 710e56180b52..93d1f779b978 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -34,10 +34,10 @@ void xe_display_irq_enable(struct xe_device *xe, u32
> gu_misc_iir);  void xe_display_irq_reset(struct xe_device *xe);  void
> xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
>=20
> -void xe_display_pm_suspend(struct xe_device *xe);
> +void xe_display_pm_suspend(struct xe_device *xe, bool runtime);
>  void xe_display_pm_suspend_late(struct xe_device *xe);  void
> xe_display_pm_resume_early(struct xe_device *xe); -void
> xe_display_pm_resume(struct xe_device *xe);
> +void xe_display_pm_resume(struct xe_device *xe, bool runtime);
>=20
>  #else
>=20
> @@ -63,10 +63,10 @@ static inline void xe_display_irq_enable(struct
> xe_device *xe, u32 gu_misc_iir)  static inline void xe_display_irq_reset(=
struct
> xe_device *xe) {}  static inline void xe_display_irq_postinstall(struct x=
e_device
> *xe, struct xe_gt *gt) {}
>=20
> -static inline void xe_display_pm_suspend(struct xe_device *xe) {}
> +static inline void xe_display_pm_suspend(struct xe_device *xe, bool
> +runtime) {}
>  static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}  =
static
> inline void xe_display_pm_resume_early(struct xe_device *xe) {} -static i=
nline
> void xe_display_pm_resume(struct xe_device *xe) {}
> +static inline void xe_display_pm_resume(struct xe_device *xe, bool
> +runtime) {}
>=20
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> c3ef2283770f..a2f5a1b11cbf 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -96,12 +96,12 @@ int xe_pm_suspend(struct xe_device *xe)
>  	if (err)
>  		goto err;
>=20
> -	xe_display_pm_suspend(xe);
> +	xe_display_pm_suspend(xe, false);
>=20
>  	for_each_gt(gt, xe, id) {
>  		err =3D xe_gt_suspend(gt);
>  		if (err) {
> -			xe_display_pm_resume(xe);
> +			xe_display_pm_resume(xe, false);
>  			goto err;
>  		}
>  	}
> @@ -151,7 +151,7 @@ int xe_pm_resume(struct xe_device *xe)
>=20
>  	xe_irq_resume(xe);
>=20
> -	xe_display_pm_resume(xe);
> +	xe_display_pm_resume(xe, false);
>=20
>  	for_each_gt(gt, xe, id)
>  		xe_gt_resume(gt);
> @@ -366,6 +366,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  		err =3D xe_bo_evict_all(xe);
>  		if (err)
>  			goto out;
> +		xe_display_pm_suspend(xe, true);
>  	}
>=20
>  	for_each_gt(gt, xe, id) {
> @@ -375,7 +376,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>=20
>  	xe_irq_suspend(xe);
> +
> +	if (xe->d3cold.allowed)
> +		xe_display_pm_suspend_late(xe);
>  out:
> +	if (err)
> +		xe_display_pm_resume(xe, true);
>  	lock_map_release(&xe_pm_runtime_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return err;
> @@ -411,6 +417,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>=20
> +		xe_display_pm_resume_early(xe);
> +
>  		/*
>  		 * This only restores pinned memory which is the memory
>  		 * required for the GT(s) to resume.
> @@ -426,6 +434,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		xe_gt_resume(gt);
>=20
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
> +		xe_display_pm_resume(xe, true);
>  		err =3D xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
> --
> 2.44.0

