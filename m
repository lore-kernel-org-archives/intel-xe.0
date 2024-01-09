Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB77C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC3A10E4C1;
	Tue,  9 Jan 2024 17:42:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D3A10E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704822125; x=1736358125;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Twglv8QXSXuh26HM1kspiOS2L0YT2yYTrDXZNFCrR6k=;
 b=SKpvFMQ5NwyMtVVYWFDHatNm/+4HnIPcrXVcVXuoPp4S95CW/7z6+D6w
 bfw+2ppQO8uV1Q2H2ENgfZdyT/HIUNvQDwwA/f+xU6NMxrlxeUTSwAfUN
 3HTweZ0/pl6misZizDaJkguBRw5+lcKp6fvlY69c2gYofWUKNu2zod84U
 wr4SELsJk+qQXYcroNLxX2dKHhmYgw4YOPkGIYSVXNVH9v1eRLUNdhdvq
 rqT+zjiQ5pkxFXlhB+BkK2vjfVKQHXR6aIy4Vrh1tK2JG8KzjnV3DTf2m
 7E6Vq9RwIQ2IhTfAOXIRnDv+oOrBVZVuJTCRyGZxr/8AIkT3ESiuGf4GX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464671249"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="464671249"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900837532"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="900837532"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2024 09:42:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:42:03 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jan 2024 09:42:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jan 2024 09:42:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Jan 2024 09:41:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j34TVAHCIZmv8109QfwdInnSeCUowGCysvL4qWfh0sgF53rKIeb/T8H+WND96GzwGzjTQuwi2m+6vz/Yxgi8pS+hxJ+vNlLyysLpXARDVzSu11Rha7/np6TQlAD5sU6/UkDY84WnwGgrfLoOzxgGxoxOQsi/xGgaiShwNR6OjX+KD5tWyXN5giDAXPiHx9yaQoXY73qWsV9YVnpVXpPtjU3+ZIqKPRKNpEKXZliNCz1Ls2B/uSeccKEdcCNa218F70xRCRHV4DlgsPHfplB2T60D+diJDd8J7KtQb9Kbo+/uudoTXTIM8++nOEa+zBS+xIs+mftbEEtg+TZj1wZGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEVF5pFU7+95PaNfXxaDqL3+ZspPBqAQkVtNSDiYKBE=;
 b=JxrC3Z7CBEAD51hhvfb1wAYdRzluVA/5Mx42nSMQHdjXoA5JYotB93xN8rwcMp9paP/5fwMJxoPE29+MynanmnzFS5iXCA8X43C6uZ5zuADL1WuSWKh5B8HzTgeQKcTkjAs/zF/dfVXwEZVDxDkUQwUmQikRydQs9IDBsKOjDkjw/MyKpGfc5gr4N4HpHv5XsnxMToq92TKUbKDXFuut2Ls4BrVKWtXwvP9iLPAn8dwClsrsOkv4eFz9aozP16Gzkr7zQA4uE7yJdegI89brVvsQyTmMJwDJx0NG5hlc3ghHVMfAv2rgfn0NeQJI8dvFxVZPLG3MBv5/Cfmh0DlXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 9 Jan
 2024 17:41:57 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 17:41:57 +0000
Date: Tue, 9 Jan 2024 12:41:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [RFC 08/20] drm/xe: Runtime PM wake on every exec
Message-ID: <ZZ2FYVEN1xzDQMVm@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-9-rodrigo.vivi@intel.com>
 <11d0bf86-c011-4761-895f-8cce0a7e071c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <11d0bf86-c011-4761-895f-8cce0a7e071c@intel.com>
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 442efdd0-2f0d-4343-d94d-08dc113a4692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: isfSCKLQA+rpys3KttWlIZpLgpSrA2ey4FL6eUX4MVVuBG66KoSmPKi7NmDvLr5qj95/6MWINmFroV0NNFiVG9QWfCp3HOy7bdvgslwAxj42ODqGW8FRLzOVMlTjIiOEgXMCD1lDApgIUWrGWtwkSoK7qEz/Ie1wvK6nwDT1XNMc4cW1Ic5ORdAQvXzEI112Av6hMENih0CeyWkBFAubKsaW06o+iQeizxewjMRwxT13YEjLlX0YQuF7yyFI7f/pGJgr/2BlIhQU3MOo9NsLO+sb4kAyCoNMkzSxDg7Z9Qb47s8xnwRYu9lGxfswVdfoOEUV9cVbDvei3xNm+9pIwJovChKEFcEsV9F2PvBsPQ4npSsI9fN5DnHkdVmzCeQo/GETxkMzC3Fe5678aO+mH1CH5eHJ67oaE0u28qXuLz907YrYY6kNfmFIL0JLsXiWIXqOLNi6qFubYvODqzaHI2cRNKZUXJ6yW1xSY5w9QB+4kqgIMlB7un1qM75V7rJqb55TA92jR8tjC2yA/OeotZyW+9nLEXMrkANB1O6kKGB2fMJXbg8k97X2Vo76VkB+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(478600001)(5660300002)(6666004)(6862004)(4326008)(44832011)(41300700001)(8936002)(66946007)(66476007)(36756003)(66556008)(6636002)(316002)(37006003)(6486002)(6506007)(6512007)(53546011)(8676002)(86362001)(2616005)(26005)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qrgCDFQOTDdkVyBYPLzarhl6gg+dTH6iH1oROqbODlKSyNHI7b5p/FkKgP1X?=
 =?us-ascii?Q?RibkKyO/vGHPNpincNa6u03Mo3c0vCtLoYk9UM2XZ/dZwekRqGiIx76q8g0p?=
 =?us-ascii?Q?a9G3pHm1nCNwn899J/aPmbmU2u4txe35XW8vIXvxTRHyDsJe5qgOd0lznkkS?=
 =?us-ascii?Q?97erAlSZxc9J+jfqCNaSSmDSz3PN0jsRQtjwen1MWtj2Wpx+h3epTffHUv9B?=
 =?us-ascii?Q?0lPC05Z4dllbboNfxA8irwdLyyUaNMX8jZS6+DJqrqbLidQehuOyEZkMU93S?=
 =?us-ascii?Q?Sj2IQtTF6lNebGQGbnf0lfEHER6lqrFStpUSUrLI6q+b7yhlflaucrBbGRXx?=
 =?us-ascii?Q?SibeJP0OUeMYo5JQDBG8L6uXoEBLTHi42qBZ7JQ84PeR5qvipzM8hJhJVFwP?=
 =?us-ascii?Q?6sMJWBKhO8IAY5j/x15T84vhJyU6Bvt0SHToHSkSswuCr9dRZMoiMpd/oq/e?=
 =?us-ascii?Q?HwFLSiAZOJddr9E/nBfhc6MgIfhTJu1EUXikKaTrsXrUDFXUfjjjzf+yY8Wj?=
 =?us-ascii?Q?/WVQY6KtJnxj0bZD1gOgLag2pkK9m3DFKBdg9/lRNuJiBGgZFd2LEb5dpr5l?=
 =?us-ascii?Q?VXfCnUrNRWjVZhJpm6FfrQ55TmfwAjOkZwZMguzoiMACJWAmzF2d0OOPcUlr?=
 =?us-ascii?Q?+6wvuIhOf9kk3YL36oQXmikbD9bvN9vOrR68t2Im7RVmKxgk3SL875unM3ne?=
 =?us-ascii?Q?aPVmB4WtSGZ6IeV3ebEmbkfmgOPP6s7xPB6H/KvOxcXykbq+nr1Amza/86jo?=
 =?us-ascii?Q?KJ3nkFBlSs1iNgt5fce1/mDMmuHqPrsZ1/KKtvOgKfGFrh4QtlFy6ihP7BYr?=
 =?us-ascii?Q?PNVPoiGZf8BHGa/oGyH39RxHZnRVC9b3QLMenGIqtuWosw3i5Ai8t2c0QSu5?=
 =?us-ascii?Q?Kh8AN5t59C8acv/iRm18+BJDqIlFQTQnljz9QMbzWkv6GuIQLSkqLl6T06aa?=
 =?us-ascii?Q?b7Ezx1esX+8DDviJzM6ElpEGN9hd6QtIjJOEPpdm9fwoUbjejFFOkuVv8Elj?=
 =?us-ascii?Q?tEd8GeO/PBkJ5JdVausbozjZxaYbuEVUNLHQC4Lj+cR8RXW0DPdGYEwXFxbZ?=
 =?us-ascii?Q?HVixMWoSgon/UIIYVPnfzl+v6KZk2eazAknPJDWHtYGeSDRwynfLK4E0Qlwz?=
 =?us-ascii?Q?Ypd1HvM9uS1AHATfey0UjLQ+ZyKMTHOiY8IdUZcidwPsI714hY1snSSVT+zQ?=
 =?us-ascii?Q?kaqkpO/qLl9im9Van30IABHyGG0+KPlMMW/sB0KvYSFZ+x7xqjfkAvUaz5TY?=
 =?us-ascii?Q?FMc8YGacB70F6qK7iFEaQjP1l0Zd5OKTDUzZn0VljxMtdnJIO1CQ/PHBKQDr?=
 =?us-ascii?Q?s8VP6mhNhx9ZtEUeAiZQy/lUy8kUQXRs68IJ2E62rjcto9JReilttBPhiwQW?=
 =?us-ascii?Q?Wn6MNpJL6ylOvUWI8BIMPsLJvqx3mK4vUr41THmi0MmGFxl1DQ4T2CGOP0Yi?=
 =?us-ascii?Q?oaomocF/oiruzulbZTSiU8NEH6E+TUMrgtXm5ood5GZUG/DJIzxI0TFEkeMn?=
 =?us-ascii?Q?eIe9ujHU3KTRpQ8JREbpNgw7wnZt28fpeQpblCb0kThSDtp3znt5XyIdEXSU?=
 =?us-ascii?Q?2CDCERDeu0oax9fIMOB9EbatfjpVrpYRJMTCR3T8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 442efdd0-2f0d-4343-d94d-08dc113a4692
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 17:41:57.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOPMwt2YoV4yVPCKcpXQ+onDMFR1M/8cexp1Ogx8jgDJFQkHSjfhLUkgj6qTyNpzJlwiPLnSi8rdLCkc+tq2Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 11:24:34AM +0000, Matthew Auld wrote:
> On 28/12/2023 02:12, Rodrigo Vivi wrote:
> > Let's ensure our PCI device is awaken on every GT execution to
> > the end of the execution.
> > Let's increase the runtime_pm protection and start moving
> > that to the outer bounds.
> > 
> > Let's also remove the unnecessary mem_access get/put.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_sched_job.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index 01106a1156ad8..0b30ec77fc5ad 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -15,6 +15,7 @@
> >   #include "xe_hw_fence.h"
> >   #include "xe_lrc.h"
> >   #include "xe_macros.h"
> > +#include "xe_pm.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > @@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
> >   	struct xe_exec_queue *q = job->q;
> >   	bool is_migration = xe_sched_job_is_migration(q);
> > +	xe_pm_runtime_put(gt_to_xe(q->gt));
> > +
> >   	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
> >   			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
> >   }
> > @@ -86,6 +89,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >   	int i, j;
> >   	u32 width;
> > +	xe_pm_runtime_get(gt_to_xe(q->gt));
> > +
> 
> This seems way too deep in the call chain. If this actually wakes up the
> device we will end up with all of the same d3cold deadlock issues. Like here
> we are for sure holding stuff like dma-resv, but the rpm callbacks also want
> to grab it. IMO this needs to be something like runtime_get_if_active(),
> with the upper layers already ensuring device is awake (like ioctl), so here
> we are just keeping it awake until the job is done. Or maybe this is how it
> is by the end of the series?

we have 2 cases here, one that it is already awake by the ioctl and the
other that is on the eviction preparation and that exit because of the
'current' task. So we should be good anyways, but you are right, maybe
using the get_if_active is better here for clarity.

> 
> >   	/* only a kernel context can submit a vm-less job */
> >   	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> > @@ -155,9 +160,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> >   	for (i = 0; i < width; ++i)
> >   		job->batch_addr[i] = batch_addr[i];
> > -	/* All other jobs require a VM to be open which has a ref */
> > -	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> > -		xe_device_mem_access_get(job_to_xe(job));
> >   	xe_device_assert_mem_access(job_to_xe(job));
> >   	trace_xe_sched_job_create(job);
> > @@ -189,8 +191,6 @@ void xe_sched_job_destroy(struct kref *ref)
> >   	struct xe_sched_job *job =
> >   		container_of(ref, struct xe_sched_job, refcount);
> > -	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> > -		xe_device_mem_access_put(job_to_xe(job));
> >   	xe_exec_queue_put(job->q);
> >   	dma_fence_put(job->fence);
> >   	drm_sched_job_cleanup(&job->drm);
