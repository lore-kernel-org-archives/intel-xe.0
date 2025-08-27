Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896EC8303F
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 03:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0442010E06F;
	Wed, 27 Aug 2025 03:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLnMuQ/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC210E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 03:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756266334; x=1787802334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YRegiOz36bEc/r5O+97yVbTiq1Gx+SbXsvtkcsL/CGk=;
 b=GLnMuQ/KBItTDZxOO8DY8HcXEZxwOKTemnmDU457czIMXaZqZEbOgKsT
 YUa7qEeFbWMcA/cKrzkOcbGQiScrVfKKo9UJIbUST6Yd/gAOzp7WGhe7y
 38fwblqaq48S6ifohkTvc7EMFYsFxOhOsuM3V5gSBA5LM6a4yUDjPoOzu
 jIBAu6KEtOMJXa6N+uchoCl+ldlvEA5TYbHN2EAkFG3C7w/L7cF6OD+oM
 uW3I4MstEQYeSp1NbirGSPXK0Mh9oOZD/9+KXAML+cCM2QEc/ec+1sKs8
 /Kgpk1WSO+HAon5MlAOcHFPcVjIK7an77psfd4Jy/FdDczbIpOoVFxyHB Q==;
X-CSE-ConnectionGUID: qeJxzkrYQUaq8ttWvG/Szw==
X-CSE-MsgGUID: z3VJLcNnS8i7DV8zsnqW7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58432803"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58432803"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:45:33 -0700
X-CSE-ConnectionGUID: pgTmsAMsR8+6NJoq7xjSxg==
X-CSE-MsgGUID: sdyoCfi+RU2qSV6sWsTIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170138970"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:45:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:45:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 20:45:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJYoIDOiia1p+mN/nNFN60MZq9TeqOBWcm79VNhYULunJxrMLv9jIMjFIviev7U8VC71V/PThJAuyMTklMgKWjDh6y1TgfCm7euZK4lVtwcswdfMtDR1Ht+Q90DkQVtf1zU9jUtAijzSuszmyFQ5jhg6DLLIDDpyGI/sPSVj3lqZ29ScMpy25p9brWzln4innuw06ErnkKCJHiXwV0w/sOF7Zf5wdEUYzHPKDvkVPZGgM5YMICDf4V1LnK5NMtbEuEOzBWoPJXgIruD0p5Ps3+9YcpVzRNcSG93QQV2vHfAURHso/Me0TtdQSW1f4nQy9clLB/hQ71njPzsluE/+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrbdswSHDKL+cRERAaHny9nLT5MRxiNuVnf+OWmhRvI=;
 b=ooGcwvwhxDv+y7uqHLPr9FmQh6ka0T70d+6DbkcU0E85UL9BlOJ3CGXU7JUS8H9eZUA4nnZY/uVIJXDDPjxtCq6O7y2oFeiXTiVGANr1vCW4Jw5GFWljgyZ9EqIGtJIhrG+mF3owXrzUbJPU28QykIEZpwkwhxOCRugJR6nqYbxl1cWlBVPnA5peC4tQVh1Q2rDqz/Dj6u5oJ+YJ7RPAQm7S2SFpGheoUPDqBTLeKGDr2pELDuYwShPqooQJTW84dKuAMB1dRM/j3em4HvN9XneX4Mw2yT3t6BU7tQdwgA5OMTHQ6/DVfDPiOkl6HoP/UxmAmtFq5TCPderRHrJohA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA4PR11MB9231.namprd11.prod.outlook.com (2603:10b6:208:560::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 03:45:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:45:28 +0000
Date: Tue, 26 Aug 2025 20:45:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v3 1/3] error_injection: Add error_injectable define
Message-ID: <aK5/VEoEamJzjtn6@lstrano-desk.jf.intel.com>
References: <20250826205758.235606-5-jonathan.cavitt@intel.com>
 <20250826205758.235606-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826205758.235606-6-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BYAPR06CA0034.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::47) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA4PR11MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c3d847-7a07-4e4e-1318-08dde51c29d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DPpRhDNGgHNsQDLPIPl+l1+tnlAZtXoTdLKWlROMJx9uHUg6Ju98cmfvoKF4?=
 =?us-ascii?Q?A6Uk46bulvki3XvO2sPUfaTskBy5efM7krlkFYSJIs7kJ3BhZIK5xRnOvrJl?=
 =?us-ascii?Q?MhdCOiURLnQnGBAQ76zr5nlp5TZxpvOBBHUO0V9tzl6vHDwDEdferH80gTvs?=
 =?us-ascii?Q?CktqezOJMWFrgHXcC7j2MvuNYfsnrlCkGrEt2FxODiSYNKY3bAzQ4TFSXz0e?=
 =?us-ascii?Q?QH9y5fIBdifoHEbDw4nEeFmgmwhKX9eYpRcaclSAiEi/qg8mAbYIz1TqQeY7?=
 =?us-ascii?Q?lqcAe+uxOKYnfHkJGo/RZ6XXXW4TzdsFB5FKLJea0wi4YeUNXDzuFpFr//UQ?=
 =?us-ascii?Q?dzHQpckXkJ4VqwAJjNTge7b2b9wXK+F0s2/d0AJy5Hq37drXlcMZ4B634b1c?=
 =?us-ascii?Q?DVwAsRFh3ZEiovhfl2ZVFCtxD6cPKpnT6VecL02g8xP/62ijyIUZ/aHOmisv?=
 =?us-ascii?Q?Ko8ckoJp1ckI0rqm/LOMnVtWa45/FK1QQKhlzu1h9SAE0aqSJ4FPVwLTS9A9?=
 =?us-ascii?Q?TO7ti2NqOGJmwkm7q2W6tk7OmCBEcSA5+XxzZvPgIccoZc6YY2ayvGxg4kNN?=
 =?us-ascii?Q?HiN/AF1UfNF8GuTeZuxrn8IXeKqK5X2iYkJewZ2v+QigNveg4vmuFWdNpkSV?=
 =?us-ascii?Q?VPZ70J2bxi0KLr2jnqGvNSpo/NJx/oF8jyQnzmIfdgEPC1T23xamehXkvU06?=
 =?us-ascii?Q?r2D9zOPHHHCajEfLgNQ66p4yK+Qk+Oj70Wj19aK0ugP3qguUk7zw+KWPa/Mc?=
 =?us-ascii?Q?UjsAVk5zCaUectO1jaTUmkBEMR3CiE7rcmSmRswSM9WYH+dtC4IqaQR1iiNY?=
 =?us-ascii?Q?ThK5XRukbKKw3pk6SfUegwei3ZWJudx9xTXLRhW7nIeDIRWUl/xdWLSo4JXq?=
 =?us-ascii?Q?DCdjwu2zY/OAh4C5cW3/AhTUvwmu+6tfPZIfN+WLOtNtZQI/QZfaZat3Fznd?=
 =?us-ascii?Q?axW732PMVHb6ZiRmp4pCy34ql3d2VwPH6iRJeEU1+wYeNNuAfJjkjVvQ2rOX?=
 =?us-ascii?Q?HurDbxlfPLQaVUrSwyN8oUbqbr5hNyU1WLM17Q+ryf4oNi1KMXxD+d12izq5?=
 =?us-ascii?Q?usf7JlNN5nEPHnqddUg4IoK+ITlgWjzNUOrH1StmIqgLy2oyxHaL2tRGuQGS?=
 =?us-ascii?Q?JWjvhipDmuMBp2BG9GZ5vtK3PNGId0nS6KAs0aVHP37Z+nvCOHbw/qsTb4mj?=
 =?us-ascii?Q?6a6cibdNzI6U5Xsf4p3dXi8uyX7nTfOva1+GhtId+uPJCuE1TSQ4xOpqCkOw?=
 =?us-ascii?Q?uixX5BIojqAwgg/mo55X20EL66IXfc7ZqYEFPY6Yza4tGCeqSOsqtJRUrgq5?=
 =?us-ascii?Q?1n7gLTcBg2tDhgJp2cr05vwxK735QwxK5AXim9IxOKXqJKXnuWkPXDfpgyYV?=
 =?us-ascii?Q?yFpnJcxXl7ww6ikA53gQGqWeNZcVrqwkwLzyTZwdTTf74V5yS0AnQXr0/zMi?=
 =?us-ascii?Q?r8S8JAgsWFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idCdnCIdo5hGgN6zn8e10/T7tL5ZNJai38bxhLibvh7/T8+SiumJEYaFWoxn?=
 =?us-ascii?Q?SETzfU/3/Q3DuHJj/AST87exEW5gQpzF4M+yJrr6jjoVW0ekb0oBf9YbvWfW?=
 =?us-ascii?Q?yYX+2ulQjXjlsbuW85c12OrH9ypco1FqPiyOvcO1Hvb2e6Pe4O7zlUQ3lEly?=
 =?us-ascii?Q?+4lNOMbNPt5iNmqOHEQ9wCaN8dTjONYnXF4LA3UB3przlDcQdTaWrTpqWw62?=
 =?us-ascii?Q?z2RgsBxQQrLnQYWFfe/FSbpYCYS0L13cxU7p9DUj7Rdf3fP3xAQJoHcSBJTz?=
 =?us-ascii?Q?z1/fthClFxu5HvOH2hVW3IC1io3eWpi474D0cvGq9/Ml0sltQvsM/hgtE9Gz?=
 =?us-ascii?Q?utrYN/ykfSqmq5FAbP2JaktXO1Uc8hPuuN2GiX6WlWIKK/q9AfP/79OCrRIw?=
 =?us-ascii?Q?J9PoHB7nnN0OaVw7QyJdrVHWhNs/iFP37+lqyhY3Py1bxOroWr7aSMRCcR8X?=
 =?us-ascii?Q?xPEimGlribJto73PzToD96O6YK4Te6+86urumjNnKsVuV5VigTLYjcPVoBbC?=
 =?us-ascii?Q?rO2X7BWiebYyBHaAb8uMzPdT1MXqh2IIgfJaF52eOTR1U6Z5Oj0kyw4gKalo?=
 =?us-ascii?Q?nlOdO/jpr0OU4QSOtiXJho5GJjw4auNVicRJMeygAnLkTOWzjgMvUwHHccMW?=
 =?us-ascii?Q?BwN4P1jXJX7zdBr9hVOXDUxe5TP5jw8i5+q8v26fg/xZX0xMsc212/rxHM+U?=
 =?us-ascii?Q?T3nS9zDLNbf2jWr0Eux/wQj78b4RmLyVevoCgZ3ZxzqJRxMsIXcln+4WnVd3?=
 =?us-ascii?Q?ZPCWkoM+yEaqEwbEQjtaOlTaVJ3LDXtQpLW2Xa4khyw+EWMIgk6YAbrvkmf0?=
 =?us-ascii?Q?9AmRmL1+Mvu3DEDIKRVHqKerxtJKiUIrPeCicuRIey6lWNpXtldPXkmsRM1H?=
 =?us-ascii?Q?r7OhqHugY+JjfwnLXnaIj8p9RdKhrvRur+J3thymZ4j2HH/MPLCjOtZlTLMF?=
 =?us-ascii?Q?8zuijOxbEOtRsFlVRq7eshJHdf+7YJZiDjuWr+JRvrc90mx14jqffujL3nW2?=
 =?us-ascii?Q?zPLWriDml7uzyxKmDIsrM6GXTQbOoRhp9s+92OKJwT6TO60Mq3Skm8SsRUV/?=
 =?us-ascii?Q?lFlwpEnOkjT/O4L9fARk8k/Yvt+DOrv6gtTJvratDUVeWhGtQfbS4xQeATJq?=
 =?us-ascii?Q?vQRPyeOfkrsVo+qTflHkRPe8uIm/7JzWgTX0pf3roSrWpmye4oCgm8uxnyoF?=
 =?us-ascii?Q?Lpk67WGht/su2RTc5W8eBr/2xSC43jUzb/ClQyCt4X+1HDcVXOIBAecxg8c5?=
 =?us-ascii?Q?KpqOVGdvqfAXu+uRuGIs2uRwjS79Aonpub1Lr4jdwDzRietsn/+lrOTbInHk?=
 =?us-ascii?Q?Rf3BJg9k1IZX76CUu3/JewPOWTOjCC+Gb7fKKxoPfPA3qhpmozw7fFNxPMVB?=
 =?us-ascii?Q?4VfHpyBQ7B3Yz0q1/DwxJtxuUQXn46XOE++IUN9k8/KnkxKE/OHgQD2xW+43?=
 =?us-ascii?Q?Fywe5GGX/x6TDsb0riF59yd86IV330HdCdJMTCnVeXbBoJEvbu1XvMWjgySv?=
 =?us-ascii?Q?9WnBBVQv1Z+ZINmfbTR8ydZZmpxKwm3X2nCI7XML3NA3sx+bIjjWdO4jrHSn?=
 =?us-ascii?Q?ZkZawyCqnom3mPQnt9f/cobDbIdbTgdX3cBFHhbe7+WAxaZKxj1XB/VBOiRk?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c3d847-7a07-4e4e-1318-08dde51c29d2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 03:45:28.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ah0ezJSlM2vIYS/gDbuxEc0v/tvMQyLR2BF/hRo3s0TvBNk/1YtbV6CtspxLuYZd6DmOGMje99Xv2M4gYuMoUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9231
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

On Tue, Aug 26, 2025 at 08:58:00PM +0000, Jonathan Cavitt wrote:
> Add a declaration for the function attribute "error_injectable", which
> appends noinline to functions tagged with ALLOW_ERROR_INJECTION only if
> CONFIG_FUNCTION_ERROR_INJECTION is enabled.  This function attribute was
> added to include/asm-generic/error-injection.h, and has been applied to
> all Xe functions with ALLOW_ERROR_INJECTION enabled.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c                |  8 ++++----
>  drivers/gpu/drm/xe/xe_exec_queue.c            | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |  4 ++--
>  drivers/gpu/drm/xe/xe_guc_ads.c               |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                | 14 +++++---------
>  drivers/gpu/drm/xe/xe_guc_log.c               |  2 +-
>  drivers/gpu/drm/xe/xe_guc_relay.c             |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_oa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_pm.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c                    |  8 ++++----
>  drivers/gpu/drm/xe/xe_sriov.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_sync.c                  |  8 ++++----
>  drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_tuning.c                |  2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c                    | 14 +++++++-------
>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c                 |  2 +-
>  include/asm-generic/error-injection.h         |  2 ++
>  24 files changed, 52 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9e4773a17ef8..30c1e4c1d487 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -417,8 +417,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> -struct xe_device *xe_device_create(struct pci_dev *pdev,
> -				   const struct pci_device_id *ent)
> +error_injectable struct xe_device *xe_device_create(struct pci_dev *pdev,
> +						    const struct pci_device_id *ent)
>  {
>  	struct xe_device *xe;
>  	int err;
> @@ -634,7 +634,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>  	return !!val;
>  }
>  
> -static int wait_for_lmem_ready(struct xe_device *xe)
> +static error_injectable int wait_for_lmem_ready(struct xe_device *xe)
>  {
>  	unsigned long timeout, start;
>  
> @@ -719,7 +719,7 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>   *
>   * Return: 0 on success, error code on failure
>   */
> -int xe_device_probe_early(struct xe_device *xe)
> +error_injectable int xe_device_probe_early(struct xe_device *xe)
>  {
>  	int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2d10a53f701d..c8162ed3db52 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -199,10 +199,10 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  	return err;
>  }
>  
> -struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
> -					   u32 logical_mask, u16 width,
> -					   struct xe_hw_engine *hwe, u32 flags,
> -					   u64 extensions)
> +error_injectable struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
> +							    u32 logical_mask, u16 width,
> +							    struct xe_hw_engine *hwe, u32 flags,
> +							    u64 extensions)

Try to keep everything 80 lines or less if possible. Checkpatch allows 100 but
typically we keep everything under 80 lines.

With that, I'd write all of changes line this...

original code:

... foo(...)
{
	...
}

Updated code:

error_injectable
... foo(...)
{
	...
}

That will also reduce the diff size and keep original authors of functions in
the git blame.

>  {
>  	struct xe_exec_queue *q;
>  	int err;
> @@ -282,9 +282,9 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>   *
>   * Returns exec queue on success, ERR_PTR on failure
>   */
> -struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> -						struct xe_tile *tile,
> -						u32 flags, u64 extensions)
> +error_injectable struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> +								 struct xe_tile *tile,
> +								 u32 flags, u64 extensions)
>  {
>  	struct xe_gt *gt = tile->primary_gt;
>  	struct xe_exec_queue *q;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index e03222f5ac5a..683457ad9e66 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -256,7 +256,7 @@ static void dev_fini_ggtt(void *arg)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> +error_injectable int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180c..d873ddfec16e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1405,8 +1405,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> -			  u32 len, u32 *response_buf)
> +error_injectable int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> +					   u32 len, u32 *response_buf)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 5631722f34f5..524b6e89f1c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -386,7 +386,7 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
>  
>  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>  
> -int xe_guc_ads_init(struct xe_guc_ads *ads)
> +error_injectable int xe_guc_ads_init(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_gt *gt = ads_to_gt(ads);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..fef48b08baff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -213,7 +213,7 @@ static void primelockdep(struct xe_guc_ct *ct)
>  	fs_reclaim_release(GFP_KERNEL);
>  }
>  
> -int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> +error_injectable int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -252,7 +252,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> -int xe_guc_ct_init(struct xe_guc_ct *ct)
> +error_injectable int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -1149,8 +1149,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
>   *         a negative error code on failure.
>   */
> -int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> -			u32 *response_buffer)
> +error_injectable int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> +					 u32 *response_buffer)
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
>  	return guc_ct_send_recv(ct, action, len, response_buffer, false);
> @@ -2069,7 +2069,6 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  
> -#ifdef CONFIG_FUNCTION_ERROR_INJECTION
>  /*
>   * This is a helper function which assists the driver in identifying if a fault
>   * injection test is currently active, allowing it to reduce unnecessary debug
> @@ -2080,11 +2079,8 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>   * attribute is applied. Compiler optimizes the static function defined in the
>   * header file as an inline function.
>   */
> -noinline int xe_is_injection_active(void) { return 0; }
> +error_injectable int xe_is_injection_active(void) { return 0; }
>  ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
> -#else
> -int xe_is_injection_active(void) { return 0; }
> -#endif
>  
>  static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..fd1f24cae4d2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -251,7 +251,7 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> -int xe_guc_log_init(struct xe_guc_log *log)
> +error_injectable int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index e5dc94f3e618..4e33a6d8c9ca 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -330,7 +330,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_guc_relay_init(struct xe_guc_relay *relay)
> +error_injectable int xe_guc_relay_init(struct xe_guc_relay *relay)
>  {
>  	const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
>  	struct xe_device *xe = relay_to_xe(relay);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 640950172088..3d0ed0909ecd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -580,8 +580,8 @@ static void hw_engine_class_defaults_fini(void *arg)
>  	kobject_put(kobj);
>  }
>  
> -static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> -					   struct kobject *parent)
> +static error_injectable int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> +							    struct kobject *parent)
>  {
>  	struct kobject *kobj;
>  	int err = 0;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 58bee3ffe881..d794f512da0f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -119,7 +119,7 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>   * Return: 0 on success,
>   *	    -EINTR if the lock could not be acquired
>   */
> -int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> +error_injectable int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
>  {
>  	int err;
>  	struct xe_device *xe = gt_to_xe(q->gt);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ef6f3ea573a2..7c13d7eff6d9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -90,7 +90,7 @@ static void mmio_fini(void *arg)
>  	root_tile->mmio.regs = NULL;
>  }
>  
> -int xe_mmio_probe_early(struct xe_device *xe)
> +error_injectable int xe_mmio_probe_early(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a188bad172ad..31d6fedf0791 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2225,7 +2225,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
>  		xe_oa_is_valid_mux_addr(oa, addr);
>  }
>  
> -static struct xe_oa_reg *
> +static error_injectable struct xe_oa_reg *
>  xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
>  		 u32 __user *regs, u32 n_regs)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 6a7ddb9005f9..175d4216de12 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -331,7 +331,7 @@ void xe_pcode_init(struct xe_tile *tile)
>   *
>   * Returns 0 on success, error code otherwise
>   */
> -int xe_pcode_probe_early(struct xe_device *xe)
> +error_injectable int xe_pcode_probe_early(struct xe_device *xe)
>  {
>  	return xe_pcode_ready(xe, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51934d5dc44f..58996110d2ec 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -270,7 +270,7 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> -int xe_pm_init_early(struct xe_device *xe)
> +error_injectable int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c0a70c80dff9..f1313d50f297 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -98,8 +98,8 @@ static void xe_pt_free(struct xe_pt *pt)
>   * Return: A valid struct xe_pt pointer on success, Pointer error code on
>   * error.
>   */
> -struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> -			   unsigned int level)
> +error_injectable struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> +					    unsigned int level)
>  {
>  	struct xe_pt *pt;
>  	struct xe_bo *bo;
> @@ -2132,7 +2132,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> -int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> +error_injectable int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
>  {
>  	struct xe_vm_pgtable_update_ops *pt_update_ops =
>  		&vops->pt_update_ops[tile->id];
> @@ -2364,7 +2364,7 @@ static const struct xe_migrate_pt_update_ops svm_migrate_ops;
>   *
>   * Return: fence on success, negative ERR_PTR on error.
>   */
> -struct dma_fence *
> +error_injectable struct dma_fence *
>  xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  {
>  	struct xe_vm *vm = vops->vm;
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 87911fb4eea7..46fd51d3ec60 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -104,7 +104,7 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_sriov_init(struct xe_device *xe)
> +error_injectable int xe_sriov_init(struct xe_device *xe)
>  {
>  	if (!IS_SRIOV(xe))
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 82872a51f098..c0eebd7bf774 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -110,10 +110,10 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	kick_ufence(ufence, fence);
>  }
>  
> -int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> -			struct xe_sync_entry *sync,
> -			struct drm_xe_sync __user *sync_user,
> -			unsigned int flags)
> +error_injectable int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> +					 struct xe_sync_entry *sync,
> +					 struct drm_xe_sync __user *sync_user,
> +					 unsigned int flags)
>  {
>  	struct drm_xe_sync sync_in;
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d49ba3401963..e1881373e0a8 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -138,7 +138,7 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>   *
>   * Returns: 0 on success, negative error code on error.
>   */
> -int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> +error_injectable int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  {
>  	int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index a524170a04d0..0b9ea7fbc710 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -148,7 +148,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -int xe_tuning_init(struct xe_gt *gt)
> +error_injectable int xe_tuning_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t n_lrc, n_engine, n_gt, total;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a236f1d37248..5838798ad1de 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -817,7 +817,7 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>  	return err;
>  }
>  
> -int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> +error_injectable int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  {
>  	const struct firmware *fw = NULL;
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e913efa2057b..9cbe1256439d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -220,7 +220,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
>  	}
>  }
>  
> -int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> +error_injectable int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
>  	struct drm_gpuvm_exec vm_exec = {
>  		.vm = &vm->gpuvm,
> @@ -781,7 +781,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>  
> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> +static error_injectable int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
>  
> @@ -1629,8 +1629,8 @@ static void vm_destroy_work_func(struct work_struct *w);
>   *
>   * Return: 0 on success, negative error code on error.
>   */
> -static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> -				struct xe_vm *vm)
> +static error_injectable int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *tile,
> +						 struct xe_vm *vm)
>  {
>  	u8 id = tile->id;
>  	int i;
> @@ -2422,7 +2422,7 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
> -static struct drm_gpuva_ops *
> +static error_injectable struct drm_gpuva_ops *
>  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			 struct xe_bo *bo, u64 bo_offset_or_userptr,
>  			 u64 addr, u64 range,
> @@ -3432,8 +3432,8 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	}
>  }
>  
> -static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> -						   struct xe_vma_ops *vops)
> +static error_injectable struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> +								    struct xe_vma_ops *vops)
>  {
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 52c7df4c3afd..4069c06c1476 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -1011,7 +1011,7 @@ int xe_wa_device_init(struct xe_device *xe)
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -int xe_wa_gt_init(struct xe_gt *gt)
> +error_injectable int xe_wa_gt_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index ada0d0aa6b74..3d6781b2abf6 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -196,7 +196,7 @@ u32 xe_wopcm_size(struct xe_device *xe)
>   * size. It will fail the WOPCM init if any of these checks fail, so that the
>   * following WOPCM registers setup and GuC firmware uploading would be aborted.
>   */
> -int xe_wopcm_init(struct xe_wopcm *wopcm)
> +error_injectable int xe_wopcm_init(struct xe_wopcm *wopcm)
>  {
>  	struct xe_device *xe = wopcm_to_xe(wopcm);
>  	struct xe_gt *gt = wopcm_to_gt(wopcm);
> diff --git a/include/asm-generic/error-injection.h b/include/asm-generic/error-injection.h
> index b05253f68eaa..83e7acc7d49a 100644
> --- a/include/asm-generic/error-injection.h
> +++ b/include/asm-generic/error-injection.h
> @@ -31,10 +31,12 @@ static struct error_injection_entry __used				\
>  		.addr = (unsigned long)fname,				\
>  		.etype = EI_ETYPE_##_etype,				\
>  	}
> +#define error_injectable noinline

This would be eventual goal but we can't merge core kernel level patches through
Xe / DRM branches nor can we change the core of the kernel without sending these
to the proper mailing lists. I'd move this to xe header file first, next steps
would be proper patch on the correct mailing list + an update to error injection
kernel doc explaining why this is needed + usage.

Matt

>  
>  void override_function_with_return(struct pt_regs *regs);
>  #else
>  #define ALLOW_ERROR_INJECTION(fname, _etype)
> +#define error_injectable
>  
>  static inline void override_function_with_return(struct pt_regs *regs) { }
>  #endif
> -- 
> 2.43.0
> 
