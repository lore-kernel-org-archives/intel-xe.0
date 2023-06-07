Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D62C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 18:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE85F10E53B;
	Wed,  7 Jun 2023 18:21:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656AF10E53B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 18:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686162074; x=1717698074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xGPI+eJpBwvqLCVSRh8QLAOB6zHI0uOVmW3eYBrZrAM=;
 b=EUj5JeOKR7AYAU5VuPl/jQit0W5s8kIVRYS1OtdPfzWmqC/C5S2Rhv9f
 WH/CZwXT97oUQQ7y8JAnihH06EovHTWPapkXRegosjdmWJfgH3Oot+qJr
 fUYXUfCQ4+3tAqiA8RKeu+RiQSH2p7WKC7xW0DHmLxhK5x9vF6MCWBxde
 bhgtgj6DqaLgQC+h6xqRVT1rA1aUoyC8Fub5SSM1zXG2Z/7Pxj9XPwYEa
 OgTTdUAx1CtlT1oAzCjcNxCSrLj+9BUPbyvBoB16Mw4BRNvgsaeiZiryb
 Lx9fnK552bsQ1sZIY2hv+uh2GiutaDSYmy8gDxzi7lc1bWSvunfLvOBMh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337433237"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337433237"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="660062470"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="660062470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 07 Jun 2023 11:21:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 11:21:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 11:21:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 11:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThCkallhsf9jCHvKgMP0NMWpVB46+HUmT85OVSytuNAhZooYCaG4tZPlioVPZRnfCVfevwCvcjcfrb90+zQjAhnvi3/Cg+BCsB7ij8g8B2aAfVgA+80DlF9G5orjw6Yq/jKCGAo/g5e0nXj79dyWL4ZvEwdCZoxAYdOr76WgetJ0vQHUTdJWhkP/0Dio4swpQO0nUxOuv/zuOoeoA8o3bVvLgZN55PlpS9xpgKDChlezhDmDcu0/7M9evlPJe31MdGLcYBXnkN70R/TwBF+KaBof6g+py9yXK4dDe0uTTDBMovCTQj/U5pay+unand8ejZPHlXIFfnk24p1oZssEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxl/e34vjwC8AqyVE2BV20u8jku8anq6czVu0UkL3hE=;
 b=LT4x9b9HUu9SjNf1VeH2I+Xsowr0UpbSaaKRrar6xU+65OyJLXKeQjCWYMaNp7OqN41gvzk4NvlwxM2Hk4j+ZlZGZCcK6RkwmFlsUgSF/5Cof6NeXFujlUq9psKlyzqUaYY1VuvYJQLKwLPDU4rWnR+Iu5IZIbQX/mj/X4sdCobVVPgvQJeYVidZzVcrIBttBwOURjO/CAstXItMB/IkitpFpm5tJ0XsrK2g6HAAkyOz9l2oiypvKZGoTBkKMVDQbgEXQUqJMBDXKFZ34oLk8nVCToo/J1J+xIowRD3xMbMse9gRwcw0E3+UQeq7jnk17U4rHY/kC1jbb8mIL1j2GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 18:21:08 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 18:21:08 +0000
Date: Wed, 7 Jun 2023 11:21:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <20230607182104.GM5433@mdroper-desk1.amr.corp.intel.com>
References: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230606082142.7846-1-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 819a88b3-7d6b-41cb-364a-08db6783f6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ile8jQ7fA2jwOPfhTnewJ22moLNhZDVchFAEzSDqNFJIP+Fdr484ch7cZ9/EqxRoXzDFY/9AfUjlOVaSX8vhvmMlCsmCk5MPz2Mk+EKLuFidU6r44zYO/7855AAVB+smFVt73znPwvv7FmBEKhbZ2Pyx7sbKE/NG7K+YUG1fRkHSHgEEK1GyMVC2vJr+Pu+/mN12mQp+iaKTtlmFHqPjLFKBnQxiAM6ohc8Z7Nw9VgbRYSAMkpzpEgeuTo1wBF9JjGf9NV6cUagP/PEH6tOBkb+bm9gxvjcX/9VgI0JILTaq8T8AoFabtTzDFy9vYLXePifDk0n90UkH3SOZVcTcb6I8N8w2i7BlXfoC4ZVLXDmf1xYpcl1/Y9GZSPMG4Mks7hJBeR41llnV5Gbur8Q6alxSgrEMZd54IsLHUhCDNDZs2bh3DHExKuP8mRTAackI5ZCAjyKKiXISMqeWLit7nP/WSfdOl8gVWfNKVT7JTGUinXsPS39MIapEeK693GLFQS04+Pr04pcwuawFzCqDxLLyJdaZ15z59ztBZnx+ZjXq4Xkg44sAIB3RhTx//gG5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(39860400002)(136003)(396003)(346002)(451199021)(66946007)(2906002)(478600001)(6862004)(6636002)(8676002)(316002)(4326008)(41300700001)(8936002)(66556008)(6666004)(5660300002)(66476007)(6486002)(1076003)(6506007)(26005)(6512007)(186003)(38100700002)(82960400001)(83380400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fx7qR80auMY8W6FiP3FBue4Eoy0WQ/6+qd2R5BURAztuzAk22j9pW2GZjJVa?=
 =?us-ascii?Q?D5TU8lwsFsVAlc10MGZtJzljUzU3Z8zG8slJ4czO+cFBkGIxpPKua3aptijd?=
 =?us-ascii?Q?Sj7RRTCFXCypeXLIw0kLS/Y1h4frkKnv/QR+ify93FTU88WtBT9hyDOGVcoi?=
 =?us-ascii?Q?6bGl6TnIAgRSwArt5/IutbzQWmXl/+h0lQpDDjKpqYjEZRjWOODY2ygmvQsc?=
 =?us-ascii?Q?EutXii+ojyFTC473G/kd25wOcHuNjII67SR8T5Zoa5RIpXGZfLmseJO0utsN?=
 =?us-ascii?Q?Av1w2+4wI4TMAU5TsaBX9Wv83gYRELvwatYfTKlfoFy3ILmAlvH4yu1FmO9I?=
 =?us-ascii?Q?bdhH9SNDMvkT5lUhHwWjnDc4fbceLQz2p4Gr5zHYLnAT7qB+X1LFXK+NAQet?=
 =?us-ascii?Q?HEPlIOnOREULCzshrUmFh4KYX/1rBh2BWY52Iv35NsDOVoNDW1Mfi1WBuyFk?=
 =?us-ascii?Q?e1ZgTY+ZcrR8VwaQLJ1CTEa6kj1fnclvUk7zWFl9tfyqR1Wd/5GD0DnDHE5D?=
 =?us-ascii?Q?xGM8a87t03y17vswwDStZ7mJ9nw3oXMpIPCNdJK95drySJsLhIsO/YREnv9t?=
 =?us-ascii?Q?uYitPCBhovews++z454vg1atU0zUbB25hSj67Q0lpvTlZ8D6/Rp3tAFVWeK5?=
 =?us-ascii?Q?lQ01yqPoHAu2xsMXTd1wTcEbglYuNUHwf64OX94H3UpD+/UsYs/9wRrWsABU?=
 =?us-ascii?Q?fmybC4xu7zlDZiaPi2NUtx5VILkZI0entxK6araBQcVRh2eE473RtbFmJ1KL?=
 =?us-ascii?Q?NlhckIxlRSjqR4uYtIjipnLwFocok/qwnNHWEdXc49ZPmECeHYjncSEgEJzT?=
 =?us-ascii?Q?4FtkLEP8P4pxFVlEy9nKiwz8QIejV3L5oIoWQKIbQwFvfsuLA/EN9yQwF/I1?=
 =?us-ascii?Q?iT6P6MbUMo8dEtOU+jzqk6sKojUSIUKm1MOEnaMdYbnvGrlMcymGbQfZMlZ2?=
 =?us-ascii?Q?7zex2N9Veu9RU/iwrULtbiBtf/K1SMZmxUm2KZ5A5Vp7nv+oVydb0+5YDIeZ?=
 =?us-ascii?Q?7gkoiIWmJhMeaZ9kHnpZAPbBUb/QRURZH+JBGocBE3rd+DhtuVLPy/QOcX7d?=
 =?us-ascii?Q?Gj5t1+vaQxAswUsKji38xC8y/7Z9umOc9SpYyzn3T3T061Zu5jCY2D6SpgUn?=
 =?us-ascii?Q?NdS6hojGBPkhhjkA4Qdk9TSNKFIgBYrBEBjfjtgpM+rHb4OQoogg5K0+kD4Y?=
 =?us-ascii?Q?x7+R+bkUtMThFL2S+3fC9RT9PN5Z4GF1480bHDUVOTytnsL48MIlJbxOyg7i?=
 =?us-ascii?Q?HkA9MMIVRUdL/U2xYBU1H3++AtrWSCBNEcVla5Qhzxzys+xZ8Zm77+J6+z5c?=
 =?us-ascii?Q?X6xcWNemQcuXwdM97k8UAOWo732mQREaFY4ghyczY9hROE+/EN2m99anUfk+?=
 =?us-ascii?Q?Eslc4oibSm/NAc8qGWrBkc98gRVGIohcOl0NOvEa/jFR7lfAFIXEyRRzI9z7?=
 =?us-ascii?Q?Isu8nL++obaVglt1zs2t4xWO9XiorkDy0OZ7X4CvLnhUsPhdpQqkVv8/gVwR?=
 =?us-ascii?Q?2seHct2YXJlf7jWqtIS4MmfIuJUWmeH/fVVCVTzFu7Fs1eedE95OTjqe2KVH?=
 =?us-ascii?Q?7DNlocA3jBvh/LdF5oKnczlc8zuclJgoU2u/hbmZrPyrcm0lscMOSqqza6Ay?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 819a88b3-7d6b-41cb-364a-08db6783f6b6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 18:21:08.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpvCN+Sged7+WPXd1FGf5gd5rPA1YcwG8j6qT04+eBml+zifW3TxITwsJtP/dfkTOI3xihahVmwhLOQvrVHBxi+6NESJyvNSshRVjA/3UIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] [RFC]drm/xe: Sysfs entries to query fused
 min, max frequency of lmem
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

On Tue, Jun 06, 2023 at 01:21:42AM -0700, Sujaritha Sundaresan wrote:
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  7 +++++
>  drivers/gpu/drm/xe/xe_guc_pc.c    | 44 +++++++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 8be616a1bd51..bd7b26296402 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -101,4 +101,11 @@
>  #define DSMBASE					XE_REG(0x1080C0)
>  #define   BDSM_MASK				REG_GENMASK64(63, 20)
>  
> +#define   XEHP_PCODE_FREQUENCY_CONFIG           0x6e
> +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0      0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN      0x1
> +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> +#define     PCODE_MBOX_DOMAIN_HBM               0x2
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 67faa9ee0006..1b349ce74c3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -453,6 +453,48 @@ static ssize_t freq_rpn_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(freq_rpn);
>  
> +static ssize_t freq_mem_rp0_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,

This doesn't match the #define above (XEHPSDV vs XEHP).

> +			    PCODE_MBOX_FC_SC_READ_FUSED_P0,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rp0);
> +
> +static ssize_t freq_mem_rpn_show(struct device *dev,
> +				 struct device_attribute *attr, char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	u32 val;
> +	int err;
> +
> +	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
> +			    PCODE_MBOX_FC_SC_READ_FUSED_PN,
> +			    PCODE_MBOX_DOMAIN_HBM, &val);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= GT_FREQUENCY_MULTIPLIER;
> +
> +	return sysfs_emit(buff, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(freq_mem_rpn);
> +
>  static ssize_t freq_min_show(struct device *dev,
>  			     struct device_attribute *attr, char *buf)
>  {
> @@ -631,6 +673,8 @@ static const struct attribute *pc_attrs[] = {
>  	&dev_attr_freq_rp0.attr,
>  	&dev_attr_freq_rpe.attr,
>  	&dev_attr_freq_rpn.attr,
> +	&dev_attr_freq_mem_rp0.attr,
> +	&dev_attr_freq_mem_rpn.attr,

If these are related to LMEM frequency should they be in some other list
that only gets created if we're running on a platform that has LMEM?

For that matter, does it make sense to have LMEM items (which are a
tile-based concept) under a per-GT sysfs?  Or would it make more sense
to have these under a separate per-tile sysfs?


Matt

>  	&dev_attr_freq_min.attr,
>  	&dev_attr_freq_max.attr,
>  	&dev_attr_rc_status.attr,
> -- 
> 2.39.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
