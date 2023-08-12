Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CABFC0015E
	for <intel-xe@archiver.kernel.org>; Sat, 12 Aug 2023 07:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C63610E1CA;
	Sat, 12 Aug 2023 07:08:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E0110E1CE
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Aug 2023 07:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691824093; x=1723360093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e1H4ZpCGna3j5ydU2IXv9uvIHeTfRt7QDrg8x9gqopk=;
 b=iIkdUtYWb03M3OQ9z0LOZy3Q0/UjQGzQ4O5pDQ1R1ant8iZniNoGdEzp
 Gj76lFiJNGxv1D119t9MaWSD535MBd0o+rB47mjjLAC2kz2DLDxG6bcRe
 alcy61i8FcIsP/OFiD0GFvWk8CXZJ7i/PNB64aoznMa6Sm+LbVmFINJ+Q
 +w6GQ/FlIrRS+WkGOhctrS8LtzxBYTQFkr+I7lfumEXvHbuNpNSQpw0kn
 o7zElGB73GAou4MwF4pUmztez3PjIihipqXqsToQ7T4YI+a3dlB3JdN9w
 OL5QrZShip+3uKbIdsMcovBK2xG9vJDlWxWllCQNdkcJR0e4UnWa0Gy0c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370710885"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="370710885"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2023 00:08:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063518207"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="1063518207"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 12 Aug 2023 00:08:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 12 Aug 2023 00:08:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 12 Aug 2023 00:08:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 12 Aug 2023 00:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtctTN3NrOa9Fxrvw/yhAWwydw9G+5Yd9ZzaZkjk+0y24H9B6tm2luXW5FxIAj4Mj2RRV5gD7hEumPy//y/hNFuWWNWpBA872liL++qIZZbIsXaBqPvcnhVsTPjmKZsRfo47KeSdc9bVRnRfWz9PfQMX++bDElFSdE6WvF6pPl466eF+hYXnY0tOCFYVh9sWOKY/GPN86pwt02uObPqDdmUDuhHjhbsgoK36WUluTzHSZSyUL5V6OzUWi0DDUf3hyJXJGIPz14BVnrjIwH+pY3iPwvq7rOp4SZBdUrB3w2DdGd23gPKtToUOM//peVW1yZHFboHDMYHCz8RiAhdx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhLJfzSOri4Oe4b9xEXtb3wzmlx/7Ni6ZLAT1dijFe4=;
 b=aUygJB81ZvuNrPVrAruWMy0ddoaWHP2LHEOgqUvw9J1QQt1ykJf93Q4TiK0AwFI3+EzfLIO2Q/TMQYxofG5iJ5Ej6cHwEW7n0VzO1br/Orzd6Db96yK1QKpEHKxBTGo6qaMzxgqc05jgKVLK5LMGCxCa2v4pMbxLdF9nvzqLdGV2HSYpZQpIDJMX4n7nymS3Cxo3ZnuyaFF7J10Dc+csqeUB6bJaXM6Iw1EeFncjSfJwAiKilJP+iJaLtcL+lEdjcMmY8u/tJuh8ABfiD2sQpC8MMSnGjZmBeiJDu0ZKiOlnTCWr54zse+jBSKmL1d7esuem59tbBKYDPf7iHVzBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Sat, 12 Aug
 2023 07:08:05 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%6]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 07:08:05 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/4] drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
Thread-Index: AQHZyiWPmsi0gVyx8EOfgLGydLSPaK/mQkQw
Date: Sat, 12 Aug 2023 07:08:05 +0000
Message-ID: <SJ1PR11MB620457BF2B85DA4195524A4F8111A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230808182411.31354-1-niranjana.vishwanathapura@intel.com>
 <20230808182411.31354-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230808182411.31354-4-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB6971:EE_
x-ms-office365-filtering-correlation-id: 615167eb-9369-4cbb-cb5c-08db9b02e009
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3nxKdg0thzPKUt2fFqMvs/UfXH+5SRqaQqoGe7II4tq/beckn0BVz1JiwdSoW1/BawBJwgVt0I9a+oWaKptvgHVNNLEoBOf/9lObcnxeS4t1HM/5Yx6YyIvcoC1f3Ms1vaZUVahgw3eBPbcXOZn0fhzncBa+tesWgEqTRhwLu77DCXZeB5n8wENK6U2amwKbbBXNOSoXwhkqFEjm5SUNYmncb3R37P0bLXMI4EDhjCQhQcXw7wo3PFQjjArfYJWu0CMVYVBlieX+dPqW8p2+C7BKj/M6nuID7mp1fYYK2ies8PORXfNtdu17/5blRheDuUG1rX6xyCKJnNZ7pWvhEweHgz/nIKQWV1RFA/50O3bZFVwGrKDn5CgOyMr+0ZYiNmSR9nU/yQuCX7jEziUS/qw9NzY3x+DXrc8lxet6C2RxcmvZS0EPgkoo1SBif9VgWZ0rS9u2WuuFRrlO6My1b3pjBksjl22KyQ1gvvLQ3OR2KdFqLuSH9NBmj/+mvpQKf0Vy/haYtd2R5Oyqn0ZgbLmFe56UclNE/R255eVWRWszuntz697Y83yn2vv3KGqPDJ9z/e1Nz5PCEFPleaLr4ExT/akzGpyLw7akod/fH+3ghL+8IBMX+xx4zXHYJxqJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(1800799006)(186006)(52536014)(38100700002)(66556008)(66946007)(66446008)(66476007)(76116006)(83380400001)(33656002)(5660300002)(8676002)(110136005)(55016003)(8936002)(122000001)(64756008)(316002)(4326008)(82960400001)(38070700005)(2906002)(41300700001)(86362001)(71200400001)(7696005)(6506007)(55236004)(107886003)(53546011)(9686003)(478600001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?paGNH5lbCbD5IIzqhrkIMPiIRrw6xu63OUBVrHfTyv1xogvgfKVeSV7q7hYt?=
 =?us-ascii?Q?FevNVzUxTfqhvdR3UXonW9WWIwrsQJfhuIdOnnOpdDFcb6YABJscZyt2zQoV?=
 =?us-ascii?Q?9C/HgjJUT9yFVd3y7H0bC+97A+11nwWV/gL7utSYTQof9wTa+8hDLdyLkUwg?=
 =?us-ascii?Q?D1rHT7lqqFRnh8/LGAzr8cFWe+b4YJCPdskc4mjCUF1LRtsPjLY/ArsUoMan?=
 =?us-ascii?Q?H+WGlJ49aOHBRnz6Yo8l/CKEk1CvwyyYKvmlRECqSV05hZpVlqlsn573C4wi?=
 =?us-ascii?Q?rXAxd0EMPZ9VfqhcyfK6oz/haq1+zdoxH+3GydKJ9o6vTyAIAwCpTB14lYk3?=
 =?us-ascii?Q?JxYnJUnCRkKkJEdzKRRjHdAQ7GKpt/ddKQr+8fKO2QH5d5D5MXazQUraYqtR?=
 =?us-ascii?Q?nftles7TdVdmHWKny7Lq1BDi5ldYFKnxU4HEPOe/NDYhNVk95nAQT++i7vey?=
 =?us-ascii?Q?tnt0LYDUmkKos84UL6K5/s41LANYHVG33QUL7nPODTEzTehUnDYZVxDmqLqi?=
 =?us-ascii?Q?mStyFokC1x7oLzSLPZpaftKumwMBJZFVRlvgGVMwmJ1ptEvrkuEIO99SmNUJ?=
 =?us-ascii?Q?Ov+dMdK6m47/iD8qqva0GPi8+El356+gpGNglXTar4t4ZV3NGWW/ZvYjyl+n?=
 =?us-ascii?Q?boY02K21IpLWBjcXac57h2OIks6UH6XjthzIAov54CPa0425BzdC0on442ce?=
 =?us-ascii?Q?lc2nYb9aknM7VJXbl74NHBCG4zSUaXxI9MqYqJlxRwqIF6LNPXR7b4eMBwvW?=
 =?us-ascii?Q?S0HfRaWUAAb3WocBc2zcNcWAFx480RhjYwb6O5LPNis4Cy7G2MLwLTpqgelc?=
 =?us-ascii?Q?l1hl3X3xr+PPOERDS8chl01GHCu+gDeZsnI/cHNVIwhLoHv6UabpdH7v1hyR?=
 =?us-ascii?Q?uRwOoIa67JmFYHLBV1DliAJygW3/MqvCS7PY6UvhYOtJGDg2dvrZuMZaqn3u?=
 =?us-ascii?Q?KwnLS1WaVyg1SiJvYWJI94nxYXh+hIWbexPmMSlaftA4FgNdugNf6QiJNhaz?=
 =?us-ascii?Q?I4zu5WxFwiq7BMvykvVTuek9STX/yfKlap+/9lwNwxdKeRoA0PKEk4IR8aZR?=
 =?us-ascii?Q?9khcGJjL5TJbo6VvWOP4IqvA/Sxrb6jR/hYsJTaO/9JzGI+6QPLWyTG10W1C?=
 =?us-ascii?Q?2wsmYalg+P/ZmdQ1OC7MbPRB4klWUpkR1BuqXny79snpmBDEyQVpUx0V/qX3?=
 =?us-ascii?Q?/knaIajt5YOcbrwyiDn4qtDI0FcHapsGdOQFn2MvjaCFlSZOES9yePa/xVNN?=
 =?us-ascii?Q?4TvwMYDCLmaVAfiyE/FqJ0gbV9KAlCw35NJijcjVdSmLTLNAUeXiluYV5sxM?=
 =?us-ascii?Q?c1T5todL44PnXB4c2Sfnl6dZSOSckXXszUoT1Um3lFX8Tz+cVW73zXyjaiam?=
 =?us-ascii?Q?+dpeBodr1zq3iEt8GBLl35jJzzJQedJKX1yJO29tgGIkKbMAlll4eKn0M5mM?=
 =?us-ascii?Q?sP1AmdYm4twgkGWsOT7OvDTPtIIQhhHJXipS24/Veldf7sk0ILfbqrjdo2gJ?=
 =?us-ascii?Q?TZHVh3Asnvm1qx67yR3sUfaD4Zx6hvQjmWIu+JFg7ZYWdQp5v7IREhVgV37M?=
 =?us-ascii?Q?aiEdbssBL+ZQpexLsBvIEPXJJfR4L5P9pR1cFk2V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615167eb-9369-4cbb-cb5c-08db9b02e009
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2023 07:08:05.3621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPe+jpEsjI3843g6cGSJEFVnSKXb3Ckc0JuQHX7tU1ha5Yf+A+2VM8Lc0ZwGqODrKhLvbzdRe2uUduSrBAXib0Bwc7UfwxtRJfoj7ilIj/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Tuesday, August 8, 2023 11:54 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Harrison, John C <john.c.harrison@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH 3/4] drm/xe: Add
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>=20
> Allow preemption timeout for compute engines to be specified as a config
> option. The purpose is actually to give compute tasks longer time to reac=
h a
> pre-emption point after a pre-emption request has been issued. This is
> necessary because Gen12 does not support mid-thread pre-emption and
> compute tasks can have long running threads.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
> drivers/gpu/drm/xe/xe_hw_engine.h  |  6 ++++++
>  3 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index 06742e192206..5ca3305a22b6 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
>  	  an arbitration point and yield to HW before the timer expires, the
>  	  HW will be reset to allow the more important context to execute.
>=20
> +	  Value should be within the
> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
> +	  This is adjustable via
> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
> +config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> +	int "Preempt timeout for compute engines (ms, jiffy granularity)"
> +	default 7500 # milliseconds

Same comment as previous patch about us unit.

> +	help
> +	  How long to wait (in milliseconds) for a preemption event to occur
> +	  when submitting a new context to a compute capable engine. If the
> +	  current context does not hit an arbitration point and yield to HW
> +	  before the timer expires, the HW will be reset to allow the more
> +	  important context to execute.
> +
>  	  Value should be within the
> DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>  	  This is adjustable via
> XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 25bad007a85b..57a0fb50852c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct
> xe_hw_engine *hwe)
>=20
>  static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)  {
> -	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
> +	if (hwe->class =3D=3D XE_ENGINE_CLASS_RENDER ||
> +	    hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
> +	else
> +		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>  }

Probably API in previous patch continuation of this change, but it does not=
 make sense to introduce change in previous patch at least.

>=20
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *=
hwe,
> @@ -569,6 +573,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>=20
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE <
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> +	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE >
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);

Can this be done shorter with,
BUILD_BUG_ON(get_default_preempt_timeout(hwe) <
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);=20
BUILD_BUG_ON(get_default_preempt_timeout(hwe) > XE_HW_ENGINE_PREEMPT_TIMEOU=
T_MAX);

Thanks,
Tejas
>=20
>  	for (i =3D 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>  		hw_engine_init_early(gt, &gt->hw_engines[i], i); diff --git
> a/drivers/gpu/drm/xe/xe_hw_engine.h
> b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 582be209355b..c4f0969efc06 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -35,6 +35,12 @@ struct drm_printer;
>  #else
>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)  #endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE \
> +	(CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE * 1000) #else
> #define
> +XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE
> XE_HW_ENGINE_PREEMPT_TIMEOUT
> +#endif
>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #define
> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN  #else
> --
> 2.21.0.rc0.32.g243a4c7e27

