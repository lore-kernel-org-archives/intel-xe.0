Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC4EC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE6010E188;
	Tue, 28 Nov 2023 20:52:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49810E188
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701204761; x=1732740761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tzQ5lS7YH4jaB4tq/euqjXFnUZ2cZaYiPyD9TwLa3M8=;
 b=RIG0Puxih9ifRdmFGVHybbROZjogSX0BSCkov2LYCkqzo07mNHWMMgtQ
 hvP7XfD3G7RcXZQwEuOwTrAOsTnrn8M+RjDxlVF6koiiiLgaiqazDlcbt
 kQ5lTuZSl5l9x/RAWvDt4ohoZ/TAxp9Pgh0f8U2/kjMEh57Mnyv4hKaGK
 n98+UmoInCEVN7Y8gtMksXpBgwJF7zua+z5jETST8dug26B0VRhyWOMQX
 oplAqgsiD0eg1sBHlaydavkqWWBJ6jrIoB2nZdVoe2JGYxte4eN+OttRd
 fWOxwP+/eCCAY1h7okT1K06wL67BjNfpi7mT2MoJUluFQAQOl8/Zyk6Sf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391891463"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="391891463"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100265957"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100265957"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 12:52:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 12:51:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 12:51:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 12:51:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k18u/o0X3GAvuoKRi+p0PNNemWewSQDLpbaqmnDKE5mV6BjAeqOeDfFeSGF7wTZhLz6oQRogOxSV7X/KfsYes/Uvi6HFbIjP3deegcspInbwXh4qevcBa5kFCf+1qA9MhRPyr/uh+KvWA+v+KC5yLnkS3HlKCkiGJVHRYXwrgLmaVYWkKVgnDAtnR9I9HUqyO3TCYYALJiMfasr17HsFj9x0le+Y50ea3TjKltm0P+ZGX9bALQKRxtaTCb5Ivxm4FiBi2tdx9tdY/1NN6s3/9JJJIRHVXcN+7khUHldl1XIxh5ZQsmbgOXhGDpe/ZM+hWEhCPcuUyMKuPh0NdIfOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PHOQYWAWH2r/OsqC9+p3CqV3b6P2iOGbkKpIqBuNwg=;
 b=ZCHxIaa8zCddwfoX8eoA7DbN32NW82u1KcMJIpUp1Vo368LBpdLIYP/Ts/q8H6GPDQ88LEx0FWJZmTHHUeRtIxco7LafsX84CQwHxV3L0505JVKUZ9lcO0yGfAuXMwvo66GeY7gYN4ourG2TBw/C7XElomZ2eUvq1CxCxzRKJDj3qf7alXq9AMMdlGIJJlo7H9VHvQ/+t9okVQfz5NuuhIBmjbds6Sux5DnRn+0oatoYJtYswvNYYDO4hs/2jUNzh29anq3WvnOil8wBXYaEVRSgHmZJTZDmDy7+5LXXq71R1MROa4Dr59HHj+LnPVuVAS9h3WYnn0osCVz1A+0nPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB5982.namprd11.prod.outlook.com (2603:10b6:510:1e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Tue, 28 Nov
 2023 20:51:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 20:51:42 +0000
Date: Tue, 28 Nov 2023 15:51:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWZS2zt5oD/8ObtS@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122143833.7-7-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dd8e94-3b88-4cbe-2bd6-08dbf053d353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gO61UXCs7ZPIZKXToR9vaj3u5s+ycBZLrVF5PvGuZQsfcwnMcCAXdvGjvRjm7bxr3KsDF5bjDwf33gP7Su8Ko3e4oMcNfiLeM8IXIb1dJvbG+ZSfQXdQEuv2k9Uv1Mi/f3SLPsy2Fr1dpGfUHYtab95xawhsP2aY750/ygi2WEgLttiB7TRcyBgxnu9i5ftbnO+Teq83N7RQ4nM9zW73amBbe/vMXe/0MzBjdxuNATriuRFMq+A2jg3b5fwHOX5mfR/z5u/rVtl7krL5n5bNqgK7yIWjlcYF4JN9vmgL0iserDw0VmugaTkkZ5Wqray3TqG5RRxUQ4ZKED6RMbazbQpDKUjU0TyF6SS+xh1FVpZb0yxdWXnIUcYWvZZVKQDTIkf8672gLMmagNGGnFO2XvCjceFyPkknzHCGMnxQlshZjgitoRXbfZO39eFe2HjEsoxCExJc22Ai+T3o9VH3VOrr8xUp3CL7vb+Hb/n/xgc5F7lhM6QWc0Gs3r3wIRzVcZ2f6VDonT6YXmDGboklHAoyMD5ECqZFQAUt0tSwABID1GAdAlgK+yX0O9c314a6txbVHmd4tn8FReCijCOBtsijrmHVRucyjb4TPLW/H0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2616005)(86362001)(38100700002)(6666004)(36756003)(5660300002)(2906002)(44832011)(83380400001)(6512007)(82960400001)(26005)(41300700001)(6506007)(478600001)(6486002)(37006003)(4326008)(66946007)(316002)(6636002)(8936002)(66476007)(66556008)(6862004)(8676002)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?67sntXHvkhxVB4MehRnXVQq/ZqxWD1v5nhZEbp4bB+qQob+kcdc5bnKkrOO5?=
 =?us-ascii?Q?lJDYYU/qEVu6hMYD1nt5WRPGJUIrUkXOnjjOszaCKlFHyh0BUmO0MYgWYzG/?=
 =?us-ascii?Q?SVagTe8VmDQ+VKLQM2bgPBoSQQ2tos4iNHdF0Xqs00INU8NgHaZe/hK4wQF4?=
 =?us-ascii?Q?hl+m3IoCdwMpQr8P8BLI0S+pkgZnlTyynOuurWXkBOjUywfk8uPw/fnMY38Y?=
 =?us-ascii?Q?A6+a1D8OZNBEx4J2fcAuEIx1g1TtB29pl2CEX0LjELVSUCoYNEWYpUOp9XZ5?=
 =?us-ascii?Q?swi/VKRazBX+BVkQP/vQymocjfruKjthayQMmLyrHHSHTBuGlFuTzGU3AXUH?=
 =?us-ascii?Q?ItBfcDtSqPHzT/7ePkCx6ZFYG2Mz26MuMHGd4vF0tuDU/rFwka+mQcXMTK/M?=
 =?us-ascii?Q?JcN+Ngb3menZq2NtuiVA0+WTugwYgOmJddpEO9vPKMR4J35xA8DN3yrgoPgx?=
 =?us-ascii?Q?Ru4pnKjnKLRBvz8OreJpG3NZ3ATE9+WsATPfzrVrSseBNESv4A232j+Cnef0?=
 =?us-ascii?Q?MgTMsl6YAaa7G7+MoCEF6+lo6Cc0V5/TzlZPdiFtv5+I2TEkxJ/uFP53dnyC?=
 =?us-ascii?Q?8Bk1TDmT7gxG4DZmBMXPdZ24N0CwPoiKd9Ji1zNFcXHt5oIK9+aJpoLYykht?=
 =?us-ascii?Q?FmfJsMiYxMu63wFLaNmMVzRJCfYBvuloyTN8mVVMiYLcrqQmXvbL+UUpoAT5?=
 =?us-ascii?Q?UREQqme8Dm5wOgK3c4jTgsIrETIVIe7TfQA9MPjDjJvJnzkpyj8pc/dVEAX0?=
 =?us-ascii?Q?wXUXQgYWA8Oxyj9EZT9EySrrb8pPYot7Box1i1XT19OJHanFvL2pPqa4RNTq?=
 =?us-ascii?Q?mvjvKTKqcEh5TqW+3IyEgEGS8LXbpSLRpxHY/xrQGywMxNrWxlPBG98Qvyby?=
 =?us-ascii?Q?fWD4PFMRWxBfp/FjOlAXJXaskgAGQkrGcP5dZ3BdeXJS3iLwHKGHTegSGC8E?=
 =?us-ascii?Q?gFGm+RCcwuy2iW1QzPt+IfkHyqGjVlcFr6twhKu43ULGIPq5P1z+UtgO8sTM?=
 =?us-ascii?Q?YHPxkjPrS4G9p5BFN0aO5QwXmHuqzot4LNkSmsxnzO6HkIXcOAkKdVYTbLIW?=
 =?us-ascii?Q?HDKLGHKaXcMqO+YM7E4gMyPIedp7GXjbVSbugSLtgQIj29hlptOQpHaYoh3Q?=
 =?us-ascii?Q?Z5UD8adefS9R0BuMQo9ds1I3eGa9mSbdA/NV22NlwonvAVIl21rEZxxkeq93?=
 =?us-ascii?Q?BH0dl3lQ+8E+IO4qJR3xcoSuKVW1lcdsC5l0gNhHHQaR9Uhr2XBOzITa94l1?=
 =?us-ascii?Q?3WMIPcIc7ZQkObiFZqVpnYnSVq2D3tD/hYGhoczgVU6zAjYBvtPsbYExAL/E?=
 =?us-ascii?Q?B6xLz4OHvc2JxgKEGDK2Wah6O3UV3AhS0DUKthBlSV1KL0O8MWWHAdE+PRYP?=
 =?us-ascii?Q?mPo5+EMuvO4wgS29ABu/LzVMeU6fwxj+drGThLEW85tnhy/K4vq35Mq3NgEE?=
 =?us-ascii?Q?hAPcNhZMREFs5iVIqNbKxMUlstu/o1mBMEgzXes6/HQIuap3Px48FV7H589J?=
 =?us-ascii?Q?UmREZGXeIUidtA71ue8FKC5R4uuxIV5VyzJdz9cCA9kAGPEnAs4DqXCI+1dS?=
 =?us-ascii?Q?dxbx9Syu+3VgiVVGY7d+JiHxHgu4PKgofgoZjiDy6BIURSUOJDTMfpgS4PTt?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dd8e94-3b88-4cbe-2bd6-08dbf053d353
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:51:42.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaQNxim8VvVpmOh6eFRJN0eMlxxLn7J1U+Ap727pZNfNOs8AkAUMPuS45Idwdf9QzgcrERAbE7rt8pICPSlK9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5982
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/14] drm/xe/uapi: Align on a common way
 to return arrays (gt)
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

On Wed, Nov 22, 2023 at 02:38:25PM +0000, Francois Dugast wrote:
> The uAPI provides queries which return arrays of elements. As of now
> the format used in the struct is different depending on which element
> is queried. However, aligning on the new common pattern:
> 
>     struct drm_xe_query_Xs {
>        __u32 num_Xs;
>        struct drm_xe_X Xs[];
>        ...
>     }
> 
> ... would mean bringing back the name "gts" which is avoided per
> commit ("drm/xe/uapi: Rename gts to gt_list") so make an exception
> for gt and leave gt_list. Also, this change removes "query" in the
> name of struct drm_xe_query_gt as it is not returned from the query
> IOCTL. There is no functional change.
> 
> v2: Leave gt_list (Matt Roper)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  include/uapi/drm/xe_drm.h     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index f321ed4d3b0b..28ea6dbf1cf9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -354,7 +354,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  {
>  	struct xe_gt *gt;
>  	size_t size = sizeof(struct drm_xe_query_gt_list) +
> -		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
> +		xe->info.gt_count * sizeof(struct drm_xe_gt);
>  	struct drm_xe_query_gt_list __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_gt_list *gt_list;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index a9bbdf141fe2..e38e7b701edf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -356,14 +356,14 @@ struct drm_xe_query_config {
>  };
>  
>  /**
> - * struct drm_xe_query_gt - describe an individual GT.
> + * struct drm_xe_gt - describe an individual GT.
>   *
>   * To be used with drm_xe_query_gt_list, which will return a list with all the
>   * existing GT individual descriptions.
>   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
>   * implementing graphics and/or media operations.
>   */
> -struct drm_xe_query_gt {
> +struct drm_xe_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
>  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
>  	/** @type: GT type: Main or Media */
> @@ -403,7 +403,7 @@ struct drm_xe_query_gt_list {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  	/** @gt_list: The GT list returned for this device */
> -	struct drm_xe_query_gt gt_list[];
> +	struct drm_xe_gt gt_list[];
>  };
>  
>  /**
> -- 
> 2.34.1
> 
