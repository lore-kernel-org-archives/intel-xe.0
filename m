Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC93C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 16:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200DA10E5C2;
	Thu, 10 Aug 2023 16:22:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0A10E5B7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691684524; x=1723220524;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LKRkiNAAKtRQzIWTNZwL1c75S6X3/DyXAfkPeSTXb+M=;
 b=n8xBkzv4hVFg7N02MwLRlD7aJ6PNpnzIh5iz5jpee7fna8kGIOyHIn7/
 Ep9dPxr52/ndnwrKMb4bza77a1Q4OLkuzkRGyeA2EuFQqj91k+KAioxZc
 BNq6JEhQEZk+I1fOrJbO0reR3Yb5Ggbv6JEH5o6yQvBLHArEy07D7uDM6
 2crKQDH+7WYHa+zaJQREEUY7sHm3HBwXUJitnmSOwdmkq4spsR8cUm8Ab
 Y6yoYrdoh/9pbGcy6otMi+JqTbSA8kPAIYQVCvWjO9K9OAH0ukm1ZFgO7
 rlPzVYoW3d7tDfg4+EX75T8pAFoHlUG2hES26v25uIUWTGx5jCW7xraTq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374218552"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="374218552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802279252"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="802279252"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 09:18:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 09:18:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 09:18:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 09:18:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 09:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsGMl272bNu48hAUgIwuPzjc4G1Zi6RsCimAAwW5sJaEyxU/RGLtR/LLwNdep7+FAP1XOak2w02j3t3ZjKFU84/8vgOF1bnx2MFc3G0i+oTkPzxgoNTDxOQc6EWYb+Qh9C1iOYlilE4zGzu1rdsztjlvC+IdroyGfnvgtQ9KiIj+6vazHc0I8xrULIt4eqiSy1UCYxDI8U9FgXoRiwwO2RLOJau0R5b7SbPN4bgtiPPLx2juus2lXIt+GRoSgjOr2bya0EvMzRNXGbRhp27oQs0QcFSq/6m9RyZ0uiTaKf394GnHZ8EIjTPkoyPPXL2TsrpygbLOkkPPx6sUB0DA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98Be7hps9rvsna63LWDmBu7mh2eBbySt2rLIHJOQQXI=;
 b=DpcBEM4eV3SMTq+oQNpPhBIZTMjjn+BiKFmVOmf8LxDFmDVRHYPDYTKXcaGH+rLZIl4VvMSII+9TpgLkSvEWmu/5jypc0/6nyjHp4oE+egebJ645nya2o+wbtBfKi5+0SIF6uETRYNHQT93PfTOml5YkxAJLGQEi0APzDy7jegYu+5XfoliNApJDmsLvr6Y/h9RbBod45g8AHog6HeWpld/z6h+D1P9M7PbYCdIP8eYBiF6me3d+Z7LPx4/A/0CbnBKpreW1R54LCqJR21ABORFayoxLvIbl8qQHbmltNhCdSrEuUDwvIANLSHMyJsSj2NbWvz150f8ecGbF5x1LsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Thu, 10 Aug
 2023 16:18:38 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6652.026; Thu, 10 Aug 2023
 16:18:38 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 1/2] drm/xe: Make xe_mem_region struct
Thread-Index: AQHZy6QHAcf2s9zrq0+NZYWrIdofJK/jtR3w
Date: Thu, 10 Aug 2023 16:18:38 +0000
Message-ID: <IA1PR11MB6418F89D75AB4FACEB051811C113A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230810160815.41423-1-oak.zeng@intel.com>
In-Reply-To: <20230810160815.41423-1-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB4774:EE_
x-ms-office365-filtering-correlation-id: 8ee1ae99-8249-4587-8a11-08db99bd7445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKU3kYPfKmYD9shDammHj3o3zDMe4x8mrlsxO1yBrkFVb6L6Zi8zdjP6Gz6Gr1Lu9Hoi2VodxzTgfgOibP1VwGGBn5HRUtfLvHIrBuRyGlKEe2oaHUsdufGARkOB/Np2F7RTZy9RZq32HlUgTQXv4q+QFGws/bXj1MkDFC4Grkn51Lfl8vKOKIURzZcsV3BcBpFwfVSxN2kT92uV+UGOrpdR/hCgE/sjtOTq9wuDG3z+ejJbwKNCPFrE0u6vY+q7blXkszlvE5utSwJQ4hpedQKpRc+getVmHnt80dK+14iEJSkeig5D5Kh0UvYng29VsT2dcCpAotYtp744rNyeJYHA3cICf3bQOVKND85dEAl8dir1aseATnDqiV7cVpDfjR47Vkn/a1Uk9H6/oO0hjAdUPZVay/F5JudshgC+I/r8C4ppxadeTJgrPmlmw31nW+g5ux7QQw9jQuLu2Ed0z1MwIVLI9qIrWkLNY3eJyhLfgC+7cayA4W2NRhn0XpvU72CfDlB7G8bZekQs2RVhrpDU1QUaFuWDN0ROsPnSnc1i/HX3t3KdgJirPcqeGPyT+lM32wv5vPXXVf+MZt8f3pytedbPRLT4WmfzVkYhH5d4Loj0S6LbIe/30mFwuvw/qKRnrEprBPwrZeaPXcCBQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(1800799006)(186006)(9686003)(38070700005)(55016003)(6506007)(107886003)(26005)(8936002)(33656002)(41300700001)(110136005)(5660300002)(86362001)(52536014)(316002)(2906002)(76116006)(66556008)(66946007)(8676002)(64756008)(4326008)(66446008)(38100700002)(71200400001)(66476007)(7696005)(478600001)(122000001)(82960400001)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sl0wj1RlMM0MgeXpU20h81PC8calrt4O5Lp1WnY4lzJ/8xAiabvC3D1q1HjK?=
 =?us-ascii?Q?Plf17QgLlHxqn/ibPA+gAGS/sYSn3qrDq+02q1L2wn/X+PgUUVO1iNptUZUz?=
 =?us-ascii?Q?0jwyeLfBwZCRmKcXLD1VAoUZPalfbMUlOK0erXbhTUQ3rh+m9lCLtdUBLDlE?=
 =?us-ascii?Q?FpS1ayipc2RhGH8b8Rygls90Q2O/7vOmg07NbPmBKM3DtK91H63TQLfq6wDW?=
 =?us-ascii?Q?GAxSeN6Zwwm+i1sDZgeHOiIjGA+Mh5t1RNE5/4sORjEKFU3OjghYs1ISxV5o?=
 =?us-ascii?Q?d/cWmBu67gGctzjo4OfOZm3H6P/iNEHSxxhJ7Wjz9CEXy4A46PlUlYTMiS18?=
 =?us-ascii?Q?fossgvgFbvhmbtJARHQQ7QBUxZtC3BPXS6vL+94sgadpmh1HUrPFAJ27aoBA?=
 =?us-ascii?Q?u33GhCycORObLeyaJW09hTcX/OpDkFJK6SGmQNqbDtIwCesOC0WIhzI7iuL7?=
 =?us-ascii?Q?q3xGtxe1KYM9PwQbjC9i7DOLRHIFM0GrkAWSSxLU2uib6esblhk8/bGnMNJT?=
 =?us-ascii?Q?6GcHBFuqDK38z5EdoA+N8EADBypAfim7McUNa8Mj2kgWz7HDiXzTNqpGDE1Z?=
 =?us-ascii?Q?GK0DBUZce0X/TPWuCctw4CfIYGX1VffCClbArUv2QlUULK4AED+MUCUaqhfY?=
 =?us-ascii?Q?zBEHfn+oyFaJ52a7sRUkBhYj/A/45RK2YfM+1OkUbG/xHzpXC2F1dex+dm6G?=
 =?us-ascii?Q?v1N7Yw1YBYUWFLVnfQQ7FpJ7YF75rKjhLDbWrq5CEj3gx46ZrLnYIIPrxOsa?=
 =?us-ascii?Q?jJbuta5ezTrTcedHfKhaaZhdWzj2qdjc/kLCPTk82K9w0Z9hL6GhB+uxEeCD?=
 =?us-ascii?Q?rI5Dcn4kKzlIgC0X9bcuKCQiYkK5/sEJeKN5N4iJ+BGuuBhwiFb73CnUXV6G?=
 =?us-ascii?Q?knM5ej18y9WCa2HqrQM0kGZ4vOHaq71jOUta6l85BfKVG8O8tExVELnDy75S?=
 =?us-ascii?Q?nUf2//nXDRnRfvTGWuho4YrF9Yd0zZxpKsyi1fxVgTReiYdPXv8+EFf6O/qC?=
 =?us-ascii?Q?eiL7AnzY0FTiNZo7W/p4GcAbxMp3Wlpe7rpUzY9fCQTx+q2s/qAByqR+UGCK?=
 =?us-ascii?Q?bVwEHGCyyJdLIfzV39yuptBQhCjy9DeYh1no7isEPH6jiPIgzGCCt+7+3EfZ?=
 =?us-ascii?Q?SHjkCs6Je3npQ3QSt1tkx6qpdP04Qrh/0nwNZeVkNT25mej4ppiirPgxE7c3?=
 =?us-ascii?Q?IvXtxm6waBA0mT7EPhI+23PB3iUNspYHmBEKJMxhkf7mkO3b59MY0KUoVXrJ?=
 =?us-ascii?Q?C9R11hH8SqR7S4GNPKS1oc9gdcviB+6DTcXD9jIcy6dAuZOkyheNaISH5VoP?=
 =?us-ascii?Q?I0krHX7lQJYgkL/zL3U2ho6rn+5udE7g+PpN96L1ttLMilpADkeO/CmgYyj4?=
 =?us-ascii?Q?wJ2MgaElkwO+NA3ZsG7VE4r57fsWYjVPEv74GR0JSGJCWBVt0a54sNBzhJLH?=
 =?us-ascii?Q?nUIj85MqhfcLfsIF486mQLYpczhbhU83GUsd8B2lTmiMuN2p6BeWN2A9TPbP?=
 =?us-ascii?Q?EPr3pja2c8yAVniUJ/gKVMtiEezfmUzvtpdllsJ1UYKzMurqdKflwieUTJU2?=
 =?us-ascii?Q?bqhOTrfQijCHvk4cAut0NTLMQSMd23Qaj6N1q8cB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee1ae99-8249-4587-8a11-08db99bd7445
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 16:18:38.1623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hq0H897c90XTZ5V5qMnTu7N/lzi6gOO1+n1zT2JZqjODQiurZ1g+c68dJcAmagWlys993s5pD7F6x23M3SIlhaoWUslKy9Nr1B455hQa1Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Make xe_mem_region struct
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


>-----Original Message-----
>From: Zeng, Oak <oak.zeng@intel.com>
>Sent: Thursday, August 10, 2023 12:08 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; Brost, Matthew
><matthew.brost@intel.com>
>Subject: [PATCH 1/2] drm/xe: Make xe_mem_region struct
>
>Make a xe_mem_region structure which will be used in the
>coming patches. The new structure is used in both xe device
>level (xe->mem.vram) and xe_tile level (tile->vram).
>
>Make the definition of xe_mem_region.dpa_base to be the DPA
>base of this memory region and change codes according to
>this new definition.
>
>v1:
>  - rename xe_mem_region.base to dpa_base per conversation with Mike
>    Ruhl

This looks good to me.

For the series:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h | 94 ++++++++++++----------------
> drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
> drivers/gpu/drm/xe/xe_mmio.c         |  9 +--
> 4 files changed, 47 insertions(+), 60 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 284c86107a5f..480f4e59f891 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1457,7 +1457,7 @@ uint64_t vram_region_gpu_offset(struct
>ttm_resource *res)
> 	if (res->mem_type =3D=3D XE_PL_STOLEN)
> 		return xe_ttm_stolen_gpu_offset(xe);
>
>-	return xe->mem.vram.base + tile->mem.vram.base;
>+	return tile->mem.vram.dpa_base;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>index bfedcc7571b0..8e45724f3d2f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -56,6 +56,44 @@ struct xe_ggtt;
> 		 const struct xe_tile * : (const struct xe_device *)((tile__)-
>>xe),	\
> 		 struct xe_tile * : (tile__)->xe)
>
>+/**
>+ * struct xe_mem_region - memory region structure
>+ * This is used to describe a memory region in xe
>+ * device, such as HBM memory or CXL extension memory.
>+ */
>+struct xe_mem_region {
>+	/** @io_start: IO start address of this VRAM instance */
>+	resource_size_t io_start;
>+	/**
>+	 * @io_size: IO size of this VRAM instance
>+	 *
>+	 * This represents how much of this VRAM we can access
>+	 * via the CPU through the VRAM BAR. This can be smaller
>+	 * than @usable_size, in which case only part of VRAM is CPU
>+	 * accessible (typically the first 256M). This
>+	 * configuration is known as small-bar.
>+	 */
>+	resource_size_t io_size;
>+	/** @base: This memory regions's DPA (device physical address) base
>*/
>+	resource_size_t dpa_base;
>+	/**
>+	 * @usable_size: usable size of VRAM
>+	 *
>+	 * Usable size of VRAM excluding reserved portions
>+	 * (e.g stolen mem)
>+	 */
>+	resource_size_t usable_size;
>+	/**
>+	 * @actual_physical_size: Actual VRAM size
>+	 *
>+	 * Actual VRAM size including reserved portions
>+	 * (e.g stolen mem)
>+	 */
>+	resource_size_t actual_physical_size;
>+	/** @mapping: pointer to VRAM mappable space */
>+	void *__iomem mapping;
>+};
>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>@@ -113,38 +151,7 @@ struct xe_tile {
> 		 * Although VRAM is associated with a specific tile, it can
> 		 * still be accessed by all tiles' GTs.
> 		 */
>-		struct {
>-			/** @io_start: IO start address of this VRAM instance
>*/
>-			resource_size_t io_start;
>-			/**
>-			 * @io_size: IO size of this VRAM instance
>-			 *
>-			 * This represents how much of this VRAM we can
>access
>-			 * via the CPU through the VRAM BAR. This can be
>smaller
>-			 * than @size, in which case only part of VRAM is CPU
>-			 * accessible (typically the first 256M). This
>-			 * configuration is known as small-bar.
>-			 */
>-			resource_size_t io_size;
>-			/** @base: offset of VRAM starting base */
>-			resource_size_t base;
>-			/**
>-			 * @usable_size: usable size of VRAM
>-			 *
>-			 * Usable size of VRAM excluding reserved portions
>-			 * (e.g stolen mem)
>-			 */
>-			resource_size_t usable_size;
>-			/**
>-			 * @actual_physical_size: Actual VRAM size
>-			 *
>-			 * Actual VRAM size including reserved portions
>-			 * (e.g stolen mem)
>-			 */
>-			resource_size_t actual_physical_size;
>-			/** @mapping: pointer to VRAM mappable space */
>-			void *__iomem mapping;
>-		} vram;
>+		struct xe_mem_region vram;
>
> 		/** @vram_mgr: VRAM TTM manager */
> 		struct xe_ttm_vram_mgr *vram_mgr;
>@@ -263,28 +270,7 @@ struct xe_device {
> 	/** @mem: memory info for device */
> 	struct {
> 		/** @vram: VRAM info for device */
>-		struct {
>-			/** @io_start: IO start address of VRAM */
>-			resource_size_t io_start;
>-			/**
>-			 * @io_size: IO size of VRAM.
>-			 *
>-			 * This represents how much of VRAM the CPU can
>access
>-			 * via the VRAM BAR.
>-			 * On systems that do not support large BAR IO space,
>-			 * this can be smaller than the actual memory size, in
>-			 * which case only part of VRAM is CPU accessible
>-			 * (typically the first 256M).  This configuration is
>-			 * known as small-bar.
>-			 */
>-			resource_size_t io_size;
>-			/** @size: Total size of VRAM */
>-			resource_size_t size;
>-			/** @base: Offset to apply for Device Physical
>Address control */
>-			resource_size_t base;
>-			/** @mapping: pointer to VRAM mappable space */
>-			void *__iomem mapping;
>-		} vram;
>+		struct xe_mem_region vram;
> 		/** @sys_mgr: system TTM manager */
> 		struct ttm_resource_manager sys_mgr;
> 	} mem;
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>b/drivers/gpu/drm/xe/xe_migrate.c
>index 18c94022930f..956a96b38346 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -264,7 +264,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,
>struct xe_migrate *m,
> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> 		 * vram is less, when we don't access it.
> 		 */
>-		for (pos =3D 0; pos < xe->mem.vram.size; pos +=3D SZ_1G, ofs +=3D
>8)
>+		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos
>+=3D SZ_1G, ofs +=3D 8)
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index aa9c573b1243..41ee89247ddb 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -173,7 +173,8 @@ static int xe_determine_lmem_bar_size(struct
>xe_device *xe)
> 	if (!xe->mem.vram.io_size)
> 		return -EIO;
>
>-	xe->mem.vram.base =3D 0; /* DPA offset */
>+	/* XXX: Need to change when xe link code is ready */
>+	xe->mem.vram.dpa_base =3D 0;
>
> 	/* set up a map to the total memory area. */
> 	xe->mem.vram.mapping =3D ioremap_wc(xe->mem.vram.io_start, xe-
>>mem.vram.io_size);
>@@ -281,7 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 			return -ENODEV;
> 		}
>
>-		tile->mem.vram.base =3D tile_offset;
>+		tile->mem.vram.dpa_base =3D xe->mem.vram.dpa_base +
>tile_offset;
> 		tile->mem.vram.usable_size =3D vram_size;
> 		tile->mem.vram.mapping =3D xe->mem.vram.mapping +
>tile_offset;
>
>@@ -304,10 +305,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 		io_size -=3D min_t(u64, tile_size, io_size);
> 	}
>
>-	xe->mem.vram.size =3D total_size;
>+	xe->mem.vram.actual_physical_size =3D total_size;
>
> 	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe-
>>mem.vram.io_start,
>-		 &xe->mem.vram.size);
>+		 &xe->mem.vram.actual_physical_size);
> 	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe-
>>mem.vram.io_start,
> 		 &available_size);
>
>--
>2.26.3

