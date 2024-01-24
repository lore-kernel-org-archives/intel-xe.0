Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83EC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 21:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95010E96E;
	Wed, 24 Jan 2024 21:18:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509B10E96E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706131091; x=1737667091;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qvNr+wJE5LMkQ0eWHMNfTZrhAGdkGaaudhRmDWfj1O8=;
 b=KJPqY7c9CuEEJj9WgtmEjyUuzQkoeqKVhhs9MTPD+FBn/NK59QFmW7ez
 4mKLyW5ro1bMXb3OgwgJIGIPrEoYsTlaFnANqKCfbE4FC1n88Vn8h92/A
 q0FeMbWx5PJNbgNYmdsqboILsejycNS+SfzAzgyO/bURTuPZ8uZ+k2994
 XP/qs5ED2YFY+C4HtQi4RRRgKFoFdKGDXi0GkWcJC/n5tOGZJXVteKV8A
 1rQHjDU9orCwxdESWOdRJhTBpZ9YaxpKfXjFjCs9C+KgpFD2gJve3Zwbw
 GWfn0p6Jk3XwK3AR203S89tjINn+PgVDPS6v3EstwxvL2H5glaqDEaRtv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400833901"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400833901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 13:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876824184"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="876824184"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 13:18:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 13:18:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 13:18:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 13:18:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 13:18:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyB2W8d37HzSoXj8QD2vxMmYSqG+d/5kRQBqQhyKhSAk9/QNpLPsgYPpG7i49HH7DJA6vJI9VUlwDQy8kItIcOG2vP89VTx7U/2d6XYMFOcLtEu2N+xzdIUWjr+IZWUcxKR+t8ftKzyBI+GsIhzLF3XmGvD1/Ae0Sz6sKt2+UI22QDc9oll2jWH66T06PChyjy9o6i7XDhtw7XPBlRgUJ+gJfYu6Gd3DVQjVdlYeMUk47ENa+31dEz0Q6PMrVj0QzX9i58lJzPfuQeaXegQfvLSsh7ykZkj27tzJ+k3+UJZ0wotQN6FZWAt2+hr/QHWnXAaohH6fk/K9NKPzuVOlcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIUJUt7RFFwna3wE7Oz4zDVPIna9sszfhijQcYzPFTs=;
 b=RKo+QL7AEWj43Y2fqbMrhcK8CHtLoH89sBO+3fqZkk/Unckg94KEINstyOVdrqZN8RyBJxNOscyuWXZddDq+ag60e2snbq5nyIR7jUpnWgMM0BSE74tHN2POTGqVzCaVRKgaTYxkEKqaJ0GoflZO6Wjr/RfwVi5bwJ1JsdkAAC2O51D7zh995NwbMGj9j2My8RZ9DFycqHluHayrj1nXRkN/sB4Ep50P09FBvC+BKFAoqx1s26FrAR8YOXEhjz1Qkj7rExVeLvpTkdlRIpglrW+RskERtZC+BOO7cRPTHaMjFy47TaP+2O3nJ8tu97RlgDr+cDPewyhAHXGjOArHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 21:18:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 21:18:06 +0000
Date: Wed, 24 Jan 2024 21:17:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe: Fix crash in trace_dma_fence_init()
Message-ID: <ZbF+YaiN0dRD3G2o@DUT025-TGLU.fm.intel.com>
References: <20240124171830.95774-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124171830.95774-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 4512243e-4c12-40d5-f573-08dc1d21f4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DB0G4LWtoyT29xw9He9JtI/LUu5thaYnRLFuq+7I0mByemE8gf+EHnt4oD8ZGoSFprVxQhhkdJRzqZ0iQUUDI1GFALePEKRIF858E7iybcq+2SsXtXX6TRg5cS2B7G3oOr6LAviVluGCmDoB/F3C6Gcu/ZaxhWODkBbvOZZ/2Mz6iBcl3lQWv02LwIZC81BMFReZq5Zrbtvs8rce5aqFA8w++XetuzcuZTPZDKBSVwbJUuJYAae5Rv5lyds2iI92y6WrQu2PDN6b3yGjJWxOmpt8Sycf6I1dMGSrAOBKQievjHdUVfT8v45qwaK+abumQr/4/ArsT2K0Xaixr/pK0CujW2j9DwORoHU9pvvJswXspv8GbKTvN+0O2G5QWuhHE8s+HuSZ4dZbWMjj5TuVCvJXmFZqttFx5HHMDQuUKiLjwWU9d3jwXO9Jknx75qFo4aWGEeDh1oIF0QBQJ+NJCgaNA/4Ozq7HMOgLs+ZBcKIkQNNn9u0VAOQqS0h08f/7BKGjz63oKA74mqpFeKK5Qnje0v9KVbEXQA4e3leNLYLLypwAxjKpgVhXBMcxOpLFN+3Nj9LDd82+EoWXx66rzM8nZ0w0dNniXdm4U7X8OOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66556008)(66476007)(66946007)(6636002)(316002)(5660300002)(8676002)(6666004)(26005)(8936002)(4326008)(6862004)(83380400001)(2906002)(6512007)(44832011)(82960400001)(6506007)(478600001)(6486002)(41300700001)(86362001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dHTrEvZ1jXDftiJkeObE1cAJe/olySyrcqWZpi5xI6nOZ5kUcrXL/sJrCN?=
 =?iso-8859-1?Q?lq7PX0iKXiwxiuBX68Lc2K4OhQCw5dszXBQMDgOH37R5ogUzqjayZWKdYC?=
 =?iso-8859-1?Q?8vR+ZMTggcdFlKWGQp/LP33O87+DrE+7VTsZn4mBqFTsf0xZpXNW8FGaHt?=
 =?iso-8859-1?Q?p/FbcGVcfpmqqZKjbD18LvKprMcXOTdMrf0OqGahBI+ACHZxv35aLtI0zl?=
 =?iso-8859-1?Q?nhoFeYq6AIKIY9bWYnZa0EbkmfkWth/rPj0zH695NFKW7XM28RsYf5xZPw?=
 =?iso-8859-1?Q?b/mJdeFKVNztY9nmfhcimenh4zlyKb5HnInqQGSKfqM7hcev4TrhtBas7d?=
 =?iso-8859-1?Q?AjtuFK/efCW4RBr6O2hdOJgMmgAfhocMt0VTE+NywNk4eY0VGLyRGJQnsK?=
 =?iso-8859-1?Q?R6WNofCEin8k8LdFw3S+YDaRlzE9GDptMpdRvk4P5nIbyvXa3AztdKZNOr?=
 =?iso-8859-1?Q?wS7aGiv39VHlYve2e2ONmbCUNvLn49g9iNklWQiw8ZYHmubMwUiIhOSqJ3?=
 =?iso-8859-1?Q?96CB9W6gUS8vnFZ9LcKh9+WzeSK/BCJSpJ+9om8PUKAjSj/Y81V/0uinIe?=
 =?iso-8859-1?Q?MJejb27PiExHhVO+JChdFDGXdJLT7HxvfM7I4J3YSgvL7RRTfOUdJ8PeZq?=
 =?iso-8859-1?Q?dnybk4xDhd1rZILb2XAQh4es7ukn7xzpVD9yxmFDxx+bAFpCaYPnUmA7Dj?=
 =?iso-8859-1?Q?/2/+FRjWNaHXTkaRdm6JUgvIFXiAvkbDUsPVMAfo9Ukwa+preUG+1JtMj8?=
 =?iso-8859-1?Q?k/dERBpdbLN5c6F8dwOy2kurstSUIJLXM2eMVYO4WEqAdhuwGY2D57IznR?=
 =?iso-8859-1?Q?MZLjZZK3Y2fpygDtUcLibLh+aYFg5DSx0plddYKlNtm+hRQtVIiiywYInf?=
 =?iso-8859-1?Q?Tf/dYDcBxX50Z2yT7zNRxa7wO4xZwZ5had60LkwKSX20knwcQ+T467x1AA?=
 =?iso-8859-1?Q?h2Te1QcdR905Wqk5AhxnDrpIksQA9uTWCsknVRKWLC0SKL09GwjSWBzbs5?=
 =?iso-8859-1?Q?EKISFCIaQWEiHkeQAHGd9Z827YTc+pqXgI52921zUUbETX1PTBNRojVA2+?=
 =?iso-8859-1?Q?rFPzWFf6C9RGIuC2sW/pO/Wv7TUuMQPWVl2Yy2ADK5sztqW410W5uBmeZC?=
 =?iso-8859-1?Q?qTierU7kgj/G3sqsQWHnoN56PggJduFhRBkxamGboxkJgnxkrAlTl5QQ7a?=
 =?iso-8859-1?Q?dRKFToqdoi/e6SBEPr6vjaBgv38tXE+P2aponzaIJgssm8RGhwIEE+gcYm?=
 =?iso-8859-1?Q?1AEvZicTl+0JBWPniHUjvAhog21QEUjpJM+4AnoLEI+GerJUjNr8WFF8uQ?=
 =?iso-8859-1?Q?mpXjmQas4r4yPwiT0cO/MglAsv6figohMxInsoUMoIlTBjC1tAwo4QIqgw?=
 =?iso-8859-1?Q?iMMYIfMgn4yojxZCFnpPXR2od3WI83FDGay+DEIurlIzU8qY88HuipBSwS?=
 =?iso-8859-1?Q?Ii3S8b1KRG8FXqRCLlIw1Gsf1oJzF6zsxnvnKmJDXo6nZLDBQBW9HMVLFi?=
 =?iso-8859-1?Q?WPR1hArkbzK8kK6L4RF6QwlFqoZxib8pWJGwwE4Rt4kNUu2jcE442tSEuI?=
 =?iso-8859-1?Q?wmuut3zoU6aWeAUGth192N+FuEUskMdaqAPxbWagSgL2w2Tz36qgUpjzwA?=
 =?iso-8859-1?Q?hEaEuofD4Tj1KJsz3xfSj9K4GOXSISi0u2UTpOj6khVXdUK0Nw5r7OpQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4512243e-4c12-40d5-f573-08dc1d21f4f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 21:18:06.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krFJ/MPZJmDXpoClh9lge8kzRWPdqEUtyR2SiEF60Wr9AcpnygDtYJ3JFed25cvOm7NmKZkbqYVbTGy9sYE6wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 09:18:30AM -0800, José Roberto de Souza wrote:
> trace_dma_fence_init() uses dma_fence_ops functions
> like get_driver_name() and get_timeline_name() to generate trace
> information but the Xe KMD implementation of those functions makes
> use of xe_hw_fence_ctx that was being set after dma_fence_init().
> 
> So here just inverting the order to fix the crash.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index a6094c81f2ad0..a5de3e7b0bd6a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -217,13 +217,13 @@ struct xe_hw_fence *xe_hw_fence_create(struct xe_hw_fence_ctx *ctx,
>  	if (!fence)
>  		return ERR_PTR(-ENOMEM);
>  
> -	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
> -		       ctx->dma_fence_ctx, ctx->next_seqno++);
> -
>  	fence->ctx = ctx;
>  	fence->seqno_map = seqno_map;
>  	INIT_LIST_HEAD(&fence->irq_link);
>  
> +	dma_fence_init(&fence->dma, &xe_hw_fence_ops, &ctx->irq->lock,
> +		       ctx->dma_fence_ctx, ctx->next_seqno++);
> +
>  	trace_xe_hw_fence_create(fence);
>  
>  	return fence;
> -- 
> 2.43.0
> 
