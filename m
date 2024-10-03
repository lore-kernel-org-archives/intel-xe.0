Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8113CF34AD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 14:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F8F10E86C;
	Thu,  3 Oct 2024 14:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOvMRbC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BBF10E862
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727964350; x=1759500350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jL465wPOYwdLyWnhaEUwScIm9GRrxJnEbhdLkxDqK9c=;
 b=gOvMRbC9+KZhobceiu8KSUSoqcJMS3nt5L0FTFby7W5vKBGmYhcUwt8P
 He8CkknYSQs2WbNlQXzy7hll4xIzkyDZLCXw+EAiQ2p4Tj2fOi9o6G8TJ
 8ZifwFRWsNAZU8oZnyW1fOywBMIXAMlTFOLas2ATf+FHWpheDf2kRgI9a
 1FG7rR45guHP/Q5Ahm1iAntdOJu6fZyTzLtum3S/8AR6aJgHvO0OjFQTx
 e1jnuJFPnqcMAR9z4R3UD9QndocCwTJKiQuWbc7wUZ+eU+swBulh+9uB5
 7caAiMztS5gZhDu8OJVaHbn+K4J4Bu6c0IACLPWvtUCmUxLTcscemokfH w==;
X-CSE-ConnectionGUID: +ugiYUiWSP66TgIxI5ndAw==
X-CSE-MsgGUID: 9vszxynvQ9CcmwjEizbZig==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37752986"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="37752986"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 07:05:49 -0700
X-CSE-ConnectionGUID: KaiWusAmTQSr5/9w6ZCMBw==
X-CSE-MsgGUID: bK1GOp7zS6m10x41ty8/Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="73950514"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 07:05:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:05:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 07:05:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 07:05:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 07:05:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYIyyeMIwsc3JYoR2qmVzZWamSpXj125GzzQmdp1JDQgdxDX9f7S4Pk9lbuOUfl9V3D6/go0/ZTeX1lOYEbv6cyJxLFe8gnR0EuZ7ABjx56pbMT2MDPUsXfdGLGuRZMGldiSXtRqeMBW6XgV5Fv8D16eI+IUcjS1H4TOeNBRSHWVRQyjAw463P/Tku2uRufVTvW+rTSs6MHcfkGrYblKBD09mAXwvucoTnZynVeAxVdXFySnEJdmTz0eTqC3QgC15v1tuF9Ff8y+9AvkAsjEE6RWhpOAS4wU7IYLu9dqVXMDh8DCHvyLn07O38xGmrcsaH65M+jmSHaXGVqh/IoUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MORRRRFshY0I6W8jBmxhZcjS5sUTiwEbxfgGd6vFXY4=;
 b=I8FMcQxZCz7tQRKhEO2AgU7hgJxdi3E18xKdHvegv8Ov6hKrj5MOv58o0rQNQt7rFvnULngAlOzlRp5FASW9nzTNj864GFAZRIxMZ4WBsftggtMsDQ7LUsUtO/t+2zpc+UWBVtDMBTxATvWADaKHmZlSynMmGflGEO8ZgPWbZ61VTNdbYexpcSuTzbuff1ZSitCps7rpyBiPq8jQV35hSEix91C4DUVyfx651k9q5P8DQZazWGfpjxBICtlY89xhP4s6dv8wct9W6pIbN6tJWruSYmmHEaUd2/7qZkhc2vnfOIxPG4zMVC5qKuKeoK9Pyr8ue7tbrvGC/64XGx4GDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 14:05:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 14:05:44 +0000
Date: Thu, 3 Oct 2024 14:05:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Don't free job in TDR
Message-ID: <Zv6ksODQwzVvfOw3@DUT025-TGLU.fm.intel.com>
References: <20241003001657.3517883-1-matthew.brost@intel.com>
 <20241003001657.3517883-3-matthew.brost@intel.com>
 <45633fc3-b1d8-4a64-b8db-0fda93ca79a5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <45633fc3-b1d8-4a64-b8db-0fda93ca79a5@intel.com>
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 852c2da3-8fc1-4c17-19c0-08dce3b478c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rdJNDyQiQZ5l7ZpZecCglPiw7gPO4QibYRXEmN83tsw3qUZ0yxF/YJk5asbf?=
 =?us-ascii?Q?4evcdsSMTISTqkmH8cuygZfx2SjwqPhf00E3AfrPEu6pxjzD8ttnrw0//+eP?=
 =?us-ascii?Q?r9DK78dsbFi9Lts8t0HzHTqaXhL9k6gcnNy9qWbn1OC/d9dFTEuJj0jJwObj?=
 =?us-ascii?Q?KpmsxNT9nT/cN6lmX+31JUa82aGekszxC4lTyXc9eimN7Ax156Z4QEAKWwXR?=
 =?us-ascii?Q?d2JPteDXdwjTEtKhuYvTxwt2g8rYRKynrjOkUhcO97oO911d4hvLr7+eYkqi?=
 =?us-ascii?Q?SWQS4BPWmJ2PEv512pIDbdEEr9loSNmwOjaC9zmpsaO2bwsYIgLj8p4KQMHr?=
 =?us-ascii?Q?q5pXfPm0RXvmhs9s4W5NTqonBqgYiIERpYcViK8m0meJzbXqsqp3RjTwrV8R?=
 =?us-ascii?Q?vBEzGBhvGscjZaIgTB5LfzOUJkIX1SJ9cimohOpofcDqwjn2NozpBUBhHe0I?=
 =?us-ascii?Q?LvXH+Y29IqKUJP2ieKI1tPfGzJk5gD2Ecf2fENWVaWw4um1jLQmTk1jdRPs+?=
 =?us-ascii?Q?V6vcFmO8vbSQ/WarWP60x2bmwUQR4DmZF7k5kJdO5bYf/NtcyEgxvrOjWB/X?=
 =?us-ascii?Q?F19Eo6hnzZb7WWiPkqaAZhdLjYYNnAJrieBYfMCR5CUnYCcYyx+1yD8xaEx0?=
 =?us-ascii?Q?7WgJ+xk9velaqI1FiKxwa2QMnlUBhbIq+N8Gf6iwuKi1P0vmejpc3qp7LnyG?=
 =?us-ascii?Q?UXmsn/H/2OXO1v6vxJbj/lF4hZpATS1P80FhzWGVB8AHseSZ5syhQPY5DIj0?=
 =?us-ascii?Q?5qTNvC95gX69ajxc1XaNIwEIor2b+aTiwE9hJr9SpvALr/mIi+6h35Ml7+rq?=
 =?us-ascii?Q?OazRP2noIy2ZgnKFG9uQhvQQ2yR34Kq+pSNoP6rXi89kHrPUnMHzx3Axs/IO?=
 =?us-ascii?Q?tPiZ6yUmG7o1L/fxowDP0gXXxtqW0IA5GmnWVxouj9RHLwmw5ansWzWQ7FHo?=
 =?us-ascii?Q?B0RjRkQ/Lscd6fsmZhMpEiFLyQ23bQz2vIXAvnRY8sPqZumq2WM3p0SP7Ocj?=
 =?us-ascii?Q?rXooCf4dM2jTv9AY8Xnu+7AfJJ010TwdsBmFuwpdIlbXAxL2FW4+hJCWph5J?=
 =?us-ascii?Q?NtuRuglI1s2Xw0Y9M/mlX8UngoxIGpIi/nTcoE7cJRzRa4WFFROvAAdJZEzS?=
 =?us-ascii?Q?9IJz5fqg1VOLrz5quweMl6JXXo+KhuL8YTK170XY6xdEr9Q5XrhZivcev++H?=
 =?us-ascii?Q?+KWylQrfBS4MrtowoK3jnMams5Mbv3lHKNSb6pue8/86betQfZBvehDK+8w?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uDD9asqFEh0V0b+mibk/vFTt4GAozcbuLGx1zfSJMf/drR+RYCgDGqrAFbP?=
 =?us-ascii?Q?XKOV6I29sqoEZTuTXDrSjZ3KohbqZ/vfee5SQpT/4+qUg0yj1yus+56Vj4nd?=
 =?us-ascii?Q?OBEaAJOQPUXxta+BBL0NmEAS1itH9mS+/NVkqCniiJx1H1n1wwOhRA7hhaqD?=
 =?us-ascii?Q?lWFJJ1GZb6YFkEhzEMYVLGYlLXgLj0PWukp0q5JWk9Rtf8G4okLXPDMKm40u?=
 =?us-ascii?Q?zcu3c/gEweD2NKhcdo/GRC9QnGFCihJEc/utbnbQxdM9G51jz7Xour/1s5DF?=
 =?us-ascii?Q?rcu9PiLdnAX4NHBiznMSyEQXt5e7IeykHTtCfmvwyzSMUlyFx8w88mGmsuOJ?=
 =?us-ascii?Q?ZSjdt6TlTKaZDtdvvqDzQW8go1Cu/WIpsQKIWSAOlZh1G3iKF4RAkXU+kqjE?=
 =?us-ascii?Q?m70s196mtSqr8Kw9jEDj09y+ZcrhdIjyxfRft7C5nzyHOhCAK/gvOgr5bd4P?=
 =?us-ascii?Q?nuNQabP+F8TeBmzET0Uuu9E7fmdKnyOpwytc+ijqN+kN4nq0nkIhUeW+fKFK?=
 =?us-ascii?Q?fMj2LqMhNFav2svih4G08Q40jxM0URYj4tv4HrjNejqjkz2NhNMsi6XhS0Tk?=
 =?us-ascii?Q?kjBXoml4Avus+4qduyFElxldl6gLp0qvP15BTVG+hmaHWmDGyvf13du0A49J?=
 =?us-ascii?Q?2iMl6uRZLV3NOXdy/5YgdmsgxW2vvMmy2948Q1AyQH3FbWxR/8NZNz7UTAO/?=
 =?us-ascii?Q?3zEfL19oiJDrIC27H72O9fbeOTPByVabzGKZVayAnh1qRPZNl6UyZojMjzO9?=
 =?us-ascii?Q?PqwikY1UG8Ttj8W5AivNBXf4+Ok9AMGLtOjFdN38reeAOjEF0b5zwlz9CGzp?=
 =?us-ascii?Q?OwHKq9XMHVwm89MIGvEanyZ83RfKQnJ0HnZHIE4URJfhB6jThaBq/AUv1HBJ?=
 =?us-ascii?Q?XoJr4kUvqFJ6+IlukHz9I0yFiw40IjaiCLovZ5ULWeqKe1ShXk3pBGpRRDkw?=
 =?us-ascii?Q?aQUY42SqvEVyNxEyXVETXVIBpdTb4DstnIF/9fMtTyQX7ihjbFn8PkzyLp6b?=
 =?us-ascii?Q?E64MbGSEeYW/WUnUmh8C/7zd1K4uIyla7hEJhi6S7wzARVmi6aOnGQlSlTYQ?=
 =?us-ascii?Q?F6JuywUBQ9OTd0SsX650OkY3r9yudinlaFUuYGNWf7lSWhWspwkTVLfiBWmv?=
 =?us-ascii?Q?c4bHqbYCXLGhKiMY5iZ/SWyZJ3m5ix8cmo+4f/CFpRlUH4P0Viwz3P8YfOwq?=
 =?us-ascii?Q?tyXzwHoME82pmbQX30auzDe8nzwARE3wHGmSVnjRKWbebdVBY7radoBcJlab?=
 =?us-ascii?Q?ndJN1Ne+1E6ISyoo3/8qmU4c/MRxPoz2n9Ts9uXajTshDSe/QnrwT0zSbybt?=
 =?us-ascii?Q?SvBZi0a5UN1JnyXFtqO/WZgSbXr6rZYLhlsgrMSPqpqAqK+h4AByM4R2Dksx?=
 =?us-ascii?Q?i9vGfDYaIhQWwdQeWBqq5ztH8jFqSD0tcdiol/F+6Src8JvJlyvSRFJEOdj+?=
 =?us-ascii?Q?FmRCuA56pq0b3pu98meon6inBOtTEqVBJHJ45UGCpOPUa2GDX0LQf8liOtwm?=
 =?us-ascii?Q?6B3JtfguRz4/DFffR3GPJMMZnruJxpHhT0sbnJaSFLDYZHeNbHUUBr6KlYgb?=
 =?us-ascii?Q?/G+fMUDmOerETkwFXFDwStD5BPlj4r4IJwe6iJmkePLI+EXKPHQ8uAn/7yYd?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 852c2da3-8fc1-4c17-19c0-08dce3b478c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 14:05:44.1086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1SMkrRhYQILYuz34IHBOBxrBaN11CWDcQJPA9vqyMOyEAvOGuEAjGZC+pj+SAlViIeu/aq4UxY8svJHMWntsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
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

On Thu, Oct 03, 2024 at 08:06:24AM +0100, Matthew Auld wrote:
> On 03/10/2024 01:16, Matthew Brost wrote:
> > Freeing job in TDR is not safe as TDR can pass the run_job thread
> > resulting in UAF. It is only safe for free job to naturally be called by
> > the scheduler. Rather free job in TDR, add to pending list.
> 
> s/Rather free/Rather than free/
> ?
> 

Yes, will fix.

> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Fixes: e275d61c5f3f ("drm/xe/guc: Handle timing out of signaled jobs gracefully")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I think we still have the other issue with fence signalling in run_job.
>

I think this actually ok given free_job as owns a ref to job->fence and
free_job now must run after run_job - that is why I didn't include this
change in this patch. But I also agree a better design would be move the
dma_fence_get from run_job to arm - I will do that in a follow up.

Matt

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 80062e1d3f66..9ecd1661c1b5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1106,10 +1106,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> > -	 * immediately closed after last fence signaled.
> > +	 * immediately closed after last fence signaled. Add back to pending
> > +	 * list so job can be freed and kick scheduler ensuring free job is not
> > +	 * lost.
> >   	 */
> >   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> > -		guc_exec_queue_free_job(drm_job);
> > +		xe_sched_add_pending_job(sched, job);
> > +		xe_sched_submission_start(sched);
> >   		return DRM_GPU_SCHED_STAT_NOMINAL;
> >   	}
