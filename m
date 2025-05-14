Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C88C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9C910E6F2;
	Wed, 14 May 2025 19:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWA515NG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2D10E6F2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747250700; x=1778786700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NiAMH1+CVWdZjkX7bBW0XnefkHbITh4HkNVnbBDoReI=;
 b=ZWA515NGF4JXYo/V6AzWHz7mfz+Mq5k2LEBbS6+7J4Ou1Qzw9t1zOV+M
 57qTelhWXpk40QfcUKkDJOlsrxvUm82nUsHieR5z15sRHj6GkYWb5jj6b
 qW/f/cBtkOa/p6+fAGnE6FTYMx2U50TodI5it67iojmhjNgNSEPg/CEYg
 uNe/ukFXsXLcgk3EDOicQMCNs8nkOJVPJ+FlZ2VoVDfs8h5VQ52OuJ9lL
 pDaK+mRTpWEoPWWES6HT1gwRRUbBicB2qJA5LNJsUa6C350ZR+Tyfs3Yx
 gODHIbKWWziCHIo9erxSJHp5reN7mY+iuIKKJ61X7qj7MguufR8JZl9KB g==;
X-CSE-ConnectionGUID: k6Gu+LeaQye1zzuPhHsPqg==
X-CSE-MsgGUID: /JDCgKaaSDemaQygXGM9Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51805547"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="51805547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:24:59 -0700
X-CSE-ConnectionGUID: gTQ+Z73IRaydq7p5ZVFDFg==
X-CSE-MsgGUID: rHulgHVcTRi+jjezWiBgJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138014091"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:25:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:24:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:24:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD9MuF6LttgCiDNuq+9CTyQXonjVLN78dBaiTy+GpS6je/FqHv6D+Wwc1+tMpTZf9exgKL4/CH+UP8o21zwOPw+z4kf8ujwb13UERNY8vvIDqDBFjLK1Oe7sS1bp/J6ZRZ4JQB/aADc+V20g4Pa/97oCA+XW2JOnD6mFJxbYtHGwAodKhrDJKcCaNqx2HEaUW/3Fb1YlB0liE/UunMvxCakOSdhgl221V+EVy81rFAvps23zvQMTDHbGbycboNaHfvykbDxiuYd33ubK4YdgMIvrYsqxFcy9mlZEkU69Zab3Ru+vYt5G/Dq4NK6yOWPiSGGyRaRErckN0NEvb1G7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Oso0c9z3QiJvFTUmBDVbq9Hic7FxP3DV+8iz5qt25E=;
 b=MKzMLW/bXV6PmmjEGM6ZSs09Fx0/Fu7UJKEGpA+MtrgBqSCJcHjueQA/BIOV0IiXgCXoAz7O9LJK6I+182PC0n2RH0Do2t8VhV2gbxtnPIu6H2jeno2AjOVGhy+jYplGVUBMlzq+/5/qCAejC4bWUZQvsMKmhWozyQu0eCHJew96Bw9Nwwc/V0lkesbGEHWQ1p6y9p1acSJPAbNlEH0wEKNijMnP1Pq+Gdnm1OE1IEBAFQBt6CQ0bu36UWdsjmQTuicKmkwUsCwRg8TlwhK0b0ujr7oZq3z8+bFFP9XlvqXKf2HHPoU6gnUOPL+N+fQw/2TUvVjjCmWOZH4yM6pBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 19:24:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:24:56 +0000
Date: Wed, 14 May 2025 12:26:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 25/29] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Message-ID: <aCTuX5hyTkzN+Tcr@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-26-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-26-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:907:1::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fef9cd2-35b7-48a4-cdd6-08dd931d0246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DLsAQvlbpR8WWB8H/hu1tyRwZLpSAZlvK9QyJLRLf1IiLTV7bNhpOZp/N6hb?=
 =?us-ascii?Q?q3/T6gBh8s7HDFNvqn2+auk5LfhU/s9piLLTHai2DJVttwE/WWflDmixqo4e?=
 =?us-ascii?Q?chDau7U7rHTCLD9WeIvo1DfkiL9qOMcd3ZZgm78jmtek3vf5iVXWPT9jwflY?=
 =?us-ascii?Q?Mmf4FLZfGe7SGOuDFhrpZFcjdM6ZUVMwdvxRx7ZuoRwOiMi+8Bb3aZlQjwn0?=
 =?us-ascii?Q?JrYjifM9DTkaRRx75aLPbsvDnCWXA2NvEy8VnDbsLaJTj+swHedsEuIVvtQx?=
 =?us-ascii?Q?nffIZ43KkolvvK3AxjGYJrvCxjtmnxGjlNNPXPl5Nmyy8kBJNNIkIriAuVHS?=
 =?us-ascii?Q?sScIPxLmTgtTGVHFg8V8KPiRaJQG8vvyjIMbPA6DhLVNcr8mrzcvMlBDRLJx?=
 =?us-ascii?Q?1790yQJ79JJy+dr9GagJcYNxMzY0SfpdFP71V2k+ICvv0PksmfObfJ25jHMa?=
 =?us-ascii?Q?KZ93Y/anNTdU+dfWDCAd9bYYw3wLmakwQb2ZwIiuVIlL/4ZwNVhOUIbvzl+8?=
 =?us-ascii?Q?JczDsVet2u6AgmsW0x366MC53SurYMIyw9sZLf9hgqyIiRKcgL2KUY67Ciuu?=
 =?us-ascii?Q?Hjds3cDSqu6Dm8207HkZyC8ourR2R+CMNXLOY5DkmMr0h8gw5A0ZZHkz7ThT?=
 =?us-ascii?Q?2OnOqYVbJZR2ylkbF4WdiO5gdpLp2qO30fPwA/RxvX/Phv1wdSNFW1z5F9XC?=
 =?us-ascii?Q?jUyVmZyY5PIuroUCEU5S4SwcgCD74sfBT0bkd3TrXuZVRIQiGOmyYbomLghs?=
 =?us-ascii?Q?n9zBD8iBjJU0C+b/SLdHIvHAaxvCcqxSe+g+BwdU3Prh9h+rH3fv/AGObNS0?=
 =?us-ascii?Q?Jl3mIq2PECnw/T5bU7tXgnofgrsvnA9OpuIyTNrFc0WJPhsW5wbrWR6V4CdV?=
 =?us-ascii?Q?seoS9uQdOKe7RStpfUubtvNXoxX7uEqTPi1yklAwy34sQquSMvgCiS5iChDJ?=
 =?us-ascii?Q?i71qf+R4peTbrk9HStTLDbIoOOEyRFSmnOBTxF+FdFby+ocIR7Up0ku9QfS6?=
 =?us-ascii?Q?OWv/G++WqT9sLyk37KvxD/iumLEst0xyIoo3ZJM48+OV3L5QCQR8ELoYq9Y5?=
 =?us-ascii?Q?c0VeXML1uegJD/1pC8EynnmwtuHGrly55zeogrOxBvq3Yqb/bSnQU+2eQTFS?=
 =?us-ascii?Q?3zkCMCIw2fMR61RaHRprSTy1klbq7hFVnQWKY6/3lT54qjewBHl87lK2NAJd?=
 =?us-ascii?Q?zOeDyvQYVID6la8B06jNpEQkrAv5XmFI9D7sGNaOsyhdVrih4HbitfP0VPRd?=
 =?us-ascii?Q?o0aP5B641pcPbCLzTRezN2zRTNYGyRfvxkD8+0buoZYnK7o0KpbuOXJWQZPi?=
 =?us-ascii?Q?r9TRYaeIcMxnAbAxEnFwU65xwPo/VeyI6iQEOHtnXHgv63oLtvuXkm+uCVZ0?=
 =?us-ascii?Q?cugfZDGBeCDr2MaBYFpRgl1bs/q5JQjSN8lcPOBayEANIojV8O3Um150xMYU?=
 =?us-ascii?Q?DZznM4GoO88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d22+rJyZXl9J8ETWUPrwwNJ8288jztpjQ/K6RBv/dwb3cXBSM126HxFQsFxo?=
 =?us-ascii?Q?Q+Le7x4572V9fo4AtZdowFKj+AL80HLsTNRO/CpMGoVHGWUVo5z1+pkrBFMc?=
 =?us-ascii?Q?4opGvEDNt38Z3ab9zNEsSVdGoY9zxL5qC7HPnqZL68ALyHFj40qPjVVu7v2F?=
 =?us-ascii?Q?rLxKk4dO/qRkbvTA2/r2xULXoQUSy6t6HgIx9f3l4h6dkhxCGaJ4FpHmfAav?=
 =?us-ascii?Q?9sb6DGZmDOP1+jzsS2OvJ4IjCMjwq/FOfl2PrdvuGRPc3lONmKFUUn5ZEMnh?=
 =?us-ascii?Q?HkiyIij8hvMDptwX5ptq4nNmxGG9Ce17LXq58aeg8jHeG04N5FyNMUgOpLnY?=
 =?us-ascii?Q?XQfHWnA9kY9ia9zETPj8cysXMWNocghIi1uxTY3O8fJEvWeUeE+KHnICUXx1?=
 =?us-ascii?Q?POID2s1rkwXEFtAaQQ6Omp9w+n0+ZkVtCUKVv+tr/6BE8FH0wvXjObcBXEVL?=
 =?us-ascii?Q?deUdqw+oXgr+/PkqcimX/WL4z7TT22ZkuY0kbP8+pGA9XH1WzRkju4zYS+U2?=
 =?us-ascii?Q?1A6p2f3Z0YqrtYfYjLm9zSKXlFMKLggwcj41yxLoU9s5Xkhqr62E+1N3xlRI?=
 =?us-ascii?Q?MQLDsxW76ZcKZ+3Ry1OUlX3ViBOdoMUR0Z+Z/k5IJYjH1nI19ic/3/8OzWeS?=
 =?us-ascii?Q?Urtq/Sylj5TKpI/4pEcVmaUen9JBzojsgN/f/b9SJLsDFWkhORyy/lTYVy1P?=
 =?us-ascii?Q?HwiCxqRqY+DSQEFlwprcMisKcpeT+W5MRZyBy9tR2RjJ+VEXRk+PMDd5Fx/U?=
 =?us-ascii?Q?6nIwbK1pEueZqEENCvs07ROpqfbzpjepMT8dsk067PDb4Dv04ZX8hrmt1wmN?=
 =?us-ascii?Q?tVOTbF/v+rAzfSAm1K0JgBnoj800DiHKe/242yyoGqfq41FmKMfDvmtUtsxg?=
 =?us-ascii?Q?3WnkJXyynQULm+gc16F7QK6d2VT9eAafdeHaUPBd1P/GK+rqv+jRwD3x0aT2?=
 =?us-ascii?Q?XXWDgD17b1jQ001kYyjJzCOD8fo/OdxLwGgjbzXRpIR2p/EgbM8gCacw3ay2?=
 =?us-ascii?Q?Fk1bqbSWDlp0WEOf5mKnhkoCX8e9R/P5h/fFNqi9XhfFYr/BJ49+4f5afK/i?=
 =?us-ascii?Q?ELUD9f5jIgTfS/0+H8glSA0tH+iI2SHmzCM+dtrvGMgAna5feCRGzDjClKK+?=
 =?us-ascii?Q?c9sbGWdiYidzXMeHVtl5E5VM4Nn6CtcSUedHW9gkxJ5M169MwLS33UUw53A0?=
 =?us-ascii?Q?6LtU3+xvHyDeDbkurYwBsducvSciYzZO+J2DvKEYzyiC/gwV8lgrtjm9qrfD?=
 =?us-ascii?Q?Z3F+8CBhbUtWJlmdzO6CUIB5NU6MjZKfTvj4S6eydIg3DHiJYwSwyQjWqgRH?=
 =?us-ascii?Q?Dkr/QJWuCEKE3eudMLjDGPaa4Cu72K6TCCx7dwCxV4CVqeDFNWjSVbvVI12I?=
 =?us-ascii?Q?zr4v6hABJDrlTgX0f4V9MncEAoqGc31TJgOrMG3b3S3gt6IbEp9SwphbnPUs?=
 =?us-ascii?Q?cmSXbb0L5EqhL5IyVa1SfHrqwndvNZJ2Xh13x3W8Yv9tD2otv9jykTTfW7h/?=
 =?us-ascii?Q?2PUhd6xssd0SsKBX04JCZoHBpWY8gGn2/pZgoaGvCMRjlpEE8FlzMAPpUl5B?=
 =?us-ascii?Q?fY+/vPWbybqFAIPVXCvY0gAQfnJKGa6d6tMH8h0V+exgMDjcdILlPuj3bbtw?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fef9cd2-35b7-48a4-cdd6-08dd931d0246
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:24:56.1385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQ3qjguq7K6iJeSw4hU5vErv3Uh45CNDSB5Yz0n6A9JsxjnAtuCjig5cKVH+nYWNpxp/ITmIGg0xMUJMEkhfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
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

On Fri, Mar 14, 2025 at 01:32:22PM +0530, Himal Prasad Ghimiray wrote:
> Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
> in madvise-advised memory regions
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 70e79fe35834..f30d0cb5b054 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1107,6 +1107,7 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1

Kernel doc for this.

Matt

>  	/**
>  	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
>  	 * It is a region instance, not a mask.
> -- 
> 2.34.1
> 
