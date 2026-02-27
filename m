Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B0FEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291BF10EBD1;
	Fri, 27 Feb 2026 17:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQy3hZMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0069910EBD1
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772212395; x=1803748395;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M+QpN5IfltQ3Mgz8/E2Rrxq2PErFsgx6mCv7KWVkqbE=;
 b=hQy3hZMZ6xlYPDoR+ODII2xrwTkagYEjKnpZOtG/cSi5fwAs2dUO+v7J
 uDvLEsO5fNTwqISXJ0p29k6LxQc1CY1D9RTC9U73JPC81xktPTQ7maVr7
 xaN+Z80h/5Te8Jum+BlIijsEBknN4XPIFqlkfdWPFcpaI/HwJZotDlX9T
 s7pBzko02EmClzUeEbkzFrAS9xN3hy0bEI9eNWHKZuu/XuUjK76X9fzoA
 zBNkz92a4pt5X5CSDeLVuskcWriqyneqBKyqEZXf0HhQ1PWIx+imQmXy5
 93nEntbG7TsyPgQBaBs6Yp7t0PsUg2XhGxltbVaDo5lZ0bf4txZKHT2oW g==;
X-CSE-ConnectionGUID: MvcjEAxoQ+CzDRbpBf74JQ==
X-CSE-MsgGUID: f83V5Y9ZTuqoii6ctEH/wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="75901769"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="75901769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:13:14 -0800
X-CSE-ConnectionGUID: CAZ26QzsQVGhRs+826jfmw==
X-CSE-MsgGUID: gDa7YEGASkm7EFduh/yRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217062887"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:13:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:13:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:13:13 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tye2RQ+GpyaOvAE9BtX3Vhit5xi/LjcL5Xxq63dpCahWPgYTlcymSOm7SjFoTVa6jyJH7TtbjRmIRcBAbGpkAs23gmXASwtEMcx4YtmXHmqIONlLXdqWl7tpT1sASHIt+2jUOLXt2hLCVyBVqXjsxRztIa0jgdUcAKBPmdjF19VTivm8b4etvrCRP8BjBG0hcl+5o2YDqZQquNrUAc9K/6TL9mqFIMozzbsLTCKmIwcPP2EnT7AEDX5DDrWmAIicfrYfm7cMvWVFh+jysQFr1pWRcZ4d6Cs44cu5CJXXWkPzlJFNONtwW5BW0JdFF6YL3stqX56eHmLuxrFXHX1jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvCqBN4Uo5QAgaKvjwGKHT8OngfuiiiOI2oQMmTIMDQ=;
 b=f25vzq1+7Rys/UkRSR7UGobTVfXfWj8icb0qHiKe61J5uYF/pBQ+NTAM0pFAS/7LX2ZdpV11jwRqbzHy7JfI5E4KG2YiZGJh4eMJdf+2kbPWeGCyBlHxRRBPhpHYUc1Fs62qIouuVYYZFQbeBO2E05uA+RULrDHJ4MOGNiuEeMSPvNppF4BHA+UdcxAXCYlFH1p9ZazYpdgE7eDIF8spB5+75aJ9ODmeKkZEk1PfNGZ+hqNMt+gFwtPXNYfJrhjsUB+Ny/HYekjxvHG08TqUSKxJZh89ciHIOh3PwOU9cIDC8G82DI7lLAb2LpsjZnl3pvti37/GapNnWcA7jFj1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 17:13:11 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 17:13:11 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting
 on Xe3 and Xe3p
Thread-Topic: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting
 on Xe3 and Xe3p
Thread-Index: AQHcpemiEVhKIKxqFUuBZLa6zH7GWbWVlpBwgAEwKwCAAAGZAA==
Date: Fri, 27 Feb 2026 17:13:10 +0000
Message-ID: <DM4PR11MB545604E66FB3A5CB779FD6D4EA73A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260224235055.3038710-2-matthew.d.roper@intel.com>
 <DM4PR11MB545692395035743113E2FDACEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <20260227165112.GA4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260227165112.GA4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB7596:EE_
x-ms-office365-filtering-correlation-id: 87f59712-b213-459c-5512-08de76237c0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: PP4SHUejS6RhMktkhzTroYRpH/9XX5UJt7Q7/FXTFsh1J8arxok3Iiq0XpB2KYN4x3mKbbZNp7tnwpg2yyKjmtSA7yThAhokUa5hZa8rWVs7GXGHXHFnafvmZq6vY/a5BG34UdsegYO+X/yDz5cSZy7e3usOz92uvVuX6BsS5SixqEOHDIfD9P1T7uRqQPX7XpBiILIrLAIUHvJ3jOKWuhN7htczI9KKSuTE5pUxm+BN+BhZGxpQJk5ru2sr5LhDd5hgQefc9gwRinoywPoRKtpeb7JfzeEnI09zFlUYi5UjXttkyVSCkD7S+h1z5itrSSkjqfF6iQKDQsBS7bGIxdLL7UYpigm7Czq0+gpZKLG6nXFOEVdXEo9DNFEhElpmo4bZRj1TvzUkt4QiKns5PfqDy5zB8Y3LAY6ylHut26qJqOQh16Jk07LMixOTdLKLPCqEuEIBow2XLPCTz+lUv39kGadckSgDKdMepQUQN7d/cs1nPjcGgNuhNN/q3ci6v6Z4wQ1hx8RQNBKEhpjQ4hR6HgaxabqICEA91ICqu64VgnztDQDhhlSGKJTxtyivrn6ahqfWCCGYWpwIXuJkSpqeKO4UzA99yfKUdIXocndJC/CCKHjf/MpCiszxb8RTXRtOEoVPLdi0UTV4XiVqZ0blj5NIJsd1+5YViRjhWUbgpcdJ8T3Ud2TVPm1AN3azFJ5M+jQU3s730x2TT3goj0Tf5ZiyBG/BJI7TrxlLdyHSiZL4gOCr9uIfUj/zgUOlNI2pd/YDqLzThj+LJM8/3bO9zRCyIJISbVqYKcfYwVo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?omlSRQjmRpO96bIczuJsTLrg+5cpemKxx15063lOZVEOL6wPOHFLvaNvrLf9?=
 =?us-ascii?Q?qGyBDh9k//XBrX0GxYBDyh+ZH0XKRcu32hWaXsEg0GPQN7K7+ft9hGCxbQnl?=
 =?us-ascii?Q?NkdRroWUBbgINbB1DEAwesIg+8fepK57iIUUJAUwnk6Y/XDOItyO0CPCefYU?=
 =?us-ascii?Q?LbUbp04s+4RnFwEIigFBEnKUckKSBiO4mSqU3vRj5KAuKyjsqZhBWgTJSEAA?=
 =?us-ascii?Q?Kwdag0Gq3EFLyLtS5AUCt8f/h9Pa+pp8tmKeHrGGbU9Y+1pQmwBgS5+IvLrY?=
 =?us-ascii?Q?eCjSuXEoIyMoLEr6BlSj+eYLc1VkmKgsHLaHPOkxoOyqEVMVg7SIJoApw/Io?=
 =?us-ascii?Q?dKTiIDoTxzAxNX8NPcgumILa2dLOiJslgHzkjJmcqX6JggWP4riudxZIXGqL?=
 =?us-ascii?Q?MXObEskSabDsH4eUP1O7QdHeXhB09YivzC3CptE8pFiHuTvVfd04TJdv1vfw?=
 =?us-ascii?Q?9vgz7DWXJed5FfWdmNnn1gIsnoEjwHcXdOTG/t5rpUHy+2whizflXPb1z0rI?=
 =?us-ascii?Q?R37mggPBZWs5pp1UYf9jR3tMYggFCbULbFoTImM/dI/idU79E+fDPhSiuogj?=
 =?us-ascii?Q?iQVJrfyfKkXPk4CBwVaLKlWyRbqwGvjScNdiAw8KZvJjmthhe3lQe7ELldWI?=
 =?us-ascii?Q?MLjFHbYPTS7ZUOuEDasK2sg/F3bBomqQQWPnM7ve+vr5ad5liTkXYtYzsT31?=
 =?us-ascii?Q?e2QbTyUHJd83y28oJuugnTSC64FzKxeP0dpuCNOgUx5t9SxIkUTPDZ29b95e?=
 =?us-ascii?Q?rwMgVGc++vwpQ6XSHvNi74czRRidQQoDLV8Z+9dBWenTAFfnac+UN5Du2TyA?=
 =?us-ascii?Q?VUwOVLT8vv3DZpyFfjPBal6KgrEAcbYyTXjBMmat53IFR3afYQRFBaMWHZJS?=
 =?us-ascii?Q?bGALSIbTmbrILaQ3C/f6rFJnPNYZfSNfLG+ADYsjHzOIgXw9B/Dz6nOyDkPP?=
 =?us-ascii?Q?e7YfgVOYdIfyUMukrtuZEo301Rq6uZTy2Kx8yNUnwp7t0dckZKp06vnADSse?=
 =?us-ascii?Q?3DqqqzwC950n/xzrD/jdzTMyR1Q+qihq1Ll6V5t0D8hsJlJJGF0LO+r6SRIZ?=
 =?us-ascii?Q?57LB/dPWF3gbC6DPHMkIVj0YZ0fUqd2j8H6Ty/AAF1TDRzDT86OIvzdAkumG?=
 =?us-ascii?Q?QfXlKgO7m6vfIZpxM+qISLLRcfx9Mj/0Z+r5o6cHr9TexiZMS7/iBHQRNXNI?=
 =?us-ascii?Q?qNO99dNMxpaN2JFdFBhhxI75RdKJ00H2X2SLiYofwKXm5ZcWu/8Ehh5pCdgE?=
 =?us-ascii?Q?zh6THd/+fS/pr2LiSsdeEDjAg7gKXYrb0YB0qPjxHS+VhWTpGj8JTf8Shi27?=
 =?us-ascii?Q?EvDcgTZCRRM1/fgTLc7YLkKcUN0EYym2/kStsBgX//5r8EdT/dsIsyjwPxBz?=
 =?us-ascii?Q?/BVaBnyaTTMjEA+FRZt51lYytOE43aUgt/N4SZRli+fC5d9SiC5ifgqvs/0t?=
 =?us-ascii?Q?uBNJVMBVNHN6q1HIVthR1/P8QRiAo04eq50YC8mCeHcu6hOKGfVuPNOPr/P4?=
 =?us-ascii?Q?7fSGM7qe8OfWan9Uub/MpGVq8+Ums5ggkqi2IvhJ2nsuJrRDJNe/Bc4wFfSo?=
 =?us-ascii?Q?fUXQJKod+pbNffIrvsd6LGLz1foTpfqNZT0d/pjtPvXXHFvc6Skaac6lEKJ4?=
 =?us-ascii?Q?pCzQOWNrscrkNCVPHyieYgVdrtCZWVCu/TdPlkfdoZ4wJ7I9NO/QPJkVzUpp?=
 =?us-ascii?Q?wPiGCrDc35V158R13g339BWMFijEPUvNUWPhmYDJnJ2it36nxn78I3dEA5qz?=
 =?us-ascii?Q?6U/L8Uf1Pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f59712-b213-459c-5512-08de76237c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 17:13:10.9728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBjHLwceDh87Cz/VS5S4ofMdkRt4bORJ0DhV3kg+MT0BA3MKkwX6Z8oxmPnz9IQyuoN3xgNez3GRidPB9URY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

On Fri, Feb 27, 2026 8:51 AM Matt Roper wrote:
> On Thu, Feb 26, 2026 at 03:07:31PM -0800, Lin, Shuicheng wrote:
> > On Tue, Feb 24, 2026 3:51 PM Matt Roper wrote:
> > > A recent bspec tuning guide update asks us to program
> > > COMMON_SLICE_CHICKEN4[5] on Xe3 and Xe3p platforms.  Add this
> > > setting to our LRC tuning RTP table so that the setting will become
> > > part of each context's LRC.
> > >
> > > Bspec: 72161, 55902
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >
> > One small comment in below.
> > LGTM.
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > >  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 90b9017770ea..66ddad767ad4 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -176,6 +176,7 @@
> > >  #define COMMON_SLICE_CHICKEN4
> 	XE_REG(0x7300,
> > > XE_REG_OPTION_MASKED)
> > >  #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
> > >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > > +#define   HW_FILTERING				REG_BIT(5)
> > >
> > >  #define COMMON_SLICE_CHICKEN3
> > > 	XE_REG(0x7304, XE_REG_OPTION_MASKED)  #define
> > > XEHP_COMMON_SLICE_CHICKEN3
> > > 	XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED) diff --git
> > > a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > > index ea90e8c99754..f8de6a4bf189
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > > @@ -127,6 +127,11 @@ static const struct xe_rtp_entry_sr
> > > engine_tunings[] =3D {  };
> > >
> > >  static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
> > > +	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599),
> > > ENGINE_CLASS(RENDER)),
> > > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > > HW_FILTERING))
> > > +	},
> > > +
> >
> > Not an issue.
> > Should we put it at the end of this array to follow the platform versio=
n order,
> and add the "/* Xe3 */"?
>=20
> For workarounds we've started putting entries that span multiple IP famil=
ies at
> the top since they don't specifically match any of the per-IP sections fa=
rther
> down (and it gets ambiguous exactly how to sort entries that span version
> ranges).  So I figured it was best to use the same sorting here (since th=
is
> applies to both Xe3 and Xe3p) and leave the sections at the bottom of the
> table for settings that truly apply to just a single IP.

Agree. Thanks for the explanation.

Shuicheng

>=20
>=20
> Matt
>=20
> >
> > >  	/* DG2 */
> > >
> > >  	{ XE_RTP_NAME("Tuning: L3 cache"),
> > > --
> > > 2.53.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
