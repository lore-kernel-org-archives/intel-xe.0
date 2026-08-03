Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A475DC55162
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 05:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB0510E42F;
	Mon,  3 Aug 2026 05:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPlLngUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FC510E2E9;
 Mon,  3 Aug 2026 05:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734909; x=1817270909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zquNsqAJMZOoSuZjzWWuk5ZYQia43H2COBXk0T/dH6M=;
 b=WPlLngUir4sLP36mXluZVw6xg7wXHscEkd1aLceW3M1HUESysNrRkAso
 MQo5lbDjU9UDro/782S5Zz0gd0w16IDG4qtZ23KU7Sn6uVjsOtYHCKYB3
 ua3MhuX+xYgQz9qgPAucwHVozIBIoz+YbIFM+uoy+gpmL5yJXBdNKt8PL
 mjCKGWl8OXYcAS2ihi1iWBnqI/UzTTCrCs7tz7XGdEczIx6v448b1gXVH
 8g+0dojlas65vUIviupoB4yYpj/nFrJM5d5I4uJ+R5SRpYw/ihnqhPp7u
 6XO9JPgD0DxnFB41bqJLBwskWf9KUYJNwxn1Ov5bho+gYfZgC6sOjPMdj Q==;
X-CSE-ConnectionGUID: Ele0wzMPRVWh8DIO8Ujbvw==
X-CSE-MsgGUID: SjvU4J8dSG68aQ9klM7pHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="90150294"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="90150294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:28:28 -0700
X-CSE-ConnectionGUID: exhCEFR2QNW3im9gf0zmkA==
X-CSE-MsgGUID: rj01glHdSKKr/te2n5khzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="261734698"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:28:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:28:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 2 Aug 2026 22:28:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 2 Aug 2026 22:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApvpuBVv6Iz3p/c8TBAqvgl05wtYfOUjnGCh/eGY1GLZgdWyBtwxFfRMg13thgBfUuJ7gvHcks+/2DPvzVPjdu+zvxT5DE89wlvNjcG/Kmb4bcFVWDdizYKJBmdi3P5wVATVeGAZ5dqfklwb1NoNv3X7ADYNGNuP2UBl9ldHDLe6Hz9HcAhlrF9cbCRYeXEe08TrBFGr3UbhU492JaIlE7U4nDJb6VPPiiyinNy+wQ3SUzBkE2g08BFnaFkt+OXfUAhjIj2HCGs6idPY91HuVVZhTaDwQj/VJgHdienEnhmtQEbk9R4w9Y23fNRsPymSId3kqrymKtwrnf4TJqShNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJerZ+LZhhY/Z4coapueeVmSuPtqkyMW0ueJDsp3w90=;
 b=REuC6SFqkP7VMjMs5W+Kqco9H+B2T3saqfPehaR7E0EvDbejJl77CkL3b/zggkT+ASkophqza2v7RUKBs63n8oWZpcEgve2/7izpiSqO1zr+3TofifDQoOpxZiHljL59Z64Y9ngwPFu9YkQmWq+O3Y4+HNk+6BQf/KSkps5WwDtl29l5Ey0+yJ4Prnz3NSKF2B2Q0rWJjzBA0Gha+dGEUaWpWgR38PgpkS78rAdcweyWlSUN0+gi8uACxFl97y0kpJJZHQG+ER9yfKd6DOJSjAykD53VFmTCexYDeXPijlLeZmj/+xams2pYyU2HX9DAhFHHU5hsugKNi1IDs9Y9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by LV0PR11MB9789.namprd11.prod.outlook.com
 (2603:10b6:408:385::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 05:28:25 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0270.012; Mon, 3 Aug 2026
 05:28:24 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 10/14] drm/i915/hdmi: Add helper to check if DSC chunksize
 fits the sink limits
Thread-Topic: [PATCH 10/14] drm/i915/hdmi: Add helper to check if DSC
 chunksize fits the sink limits
Thread-Index: AQHdIB71Y5cksi2cFk2ddQjpjdp+0LaL0WZg
Date: Mon, 3 Aug 2026 05:28:24 +0000
Message-ID: <DS4PPFE901A304F06DB45DFEB63A3919B32E3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-11-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260730105226.2731341-11-ankit.k.nautiyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|LV0PR11MB9789:EE_
x-ms-office365-filtering-correlation-id: 13fd165c-6d79-4fe6-2db9-08def1200a46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|6133799003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: oTTnHe9FMyWRhz9vpKNR5eIAFJMGvKTNgBQRifJ3eGBevVWUvHtmW7tlYx2pxObrJYNneWvQOVjQheNuIrn+KTEvAsf2Vhw5Sw2tMBU6PIAA8zdqRG7tMeZ7DvI2d3pUahpB/43ZNSnPpQLXTKq0g1sxocPwD93XG7XLJ2ddUPTnld0Cut/arfu+HLnFunR7m3eWqVoTqgupo50ZEIpn+XFV8aooq3ylrbm+Eon14KU2cfEOF956ufXNP2Dg8+VD0ZFYB6vdaRjK5fYZB3+xaZPY5OtIB9yhwGcyYn+D3z+gIjGFf0r3Sa90iJIsBrCeg0+17v8m+HvNeXn3ZoykdPY9+pZpyHkgMLXCLsgN/wte+kr6q4qTBMlBg5gg2GWRhenW1rP/QJ9bj8HzehxpPHiujELIjvszjW9ZGrghYz8Olj+yj6uORgn3jimG3QMuA8/ppZ+aIDaKNow+LhObjLLS1bL6NRynbfNleWtdp+DCQqVhVt+08Xe5e+R5Yf4+70VE18YpxhSv3R2+EzIJ3h5mZfrJjwnCGZ+RT59aJPq6bI9qBiorO206fCEMxipoj1m2hr2kzUDbxUXdO3Fn/FChWf6rRbK7Pn103RooFJhq3DwwoNDPzWL7ce8j8B4YX6sEI4nmoUQ3DPkR0752BYWGthPUTPXNDn+t7uYuw069TgRPFuN8QQm0vlHKzdHo1LMLaC8ZpbkSM7coR6ojSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tHUytHwcLweRDV867SNPvRRUqHPOGHqQ/SqDbPScZCShZTN+GIMEr7whf+5i?=
 =?us-ascii?Q?e3fTrf9ffVm5ChdTU24Zqux1EfTloekMWLPk7yKVi5krWQ3D6K+mPRdf0BM5?=
 =?us-ascii?Q?rpV0CVDg0z6xJsyIKFCSr1WdTNVZfvmwUL2amgD8/0s1uuja/627rejBBH6J?=
 =?us-ascii?Q?6PDAa2VaWunZK/cCT7VZFx7LwGbnqfHNoOY5Pv5i6EdE+mm35FS82YMFs2K9?=
 =?us-ascii?Q?usS9/iYwKmatwB6pbGewSZn5JNm9c4CmYjjCwNMepqxWC24KXRMnhd3/Jj30?=
 =?us-ascii?Q?dKAzpbLkhkZ+i8XXI/OUbDq9amaeiaIHIb8VHj0xaOcqGioXqxc1zXhTTS4w?=
 =?us-ascii?Q?xbJKbMY86lJ1KPrwWAgKMctj0/ow7O+DGCsmp9t9vNeLtj9chhHYYCjUhSBC?=
 =?us-ascii?Q?njRmu6defErnE5Meskd0nqoC3+KGrpri9LHtiEiHFfE/AFihitQYnUEPvLfZ?=
 =?us-ascii?Q?eJwsHGhX+jIT8JHgkiml09NMFnTVpextzUV4xE7e3eSYbJ9kA2afKVEmPQ9M?=
 =?us-ascii?Q?4NjVTE3WR6d2m/f2r0XWrJmOVX36ubyGwCBJUdG7Og+XmlzYzkNRMxFVaRHG?=
 =?us-ascii?Q?GbnCie60bh1h5FJTU9wyB1Qt1+mKOh7WFyHD45I6i09o+6W8R+fYubd30ITz?=
 =?us-ascii?Q?ZxabpMn5pVZuc+hgIuZ1IPZpha9cTmvXxirDgBq5R7c1qyVtP2ODzOV3y8eI?=
 =?us-ascii?Q?JoRpQfiHSu/x9MZ4jio5xeBlqbUbzvbRnQ1UVe99rdCaxjGAwWABX35AD2C2?=
 =?us-ascii?Q?aGWCN8Lom0j1qYbTmBOxEY+j7HuMIuM7OSb0kF10ojQDaWFENNy89vYN0mKv?=
 =?us-ascii?Q?yF81fe0JGdS0ZTwvilBY3doLVjv/FSCfPKbMynO1toyT6I43YRScfpIqaUuT?=
 =?us-ascii?Q?PT7wsFs2O8OnBW20rlNg9zz1OTPs0k8W6OKc1UHABIP8G5u8ZvZv8dEONB8s?=
 =?us-ascii?Q?INcVh/yzF3f+l9N33w9mClpOn/dl0oV4ZsJj+z0dG/XBXQgtHrTDO/zsjQTQ?=
 =?us-ascii?Q?Fc6FCArfbUmkS5L74Ocp/SQFJp4PO6zKiQh7qvRU2Us1o+Pt/hVjih5B7JJu?=
 =?us-ascii?Q?+PcTleNx523yLFLBQM1B7hb6Bd0TdFWYM2AlWjC8e3P2OTLFwdfLYAqueect?=
 =?us-ascii?Q?XMrYKoeCRV7+PGrFXC3L9hj6SgbjVs5uwX/EXcht1ErMHCrc10LJSkLXkpxp?=
 =?us-ascii?Q?xbJ02csaWku4c9Sq+8AAEoMh6mIyCTMtY5P/6pStUhaB7/f3mS9l4PO9xIWm?=
 =?us-ascii?Q?y3kI/gN5U7NF8/j1vcIUfHgKk5P8Ld8SVSZhDccDoTXkKmVemLC4DOIEKs3w?=
 =?us-ascii?Q?CIfASHC2w7Zu10lsL9BX27pn7ROVgbsuBDYAuu4vLh289jnsd5aLA+W+EodQ?=
 =?us-ascii?Q?Tk6KC0k8v4MZLcz6DZR7n897J8xh2K5fZNW6a9a2F+yWCQ4/4TInNGWu6E+2?=
 =?us-ascii?Q?LdcgteFTIGQlY6IxLKqUFMDlKJHdAUZeXoWGh6Q9oYHTaidKfMDQGwnzxBns?=
 =?us-ascii?Q?ZTELSMInpH1TsdazgmYZkqCyAXZh3FfjYkBDffI6lzCI2JcaLtlRvvriYEVo?=
 =?us-ascii?Q?aBbCiPoiCdLfv7zFO0d0+2p1UG6u363mYMUBK7Q8In7Zbmbxw/MiGQv3gztp?=
 =?us-ascii?Q?XYLddLJ5Ds6v2I2h8wEmAHZgITD16D8+V+VHIBTWh9A8k6VQYsWufYwOuyWT?=
 =?us-ascii?Q?IhBAYk3JAkWNXeXo4Z2J/tMg+FF1QvMUtUAYe3/AI5TW6nwJaZhclMlQ2VtF?=
 =?us-ascii?Q?K2v7HYonfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AiCf9xnSfRxmVa7+ELnJEuWeXzmXY7veRbIKnZIxNFHIl0kr7n8hSgxaIYUWM2t2P6xcGX/N4JU57QLRAfL4dlTMLy76RRi1LXR6dv4MhfWTpy63nME7ioPU1joYqq5wTPIdHd0j4Nu+5Rvpb91j3oANcJLN6ZT/Yc22t17sh+PibFQNSRcce84tNhC08Y1Kmq6YGN7c3tZzJVuCtotqL1E2cHmmOmn91DHB/18BCxfpyl+A3AOkewblwXADrspApLYN8LumaGl5vLZurGGfb+BIrQCBVzbu0Wcc6K92SnXK4rV7MLHPGNwGe2Tg5kmzxQtZEUz5Kb3S8KGB0dqQpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fd165c-6d79-4fe6-2db9-08def1200a46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 05:28:24.6764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUHH7z6ivaDxbbt6qhdX1US96bXoW1h+SbJctdfI+AA27hlWKxHkO27ZXcp1AnnGicnIyjo5SXhRjN8GCXcjOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9789
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


> Subject: [PATCH 10/14] drm/i915/hdmi: Add helper to check if DSC chunksiz=
e
> fits the sink limits
>=20
> Introduce the helper intel_hdmi_dsc_bpp_fits_chunk_bytes() to check wheth=
er
> the chunksize computed for the given slice configuration is with in the s=
ink's
> max chunksize limits.
>=20
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 25 ++++++++++++++++++++---
> drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
>  2 files changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
> b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index c58c9202fc10..c26a3d0b2d2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3370,11 +3370,30 @@ intel_hdmi_dsc_get_min_max_bpp(enum
> intel_output_format output_format, u8 bpc,
>  		*max_dsc_bpp =3D min(*max_dsc_bpp, 12);  }
>=20
> +/*
> + * intel_hdmi_dsc_bpp_fits_chunk_bytes - check if a given compressed
> +bpp keeps
> + * the per-scanline chunk size within the sink's max_chunk_bytes limit.
> + *
> + * @bpp: compressed bits per pixel to test
> + * @num_slices: num of slices supported by the source and sink
> + * @slice_width: dsc slice width supported by the source and sink
> + * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by
> +sink
> + *
> + * @return: true if the resulting chunk size fits the sink limit  */
> +bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int
> +slice_width,
> +				    int hdmi_max_chunk_bytes)
> +{
> +	int target_bytes =3D DIV_ROUND_UP((num_slices * slice_width * bpp), 8);
> +
> +	return target_bytes <=3D hdmi_max_chunk_bytes; }
> +
>  static int
>  get_dsc_compressed_bpp(int num_slices, int slice_width, int
> hdmi_max_chunk_bytes,
>  		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
> {
> -	int target_bytes;
>  	bool bpp_found =3D false;
>  	int bpp_decrement_x16;
>  	int bpp_target;
> @@ -3409,8 +3428,8 @@ get_dsc_compressed_bpp(int num_slices, int
> slice_width, int hdmi_max_chunk_bytes
>  		int bpp;
>=20
>  		bpp =3D DIV_ROUND_UP(bpp_target_x16, 16);
> -		target_bytes =3D DIV_ROUND_UP((num_slices * slice_width *
> bpp), 8);
> -		if (target_bytes <=3D hdmi_max_chunk_bytes) {
> +		if (intel_hdmi_dsc_bpp_fits_chunk_bytes(bpp, num_slices,
> slice_width,
> +
> 	hdmi_max_chunk_bytes)) {
>  			bpp_found =3D true;
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
> b/drivers/gpu/drm/i915/display/intel_hdmi.h
> index dc81a62aac5e..e7d0cd5bc293 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
> @@ -59,6 +59,8 @@ int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
> slice_width,
>  			   int bpc, bool hdmi_all_bpp, int
> hdmi_max_chunk_bytes);  void intel_hdmi_dsc_get_min_max_bpp(enum
> intel_output_format output_format, u8 bpc,
>  				    bool hdmi_all_bpp, int *min_dsc_bpp, int
> *max_dsc_bpp);
> +bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int
> slice_width,
> +					 int hdmi_max_chunk_bytes);
>  int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
>  				  enum intel_output_format output_format,
>  				  int src_max_slices, int src_max_slice_width,
> --
> 2.50.1

