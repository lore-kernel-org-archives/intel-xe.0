Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DADC7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 18:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBB810E1FB;
	Mon, 12 Jun 2023 18:17:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895610E1FB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686593845; x=1718129845;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dinAqHxaTM3o1Iu9kHzPvra9zQ/Td5++Bek4XVrmWio=;
 b=n5J3WJwu9t2aIEvN8BdKtjpxNtYzRfrg0klsj90Kpu2yqPWgptPAJW3T
 QUtXFjTFanbqIemX0R+TYojMolwZy6KnvyuG8oQB2qki0JqbkQCxH0R6Z
 ZHE1XTJleZL7tYphsx6oSomE1LYWzuUjISYH2yOftKDpxtPo3dkYHmOnA
 r28XKjiq4/Fzq3FCzlmavqQwOh0I/5po2klAAmn8Vuz3HKUclg75ytsDu
 OPIOk7qsCw/CD8w/OWB8Ofhnq8jobw6OZdGEHV+eUEA1KlRyp87UdF4Ar
 uFhZobsfysQSe191cUquQy1ET6c35YYQoxiVml6/w9O7UnYPF60P2Rzxm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444503555"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="444503555"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 11:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776494084"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="776494084"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2023 11:17:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:17:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 11:17:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 11:17:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 11:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIgK9cYyCMlBuU0cwMm+M0Vemhdb+JduN0Yll3eiD92IMx/3MCV3QbKi/eDTonTeQKuC3mumrsYPDUzJqbYB7V2tX9445yF3VPMX7YhXFXmyOTgZk3NC2aoQVMKc3W2wHjKoxYuILjmOiLhemIDXZdz1w93mgH2EtTDs+1imy2McmCqn51rU/9HWL8vwh6cOFGC0XVJ77XVuGpF8ZvG1Olptn+tZ6vIgGJKU+h08ejFZGvrzIsFQE+dolQwBJbQk+uIkmh9/njHd/5unh7CpcDSVwWZ+F8M7Khdshqid66Ab0vRKJY19IyKQQ3BnRwa5R7frYSvsvRJAmImRqypR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF9tDFZl7j0tlBBcjoqJbNN7k7USNE1ldVMoWaPxvPM=;
 b=mla0btjO6CLhkg2ZC7CuevQH8etcFyJdGKIbRurCnuqL+YmME4PMksfO7SBlzhs+29Xmr4n2yFyxiOAI8gTKRvaMR5H7/bWwii7OcSuO2YsBpas/am6NpaqMWUYIDyr68YANZ105RvUS/ZOyOTPdVVe/0RUpr4LcYT7Jeo3LBTI1DpXI6tRpAPCjx1KSuD/H99i5KoKLmd9MTTEu5JNwP6HklmTV+MFX38XRuV1zBa0Nk1vGdWt3xbwDm+9JloiZ7G583Lg+tVFA/vDLQqgW7W5mBwrSgPoj1zn6DkQX7DbnOORfgqdFoC0bTJ7qJdZ+cnpm6xaA/jKN36LJ0LR24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 18:17:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:17:20 +0000
Date: Mon, 12 Jun 2023 18:16:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZIdhA1BDeCrl7VWb@DUT025-TGLU.fm.intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230612171225.88689-6-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: d20ec2e6-2783-4d66-3038-08db6b7142b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmKTuEFHLp1nfe8JNJfJ7CfqCGA3KHELVqqmW9EFDAKQkM6aF47LU1jJ/MQJbysMv1fi+6sVyUHlIzYRja4/7rP4u1oLvVPL1g4+QOzRWa3jy4viu9IvmEwO2UPIemi5yA1hGR7HcjJhkOEpkdAYUKSu+aWT8cglKXjzSoLFadnutxMimvZDS5njYDg8HQNOLA3loUUiZYrbeoGNU/IZ1Ii9w+F59riDcqsyH+OrvyLiBP6O8rf3hqMKuo/g3eHMy1ckXXyUHiIdqw9w5Wx4PleiYCpeFm1znEkvDbni7q/4WXbAkVYtarxaaxNOgSZldkLAUigMhtlTpGmKEuXdJWsVM4cTOqQ1AAKRlUEvBAQy4ZeafWNwzvZy5V4efetaEgkDb2st/J2WrKf9ELHt+Rs+RPKOb513fE4abVd7/YLtVB6WYgei1YZCoolenWXWK2SbbYhm6aN1R2Bxn9NMZogzVxiWe8GWoAj6Q1pk4ABLbyiFSw5YAqAxSyooSGYLlPl96Y8lbDcJvidyAeN3e5METv3ZfbZk5VHHBEp5IjPCBwTXqzXl9/+b+RoXqqS4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(66556008)(66476007)(66946007)(8676002)(5660300002)(8936002)(6862004)(478600001)(6666004)(6636002)(4326008)(41300700001)(316002)(6486002)(38100700002)(82960400001)(26005)(186003)(6506007)(6512007)(2906002)(44832011)(107886003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bm2mhBws+BVx43pn8Bu/yPwGnvaW87YPkbJFdLekja3erfOV6geREsmON8Hx?=
 =?us-ascii?Q?4tQVCrVCpuSkbOuV1IfQ8qP+4Kbyg88EgaTHUuKpBF7ZHOvghX7tOcL4xI+A?=
 =?us-ascii?Q?dds+W8vgt3R+vRjWFOwvaYyMwDsNkYsCg2rX+NhfPwAIDOj9OqeqgZBHDupP?=
 =?us-ascii?Q?FiIp/5/WQLf1jdnzQTCymEzfk2+qiJvhMrQJmtMNDnbQQKCCidBgeTQ4V6vT?=
 =?us-ascii?Q?gC8Po6eYnhVbRMaF8snrPcsKYUPNUM9VUrK/vZbos2r7WXRSttwwacf52Iqo?=
 =?us-ascii?Q?8f8V8DJJsa47eu/Uv7JquGJ5qeN3TSd9MCMT2Fg2t1iImRV/RTUcrChl+9FF?=
 =?us-ascii?Q?D97PnmwPkimSxBnGjzeRm09KlSYOpdebgPASw9qu5bwBigNPPTe7/N5QRB7Q?=
 =?us-ascii?Q?jhZtK7lEx+OuxMwi+IqfpcYe1vs5H4fij21rXytw65tQgNwNkR3NnSjcfhmn?=
 =?us-ascii?Q?uvQLkK1BAiQjvCUAfiIu5tbMbonPOe/rrDsk6ocLa6MuBYBqzHGDsniPFMAa?=
 =?us-ascii?Q?N2sXbVEw5qRyfCBEdr+Z775nUNX9qay4T4Ay3N142He47FekLndsvKEJ2QuG?=
 =?us-ascii?Q?mBXzZ6vSbIrJ0y19XtE0MZZFnKy2O9fMXi2DgMV9Ey7hwhA/ve2Zcw5cRZDa?=
 =?us-ascii?Q?T/L2iHYJBw9Z0VWSVYPXNMCJF9lIQ3w4MhaLoHQ6+jpyiKfu2vlPvbncS1JZ?=
 =?us-ascii?Q?Y5D4eoxStoQx6bzuO4jJ0imd+tGoTVSzmgKvsHqwPqQLDdoNY+t/m+F11nYE?=
 =?us-ascii?Q?lg0KlEH3ylvVmGc6fBIlPeMGpFz5NhzltxDVNbour3dlWQJAgznhC7zWQJzs?=
 =?us-ascii?Q?U30dyQ3gFlVydvK3x177FZLVjzVRFxR9IIS2i+am1o6VR4b0ZJZ42dk1YA6d?=
 =?us-ascii?Q?qvxDNz/IoG13mTQ8jUgnPwCOwZQEiESG7iqEoQu9awHsBqh37qyTe2keox84?=
 =?us-ascii?Q?S7uX911sqhM+rAjKOjopmiwM05uIyGsLp3fSI/3djRgaLmjT/kCMsKcGl140?=
 =?us-ascii?Q?2SzNSRycAsWDnaMoleKrP2b+HQtaw27h9YSskpk0W6C0Tav3Q47MQj2QM+XM?=
 =?us-ascii?Q?8XUNqM8W2HOttj0s5bPYEweQxnKLLiuoLVuaIKk0yCHhFDmBX357M52Ge6cR?=
 =?us-ascii?Q?8+rgqFLXNgypcrONjRQU5Qn73bHOik9jcqI01aFksftP1zUu7m/IeihG6UdD?=
 =?us-ascii?Q?t11J8xdz0DBCHosv7tbepWhrQ2KUxlKLCaTeiGP+V1vmzfEM+gYeHPoS61Tc?=
 =?us-ascii?Q?1K9GZ3XOSQBQrA5Gs6BWeX9WrLk6fdFRabL8ha9flWqhCMX5mFA0sJ9ESMeO?=
 =?us-ascii?Q?/u2ovrgBe65xuL6gd77DQKt/8hCE1ScFtRoij1IK4Mq8MMkIC7YVQyugvCli?=
 =?us-ascii?Q?Sg86jeAinzilbybbjRoLrfXnYCq6M9mzjqLYfs4egW4xs9AVXX6dhC4U109n?=
 =?us-ascii?Q?uVuCqLoUp/x1OOonooEl8HsoPZrc59CtvZNupXwzOR5wtuPGYw+V/7Ordj6I?=
 =?us-ascii?Q?iUGbVEzJPwNHBdJjk6i/yhMirvO0zyzwlTARjT9+NQWtvJT2Zf3gAm6/hr7X?=
 =?us-ascii?Q?lP2Syy9GlKhSF3FXj7rpobzHqz+2jZE+lghP63u4IuJRjvOUDnyssE9J8B1r?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d20ec2e6-2783-4d66-3038-08db6b7142b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:17:20.0218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smxoNgvtcaNjOxlRC5SmN+fZPbXqPASuNwIkuedw1eVnNs6jDqWXeW+bd51a9b0ckkikec46aC60/ovtFFeAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v11 05/12] drm/xe: ensure correct access_put
 ordering
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 06:12:18PM +0100, Matthew Auld wrote:
> Only call access_put after dropping the forcewake. In theory the device
> could suspend, but really we want to start asserting that we have a
> mem_access.ref when touching mmio.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Same with the previous patch, this wouldn't be needed if the force wake
functions get / put memmory refs.

Again if you leave it as this patch itself LGTM.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 8 ++++----
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c     | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2458397ce8af..2b8a5b29d281 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -530,8 +530,8 @@ static int gt_reset(struct xe_gt *gt)
>  	if (err)
>  		goto err_out;
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(err);
>  
>  	xe_gt_info(gt, "reset done\n");
> @@ -574,8 +574,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  
>  	xe_uc_stop_prepare(&gt->uc);
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  }
>  
>  int xe_gt_suspend(struct xe_gt *gt)
> @@ -597,8 +597,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	xe_gt_info(gt, "suspended\n");
>  
>  	return 0;
> @@ -625,8 +625,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	xe_gt_info(gt, "resumed\n");
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b5a5538ae630..98dd3b2506b1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -45,8 +45,8 @@ static int hw_engines(struct seq_file *m, void *data)
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_hw_engine_print(hwe, &p);
>  
> -	xe_device_mem_access_put(xe);
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(xe);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 67faa9ee0006..0991a3c49480 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -835,8 +835,8 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
>  
>  out:
> -	xe_device_mem_access_put(pc_to_xe(pc));
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret;
>  }
>  
> -- 
> 2.40.1
> 
