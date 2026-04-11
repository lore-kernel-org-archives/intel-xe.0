Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9449F45A1F
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 05:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531610E18C;
	Sat, 11 Apr 2026 05:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIJ8kT8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946410E18C
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 05:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775885656; x=1807421656;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MBvBKLL6PHvfF9+OlyoR9CqivpGkr8wPx/P7YwV260I=;
 b=JIJ8kT8ba4vnHI0Ad6hwsYz3qf+HBmNrk1L4jzFc1Oia8ev1J10XL2ya
 OP1TSZzWEf/O8NmbXb+GA4HzGNRsCmoc6ON0vn7M8fJ0mhD6TGBojg0sK
 XAuW+BeRgXXLI80LtNUcJRt9x9sXSzY2SXNfGL12mPuOahDxbxHwOR3Y+
 mo7vXwNoBXXyUoueAW8yC42P1mOiV/GgkfLHgomUFcNfoo2Tlkf/kA7uG
 wKKg9k8VtMv8MexAsbDbenR++x0OJS3Bvnnyi0sctuNg3txNXYIkSTFvj
 U8VIDhctmJjcag8xnSwODGmkkQFOgsDZq6h+6I2V7fIGLVp5FqPwOizEl Q==;
X-CSE-ConnectionGUID: qLsx2BeoRUeTKIysp1PUdA==
X-CSE-MsgGUID: /7L25UL4R4Cdl8SDMellsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76789484"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="76789484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:34:15 -0700
X-CSE-ConnectionGUID: O9C/uyqqQj6TTItwoR9Scw==
X-CSE-MsgGUID: 733JjW5jR5qZNnD5QDA/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="224975803"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 22:34:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:34:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 22:34:15 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 22:34:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8NnH2W7otEYi4pj8Q7qSDtgTIYyAm/Lq7JbVaEf79luh0zb6hBwquIyeBBpM0J5H/ExSjbMfSuKoeXal8uRgB93wEsK94M36zSyzf1vIsw7Y3JWXDkIgU6nH9X9wHtoY37s3S/NYfg78peRLMtsR1NyuxGCkaFbWBmSvmzmgw8TYf0BQPdHsKDYt72w6Gg6z4WrHOxRJiq5uBp0dznVC9K8n8xjsOC8ig2LkYfbLLpId6O+/sx4d3ovf1vSkjTJ41RsCl5DVQuhfKJsVAgbkbXX9AHMyXE82UrrSzgnkNoeZoWqzz2t013UMuMia10VLMxsffdVxX0ybe1mVT+vmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlvUz2s+ER9+eI/Oy+mjm1HEte8QQ6g1WlYGVpAVilA=;
 b=cRUrnuSJ0jYGHTLWmulILUbZ4VPQTTQGd+K3cEo3mmxa9lACD2Ka9iXjkKCbPQcIw2NDDHEfDMmmFQfaHXmngIJkrCNEDucywWsInkK9cED7qY2c8zA2W9VC9x5nmaiSkJfzYXM4C4yvMhfH4+oDkeZg1NXhneMrNXFdaq9/AZoC/a/gInZPScnO0Q/FRlP+Vm814iwTnAuK99nRJ57FMFfCyRDDHBq4ZcKWsUrNYEcFl2Vah1JcLAjyljxs3EQnthA/uoFaVdbdtGRMsbHMvmC5sbbBl8KAysupk3dWaRIY4ItcFZUDBDD1/NJMC59NwP2NYHfGSnzHTj6wJuJ5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB8809.namprd11.prod.outlook.com (2603:10b6:806:46a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 11 Apr
 2026 05:34:12 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9791.032; Sat, 11 Apr 2026
 05:34:11 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2 2/4] drm/xe: Add missing '@' prefix to kernel-doc
 member tags
Thread-Topic: [PATCH v2 2/4] drm/xe: Add missing '@' prefix to kernel-doc
 member tags
Thread-Index: AQHcxgTvyRhK/luihUirdv0ZRUsQiLXZXSYw
Date: Sat, 11 Apr 2026 05:34:11 +0000
Message-ID: <SA1PR11MB8839C27A42F26B075761C6F9AA262@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406203122.3392365-1-shuicheng.lin@intel.com>
 <20260406203122.3392365-3-shuicheng.lin@intel.com>
In-Reply-To: <20260406203122.3392365-3-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB8809:EE_
x-ms-office365-filtering-correlation-id: 8e3b91fd-59d9-4153-81a9-08de978bf61c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: gwIua4yUlHuESwCtEqe6p0YaCC1uy02l15FHKbiEwVw4UjXpwe2aJyYIB5I2K1qihTJPyprULGilHa5QMVJGAt5TzyAeogswmFOdlHHPTvl5lcFxTobXPaNu5wKNRobwtME0gBgQ/p/V84QH17eoL5mPQFpXOHELnCo0MVKgfRMO3Ky8PeGYE66OGCimhvjFDI2puYGCwy9Cfu7fkt9QsCgbdw4Pf9lcq7fHZZ3KBLIul+b3SnBVcdN9u6jkej+m8+HuIeceKBMmApsWRBZYMU64yOLkwm0gLW1zvoguvu5pu4Yq6KYN8a9xvPOtHdsNVpygMWjcB/hDv2vHPouB2FhxmusoS9jJrTNgUEHv9hDQhSsjGR8IpFtogz1bSWDBJwaRK7oUOJmkUYchO1OYxW5nGIsg8K7BekcKqG1n2Zs7hs33Ym6iT2JSsMwjvIOmg/OR0gyc1RD/5qJUXZZX3kQLK2s8oU6O7ZOAtcdmxt0svaUM2JI+ypVCwxZ06BllakoWoJ/1s8cF09ZmIrCb+oIwc6RnJzHcxwczyPIAUkRwLIYu5ry6MCA57nGoXWR3dEQ9DafU76XO6jX3+WrcNrdXErcFcXgcfwsy3jOqMMfkir7fIWOd9yECfkCr+umW+5kWS0HJASsPE56g7Upw4Xrbrb7f7gxNpq+fyg4Y34keSl64ORKNwOP9UI5ydAdKcB9rb/+ErV4KGt2yNy+bzecOGjIDR0SXPjVH4djio4zJ4zxGx3fRvrNgPG7ODVnL2iz7vcuKmxCLhLZC8p5aIL/+BUVm69guiRXSq8CYK3A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KcAvb5PsWjrTSkrcnDHQEcZDzxFe/7EEshoHcb1JaKV4sY7fpZ2+XbJfHobs?=
 =?us-ascii?Q?rFREttz2Xsk1wgfBeALA1p8oebxgyQPgGcDmS1M5WOAasLcrtCbVGjt/+jFt?=
 =?us-ascii?Q?y0g9J8JdATiKHI+iJb5KL0elimkPHzj8JXdB7QPzarzGfw0LaHfvucHjNsXD?=
 =?us-ascii?Q?Rq98GqqyG0t5JLzIzd8844g+jBbrYOspRxFQgDwnCRIsltctBpMa35l2QMP3?=
 =?us-ascii?Q?8KvSnAQVSBkLfz/RLb6IwM+sYHIygsL7XyBwXngVWWAY+kLMxOvulFqfdaVp?=
 =?us-ascii?Q?f15DdOVvWXOZN3Q9PNa1R8A7/pJhIDheOn76yBzNdhWLcBk43/gfKfU+bSPz?=
 =?us-ascii?Q?FVO4J8F6VK6M/wDVCJPXFCpUqN9P8FVYzRmPNV1QSKDAhXBdcgsz/jx3AwzC?=
 =?us-ascii?Q?AohPsJKY9/amA+DoKedYlzV+Y5lMPu0X0EIoXa5uq5LUlcLzlqz5QIkrMyWH?=
 =?us-ascii?Q?ZZVpKj1PgKhWHMmSj1xEf5txJxD1pCulzxpAXDd7wggdYo1Ne38enCjRLgO+?=
 =?us-ascii?Q?tYhh1njXjuubu/Qx9MLDKJ4Tui+qhbZk1krR/8vnbjRyzhooWA6sbGmq1uAx?=
 =?us-ascii?Q?mSBvM+qiDIk0ZTn91F7DymzZhNqeMkNm2EjlhzZ1WHPpxoVhRvhLTqgDo3s/?=
 =?us-ascii?Q?4VBFbIAxFCsS0+4i1NaIGeg7PzXs2sOWFHMkLnFR8G+DGhdL49aosUD8dGdl?=
 =?us-ascii?Q?IMcw4MlYEtttEzz+QQWeJH6ir/B8NyJArV18pt0pyaLSSFRDZZmoBuGdOQMh?=
 =?us-ascii?Q?CObMXvz/Y9HPJJEwq6X8/aa3qHP5+riQyI7fDUnpftcA4atnsEtUJ1JDi42b?=
 =?us-ascii?Q?fYshdi73q1S0Ce10L4jfrD3lq0kBpSXgkXa1g3g80qsYP1JqFLUP7e9FCWyF?=
 =?us-ascii?Q?Q0yl/7YS1cEe8wMTLkYHJlQ3KfpZlW8n5UtTAxR5U6/ZaSxKUPYR948FKk9q?=
 =?us-ascii?Q?W51iucKs9aou7fVC5Lc2lGYrr7A0kfn4d1onmsV6EtJPuuZMj68PlpaEfpnj?=
 =?us-ascii?Q?tj75Lvr+gt+nd2JExovuPcqIa9VU5MRMojyAl6K2Jk8ZeNhtQeWwzIXtb3Mi?=
 =?us-ascii?Q?RkwzezSC/n4Y7RwN93xLisTUEqvsrut9KRsJamZhJiY3G/zTEP65Ni+K9eJG?=
 =?us-ascii?Q?kGnT3aWtMfZ7XoMnamAjH0KQY9dPFOH85g2wGnI0n/W6ouP9zB5pp0szgMEt?=
 =?us-ascii?Q?rFBU0PN8DPeYqC+fcdYrcaX4m+aGixvnf+HAd+epo0A8gx0kGL68hhm8ZHI1?=
 =?us-ascii?Q?537bdPvMxLahwtnQMO0rO0poNwg9ZyCutcalH01oRGAVTCgJlRkWJbsA6MEe?=
 =?us-ascii?Q?0aQM2ul7giROf9+f6dRre1fNCEja78NJrVJZEbcGP4zkltLThBxws6YXKEku?=
 =?us-ascii?Q?BV6kh/VWkjMX3KWpUr0cUOXoyYavg7Ug5FRPm/FEns4HATbeLcBw1zZCIXBQ?=
 =?us-ascii?Q?PbFZLiJkq291l5c4pI7W8L0l7YoZ2KLvwWmt6SYqebmsk9WblDCF2BxPP4DN?=
 =?us-ascii?Q?FJbIRFT2c3b1JRpe8Szx/2SIT1CkeAWhwAulzFfAsYHxlL1wNUOK53ZbgrbT?=
 =?us-ascii?Q?i3oXtETIhAU0MJel8qsL2bCxVK18yjrtXxxsWzvnXtpg4kxS2/HVnWDnC0dx?=
 =?us-ascii?Q?kVFS4vKcOCm9oS0ICpRO6loz2y2HkgAvTOiOw6AtuDLeB1PdU6o8uFQ5bmnS?=
 =?us-ascii?Q?av0X3BMcyTXTZUNI2tQe0TDIt+jymc7M7aAJfn24fQbPLCgc/zHz4VUjUaen?=
 =?us-ascii?Q?NDt+LV5m3w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: e4mTYe9ya5UwZBD+x/3Mds6Fbi7hnari643rfSkbZwxdp7XOF4dxDeyZks1d9gVpYUHt9OUSZ/C/fDT5T3Scoo9KDVj1Wr9lR1HPrng1cXxzs5/gJT4KMXxs8vYgY7mHrFGhhGtVEIIM1OwrJ+laEGPoD5pOVtZ/MlGQYkuOtAItMifCPz12XYfhij2s/rWgx74lhenizKN5vfdZVKEFWHcAYG0UCU85CAgxT/c7iAQ1LRVKe7/mTTdl8wu8py1/QocVFh28bXlhvtQt6q7D4BvRLZyNm5dkMaF32WqqyE41QrYI78DhyoyVB7DmhERSPht4dTmynO/oeDVgc8iHEQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b91fd-59d9-4153-81a9-08de978bf61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2026 05:34:11.7902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgFSiFA/EC+77U+PX8OH4rHxX/F6c7wV2hYt9kl1pAec6ollqzq6nnEJSUUloP3ccpJ8Iqe4jpJVVP7k5YAHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8809
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

On Monday, April 6, 2026 1:31 PM, Shuicheng Lin wrote:
> Add the required '@' prefix to member documentation tags that were
> missing it. Without the prefix, kernel-doc does not associate the
> comment with the struct member.
>=20
> - xe_guc_ct_types.h: snapshot_ct -> @snapshot_ct,
>   snapshot_log -> @snapshot_log
> - xe_pagefault_types.h: consumer.reserved -> @consumer.reserved
> - xe_pt_types.h: addr -> @addr
>=20
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct_types.h    | 4 ++--
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 2 +-
>  drivers/gpu/drm/xe/xe_pt_types.h        | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe=
_guc_ct_types.h
> index c81996f8915a..f88e588af0d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -102,9 +102,9 @@ struct xe_dead_ct {
>  	bool reported;
>  	/** @worker: worker thread to get out of interrupt context before dumpi=
ng */
>  	struct work_struct worker;
> -	/** snapshot_ct: copy of CT state and CTB content at point of error */
> +	/** @snapshot_ct: copy of CT state and CTB content at point of error */
>  	struct xe_guc_ct_snapshot *snapshot_ct;
> -	/** snapshot_log: copy of GuC log at point of error */
> +	/** @snapshot_log: copy of GuC log at point of error */
>  	struct xe_guc_log_snapshot *snapshot_log;
>  };
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe=
/xe_pagefault_types.h
> index b3289219b1be..aa3cfae01b9c 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -86,7 +86,7 @@ struct xe_pagefault {
>  		u8 engine_class;
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
> -		/** consumer.reserved: reserved bits for future expansion */
> +		/** @consumer.reserved: reserved bits for future expansion */
>  		u64 reserved;
>  	} consumer;
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_=
types.h
> index 84b51d3762a4..a7d1bb708b69 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -34,7 +34,7 @@ struct xe_pt {
>  	bool rebind;
>  	bool is_compact;
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> -	/** addr: Virtual address start address of the PT. */
> +	/** @addr: Virtual address start address of the PT. */
>  	u64 addr;
>  #endif
>  };
> --
> 2.43.0

