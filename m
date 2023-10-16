Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B9CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9810E164;
	Mon, 16 Oct 2023 09:08:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11C10E162
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697447332; x=1728983332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CjVMlzpS0UCPD3LeaoFKLkwF4OyoBXXDOKL562BwUXY=;
 b=jviOwvPu6qkw61QJ/t71HU5IAtVXN0BESxmaIcyNGF6FuG+LGdS/a2mz
 nd/sk0hMBUOIazisfYFNxbsJTXvYYKjrG5pl9VeQB0Pbc3v5/EOAXtvve
 AcNW3HY7Rt1M05vUPYM+UUCveGDy+hW9Kgv78lDPEwR2Ub1EnAdb01kKQ
 A3j6Q2vHJkhJ2Xj8ppIDxFeRDbFvXOSb2PbIhJ8rl+0HJZVXxcFwblsBU
 W2+NOYBIVQYK4RED5k+ZQWT2oHwvhOYik5tKWI325RkDCPaCAy985ZSHy
 0Bt21qnPZMmAAHNbuqQFzeuuK9/AZMj7SRKIOB03f8x/cSx8naAnNWVFD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="4094308"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4094308"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 02:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929283258"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="929283258"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 02:08:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:50 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 02:08:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 02:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0U12v/6M8rPYyeZ5FtjlUy9Ag51jTCx8aZcdy1lm8g6s9GOXBycLDiUyRqf3Ey3D62tAD2esLn4Ew9rZNGhtDEwIRviLMJ6gBlUODb/KQ9+xQgslYdjMYCt33KF7kBw6c3+pr76gdqV1kkuQeIYT3754+r+vcAJEITpSMx9Ire4KZXuSeQon3oLFBEJJ3PCZUZEnIPVVYMU668rMEem92BibyMcH8CLu79pMplyjRCiMBdZBkSA3QNVflhD2OVfbDeDPNC2bhcFsuJJJpFwq6ht0yjJErJ75XXlxns36aZxVmQjbCFg3PUpNllLLDCwYxoVR7OOAKVPMxjjjjgNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoaYMLwCarPx4wie+InjFlhfH1bkooGit3VixDkRu48=;
 b=Ig2y51j3MrsD/FEl1A7vBTREEWxDCqS9jVhUN1T65CrGmJcVV2Bx9/Gn5Pdmh42fQ8jVevKecXaiBfh1SnrgWmjsGnoD8KnMKHdQD6TYmgjSJP22gfchean0ppO+eIN5/BM90rax48ETbq5BNpmKCOGr+dYVHQeBsdBiazizjglqE82voa5mPkOs+6Iir53umDY79X9rS665taZigT7DtH5eoJw+xhwiachGCTyNDmtQKHeLBe+OcjZEfdnH6iLuJwInCrpbkxfxXPVYNtydULnNA99T2DoFec5zL3eH+uW3mINdCPct+gCDFCoGa9unSeReKkLTNImdVSi2WjhiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 09:08:47 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:08:47 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 1/3] Revert "FIXME: drm/i915: xe doesn't have gsc hdcp
 interface or something"
Thread-Index: AQHaAA+sVcFV/dVIkk+ldr3M3CVCObBMIJJQ
Date: Mon, 16 Oct 2023 09:08:47 +0000
Message-ID: <SJ1PR11MB612963DE153854F786C28D23B9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
 <20231016090139.850525-2-suraj.kandpal@intel.com>
In-Reply-To: <20231016090139.850525-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7457:EE_
x-ms-office365-filtering-correlation-id: 5403742b-fe8b-47aa-b91d-08dbce278192
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HAZI6ChXf2woVoFRmHreINgcrDScnWPiNx86LGwDZsYpVzbt5ulVpe3FYJYpf1aTncrNSzsfQ45SRinq2Cf0cABQeqtantjrPdhTkSsm3a61Oq3KsICfiHxAmuYi+SeEt9zkDrnw3Z+8aaswn8e8SA6u9WN1RSAwEovtg5qecWxfdLzDs7rRc1R55MFnpAac6cpqezDafM4m9hR4rClZJHUJ5DeKCDvH5Cbx3CkcuhfgxkpwsULVkPqWtovuhSc5MqgZ7zMs05uQfozOAiVth3Ck97CSo6S7EeVaoiFftjXxnZXyPQllY9ggR0t2VTTfFwNYVFQ0oW5Iu0VwUzlg98+X75XhqzJPyM+u4ZtdFbL2F21ygZMJuQAw2jSXdXA+PNdJ3d4wrRGBtRLPJtXGbQAhyEo1neg/RasnQGfDLVuuQ2NuWcMrsGiB2RR+2PMCDXXSu+vjasar0AFGc6dzGQMzae01JL8T/Xr0f/PwwMxm8eBiInlFYxb8Js5e83tRv4bJDBJthdoWI6stgbtBKHkBn9zt8YePrLfQf9RL0jOOIK+RnEcbyTLnSk236OBNchZb3RURdprClvcJT+K+wx07H3OYxJ+v/eNqB9XxY+GeLxN4zrSGck/i5Y3ArNlQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(76116006)(7696005)(53546011)(316002)(6506007)(9686003)(110136005)(66946007)(64756008)(66446008)(66476007)(66556008)(478600001)(71200400001)(107886003)(55016003)(52536014)(8676002)(8936002)(4326008)(41300700001)(26005)(86362001)(2906002)(38070700005)(5660300002)(83380400001)(122000001)(38100700002)(82960400001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VkXGapnadQliOQym5Hy9z4P2yuNelEv8rIhHyeX2dYJylTDFoxiYIAtpFIHF?=
 =?us-ascii?Q?Q7u13uq/ZeMxZgupLU2mZtMZP2qAwclZyDkDpa2Auw4cpR4zFSPus0a5gLge?=
 =?us-ascii?Q?nUi7OH8KN7O6OIqTuhl9TJ4NoPZY/7KttS6ICEM4DBRRnvThGMtZl2euEmDV?=
 =?us-ascii?Q?TlM6n9s4ARxiekK4afgA5m6CDMgWYE8lPJPpgnYIF4trAxsaWm9RZvAxAOWM?=
 =?us-ascii?Q?uDJfOGsqI4r4/HXz9+vFlpglXMECYcvp4UoOZeqPhJKBMuXnGCkB/lVeS5fX?=
 =?us-ascii?Q?mrBOl4TA6LG/ZynqKFAp9B8BcJ/MmvLQjVjFBqGVk5UxxrDiMjXOQ2Erz0N0?=
 =?us-ascii?Q?DtCgXfu9M2BCjfmNIN7sJUGTZKRhP70nrD3Ks6qJj/Z0ddCyV7mJdCLzoc/z?=
 =?us-ascii?Q?5t9xvsx2/h7wM86cNKi0kgFYE053t9Fo4EeTp0Uth4pGkIB9D1h+pegNPTcW?=
 =?us-ascii?Q?GLq4cRNiibqR2rTN+qp6DIK3Ur4NUQhUk/4mPYZ8T/9jbpmG09QkQp9AmFHB?=
 =?us-ascii?Q?NHfNEyU3IapQZluNdrvFwKO6H6DgFtWqLpq1vg2HIBPRBS9OlZKhqmV65UAQ?=
 =?us-ascii?Q?dydCGeQIcbO3rfLwyYKieA4RIiaZneZ5ZGu93SFV6wRoxohln/rBy0gum0pO?=
 =?us-ascii?Q?XFymL56fhVTTUKYoYMWL5j/0SfzfhzfyyI4Vqt5EnRfwzvyuKq8IC3RBWGtz?=
 =?us-ascii?Q?odQ2OgZCr1zyOginoOApN3SpAU2BcRDfiRBdJcCbZG801J3SKMWgqH+OsXkP?=
 =?us-ascii?Q?6sIi7ZKef/toKUXVC3YBPlIXd25SOQT5tYg+AcMOI+a6S15ihT4pN//6xtFc?=
 =?us-ascii?Q?vDLwZMZRkIEdHM2gakcB0NT2btnsuN4ru3No844U4ECtup5w/m5rAbcB9uQg?=
 =?us-ascii?Q?4Z2eOKokcbgKIEpNmHQWyW5/10g0Cbna+d5qcX+RvmrsmlJm/GKri4m0ydVl?=
 =?us-ascii?Q?sfix+H44skUyct1nxlt9A/prDiOoLs2qlL6xfOrTVy6W9kAR916sQRKnkLIz?=
 =?us-ascii?Q?gBO8zkwgYbHSafC7yN+j6WVW9Wa8yb+zL4sDqWk7C1rAMLAKlneskX5qFllj?=
 =?us-ascii?Q?xsKhZH73PYA1Whkjm1hJuQJfg/Ur46lsCJYNjM8zAtMB4SijBhuNOJD8jI6l?=
 =?us-ascii?Q?7RgkdawrhYCf6iiaivs0ShVoQ+tP1JE44lvXchGkSeYAjI/bweJxyI6N2BRg?=
 =?us-ascii?Q?UVchq+SDWFE0nD0bjV6gjLgJ5c2svlX7iJJ5Uen8ddz+fvmr7xUxum0rAYwu?=
 =?us-ascii?Q?pyOFdgDC1XqM1zMemSR2dxQyR0dP9pWke2Z6bUl98xoAk0+4aOgkgRCzhbeW?=
 =?us-ascii?Q?Ho7pxETloWKK4LlZRnd8jUVogJJUYbCDZj/R8L9aMjMyyzA3ttEuwqbCex8V?=
 =?us-ascii?Q?R7ZeNSqlX2rM4MUd1W5z4WrCgcwXxABDcN6w4CmtZcxby/UL2gAp9NH3cx+E?=
 =?us-ascii?Q?hxwKv4eRxhKt81tLdar91SNpD86VutEq18lcGp5ZT1QWYhJddfK8tLVEJOi2?=
 =?us-ascii?Q?MY/BOCR4fG4TdYUncvfKqfS2sDp+7N69qDqWHjppgheVBcl5wSM9x/HtzRp5?=
 =?us-ascii?Q?C2Rb+NMTX5T8Th44v/VtvfRDJvoCzHkN1Nydso9bKnPo18GF2RduSuNhSnJx?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5403742b-fe8b-47aa-b91d-08dbce278192
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:08:47.5476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yy5L9ROGMNVI4zBEPw8OEJUdfg/vjF4acPXlpJ3T3genq0FhjiU45IuCcD6Xq8R8yCoaMJJfYiYqc8J67JP2M+FRN7fP3aV4Ej41hNR+03k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/3] Revert "FIXME: drm/i915: xe doesn't
 have gsc hdcp interface or something"
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, October 16, 2023 2:32 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH v6 1/3] Revert "FIXME: drm/i915: xe doesn't have gsc hdcp
> interface or something"
>=20
> This reverts commit 76d83e375beccee979a13284dc8a8079cc1ba020.
>=20
> This is not needed anymore as required changes are done in i915 and the
> subsequent patches will make it possible to get everything to work withou=
t
> the stubs.
> Although we keep the i915_drv.h include as it is needed for buildability =
and
> needs to mirror intel_hdcp_gsc.c.
>=20
> --v3
> -make a fixup patch [Jani]
>=20
> --v5
> -make this a revert patch [Jani]
>=20
> --v6
> -explain why i915_drv.h was included [Chaitanya]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 5 -----
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 5 +++++
> drivers/gpu/drm/i915/display/intel_hdcp_gsc.h | 9 +++------
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      | 1 +
>  4 files changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index ce9993c64459..8cca4793cf92 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -173,7 +173,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
>=20
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) { -#ifdef I915
>  		struct intel_gt *gt =3D i915->media_gt;
>  		struct intel_gsc_uc *gsc =3D gt ? &gt->uc.gsc : NULL;
>=20
> @@ -182,10 +181,6 @@ bool intel_hdcp2_capable(struct intel_connector
> *connector)
>  				    "GSC components required for HDCP2.2 are
> not ready\n");
>  			return false;
>  		}
> -#else
> -		/* TODO */
> -		return false;
> -#endif
>  	}
>=20
>  	/* MEI/GSC interface is solid depending on which is used */ diff --git
> a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> index 4ab640b4e7ec..d753db3eef15 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> @@ -12,6 +12,11 @@
>  #include "i915_utils.h"
>  #include "intel_hdcp_gsc.h"
>=20
> +bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915) {
> +	return DISPLAY_VER(i915) >=3D 14;
> +}
> +
>  static int
>  gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *dat=
a,
>  			  struct hdcp2_ake_init *ake_data)
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> index 704acd3ed46b..cbf96551e534 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> @@ -8,7 +8,8 @@
>=20
>  #include <linux/err.h>
>  #include <linux/types.h>
> -#include "i915_drv.h"
> +
> +struct drm_i915_private;
>=20
>  struct intel_hdcp_gsc_message {
>  	struct i915_vma *vma;
> @@ -16,11 +17,7 @@ struct intel_hdcp_gsc_message {
>  	void *hdcp_cmd_out;
>  };
>=20
> -static inline bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i=
915)
> -{
> -	return DISPLAY_VER(i915) >=3D 14;
> -}
> -
> +bool intel_hdcp_gsc_cs_required(struct drm_i915_private *i915);
>  ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8
> *msg_in,
>  				size_t msg_in_len, u8 *msg_out,
>  				size_t msg_out_len);
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 5c02675bbb09..0453293af8ef 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -3,6 +3,7 @@
>   * Copyright 2023, Intel Corporation.
>   */
>=20
> +#include "i915_drv.h"
>  #include "intel_hdcp_gsc.h"
>=20
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)
> --
> 2.25.1

