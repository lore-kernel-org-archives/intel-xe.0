Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D51BC3ABCD
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9036310E3FB;
	Mon, 12 May 2025 12:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSN8bB24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E3210E401
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054051; x=1778590051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SNFjO68G8r/psU3iNswPHrrVDUBpnyhV2R5rLYcJafI=;
 b=bSN8bB2425q4J7BNp5hYKud7ik0JhOiW3XcxHaWfmU6agp2o3XKDyWD/
 GFcrfdG08A5qIBhznVzYOnAgXvnaw9ggrnx7eHysSLMYvuGR4tQ3IpFbU
 ga7wtKKwLRyAgVh+mPz99gw8i2A/stRBC8XgThKXjeH4U3RzbhSOAalIX
 sabmd82ZQ4mg8vKGZlGEl4aP1wp61yWwyOFN3yP555i1cOyumvRPwgMsp
 fU47OL3xqhTnR0+2R14ldTvNoLfwVzjK4Ror0mNsl0g8VXEaJdSxWijSN
 BkkVCb0Ln0FcoiwXRWyl/Zm/7EvvuklmjK6Xla7ICrm2nGISYk1lEE26B g==;
X-CSE-ConnectionGUID: 3Fqpsn2sTCWelYm5nBVRRA==
X-CSE-MsgGUID: bQoTEX/WQ8y/dhLqW7R25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59480224"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="59480224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:47:30 -0700
X-CSE-ConnectionGUID: 99aQIX7WRKaloQXKVHUaUA==
X-CSE-MsgGUID: lF7CMZxYSIuIJzKM1pLSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="138324993"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:47:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 05:47:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 05:47:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 05:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpuwzqA/+NNpCx5iDK7KjhviKHd5FTcO2c2P0DyiDrSTLTE0qLJUC0hCuX/ybbnNK5YMprsvl1SGOIJ66fsXleeY8nMLRu4FP8WMSNGjcDJkt2+AMkg6ZElXAA9miGJzJ71yx4pZrMDWMWU6Yli3FAGik9Xc7LPLKYMYxzIQOpyN0zzktpRVNkah+v9amqoiUuF2S1iAjQOhnD/uFTD1/NvjLJ6fP+cda6xQ+NTlDCj0ensqJwWLwlur763xV+JQFiU22fkrn3BkvwQECsCrCP14i/0dw+v1fwH7FI8mNKNRHDz/1bDlS5fsGRw5zxPFdGkZBas/p6A3QPrV2qx72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=620q+JFmzZJVLu+o2fMzh8qaMFayGZc3seQVe3k7+zQ=;
 b=THzBOTN8yLJ/jeOX2TSOaApNVBDLlhjJnHFI6uzoorOrAPCva97dxzmQl8/hO8wyyQZyK+qaPEZIoEJ7sE797VlbtKhsoo00FZ4bPYLDZu6EWqCAXJ24MGoIUP/qPPA9ef+KLgQCuvBlLQ+XLVKNcEfg9xZDsduCBMgeiFgXyfg2F8dwJRgmRibHtLye/SHrV5FlyrcWgxWF/JJE73aAimK1f1ggp5xgCcBMW5YlFBfISaIS2IIHg1YYY43XWJs0TwwcODCzGO6mQXGnq2BER63ZN+reIVF0Gehoi//7pxtaBKhAq7sAs1Efcxf1jxEUYwwoLi9Q3obEYJ4/lj668g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Mon, 12 May
 2025 12:46:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 12:46:59 +0000
Date: Mon, 12 May 2025 05:48:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aCHuGSH+da4/mfvl@lstrano-desk.jf.intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: e437e75c-7cf7-4d08-1841-08dd915315b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhLzxDAOYaLSaIe3gl/QX4bBnWfIOyTB8gBjGPn5UuQ/vUYwwPlX9e8GOptO?=
 =?us-ascii?Q?QC2oojpborFiMwAFEzheXjqet4sE5MR3VAEDrQXhdx/WMTCFnJjWRI8IpWwJ?=
 =?us-ascii?Q?77RyHSoZrvrIg51pkZMV49vlsX9weSI+a1rWS/i4XjekXjhEnjqYHFGyNESK?=
 =?us-ascii?Q?paniYIZLTEiiC5LpLD4aB0XkNeD2tPxDPvHfTI1hscbx3CgEpnuR3LJ9dqU5?=
 =?us-ascii?Q?IcSlDPDlqweBiskyX3RUT81vSvHY4fgUwfggFAxRmn9FmqkWtyDBZfh8D4e0?=
 =?us-ascii?Q?xBEdPGFAC67Zme2vGlcs3R5McyT5tlU9oNXkEgv95K7fMthV4lDdbUpXniLl?=
 =?us-ascii?Q?/q1rTAITSg1kqX64QZla73XZzjHUHOu/YJDgqMKqkZL9go8Dbym8XL95t9I/?=
 =?us-ascii?Q?ABoWDkKeW8skAc0Vi+xnCpFeEpjft7qcndeEU1iJg7uU4nSZ3Dn/M1lHEuq9?=
 =?us-ascii?Q?uQuEBlJ6yyHSCmRzhZHqAXVlRAqsChMxpPJdtAUUlTbz/4Y0i9pnrHRtiKba?=
 =?us-ascii?Q?DgNtTO1KxBpXbP2sL1/h3F4osQnPx/y4M6lSXufo9vH8owZ/A9DOi6Aa5AxJ?=
 =?us-ascii?Q?8+ujaLf+RRAlWduKOr3cMPcikmguDlgZI5rObHJeGQQFP9BDkdPW7nir0zC4?=
 =?us-ascii?Q?855yIlT33ab/EmejXM44nmQuW9RSg7COdGFBe8ujd0wBwcQwCoL7Bq9Ts9cJ?=
 =?us-ascii?Q?q2trCW6JfmgkwscEG+sbHdVJwAIHIbfgVkSmyg4X+jonZhnKhSB+Cr0CEyCM?=
 =?us-ascii?Q?gTQ82MjgEF7iAL3jCGAblSLCZ4y9wvomV2gAB07t7cbJtBy8DQaRfhaHztNn?=
 =?us-ascii?Q?ZiydWKHEyziFWRGKvkj25ht4M0jKuf7EZpDVJedYx8IZdeRa/Q65We3BsE8i?=
 =?us-ascii?Q?78i1jGz2wrvzskrbpJpiSLfQv7wlJPoHQVkEcw1R3v3k3hcnHZwz35Txxd11?=
 =?us-ascii?Q?hJOy6Dnhkg2VjMYnZ6JBLMLGjLGI3p8OwZ+6CO97FXsevoRdMlrGnpMnmA5G?=
 =?us-ascii?Q?CohL9/FNs0X+rhnIpMn4y+/h7uiN4U3lIuJed64Smqf84so3XEOzml6pGXZx?=
 =?us-ascii?Q?g98U9TqGubV7hhH+cjICtxFhjLe3ch9jlL3HZ9HH1jwY9KW6CNDygmsqW8X3?=
 =?us-ascii?Q?QM0bG3REEAtjasSf37yg3lPQDciE9LIOxkpgCOhspe+NtQFRHPepuVkeOROC?=
 =?us-ascii?Q?aTcdD40SdKCRCUQvyJ5A83oHDvVuJnvqxcbB27Kv8mfRZYmVmLBGoKQPUeQt?=
 =?us-ascii?Q?evi7O2+pbJn7AER0vdOhVc8Fjh6wPBrv7rcMXSJ+ujkw7smyJ+sVDi0OS3Tg?=
 =?us-ascii?Q?0tM1uWTzv9F4jP2jdskjlxufmoA++X6NiMB6vGg+LIQnJWn2fPd1F4LHnsV+?=
 =?us-ascii?Q?cctISK5gzTeah9Eb83JsvACRcbAnNtmIh6gkhnQqeNeNARL7rfgrqQ98eJjv?=
 =?us-ascii?Q?za9IHUt4fus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/xMfXU979ui11DHL3irAWG+/lEWKKgdnTUi0xg1EU13dw7OhqoNb2l7tbJq?=
 =?us-ascii?Q?87sIw1mfZgGYP8ArJ3JBQp7wP+86nUEMNHqxya4l95ws1omtw3cqHyPZNEdq?=
 =?us-ascii?Q?90ie18ns4bP2sKmVHFw8XQCVWIv2XXjHrw9xH6PVeFBszD1cU/Y1Fz0Ssa67?=
 =?us-ascii?Q?kUiuVdO2vLW9nSOnJ6CUVcvawM5vlMtG8zSs0Jg6fcKbwOb9JFUfzPajzTMI?=
 =?us-ascii?Q?Z9ii+rTikvbkxQjHkwe4ogSCLsb1ATTQkyJfwoThUHoFvIRlWNbZFXsKLzUT?=
 =?us-ascii?Q?IlYT19O0Zy6aNx+U/PmXRxFr/sCRyWFif24Z2uMayvQhnRQwWhNa9P10xxvA?=
 =?us-ascii?Q?f/TjdZb+1Cvmg4dxhyNbRO5n0UPQvbRe8zl1FQqXp3w5/K7PzSaPKewjxTsF?=
 =?us-ascii?Q?KiAQWcxM2wV0lhsRLCFTMbZ+FF+TOTZ39cwBpZJhWSO8l9EzQI99S/ye5W31?=
 =?us-ascii?Q?T2Y658JeNc4P0+pA/1ZTk5PMe+wrhaDMAJ3TrJ04dMxGM+lpa15EPyfbEnTL?=
 =?us-ascii?Q?fXh+j5G3oRukcKsO921spnuHXe7XV3YFGqIpi81CXg7LOeEg9PyifAv/YUhN?=
 =?us-ascii?Q?VketwX6Rs7vIx2MbzxcU5BEAzFBPXWd6TqYnSq47yYstTIetRy+V1xP2U1sQ?=
 =?us-ascii?Q?mvs5j+hFie2lEE8BTgIGZ4bvuYSDsI6+ogzgmfGX/OytibsoLw+KpZnfZMen?=
 =?us-ascii?Q?lmk1OvOhWGQlIFbbQm2+ZfQhEKr2y+EjVaGBjJhrzQY6ffd4ipC7a4wZu8LJ?=
 =?us-ascii?Q?1qozeoYihShz8Y+pHxiKsA3ahcGjfw4tcO8gv3bp7Mb3XiwE5ECeTi9g70gd?=
 =?us-ascii?Q?fxqpMzjdYNKC2Emo50TOcc1tBSqE96LEOFmF3g/NDldYbhMEyJcHL7m3v0aq?=
 =?us-ascii?Q?H0D/2SGPRhhjl5BBZJz8EZAJfRGqC4xrchuJDO0fMFi3AjcZ0m/xAdE5r+DD?=
 =?us-ascii?Q?T7fhx0qXsef7LBJhIaBJIQiXMlYcj7FBnZNRLO0WInopSK8zcb3ETqEIqf82?=
 =?us-ascii?Q?fiNbpQTre71QJFriwf06Oki/1tBvP/osm8hNFbqiOCTdHZqf8Ds2swDpyZmO?=
 =?us-ascii?Q?GEfDIUlqXozP1rDv/OF2zmU60gdeiAEvpvZo8UX5vCErhK6eJnxRnDm+aFuP?=
 =?us-ascii?Q?y3lCLGLdoS5KjXWb9pZD1qV+cLJ29CSHO5SKZyaxuak/aJ49cakNAxiYFNAE?=
 =?us-ascii?Q?O7AXbvCQrsENHn1bXSM1B/oPHeLg2GlnN/5iQ1my04CErXE+QT2KnWXaoyYP?=
 =?us-ascii?Q?YwRyODjDxULJj4FcqOkAaT2kau7/0WKYvMWfHNjg6Z6+nuHANrWMb01LNCsl?=
 =?us-ascii?Q?LpcdLh2lx50MtfQyjGhrvnU60Zpmivrqcbu0RvAEfhfXNi0ZuHpRS9xz8NpE?=
 =?us-ascii?Q?1RpDlqOsohfbyF72Q0TRvM92vglMhaw9DJiiCM9rGiG+oqMhWOcR2qR2fPkA?=
 =?us-ascii?Q?K7R02LdloqWgWORxxu1aeqH1i4FS02r6JlpM/WOW4jJjs43WqIV6QAP52Evz?=
 =?us-ascii?Q?DDa/zvx3Ms8wQW7V9Vfp0TQ0jyM/Kc7BNxl6UIffokUpmqkt7XBepkrSeyia?=
 =?us-ascii?Q?N7raM3nX+yxr0YLNUwRDijFx9ZdoOuPvPD6rklx6Lio7YzIsmYYdbpj/LeMp?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e437e75c-7cf7-4d08-1841-08dd915315b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:46:59.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqNsi/J7EwtjLtsfFOiMrufHkwY5/OcCLGTPv0Dfav2nyvbBHwtnc5AgE1w2lEFrJMm5YmhfCUWLlUpfAP+nWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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

On Wed, Apr 30, 2025 at 05:49:11PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
> 
> v2: rebase
> 
> v3:
>    - use xa_for_each() instead of manual loop
>    - check range is valid and in preferred location before adding to
>      xarray
>    - Fix naming conventions
>    - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
>    - Handle sparsely populated cpu vma range (Matthew Brost)
> 
> v4:
>    - fix end address to find next cpu vma in case of -ENOENT
> 
> v5:
>    - Move find next vma logic to drm gpusvm layer
>    - Avoid mixing declaration and logic
> 
> v6:
>   - Use new function names
>   - Move eviction logic to prefetch_ranges
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>  drivers/gpu/drm/xe/xe_vm.c | 197 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 234 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de4e3edda758..f3a99ee4f733 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
>  	struct xe_vma_op *op;
> +	unsigned long i;
>  	int err;
>  
>  	err = xe_pt_pre_commit(pt_update);
> @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> +		struct xe_svm_range *range = NULL;
>  
>  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			continue;
>  
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				xe_svm_range_debug(range, "PRE-COMMIT");
>  
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +				if (!xe_svm_range_pages_valid(range)) {
> +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +					xe_svm_notifier_unlock(vm);
> +					return -ENODATA;
> +				}
> +			}
> +		} else {
> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +			range = op->map_range.range;
>  
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				xe_svm_notifier_unlock(vm);
> +				return -EAGAIN;
> +			}
>  		}
>  	}
>  
> @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> -			break;
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range;
> +			unsigned long i;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> -		pt_update_ops->wait_vm_kernel = true;
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				err = bind_range_prepare(vm, tile, pt_update_ops,
> +							 vma, range);
> +				if (err)
> +					return err;
> +			}
> +		} else {
> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> +			pt_update_ops->wait_vm_kernel = true;
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> @@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (!xe_vma_is_cpu_addr_mirror(vma))
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range = NULL;
> +			unsigned long i;
> +
> +			xa_for_each(&op->prefetch_range.range, i, range)
> +				range_present_and_invalidated_tile(vm, range, tile->id);
> +		} else {
>  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>  				       fence2, false);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 555ed10dac85..dd5c63ee8720 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  }
>  ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
> +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
> +{
> +	struct xe_vma *vma;
> +
> +	vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
> +		xa_destroy(&op->prefetch_range.range);
> +}
> +
> +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return;
> +
> +	list_for_each_entry(op, &vops->list, link)
> +		xe_vma_svm_prefetch_op_fini(op);
> +}
> +
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
>  	int i;
>  
> +	xe_vma_svm_prefetch_ops_fini(vops);
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
> @@ -2248,13 +2271,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>  	return true;
>  }
>  
> +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
> +{
> +	struct drm_gpuva_op *__op;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		xe_vma_svm_prefetch_op_fini(op);
> +	}
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
>  static struct drm_gpuva_ops *
> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> +			 u64 addr, u64 range,
>  			 u32 operation, u32 flags,
>  			 u32 prefetch_region, u16 pat_index)
>  {
> @@ -2262,6 +2297,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_end = addr + range;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2323,14 +2359,77 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> -			op->prefetch.region = prefetch_region;
> -		}
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +			struct xe_svm_range *svm_range;
> +			struct drm_gpusvm_ctx ctx;
> +			struct xe_tile *tile;
> +			u8 id, tile_mask = 0;
> +			u32 i;
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				op->prefetch.region = prefetch_region;
> +				break;
> +			}
> +
> +			ctx.read_only = xe_vma_read_only(vma);
> +			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> +					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +
> +			for_each_tile(tile, vm->xe, id)
> +				tile_mask |= 0x1 << id;
> +
> +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
> +			op->prefetch_range.region = prefetch_region;
> +			op->prefetch_range.ranges_count = 0;
> +alloc_next_range:
> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> +
> +			if (PTR_ERR(svm_range) == -ENOENT) {
> +				u64 ret = xe_svm_find_vma_start(vm, addr, range_end, vma);
> +
> +				addr = ret == ULONG_MAX ? 0 : ret;
> +				if (addr)
> +					goto alloc_next_range;
> +				else
> +					goto print_op_label;
> +			}
> +
> +			if (IS_ERR(svm_range)) {
> +				err = PTR_ERR(svm_range);
> +				goto unwind_prefetch_ops;
> +			}
> +
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region))
> +				goto check_next_range;
> +
> +			err = xa_alloc(&op->prefetch_range.range,
> +				       &i, svm_range, xa_limit_32b,
> +				       GFP_KERNEL);
>  
> +			if (err)
> +				goto unwind_prefetch_ops;
> +
> +			op->prefetch_range.ranges_count++;
> +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +check_next_range:
> +			if (range_end > xe_svm_range_end(svm_range) &&
> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> +				addr = xe_svm_range_end(svm_range);
> +				goto alloc_next_range;
> +			}
> +		}
> +print_op_label:
>  		print_op(vm->xe, __op);
>  	}
>  
>  	return ops;
> +
> +unwind_prefetch_ops:
> +	xe_svm_prefetch_gpuva_ops_fini(ops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return ERR_PTR(err);
>  }
> +
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> @@ -2645,8 +2744,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					return err;
>  			}
>  
> -			if (!xe_vma_is_cpu_addr_mirror(vma))
> +			if (xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> +							      op->prefetch_range.ranges_count);
> +			else
>  				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> +
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -2772,6 +2875,56 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +	int err = 0;
> +
> +	struct xe_svm_range *svm_range;
> +	struct drm_gpusvm_ctx ctx;
> +	struct xe_tile *tile;
> +	unsigned long i;
> +	u32 region;
> +
> +	if (!xe_vma_is_cpu_addr_mirror(vma))
> +		return 0;
> +
> +	region = op->prefetch_range.region;
> +
> +	ctx.read_only = xe_vma_read_only(vma);
> +	ctx.devmem_possible = devmem_possible;
> +	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> +	ctx.devmem_only = region && devmem_possible;

I don't think this is right. In the latest series we only set
devmem_only on atomic faults. Also if user prefetches a shared mapping
(migration not possible due to core MM limitations) get_pages is always
going to fail and abort the prefetch. I just wouldn't set devmem_only
here.    

> +	ctx.timeslice_ms = 0;
> +
> +	/* TODO: Threading the migration */
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!region)
> +			xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			if (err) {
> +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +				return -ENODATA;
> +			}
> +		}
> +
> +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> +		if (err) {
> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +				err = -ENODATA;
> +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			return err;
> +		}
> +	}

Nit: I'd add a newline.

Matt

> +	return err;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2809,7 +2962,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -		u32 region = op->prefetch.region;
> +		u32 region;
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			region = op->prefetch_range.region;
> +		else
> +			region = op->prefetch.region;
>  
>  		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
> @@ -2828,6 +2986,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return 0;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> +			err = prefetch_ranges(vm, op);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  					   struct xe_vm *vm,
>  					   struct xe_vma_ops *vops)
> @@ -3478,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
>  		if (IS_ERR(ops[i])) {
> @@ -3511,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto unwind_ops;
>  
> +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>  	if (IS_ERR(fence))
>  		err = PTR_ERR(fence);
> @@ -3580,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>  				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>  				       vm->xe->pat.idx[cache_lvl]);
>  	if (IS_ERR(ops)) {
> -- 
> 2.34.1
> 
