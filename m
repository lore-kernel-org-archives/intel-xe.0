Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED52DC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 12:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1073510E35C;
	Wed, 29 May 2024 12:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faqUy97p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A110E35C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716986403; x=1748522403;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1DqRDIN/L5zop8/t17kCtQ7vb2TxL+GdmgRE3qWlnnw=;
 b=faqUy97pbRtQLVXwXsO9A3buaFn4l47K8nNyFqBnua1vgb1hCe2Ew6x4
 rB8R38SSucvk++hGTenKjY47/t5lEugT91v6BvspZSsgcjsmKof4X6y3s
 OFpWVESbSoCJiuOC16eCU1/gWffGJmduStBCQs4I5snrq82T6aCtnG80S
 n0/spvxjHlvpP6TCWQ+n1YHYXKqd1SzhoBuPr8AtitByXXtpHShaKQ56E
 M/BzCcNMTm+DsCdxEGm2rl2voEw/v9t7IOpsxcB2rAUpxXain98vrfEyH
 mCtrwOJs7weXvSoUlySVujysF5dpGSSdxQPn8fat4UItkG+lbNaDCHBt2 Q==;
X-CSE-ConnectionGUID: g/6oxf9gSzOY+3hn+VKlfQ==
X-CSE-MsgGUID: rxKnGYo4QdGw0BUCbwfHCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13505802"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13505802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:40:03 -0700
X-CSE-ConnectionGUID: oZ7kGFh3RrOcIyw3TS+C5Q==
X-CSE-MsgGUID: 0EtDUczFRxOHOJvcFZdb9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="58589732"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 05:40:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 05:40:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 05:40:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 05:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQy/52fpPAienFqV2faRkB+5nVIP/faqCoA6ZOEtYU/QDUTXVuLi7aex+L6MJllF7kn0lg7e7MKjUT1CDnwSfj3+XDeFgZslUtSAOmPziPjl1hzphJsnnju/sYizbNGN7qXx2kIpzrHKFUo1x+JfpxtLO6PRWCyzs19dl4CdS4dJFwn8Z6/walpMb27GFrIhpUtVQH3OhDRlvwl37H3YjwN0HRSkLHrlaDy2dKfplHOa3YNwwC9Va4jAR4W3oUMOpdkH1EGnCHCpuOMvBm6Lt3zap60LcxHHyWJuPw54I0Uot3nXpTG4T6CwWvX3XKmKsAFzXra5AmH0/cHJClPw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xeTI23j92zhBrfflwMHVNV8EeC1qaddqVB2x7iIg+E=;
 b=WCVoE1DHpN70jf9B96jOXpzKt3EOoBgkAe0JdKhR9cVc5NXS3eNt2y+moayv/ZejaWsUs6rLMU0pdyMm3QaxaXytpjlp5Q+gbbf7T2FfPCtpKdQZMD03m27DkS6ti8KeCB1958XPGtFscnAwqTgE8cIhTdGVN2+JObD5aqzEV0BOP3FoePV6/lN1eppWQ0+C1K3hhDY5oOS0R1tDoCStS+fLi7JAqYIa4fZZj49uu+BeYSSiJV8dzfsRosiRd5Ap6hYxx4Xh1AVbidEg846pTv2zN1SQJkHuNKfF8FCD3WxDE8CjsXPonUxMHlq2ivJegHtrfAz9HfQ1rbnKV1U7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 12:39:59 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 12:39:59 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Topic: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Index: AQHaraQkIbgiNoBS90KzjpdH8HAyj7Gt2oaAgABUMpA=
Date: Wed, 29 May 2024 12:39:59 +0000
Message-ID: <SJ1PR11MB6204A8233ECBFB718C875E8E81F22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
 <87bk4pkr2g.fsf@intel.com>
In-Reply-To: <87bk4pkr2g.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN2PR11MB4664:EE_
x-ms-office365-filtering-correlation-id: f5042da2-51be-463c-4cef-08dc7fdc73ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?82U3v+YrGsqLBz0N6skBxEy/HQejiGvNVW+sOXBv7DTjp6QYYz848iTxP9i3?=
 =?us-ascii?Q?f06TzSHTkzYL0MZECez4lqME8+4JU4FZHit4VuMDNQjba1azcFZ5yKRrhSKh?=
 =?us-ascii?Q?/m0Rg33g/i0Yv9QzmfXj90foVIDYH1j9e+VKFCjeecm0CIWQ96E6pEW/v0Na?=
 =?us-ascii?Q?W1bteE9nXlM1Hk4vKlwbfGNOF6mbz3D4T25TtM002AYu12aVhIbmpBXiH3VB?=
 =?us-ascii?Q?2hudXgFPkz1/gitG62FKGF93Nylv7ccLat29Q2FgtHqqSH46xtTR75ecURFh?=
 =?us-ascii?Q?aR2y6a3N9pNdeqHfFPQOpl+ughmfqGu3FPyVuf0pZv1T3/814+tBIIw+jFIX?=
 =?us-ascii?Q?+zi5B4+IUSoJw4AexpRPGsWeM2F/Uyyfl/9DeIRBFMMZAEFVXOXQabTVg1qA?=
 =?us-ascii?Q?4tDEY2nScuW5YDTvj1G9EWVH0p8OnGopsNcntsvfu0PStfyTqw1miwqkzxqk?=
 =?us-ascii?Q?qLlYNAxxVWxhbmNEOublVn0mCLq2Vbx+gVnLZG7SCVn62+faOBS6///aW24z?=
 =?us-ascii?Q?IpfMaiuwdRdnxdNDvUA3oWhRbUoy+8ptqi0Li5IJ4jm4jv+URSRTR0b8Dcp4?=
 =?us-ascii?Q?IYVlQVga+cDiHS9N2iZvM+B+m0iECSwSfcZ4IfgSLDwt1rbcPlXqtfnjbesc?=
 =?us-ascii?Q?scZoe0wM67j/LwsnUhbxWKIdx4EwlqZQ/VlOSX0Sj81yyoq3NwILzdT2iH4h?=
 =?us-ascii?Q?sQub/yFbwm7RYzlqCutrbjgnNd3kwWY7kjgHmqvLswWYr4TT6EihhPl174f3?=
 =?us-ascii?Q?UcQwJoN6kUlFkBfYyTfwCSoIK3M8OILnPS5XWxhRt0ogaIeg6lsMuooZ7EWk?=
 =?us-ascii?Q?5CH24XUR2WrppXFzbITYyE/eSQad0AkLgXwIFywGXhOPdVwIwuKhoRiD9GkZ?=
 =?us-ascii?Q?sdGtgr2ifPU5z4fqGIgCRki3ZCXDbzjHMIcNMh7kL9aHWO49+4/pJHieN63/?=
 =?us-ascii?Q?AjtEw1gRU3bf1cj1Jy/wsRIbcPEF4UtEfQQqJA65Zwnio2+6nw51wAx1kF4g?=
 =?us-ascii?Q?38GYU4G0JZqzQ3YU0YVIvOxgi5JWb8qColwvWd9dAhwyjAsOBGipMZ+msF7m?=
 =?us-ascii?Q?KGk/UlBLUkCTgnqhNznN00qSsWd6goFH/6YqbOR40nSPSuh8TvtKhsyLeSX3?=
 =?us-ascii?Q?H5ORZpNQ+7KXFQGRZGWgVWD4NWkwnNYGuE566KHR5ykgk4xFjs1q7ZTcoN4R?=
 =?us-ascii?Q?AKE9GrRByqsH8NM5qSv/mn/uv/X5qDFm3lnyuHJe9Mv9EFrvIk8ldyRZX8xU?=
 =?us-ascii?Q?IBY62sd9cX/wg8WKRUUO5+/Wrp7nB7ozXQGdQJEZifqXzdwKzj3S6rjWdEyD?=
 =?us-ascii?Q?Y+07CTNP5efTiS6rHBuWTd28uTLnglGNFR/VXgleUt0o9A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gJh8GoPAEhAu1UWU2GX/1ILDi1AhbUnl1zB7DOVoJkZJlCINH7/0HUpy7QV1?=
 =?us-ascii?Q?M836kIschAMXKD2DRhJqgI3y+zRHoE4D2B8qpB2SSm0/RNXRW7Fp7+sx0uBt?=
 =?us-ascii?Q?8TClAZqeAHNDfrDsMXuWTmXQBhBSK/fFk7XMKoUWl3Ji+tXdttChUJF91bFO?=
 =?us-ascii?Q?DXmJ8lp8ckH5qwRT/Ym0iKMFnoMnAK35xaTUJZa+KZTvCVxVny93hHdDgJ+q?=
 =?us-ascii?Q?JEwVuBrT841bdz8s+KbArCI3AMCtJkoo9BocaCE8Y08KU6xQFaPcI6xtQxDG?=
 =?us-ascii?Q?V3mHVb56ntLK7GkaAJKZiXANE8oDES/4NyS6Tq68D7r2pwFXL9nYn1yP71C3?=
 =?us-ascii?Q?qjcF1UlLnaTTrIIPdyrynEFprgGp/xJ7FlGDoTF/Ro1iYAepgKtQt/NHnT4+?=
 =?us-ascii?Q?FQcspO65pl7FKl3IUv1OGPet5CvTWMaBxjaPhsH8gZxeaW2/H3jgNHSIcbmc?=
 =?us-ascii?Q?faOgkWAjBAtr9bRg3fm39XlzlWnY84WnBJDO1oYmyPkbLIv3JtNlMJjX42Q1?=
 =?us-ascii?Q?OCh2xGfYOoj3irEsscJpntIwEGh2mQEd/5HMHrfx8UZjWuVipl8QyowQG7qN?=
 =?us-ascii?Q?9LHxnD6Z2XEp8w6N4HGQaXCm9EI+fvn3MGePgtJfOzPPFg5v9Ju8pnf70LpR?=
 =?us-ascii?Q?QC2KlPC7bGiaNpQDgNF0Ki9eJDbTbmfKJDFJdFR56TLiax0wadk4//E4CDoM?=
 =?us-ascii?Q?kzO1NZZ/ECTwFnOcke6cA0VZEC8Bl8Cz0qkni3XR1Ent76wWbvYnhu4bRkZi?=
 =?us-ascii?Q?K01JAQGN6b9yRoVblpp7vzhijXYlCpLS2xeU+XUhSp1mqe39GhkenKWlD6pn?=
 =?us-ascii?Q?xjQhlLCbiZTSizRvL2P1gRd+YVVpY5SXhyagMOgNR619uxRA+K5OW1UZfRSp?=
 =?us-ascii?Q?6x0hbKGdt84rvbI90tv8t2GIy6T971U5ajzqkKL08XHv4lNDI4nxLv/xOsWs?=
 =?us-ascii?Q?aYr4aFt7GBYVYbczPA0ZRtC5hbZmfyat2ZxrjBWnjUjyQk/41nB6yK9eAJlc?=
 =?us-ascii?Q?TbCLETVRRw8+sxxLiuerOxX/EDz3Az1DBCJP9EWt6JcHZjK4f582yz1bt9n3?=
 =?us-ascii?Q?hqikrrkzlZprf1zFxec/anDwBGm3jfKgo5SR+fl7/nlcUQIbYsBcwlgj3hXV?=
 =?us-ascii?Q?KScOi9XutriX+hwMmPBLcGA1373tTTULzrZo7EaOuHO1ypEiwj7I2xOqJobR?=
 =?us-ascii?Q?31FzS8aDEPs9fQBQiGjzq3ZNstfT4TcdB+awxsTZnthNu/T+t0SbqyAmlTpc?=
 =?us-ascii?Q?c71yCfpca5g6x9/o8K+nAP107IfpxseidjKMC/HeIu4xtqrsAckNEvbQPi9y?=
 =?us-ascii?Q?Kx6g2syHPHZoOKQqLdvkvHHjm4yfi/xBvlZ0xd4hwmD9Gwu44cQpbnnhRGzU?=
 =?us-ascii?Q?TlPWXzzGzfdDYs/yYKjwUuKkPqpEJ7KQDzyq2HbQ25clBg4qB/nEI/c5WKIf?=
 =?us-ascii?Q?97AeiXTZKlmMl4H9XVopIUcGBJbrdv3kTzUsfcoSX/tWreiX6kxDJixVwDuh?=
 =?us-ascii?Q?ioINSNk1VXLiygAXVqRiB3gvWvF0+U4Mf+ruPtGcQdHTZldERtetJZ+XH0rG?=
 =?us-ascii?Q?lbvHGK7bjpFkdm5CnO++o13Lnab7xSBwp6JAzTr1xS9cxUUH9SamnnbL7DsL?=
 =?us-ascii?Q?bP54s0XBNJvLWQmrS2n7TSuOH/619aELYPC2JgYTsW90?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5042da2-51be-463c-4cef-08dc7fdc73ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 12:39:59.0379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72YjGgUy60BATWMiD988pU5kr6tXgjN8Sh2cE504d5H/f8feUAKYo+v3UO98zEgSBAkoYucc58rxm6ag9NUhMxzRxLz6joZQxIC0qROdrJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Wednesday, May 29, 2024 1:06 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>=20
> On Fri, 24 May 2024, Tejas Upadhyay <tejas.upadhyay@intel.com> wrote:
> > Wa_15015404425 applies to xe2_lpm all steppings
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index 722fb6dbb72e..07c8a23bd7c2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -42,6 +42,7 @@
> >  #define STOLEN_RESERVED				XE_REG(0x1082c0)
> >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9,
> 7)
> >
> > +#define MEDIA_DUMMY_REG
> 	XE_REG(0x138000)
> >  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> >
> >  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > b/drivers/gpu/drm/xe/xe_mmio.c index ff7a7cf99530..e1dc87078387
> 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
> >  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);  }
> >
> > +static void mmio_flush_pending_writes(struct xe_gt *gt) {
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +
> > +	if (!(xe->info.platform =3D=3D XE_LUNARLAKE))
> > +		return;
> > +
> > +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) =3D=3D 20) {
> > +		int itr =3D 4;
> > +		/* 4 dummy writes */
> > +		while (itr--)
>=20
> If you need to do something N times, the paradigm loop is:
>=20
> 	for (i =3D 0; i < N; i++)
>=20
> and nobody has to pause to consider the loop condition.

Thanks for comment. However I don't understand whats adding pause here, for=
() is also adding similar pause and variable.

Thanks,
Tejas
>=20
> BR,
> Jani.
>=20
> > +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> > +	}
> > +}
> > +
> >  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)  {
> >  	struct xe_tile *tile =3D gt_to_tile(gt); @@ -479,6 +494,9 @@ u32
> > xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  	struct xe_tile *tile =3D gt_to_tile(gt);
> >  	u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
> >
> > +	/* Wa_15015404425 */
> > +	mmio_flush_pending_writes(gt);
> > +
> >  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +
> > addr);  }
>=20
> --
> Jani Nikula, Intel
