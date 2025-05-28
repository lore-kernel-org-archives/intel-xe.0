Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7C3C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE95D10E19A;
	Wed, 28 May 2025 23:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWBMuvvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8110E19A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748474082; x=1780010082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nHtb6rQNKc1w8Yer91gSxsqVTMfB6WPDCvWUzemwTgY=;
 b=hWBMuvvgFyGA7kN6zFOfxItDy3exULEyVhua1k7Tm05A96r+33V1598r
 PoO8K5CWrx4mI99fBgRzTp9b66fpehHjepJTDewL4SqyaKWwI93jd/YR3
 w6WagA3FZDB+d6ZbKaxv+vV6Olg2NfHEG2mG+TyuMF3fVo8TH9PrTCOPy
 TIUMjUw71K2A38jMiNT5gTYktzMXR0cOn0RmpyxtnZj0pT9OtxbuOH84p
 53INRXwQIZ5D6DhnLVkf8+rDO1qskihhzgZ3qX6ZZ+mkM4rxvsM67skJd
 zYQXA5F5LOUC4yC2pTDVrMyvRJyd9qQFcVs8MccqGgc6vGFFdlk64OmL7 Q==;
X-CSE-ConnectionGUID: CWKZvEbWTKO+QVu+bOX0ww==
X-CSE-MsgGUID: 2lvIH4JqSROKAFbRaBpo0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61154814"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61154814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:14:41 -0700
X-CSE-ConnectionGUID: mTIvnJ/JTjWB7aZd2Js76A==
X-CSE-MsgGUID: VzMUpnM3TwqZirRPEFu9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143216190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:14:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 16:14:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 16:14:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.83) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 16:14:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osjafvL9VupR/kK4mqNNDJgs9rF2BQWQexhKMBhyHBLHK6GVpH8SRAa5kcmUz1PQFlx5YnU1iH/9jHdg4fOXwX2dxYANH+1iFRdxJJQRryNVKNp3Tz+WVYWAvDfFJgmrh7ZwZd1Qiluv0NzH5n8bbm/mSmrUAgBnBupHRK5wvRgxtYhf23uk/kF2kPPKyfT1mG+9t5VHE93i9dBMANQFtclPs+Q/JdLkVRUVXqSbriBFZ6xklvvrH3XPhujE1PDx4LeVrzQ+XrXK7SQXgQePEhq01tH3hFj1RdaxiTh0Vem7DFl7e0IFKryLsgDW3juJ4CezPBBPOsrPKuWfjZBHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dgx8tcHVzPOsmh7MpdDF2i9LXH5f4iBDyOuh/HGlmMA=;
 b=eHf0TJlmK4nu1yAGtqARjEVJZvMKbcUfSNupQ/sz5Wgm5dZETlmpZqPEsvQJ07yguElt9rDXc53H6LXOgq04fDnD+EfXjmRxNXXzCWT4DEOepC6f09DMgJ4iDbMHgWD7Em93dS2L2nP++ufWgp+AM2VVBwoeusN/YiZ7nvTvvNkE3I9iZSjDgFgM3ha+d7k40wxSNB0BDf9Ki6WXWiWohNO5lxWJkC9NOOwS019+Va1O/kus95VtB9prP1LBIGGLLO09RQlxn1yN9yqMwOqCv1DtCytJS/wwA1pq9AlD9pXqqppSFNdfCjJElKrAaLucxD4j5d1ztarVI7howLBCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 23:14:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 23:14:10 +0000
Date: Wed, 28 May 2025 16:15:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 08/19] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
Message-ID: <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0290.namprd04.prod.outlook.com
 (2603:10b6:303:89::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d15aa33-e43f-403f-99c2-08dd9e3d5a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tiEzXdo9WMgDj3o4blg0p7WHAB4WGlJPZtPwPal8QqUMgGil1+stV2e/KgVQ?=
 =?us-ascii?Q?OfzpDUNFi+jEKuAiVz8L41BLLXSbGhZSBVdNZyRV7pGOlO2zF2qqDvLGZ3c0?=
 =?us-ascii?Q?qmAQUwB0hVpL9XoEvf40wnfKpsgblY+e4WbQKCX4t2ROjdF0IdL5nFz/LsSy?=
 =?us-ascii?Q?/XVrbgss87jmKWGrPu1gua6nK66zx1j5LZAWaiQ2rRqtfL7KWCIAvJJbRQYR?=
 =?us-ascii?Q?f9a/7OCBgPB8Bhdq1wBvLlOKOPQ3F7BMxyo0U4i+NGmVWskoqcOMNPRNTzaV?=
 =?us-ascii?Q?h9bT3kz+RuscXXj/kiuTUhieeMFuCg74kRVvg2KJruLQMsth7xsX2XjbRmYg?=
 =?us-ascii?Q?UOUQ6UI434qVNrqBxxQ1dT+1zFActwfxYoN4ntnPx2OErph08nIvBm78juDz?=
 =?us-ascii?Q?OpAUSkCD8uKfJ2iaqmlRnt7eLxcUF5O3vypp9riRM0uj/CxTZi2e9SKugCF1?=
 =?us-ascii?Q?ts5nW+2+dv4iiaZPa2CDC8Q3hawdgN++UG6D4d9iwWne5OriXQVidVcxinUX?=
 =?us-ascii?Q?UllStn3D92ptdcfjHvg3No8/SWLza1zxcMFzC+QlZMQOHjR0nSSG+/rEGgph?=
 =?us-ascii?Q?B9EmazU+S1kKW1oiPGwtxabd5AwH+uoTmCHZNOj6X/Vg+ZsQjWDPZmWPxXTG?=
 =?us-ascii?Q?jrKAVG6b5XGKPdyN1mvBalyqShLCxCLOT2KykB4OnECCX0sO2ZL+dHXr00ul?=
 =?us-ascii?Q?RTzMJZbPmGbELjLBL8MdpPE1Gerg44dhLrAZvKmcdOOSeYrZevHl5oGZzfu/?=
 =?us-ascii?Q?L//jr6BpOrXWfM2rQU1hFLM1Qnsu6JHiYmFGzU3p1z8GHJ7404mcLb6ZsPy1?=
 =?us-ascii?Q?x1QQYWjIIWnRRUyHaUgZj+A0pVosezjkRjX4co1lfqwM+sUKUZz/TuiOLl02?=
 =?us-ascii?Q?/t2M5apebh9bYbRsqkfJGV0gqTrv0JcTS9f+wKhcHemqjfDtCAY9rqElJ0DC?=
 =?us-ascii?Q?irprTSkUMyU03b3p6CTpjwp9CFZp2TA3YucwMQFEs6QwuJx3OZtzQA+RkYeP?=
 =?us-ascii?Q?HwYJ3hwSbfbi1PGvK5rOAHE7LNHl3/k/kOJUB89oxcdw9ajjFevp+74WqZGb?=
 =?us-ascii?Q?1XoD9TNuLp5W3ZuxhULyHGteLU266A3GBnsCXe+fTpyjsgPL3uJB8dSE603a?=
 =?us-ascii?Q?y3bJzhdNoUgXFotO6Df2/mkcn1WI8ZxdMQMXOsnbKCCFb7uzfZaK3fiE6iXn?=
 =?us-ascii?Q?KM7crpQfzAuzpTOwkHA9K+rFDWcDwvo/mmkc3inqO4qXbxOJsW9NSCvfeYuK?=
 =?us-ascii?Q?/jiRrsunr+7BaUpHmOZi3Y6SqLBTYxnWy2zZiGkmr8Ep1itrMyQA4+5AoAdp?=
 =?us-ascii?Q?1xTtgqzPTn+D7L0Tk1z56LhjuvXwgZCqihd1jTXBGtpbz1rvwBR65j7HEy19?=
 =?us-ascii?Q?BZIBqOsP2JWpWcYsKHmnJNV8fSxyw6PpYDX8IhnyMwpC4sfdHWSXKjgv0X56?=
 =?us-ascii?Q?sYGXIjXc5ts=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cVtlN/5nRotf06HtoBIkCdj80hE3yIykMPoV3ijLMZDxr0/7XZSHVquQoFA6?=
 =?us-ascii?Q?xlYz50JGCdBu+mYtF7h7908IscbrMZywCPoO6NM64MhefM/XohzpO6PguVpx?=
 =?us-ascii?Q?vKYSlR68P5sB1CXTePTwpO/Z+OX68PddakO6pLQjVNJaDrFl+vfZkD0gm/GK?=
 =?us-ascii?Q?VIcu22MS0yKtRIQnZuX2E8csqc71NhuCPJJNYmUSzr+qSVvHfYw2asXRJInT?=
 =?us-ascii?Q?HuAn8+roJkRThWLmyepIlDQd3OFDqigUhV4KG6P8wVUNeWDZdlrVi0hcutp9?=
 =?us-ascii?Q?lwBryjVm0BKQ/xyXsFfIqKOb5NDEK5mkoC59QtDIc5XLCNkuNK+HPuRhJeSs?=
 =?us-ascii?Q?qTumRN3RwYVlU3LfQQbBdQmbyAt1Jf/C7bhcbI70cgD3yn4cEUrD4VAlZxLg?=
 =?us-ascii?Q?1RW9EmpJvwswP3hZggzUyXPZaVFyyER+4Ztqgvp267CYYpChCddC07WPeUJX?=
 =?us-ascii?Q?RJDDo8wMx2jtBtTGn9kxDAhcD652+NYDmh/Tzf0c8bUX9HAfifxr2JBTkK3U?=
 =?us-ascii?Q?mZ62GEBi/zFledqsg7vTOIV9QEdEbhiLvXJUwDQc95E8Z7LtYb/r1B6qehH6?=
 =?us-ascii?Q?DoAjs2zFv1paIt1KjZ2c8XBRF6iJHYwbQp6iRyI2eDiKsikFGdnOjarbimpV?=
 =?us-ascii?Q?I5IEkx5yJ4x3O/f+YVfLAEKjvybD0H0wQeJ4os1xG4jlKixq9RvzXYXkjK4u?=
 =?us-ascii?Q?gGRBK0tywIEq55J1b4MjSzx4V4ozQACZxKIHlii/2Iu6WqkPOgtLYG9Z8iBp?=
 =?us-ascii?Q?6thPIKNKOd+L0qOAxE7Czyvlf0+DAAKD4jrgkSSuuHsvBctt53l/OYIy3MLc?=
 =?us-ascii?Q?3lqAGlKmomxvOfKErvaxVHDc/uRTu7AqggqZTjeQQVx3o2XIKHR9tjysEqRN?=
 =?us-ascii?Q?M0XpGsNy/MSyJFwi45EKGnU+0OArlReHfny3TubUjJEZmAKdsNZBOcTpIIeQ?=
 =?us-ascii?Q?kHP3/jAsAR85iqLyjehpfWW2uoDOTFDDEmQLbgx1k22ubmUgesnR/4eRunn6?=
 =?us-ascii?Q?grnqsSLxH7QowpbH4zv/fJ5pT7B5BeEWomDDk1EVw6pQu+rmsDgQOBlMCsgt?=
 =?us-ascii?Q?XRGZAnDKutn4U971Z9PU49Xy4duJvkIRSXdDjJyBthIKhyWwFt4f4pRFfs+h?=
 =?us-ascii?Q?zy0GVtaFIJ2SEoyM0R6YaIEitZxY+o3MOMcMVS+xqbg+mVALCJp8xD8ztRyO?=
 =?us-ascii?Q?mw7tHQ36hS+BeD7vCs8G/BVgkJi0uUFW+MYRyWjlwizUAjfYecMfpGyZNkUY?=
 =?us-ascii?Q?yF2t/m6A8PEzgFxn20ER9P9DfqktApD2qNauFbmr4sUFHUtOX/ZVU9jadIJ1?=
 =?us-ascii?Q?ki9kCq1f/Ecp14WAaLIvjxF9oMQ1ZKAJrrPpJRX+1KvU2lggZ4f2zOSVK6K/?=
 =?us-ascii?Q?7f4dVm4nSJQ8hfRYWOZ6f8ZYagMRL1TOA3XdW0IjhTr+zUEQz25Jg0l607yg?=
 =?us-ascii?Q?dUcQ+dx5tAMhZ6dlLM/rTzYG2UqGZXb97AIpua3qj5OabLqOVtavOxkPKWjg?=
 =?us-ascii?Q?9t/UotTGBqVhUZ+dS9JPhPgko/k0OD1hX82a3xXM2zN2o550SUvpa7WlVdbw?=
 =?us-ascii?Q?T4sYT+s99cWOHh6T3B6jeS/l4qC8r+4bepVkgs+YyN5R3/spASv4QIAHdTCu?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d15aa33-e43f-403f-99c2-08dd9e3d5a74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 23:14:10.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xsu5QIe4plTZ4BukHETHmnSuNSM4rthmQUZBJk9vGmy8EDZwcDIrL8lKBdmSpKrybeVSDjZioRTxg0/s59eyiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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

On Tue, May 27, 2025 at 10:09:52PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
> entries (PTEs) for all SVM ranges within a user-specified address range.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 43 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 ++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 59e73187114d..a4d53c24fcbc 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1006,6 +1006,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
> + * @vm: Pointer to the xe_vm structure
> + * @start: Start of the input range
> + * @end: End of the input range
> + *
> + * This function removes the page table entries (PTEs) associated
> + * with the svm ranges within the given input start amnd end
> + *
> + * Return: tile_mask for which gt's need to be tlb invalidated.
> + */
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct xe_svm_range *range;
> +	u64 adj_start, adj_end;
> +	struct xe_tile *tile;
> +	u8 tile_mask = 0;
> +	u8 id;
> +
> +	down_write(&vm->svm.gpusvm.notifier_lock);

xe_svm_notifier_lock

> +
> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *r = NULL;
> +
> +		adj_start = max(start, notifier->itree.start);
> +		adj_end = min(end, notifier->itree.last + 1);
> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> +			range = to_xe_range(r);
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +					tile_mask |= BIT(id);
> +					range->tile_invalidated |= BIT(id);
> +				}
> +			}
> +		}
> +	}
> +
> +	up_write(&vm->svm.gpusvm.notifier_lock);
> +

xe_svm_notifier_unlock

Matt

> +	return tile_mask;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  
>  static struct drm_pagemap_device_addr
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 19ce4f2754a7..af8f285b6caa 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>  
>  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>  
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>  	return ULONG_MAX;
>  }
>  
> +static inline
> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return 0;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
