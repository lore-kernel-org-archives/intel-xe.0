Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEB9C001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 18:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FFC10E3ED;
	Tue,  8 Aug 2023 18:25:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E555510E3EB
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691519125; x=1723055125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sK4kFnw/AfpcmQ7zBNq4SVnyqCFrXovCEksIjMBy3wc=;
 b=gFM29J6VeudevmwDpcMz0JXUTSjelTskqcNlp7R//hH19PuJYtQaQ30t
 65P7F4+VpWSDailJnGtGoiokcT6ychOXLy0TBf3hsMSvNWGtpFjZJhjnq
 GECfjoFtBNHe5OkwaRcDwBdnNe8KOut9vMcIpBo3GhUNGmvgRaceHfY1t
 h3zNkmYK2O2oXUQWiHTS+hetZ/3B77w6NuTSPjvFpHFAGWzYz77R7eEf9
 ASLTh/xekheOg2OQJE60fLbF1hEV95yXNUWEsZS6ubGL1kL/Lx5/Da5on
 rH+TnXS8Nvs+POUJzaCTEEMwM19/gGvmKN61ARJkJRBHGTknhDl1+YokO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361037406"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="361037406"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 11:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062137180"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="1062137180"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 08 Aug 2023 11:11:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:11:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 11:11:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 11:11:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 11:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6szA2HDGxgEK9AKZYiTnJcG1NNvqpSv0ZghfCNVwNxEvFskLY5/hzjrlO+ERrxWEj8W6Fz2/K6LH7gcRbZUWTUbVyLrkSIWtXv3UeIY7LZdWCoLAKNjUfEe0gfEV/gWcVoZfGS/NAzybH25ong+PZvngPQtiHDGecj+Je9dLTaly3Hssd0tDqvFjjQZSng2/m4M+GT1S8quQm5J7rtA2wKQ/o89i4yTlkONp0aYiNh6QUl5W8ltPpnevfKgj3ICNOlvlYAnOUV52nsbMob8732eDXybDrNUDtdZVICkoZg+Kz5VCimF3wNVxNAzdhcPwwCcGctdIlGfWwWNJsMkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9ADeziO3WVrZ0WMuE2SEah38FaN0bcV4R3dABvQkps=;
 b=SLIE2kaoZJMV2c4bqfEfgRMxGrCXbsHsiShuIyTWJ5UIjB2CXz2e4e0DRNm8WMcjSaQ+jeLTppMafrAZlbPjPq/Nsj5x9V7fiZJZ0kOcy0cEravXLG6WDhconRiLZooQCrxMzdi5X2oeeP6Om0KFF0teAWxY99TmPQV17vAcEe9+LkA8bfiaKbCLcxGcl5tf81GzceBqAb+sznomZSXsJ4//rQ7OvtkifbXiRn93z8GHYW2FEu0TyGg8M7iznnQfvd5Z8Y/UguHqQcjAnimjuAEEvMn3Jo8ksY5w+dcpu3cPnDxfOY2GHyzHjSuoHMzDsq1mlkIXlZyrv6DuNvL1Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 18:11:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 18:11:00 +0000
Date: Tue, 8 Aug 2023 18:09:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNKE7/NrO6fKlKiP@DUT025-TGLU.fm.intel.com>
References: <20230808091903.114939-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808091903.114939-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 98cc557c-b908-4f33-6b54-08db983ad208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4U69d0vh/CJuKvHrqAJ0hIMQBoV14HilXQGlwqruXFVarwhlWg5xebGyZkDA5IaWTn2FKZ1vC2XwDGaSSmDWK67GZWnNFdiIbNtGGPxqUcRGK4frviphQXh6UlBQs8EWDYLbSzwBrY1GQEUk/ZHMbUSFrC7/KTnbCcwB2aHAyqTuAOZ9weUzRhuPNz2SSG6MMKOCwBsMp+fzICTvMegd+u4LGUJJC3Bnm1ciVGSBnFFOnLJndZOexTVDFdNoAYWGXbGIXxOkNFsz4+8yUE/XE0oruIgflNzDDQWSbKEoe4OKrp8PrCHet/2JvRAiWSo8PJGHnM+E70Q1apIBcOj2/TWYtMj0EHz5wWgGejAjr4/vtZbN0G1Kiso7JUX/j9jhXeXxZqw1gjq+kVb+FYWoSNwrTmPC6R3mlKtw1NXne1aDy54fJSdi1q/Jx2pxYAycTYEgr5ZcuvvaLVgwkaXN/ZsrKPT/wvunZG61FZ21O4exug8XsLU6rGSa1ryQ/95xV8zXTJzNT0jEsQeWzZc3IpKlm5GXXFjhvgYFjpEF73pLaMM7TJ6kVjUEdLuR5B0d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(186006)(451199021)(1800799003)(316002)(83380400001)(4326008)(2906002)(82960400001)(6862004)(6666004)(8676002)(38100700002)(8936002)(6486002)(5660300002)(478600001)(66946007)(66556008)(41300700001)(66476007)(44832011)(6506007)(6636002)(86362001)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bb4BMVDEdr6RnjyyRHelRUONthcJhWE9QPZp6luOEhCcZNKou3iQuJeHG1Dt?=
 =?us-ascii?Q?JpfIor2ceqxGDOxZsyYqB5bjGD23lqXerKmgc3kiy4WFFlFanBzmCYROJhhk?=
 =?us-ascii?Q?Rq0YMiNWxSt05MEI/g5rOUXRhWiyjJomjAC27aMCJXWna4SWJTBx1/XXeFmX?=
 =?us-ascii?Q?+tldZ0QsKG066JdArhxRBf9WKhxwCH9pocRfBN4xM3XEZreOxnxQWKDE8UjG?=
 =?us-ascii?Q?kDvcwD8uUFs1APJK8XgAhZI4pYNF3wtjSOL74z2xdyT8Uzr4VSjcDVPMyKEq?=
 =?us-ascii?Q?YMt6yFZchsEVZ8sbfOMS0t4BCax05nW6CBNbkI+1JXD28QRzoavf8CvPzx9N?=
 =?us-ascii?Q?eS0bS1Gm1UoqYlZfo8FqhlUK3vVca8qO2wGmy9MFAAIAcUDZLCWrd+W/1Om5?=
 =?us-ascii?Q?98Op89nt3JPmwWVE5agRMkAUOSiuE3iMODcJG25khXl13VxkSfaAoaEVma4U?=
 =?us-ascii?Q?7j9biG4LTIPHHrAecai8EAN7QI9cuyqc/gGQiER3iyeYsFyLozXy+G0DnG+L?=
 =?us-ascii?Q?abcwdc63KESp+4GsDqKe2sP5YVvGlc7QJPmURCMbNZyOAGrLTwm6t0ioYfd3?=
 =?us-ascii?Q?/CcTYYgGD+iMQ7BZLKSjY8P+bo5NeOQuCVnZImQBR0tsXtUUv+SDhZEkJx7g?=
 =?us-ascii?Q?kmPeN4l78ruqdfiHlNW6L+95VU687bKpCYuCfmn7VjrCMT/Z1BOjwXQ8ok8J?=
 =?us-ascii?Q?vM+sD/GdqLRSBFL856FPZduoA837M5L5Wzz04zUYbqHp71u0gA7ICd8QIsW5?=
 =?us-ascii?Q?DQ7+z5MxL39rr9tRFBsn9HfcgVec/YSTBqUvoKI9diFabrl3AxrYNwfTSp3K?=
 =?us-ascii?Q?qtxF4KnMjAxme5mAnhwB/WXlMJN4EL+RFpEcLoCdVGLVBLZCysCiCenxVnin?=
 =?us-ascii?Q?GkpLubIlp0PVW2V4JONXudw41o/+wUOwEWqghKI+od5xmKzvFPABxmAde4ao?=
 =?us-ascii?Q?UQQhrqa0U6qX0S2RU+cVoTVBtKcYg7s92XxQ2/GQyRCIOkavqonJ/v8QtmOy?=
 =?us-ascii?Q?dOHH5pW7jhSM1xlCo1A08V0DzyW5K/9ixaiDvB+873DyJFlXQ/8kk1Sylqgm?=
 =?us-ascii?Q?C4Hk5SCRmPdj7V3YOKupKTQoj4fawLp8J4tjawXUFyKwljJp68cVaLASO+Gj?=
 =?us-ascii?Q?vmIBBVEiBPw3hLsAB8EhxyJB0CzesCA9uF6P2itBYFWn8vJ8TRR0ISEmbeuk?=
 =?us-ascii?Q?X8fb+rRMhVb2C43Hu9ygpL+2Z5K85eENPLxRQLxjuHCxVHEhnRyyehL4Q4in?=
 =?us-ascii?Q?L+Vi+n8NrFCX/prlrGkMYZXGPJ6pNrqO+KFkf+PoCh8eIEYfyRqDwluz/f18?=
 =?us-ascii?Q?4u5ryaPgQZrydjW3BZQbrsYAml6Q28GjsZR04075oqkpwWb/hmhItEekJYMB?=
 =?us-ascii?Q?FefNuzL5H3szeBgAm0crTXlDWA6qp6KgC3NOLqw09Zk0sUU5WXdVTAY607dF?=
 =?us-ascii?Q?s1N0CZk6q1UJfNkf351JZYin3xnx5fLDjK8WRnJqT5t4qeCgmS/aah3pZB+a?=
 =?us-ascii?Q?TlQvVXXeB7Xhr6WECEx5o6+F1DpTNw3HKGiOs2qVhXTo+kTPDVet+92aj7uV?=
 =?us-ascii?Q?BsFZZH2mwBSvRZGkVUxRsjSUl7O+Nahxr7vuzOVauuY4UFwqN4jPwTX38axC?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cc557c-b908-4f33-6b54-08db983ad208
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 18:11:00.4422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pP1UzNyk3buek5hOusCim9jchD7Y7fG1B+ZGRpTa1rsanoyXVvu09BFCQB+IAW0SHjWmMglODP/H0+F9+5E/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/guc_submit: fixup deregister in
 job timeout
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

On Tue, Aug 08, 2023 at 10:19:04AM +0100, Matthew Auld wrote:
> Rather check if the engine is still registered before proceeding with
> deregister steps. Also the engine being marked as disabled doesn't mean
> the engine has been disabled or deregistered from GuC pov, and here we
> are signalling fences so we need to be sure GuC is not still using this
> context.
> 
> v2:
>  - Drop the read_stopped() for this path. Since we are signalling
>    fences on error here, best play it safe and wait for the GT reset to
>    mark the engine as disabled, rather than it just being queued.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 52c61f78b083..6126ddf2fdd5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	/* Engine state now stable, disable scheduling if needed */
> -	if (exec_queue_enabled(q)) {
> +	if (exec_queue_registered(q)) {
>  		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
>  		if (exec_queue_reset(q))
>  			err = -EIO;
>  		set_exec_queue_banned(q);
> -		xe_exec_queue_get(q);
> -		disable_scheduling_deregister(guc, q);
> +		if (!exec_queue_destroyed(q)) {
> +			xe_exec_queue_get(q);
> +			disable_scheduling_deregister(guc, q);
> +		}
>  
>  		/*
>  		 * Must wait for scheduling to be disabled before signalling
> @@ -901,8 +903,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		 */
>  		smp_rmb();
>  		ret = wait_event_timeout(guc->ct.wq,
> -					 !exec_queue_pending_disable(q) ||
> -					 guc_read_stopped(guc), HZ * 5);

I think we want the guc_read_stopped here as we want to pop out of the
wait if a GT reset is scheduled.

> +					 !exec_queue_pending_disable(q),
> +					 HZ * 5);
>  		if (!ret) {

Then here we want the check to be:

!ret || guc_read_stopped

As we want delay the signaling of fences behind the GT reset.

Matt

>  			XE_WARN_ON("Schedule disable failed to respond");
>  			sched->timeout = MIN_SCHED_TIMEOUT;
> -- 
> 2.41.0
> 
