Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D053CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C2F10E777;
	Thu, 25 May 2023 21:44:37 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F013D10E777
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685051075; x=1716587075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QfqZEuNXbo/P/ro1bujpD5LzMypdi1V6BiSWial3ZkA=;
 b=XCs48lL0uFCT9lHUeBGiZIiLZf/KgKO+e1hWAvBB234Q9x/7M9VWD2Wg
 M6uHMBEc1dHzPauBZ3qVOFSjn7XyNIzsEHK+2su29kx/V5FdkjWO2Aamd
 7NWP96IGbmtQpCCCW7izbaQHbDIZmdNWgxusG3h2/brPQhBq+Fh6ABEnG
 1eoFhjeYNQVxckYWRCiJVe3RtKFPdUc4ujgoZt+D4ZjoXmP3tXhtvAUzF
 LAzBIIDSACKMTymolDnAmi0BV3501PjTRLSJwNrL2DkcjwZU0zS54Dm1B
 f8Q8t/WQYYfSzG5h+fgVhO4b09C7XGvmhzuqvdz4nNr8I2NXf8/C2WaR+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="417517901"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="417517901"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699172473"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="699172473"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 14:44:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 14:44:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 14:44:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 14:44:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnkfaH6UVVCNWYN1tTwfh150kIG9sczisAMUOwZUJqzxMTT+YNVbSycGh+dwURZf+Da97xEo+xOffEwI4WslFNJhnALBE00dNPMdCP5uSqsGT50XFHJo0ZScXRBB8ShBDtcne0QGC3x/vAglb1nL+dA+N8NSy7s/JhldCCs5JoVqLU3YR7BzI9pCI/hbKkwDSdM4t5H2vYn9edtu7vblziX/KChlTJ+54malCHHGDL0RUQeXY6J1DKKTvKGDaK+Rq8J5fvrSYWWMtmB5APbeLd27vl/RnU++uvrNJK0jrcG4l2pp8c/EeprxNcolsvU9d4gCZ68hQzfyw+IJ6MH+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/x2XyNkLwNkEj4dCct0CoJX8uyJ7px7MByfoV0p9ag=;
 b=ZXCWxgMSF/5oqqPK1sUW04wvDtj/dUTOyXf/r1BDk4b8r6TS+2CDDXp+9dLUXiYh0ZF0xgloqfZjtpVMKtCX6YIuVNq66k3THDg7ZO4crRmx1Mt8xIxZaKZRImovaaNlXO/g4GYslCj9QR6Vi34jOBHcWrsGWzU9nj5azwugszM7qKAwFGr7VKie/p1mfL8bhDhZkrtGyMbNIy4GL56E4UDCWy8xwULByt2FZIspWO+X9fHUm97LExzlJ47cGDYEYsxf7CAFAiI7mMVe6Sqdm9SdoUk7XjMbwomaQ/8nD870CVgAntirtlJrsOzLWXPlnLOtpVGqX2lZ+UyGvT7o4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 21:44:32 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::dee7:af80:a6b4:da21]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::dee7:af80:a6b4:da21%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 21:44:32 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v2] drm/xe: Apply upper limit to sg element size
Thread-Index: AQHZj0AWlwI3i41sikKmiNPELfba/K9reHsg
Date: Thu, 25 May 2023 21:44:32 +0000
Message-ID: <CY8PR11MB6940CF207AD61605ABB96FBCC3469@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|MN2PR11MB4614:EE_
x-ms-office365-filtering-correlation-id: c9ba8aaa-adb3-4d3f-a12c-08db5d6939b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c9NRvk2grjZiA8DGFGFUpfTAkBN7dPTIsnBc5UhMo7wtnFlK7er2J4w0LSuj/ZKVKDGAilI5sB7ZnzxA86Xd2Y/s533MwKVKj5493ETqyfs2x7hm2P6w5oPHbG7IXmDM3d2//7kPVluVSMgSUmEXCvTA8nwO/bjNiWit7BkIFpzXVvoyfHz6y/lAw8x7Web3wE8s7WpceB/oRf6W4aGmzB+9elreFbcHPqu3Ytk3MjY6jNyClLTu2VrlIVHMYvynEc9IqiwEeT/V1X+9+KH7WkQyDO9smXjYeipylzmjVPVdI0ACTtczEFcdyAEge2C7VY7xTxnCadMdQS+E95lt9rl4dxw0NPZhsgT1LbfFKXsLqL44UWC6YqY3SBFzAWmAnv6yA/lfG6tJSzZb2iTnTNDLbbF988hNiitaX0E6V78MOaehUURvBc5PuyRgk1kxZjmEjcfwlDj2JKw6auQy4nN8F5b9OvqDxKxSL41+mdtbOgsjnzNx0YR5jlYY4ue51k1VN/8+atm8BrTHAscMc4NE/J4chbfUbbFbW3AWrMI5kCjuKW+1jiKwxxuLob0zTuYI4c+t3qfB1+Xz8FHnE1mep7WCv5AS9z0eEpzXdp05IebM0NM0v/BvQVp20KX9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199021)(76116006)(66446008)(64756008)(66476007)(4326008)(66946007)(26005)(53546011)(66556008)(186003)(6506007)(9686003)(33656002)(110136005)(316002)(54906003)(478600001)(71200400001)(83380400001)(38070700005)(7696005)(41300700001)(122000001)(107886003)(8676002)(2906002)(86362001)(8936002)(82960400001)(5660300002)(52536014)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VbhExagcSiBjGrShcHc7hDR/tWCEi8drCcxcY1sdOtFx97INkyAjXKpuibKW?=
 =?us-ascii?Q?jBKf3Lllkk7Wpm+Tsg4+7xv4aQho/mWOQ4QI6lTghceRDeeIgF39ADCNMYrp?=
 =?us-ascii?Q?nJ5q/DSWoeJjN0s7clpy0GGa8SGvdFn/OvjfhQxG/peS6soIx4J8144J39Xf?=
 =?us-ascii?Q?SclI5ubwD3uDuG0Uxt/WXTrlLN9IY8bxlub973DxLK9rkgBZuXx3LFQIo8VM?=
 =?us-ascii?Q?DWvohNaXwT5OsDEHNTQMOX2zvWmhy0buw3thOnApCe4bgZq4KtZfpZKyzXvK?=
 =?us-ascii?Q?ABPrbpE2pA2UIvbi4ytXmpcpRbMuztBX5XIZvexIStCu0mc3ZU7O2BP8lxTl?=
 =?us-ascii?Q?Tr94FoIatt8ybrDZiLqWcXJIRza6Z7jAoozgwd0aAgGEiLcKQZf9C+vwBeGF?=
 =?us-ascii?Q?6v8Pss6LbiBbN1V3GwPqpYsZS4tBBTiRCzbx/+R/Kw5kxQhcDDvWWoB2v+Al?=
 =?us-ascii?Q?r5pA56OAKMXzZmifZUZicsbSgXIM19WLgtfOAQb1aSV42qOv7vA7eddyDUSh?=
 =?us-ascii?Q?aY7dwcLK3FNO7KVdadAKU2gTmaDKstmqdAlL1tapGXKZ77MqcdyFJFZ5CooH?=
 =?us-ascii?Q?upkNulK7/RdkGEbwi/4K9pDobkkceZXhbj8KP9Cuk3DYrUPMxjU2NgV/fQn9?=
 =?us-ascii?Q?9ixV/CjOWOvsvS/L/8YP7X9wzOrOeXicu5c5UJXNg6XPnecEDBoo0xsLDDD1?=
 =?us-ascii?Q?8sLo5KkOr14oujYLvkDMPg/7FspjjZDvUlvDNGLiPf0sxSMZAzOzJqbD1P84?=
 =?us-ascii?Q?tLY2A0wwnbbS9vx3dEyD+qCzbYAqy/P5v3t6hgEhOmEM4B5jAJ7wcX/ShD5S?=
 =?us-ascii?Q?LRQZjPPGLEythI0h8KdAdFRsSUAUsgR2mEphKGCahCAGPWLmcXIP6JHx1rO5?=
 =?us-ascii?Q?ll9ICfsFVfrDykkaG1WdtnzC2RQJUybc7DWE85s3QBbOCr4grv2Y5oPpzjQm?=
 =?us-ascii?Q?HseM7xQ7gaDkvDWCAjOG8wnJuh1KarUECPKDj4IU+1JXiBEYraLurPIrOuqQ?=
 =?us-ascii?Q?y1aEmrEu6O5MnEBJfsgjrdxJ10Ksa2GXEjT9MQHdEZUNrCcxFaOVBGABCmn3?=
 =?us-ascii?Q?XDTzB1tHRPl4nldeEWZ0sVzn8yzICs6uy8g7Em5Z7DTSl+hrzW9wXseurpyP?=
 =?us-ascii?Q?pcGZVzqGpD0265EWv0kS/p/x36vGljV4F9GUUUtKBIAelipULl1VZSId+el1?=
 =?us-ascii?Q?Q2R2VBGv2cp1U/VZAyexs9/ngT75411HvsqrrII2VeLPq1KMk2roCWWxq38H?=
 =?us-ascii?Q?IJDpUec3KTSRPO1z1TolPmDnAlL8EtByoA9QXMmBFvOQyb4klJNSwER3J6Tx?=
 =?us-ascii?Q?Ur9GNrw1pz7OkLVQCfNibF72YSnkE3qoM+RlEcqUh2sjUyeaNpUZB3ZLn14V?=
 =?us-ascii?Q?Nwa4oSXwree4REF0XL8Q+sP8yp2ZmrQttoTHSdfo1A9Ygj99MYG3+N8quzpg?=
 =?us-ascii?Q?Ra+ckZ+YSw6vlEr3lcEL3UKvLNmNbdjZ3ehB43AWBQVeyRCTMyNLb+BLTL5b?=
 =?us-ascii?Q?jIc5RPYQjjTZLLktO0zhEvcCO7eHnTSraHpG3+QRuKtbxdhT2PqKvrakbTVB?=
 =?us-ascii?Q?k9qidCTlzXWRYZvZssl19TErwVsNBc4ckBuZF87K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ba8aaa-adb3-4d3f-a12c-08db5d6939b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 21:44:32.4078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waTd288sdMlOv9WOZn5UT4C2aSePoo2G0UsDrkQcTMZfq3kT0an+y1474DoYoQpYx5ZVqtEiH1NQ9e+BiB2flcHWsnbA+36bExK4gNdjo4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Apply upper limit to sg element
 size
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
Cc: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With dma_set_max_seg_size, this seems a more complete solution, thanks for =
the explanation!

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com

> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Thursday, May 25, 2023 12:35 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Chang, Yu bruce
> <yu.bruce.chang@intel.com>
> Subject: [PATCH v2] drm/xe: Apply upper limit to sg element size
>=20
> The iommu_dma_map_sg() function ensures iova allocation doesn't cross
> dma segment boundary. It does so by padding some sg elements.
> This can cause overflow, ending up with sg->length being set to 0.
> Avoid this by halving the maximum segment size (rounded down to
> PAGE_SIZE).
>=20
> Specify maximum segment size for sg elements by using
> sg_alloc_table_from_pages_segment() to allocate sg_table.
>=20
> v2: Use correct max segment size in dma_set_max_seg_size() call
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c   |  8 +++++---
>  drivers/gpu/drm/xe/xe_bo.h   | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_mmio.c |  7 ++-----
>  drivers/gpu/drm/xe/xe_vm.c   |  8 +++++---
>  4 files changed, 33 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c82e995df779..21c5aca424dd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>  	if (xe_tt->sg)
>  		return 0;
>=20
> -	ret =3D sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
> num_pages,
> -					0, (u64)num_pages << PAGE_SHIFT,
> -					GFP_KERNEL);
> +	ret =3D sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
> +						num_pages, 0,
> +						(u64)num_pages <<
> PAGE_SHIFT,
> +						xe_sg_segment_size(xe_tt-
> >dev),
> +						GFP_KERNEL);
>  	if (ret)
>  		return ret;
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7e111332c35a..a1c51cc0ac3c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
> *deferred);
>=20
>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>=20
> +/*
> + * xe_sg_segment_size() - Provides upper limit for sg segment size.
> + * @dev: device pointer
> + *
> + * Returns the maximum segment size for the 'struct scatterlist'
> + * elements.
> + */
> +static inline unsigned int xe_sg_segment_size(struct device *dev) {
> +	size_t max =3D min_t(size_t, UINT_MAX,
> dma_max_mapping_size(dev));
> +
> +	/*
> +	 * The iommu_dma_map_sg() function ensures iova allocation
> doesn't
> +	 * cross dma segment boundary. It does so by padding some sg
> elements.
> +	 * This can cause overflow, ending up with sg->length being set to 0.
> +	 * Avoid this by ensuring maximum segment size is half of 'max'
> +	 * rounded down to PAGE_SIZE.
> +	 */
> +	return round_down(max / 2, PAGE_SIZE); }
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  /**
>   * xe_bo_is_mem_type - Whether the bo currently resides in the given dif=
f -
> -git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index c7fbb1cc1f64..4c270a07136e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -11,6 +11,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -26,11 +27,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	unsigned int mask_size =3D xe->info.dma_mask_size;
>  	int err;
>=20
> -	/*
> -	 * We don't have a max segment size, so set it to the max so sg's
> -	 * debugging layer doesn't complain
> -	 */
> -	dma_set_max_seg_size(xe->drm.dev, UINT_MAX);
> +	dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe-
> >drm.dev));
>=20
>  	err =3D dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..4d9c8de8b348 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma
> *vma)
>  	if (ret)
>  		goto out;
>=20
> -	ret =3D sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
> -					0, (u64)pinned << PAGE_SHIFT,
> -					GFP_KERNEL);
> +	ret =3D sg_alloc_table_from_pages_segment(&vma->userptr.sgt,
> pages,
> +						pinned, 0,
> +						(u64)pinned << PAGE_SHIFT,
> +						xe_sg_segment_size(xe-
> >drm.dev),
> +						GFP_KERNEL);
>  	if (ret) {
>  		vma->userptr.sg =3D NULL;
>  		goto out;
> --
> 2.21.0.rc0.32.g243a4c7e27

