Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B244C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 20:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF9910E0DD;
	Tue,  8 Aug 2023 20:42:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F14A10E0E5
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 20:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691527338; x=1723063338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JYZZwwIWr5+iN9HqTlrqutXHA/vX1Hb7rq8Vnq383Pk=;
 b=k/zgs5+tRLxIEgZkxEA5uKXtfsuEhl3c+2kO3q6QbNv0CMlBYDflaF8t
 7magdb7hGBb82haJPQWnfECLa5ZtpN61XdwGiCL1vVcB/ntbNBBUUczqu
 E90SuMZ3bj1/lUir6eM7cPyrNNdJXJgxtIAr94cpRHnHjWXVxiGWOZBsD
 0o5LteRZ6G9uFmpiaz99lexFCP+7JBx15gX1la+u+wCvy75jNoMjASyzZ
 d265rQh5o8+kKqs7rwrH5Rdns1UyXT8NhIbMdqDxbv4Gl8bje4YWbjxzl
 0dox0XxPoKfdwGXkFr0XgqOAkt5LqOV9kuWvHkoND2YOfG5zFOIw9Z09X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350538973"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="350538973"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 13:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062178152"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="1062178152"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2023 13:42:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 13:42:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 13:42:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 13:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfHnBkmoM0Uu+TlK7VxeRC6K4rMF/mJEJWCbmmSjfLQKYmkqXwRUqXSROrXz7y+jUxkrfJC44G7eXrPYFj/KGl/zVZVEtVA5qLLGnQswKzcrzaSyU84YyBozFnTF4DaFUY5qJ0ijpi1KnCcIustx1z7Y2ErQFNH19U0eUafcaiqGeLqJh85t3z5RacqjBtrbEqI7NNVfWQrYoVuGdhCrH30KuYJWmEgGu25n7/xishXkxk1VU21D00qSC+7+pwKwyR//6mGNqzSZE4ng8n49NC2YYjQymLGoWf9G4dltrUpxEm/zUrlR6V4/Mpvq/olozWx2B4C0fGGavU9KFC5f8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3uNZu3BIj4SIEbpgZ3QFLs8zzeIw4Z1+zAomphERWM=;
 b=ZRJHpEHVweGfp9xz2l8Gvajwvt3CVDu22HULMEpPiVsjF/kog88pXQi4Zskp8Ll/diPMf4srzHer2YdOVA089zwlTa8xhzWF/q7EHTLt1jPZYlUlTsyAH5r84W9ybSU0qVsok+Kft2VEyKTakHAEjWP7Q8A/N55MllBn0IZ95wlHvagvb1BJXRqTD9rLCxK9swmuAO6A5Yxdxd8ZVJwysFL9y9tiyURkPG8R0/mykM5ONd8cQLVCePTqT7GrH+UBqPBK9dTtpXJNqk4+5nv6E25mtlj0qIh+vT8nf/YU4uDOhICLLy0OTBOYcYOz2UC2H9Gu50YuIk4jme44Zv90Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 20:42:14 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 20:42:14 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct out
 xe_tile
Thread-Index: AQHZyaFF9WnU8cclCkaaycDXV/g8qK/g2a7w
Date: Tue, 8 Aug 2023 20:42:14 +0000
Message-ID: <IA1PR11MB64188186C3BF62745EC8178AC10DA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230808024334.11619-1-oak.zeng@intel.com>
 <20230808024334.11619-2-oak.zeng@intel.com>
In-Reply-To: <20230808024334.11619-2-oak.zeng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|IA1PR11MB7726:EE_
x-ms-office365-filtering-correlation-id: cee00f3d-bb88-4236-1525-08db984ff2d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XuY1FGW3ZVfkkSZ6SHkJjXGx0lTiTlL9UliAJg0c896fqvqib5r65U++vsCikhb2nzcLjn72zzWqvg6PihaMGN6pVlVn8RRx92IP6XjahrxzGgvvuPyTKODP1afIWaDC3XrJp+J3A4/d3B2pb6dfSIoROfS3stJnV4YQWSorFaAYrpswYkQg+4cvpM3YLRnnQpW+v9P1X+twaDstK4QrsfgKolIgvg+N8/bjU1+/QlPTXi+lKZJAqTLVK9/M0tmTiOFmixm3bXJRzU1NcagwKmEXa1CuLI+N9sPNxD0fS5f9wUodfZ61J2NJ59fEtpgEECd8++MTbUPVPJTK5c9EPot3cqbSVeNcXEWe7GOtEsgJuj/sAmFraCPx2FZIvlUNZYRJs1szyCYqXHB1dJPRl6pTOjtQVRxNX6BAEuZgog7tQlJj9wb1CPIyS4fvSUAAM0ONxa3urrO565JxjEf6RTWUpjQ4uLNnanaIdGAYgzq6R43fC/9mkv0I0Ob2d/yQ7W0p7g2Dtf2WBuRHPPAk/wQIPIDpUHoJpX/wd1DNaREOcSidbLPwDejENyOq9Plb/4u2z0p8lFcZJ+MAZNPkvTW1GKKek8PTxN4CIdfz0gx3elB0QW8sFwIT6XHQ+Wne0KoIg8akQwPe6yuNo8no6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(186006)(1800799003)(38070700005)(8676002)(8936002)(52536014)(5660300002)(4326008)(41300700001)(316002)(83380400001)(55016003)(86362001)(2906002)(9686003)(71200400001)(7696005)(107886003)(26005)(6506007)(66946007)(76116006)(66446008)(66556008)(66476007)(64756008)(122000001)(478600001)(54906003)(110136005)(82960400001)(33656002)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GF2fsb3qg2/OefMf0wD94iXeIJ7z3Trlak8fS3dOregnh5os0roGQFvAactq?=
 =?us-ascii?Q?/5OB7ZxEoCLxkUl8cGCS8KcDQeAGCEIkutjIF32TLoHTo1rHcxiYSxfWALk3?=
 =?us-ascii?Q?N3NvTwjEc71SiMeSfFY5eE+A5ghEYg87Bu2az7sXh61smMihyGHV/sGXEE6g?=
 =?us-ascii?Q?HgmFXyGASse8fOzYc5BLbo6eytJzUZ3gAAYMkyK7mkES6LY6tYDs+KH0aWJb?=
 =?us-ascii?Q?KiKXZAgJJnP0wNc1POLKuNp5DfKihqAfod3jQo6N2+lly6sLTzwgJhcUyu/H?=
 =?us-ascii?Q?pqSJfmQ+hiailj2TvcHvf8Rth4jITn2TyH3qpPP4wK6kWG23eQdpJprFFu9D?=
 =?us-ascii?Q?4chNxY5tSFSHV7p20FD+cgzcgzUV5EfmZ+O0JE/+gnK1nqrj4XgFicCfzi5O?=
 =?us-ascii?Q?gBwXRTBkEkPmzg1u5iUiztMv4x5AQcv5lkQM3y2706kKgyiI/CjTXsnKaOMC?=
 =?us-ascii?Q?6UISUZOHioQsyUcde7i1M0L3O/KHHKgW3dx6HAD/kXwsFwfbAlrYp6L8cdlj?=
 =?us-ascii?Q?GsgJIQ9aKBb6N5IAP53svcZ29SCYm0Gonu/4hI+oS0WwKE3xLTmDz76zXxfk?=
 =?us-ascii?Q?kG4ylYfyzEQoiNSSlqp4uj25yBFHwfDwtguMLopiwQz4q92XhF5gmF/mcgrE?=
 =?us-ascii?Q?JErD8xlwCsvKtMaiYdqbV/4380euyulyn/x5k2oH6ARgUjraMXYQVeVEUK+8?=
 =?us-ascii?Q?8I9d3aFNz+Tr2D3+XeZzAbrObVbIXyE8tG9jcLxLh+HxJynriAMrVWmd5j4X?=
 =?us-ascii?Q?Q68x4+SdyX7HlK4e0lgOcnBbt9yMsz3b5RmepHQG27GlKw254OuPuJkZcey9?=
 =?us-ascii?Q?5DzH0nJh3IVkDtjm7MrUFv2VmSnOCItRTa3VM6opokeLcUg0EY1SeHNackn6?=
 =?us-ascii?Q?v5ObYnhlhFFCrVAkHnda2k7Jwbtx165KyDZWNnWVcYlaGW3TPl8zgZQaWRJ1?=
 =?us-ascii?Q?5O4sgOc7sWDovnPiEdup3izwfFKG5JNdxE5WlpeOeUA3ietCTHza/PwzFRTS?=
 =?us-ascii?Q?bf5qRO9dGjqzd62/1os4898YXnQz1C9X6VTTd5AO/FFVjutE7Tq48pet9zx+?=
 =?us-ascii?Q?3NBDw2qzyuYtJKkidtrr8Qg6iapxQVjfmsUmxvVRoTGpsel1+crtFQVvkAyd?=
 =?us-ascii?Q?zC3XFZ2sCLJbyFH3GvcV8qM4r2P0SpAg1yN9jPLzQ8WaDB5Y3BF4vxlkIIRS?=
 =?us-ascii?Q?eyb65d/7LcW8yj5uflAkVBgNWSs8AOvpW2UJxcq+E5GlGG6Llq98SvdpI6ds?=
 =?us-ascii?Q?fOQ1aCM9Dme47mWWswVLfy4O+2aST8RtLPbL7L3qUCQI6qPbz7AK2pmWctYL?=
 =?us-ascii?Q?hTRPwN8zXnOn34/lGq5pua+wFk+QJsNieq8bvElx/lTLsYkdLsvSy3PeqdXj?=
 =?us-ascii?Q?OTExpi//GV06rLV3bp97cpSX7GPY4PUAXcyfZwX+W5BXx9IED2OLAZbt5iTQ?=
 =?us-ascii?Q?RGhHViZZ4IQE5qMDVaOsrVmpZ/o5I5LrOC0w6aGZNMXoX563GVsVjQK3vH6W?=
 =?us-ascii?Q?oXudM+tQWK1aZeJHFn3sPHTkuj6DQEFQ46+Tii2j1x+tDyWiamsCjxUmPvV2?=
 =?us-ascii?Q?W/+kPEyIhkgAjqx4I5VIeFgG2aKvx8XrL6oSBec5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee00f3d-bb88-4236-1525-08db984ff2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 20:42:14.6237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: se3JA1+3rbO5zPPclehFDHGm4YVQk2We+GUGSsMWN3xxXlyLG9jZm443aVLWdV9kUWA3vTYQR3f26nEMgXN/VW35Cpal+tlZsyclDTu6utM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct
 out xe_tile
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
Cc: "--cc=michael.j.ruhl@intel.com" <--cc=michael.j.ruhl@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Oak
>Zeng
>Sent: Monday, August 7, 2023 10:44 PM
>To: intel-xe@lists.freedesktop.org
>Cc: --cc=3Dmichael.j.ruhl@intel.com
>Subject: [Intel-xe] [PATCH 1/2] drm/xe: Move the memory region struct out
>xe_tile
>
>Make a xe_mem_region structure which will be used in the
>coming patches. The new structure is used in both xe device
>level (xe->mem.vram) and xe_tile level (tile->vram).
>
>Make the definition of xe_mem_region.base to be the DPA of
>the vram and change codes according to this new definition.
>
>Also add a pagemap member to this structure. pagemap will be
>used to map GPU local memory to CPU's HPA space as ZONE_DEVICE.
>This is preparation work for introducing svm (shared virtual memory)
>
>Signed-off-by: Oak Zeng <oak.zeng@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h | 96 ++++++++++++----------------
> drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
> drivers/gpu/drm/xe/xe_mmio.c         |  7 +-
> 4 files changed, 48 insertions(+), 59 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 284c86107a5f..a397a7224a99 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -1457,7 +1457,7 @@ uint64_t vram_region_gpu_offset(struct
>ttm_resource *res)
> 	if (res->mem_type =3D=3D XE_PL_STOLEN)
> 		return xe_ttm_stolen_gpu_offset(xe);
>
>-	return xe->mem.vram.base + tile->mem.vram.base;
>+	return tile->mem.vram.base;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>b/drivers/gpu/drm/xe/xe_device_types.h
>index f84ecb976f5d..a454a5098121 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -57,6 +57,46 @@ struct xe_ggtt;
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
>+	/** @base: This memory regions's DPA (device physical address) */
>+	resource_size_t base;

I think you can eliminate this value....  Like your comment (later indicate=
s) this
value will be derived differently and keeping it here doesn't have any bene=
fit.


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
>+	/** @pagemap: Used to map device memory as ZONE_DEVICE */
>+	struct dev_pagemap pagemap;
>+};
>+
> /**
>  * struct xe_tile - hardware tile structure
>  *
>@@ -114,38 +154,7 @@ struct xe_tile {
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
>@@ -264,28 +273,7 @@ struct xe_device {
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
>index aa9c573b1243..0d0966691eaa 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -173,6 +173,7 @@ static int xe_determine_lmem_bar_size(struct
>xe_device *xe)
> 	if (!xe->mem.vram.io_size)
> 		return -EIO;
>
>+	/* XXX: Is this correct? Device's DPA should be decided by IAF */

Yeah, let's get rid of this... When the driver code that use DPA comes alon=
g, we
we can add it to the tile->mem.vram.base  instead of using this value.

> 	xe->mem.vram.base =3D 0; /* DPA offset */
>
> 	/* set up a map to the total memory area. */
>@@ -281,7 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> 			return -ENODEV;
> 		}
>
>-		tile->mem.vram.base =3D tile_offset;
>+		tile->mem.vram.base =3D xe->mem.vram.base + tile_offset;

So remove the vram.base from here.

When the DPA code comes into play, it will get added back with the appropri=
ate value.

With those changes:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M


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

