Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E957BC7EE2A
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 22:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944B110E43C;
	Tue,  9 May 2023 22:22:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EE410E439
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 22:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683670975; x=1715206975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Gc2qQyJLvSV8XGl6LLgTzMMKeps/s8fh6l+hl9Yk8LQ=;
 b=KL9gOuKwZBZrXsvLiCuIk2alzfvvR3wA6NlJDqeMh3sczwx8FvbwOGHJ
 h4hbpVD2VLC6Nl91mm8aJ7xYcmGfXHD8cxa5l6jq/45RL0Z/WyuIYc8q6
 LtFSGF9unRZcf2ozeAkkxBS/ZnaC7df2SSY1H5NyqjWFgajZ56KSsOt51
 RSdliKEZZFE/tvVyBebnNxRLV3stJ3KNC1BZEjv9mXg2Nb6FIaVa4TwPO
 hnbJ3zkkWIgOD1+LtETdCfTdQkq7OVgiSpBVJn3jgDehjS0yJgyLvjMI/
 sYSYV6Wr3yuodDbXC6S1ZVHKRNJ6rhOaHGmBpFlAEPhhAlmfj7UG8DsMT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348899742"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="348899742"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873351018"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="873351018"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2023 15:22:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:22:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 15:22:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 15:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2i31Mn8ceHbyJT9QTAQryfiUcLFD0rNyR/htbfIr/y5R0FR84OzhxU89lPvTayUdd0qCnaQlZ/yTtRSSK3Sq/sm37/TGNbEweMww0AtOQp/4hz0lSnsUkn16oHKcCaB1lgwtOFXF4c9XJ1PiZnHv56R//yO5r/aQIRAvMUuh3Y9qwE0aFQUBt5A6w6tkl127/GGK+fw65a5mKWJ9DN68uFhUyeEItwWxG4AwQTSYJGNP5yLiQeT/oiHHTVWUELEQ5V835eZcl2pLZk4O1af9vj60Wbw+dXt32x81oPW4/G6rQd1maDPdxG9u2/6/3i5wURSfGjVuxqj3lorITrZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV5cr85TTduFDA+P2rUGcgx2L8HGT4zEvmm12nEgwTk=;
 b=DDiSjn7h8RPTRQdkGWaofh0Wsz0vW8rHBk6ZbqvD7116GfvpWD0HKcmhGdIywN8wXPrp1UxQjWkwXxYNeK1Xg0z1/d6gKL7e/Qv46gq4Yd/oUUne45vz7NVS1o62nBBy/isEglWZHataUAOYt8Ug50iQv9LeF3gDxwAWH8Pfdkpp3yGFdaMJcj2Lopd3eAwXMBGqZ6A/UkTlG4nrQWfle5TGyLfQMt/O/ipaPDC8zNAzgzPhTI8aiA8FOPGI3jD7EkaXTMhDEmV7iGqb2W7Rh+qfw10UOwXSZWlovOg6672wRj0X5z2lSu6o3/RQHQjhPWsbxQZn7AgqeteCdodfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 22:22:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 22:22:11 +0000
Date: Tue, 9 May 2023 22:21:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrHcMyxyL1gepw1@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-6-matthew.brost@intel.com>
 <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c1a716-43ad-4d49-b38c-08db50dbd576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i64xJ6XzLGnNGeTVQUHKXRoJZRzc5HecuoV0x763x6fTsBoVi9/5Pq6knMUFYsC+ubZktVQfwcA/hD1z1xamUcXp7KJakYdsL7I3FjNmqWk6bDYUDcKBaM7E4dg1ThJqsDSLRzTiYO0nafqe6xbCIdOs3F5w8pOf4kN4Cy/wjzuAq3Fi9RvAAIzilgef1pyYVQonht81vnDEKtsfoIOVtoIv8lWqQl35nQM7MRfc/3A/R323Eqo6MZh0GRbh5PCNYSBB1NXohaAfzJx/T+FH3rNS+arm7q6YPUR2IYl7xLRcjPFg4nriUs9x2N7mo6sPneD+gosmtnu3vUbInc218q3/g4cjc88YcLpVSMLik5D98Ugp43pjg0MIUhhoyoCwk0TLDBL1K6r5orhrIhI+q3FREHXhy7LdV9CrxFZ5CzlqBvNNscdK17eosxkrymMHN2W14NbKnDCxFmrkJY7k1L6onO2PX+gr/z5bMxubMFE4AUxSP2NzJ/qP9187ntwW8clzLL+WdoDjViILO11uiOxaEgbQmUF8Qi+YhLM7x1IRVMRQblRBbdsctBHhxXO+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(6666004)(6916009)(478600001)(66556008)(4326008)(6486002)(66946007)(66476007)(316002)(86362001)(83380400001)(66574015)(26005)(53546011)(6512007)(6506007)(8676002)(8936002)(30864003)(41300700001)(2906002)(5660300002)(38100700002)(186003)(82960400001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jx3ixKlJ1Q8bi+bmakPBMZU2fozkl7EZlxOlbu8CtUVu7K5gST4S0558OC?=
 =?iso-8859-1?Q?FsjnjGINwX2p0Frvc4ssNEtbYQoV8QiOcqrSKpP+C9CC59xrDKnBF5Ab+h?=
 =?iso-8859-1?Q?nqrQz53WmRO+h8tw3IYk+L2TevJNwh5ZBY9ysZ1tQPUYNcqrn3wacckpJq?=
 =?iso-8859-1?Q?H68LvXd3Jq0eTKrkPIFYSzjiE80tR3Bs1Lk/qES6CkiyI7I7gNhwcwE0wf?=
 =?iso-8859-1?Q?j2r1upN37khshnMFuK+GQvnqqxdH4VtICVJiQDWW+CpZzkcLx1VJi/YbMh?=
 =?iso-8859-1?Q?Gow8YfVuEIz+mBwcfViq7THK5Ml0scLOdc1ZRQa2B0/9vJxkd6z2FGOz0v?=
 =?iso-8859-1?Q?VwXbLx+6q0PyD24lllj6m+L985KrY7m57fM/ArnMAOqQ06dz82VWwfb1jL?=
 =?iso-8859-1?Q?8amY7oswubf3hiMs4USSap1FzJQOetBrA0J10knRWsiz/v/2aiwsmJKnZa?=
 =?iso-8859-1?Q?GYfBao6D9Hy8MmFfRI9Q0VTDOd4tu+gBwn759unmJlkDStTir2E9DfqCyr?=
 =?iso-8859-1?Q?+nN98UfV+77aU82umOPdjc5SucptAiS8J+VffLPTNJ8ov1TQCL3iSOIwV2?=
 =?iso-8859-1?Q?TVWCpb5HqJXwHJfcUDTalwTp3d/HZrgj54dQpekxzVlq4jtRfFbfYxFucU?=
 =?iso-8859-1?Q?ml4khT2zByE/ECobvn3mjRiLiobQXp3bDKyVR09iU9qDoXkBWonIvmv+61?=
 =?iso-8859-1?Q?fNA/2tQgCAWeipRw3abAG5fqT/A0JnrH8SKralcErvH//HcdP3HHeUXdyS?=
 =?iso-8859-1?Q?CRXZvNTVrEVtp6Rs0fqBidkNx14YzvT9EFqTEGfHt0fwIg/JAnrZ+Ew3g+?=
 =?iso-8859-1?Q?eKI9eSWRpZzqRmLtFl+e1MDrIx0IUJzDhZDX6xOc837Y0/01yT30CBHOmL?=
 =?iso-8859-1?Q?2+RHxWK44UZxp85E5f5GOKsOl9X0ajG4Gp6HvgLt3ihhddtm2fz7HFOq3i?=
 =?iso-8859-1?Q?EP72wo/4aumFOnX5tGE+Pp57WhRwGv02jO/lOyz8khd8wSnXssTo0uToxY?=
 =?iso-8859-1?Q?Jz1XxL2LGQ2GjHzrZ97c7dqGpJvRkQ6/GuX3YY73r+PL3ObVWswJpHKB73?=
 =?iso-8859-1?Q?4Q9xs+G9OQSJsioHPpS0JEkK8sYVW0+5kisLr/X/yb7zZCdQIBgi/QHDaW?=
 =?iso-8859-1?Q?yY8Blr8zjBHoahwpDJKxJig4j50livLDxOI4FZvBfOzqClxleyyDDIurPI?=
 =?iso-8859-1?Q?tSOFEXZzcrROVAuMpQkkSbC5xoO7mmGRbh0952WGNTVEqP1vbmUPO0e9Pf?=
 =?iso-8859-1?Q?t5UnpgQIimd96azPieSw4C2HH38qp1KT7I6LaRKlXvEq+Kb2cvhkVcpoIc?=
 =?iso-8859-1?Q?mLiu+bV+5GJSFrJqT9i6yRwu9A2McGyhL6K1bSBz/HNzMyR3DztRk1sMD+?=
 =?iso-8859-1?Q?adaEeNdYDPPVuhn9DG0WFiocGLI+plR2I+VyKHPdQXrI4+yV/VCq119J/c?=
 =?iso-8859-1?Q?j4qUQv5r4zVDvGVnyY3VL/q87vfG/25q3sgNQEPCbquKgRhBVh/dXPSphx?=
 =?iso-8859-1?Q?paAfxuQcuzvvE2vg3pGTLymN1nVdsAxDbKtKwnVO9W9AE6XuJpwG8QEEQO?=
 =?iso-8859-1?Q?pQH96/5DIR0fqw+op4H3WzghB5DSTU8ck2jSyYVTTGHhV+hfjBguknrV3/?=
 =?iso-8859-1?Q?8ms4luKVmvyvNdBgRNoXuAJq5NYb2wkXfAoZ8WRtn/Jt+T2MDEo37UOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c1a716-43ad-4d49-b38c-08db50dbd576
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:22:11.4085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1CA0UNzDOi1uEtKziW398YMzeM+5t2AeftzVVgIvMNWEqyYy2Wceis+XV7vFVsxshIGsCE715F9HArfBw4DrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/31] drm/xe: Long running job update
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

On Mon, May 08, 2023 at 03:14:10PM +0200, Thomas Hellström wrote:
> Hi, Matthew
> 
> In addition to Rodrigo's comments:
> 

Opps, missed a few in the first reply... Addressing below.

> On 5/2/23 02:17, Matthew Brost wrote:
> > Flow control + write ring in exec, return NULL in run_job, siganl
> > xe_hw_fence immediately, and override TDR for LR jobs.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> >   drivers/gpu/drm/xe/xe_engine.h           |  4 +
> >   drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> >   drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
> >   drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> >   6 files changed, 137 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index 094ec17d3004..d1e84d7adbd4 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -18,6 +18,7 @@
> >   #include "xe_macros.h"
> >   #include "xe_migrate.h"
> >   #include "xe_pm.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_trace.h"
> >   #include "xe_vm.h"
> > @@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
> >   	up_write(&e->vm->lock);
> >   }
> > +/**
> > + * xe_engine_is_lr() - Whether an engine is long-running
> > + * @e: The engine
> > + *
> > + * Return: True if the engine is long-running, false otherwise.
> > + */
> > +bool xe_engine_is_lr(struct xe_engine *e)
> > +{
> > +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> > +		!(e->flags & ENGINE_FLAG_VM);
> > +}
> > +
> > +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> > +{
> > +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> > +}
> > +
> > +/**
> > + * xe_engine_ring_full() - Whether an engine's ring is full
> > + * @e: The engine
> > + *
> > + * Return: True if the engine's ring is full, false otherwise.
> > + */
> > +bool xe_engine_ring_full(struct xe_engine *e)
> > +{
> > +	struct xe_lrc *lrc = e->lrc;
> > +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > +
> > +	return xe_engine_num_job_inflight(e) >= max_job;
> > +}
> > +
> >   /**
> >    * xe_engine_is_idle() - Whether an engine is idle.
> >    * @engine: The engine
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > index a49cf2ab405e..2e60f6d90226 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> >   	return engine->width > 1;
> >   }
> > +bool xe_engine_is_lr(struct xe_engine *e);
> > +
> > +bool xe_engine_ring_full(struct xe_engine *e);
> > +
> >   bool xe_engine_is_idle(struct xe_engine *engine);
> >   void xe_engine_kill(struct xe_engine *e);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index ea869f2452ef..44ea9bcd0066 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -13,6 +13,7 @@
> >   #include "xe_device.h"
> >   #include "xe_engine.h"
> >   #include "xe_macros.h"
> > +#include "xe_ring_ops_types.h"
> >   #include "xe_sched_job.h"
> >   #include "xe_sync.h"
> >   #include "xe_vm.h"
> > @@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_engine_end;
> >   	}
> > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > +		err = -EWOULDBLOCK;
> > +		goto err_engine_end;
> > +	}
> > +
> >   	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> >   				  addresses : &args->address);
> >   	if (IS_ERR(job)) {
> > @@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sync_entry_signal(&syncs[i], job,
> >   				     &job->drm.s_fence->finished);
> > +	if (xe_engine_is_lr(engine))
> > +		engine->ring_ops->emit_job(job);
> >   	xe_sched_job_push(job);
> >   	xe_vm_reactivate_rebind(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > index cbfb13026ec1..5d83132034a6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> >   	 */
> >   #define MAX_STATIC_MSG_TYPE	3
> >   	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > +	/** @lr_tdr: long running TDR worker */
> > +	struct work_struct lr_tdr;
> >   	/** @fini_async: do final fini async from this worker */
> >   	struct work_struct fini_async;
> >   	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 68d09e7a4cc0..0a41f5d04f6d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
> >   		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> >   	}
> > +	/*
> > +	 * We must keep a reference for LR engines if engine is registered with
> > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > +	 * GuC has a reference to it.
> > +	 */
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_get(e);
> > +
> >   	set_engine_registered(e);
> >   	trace_xe_engine_register(e);
> >   	if (xe_engine_is_parallel(e))
> > @@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   {
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_engine *e = job->engine;
> > +	bool lr = xe_engine_is_lr(e);
> >   	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> >   		  !engine_banned(e) && !engine_suspended(e));
> > @@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> >   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> >   		if (!engine_registered(e))
> >   			register_engine(e);
> > -		e->ring_ops->emit_job(job);
> > +		if (!lr)	/* Written in IOCTL */
> 
> Hmm? What does "Written in IOCTL mean?" Could you rephrase to something more
> descriptive?
> 
> > +			e->ring_ops->emit_job(job);
> >   		submit_engine(e);
> >   	}
> > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > +	if (lr) {
> > +		xe_sched_job_set_error(job, -ENOTSUPP);
> > +		return NULL;
> > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> >   		return job->fence;
> > -	else
> > +	} else {
> >   		return dma_fence_get(job->fence);
> > +	}
> >   }
> >   static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > @@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
> >   }
> >   #endif
> > +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> > +{
> > +	struct xe_guc *guc = engine_to_guc(e);
> > +
> > +	if (xe_engine_is_lr(e))
> > +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> > +	else
> > +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +}
> > +
> > +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> > +{
> > +	struct xe_guc_engine *ge =
> > +		container_of(w, struct xe_guc_engine, lr_tdr);
> > +	struct xe_engine *e = ge->engine;
> > +	struct drm_gpu_scheduler *sched = &ge->sched;
> > +
> > +	XE_BUG_ON(!xe_engine_is_lr(e));
> > +	trace_xe_engine_lr_cleanup(e);
> > +
> > +	/* Kill the run_job / process_msg entry points */
> > +	drm_sched_run_wq_stop(sched);
> > +
> > +	/* Engine state now stable, disable scheduling / deregister if needed */
> > +	if (engine_registered(e)) {
> > +		struct xe_guc *guc = engine_to_guc(e);
> > +		int ret;
> > +
> > +		set_engine_banned(e);
> > +		xe_engine_get(e);
> > +		disable_scheduling_deregister(guc, e);
> > +
> > +		/*
> > +		 * Must wait for scheduling to be disabled before signalling
> > +		 * any fences, if GT broken the GT reset code should signal us.
> > +		 */
> > +		smp_rmb();
> 
> wait_event() paired with wake_up() family of functions typically set the
> necessary barriers to make sure anything written prior to wake_up() is seen
> in wait_event(). So that smp_rmb() is most likely not needed. If it still
> is, its pairing smp_wmb() should be documented and pointed to as well. See
> documentation of set_current_state() vs __set_current_state().
>

Ok, thanks. This is copy paste from other and code. I've always be a
little shakey with my understanding of barriers, believe you that this
is wrong. Will remove and study up on this.
 
> > +		ret = wait_event_timeout(guc->ct.wq,
> > +					 !engine_pending_disable(e) ||
> > +					 guc_read_stopped(guc), HZ * 5);
> > +		if (!ret) {
> > +			XE_WARN_ON("Schedule disable failed to respond");
> > +			drm_sched_run_wq_start(sched);
> > +			xe_gt_reset_async(e->gt);
> > +			return;
> > +		}
> > +	}
> > +
> > +	drm_sched_run_wq_start(sched);
> > +}
> > +
> >   static enum drm_gpu_sched_stat
> >   guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   			err = -EIO;
> >   		set_engine_banned(e);
> >   		xe_engine_get(e);
> > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > +		disable_scheduling_deregister(guc, e);
> >   		/*
> >   		 * Must wait for scheduling to be disabled before signalling
> > @@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >   	 */
> >   	list_add(&drm_job->list, &sched->pending_list);
> >   	drm_sched_run_wq_start(sched);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   	/* Mark all outstanding jobs as bad, thus completing them */
> >   	spin_lock(&sched->job_list_lock);
> > @@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> >   	trace_xe_engine_destroy(e);
> > +	if (xe_engine_is_lr(e))
> > +		cancel_work_sync(&ge->lr_tdr);
> >   	if (e->flags & ENGINE_FLAG_PERSISTENT)
> >   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> >   	release_guc_id(guc, e);
> > @@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> >   	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> >   	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > +	queue_work(system_wq, &e->guc->fini_async);
> >   	/* We must block on kernel engines so slabs are empty on driver unload */
> >   	if (kernel) {
> > @@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
> >   	if (err)
> >   		goto err_free;
> > +
> 
> Unrelated whitespace?

Looks like it, will remove.

Matt

> 
> 
> >   	sched = &ge->sched;
> >   	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
> >   				    &sched, 1, NULL);
> >   	if (err)
> >   		goto err_sched;
> > +	if (xe_engine_is_lr(e))
> > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > +
> >   	mutex_lock(&guc->submission_state.lock);
> >   	err = alloc_guc_id(guc, e);
> > @@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
> >   {
> >   	trace_xe_engine_kill(e);
> >   	set_engine_killed(e);
> > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +	xe_guc_engine_trigger_cleanup(e);
> >   }
> >   static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > @@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> >   	/* Stop scheduling + flush any DRM scheduler operations */
> >   	drm_sched_run_wq_stop(sched);
> > +	if (engine_registered(e) && xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >   	/* Clean up lost G2H + reset engine state */
> >   	if (engine_destroyed(e) && engine_registered(e)) {
> >   		if (engine_banned(e))
> > @@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	trace_xe_engine_deregister_done(e);
> >   	clear_engine_registered(e);
> > +	if (xe_engine_is_lr(e))
> > +		xe_engine_put(e);
> > +
> >   	if (engine_banned(e))
> >   		xe_engine_put(e);
> >   	else
> > @@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	 */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > @@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >   	/* Treat the same as engine reset */
> >   	set_engine_reset(e);
> >   	if (!engine_banned(e))
> > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > +		xe_guc_engine_trigger_cleanup(e);
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..02861c26e145 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> >   	     TP_ARGS(e)
> >   );
> > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > +	     TP_PROTO(struct xe_engine *e),
> > +	     TP_ARGS(e)
> > +);
> > +
> >   DECLARE_EVENT_CLASS(xe_sched_job,
> >   		    TP_PROTO(struct xe_sched_job *job),
> >   		    TP_ARGS(job),
> 
