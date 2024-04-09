Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D34CC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE20E11240B;
	Tue,  9 Apr 2024 22:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exBiLF05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6150511240B
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712702659; x=1744238659;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TODQP0KywedwBjtUb4ktrdbAKJ1ZCv21lj9Vx7ukCSQ=;
 b=exBiLF05i0/bPdbPHi/+JdtdCHrvw1Uy0WDkYkjSlZCdfKyO9moAiesT
 Evwv1KQY6Bx1xA8Mxlu76rOH1TgTlBOO+Tfcc4Vz0Mo1WQV5AU+VMxcDw
 57wzFyVf603pQMmQfHqGwhUo2KOeAkyzRDEOyx7bfL3WqZvRV7YPT5DE0
 VKoOAuGDX7keBT+7KZTJvx0Cay2e6wctFLevVFQ7c5dMzIGBGuXqc1bUM
 RCo4bQGLas87jpdMcrFEHeblB9JZZVv6FTTISKcEaKuqvJ7bL1AfZD0ZP
 BbnTrwTeOD1DS//FKduLJy5cdPE0/OfCxKfjo/MH9zBDwJbfRgAmSQ/G7 w==;
X-CSE-ConnectionGUID: MeWriQkZTJKklGxd9VwYYg==
X-CSE-MsgGUID: GEVg09/3RAun+3ZpLwmN1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8269527"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8269527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:44:18 -0700
X-CSE-ConnectionGUID: oDNXM43JQyqNFdvu6R/J6Q==
X-CSE-MsgGUID: obvr2GWRTHW+VPI93VI65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24866627"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:44:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:44:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:44:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:44:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZN3+Nrfgj5fltLMUW5W2LbRqMOU2Aim2yAFSg2lt+ZXfCYQJ6UCSTh0siUlAQR6mc8DOUhSt6gCClIj0OHHVvCK8VIPHpiRzBu+u+1xFAEg7e1MPE2MWb5Q8mXDCwnlKECM5bB5DjHHVC0YYmv6uWWQBUl2/qKZeCBhimBzkHGnif/GJwcdWyhrGynAwR0o7DiNWUwC3OIjalfnr8OXTPft055IzwoGuc98AlT1ALFoyArqdhJgULjm+I7oQ/tGZNCVpM4qAjvjaMkrY8yd3UJm9CqryC8UWJ5go508NXAy5vMkKQwFMyGGr54jcggXDcL+XUFoEo3He/hmB+OJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uONw9i5h7FITwqm9pJKZhdpbE74AJNwOwZX9fL28xAk=;
 b=amOsx4bjP/AivKXVmXPbmnL/jMkXyjdnI+FsfqmvgoOAsppKT10K2A0M0zKdqIfdX8sLVIGqROl/lUPr49zOdO25MI6eBXFUXwpZSZ/S9NzcbIggldEJQaTr+j3gCJEfYEYXuaRoUU9NJCLpZ0sM0bSmag/Cksu3KP4pz3CoYsje3RjrevKe35PKYWRPwp6T8C+lis+QasIG8YE14goHyImGnopeokZX7tI8hJsXq+TUiOduteIxq6wXEp4MSLft3IPARVouIPn6byCJE/9kcgn4WQ0/lUJwDMw36YHsP9R1wbhT8zC3KTqCCDp34KpDJwMSTVWGVB5XYrTQ17DlhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 9 Apr
 2024 22:44:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Tue, 9 Apr 2024
 22:44:09 +0000
Date: Tue, 9 Apr 2024 15:44:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/gt: Add L3 bank mask to GT topology
Message-ID: <20240409224407.GF958162@mdroper-desk1.amr.corp.intel.com>
References: <20240405115915.7-1-francois.dugast@intel.com>
 <20240405115915.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405115915.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6745:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ZvYnozNKyAD4ZiRtKomkAFL43Issf4D8jAl2AWGqNlHpgto/lSWfrXECT5bkQmwN80HTGuEl0RUoBRZvylBg3f/EiBRFw9vCBg+BdSdungwnCS3aTq4Dz7f9jK/77eBSN0gpPjTxRgVrP7Ri0dG4Jc2AwDE4ZvEESlVwDUPriwKIXuNSt+knCHtb2MAuqzGmHXmylumwLgjspbxTV69f7OYHfRSstOp4TkH4JQ/XmwU1SCTvHOcZC1Iw6rBE7Ve0ChbCl1wEtw843ynsH2uQ7qyicys3C+YXCudZWe5Ah6Nznu9NlT1dvQoK2OgbdID6OC17WqcoLSHJccC2rLGTzSc67L9WAtJn5kXHIbgomOrALyFBMOZI0hM6t+oE7faq4BzvMzL5uHiQ6QqiMwd0Cylr6D8VFjA7MNZD1FaU3jcqmgKgxN7FCNF6ffhVjjT+bEO7HdlQHDcj2voYl/XygV7BnHWbfqH8KBwW5+Ap4XkylYo/QIn3k0+ZLLEIx8YstEe+lgJfqv27yFpY1zTO53rLqSxVD/46rJkXRaxmK2naaSX47uU9Qv78uvrxmfJpqNlzisysuQc8xhLdmuk+50QZkLT7+YW13LOOxpoOiSSt5IlceJjQNyszT2XvrJK+u9edF4EopSNDtN0eC7tLG30bIaWZFRaZTENdGf2QLU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJuNmE5b0ZlSVRqSnVkS0xXZEc1ZllQMEUzVlVwMmxFVGx5SkplN2hKakVn?=
 =?utf-8?B?MTRnS3FJOHk0NkRpamZQRjJkS0dnU1R2VDVrR0NRWHpnUjRvNWl3MVVlZ2Mx?=
 =?utf-8?B?RE9aR1BiMWFoSmxzcExkNUhrSzdBOXVjZzZwa1ZoSjNQOW8zNDRmQ0V1SC9x?=
 =?utf-8?B?eHZnUjBYRFFLcnJkaXROOE42ZjdXOUx4T005SzRJZC9aeGtKRFNTQXRNN1lv?=
 =?utf-8?B?S1NENEFxaXR6Qi9lbzlXc1ZWS09GNm03d0s4d1QzSTdJZkFheEJZNE5aN0Vp?=
 =?utf-8?B?eU05OXpVQ21BVU5wTmdyZHZ0R0I2SXRsdEpvdERGZk9qNjRvc3Uva1dFeS9s?=
 =?utf-8?B?bG8zblovaHZhaVB2L0svMjFqL3lFUThEdGl4VlpQMGZWS0l6cDdWM2trK1lO?=
 =?utf-8?B?ZWVtWDJ0ZHlMS3czWWcxQUlnN1NRUFVHSHV4eEdwdlg5Vyt4bzgydTZuZ0VQ?=
 =?utf-8?B?WGs2Qm4rK0h3SnVYL1JQS1RQYkpEZ3k1cXU2aDJOUEhYVE9Kczg2NDNsUmxQ?=
 =?utf-8?B?MHhvTWREalQvRjVuQmRZRGpNWi9LNHFwdzNtaE5XYzJUY3lXMTVnN1BiSTVV?=
 =?utf-8?B?cUg0aTdmZGpVYWcxVUpybDhWQStiQkhuck1nR1RybnVYSWFqZFlKMUFxTXF2?=
 =?utf-8?B?YTVjektQR1o3SnVndlM0dXBoYS8zNXdidlN1QnpBOGtab0gzS0VIMHVNTVhm?=
 =?utf-8?B?RVdQRUNJZ3VtODFEUExQRUkyNXpjbXBhcEVWaUJJNlQ4d0hzV3VxQmlGVUov?=
 =?utf-8?B?WGFOTC9mZS9ZcC9QL0R6S0JtRStWR1dnSGZ0TEpPUnEvRFZvSHhiOThTMGp4?=
 =?utf-8?B?b0pOaFdCT1l0dmZrSzM4UDM3UFZUb2FTUklFS0NaVDI5bXlCRXVyWE9SN0NY?=
 =?utf-8?B?M2dvUStSSGZualF0dDZjQk5GNkhMRVFPRGpvRmxrZXcxNWtPZG1tMzF1a0lK?=
 =?utf-8?B?S2t0dkVwSnRMMUZveE9CYklLLyt0MldEREdXc29HbUZIdDIrQkRLRVluU0E4?=
 =?utf-8?B?N0cxNVdHbDhnWG9YTFZiT3hGZzFZbkt6SklyWFhZVXRaWVh5NldVUS9YS1c3?=
 =?utf-8?B?Z3BPNUR3ZnRJcVZabXNxVDh3ei9SZFA5RmcwS1JCbnhpYVRHWnM4bHBYUm1m?=
 =?utf-8?B?VjcvcG42cThwaURUMHhPdlhRTnVIdFYvMDVDZ2RyM1BzSHY1OVl0TUFaY3Bh?=
 =?utf-8?B?Z0hCSElHNS9XMDF2TFVUc1F6YkZCUnVEVEpPN1FyUTB3Z3RvSUxGR0xFa2FU?=
 =?utf-8?B?Zk1vTU9sb0cwNDdHcHlkSjNQQmtEL091ZitoVmxkbnpqaHhxUlQ1NFFtL2FR?=
 =?utf-8?B?bXhPUHlGbHZyN0VVOGNMdkVFU09jcUZLODdGOEFnTlZmTTZScDdVeTdxclNt?=
 =?utf-8?B?RUtoM2dUQis4ditLWmJ4bjhuL3BvK093TmtjSjI0UnJSSzFTY0VQc0twcmpY?=
 =?utf-8?B?bTNaZm5GS2NxWEhjRGpyY3RQUHkyS3R0OXdDQjZwVWVmVU5hOWVidWN2SWln?=
 =?utf-8?B?S2xLVmlTS3Q2bGcwNVIvMDU2dWJOKzhaamZFbzh5d0ZvamJUNnptM0VtTDBx?=
 =?utf-8?B?R3JWbWZmZC9CS1YvQVB5SGdQR2NhUTdDVDdWa2x4bktxQm5hNnJyd3lzQ0t1?=
 =?utf-8?B?ZzV1SVM5eHdJMGpESGs3QWNrdno3MUdmbkw2UEtVOFlRTWFiUXBHNGVqVzRk?=
 =?utf-8?B?Um1VOENESEZKVFBVZnUrdlYyRXh5THRab0J4aDRWQ094L2pCUE5BL3NTNnJk?=
 =?utf-8?B?VVRKam94dEdIc1FEbDdqaTY5T1BrZHNjTUpkRlpORmhwSVFhQ0hOS3VpVGRh?=
 =?utf-8?B?UXU3NkFpSVRnaDE3cGo0Tjk5MERlOExHUlRIdGV0Ukk2V1pFclBtTzJMbzMw?=
 =?utf-8?B?dXNkK0dLdHE3SHhkMi8zVlhxN21FQzFlNFV2MVZQamp0aWg1cVAycFg5SGZH?=
 =?utf-8?B?bXI5MUZIUTgvSGVLMXpRbXdwSDF2Sk0zTUU4WXpYVFNHZWFmNWlzTlVkYjVj?=
 =?utf-8?B?Q0hsN253SmJmZjFGUHJBa3lkVWpEeWlOdnY0M0Z2QTdzUVdscU9sTHRpbnEv?=
 =?utf-8?B?UkpWMGFYVjJjL2pRdXhDT3JoeTVQQTNKeTdwNHMyNFpOU0QzcGg3aGtmTlNQ?=
 =?utf-8?B?eGgxU3lQMndyRXFOSi9aelNIWU1Tc1VjenIzNWk5dEZ1WTFTMTE2VGJ5NEJE?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afc4764-798b-4bca-dbfd-08dc58e691dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:44:09.4480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXp9FUJTsasFPJ/HeSXdRkd/Mx6X29CaLdDndZr0Dp2buWQiVw0VMIiGmGlZ3LarefhBOzNFcaFzNHb4zr8OId+5Xuih7ZhITcb2EZIqg48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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

On Fri, Apr 05, 2024 at 11:59:14AM +0000, Francois Dugast wrote:
> Generate the mask of enabled L3 banks for the GT. It is stored with the
> rest of the GT topology in a consistent representation across platforms.
> For now the L3 bank mask is just printed in the log for developers to
> easily figure out the fusing characteristics of machines that they are
> trying to debug issues on. Later it can be used to replace existing code
> in the driver that requires the L3 bank count (not mask). Also the mask
> can easily be exposed to user space in a new query if needed.
> 
> Bspec: 52545, 52546, 62482
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 107 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     |  13 +++-
>  3 files changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6617c86a096b..c026b9d3ca15 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -157,7 +157,10 @@
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
> +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
>  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8..de2ba412e86c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitmap.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> @@ -59,6 +60,109 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>  }
>  
> +/**
> + * replicate_by_mask - Replicate a bit pattern according to a mask
> + *
> + * It is used to compute the L3 bank masks in a generic format on
> + * various platforms where the internal representation of L3 node
> + * and masks from registers are different.
> + *
> + * @xe: device
> + * @dst: destination
> + * @pattern: pattern to replicate
> + * @mask: mask describing where to replicate the pattern
> + * @maskbits: how many bits represents each bit in the mask
> + *
> + * Example 1:
> + * ----------
> + * @pattern = 0b1111
> + *              └┬─┘
> + * @maskbits =   4 (bits)
> + * @mask = 0b0101
> + *           ││││
> + *           │││└────────────────── 0b1111 (=1×0b1111)
> + *           ││└──────────── 0b0000    │   (=0×0b1111)
> + *           │└────── 0b1111    │      │   (=1×0b1111)
> + *           └ 0b0000    │      │      │   (=0×0b1111)
> + *                │      │      │      │
> + * @dst =      0b0000 0b1111 0b0000 0b1111
> + *
> + * Example 2:
> + * ----------
> + * @pattern = 0b11111111
> + *              └┬─────┘
> + * @maskbits =   8 (bits)
> + * @mask = 0b10
> + *           ││
> + *           ││
> + *           ││
> + *           │└────────── 0b00000000 (=0×0b11111111)
> + *           └ 0b11111111      │     (=1×0b11111111)
> + *                  │          │
> + * @dst =      0b11111111 0b00000000
> + */
> +static void
> +replicate_by_mask(struct xe_device *xe, xe_l3_bank_mask_t dst,
> +		  xe_l3_bank_mask_t pattern, unsigned long mask, int maskbits)

We should probably s/maskbits/patternbits/ since that's the size
actually being passed here (example 2 above does a good job of showing
this).

We might want to put "l3" somewhere in the function name as well to make
it clear that this function is specifically intended for use on the L3
masks and can't be used on the other mask types in this file.

Aside from those, the rest of this patch seems to match the information I
can find on the L3 handling for each platform.


Matt

> +{
> +	unsigned long bit;
> +
> +	xe_assert(xe, fls(mask) <= maskbits);
> +	for_each_set_bit(bit, &mask, 32) {
> +		xe_l3_bank_mask_t shifted_pattern = {};
> +
> +		bitmap_shift_left(shifted_pattern, pattern, bit * maskbits,
> +				  XE_MAX_L3_BANK_MASK_BITS);
> +		bitmap_or(dst, dst, shifted_pattern, XE_MAX_L3_BANK_MASK_BITS);
> +	}
> +}
> +
> +static void
> +load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> +		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> +
> +		bitmap_from_arr32(per_node, &bank_val, 32);
> +		replicate_by_mask(xe, l3_bank_mask, per_node, meml3_en, 4);
> +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> +		xe_l3_bank_mask_t per_node = {};
> +		xe_l3_bank_mask_t per_mask_bit = {};
> +		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
> +		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
> +
> +		bitmap_set_value8(per_mask_bit, 0x3, 0);
> +		replicate_by_mask(xe, per_node, per_mask_bit, bank_val, 2);
> +		replicate_by_mask(xe, l3_bank_mask, per_node, meml3_en, 4);
> +	} else if (xe->info.platform == XE_PVC) {
> +		xe_l3_bank_mask_t per_node = {};
> +		xe_l3_bank_mask_t per_mask_bit = {};
> +		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +		u32 bank_val = REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK, fuse3);
> +
> +		bitmap_set_value8(per_mask_bit, 0xf, 0);
> +		replicate_by_mask(xe, per_node, per_mask_bit, bank_val, 4);
> +		replicate_by_mask(xe, l3_bank_mask, per_node, meml3_en, 16);
> +	} else if (xe->info.platform == XE_DG2) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 mask = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +
> +		bitmap_set_value8(per_node, 0xff, 0);
> +		replicate_by_mask(xe, l3_bank_mask, per_node, mask, 8);
> +	} else {
> +		/* 1:1 register bit to mask bit (inverted register bits) */
> +		u32 mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK, ~fuse3);
> +
> +		bitmap_from_arr32(l3_bank_mask, &mask, 32);
> +	}
> +}
> +
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> @@ -103,6 +207,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>  
> @@ -120,6 +225,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
>  
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 2143dffcaf11..e60156871026 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,13 +24,15 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_REGS	1
> -#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_MASK_BITS	64
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_MASK_BITS)];
>  
>  struct xe_mmio_range {
>  	u32 start;
> @@ -327,6 +329,9 @@ struct xe_gt {
>  
>  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>  		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @fuse_topo.l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
