Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B9C5B549
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 16:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E010E62E;
	Wed, 28 May 2025 16:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKMZzDJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8128210E65C
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748449685; x=1779985685;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6DEoe6iqmGD15fuyzr+v5oZKXtBN/YFQB5RSjti3st0=;
 b=dKMZzDJsKUPrTPPiVCAUwgckyn2Tq0LSEIpRjfqf8Yf7BwvmXrop5v+w
 lvftTfRPr081TMTWqkjp2jdjhB+2aFxJJNBShzDvWfK1rE82B1v/LBuBu
 NKReqKMo1lXBgo5+2gkMYG7UzWohXAS5nS9hgoCLEV27r0QqfYyVgGxN7
 aPT0qqaLJd71U/m9yb1lp1wHy3LEQzkkrEsVI3IL8yTbIL2quNG5W/YFd
 CKYPEFFWg0sJvYGK8vaMCkDFBzbhdcIqJZ2VbzgtWjeMclahY/x8uNIsc
 CwkAtSVOdPtO9ggnjFdQ8mP2YA+gE/YU9yXX5waD1uOC3thuNXst/OIVq g==;
X-CSE-ConnectionGUID: ku4ldCCGTWCaKNgB1fynHw==
X-CSE-MsgGUID: ncbL0oe7QmeToh98DqUksw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53109162"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="53109162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:28:05 -0700
X-CSE-ConnectionGUID: SrBrYEkARmisdMje3lpP4Q==
X-CSE-MsgGUID: aP2SsYc2S7GBgPwNPnXHwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148152250"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 09:28:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 09:28:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 09:28:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 09:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPUS0qCUxqn8wZVQLBFxfWOsTPkAZB0opY/FN2XBPew/PCuXTxCn2aG2YYUY2hD1zesMrHEirZu7SgYTp2Fel1jzhN3HDOt9rMPjwYpJbokrA8j76+RZ7seDcQ4wUuPpy2aq9q6h78Ytf3k/7wKO54PT+0Yf9O7kOwgwimummunvW1CAmznruS3N9rcpJjbw5x/dCQcRFmdyr1J6qQRM7svvGyIM6WzooJVdUcpX3PZllL0coTWbWUzmyGxv+jy3pddiKt6rcOlKWrVq8qrJwgCvz9uBimwE9mdcMxMGvvf864vF540XarZebo01EheIrJu7XT9Ctv1a5/bsMZ3Drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzNvJUU+WVk4j0qzcOB4MJbqUkIGdqPGtMsrG9KHwhI=;
 b=gCIgAUYuQQNbFwKXf19Pc2OrRkA84e6tjIVsG3HWJc7H5ah68lHzUeAd/lvUdKu9KAandzmjOeulKVsCqkZzc/KjjNAarYiB6XjCz8rxQUUzOg3qaJDjoG/+vS96dOkBE3ishLa5ssCIHL1KvHyFSpfe5iTOj2Qw8eSc1/lvUu1ojLQ2z3Id31DzmccOmKviFK+Ktlgur/xk6TjwSeycKlLmYv+mGJAHyeyJ/cQBJWKZr7j4gwi6v7QZnrIaw7uKiD6/F++hTaKQl5xlMabj62L7UZblhImdXcOUxjc4wBcubd0esQEF2f0cquQ6UGvgxz6Mjs70NtmMEozP2XN2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:27:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 16:27:47 +0000
Date: Wed, 28 May 2025 09:29:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 15/19] drm/xe/uapi: Add flag for consulting madvise
 hints on svm prefetch
Message-ID: <aDc53iPhQr/llP42@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-16-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:303:85::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ba7400-c09a-4e9f-9b89-08dd9e04951c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NXmgAFUVzJ9jKJ6PXDktBPLk8dDY3EE8mSEO2Wcxuzqn43HMO2RiqqJKIgYH?=
 =?us-ascii?Q?J7FeoXBgoUIKAQxe+E+iutcDS/cwzYNfFfUGSFm1N7/n3SGkcRKm/ue6qwVI?=
 =?us-ascii?Q?gvsmZxtSzY6o6CYe+3yMGJBU6BB4JGOunFcM8lRggp0FpDfxnk9yciOdsh0j?=
 =?us-ascii?Q?8HqQh+ruhzQJcBqE7H9YjTP8yhG/q0YwCXFa5Ar95EPPzaRwX200uevl+Ddp?=
 =?us-ascii?Q?M4L0CU67CG339jifj4Nc5l8y1quijNm9tgBsQA0UiURcvckSFMl4wHpN6KaR?=
 =?us-ascii?Q?VCwTDpqy8pjmhbrkmF4rJkDc7kNi4i1FZYUS5QkEf7Jq0mIIiwE4t1p8Xbbl?=
 =?us-ascii?Q?JgHvRgnhMVYllQPDBbG7/DI+UVBSx5qoUeHCxihsk/GJnSDcV5r8OdDABeaA?=
 =?us-ascii?Q?wI4Ok4OdtdyOkDvq93wZBcfFXixBzFYK+Cr9s+qDdGJklS2BVCg9KtcZKniJ?=
 =?us-ascii?Q?dhE+Chlm+/IjAV8jyfaeFApq2ae3fonslzxgFvlVHZJ1vTVgB28numeBbNOs?=
 =?us-ascii?Q?4XWEKdlgHJAFlGVzwd+VrxNH0sy/vrTV39U50LyEsw8Eg3XnPv3HzAkflsPy?=
 =?us-ascii?Q?uHMinVhuVv98t48f69Gprbyx7fvLWayn0WTDYczJkqYP+UGdlf0xIWwIAvy+?=
 =?us-ascii?Q?5zRlDVhU2+Z+Ezt0yeb2Eh6PUgxROQ9T2jUGvJVbiB4P8ZM0oNFHZeUsxamL?=
 =?us-ascii?Q?JIKyfSzwEzYlzLSZmJIY8gvtBEQKMgufsqQ0LE4FJHVgnGmL8jcp6Sh3+Vgs?=
 =?us-ascii?Q?PsEERiyuSqQZQhjNRu7jZnFlRNgI/iI1faYSJIJ7gJC0v4LtWYrouAbz5boU?=
 =?us-ascii?Q?v/PfrQgh+6xd8l/i/uByVXYaFb5ts14m8SRM6koZxjOCmeW6zFTD9mFhv57u?=
 =?us-ascii?Q?t15t1I3RZ+b7LpAgi9kqr0Jpu1k4Pxaqq8zniOMbnhniEVvvtKeLCt0vF+Rs?=
 =?us-ascii?Q?vXbsOmHiKutq32wqd52nQCucCWN9AvjhvI6tEF7GfkGBOwLpnbiTuKZf4g2I?=
 =?us-ascii?Q?Hv0Nbh+Rx4mRvATYeSygS7OVHlZkgm2JHrSXgEK3oACFUkivK0Hpt4SMQ4go?=
 =?us-ascii?Q?1LA6AC53xrdpq2kbKfTLHmo3awYOQbgK7FLgioqt7ORI0EEvvImLYHLInBgX?=
 =?us-ascii?Q?0/xzbKwRnCarv1ieGNdy3H9PDeep9uP0zajZyzQmX/HI1vrc72fmG1/jprrB?=
 =?us-ascii?Q?tdTcdwkVib7M9sqELXQ1g3IM/F1ZdF9kQTAegMAGi0FixCSctHAx22gki/HC?=
 =?us-ascii?Q?EmArf9RxaAo6ItS1bybqq5pD+Tym7Yv4Kh1n9n6lmAFyNtce/G1orF82AIb2?=
 =?us-ascii?Q?zM8mxKXmFmYuFymB+hm2zCG6T0YztvtBmXo5U2n9TUi5OhIIRkmlPum8+s3B?=
 =?us-ascii?Q?VZ/eBNVG76QcfFHOTovLt4h/DtV0RM82IWP4Zk0AQP6Y3/SJKNrB/k6/HPvS?=
 =?us-ascii?Q?t8usrLqnON8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5ddBvBxi0DXTZWFQ/Ui/1j1r861xe8mUcxyRLG3Nmu6CGeulgPShBVdhYcF?=
 =?us-ascii?Q?BczzJH9h86c0pTKBJGYAjLcvt0Wfqn24tuVgs5BIKfjYL3pebQPFCOqwKakY?=
 =?us-ascii?Q?104x90uldLqHEWbA/f2N0khRztqia/3+coOuf3R5rIqsIjUU0+MFFB4jTdRp?=
 =?us-ascii?Q?vPvGfjWe3W73D5UJPWClRGQlID49uhazp5g0VpDqbvADMTsn/aM6EaNX66Be?=
 =?us-ascii?Q?lSDKcNdMxmBWvAA49lENl01Wpx8viDuAfcGS091/3876CWRkTDaU7UOkwLrJ?=
 =?us-ascii?Q?C+y/hyfUsbOKRuFbmhPv92mactMQ/h5DHIlQ5eo+VtRzCieJ7283qWjYhyUF?=
 =?us-ascii?Q?P8NRFwD8VGldM49+YkPRqw2ODGkPasqjBVnYd7oMxwhbtuBM/becG/ukAmrE?=
 =?us-ascii?Q?986xgNvcWVbgpZYWJ2CrEr2ng5cmT46nUjj3DkGvk/RF4sY9P+6K2IvvcJRV?=
 =?us-ascii?Q?chsGlH11HIAEHbz9TuLPRmPrjzcMrOQoixm3HjpMsciAP27PiktCyUlhMadS?=
 =?us-ascii?Q?TFq+ewvQQMmuGlyNjZO3qTSaVCpUMdn9ZC01SmqKFpccoIg8P7cN/8qe6vOH?=
 =?us-ascii?Q?VhZqJdkE3gGtMgaYqzGh35NiG8DC6Nfvex/G3E5JsWPd8jX+ZpqEuzAcawez?=
 =?us-ascii?Q?DAhgcBVXLBd1dzLzmaxxfeXVUTvPRgKi9pmqfaRa2eH6huoAcu6T9Re5eqfs?=
 =?us-ascii?Q?0dhTH6IuXoSZLb8ihf8hjwE9kBo6xQT5/4Gxb7kYjvUJRReYdWgZIFmfuI9U?=
 =?us-ascii?Q?Wk6Cw+eUNkrU0FGHeBR2xenmV+o6EvQ369R8rzUQiBOzz1vO7b/5Up1ZyGGm?=
 =?us-ascii?Q?WD9GwHPgfzpdvJQDNVuTeu3LfaT6kDqDOPcVqgQsJJfzFu/539eHlWYAfzbU?=
 =?us-ascii?Q?pa9bESV+0YLkqQfqs+ZxM74nqCTENJ7cRswbf8EGZHl3yivMc6gh6RoBKq6K?=
 =?us-ascii?Q?aKDFXxiiXyotm24fnv5vtdDC7mmj6+lsjQgk5K6nyYYtqgSykmFsPkBVh1Vy?=
 =?us-ascii?Q?6PZUft12gqyHzJ3F0BMC2O6qey5kLMYeOgnUAZu/7tgN69TLL2mqwsRqirMc?=
 =?us-ascii?Q?SGgANgXBvbqRyQbCZTcj+z1h7yYBVmX7LKoG4QFDA9NHfKCFrP1x0wQv9uVm?=
 =?us-ascii?Q?yRpxrmoZhRbZWN8twGDDX2YmtQZR6sqF/og0fubhZe4Nf8b1nlMQq0z4bUAG?=
 =?us-ascii?Q?ws0sxT0A1685usAN/raMX90pHrb9OMK2Uxwbs3DIKlygHMMSFSQGeAOm6kad?=
 =?us-ascii?Q?Yif2EUWzRCg+e7VwtfJuagx8trCqC1ppabV2ccTu/6BbwaEAEzc7I1pNk+8Q?=
 =?us-ascii?Q?E7iWLONcetbsxjBJFyQgD1e5V3XnHHmTpdKPFQLJLWvTlnIYBUZxwkoodQIT?=
 =?us-ascii?Q?oMAmabf4fqusjg+IU+1wrdZJ+blyJ7ldZzxJ6R9j+LxITeKuWNqSiwnR0WU7?=
 =?us-ascii?Q?MN5Ziw10/Bhe7XM95FV8zlMxxr3ZS53zToTZU4KvySLxeiRWxh6TZgGrSXO3?=
 =?us-ascii?Q?RLYTkjj6jTDLZaJe/7QRRcnojvsJoeBrdx9R++m/UigqDpiBdJHg2+AxTlh0?=
 =?us-ascii?Q?WSDf4Qp9AHW6y8spgyC/2PcHDWAtReV/D00QNuirRSO6H+jMi5Eh5p1wCqLg?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ba7400-c09a-4e9f-9b89-08dd9e04951c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:27:47.6876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/JXnFU+HsiS5I0NACHMQLypbPVqg8Mb2VIR8S9FR3o55NGAB03n11Z33edGnPhavgTCsffSIGKVl6OL/yh6Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
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

On Tue, May 27, 2025 at 10:09:59PM +0530, Himal Prasad Ghimiray wrote:
> Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
> in madvise-advised memory regions
> 
> v2 (Matthew Brost)
> - Add kernel-doc
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e0d75226a724..03adfdc20dde 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1111,6 +1111,10 @@ struct drm_xe_vm_bind_op {
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> +	/** DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC as prefetch_mem_region_instance
> +	 * ensures prefetching in madvise-advised memory region.
> +	 */
> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1

I think the prefered way is to put this 'struct drm_xe_vm_bind_op' based
on existing style.

Matt 

>  	/**
>  	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
>  	 * It is a region instance, not a mask.
> -- 
> 2.34.1
> 
