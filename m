Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995FFCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 15:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DC610E265;
	Wed, 27 May 2026 15:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEJS8r91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89D10E265
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779896686; x=1811432686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mrI9tJUhWV7azik5JgDnIUDJVvdA7yo+DgGX6YJQHnQ=;
 b=KEJS8r91RRPQk7TgrYZv4FBbN+96IbLH/5aWFD71M/VZTLih2kEDrVvh
 0A1A8XyeHtbS7iZsG7tTySzJLY1VFoCVUsZz9IIkmsTFu/WqKJ8EdNeFQ
 9l+4BM4MR9J/w+2pFyFmnMAwfb6BvGgo5S3+KVFwJvLzOkoK7Z83u5FWE
 yjXyr2cUZ7Dl6TTiX+gk+ONrQSWB4T9jdH67zD0YaCcJLes7P+CEoM2Qd
 NyiNwKakr1nSnK8F2RmoUlRKNCas9bSVaZG7rdPvtuh9X7fxOayBeTKcx
 nejFAEZdVp+HHI3tKgRinjiEXL2ronB1W/YU40w6Xgl74Hf+Qwu2KOADr w==;
X-CSE-ConnectionGUID: TKEBCz41Rwa4dZE4q3W75g==
X-CSE-MsgGUID: /V+FfUEpS/m1qs/ahfF/XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92205601"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92205601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:44:46 -0700
X-CSE-ConnectionGUID: Y9Q6zQ1oSq2ULy629ODMNQ==
X-CSE-MsgGUID: X+QHnZQwSGa1p7wdpH5wbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="265890216"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 08:44:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:44:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 08:44:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 08:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsVqlMPcW87Bj+vK9ZV8LA39vfFrERU6lvmgXJ2hQUQ46p+Y/oigxZCaCEmQkkhb+HX5hf8Ot7PDDdm+L/iOiIv1B0EJeb+P/sJfo0Vq45LBqXm4RLjTO8svpIC1MGxWIYwgvSSCAGN5EfvIr5eoSxelbwhtfsysHo2mt7Qgk63ubKw1lbXMsh2HhAwHTfhX2dk7/DGQYPSVvVrqtzTzWH8p5En39nGM/kZEDrzTJy2tNLOsq+2MmATfiDJBaci+78xEOSxQed3kyhloa52/lOC7TqM1V/UvdGS0H4pyQ+Lde2KgOR2Y74uyNZ8xZ7GxWTTsiPxQ/t6ZdNcGGc5YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flP1agR5RoFRM17Ie0mJpIkp1BTh4dLKobwjmOQv5Sw=;
 b=snWngANA4jT0nJP9gRbhgw0Yxp8t6JXMrwIJGpZwF9oXY1ltxRh+L/SBNt/0zz3/yRHQONouk2dwKUEGaIP2A1tY78iv91n38nv35CK+Ss1oWreND2+btxlR5NwFZFZwJoJAHDXWw4kg7ZHfGbaaOd0jyHw5maTW1YfE950YouzKEg7eACJKCoT0aDB18L2f7npJ3zy6N6iY1Adee3tmLkFGUEFqfbkIf4pk3cve4IycBN4JHVhrJGTTZWJcvB1taQxA2kaQTh23Vj6Gv4tqE8TfzfIGZbc37RSWvSje5j5U+WkVgI/hdnkkeRtrvjJ3lIrqUaSG85HxrpjmYr5HLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 15:44:40 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 15:44:40 +0000
Date: Wed, 27 May 2026 11:44:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH v7 1/6] drm/xe/uapi: Add additional error components to
 xe drm_ras
Message-ID: <ahcRY2UKw_RK9GnU@intel.com>
References: <20260527060241.3351323-8-riana.tauro@intel.com>
 <20260527060241.3351323-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260527060241.3351323-9-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH7PR11MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa812ec-b85d-4998-65fa-08debc06dd4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: OOYtiVzqNYP8AWpRqoQNJZHX+qi7PAKQ3pq3pCcq5ESGQvYC6vgTiHe524flV88zfVq8SPR3pLiSl6JKJR/6qIKkIwbRVTYDfDQIm1Es4LrsZs9zuemj4lLNRoAwDE5k2PgNCifQzFBrpE1uomyq+KsiJwe9AkSM/y2orXx01C83sACk+mrTQSJOms86dtijleKfm4vWoAfX2TzxfChRcxY1pFBoKwBng13Ld/6+6hwWGlB11+xv+4Rmj+9BU/XZ514KhKJ1R+SPXiSJ7fG4tdFGTe9f0Y6VBupZDHBCj8GWTvGIAlWlP865LIhEytXsr1zQjK7sJoL8459ikG3znNzNGCpaun1ACpQKIP+sOal6nCSrPBtm/gV4Bzt5wgV92jUpvqs7/cVdKY3d32JT+RT/eZGnPr3iNh+yEg3GQkuUH3tnsiQb4lKgNOU7GE47bJqqoNoZGdTP84GF0VDIV82KeHSi/dBXwDkK25uBGZYt5Xg+36WCxaBGSOPqU3wuVtiJvV/H+rKaDPYFSOr3ra8l1bQvmj90Xp0v1Q3imB3JqY/QqhxErn0YljaVOVVXb2/KmIhkzJwGmkAHq4KLccdo0KoJFR/Owvf46mGzx96+BH9VjQQrjl0S900mxgT3XCwtGHNmrAAwRpn8jptKX6tq0PF72bTqVsGWlLW7uk7L2znO0WdE+ScOSZV/rYNA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kbP8dNp9sqftEO18LMbpiYX5gJMk5hggtQZJS9ECqPj9GM+rxWMYoL19+in5?=
 =?us-ascii?Q?4rKlE7V1LoylCLq3ijORkKeg6/46WefawBf4Dni7XrpDeJoG7U389NeKaw9d?=
 =?us-ascii?Q?BaMxb7QJgRyf336ea/uM0zosGbM8YvQnDiD3owpjV+wxsKg1UaKwMFIxgqGU?=
 =?us-ascii?Q?6/2WQEehagagN/M7Gk6CuARG7B78Es8F/DE4pBYplWFzAXlD8E/StRTZoGNr?=
 =?us-ascii?Q?ZYXUdi0xCIlDsGEyYkech/66vvtm1v9ASeXUX7KuAsPKTbe9gB02ZY60u9Mx?=
 =?us-ascii?Q?P72E7CezVbTtbsXCIunRT368b0s54uLH91KgY9YyxRejRRDzvZmCVl8PPlut?=
 =?us-ascii?Q?Fow/9VEopx5fcz2PF4yAGVmynIf/w6Smaf1Uaoei7Erc+ivRM56aufJXsafw?=
 =?us-ascii?Q?vR2IJ6xEfeAJqKIj++liHereeqmy0EvHXrLeuQyk+3qz6kuZIFgjh2G36yWu?=
 =?us-ascii?Q?0nrYjep92MMNktxsP9CdHyspn/B3QQyg0uc/okPeOGr4bH5R1XkXf4bJ8o/p?=
 =?us-ascii?Q?elktgVYLTKViDKVvDb3joPsomhQrahfVbLA09ylWKeMWhXhl+GrHV/IxvjCX?=
 =?us-ascii?Q?Jbl2IQ/0L44pSkqfsTXgy9YUSfCOUygrJ3hNDgqeMx/KQV4v64L3YId70MDM?=
 =?us-ascii?Q?rd3tOrtj+FxI4+mvD0HG+HkZOxIXl9XMp+MdPfLWiwhm5aRwEjTV2k0FRJR/?=
 =?us-ascii?Q?60dwDFeKOChRx4wx5GVXJ/MlxnAuKqmSAZpS/QcPy//YRDtITxHWeUGk6rxi?=
 =?us-ascii?Q?jWB56cNZICiQ6+K13QVJblryLt4nCXPnudYPgM/AkFZxA1E16ctMq+5TMaif?=
 =?us-ascii?Q?YQ1QcMBaj2prZSbzjw27Rkb1Ah8QUsWTlqrtH7/oXs0hBNR/TXWWNLZtX34d?=
 =?us-ascii?Q?iy6idCKxmGkYJ67YDWVhqhr9rxGxU6XXuWsygbN2iayTXlLZTjTLn5H1UuPB?=
 =?us-ascii?Q?NxUOBPznj/IV2mhM81z+/3ProHkFR3mU4OCJC6+b3Je0q+47CfF5Tvpn1AE0?=
 =?us-ascii?Q?2D4Iux2ds5Izdt8IV8gjt/966gvpAQe+F4NaXV5Cq000Mz5ljOkjoMrvFUfS?=
 =?us-ascii?Q?BEk7Hki+hFT513xw70AaEf362+m3fFUYdkYR8YhnQBnj9Py2kHDPPC0LUe+L?=
 =?us-ascii?Q?8Oq3kvrH7RbnnRJ5YQ3Yr6pqqoGBzy2KzbzDo6Ik+ywZgb21Gz6nmUKGYOOn?=
 =?us-ascii?Q?0aNJf+zrxoON4ZAvUHar/zIWITsJHu9mJy+jrPaTolcWudXqtlnAPna+zLey?=
 =?us-ascii?Q?D/Qgm/0k7/O/T5Wkbd/LM8HD6sTI0sIzoW3VEjQAlFnHP9sIjpQom2mL/jYE?=
 =?us-ascii?Q?lPdJdUybmUGY48JXoASyj3soTQd6ox/2899C+hIRQuuj+G5ncr1oU10Va8Oz?=
 =?us-ascii?Q?zJEexa77ZmB3KItYtwUrwCkVk3/Vvuetu137lD60Tdmsp5LMzVJbCX9A8B59?=
 =?us-ascii?Q?+XD8hB4CaLlCtgMYSoV5kao/woQuPtrkdqIfE8izUANNPdkSOjlzrffEeozU?=
 =?us-ascii?Q?aRUBPi+lolXUscgqUy8odTtrXftQJhx19MSwPRHp7mQ/hxH4+1YAsf65gAsV?=
 =?us-ascii?Q?9oxtaAwahWMwKxkjKNapUlbFitj0P6xBNJWjPyGthG+72fv4MZOa4nhUz8X8?=
 =?us-ascii?Q?Z/7JVTfUkKUQBxyD4IQFKxdk4aps34gHkA0sYDk+J3IPUbk+zgwk4Ut/4Hqs?=
 =?us-ascii?Q?EZ2HcytxMGu/wmS7WCwImMYflzm53xwW0UIblzRZVFsZuoO5YaL8IPZilLNL?=
 =?us-ascii?Q?Zc1mGXm5Tg=3D=3D?=
X-Exchange-RoutingPolicyChecked: I1T/Sb4p/dLe2fndVuhmyjzWkiR7K4xtGPqR+1K7Rejf8ZxhE4V4ADSl4u+sHEAJpJ+kLp4Ju5LL0/QjblUSbVWXWxplprrJZ4yI8AeOM4VVRqM505QR/SQQbX2wAQRYPcxYvAnIvm81fwSAOYDX5JtDFDwGs2NqUbmnu0DxUMvikdh0BmhzGR3ZguBO9f1HJvicW5NX3r4+QOfk2129rwoX5pTHac8jZZ1WeQ36gH2Jo8A16STP/jLA/ZWzI2KmVfCP/Mghf1cimF2kxAvhl0aX7c6SxbU6tWVA6IzaPRstk78feU5ubvNLpdYmJTkAhOOZ502IBKsDuGojvOortQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa812ec-b85d-4998-65fa-08debc06dd4f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 15:44:40.5570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4hpsEkYq/WETvp4+KufPbGFDSc0I7WPdGS85x9E/o1UtB3R8lWoC/YbMcPlxZAXnIiuGLiCQ1yODCnu8AIO1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

On Wed, May 27, 2026 at 11:32:43AM +0530, Riana Tauro wrote:
> Add additional Error components supported by XE drm_ras (Reliability,
> Availability and Serviceability).
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 48e9f1fdb78d..50c80af4ad4e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
>  	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
>  	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
>  	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
> +	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
> +	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
> +	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_PCIE,
> +	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
> +	DRM_XE_RAS_ERR_COMP_FABRIC,
>  	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
>  	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
>  };
> @@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
>   */
>  #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
>  	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
> -	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
> +	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
> +	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
>  }
>  
>  #if defined(__cplusplus)
> -- 
> 2.47.1
> 
