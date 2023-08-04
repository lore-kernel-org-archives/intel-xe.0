Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFBFC0015E
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 00:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEC089CAC;
	Fri,  4 Aug 2023 00:25:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF14F10E05A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 00:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691108704; x=1722644704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MzcWJxUBSc2nl3bA2pKx89xbR90hUIcAAApC4GZVnUc=;
 b=BKJFIutcEKpeXj4KDj8f3W0l+7IBrxygMbjSM54/nVAGaaCJMzCnt5wd
 9jMIcKZvSGYoU+2349Th0Xlp8/Rdx20qVYDiVuhBLVyDMILlEupoOjUoq
 cgSGyQD2XntX4Zi1qhBaPxCt/gpCciL7C6NfICN2vMvxfhhPmlEfWfW7Q
 5UUXYuERsnhI1NPWD5FLIwhhMhF0ufdeC45MWn7YV3olCBW3k6TQNs8c4
 rw4RZx4h9zDJg3Ip5IrN5UtfdugvW2WEwkCwwt2eabkZRnOS756vLzNMF
 z7WvGKXio1NlpffN02755KSG1hnzJ3D1FZcPsrDIHCIHcL3ZRNyTaAgVs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350331963"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="350331963"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 17:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="733010784"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="733010784"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 17:25:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:25:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:25:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 17:25:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 17:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJFoqRJ5HG3UoHO0bn+n1J8C6MtDxby9/YtRQ5p6dZWXlSqlOfxwVJBwqZoWDvi+Cq5SgRwq4vLuQmC0DGfq7wyowCfIbXerxYXnpymA+D+8BipniLyWvauqjX1FLIdKlLIgAqjIWRurQn/UYJuwrQe7xqrvtXO74ZCqNUsfSg/VPDG0QV4RyjSBKvt0injmqd2RQpNJI01jCOb2/a1hlE1jls3RNTPWv/aannvyyE/Bl7m9vfflavGKtsgUhzC9ZaLuD3e2trPy6JApzGCFlNRPPlvBZ8xk4dRTGL14zNx7saR/71z3tmQTQm9LW3y63L1b4kLBb5Z79W9ghpwfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAqcWhNw4y217xEMLnD0EInfxBG1bYSeEfri0f/bvns=;
 b=LTWx1jzgcsBMkHpkKsynRRG0jurWX2+MCwNpXoEoQ1TR4gFQYpvQSQ0sumakmzNNtheQmU3phLYtcO/RoEyGK7dYTSXOk4k0c9BgGS10/4G1cZnrpI5Zxdix904b0hpk8auKXoULa1/Nha7dbnV9TZyiQT3OH6XvMQMJCIiSyMB0U2nfpV/K5a1/DM40cruGJCynHUa1+Xes+g7lnu0IRWG+EKCWIfXgrjLmpdxhYu72vdtP/Q+NpA7nitrK8pA9LOh+WXPUZ620kvBlL7c66cHsi7moguIRK46nnboWiq6/5pyKIrYtm9mslILcwwkNEtKB79qus4VdgdMjBR4PDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 00:25:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 00:25:01 +0000
Date: Fri, 4 Aug 2023 00:24:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZMxFKikKtM+pto6X@DUT025-TGLU.fm.intel.com>
References: <20230803220029.895482-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803220029.895482-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 678d3494-01ad-411d-cf24-08db94813dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m53A8OvDK2KTx+j9lrOjI+cXTYGTernX/bkzJrq210hqUXKgui3PiXfXRTYaTJudhVJbDeqmeJvlrsXKpf2VNAYW3i+Q7y3DXbCSzc2FNb/W9wQ+O6pUZ/YCTIKkecRLkJkkCJrglhmOTr79QUUDBYhG17ej4EHK5AX1vLVq0cGLU+6earphR3ektQzmbGyL/DswLyvJvvgexu8TSNsS4S983wJN/KCo+GcwpnXEXwpVWhV1TiQTBc/BNNTSnJgJQm6TXtzLg5gvhEdzEG7n3dDkDpIUnfo99u0Uphvn6HmVzUgZLc0FHsDy0ICBgXQykwCrKQe/SWLGvxQWM7+1FHf4SxfviLUQlzk+YnhQYeiD9jbSaKyBWtNCG5UIchls5cowIZbaB8jvMa79ClbAYNXRSpmDLz4jU5L3pwLaNqONCjRWa2zT9UXULJHWemdWn51hHWO/ixUUbj1rUo5nTMnDk5mtIZsHU+WY/ruhfmkTBHPUwNBlGm34AJLznc+gKoZSmBJz8rIuYuqKsTdsboyD87HBMSlrpvOUYCG9X0bEIblKKCLloZpzDditS25OZnekqWnhZETtbQlstFnK9IXPvgr1ldsYpWsgb5UQL9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199021)(186006)(1800799003)(86362001)(478600001)(38100700002)(82960400001)(8676002)(26005)(6506007)(83380400001)(41300700001)(44832011)(6862004)(8936002)(6666004)(6512007)(6486002)(66556008)(316002)(66476007)(2906002)(4326008)(5660300002)(6636002)(66946007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OtED/TrqXHdkUox4yhmvuHH9lfWLRZ+1TO1V7dfCot5cLoWXWS83iF98zoRi?=
 =?us-ascii?Q?BuELCvLCd23GPfmgpiM0HWK+cRqbx2tIovXpnYVb+Yk6ILg27sNEeb9dPjLe?=
 =?us-ascii?Q?cPUaxNsHkcuZFx4zmjrvesgXpAk+1bzlN78NHII939mDu54QHJrht303n+a4?=
 =?us-ascii?Q?/5eFWAYcpChndvEApQSIfthpKvUzzc4kmCQpfFoczjGxDSczLULWMaQPkRex?=
 =?us-ascii?Q?2ANvpsYDZLWgubbZR178TsmLf7anjprqJCuJPVmqNOULDItcg14mCws33pXx?=
 =?us-ascii?Q?kp1EF30jNMrQhFfaiwPAQ0VmXmWYO/YDrec5sENrjzY64OzsIdyS13o6IFcm?=
 =?us-ascii?Q?9fjYVC94TJ7iaXHkyfWHmhgsZr5bKWR3KMm92t8AlgbeS4FYGZHdT+B0g7mh?=
 =?us-ascii?Q?+8dJYmrfIsNpGn9WvLfQb4zQm/Ta8KRT5TRFJ9aJlzRNIf/+RXjaxX5FD2Gf?=
 =?us-ascii?Q?PclGjj0tbMLpYkvBUU/6mQUzST58H5RVwDt9CNVlynQtJMr7wkm2BC54ZKm8?=
 =?us-ascii?Q?GoRT9zlAXyrhCB/vJo6cEVKLx2umokERn/umnASegcyQeVy4lqfuZepwC4a4?=
 =?us-ascii?Q?iumFG7dR8hlFfSxGR2diYfnajup5P8RSDVjVfxSV0BZHP+IN34Gw6UnABrMK?=
 =?us-ascii?Q?BV+KKaYvSp/GsT5FuzkmPOsEl5wEWi63KRlWAkqknoGJZ1QKZkIwuH7vXXKt?=
 =?us-ascii?Q?N/YSlaAoH0EILrlUxGovpSvk5sz4UmqsxKMtOrPnUKFKo/uon7qZKLYLC/Nc?=
 =?us-ascii?Q?1OumcHx9QCD0cKdQiEdEI7/l42J7O+8FQQpDhD8HdbiDn5ZmdRjOJ9zoKuhf?=
 =?us-ascii?Q?MKYmGSC8L6Y4xrHSuT0pml9AXYIQbtUsDbjxcWlXfKvkFamahS1yQP31BvQ/?=
 =?us-ascii?Q?rBYHcyEZDammnU7fVu6+g5RU+eMCelXQ17TV+HhszgH7Sjj60KOa1UeC7FHt?=
 =?us-ascii?Q?09QtLa7T7GBjbExYSFntD8bjZlwDD4vfMEv5AlIiITPjlWl5Do82aHJjOA4Z?=
 =?us-ascii?Q?Wdhb4TNM5o9StmXZIUPELNEPsHk81S24CiGh5SY1Rqjo9P82AT3qj56E1HPw?=
 =?us-ascii?Q?NvixPSsiBk/Fhw9bmFdG8TV8VTtmt1iVx82Vo1+PIsat7UeekeiB1eas2Gy4?=
 =?us-ascii?Q?V0wB2cUD2t+1ScAcR+vii8rWTQfHehe3cRjhoNZu+GbEcjd5MF2b5T8q8SrC?=
 =?us-ascii?Q?e24qx1UU8Iy4yWgkgg5OZYWLqieTHp95d7L+sdjNYYlAW3anQdJcYb+SxbIP?=
 =?us-ascii?Q?fhD7aRLTxZTkbuwnqlDqy01Nd1Bmj/CLo09u5z//66/efHmRp9I6ZwF6r+TT?=
 =?us-ascii?Q?0KfiwSKEzDC6VQzUYXkmRnWk+Fz0cx8WdOpOiYcEon9QZnzuzfEbc36oq46p?=
 =?us-ascii?Q?2yukOS6onvpOL8VQ35cm9HmK73f5FFemAbkHLnqTIwVQPZqzjLz+DtttcqH0?=
 =?us-ascii?Q?NIi0ZjeWwKnPKVn3DzjvF/SdojCjpqCnhpz1YbhdMtfF42myDtxAcpHVncrD?=
 =?us-ascii?Q?XFXvGtzheIIE9+kVNjpse/4qlKpFSu6kstAmm29+6IOB9a0YiS/Jpb84WLK2?=
 =?us-ascii?Q?cKHN+Y3RgsUdDKb29Ixn9p0n/nlArgMRfmdguIeE3tPS2gvJn6vjx3+P0Xzs?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678d3494-01ad-411d-cf24-08db94813dd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 00:25:01.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2LBDPrwuUcVWCKtVlLWC73P8Jcn6Rud+GchsY1gyPV+Kz0kIpHGIoQMKBEVpIwQVcWTyK1sG3ozPnbB4QlVRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

On Thu, Aug 03, 2023 at 03:00:29PM -0700, Daniele Ceraolo Spurio wrote:
> Resets can be caused by userspace (and we do so in our testing),
> so we can't print at warning level when they occur.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 193362518a62..60c311079fcc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -843,8 +843,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_KERNEL);
>  		XE_WARN_ON(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q));
>  
> -		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> -			 xe_sched_job_seqno(job), q->guc->id, q->flags);
> +		drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> +			   xe_sched_job_seqno(job), q->guc->id, q->flags);
>  		simple_error_capture(q);
>  		xe_devcoredump(q);
>  	} else {
> @@ -1597,7 +1597,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_warn(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> +	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>  
>  	/* FIXME: Do error capture, most likely async */
>  
> -- 
> 2.41.0
> 
