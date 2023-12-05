Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA38C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8710E63A;
	Tue,  5 Dec 2023 22:16:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4110E63A
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701814613; x=1733350613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UinF2wXwF7cS/dc4yeg3NUT9HiC1kJNFbgDGhNVheAQ=;
 b=UgJ/TyOwySeoVOHzAYHRCMjFYdNdAvFYgnimBSldDakdMzo+MDGgsnjE
 Pny2yNoi+34XI5j51UNjpyDVRS+/Lcn6lmfiq5lx49iYPdvBZh6k3KY3f
 tLQP5p1pxzg9mLRsPYJrCNCDRsUz5z8ezGuhizwqJnlAaJfr8Bd09WODt
 VEZi/lOI4CgipJwhZoEpBOj4ut0uNDx38eDkG4ZQYunXQoEuW4F+qg0YI
 gpcbjJTWLjMYJ3vYlv5sKGi8Y4yz48uqFdc6ml4mpnLbmutyAuntTLaje
 RCfcNJ2I/JoB2HJzacQOQAur2u3/5zH/dOxRI5nC/uniYzdOWvDqQ5UGz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="15520712"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="15520712"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:16:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="914954194"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="914954194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 14:16:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:16:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:16:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 14:16:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 14:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeWLga27Px209aljNKMfYo/5Fsabbv27dR/3cblF91fzo8hG7m1z7LYfRR8Pja9omMZLXbURbQGx3kG55k6ooExeu22ThRFdFswp++YENZnpw8qx/tOtCnXSqGZXIOtdDilhgG6jT/5El2LMDFJ0laOOXfOKZPkXb8vxt9QquLBWObq8k4Dsj1uURNyzOyKYmFKjFf5RpLDus7zAirW/U36rXemdS3gtSIFbFUsm5s/X0Tte1SHrCF7Vl9uRGw3KF7I4hA2qjf0xZm9aSnBes1lvr6bMb9DCRTLIz0VB6rt1CRy9JWlWcZv6PIxBWiRiRSskHHaSWWeeejeNebkZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CISpCuMgWYld5Ko1+5/j7A/Z5Yu0/AnfsgyatZTKRs=;
 b=ayRDE3DqC/y5iBRLuZeA6whe40oDwsnAzwwGnb9GhYQ9LkNUsCt5eq0eWUts9vAon7UiOKxqNBXFeY+IFLGmjR6LZciFKUwfjgHxBBAwZMIfGLbh/miCzTlZnTJQTNSbTjkVilOKTc5MryFoaFxoXnL77cPJN060qVJZSIsPXJ7h89cUQfkF3b4sfm4n4i7NzE/p49adeaHavM3+SikaVKRvehXOogZO7bDVUVpuwJJMWeDIIwGXegczt7TDacfiUmAjnZtkigLisPd+5gB3/yrBCE4VoESk38lAFa9mm9fRzI6OxmTl1N8frGUcV/ovvVJW3Mk0Q9FXjWIiNetnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:16:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 22:16:49 +0000
Date: Tue, 5 Dec 2023 15:15:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZW8+rEdxCaH+Cr0u@DUT025-TGLU.fm.intel.com>
References: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
 <20231205143755.4834-3-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205143755.4834-3-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: BY3PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ba7f37-15e9-46a2-badc-08dbf5dfe040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ny+8eDIGvH6W6YkVpa987zfbyRKMCoDZFkHAh9qer/yKuKNp5a4j6jfw0/LHmhpB70hWjHUert3M553xQ5cNm3uDwYE0C8BGUVPnM2M+F5VdqoOME+j14By+WcA0sUwj00tA7hf7cpHITsYR3t2U/lyfVllIjONds2rjxXWRANmulMrxqO5u5a1cYjk+YZeUhddcRaTuWDVT7gLrECK60Gn2gJFuwthm8VS5MUI7G1Gf7TCkA7gqjz3s3zaA3SL9EZJG4Ks9dJAtuXAsubAuHcK/q+sxGDffI2eSUwtuHxnxkbBBaWyZbnalJt0g9w1E2LDTSb5GX0ONMBU6pdFtRWkHAfvHRCYiHkUSbVEeJHwyyUkCmRL3SIHJGO0Q1LFcoEU/QHK0o1TjEpaaXElGvOUXyMu1ddUgOsMfbey0WzrZvZsdcnYL+oW/z7LSNKKP+khtTvfmHashg75ii7A9FUGKK/Mc0iMNksgVpCRIXSuYu5Wvr8JPr1jpkxKVXn8awlcMzVQG+XL+PwU42vwEcwlvX4C154kv/yxMjLwcynXHTkwEDzJsdnOES/aHoyNO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(44832011)(2906002)(316002)(66556008)(6636002)(54906003)(66476007)(6862004)(8676002)(86362001)(66946007)(8936002)(41300700001)(4326008)(5660300002)(38100700002)(82960400001)(6486002)(83380400001)(478600001)(26005)(107886003)(6666004)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gczpl0fL4gwZsX+gwT14cWXdFNTutAk4a/WckaeCfm7wvPPP6+LLUn1IiD65?=
 =?us-ascii?Q?0Tub205+XzfVXvOvLUGfzDe5iKR8+OyLmpHCfOWL0BRW6Jt3Vw7HzPCrqtvv?=
 =?us-ascii?Q?0pXWRhOyEET8KT8Q77ja3CEQk1o00x64QPKawhrvO1SJLhrL80pUoXF5To8H?=
 =?us-ascii?Q?7U+d47q8Ha8NzJndYrMmIClUvIPW4M3t+soKFuVD8Jk76HTsZVqf+0FaCT1h?=
 =?us-ascii?Q?wjz8WY+sNBvi2ToFBGYlXGYVOuWDHSpGG5uJU3rCeFdMrR38Lokyhmh4EQep?=
 =?us-ascii?Q?r3L0VXgIjYR9hx5EvEL4nm9dlMz4v77SXwrfsZK23ZUSK+a8m7Bv7De+KgZh?=
 =?us-ascii?Q?SS1U4EQS1KmdGV8Toax6d3P08GVCaGQJNmrEq5d3G1tJM3uauKzDjUlrrWpa?=
 =?us-ascii?Q?jm7eneSdyARTW3sgUPPvRAZIm/xy6ippl96k5DVtCUPNMxMHbqbdZ8ZHir/f?=
 =?us-ascii?Q?W72rOtDoPGEtjdsj5xBCbW/TZM4+L67/X7Pnyk/1gER5n4wBG85u+vQgKRX4?=
 =?us-ascii?Q?NqCJudouXOF9C7HfWsSUHb/A155d2oxuhGbK/D0IQT7d7hMuTlmCu9LapK5k?=
 =?us-ascii?Q?P1Cn77ajhMBacji53wojod2UvzBV6i5SD5APtqw4tFJTRckRBaq53GGgwb7c?=
 =?us-ascii?Q?3FhF/xzhpLY0SvkLU7LsObFdOWU6XVrjOaY07HC3hALnnVxY3MsN0GcmLs5p?=
 =?us-ascii?Q?xAclrGjujFLl763AdmWErC0dqxE95BumUh9qcSyU9dpDs+LBw7AsSk6+S9ys?=
 =?us-ascii?Q?j0Rnx3LYmXtyqJMhIBFxfki0MGDCtLwq/HoQxPwDP27WCGLbWro9wcKCLP7L?=
 =?us-ascii?Q?aV9xfIns3zSVTK8sAa+gWajle7qAOT9X8qc/MChqnskHRlFF0pVsLhjJk4sV?=
 =?us-ascii?Q?ukwLgOlNCBpaS7ZufjJQOZfk7Ald0bgVOfElKJnImbyKNMEReuL9jJ56GyQ6?=
 =?us-ascii?Q?2YKJTT3oHhfFir+/WJL694Qrk6xt4IX+Jm/Gdh71yFxhh4CCHaS5h7gNCR/1?=
 =?us-ascii?Q?nhzCTK5X1Is2+2w/Av8yufe1WoMUyN4IBl0FRQ5amRBdHI822BDrhlbbY9UL?=
 =?us-ascii?Q?47CCXlzuVC8vK4EH3zGi2J3OLKuOBxilqzAz/ARCw9+0FUXu0Ma7cSxcwXYi?=
 =?us-ascii?Q?ydY2ZCDZsDO9D5/GPfstyiifPHNt3n7zWFe+p8qbroyM67s0JZd5RRPgjObc?=
 =?us-ascii?Q?v04A0g1ECX7kW6k4bWbvgiLpN9Yq5q4wdh+vJjTyiNX3K1cazWDwrhWBSF/9?=
 =?us-ascii?Q?3QGS3brDRh4cDdbyx8oY3JAWH+DBYaQjEQ77GTxKSiE2IVuolwNAbdRl/XHq?=
 =?us-ascii?Q?4P4PKXM/W2qI096r5q68qIchbokws1RuR8/0j/hYhcXZGPWXcxqT/nLsY2qf?=
 =?us-ascii?Q?MLZD3LVSxvGcN0vBzofkIaK1JEeMt0nJ0VGH95NcZR3iysrRUPN/OHGrh0tY?=
 =?us-ascii?Q?vthX/D8cHDR2/Qprpd5rZ4xVNo6XZKLG6OmUpAmar8b8Q1PIVu9WQDFR0ToF?=
 =?us-ascii?Q?UPyVtpwV+cb/4C9IZ7YNZiZfiDuU4LOFKCC/RF8UCJAKFZeXyQJENWVgskzy?=
 =?us-ascii?Q?fiP2dCbSwlq5Cew9xHke6dGt2Zb7oI4LYxZXiFlUOrv9yZ3/phzivhMtU7BE?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ba7f37-15e9-46a2-badc-08dbf5dfe040
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:16:49.3357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jK6PyH0tYlWl38/GisId5SFAxG8UbPjMWgKC08+Zm4fJ/5pIntGx7OYipRIHXmy0Bslv4dDxfwYOKQYxh/ZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
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

On Tue, Dec 05, 2023 at 08:07:55PM +0530, Bommu Krishnaiah wrote:
> return correct error code if exec_queue is reset/engine is hung
>

Maybe a little between description here describing how this is
implemented?
 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 13 +++++++++++++
>  4 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 5ba47a5cfdbd..84ccf7242247 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
>  	 * signalled when this function is called.
>  	 */
>  	void (*resume)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue reset status */
> +	bool (*reset_status)(struct xe_exec_queue *q);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index e8754adfc52a..dab41e99f3d3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>  	/* NIY */
>  }
>  
> +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +	return false;
> +}
> +
>  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.init = execlist_exec_queue_init,
>  	.kill = execlist_exec_queue_kill,
> @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>  	.suspend = execlist_exec_queue_suspend,
>  	.suspend_wait = execlist_exec_queue_suspend_wait,
>  	.resume = execlist_exec_queue_resume,
> +	.reset_status = execlist_exec_queue_reset_status,
>  };
>  
>  int xe_execlist_init(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 46b132ee1d3a..a42c3574cbec 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> @@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  	guc_exec_queue_add_msg(q, msg, RESUME);
>  }
>  
> +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +{
> +	return exec_queue_reset(q);
> +}
> +
>  /*
>   * All of these functions are an abstraction layer which other parts of XE can
>   * use to trap into the GuC backend. All of these functions, aside from init,
> @@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> +	.reset_status = guc_exec_queue_reset_status,
>  };
>  
>  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 447e4cfd204c..fe3661b48a8f 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  {
> @@ -108,8 +109,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			     struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> +	struct xe_exec_queue *q = NULL;
>  	u64 addr = args->addr;
>  	int err;
>  	long timeout;
> @@ -128,6 +131,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);

This function takes a ref to 'q', you will need an xe_exec_queue_put
when the 'q' is no longer referenced in this code path. 

Otherwise patch LGTM.

Matt

> +	if (XE_IOCTL_DBG(xe, !q))
> +		return -ENOENT;
> +
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
> @@ -143,6 +150,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  			break;
>  		}
>  
> +		if (q->ops->reset_status(q)) {
> +			drm_info(&xe->drm, "exec gueue reset detected\n");
> +			err = -EIO;
> +			break;
> +		}
> +
>  		if (!timeout) {
>  			err = -ETIME;
>  			break;
> -- 
> 2.25.1
> 
