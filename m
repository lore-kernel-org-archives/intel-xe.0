Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4837C001DE
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 22:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B110E38F;
	Mon,  7 Aug 2023 22:19:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D97710E38F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691446783; x=1722982783;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zlhFdJrCrMrjkaYaf3Knk5Zp1OfkXKfTRWca9L0+iWI=;
 b=FTyqKWsfGDTussBvJgtHxdwoP7Wdu4hgvJpC1KwVHk5uSp4nxV8LwQV0
 wpTIObQiwSB5DZWoqxarAEs9RaOyMMPBPbau1o4eTTuXE50nAb8Rl83se
 3aGC7YQpSPDPTEoqDyA+25YoWpCnLaEisGjwEXaJDceSfQti7mGli6AYW
 k5i+IEovFIhIXnsmYcmQDM2lfHnrHGH0HOG/t/n1J3IdTlSsakOkxKvlA
 12xMTqncfrJSB8lRHD2ETAlBbkcNiKNuGtbScwTZmETvCKimZtvVXSNKZ
 FTyFW1UWLPOKLDHGRmAELFkxwExtdYY2o1h7E2c3aAaqPpqyVuvsXkpi5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360750315"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="360750315"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 15:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731141975"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="731141975"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2023 15:19:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 15:19:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 15:19:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 15:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnvdHkcH8zQyZWJnUXuz2r7wzhUXqHIP/2gDblJpi+31L/4GiyLbkfTXr1jwqAbqk0rWGGROjVG+xmJMjuNZj1pk39KwIJCW8JnXjQE47T1YtKfHVDo+q+Fazqc633WpvsSn5FoQzOWTVzTNUANrUHlvDP/4IqMPGuTasSyybAMwX9sXOjwcIhAtdYtT5gDsY1KLrQpJlKrv5j1bJlKvBRttVSACHitdz+yHW4H6xpNoEYrONH++tSJpNieoFtfFmKkuyDtIN/6fmG9pA3LxfwTOb811Dmx9TYOuXaEy74H8ElMbkxbs5bMknRjQtnsmll+tYcZElsUBNMAD5rd8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFkWnLR/I0FziZD4BuHYOpPM2niZQbzdxnflcM8kPGc=;
 b=XHi6hx6ctRUGT2mnfRdyHzV2uUuO4tR3bXH1FzNyXyqO7TkUUOYSjVtl2jMRGqJC9yNcdwhMG5VhlW4KkFDvQ78EcJpP9QA8HxZrnz8IbFfQPZ4X+jVDkkhX1o4KwwPHKx4wKrwidWETEklRj0lqx0g7K0UC4l0VHqUlPzza65sNppsjx3YOlqs9x1C4Yak2hywSD3WDIIZndRQAhjxUbkjsrlnNt64QLyclUd0gGE+aVbGARNCGz62Ilmx6iTXHT8hssbGXoEK2Qf6PgwK7D3OJ30WC0jKZ5OrJLhyeyd7SfDYKrHdSnU90kXF3qSZweTaXWKMHbtrw+aYVDoHrKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 7 Aug
 2023 22:19:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 22:19:40 +0000
Date: Mon, 7 Aug 2023 22:18:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZNFtuugPSWAiJQpx@DUT025-TGLU.fm.intel.com>
References: <20230803173849.285599-3-matthew.auld@intel.com>
 <20230803173849.285599-4-matthew.auld@intel.com>
 <ZMvytzGNetQxODNL@DUT025-TGLU.fm.intel.com>
 <61193ecb-9f6a-500c-d084-cb9df4ddd4db@intel.com>
 <ZMz/KtftMF/5Cd1u@DUT025-TGLU.fm.intel.com>
 <9aaf00db-135a-c89a-1d3e-4c88583a0e16@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9aaf00db-135a-c89a-1d3e-4c88583a0e16@intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: a24e5b94-fa07-4e44-bb73-08db979464ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3j8Uimc+rV8K0WKOoklcO8lFmHKGAQ185vkJxiKnRt82+6S6iq5Eh2p9R/VzadcTh/IiEI5O4DRR6iyZW3o9qGuM4QFagkT0LK5u4KTXbp8V3wRqCYD7FGwUFD2rpB3R74yUEtGd518kQGEBDxISBvfSdDaiqmSy3vLOjE59ZMjBvDisgFWGUeKtm06feN887yFtYRZkRjGGB4BFAVhNfd82q/yLVAXHiKfAxyjlCWzWoaq9TVhOyyjEhzWKmeg9fVZCr6ZfLAHkIoIN/NIXvDgOD1tfd+OPSxK8tfZrFo56L6xn1ioadP3zxUBCRyBICktaiuUxSnUc7uIxPD0gefyZuKgtjbiNQYMmrMWbxmoBD3y7f2dOchT0E454KE31FDg4sQ6U96jf6AiMlieX1dKBBy/Wslggz3whLHe8FYi33oTDTXd/KQrQ3PDfTN+aefMecFDnl8IfUY/5LRJs1JvfdpLsn2xDiBleAkyAIjlEdLM4N0fPTewhxdpSlUWj+OciiyZQsIbDS+DKKKgPMyA/eeAlqaP3B9h2QoTudme9IQu8TplfCcrxbvh8vD8q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39860400002)(346002)(366004)(136003)(1800799003)(451199021)(186006)(66476007)(5660300002)(86362001)(316002)(6862004)(6636002)(8676002)(4326008)(38100700002)(8936002)(66946007)(66556008)(41300700001)(82960400001)(478600001)(2906002)(6666004)(6512007)(44832011)(6486002)(83380400001)(26005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AD0UgZokKsQ6XqHdkCuN4vpLz8p8+dSltykPv6pJGyaYLC+KrBI4OZLRc+o?=
 =?us-ascii?Q?YMt8mjpa4/00BP/whM5IVATObbEaVPt6ABKEsGHetlOpSNS4Z9Dsm+CG37Np?=
 =?us-ascii?Q?HvvM+9GDS/r+RZEWBKeuxRp157WeOq3nsU/iVx6p1I+zci2tz3yT20DgtEwd?=
 =?us-ascii?Q?FAsmXLsowgqp7F6p15utibqKViKt7XDtpAe4iiR8rmtXkQIYvTAL/vekC/ps?=
 =?us-ascii?Q?jyuMIXzDOH3BslK71Ogj1+YLVFWsyuIM94SDSxMqHMbIhae9xGVCE2+wnZJv?=
 =?us-ascii?Q?ieDTf11HLmY+5czDm2hISEqQ/Zn9D37KJ3KOtYVEU05f9hvhpYrhTNyZlPf2?=
 =?us-ascii?Q?+n5a5wL3ss7OXoYzOlP5C7rmJMEe+lMAszf/DJaxYEyGeP4NSj0o1UWsbtJq?=
 =?us-ascii?Q?tUoQbuZcV/LMGINkuLVTli2ztKnQehKTjfJUm2OiLmwzAnVCA/OygTZ9WT9T?=
 =?us-ascii?Q?1KAse9MakQ9+02a2sq1IoiKtDtr5z3Nm/QW49CI8hdB1WaFwRINdVpJoB3lT?=
 =?us-ascii?Q?CFipushWNguesjEFqnCGwMAa3fjXZ9drSR7SOQEPops0cQrnSM+Gs79gHD91?=
 =?us-ascii?Q?s8ZyAe8vvdtDEpAoT1nz+oazwQP1xmct/NMv+63E/+8Mhci0RUZe/33PAPKU?=
 =?us-ascii?Q?dngLGHHzkGO6HhZhVMK8YUTm7Go20x2uM3rwPEkGliQfZg/W8eVaoi+bZ450?=
 =?us-ascii?Q?FCWnc8KXjOqjvrNX5B83YJk2MjO2TERbuMqH/7UaNH4mJJM6aXDXbg9v/zK0?=
 =?us-ascii?Q?UdA8EAYMiPtJW1Tg6n7cl5F5x5uQhnOqQgLdRZFV+B6ySyxVgH4YzE5ZJKpS?=
 =?us-ascii?Q?7ClPCSq4lBn+QeBnveBQ1qfC+Z/Ri80jNsO0URl0dzAvefEv888VG+U8us/9?=
 =?us-ascii?Q?VsJwoE8t/zcxQcXcsOiQm64nNinU9Q5cA5D3AGynA+q9DxsaNBzSkYyBAqQL?=
 =?us-ascii?Q?0FKTEX0DOje1gsnHwuayrEzds00xWke1V4eNIU8AbykC9iCJXTtzgC0yLNju?=
 =?us-ascii?Q?4Qpho8fqANu5WXCt3yRyPqJFoHXZpkFQJdiw/7k+KGqGxA/VlbPqURc7VYQo?=
 =?us-ascii?Q?h9Ga2Tci1hU/Y3Gvm+4PGTA3zwOSjnhq+h6CGcD99uwCk2PxKf3Lj5UqxLaM?=
 =?us-ascii?Q?2gXNjfDQ6nS4A0qQmzk5ACtkSA/7L4MdXAuUgV2XL8rGYRkwlcFU5HKvJSUS?=
 =?us-ascii?Q?wsCEclqRxScdN60qjPsRdAExFU3y8ZTTTtihQPk8Vo4BUkS/fbQ7J3hvdIdL?=
 =?us-ascii?Q?v2eWT7BFbCse/JggjwXqokeQ07sXRchBFP88UqOHufAbS6dkCN0oog5Y1cUQ?=
 =?us-ascii?Q?XGnD6OhommjERM5u5gvG3QxnwzZ9dNq2HbXEOUaWITwqazs+uD9y8gemD150?=
 =?us-ascii?Q?r0afVZOrlN6VPFTS5Gxak9BgMnWaYKW5RAR86diu8vwTt0LHztzM9HkySHqr?=
 =?us-ascii?Q?QZxKKger2ZFdaGHSLkuRGbAi1yaNTBxWNkZKIKsvmaYyJvtrCyPhEvsteivO?=
 =?us-ascii?Q?8OPCKnjKYl34FxoTGddDCO2CzxtqadJqlxbQw7EATutPZv3wM94DuXiWjSsV?=
 =?us-ascii?Q?aKBKQB/Jn84cVd2oZpKPGbffVFOOGzf57DcC1k4yPXMjMTtRhP2TlrzxWvlP?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a24e5b94-fa07-4e44-bb73-08db979464ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 22:19:40.6790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT69ZwjMfYZro75R2oCCZLPbNEWxHPQnGMVMGuCJauOj0sgXl9oY2LHExuGj6q1kXs+lj6oQ8GFi21vGoKwHaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/guc_submit: fixup deregister
 in job timeout
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

On Fri, Aug 04, 2023 at 04:03:09PM +0100, Matthew Auld wrote:
> On 04/08/2023 14:37, Matthew Brost wrote:
> > On Fri, Aug 04, 2023 at 09:48:30AM +0100, Matthew Auld wrote:
> > > On 03/08/2023 19:32, Matthew Brost wrote:
> > > > On Thu, Aug 03, 2023 at 06:38:51PM +0100, Matthew Auld wrote:
> > > > > Rather check if the engine is still registered before proceeding with
> > > > > deregister steps. Also the engine being marked as disabled doesn't mean
> > > > > the engine has been disabled or deregistered from GuC pov, and here we
> > > > > are signalling fences so we need to be sure GuC is not still using this
> > > > > context.
> > > > > 
> > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 8 +++++---
> > > > >    1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > index b88bfe7d8470..e499e6540ca5 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > @@ -881,15 +881,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > >    	}
> > > > >    	/* Engine state now stable, disable scheduling if needed */
> > > > > -	if (exec_queue_enabled(q)) {
> > > > > +	if (exec_queue_registered(q)) {
> > > > >    		struct xe_guc *guc = exec_queue_to_guc(q);
> > > > >    		int ret;
> > > > >    		if (exec_queue_reset(q))
> > > > >    			err = -EIO;
> > > > >    		set_exec_queue_banned(q);
> > > > > -		xe_exec_queue_get(q);
> > > > > -		disable_scheduling_deregister(guc, q);
> > > > > +		if (!exec_queue_destroyed(q)) {
> > > > > +			xe_exec_queue_get(q);
> > > > > +			disable_scheduling_deregister(guc, q);
> > > > 
> > > > You could include wait under this if statment too but either way works.
> > > 
> > > Do you mean move the pending_disable wait under the if? My worry is that
> > 
> > Yea.
> > 
> > > multiple queued timeout jobs could somehow trigger one after the other and
> > > the first disable_scheduling_deregister() goes bad triggering a timeout for
> > > the wait and queuing a GT reset. The GT reset looks to use the same ordered
> > > wq as the timeout jobs, so it might be that another timeout job was queued
> > > before the reset job (like when doing the ~5 second wait). If that happens
> > > the second timeout job would see that exec_queue_destroyed has been seen and
> > > incorrectly not wait for the pending_disable state change and then start
> > > signalling fences even though the GuC might still be using the context. Do
> > > you know if that is possible?
> > 
> > Typical once a GT reset is issued the pending disable state change isn't
> > going to happen a the GuC is dead, rather guc_read_stopped() is true
> > which indicates a GT reset is pending in the ordered WQ and it safe to
> > immediately cleanup any jobs that have timed out. If multiple timeouts
> > occur before processing the GT reset (all of these are on the same queue
> > so have mutual exclusion on execution) that is fine. The only way the
> > first timeout can make progess is the GuC responds and does the correct
> > thing or a GT reset is queued.
> 
> Ohh, I missed the xe_uc_reset_prepare() in xe_gt_reset_async. But if
> multiple timeout jobs are injected before the queued GT reset, I don't see
> why it is safe to start signalling fences here. We don't know the current
> state of the hw/guc, so if something goes wrong with deregistation here I
> would have thought only safe point is when the engine is no longer
> registered/enabled from GuC pov, which should be taken care of when doing
> the actual GT reset, so after flushing CTB stuff and calling into
> guc_exec_queue_stop(). Like say if we were to just drop the read_stopped()
> for this case?
> 

Oh, I missed that that this would lead the fences being signaled before
the GT reset. It is likely harmless to signal before the reset is
complete but it is likely safer signal after. So the way have I think is
the desired way.

Matt

> > 
> > Matt
> > 
> > > 
> > > > 
> > > > With that:
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > > +		}
> > > > >    		/*
> > > > >    		 * Must wait for scheduling to be disabled before signalling
> > > > > -- 
> > > > > 2.41.0
> > > > > 
