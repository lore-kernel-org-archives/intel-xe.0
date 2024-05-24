Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B06C25B79
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 21:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17F910E0CE;
	Fri, 24 May 2024 21:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAcVE3ai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1094310E0CE
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716585353; x=1748121353;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yz1XoxWisrYdhXmd/1ai0O1erwA0xBaBo0fKiQwKaPQ=;
 b=kAcVE3aiFmOChtVmbs0uXk/K7MWBYR16h/b/rpqH4youiiHzIaBZaQhY
 eSlypQhgZkY/UYDqrJGWfNqmj/T1r32K7bIxHM+dEIYkK4EuQgLO9wb9l
 ITuxI9XA5gQaJoV8Uq8n84Z5VabCKXautefb+3L/ol1fMQTiojQxQpWYZ
 rc+xjNX5LkLLnxEKitRbkEx9I6l1W/BtxsaeiFDgVbUKdny3fyNEeaU0c
 g/DqQKCY2naSIslgSd+8DeFmep+f98m6HNzOChC8wALpOJFnngmi3CbCW
 qdwCywiL37Fic8pexs0G+a8RreDGbdxmEdxnrkrz7/m6wwnyoVulqdsJC w==;
X-CSE-ConnectionGUID: 28aA4aAWTaiKUprgWqoCkQ==
X-CSE-MsgGUID: 1c8qXl9nRP2PGR6aI8GuOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24386876"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="24386876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 14:15:52 -0700
X-CSE-ConnectionGUID: L05OIcjmQY6fAL5x9/YAjg==
X-CSE-MsgGUID: 1sj+4cl/QPe2JapFAqtnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34150966"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 14:15:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 14:15:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 14:15:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 14:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPApToJ9FQPK9un76cIHbA1+DHwfE+1w385uZijbJ+SDRfkzy0MZRaNOY/gPJemUCH9xCsm0N/4pLUJaYazkiNhg6U28whbHkP8mYRd5ntVOcH55apJHmDh83dKm2gRIoKkpqXb0YPLpo9UvJMdH3QKMZLTLtfF+vKDk2udyXQaSfLF2RqffocKtpeSsawsVYc7kfhsQpTnkcsSt6k5QCqut0lWJwJzFgpgNnynfhsqr6XGh5phVwxuY0ALqo0DOuRzfctFKp0IN8jbppW5y/KOHzv5DyeTXPHBTWyIcuPo37/wZDD9PQV3D8XgpBLbS1noXwcnuo5sjeud/zbHFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eneWlZrN9Agt7W1R1SpCgvLNr6li93xBEl9kQPXc9pg=;
 b=Q8gMDmmKnnHyBsC86lLIDJrM+d5yp/T6WVdB4sPs6XxEwohL8b1BVDQYceAr1/8Fudl3eE/Xp8HQHlYoZ8lfmEWtl8sOGOzEmoiPyDJuce5lbimYWHvEhTYt/FTFJxhp0HEOJGXpEMHxJzlwQa2F1569vcSiMuzyN+kL3VZ0gBhqPUQuWVDVJTOz69eaYm67Sxeb50RQgUcz/6lGdbmcwtAA0ymbA7pYQPci6UgVIA0QHJorsULMaTUuPaULEflD7K5P8S+MsY1Ug00Rrd50yNT1zJdDvMYDUxLjvu9JISXsw9ELEU/qNxSZUJRFQutA6xYTq4t8eKHSx+F2Amb1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 21:15:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 21:15:48 +0000
Date: Fri, 24 May 2024 17:15:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jani.saarinen@intel.com>,
 <matthew.auld@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Use run_ticks instead of runtime for client
 stats
Message-ID: <ZlEDgDx3fDtiQSEo@intel.com>
References: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240524210949.1345804-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: ae95c785-5235-4464-3dcc-08dc7c36aea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CGOw9PSCciI68iOnsI0JmNo3OW4jggtH5LzpPs7dH5RYcQyDm6ji1Oon+WZM?=
 =?us-ascii?Q?/9HWxsDxt/VG9+p37+8PxmozIOzQL45xI7AMuzkyGrep4jo3CHEVA4Ynbk4Y?=
 =?us-ascii?Q?P8X1DkGjHdIjwTU8JuJDUWh4jygONnPadJ2Xh8YImgCrM8Bz4Dq56Pq+a2rc?=
 =?us-ascii?Q?5oZm8m/lmh1JkWI5DirHu6hXFPGg85/BTzCfGlc4pGRnzJnivqbx1fYFcJcS?=
 =?us-ascii?Q?Luh7fcr3m4yIZ3jHzR2sTKIxNbS57V4up3qWc+pVWpieImpKJ6c1Q89uBb9+?=
 =?us-ascii?Q?WLdnW+R0x+W1rE52kN0ZmiJdhIL1RgLGIIIbXTaIos4lcmyAp5ZvNF02ox3V?=
 =?us-ascii?Q?nzn6EPoFP2+83cQf+eHH19/GP34N7E3PVz8BdqvSUAqD3rZal4Jm2UR2AeaW?=
 =?us-ascii?Q?iml2nyVGkDuep/k68yOr9uvGLF8adk4i+N3nUeXZrUeD1aRYXre8nj4/aWg8?=
 =?us-ascii?Q?ZgnDlYoldHbOPo4/FN7y+YD7kfrjT1qQa4H0OoC6r9GJPwuMPMma3gr8mMw+?=
 =?us-ascii?Q?DTXs0Pgfq0diQkDNry1TH1YL4QNZp+tICy8PuxVAycGEf6adJPCDEkcNiDEk?=
 =?us-ascii?Q?ixlNa/VUmorK4QELAQtnc4PaFxGvpfSwQoRsTJd2KIGCd6Vc/+ryBNuGN06b?=
 =?us-ascii?Q?OhpXfyLuYvMkr2fzk1BtzfbQRIl//x6zz0msDywqekjHlf7EtvVTNgb9RVo/?=
 =?us-ascii?Q?6zQSDeIvsl3dr4PSK6LLQkz39XvsHrwsl5HzN6dj+1t9cX3BiOZILShYLMCV?=
 =?us-ascii?Q?vOe5q1V3Y2t/93i/ixWZ5DEnj5FYk1EhZggfu41pa9LC8M/O3ax3r3UnUxJn?=
 =?us-ascii?Q?dGg8bMIUlzUfJXlZ7KIpuVAIz2JCcMw0005pN1whae3zoaP3qOPQNUEqdmKc?=
 =?us-ascii?Q?z8JBaNZAPCBJ0+HxCG5x2i29m7loR0xB9oo8sYNpaKbodTPXL5F784oZQ4uE?=
 =?us-ascii?Q?pk4u02w86FqeRkRc7Ohhj8YLU29Lx0QoJis7aJSYDRmK70EDRGaOnL7jBf3w?=
 =?us-ascii?Q?cLCojHaYZtWZ7XDX93oJOpzLxiezF9lQnWH1ahf7QqV59F2pSPGuuJ4R4vfS?=
 =?us-ascii?Q?q9GDT+THiHxzFHCn8wmD/mb2Oi6IHgvuaGODlUxoUWdWzQPD0rJDxOKrV/qV?=
 =?us-ascii?Q?bbOLDi5Ym9SSSDNX4ltxGVcQEklhj+l2WZzVBufX4O9Q0290qd1CH9TiomI8?=
 =?us-ascii?Q?FgRpPWPmyRd8iZBoyDWTtdPFIVbL7kxSdlvcQmwRiucjPNT9d31tFMgYv5pa?=
 =?us-ascii?Q?ExcZNVtf8E+21kvZvVL0kDYjaBitWNjo8TquFz5S+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CeD0wqz8Q9qFweK4LHzj40j4qsNXAjgORpr+sLYYy/1qDFPZo36QkKPBMVlr?=
 =?us-ascii?Q?c3fHzq2QZ3xsETzr2K4t62mMOYiSaUQe9OsdM3hLW7gLlaQCIjBaL/SeXHuF?=
 =?us-ascii?Q?EdL2/mvtWyYcm9v8VSy/ZPf1ekbP/DA893/rQz/8o9338mwClHAqQTBdUvxM?=
 =?us-ascii?Q?EmXN9boaQCKy+gcPi9ekdurHXoLHBD8xUkICYWAj7IwSuYlCDMRlDLHecqkw?=
 =?us-ascii?Q?nrL0IKWvnVGNHv9WC2Bp7ydzRZ7TplVXgqbNsMGgeNqA9n5o4jBjXUkEGNq2?=
 =?us-ascii?Q?J6iinuZGxgNceyrRgEZ/ytFVg4chvJOs8FiCJFcGZV1TiRLu7ynXYlS67fLr?=
 =?us-ascii?Q?dtB7TB+Lyoc+TJBApSLl/OSitesZwP1M9ETHiQwyOQtDKjrVvB+rxyO+o0ss?=
 =?us-ascii?Q?tp8qpvCjkdpfstz6jpuJ025tsEP42ljEg4MU9Jvsn1A24Mb1jXSMdFPmY50J?=
 =?us-ascii?Q?JtowSeXFu77bW87Wgo2LOEScCsmBykCTvcHFrOwwf+VaeeDQWRqFc5tUSBH4?=
 =?us-ascii?Q?SXg9+4GG8YtJ30qtMdaIV2DLpkgBRTyY47+f2+RF+8d8OrbLwPBllrrDSpJi?=
 =?us-ascii?Q?unR9wvZnm4oFBrXo8/u3JBEAj3kPs8axn0HyxtyrqUGvTaMm8QZhNNm0kxMY?=
 =?us-ascii?Q?mIGeXwclZ4exK+5XcFlV97wSFc+ubrBRkDQIsz2t8ijmlAI7LIvcDoBo6Tbn?=
 =?us-ascii?Q?m98JFcqwTkNTwFL64P7dsPCS1H9VPtfEvK425UDDz2bGSkQcQYe3t5Sm8PM3?=
 =?us-ascii?Q?mmU6BJD4AMJrseTStQAcgob9T30i38nBaZ4Eu8CexQ/finwvWZjJYkGnffRp?=
 =?us-ascii?Q?A4GTGA32VaXh/nz6MVniE+U/QEIGNDaSBO0aYrBQmXiacQ04GKhJBcquQqiP?=
 =?us-ascii?Q?ReRp9/eDtPd98lvr/sOKDeYffMG9qkGXsdWjT6D+nDMcb+ezAzApjAwj5Jm6?=
 =?us-ascii?Q?DllLqNdXAqFHrKTbFxm3eOwAy3cYOBhaOJrTkuutYvOMUExMCXeJt10e8mvz?=
 =?us-ascii?Q?Is1zkcH5Zy4UIvtBfuCvLaqiKxDru3kY9eUuEvxIBbYGFlrfh6/zWy4Ri1qJ?=
 =?us-ascii?Q?tFLAP+Fnzsm1l40e6UJmvGmHrLEKUbJ0EUjnEEFMnmQRyu5nBMmRvuVktoAX?=
 =?us-ascii?Q?QcDNeB4DTqd9xXM7QwR218Bd2lWI9QTGfoWOCLR1XpN2l9LeqmKtCxTkfEX0?=
 =?us-ascii?Q?QRdrdgfXTXXobud4FnroknKGx648gp7QtNAG8zhnvC2zN+vr61IJQZIKhJM3?=
 =?us-ascii?Q?xmMDT2sJXBVPpglqOUz96Kmu73KWzHyrjSPN0ziuSwyMzEbz8v1G6GHZwtAr?=
 =?us-ascii?Q?D1qsFnYu62jRQ1Gf1gGLU5u7OaVBpHlqKc+k5B0uOS7Z2unzWOJrDSliqfsv?=
 =?us-ascii?Q?k5k07HQ+KKn7v3/sn5WBpUO8bkrC0ISNsSl2Z57l2PM7Od4aZTtfRRjyF8Sp?=
 =?us-ascii?Q?vmOn0UQcrc99DDgCS56eUa66U1FmZVZ3KgcIQP9oKhZNXY579OMx1XzWaqgI?=
 =?us-ascii?Q?d4XNnEkBxwj3fyHLogKyWzw4HPqJPDVsoxM18BT8HnNnAyuK1KTcBdOi52K8?=
 =?us-ascii?Q?XEfZqAT0aa/0P5c4SR9hxU1hQARTrzAb0yG20Fe2RhmV9IfpLyy6ODt3D+Ai?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae95c785-5235-4464-3dcc-08dc7c36aea9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 21:15:48.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuu8k/rYqsh4Vot+jkcp1TVCPBqpYVXD5LtCEBdwyMcf1jZERMZpjTKayOcR31P3tyAzBCSqbtZcB+IpF3nJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
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

On Fri, May 24, 2024 at 02:09:48PM -0700, Umesh Nerlige Ramappa wrote:
> Note that runtime is also used in the pm context, so it is confusing to
> use the same name to denote run time of the drm client. Use a more
> appropriate name for the client utilization.

First of all, thank you so much!

> 
> While at it, drop the incorrect multi-lrc comment in the helper
> description
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++--
>  drivers/gpu/drm/xe/xe_drm_client.c   |  4 ++--
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++------
>  drivers/gpu/drm/xe/xe_exec_queue.h   |  2 +-
>  drivers/gpu/drm/xe/xe_execlist.c     |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 03bedc33b21a..d0936d82cc1d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -556,8 +556,8 @@ struct xe_file {
>  		struct mutex lock;
>  	} exec_queue;
>  
> -	/** @runtime: hw engine class runtime in ticks for this drm client */
> -	u64 runtime[XE_ENGINE_CLASS_MAX];
> +	/** @run_ticks: hw engine class run time in ticks for this drm client */
> +	u64 run_ticks[XE_ENGINE_CLASS_MAX];
>  
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index af404c9e5cc0..5679e9b15d06 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -252,7 +252,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)

while at it, could you please also update the function name?

with that,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
>  	xa_for_each(&xef->exec_queue.xa, i, q)
> -		xe_exec_queue_update_runtime(q);
> +		xe_exec_queue_update_run_ticks(q);
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> @@ -287,7 +287,7 @@ static void show_runtime(struct drm_printer *p, struct drm_file *file)
>  
>  		class_name = xe_hw_engine_class_to_str(class);
>  		drm_printf(p, "drm-cycles-%s:\t%llu\n",
> -			   class_name, xef->runtime[class]);
> +			   class_name, xef->run_ticks[class]);
>  		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>  			   class_name, gpu_timestamp);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0fd61fb4d104..841d3ea71e0d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -756,14 +756,14 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  }
>  
>  /**
> - * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
> + * xe_exec_queue_update_run_ticks() - Update run time in ticks for this exec queue
> + * from hw
>   * @q: The exec queue
>   *
> - * Update the timestamp saved by HW for this exec queue and save runtime
> - * calculated by using the delta from last update. On multi-lrc case, only the
> - * first is considered.
> + * Update the timestamp saved by HW for this exec queue and save run ticks
> + * calculated by using the delta from last update.
>   */
> -void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
> +void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
>  	struct xe_file *xef;
>  	struct xe_lrc *lrc;
> @@ -789,7 +789,7 @@ void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>  	 */
>  	lrc = &q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index e0f07d28ee1a..289a3a51d2a2 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -75,6 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>  					       struct xe_vm *vm);
>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>  				  struct dma_fence *fence);
> -void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
> +void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index bd7f27efe0e0..8e5c591fcecd 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -306,7 +306,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  
> -	xe_exec_queue_update_runtime(job->q);
> +	xe_exec_queue_update_run_ticks(job->q);
>  	xe_sched_job_put(job);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 54778189cfd5..ee078a6d174a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -763,7 +763,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>  {
>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>  
> -	xe_exec_queue_update_runtime(job->q);
> +	xe_exec_queue_update_run_ticks(job->q);
>  
>  	trace_xe_sched_job_free(job);
>  	xe_sched_job_put(job);
> -- 
> 2.34.1
> 
