Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB293C87FCA
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F7610E5C5;
	Tue, 29 Jul 2025 04:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMrafRst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141BD10E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753764106; x=1785300106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4SFcVqg9N4JoyKp83nGb56oDrzV3KPrpeShrCgqJopc=;
 b=GMrafRstwddBuOKsYc303ZaWJVETANjtek+RTS3Yks05nzF5CDE3WQzf
 OTL+UNG2b72bWIogeLMPmWivYObnH3eEgsJR6Hxbo/XlATKAqNeTXeatd
 nnZGmJS3Hyg2tUspZIz4p+RZTkGFgAUK+hJfPxeZGuT5/UcOiPd+VZH01
 pMGJBN6D719BRWLlfXptprs/kZwq+aHyFTYMajIfgJpBWEmKiYZd1Nl04
 OTITj3O/HuDgOYhz7Mg5lzFvhi++H2DRF/lsRbJS9KzUlKYsbexzXx5Nm
 0LDaWIijDlhIsTkhLSRtsqM5cu/qKtC+YWd1DyrO8VOx/Z/DaMaBzwe1x A==;
X-CSE-ConnectionGUID: wXOrenXsTGStLnT6Y6jjhw==
X-CSE-MsgGUID: V21DQZqER6WWJWbRRHutsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="43630438"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="43630438"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:41:44 -0700
X-CSE-ConnectionGUID: X6ntF+uIT72nWEHb57ZHEA==
X-CSE-MsgGUID: +0reFmu3SRaEZxY4OVTPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="167902636"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:41:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:41:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:41:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrbD/iAHzZAT5u0mBGdLuKQRlUHVzwBl1UNhfE3TlDq8X2D17txNdA2P69rdRmn6jvMsD1qfIxsNu6OX039xgHTo27FZNphKQZsR+wzecQom06UwBmbpaZZHXJTJ0YCk1r0g19mvWyrSoQliFu0STxnDyYerSiyTbQR+GPZsfUWxlDf0B7v21DAGcEWN1+FCyyHohjiLdilrndsA//WzYETtnZriDeLR2v+SkENy4TSq3Tlrg4XMQKQqEd4cB5J72nkJUyBJ3RAJP3Xa7EBHq8AoHMXpyWxAQY5apTSQA2kChN0CyECKymH0uRkUmjTNbI555zsM+YEBZwVsnCBhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DITtiIWKj9pFQkPF7+MzQ3gXYzau7uCNMx4TZxRFIc=;
 b=mRJn9UHIxFgkOo8wamoADSH3dXyq2Aqq3a+joCntOdyNOGYIGVJrWFAPhyaCTWxBV4Tl/vyAX8OwAye1Mkv+tdXdZDas4D/i6MVTOC0flMF5Z4yFEShePznTix+Lg8epwCkYtX8FnivRYsdtI4ysp/w3uGgS59X/R7BL4UPfn/B3czImxyDtrxoqGO91B55b95qIrx3Qm/jxbjPkHvQwQqQ6Ujc3QLa8skE3X0fJq+SxOfzbhC/7wQZzXZbM1FoOPzpR7C4SIz50f9/2Y2NzJan9m+VQxS5bOX8WIUr5l4jqBLF8PR/82zhoDBkjv2C2h7+PlCpP1AdJ8udkmEBtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 04:41:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:41:12 +0000
Date: Mon, 28 Jul 2025 21:41:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 00/20] MADVISE FOR XE
Message-ID: <aIhQ5Sv6dsCFFz3L@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:303:6a::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f97926-e96c-4598-cc43-08ddce5a2562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5fdCsEg7zRw1nmnN1RlWIkaVqYAg4zkY8Ip8QLVTvmqXfca1mIqFzYVVc+P5?=
 =?us-ascii?Q?hngNYPl79T6MP57Z7JN5FSJaeY3GaMSHf4j60DWIzU0zBqbZnkHhRZ6IjGtD?=
 =?us-ascii?Q?GvwHZfR/C9VfSPMUe5ZWCIpjFPWEWVL1jcSm14AIAdmNj9m0s467qnGbJ70g?=
 =?us-ascii?Q?IrlZ2wi1R5IYJzWgLrJDe+ESQoi1NzU5DI0vvKy4x/Si8zzPAcwR6IruqXG/?=
 =?us-ascii?Q?EPK4KBKz2va6wh3/GrVPXPse95TMNDPfhu7xN7xOoG+AYKJZcAW+EduW9alc?=
 =?us-ascii?Q?aZnrFWZV/AiveYrd7txtF9ijTxNx5B2QS9yvzywLlbXEZjtwoiGCy1dVvS4x?=
 =?us-ascii?Q?KOkyFdpr4oyV9/xad3zvnstnS0py3yVxTKSI8NbedzPMMB3vsLqpEqQXAyhm?=
 =?us-ascii?Q?wvwBiJdhtjKGwvlNC2MJL5iibOPLS/I4Zt2x10capjrEY7HZiI/eMLE1yqRJ?=
 =?us-ascii?Q?ISxhfWT9rJAEHUylKyABrw6AlexQetBG4YKJyBH0IRQSXVVYw2Re+Q6HeCHb?=
 =?us-ascii?Q?JxzHY9K6CXYDu+hbk91EZH5KOwg6AJwMHDYIkTbtMIyrzRfAAxRqXbOuGzut?=
 =?us-ascii?Q?j0jT3hPvQh2dLdiHJFiBWOLAyYtBog5I9Q7/aQtsZOiVCPOq0K7sx05RRy0T?=
 =?us-ascii?Q?M8cwg8ygydMfdj4WAbB18/5+UbS1GNKJVxFizvA+uAqmvytJezLvG9R/t/sS?=
 =?us-ascii?Q?4+5Nc0yu/laUtydxnWObwEBmO1lNmJAhH8/gVr7I7jCzEEPItNl6ygpBP/Ph?=
 =?us-ascii?Q?7zZxq0zP2WAKqVVU4Wsym7q3G+69VvmUYYYGuB0x1F51ZElV9eI2jdBamKzI?=
 =?us-ascii?Q?58riDzsTBPh0VA/EtH9Lgs7hfqbjmlOgcDbgDFoWK15X38GR252dNUvBGYF5?=
 =?us-ascii?Q?7d1q+2ad7FLZn9dg2lK0YhPGcEWEv2yIWu3BG2u6toq2JXq6U93qV4YY4Bk0?=
 =?us-ascii?Q?ijdVS4bXyLXx3Lm6E3xP2k93/scS8mAHywGGz/vK6ZCvSPSfi/GJ7X8hD98w?=
 =?us-ascii?Q?+Lc+68fJEv7kjvuSEBmBKVtETJhKNhpY/lsDQlMPEGwr0qqCFDvIT7Ei9P8P?=
 =?us-ascii?Q?kGVB7gRW+PNSldWPysIuroCS4K8XNT683YahOm2XjJmntIerTtGZnp7C+Q/T?=
 =?us-ascii?Q?xUAROuqMiOjMQwSmySzp6uOU7GUYuFrPHNcDfO7PmPGk97N+eqXQFTs1q3Cg?=
 =?us-ascii?Q?aEwFFeDyP68ttCYPut3j2fpjt0UrHhf58AnF6CcFgk/+ENO8pr6BXBh3DOiH?=
 =?us-ascii?Q?MhQ2S8Nd+Fnwlmw/XlTeO0mmMr+om3f2xLSWwDnKx5YWfvaJxk27MA5t+wcT?=
 =?us-ascii?Q?g631tWyQTAmCtNxfL9sdQk1bLoa1rjyA3OQJAm6PijHIwagqoSCiIbOZJMOQ?=
 =?us-ascii?Q?5JQxnke5Z9H+UzrPUDKWlmX5iLVRi5bMYiA7u4giaKoe56TcMYWs9RKCBoZ7?=
 =?us-ascii?Q?2VAx5dd3pVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qhMQKzVzu3Qg3NkrjS1vM9MHCGKsQigKSiQ57HoxPf9sVtrQlsuaQ2eyEqS9?=
 =?us-ascii?Q?lh0sJvCGR1fZiUXY1+XzfvTRKwYrrzdAYBE0DVbXcdAQTZxnJu728EPpdo6F?=
 =?us-ascii?Q?ZAngxF7VjVVJxyCqiRFFZaYlIPQ5Jwmk2qJXOLy8KMJw4xvjESlZ1ZiK7qYa?=
 =?us-ascii?Q?POD70yuOdo0CinQmvV93VfGp8V40m3h/6pAya6EpYpnRICucBajGHEN9qJrE?=
 =?us-ascii?Q?niSJT0O2D7e/kXLHhIh9j8sm+JvNYXhYwNG9JC6tqXtbIDsDJbvpk+QOYK5M?=
 =?us-ascii?Q?fJjwN829gsCk8MOo2blVxWeZ0s5xuO6tNzVbl3lNDX53jfxOw6/dV3fMJGPu?=
 =?us-ascii?Q?EMt8+ppH2uWsEb0mGVP43TsSD3VDMvLF+FjrgC44MmmVUW7nqUdlFYQMey6z?=
 =?us-ascii?Q?BRCo3zoNcV6smduyMHW+7aMV6BD3Qhsqy0lhUEPz0v4rutJw1lLanz+M2rxQ?=
 =?us-ascii?Q?WNt9rUH5tZ6lpIUbDVWDtwMpj4hxJzC3fvaczF4eOPNkEKASHGA70cJqqhDB?=
 =?us-ascii?Q?AhVZlE8Nwe5HMYMMnT6ilRFmOMpnp2VIJxHltmNsHNRMmAC5WADIfYOz6GIF?=
 =?us-ascii?Q?KaA3ldA2cenx/BUF4FMosN433fZPnCIDdc6Gq0lemU9521UcPrN1yikw0VR6?=
 =?us-ascii?Q?Tu1xHr5FImgL/9css5lvTvA377q5MRqK49ueDuO9KzH8JMZ/ujkxVXyWGPaH?=
 =?us-ascii?Q?ZT+B6Mg6YIXoL23OdGXjacK4ooLmRbtK2dSQAR6LRUHRA2gq2jexVDBcaccb?=
 =?us-ascii?Q?8uAqoms8iylWU36Bz9zWwRZJ+pEG0kznK9C2SYWpvTSkbscVybf6wMZkeqH9?=
 =?us-ascii?Q?0QZHg/v5J242Zwx43klHPt0+N4YNjsZ3UMCo9dGVWdPfJB7FXmDYj8O/eph7?=
 =?us-ascii?Q?ItGW7pY+M82PzVt8WSQ+R47h+GFpbQKKEvJ8ZO2CaFqFjVGYS0rmYCLAyQU5?=
 =?us-ascii?Q?i45jr07nEySD+2ub0K/PEup+DVmyE5msAxZRUJDvq3fvE1Q0yZbzsixYK/8R?=
 =?us-ascii?Q?DHCxkQuCjp2LhYRefmTwJQg6HBJW1b7dpCJ0a7DyQAFBzFq+wRCxMiH/dvqn?=
 =?us-ascii?Q?+2zEfldUJIM+IzP/qi0WLezrdh47nMsWhJM/dZ/vHQqF6A0cwfd0w9t4c3mB?=
 =?us-ascii?Q?QRIqdn+Cirjl0Fhm4/w08tgs+MXrjjMrdsFn2GdJrxPxUQYgCIb2CQ5BKLrx?=
 =?us-ascii?Q?LSRewxqe8hL0BPIK0QNZddyN/ik5+ih/E7fPGT8i4wCFvKc4i4Jxxx+rhuCK?=
 =?us-ascii?Q?wlovhRQxXR6hZ3P1BhrgdisD5w7m0soyjAeFo1QUXqKOohk9Z0G3rBRChyoU?=
 =?us-ascii?Q?oE2eDHMMnsIF66ew2hJKNLrXkdq1WZqR4TpeJx40KtvTzZE84gxm+OallhM9?=
 =?us-ascii?Q?woprrGN/nk2ggxiDpX8m2xVBfp81nevRSBJrdwsyw9LnV5No0aeLC99sWHgD?=
 =?us-ascii?Q?US8zuawEMa+G/gw/wuQlH1RB6drmYhVPA5/3c4Axn5Q4iSRPB1jfbLfw3fIv?=
 =?us-ascii?Q?Y+mEZp8BGtcHFguJUmtDojPy1hsapvvYxI75vh2OJU5AUYhzV7JY6Chc3i6K?=
 =?us-ascii?Q?2U5d56IzgFgvAMLAe6HG0ZEd21o3a02cxlByIKeAdJ65d/TZZp17pUVnJL2M?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f97926-e96c-4598-cc43-08ddce5a2562
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:41:12.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFbBDwVbNTTS3oPuajJxi1ASt7HKevQHhEZ+I/oePUMP4aG9+VTXHE5iPSKyLrZBly3ew3zzkLRo62AwpDdDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Fri, Jun 13, 2025 at 06:25:38PM +0530, Himal Prasad Ghimiray wrote:
> Provides a user API to assign attributes like pat_index, atomic
> operation type, and preferred location for SVM ranges.
> The Kernel Mode Driver (KMD) may split existing VMAs to cover input
> ranges, assign user-provided attributes, and invalidate existing PTEs so
> that the next page fault/prefetch can use the new attributes.
> 
> -v4:
> fix atomic policies
> fix attribute copy
> address review comments
> 

We are getting real close to this being fully reviewed, so I think we
need a UMD PR for this ASAP.

Matt

> Himal Prasad Ghimiray (20):
>   Introduce drm_gpuvm_sm_map_ops_flags enums for sm_map_ops
>   drm/xe/uapi: Add madvise interface
>   drm/xe/vm: Add attributes struct as member of vma
>   drm/xe/vma: Move pat_index to vma attributes
>   drm/xe/vma: Modify new_vma to accept struct xe_vma_mem_attr as
>     parameter
>   drm/gpusvm: Make drm_gpusvm_for_each_* macros public
>   drm/xe/svm: Split system allocator vma incase of madvise call
>   drm/xe/svm: Add xe_svm_ranges_zap_ptes_in_range() for PTE zapping
>   drm/xe: Implement madvise ioctl for xe
>   drm/xe/vm: Add an identifier for madvise in xe_vma_ops
>   drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for
>     madvise
>   drm/xe/svm : Add svm ranges migration policy on atomic access
>   drm/xe/madvise: Update migration policy based on preferred location
>   drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
>   drm/xe/uapi: Add flag for consulting madvise hints on svm prefetch
>   drm/xe/svm: Consult madvise preferred location in prefetch
>   drm/xe/bo: Add attributes field to xe_bo
>   drm/xe/bo: Update atomic_access attribute on madvise
>   drm/xe/uapi: Add UAPI for querying VMA count and memory attributes
>   drm/xe/madvise: Skip vma invalidation if mem attr are unchanged
> 
>  drivers/gpu/drm/drm_gpusvm.c           | 122 ++------
>  drivers/gpu/drm/drm_gpuvm.c            |  93 ++++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |   1 +
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_bo.c             |  21 +-
>  drivers/gpu/drm/xe/xe_bo_types.h       |   8 +
>  drivers/gpu/drm/xe/xe_device.c         |   3 +
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
>  drivers/gpu/drm/xe/xe_pt.c             |  25 +-
>  drivers/gpu/drm/xe/xe_svm.c            | 110 ++++++-
>  drivers/gpu/drm/xe/xe_svm.h            |  22 ++
>  drivers/gpu/drm/xe/xe_tile.h           |  18 ++
>  drivers/gpu/drm/xe/xe_vm.c             | 295 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.h             |   6 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c     | 389 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h     |  15 +
>  drivers/gpu/drm/xe/xe_vm_types.h       |  38 ++-
>  include/drm/drm_gpusvm.h               |  70 +++++
>  include/drm/drm_gpuvm.h                |  25 +-
>  include/uapi/drm/xe_drm.h              | 253 ++++++++++++++++
>  20 files changed, 1368 insertions(+), 149 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> -- 
> 2.34.1
> 
