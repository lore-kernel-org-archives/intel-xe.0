Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F4DE743CD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 23:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5B10E008;
	Thu, 28 Sep 2023 23:15:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29CD10E008
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 23:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695942951; x=1727478951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nuh9oDXlLzxjRsFuEf4ZYBxUWKD0X2RrLuQHkBSP98Q=;
 b=M4mL+r7N6WNOkofkaQ6KWHrCV5g6XnqLUof5W3QWwArqoo9Y1i1QWYKN
 /6rVygIdbNXmTE2jO7ZHJovRHgkoTNL0P9D0ari31mo0zouSA7UMAlRYN
 H2drl+L4zNBUoI/8xXthiLmQl1UuMYOLlz8i63OvtODfd6Q/L05ARPp2Q
 /zSG89xxnKeNBzf2aJLH87WjqOELlCv6GPjxZX/OKOWz2IH9FfzRiTRHu
 37CozsgQ3ZqkjLw4hffOW44nb/Eq3gF6shgf569LobNntvVb3mYrvR+iL
 ixhxWLIvVG0SD+gTuMS0So6itc03BfrXnHA/T5RGipkuTz92kZ6LH/1sx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386062961"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="386062961"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 16:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699460590"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="699460590"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 16:15:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 16:15:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 16:15:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 16:15:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 16:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLMwd8WTdC3ikr6TNdk71cwS6dILIgmGdq6nvkSXleWaTWRZvi3I9ZLbQUB+3zlC9yrCq3JLdsIzcfnf6uagcX8To3vK3zsIOGUEP/aSP81O9wNdYl/SmTen66XiOi4K+7mP8/48GkZeGPz39ivtn3jTn8M7Iy+X9p7HOWJKZvgRsdrTQS17MQR2DxBHKDkhKF75T8QYlXcs4vrRQ3BzB99fzbfQJDRFfJSUUJvo/2vvjKYkNN6vx7nQ4b54uYTp+F0BQBIEIxkMRndQ7xKihjRfJHx3Cv7Z8IeYIfirLOu0qXIleW8e4xs/263BuWM6AMrEHxuOesmwCi8JIz32wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brYrluE3l2FsMf5u5nRE4U+g+oPIJ2TA85Krcb+6gEg=;
 b=EmJO1WigNXIH6Sx6Pd/WEyJ7BO7o7kNf6goyLi3imD/uztgNFxeoFL359bJMC+QIxNkbwbCzs/aQOnwm46pKs4FzAElPz2SXrYDvStl4SYDf7I/LAjpKs7Ok9EA45Xg8eMJC5kk94YkB7nZ0QVzER1IJdB4yXwGEVfuN+tMD/Jz1t1ejQTcGCjL5VeyoHT8WpIGbf6b5qURSYGtmJ7W/RNbxDn0WkQGWV3ZI8jqMclTRtQOTW7wLQIv9UnN1Kj0IvPUDkLgfCvGiugYLyoifv9P0i0/trZpXYwMDnPqH+bqDrk71JODim91M1Ar0f+rOsHXijTXMCkxh+I8SGtCrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Thu, 28 Sep
 2023 23:15:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 23:15:45 +0000
Date: Thu, 28 Sep 2023 19:15:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Message-ID: <ZRYJHWMqjNV5H2s8@intel.com>
References: <20230928135621.308271-1-osharabi@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928135621.308271-1-osharabi@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: ea01e46b-4d24-4b89-e3af-08dbc078d7d2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OEVwj4t4b4foK3dxVmwTb7E+nagcnNu0Kat4Z1kR6Ux3B2QwHBj2kXk0+s45DanAyryUl/a9oiwpwgSGZHJv4o+l8gtx/X5SZl8x1texkXgYxHQPUYHTen38IlrjuVlbe0CXQnQ4Z+bPHfDswlJmdFDdifm0xXj9mQvznkA5RMuSWyuvX2NuIfTJINfvIKW7cxaQEexT5U88uknDcysRJ008PRB0G3RmQhvzQn5Y8ug3wdQNvNZCmHIbi4tIbtMKcSARrV4Qd0TG5JnU+b4adxwHawhIA4wttVB6J6YUU0ZlGxy2OTxlNdz+Swi6xr7l5gAVatrRtxfUnbLuiI+ptRVeLUe4e9arJcSRuJEU0DeAlDhKeBHHip1ArQSB1nG8DuL6IRhEOwH1ZF9Gqnn4VymVqGSKM9di82IKwT5rmpTrEcsDyTyxKAcz2lk0A4r1K1PFD1RG802/hCcJqnjgVLy3thwftFPzBQgr4/xDeuXA65U4xWbkqpzFFY9Xnsk50W4Qdf5XyioYDAgz1EaFc9QyzJ1Tb09DAcQ9u9kGj9mPfosst/QKEYAv4Zy3eHup
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(316002)(4326008)(41300700001)(8676002)(66476007)(8936002)(5660300002)(36756003)(44832011)(478600001)(66946007)(86362001)(6512007)(6506007)(2616005)(6666004)(38100700002)(26005)(66556008)(82960400001)(83380400001)(6916009)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?98wigyrWVI0StEk4qVGf6FMeT5FvudXcK4XhIsEwWXwikkwoMBjEx95UTjGf?=
 =?us-ascii?Q?pAnDdDFeoAMsILA8mdt4VvYlPQC3M2nYPi4J5fKV0oAJnDCLo8Lq+P0YORkh?=
 =?us-ascii?Q?MTciEceYzd1ukltY/z2llnpq2GiK5y+0d7IygxLfpkaDhSckJZqy2AkOwvum?=
 =?us-ascii?Q?ORc4dN5+WgUKF/S+vaZtVdlxT9ZqwM+fRHPeLwEsWxMDhYKINiqxGAyq12ji?=
 =?us-ascii?Q?NqVkdp20gt55D5rP7mbPmlS9YZCdUz776TjMaUfopSvzv8FGM7qnXInu3/bd?=
 =?us-ascii?Q?uaUDCyYtyjxnbcvKskj/kM2+9z2eIXFoDcH8eF6qMFz2ZVWL5AHL0PNfk6XE?=
 =?us-ascii?Q?It3lcam3S5KHCsNgnTmTjUaZ121JuAK0R1sNGEswhPKqfqUaaeyuz5cgfdDK?=
 =?us-ascii?Q?IbdoIqFQ4F2TI27IJAdBmO+fRIWUzlf/jjCD4KfUxuUrfolp2XlxqrAbdNrr?=
 =?us-ascii?Q?ySNUiwksHPaNx9iqZoSGk7KFC/qaN2YR7jql7iE3RhljapyYUrQbhQtbBlME?=
 =?us-ascii?Q?Dq9EcvBH4r8twOfkK6dPRFD3NQI7vuh856r0xxOjBWFZpTYbWkmtWcodgESb?=
 =?us-ascii?Q?aJnRJr1gk8uJtX/yuGYLtVQFhC/iImjSoRQturBB0Lp/zugw28kx4s3BJBua?=
 =?us-ascii?Q?mgDuGaRTlsRSZ5QAd8NEVVl22NZls5Yc1XMsBkbvXJ8RNSTeRHnHE6567Pqy?=
 =?us-ascii?Q?s1H3oxEeBOiDjNOQ1EbLD2kXLothL7OsE7KBR2H0Yz3N1rwZs5R78HFcJ64s?=
 =?us-ascii?Q?PUAP+1IGZqtu7V8+heIntywN40r1P5G2b/BPwizhHFi0ecPJEmxSx9G34AyX?=
 =?us-ascii?Q?98b4Rh25NTjJKk+kO0LMlI4I3n9781UdUh9CeY58an+GB/xBqRyhYhbioVJl?=
 =?us-ascii?Q?GS1V4QYeCmvUaD4vzB06xshTXXGypCxKwKJJQ4Nr5MUqV5JsoeaBbBLAw1IF?=
 =?us-ascii?Q?K6Smh3g4bhw7jx71qODBomu7XinJX9z7WdbwOKpUFG1SEdUhUqep+Yic2fgZ?=
 =?us-ascii?Q?1C82mIT3i4sxvU4Z5fli6A/s5LODdSmO6JWGrz2XmRixVMBQkqHIShv+5y6X?=
 =?us-ascii?Q?MIssCZ4LQ1X5NRpJwYFHjaY/uqHHeUg8QXcbiPfT6dO7P84oIv+Ho7jRiBNQ?=
 =?us-ascii?Q?HQ6yu4d53ruu47PexBFTEr9fq/Z465eXjUuY4ZrDHLUr60Nm/HD/s38Xz2wm?=
 =?us-ascii?Q?LQgtuhO/Mlz+Ka7S2QHZfudBq9/sWriUMEenSDm8Zu9+gr/80xLH8asVJyYs?=
 =?us-ascii?Q?aW603743tyP7Eh7OtwMQOwgvHjHzBU9+bYvmMOOQdNQbx1NyBeFZQBwULrNV?=
 =?us-ascii?Q?3R1HXMaZKNshzDAcBVOxIr9IQqMZJ15yuvrFVQ7fKWsLNsiUN+KOFfhg2l/K?=
 =?us-ascii?Q?iGO5T0i0Vtm3Crmzbn6PYjrJzGE+W5+i021vOMpOUNzcVobjgA8SmZKg7z+w?=
 =?us-ascii?Q?RuFTDSsIl6ShAzQuC+rP0STIfZpPocBS6liZIci50h2aClnTlyfShRctQcrP?=
 =?us-ascii?Q?zRHav/MzUjkXWJVP1V6EqE2hM0C5gaDbzZpQnsgBXH6b9R+ESLWXyVW0aQDe?=
 =?us-ascii?Q?Aoul8OyVPkNuA4pKF0VGlWkLt0ZPPGV1OIypAR9k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea01e46b-4d24-4b89-e3af-08dbc078d7d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 23:15:45.9446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3clHD1dFt/Y5TrlVI/FbGZRj5f5n9YsP160I97IiOBHbEjAQKCT8wEKPre5p8hlklI9DFkL7YEEVScTtcNoXuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: do not register to PM if GuC is
 disabled
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

On Thu, Sep 28, 2023 at 04:56:21PM +0300, Ohad Sharabi wrote:
> When working without GuC (i.e. working with execlists), the flow
> attempts to perform suspend operation which is failing due to a
> lack of support without GuC.
> 
> If PM ops are not supported without GuC we may as well avoid PM
> registration rather than returning errors from various PM flows.
> 
> Signed-off-by: Ohad Sharabi <osharabi@habana.ai>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 ----
>  drivers/gpu/drm/xe/xe_pm.c | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1aa44d4f9ac1..68cd9a7ee087 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -641,10 +641,6 @@ int xe_gt_suspend(struct xe_gt *gt)
>  {
>  	int err;
>  
> -	/* For now suspend/resume is only allowed with GuC */
> -	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> -		return -ENODEV;
> -
>  	xe_gt_sanitize(gt);
>  
>  	xe_device_mem_access_get(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ad3c08c4ff22..e31a91cf311c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -167,6 +167,10 @@ void xe_pm_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> +	/* For now suspend/resume is only allowed with GuC */
> +	if (!xe_device_uc_enabled(xe))
> +		return;
> +
>  	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>  
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
> -- 
> 2.34.1
> 
