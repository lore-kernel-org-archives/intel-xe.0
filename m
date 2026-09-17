Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD0BC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 18:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128710E779;
	Thu, 17 Sep 2026 18:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3eC8E+j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36110E779
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789670888; x=1821206888;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hcBpW6SnoSk1p7eqz3ANIzlzWyrzbO39pbOB36htIvo=;
 b=H3eC8E+jZ3MjCB3j8/kay90ZNHnB//n0I7nG8csN51A9yL5nDttp1f+k
 OlTABEOssHdfmJ8JGCH+HIjEQqaVVF2pYVBzfpdQ7AKafjz8iawHTtdum
 gUuaEOEAW6r/4EiC79xKWdmLV6WpAW9TclTkOaZm9Zv3K0WXPIy9tknKS
 0/Xybo8DOpzLk4YP2+h8zPsEP+fYmdAmrEjP8w6Bvo1R71DbCQ8J2Ejbu
 EF1tOud9wFBbU4g63cwajmza3J5pZPW9rrlZbzj/PgLsn4qXUnf4XJqri
 4BjgE+C64aqDYkiNkmI6GAyrTWIltNG+SAx5QKZUTSSTsANEoVo0vyhis w==;
X-CSE-ConnectionGUID: VAxxg9qNQNmCXFu9f3H4zw==
X-CSE-MsgGUID: nUplP/JdTqiQwQKEGucAhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93959297"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93959297"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 11:48:08 -0700
X-CSE-ConnectionGUID: 6rUJOKviTFyGbmKvJOLOew==
X-CSE-MsgGUID: 0V/yTz2JTsqNYcRJyiGtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269680140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 11:48:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:48:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 11:48:06 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXXI0+w/DN0yifJ+Hcjm+ttWWd2giOh2H2M1ptRVpmXX6uohj2v9bvx5ayzn9DBJ08j9LLfZVgfsgELsKmQzGzMKy+vxUdrxuYb40fYi0+Jcj4kyGgw+iyE9Ncpd44i17ZHqG9x+6wIJq9UczPKGkQeU7R/HKJ8N7x00Kn/xcTwMpvjGzDQs1f94b/naox+S5r2ursNEkbkEx3Ef8AU0Gh7/p2FkkxjM4aRT/hg/2ArPlUkc0gFqFRsm4B4WftDo7fKP67BcyGlrzYuU2PQZdSXHx1WL4vZLXCwKg1vjUPEBS32RhYPWJysZ0yA1CaSSpS9QW3nbq1DEMcQWVODSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZthbhRvwl1Q84VYk0IKcc3wxPQwmk117DC3WrhfOXY=;
 b=vFXY2HFwKyBYEh2MRcH56kDsPJSCGYJYdDZn53BgtpJus2XLOw9renlMkzbhx1v/+aBCMDiIg4DNBfamX45NwBWVaLeAglaEq6uzJDnivjoW1vEBna5BYtwY23CArPWkgTtfVunJvIjOT+xiHdNasL/dyvL31u7W5WI4nMAkXg7oYb00u61X7ZguxyCNuMMQJLZOYIxZUitBATSqvlp0l6TfSttC2oH2TIXsi/SC54FREAtKVeyZaz2wWuOthT2qRKczKXN+3Gx7u2vfCGHuSvK1Xkn693o07s0gPnQEDN3v+mtqRGWUU/TOiyKaQzVeKTY8hdAgqCyz3rfHHEFoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 18:48:04 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 18:48:04 +0000
Date: Thu, 17 Sep 2026 11:48:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sk Anirban <sk.anirban@intel.com>
Subject: Re: [PATCH v2] drm/xe/tlb_inval: Treat wedged-device invalidations
 as complete
Message-ID: <aqw14j9kQ9YPq9pB@gsse-cloud1.jf.intel.com>
References: <20260910232734.93054-1-shuicheng.lin@intel.com>
 <20260914215318.200603-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260914215318.200603-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:303:b7::16) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|BL3PR11MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 794d10a5-01bd-4ce6-8d12-08df14ec34c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: HlVC3PXOJbZ6WzVF4sjqFkPxi6qmGeg7F50UIVtijrrPIA+eAK+T1pjrhBR6tTkHRUPhRKWLe9Nvr1VlYGoAPQK3aoNvE0R1eaQKKwlpaXkRBsl5rWZaMEkQhHp/5osaOgkbvA6hvPE7P0wXvM/jh3B9qDnBgbGgj1sMsUYTGTBe/GYN9PtjMWzBecdezOasOVMK2/j015KTK7o+xeTPXEZyrplUNTo0H0po1EHUQ/k/vEibfgGa7uOHky/M1YpnTypagal1i6aak7cqqq/X3PnEBudBalg1U2FKF1N4jrLpQEM3PkMRcYeLq4qYVMg+eP2qooWBkPMuMwK8gNoqHxRn9qO3bFc+qMQLvxTN4oH0f5vIMdTdde2Ah8YN6/1Ob+WahLOOm4INGSpZ1cO8Bt5ZnQyTK2rkaC5CcRnmi+JuNSHMwHLPwcAnWAzEzFblwOvYBEAk8QrY3Yf9khdQtLh/Js8HyxPsbI5A+Fc595eRa+sO7HLanYIsxXmd947q8U3BpYRLi8gyN5pdL3jm5Pou9XnJlgldUR0lnVWMcims7LHlCtyw8w+4RxPmThgNOmawzTv6ZAjc1YVElZvM2+lZGsjNXS7dUS7cbt/czgRpU3+P3oFd2+2XoVahLWAV1YAjZfySR/WJsl5Aj/aHRrTZJOliETPuNOGFXJTNtLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LidQQL3WvuYRQl9ZwuniJ/psYoOe9OHDj8Mhq5SqlPuckrlGCJtLEwXdD27C?=
 =?us-ascii?Q?gwzdvWuhbZTY4L1tUp4xRej2uYmfx2Z+Vu4gK6fch1N5ToKUnqEnQOO/mJLr?=
 =?us-ascii?Q?VJxj8dbCi1CmPRqw5KocngMApZw5mobVQb0IxR7l7nc2w91rhnDodU1aWAXu?=
 =?us-ascii?Q?2eCu0poLrljxbEuYVFHCjdg4tpmIqt1d7kGj1fNVhJSAkGWCff09G4ES2gqL?=
 =?us-ascii?Q?UmBPCI1mBabwbJSOgZmVesPzuBFmRdbIeXazM8PbU5z+KARHlgMcqG3hD9pI?=
 =?us-ascii?Q?VyYtCjAXaZLMPB3NGO7mGUOcXYh+PIfUSe+x960o+qi+kNbH9Wbw2KZBXaKe?=
 =?us-ascii?Q?5GsFN703SHrRgXyGddWusrkb0c+u7I9MzO31w8fho1HcYSQCowG1qBkNxowM?=
 =?us-ascii?Q?XKs5IhGDHcuznv5tJa6tgD/kgqpSEhkiw1UwPNryN5ufKJvrAZRHpMwTqMjS?=
 =?us-ascii?Q?mMqnh8cRARUm54pHBmT9doS7cCftbR/Zlj8opEB+645LTJrZwPOZC7f/DOmc?=
 =?us-ascii?Q?s9SD71x53OgFUqHKnNJb7HI6eyYKmtcGAGmRH3IEU49jWd56i6jkduGQl2D8?=
 =?us-ascii?Q?sR+xCNchqrcQQEU66qDmwUASIOrKcckdgW/jOxkDcHAGXl+ZdegVbfTphjS2?=
 =?us-ascii?Q?K+bOKpdNXRWuLlQoMfhrij76MV0sH/ru2b+aSKiPJ9hUy8ZaC2QtC10yxkSG?=
 =?us-ascii?Q?8wL7qjqesBGs+6jywB+DbzEsXXjQmFiaEQvCieO0Gte5MfnJBaunTfqSC2Ee?=
 =?us-ascii?Q?QssKcicTBRJfWtwKauENe2eYMu8rWn6lOFba9jKPBMj2n94ah/WQ/VI8CGHR?=
 =?us-ascii?Q?gYR2XieDPulv4NCPZkLBZR/bZbFSIPq9Zv3FhRW3eHA/YLNAUrPo7lY698gD?=
 =?us-ascii?Q?SnpDzC3oz9RJZuGYm5crVHx2/EZLGRRlLvmJCXCDNJTh92sRYJg2IjxQtw0z?=
 =?us-ascii?Q?1765J+PJFwi0xDQ7ZEPNypZk2Z1Iihdt2lhfKyCm4lVUtso0jHXjw4FXazA4?=
 =?us-ascii?Q?XYhjfqI2uVeH/rJyISkqQCMPq6jk6yWhjjtLRO23gTTRuYNlzDWEmgA8ELtN?=
 =?us-ascii?Q?0bcgQDY5H/o2tmMJpBdP1nySCbjOWQRbfT98wAP3xBY9bEERyky62ARr5jg1?=
 =?us-ascii?Q?pGP6oe4T7Cz5FVZv1megYIuTBLaSDvjTfO8/0bhVoZRG1HZsp8lQxPdR1Gqp?=
 =?us-ascii?Q?7vmwLiFB/rm1lyIoS1CZFAh/Wul1kreUcwCeAXmMWy7HhzJpi4Q4HOaQ9aJB?=
 =?us-ascii?Q?lX6Mf8VShooBkOd2QL4WWlTkgBT8bFnSJ4xnJVlvOWJI7RO2pb/KapsCPmd/?=
 =?us-ascii?Q?DqnFdR28ZwzfqjZPDJhUO+M93Hp+PwVRnuoEGVqEG/nGYhhHeeblvZshlytX?=
 =?us-ascii?Q?Gla5Np7Bt12NXXeCWNa07nICveRsJCG72ccOYkH3PvVSa+bq2/h1TFhJ8p7S?=
 =?us-ascii?Q?yyPi7v81bMWn1MgUMtUB3Zk+WruCenGcDNjpX54XgbvVWcODvuJ226+dzI0h?=
 =?us-ascii?Q?BF/P5kqLQ6iVTcpgglr166Ww34f04xesq7B3Fnt1w1dG5uHEYTwh2X3kzTxF?=
 =?us-ascii?Q?anuPq0e8YpayKPYwMasmU8jZLbxATwD75lARZzqJ1knshB6orV6FpHNKJ9WT?=
 =?us-ascii?Q?IW5txMFEWnDh1R6jcICZXviJPMVRFMOl5pBqxFvfEwFgG2aQhmQesz+BKrKu?=
 =?us-ascii?Q?uTBW2mGy9Bnos83HjRBPtpO1nPzS8bMbqt5Y2/Jl1D4+ynOOjpGajpHY+yKZ?=
 =?us-ascii?Q?KINk4MQD5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: JLQiAuVTGdu8T6bAIabc5CodEbhTCpegIh/q/lI0UBi6K74fi7LdgBaceqWRUvqzhSMLOwM/gaDgC539ismbel9YPUby4B+g88NkU7uGe99L4UxmbWPFaRnrpHv8Arka2lL/9zzG0ZhfCzaOaB1jWHhGfvnqHMpshActBAlS4ZUcgK7jlJTmM+sUasTndKKLun0hSQiErKyAMToiBVj3tclF3R8aLQteovSm7Tswg/vqZnNIes7eNjAWXaeYg2e0YpfOVFvYlaJOIFcpqXucJufs+19cqbxxa+XziBlBG8BPtmUzCI6MYLtKVn/LxX0HfSj4tG1M8Ht1/gT2/yVGxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 794d10a5-01bd-4ce6-8d12-08df14ec34c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:48:04.2037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bUiR7Gd6hprTqWqDrd3QcW9jEJ/TH4ltoHX7wDLd7/s/Xfbf/oovHeU5RBEAwCQXk6DekO6b+kR78KhghTYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2026 at 09:53:18PM +0000, Shuicheng Lin wrote:
> A TLB invalidation issued on a wedged device fails with
> -ENOTRECOVERABLE. xe_tlb_inval_issue() squashes only -ECANCELED, so the
> error reaches callers that treat it as unexpected and WARN, tainting the
> kernel on a wedge that was deliberately caused:
> 
>   ggtt_invalidate_gt_tlb()     drivers/gpu/drm/xe/xe_ggtt.c
>   xe_svm_invalidate()          drivers/gpu/drm/xe/xe_svm.c
>   xe_bo_trigger_rebind()       drivers/gpu/drm/xe/xe_bo.c
>   xe_vma_userptr_do_inval()    drivers/gpu/drm/xe/xe_userptr.c
> 
> igt@xe_exec_reset@gt-reset-fault-injection hits the GGTT one, turning an
> otherwise passing run into an abort:
> 
>   *ERROR* SIGID=102 FATAL (-EIO) WEDGED: Device declared wedged!
>   Tile0: GT1: Failed to invalidate GGTT (-ENOTRECOVERABLE)
>   WARNING: drivers/gpu/drm/xe/xe_ggtt.c:588 at ggtt_invalidate_gt_tlb
>   Workqueue: xe-guc-destroy-wq __guc_exec_queue_destroy_async [xe]
>    ggtt_node_remove+0xe3/0x100 [xe]
>    xe_ggtt_remove_bo+0x89/0x2c0 [xe]
>    xe_ttm_bo_destroy+0xcb/0x330 [xe]
>    ...
>    xe_lrc_destroy+0x74/0x90 [xe]
>    xe_exec_queue_fini+0x2d/0x60 [xe]
> 
> -ECANCELED and -ENOTRECOVERABLE mean the same thing at this layer: the
> message was dropped rather than delivered, and the fence has already
> been signalled before the error is returned, so there is nothing left to
> wait for. Squash both.
> 
> A wedged device is only recovered by a fresh initialisation, so the
> error return in xe_bo_trigger_rebind() becomes unreachable by design.
> 
> v2: fix all invalidation paths. (Sashiko)
> 
> Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
> Assisted-by: Claude:claude-opus-5
> Cc: Sk Anirban <sk.anirban@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tlb_inval.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 7c3bf32d9258..dd1030de9ab6 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -280,7 +280,8 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
>  		xe_tlb_inval_fence_signal_unlocked((__fence));	\
>  	mutex_unlock(&(__tlb_inval)->seqno_lock);		\
>  								\
> -	__ret == -ECANCELED ? 0 : __ret;			\
> +	/* Undelivered: fence already signalled, report done */	\
> +	(__ret == -ECANCELED || __ret == -ENOTRECOVERABLE) ? 0 : __ret;	\
>  })
>  
>  /**
> -- 
> 2.43.0
> 
