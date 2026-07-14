Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F357CC4450B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 20:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D7710E256;
	Tue, 14 Jul 2026 20:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeenRkbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C6F10E256
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784062712; x=1815598712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uFIJDExAwDhottuJqkwgXhnV9/j4XvBT+2QcLlDYSX8=;
 b=UeenRkbDkd5Zs+SpCO99vWWzkiOU2qDXJPx1rSm4RsPpGe5GIZDBnj4B
 wj24tY0M1EjvKR0JN/bCRgmWaqGV67XJXleywkSFeDuhQOSDBfUSV70lG
 1p6+n+PbrAcL+cJ1QOsM6Iu/UZB9nWShIHMFXKPwyvpj1xw/clXiFm47x
 6J2+5wQPY7UjPfkIqg3nVInyMYIPl/zABs14HjXOjDnqIoRNAle++izNu
 HFlAudpsKaMWyCskOwEgC/jboYYpwXZcQFrovShzyljArKmMOZO/Ax58p
 IjRmb19NxSRvX27aIVlfZdNk/n8AlzlevkLFebEuQJs6fLwZVXyGyIRW8 w==;
X-CSE-ConnectionGUID: tu2WSKH3RjGkZCNxjlhzGQ==
X-CSE-MsgGUID: Lx28ud+UR8mVxKD9drP0xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84576671"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84576671"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:58:32 -0700
X-CSE-ConnectionGUID: a/aZA22OQni4GWKzbnOqfg==
X-CSE-MsgGUID: WHhIGIHlQP+3lLqQjtYJ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="253351248"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 13:58:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 13:58:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 13:58:31 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 13:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6CiJOklOAOvBhAL3exaNrtCQ6vf+vKnrFfdFGhHu42trQVzM6exx0CH5MMOvNbcOOpGsdsmKL9SIuo3VOzt520e+ZoKt08234gMW6oWvy7X4CAzGMm29/bnYX1cFZgl9Wn96gT8FaLU2H3EQ2uHURkrNzn4s1wcxbPY6LYD/z6uoOSqsFFIi5Knf/jmU2XidsYHHslGFR9Q+ANfuE0V3KQPiFtvSk78jIxOgk5QLgwmLdeVaS2mLnhnUdAcFTypCbnlgQ1AHdeBQ2ZUwBVoijHeClwTrpH9cCuSfWuChs0qqzjvCRAspbzKulOw1NjkMy4RSySyYRFyH3LphtGnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATPyPk28MUr7kzwLAKq0hoEe5voog4yDmT7//fbXPqA=;
 b=L+gI+OWUVyBKK90SW88eKFF2nT5zhPa2ZsGd90IVxxUl+Rktggxnc9AFfGkTtHwiMF66SiEgZo41Pm9qrv3WquxH0a/SDCQERs0hP9KuKbXO0MJVKZNrVvrZNNQ936Hio6IwUXpsg4bciH1P2cYbSSoflpI3h3pm7ECGZx4TR0gESYAeq6NJUNG1LhOFMszZubuNGTEuHm6jGY45YcRqj/xq/iHV8+wTszWqK8XDtxSL6qDZVy4U2pl3OCoeH3WSmKOXptrVYKUWo+W5hRR8/LXpN4VauDZBlHQH3ipY1Wh8XSTmAu+5UkOoSc25gvhFP2NTyqdDhy7WEZ0CHUYYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 20:58:26 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 20:58:26 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
Thread-Topic: [PATCH] drm/xe/wopcm: fix WOPCM size for LNL+
Thread-Index: AQHdExWJYVP0ey5jQE6hUcLR9c82O7ZtVVrQ
Date: Tue, 14 Jul 2026 20:58:26 +0000
Message-ID: <DM4PR11MB5456397EC19AD088168820DDEAF92@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260713221758.3285744-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260713221758.3285744-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB8859:EE_
x-ms-office365-filtering-correlation-id: cf062da1-f696-46d7-dd19-08dee1eaa689
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: vlihTOkDvVTVLcBR8xQq71CIEIpqKDvs/zSNFG2Nf/IL8PoFZQd1+sZ81VDkttwelPyaBnvnqjEIh8hqh42Y1dHKb2GfxcWvbaMvlFRIBpRdbYoJwVeI8B6syNd22lRewjoeZY57IivTXqaWfsVRHr5arbHeKGU93rv91w9q6P8dweL8qOLVM4P8/Ie/NiG5CKh4tflEBJie9FtQUcZnISmY7Wb0IXloRs/rAJv8fTeX1OVetiF11yLz/Xo2GpAVB2zu+JbMfs7L51wclRt9OEQmtZJlqidRc2ox/aqPWhv9GDXmxLE4r8pWlQTOwP8gZy6hMEMH1jIh9rYMwHgxp0IMifuHvRLUZHUN3PRMED6QB8afwhtSxJlnqHhpUvhSFgLthAo/9Uq58m+sL/R/Z0kaYCxyuCmwtWzUR9zozXV/vtLcWzty5fdgkTklsscYJ5nUqFVZXLSFmjZQ+nT8Hdi4mV+60l8LmKXHm2nBlrhqPCR75TYPcPFlX8ka3QJKRSY5E+IeArnDzmjEvhHwkRD7gbnjVayTVzz+uRtcOWns6D+SmwR/3nbF21VDlDio0LEkKM34TNcIYpeXE2zxaqhTTKdTndGAJSUO1s79YLfRS6WrpDVlpaSqDZrdv/ul9/RBEEOuPwGxWhHFAPGiLxpGHFlCtipOoRV71e7DmCwz5ihRvMnUdGPP9RDwMFmzb9MDb6F9ruUQMiokXiypyQQnz7JNBw0QdidWjVmDoxY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0U9Gd8QW8qSRxmsjjSBQJjQ1eHFm+IPUsg25suHzrdvEU0ZRFnNBVp2/DY++?=
 =?us-ascii?Q?+9/nyZKm46jJRjgY1GO7FiOuoK0weVyFUxATDRPPwyj+uc4eOoRulfEDo19h?=
 =?us-ascii?Q?eyGPgW5WzgLv0/i1rB9PSzNvaSliSaaf17oEmQlmGWBukDtfGEb5/vO+8ng6?=
 =?us-ascii?Q?NTWhFyo2yb9goLggBLdus6gZ9eoE53KLMFA2KjMMPoL7n5m/VSyIEAYUiJyM?=
 =?us-ascii?Q?sf1iM8fKsMnDyKQ2P0zt09owe3I1cNgx4l+b4R3rRE0TEXlIPptx32TbDGhV?=
 =?us-ascii?Q?OQgHhGHRCr12n4yMnmHB1nzeSq0cFg5JgPHQip1cP3RCti6jdmm2aUFOYY+q?=
 =?us-ascii?Q?0aLk8PWNVXaSrvxzMMSiAVbp+VVVuNSRxYPvcNXwdfYbD1Hzj6GTs5rto0/8?=
 =?us-ascii?Q?FBr4/sA65ElEGOVpWQanbVAkJnPZaTsYXuanr3eDepd0RLHY6d+F03KF5eoc?=
 =?us-ascii?Q?FPxr1owc/591C+UDux9WJFdPd3k1JS39V8WL0bEpplnFwG+aGUvqBLAMm2VN?=
 =?us-ascii?Q?VrVvQQquZHX+MXSZoDbX8I6Z+UsBVRgo+Uck1jUd4AuRxTYO3cOILPPYTBzI?=
 =?us-ascii?Q?lCEds+GzP1ydSHZHPlCDrtqLgUldJ+Wx19M54IBO7b5PgiqrYEvFT6q2J//U?=
 =?us-ascii?Q?SovboRD+ga4E9mLVCgNKATdD8tc34qpRXWOoyHHcGPetwrRLEtIyJ1t9UvHZ?=
 =?us-ascii?Q?OtLCk55I4Hh/nNtJwO9aszstAwilGo2SpSw3eYqEdvTF6V1xTPCNdoxP2VRt?=
 =?us-ascii?Q?g5d1jv0D1Cfxoc1ILRquvjCvFHCSbTLTCap8OTGFqGLgAP3M7S2sxWXC3ry/?=
 =?us-ascii?Q?l5rKKUvf8mWwfyJN2PqYPh7eseoTJtxbvKk4b1iRSRR5WFPxcFg2Yi1fMXgf?=
 =?us-ascii?Q?QKLyCkIKnhZt2Eivz+qX/Tv2vCPYBH0cAmmTN3+i4u7NTxRw3lHxyR/wnfCC?=
 =?us-ascii?Q?gbOkbRMP1HcvyXOqkA82mircqMbtO3XYc/fNRibrxUQB4R5HaXNkcN9INSdF?=
 =?us-ascii?Q?ih0dxGJIWK6gtaoZ5g3v6E1yd03W88D8Q7rp3R2jeM3qTkY/mayNG4tKg4y1?=
 =?us-ascii?Q?eVQRr/uCK16waEMLrkY2i8RQNGdwympSymwy9FmbCfemeqBeFagsbMV8N5Y4?=
 =?us-ascii?Q?etG2yuvYMnorG/tKYk/q3vioKsuycphIiUIc94mWFNoUHbnSZfVrOEA4fNXM?=
 =?us-ascii?Q?HcBSEp0Auqqn8Xci0oqzrPcXWPXwEX5n2HmQItSbPRbyRWjFjkirzUU6KRxV?=
 =?us-ascii?Q?/EPJOUVp1UDjA7uTYM9bCLDxYm6HoE1QAVVG+T9sOqIg5xV00N0JhiLqdUXV?=
 =?us-ascii?Q?cI+sC72fVvy8H77lPih5yQGifff3Te/m/4sLWZpG3IO4ujAZ0RJGRNEykSeX?=
 =?us-ascii?Q?Rux4TFaw/P2xjXjUegt4dPyVOXyyM8C9lh2c/vXZCa6aGGWxcw47xBJxo+VY?=
 =?us-ascii?Q?GGRbaFfQCXDjElrz/Wj/SGo4HERHWEfiU8AFTQsBECsVbWF+88zav7lZp1ZG?=
 =?us-ascii?Q?ypULBZVxvJVMMpQ/Sv/vEZv3XcawEcj/sBpVEQWR68RciBHU9topEbp/P8Wc?=
 =?us-ascii?Q?+nrzngd+qBs10YMdD7DOPM7MuAEcEQFtsRs2BgVgWMLlO/BJt6a1MCtyNKrJ?=
 =?us-ascii?Q?sdeiNu+K3JAPnBE8RGGzgcc+bTAJ6cVS9RR8w5Ss8vIErMbGsYoLUJhr9wef?=
 =?us-ascii?Q?Hu4t3Uyiex2T3u/npuUbSVRZbN1P38RRZJDA9GXY+4qrE2xbjtkMttET8MsA?=
 =?us-ascii?Q?Sthc3bJPNw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PgNRR8A5goiwBDz0fXwP3TRcGnwzBUEEWxYSXEzwndv5U0uVe8dBO4rAwqn52buD6kqL81QJUPT9Y79i894w2vvArct9EsgonrdCo+KJyfxIg/pJt1Mgq8svTBdcEok034uiLAMYmelgHyvGEnu7qFnlVV1KU2c5ZNBfU/qCHMWwKpXCWc6vV/2knE8emklO13DtQfV3DG9xAPgyTdcBdUedmx0hJq4GP+GUKyrT5DuzDuVvTHZnH6En4lWP6u754k1YicDfgGmoHtnzIqCVEStED48kA7K2W10L/26gkJrAZ6cWWdjDOST/667jgZPvVwM24O53iKiJxVz0rvD1Sw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf062da1-f696-46d7-dd19-08dee1eaa689
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 20:58:26.5403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4si/T0bsn8G+z4mPnUqPoBtuLgoop6ueHB9P1oXKbGxjO15kPdAnYQuydVtvazO9GaFT+i9ufPQRHEHPVdewPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
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

On Mon, Jul 13, 2026 3:18 PM Daniele Ceraolo Spurio wrote:
> Starting on LNL the WOPCM size is 8MB instead of 4, so we need to avoid
> using the [0, 8MB) range of the GGTT as that can be unaccessible from the
> microcontrollers.
>=20
> Note that the proper long-term fix here is to read the WOPCM size from th=
e
> HW, but that is a more serious rework that would be difficult to backport=
, so
> we can do that as a follow-up.
>=20
> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> I am planning to follow with the proper rework, but I'm still trying to f=
igure out
> some complexities that come in with multi-tile, so I'm sending this on it=
s own
> in the meantime to fix the bug.
> ---
>  drivers/gpu/drm/xe/xe_wopcm.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c
> b/drivers/gpu/drm/xe/xe_wopcm.c index 900daf1d1b1b..fe65ed246775
> 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -49,9 +49,9 @@
>   */
>=20
>  /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> -/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner o=
r later
> */
> +/* FIXME: Larger size require for some platforms, do a proper probe
> +sooner or later */
>  #define DGFX_WOPCM_SIZE			SZ_4M
> -/* FIXME: Larger size require for MTL, do a proper probe sooner or later=
 */
> +#define LNL_WOPCM_SIZE			SZ_8M
>  #define MTL_WOPCM_SIZE			SZ_4M
>  #define WOPCM_SIZE			SZ_2M
>=20
> @@ -179,9 +179,14 @@ static int __wopcm_init_regs(struct xe_device *xe,
> struct xe_gt *gt,
>=20
>  u32 xe_wopcm_size(struct xe_device *xe)  {
> -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> -		xe->info.platform =3D=3D XE_METEORLAKE ? MTL_WOPCM_SIZE :
> -		WOPCM_SIZE;
> +	if (xe->info.platform >=3D XE_LUNARLAKE)
> +		return LNL_WOPCM_SIZE;
> +	else if (IS_DGFX(xe))
> +		return DGFX_WOPCM_SIZE;

With this order, BMG is changed to 8MB also.
I checked BMG's hw register wopcm size, and it does with 8MB wopcm size.
So, the LNL+ apply to both integrated and discrete gfx, is it right?
Thanks.

Shuicheng

> +	else if (xe->info.platform =3D=3D XE_METEORLAKE)
> +		return MTL_WOPCM_SIZE;
> +	else
> +		return WOPCM_SIZE;
>  }
>=20
>  static u32 max_wopcm_size(struct xe_device *xe)
> --
> 2.43.0

