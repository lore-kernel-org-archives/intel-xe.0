Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E7EC7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F7F89304;
	Mon, 23 Jun 2025 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+SqMiCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F889304
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750696507; x=1782232507;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=spUCvkabiLkHHCkkBz7B6uoSbVVXf63Ltzx4oUqqhUs=;
 b=m+SqMiCMLfBzEhpZU93GgqZDM708PmSPwiHhUvHPCJsKjwVQnz9JJSyK
 ujf1wZwTLu9D2IQdoS/E2KH+boNqQhrPY4jDZ4bMtUgzpCndMzS1tK7PX
 yuiorvxLzp/rKMkRmzuwjaXgG7uDUW2o6gzAh9D0bICQxFsEfmpAGePsq
 Odg7S4OsxMbwrq36U8FM1BXT+Eu1doYBh6aGw98qmfouEwc5NTmUr7I7H
 f/Udyr50LTE4T5W0bzt8aURB0REV+qb4QmZ5NCwY1hP/iXi6FmRYTLxRi
 wyrweVftX01QzGOATkNM7v/+BmukuG5WzOE/jLNztt0y4gdCOTdtyW95J g==;
X-CSE-ConnectionGUID: RicrsEdIQPmFMOpPjEzyNA==
X-CSE-MsgGUID: EYOhVKIpSUOVOBPvRsA97Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63518203"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="63518203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:35:06 -0700
X-CSE-ConnectionGUID: GRyJgsDoSWm6mMaYRzhOOQ==
X-CSE-MsgGUID: E698k2npQRK+ggxxadUeRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151127919"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:35:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:35:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:35:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:35:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADI+sZeYRRq/Gb+mcg+kBH9TvWzKf6IQ/D7jg9XhxqrVspW1LsZ5Q2nocMChvGU63P5E+hVXn1ryt+fVRfEYRC8feeR8cExJQxOCt4n07PU8TDS/PT/sm0x0/7LQTH4W5pFdBfo3i00wiVEVxP2gb0bKmHgT1rO1aubdqb3stVJVjnEBtYxz+8xa8LQqLwBDtfExaXbLBvE5ayZnr2FlWo64Q7RiZBc144+Si6GxqsiLLs6sgf8G6M4eCklzWThGjRUhTaL9pRCM6gMHeWJh6k+tQa7hoJFa+IoeTAIJzkMsMSMqW1iZD+CbBjIQOLdPPa7C2KQw9tdig4j4eLEPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4URmAmAdC8q7WghhNARGUBKDakrw8vL7gt5d7ksKQgw=;
 b=uiYu7ub9edAJ8a+s5cqKp0WvgQ3ZQpGSwEOCyYJAUPfyGIJD8P7xas3nZqK8WF1GHFkgqVnFaTI88gz9D0Pan7yKYdMxDkgMqGr0TRSzy8lPuYdNX+Azj/VrcLDPi779p195mttC+2mhtfyhOJzf5liZsgyhrpHZo9q9LVZEu5pLzOor705k5/id0s1cfYZXNBNJk34SON20mJn73oHVfG261za8cRhLiOnET/xgDWmORHk28Q8JE1XbPYEGSfFjIYQEByOrsoE6oI/wsiqVc9Gpqwo3RMwKO4ch+siiUeynvyzDl7m7S2aQmvJthsLd3FYdQvJeOOYAwrCCR5lM3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:34:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 16:34:57 +0000
Date: Mon, 23 Jun 2025 09:36:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 15/20] drm/xe/uapi: Add flag for consulting madvise
 hints on svm prefetch
Message-ID: <aFmClLeUwn7FBI1a@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-16-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0074.namprd04.prod.outlook.com
 (2603:10b6:303:6b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: e99644b2-2710-40dc-9481-08ddb273e417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4s/xRFPceEPsqQtLVvejS1POJrMAyCS3e6/9NmfL4da6Hid8iBZBo+cGq7S3?=
 =?us-ascii?Q?51k1lL1Y/t9s7xnQ1VNQtrU87+zCe0h37cvbMV79ZFnwpd9tPaqSBCO+dd7Q?=
 =?us-ascii?Q?HCzzSafgfAnM6TF67JzueuZvVoySQBOMPgNSp9JbfY8ZTIgg4TWffM0vsHHO?=
 =?us-ascii?Q?Qm7NL8ZDF9MVVJuZc8CJk/kByqIyBZWo8Db5p6dpUb146jOHj0qFWCjc3TsB?=
 =?us-ascii?Q?1vVDKL+cDCortIClsjjWNIxPLvmtsJCcYxFFMC4ubDeF5jc3P5obwCboaSMX?=
 =?us-ascii?Q?l7UOUaMW/JoE+ifGbkbDLq0q1y58RHcfSXD0UawkHL/epafoi7qK7D/Y+XHo?=
 =?us-ascii?Q?xwEXD3Y3Ay8OmD2jhvJ7Ek7ywl09DqBTyJOB+4B+Xk9buqITH9mfM3u3bs42?=
 =?us-ascii?Q?5AFBzFouQescay2JIJmvDfAeqUgDs6qzchbQmvCcaE4TJSQV5NFvcfYJkVcu?=
 =?us-ascii?Q?8AxU9T2LFKWNS5uYT8HfAju8h0W5W4RD54hLpRYMu+SGzFjrNQV4XXkkSHOq?=
 =?us-ascii?Q?yg6BD/IJ5I2IhMgw4py+TSFGvLP2uAR2smgIHobZ1z7i7cs2I1iJbXfC2wZf?=
 =?us-ascii?Q?woB7Lu5Pw0zV1o+d9rZnsADFfRX2wniMBDIlIMLk1d+83+5ijUJ5WhjCAQyA?=
 =?us-ascii?Q?Eet7CrVVxlHxuSyH5o/BSR0prJ9pCmwDj/lK09CTo6rIEze6XFHQeuaPrZX5?=
 =?us-ascii?Q?kP8UDCH1v8xyi8X2IW3ar20jy/occE0oRUcPkWLNZ+ahmGWqBbE2gjurt6hm?=
 =?us-ascii?Q?XmGWc0QRJvErqdqomX366kwcpO/nv7vHqCXcIbixK9EvIes6HacerWLREr7a?=
 =?us-ascii?Q?q+btLeP4TwXlsMidCBd7Xy4pIEm76eBH9u0GhiD0opPiiyacQ5grWwUrKKZC?=
 =?us-ascii?Q?RfWlpQTIuKJ49vbAapcOQ0Ag1+VjNNQBfrglu4equQM1Oj9GQPchRqsBxD0N?=
 =?us-ascii?Q?JbEPuQLqb54SeoKDnC54467gddDhDDQmo28tjFWTU6N7RYRTswcwXi8Q+TE9?=
 =?us-ascii?Q?ikEh8jd3bNgg75WdIRAPxBx92Yuhjuk/BKQ6qu//5UQZVJkpRbvHoZOjs4t8?=
 =?us-ascii?Q?3s40IFQf+pt0fTTs7ZPNw7HaDrUWW9EDK5jEIyMac9m5P9F5npj7jCidQNy8?=
 =?us-ascii?Q?2x7hRgxMl/E/LxvkMd2hxpgXW1XLQ2WpyjR860IUFgLKroBu0ZflS0pLfqv+?=
 =?us-ascii?Q?fBIdpDVbwKAEWpQ40Xp7rJvL0RetcYGWsi+IPjojVL2L5U4+JA5EAEYjMauD?=
 =?us-ascii?Q?i6stzg7q8JBqpUQB2pkZiTeJIlcZjd68Fs0BbUgYeULdUFbJ57xoVkfvoVpo?=
 =?us-ascii?Q?buGwaAglTmByjDhQ7GIwldqquxITfKtZVYBC9J6eTg/Xa/2oiaQWxrRkCj3P?=
 =?us-ascii?Q?KiI0cebcSAvor8MoD5O5WHaNvgek6diDbJvO5O6DzuP0TuAY0CbtZ5EjSaLp?=
 =?us-ascii?Q?iOoKGl0B/44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?60a1fgu7JyL2PlaBuxEwSRl3ZsG+RYlfQ7J7roDvDjNS3k6NijTo75oXR6pQ?=
 =?us-ascii?Q?8qI4fqgQL6ImBE0IqVTu+ps5MAKw8c1Z8ICIX44XjNmqvLokT2GkjYILpVF2?=
 =?us-ascii?Q?y6B5PNRxCmdGe1bfn/aIl8uctjV/WEFEeJzSWGqGslXSlQuSVvLpLGWzDmbE?=
 =?us-ascii?Q?h3tmANSM/PLjd7Zd/pJB/ggMpGzuUJeakOfdPXA465JtL7sqk2qsi9+TWAFu?=
 =?us-ascii?Q?JR6Cuq7tMvAWcPZ4SQbybMbA9Heff+w7J6B9LMkR4JY0uM8LijQvepj1rikG?=
 =?us-ascii?Q?6tVqwe+hjma2K0c7rzFLdtxJ90cw083Q8CmRxU9X5F4irIFlNBKfsNIVteSu?=
 =?us-ascii?Q?lECnjJUx0KGE9xBV87jFmKh+mo2bVkuKgjJfrWtLsxL45kYCfKV7WF2ZPpUs?=
 =?us-ascii?Q?12ozUIIqhkm7zRntMsy8iUVn56tQmwiMQdt8MsidoXu0XwUDdJNaOWkW5utH?=
 =?us-ascii?Q?Wp85h5lVpd4egtjbBCbmFEcbLsiA1BCPQLi7810tRA2D8o1OgKSuhiooABUs?=
 =?us-ascii?Q?2KjQFsMM29aipQYeBmipQX+WhhC60/rHThTNwTj3SxmkowPj5eGu/Enl5XTI?=
 =?us-ascii?Q?wFTIdyecVkAqTyNd42LAF7NylVvVqXYAWbdf87h9rNPx1Oc0dsJuSilXAyHV?=
 =?us-ascii?Q?IwTUhOQ/fHUsyryQphw3t7NWOlowAPukmUDaMLznt5zkmP3kwEI5whC/jHsJ?=
 =?us-ascii?Q?J5AaIFakSJNV1+6M+DFEop3iC9dNYilu23Dm4VieF3n5hJr5nZnAb50scSOv?=
 =?us-ascii?Q?M3Qe7jwSOf1eAxcLs8JAjRwPRJ8wVgdw/oAeqEJ5cxPr9o248TcGNCMwHs+6?=
 =?us-ascii?Q?qyEAf9cxgNH2a0myDL2f6VBYl5ksFCwBSLB1mgONMBFdJmAadP8V+Ot6J48P?=
 =?us-ascii?Q?ORQu768AOwC0zDWIVYsz+MQQFrrU6IdPeUZPPZBwKlVvAKaX9rxFokIbzgT1?=
 =?us-ascii?Q?GnSFNLUT81MR0ZRLZqroOzzk61wU/N34f8piQOnbh2mqvSx4OQcsqxQMV+HU?=
 =?us-ascii?Q?cBlQWDPw1O7qyj2ujNoy+o3XS3g1Bal5KT9a4MkcImftmxBt138nW+8gIpbg?=
 =?us-ascii?Q?Is8ZFuTPFktN527F/p/XWjM6GtZpQojddrEt/AC8ytor1e29fFmMTDQBqN9J?=
 =?us-ascii?Q?CcqrWSukd6UPARCqjI+9wLvtij24tvqOLKoWXOsROLEn7R5bzXuHuRVaiI2o?=
 =?us-ascii?Q?3ib7n8ozW6hKQLJ6hhNUm6aYVhro1GZZnGpB7IlT2cDBzlvugRaWQZLh0pYe?=
 =?us-ascii?Q?FvWqpruEF/Wj5N/gKzuK++9hC40COBTi5y8V+E9HYYt8ZrHvlcZbWJ1JbdUS?=
 =?us-ascii?Q?4UQ9ivWRRQmT58juVefOqw/hyYkZZJuQqHAURq/sU5WBDIAIJa9FHwaE0vYI?=
 =?us-ascii?Q?XMwXKugXcS/6Sh4ZYdL42hoYgt1Obp6fKRKbK+e9yEM/+s9UVJ7Qvkv/qEPE?=
 =?us-ascii?Q?cv0BOkdOOBM296HUaATBKeynDrHiORaOrqnCuJ8s97OJZLVwkA72eBzQBlIF?=
 =?us-ascii?Q?XCL5dwqfWNZz2/ABxWmEde8AKcYuTqpSyjMm0VB2Mlql2CcCCDabxtjhsJzo?=
 =?us-ascii?Q?cqqy7wC5Ua6v7+k0PJWnMIgK4yL7ypDfg0sFObiAUdTAyzgRV7y3v6J3yVPg?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e99644b2-2710-40dc-9481-08ddb273e417
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:34:57.5681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5g8cqtrYtB6EOO5cW/5MdNfjNGUHPLToBiO5qlIg41MbnY4WGV3cR9O082uVjFpZaNLEoSTWZqPihE+YaW7lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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

On Fri, Jun 13, 2025 at 06:25:53PM +0530, Himal Prasad Ghimiray wrote:
> Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
> in madvise-advised memory regions
> 
> v2 (Matthew Brost)
> - Add kernel-doc
> 
> v3 (Matthew Brost)
> - Fix kernel-doc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b5f8d11faaa8..81e90270313d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1006,6 +1006,10 @@ struct drm_xe_vm_destroy {
>   *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>   *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ.
> + *
> + * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
> + *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
> + *    the memory region advised by madvise.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1111,6 +1115,7 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
>  	/**
>  	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
>  	 * It is a region instance, not a mask.
> -- 
> 2.34.1
> 
