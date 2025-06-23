Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0900C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 05:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500A510E160;
	Mon, 23 Jun 2025 05:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TB0BDRnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D7210E160
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750657853; x=1782193853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KrWj65hpzSjFpm62iLNO4KGNjkjslStxJRMYYdvPUsA=;
 b=TB0BDRnRiXSxIOBv4RbsGIQVKX6H3k7mpURcsi6z9qLkQPMVgqosuFCC
 hj3JIvMtBVfNJdPE6XPOmf3KJMnhqvqzTZ3AflliyeReIaa2bVKJa+vk4
 D8rHDY7HZbKya0uJWRtrFcr6v8SzZUG+pxVL1vLccIsBAbsXWpmAA2LP6
 VyamLbMhLK8MVol7gcMPA1MSpPBSFzgO+glKDrOSMYOuXORlSlibDgjTP
 QwX4v1UnQViW8FinTi7WARp9PACpQHk+szO1155lj1ivh2w03Rz90MVFx
 v+Y4UKkcAdXdOiBh2cuQRCgwC8JlddoU4zsC5tgrSSYK2znk53OnfAxVc g==;
X-CSE-ConnectionGUID: dXOXsZj9RrWrDM9eYX3+2w==
X-CSE-MsgGUID: mtUdecU8RounEGT96C3Zsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="40457807"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="40457807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:50:52 -0700
X-CSE-ConnectionGUID: 4mg+xg6uQCWEcoV/PBN9aw==
X-CSE-MsgGUID: 19U8Nc3mRVSz4x8hVUmjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="156036396"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 22:50:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:50:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 22:50:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 22:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkWAntnoMJDh7Ncba5ItGS6VBBqlwPK9ueqGY3TPxcd7eNoHdZEXT5Mx9VPe4Sc14twwzIWviy1okmZqUpReqn5s42P7fwRRXIleSdxTWMjzSeK2ukdn2CdVgL1eIlI4qhOKegyW3tgj/gWIsMAT8Bb64bvhGiQttTAHcuUyTexpD3q4G662s0af3rOq2j+C6YWk8Wq0Qxks4tOems+KsYjaPTUGeTfDLkOWcYDvPSQiF3SWIdFd0oHUgiXpGkHWKGYMUyGZWkEuApKrogBGw+iVfJuSwndyefU9XvaEVJROu44t1xK211wkjYWYTu8hYbLMQVWJzMfDP+YMiNML/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/fh+SAuOeprWMsKunI2vSbXuySB3zJHqh4nV8kOPwc=;
 b=Zal2MHR5KW2ZhU5yH2jHI7Wi8vpPIL7AtCzqO5Bhcl55JyNd21UvAfutEyG+w05DjJYeL9TcO0GCVf8Mj6Gg+HFnbF0e6RhfRb24sioRxjvZQdn76DFUrzCYFrJPV52aUrsoixZyA0Fvfjfgh0K+sU8Igvp4NvUUCWOjmsw6nlJ5UTdFC+ouRcQ75vzCscjDT0AoXgGJkqHG8h6XBV23CDB6lrcLXsfpKDKHQeiM2i7zEdsxymLNHU+EzoEE0vwwh3UcUZ5j8WRGgRgyyAQ+3pRCX7Uh4f7kt12Fa24p0sGjVw9sGJqq6X5CNad0+iVSF9KC3VRtwmdlqYyorSqo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 05:50:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 05:50:21 +0000
Date: Sun, 22 Jun 2025 22:52:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aFjrgNVdY6rOPezk@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0345.namprd04.prod.outlook.com
 (2603:10b6:303:8a::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3eab97-768e-4fa0-ee62-08ddb219d738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f72GXyvEATQX7qGBHfT5GCr8FXHk13CUH3JXsRF03SVPJ/D/6U/HtrdcZLXE?=
 =?us-ascii?Q?t6gdXwdPNdmkw6VwWgheeny/u9lBcQO3u7R4t63JuxUbgeDDDIPT+getaKCT?=
 =?us-ascii?Q?H28gs9k6i9v37JH65Da+1OAycSgIchhBqI2aPww2/zGIgnoKVkea2UleKZw/?=
 =?us-ascii?Q?3i0EeSR8cUputbhtaPwc2kUdaxLUTI/YsaoDrfekzgfhbL7Ldt57TGVZLl6K?=
 =?us-ascii?Q?NDqgKAoFcXmaDTscxI1p9LPDGvOHFUclf5/2F1RTaii/QuvoK3JiiG/tAFtM?=
 =?us-ascii?Q?QxjanihDftcBc/h/f/x68ypLOVp/QqmW+g5K2QB3akIDmpq+3KvL4bTg2wlf?=
 =?us-ascii?Q?iVoRz+5bt+J7h+InUBF0KkYZege9zfqqFmaz+8rsH1DY+oVQPbTUPM8PyjFw?=
 =?us-ascii?Q?NwUSXOjuwgrKwsdqKdbzXsNKLl9SxPqajU7GMQUHYaR3Bs3n6m5l3LEspa5C?=
 =?us-ascii?Q?8nbPcYcnYo1eN6qfcdXQwfpbRoyP2j5L+tyzx0DSxH8cH9nBf5zCn2t0EmD/?=
 =?us-ascii?Q?9h/DQ7JRRhjZjZHcgehA1hr6dU03Kqmi2lk1P+z6IH6JSi+LtJpSj1ygZyFJ?=
 =?us-ascii?Q?mQot8M+e/1jYRzw8QtuHqSHpopwDYYk9mRhZA7DrEruSWblGLOd3VfnGwHMq?=
 =?us-ascii?Q?8Re35PAN98bh59a6W5nB9lSv+cUsnkpWUbAD8WXZLspbE8DjHqhThepKsAYI?=
 =?us-ascii?Q?Zf8OLwklXr/bZyGatwgI2TCfJJcRyJUYdkdTHIGyf5QhqVTIKj57hYKS7OLC?=
 =?us-ascii?Q?dVmz/2ghTqy9srfjjeIYrPQEi/gZRdv8HytDVXhw5M1gWkBIwOmy2EHVTOCi?=
 =?us-ascii?Q?W3VRAOsZ79Qov2VjM4TW/MJSXCSwGaZ9Z6T+qVIgDnS6iWModgx/pAsRZOLN?=
 =?us-ascii?Q?gaWMURYLbLUaJroZ0ydsCbhMMajr+58gUxax/r6P6dfV7mOylc7Dtu1BudcW?=
 =?us-ascii?Q?lYUOTIun+JtcAsRngUHQcPHojUxaZUFr7SXMWDevepsWqjkjmRTvTmpDcTPM?=
 =?us-ascii?Q?A08SQbeTnB0Kas2LRQdFpUfe03foEBWZdjEPvyATMJG3YuizCR9W7DjfmAXR?=
 =?us-ascii?Q?+wti/uveTGyCQ/1DofdEMuxFk8FRnyXU9FaHPo32dfd7c3adrAooJNlOP0Lm?=
 =?us-ascii?Q?CMUg6RI8brZ7Azk96d9xXoaW689UXqZX0itEw3MuVyLbBV3HcCs4OWVJL2LT?=
 =?us-ascii?Q?asqM4zf5z5VfAldR3AJoCJv08XiIST3YxC2LHp/ZDB8cKpsA1e4MMIr/v06U?=
 =?us-ascii?Q?j6Mv3UW/owjp2ojvwJFHZq2oxF5f0eSgqtStrLdB4HNpvXGDQkSR8wizTJZR?=
 =?us-ascii?Q?7K50WNUsDxmyWl26pUE9kFljTrKP3vgfXCiknaW4nXxfw06JsyR6ftgXJ1RJ?=
 =?us-ascii?Q?E0fdsnenS/WGTa0pDNcwx4/FjdlXCtj1a1IJ2DP7BUcxNi4rYuAfU0o8Iigy?=
 =?us-ascii?Q?Tx/M6YOLNaU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQhYvVfz/lYPkbezQ0i5sYOq0km6Qb42wTeic7EsKK8YyhpN1zeo52lxTFch?=
 =?us-ascii?Q?u0cdbinxEiYxF04celP1OX77qdtUJAAebDZoDw8v/PF3X/Q61+8DUDTyC7Ax?=
 =?us-ascii?Q?1p9WQ07hQA9f5VOiduGsJsgikqMfszefZ9KnESfGli3l6dSZZ5JozkXQT1iz?=
 =?us-ascii?Q?KXBza/6/A/JycEHjUMJXhCUsOfqZDm6uSA1C6F83Ug26ZBXLMxKjvjojJbgU?=
 =?us-ascii?Q?nRVqy6MSpuriJe/uFaROUjDGJ8pCy2Z1PJ9OkkBZxJtuIdGHx/E0OgJTbTld?=
 =?us-ascii?Q?6X7TEAWoiaRvjZwldFv74h03z2/ST9I4hD8RiFCcqWfOzLT9SY8hJk5Utdi5?=
 =?us-ascii?Q?JeTZWW0UhSwd7rP7JpAs2ADt8LEVRJ2tjo+lB356z/+38jgr7WgExtKBqBH4?=
 =?us-ascii?Q?hFe2l57tA6T1rKjyuopHnuC4m/eAz11R+hEKLWdK9CtbiS+9QmRyOMK/KVU6?=
 =?us-ascii?Q?jTIU7/9TJ+1x18ZyJAjdCYR3nl01OaDyAKlQbJ+005uzSOj1QHycS7yuuVJt?=
 =?us-ascii?Q?3hup22wYBMjci1n18AsL23QZiKizyC78gJ8MeMj6PGlTocuwZHhW/W62LWOW?=
 =?us-ascii?Q?Gfl4waTwhhQPggCopjZoAK5P9IFDv6wTHinMK6Wg0Hbu8CQj0C3gvB35m/Ut?=
 =?us-ascii?Q?ZYtDsN9xQQSNZmFXiJeiIJ8IY/ndWKtHCdfYSlusH9aH+S2+60xqcY2seUyU?=
 =?us-ascii?Q?idcD5YvIOf6MiOKsbjueTWDZAuzqu1b3fQ3nSTYpnTlem5RqVFJvWVdj3wUe?=
 =?us-ascii?Q?tnRCpU/wl5j/Qc0QPnu4qy7pMWGs0uzgaiaubJFnqr4kN5oeuHVDlCBRBWiL?=
 =?us-ascii?Q?cDCJRCuc9TmA7jBw+m3J3MMkbtwlyZNO9NX8BImy6t19QUFi0vQGbBacHrCx?=
 =?us-ascii?Q?+omqNlspuNgc6qvrD4+kSiz5ypOmp0LUHiGReQCWCDTcH+5esSw1aGr6Vmr9?=
 =?us-ascii?Q?tJjmRZ6NpE/t0oTdD27VXV3dD06mpNvXkpgseID5/MfjlRuijwO8yR+pcF4V?=
 =?us-ascii?Q?ghmATCmJfngs56ijgn436J/Rf+Fsxn7KkjFqy2SHArGd3tk6Zg42xVskDExT?=
 =?us-ascii?Q?fzzm3HXcke09KSC8o1CtZNk/qXGHsT6bd0/k9kDWwLoI5zwJrzKZO3KQ1xbY?=
 =?us-ascii?Q?kD1feDx4GWhZs8R9/5sGE2piEPvUhJKgaC/P2GFLAEeBwC9M4J57mCZxm3um?=
 =?us-ascii?Q?UfuvhFdiNRMuVkxJXuoHrtFyZAJg376ZzC/qSxfQ9mk28y16umGKF6A+mqQv?=
 =?us-ascii?Q?GV0BkcaqPkxXvFnNJJU8ye7yO687f3hkSxQzUW01SrCr7/OD/LVYwu8un4+I?=
 =?us-ascii?Q?1Jmex/vwDlXoSKEJGMR4qI4KA4hdryxycZDPTxl1sUZl/XkVI3o3/9pNRS/R?=
 =?us-ascii?Q?jzawzzixyisRnZJERb/mPFUgKuX+H24xE7tKwc7LaJZRomZYKWxq99nTcKSS?=
 =?us-ascii?Q?JhF1XIeej4VcNdHt1MRFXDmb5L6aF66aBEt8qAqVeppW20HxaHdiV9sppq0w?=
 =?us-ascii?Q?smTKgpCN2KC5N8S9u4g54vvmE1NzLpy1N/aW0iQkP5VINxNUmPcTIaGar06s?=
 =?us-ascii?Q?7pzcZVrBNWMevXd+lMnudmVQAOoaK/D3Rl7iAk9LQVTXVsZmHlTYjOfCiErW?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3eab97-768e-4fa0-ee62-08ddb219d738
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 05:50:21.3069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdFma+qod6qowUIbDmY0HIf97yCnDAd2E44ewXlMcErLBJRRDULNO35kEzMQjtijZ0fDR80MW6Okc0O+cc2pSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
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

On Fri, Jun 13, 2025 at 06:25:49PM +0530, Himal Prasad Ghimiray wrote:
> In the case of the MADVISE ioctl, if the start or end addresses fall
> within a VMA and existing SVM ranges are present, remove the existing
> SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> unmapping of old one.
> 
> v2 (Matthew Brost)
> - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
> - Rename the function
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
>  3 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 19420635f1fa..df6992ee2e2d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -935,6 +935,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
>  	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
>  }
>  
> +/**
> + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
> + * @start: start addr
> + * @end: end addr
> + *
> + * This function UNMAPS svm ranges if start or end address are inside them.
> + */
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> +			if (start > drm_gpusvm_range_start(range) ||
> +			    end < drm_gpusvm_range_end(range)) {
> +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);

I think you could use xe_svm_range_migrate_to_smem here but also I don't
eviction is strickly required here either. This akin to a partial unmap
and we don't evict there. Any reason that I'm missing here?

Matt

> +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> +			}
> +		}
> +	}
> +}
> +
>  /**
>   * xe_svm_bo_evict() - SVM evict BO to system memory
>   * @bo: BO to evict
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index af8f285b6caa..4e5d42323679 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
>  u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> +
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>  	return 0;
>  }
>  
> +static inline
> +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e059d9810d26..0872df8d0b15 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				end = op->base.remap.next->va.addr;
>  
>  			if (xe_vma_is_cpu_addr_mirror(old) &&
> -			    xe_svm_has_mapping(vm, start, end))
> -				return -EBUSY;
> +			    xe_svm_has_mapping(vm, start, end)) {
> +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
> +					xe_svm_unmap_address_range(vm, start, end);
> +				else
> +					return -EBUSY;
> +			}
>  
>  			op->remap.start = xe_vma_start(old);
>  			op->remap.range = xe_vma_size(old);
> -- 
> 2.34.1
> 
