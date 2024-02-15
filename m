Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3069C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 17:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833DF10E5B9;
	Thu, 15 Feb 2024 17:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYD0ypCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D8A10E5B9
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708017261; x=1739553261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h1WsQF3vWUhtlLmEFnXOSnX9c4dPXj+EFSYzO1VxC3s=;
 b=KYD0ypCjVgPAy48e6N3OnPAGSQLLCMR60yPA+jHTzGz+q1QvajoqMxQ7
 qORthstqfiMKx7bo9qaFy1fNJdEaMXCG3D1ytkf7x6Fcw5AHNLftTtVm3
 qAjt2p9n3V6ZrpwoN5+FJMRH78MIc12+r89PTxh9xNbr7Lhw7esnABHwg
 7hXNRABX63ZBSi91NSawzVbItb4oHh2znOxgoS0lYsHYe+97iqRX0GGVo
 tv1Kr7v+X0NkrpXIAo2zSyhgff7xzozR7zEyqdgbHY1xexhRMep7EmB1s
 sLbsylkrvT6RkXWXgd4wuQNoSl+ydbb+O76k3Xx3V2P/RKYg1giiOp92i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="1991501"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="1991501"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912196443"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="912196443"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 09:14:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 09:14:20 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 09:14:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 09:14:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 09:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYPxUBif3Z/kq+jjXXrKe6XvlwloypzEryX582pFR58LYPb/zjmj2EkQ1eeyfh5RDWFPuVNUlkb2ORKccnl4HTPePnNye/5ymdFDH7EOc2kqB/U+w/eqUXFTBCqs83EJhhAqao7ONPdNjSrdxsY8GVxqlMHEZEFFVPCjNleuX0Yi7pF+kurTqjlkCZvjrsKIqcJEQn+DkjiX7NNzksjmeZ8bgOuqwrNwVGsorb/Pm3WUf5GkgDI/kmEuuJ4fhI6ifWBNQxQ4iOAp7KPhU+A0wn7Jd+zKgzYbEBRcZncFjcjnNNala4W8k6xdgqOE/O0lk6YhFCkHT8LSP/cN2PxcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSjwFRex3ppsKuf4g/c0Wyib8KIe3KfdPH36gGljBJ0=;
 b=f7v5r8jf3yCbKW8no0h8AMEszmaeP5tOS7W8p7gkyM6u3JiNQ3y0SA36f30dymszHFLFRzeOU59T5JMq1jjMTIvp4CR1BhhiNQ/uEmDX4MjXeItbNDnLTBkYds1hp9dOutEUX5bI0EtpSEha+u1n9P2soOhW92zkiJ9IFoKqCZ9VxE64c/v/zaJCmUk0t8p6lKZCad4R1O2hYHxHFh67SgCJPjmLPDNxgkG9spBmmf3njNNxSPCH9ui6f41q2Z8xuVuUdra2eq2FJY30PUKADJCVZOfu8IJ79eRHVPwncxsW5GJpe2WRTNNiQi6PaTW7dCVcWcjEYiYQPCrz/QO9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Thu, 15 Feb
 2024 17:14:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 17:14:13 +0000
Date: Thu, 15 Feb 2024 17:13:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Expose user fence from xe_sync_entry
Message-ID: <Zc5GRRG6OuSDMd3G@DUT025-TGLU.fm.intel.com>
References: <20240215164021.438913-1-mika.kuoppala@linux.intel.com>
 <20240215164021.438913-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240215164021.438913-2-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d15db0a-4114-4032-e315-08dc2e498881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfefOoN1lq104UgudtZAeXx1bbzA52u1Oq7F2O3ywYODlj5KgL5j9e+HVS15un6JJFvYg12FZ4T6r57rDZbFJqaSzZFTk55ELCVh4ieQRVP1Zce5DS3pJxtrutWVJuaSwQGvYQ9BC/FxfeMrjrdwsO+9Wnyn1cPlYS3AwaANCSrUmaWzYfBw3yOm+uXdM+GdsNr4q8+lKg9FhVaBz7ospyScwyb9pnAMPFqWui7d/p3Va7KgEqOgE2GJdbt2r6xULf/giBhdgF4LEZ0tIVJ96SX1Tryd+om98+9c6U0Ro1mcEN9fr0kaN6SSwtbqwS9Gik01o89LIjJ1J/mwbqrN4mEGf83wPCTHPfMUe7jpJ2YoqLX14umAOj2t06ole/SYEruY8k2Nc4XoGvUMFbfc3iaLwi5NxaZuALnklX6CBSocY8JSqooUrWvrRCNo9HMGW1Nhb+s5uDq3NJSDQAsAoXk1cpKk3dIvNpcbY/R+UblM0ayvAIlQhJ2/K3x2wXBWVUXK/7te2+DEm0wuodX/AR5AATzPhRXMYlVxLhg52mCcM8hjpqX4SBBAZdP8CfXl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(6486002)(6512007)(6666004)(478600001)(41300700001)(8676002)(8936002)(44832011)(5660300002)(2906002)(4326008)(66946007)(6506007)(54906003)(6916009)(66556008)(316002)(66476007)(83380400001)(66574015)(82960400001)(38100700002)(26005)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f4L1fTOooNsYiaAACqNTwzHmat7h/pIygbjcv76tcsxa4Psg0SjMi7UvVS?=
 =?iso-8859-1?Q?JJnwM1INw5jzpMQyhXr+zWVdyVE9KckcjKhH67hYHUbqiuQAQ7VdwkHnPh?=
 =?iso-8859-1?Q?2dGDmwp/z6vA3ga2SD6lG1YWzPD2MR2n7L4e9BDuELOaB6JThbnmVhuJ6l?=
 =?iso-8859-1?Q?Rl6obIPly4xT8daKNoAu+mGU2HvnCsPeQ8PDDKbW3hw+YzIqcwUjvx+PWL?=
 =?iso-8859-1?Q?kCq5ZJl5zQkOUnQ1wEkBf2f8mo9ZmmOEi4LsNjHjW/47edhX7/Wyi3xJei?=
 =?iso-8859-1?Q?MNyaBneq5j5jCZ8JPSoHS6Ox7J3MwIZPn5BIirp8isqbdpyooGiy2Lcu6/?=
 =?iso-8859-1?Q?A5cqSexva2+P5jE19ycApBkelbBvARKvCR2O6RSLq56zGtyGOVyE6zSAb5?=
 =?iso-8859-1?Q?0FLTXXatOnGs8mODt96+yoIsuXfzMhbYKB8Gbr1bNieFXrWf2xkJfQ02nj?=
 =?iso-8859-1?Q?YW7AwiZ6afjqhcWLKYEBOcVFZPRKBC2o/BaqZsnq2gj/dBrYnVQPXDU2Em?=
 =?iso-8859-1?Q?pPJ4d28D0D3ENWw3Asp7eYNKjiMqDkM3KgOgN4utOQMXMhlLQArAUE+80g?=
 =?iso-8859-1?Q?d5jkPUy91NBe09uLmJnL3vBXCxgqSVOaIUdFc1KW2CKzkaNdwJzODR5qrg?=
 =?iso-8859-1?Q?uOveJF58O4UphT507wnLYDnmThZxCvg4pO8cjD0cUbQjli99DkeJ9+6KEW?=
 =?iso-8859-1?Q?sQW+23cdYgCQmxwEK6g4F9sGnWA81AfHwaeICiGAbTLjJk6aehXgBQM48N?=
 =?iso-8859-1?Q?LuwVr1NtQg2kDEpSwo7Z57FEtt4Cad932QSzW78r9Jd/sBQXuf5oVZbsID?=
 =?iso-8859-1?Q?6islA5VlMKUN7A6skX0fXF9gVtdOus0rV9OMk9QGieo3udRZHPr7aphkYQ?=
 =?iso-8859-1?Q?oTrHTD6Uyx66/o6NYW+5mR/vZ1ccuOa1+UsMpXDWQ1luaFgzVtyW2pFcdJ?=
 =?iso-8859-1?Q?t547tEX6oUhIUPlaiJbtuMdA6MEjWV6Aa411XteZPT2Fvg9SkskcDD1mi5?=
 =?iso-8859-1?Q?63W/c6EycuGdtaVOeSD/SZACTZhPWmqfMrLrt5FiwBgoFygBMxNC4p2P08?=
 =?iso-8859-1?Q?omxRZFVOzpXSoi1JhbLoeKUmbIxcEZQ5E8+Z3M4Mo1X9LvHgpaqE+21IPv?=
 =?iso-8859-1?Q?XxosfNcrfjSPyDwTqkH6J0dLNsn6jrcGLZFEQ9wXnBxWIx6qfcfQmxwsVI?=
 =?iso-8859-1?Q?ZOIxAIV82muC8hJGaKR55NwSusT2R8Gww0eRdApUhSjKsx6jxgBmvSO24z?=
 =?iso-8859-1?Q?40WZboJGwG9Fy9Coe2cGWX68/bB9XuobU3721hBcjaQFQshSsARhiRMveP?=
 =?iso-8859-1?Q?u1l22LQw+CHi/Hcmmrvkg/JtOTI4B9HTcUXvSNXkY31lggJGiLJjSuYhST?=
 =?iso-8859-1?Q?kHD824OpmT4L7pPS8EAVJJgUboBCXvUU2rYOyTApf9XX/xQxosX7Gmvobl?=
 =?iso-8859-1?Q?ussr7bdca6GuTS8Tw+hQkOoyvfY/ziqs7T0m+YOzxjt5JrDK6G/jocgHDs?=
 =?iso-8859-1?Q?6u5XdAaRiC/pwtM9iN2E5C2L6ScMO8sSKl/wiwP9hdGUz1srK3SCSH1EYp?=
 =?iso-8859-1?Q?E8Ti27YfTGtArJ7fiRsYLkBAycDvbPkALPmqLGE72Fa2hDN9DjPo2xEelh?=
 =?iso-8859-1?Q?Yvathi4dUvmTMgdurNiN+WrM+6Etw2IFeqrkM1K8yBeAZ83jgBGnk7wA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d15db0a-4114-4032-e315-08dc2e498881
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 17:14:13.8782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7I5E/ETAahuIxmMeDw5qPul0z/YqOxIbBUhio9WvgOt01hGGKzrkCRsApq6cJecjEyzfrd5Z3YQIaMxHepcz5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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

On Thu, Feb 15, 2024 at 06:40:20PM +0200, Mika Kuoppala wrote:
> By allowing getting reference to user fence, we can
> control the lifetime outside of sync entries.
> 
> This is needed to allow vma to track the associated
> user fence that was provided with bind ioctl.
> 
> v2: xe_user_fence can be kept opaque (Jani, Matt)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c       | 56 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_sync.h       |  4 +++
>  drivers/gpu/drm/xe/xe_sync_types.h |  2 +-
>  3 files changed, 52 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index aab92bee1d7cf..98828186163d2 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -19,7 +19,7 @@
>  #include "xe_macros.h"
>  #include "xe_sched_job_types.h"
>  
> -struct user_fence {
> +struct xe_user_fence {
>  	struct xe_device *xe;
>  	struct kref refcount;
>  	struct dma_fence_cb cb;
> @@ -27,31 +27,32 @@ struct user_fence {
>  	struct mm_struct *mm;
>  	u64 __user *addr;
>  	u64 value;
> +	int signalled;
>  };
>  
>  static void user_fence_destroy(struct kref *kref)
>  {
> -	struct user_fence *ufence = container_of(kref, struct user_fence,
> +	struct xe_user_fence *ufence = container_of(kref, struct xe_user_fence,
>  						 refcount);
>  
>  	mmdrop(ufence->mm);
>  	kfree(ufence);
>  }
>  
> -static void user_fence_get(struct user_fence *ufence)
> +static void user_fence_get(struct xe_user_fence *ufence)
>  {
>  	kref_get(&ufence->refcount);
>  }
>  
> -static void user_fence_put(struct user_fence *ufence)
> +static void user_fence_put(struct xe_user_fence *ufence)
>  {
>  	kref_put(&ufence->refcount, user_fence_destroy);
>  }
>  
> -static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
> +static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>  					    u64 value)

Check patch complains about the indentaion alignment here.

With that fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  {
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>  
>  	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
>  	if (!ufence)
> @@ -69,7 +70,7 @@ static struct user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>  
>  static void user_fence_worker(struct work_struct *w)
>  {
> -	struct user_fence *ufence = container_of(w, struct user_fence, worker);
> +	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>  
>  	if (mmget_not_zero(ufence->mm)) {
>  		kthread_use_mm(ufence->mm);
> @@ -80,10 +81,11 @@ static void user_fence_worker(struct work_struct *w)
>  	}
>  
>  	wake_up_all(&ufence->xe->ufence_wq);
> +	WRITE_ONCE(ufence->signalled, 1);
>  	user_fence_put(ufence);
>  }
>  
> -static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>  {
>  	INIT_WORK(&ufence->worker, user_fence_worker);
>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
> @@ -92,7 +94,7 @@ static void kick_ufence(struct user_fence *ufence, struct dma_fence *fence)
>  
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
> -	struct user_fence *ufence = container_of(cb, struct user_fence, cb);
> +	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>  
>  	kick_ufence(ufence, fence);
>  }
> @@ -340,3 +342,39 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
>  
>  	return ERR_PTR(-ENOMEM);
>  }
> +
> +/**
> + * xe_sync_ufence_get() - Get user fence from sync
> + * @sync: input syncs
> + *
> + * Get a user fence reference from sync.
> + *
> + * Return: xe_user_fence pointer with reference
> + */
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync)
> +{
> +	user_fence_get(sync->ufence);
> +
> +	return sync->ufence;
> +}
> +
> +/**
> + * xe_sync_ufence_put() - Put user fence reference
> + * @ufence: user fence reference
> + *
> + */
> +void xe_sync_ufence_put(struct xe_user_fence *ufence)
> +{
> +	user_fence_put(ufence);
> +}
> +
> +/**
> + * xe_sync_ufence_get_status() - Get user fence status
> + * @ufence: user fence
> + *
> + * Return: 1 if signalled, 0 not signalled, <0 on error
> + */
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence)
> +{
> +	return READ_ONCE(ufence->signalled);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index f43cdcaca6c57..0fd0d51208e62 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -38,4 +38,8 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
>  	return !!sync->ufence;
>  }
>  
> +struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> +void xe_sync_ufence_put(struct xe_user_fence *ufence);
> +int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
> index 852db5e7884fc..30ac3f51993b9 100644
> --- a/drivers/gpu/drm/xe/xe_sync_types.h
> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
> @@ -18,7 +18,7 @@ struct xe_sync_entry {
>  	struct drm_syncobj *syncobj;
>  	struct dma_fence *fence;
>  	struct dma_fence_chain *chain_fence;
> -	struct user_fence *ufence;
> +	struct xe_user_fence *ufence;
>  	u64 addr;
>  	u64 timeline_value;
>  	u32 type;
> -- 
> 2.34.1
> 
