Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0DBC07E97
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 08:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34C610E81E;
	Fri,  1 Dec 2023 08:41:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3324910E81E
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701420088; x=1732956088;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y1I7cT+67BRC1AdsYFh9l462pkFrPzBCMYc/PEqHVBc=;
 b=h1uB5iRngZZ6CxBDpgm/RN9ZCYmk7Zob3xah2FfmmoV+F+ceABQLXf5e
 wa7TI5Mohy0raFppDp6ws4KFkqF7PCUShy8oRYy4Ujoo2qbKjhloIMcO9
 njEP4xhAXJFuPNP8GmwLf2cc8kXkTyyjPfD4NiuxfUSct+7z8ZDbtuJJM
 9vQeDw7886AORubxInXetsO5NeQCtZwR8UfU6w/Nzuj6wNtioUlj6qDW1
 buzKYlVNFbQLFMs2YobzBWZDhwAjH73iMpRc8UWwo3jRHuzNU1gvQN3uW
 0WDIzIIe3vb7ZpEgjJIE493PQASmdmYuwfnyFVk5IOWhNEKQZzB5urU5p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393198074"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="393198074"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 00:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719426262"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="719426262"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 00:41:19 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:41:18 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 00:41:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 00:41:18 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 00:41:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTKKFal/dT9qrRoXLQgWuntoqFpTwOXcGPzxBXRUBf3oAUFjU/jBtCaIF8gFDwaAKkno/GkNSo7X1knW9XrSndtI78+9pd7o1aT+gseIgI5tJdOXQKic3qqXp1FWsQD5yqv7FPqHGsHjd6xjcNivpQdeNSAVDb1ha5TEsIA7BSsoM0GWGJ5iWvdHaa9bDi+zXTr0BwXelrH02t90a8GFoui6cIQw0RjrU67eQtCyMZBA2ah7Gi6A9XLRHXk0cz6ihanyIs8OHewguOHt4On5tsoQb+bcd1bPkR+eOYFPH49Vf3HqnF4mCO2ILH+AdvM9xv/DCnry/hT4L7+9fVpd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imA0TWFkviJC8aEP2iqmDAC22QueNzvpzLPubSFQGR4=;
 b=Clu9yDRhoSFlLyuFZ9rrioIGRYbabuVdgch5qQddZOSj05LaLE6ZnJ/onpLQu4uYUWeFzajaePY/I43wa7B00FuH/f93AY25Q1/RUSel7VC2LVjQV8pNECCXHmqHUtWyqV0Y1BsX+tFEuEIE7va1TjAicuW+A+4VSm8KbrMPGVCjaShmt+rhUGe6e1EQoPwjgroWaWJurohvTam2hYwaWkqDY4bMu51j3/eMMN8acyBMJ5t4cYSDXJhI6z0eOcAph7GjopvyxKzwcGo3LGBI1loL5pQiS+5IvCgzIgZiwqyt0EH2vd7aLIVCMSwhNxYSwtKh38C7NqgtxtR4Gseu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 08:41:10 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::d720:57b4:c6ef:ddd8%4]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 08:41:10 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v2 1/6] Revert "FIXME: drm/i915/dsb: xe
 changes for dsb"
Thread-Index: AQHaI19l5bbjm0sba0COly0NEtaDZbCUHVtQ
Date: Fri, 1 Dec 2023 08:41:10 +0000
Message-ID: <CY5PR11MB6344C0F8C5BDE7721B3875EAF481A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
 <20231130071407.606176-2-animesh.manna@intel.com>
In-Reply-To: <20231130071407.606176-2-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: 6366f6d4-ecb5-4ca8-8d2e-08dbf24944db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5SGR96avFPl6zikvQr4vcE9HZw+w3z9RdMWsygCiyZAniJi50QurVA1osNjkbt302Qw+j3Q0jgIePRCjOnFiqXLpsCPldx9/NHgwC16TeJHodpKoiU0ikFLcDyavlGBS+WZjJjk/zwNl87iWPSLufq1h/VWdaDlAcm09R4bH3XshwQAOEym9aarOyGXYyPHyIJ7yCPM+juZbHIIFLb/9QR1t8hh+zrEtyPBXYiYFoupM+a6DZa+S5gPErq35NB9N/rXylAnEdKQxGprZ4Zb8LmIZxjrESzPO/XS69z8+j6tCmWTZcyWQQ3RbaOiAzMg2UqrRCfHI7MYn1gNJ9s/JxWJCqXIEnsb561ta7/lrtfpg5zxnb8swR+jEtTOiI2ZEom47fjrQcjqcjxgsgiKNgPFDjblRyTuEcIEt2Q8JkuFfjVpMzOlC08bh14TDr5+jmBee59TWB4EeZ8N/PJXtODLpG8hcsCl49FGL3arijeKXYsC572+Xyy2OMP+F0uMaB0dtOkLwzN8Q+djWoIEsKPSG7sjm4kBYMj9D+o57qE1EnU8dRwdfnRGUH59YsNVNjBcP+sUXuDxk1+7f4HfubKTffO8gnI6x3XFFme0TQEJVHj0oluNzDL8DsrQRolU9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(52536014)(8676002)(8936002)(55016003)(26005)(110136005)(316002)(41300700001)(64756008)(66556008)(76116006)(66446008)(66946007)(66476007)(5660300002)(9686003)(53546011)(6506007)(7696005)(83380400001)(38100700002)(82960400001)(122000001)(86362001)(33656002)(71200400001)(478600001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jXyt56epip6FsxXUOpT2ji8dBiqmL3gunKPdjAEPFWobSdtQjVAmMA5o4F1I?=
 =?us-ascii?Q?Jr26ot5MFQeF0yCgsQUJ3lpk7kh58pQ8mPv6qvxWQC5UgjmzN+POws77enJJ?=
 =?us-ascii?Q?Xwsun/8M22+AxZXVSpFBaDIpKFfrH3AEwj98uRnD1gi3A/Wc+LocGgm62qfY?=
 =?us-ascii?Q?gi6tGeVDCiH5QlUQh9MM/Ojbi/nTw/9hl2G/+aYh0+CpcPgmYTN33XXzWwEU?=
 =?us-ascii?Q?XNo1Z9kMmIMT2w8VMtwB2s3kg6situyBIEqXIlhfTqxy0xixsTfPldo7OtwI?=
 =?us-ascii?Q?SQdlhIZRbNUHQFuH2MGYgIEwmBRujnZINExc3z1sHMRzCpsxBIsmsQKSDbL1?=
 =?us-ascii?Q?0+nZDXDMWrKx+WlKza9FdTfhLcsoT/8Xpd850Z5Znml6iI8AxoX1MkAVEozm?=
 =?us-ascii?Q?VB6iwpC1h6B654Ig6nmqTuTXNwIpVLUmO7Is+PSalZAn8MaInj+7iicwUpgx?=
 =?us-ascii?Q?6stNTsJ2x3hfCpYKPLAvpEvKjW2K4Fa3EfRSJjVudqaDLYnKhGTMNZa4Ab2J?=
 =?us-ascii?Q?j/Of6a8s3ueoaXwT9cZgCZWliTitKRhT9UmcJoGsZM2jGTxjftnioMHLyP8x?=
 =?us-ascii?Q?jcxWhGjHLQGga3QySiyiXGzpEZApVuPRZlTcnhCRG4k6oP1XqSCpz9wcH9gf?=
 =?us-ascii?Q?PZjO09DhJcyFIcPpSFaSxi8Ig5IrNYByxRnMfpaLNlNpobMu5YC7aNaR8Hqi?=
 =?us-ascii?Q?bWnBnpZB3jpl5zqrh4m3DddTYCoyEjT0ascCCUyMBdEMuo+jYtMkkuW/phX+?=
 =?us-ascii?Q?7R/b4TTBOwzPUAk+ACc99GxBZBcor8Yv9DrWzYfng6oYG+68C/ZAjMuxNWO+?=
 =?us-ascii?Q?EYrs6eMPWddjF6y47tr7ZmB3KlobMboXlSOIVQMzyA9guFpRJAzB9inVDDrw?=
 =?us-ascii?Q?lbAe8B4g2UGe4YIc5QfLX7y35OmkLZ+Nq19zXZPy8ZYQbAM/CAQ2GMNBJuoF?=
 =?us-ascii?Q?peCA0jgnY9sC4BGtKkduiQblp6zyz1gRh2AvBkwrJYWATmr4mk6yR6UZxkki?=
 =?us-ascii?Q?dJMpJFahZKGzjybcs2kDwL/e9fO/HcCsvg0gFIb15cv2UBY8e8yNo/CFEu4r?=
 =?us-ascii?Q?aBcUVKT2WY0ql4Mg1hzTbCdMlaQd+ndu71vmS/cssJZ15oJ43RcVQCL1+Iew?=
 =?us-ascii?Q?j+Y1zvinubIyvmVkqyxW7wib1YQ3YaIb2lOlWjzy2xBUngijjAdNS7wu5ZSM?=
 =?us-ascii?Q?obzzMjrtxiffML2RCWIX6im74Vd4tMWq/382uXXHbXNGwRMSdB0rGcg7F+Fv?=
 =?us-ascii?Q?HRJKHkiZUFgdrsMgXmv1o9ur9wqmhrulbimpVAPdHsHav8Ya37hzbPsrW5EC?=
 =?us-ascii?Q?4yWueJaDyaeCmSwDbidFsbcGYaYvpp5asKeI+meLmvA7R4SvCUiV8oPvmi/I?=
 =?us-ascii?Q?IGVLernjgW4ywHkXhF/66l+wQ2YKAJetYwBQdIeh52L04XdaadP6wATVch6m?=
 =?us-ascii?Q?A8mH1FldLSxKNvG9kHvwwnU1322HVe/nn0yxw9gQzBfc9ntlUWtANr9EjLrM?=
 =?us-ascii?Q?ajw1V1HINn00JDx0ylujI+tAexq7euUFNNfgnWCmijFld/N22sxHfvBK1ydv?=
 =?us-ascii?Q?WVWTGl/txoyHW995uYKHnFI2wfDes3yqOC0ybP8B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6366f6d4-ecb5-4ca8-8d2e-08dbf24944db
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 08:41:10.4809 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqP6aAT8zK3zLdFYSKA5t6rcQZakbV5Iv2kPrCvAgG+dV7X2G5cQ2EZLHaaP3Fd3unZLVbDINE2EI/FBRe15Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/6] Revert "FIXME: drm/i915/dsb: xe
 changes for dsb"
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Anim=
esh
> Manna
> Sent: Thursday, November 30, 2023 12:44 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v2 1/6] Revert "FIXME: drm/i915/dsb: xe change=
s for
> dsb"
>=20
> This reverts commit ae96663654bcc3bff12f5c497647df2818e0c1a8.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 117 +++++------------------
>  1 file changed, 24 insertions(+), 93 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c
> b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 796b1b36dc59..3e32aa49b8eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -4,13 +4,7 @@
>   *
>   */
>=20
> -// As with intelde_dpt, this depends on some gem internals, fortunately =
easier to
> fix..
> -#ifdef I915
>  #include "gem/i915_gem_internal.h"
> -#else
> -#include "xe_bo.h"
> -#include "xe_gt.h"
> -#endif
>=20
>  #include "i915_drv.h"
>  #include "i915_irq.h"
> @@ -24,10 +18,6 @@
>  #include "intel_vrr.h"
>  #include "skl_watermark.h"
>=20
> -#ifndef I915
> -#define CACHELINE_BYTES 64
> -#endif
> -
>  struct i915_vma;
>=20
>  enum dsb_id {
> @@ -42,12 +32,8 @@ struct intel_dsb {
>  	enum dsb_id id;
>=20
>  	u32 *cmd_buf;
> -	struct intel_crtc *crtc;
> -#ifdef I915
>  	struct i915_vma *vma;
> -#else
> -	struct xe_bo *obj;
> -#endif
> +	struct intel_crtc *crtc;
>=20
>  	/*
>  	 * maximum number of dwords the buffer will hold.
> @@ -70,42 +56,6 @@ struct intel_dsb {
>  	int dewake_scanline;
>  };
>=20
> -static u32 dsb_ggtt_offset(struct intel_dsb *dsb) -{ -#ifdef I915
> -	return i915_ggtt_offset(dsb->vma);
> -#else
> -	return xe_bo_ggtt_addr(dsb->obj);
> -#endif
> -}
> -
> -static void dsb_write(struct intel_dsb *dsb, u32 idx, u32 val) -{ -#ifde=
f I915
> -	dsb->cmd_buf[idx] =3D val;
> -#else
> -	iosys_map_wr(&dsb->obj->vmap, idx * 4, u32, val);
> -#endif
> -}
> -
> -static u32 dsb_read(struct intel_dsb *dsb, u32 idx) -{ -#ifdef I915
> -	return dsb->cmd_buf[idx];
> -#else
> -	return iosys_map_rd(&dsb->obj->vmap, idx * 4, u32);
> -#endif
> -}
> -
> -static void dsb_memset(struct intel_dsb *dsb, u32 idx, u32 val, u32 sz) =
-{ -#ifdef
> I915
> -	memset(&dsb->cmd_buf[idx], val, sz);
> -#else
> -	iosys_map_memset(&dsb->obj->vmap, idx * 4, val, sz);
> -#endif
> -}
> -
>  /**
>   * DOC: DSB
>   *
> @@ -178,6 +128,8 @@ static bool is_dsb_busy(struct drm_i915_private *i915=
,
> enum pipe pipe,
>=20
>  static void intel_dsb_emit(struct intel_dsb *dsb, u32 ldw, u32 udw)  {
> +	u32 *buf =3D dsb->cmd_buf;
> +
>  	if (!assert_dsb_has_room(dsb))
>  		return;
>=20
> @@ -186,13 +138,14 @@ static void intel_dsb_emit(struct intel_dsb *dsb, u=
32
> ldw, u32 udw)
>=20
>  	dsb->ins_start_offset =3D dsb->free_pos;
>=20
> -	dsb_write(dsb, dsb->free_pos++, ldw);
> -	dsb_write(dsb, dsb->free_pos++, udw);
> +	buf[dsb->free_pos++] =3D ldw;
> +	buf[dsb->free_pos++] =3D udw;
>  }
>=20
>  static bool intel_dsb_prev_ins_is_write(struct intel_dsb *dsb,
>  					u32 opcode, i915_reg_t reg)
>  {
> +	const u32 *buf =3D dsb->cmd_buf;
>  	u32 prev_opcode, prev_reg;
>=20
>  	/*
> @@ -203,8 +156,8 @@ static bool intel_dsb_prev_ins_is_write(struct intel_=
dsb
> *dsb,
>  	if (dsb->free_pos =3D=3D 0)
>  		return false;
>=20
> -	prev_opcode =3D dsb_read(dsb, dsb->ins_start_offset + 1) &
> ~DSB_REG_VALUE_MASK;
> -	prev_reg =3D  dsb_read(dsb, dsb->ins_start_offset + 1) &
> DSB_REG_VALUE_MASK;
> +	prev_opcode =3D buf[dsb->ins_start_offset + 1] &
> ~DSB_REG_VALUE_MASK;
> +	prev_reg =3D buf[dsb->ins_start_offset + 1] & DSB_REG_VALUE_MASK;
>=20
>  	return prev_opcode =3D=3D opcode && prev_reg =3D=3D
> i915_mmio_reg_offset(reg);  } @@ -237,8 +190,6 @@ static bool
> intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb, i915_reg_  voi=
d
> intel_dsb_reg_write(struct intel_dsb *dsb,
>  			 i915_reg_t reg, u32 val)
>  {
> -	u32 old_val;
> -
>  	/*
>  	 * For example the buffer will look like below for 3 dwords for auto
>  	 * increment register:
> @@ -262,30 +213,31 @@ void intel_dsb_reg_write(struct intel_dsb *dsb,
>  			       (DSB_BYTE_EN << DSB_BYTE_EN_SHIFT) |
>  			       i915_mmio_reg_offset(reg));
>  	} else {
> +		u32 *buf =3D dsb->cmd_buf;
> +
>  		if (!assert_dsb_has_room(dsb))
>  			return;
>=20
>  		/* convert to indexed write? */
>  		if (intel_dsb_prev_ins_is_mmio_write(dsb, reg)) {
> -			u32 prev_val =3D dsb_read(dsb, dsb->ins_start_offset + 0);
> +			u32 prev_val =3D buf[dsb->ins_start_offset + 0];
>=20
> -			dsb_write(dsb, dsb->ins_start_offset + 0, 1); /* count */
> -			dsb_write(dsb, dsb->ins_start_offset + 1,
> +			buf[dsb->ins_start_offset + 0] =3D 1; /* count */
> +			buf[dsb->ins_start_offset + 1] =3D
>  				(DSB_OPCODE_INDEXED_WRITE <<
> DSB_OPCODE_SHIFT) |
> -				i915_mmio_reg_offset(reg));
> -			dsb_write(dsb, dsb->ins_start_offset + 2, prev_val);
> +				i915_mmio_reg_offset(reg);
> +			buf[dsb->ins_start_offset + 2] =3D prev_val;
>=20
>  			dsb->free_pos++;
>  		}
>=20
> -		dsb_write(dsb, dsb->free_pos++, val);
> +		buf[dsb->free_pos++] =3D val;
>  		/* Update the count */
> -		old_val =3D dsb_read(dsb, dsb->ins_start_offset);
> -		dsb_write(dsb, dsb->ins_start_offset, old_val + 1);
> +		buf[dsb->ins_start_offset]++;
>=20
>  		/* if number of data words is odd, then the last dword should be
> 0.*/
>  		if (dsb->free_pos & 0x1)
> -			dsb_write(dsb, dsb->free_pos, 0);
> +			buf[dsb->free_pos] =3D 0;
>  	}
>  }
>=20
> @@ -344,7 +296,7 @@ static void intel_dsb_align_tail(struct intel_dsb *ds=
b)
>  	aligned_tail =3D ALIGN(tail, CACHELINE_BYTES);
>=20
>  	if (aligned_tail > tail)
> -		dsb_memset(dsb, dsb->free_pos, 0,
> +		memset(&dsb->cmd_buf[dsb->free_pos], 0,
>  		       aligned_tail - tail);
>=20
>  	dsb->free_pos =3D aligned_tail / 4;
> @@ -406,7 +358,7 @@ static void _intel_dsb_commit(struct intel_dsb *dsb, =
u32
> ctrl,
>  			  ctrl | DSB_ENABLE);
>=20
>  	intel_de_write_fw(dev_priv, DSB_HEAD(pipe, dsb->id),
> -			  dsb_ggtt_offset(dsb));
> +			  i915_ggtt_offset(dsb->vma));
>=20
>  	if (dewake_scanline >=3D 0) {
>  		int diff, hw_dewake_scanline;
> @@ -428,7 +380,7 @@ static void _intel_dsb_commit(struct intel_dsb *dsb, =
u32
> ctrl,
>  	}
>=20
>  	intel_de_write_fw(dev_priv, DSB_TAIL(pipe, dsb->id),
> -			  dsb_ggtt_offset(dsb) + tail);
> +			  i915_ggtt_offset(dsb->vma) + tail);
>  }
>=20
>  /**
> @@ -453,7 +405,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
>  	enum pipe pipe =3D crtc->pipe;
>=20
>  	if (wait_for(!is_dsb_busy(dev_priv, pipe, dsb->id), 1)) {
> -		u32 offset =3D dsb_ggtt_offset(dsb);
> +		u32 offset =3D i915_ggtt_offset(dsb->vma);
>=20
>  		intel_de_write_fw(dev_priv, DSB_CTRL(pipe, dsb->id),
>  				  DSB_ENABLE | DSB_HALT);
> @@ -493,11 +445,10 @@ struct intel_dsb *intel_dsb_prepare(const struct
> intel_crtc_state *crtc_state,
>  	struct drm_i915_gem_object *obj;
>  	intel_wakeref_t wakeref;
>  	struct intel_dsb *dsb;
> -	unsigned int size;
> -#ifdef I915
>  	struct i915_vma *vma;
> +	unsigned int size;
>  	u32 *buf;
> -#endif
> +
>  	if (!HAS_DSB(i915))
>  		return NULL;
>=20
> @@ -510,7 +461,6 @@ struct intel_dsb *intel_dsb_prepare(const struct
> intel_crtc_state *crtc_state,
>  	/* ~1 qword per instruction, full cachelines */
>  	size =3D ALIGN(max_cmds * 8, CACHELINE_BYTES);
>=20
> -#ifdef I915
>  	obj =3D i915_gem_object_create_internal(i915, PAGE_ALIGN(size));
>  	if (IS_ERR(obj))
>  		goto out_put_rpm;
> @@ -533,21 +483,6 @@ struct intel_dsb *intel_dsb_prepare(const struct
> intel_crtc_state *crtc_state,
>  	dsb->vma =3D vma;
>  	dsb->crtc =3D crtc;
>  	dsb->cmd_buf =3D buf;
> -#else
> -	/* ~1 qword per instruction, full cachelines */
> -	size =3D ALIGN(max_cmds * 8, 64);
> -	obj =3D xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
> -				   NULL, PAGE_ALIGN(size),
> -				   ttm_bo_type_kernel,
> -
> XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
> -				   XE_BO_CREATE_GGTT_BIT);
> -	if (IS_ERR(obj)) {
> -		kfree(dsb);
> -		goto out_put_rpm;
> -        }
> -	dsb->obj =3D obj;
> -#endif
> -
>  	dsb->size =3D size / 4; /* in dwords */
>  	dsb->free_pos =3D 0;
>  	dsb->ins_start_offset =3D 0;
> @@ -575,10 +510,6 @@ struct intel_dsb *intel_dsb_prepare(const struct
> intel_crtc_state *crtc_state,
>   */
>  void intel_dsb_cleanup(struct intel_dsb *dsb)  { -#ifdef I915
>  	i915_vma_unpin_and_release(&dsb->vma, I915_VMA_RELEASE_MAP); -
> #else
> -	xe_bo_unpin_map_no_vm(dsb->obj);
> -#endif
>  	kfree(dsb);
>  }
> --
> 2.29.0

