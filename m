Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91045EB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 11:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5F10E614;
	Wed,  6 Sep 2023 11:19:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BFB10E5E1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693999162; x=1725535162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vZMcmzaLcdBhimKHjMD+D7RkpVkBIXvJa/mWgn2IrWM=;
 b=LUfGe75hw68aZa58KZnRT3oNms6vjklrt4bJ7jYmG0WFNrTiKzchSyO/
 gLCWsbNUgcZkDKUVzjwUpDlI+BPY7GIj+U7YnS8DwXK05/aEYLfXhUAi/
 rXynjFJFNcTAZqFfzUuLM9fNmUWhcOjj9V2lnkSJP7lzBgYmACo2ZlfyW
 YlrZO5Pa/B3DUbHx+B5m+1+f5dg/70Y/whWP7kSvZiBi6aoZ5VssSWFk4
 EmdYqlNyNhS8Klz4T3V8+ALxPly7PlnUqNHIXVITHBjwg1trpMpfEGZqv
 vwM4LMFJ07rDcbebTrF5SRAaA3IuYRj9faZfh45/bfU6kv5aF2PxTJErz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="441014393"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="441014393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 04:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856401745"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="856401745"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 04:19:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 04:19:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 04:19:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 04:19:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 04:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmXx6R1vY5aSt+zeaHNqKY7kiQOuVxyKX5FJUm6fT6pAxG9nZPH7kCI3XJro85tRc0RjFb69klz1ZmGS1N/7eCiQ6PIJn+6qPTyL2UlHl74XREycf/T+K5zKRBLVN1rVcV0zm+xIp7Sk2Z7bKgusjW4NuvWGWCuZ90goxLPQSYP9lCLbc8t0dE1WCqQ2GMNleRbSJWNYJokvASilwht4LzgJXTWkCFx06bLFO/BNa/IH5iYCU24WbUC0ldmMv6C7PtfZCoKGScV2WxeDSk7Wz8+MxfZYCElnf1yQxU63vHLu67F7BQSzivduQdjx7lGBytb3HwZBtT0XI+sVT89alg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTjniPtxnGGt8Uz7zlY8iC2ve/S1Ug7q9s/Y9WcKahs=;
 b=a+Y8k54UnN1nhkOCmQzZ7A4vdihIT3Q7yIRe8c7FjbPa3K+YtpUf3VQ8GIV3aur6RtLuuOpqKUvX8t4+Zcw5w8B5lz/+p6RzQoo5j20xpvXBRivnLqhnG7DcKgUjrZQ+fxo0VbOrZaPBFtu1ls6eEJ6hDXx0f+IpzCYLcZI5ggpOIgApw6GskeWEODBbpeih+mFFk4RjWKx1gecSYZ/fFYd+cUA0QQ9XFieAZjFx8N6rOHOb54O701NoPfX1WOH8PX6dQ0ICl4upcOP3Tu02Fr02Sli6+/DeVwA2SzraLHYDOS4iznUa1RrXPRtk7XjIT2DZuT27Y/0Slw4sGPFgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 11:19:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 11:19:13 +0000
Message-ID: <9f194980-3e9e-43a9-a938-59f0671cb853@intel.com>
Date: Wed, 6 Sep 2023 16:49:04 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230831090536.2949934-1-tejas.upadhyay@intel.com>
 <20230831090536.2949934-7-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230831090536.2949934-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: b369660a-1fad-4eda-bbdb-08dbaecb192b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6utY/IEiDmirr8X7krBR0AZ1ZRDFeTtmvKSLnzuN6vPuUNJnOOx09ulOqN4vO+u7OCqz9+vOvVb+rQ3fEpG0rIoC/vVsjGYoIGs+UJZK9X+ubDvPmru2Qjx4V2N34b4xBhVxvp1t+FRBk/0F6MCMZtD5zX0rdVFTXUS3Lq/zcbGS9V1Csz24bI9YPLRZOUU7K8Fpdxf3OB7HlD3xS16O/5DIQJYmA08jb/WLTqQWdGthGLfRSMg0Bh9hv2bbG6kXHEUsAH3N/RQgEM9H9bzRPWgAndgL0g2u4TJpTcEQDhkBnkkh7JVaxY0Fspfr+IXuRMg/iI/rVLRPRQDL1/IV+yWcShVEYHwJnmjOy/Fis/iiS8D61pMdsfofN615O/njgqp/hKnymfLxOKcDcW8NsWbq/VT3KltfDG9yyGnSg5cB990qlm8Q87JXnBQ8OHlBDQkpyZIB+S/mnxkVALl8o68o2pLh9c2imK29YBidCorgFiXrunf6MKEhbDNyu3yM20RWqYlCPSXBS+K4TBI8JnSq6SnUQM9ViCf2zzzIOBM+5/+3UQM5OhDGupkhhSWT0rThwgJZyth+TvmVHi0A1tm9Z/TrKFK+LXOEpnR6U/oQTVLUFPRVHAZYZpZrC5BV/0MuY7J6vef9CeE56M8tYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(1800799009)(186009)(451199024)(15650500001)(2906002)(38100700002)(82960400001)(36756003)(31696002)(86362001)(107886003)(8936002)(4326008)(8676002)(2616005)(5660300002)(26005)(6666004)(53546011)(41300700001)(316002)(66556008)(66946007)(66476007)(6512007)(6506007)(6486002)(83380400001)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDFBUkM4UktQMlQ3a0ZYdTV5cjBaVHJOMm1BckZWUE52cDNrMUV3MnJSM1dJ?=
 =?utf-8?B?aitMKzZaVmRaVzBRbDU3NVpaRk5HdXlISFJQN3JLdjJWaVFHOHRvenpHSFBk?=
 =?utf-8?B?QlRhQytkSlNZV3JqWS84S05YeXlJVEtqWlhlYnVBK3RDT29ZbzVDa3pBQTdI?=
 =?utf-8?B?OTBNd01FVEhQOVVrVExyT3AxNmU0WlVrMDRuNHEydytxd2dKN0JvME5nblRT?=
 =?utf-8?B?V3pmUzFxKzJPZnBCWGtKYVBuR2xxVnVDWWZJaTRLQjBPamlkTHVaNWJONHhS?=
 =?utf-8?B?UklGWWUrRWZJRGtjZStweDlOejZHVHJpMTBMZTloTnk4aFZON1RjSVY3YUJ1?=
 =?utf-8?B?Z2diRnY3UHVnakFUOS9TN05mUVZHMHFQbVg1QWtFODdlVXFZMGFFUjJWbzd3?=
 =?utf-8?B?ZFJvWHdTWTB0TmpxdzZsS0cvS3duaGYwc0tUUFRWSzFuNzdrVkNwNUt2Q2Fi?=
 =?utf-8?B?dWdMaFBQNjRpY0ZKWkFVTXJGemsrcHV3U3plR0RxYTFjWkJKZkd6bHJ2cE1P?=
 =?utf-8?B?OS9uOW1WN0ZPcVpkZFN4SHN2QWVVdkp4bEs1Q2xUVWk4MTgvQ0lkTDVDUTlv?=
 =?utf-8?B?YVltTldmNFpWd2VJZFBZSGRPUC9aeGkwMEFHZUxtZU9rUTBKS0RkOUdES2VS?=
 =?utf-8?B?dUZHSmliMUtsU09wUCt3SXhrZnd3dWFWZTJwMkZreXRHaFgwblNuaEJyTnJ2?=
 =?utf-8?B?cjZBZmFVZEVzdnpmU1hZd24yNVJ3VDJCbkQ3NkszL1V1WTk5STIvRkR2NTZP?=
 =?utf-8?B?LzdvclNBaG5zeWZIZy85SVUyWnY4NnBFYm9ZYVhsY0ZINWVDR0FGdUNHSW1X?=
 =?utf-8?B?SUsrek55ak9GVDdJc1diMGd1ZjlsMXNvZEJYSUM5SEdyWmhRZG5jTk80aHpo?=
 =?utf-8?B?WVJ1SHM0VVVNZ2h3YzZxM0pYck56NTQ1NDdsTk81VDBWNUlFWFFiRUlvRUJT?=
 =?utf-8?B?cmRIV1BrZ0VpL2VtVE1tRzFoWnFqSHR2bnp3OU96Ykw5SWt6ZjFLaHBFcFJQ?=
 =?utf-8?B?NU1QMnpRZm9OaGlINzR0bGJ1ZkFDamh2bFZTNTI4QnBkUVBrclhyaUFNZ2xH?=
 =?utf-8?B?bEUyVXlqYU1UdmYrRFk4WXhEbUk4QlV5Y2hjSUJ1YjFBNXlVWUFQRVFrMmtz?=
 =?utf-8?B?dlJJdlNFalE2Y3hsR2VaZFptdVgxZWV4dG5xRHgvUXZ5cjJ2Y3lReDNlRWcy?=
 =?utf-8?B?THdIUTYxNm95NjlqM2ZLa0ZXZ1JKcVl1K1JKd0xPUGUyVzFnZTJkRFRzaXBq?=
 =?utf-8?B?cU1PQWd1SGlKZ0E3b1RiV2lQL0FXRjdLTE1JV0RocjQ2U2h1bzNnalVlZUh5?=
 =?utf-8?B?b1IrajdpalBVc0pWS2ZmN1g0U2R0REwwVTVFcFZ0eW1ka1VvWENwaDBYcDQ4?=
 =?utf-8?B?T1NhUUJZQ0I5M2J4Yk9LNmNhOFVQWUtMRFlGbjNQTkd2eWV0MjZtQmpIZVFS?=
 =?utf-8?B?dWxyYUtVbmxHT0NoYzJWcGRXOVVyUmZsVnpEcWVrNGR1eEtEN2h1aExQUFdI?=
 =?utf-8?B?dFZ5eEdsSURISXVGdE1ZSVJ1OWhXWXNDdEJKRExocEpFaWJsajcwdGtlUUoy?=
 =?utf-8?B?TEMreDE5SlhDZ3Q1ZGJVcmF0S0YvTWdwcFZWRnI1UUZCV2sreHFmb2tzdkpl?=
 =?utf-8?B?bUYzV0tvRnNJanhYbVFZQXRVVVh2NmJTbERsaUFlVC9UY1AwQ1UvRDhGVnpz?=
 =?utf-8?B?T1ovV24xS1Q2UStBTDhxSUdpdFZ3dGkwbjhjV0lMbWdjSmNiczVBU0pCYUYr?=
 =?utf-8?B?MEU5enRHQ082Wm5vUzJEYm5uZzYxeWdFeTN6ZzZYSmU5d1RzR3lrTEltcHk4?=
 =?utf-8?B?QjJSVU4vNHI5aHhPK0tEWFp1dDlKYnNZTExkZy92NVJiSlRUSXZ3VDZSV0o1?=
 =?utf-8?B?Um4xQWNvWnhKeHNKNUluYnNsaDVldmtEc3lhTXlFdk9lNktoM1dwUzlIZGVk?=
 =?utf-8?B?UzVrNXVheWFBZncwWmF1UDBMT084T2FUSUVCejM0VEs5ei9WZytsaGhNVGx6?=
 =?utf-8?B?cmt2MDBlMndIdUhvaUNKaHZnTVdZcUhLaDBVelZxbDFDRTRQaDlJaWYvaUxv?=
 =?utf-8?B?eG8zcklRU3dlK1c5V2xjVG1LUHMwY1hHK2ZZaTdyV2tIWU90NWZTeGNTSjAx?=
 =?utf-8?B?OHQ4YmtxUXk1aTJ5S09TS2xYeVdUdUlLaTRPWlU3QzNoZThzMDJsbURXNWJX?=
 =?utf-8?Q?mhZMgzOI4qpn/LCy9MlsovI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b369660a-1fad-4eda-bbdb-08dbaecb192b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 11:19:13.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndL0PAiMcUqh8aqvUoECqmx+j2hBUhPGbqaWLjvXHRfVpopzpULxd/50NoGpHVzI9hMdFEhHr16azypnwZdJS37ucFSxnA81xyAKoqW8FJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe: Account ring buffer and context
 state storage
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


On 31-08-2023 14:35, Tejas Upadhyay wrote:
> Account ring buffers and logical context space against the owning client
> memory usage stats.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2b4219c38359..7dd745e23575 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -12,6 +12,7 @@
>   #include "regs/xe_regs.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_drm_client.h"
>   #include "xe_exec_queue_types.h"
>   #include "xe_gt.h"
>   #include "xe_hw_fence.h"
> @@ -739,9 +740,13 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   		kfree(init_data);
>   	}
>   
> -	if (vm)
> +	if (vm) {
>   		xe_lrc_set_ppgtt(lrc, vm);
>   
> +		if (vm->xef)
> +			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
> +	}
LGTM.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> +
>   	xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
>   	xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, 0);
>   	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
