Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2843EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 21:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90610E025;
	Tue, 18 Jul 2023 21:14:13 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CB510E025
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 21:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689714851; x=1721250851;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WBxwSX5S9c9XipKCpnIFCR5YFoxid4PK4jS0Av7dvQs=;
 b=cM8kp2UwApVCN+41sI8Erx1NCwD8QmDiz0FWOFq44zSMgF4fh+bhpVZC
 g/4XXoRQQ94clx+kjyiCpVhuOnjS51lKlu1US8RKlGGSnNDet3uLwrn08
 Wxm1BVm+Unv8apItcz2x3W2E+um8E4IyqkUFM/FbU2gmZDfduwiUdvEwu
 ghGqJREcF+3GnNhOZbKgTWLTObo1FzMeQOd0IYCm15HVcT/Itag/l+q9i
 6FGiQuU8Axs3I00h8EoXSlRYz3TKzvnJDycLis6fY5SjADO5mgmUM8esN
 ylu9wF3Nb6GmJcVkNC5bUL1vWOEV6Z07t9nupSTANCRAZEpD83wJg8p1h Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397162275"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="397162275"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 14:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837416671"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="837416671"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2023 14:14:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 14:14:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 14:14:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 14:14:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To4/gC1oFBUiEYUpNRgTnzS59NcavzODdBRhbXlbKhDqut0/TyOsVbd2bKFCDXvJ2gcIibZ3QBavr51J3Br1+O1zU0+Xr+zxq0CSqobDcqHyMyh9S1b3OO9OdcSSrWJ6ycPrBJlfVi8HjFyDGnkJ20m//GJE5ci5ra14fITNv5A29uXAt2Gn2rELtd3n+bneJc/Qwy+dh+yWhG24vd2aPck+l6aXofLrzRKei3YPgJkhpLarKNIVM4ekiQG7z19bAnIbqymiXacfD7Ij0oZHV2UUCfmv4oO1pjrfPpqoIDV0Taky7MSGMZOX3fl+7v4zFXrGDe6cMzLzBIlqLlh3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9DVW1CRg71hRIeSeCIil3Y/3Y4vB3mKwHBfDLeBZd0=;
 b=RJ4XQJVCxdU73ZAQHl5vzEZWPi4esYUZ0zpI+FyKxEd3ALAXjIXT3HxmIiPKIOiArWnimmGCZ1762NzOCJGnDCyUSGpo63B1BlmmLoUZRWxvX3sG2Sl5CJqT0ajSH/41gfrdvxWGSE3RUZYILkAnOdWSHZzESWmAfvHh0CF9YaNwKq28cqunq7WMjgTPOpGRjPmm3QDJwVecmLhiTobClwGx+UlB5hISNI17PLLyTiLoeoHtzkkYqpO14xuEv3mlc0f/ovdUYw9DyHcwjEkd0sa9myi8nEKjbHwLmmQNUic4QIdgGd0BQNtSz4HCa8XCX/y6m+j7jn5IiakeRUh3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7025.namprd11.prod.outlook.com (2603:10b6:510:208::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 21:14:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 21:14:07 +0000
Date: Tue, 18 Jul 2023 17:14:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZLcAm0a6DPSh/0XK@intel.com>
References: <20230717095900.1561736-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717095900.1561736-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c09adda-f9c7-46d6-0823-08db87d3ebe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lip4BNNT76v8UVgg4vioeJjRBU92RBYTSDz0WG/prD81mKZ/VYMWOBofiQP0cE4RIodzDY9lD7RNoPtuu1CWZWRSaQd0+aGBErsMu+UkUoqVOUyjOGNGl8y9KhQgma9GiIfVpUxkIw1PWyCIYz3ClaYy8yHViTzTVECAkBmpsRH//oxA9cAT945HSTugTarAtTdnQL2GKE+jzWimVIIpsoY5Pc9vzQk6JrL++7nXMgskpztXXSqfYKeADyN5sMeFBeGSivAubg3XG58k/3M4+twmVGbk0N0HW0CibHveHFvQhkuWywRZokWAbbsG7/eCfCTQkRRU9PwciKx7RoPQvCR5piqeV8upcBNF5SC6rOH54GTUCd7Oybz1o9nR1YFDMaQqAOuO8TfjrDxvc/8UlfwdfK6jGjdbGaOg/Ho/YSf0ESjzppQ54HNqcFZ69qSTd79njS0mxRg37lKKpdlnB3tfvFuvKLhrKiuSl3WYCnP/4LWufjA1/Beo6VoEFOm9j5spiUEFGGjLWzl3JE5kghZrmhtplOX7I0QLATc3dXEe+w2XpBLFzEt1mjOMjIpO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(6636002)(36756003)(86362001)(2906002)(15650500001)(44832011)(2616005)(186003)(6512007)(83380400001)(6506007)(26005)(38100700002)(82960400001)(6486002)(6666004)(37006003)(316002)(66556008)(478600001)(66946007)(66476007)(5660300002)(4326008)(6862004)(41300700001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/DPYvSaxA1Vw45WoS3EoobleW1Wx2i1VSvy+mOWmKmT1Hx9aRuD0koEAmKXD?=
 =?us-ascii?Q?oOnLW4oCdDQThANqBrZvS2387aJGezowkkhluqfuREg8wk734fqwuFIObo70?=
 =?us-ascii?Q?SQeDho/9vlhe85El1TRekUFV9NwfAZX1oJmjDqw9SYYCX9WZCrbrOsYGmdwo?=
 =?us-ascii?Q?zNE68c7KCWgwQXT7V5W4OPOcgYw6zTY1q5cyh6yphOeYPh5QveaQYLSSDtRU?=
 =?us-ascii?Q?g3P75c6JWSWqkhxTzR7b8ju+7Bz79ehsvA9XW0lF2TGnDcGAx6tRgY+sc8oK?=
 =?us-ascii?Q?dIsmiNIvrKaZJzb/guZbJVQBNrlbzNqI4HNOb+J2BpKy9Kbc/z4RIeFlCfag?=
 =?us-ascii?Q?jk0tTZPIx3UVw6UAjINuy8akBz0w1ElG2DFTGAXqPlMgltW6YQNkXQdGSYwf?=
 =?us-ascii?Q?snVHuiUY9XXgrXE0gm096uOlmgXuy09lFngbi4Kf27rn49cpOvyIpB0u16MS?=
 =?us-ascii?Q?8jiH0ALQfb2c/LPbgMA25TE2nDAw0kMWHgKe4Kqg/4DevB/eSfHe7e4PM2pY?=
 =?us-ascii?Q?xg6IPRFm08E5lzjll4JLod1UAK35fVcFJTT1pggfnLHyX0+mW3oDR/d4OLsJ?=
 =?us-ascii?Q?udu6Oe9ctkVsw4mdALkh8+x6Jdk/JcVjJ3EAXHJpt/KR5etUXvhLVbpTQXng?=
 =?us-ascii?Q?pJC/t/U8qdhAkt2xGnxuTSpDtEEl01ckP7mHSuPdjyKfVtauvq+3ORQleY9G?=
 =?us-ascii?Q?onBWzREQnlhaCDtn281u/2VTlQxTWSzbVTdoJV9YZqZ+TEqK5eAcjatUaKeZ?=
 =?us-ascii?Q?bC/ET4C68RBJ9DUJ1n6WkKl/5ybgK3DsOMOTXVVlLzHNoWI2m1JOT/ajssOI?=
 =?us-ascii?Q?UsqBAj15yjkBwE3Yq/YWjqlrRv9vCFe0qK/ITlDCSM1fpTmqzmWWLjMJ2Rbn?=
 =?us-ascii?Q?Pbvgfhg3KcygrLXvp/88qLQY5nA1k+g9kIbSzzwk6oRQaswV9Urazt0suPgp?=
 =?us-ascii?Q?/zZ3Z8EOkY7N8sTSH5gFT2vTaoV9z02p2KsWOdRIw74oZggqA1ngZNnXlmRy?=
 =?us-ascii?Q?aKSP0ssB0UvRFqO6G/XAtB+silUxPJ+Z70XuRD59O0ADR/L+kyCjgtGUcIlC?=
 =?us-ascii?Q?tgH0GhV9eW5RhgGuz4kITyYA6cko4uu3l4meAH81rHKRGpQi9Od2OYdqW8ux?=
 =?us-ascii?Q?wlyBDO0hslgC7pUZ/yAeTTdiBlJhSwoGAvURpJgFkNG62/xugmt3JQ+6OrwD?=
 =?us-ascii?Q?a9on6rtpV6oLk2SkF/QwVL9hvEhdKT/un3zGRbWaoKPF3JbAvvLiuCB3wq02?=
 =?us-ascii?Q?ORfw/nD9PSY/UoWYAvn2ayxO0p+6+DjzVmjcL6a33j786YJ/DeMDLnUrSc9m?=
 =?us-ascii?Q?n4w9OD0+wXTAnbj8RWI8Ta/r1ZSZbgWpSdDH5eIs5+4rsaejWpe+jy8jsuzu?=
 =?us-ascii?Q?S78NapuD2HYKvRARMRSXf4E3uhA+7IKb/oA+WrDKrJaxceZqjIK5Qej7/3RB?=
 =?us-ascii?Q?0MYgA8p1oC1Fq8iNCdQGo69I2R7VMh5X9JiGD7o55GiuNxnmAJW153G9BPB5?=
 =?us-ascii?Q?4iWuaeh4jSaVn4lOEr+ZqpJEa5GNFm1AtO/HL+pGgbtxjvy7Iikc9aFnsJ0R?=
 =?us-ascii?Q?8OjO37iBADmqsaUC7aCIY/B8EQIJnZj8Hk6B4g1Wtt4PrkT8VXgseDeyA05w?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c09adda-f9c7-46d6-0823-08db87d3ebe4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 21:14:07.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1jkzvF6LCnEE+N2y1o0bo7wDMrNReBl+ESQ34/l8OZi1xXqC/wUj8qXZZxG0k7584UOzRbdZ8Lj4bBFB4eSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7025
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: remove gucrc disable from suspend
 path
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

On Mon, Jul 17, 2023 at 03:29:00PM +0530, Riana Tauro wrote:
> Currently GuCRC is disabled in suspend path for xe.
> Rc6 is a prerequiste to enable s0ix and
> should not be disabled for s2idle. There is no requirement
> to disable GuCRC for S3+.
> 
> Remove it from xe_guc_pc_stop, thus removing from suspend path.
> Retain the call in other places where xe_guc_pc_stop is
> called.
> 
> v2: add description and return statement to kernel-doc (Rodrigo)
> v3: update commit message (Rodrigo)
> v4: add mem_access_get to the gucrc disable function

it looks safer now. pushed. Thanks

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     |  1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c | 20 +++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>  drivers/gpu/drm/xe/xe_uc.h     |  1 +
>  5 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a21d44bfe9e8..b31ef2a8ff17 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -517,6 +517,7 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_uc_gucrc_disable(&gt->uc);
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3093cfeff0c2..03dfbde29fe5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -730,12 +730,20 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> +/**
> + * xe_guc_pc_gucrc_disable - Disable GuC RC
> + * @pc: Xe_GuC_PC instance
> + *
> + * Disables GuC RC by taking control of RC6 back from GuC.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	int ret;
>  
> -	xe_device_assert_mem_access(pc_to_xe(pc));
> +	xe_device_mem_access_get(pc_to_xe(pc));
>  
>  	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
>  	if (ret)
> @@ -750,6 +758,7 @@ static int pc_gucrc_disable(struct xe_guc_pc *pc)
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(pc_to_xe(pc));
>  	return 0;
>  }
>  
> @@ -827,7 +836,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  		goto out;
>  
>  	if (xe->info.platform == XE_PVC) {
> -		pc_gucrc_disable(pc);
> +		xe_guc_pc_gucrc_disable(pc);
>  		ret = 0;
>  		goto out;
>  	}
> @@ -850,10 +859,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> -	ret = pc_gucrc_disable(pc);
> -	if (ret)
> -		goto out;
> -
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> @@ -876,6 +881,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_pc *pc = arg;
>  
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
>  	xe_bo_unpin_map_no_vm(pc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 370353a40a17..81833a53b3c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -11,6 +11,7 @@
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..f8cbd292d6d0 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>  	return xe_guc_reset_prepare(&uc->guc);
>  }
>  
> +void xe_uc_gucrc_disable(struct xe_uc *uc)
> +{
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
> +}
> +
>  void xe_uc_stop_prepare(struct xe_uc *uc)
>  {
>  	xe_guc_stop_prepare(&uc->guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index d6efc9ef00d3..42219b361df5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,6 +12,7 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
> -- 
> 2.40.0
> 
