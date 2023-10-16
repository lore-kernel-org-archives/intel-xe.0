Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21FACDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 08:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B353D10E144;
	Mon, 16 Oct 2023 08:42:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804710E144
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697445757; x=1728981757;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KXsOUj/Dj9QbiGSRLfTgZBeHspKOSacxiDkInjI2EZg=;
 b=cyG9NAikTvbcBNi+Rs/ozmFWYaAMuJtWGghsCjZzv/ZCdN5wc5xHLo+W
 FOFV32yPKuP/jQLe20P9lNW1Rr9XaQWM+73TcnF0pv7nm2gpR/by5bDoA
 vYfuUKpxIWsRRDe33viQ/inh7I6qfnRxBX9+0LdjsrVoOnJF129Wz2d2M
 7lIuyF9xa4a8gRiS8sTwB16RLcuD7wKvbcqaRhDvSwoVmfs6wRHkfvWWA
 uls0hxhzO53YyB8XsBRglCw3yZFWvKUb9YAr5SkM7AR6XHmxa8kcIBGYc
 Rs1BAr9YDbXBkWP/aK+DLtwxmINrvqAQLuFUq/3WVLHLXxL782RHXrtW6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416546959"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="416546959"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 01:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821491613"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="821491613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 01:42:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 01:42:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 01:42:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 01:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FObAVE5I4JVqH2cLMiYp99r5f0DDp9bLugmNhrVxuSYxfT055HSig2iggE2pEX+TOv9wKzV5ZrveQmABJL9Q/vQUKKvrRwybbxMEcn2YiApfGPl+LssYWw/k+rKYk1RrFW2p1+T6CK2/AClV0n//VCBgQ8plx6/IWPY0w+ORlLLjolTfkENzuNhTICF6mofa+y5K93LWCd512Q+MzfpqD+SPNxBgD3H7dppfyIcxuCHghJz5sO3w4SOVmsxzy1/xeQMfRHwxgKZbUadiNRHaGTylR+ON6KuPcUlNTFlbiaVl6pbak0yIjysKJdjpq/OYEvVMQIpikJqgZAKZwAPiqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUJmiYjaAheWPOKJVUyuUuWg+opoQ7Lh7rMB0yuqXh4=;
 b=I2m+O0ChZSAXQt7yUweUY2A9/8J3koSzoM9PyB5yhA19VrZtNc3FScOdzRXiODmv+MbrWQR7wTa3yctriAuMF2SBtMT17mjyPBTQk5aCR5dxfZ46NGKNv/t5Fo632SNnBjQLKOuneJaidtF9kynDMF0KwkO7h3ra3iaEUqY1ibYLtAiB9za6hsNQlQNoVjd5C2mbbUxjiPHsCGr1UWSWWDZDgX0uRpRUnNJdzf3pZimRJM6u2lbm/50Cb6WTxzmaC+EsRbuF5byfpDBiiixBroxGtPMzPoDwBB9CEJ7KZVRO5Vikd+W2hrxy5ePo73Kj0K9XpFBAKAWKnCVaOcmzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB5795.namprd11.prod.outlook.com (2603:10b6:510:132::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 08:42:31 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 08:42:31 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v5 1/3] Revert "FIXME: drm/i915: xe doesn't
 have gsc hdcp interface or something"
Thread-Index: AQHZ/ZdTPVW4axAWr0GjzrbqJdo8DLBMHcuw
Date: Mon, 16 Oct 2023 08:42:31 +0000
Message-ID: <SJ1PR11MB6129D29E5F50CC135F6BCC7BB9D7A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
 <20231013053455.835094-2-suraj.kandpal@intel.com>
In-Reply-To: <20231013053455.835094-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB5795:EE_
x-ms-office365-filtering-correlation-id: b648c5b5-6b4a-4b20-6c15-08dbce23d658
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CMV+bBSxS3dcnJuyyVWfdl6EcwZMw4KZdLe8af4NVLFoqsqI6HUz9UqCgRWWFRwq6UPK1ToucCTz+AztS+XM10Gtjh2d289Uhs/kOfHxXG18ZgUf5WI35yJTqLnYJs+/qzdza2hq+yNRWrxY0L8wUikBrz2O7+1Cv9G7+Fgd/KCZ6yjzTJj7B+Y7QAPNQ1lkx25Vrax/3UimjXHsmK/27FjZ3vo8OgyhAzO5XnsWMm5B9rMPg+0NsBmlvSwYRBogWCHbfsoL87eUgRUTJSBHleG70HqrhW8MLqjXbWLGyd6WCA6jSLCLCevqRUP9tdlsb1lVDxIkdGp/xl0U9ZX7Z2tKQn0Rql8qqQQ/3Se6jQ8Mds9hXVKeDVqytCzuCmmZsurP6JOHJwSNrxtjmTjCb0rZA+zGa418fQY89EcP97NsLGGCb0h/h1fZwfjOHJAFkITO6BkPWxNP+/LvZ1PwU4xUVU1M4KfHzCVfsfxw7v3Qs0P7LJdfoC3o3ghiOvBMrX+trs9UOA+0R+Py9faIV8Co+gsm0VZZO3uQVaweRIh+3p8onX8gl9Ob4I+6UJqPBMAdgLlxuRlec9lj2ALqdUMwTL5mXaZOXrmXHZKZWP1YqNnpndkfjfn6PGoyGaLR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(478600001)(316002)(110136005)(66556008)(41300700001)(66446008)(64756008)(8676002)(8936002)(76116006)(66946007)(66476007)(5660300002)(71200400001)(52536014)(6506007)(7696005)(53546011)(55016003)(122000001)(38100700002)(38070700005)(82960400001)(86362001)(9686003)(26005)(83380400001)(2906002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vV+J8yDX80NtXB7T/7z89OU2c52rUZOv1ZBKBAQId4y5fnRzH77jwFNe2ik3?=
 =?us-ascii?Q?e7ncQCHzeuVKOFVNP28svSnDVah/YX8+Ql/WDkNxxIjKcrW1iiEI8+CNh2tf?=
 =?us-ascii?Q?TzO5qDnmu3Qvipe6I59jU1KO7p2QtqZFoAYyX044nLoRADdrdNtIUSkBoP+O?=
 =?us-ascii?Q?f7v4JTtG+xuffnXatoaL/pro0+z4cxzbHN3zbUpAzO8HxJT2fj2WWHKl2+sJ?=
 =?us-ascii?Q?tn17xr72zcuWD0TqJiPcKXVt2ecaSbv0Bz1Sgo1RDfohp2p2t2SnICBWYSL5?=
 =?us-ascii?Q?/VE9d4Jt5CrtooYw7SeRncsc0s3iNWB0N4VMvYi1oA3rgbnD4TYu5El78SHV?=
 =?us-ascii?Q?bmX7/QJlXkNqnlAKxsgXsUwo5bbYkZrltoX1LzTiwr11acJX9YYES1tMs28U?=
 =?us-ascii?Q?C9qv0Zf2Y4SMF/jAsq54OcGY2RqjqKWpNOiHMj1smfQ4S4vF5WdYB42wUOfk?=
 =?us-ascii?Q?eomr5DZ7Oo5z9HTQVKvKMPVeVKm8HrpHKmBxMxT/f+3mnk2mhKzZklAh+sUV?=
 =?us-ascii?Q?NcKHrL3kkLBxyFnruyFlvRxXg3k8gJH0nJiW763SYBe0yILBLsA9gJ9XCpW0?=
 =?us-ascii?Q?9dAH/72H+xVCucU4tbXbkFdXQeNckVehoyiIl+A9QPuXIwMF30EE0SafhGoQ?=
 =?us-ascii?Q?Gv7TlEFUtf262VjW6yEVVsCEq6TMJ4PIyDF7dPOk+jdnU1qVpqV9LNX7kQgx?=
 =?us-ascii?Q?9z65ai/E2P1+XAj2RQ63kplhimJT1pNO3xvXMUwBhlD0vI6tp9WIVrB+KdMJ?=
 =?us-ascii?Q?26W+tBbVTOn2b0DWQEFG8MwY74Y7l1TQiT6NxLS1fqFo3ML5H/Zv8pqNW9fv?=
 =?us-ascii?Q?tub+g+T7jIrhIk/L5KmVSVvAzxhj291BiMzb39GQMvbZ7Ipa2oxXLh5PeyjE?=
 =?us-ascii?Q?w/zbvjD3Ubj3PE+qDn8p/5SEnaZ8Zfr2XcA7ILrS7koGvZF9ZDT1nvpqs37c?=
 =?us-ascii?Q?fGOVTI8Rze1AybI0j9j1Kf76GywMM8eqKzjO60FyYn+1T9iAo8bvj71a2LuQ?=
 =?us-ascii?Q?gYXPZsCYXwwveDLSMgNIwOmoenpfArDxAHvqPP98NCqWaSi//GaTY3pmmQR2?=
 =?us-ascii?Q?yceh2WywdvccXAaIgWLxXXS/Tuy3Kx2wC4rPP//r4/XKFAh1hdBZZaxWKl6+?=
 =?us-ascii?Q?IMtYeMWMbQkuxpBYPx6eDuxWvw2XyBvMJWAk77KywIrLsq7jzn0P06Vx9sso?=
 =?us-ascii?Q?SUzGSnPCtyjQbZR6le+M+a+/t7MChtB87+dp04NI1DYfBYVxsyeTwUglAibr?=
 =?us-ascii?Q?wMK9BSnR7CKSaZ45Knj83RxdbJgxxQzuNEIkY4TcAwEWP7w74ceQIzIPO75E?=
 =?us-ascii?Q?QXQyK8kF6pG+9BXUDuqMT7j8Q6eKVQNTaAbzc8MPwjLBMi5Ju3d3KWFsACes?=
 =?us-ascii?Q?pAvoHla2+Du0ZEc1RR8gs6y0oOgJWIUXmY+hm0D3o7WGQK7GrY8JBRVv1Wvd?=
 =?us-ascii?Q?sAuikGglp5oEBWfa5wNFeo87FePp5xcrSMWJUvajBAdKT9wWf0TKHFSwli7v?=
 =?us-ascii?Q?0EAHyHMHlJnSAjybrSFQTWu04KqXEMuVoNSkQ8Yh0bYXuPKwOq0P6e6fRQMW?=
 =?us-ascii?Q?/3QjMj0VXmHybpNg8WuAe+rrvTuEK475b9GSvi89jSNcQTDJ+qrWyWA9utMP?=
 =?us-ascii?Q?Pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b648c5b5-6b4a-4b20-6c15-08dbce23d658
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 08:42:31.8273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y3OkeODyd+oIu36jutFgM2LW+uuGK4ft4Uo9qvs3WOM4F/fADYOi3VeX+zxp0aOj0hb5c0NWRDwuMX24k6VLv3fpa+akXcB6CooW5dNaVQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5795
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/3] Revert "FIXME: drm/i915: xe doesn't
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

Hello Suraj,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Friday, October 13, 2023 11:05 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v5 1/3] Revert "FIXME: drm/i915: xe doesn't ha=
ve
> gsc hdcp interface or something"
>=20
> This reverts commit 76d83e375beccee979a13284dc8a8079cc1ba020.
>=20
> This is not needed anymore as required changes are done in i915 and the
> subsequent patches will make it possible to get everything to work withou=
t
> the stubs.
>=20
> --v3
> -make a fixup patch [Jani]
>=20
> --v5
> -make this a revert patch [Jani]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
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
>  ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_i=
n,
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

Nit: This addition does not seems to be a part reverting the original commi=
t.
We can either separate it out in a different patch or include an explanatio=
n in the commit message.

Regards

Chaitanya


>  #include "intel_hdcp_gsc.h"
>=20
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915)
> --
> 2.25.1

