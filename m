Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F63C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA9A1123B9;
	Wed,  3 Apr 2024 03:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1/cc9tU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1F1123B9
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712116497; x=1743652497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H7Zz5EJjuNNES6PlxDD6I7/2V6MsRVWAguMauEVf3z8=;
 b=m1/cc9tUg60M4EUQcDJQrQTi589PngxsJhZytC9+N76EY6F93CU1FSx1
 miSEIW0lU4fi+z/GW6fKgOJJV/44pHAcktJADtptCUeKZBxsovFnRt/hN
 c+w8eVli/RoFlWVEHd1K/VsTERKDqoRiSFVdn2jqMLDW7ZvgMLCQCUL1P
 YYM8ncRHzNcXDtHGrFZMKH1hFOm1cIkwR6RsZQpI6AWs1Im8/NgYuMD0O
 JZMDO6PejMO0L/5JpSIfSUdPplJVeA4ef023pjCC2eZKw9wVB1sx8lebr
 SrVi8QJy0vr+YP0DxF73vpDlexTxkr6TS+U5GrgWerlh0gk8bbSwGBpZ0 w==;
X-CSE-ConnectionGUID: e1GkKmPsQCOOJUSJ+WqJcg==
X-CSE-MsgGUID: QgCNPDdcTsKI5zO+hsl4VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11146286"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="11146286"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:54:55 -0700
X-CSE-ConnectionGUID: eO1cTwyqTiiixISjgnMz7Q==
X-CSE-MsgGUID: cFI3PRJKQKi3rFrQQzu/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18259952"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:54:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:54:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:54:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:54:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLs8soy0bJNQE8YhloDY6rkHj2TaHUKCnW1sym9B6gESdXUocrClQUu/9ehaWD8Gs+UAnFExHSqRv8FDITZhyoCQZ/w3dELNJsCiR8MFO+y/gEBlm08V1VplIC7j/LHhDtMkix4+KBH+1b92h7AY0+gNFSwUawIwGfFquvi7XZuZiDx9mSRJKUqbKj0nj8X2QiPFKx+1sLV53pbjad3AQ0FVPFMJ2DQ+Eau14GwzTTg93W705sNWwd9CfUOqdCHIdJmubMuklfyeSag1MUQ2uwXBDOQF2cFH88t4ow/Bd9QP3/X6MCk7KrBm36VqbVcI25GEsPCKAA+KgItII7If9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOh3Aju8Ei12dzzOhbfHfXAQcbL3VrhtKV+uHuigE8Y=;
 b=ddN2rBKAe+/gNh0ntBqqM5bNwfA0q5tmcYyzy4BSxy/1oGDgCXSmfl1kmAxfOrJH6nWLcDKNLthZAOiyMkstGhwpMv2gWewTwCdiMHW45LDO3KUS0EZUEkeK+QfN0tI0R6ej+QtD/5hR2tvb0PVRqHvgrxp+LWiqLjIC7TEQGr9a3wkuGaZYtnfxVDXYT57rJZ5ML0eXi4uW5jlvXVgSJeJO3W7ElPMJjEmZgu+JzeoH2a8hf5CqOk08CoEjxifuIWwfJiyhAoKoRpVpExMaJAcfrrL9roNpE7zqYx1nQg6WLun+xuRO4GBEQmBkFBeM93MkDitJmmaTZyg6HZJj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 03:54:51 +0000
Received: from PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::251f:2a8:908d:2c4f]) by PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::251f:2a8:908d:2c4f%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:54:51 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Thread-Topic: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Thread-Index: AQHafAsZ6xz4OouI4kapClQsVF6p6bFV7wqAgAAKhAA=
Date: Wed, 3 Apr 2024 03:54:50 +0000
Message-ID: <PH7PR11MB7004585EB926742911DB627F923D2@PH7PR11MB7004.namprd11.prod.outlook.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-2-oak.zeng@intel.com>
 <ZgzHG+Qfqvb6ARlu@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgzHG+Qfqvb6ARlu@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7004:EE_|CH3PR11MB8773:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dbbCFT9+HR1ZymtAxQo3wgOuMXiWODdQ3Ws5IwVfjjn57138Rqu7kG3wjQmfovBt2vvx52v8UIAUq/MGEVwSfIQqetAnrODAkmZloTw/JquUSs8U8nAFVRVN7m3/tWXl68C8lS3EvTE0N6vyZUWspohiAAbWweX2bOnxeod6+FIuOGimKCB8dEo1i9ejwoyUKlf4SN3aEJSoBPicHHDXqTLQzBSNSIvCXq/ivfadJAH5awk7TOZg/f49SLS9j3jATRrSnrYnkgth96qs/GMNjUHehkHxGmTDfDVJllVDM3bzrsYoGSaf1E3yKRKaAYwS7fs03AwXGlLA/XqTutzkMXpIm0UUtlmwVuKemPY4BHsrLhbpVVSrcMY4YpXaDmHLs4hlyK5tEe7o7bVaiP0XcBYJye+mBTRbwot14qFXE2U9hRxcnFt/9xGvxk3LUl8U6QUOIDMCOk1t+IPOuZUOHJ/PIg6NW+YQ4nP5Rt4PfgnmpscH8Dmn265kFRXudssP4+ZtCGYaB7Poy3KYfD7BybG8xK5g1oQVjpXn8mZHq9/5CAnnMXClbobNJ83XaIeh07Q3IYHIJoN3n9hxtKERtc2mA0YM5xF99VPmws4X/BBAwbATPqhvtAvvpV90dfqjGkrda+/uptFilqbMQlxQUVaY0jB71yvM+YGnMUtqIT0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7004.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zMHsbvKNYLZsEsQhwSCXNxIB5tnTMZnCIHconaCuL6ntZ/rMwsECHEbcrl?=
 =?iso-8859-1?Q?QJXYuv3hhWKd+TDqyIBg4CupamuwR939/fxPuemXqKNWaAkJh4bt2tCvk9?=
 =?iso-8859-1?Q?HFigoPpMo2L0PuDn/qnZQAbVLvUkRW5Pivy9tpd1uT47EisOlsyKjyWynG?=
 =?iso-8859-1?Q?FUFKJQVU86I6cxSiQX1Q3H8f/YTAEAXSKaW5SMMt5h6PmSeQD7TxlbByDO?=
 =?iso-8859-1?Q?CBG1KgYzTdiugt6pjxcHTIEx+jw/FlJnQVm7L0CrmnUt0mAStm5Hrc/xbi?=
 =?iso-8859-1?Q?OdJlGbryKspCvbGsK9N7q6PEHBqh4BZMPMBo6OtKH7D32lpeUyRn6RLBlH?=
 =?iso-8859-1?Q?3YliMBKaQyLJIywtmLt9tL8fsrfzFHWYVBjKKI8CWCTonKUlPKkJzBiUcH?=
 =?iso-8859-1?Q?D6ODTyGzmxFPPThRtYcfEaayWfer+QkERL1Wz10lamSrKFqXxQbtZMK+qn?=
 =?iso-8859-1?Q?ATB2rnAgCsdF3ev/E9AjZ3mCF4LmFG3pPVEbvWqDh7DoG4WKPoE5OPDJRo?=
 =?iso-8859-1?Q?xWAA40peLJKSXe+ZErtDzoGbfqIMVuih83e5GfwxResk+HtRKbjHUYlz9J?=
 =?iso-8859-1?Q?t/ckEJJkBV49wSsCCILSlYIn6dPI5Xg+n1GOtF/N0GuFYlvnQiWfHKBGfS?=
 =?iso-8859-1?Q?fqHndljactZY2wG8rfE+AVMJCyIGdS4jGL7wcnFmWsERblca/LtExGxbLi?=
 =?iso-8859-1?Q?6BrBdbQHvgA3B5YKvPPFMzu6KrRT6uZGkGZV4m9ttv/6IpJF3BEWz54FdJ?=
 =?iso-8859-1?Q?IFXIVmDHz+31CTmsNLZBP5h79OdWkCsD97x/Caj05BZEQmODyNkd9s+5Bt?=
 =?iso-8859-1?Q?mia47DNddTSEbCXWKuRrSPduLVWyclLA+VBVDlslM529sbEbwE8tD9Io3W?=
 =?iso-8859-1?Q?F9DCB3TTxBsgUGJzKyiWi9Jj81+rrPh8OTrA+f1SiB/YQRM8CvS1HX9e+P?=
 =?iso-8859-1?Q?7bL5lTUHwPybaTHXp5ekxnOfFCP5cYCfPaw84RysKTXGS5PEO0g35bn1kb?=
 =?iso-8859-1?Q?3J28jJVgetD5QUWRJDPBQUJyBF/eq4I5rx2LeLfDf4J5ZlMGpye4cpgvsC?=
 =?iso-8859-1?Q?bm79GKX5z0JB5FLMAIPqS0+zgpKz4Sod1ZpQz/6WN9fUAkb5ElT4N4VJME?=
 =?iso-8859-1?Q?hsiaUoQQvMGh040Jk7E/cCFuOdlTKH+WXl2SixfZGtvu7lm828L/vg3hon?=
 =?iso-8859-1?Q?zRa0trimU5sFvc8DUubR7lRxRuHY1dd6AgXd+VvrsXWbfhVYRqefyUUmGK?=
 =?iso-8859-1?Q?G0vrFhjtZDG7a7mj2iXqEqFoOvH6yzGw6bObxSKIqaWNJwYoQgSC2UNloP?=
 =?iso-8859-1?Q?RmzMgAQ3qjy4rCSOnW0FbX4kMzhNLRBDIdXU5M4vq6yVu1zNTrYNHOUah2?=
 =?iso-8859-1?Q?oDV1xtujRqJr9gI1h+QxsV2ZcscItZ9sfwQKUr82CUWl7YFt+u3s4RmuWm?=
 =?iso-8859-1?Q?ghBJwWaUsr8YBT0Cg8TTbD8KOHZBdtlxk2WQkPCIwC5MIuRpJjnan7tp17?=
 =?iso-8859-1?Q?Z31KCQ6lhpSzl1OL2v3CHNgDuimcve7LHtafmCs6fPM31ZgCBnNPgF4qOm?=
 =?iso-8859-1?Q?C79SwWu/f28EKmznzf/buhXiQv6MJ+1M2NY++oBElg+ad+WbiFfWH/Umbz?=
 =?iso-8859-1?Q?sxR1SCAZ+ScEA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f323d3-ab03-4d8a-d906-08dc5391d04a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 03:54:50.9446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ld0oht7OX6i4JsJ93HweSsWAmHQmqzA6+9FRV4CSAvSndV16Dvhd29do7zKhE8iFDtuRAWBV5C41dryk4pZplg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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

Hi Matt,

For the comments to the static function, I prefer to keep it. It always hel=
pful to have a comments.

I agree most of the comments, except the mmap lock one. See inline

Also answered a question.

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, April 2, 2024 11:04 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimi=
ray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
>=20
> On Thu, Mar 21, 2024 at 11:55:18PM -0400, Oak Zeng wrote:
> > Introduce a helper function xe_userptr_populate_range to populate
> > a a userptr range. This functions calls hmm_range_fault to read
> > CPU page tables and populate all pfns/pages of this virtual address
> > range.
> >
> > If the populated page is system memory page, dma-mapping is performed
> > to get a dma-address which can be used later for GPU to access pages.
> >
> > If the populated page is device private page, we calculate the dpa (
> > device physical address) of the page. This will be handled in future
> > patches.
> >
> > The dma-address or dpa is then saved in userptr's sg table. This is
> > prepare work to replace the get_user_pages_fast code in userptr code
> > path.
> >
> > v1: Address review comments:
> >     separate a npage_in_range function (Matt)
> >     reparameterize function xe_userptr_populate_range function (Matt)
> >     move mmu_interval_read_begin() call into while loop (Thomas)
> >     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
> >     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
> >     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> > v2: Remove device private page support. Only support system
> >     pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas=
)
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig  |   1 +
> >  drivers/gpu/drm/xe/Makefile |   2 +
> >  drivers/gpu/drm/xe/xe_hmm.c | 224
> ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hmm.h |  17 +++
> >  4 files changed, 244 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> >
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 1a556d087e63..449a1ecbc92a 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -41,6 +41,7 @@ config DRM_XE
> >  	select MMU_NOTIFIER
> >  	select WANT_DEV_COREDUMP
> >  	select AUXILIARY_BUS
> > +	select HMM_MIRROR
> >  	help
> >  	  Experimental driver for Intel Xe series GPUs
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 3c3e67885559..a805a543056d 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -145,6 +145,8 @@ xe-y +=3D xe_bb.o \
> >  	xe_wa.o \
> >  	xe_wopcm.o
> >
> > +xe-$(CONFIG_HMM_MIRROR) +=3D xe_hmm.o
> > +
> >  # graphics hardware monitoring (HWMON) support
> >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> >
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> > new file mode 100644
> > index 000000000000..4011207630a5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > @@ -0,0 +1,224 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/memremap.h>
> > +#include <linux/swap.h>
> > +#include <linux/hmm.h>
> > +#include <linux/mm.h>
> > +#include "xe_hmm.h"
> > +#include "xe_vm.h"
> > +#include "xe_bo.h"
> > +
> > +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> > +{
> > +	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
>=20
> Nit: start and end should always be page aligned.
>=20
> > +}
> > +
> > +/**
> > + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> > + * have such information for memory eviction or write back to
> > + * hard disk
> > + *
> > + * @range: the range to mark
> > + * @write: if write to this range, we mark pages in this range
> > + * as dirty
> > + */
>=20
> Doesn't hurt but kernel doc is not required for static functions.
>=20
> > +static void xe_mark_range_accessed(struct hmm_range *range, bool write=
)
> > +{
> > +	struct page *page;
> > +	u64 i, npages;
> > +
> > +	npages =3D xe_npages_in_range(range->start, range->end);
> > +	for (i =3D 0; i < npages; i++) {
> > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (write)
> > +			set_page_dirty_lock(page);
> > +
> > +		mark_page_accessed(page);
> > +	}
> > +}
> > +
> > +/**
> > + * xe_build_sg() - build a scatter gather table for all the physical p=
ages/pfn
> > + * in a hmm_range. dma-map pages if necessary. dma-address is save in =
sg
> table
> > + * and will be used to program GPU page table later.
> > + *
> > + * @xe: the xe device who will access the dma-address in sg table
> > + * @range: the hmm range that we build the sg table from. range-
> >hmm_pfns[]
> > + * has the pfn numbers of pages that back up this hmm address range.
> > + * @st: pointer to the sg table.
> > + * @write: whether we write to this range. This decides dma map direct=
ion
> > + * for system pages. If write we map it bi-diretional; otherwise
> > + * DMA_TO_DEVICE
> > + *
> > + * All the contiguous pfns will be collapsed into one entry in
> > + * the scatter gather table. This is for the purpose of efficiently
> > + * programming GPU page table.
> > + *
> > + * The dma_address in the sg table will later be used by GPU to
> > + * access memory. So if the memory is system memory, we need to
> > + * do a dma-mapping so it can be accessed by GPU/DMA.
> > + *
> > + * FIXME: This function currently only support pages in system
> > + * memory. If the memory is GPU local memory (of the GPU who
> > + * is going to access memory), we need gpu dpa (device physical
> > + * address), and there is no need of dma-mapping. This is TBD.
> > + *
> > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > + * memory. Add this when you support p2p
> > + *
> > + * This function allocates the storage of the sg table. It is
> > + * caller's responsibility to free it calling sg_free_table.
> > + *
> > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > + */
>=20
> Kinda verbose given a static function but guess that is ok.
>=20
> > +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> > +			     struct sg_table *st, bool write)
>=20
> Weird indentation, use look at checkpatch.
>=20
> > +{
> > +	struct device *dev =3D xe->drm.dev;
> > +	struct page **pages;
> > +	u64 i, npages;
> > +	int ret;
> > +
> > +	npages =3D xe_npages_in_range(range->start, range->end);
> > +	pages =3D kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> > +	if (!pages)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < npages; i++) {
> > +		pages[i] =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		xe_assert(xe, !is_device_private_page(pages[i]));
> > +	}
> > +
> > +	ret =3D sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> > +			npages << PAGE_SHIFT, xe_sg_segment_size(dev),
> GFP_KERNEL);
>=20
> Weird indentation here too.
>=20
>=20
>=20
> > +	if (ret)
> > +		goto free_pages;
> > +
> > +	ret =3D dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL :
> DMA_TO_DEVICE,
> > +			DMA_ATTR_SKIP_CPU_SYNC |
> DMA_ATTR_NO_KERNEL_MAPPING);
> > +
> > +free_pages:
>=20
> The SG table isn't free'd if dma_map_sgtable fails.
>=20
> > +	kvfree(pages);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_userptr_populate_range() - Populate physical pages of a virtual
> > + * address range
> > + *
> > + * @uvma: userptr vma which has information of the range to populate.
> > + *
> > + * This function populate the physical pages of a virtual
> > + * address range. The populated physical pages is saved in
> > + * userptr's sg table. It is similar to get_user_pages but call
> > + * hmm_range_fault.
> > + *
> > + * This function also read mmu notifier sequence # (
> > + * mmu_interval_read_begin), for the purpose of later
> > + * comparison (through mmu_interval_read_retry).
> > + *
> > + * This must be called with mmap read or write lock held.
> > + *
> > + * This function allocates the storage of the userptr sg table.
> > + * It is caller's responsibility to free it calling sg_free_table.
> > + *
> > + * returns: 0 for succuss; negative error no on failure
> > + */
> > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
>=20
> See my comments about arguments in previous rev. Still would raather
> have this layer accept arguments from xe_userptr_vma rather than that
> struct but can live with xe_userptr_vma as an argument I suppose.
>=20
> But s/xe_userptr_populate_range/xe_hmm_userptr_populate_range/ given
> that this is file xe_hmm.c - exported functions should try to have the
> 'xe_hmm' prefix.
>=20
> > +{
> > +	unsigned long timeout =3D
> > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long *pfns, flags =3D HMM_PFN_REQ_FAULT;
> > +	struct xe_userptr *userptr;
> > +	struct xe_vma *vma =3D &uvma->vma;
> > +	u64 start =3D xe_vma_userptr(vma);
> > +	u64 end =3D start + xe_vma_size(vma);
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +	struct hmm_range hmm_range;
> > +	bool write =3D !xe_vma_read_only(vma);
> > +	bool in_kthread =3D !current->mm;
> > +	unsigned long notifier_seq;
> > +	u64 npages;
> > +	int ret;
> > +
> > +	userptr =3D &uvma->userptr;
> > +	mmap_assert_locked(userptr->notifier.mm);
>=20
> See my comments about locking in an eariler rev, while it may be true
> the system allocator code has to call this function with mmap locked it
> certainly non-system allocator code does not.

In the original non-system allocator codes, the mmap lock is just embedded =
in the get_user_page function. So they do have mmap lock.

Or do you see a problem to ask caller to hold mmap lock? This scheme is sug=
gested by hmm design document. It works for both userptr and hmmptr. I don'=
t see an obvious problem.

Oak



 I'd rather move the mmap
> lock around the hmm_range_fault call for now. If the system allocator
> needs to hold mmap, probably add locked argument (or *_locked) function
> with the proper lockdep asserts / do not take mmap lock around
> hmm_range_fault.
>=20
> > +
> > +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > +		return 0;
> > +
> > +	notifier_seq =3D mmu_interval_read_begin(&userptr->notifier);
> > +	if (notifier_seq =3D=3D userptr->notifier_seq)
> > +		return 0;
> > +
> > +	npages =3D xe_npages_in_range(start, end);
> > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (unlikely(!pfns))
> > +		return -ENOMEM;
> > +
> > +	if (write)
> > +		flags |=3D HMM_PFN_REQ_WRITE;
> > +
> > +	if (in_kthread) {
> > +		if (!mmget_not_zero(userptr->notifier.mm)) {
> > +			ret =3D -EFAULT;
> > +			goto free_pfns;
> > +		}
> > +		kthread_use_mm(userptr->notifier.mm);
>=20
> I think this can actually be dropped as hmm_range_fault takes the
> notifier (and the MM) as an argument. Do you want to test this out?
>=20
> If we can drop kthread_use_mm, we blindly (no kthread test) probably
> just call mmget_not_zero.
>=20
> > +	}
> > +
> > +	memset64((u64 *)pfns, (u64)flags, npages);
>=20
> See my comment in an ealier rev about using default flags. Still valid.
>=20
> > +	hmm_range.hmm_pfns =3D pfns;
> > +	hmm_range.notifier =3D &userptr->notifier;
> > +	hmm_range.start =3D start;
> > +	hmm_range.end =3D end;
> > +	hmm_range.pfn_flags_mask =3D HMM_PFN_REQ_FAULT |
> HMM_PFN_REQ_WRITE;
> > +	/**
> > +	 * FIXME:
> > +	 * Set the dev_private_owner can prevent hmm_range_fault to fault
> > +	 * in the device private pages owned by caller. See function
> > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to th=
e
> > +	 * device owner of the best migration destination. e.g., device0/vm0
> > +	 * has a page fault, but we have determined the best placement of
> > +	 * the fault address should be on device1, we should set below to
> > +	 * device1 instead of device0.
> > +	 */
>=20
> I'd drop this FIXME, I prefer not to predict the future in comments.
>=20
> > +	hmm_range.dev_private_owner =3D vm->xe;
> > +
>=20
> Longterm, probably a helper to derive private owner. Likely just
> something like:
>=20
> xe_dev_private_owner(xe)
> 	return xe
>=20
> But it help avoid bugs setting the private owner to the wrong value in
> various places.
>=20
> > +	while (true) {
> > +		hmm_range.notifier_seq =3D mmu_interval_read_begin(&userptr-
> >notifier);
>=20
> We set hmm_range.notifier_seq above... maybe set this after if (ret =3D=
=3D-EBUSY)
>=20
> Again see my comment about locking.
>=20
> > +		ret =3D hmm_range_fault(&hmm_range);
> > +		if (time_after(jiffies, timeout))
> > +			break;
>=20
> Maybe also move this under the if (ret =3D=3D-EBUSY) logic too.
>=20
> > +
> > +		if (ret =3D=3D -EBUSY)
> > +			continue;
> > +		break;
> > +	}
> > +
> > +	if (in_kthread) {
> > +		kthread_unuse_mm(userptr->notifier.mm);
> > +		mmput(userptr->notifier.mm);
>=20
> See comment above about kthread_unuse_mm.
>=20
> > +	}
> > +
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	ret =3D xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	xe_mark_range_accessed(&hmm_range, write);
> > +	userptr->sg =3D &userptr->sgt;
> > +	userptr->notifier_seq =3D hmm_range.notifier_seq;
> > +
> > +free_pfns:
> > +	kvfree(pfns);
> > +	return ret;
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> > new file mode 100644
> > index 000000000000..91686a751711
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_userptr_vma;
> > +
> > +#if IS_ENABLED(CONFIG_HMM_MIRROR)
>=20
> Do we need this? Don't we just require CONFIG_HMM_MIRROR to build our
> driver?

Yes we need this. Our driver/userptr should build even if HMM_MIRROR is dis=
abled. I had a build error without this.

Oak


>=20
> Matt
>=20
> > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> > +#else
> > +static inline int xe_userptr_populate_range(struct xe_userptr_vma *uvm=
a)
> > +{
> > +	return -ENODEV;
> > +}
> > +#endif
> > --
> > 2.26.3
> >
