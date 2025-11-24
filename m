Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403E5CFD34B
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 18:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B291610E184;
	Mon, 24 Nov 2025 18:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KamM5aIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C58910E184
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 18:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764010182; x=1795546182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wO+jIFD+eT2j2gNjjzJPCU5xjKL3XLjjWsQU0VyZ4tY=;
 b=KamM5aIiC/YLNET1kFueXvRKSFSGQyKx7WvVhLiSs3QPK95IAAcgtnrC
 52/QXLW2ljqdRekf3HhBabogXf1x8nQYZ/NSEaSdYlGC2An4wvByqr8YU
 Gq7A0NbsJsvug9b7jYuPgZlUSYJZA1OrpF9boy65Qt52gbR1Z99LfIR1V
 uRs4jWZOUK1Tvg3EYnrf/8pZuhO3uXsg07RMe3j+v/tsthu8mrKXYg1/w
 3pJ7gkpMlo1hojYbapb7tok3bwZT54p89Y9Qz1ApVkKJ/0akEH2nmUsxf
 gEs7OPudvisWHehId7xr21k8n6kyBKKNeFzGRG+ANOIi5Qkhne5U69N6n Q==;
X-CSE-ConnectionGUID: Jo474OajSCeffWLu5YeUWg==
X-CSE-MsgGUID: drCeTD4zR3GXZvRowlCsWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="68608621"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="68608621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:49:42 -0800
X-CSE-ConnectionGUID: rouS0JU3Rt68oNCFqZp2yQ==
X-CSE-MsgGUID: xIMdaqo/R8S3+dpk7zFxyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="193207731"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:49:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 10:49:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 10:49:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 10:49:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMErKJvze37THnDmWhsj1+hohReGYbHXZD6xbdTaUWiMFywWQB7m9U+lesjSUs4rOBH3GHTUHeeRykHBGnBbvJVLLH+8DvzUKzjRYUMy+m9kmQl5gk0Ct4UNc69PRNrPo2NNTDFRmkfIbw61w6lB4o/FH7ERDvEu8Sb1hXiwBbcq9YteKa91mnHrjxewYc81aPoki9FCtq9x12jS6ciJfZxaqixod8NkRFzDYlpPdEyXFOfjknQ6nfiBJTqP2WueboRARS/PvOczjD1VLKFh9fSyQAMZDGX2PfgO5iTccJdrSM9nvA89Wxow4cuXMXOzOkApG0yOLB8YQxzookLX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pIezFk67l2eIw8IiLjfvn72QddgPfv64xhghmh6e5k=;
 b=u7/pmqVLhMTzZwz6zvgXiGMhMxn/1J9d1Ov/ZOollFI7bGBnxvs7LD3XxfHtWh4kuuviBu/LnPKPPqnMw15d6AWYEEmb+fM/7fpknGuh/08Y39ne519pnYxVUTw0611HRkHpVrboqFO/7M0tiOKq2ksI0YOvYIhnUR/xxe9qAdQ2wn0ZubATw4g2x6Ks9gU7Ipf51/KQjjm1v/gEPnyiTtaNGuUcR16Dc2QK90Hh65iTqcawtz3QgEST9kHSbLVzDOSmW3cAzoFpLpCGoQEuS8dmfW3/IiTNGXLj6V5SE9AzA2z/48yTudIft6PQiEVfQwlbZt0hrbv8JYhFMgpOVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 18:49:37 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 18:49:37 +0000
Date: Mon, 24 Nov 2025 10:49:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 10/18] drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for
 Multi Queue batches
Message-ID: <20251124184935.GB4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-30-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-30-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::33) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: e253066c-35bc-44fc-eb2f-08de2b8a37b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q4ITMueUk1ohAmpFbOnr0v0bI6KDvi6bjeIPqIUE5ltlsGOwJzO6/5W14k+1?=
 =?us-ascii?Q?6iQc9qDTNblOpS9ZZy5NmhG4YNWEot5ieFRHrpVPi23I8jaiUTELsCwmuCUn?=
 =?us-ascii?Q?Z5zDmZL84a2mCGm1hhAm1N8pYnH53b842dCQlKz1VGcATE8SclzEb5RSaBKe?=
 =?us-ascii?Q?kE5zkUEo+frqVJN4XHVCi4l/DdCUivsx116IifkJR3tKNc0evxG30LUrDX2D?=
 =?us-ascii?Q?fQkvS0uR0WYflsvi5bc64uOWUNUwLyMSAw43YTuJh0ie5yjLW15G91oy3pRj?=
 =?us-ascii?Q?7GmGvMLuYC1jE/RQ9NUcSTncGx6V7nHgFiFLQQ910W8rpGNoGJjAOlK1NYLr?=
 =?us-ascii?Q?3hSoDIW9uLLpov8o1wTY1qMTHaK658F/zuSDFD68+gIhyW2n6LgpaPfTi4yG?=
 =?us-ascii?Q?q9sPBXMdh8ifCuABb1JGboOc40lUUE29oUauVjjj/gTdCZw5BQq7fekajJ7s?=
 =?us-ascii?Q?o00QlzlbLOgnv1L4rRXaoXjaBS2kaNRTtgvJi/sTaI7zwsJ/EiJr1Ll91UTY?=
 =?us-ascii?Q?MtHEbVoCA7/IzSfYNcBGftyGgRM6/W8XG/Z+KVtpzjVqcsV8BFmXxB6K8T/R?=
 =?us-ascii?Q?cgjG8KbeCENtYmmPiJZv3j4M7WbJBDUjBAiNIr5eIKWv+R9xWBSxLmea7wWc?=
 =?us-ascii?Q?ai8HvXZavDChU8BibJtC1uMpxQs5zcJuf5kMuPAx3UM9vfoeIeM/GeUR8uZw?=
 =?us-ascii?Q?u+Ru5R0IwJijRayKdmepHNP9BjS81FHVws8jjDhSsUsUtgn/qFDnbLBntjVc?=
 =?us-ascii?Q?+xvgbXtAPgLu2Ew3gyYLX8a4MWx6bSiEfv+bUE4MrELg6L6KOpBcG9G9+bFL?=
 =?us-ascii?Q?BpFQwhC5ERIeh/7eIXupNH9ONkIkN1PZGS92zl96fOWQ2pEAoIBYLklNJk3a?=
 =?us-ascii?Q?xVcdUHRu4pcGC4J/tLy74Fph9AM+jzSpI5nijDxsH94aoHnWmriBBeo2bCri?=
 =?us-ascii?Q?MZCetW4Q4RhCHoRN3ncZA5ru0CllWnJzefgnRZitJwh4ehrOWZkyJMg7gW9h?=
 =?us-ascii?Q?j/YBmO1oGzIcNVATvqFHAiZGYJXe8iBHruJOsdMjgSkBWobMoKngV6YrNW8Y?=
 =?us-ascii?Q?8IcT3vfmKJBlPvlx8O1iEvt1y+bXvU0el595z9CeKz0r3HJRTr+N1jdtnt3l?=
 =?us-ascii?Q?bkgTF0VK+98dTlSdTKgxW7TvFhlQ4eTxA8JTVVbsqSKgU2eV9MBpdVgJjoWJ?=
 =?us-ascii?Q?7yltSY856ZoM18v0I2/n6CrvS54bTAe8lEJlB1myqKPgl9V+Ir1aiMZvDkoN?=
 =?us-ascii?Q?71VtTwIOl+cNTrzVxEHWcPHNBDNmGTN1IQKdFRxAW0wLBHrV5YQxDt0aScPl?=
 =?us-ascii?Q?V86MN7hQ587bi4oFpThuqurC1Kf8zzeL/LGv2Oc0c2mkqjVuc9pYuYrPyftb?=
 =?us-ascii?Q?6u2OljqCmbo+ywXlKIfigwkqc+v/jE95lkSJDZRjLOFXR8TfAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MO9VhT2dEoiBgeEpaSfmmRNxGn8aF01bc77kWcxlmOzuKPL0Pp+e3c8Byuws?=
 =?us-ascii?Q?PtbTPP+6o7dB1ZuaRawebHt5zdsyw4chND7sKUWmM6AqaLBJrbTWnfyJYVPx?=
 =?us-ascii?Q?LwUHR8FznYqofISWUsTrNdldLInM0tx4nKhGqjC9MV1vniFjY35/3cD3Due4?=
 =?us-ascii?Q?2nDPPEhJjSVK8yiWgfsd7TA96gBNFglcNfq56QzW83PxWiau0oYpyo2Gf2tu?=
 =?us-ascii?Q?cQF6YmR6SWI4au9bLaGuX8Sc9l3iXkwDnj3EiNMx1xiL5xfdhYYZLQtRPQs7?=
 =?us-ascii?Q?N33Gj+Be/W8IEmfTTjKe7U+qkfHlhr3o86fSLsg/CS7PtD5NgtZR0jjgTXUH?=
 =?us-ascii?Q?dvf2Rlgztgsk8qgY4/gosGFizL+QxniDptKvF5TgMa5eV3NlbGmqQ/Kw4RFZ?=
 =?us-ascii?Q?y2VbRWLDzbIKtp43b8VclgDUqZI+57qshQ0jse+X2NQ2/NbthKE+eXh8xzDH?=
 =?us-ascii?Q?DeJOErPWAUzJZcPo0LwcNRdaF3Svx466vtoNPSuOJDSl79G+qqu+jn6aoPFg?=
 =?us-ascii?Q?V33m/BibIV7ZoNlyzAXwjVi0k4sBbMYCpQMCvnnqUsKimtEhUqS6ZcMmxwKj?=
 =?us-ascii?Q?glTlMLSc1c54il+o8soPzwOxodZl6ctUMyWLtEVa3/9ojlyr+mt65uGwOSs9?=
 =?us-ascii?Q?LqXp+tUNEGIdbgQlJoTL5NoyKcPERbzRXvV1ygWTYOr8ECn8o4Dhxqo4dBLy?=
 =?us-ascii?Q?09c4/3s9a5RGnoqwRG0mh44Fc7iC1EGVveaS5wfLsoq5WrKjNdxOr6NpXOm+?=
 =?us-ascii?Q?OhO0pThfJNMfVDX3Ku3jruaWg1YuGpd/COLfflZjSvbomDqHqqz8omiTzFAX?=
 =?us-ascii?Q?7GDvm5YvuyZrpBYcm1zVAf9SCArSuGIHz4brlB4CrzQfmx7iQYgFafG57IgZ?=
 =?us-ascii?Q?Jqr7ll5B5I9zLAW8MEGw6FgNVMgrb654wFwKCWAvH+iLxDiqIPj3KOLj9pa6?=
 =?us-ascii?Q?eGPC8QxU0kpUUypIRi6zp70AxCLfGlNgu63FKHYIrT2qhRLY6oCIjHHguQm7?=
 =?us-ascii?Q?buTjJYozd4ODQ18SKrLx2+xejqnEttBuTkQFu2bY6TJMa7avVpIhfLZHE/7d?=
 =?us-ascii?Q?MVL64dgrz4eEsKjToXLApuBZ0qnBTQ5P0C1rsax9Qlszvo1XBm1W+Jn+mmis?=
 =?us-ascii?Q?cIfS+1s1I/fa1ZBAOvwgLkDWMMgtzdlKffEtpNFIgSNTu4bIlsA8Mn7KrjX9?=
 =?us-ascii?Q?WGB547reG3tUOMHr1akEaE25KJKIJ2N75fo/N8xNFTbEtWlML7V5qw3q/vVj?=
 =?us-ascii?Q?kfKeeTSvckzMlguiolnekUJxBrJTOT7StRDf4z+XqJrZHBbPSYO953oSc00i?=
 =?us-ascii?Q?AHAkaKi4V6Yl3b6MMEbalrXdREk2u5e+amhffb5LUJW4IL309zgzCyQK3ZyV?=
 =?us-ascii?Q?3YNVJ+mGSvY8ZVFyRzmIqBBMFolyB/jhMaDOr5kySROm0nwDL8dZtMYAzHJZ?=
 =?us-ascii?Q?XsWpAvCCZWt7+fCocq33DCTt/e2RXjV4uHT5hwkfFnxYi2KOrNgMPducAAXt?=
 =?us-ascii?Q?nI3l6jDb7yAIOiB0VLYrmTC8RWtNSu8pk1SO/5iQ5amvk3ek6paJwiHgT+OQ?=
 =?us-ascii?Q?jf1+5Qc3PEwGrzhixanu8UfgML9GvfSkCHfdQIAMQtXEjGO2p7pdZ4NhtOwa?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e253066c-35bc-44fc-eb2f-08de2b8a37b0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 18:49:37.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwqKsoKD5ZJtNMKQjQGlBnBefW1nrXIUlSKa8MVzlSdmViX+BJCxdOMeGX6oflSzi8udSya4Bu1I1RwZGWn8NTQvaRFsPDdyBPcpOUWG7tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
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

On Thu, Nov 20, 2025 at 07:51:44PM -0800, Niranjana Vishwanathapura wrote:
> To properly support soft light restore between batches
> being arbitrated at the CFEG, PIPE_CONTROL instructions
> have a new bit in the first DW, QUEUE_DRAIN_MODE. When
> set, this indicates to the CFEG that it should only
> drain the current queue.
> 
> Additionally we no longer want to set the CS_STALL bit
> for these multi queue queues as this causes the entire
> pipeline to stall waiting for completion of the prior
> batch, preventing this soft light restore from occurring
> between queues in a queue group.
> 
> Bspec: 56551
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 68 ++++++++++++-------
>  2 files changed, 45 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 5d41ca297447..885fcf211e6d 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -47,6 +47,7 @@
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  
> +#define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ac0c6dcffe15..71f0e19fe8ba 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -12,7 +12,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> -#include "xe_exec_queue_types.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -135,12 +135,11 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>  	return i;
>  }
>  
> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> -				int i)
> +static int emit_pipe_invalidate(struct xe_exec_queue *q, u32 mask_flags,
> +				bool invalidate_tlb, u32 *dw, int i)
>  {
>  	u32 flags0 = 0;
> -	u32 flags1 = PIPE_CONTROL_CS_STALL |
> -		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> +	u32 flags1 = PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>  		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
>  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
> @@ -152,6 +151,11 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  	if (invalidate_tlb)
>  		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
>  
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
> +
>  	flags1 &= ~mask_flags;
>  
>  	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
> @@ -175,54 +179,70 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  
>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  {
> -	struct xe_gt *gt = job->q->gt;
> +	struct xe_exec_queue *q = job->q;
> +	struct xe_gt *gt = q->gt;
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> -	u32 flags;
> +	u32 flags0, flags1;
>  
>  	if (XE_GT_WA(gt, 14016712196))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  
> -	flags = (PIPE_CONTROL_CS_STALL |
> -		 PIPE_CONTROL_TILE_CACHE_FLUSH |
> +	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>  		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>  		 PIPE_CONTROL_FLUSH_ENABLE);
>  
>  	if (XE_GT_WA(gt, 1409600907))
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> +		flags1 |= PIPE_CONTROL_DEPTH_STALL;
>  
>  	if (lacks_render)
> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		flags1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +		flags1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
>  
> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> +	return emit_pipe_control(dw, i, flags0, flags1, 0, 0);
>  }
>  
> -static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> +static int emit_pipe_control_to_ring_end(struct xe_exec_queue *q, u32 *dw, int i)
>  {
> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_LRI_POST_SYNC;
> +	struct xe_hw_engine *hwe = q->hwe;
> +
>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return i;
>  
> +	if (xe_exec_queue_is_multi_queue(q))

We probably don't need to worry about converting in this function since
it's only used by an Xe2 workaround and will be removed completely once
https://patchwork.freedesktop.org/patch/689424/?series=157804&rev=2
lands.  If you want to be safe, you could just make it an assertion for
!multi_queue since that should never be possible on Xe2.

Anyway, the changes look good overall so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +
>  	if (XE_GT_WA(hwe->gt, 16020292621))
> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
> +		i = emit_pipe_control(dw, i, flags0, flags1,
>  				      RING_NOPID(hwe->mmio_base).addr, 0);
>  
>  	return i;
>  }
>  
> -static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
> -			      int i)
> +static int emit_pipe_imm_ggtt(struct xe_exec_queue *q, u32 addr, u32 value,
> +			      bool stall_only, u32 *dw, int i)
>  {
> -	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
> -		    PIPE_CONTROL_QW_WRITE;
> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
>  
>  	if (!stall_only)
> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> +		flags1 |= PIPE_CONTROL_FLUSH_ENABLE;
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
>  
> -	return emit_pipe_control(dw, i, 0, flags, addr, value);
> +	return emit_pipe_control(dw, i, flags0, flags1, addr, value);
>  }
>  
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
> @@ -371,7 +391,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
> +	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> @@ -391,11 +411,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
> +	i = emit_pipe_imm_ggtt(job->q, xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
> +	i = emit_pipe_control_to_ring_end(job->q, dw, i);
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
