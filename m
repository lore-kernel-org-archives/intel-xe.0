Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE79EC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 17:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E26410E2B0;
	Thu, 23 Jan 2025 17:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+zITGIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E832D10E2B0
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737653987; x=1769189987;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t5f2WxBqDgDNIZz/jdX7SZGWmU+ZW6MHAK9nVMzv138=;
 b=I+zITGIc69pD0rNYGg6ssB+UbNUdNX0WzWaTolEtYf1AAHRfsJdjTwzY
 jRjRAVqH4QCdMq+wZrz6KVQLpM2ei4UPSEzd5NnGcoJPRdVff7eMqvq9g
 0Obq8XGs/CvGT51lVVMG+hVGkWLQhVqhLSNtHRSLAELEQpy0VncMrANu9
 EGMmU8mBOh8H6SI59ODEGY4AcyAevCb65w9LTaQjMmX/ituJmX+d6EVif
 KFIlEO+O3QrhAQ9QD5uH43C+BezKaD9LYz+lO8MTUgyvSAWcfLUF89CWr
 Kald1/+GbPbSfL2j0W4jD/5c8wZUGY323JA75npwl03as0w00S0Sb3zXa w==;
X-CSE-ConnectionGUID: I4zdadj2RlucwPB3wt/O5w==
X-CSE-MsgGUID: bmKO7Fe9TA6+L6Ik7+Zpfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38421509"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38421509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:39:46 -0800
X-CSE-ConnectionGUID: O9NVsV8MSKa90quLhcLdHg==
X-CSE-MsgGUID: Ebj8aflGRFuhT/VxiiZSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="108131308"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 09:39:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 09:39:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 09:39:46 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 09:39:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkWY8EMviXZ5oLurBW7D/Bm851TQ1lx2+QembfoMtlI+uOnUHMsUn4PAZJSH2qEygr/N1otKyFXZLnipmglxFVi9zhC6KeeUuHmAVrcKsMyNxDRWgCZbMXWBKgIN/iusRD9XsLvy5d0dUwe5OyM/yP4UKMTJQhFSjtyd+Nb8oN6UqYu4K7hXV/bVdPw/mbukox8kicpV5tuq57RIiOGK2MXMjc/BhVbIMpoTOXMdUDZxwcqOKEfLiF46H3gLGP/kgY+TRbhPM2MLSxRBtStB6ejAD0jVjcxtIUfcEDAzjVlLL10I7iu0VQ5t7f0p+OcfLW3qGxpcDzfs+6gFp32VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dDLtiFj5wsBcxlqpuRwVDz6G7k/Y01Cjyd30mTpvUI=;
 b=au8dnJBu6kXxsbBrD1CY6N5yM6fq3r1JQ4lfQdt+KRhZTD3I1MGuOloWbznWrPtTpTBYBNuSi8ZTISr8RWRONIum20a/fxAI0uL5t89CFp1+pkLTSWIY5G0O9NqAxiwCn19sKBCJ500wjCmb95ZuKg5BDl0JFd2D1bIdAAUnQ9pGX3xCpC+7uK+R+6C4ab4e8f+FkL4TEn92/dv6CNWk+sTBvejYoMht+yKf6cgT4DPgQyhie/OW2FyXQxoC5WsZAvnM+Ixoyzo6alGj9xfbydt9O6d3SlmB83+SvgDSctIv+WexoSuF/OuZKWUW/naiu4xZlsEuH8RloHm7rToHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 17:39:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 17:39:43 +0000
Date: Thu, 23 Jan 2025 09:40:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <jose.souza@intel.com>, <lionel.g.landwerlin@intel.com>,
 <carlos.santa@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 6/6] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Message-ID: <Z5J/FJU4m1fTe4UB@lstrano-desk.jf.intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
 <20250123011513.362430-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123011513.362430-7-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da812a8-6b06-4b18-8457-08dd3bd4eb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0sxkGHKI4ap+jDyO3t8371+xxU5xm9v+I1ucj3pkoMeDvWtVK5AraCrx/5?=
 =?iso-8859-1?Q?8RUGAM39zd9IDFl9WHjI6rs46nKSDCBHxu14lmaqte453Il4duQHdurG1W?=
 =?iso-8859-1?Q?TmNC7MIsEgiFl4Y4ErJn65Xan06Zvi5UtNz1Omm3NQR85mNIQc8AXa+BTJ?=
 =?iso-8859-1?Q?fVDLS+oi1nFpGdKhzDSlq3hqRx+T/61v06mZmRYO8RtnBNxebTS+OOAx3C?=
 =?iso-8859-1?Q?NmdDqI0zoZ8Qid9b2YPtsV+oSDKmGda9IT/BSCt1TYCym/A6XZ4hS4jTPA?=
 =?iso-8859-1?Q?ECuKtQggCl+YBa/gNiYwJSN1U/yKAOkdM8sZ+f8xnZwyd7hWDbDp+o4hK5?=
 =?iso-8859-1?Q?tJBFUpe7voxctc65+5+pnwamI9mzDX7nIcFqd7OZ4TWGeb/AUe59RJ/Gqt?=
 =?iso-8859-1?Q?/+23d/IABmqeMgxTpJ52GZdkUqJ+IpPOswypY16S0pq1QRtoYZwiwSlM1F?=
 =?iso-8859-1?Q?RLeNiuG+mp3GkIWg5sd5aiK4SDneyyTfCFM+bgRlqvLM5ZKEP2hYHwGD1J?=
 =?iso-8859-1?Q?uvIdbZ7QH1X4kWfz1hdVhzwkEXyKS/d0EM0SbGYjofGQcdg3GTXHN2sjMU?=
 =?iso-8859-1?Q?wP0J/dUvlSA+5gIzujbi3D5qmMKjNgnsikq6lXizo3I/nIExbnk4UGyf3A?=
 =?iso-8859-1?Q?wOjtd56zG6wo1PI2feUrZMUGF2OwJ/cVvGE4GdCgZsOgpglS4cHGNJuFg1?=
 =?iso-8859-1?Q?mmrHtq1LlDAs8Ez4pzr2OGrqgwMypqd0SW3KoT6m1CK0GlEkl11oRd6DcR?=
 =?iso-8859-1?Q?XcBdkEjJvweUj0lqqSS603lFRafq0gkxrK4DxagUsXcWx5e12h4dIipbw+?=
 =?iso-8859-1?Q?s+W0TUfki4ve9nEWGDLHtkWREIJwI/B0kBZ8BAl7MWTF4tNdY+4GSarZxg?=
 =?iso-8859-1?Q?g1gB1sZstAHVfVV+YuX6EdD2JTzd12zc1t95LO6v5o3xaYbqB9893N/7up?=
 =?iso-8859-1?Q?C6LzE8Z7/l7FQIeMjjjWWZZfmy6zAwUI2YZ1Yt4cWSfanUaQOh8kcSYSUW?=
 =?iso-8859-1?Q?tRwkU4TJzSIxy1R33f2ANZDLJ+L+e1Z6UeoV6cN+r3jY7KuiYrN97oHHwf?=
 =?iso-8859-1?Q?WLD/HHD+JvwKBhxcFN7+k8PCNBo/goXa+gGs0WvXCIjf69frIXkGJlMoI8?=
 =?iso-8859-1?Q?XfWTSGmR6roa0m6vkio1PdcN7vdzYJgu5up4KmG8qS58NCoyA0R0TeEDVW?=
 =?iso-8859-1?Q?dlwHt/SGNSFSZcVwBIJzm6sLTJQNPSozjsCljbK5g6GDL7GU43Q0GquUqM?=
 =?iso-8859-1?Q?9dETqxs8wR9d6wdKU6vVPgCWp0Wnn+eJYXrJ7RPSWJkSgK+W3GPL7zA/ts?=
 =?iso-8859-1?Q?A7s0MIfoFoqalRSENOVqNplS5AmdfQLuz3wZ+tYxACKSZMuX56SyeUFUWo?=
 =?iso-8859-1?Q?gFyHywmbeRgmkN5/i0GJ5u9hKS18Y/xhMvT6WpJ/XZjNpZ2nFtStOWZbLa?=
 =?iso-8859-1?Q?aI1gZVgC2TbEDFnF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7X0QVidB5hnMU0tqjESh0LfMzlO5NhzkK1WxoMm7AHqEzwy4lnGXt8Qhvh?=
 =?iso-8859-1?Q?w4a/J/iIMAcW8jn6Ze4UNHrVB/Y1/mjtnfltmBhs2v0SxcRFuSwzBRNH4m?=
 =?iso-8859-1?Q?72FiHEePTBvdzeJ7evsyGPwaoCj0nm/FMBs/QrJoTkg5+QwO3Ml7mjqDVd?=
 =?iso-8859-1?Q?/EhjPB1NgtJsHcXB50s8rjZL7OJd9ONNe47VB7oQzLjw7aFTBPOmwqa1IE?=
 =?iso-8859-1?Q?z5LpLiHETOqimaadk3oLhT4yzcwxpPrhz2aRZ6B8HM7C8f6t/5pqAi5FBq?=
 =?iso-8859-1?Q?R+aqhaWeSu5i+BwxwLlwbl6Vkah76AZPTALTcB7L+a8Ndx3i4PuG11goeb?=
 =?iso-8859-1?Q?Qqaxgq68Nf2SSg/esl7kJd4tk+MMhh3mipMCPpppDX00opfamHwasuGde+?=
 =?iso-8859-1?Q?lVnRnqHFKfPkcmLW5jOVDEwSVWAl5fp0A2c27SqMC444iz50PTaNCY8Z9U?=
 =?iso-8859-1?Q?1p/v5ZJkvZU7v/KO+430CVkQe9YN1bUmfabGGBdRoAXOTboixLqbpKld9R?=
 =?iso-8859-1?Q?7ob8T04VjP8K5b1mpx5Ve83bnsVdf415+4/IAWwTcEjJj/G99vD6omVCHP?=
 =?iso-8859-1?Q?We1X5jUjEWZl1L44zVxekyIW2l+NUTOfPL3NYcgaE8wHbQ8IMRYjKcZ30l?=
 =?iso-8859-1?Q?XdX6BMDwHM9chgG4GFeBAmoFFYu7kVFJGDIlH+ftQjzql9dTjSq40ckn36?=
 =?iso-8859-1?Q?V9ZeVFTfZ8vrCm2cwpBR4Uhsaj9NT/xdRjY0Bp9gEsGgozQhYyT4hjzgH2?=
 =?iso-8859-1?Q?Qrhd8hv6oASXD9MtDNYqy0HRWmEws1/hcODps78ClzCNuWueS4vFAfrEQP?=
 =?iso-8859-1?Q?kxAmYuqYT1g1f6Fmnm0a+QNAt5HSgomWLaDGD9W68J+7hqF3kS0KaEt+XB?=
 =?iso-8859-1?Q?FotbvKQB7k4J+JE0+H50L9Y081JLF3zGYxda1sYCgelnY7K+lhr8fK5MrR?=
 =?iso-8859-1?Q?zB+Wc4LmPYnYCNlJk8LenXxDsHFYp/trzw2y53e133rzIaubHCZ9wQxaIo?=
 =?iso-8859-1?Q?kNkxtGf3IqTyj1wLMSRBVj/byFFTuc1hDNyhdXFJjIN+GeARuOnuWO6sz8?=
 =?iso-8859-1?Q?JdZObZ7ZOQQUr9e3dpD8cu8Dkafi/ai62qGcXccuw1daQFY56zZq3pPAbE?=
 =?iso-8859-1?Q?gzMQUcRmCgok14ObsKzXh0228ebgKtg82DMrCj1WFRLcYey6kqmyxLrD0W?=
 =?iso-8859-1?Q?gAovGyL5A96Rc/OWEzpgm/9AbAqeO38cpMgUNBlfsx3towFghtXwZ91KDt?=
 =?iso-8859-1?Q?sQkdaJY9y3XsN31AuKlUDqinwM0O3x2dxVGxyYyuu/dtiNSTFpbk0E+iMr?=
 =?iso-8859-1?Q?RFM9HJKd9prWYBzprsABmElf2F+7+HLvwCrtuAQGIi52NGINOPstYB3KHU?=
 =?iso-8859-1?Q?6G6kpb2TyJDO9qqDhI7Q0yf3spPyboUj5wfI74PabCWjI8e6LtSw9U5uem?=
 =?iso-8859-1?Q?KIF4BPzAPvJbjlXx0u9cZhz3eDgirZsl4brzoYpWIISHYv0GnxpzeS2Dta?=
 =?iso-8859-1?Q?egWHgglARPSXtKgmN31XLdAXYbHzDtkCO26IDWwGPOSARR5oBCZV37Zw2p?=
 =?iso-8859-1?Q?W/CrCE7p0X7pN8qaWzga3lv0ngJoqBl9jvVWnOjdJ5n/1qH8T8x78QzqH1?=
 =?iso-8859-1?Q?J/PJ5xixaYzXMkDRGGjU3FTjzu5fs1MZKdoxil59jNEkNMpH1gak5yNg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da812a8-6b06-4b18-8457-08dd3bd4eb93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:39:42.9435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLFZEyVk3RBOUBll6sM6rSXw69DuJzGPoSF5UMnQEsn6uXngHmo0fFOiv4hxn48CyhB1LwJJyCbO41dOx1vzcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
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

On Wed, Jan 22, 2025 at 05:15:13PM -0800, Matthew Brost wrote:
> Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
> queue default state to user data passed in. The intent is for a Mesa
> tool to use this replay GPU hangs.
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Ugh, missed a check exec_queue_user_ext_set_property which will reject
this new property. One line change so will not resend series but Mesa
should ping me for the fix before trying to implement to tool.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 29 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 38 ++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
>  5 files changed, 63 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7e1abbbfba12..46fd9b2c87bd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -44,6 +44,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  	if (q->xef)
>  		xe_file_put(q->xef);
>  
> +	kvfree(q->replay_state);
>  	kfree(q);
>  }
>  
> @@ -120,7 +121,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  	}
>  
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +					  SZ_16K, q->msix_vec);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> @@ -405,6 +407,30 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	return 0;
>  }
>  
> +static int exec_queue_set_hang_replay_state(struct xe_device *xe,
> +					    struct xe_exec_queue *q,
> +					    u64 value)
> +{
> +	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
> +	u64 __user *address = u64_to_user_ptr(value);
> +	void *ptr;
> +	int err;
> +
> +	ptr = kvmalloc(size, GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err = __copy_from_user(ptr, address, size);
> +	if (XE_IOCTL_DBG(xe, err)) {
> +		kvfree(ptr);
> +		return -EFAULT;
> +	}
> +
> +	q->replay_state = ptr;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -412,6 +438,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
> +	[DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE] = exec_queue_set_hang_replay_state,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5af5419cec7a..3c81dcd22ce3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -130,6 +130,9 @@ struct xe_exec_queue {
>  		struct list_head link;
>  	} lr;
>  
> +	/** @replay_state: GPU hang replay state */
> +	void *replay_state;
> +
>  	/** @ops: submission backend exec queue operations */
>  	const struct xe_exec_queue_ops *ops;
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 5ef96deaa881..468d9b2d4404 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>  
>  	port->hwe = hwe;
>  
> -	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
> +	port->lrc = xe_lrc_create(hwe, NULL, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
>  	if (IS_ERR(port->lrc)) {
>  		err = PTR_ERR(port->lrc);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 1ad3ab59fce2..96f76b6b0aa4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -45,7 +45,16 @@ lrc_to_xe(struct xe_lrc *lrc)
>  	return gt_to_xe(lrc->fence_ctx.gt);
>  }
>  
> -size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> +/**
> + * xe_gt_lrc_hang_replay_size() - Hang replay size
> + * @gt: The GT
> + * @class: Hardware engine class
> + *
> + * Determine size of GPU hang replay state for a GT and hardware engine class.
> + *
> + * Return: Size of GPU hang replay size
> + */
> +size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t size;
> @@ -74,6 +83,13 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  		size = 2 * SZ_4K;
>  	}
>  
> +	return size;
> +}
> +
> +size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> +{
> +	size_t size = xe_gt_lrc_hang_replay_size(gt, class);
> +
>  	/* Add indirect ring state page */
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		size += LRC_INDIRECT_RING_STATE_SIZE;
> @@ -883,7 +899,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size, u16 msix_vec)
> +		       struct xe_vm *vm, void *replay_state, u32 ring_size,
> +		       u16 msix_vec)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -896,9 +913,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  	kref_init(&lrc->refcount);
>  	lrc->flags = 0;
> -	lrc->replay_size = xe_gt_lrc_size(gt, hwe->class);
> -	if (xe_gt_has_indirect_ring_state(gt))
> -		lrc->replay_size -= LRC_INDIRECT_RING_STATE_SIZE;
> +	lrc->replay_size = xe_gt_lrc_hang_replay_size(gt, hwe->class);
>  	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
>  	if (xe_gt_has_indirect_ring_state(gt))
>  		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
> @@ -924,7 +939,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
>  
> -	if (!gt->default_lrc[hwe->class]) {
> +	if (!gt->default_lrc[hwe->class] && !replay_state) {
>  		init_data = empty_lrc_data(hwe);
>  		if (!init_data) {
>  			err = -ENOMEM;
> @@ -937,7 +952,11 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	 * values
>  	 */
>  	map = __xe_lrc_pphwsp_map(lrc);
> -	if (!init_data) {
> +	if (replay_state) {
> +		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
> +		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE, replay_state,
> +				 xe_gt_lrc_hang_replay_size(gt, hwe->class));
> +	} else if (!init_data) {
>  		xe_map_memset(xe, &map, 0, 0, LRC_PPHWSP_SIZE);	/* PPHWSP */
>  		xe_map_memcpy_to(xe, &map, LRC_PPHWSP_SIZE,
>  				 gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE,
> @@ -1022,6 +1041,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * xe_lrc_create - Create a LRC
>   * @hwe: Hardware Engine
>   * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
>   * @ring_size: LRC ring size
>   * @msix_vec: MSI-X interrupt vector (for platforms that support it)
>   *
> @@ -1031,7 +1051,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size, u16 msix_vec)
> +			     void *replay_state, u32 ring_size, u16 msix_vec)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1040,7 +1060,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
>  
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec);
> +	err = xe_lrc_init(lrc, hwe, vm, replay_state, ring_size, msix_vec);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 848d64511ca8..9f90911df0c2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -43,7 +43,7 @@ struct xe_lrc_snapshot {
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size, u16 msix_vec);
> +			     void *replay_state, u32 ring_size, u16 msix_vec);
>  void xe_lrc_destroy(struct kref *ref);
>  
>  /**
> @@ -70,6 +70,7 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>  	kref_put(&lrc->refcount, xe_lrc_destroy);
>  }
>  
> +size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
>  size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
> -- 
> 2.34.1
> 
