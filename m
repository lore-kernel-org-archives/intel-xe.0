Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51195C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 18:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063CB10E769;
	Thu, 17 Sep 2026 18:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnW7KZlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC9310E517;
 Thu, 17 Sep 2026 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789670547; x=1821206547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rOrp8dtqc2qvi2FQCOv9gguXyJGqG7OlrMMjWsfl8n4=;
 b=lnW7KZlNjWFB5UMqGXcryd9IrSrEw+rKHOjk8NYuZgG3vSPf8y3SOipJ
 h5ur4idRC7nPZnvyj9p3y9fEt2dmINJ1pXl1iwtXiiZ0piCkbmOpaDZ6u
 rI/bXqN9uh9jU1zRDhQVglnR1NKOs14FmmHthiLaeB/td8995omR5B96m
 QS1QuHbfXKuDyg7CpdrgPIarujPFEGgUggOPmEDeYV09VQNXvUQ/OwvnB
 tuHgVjDbUyb+vtfg6amugCDHZFHCa0LAvoC6/1HNH4yvFpegQ6x02iWPv
 0xTPgng8+Fdsi8JSygd4xAj2WuV+D32zd+0lriM3KWqqTlD38zjtLCB8d A==;
X-CSE-ConnectionGUID: exkFzZjXRIONq4FWudv8Xw==
X-CSE-MsgGUID: QmPp84TETze5j6E5ngn0ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="637494"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="637494"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 11:42:26 -0700
X-CSE-ConnectionGUID: eYl5cznoT/2nwvPMX+Actg==
X-CSE-MsgGUID: 0d2pa/V4QkaIXb4r3BWVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269678336"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 11:42:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:42:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 11:42:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:42:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1147cKgXGluXsmVDuLbM54kjrqQqAs/UEtOGYjOgF6amOtbPjfz0882n26YrSIL0uYAjvHSw3ht34KoK8FLRwYLNSKwM+LEsmPvSmrrbhB7jUeMgsPlJSQvTB2sbMgYNWOe1OoIx9pi0lVCN4YO64T9XfFKbOAMD7lQZPnL2TAqeJExPx0OqmdrqgdntKh14Zih7mGzOm1w2mQihjuzwhDR9As+h6BWhxG3hyp0MHLlZaE+IYieJFw41JGEFDWnXnN8HWQYKI/TfIKTx6jPIZxZ4MzAkeiLLG6dV0RT9La23lAniuXl/0XgjhJHyhe6y+sScW1delMO1ZO48QsrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5LnXFRJ4qs+Xaz5vVU9WUNNMYUoMuBeHbQ6e+tfjSo=;
 b=vM6bSS6M2cy4UH6H6Xc4vWK5kGyf4PDhZ7tR1xOElEuJHDeOL3rrOXLCBoF58fhgMJZKLq5q8KhReCnVZ4IQHVCau7S1L/bLRq+Z4CuOgQ+9DPPmTdRa7/EXqaQcsOSZZ6hpp77ljpbvEs8B3XOtE7nRrXFuSxYkOKBZ1+VJx3PVYrwmhMCYUbOm4AJiFvzMd2F2iPbvQJgSUU5qlI71N0O3tycGp2Ho0j1CyR88E0PUBg16k/KwQWDgcbazrldLZdagO00px/EJKyDysZEfIGfGBM8MbncC9SKxH6+tDcGRcRRuXtBUjLFdEpwXHy6YGDGBrkPoz+VEoJTdwzP65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:42:22 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 18:42:21 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load address
Thread-Topic: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load
 address
Thread-Index: AQHdPu0DibLpWLqy5E6m/WIPKlXwyLbTITDg
Date: Thu, 17 Sep 2026 18:42:21 +0000
Message-ID: <IA1PR11MB63481933CAA623068BDE2B54B2B82@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907171856.1484854-5-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260907171856.1484854-5-dibin.moolakadan.subrahmanian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DS0PR11MB6423:EE_
x-ms-office365-filtering-correlation-id: f4036b8d-f3c5-4029-d5bb-08df14eb68cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: LuakHqnHn/UbMyV/4Nn7IagXW7RPMyDG63uMJMKSq7qzDDTmq1mJ3kLpB4JI4UgW4+lvr0Fms5uWXHUJIdTbm2gJPLz9BnNVStqsV7JIutMZjcmivuBDX7Ybb9uNZ8WNfs/WFxqfzcfXHNnt0roNiQv6z2qR4c3u9S3KPutDHkSKcQNUsNEaXi5CO/ips+8PfALfNjuZTADZXM9yhuKo/e468oZEkeylIJw8aBN260h9Up7K9tlyNj52x0bYfQhOw3lZcFh4kMb586EMUQKX0fSdhP0mAwAE1Eta5eKgCHTXCyREUZ0cv33KitA6DDNijMgRrpBwI0CX96WxSGGYa/BimzRMZFx+s50j4k2rhwy1eVRPD0PlUG2yxWD6cc69oFIQqYmvB+i0BSCMGBQXqo448nfVSWW/HtQJ42i7LUMlkUywZsBM/dXF2U+9o0YwtNVth7OrjzGfMidJfBpGf9DIF8gzORMvnqYOOi1pODuH9urFizxaGPrvlel+oEhx4BwNeQeRB+n295kh65oZlnnoEwNK7gQOqoLtuKTxgcM6jh/3GJ+m4epvBREusk7c8/4qJ81gG9lpHOjpkFvp8NzpsfNIaD3A4i7TFJ6Ox5oqicLrvCFneBhxoSZx1MGSL6XsPN35eQ0EvvvPB8YJFOsf9mRqiZPp/xHpl4WlfUTrGXAHz/NMAZkUKfPW8+wtsp0JpTvsVZwYb8NGcNNO5/09zNrf0rbLTQOo4q/zrKo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r126Xbh6XErgpLSbHpsJo9rd7dPk4sANUl5h2gY4fLf7d4bYqsbcJPZ+pO/3?=
 =?us-ascii?Q?ocZlnJ4HVusZJcHTYEvHsNhvZmRFyKFhI6YWyct+xPPCaJW1XMOtT0AV4Qce?=
 =?us-ascii?Q?gXmKqWeI+kncFG3yD9WtSNCCEzHit76K256BoO7oeUbTbwX5XziUnK3u5brO?=
 =?us-ascii?Q?gJwwZD38z3rW41OMSC+MEz7cYXU1s62fgevSn5DVHIylHaBBqmRNqJQGP8vR?=
 =?us-ascii?Q?v3d/RbSQOljxbeUe9kO/bhm4DCt2K6sPlA3wonSXQUAN7/w/R9uBi6cjgMoX?=
 =?us-ascii?Q?PEsA4sVnUElhTKsXjrrIXfcv/ASnGrbb781tt7j/Kn0c9GQRGRWujAm1IPP7?=
 =?us-ascii?Q?+Yz0RgvJGa6CUNPvgf4OCDfAXAxrFKz1Fxn3/dKapF3d/8nzCohOEOELZo2K?=
 =?us-ascii?Q?lDTjWPoULgFrOwTd9bJJw6CDMzbty81RWieQGHK9W1lr/MU/FGBy1tsVPg0E?=
 =?us-ascii?Q?D9bDt3IyXaH2A4//+F/EKjGb+LiO2Ap5D4GzVz26/wxV2rzQyb0/3U62AxxA?=
 =?us-ascii?Q?uLUNPITgsuMla1adpZ1++CUS4diO/FHOusr2IQUB7SO3MXLfFA1QA6mujTXc?=
 =?us-ascii?Q?LjU2ckCeF+tqaeSqeDKF8oQQYwhk/6Y5bgZLtTReNQEddq3V2bqKLQo59eCn?=
 =?us-ascii?Q?skJYZlbPRUKnTo2PmBiCEdTIEnUB2zna0BIazIwEF5g7PyIbPmuTAGxzOrH3?=
 =?us-ascii?Q?C9tnU0oan8/oEoI5eUAmbZlmdiZjO9eVAoGieuf4V4/WGCoXqlvUbxT5i1H6?=
 =?us-ascii?Q?EbfvAGOSlFOkUC2jegYlX3qRjN8tUvxKkVBVtm/5fwvwKNiABO3zu0KKIl85?=
 =?us-ascii?Q?Z6WSqlGXioiuoaCX/ETDAb2/mrVGU3esOUIhkOHoAwUaVIaWZSVBtSLV8L9n?=
 =?us-ascii?Q?Ngbp7ElDg4e9ZDcvONzNk8wOj/UGvFitxvcnH09Sn4pw+NTAluN/liM7LUIr?=
 =?us-ascii?Q?CG+m4afRWtcdq/430v1Y6ThiybenYrKS4jGmhi5DxiuY+qdOiZT9JKG5XDjQ?=
 =?us-ascii?Q?lysayzqm/H6XNDmG3Fbs7uYB2AprWpAYw8+Qh3WZixTUFl9WbCRu/BeGdmR9?=
 =?us-ascii?Q?MZwRpG4P2/AA4mRpgyq2vCs6Knu5yuhcmUY5yM273b1y8Q19dKf0d5gh7ZpG?=
 =?us-ascii?Q?FIl7lVpUG0deL3/2Qjq54A2YrPAC26D9BHyA+ZEbYhzc+JmS7IuYy79ZQiFZ?=
 =?us-ascii?Q?CJS/d9Sp5IAom6Rxd1DR+FCQP6acLM1kQdx4Y+gFuLLLgZ9TCnlBIx/pKrvi?=
 =?us-ascii?Q?hQLkzrv8m0eA8QwthoHt4qzdfoohJrtuojfHG49KFaIy5FMMedlVBn9p8dr8?=
 =?us-ascii?Q?Joenmh1t7phiNFxJR9ONmU04H5EgKh1110gDoZrjHib8nn/hBk+yhbfGALbc?=
 =?us-ascii?Q?Qoq7slna8F0uhbse8ifJkc1qDCyUnHjicYkY1BEg5W1vbmmciYkbQuh/YChJ?=
 =?us-ascii?Q?tD6d1HlfHMPwW9Bj62kMktsUmI8TrT1z6bkZykBk0La3+Z4dUrTC7LideAzL?=
 =?us-ascii?Q?o9ZEKxC6erD0VGXluxFfzDqjYbm/I+0tvsDzUNrzKMLS3mnWV1UwYzkMxz9O?=
 =?us-ascii?Q?Fut6k2iWRrXI/znYm4qdbj6ILEThwo4Vx0sUasnSK4rtiCl9KwcdgxYBlmNE?=
 =?us-ascii?Q?pFKLDzYJ+cYxKaSaPgNhYf2pm8v8BbmB8NQE29/7NcRWIS8vN2KifgaRs2V8?=
 =?us-ascii?Q?nfVl+Qdr4jRjkknccB3bWf7C4TOPCKL+ayWYqO70kEaIEMjdeKeDjFIUYWeP?=
 =?us-ascii?Q?ej8wj0nMWE8ba4Cd24+JlJMqNDNEsGrqersrxRLZZaPvxtbYNJDB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DxL2FIGR9o6nAdh/k9wwQV4NUrjwiL2qEOQK2nwjrCuJlgpQzUTiEhVS+W4RTiwK/NxJD5sjvrcfKD6fDz/wFK5Z62kYGj0/CWhfowgLURYOzm+fN3Zquq+sUJ68bSEopif4KWhjfdXZfVMts9/a4ZhgoSVTMc3kDOxj0/7pu6Y+K3LPKKyovzSaMzUtKhMvOepLTSXYJL7TRwUQApy5sLsvGOqjMPrQh6XZ/jAnl4nhLuoo0/qOcn9SOkFofULC4NZckRDanu2R5Fql0gv+iTLzutx5fWxFTb+ahsGEBi+wrq/XRKOPhNIU+w8gjMGIFyHRuV6ryZqSipPrDiUQgw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4036b8d-f3c5-4029-d5bb-08df14eb68cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 18:42:21.7382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paeTz6josefxxraLoZKffkcIHZfq8Cl67DnJSoHcA4iLtyV7gC+eq09geYei2AhryZtXck0LMBtOb/hAdBB1Kq22LIeGf1x5kEsXxE+sWTgktjVle8IJtc6lPplvvbhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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
> From: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> Sent: 07 September 2026 22:49
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load addre=
ss
>=20
> For DMC firmware header version 3, the firmware load address is stored in
> dmc_info->start_mmioaddr and later used by dmc_load_program().
>=20
> Unlike the MMIO address table, the firmware load address is not validated=
. Add
> a sanity check to ensure it is within the valid range.
>=20
> BSpec: 69671, 68378
> Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")

if available, please add Closes: <url> (with Reported-by:) to link it.

> Cc: stable@vger.kernel.org
> Assisted-by: Claude-Code:Sonnet-5
> Signed-off-by: Dibin Moolakadan Subrahmanian
> <dibin.moolakadan.subrahmanian@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dmc.c      | 79 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
>  2 files changed, 80 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c
> b/drivers/gpu/drm/i915/display/intel_dmc.c
> index a191eee240d9..051b721a0895 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1023,6 +1023,56 @@ static void dmc_set_fw_offset(struct intel_dmc
> *dmc,
>  	}
>  }
>=20
> +/*
> + * Check if the load address is within the valid range for the given DMC=
 ID.
> + */
> +static bool dmc_load_addr_sanity_check(struct intel_dmc *dmc,
> +				       u32 start_addr, u32 payload_size,
> +				       int header_ver, enum intel_dmc_id
> dmc_id) {
> +	struct intel_display *display =3D dmc->display;
> +	u32 start_range, end_range, end_addr;
> +
> +	if (header_ver !=3D 3)
> +		return true;
> +
> +	switch (dmc_id) {
> +	case DMC_FW_MAIN:
> +		start_range =3D DMC_MAIN_PROGRAM_BASE_START;
> +		end_range =3D DMC_MAIN_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEA:
> +		start_range =3D DMC_PIPEA_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEA_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEB:
> +		start_range =3D DMC_PIPEB_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEB_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPEC:
> +		start_range =3D DMC_PIPEC_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPEC_PROGRAM_BASE_END;
> +		break;
> +	case DMC_FW_PIPED:
> +		start_range =3D DMC_PIPED_PROGRAM_BASE_START;
> +		end_range =3D DMC_PIPED_PROGRAM_BASE_END;
> +		break;
> +	default:
> +		drm_warn(display->drm, "Unknown dmc_id %d for load
> address sanity check\n", dmc_id);
> +		return false;

(nit) The switch already covers all five valid enum intel_dmc_id values, an=
d callers only pass validated ids. The default is dead defensive code; retu=
rning false is safe but If the goal is to force a compile-time reminder, co=
nsider using "MISSING_CASE(dmc_id)" for consistency.

> +	}
> +
> +	if (payload_size =3D=3D 0)
> +		end_addr =3D start_addr;

Bounds are computed on payload_size =3D fw_size * 4, which is 32-bit and ca=
n wrap. For fw_size >=3D 0x40000000, payload_size wraps small/zero, so both=
 the max_fw_size cap and dmc_load_addr_sanity_check pass, while dmc_load_pr=
ogram still loops the raw dmc_fw_size and defeating the new check and causi=
ng OOB reads. Please validate fw_size (reject 0 and oversized) before the m=
ultiply.

> +	else if (check_add_overflow(start_addr, payload_size - 1, &end_addr))
> +		return false;
> +
> +	if (start_addr < start_range || end_addr > end_range)
> +		return false;
> +
> +	return true;
> +}
> +
>  static bool dmc_mmio_addr_sanity_check(struct intel_dmc *dmc,
>  				       const u32 *mmioaddr, u32 mmio_count,
>  				       int header_ver, enum intel_dmc_id
> dmc_id) @@ -1125,6 +1175,24 @@ static u32 parse_dmc_fw_header(struct
> intel_dmc *dmc,
>  		return 0;
>  	}
>=20
> +	rem_size -=3D header_len_bytes;
> +
> +	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> +	payload_size =3D dmc_header->fw_size * 4;
> +	if (rem_size < payload_size)
> +		goto error_truncated;
> +
> +	if (payload_size > dmc->max_fw_size) {
> +		drm_err(display->drm, "DMC FW too big (%u bytes)\n",
> payload_size);
> +		return 0;
> +	}
> +
> +	if (!dmc_load_addr_sanity_check(dmc, start_mmioaddr, payload_size,
> +					dmc_header->header_ver, dmc_id)) {
> +		drm_err(display->drm, "DMC %d: firmware has wrong load
> address\n", dmc_id);
> +		return 0;
> +	}
> +
>  	if (!dmc_mmio_addr_sanity_check(dmc, mmioaddr, mmio_count,
>  					dmc_header->header_ver, dmc_id)) {
>  		drm_err(display->drm, "DMC firmware has Wrong MMIO
> Addresses\n"); @@ -1169,17 +1237,6 @@ static u32
> parse_dmc_fw_header(struct intel_dmc *dmc,
>  	dmc_info->mmio_count =3D mmio_count;
>  	dmc_info->start_mmioaddr =3D start_mmioaddr;
>=20
> -	rem_size -=3D header_len_bytes;
> -
> -	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> -	payload_size =3D dmc_header->fw_size * 4;
> -	if (rem_size < payload_size)
> -		goto error_truncated;
> -
> -	if (payload_size > dmc->max_fw_size) {
> -		drm_err(display->drm, "DMC FW too big (%u bytes)\n",
> payload_size);
> -		return 0;
> -	}

(nit) Mention the code motion in the commit message. A single line "move pa=
yload_size computation earlier so the load-address check can use it" would =
save the next reviewer the diff archaeology.

>  	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
>=20
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL); diff --git
> a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> index 6b7978fb8986..324320afad58 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> @@ -521,6 +521,18 @@ enum pipedmc_event_id {
>  #define TGL_PIPE_MMIO_END(dmc_id)	_PICK_EVEN(((dmc_id) - 1),
> _TGL_PIPEA_MMIO_END,\
>  					      _TGL_PIPEB_MMIO_END)
>=20
> +/* For DMC header version v3*/
> +#define DMC_MAIN_PROGRAM_BASE_START	0x80000
> +#define DMC_MAIN_PROGRAM_BASE_END	0x86fff
> +#define DMC_PIPEA_PROGRAM_BASE_START	0x90000
> +#define DMC_PIPEA_PROGRAM_BASE_END	0x96fff
> +#define DMC_PIPEB_PROGRAM_BASE_START	0x98000
> +#define DMC_PIPEB_PROGRAM_BASE_END	0x9efff
> +#define DMC_PIPEC_PROGRAM_BASE_START	0x52000
> +#define DMC_PIPEC_PROGRAM_BASE_END	0x53fff
> +#define DMC_PIPED_PROGRAM_BASE_START	0x59000
> +#define DMC_PIPED_PROGRAM_BASE_END	0x5afff
> +
>  #define SKL_DMC_DC3_DC5_COUNT	_MMIO(0x80030)
>  #define SKL_DMC_DC5_DC6_COUNT	_MMIO(0x8002C)
>  #define BXT_DMC_DC3_DC5_COUNT	_MMIO(0x80038)
> --
> 2.43.0

