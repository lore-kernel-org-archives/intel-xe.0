Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1748FEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 03:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC51B10E3DD;
	Thu,  6 Jul 2023 03:52:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9351310E3DD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 03:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688615539; x=1720151539;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rDyZ6bgd6cBHik6XpYV6OuWJQdD24rS/ZcUQT2KDlEE=;
 b=XSXy5wh6Lnpsnx8xj/BMTWKV8RCfc+EfuAv1TidNbLEnbVFh/ZoZNfOd
 UxwMpR4Hci/JZe49/ba1UG/aEP/RfKGLrihr5JAF4aL8hFzW+Sr3wsWBJ
 aoGKAYJcmmwpP9n+T2nf+HeQL8OIVEkA0X8qbi6nHsuaCxskBSvt0QoAn
 FPvQKNrVp0CtrO1kgFi4cSbg+JQd2g8ecDAIrB2EE4hoGcW6B1HQ11aLn
 T741PTGkUdrKNT8wRoWd+LcIG8PvQ5RyxFPkFI7FyIPMlydu77gA/DNVh
 Lj9jEFayxEox5BiKd+bOcLkybkGbmZ2Ddfdkj66+FDx9ejMiu832dxprB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343826639"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="343826639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 20:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719457923"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="719457923"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 05 Jul 2023 20:52:18 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 20:52:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 20:52:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 20:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9TJiMNFzvBYl+Z5L/5UYsR/zfC1EKbJmoNnqdnJlgo1ruojmkNX0bYhqnWPXozQIc7PmX8/46IS60lvPCj8KP3D5x79NvstskjuyxIpojyZZDskpvv4NC+/3TsbAPZENKDBeT5cj6XPL94wpL4R8sSHMtvlaaiFoNU0CY29JYnYAXOZSUW5HqBGVlZP7llDs3WQ3igCfnDehI+DqzhCWgDrYXeRRYFkbTh7Z7JWVEnh4sTIbvWZw2VIiu+IbLiHP9uT7/lQQCXzkDFEYcq5qnJVMJJOBb/mkoPXxCJHa/JavCFYxtHoUmc8Wkbv67fbjxujukkTagHKUr9CZb768g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dT3WiICGe6MmsHFj4FYbRwtx5faMY/8Iig96A3MNrQ=;
 b=Po3mb+iQ3zhVPy1cQ8Bu3gb4ZXdq9u+rjbkB9jeSaUkfhRHFJPDvFPK8ixy8XEfKRl0kMwLwXrBqAdvqKq3N+snRz7B/VcCybwvi2fWi9CHIly4q1DfGd4Ffx8gIuyqbXXG9AYa4Zhu04ndsBiE1oQuxIkj4WeFv9sGoLEXxK/EViqEoOwzclURmQVbZUopT5qqhJmEzuGydul2E0cRvuFBAXQKqdDh0k+pMNtmS+gCBpVF6KH2NVO9S1hmCvdQUJEURZfbRpwKsikLBb3RvLZnVMlVpFaUjcaU+vyTLf1ceey2o4Qtrm9NUKngYEX+3fYmK35cw/YgeH7RdVLO05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 03:52:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 03:52:15 +0000
Date: Thu, 6 Jul 2023 03:51:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY6SHpACikaNmET@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-10-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:a03:100::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f0c366-8fb6-47d3-8269-08db7dd462bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZzY+KRwtwrY7JGkVahC3+VOznpMG1G+bfdmhzEt158MY+vOSEukbqgT3VqlsCetx8pXYdjlGuxq1q+DuF8jhOPIv/TbRy9mInVhHDkZzu77qkQOj1Yi66GbVXRxQKpVi52VSB+MqB/PuJqT4VjYp6+8SqNmCI7BWZpXJbD92WyKcIh4kUkqKVmbdo7+Xr301usnYRV9JlGvZtjUylcFgoJgpgVryWsE7/kYi9vGsNjX9r4LVdi2qywFc8Hh4sDhS95NkxjZnQwIAb8CcDqJEG61rnzYFH1uRK9qCOiq5kX5uT0zuczDfZ+PCcF5HcyKXSzxVazLQ3FMMlr40TbcToltE3kftiVO9ZJ159qW6KzDRL/CEnfmuOZ59cMuUWXeqIQZAjFUIyaYaQ/6RVCA5QEMywn98mkETVmTEM7VWyxq0lMFYvsLz+lfP4oelJq1E1m5W9k6pl6YXPI9ljlcSizPlK6cAH5N/2LXnhW45cAb3/eMZ3v+2+Bozj60dx88D0HxT1o/wnahdsCpeke/Uxr+MysN2v3RPuqan1d5k/c1DMsga1tB8Vh/Gdzuiuq9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(26005)(44832011)(66476007)(66946007)(4326008)(316002)(478600001)(8676002)(2906002)(6636002)(66556008)(8936002)(6862004)(5660300002)(6506007)(41300700001)(86362001)(6486002)(6512007)(83380400001)(38100700002)(6666004)(186003)(82960400001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uSKLVYHh0xcfYaL7lfGZzT1om3UA/DFpp++LE1pIpKgTjeYhj1WLgtJICK?=
 =?iso-8859-1?Q?rNdwkjfpd3MqX45NGs94vSSbSx6djAfQK+B7KEq6MxG35/Rveww/Hz0uza?=
 =?iso-8859-1?Q?GebVtB7lYaqjqK1P1GBYMqCjHrtLN1L+LEIqrt3TNDBqNoQcmWJxTxHasv?=
 =?iso-8859-1?Q?/5yC08k5gd4W1XU/b5xu7i+frDLvUDyFfRp/FBk0+UmO//3O9dEr2bME3P?=
 =?iso-8859-1?Q?Ai4KtQMH2JJfixtp4R1vYMtpC8DFxOioPusXAPfLspeV62CXtXKbw6Rjkr?=
 =?iso-8859-1?Q?RN6a1UYZiKchywnCjoLR8Z4/d5Z1T9QsO9kW4W5QvTbaZOTCQn+MlKwGK1?=
 =?iso-8859-1?Q?XOn7a01HZTQ/kpre+NNE9qKD+xKlGBMs+mFSCJyeHf+FtJxO3p/0qD95/p?=
 =?iso-8859-1?Q?ZSWuybn4oCM2oByfQVMhDB9brYlWJQ50BgE6gZqzDLpY+/zUA2ggwdwwk+?=
 =?iso-8859-1?Q?xbEyszt1JjIQCPE2BfVslnoNfS8GG88BA3WB7jODZqaXtIJlXY9KXTkKht?=
 =?iso-8859-1?Q?hSZfymELJL0r4lJW5+hij1otRVIHUxaPXZkBVBvN49uHqqLW0WGAOllx/L?=
 =?iso-8859-1?Q?N+lffFHxrJ6cD/PxPQ8+FLnZ1dbaTIUMn7NG6qlHTYynNEzSReApGL+0YG?=
 =?iso-8859-1?Q?LTPt/+tkNgUslmULxV9oau1ewLS3hmEMp3DQBMM621wloaTpkVw0MNLP0m?=
 =?iso-8859-1?Q?Gz2QsV3LEbp36Wo3x8s2C357qsIOasrQABBfg2y+wo1MsbwMYXpF+BUtMY?=
 =?iso-8859-1?Q?bL3Eb8TbiY1RIaLcxM7lSQ8g/gsaMiiAlBaxsxCp9c/YSknlrO7/5/LleC?=
 =?iso-8859-1?Q?rl32p0AdDfgVKNF9dmFrN5i5KroQB+gLuDpg6xCpIvlf++bZvi9HaDZKq+?=
 =?iso-8859-1?Q?jMG9b+WKCkv3QSwvrgfDOVijkcgM69JbduEBRfpFQz9pzB98pXHoEkxlJs?=
 =?iso-8859-1?Q?DrrFTudXXMXcCtyDCDkdgK6XxAHPWANVm8SZ2WThtrXnmzna3ifmrC2xaw?=
 =?iso-8859-1?Q?Fw5CovW2SRFy5HBT1zDr9Qa8jZUyVrLNAkevXflicdUr3LuL14lQTF09f0?=
 =?iso-8859-1?Q?jBaB3pXkmvbl+DxGFvim/r5cbPKSXRbwQFGzP8gKVClq6BjcZpj5v5b4ZI?=
 =?iso-8859-1?Q?0t0WdV7lWUv66SYm/JTmOR9nB51hMhI2vw6L29vuiAQGYKhMUAMI6QMkAR?=
 =?iso-8859-1?Q?s9xgtzoPeYA1fRVpO2ATe2pJSvok1UQKQeA1iwE+DAlMppkaRg2n7HIj5k?=
 =?iso-8859-1?Q?mqcEdAWf+Jn9FfWGiokzCWtf6jzUMlXMesy+Ii/FFf+NxYzJI1TMKDtsRH?=
 =?iso-8859-1?Q?RHSCwEdjwisVocG6rI/KgAXB84PcGAbC14N1Xr0Va2vaQcou2eaVHajCzh?=
 =?iso-8859-1?Q?/jHTDtZw54G/q4BB5J37DczJOeEf0bbg7V57i3BwabD5iJSimIBwh0KGfb?=
 =?iso-8859-1?Q?CHdI3pBDBk8rD1DMsfOEDXwHLLzjMKIuywklUGXvVrlldgA7xfKf4PPtji?=
 =?iso-8859-1?Q?nU2qEQcpgfBCgtFFE7O5uU5gnhCU+PMEaPAAJE2j/GeW5V4nmkUdOgW03U?=
 =?iso-8859-1?Q?vnVqKXPqt98g5wsNGq4dTWAjISRkdoFE3ndJBysLVX6uO3X7P9pPnbsUN0?=
 =?iso-8859-1?Q?m4RzzSLPjdEu9YCoRxtgAGbWvZbmanUzw43M93bTzPPh7LvMubbAvtJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f0c366-8fb6-47d3-8269-08db7dd462bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 03:52:14.9456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TBy9mJ44Pl+lUp6vL2RghawVyCfxnmxYOYGC+UUfQec0cMps8NhSXF6IaBzRFyf2DGgPKH9iIrumRGhw4Xx6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/7] drm/xe: hold mem_access.ref for CT
 fast-path
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

On Wed, Jul 05, 2023 at 05:06:04PM +0100, Matthew Auld wrote:
> Just checking xe_device_mem_access_ongoing() is not enough, we also need
> to hold the reference otherwise the ref can transition from 1 -> 0 as we
> enter g2h_read(), leading to warnings. While we can't do a full rpm sync
> in the IRQ, we can keep the device awake if the ref is non-zero.
> Introduce a new helper for this and set it to work in for the CT
> fast-path.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 +++++
>  drivers/gpu/drm/xe/xe_device.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 07ae208af809..94b0089b0dee 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -412,6 +412,11 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>  }
>  
> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> +{
> +	return atomic_inc_not_zero(&xe->mem_access.ref);
> +}
> +
>  void xe_device_mem_access_get(struct xe_device *xe)
>  {
>  	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 779f71d066e6..8e01bbadb149 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -138,6 +138,7 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>  }
>  
>  void xe_device_mem_access_get(struct xe_device *xe);
> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>  void xe_device_mem_access_put(struct xe_device *xe);
>  
>  static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 22bc9ce846db..b7aecc480098 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1038,7 +1038,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>  	struct xe_device *xe = ct_to_xe(ct);
>  	int len;
>  
> -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
> +	if (!xe_device_in_fault_mode(xe) ||
> +	    !xe_device_mem_access_get_if_ongoing(xe))
>  		return;
>  
>  	spin_lock(&ct->fast_lock);
> @@ -1048,6 +1049,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>  			g2h_fast_path(ct, ct->fast_msg, len);
>  	} while (len > 0);
>  	spin_unlock(&ct->fast_lock);
> +
> +	xe_device_mem_access_put(xe);

Can't this sleep if would go from 1->0, i.e. can't xe_pm_runtime_put sleep?

Matt

>  }
>  
>  /* Returns less than zero on error, 0 on done, 1 on more available */
> -- 
> 2.41.0
> 
