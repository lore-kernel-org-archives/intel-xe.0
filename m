Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB6C87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1625010E10A;
	Tue,  5 Aug 2025 03:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUu9YBNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F66310E10A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754366349; x=1785902349;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CSuhMAHrfX1ugz5qxQsHrwgIc1ulAOACK3wgcH3lIm8=;
 b=WUu9YBNwwTyF6Ezs/40pJIlbUMC0/TyX+vyoJN02lm3EsTtybzY2O8rd
 wDKFROkYHwJkKA57CnfwO1khqB3GzoFZOMmNZIm4wrbAHrVDnFIJl3zdQ
 H9hWn2OFXTNBK5h2LU80UzpU+q0PT+W0z4dZUySRjJP7T5OPot0lJhBSn
 VjXAbu8Xw479+ocTKStUx+l5yT2MQX16y5XTw3lP7+KZyr/6E3IGYktsf
 i762rjk4N2ztu8ei/E+eGJ2mB6dr9iYAibSk9IOLCtwVFS1bLCpGFJFkK
 JZiKVw6eJiMyISAciNnOOfvODg0LFGDtrs/4NJQNFu44LUNVe5oVYciIa A==;
X-CSE-ConnectionGUID: DtkXTnhWSge1lCnHAVTrzw==
X-CSE-MsgGUID: +PrkH+JbR7iQ142uvd4qGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68016567"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="68016567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:59:08 -0700
X-CSE-ConnectionGUID: ijvAuGuyQJO1+tYsE2Qc9Q==
X-CSE-MsgGUID: H2qV6prETl2bfOanELEj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168612834"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:59:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:59:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:59:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8vOIYmWrL7E4WzspLCH7ZaFOBfcT3UeRPOpYbaZKiXw7NInfvPdTkXjtUXwQPVxP9kIsbuQaVdQG1TYdj88lTFm80WEwYe7cd049x92r4uHBsK4uMzO6IdsSoBwqRVTJajRlfMu2fOYlmrDUZhXBINE+RETX5i+vpKP2bkGMg5iy5KHtBpdLs02yNWHh8kN4C7Y3dalLMM037piLwg5TPorv41Kljcqor8qT8FS2NH0m4ZVYWQFQVOYCvJrnt68ufKgUx/6XsR81uEud3M9PPzMwqTSeMjadRRXra3/LF47lPn4omM1hB2e2Rj2mYDxJIH7wRk8tiWhu/Sh4VOm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B35Zevoi4oJ0zalTvXXVrDBlNDEdFTsbd4W9u7yUDLM=;
 b=InZbd9fEDvTEmlfYBr5ZxLvAabYNQH7BnNP2wb/YwZK1RRuWYaptToSU/BBQrUEqvhCZcsCNRXpnyyuKbzruwvQdq7RSSPRsODYeN6vK/Pnkv6M8L7Loa5cNzQdz6VPShti1QMR0VrzQ968Mus8pydX004J9yKqRhpK9qv+8YlgUd7Ts8TNbVmaJ2nKpePLKgblzBc4r+JSW1hrC7/77TengXcJqSyUuXOt9QtoZCizayUrW653BnRR7cdNlaSFNQoCRxOrs06MZVtbixIA7IP6lB2c8lNohbbTm2tkxPAGbElUDZNg5+mBaxgykxyPRaEEJODRtdXr98jTE2K0STA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Tue, 5 Aug
 2025 03:58:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:58:44 +0000
Date: Mon, 4 Aug 2025 20:58:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>
Subject: Re: [PATCH v5 03/25] drm/gpuvm: Support flags in drm_gpuva_op_map
Message-ID: <aJGBclFODQhleoZk@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0339.namprd04.prod.outlook.com
 (2603:10b6:303:8a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abf523f-a8d3-46e3-105d-08ddd3d45f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?griWbQ/7MiHf8NaAzyiCwZTIpHae3p1TsBRzqO13P6qqDoRckSH1IQLrCqde?=
 =?us-ascii?Q?4PATYfDE/CU/sRqdLbWitBDREQXHhnK1TUYuNiby0P/YZwQ7scZ7Iehl7Hxf?=
 =?us-ascii?Q?T4bCY4Sut+HkY1IYG2VqbpLeaQd0qxz905AGlhI1YrqmlyAaM23DnkvzJ6gI?=
 =?us-ascii?Q?SYRcUnyY2Iiugk0poEorHwA282ZHNoCvgsidCeeAeEO4J4Jz2QPnmFbtdyfU?=
 =?us-ascii?Q?8WOPq3yt2eRlP//QYmKRS0FWzGYl9Nz4L16I4q0CJWRMeSQF8I3Korm1k/p4?=
 =?us-ascii?Q?GkPiqhwMZzKSYwdv/VSgTLTliGlFZ6qHFZxLE5wP2pb4c3Sqr+MkAsWh+X0O?=
 =?us-ascii?Q?prmkW5e9vmwy5hZ844zMImzo4hnQVYChRmiXK1y6vrXz0lI25yghbFbAamNl?=
 =?us-ascii?Q?an8d6uSiskzjwq1luhlUkIY86q1EYnuoM2LFnbkl6yCdOJRIncA/4CmnGOgN?=
 =?us-ascii?Q?XD2rlSMDddEH/oKRZpzOM7+WcXTS7iiuZukJqsQ1z5TfW5egyrzOo790eOtM?=
 =?us-ascii?Q?OE1sQv0hGZ6meFLNZBPT7p87rT/GzImiNjnDjP/j0+t9Ww1tIGv8QvcxhQAO?=
 =?us-ascii?Q?n6ybhXdqp0RMbiljWQlGb3FR623uQWVMY8O4DT0qBgIYKHCeRQV2zTCzMcFH?=
 =?us-ascii?Q?XnsYGlUPOS9/lCJ6a55gRXVZNSszjkYum0GKtZ5NZ6IcGsJUVInQBz8RNXwr?=
 =?us-ascii?Q?pb9nmSZ54XpD832FpdSEkP9dBw8sjEVQafJdKIBkkclQtoLAeOJT0a/43Xif?=
 =?us-ascii?Q?4/P30ukW/i9moJEl6oeJ0NyvymQmBTO0ct3kgynWymv8baz7IvziluJX7/uy?=
 =?us-ascii?Q?CESCRzeKsNUaJmHeksRf65LZO4RJ+wREYl4O8JN5WjnGhgQw7AZA8POMrnce?=
 =?us-ascii?Q?godMF1V5/sphWP8LBOB2xMvgwebIe0LPHLmk8fQDtJVoQs/yK+KiSZ++sc43?=
 =?us-ascii?Q?wHxAEDrDo0fQjMvXY4QihUcNhLmtzsEiHkUQ/Vk0SBtrOd0B+2638I4lau2E?=
 =?us-ascii?Q?NPDZnOEmmMr6tfUi67rNJoZtEt/bKw5t28v6bizCUMjazc8pPNhSfZg6EWA7?=
 =?us-ascii?Q?Xv0iL9ZZdl7wtXh1i6mNHY9uutWJ0ow/zIAh3CcieGVDLw227r43xKFW2MZr?=
 =?us-ascii?Q?+FRsw/iHMeqfFk1WHvmBLSHvcB4WLiyIjXpfpOPIC4ypr1BtSzqhxFvvQG26?=
 =?us-ascii?Q?rv00MBbhhN7RiEp1MaFPOKcWlcSkbJvH8S0mMCpZy0MfMUTRpdbcFR/VurEC?=
 =?us-ascii?Q?X8y84mI1rxmcLiNkj0J18nUYojVxVtEISZ4HkIzMxDXgDoh9Z2PqnGLIGDuL?=
 =?us-ascii?Q?6IbpGTJ4ddGkmJXCzKnbZzvyr+HkzzicT/rwZvOw/sJpDZPItISe4jZaBtlN?=
 =?us-ascii?Q?tfQMG0M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dKHeR230jUQLQY6Uk3dmtvQuESXiXluV+XJtMNRwnHGBEq/pS4YKoxfVIb4i?=
 =?us-ascii?Q?rn8MSAqqhxc6pgfrayb0ikJ6EF1rfaBlZ+3MbqMUSsr0oiLJmVXrl6OL/0g2?=
 =?us-ascii?Q?TwkBro8o7cZr014JkX4G4hXd8lvvjdu9pBZsVrYgJiIKEph8FGb/IMY+imRn?=
 =?us-ascii?Q?QfmqGQDJVFQPRMe4pyZZ6Sv30xuw5yQQIUEmQ5CQ0DsK3GZJWs3PJOS7EOe+?=
 =?us-ascii?Q?drvHQlhJ41MyM1znuzjl6EHH5uTCpsSjHg9d9iaVWUFIEBGe7W7b5cDZi6Fw?=
 =?us-ascii?Q?qXJkhxd1/8zPZI+oFVWTTELfMNs6+hJMSkOzaRFJp7tph168UX7Hgk/+BKf7?=
 =?us-ascii?Q?G/n9APrzFwiAo/i0Zuju+hFFt8WARWH0tJR1VZiWQkNaDQD7P1yt9jXJo8eg?=
 =?us-ascii?Q?+/T/vb9b8AocPG/ssUab9IHHBNWryZblvnFiQ8VkS136f0EGJbJpnxNy+Via?=
 =?us-ascii?Q?jhkDCCjXiRdjN1ACXsISrVlMiqWGIulMyQ3ji5O8i8T4zW6bpmdtY3um61Cz?=
 =?us-ascii?Q?t7BARxNEbt3KCtVLlenCvV8WOR3FSjWnEozQIG/Pt+Xlf4cAdig+u0AWwvsq?=
 =?us-ascii?Q?IWvjLNWAF9tjAT1AZZrq1GYvUwrjXhGJxkE3385VnxAeWGVBRKgemARXwifS?=
 =?us-ascii?Q?M9ATc7b79Sz4uTSecwqGo/0SR1yQbRg6teYSnxiPImYRTNn/7gUycAthE6BF?=
 =?us-ascii?Q?/+G9s/GoOjrQdNIXTpA666UfpxcuiavxjtyANWC9nhIIyxRfNGe3wXvUSEMp?=
 =?us-ascii?Q?7ymyLVLbhlZJAv9tJjqiOyU3fyigf1QqZ/FXz4A+WWHyJItO5w572ATRagsF?=
 =?us-ascii?Q?o4Ctl3JgGq2XtMxwAS/hWK9puI/Q6VZ9YG3f0SF8iI8fsOietz8l/IhpivxG?=
 =?us-ascii?Q?sNj0U0fTRsvle06619zXT3FUBCdTg7iEjJ9kzteLQVJrKIgsF+ZkOxPJXl/6?=
 =?us-ascii?Q?mt6/mw8klNbc3B8KeOLkiYCEykDngXnPPVcHdPcRN/l6dohwOE/JMYGVE5Dn?=
 =?us-ascii?Q?T3noViJs292fXCe9VGZ7HHahyZ3koSREjah6h/0B9FwuiWklE39grhLPaXu1?=
 =?us-ascii?Q?AgnMrkqq+1kz1W31knzKZZipWAPN/yhRwmlElOArF83aYNblKk0H5NCbjm2Q?=
 =?us-ascii?Q?B8LGyvGV6sLJXFKippYBYvyvMVG/Z07+VTqvoQpHbzx2f/UMxmgXHCjbs6zj?=
 =?us-ascii?Q?m8jS9PzmajSdtq9Hkjw+plOONRINXuEwNgwzorq47GQhQfzl4V8+NslqUMZ2?=
 =?us-ascii?Q?kpfNwdaR30KE5y1e+2ANBroajcfNsKvzAyp8jybt5YhL8B85WDtWekM/iBYG?=
 =?us-ascii?Q?aDJ6TXpPYLSLo9cxHaJKc6B8KlIdKxJtbx2Jqit2Lj/tQm6Om3UWHzmG9kr9?=
 =?us-ascii?Q?rQS5Tw/GFhf8eFrrBcVaEiO99kH0KOqPq6ayv/4NtSV/Mkq38CUzlud2KzDQ?=
 =?us-ascii?Q?WIMCH+YkSX9PiKbVuHowHL8513wbMP8gNV1B1ER4sJC3/YMLtZGar+3e+O2w?=
 =?us-ascii?Q?i0BlR1RhIpd30l5Lbg7Vst+HoosDFu3hitreuXUf+NJiICMG/QZErFMKrJzV?=
 =?us-ascii?Q?52UIt6yFsSy/tdrbidjHELJcZMilwBgvsBb69FxLgxe2mKrNIwWsKxTC6AjE?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf523f-a8d3-46e3-105d-08ddd3d45f86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:58:44.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db1ZziMGAdz605TnCyGz/6FUjoMvlJ/FWGiJpqWbDJrwN0dq4M2JFyh/tXhKLui8nD4nVOS3oPhRu2P4whefng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Wed, Jul 30, 2025 at 06:30:28PM +0530, Himal Prasad Ghimiray wrote:
> This change adds support for passing flags to drm_gpuvm_sm_map() and
> sm_map_ops_create(), enabling future extensions that affect split/merge
> logic in drm_gpuvm.
> 
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/drm/drm_gpuvm.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2d24d000f2ee..75c616fdc119 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -810,6 +810,12 @@ enum drm_gpuva_op_type {
>  	DRM_GPUVA_OP_DRIVER,
>  };
>  
> +/** DOC: flags for struct drm_gpuva_op_map
> + *  %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE DEFAULT split and merge,
> + *  It cannot be combined with other flags.
> + */
> +#define DRM_GPUVM_SM_MAP_OPS_FLAG_NONE 0
> +
>  /**
>   * struct drm_gpuva_op_map - GPU VA map operation
>   *
> @@ -847,6 +853,13 @@ struct drm_gpuva_op_map {
>  		 */
>  		struct drm_gem_object *obj;
>  	} gem;
> +
> +	/**
> +	 * @flags: Bitmask of DRM_GPUVM_SM_MAP_* flags.
> +	 * Use DRM_GPUVM_SM_MAP_OPS_FLAG_NONE (0) for default split merge.
> +	 * It cannot be combined with other flags.
> +	 */
> +	u32 flags;

See my comment here [1], I think the flags should be in
drm_gpuvm_map_req rather than drm_gpuva_op_map as the flags are only
used gpuvm side on op creation, not driver side when consuming
drm_gpuva_op_map.

Matt

[1] https://patchwork.freedesktop.org/patch/666205/?series=149550&rev=5#comment_1222150

>  };
>  
>  /**
> -- 
> 2.34.1
> 
