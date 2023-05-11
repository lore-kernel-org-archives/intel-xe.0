Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784A9C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 20:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306BB10E0EE;
	Thu, 11 May 2023 20:36:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662C10E0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683837405; x=1715373405;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xoApRrZSfeVR+Y/OdaXWCfkH/TLfPmVCoNVJ6b/DCS0=;
 b=LbQ5aws9hrUeylwVoU8vLVdJwgqr35VIp+oMIaRD+mLcQYgxnR1F+966
 AglQIbvsyvmP/DdotW5yL28TqTtOLIMvRhGyl/VQRCbIuXvWgEVgDttMY
 nDkY8vRlsPxjAUZjPTGDCs736RSJKn6I6fUvRSBJlH04IKsZQuQvnOf26
 UncONlxmKiwLtBPRVWRphkGyJQv8GzBWAIUQEJWc3TzP/1DPr9Tdmbra2
 PHZgo+G23eMO00ENoNj8PmNiYoiKvCieGNMsyWuRNsY21MWWCffvoDhp/
 CxFd+llsEtdvu1OWu3GDKQ5CNsMS7XT+biwrQ+ATe3xZ8yHg31Rb6j1CP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335136617"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="335136617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 13:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789528301"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="789528301"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 13:36:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 13:36:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 13:36:38 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 13:36:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvr7TH4aq8tEgtQNgkplLjdE4Fjqxdm987AAYz0uwz+DAcZx8yTQcJcgbYfnikz9zojrS97jn75RBtGHqoWWsl2wcsj7b95gnjW8KLEXJGwF+ZUO44lIeN5fQM0trkZ0Z5vdLr/cbBF2YNnVpYq04MAul/1I5BazDutnUTbQ9PpwLcb+Gue8MoY5xwZHfenSd+aDWqk09IGhXYw9Pvgj8dESg9q8drTHsA/ucIET2J1LHOBoe7Fbzd2b0aFmlwpoAT3d2iJMwJOtFFeGyLibJzciEcsq7SH+O872WYas7eh3gTgd68kF4PW9tIufKKECUOAzzXgkVy1Z+Y/1lCtM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBBVPN1KI035oAQn14YBj6Ynivgh1622o0XZ9nng330=;
 b=HQ9PvQOh9M1DPSqrwI/VSA3zuBeVS+qCv4/0P6EJO4cfvN/cTgqzXhOu8uliDllAcMqTe34WkjJ4sqkEjUjBkZ56roXKpLTuJ8Vaibv2GyApV09OTv8IWmKz7xp73xJlqpcBrMyXHW3KN0sfivYlX9jcCtvUjQNv06xUagRiGWp0t/JkAejfVbOT0voNy5JrU/x8vResakRbjAwO27Imyl3wWdjuMViocGtrq7zASXKdnaNdEB4CuQ7M7KO/GN3xJCmgdwLBetWbWXeUytn7dgMJRTG/9/EvkE2s9/UfdxvtMwnWB8GAmR+DL7BzK1bTCMcdsWcUknIGvdgngulnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 20:36:36 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 20:36:36 +0000
Date: Thu, 11 May 2023 13:36:31 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <jani.nikula@intel.com>
Message-ID: <ZF1Rz0QQT2gyf3xX@msatwood-mobl>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
 <20230511194822.626036-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511194822.626036-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:a03:114::32) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f628df-7195-4d39-037b-08db525f6a31
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o6a9nD/awjuQvG6o2h66ZN1UmpNotv85KImOtPL8qopAGgdOuf8YXCmjfjjMCw9kxR9+dAqCCIGpyqT3ioifq+/pyT598B2pAYwe5nWFa2Iey+hfx0OtRe7Ej8AKV9Y6cz0sJVy4Ux5/BXFw2NYWixVmO5MY32a4Pq/GKVjHeJ6gK8d99pi1S6eFtKjHy9uRkuGmX8+iyZvlhktr9nsg7Iv0eomDXEQ8ZlK/flNfDiEdCr79tPHWuaokPwKj6OqmUDLVPQZXSUo+Rhz3WZvODygVfNvJvo+RIkS4QQ/sLp3k8BWsgD7hzzqQXAeIX59e1ELNbOfeRl8pZBjqT7rhjoHx7/7ukdDqnWYlaoFewK7U1zhWW4Bc7bLv2PnaEIgb88rneDfCL28DOoMSmaNDpSxgRCVe4wZffSFpUor0F2YLctfUHp3E6Vb9FWsgnxCdZ+oO4zAWS7N2/MymDu5pXGC81lVrIrPeL2X6cmHJuIJT+BwUOcy6YzdNCFtd1enhkKBeTNLtHjPrnpRbLkuVP/iiZ6voCgZekG17zFdOgZ0NF0Hl3bOJN5fmcLvcUdgcF28env92UhASKQePAnlqk0E2FcOFxMh7ibLoBy6LzbY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(186003)(82960400001)(2906002)(83380400001)(33716001)(38100700002)(86362001)(6486002)(8936002)(8676002)(316002)(6666004)(41300700001)(5660300002)(478600001)(66476007)(4326008)(66946007)(66556008)(107886003)(6636002)(26005)(6506007)(6512007)(9686003)(26583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RURuUUlMRDBtV0FkUUpCallYcXhDNm5xN2FRWFY1Z3hUZDBocXBvWmFLRnha?=
 =?utf-8?B?Y0lnZEd4RzVyQjZEclB4TEMwZXdNZXZ6S04zOVBpajhSUCs4ZnRhOGRtUlZV?=
 =?utf-8?B?Rm9hZ1hYQlZKWjduQnpZODc3bDcya3NkcGt3SEwzQ2I0VTNpRUdZWXZySFBT?=
 =?utf-8?B?T3AvNzQvMXBYOFBjUXorREh0NlJySW9jRWJUQ0NwazRlcmVVQ3lSaDJYRXhG?=
 =?utf-8?B?SWp1K0hUd3Q5MS9ZUzF1U1Z0WnczMC9nVE43TEcyc0ZDaGpjcU1uTTNZNFVY?=
 =?utf-8?B?YmpZQTlHdVZsVEV2VkxmOG00VlJxNFlmT2NjdUxRVFNMVU5Ec0RGaEpMRFk4?=
 =?utf-8?B?YlI2anpmUkFyN1VWQzdrSndsMVhUdjJYejZqNVZ4ck03VkR6Y2xSNmNIK3dF?=
 =?utf-8?B?ZkpTVjAwZ0NVUUQ3WDBGSUtZeGdjVFBwclNHVEJRQk9QRnBOOS93RHdscm1S?=
 =?utf-8?B?Nmsxd0pTcG5XU0Z1N0FzSjlOdGFTWWMwTmtxVXhxL3B5Ri9UZ3grU0M3NXA4?=
 =?utf-8?B?Q0RxczU3SGpqK3lBNFBhQVpmTFdtUkl6N1haNG9nTW00MDdpL1VsZWI0cGlt?=
 =?utf-8?B?YXRHOHcyempjRmhaVGsyQWtPT1VFUnB3Wi8yd0dmeVNrdDR0T2lxMFk1SVlt?=
 =?utf-8?B?YUl3VGVrQzYwUHJab2JVZE5tS2VBNmlnL3RpRnIrUjJRY3h3SWljZ0thR0NZ?=
 =?utf-8?B?TDg3NzlrNXdVUWJjRS9TRUx4VGlnQU1iTC9VeVp0KytveHpCa0JEN0Q4aTV6?=
 =?utf-8?B?K29aRVA2aWlHRVNmRHd5MlZHSVd1eko3QktwZFJKeWdlYTJuaDJwSDZ1RTB5?=
 =?utf-8?B?Tzh6OWE2OEljRjJEbjkwWW9rVWFmNzlEUnF5dS85WXNHNEFrSFRvY0crbnpT?=
 =?utf-8?B?NVdNOFk1WjRjV1pWOTRaSCtDeG1SUGVieE1lSVFRNkdhQTVHUDhyZDRXaHU5?=
 =?utf-8?B?aGdDQXJPZ3dPM2ZuM0hBU0R4dmhrS3FidU5KQkNsczZaUUphcXlUZmJEaVBX?=
 =?utf-8?B?TG80SlVFNDl6M0VrdVYxS3NUVFZSaVR2Y3FveE40N0tvNklPQ2lBSThldTBZ?=
 =?utf-8?B?YnlQSnJiSXBxLy9TVHArd1dQM0VWeEM0TS9HNnR0eXJlZ24zNElyUUhNVlNy?=
 =?utf-8?B?L050aE5tcGZwWVg5Q1NCSFpJTldTMjk5NWFWQmcrY2hMdmZpaXNRRG1jcG8v?=
 =?utf-8?B?RUFhVUQ1bmw5R2hOV05pWWk1bHZuWm9LdG9VZkJWTG11bDJ4QUd1RkswVm1s?=
 =?utf-8?B?dmM4VUpOek5yZTkvaVZmL0ZPS2Yrc0FsU2ZYZ3FXUFFiTldjejhsNVczM0pO?=
 =?utf-8?B?UWV2RHQvdGVkNkhBVWpDNVlzNGNOSGFRQlRTMHFDMFg1UFJRby9wNDkwQzFP?=
 =?utf-8?B?QzVyQm5KWVVGbmhMVThZekltUjBMTVRRUlZrKzZvSmt1QjJtcUd6WWQyM3d5?=
 =?utf-8?B?UUVkbi9GSFE3TVdSYVV2aEJQQ0dXdHYwa3d4cE1MMURCbjFCd25URlRJbFJ1?=
 =?utf-8?B?Q2VFQm5mbzFBV1FuRm1RQlFZcWZWOUJWTXprSUNHb1ZxVmphdWxQYXVLTXlG?=
 =?utf-8?B?VnBRc3hUM1M1R3k2RVN0Z1p3a0pZYm10QmFVc1FIeGhPNmZMY3o2clBDd29k?=
 =?utf-8?B?anRZMktuVHJ1eWZwMWlJRDh2MUhPWHcxbnhQNFZyL2Q5UVlmeXk2N3FVREUv?=
 =?utf-8?B?aVp4bHgyWVo5V2NnRFJFZVk1OXRJbExWSXVBVTJoUVZTOWtJeGpUMmJOYXdu?=
 =?utf-8?B?TTZaOUt6WU11TDM4RlNnRFVza1FwUmVLSUVVaUEyM3ZTOHBqeEFsZ05OS3hn?=
 =?utf-8?B?VmZyWUZMVTdEL1BTeU1aUERPdGh3L2FzZ1VvSmExWXYzbnZDZDg0REJ0c0pp?=
 =?utf-8?B?WVNuUWxkSnNka1dQb2o3WDFXSUwrZHFycXdUbUFkU0ZDcnJlYWdrVEorRDZ6?=
 =?utf-8?B?QzQ2TG5mYnRFYzF6ZiswQWZSVDNxS3B6SEFjRDlMb0thaEZIUlFVaXBsOFRV?=
 =?utf-8?B?ZG0zb2M1Z2VobjRlamtKdmxsUTRtZVFwdHhiSjdSSU5HUHJUYzVZNzdFbWhG?=
 =?utf-8?B?cytjUHpSRkVjZjFQb0paRldpKzlsR29GdFBtWWRRRHhDSXNUNE45azlaS0pD?=
 =?utf-8?B?S2hWMEs2c0FYVnp2czF3VVNhczJmeW5iN2VvZ09kZWNhUTBvbGFoR1VoSy9y?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f628df-7195-4d39-037b-08db525f6a31
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 20:36:36.1826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcpSlkluU7FZ+vxwslCwlpZItfEmk9Jh973gDqG/DJUPgJCxWR6/4anyKkCU9ChUIYGFNst9MC30d0Ap/0QxOfrVp2LQcSgdxZVQ99LxxGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Get rid of
 MAKE_INIT_EXIT_FUNCS
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 04:48:21PM -0300, Gustavo Sousa wrote:
> There is not much of a benefit from using that macro as of now and it
> hurts grepability or other ways of cross-referencing.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 6860586ce7f8..0b4541639bd1 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -39,12 +39,16 @@ struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
>  };
> -#define MAKE_INIT_EXIT_FUNCS(name)		\
> -	{ .init = xe_##name##_module_init,	\
> -	  .exit = xe_##name##_module_exit, }
> +
>  static const struct init_funcs init_funcs[] = {
> -	MAKE_INIT_EXIT_FUNCS(hw_fence),
> -	MAKE_INIT_EXIT_FUNCS(sched_job),
> +	{
> +		.init = xe_hw_fence_module_init,
> +		.exit = xe_hw_fence_module_exit,
> +	},
> +	{
> +		.init = xe_sched_job_module_init,
> +		.exit = xe_sched_job_module_exit,
> +	},
>  };
>  
>  static int __init xe_init(void)
> -- 
> 2.40.1
> 
