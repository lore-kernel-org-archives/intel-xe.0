Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F4C83F01
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 12:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC8610E193;
	Thu, 31 Aug 2023 12:20:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C55A10E193
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693484414; x=1725020414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nm8frYEsi0Xc0kNy6jE6VHoXJzpjkenaRkexMQ/9ef8=;
 b=WdOAA1RjMDAuK0fn4j9R0OpL+IA1ZIQfnklKGa2JKUHAA7DwMAaYRVFm
 Dv0L7vVoRZo6SEvLKNlryJPPoJn/mcKM+WAbN5BJIO0eJRsxBcurx/fJ1
 668MTVUQXN+XibAP05dHrlpFxbjXPkoSj04Xm9XCbiR48BCAwmPv0cxhA
 b2UxjjnG9OR05/3Kr7MbdVeWrQc6k72DJ7dp60nAiBBJvYscY6lNhSgKC
 kGs7DDLcY+huqra9POpdQ34hyQ/X2m3qSQDDuMQjn5tZyA3YAAzp1Zuwi
 Jbpq2sGmKhdXjIvFMDMIBTuQSqOWEr1K2u+1xaZR8PEEkQKSp2mAKjiWY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375863654"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="375863654"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 05:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="742652385"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="742652385"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 05:19:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 05:19:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 05:19:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 05:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNJ9OM0T4QrGU1BJ+zLiokpQoU9uKmsycqfWPhQ9ClPhJCt1JcEVJ3/1a4mTSg4iY7d2aPM+A22qpevjblntWHg/3/3AQJ+mtbmgweOJSigWbKxsz5STqVfwrBgvM9AFOaGGZB7cKe269euBQAv6XLJgciNCoAPEtN51ZdD84hDpv/qEgvX4XkiHzPeoGx3yeJnxXdfZB3xIm3RaxkMvDGW82BH9u8k0EKRfbjpDHe+Y1NI1mmuK+KRIJdamRC5WcqKtAiouvcPkKo+BdD75YRpinzkg/jzTjyDsCt3E7QVfPWL4lNR7t4zkUcjzPWjjg3TuPVLwWCto2XSTUBGNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMHs/jiAKQ/JDl7911u59n+TXOkzzeG6kwWKFrdkMTk=;
 b=RGMbKb+UNFoGZ0btue6uNvGLsO74AFZnlFH8q2ogLzBCUIn4nLNyJvxbpWeAjgz98YbrjX0FwIUyM2m7LoJMOIXUz0BRBN1G05X2u2vzcLkQ5s0yyDZWIg6tB1Hobed3qurZGklnyINse8WHb9NLWf8tXJySoIpYprS/zwGq8m6X/WEQ70hRw4tpzpj5pUFWcOUBqJDelvmRYBeIwzWCqvVggln9f7EijnEGUTPAzUCXjViB8dOhO2qInwk4o8KlM6ALiwJxbNLuM4qbqtCYBhSXtqslKDN1jVOAPpBG64Cp0a4Oq395WVdSD6ejkIjs2i/oQUSrBrykR+ze70RAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Thu, 31 Aug
 2023 12:19:27 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:19:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 7/7] drm/xe: Implement fdinfo memory stats printing
Thread-Index: AQHZ2+lUpyr8kf4zBkO5p2HsvsY1x7AEUolw
Date: Thu, 31 Aug 2023 12:19:26 +0000
Message-ID: <SJ1PR11MB620401CCD47F32F0475F3DB081E5A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-8-tejas.upadhyay@intel.com>
In-Reply-To: <20230831090536.2949934-8-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA0PR11MB4592:EE_
x-ms-office365-filtering-correlation-id: 86e972f6-d901-477f-a07e-08dbaa1c84ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FrmUDG0FsKBgytUSHFaTp6XZmYFuAoCC93yoWbaUL+GMNYXVgqUncNwFV2d8JU+WzPUQwCeeTImr10ptN5XJgg8aZPrvfkGBY373t+qG8wV4ZkEMFyrEEXwZlberYvJ80qi8PTRdxHvQaqY0ULF2rzWFuQT2YInqETOPip7Sr9Non30CGNjMLwa4jrvpgcEsx7DXO/WCDktBajZtgN3j4jROCV6vO9tgpe8ICx4oB+fkq0zN0B980YhABSuIJgklW+1IRqaWnw+6HqvIgOenhJ9OwVHNF5QUIjSaoYnK8zyZlhC1M2Q2KEaBdtEPO+bR520rmjnrwWB6YFQKPE7yPZuErYR90bP2QO7cdXFEDJAqM/JeLzJj+FrjUH2h6WvdaMuaf0NF8VEv+QptKH9pYShhz3L+vSXuAF1mv84tIBNq0Z9PHVhz/nyTlLI9ORAMhc3Y4Yg8CzvhDhkfii2F2pDIgwFdiRkl3upyoPIIgS/taykp3dSKd/yrjjMkuR8A1RPPO//3ffOgZVqXfe9UMaEA5Sc5OFe35hHJiacCpty+7dst/XMTCTNeke2naY4URaRZE4Hb0kDMWmI+M86VZMLZLOvBF0vQ/bvNGUku0ChQqNSCf5xqqGAM1SaxjZW3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(9686003)(38100700002)(41300700001)(316002)(38070700005)(82960400001)(8676002)(4326008)(33656002)(2906002)(55016003)(52536014)(86362001)(107886003)(5660300002)(83380400001)(26005)(6916009)(8936002)(71200400001)(66476007)(66556008)(7696005)(66946007)(64756008)(6506007)(66446008)(54906003)(53546011)(478600001)(55236004)(76116006)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H4Tb3TzsjySmxVJPizuencjigLjEqt57RThd7ePFEtQwJ2tXC4ODmtLj+NMt?=
 =?us-ascii?Q?4+9Go2L7ONeCK+D6upcbF4ZcmjQ3mHzrFPPyv66l2MjVb/rUfsWAWmrxV2Z+?=
 =?us-ascii?Q?+L3Ky1IUM2b/EZ2nD04WUxIypHQZqM84UKliXbg6zHA6Z2DmvHd0U9dCiJCt?=
 =?us-ascii?Q?qPecpuENVkrlvuQJH8UMiZV4foESRNRYN7UeSfI1/ERoZ10erHlZAcWMWE0l?=
 =?us-ascii?Q?ggEKQ0kFFBR12gAJlQ6zXGUl/02VSUwHet2W219dQBDRbuPndlgvlOz+NoYu?=
 =?us-ascii?Q?qCEhjtGwh1c4pMEAlZlgaOMr5omeOrxFwHhIsFf33UUtoaFKZo7E2yp2QJtE?=
 =?us-ascii?Q?Z1/36eBguKqZx1DNuQtZfKKYaIvjOkRqGR2DPZydoySFqfGl+6mjE7VPBols?=
 =?us-ascii?Q?T3ncdHLrPJD2a0pFWuUqEOz/srjS6Ts9QYMsaIviQi2Xz2WsKh2SvsTPcNTG?=
 =?us-ascii?Q?XN8MgCY2+usiF0eBOUcwIPA8MoPxOY+iEYcSJzd8IMSbbNDTPaQkLVe1IhKF?=
 =?us-ascii?Q?sQrYGEW9qwmNBiTUysDNnpeEuJLP74s9z2W6YX2lc0PGp+ra3Z5/yiQcNRYi?=
 =?us-ascii?Q?Hd2mD7x3ev6Sw75tmVVlSvYsEa6Zwg2YOeM4Hk7K7lqm97jvclFJut9F/JOf?=
 =?us-ascii?Q?r5PNJF24a5hmR5RBZzuZgTfzRL4H0e2LkbIoHt8aHKIcnjxjhSBlRgOXEQFK?=
 =?us-ascii?Q?Csrio7oUTfI9ctjwsezadAtSgQdvGi5ExfzHktrqoYUVvp5tpjZ2x0RZzbCB?=
 =?us-ascii?Q?AeJyPYFqLALoqX8AuwsHvuuVJ1bTpExByJuzT0BHntc8gQKKRbR7PJUqANKX?=
 =?us-ascii?Q?0s7CGkqmZpo6C8Q3JIp3hCbngP0Y2iOVTazUat4l4KuFo+I9wkiFFM/dblgy?=
 =?us-ascii?Q?yte8gIwQ/qeiR2WxwucwysiVwK5N2Q3+WHp4+/SI0o4Ziri6Yq2Lr1i1+5Eg?=
 =?us-ascii?Q?0zw7gv743uj4eioilsv5dNCG6tl76I2ty/ufIEGY2tlzIZ0daizHtgDaBzw8?=
 =?us-ascii?Q?capSvvP7dumx3/oo9HYEow9E1HU5tBsTVz4wXbjLCyu6SGggcOlTYsmGf5nf?=
 =?us-ascii?Q?U4UG+/bTQH3BRPAOi3TWLfO0uWDdEwpoMS9Mfuu6IVCw+3MHgfezfaZKWYcR?=
 =?us-ascii?Q?uxbVtZiWhG/nJjJRbsm9IM+MzB7O9N/vTnv6bNKv+0qhFVKy0WFYqIY/TQdi?=
 =?us-ascii?Q?QuUzW42REWU4pV+wQ9IEQg5QX+fXk2NL062Ks0rVKkoUlc6uPgwbTU0Ssgov?=
 =?us-ascii?Q?JNj4j462ffJUZFU5lorYMOTpXsPcDKL9sbyiqRw5CTrWegGLvam7PZdCQZpU?=
 =?us-ascii?Q?lcQt490/yzrMHvkUx20bIxuBG4gB21GvbfrHiLp7cUbieNFLFplSDZ8fU6Xm?=
 =?us-ascii?Q?t7gdmBLG+WikoWC6ZLjaGekOvwh3DzN/NSqfqOnWSeO1/QuOCLQGokkHud3H?=
 =?us-ascii?Q?RUh0dP6+9AhYEpg+TmsI6ctViDwARsRPyNi9b8/RswRUy0ZA9+Z5fwlDY4gt?=
 =?us-ascii?Q?+qpa4e0hKctQbXFuMLtOXeJ7317Ts75ZwYwpoUQmuAu4cpA8/3bLOFpIplNX?=
 =?us-ascii?Q?U+Hgh4OPjjfG8e0VZrFpjFoYEbFflzbKUknM2ZkN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e972f6-d901-477f-a07e-08dbaa1c84ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 12:19:26.9679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YAUkdHhmzcqUlS//x4hfITGFTmSLJtHJUXsgFeFsbAEnY4X5zrd3j5ueL7pisaTXWUgfV+W/YOaGaLdhZdRNcmaYQPtP4hLDNSTMeBZ110w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Implement fdinfo memory stats
 printing
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Thursday, August 31, 2023 2:36 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Ghimiray, Himal
> Prasad <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH 7/7] drm/xe: Implement fdinfo memory stats printing
>=20
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
>=20
> To collect the stats we walk the per memory regions object lists and
> accumulate object size into the respective drm_memory_stats categories.
>=20
> Objects with multiple possible placements are reported in multiple region=
s for
> total and shared sizes, while other categories are counted only for the
> currently active region.

This is not true, Initially I added for possible placements but now only co=
unting for current memory region, I will update commit message in next revi=
sion, please ignore last para.

Thanks,
Tejas
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h         |  11 +++
>  drivers/gpu/drm/xe/xe_drm_client.c | 103
> ++++++++++++++++++++++++++++-
>  2 files changed, 113 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h inde=
x
> 0823dda0f31b..538a9ec7f4c3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_BO_H_
>  #define _XE_BO_H_
>=20
> +#include <drm/ttm/ttm_tt.h>
> +
>  #include "xe_bo_types.h"
>  #include "xe_macros.h"
>  #include "xe_vm_types.h"
> @@ -258,6 +260,15 @@ static inline size_t xe_bo_ccs_pages_start(struct
> xe_bo *bo)
>  	return PAGE_ALIGN(bo->ttm.base.size);
>  }
>=20
> +static inline bool xe_bo_has_pages(struct xe_bo *bo) {
> +	if ((bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm)) ||
> +	    xe_bo_is_vram(bo))
> +		return true;
> +
> +	return false;
> +}
> +
>  void __xe_bo_release_dummy(struct kref *kref);
>=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c
> b/drivers/gpu/drm/xe/xe_drm_client.c
> index 00b28a08909f..28b4c8e608f8 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -4,10 +4,12 @@
>   */
>=20
>  #include <drm/drm_print.h>
> +#include <drm/xe_drm.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>=20
> +#include "xe_bo.h"
>  #include "xe_bo_types.h"
>  #include "xe_device_types.h"
>  #include "xe_drm_client.h"
> @@ -110,6 +112,105 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>  	return true;
>  }
>=20
> +static void bo_meminfo(struct xe_bo *bo,
> +		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
> {
> +	u64 sz =3D bo->size;
> +	u32 mem_type;
> +
> +	if (bo->placement.placement)
> +		mem_type =3D bo->placement.placement->mem_type;
> +	else
> +		mem_type =3D XE_PL_TT;
> +
> +	if (bo->ttm.base.handle_count > 1)
> +		stats[mem_type].shared +=3D sz;
> +	else
> +		stats[mem_type].private +=3D sz;
> +
> +	if (xe_bo_has_pages(bo)) {
> +		stats[mem_type].resident +=3D sz;
> +
> +		if (!dma_resv_test_signaled(bo->ttm.base.resv,
> +					    dma_resv_usage_rw(true) |
> +					    DMA_RESV_USAGE_BOOKKEEP))
> +			stats[mem_type].active +=3D sz;
> +		else if (mem_type =3D=3D XE_PL_SYSTEM)
> +			stats[mem_type].purgeable +=3D sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_memory_stats stats[TTM_NUM_MEM_TYPES] =3D {};
> +	struct xe_file *xef =3D file->driver_priv;
> +	struct ttm_device *bdev =3D &xef->xe->ttm;
> +	struct ttm_resource_manager *man;
> +	struct xe_drm_client *client;
> +	struct list_head *pos;
> +	struct xe_bo *bo;
> +	unsigned int id;
> +	char name[16];
> +	u32 mem_type;
> +	int ret =3D 0;
> +
> +	client =3D xef->client;
> +
> +	/* Public objects. */
> +	spin_lock(&file->table_lock);
> +	idr_for_each_entry(&file->object_idr, bo, id)
> +		bo_meminfo(bo, stats);
> +	spin_unlock(&file->table_lock);
> +
> +	/* Internal objects. */
> +	rcu_read_lock();
> +	list_for_each_rcu(pos, &client->bos_list) {
> +		bo =3D xe_bo_get(list_entry(pos, typeof(*bo),
> +					  client_link));
> +		if (!bo)
> +			continue;
> +		bo_meminfo(bo, stats);
> +		xe_bo_put(bo);
> +	}
> +	rcu_read_unlock();
> +	for (mem_type =3D XE_PL_SYSTEM; mem_type <
> TTM_NUM_MEM_TYPES;
> +++mem_type) {
> +
> +		switch (mem_type) {
> +		case XE_PL_SYSTEM:
> +			sprintf(name, "system");
> +			break;
> +		case XE_PL_TT:
> +			sprintf(name, "gtt");
> +			break;
> +		case XE_PL_VRAM0:
> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
> +			break;
> +		case XE_PL_VRAM1:
> +			sprintf(name, "vram%d", mem_type - XE_PL_VRAM0);
> +			break;
> +		case XE_PL_STOLEN:
> +			sprintf(name, "stolen");
> +			break;
> +		default:
> +			ret =3D -EINVAL;
> +			break;
> +		}
> +
> +		if (ret =3D=3D -EINVAL)
> +			continue;
> +
> +		man =3D ttm_manager_type(bdev, mem_type);
> +
> +		if (man) {
> +			drm_print_memory_stats(p,
> +					       &stats[mem_type],
> +					       DRM_GEM_OBJECT_RESIDENT |
> +					       DRM_GEM_OBJECT_PURGEABLE,
> +					       name);
> +		}
> +	}
> +}
> +
>  /**
>   * xe_drm_client_fdinfo() - Callback for fdinfo interface
>   * @p: The drm_printer ptr
> @@ -122,6 +223,6 @@ bool xe_drm_client_remove_bo(struct xe_bo *bo)
>   */
>  void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file) =
 {
> -	/* show_meminfo() will be developed here */
> +	show_meminfo(p, file);
>  }
>  #endif
> --
> 2.25.1

