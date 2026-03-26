Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7850A109E52B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1610E167;
	Thu, 26 Mar 2026 01:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAXeQmAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACAC10E167
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 01:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774487905; x=1806023905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZrJOYXlowEhGXm3Vssjq4nFgMq7ZZnTeJB//DMVIt9k=;
 b=dAXeQmAPzoIYx7cG97XJwlOX2t797ghHt9bnbjDMOKsfs3FNLjurJ6Dd
 m9GU1NW2mmn/FQBPyMZE21qObtCRtYLG5teSdI7PmSFPesPzQH7iVuZDH
 u78G1RIkBoxNRaoEUbyRA33FeVakBSAASdqxuzXHLRKj3SGx4dzaOGDUD
 9fYtXIii3zcewW++1CkZkH8Wwr+Wam6wjma07obRgHJ8ICwFwwx2dLa9q
 0wIPqHhIzX5vwU6Zc4ylN2x1IWqMnwDODFoOsgjijsdXtyM2ApJmIAwOi
 jPjzgLmFeFzm/kB6UiWmbgCjTRJ/W9mRc2v4IepJCZ6/+rJiAU0hMguTQ g==;
X-CSE-ConnectionGUID: 3cJ+PXWyRf6tzCYXpQ3Cvg==
X-CSE-MsgGUID: po2l5sNeQiqpLu02h/GuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79138103"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="79138103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:18:24 -0700
X-CSE-ConnectionGUID: QjPIYkv6RQKIgYUDOgOUxA==
X-CSE-MsgGUID: EE/KVOVKQwSqS8AFwfhBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="262770007"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:18:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:18:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 18:18:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2OlJ2y5i9O7z2Mu0b6HNJjgw8HpseZkkXHhiSx/eIXxj1BMOUgaVQwC8dCNQ1bgUKbbWYgFnLT/YAhkp7Zpdj4T1tM+evY1ds9Hwn26P9nW4miWESuROP8D+FTygtVDftCBJSGn+7u38kqXoIqi5wZadg8U+xaadNLXXAs+zBvbGJrYwTf7EawUv2Hb2D64kS07fRx8B4ps+RpgedQjs6GrAxsCrW0IZXHCQuHgoOF5FEkUcwLV6GfUxHc8PKchvD7DfDH9eXuhX0gp9HHaI02NO6C0cEyfTX5Sbk53AhoQqHkJtym/zSjshS1hlSEWpgmWcVqfS9lx/BbjMcfR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0IFY/b/PSstVTSZiGUIZwdtKXyt/CAkJ1MEI7aFv/w=;
 b=AYtljkVi5+CW56vKN4UVCf4P656GBFZtBmUQI58FMP+plojpBY9iRRRvVIT1EEMVtHcH8aKj/w9TZ97NQ9pjg1syqye+X/06m907YXlu0HSzxA1braGiwo5rJSw5Ik/Lh5gdrIgdWMApjH/66yPDxrPefx/FzAcrDoM1/ecK1FQxGB4QQ07OxwE4MSFQjRuoF3Ef2DHvohJC7RgXPlGAagBPN7f8xeHbZb/4hsfZCPuXtZkPHcfbU5kYaa95CIsm9ucSH68yXXvJmn6KZwl9sChgqp+DS3ABZH/haj/01oSY7qtfnHMQ3q9mNlLpcjEb0eDeXgtYHixai6v1dsFdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 IA4PR11MB9369.namprd11.prod.outlook.com (2603:10b6:208:565::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:18:21 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:18:21 +0000
Date: Wed, 25 Mar 2026 18:18:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add new SVM copy GT stats per size
Message-ID: <acSJWjSBoAMe8PH3@gsse-cloud1>
References: <20260325160152.1057556-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260325160152.1057556-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0134.namprd04.prod.outlook.com
 (2603:10b6:303:84::19) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|IA4PR11MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d66d716-0af3-4452-5eab-08de8ad5918f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: dJ+LGtAv3TIuT51fX7j3hIcnhpLADD7BnNgegdm7UIHyKEVV9en0+wDOhzD9yjVl6yWutpETA7nKFrAxMahoIOiyVtJlpuQ13pgQijKinI9yRCM1ur+UT5ZnKmXhFQx+ozHOwAQZmZLHngurdLofCdiHhX/aikpHPf5STjR8ocMKzC5BVPU/uyAUVPS5wmrCFgi1dPXpmsw4lDNzHErQEI2SrIiHkHyBQsgQ/RJm3PILS+KWHxbg9RGGe9Wk8mhgvYnY9G8RIDXbP5uFbe7LC23wVb/UkYxvl7zNLxbJrtkCQtxkaJ7p1uuFRiOUByhLLdnh5k3/GNw5J5EnpS/PLNlOY1Z9H04tmd9s9VdKkkGfZmsLZ5fqKOL/r6T/rL82MOQ7MMQ5mp9Grirrm01k2/rmRt3sOXOrPpJVMcuotoF8VsOaPrHC1RSw6o06De/VbCds4PCmAyQajvhzVHu+f8T63DdQfxRf1rK9LO+uvmAQHP2DlTp7iDy/UUOHOz/tmyretRytHUwECpZ0YbB7FZHQdd8uC2gltwrlMzyzykmH+X1JC6cz16xf0uYfzpzPIfl/vuX747G7MuaaTb7onFbaEKqz8zgstrc0oot5ld725SxORdRaETpT0R6NC89cL/nEKh7EHbqK7qETF1kAkz2dEck+oPQKHJC6QEVQpxmhWIqnA15KANYEb7psPFX/SuhoXFpKIIEnTvedsnqp8N7o3W1rZNOv6seW43I11uA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wmKCsK2Z1LzsOo8plKQ1pU0PgPMec9eZdW5Jqnf+KfDQ8iCrkH9INaU7apJs?=
 =?us-ascii?Q?nM7vknsEteL+8gMvexk7RsZlJFVBcoLVTz11El965hAV9AEFPzcDVGzKQNDL?=
 =?us-ascii?Q?Atlx6xI1UFP8fiP2jxltvprwC2R839Eh1w8w+T23unDCmPxLAxMlxs7L8ppD?=
 =?us-ascii?Q?B6AtTK2wwV9j9xegob16uUkY3rZeeUF7lO7RiE/tblutYfWjY6OkD9lmk/9x?=
 =?us-ascii?Q?ZAOIlLosyCeYVlisBXjn+O5lok3up2mU1gsnewCgm7uTaATsPHKzsERnP4Tt?=
 =?us-ascii?Q?v2mfjtOfsuoqaw+y6soQoTc0V3CvZanCIKWM1cXBF2jfTWkPCGJbwc9pU6gQ?=
 =?us-ascii?Q?oVsEnoC9UcOGvuFPNY3SegIs9WT1ajdpPUBo1GL6IqagQwYAyokLtHMar17A?=
 =?us-ascii?Q?84r4NPMlWRXgurwzGiCiWz8e5GGPfjTJ6uL/6DiECUD3VBAhST0ri0+mmPp0?=
 =?us-ascii?Q?Wkdm8eEkncE7imsDyyw5m4erTXAXbu1RaprZn5xDmUVXAksmH2SMVUF7yFmz?=
 =?us-ascii?Q?P3EizGw9oeEjtUXPZZ0EXg02mjYT4bYE94zqzDpmflxWi0dCrDUxQ8ZS/Niw?=
 =?us-ascii?Q?Aq42ziJNxGkUZTK8S6OC+jt3fjy0UtI3N8MZEnWcAGkLXT2OPRdISk5kSjhz?=
 =?us-ascii?Q?SUiO3RMQSSJ2cjUHZAnxUZ4Xu7SQzQvbbgys5wkUaoc/US/WP4A3u20GTG2D?=
 =?us-ascii?Q?pLj9dr5y7Nf6ut2lmf3DG62vm3SrBGo+ubSJLWRxwvujNFTPhEP/CCBzguHK?=
 =?us-ascii?Q?zfxE71VKE9jYGkymUPjXfNYd2I8uzcLtygOgYGb6TNQ6JrnsstypkdXpNlp1?=
 =?us-ascii?Q?i2avLYsoh+nN5sKAbqQNgAXn4auz+NiY6MnJzSRUghg5AeDg1itsa7vOLdIP?=
 =?us-ascii?Q?hNyyi2IFwtZr6nokgXkBe+cHLs+RDRpMhfTFa1Ys16AbWWwSh4a9Bc+elP17?=
 =?us-ascii?Q?kiQ+uCAinDgWZR9xDenDyWkR/m763fgUITo8g2+0+C0Lrr+eAMmOjbR+C0ni?=
 =?us-ascii?Q?WcU/GygRPa7AD7coG8xeEMAm4TF7Dy5oVGK3OB9dL56Nz/22h4U8hRN+CDL8?=
 =?us-ascii?Q?qnGeFYIrvNdXx06IGrjuSMfhSJ0KchidLOjhEQFc0V/u00XgtCoIVx9Mwgw7?=
 =?us-ascii?Q?zDaMzaX+F5sgKftFauorgkY+URRpl0nBmzKp1v5jkPyuWsfYCQ0kvk2XBA2G?=
 =?us-ascii?Q?kkshq5wVEwj8I2qPVqVr8RRfubx/Z3gEdOZONz3UfJIcvghYq28T0Rj8vz5F?=
 =?us-ascii?Q?KEPKO61d46A0vPdpUJzbTFC9VZlIo4CdNZQapuVoOZgSYoUKyBHUUpbcGshD?=
 =?us-ascii?Q?rISAKOE5suHHbQEAOZe++Q//3lo0Bs8WILMmBbN4XvTg53i8mwlIJHKVBEww?=
 =?us-ascii?Q?oVwbhRCClYz/dfuzgRDYfCDrIUPutPT/bjotXqtM8xT1+KNMSAL7MpTqqWRM?=
 =?us-ascii?Q?k39Mj+aavtW6rN9PI0R41hGT+UK5UXIEDNBmj2o6waaCbZ/zTljdV2WEQwqB?=
 =?us-ascii?Q?wMgmEFn23n3nHs4ztrc8j1MBKWZR/M7hwOokodMQQH8ebSrkj5Stah8FwfOP?=
 =?us-ascii?Q?U7QNrRZidhmnoGV/8gzEmeUQiAWinv1SZftXtGKLlbNrfoongqGCVdFmdZyz?=
 =?us-ascii?Q?OA6OrX8wPaqsp7Plkqz0PSR82rDW6Grc4l7d2FE089w9KTql/EygpTB+SgFc?=
 =?us-ascii?Q?TU8yw0tNu2+jl9oTHbAyyrmutOPAqNvjPSBFlg27j0nAcv0eHjPeREqGfBMS?=
 =?us-ascii?Q?Ihu7UDEPQpLs5G6oxHSw3fG7EF+zgiU=3D?=
X-Exchange-RoutingPolicyChecked: egg/SeVXz23wYtfUl9oQv2obaS3rC2Weio/DIr6DalkPADT5MKOuLuthvaBx7afzVFnxizCIPZiA36/a6SNdaBTc/wiO6s2wVUJvpu3NzrWcUUlA3ilkGImrICQABHuWkoOL/PHbAdj6vpZ1ydYFKnSoWY1TRUe1vFTbxKMehmKVNYpIDAxM6x/AuoHL0XNjJhiZU9HMkqBh9kia6bIn41K2HH9HlJjDBLOtt81Ms0j6cKipD7ZkTEQl2IzAjWb66bBPWuTDdNkz+QtBMeGjqSqw3kaFycD8GccrP2NixaI4sNbmfiC82yja/gX8EhzOeogKr23jnAv6v4vDqX2q0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d66d716-0af3-4452-5eab-08de8ad5918f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:18:20.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Frctti7KLCCnDrxSgIy6HDZQg4Sug+QInNZuzgE+vuir+sk5eGNXXGoOstsqhT2yDo4uZsC4czdKM8LigvspBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9369
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

On Wed, Mar 25, 2026 at 05:01:52PM +0100, Francois Dugast wrote:
> Breakdown the GT stats for copy to host and copy to device per size (4K,
> 64K 2M) to make it easier for user space to track memory migrations.
> This is helpful to verify allocation alignment is correct when porting
> applications to SVM.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_svm.c            | 27 ++++++++++++++++++++++++--
>  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 81cec441b449..59b3b23a54c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -85,7 +85,13 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_64K_CPU_COPY_US, "svm_64K_cpu_copy_us"),
>  	DEF_STAT_STR(SVM_2M_CPU_COPY_US, "svm_2M_cpu_copy_us"),
>  	DEF_STAT_STR(SVM_DEVICE_COPY_KB, "svm_device_copy_kb"),
> +	DEF_STAT_STR(SVM_4K_DEVICE_COPY_KB, "svm_4K_device_copy_kb"),
> +	DEF_STAT_STR(SVM_64K_DEVICE_COPY_KB, "svm_64K_device_copy_kb"),
> +	DEF_STAT_STR(SVM_2M_DEVICE_COPY_KB, "svm_2M_device_copy_kb"),
>  	DEF_STAT_STR(SVM_CPU_COPY_KB, "svm_cpu_copy_kb"),
> +	DEF_STAT_STR(SVM_4K_CPU_COPY_KB, "svm_4K_cpu_copy_kb"),
> +	DEF_STAT_STR(SVM_64K_CPU_COPY_KB, "svm_64K_cpu_copy_kb"),
> +	DEF_STAT_STR(SVM_2M_CPU_COPY_KB, "svm_2M_cpu_copy_kb"),
>  	DEF_STAT_STR(SVM_4K_GET_PAGES_US, "svm_4K_get_pages_us"),
>  	DEF_STAT_STR(SVM_64K_GET_PAGES_US, "svm_64K_get_pages_us"),
>  	DEF_STAT_STR(SVM_2M_GET_PAGES_US, "svm_2M_get_pages_us"),
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index b6081c312474..081c787ddcb6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -40,7 +40,13 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_64K_CPU_COPY_US,
>  	XE_GT_STATS_ID_SVM_2M_CPU_COPY_US,
>  	XE_GT_STATS_ID_SVM_DEVICE_COPY_KB,
> +	XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB,
> +	XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB,
> +	XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB,
>  	XE_GT_STATS_ID_SVM_CPU_COPY_KB,
> +	XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB,
> +	XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB,
> +	XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB,
>  	XE_GT_STATS_ID_SVM_4K_GET_PAGES_US,
>  	XE_GT_STATS_ID_SVM_64K_GET_PAGES_US,
>  	XE_GT_STATS_ID_SVM_2M_GET_PAGES_US,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index a91c84487a67..0251098650af 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -485,10 +485,33 @@ static void xe_svm_copy_kb_stats_incr(struct xe_gt *gt,
>  				      const enum xe_svm_copy_dir dir,
>  				      int kb)
>  {
> -	if (dir == XE_SVM_COPY_TO_VRAM)
> +	if (dir == XE_SVM_COPY_TO_VRAM) {
> +		switch (kb) {
> +		case 4:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB, kb);
> +			break;
> +		case 64:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB, kb);
> +			break;
> +		case 2048:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB, kb);
> +			break;
> +		}
>  		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_DEVICE_COPY_KB, kb);
> -	else
> +	} else {
> +		switch (kb) {
> +		case 4:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB, kb);
> +			break;
> +		case 64:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB, kb);
> +			break;
> +		case 2048:
> +			xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB, kb);
> +			break;
> +		}
>  		xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_CPU_COPY_KB, kb);
> +	}
>  }
>  
>  static void xe_svm_copy_us_stats_incr(struct xe_gt *gt,
> -- 
> 2.43.0
> 
