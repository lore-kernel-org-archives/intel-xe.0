Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE191CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 08:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628D010FB5F;
	Tue,  2 Apr 2024 08:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngEHyHVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFA010FB5F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712047240; x=1743583240;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tajESd5dnC1NJKjYzLM2v2eF26XJ3Shm7ySx8bbxIfA=;
 b=ngEHyHVy9iHOr4qpJWQahMUiAG5MFi1f0Z78jdqBctLJCiRZlPefC8kt
 4h9/BKs4PEXkzONt6HPzbWedhsofRf4FCzADXk9unM2GwXqBWt3w2LRee
 jrQPrS2AgerH/svkeb9W5PxLDjBcvsNzTYoVxb4Hpvc3obIqmrHJaLwSE
 CaALwWCC3jyFaye9lg6wwf50tnz+jMAqYdMisTUHfjXlYcUTzfTr2EGfu
 61HvEZR/06wb7S1ZICuoomZA3HLEHdEdpQwrinBdKqpD8jE79OwqCcZb7
 fxoHVwPoReObIyj9/cu89R0SBsqtm88lNtPyL8Qm5K48w/ZgpN2IGEunv g==;
X-CSE-ConnectionGUID: cI/ed+PhQumJF1OOFi2Rlw==
X-CSE-MsgGUID: /UdyXyUHRtGixdEmCrW3sA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7331549"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7331549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18047070"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 01:40:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 01:40:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 01:40:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 01:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgxA7OM0H9X/KPXG7eSnAfeTQj3SYZvrWx18JGOYIXC1bUE+iqz2y+X5K52B+As0vGVS3WKxImsKF/pOqaJ+xFO2Wi3IIxJSx5CAtKG7M42q3D6LCjXB5AxDQr4rL1erCeVS+NZRRO9xtmCDc1mQCp1DYG4Rt367s2wMzEnJlvXfwj9OX/GjiC5gE5pvaBxPVzXey5mYwzilU87MXmvrO5gJ5iKGO0tbNLICHxR7baw4Bm0Sw6+esImUo9wzE+1zWQBlkDaTQecUcIY/MJfBForzSZB8Z8u8IjkaQgE/jk7iHE6lTs3v83o2fww6YiOoH8mChObznuogqeDlK7pqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSrE7yC7nLgUZWH0BkJjnwvCwsCzGPPRhlr8KAqG3qM=;
 b=X7M5R4PrvIyqMhK5AfFxwvtIulT8sMU/z6QE5AKDwmnt1V8lpBzxHUVDLi/bZqF/MO16TcL1IgMI8yzI4ipaiqzKghdu/uBhHT/sNYf7iuRto1ofYs8ZA0LYzzsLLnXhNn+MhfTJiAq6JJOtGTjm6aUGlSWiJYGt39vSpmkSEnn71uasnSVflT7RHfHlNbuRpsS+aWfLUtkAIlNftTTbt4LYG6iQyniuw+W91MDwu5O4IkGpN4f15gd5AXloOShP9QNlK75uDvG3lQp+J6uf+04B9viYi2fShoSJIpOAKH/Cz2TMYATMtEBSEupDQzmNl/hVflpaVVTo2CVndqwX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 08:40:29 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 08:40:29 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2: Add workaround 18034896535
Thread-Topic: [PATCH] drm/xe/xe2: Add workaround 18034896535
Thread-Index: AQHahMSctWFKcLTcck+WS1N13p2HYrFUpt5w
Date: Tue, 2 Apr 2024 08:40:29 +0000
Message-ID: <SJ1PR11MB620464026345E0970846EFD1813E2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240402061129.117196-1-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7726:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pkY2dWtxhEuNAB27CgquUmYLMfFADfPerifwQd2duoVDj2/kwFuyCyvcotnw1f0Q9p/i05xyeyoNfrd4LoQQfAUaqa0h73PWe5dh2zgZcwU293hHXQ72qrUhus4pgTt+ggmpFCPThaQ0AJwxE0JkC6mRCk80qITMzIu+vZI7XHfOt5VgFyQxuSQzX3hdBsK6aPrax6Rth0KzmhOlbSDz3ozzt6vl2ePgrMSMEtYeE//KuOKI+pO9l4QYi0n06ixt5w9lP2QPT/kRRQ9bEMBTpccXhfU3aBuA7+lxbwP0LX/dh9CPKtxNLh1DJhfI85FIyjCY4h0OYZEz2A78pEjI1MnLZVa2FIoOXusXYfrE6Uffbbz3X2AGhngCnMu7alJci0VxxJk3Paq0hHmV7/BKBroRVZK8sMFbfbkfG1YKLmNLdqG/GGB4uyClONTUOTTaaJXkX9l0pD43ipSEmALYapowb48oImSMOwJcEQNgg0soLgoCHJqtdYne7GrMJC8r1sNoO7QtDlSaoDw7NK6majogGLOZd7FGjt/eZxGq9bwSXLqsYAiigYdmuJQNRwdgztTTpLfybo/e3oxq1MDIgMhWuRWNwmK0BUEsEyd8ks9HhM4UIP2BBRJNEy4wjJ+9xn7zMbum6Vq6EbPvy60x+iuud9JNrak9e7N4YiG7ucw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fzGt1cw2giGU6Mh6/MUZwDIjsxVmlJFJuWt0xl6AC8oaniplUolKjNyQwmCK?=
 =?us-ascii?Q?Naimkz1gEU1yoWcOIHBY2tb//sYHPSB5GHINFdR8ASMi+Th/s/YZLKHVPH52?=
 =?us-ascii?Q?/koiPT1wIojwQmwyLRbQe8UB4zBl6y9MU24+Py6OvY7AtRjjJBI/jP3LmcNH?=
 =?us-ascii?Q?O6ryB3lKyWJaneK/VW5ZGtdTM3SlLKD8gtj/KGOkBdo5Xe7b3TavCeqHThK0?=
 =?us-ascii?Q?dVyWvVAZSzWGYsEbGnlSJXdkr9v9kj4atubTOoIG7LU3p7SagBL9r/wR3E4K?=
 =?us-ascii?Q?7Wz0F5EZrnJ6iefkZjSwhkIANM/3zmsY8tGC8TCAbKuPywox0s4zPWwlX6pD?=
 =?us-ascii?Q?hQvro+qQbreLPidDy4A3eRRBZJhOn2HD70MefriPH3r/5E2DkJqzPggNiuN0?=
 =?us-ascii?Q?c5RjGSy7GROF7gYTO3DkoVSJ2EJw1uLMmqh9mzfzRn0SYjDIplX58R9WWBF/?=
 =?us-ascii?Q?8v2uKLzDm0Qs/ILzuFb9RREUFayP4vlGhhcGjK6iPiBnTpE5uZGhLaShuCD9?=
 =?us-ascii?Q?jETRCcQa1AyLlCMbQkv67XYc7HBI1JHtjP+FKCSFi3py8cwd9LleXssxtbWO?=
 =?us-ascii?Q?NB1jUfXKF0d5fixmeQyrEHlAiK8cpWZwNLmL7JoKh10rsy9HFe9799WMGlWv?=
 =?us-ascii?Q?uiHYn+9fHlQRavD1boRXwKvb3dD4q7V5lOC0H91ZucjFkKifW/KmxQ/UT/fE?=
 =?us-ascii?Q?kzk40R4Hc9w7vA/jJ3ocOm/u7fGshiiW4jb7L+P+/DZCiumQgiQmutQ3vGA+?=
 =?us-ascii?Q?VLD5L8fVWLQi8PGsp10EjFEDzVUXpK0Ogid9wBDjuNjjoniMq4WW8Bl4bDOe?=
 =?us-ascii?Q?7RDJdKk0ecrc7tfNS0QQ22HHBuBx8YSS4bY7/8c60zSegAHmVS8iuvNHrXz7?=
 =?us-ascii?Q?vkmIKlnDs/gzAnDlLA9ucCb8clE3ft+D61WX2UmKGKCLVCE5oFE73CFRAu++?=
 =?us-ascii?Q?h9ZremNG2lcUWc7u2KHDWskv711fKjaowbzc6nOz1gKIP3ue9PH1euWz34fv?=
 =?us-ascii?Q?kMPAc45O+KxFNJsysVWVGHyszD23EpJv7FHyxUZ6QopDFYcCrOBMepJL67Rk?=
 =?us-ascii?Q?SL73WZCFncJy2OCk9mRJJzALDEVaI+5JurQTJeUJdewvGVM8cZADqsnnKks5?=
 =?us-ascii?Q?tQAuvhEqu5s2tyRDxmrWNWfDYW6Im18qJMa/NiBgSaA2+LdXrq8cvmWIHT1K?=
 =?us-ascii?Q?UOusYtaJa2FQlH8WwBFU0Tcfc1OxtOtZUR7310tNHwUup5Jf/equmeizahx6?=
 =?us-ascii?Q?gL1X8DPtW16i4jKS2mq6w9bgF8vKGrA4/RWUKeZQwtoVNe/NIZ47F9dqDwkO?=
 =?us-ascii?Q?kqQX54dwHnB+xyppbmnD1d5Tu3DspF3+Qq+NlJ2fEFSbRuKKJDilTIF9NYP0?=
 =?us-ascii?Q?g6V3Y9PTxnzj15xkmhhP4pt4kjAZ/Rzqd8TqU7AFdwaZqIcLiTNGnVMmWmH0?=
 =?us-ascii?Q?UVEERt6zbeaoPW/FCE50sLPcdV4MILQaA+eWSyyI8Xx986Fe0qwB3geZfNEG?=
 =?us-ascii?Q?Gh3J4WEh6niPiUbu4M0rBLzqG8JnzJNQfqXJUbpB43mhPKfj7R9q+RaX51+F?=
 =?us-ascii?Q?szeIw/Fm7wDBIdNfZMrw7tTBBFKvkEG/vTkrtORj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8668dd86-4a7c-44a5-7f48-08dc52f08d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 08:40:29.7893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Qs475a2TVzXd1O0Pp/538Rw4n19AYAAYcCmyBtykkMVqMU0wMe/M2Y7nTdRevVX7Az0GH7vrtSF3LZCAJWuIQ5QVm/I7Pn7XSTu6Wx/sxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: Tuesday, April 2, 2024 11:41 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH] drm/xe/xe2: Add workaround 18034896535
>=20
> Add 18034896535 as driver permanent workarounds.

%s/workarounds/ workaround

With that LGTM,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> Also reverting temporary workaround 16021540221.
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 74b33a3845f2..4d8e0d64cf42 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -423,8 +423,8 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5,
> DISABLE_SAMPLE_G_PERFORMANCE))
>  	},
> -	{ XE_RTP_NAME("16021540221"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> --
> 2.25.1

