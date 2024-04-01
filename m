Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3A2CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 16:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62D210F2A4;
	Mon,  1 Apr 2024 16:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnBNizdy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7154E10F2A4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711988152; x=1743524152;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VrrY67o9z0/Q6Ikrfve807AUpdrG70ybxfhixxlcrgM=;
 b=BnBNizdyiGoUbXoU6p+5kdH2EEosXJA3WWHwB8Vl9cIWGVyDQ0xEfHyw
 h9MPncx2s+mID4azOk14vPaSSP8c3K4YG4FB/qU2fwpbv7Lr+SXpyob2p
 GN+yt3fi9hdJWg0FM/rnTMTtIKwcocwI0IRsChFHVxc3vbZU//9X9Yr6D
 3H3bEhGEiCnP3lKo5+TYGOLkDIy99CT7rW3QicojoYN3ziNWWmgkOKcoB
 6NGrvV9vp7zGpI++Pd7OfuGvq460cDXkJlJQo4zIw+5zz59F/JLY7koST
 vKgGX9ObbOQqvVk5Q/2nE8VHYpRFgWvAjpJednHWiMUkTV47acwOLVlzH Q==;
X-CSE-ConnectionGUID: EzWDnB9tQWmBjTU/MkyW3g==
X-CSE-MsgGUID: HIrgO/GdQfKFJcuQCTsZ7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7237397"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7237397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17841817"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 09:15:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 09:15:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 09:15:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 09:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9TACMW84p+Ua5iL5ZLGX73SavOOuv6117A8XQyhy2//CitJaLl3rXpIlOWmUnSXYu5zNzcDFN22M8j/LE/G8KWWYwlieFm9YVRcyOLSLWIyXI7SMvzRln3Yd/3bvbAfRraCMfrs9ZVH5ncnPUyOYox2lSHUhRv+4mCIEPHMBfa7347DCMUtc1sgIw/DJl9G5nJ5zN0C+MALQXzo1uBLLrFmUj4CESt4J4DS2k8tOLBubBY3ngEor3DYSiAHYwluuLOipZ4NJ1hLvgzRa3E8WZygQU+NMbgW37sCJoiA0JWVNYk1gQQXUkQEPwqpoxvnupP8mErTBbT/UTPkxP4gGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00KBfAFCHoSIZopFZ1Gfa7MQ3gaWd7mdvxzLwP+Liag=;
 b=To3iiNEXs0UlKe1+mqZVwBW8gR1/OpIUkOW6rN/fN37ReoQvOcY5q0ipUepAhY3nOTuqU4PP54Vadc1AU+cXrADLqaWbPLf8KwGWVuTnIsb9TP2ubcBcMSFkfLGBpXDuVfy+m5Bh3wxYoxHHuk/3c5HDmY/lfQms/MKzLRBPeRWGIkaKAknq1O/6B/kni5XfZPdlDL1DtOgnrbkEUj2pQhJ/14LeMZCG+rrOS9fQt7cCumY+b3pmzsttrPGOKNWCJ+vZ1//DzBoMZgw7MtFrylHTxNp4snlib6fxap1hKY6nVieLr5YuZD67BJsBTOyXSqgydFrZ/vRVrSI3uGuGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Mon, 1 Apr
 2024 16:15:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 16:15:33 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe2: Add workaround 18033852989
Thread-Topic: [PATCH v2] drm/xe/xe2: Add workaround 18033852989
Thread-Index: AQHahE5/18rrDta9OUW388D1d87O7bFTlfGAgAAA0xA=
Date: Mon, 1 Apr 2024 16:15:33 +0000
Message-ID: <MW4PR11MB70569FE946B41EC87369D9F8B33F2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20240401161907.3820563-1-himal.prasad.ghimiray@intel.com>
 <20240401161139.GB6574@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240401161139.GB6574@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH7PR11MB8012:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12xG/1j1lf5KEFzDPzqqbGmfUdmXiqpxrYf9qqM0/OZbgmQ+Pz5VCA1NoN31wQGYjzvE7vZiwJewI36fdj4gaQe0bIQfrzGjs4Xx76dASUpAItDh/BZ58DyQ5lP/cw3qYgQtZAxwuRZgSbK0+3QQKqN/t6yMyGtxToqNaYD5inoQePcdl5rHhWsDkXEc6qX8Gl/mjnRLXTeGzAnQ2ly65/YokvMGduLV+sXM8syf8UdNLzxGSWXDfwOH3JKeiSZ7+9UIJ41yxsL0XBpitkC8GTemxZSoz+upfeByV6NiEQjLNBuRELZKtJcxSEQVQ68/oJLLGeupm8aeWU+6MQO7FQIlyxjrL7KS/XVM6IEtJjDAxepgpvDcWYJ9sVMVOjoSd/BZ9Uw2yOsOclZrwgIFTwdS/et0IomT5h1RCHY8Ps5CWWWnweZZcZzmGOGVH0zjsmVBAAYRTCSXAVc93t/tGYFHNxCBYWiiIN+D38D7sYJ8ZGmZBjOYQUgWkq32EErxhH0dp3T4vUT4G/seewx7vJrF/HPBk3WbcdT0fwVVDEmaJuhuqbwuLiluiR8uGM35EBh2/NJTQU+BWjr92Bfe8bM13N7qUImexcAyN+jdRTGnM2nuhMGhI+S5oe2VD9bS9bMtNDzEZXjMygrK5Lp8M3QvSUoOAXTqZsbffkGvdYI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wwLTIlEi26E+dvGM2UtOKQIRqEPj9T71yLi58L5YF0n0XxVXpN2WLXMezsf8?=
 =?us-ascii?Q?p2DWjC9BRCSBcDwdWTIYDObmVM2JnpZa2uxQAJ6JaqSoNBuAfHqvlWeO9zaK?=
 =?us-ascii?Q?WzSo7MP6n3iJhNuFMgqbZMUkPRvZVFIgbH1edBhjAfXcr+C89GNEmT7Db649?=
 =?us-ascii?Q?JxaAslJJnCPrto2+Bwe6Ai02AeVW+YA51EuOaC7Os0X8WWd1PKi9TAhzf2Mb?=
 =?us-ascii?Q?89Ib+GuOlBqdVbD5vGzK6+ruWwIw3FqM77EHJJGgkA+aJqQrSup5UeKddJUo?=
 =?us-ascii?Q?3crx9Arou3ddVIkRuA+MiqODdRLvy9MVHDIEVMfIrnjR51mQeeaJkmMaWF6V?=
 =?us-ascii?Q?Vxbg6NFCDEnMPwezpRuPTIJeiN7x1WlYe6CuPWECdbXFEKNshqnQQlFtkWUH?=
 =?us-ascii?Q?PobVmP43lpuLP4/T4TnFflXoe1PUgSOQKE85pDzRAud31NA+eW+/IGqp6xaP?=
 =?us-ascii?Q?p/ssm452w8KhDJbwfucSMBAJ+Mn4C+49I6Vx5Mjmwrl+huB2q+vGrwdCqgie?=
 =?us-ascii?Q?Cyue4BsdmoEm5AZnzPOEGbnIYTw+lAquWrLFwIeorJBLYbKgwhYD7u2k2Oml?=
 =?us-ascii?Q?qdg0JHpEqTeFna8WY+P8H8p/tvgKNLiCpuL0DubzwzBBnztmDgD++gqatUtF?=
 =?us-ascii?Q?U6EUn0tvc94i6uS6QbGdzYhQg4Dow7uDiBp1J1aLmD3G51Q7UvFxlbW8Ou2d?=
 =?us-ascii?Q?fN0UAw92AqubywiuU7MBj9p2SpBcS+oDYjU+JvbfiPkA1U0i/YqveEBCJNWs?=
 =?us-ascii?Q?RfKG711CRQpUsIWgBDmX0d7StpKaR8J6m9EIlww9Np6cOXv5pXnESVULoMug?=
 =?us-ascii?Q?LXTdUzqvrjMblAeW3SR4dRM9Q1cjypxpdLMdB3IzWbuM8jCao7Dk7Yf9zoft?=
 =?us-ascii?Q?im3Zk79tpwoI2nUpCeAZAb59cNULz+FdWg7WL/eGLpOwfR6s08xHtqDqaCeX?=
 =?us-ascii?Q?pDGWW4Ner6R2RqLDLo4eC0DzxhcNKLyihd69U0VznAQy3meSayWit6adBEvh?=
 =?us-ascii?Q?XNokxig+sf+9BStGKmyktE73UnV6AyovJ6105UFEN+QhBhlZKCDiVo1tFsSA?=
 =?us-ascii?Q?sFLaRBM4QjwdEj8Jywx198qoTGObGhU3YlAknup/HB2G6LwS3l8vFFtJwvWH?=
 =?us-ascii?Q?C4ji+kQOb/GnsnOipxtrFDw1q8yJX9Er9rJRAv66vvH+74tMU3+PBB0D3j7+?=
 =?us-ascii?Q?dryfYmVQaCmUiYhhNkIxWHa+RY0HZfR3z7BGuyeyLX8Kb4Ivq4vfw4P6HB5Z?=
 =?us-ascii?Q?R9/0MXqBMcHD+4Ac04Zaicc1MtFpFpwuU2Xwv+gbzHqQCIdoOAZLHTPAmO03?=
 =?us-ascii?Q?MD96CueXDvLW4wfqkEco4M9A/aLKUugJ60+/gWzwG6aFbfHSGEEzY39Hn7JX?=
 =?us-ascii?Q?Ea2sm0f9GM6mQqW62JvirRtUCyILEuES+mzYnyaix+UyCENBRJ8LXZBw7dC2?=
 =?us-ascii?Q?6OV3uhlZw8VqeAUDifituH2K/dx5wqcI4OR3JcrZoevxWk00CqTxTSqN/vBT?=
 =?us-ascii?Q?vQNruUBedzaFH+2PukZrWBABpmRazshgdL7e5U8A6R2kQWrBRW7rhGiz39fK?=
 =?us-ascii?Q?j6r2nfE1jAT60Q4v/Vrw/E5vXDfWEimaoBJnNkU97QgzlQRdaSm1MAIp3RFh?=
 =?us-ascii?Q?2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14be0e39-72f5-407d-2799-08dc5266f55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2024 16:15:33.6196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7z3qF0Aa5OVNwo5nv16xi9FWeXwwrXNMSZ487HFhTFHoNSnpzvdtntuqRMipHhC80n3EgElY++cONCmGpinjwq/9Lq3lrk3N3NxNP4Hhf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 01 April 2024 21:42
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 18033852989
>=20
> On Mon, Apr 01, 2024 at 09:49:07PM +0530, Himal Prasad Ghimiray wrote:
> > This workaround applies to RCS engine's context, hence added as LRC
> > workaround.
> >
> > v2
>=20
> I didn't notice that there was a v2 when I sent my feedback on v1, but ju=
st to
> note it here, COMMON_SLICE_CHICKEN1 is a masked register and our definiti=
on
> below seems to be missing the XE_REG_OPTION_MASKED flag.
>=20
> In the past that didn't matter since the register definition was only use=
d to
> whitelist this register for userspace access, but now that we're actually=
 changing
> the register contents we'll need to add the flag, otherwise the bit updat=
es won't
> take effect.
Thanks Matt. Missed this detail from BSPEC. Will modify and resend patch.
>=20
>=20
> Matt
>=20
> > - Fix commit description as lrc workaround instead of engine.(Lucas)
> >
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index d5b21f03beaa..9728d9da9931 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -98,6 +98,7 @@
> >  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> >
> >  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> > +#define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
> >
> >  #define HIZ_CHICKEN					XE_REG(0x7018,
> XE_REG_OPTION_MASKED)
> >  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE
> 	REG_BIT(14)
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 74b33a3845f2..c904e55ced9c 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -579,6 +579,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE),
> ENABLE_SEMAPHORE_POLL_BIT))
> >  	},
> > +	{ XE_RTP_NAME("18033852989"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1,
> DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
> > +	},
> >
> >  	{}
> >  };
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
