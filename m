Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8772CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 08:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEC510E956;
	Fri,  5 Apr 2024 08:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJrGax9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593F510E975
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712307348; x=1743843348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kya3jXbL7IxpWWrpRS0/o/+MluC9VMFCU64ypTOmi18=;
 b=kJrGax9WQ2qV/BhX5XoRWWxebda6bqaIST6S8Rzr+7cc9BNkbasifWfE
 DhyGWQg3KAofB6O3fv1huSwUMP+tAr7XWGZ7IYH3+qF1lRNvIznKqAHim
 BqcOQnz8ZWA3I4xbwASv89IBhWE0SsG0HWgOL6HnMrYDs2UTOVS8IkUVm
 70s1/DbyrgGIy20l8KmKpI3GCciSmV/rsbOSaPdrYpP5L+viL25taO+xI
 TSGeRchWShUW7L72ukXYgDMehYv5P6lvbN18AEESJ6ifgYiy0RoTV1v/6
 Tl2tHcBZUIXuX1tl+1Te7mmUFGyhoti54Xs4kkjCtqvda2PBpUy8BhcgM Q==;
X-CSE-ConnectionGUID: aXi5Pm0PS5SpJRQef1irNQ==
X-CSE-MsgGUID: OuVAJsEmR3G+cN+mDU6tJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7473948"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7473948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:55:47 -0700
X-CSE-ConnectionGUID: APn2e1yxTC25Oq43fohzNg==
X-CSE-MsgGUID: 77UsAobQR0KML+HBIdpj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19099027"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 01:55:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:55:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:55:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 01:55:46 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 01:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgQ4AttrCrPryinSB96Q+PNEK9wgs2H923zPW1lxtr09FMegvs82YsUIJr9fxytxFwjtPELlm0etybCtS2p/qc1AiA1MoGHwUQ6QRQIfDI7fnLxgbqFkf0RuaxLfA/e7z1yYa4Taeuh5DiRAWH2zKeuNYKQuXPm3T/jBFC5AOhsw6mCDFcRzO3e1E8RW0wLzEAnoiWtYU4zrD0mFRQY7+7IsC1wyjUZvSQR5h6xbT6SBf8xpTiqccL1J4Nsu3P6kPV2HrYbQodFno1YhMtQflWZblkmx33yefgDV0KEBbdW5PjKN8p+xGSBVeflnp8/N4igvQm0ZDSDZVOCUASXD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFI3fhgAo5q1O4QM+LRfTBhDFpS9wbgrYAt7FoXzN58=;
 b=FtYBuaFwgvR3M3owrlLywYv+Sxy44NDHlnXCyOfE0k2bz0v1z7a80+bQ/uuSYpbC/2QK+H2wm4pOL6AYEzk5B9UrjF+6qqa7v3J3Ky7mHREJrkEPPMuLRrrSP/N6tnZg4B1KtkuthDuV3oqDO21cIrS8N+KTj41iwGml8pc0jasm+7u6ZOXqUO02avXk5osRi4jA7uveJ8yf2GCgPPF7E5kSV/qHSq8d0cRkf/AmB+ZlBySsNogT/qhI8vSMjRrnmcD9ERUEFpHvxP/3yIBHA4xQo6+Gl9IUPlWYajkAsz8c9Vi99gxFj/fKbcxvOXodriWcyt78mxChqMm5PIz/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB8589.namprd11.prod.outlook.com (2603:10b6:610:1ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 08:55:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 08:55:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
Thread-Topic: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
Thread-Index: AQHahnGsAIAkZwG3dUGSCBHW5pwClLFYPeeAgAEf9EA=
Date: Fri, 5 Apr 2024 08:55:43 +0000
Message-ID: <SJ1PR11MB6204F5A4DCD9D6CFE87F42B181032@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240404093529.734251-1-tejas.upadhyay@intel.com>
 <20240404153309.GB958162@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240404153309.GB958162@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB8589:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tC92lnXkS8Xe7yewq1UB2GG+CR4xCN8rLpRmA61+iFGhaGl/NLu5HYtWc3jmtHRc8pLbUDC9x/+dSkWhHr+hKntt9KFCGi/l4eqNJJc08FZ0NDXuM7f7IXBU3DL0TxroGoiti0ycWTMq726akMbReufYDjyZp/0WaOkW4T+zkqwraC0pugKZCqV4cup7/544k6SGPPoTsqMrGTADtxWyLh4/yep4G1nSyyUeog8H+5zf6YujcCmcIPU6yj3YCR09ogMNlVhNe0s3CrPAg7fePUreP5muEkcsBniWVq3LAsc0y6CE8Tti6IEqj6kRycGunEoHVeH41Dt6+UUZ56SuKfECsxMGk2ND6i7gfJ6dNlCyOUXMTv5+7ETc+igUH/4a7PIE+bP6jh4W2YXpXluztl/z47DMDAOYzP2rq098BEEHZet9MKgikaDlwhsywxTH5PsEtZhLkZ4Aj8UeH93/vkAhe4lrL42bRgtVIXC1j7/7EzFSWkBY4sR2fLVaLWOrT4OTcL/EzR7g19yl9HqlEdiqZQe5NBCdworCxF6yNOONRI7lGgCZGMWw81J6FqDv6wD4vtq/k7/L+5gwQ8qLBqnhVIcTjnvOOBJ3ezp9DWTSnXMHOloVXVYJJ4HypE29O3Yt+7ceC0LCqKp9DW83o68WLsrehwT1UfgUd7+FQks=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5hBoM/wTPUS0YM3WGXbpZSS1wCMJwPhKSdiDIA3BF7ZZtgMtb4Ig/I8f0O3O?=
 =?us-ascii?Q?7GJFyJDN84hPm1ZM03zTRbvt/iNHJ3xyBudH+8Peo7vMCX2rT3ejNmeAFAyO?=
 =?us-ascii?Q?RaRM7wYaUTOAmbhLL5gMdTM3hGH4v9DTOHmQ53ny2B2T2/XJa1zAEPOyoCRf?=
 =?us-ascii?Q?KvmHqgQfZTSCmqwwk4DlqHC3B3mf7SK7gxyipUB+hjIrMjnZwqVPACWsVNJp?=
 =?us-ascii?Q?2f+dL9w41Tf6HZPKmJKf2Df6EPlXkGOG1CVyfr0oPHUEjEsXnt3HksUwRFnK?=
 =?us-ascii?Q?VEjpDBYQFfkVako88hBPEUJ41alO83z2Tpzg4asxv1OsIgf9enO9r2N/SF5H?=
 =?us-ascii?Q?HWtylo7B1ZS2kY3B7Wb1iCNkF/N41XgzcEUtBPT10YI4aKt5YgozNNZqp00U?=
 =?us-ascii?Q?kFKmGlU7GMyQm5Gj54l2EKwPmhLDEEQGnqN19NEW8w4ztWoqi5WQL6tv16/m?=
 =?us-ascii?Q?I7nA8ugrXehP+VGNWAY7R8BZw6L8JGZwybIhAuEHpOIa67Acn3UmSPue5QDd?=
 =?us-ascii?Q?/lC8Wjl4WnavaiE8HEPCFgJYNEit328N5LD7DHt75DHNLQELtZuCzESkFYLe?=
 =?us-ascii?Q?Voi55yu1tuYJaCHOTQpP9NWMOVyTOKSyOZLnjDxZvOIc21SR5fi9XjjPNXv8?=
 =?us-ascii?Q?7nnjivVmVJIK5mo5b34AHavhVE1MyOMrB5aY5q5B1F/eYeW7OcvGVoHE6qR9?=
 =?us-ascii?Q?pctHz8MWN3FRYvcj4E5VnSjtsaGpduZFterBdKgmxbFeq8YLRaXnovqXO6uO?=
 =?us-ascii?Q?nQI7fo2yWTn/yeYJtJPToXWZsoSf7IgOjaPVk2tOSSJFQSSarOlhfiisNNLJ?=
 =?us-ascii?Q?sP5ONv/seffGOw4HnM98SPpUQqpDOqDHNR7If99+/h00pkSKGrOgLJ39L0dT?=
 =?us-ascii?Q?IrI/siwvBj6TY5EINsNndI9SSPWHVJaV9lDOhcxZPXmxJ+4kxq2Vtv3p1Iu2?=
 =?us-ascii?Q?dSiCOahGmmiWRfICom1Cz2KGFjOE965CgmuF6GhTJ5PvUAm0FfGP7DmpEiGb?=
 =?us-ascii?Q?Zi+JyvYeyXrTg/vXdjl9Lc3xF8NcJNklzOux9O4PvWuzb4Y6AvRD6sSbqgNg?=
 =?us-ascii?Q?0Of7MpfsIK6nDFUgAYmWzi5aXnzYg0JuBlRkLiWa50IgpTKjvzzBtVwtx/J1?=
 =?us-ascii?Q?T2yHa8CwCqtsMt87GcrTErqdZ2X35EI8/hD+Ys1eMg4nh9z7cRzXhzfNZW9F?=
 =?us-ascii?Q?5NMO8d+flQC9JWukzyNHMBh49WJnSG9WsW3Q2WFJ1Rp4h+DxYIX4pfKnB8P+?=
 =?us-ascii?Q?Si+XZmEC5F0BaesqlbB/wdXSZXl9pS4Pn96PIejZ4Ia+VRCFsHb3jLYLV2pJ?=
 =?us-ascii?Q?e9sZ3qX2P3bFxSAchifUyM859rxxFOf/MgD49EnyU7Ffi9e3fnF8d4YVY5IS?=
 =?us-ascii?Q?2rRBQ5U9MpWPTeIPFQo73s841lvAtZc7FOLrQ1MZ3CnYgnEg0GtpzdG1l69z?=
 =?us-ascii?Q?/fAcj8wbHP4hezm6hva+TiJX5ewKa5SsMTgPdi/ZfinphY33mmIgFesCKvSA?=
 =?us-ascii?Q?jXhDGII13pJR79qrkRjfIA5d9y2u1TmYg7hL+w+QlCUpHsdmAKdB3QawzYFL?=
 =?us-ascii?Q?Dy8txp32mTjyugXp+1rS5czReSmnNa1mom9k9b7YP4/61YdzqjjEUDWxYtbs?=
 =?us-ascii?Q?qUh8h+BxIhNju2M+B4ostrs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf3e4f8-2c80-498f-c3ba-08dc554e2d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 08:55:43.6620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhTFHMJiPAiVsSv1WE+xPxo6GvocB634wVZRGOhouseraTIghy408qxIN1emL1HjjFofSMht+pmzIDFeZnbJtJ5D7Zqy8NtWL+vwlRV1358=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8589
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
> Sent: Thursday, April 4, 2024 9:03 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
>=20
> On Thu, Apr 04, 2024 at 03:05:29PM +0530, Tejas Upadhyay wrote:
> > Workaround 14021567978 applies to RenderCS xe2_lpg
>=20
> This is one of those rare workarounds that's documented as not only apply=
ing
> to the single platform that has the record in the WA database, but also
> carrying forward to all future platforms forever (at least until they mak=
e a
> permanent documentation change).  Since this starts with the Xe2 family i=
n
> general (not specific to LNL or BMG) and goes forever, it might be best t=
o write
> the bounds as

But this 14021567978  is only talking about xe2_lpg. Even if it applies to =
future platforms, we will have new WA #s for them which then we can mark wi=
th "#WA1, #WA2" and modify version range. Should not we go buy WA#s to keep=
 track?

Thanks,
Tejas
>=20
>         GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED);
>=20
> Also, it's still technically considered a "workaround" due to being docum=
ented
> in the workaround database with a lineage number, rather than a tuning
> setting documented on bspec 72161, so we should probably keep this in
> xe_wa.c instead of xe_tuning.c.
>=20
>=20
> Matt
>=20
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > b/drivers/gpu/drm/xe/xe_tuning.c index bb6db2817ada..cc65e5b4353b
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -93,6 +93,13 @@ static const struct xe_rtp_entry_sr lrc_tunings[] =
=3D {
> >
> REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> >  	},
> >
> > +	/* Xe2_LPG */
> > +
> > +	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> > +	},
> > +
> >  	{}
> >  };
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
