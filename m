Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCF4C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0513F10E1D9;
	Mon, 18 Dec 2023 18:58:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA410E10A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702925864; x=1734461864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=in0HPJyxjR5l/p8U+jpiTK7NS2dCVzKxu4JjSLNFZ08=;
 b=N4C5jOJVLwf/HYBL1wJIm9u2kGJ3gQSjHVdqf57mocOHv/bNwA6A8lXC
 cA1n4ccdO/qWdYkbqewQxGQQbB7q5tEKF/GSFHBVxFjCq8eMIw+zjIi9H
 MS981zqDJ5Fhkl2wYW0gACe7+I/NIyLrnh+G0Xq6sLX5TCSyORwv6Bphf
 usyPvaiWiquWQkds++b0/ZAAraILnR70VGhHem8hlA1dJCbgPIqf8rUA3
 bFx5FZNRcszJNqQ8y21MxQ/hQZII9y56PqgfTWb9RfPqJKRJ4nN5fU9Dx
 1bCRJ/8w/czaA8zKXJe8R1PVxINJYNCPrSoHDA0uPcJJLPM/UyUEkE53G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2382544"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="2382544"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:39:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="768896665"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="768896665"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 08:39:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 08:39:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 08:39:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 08:39:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 08:39:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbcu0CQi5ZYHkk3aRxLqavAbIb31Hx8fab/Eqi2A/4A2VJP2CPI+RnFm1hmA17/5VLjrcuab0EzmsKkUggoXbWkV55TGRnJod5lSEHKuJ8nTSqatOLP7JK7cndZF/63pSarF2kIBYq8fU1Rp05BvhsDXYTEqr1SjnCaHdxi1ipTDnO5V79qiQeIKRvY5LEDQXUPlIM15gEXSG5+22Z70u/GBOOymYoX0Pw+nn9NUuQwWw+RpDGzOG0bPWz6apHQ7mTKHLXJL3WbrUbLEzphXVhicrZVqpSZ5Aeh83An8JPrben35wLdn/v+0s1eLi1fGEqBjMyHdm0JgIuQaNvjXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcEeXcT8XhNRlCR0R6nIvdVOhlRR9uqQMJdfiZ/AXEY=;
 b=n3oi6a5AAGZMP6oOQYGguOoplaeHrhNRm0R1VNvgP1+fYyaAZBAvqW0yp6DllYI1SIi/btEbPcmxeG3Shgtf8YHmcnnbZwelKe4Q4geiD8p8/6cNou/LXyQE4vmbFJmZs2C7dT8zMkvDu7V8h/f9aoQ+Rebsd3m5V8FxYufuNUeZMJAsWyengqYRy3bYesbHB78vANdu5A6NmZtkbzYxDMAi2Hh08FflEgl4cBuL0jn5nQwZ3TFomsxbqjWH4LHmpY9CYKJEJEWZr5OsslK4w+TOQY0R5VMtrvFuJ/NOu395GtmZk+ZSogbkpcq9/Ao1vTgUhJnp9DQ0Sdjj4mBAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 16:39:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 16:39:21 +0000
Date: Mon, 18 Dec 2023 11:39:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix warning on impossible condition
Message-ID: <ZYB1tW5ffy9KEo07@intel.com>
References: <20231218163301.3453285-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231218163301.3453285-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: a814bf06-03e6-4859-8170-08dbffe7e29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHVSEdEBjG2cqUsmfyK3+FsuLnfiDLYsE677pcR+FALES+W0AFOBh4lliATcGSUtjHDnrJylVgF2D5BS+guZr2S8d/EIb1jz7NcbIIsQdSV/lM8K+ry0ywswM5YvYPak9bgnOxV6yzQh9MsJY61z9FpfTplPiX8gnl7DPysnRx/zuA6mk6fls5C/W7r+lyv0kfEbgeqW1/ip7DNaA/HvSQd55X0HKQG5yt/lPdKir6T6GL8ePr5aCLZH1v6WUqd+TOQA8s0MlOYy5lY7+ilA50BjAKrS7DthS5nLLdquDc2d9+vK6kQy+FCI9vC4uvn8XAQaJBLGEi/hbSsjv4KpTHvKbdj+uWe6LZKaXONVLi9DHJI75q7PdJ0TWdfVrF4RslUvdaTEZDLo5Psh0TNCTFBjiU3eusNLYL4kIBKufAQd++zmCJoao08JZBnwyqzIFbNX14gd354+mnOtZC6D9WNwj94y8oiN2zDNPA3ZUlHfMC37bzAhwYsoP/P4ZMEqLASEXGv4bTaVGK5xTrOmUxeOp7tLTssbFcNhw9qXqe8R2qJA4o10TFb6gQbyrTO13l53dsj4y9B762KIOwYf7EoANt+Z4cW2BwJ25iP+6O/KtqZw1C8jm+y3m2M9Ieem
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(26005)(2616005)(6666004)(82960400001)(36756003)(86362001)(38100700002)(83380400001)(44832011)(5660300002)(6512007)(6506007)(966005)(8936002)(8676002)(6862004)(4326008)(66556008)(66946007)(316002)(6486002)(37006003)(66476007)(6636002)(41300700001)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mmBQlA9Fa3jdYBxV8b+KV/SFB3xI4zSlKOvBU2WR1O2MsMz3q5ejYGe4wvZY?=
 =?us-ascii?Q?E33OqXcRWbgzBI3ev3+qFkllIgTv7LUZrCu/Jjldi7aOpNvhdEhKejle1jwg?=
 =?us-ascii?Q?ZgeAMFe4glxX5F+i7sQ3Ru3aTlUWFhiSEKGR05uXieOlovg/frC/sBE9BGLN?=
 =?us-ascii?Q?ivI2kfdulMlgzi9Wiv1DW/zfmDtFFA3Gk0X0dZJMP8aEE9aER/If5jDhYdBX?=
 =?us-ascii?Q?axgF6OG8ziQsnxkX495YS/xFNlpj8K6WBAo2jQ3WyO2Lz1VfIB1kysbgdhkh?=
 =?us-ascii?Q?X3iLg+nqkfc+t4A1OVd+/Jp+8rMVnV7TXfTxRS0D+0r49kbUzjqSvqw5qAA8?=
 =?us-ascii?Q?Lyamvpqh8s3tYVpXrS3N+kPGsUoiRAvuJTA2sgGV0gdiXub07B6IAGSKxcwL?=
 =?us-ascii?Q?T5wpzMjkaHroBBLsc/LQwfLrP7Y8nhjQivcJSwP0ic2USlNrosRCNOD/Uv3W?=
 =?us-ascii?Q?MvtztcuNy5LVkT7SYBHfRxminvSrrjHIEZwdhuFU3zEeWWbvBFbQQWKpUXGd?=
 =?us-ascii?Q?mdVtcCnz099a24y4jA45WKG/6g9WCgRQI8AQfu/oF4tBxBS/wySfz1Zb5ysm?=
 =?us-ascii?Q?UMN0OAOvLcA/DjwkDmHm1y6bA672wH0fbDUsN4kYWrlawKkPagbrJnxUMc1Y?=
 =?us-ascii?Q?F1SKN9jnsEGJs2dA2QTVAJSNgxJdjn0FPKQITF4Gm1WoDHelVOIfa/7UijGE?=
 =?us-ascii?Q?HVdGQ+n9VdkBfC4OVMR2d71D1KtqR3QuH8RDd8Lg+lF+JhjRg1S378C3katY?=
 =?us-ascii?Q?IO/ffaDPwwx26jhEE00cqkGIQ0KwkVk4dw1Y/A137C2jYAxReYdX1Va6ZLXX?=
 =?us-ascii?Q?8z/6T/rw8CjM+41+d7+qKwUw1L+DaEvzWMuOT3YbsOy+C3hz8AK1c8fSUb66?=
 =?us-ascii?Q?3KtwQsRwFXBl/QbFSJAxSwDI+k2QIN0R8BiZJnhx/2AOjrmIs/3pWoeQ4T25?=
 =?us-ascii?Q?HjB+sDvhs8PgXVxogQVcC/R5mz48x36rJlWJu52RxbYgztniJksLDY+2OmI7?=
 =?us-ascii?Q?kLJ2SsWCvfVao2xoJvIdn33RfXMkw9CYPjEFepKzj/eN9XCoLfvqLhgAMwZP?=
 =?us-ascii?Q?XwUYFRx7okJzxNjkq6CZ5cuuKbMHiH2Qe+rhR5p5XswfJJlEVSrwRqxHkSrZ?=
 =?us-ascii?Q?sNOfI5FH2Yyawg0vPiFXaNktFfgoiYjhm2rK+ZmO9DCCTD9T7NdWYzhDV/eC?=
 =?us-ascii?Q?thhKBaz5S6ksiPvluwOqiA7SqhOWvvhYmh0mlQHdTH3EVQtmm18pANXeUxZp?=
 =?us-ascii?Q?6IYVGDlXE5xhXbdO6zmr+M2qWKLTcaw1w3hDBLpPmagognjC27mXq2U5yDyV?=
 =?us-ascii?Q?7IC9UfyR/2ORsOAEArlinJws5gsFz0dmWTPP2oY5TKnSwFMaPIsaRALtugM2?=
 =?us-ascii?Q?l6oMW/mJnD+jc22BR9pv3ejHRjJr48TEU3aOMSPTJKD+fItEkCGjf0scKzWk?=
 =?us-ascii?Q?cKDdOAhkSf+na8tR6Wh7v3KIpl/e0S6jr0eMG8ISG2UERXZLLJlfgu0alTw2?=
 =?us-ascii?Q?YySoDy/nG7RTrL64BVC9m0K2YzSj2qiZHcnGdVTGVOrUFvXdRceKcTSUVbJy?=
 =?us-ascii?Q?M6my3WZImLf0sZVRoOXysAMb22VtsII5RCGmjRaE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a814bf06-03e6-4859-8170-08dbffe7e29f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 16:39:20.9798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF7fV5/Id7NorctTgKCDIptmrANCa+1/2ueNOJAz1S9l3jQ/mf7BJlreS8LwMdoy5rHDgGjzHCvoZ3IuXSgZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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

On Mon, Dec 18, 2023 at 08:33:01AM -0800, Lucas De Marchi wrote:
> Having a different value for op is not possible: this is already kept
> out of user-visible warning by the check in xe_wait_user_fence_ioctl()
> if op > MAX_OP. The warning is useful as if this switch() is not update
> when a new op is added, it should be triggered.
> 
> Fix warning as reported by 0-DAY CI Kernel:
> 
> 	drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index b0a7896f7fcb..a75eeba7bfe5 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -46,6 +46,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  		break;
>  	default:
>  		XE_WARN_ON("Not possible");
> +		return -EINVAL;

your solution is indeed better. please ignore the one I had just sent

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	}
>  
>  	return passed ? 0 : 1;
> -- 
> 2.40.1
> 
