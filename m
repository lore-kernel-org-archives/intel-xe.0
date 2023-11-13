Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4BEC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 15:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEC010E3A7;
	Mon, 13 Nov 2023 15:29:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536DF10E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 15:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699889377; x=1731425377;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DBeeDGp0jyL2SPVXvg0/6fcoExhR0GtKLtADvunrolI=;
 b=KVg611AB8H2yP48Y4wDnpmRWWSYQ+bHF+xHtuksg4M6ijsRZhHudoX7+
 KpcOd838JE2HWYIRT/md/l7EUNGclEPKzwafSANby6x0Zt3LYKs9JiFuC
 +JJ9Ohwxw60Zz+406dgQ3bEN/g9/+y3FzgXphzWFmX5zgjuvM5+YKwNSz
 VGC401qbu0P9t7ScmW2qslIw18zWRyzLwdR0KDJWbXYSjXy7zNIOJCW9T
 8BpeI4l7qd7JLP7Hwx6G4Kb04V8G6p056iGdToa/OvqjHFXjEEVbOnsN4
 6HsziVfG0qleQE79HwSpcCiUvdhd0tJT9qwLWo20YzHVArFM6+9jD1/1+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369791011"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="369791011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830263269"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="830263269"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 07:29:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 07:29:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 07:29:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 07:29:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwuIF2RP23N6GOTT0BphHEU6qB+8cJwzH53OMIQ9vi8khF59PPISuXvqstmxhuz5n8vvvcnKCUJzmzxRV9bcPRnFrlyxjJTgWVr1a6WUx0rarnZn8vXN4Bq9u2Ff34op6McgkUTY2dSpjH4UMhDWbKDG8QpEoetFgdLnIVQFkeH1W746vuDxnVi30UUgEPy+E2K1QauUXOfvyk/2jnB5YdzMhrCS6ISx9qQilI1OYJQ7gTZHp/AipKU+v/d2HEhSfw3DohVSxJ7uf91fNyo7bOGgO0z460i8vaW7ouD91OnsBeQrtyhiJHG4+AfXAGItsFgWeZO6eGcaj8kh+a0ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deIswRChgBLXNdC7/2mYgTblfNOCnwYEmBQPpHmqiTY=;
 b=GpX/M37qs0fAVsmlL2i1k4CaanpmnVb+fZVQn+ADAxR/jCQ+RE/1dRNGeERe8hRtUKwpylnxZkzpEByddCcHcXjlLxBAftqBOVJDZ9BzDR3FZjoYvM2wf3TpTx8uR+v9l83x60X6H9+bFhiEyMHLvgr1Y73LZdTn3bO7XsXmTVKFNKmAMh8g1UTsKtVxf4ULxQZxhTenFf/iOpCHYlGRLIzmDK7TiFem+Wtmn5HL5BRJQIGQfWf3veWW2V9nGSH//keJ6gFyZi42ywCGQoegsNnEvR1WcS7hnHUcxusZAXtlXvqBVkvhengER47n+88KDDT2O15gdIybjxtJ2r2J/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 15:29:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:29:33 +0000
Date: Mon, 13 Nov 2023 08:28:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZVHeKg5mRcll8e5R@DUT025-TGLU.fm.intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-4-matthew.brost@intel.com>
 <e345d385-b692-3ff1-82be-57f6392ca719@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e345d385-b692-3ff1-82be-57f6392ca719@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c4c6b0-4fdb-4ba6-f593-08dbe45d5664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/tbsvca5xGC7ZL9LkJs/j/FdNI07/W/Ej0xt95CuL/Pct66dP78R3lMD1pKM7MJiF/7ML9BD1DUPoW1+pMwQLrY/MhDwNV9yAzyWrma7nggFhQs0px7WAgZcRi0QvaOuWLZRyJzsW1/2tKHh8ASptEi349lJ9pbQ487e1h1sfI+Hqyw0vmqKw1MZhnLLEsnFkdxJSOT9rZ9gR4EMHcwj4++SGw0KDx9dSVqFjyDXFOY2heFgb7wcEi+z3X2fdDb1MaoOa4dgpc+XtZ1txqCAAUJu2XCxovRvSuh9OSzhDkBWRNimjOZudb3YTHAOSI/S7+gyIXZ727Fw0BkmNdYXoh3tPE/u25Hjunlny2nDlUeeWCyRTuQcjOA+inqH8Hwr1RFC8odmwJGxPUfEk0fp12XKvQ3k0UfDx3JApG8rkpDfKRBCFkMiz5xvyOtXzkLuXFJ5g6SdR24V6zm19EK5IavT50iVtfDnrlBf7EGjZxXRFxT0njgM+bm+FE0GzhPWSfnnxDp/IflWPJ/SzWiqAlmqlHBupWMnjkNxOEiCVh9/aK+yjbxLmUxEQ7aVorf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(8676002)(8936002)(6666004)(6506007)(41300700001)(82960400001)(83380400001)(4326008)(2906002)(316002)(6916009)(66476007)(26005)(66574015)(66946007)(66556008)(53546011)(44832011)(6512007)(5660300002)(86362001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fzUYv++2NeGdpxDhOek1YpW2+NfXuEY1GB05s6SLKvBWjC17QxJsVs80Pp?=
 =?iso-8859-1?Q?mjaCBwMX5WvSqvhgIhwyWDihAibUOnVPx0Qe8fmF5xhe5qk10jXp+NSpA6?=
 =?iso-8859-1?Q?ZFzCM6DMu+FSCG77iO2/vNNyXk6Ae/HBynWyi57Nrtz8U4C08LTTIQYG41?=
 =?iso-8859-1?Q?00/U3QREp8/SY8BHHqxCBhFsITmafPuYH4J7ZmsbUYSjsLhAgywgJy1j+H?=
 =?iso-8859-1?Q?pL7aQBQXLizltJ4DhCDN6P2oBHZstlxlOehLUt8AQ1BveZ2A2E4NfYiZdo?=
 =?iso-8859-1?Q?SW5m7zBYyUWRKcJ2aWaOnQAcvQE8M+uhed5fMzINSDNhr6awpj/aH1gqr3?=
 =?iso-8859-1?Q?zt07+K8B6piqKErO1J2ImBRzaABv7FPMBzr/xzfcuUqP762iIwvCWJvEYw?=
 =?iso-8859-1?Q?8/38t9JUWu3S3jfvOgb3PoGbsjMlIXLlBEH/UYj8NoMql3O2cNqgHo7nlU?=
 =?iso-8859-1?Q?hVXczL3zNEX56edYX+WyR4JM34X2A2Ejb3BT2afcrItR/tj4vQPLlwQ0Ve?=
 =?iso-8859-1?Q?6L3mLO366zUvnE2Er49PvQ4tibV0dzUtiaMII6WZIgiPT0Qr4hKDc8vBIH?=
 =?iso-8859-1?Q?SC9oxNqyA18tEsV7tN0kaqMUsrun/BQLSeisVZRw0yHEborivCyld98M74?=
 =?iso-8859-1?Q?IPxV31xFIYl5GHUWPSWnMy3OhThyIPwrm3O5bdvl9OJokfcfuQXr85OhEK?=
 =?iso-8859-1?Q?e1jmE6+ux/hPGblyZ7uR+QCJLjDuyIXeqOA/whd/0xbm6krhYEFJVOwp7s?=
 =?iso-8859-1?Q?3oXcAx6/AZCNmn/DLskNuibyClPuHgxabmPPRtQiLOATDJvu9j3IFcEGpZ?=
 =?iso-8859-1?Q?S1dyBi1NvdTcvcMgsk+x2lo8kSqI6Jc/awSoE/sip+xFYmmpt9hNlgzvZz?=
 =?iso-8859-1?Q?GGQbJLGPyq5MoEiNTpfwGo1BZZuuAQVknvoJXrEHXRGFt2YAaSIlukv5cn?=
 =?iso-8859-1?Q?ycebCSvgkUt6pyMx08NxRa/kXdP0eEv3Y79DbGAqee7hWbM8h8g5ZfWBwf?=
 =?iso-8859-1?Q?FnEeGRBGDWjJ7lq3TrDL/jefv2MVZGZTJ0MSIUbhA1YlxBwFbl/Y+8D7Kt?=
 =?iso-8859-1?Q?Kxf7L0I5Cml3zJPX/nlIGbnwMLyCt7Oh1jf9Fa9EfU5dlEMXRdbLb+AU1S?=
 =?iso-8859-1?Q?HNFIFRcQ+hm4fm4yhDYjlSmMiXnSWIe3N3LF6aczzHxyatloTZvhwXVcaH?=
 =?iso-8859-1?Q?PfUS3PkEGfCzLGcw8kBifyRG1EnvmuDzhjL4PsqcvaMPm4BKIZGGlKTZsH?=
 =?iso-8859-1?Q?tDtDUrPz45VPYaYrq1zTFNg40B897tO7J26dSrUYB891E/syHyd/xLauig?=
 =?iso-8859-1?Q?/mRa1/9CMNK6SbnkOP794VnTvl7uC1RAqZlARss1a9pj3diyknbStvFlPH?=
 =?iso-8859-1?Q?bPQfOLBROCM2YE5sPInq/LaZnhG2VMrT80LU6sUAxx4S7QUUIqs4209mbC?=
 =?iso-8859-1?Q?hxlcOsoUEAbeE+sHglq2yaP2lUF5ZeA8lBViIUuu6ipIJ2HWNGpwAJ0TN8?=
 =?iso-8859-1?Q?JBK1yNXSQ3WV7ywIDs9agb2qEMHeZfynAaN+Lp45RAjxo67zYdhsPRMdf+?=
 =?iso-8859-1?Q?Oa/Fj7t+A+Uv2Q7U9MGRHEXyN5ZPVYKzA20Gi6C4zuDRslj29uzhyhyQYH?=
 =?iso-8859-1?Q?HPf03aTJcMrpZVLeh8OqMqg5tVTzo41Ryfcn6jMbjS8GaxG50iRO6EfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c4c6b0-4fdb-4ba6-f593-08dbe45d5664
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 15:29:33.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZLdzg90bnqJx7VbeQy/uFlotx9n/+4SvFQdGRy7dP3LN+UaXOezjYwG5qTAFNH7CmlG49kM/sZMGcdInZjTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/27] drm/xe: Take in-syncs into account
 when num_execs or num_binds == 0
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

On Mon, Nov 13, 2023 at 01:50:41PM +0100, Thomas Hellström wrote:
> Hi,
> 
> On 11/7/23 06:25, Matthew Brost wrote:
> > Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
> > 0 in execbuf IOCTL or VM bind IOCTL respectfully.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
> >   drivers/gpu/drm/xe/xe_sync.c | 75 ++++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sync.h |  5 +++
> >   drivers/gpu/drm/xe/xe_vm.c   | 24 ++++++++++--
> >   4 files changed, 108 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 4666f5b145f7..80ee6d8fcf68 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -238,11 +238,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	if (!args->num_batch_buffer) {
> >   		if (!xe_vm_no_dma_fences(vm)) {
> > -			struct dma_fence *fence =
> > -				xe_exec_queue_last_fence_get(q, vm);
> > +			struct dma_fence *fence;
> > +			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
> > +			if (IS_ERR(fence)) {
> > +				err = PTR_ERR(fence);
> > +				goto err_exec;
> > +			}
> >   			for (i = 0; i < num_syncs; i++)
> >   				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +			xe_exec_queue_last_fence_set(q, vm, fence);
> > +			dma_fence_put(fence);
> >   		}
> >   		goto err_exec;
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 2461e7d4814c..6b38c74a1de1 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -5,6 +5,7 @@
> >   #include "xe_sync.h"
> > +#include <linux/dma-fence-array.h>
> >   #include <linux/kthread.h>
> >   #include <linux/sched/mm.h>
> >   #include <linux/uaccess.h>
> > @@ -14,6 +15,7 @@
> >   #include <drm/xe_drm.h>
> >   #include "xe_device_types.h"
> > +#include "xe_exec_queue.h"
> >   #include "xe_macros.h"
> >   #include "xe_sched_job_types.h"
> > @@ -274,3 +276,76 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
> >   	if (sync->ufence)
> >   		user_fence_put(sync->ufence);
> >   }
> > +
> > +/**
> > + * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and VM
> > + * @sync: input syncs
> > + * @num_sync: number of syncs
> > + * @q: exec queue
> > + * @vm: VM
> > + *
> > + * Get a fence from syncs, exec queue, and VM. If syncs contain more than 1
> > + * in-fence create and return a composite fence of all in-fences, if syncs
> > + * contain 1 in-fence return in-fence, if no in-fences return last fence on
> > + * input exec queue. Caller must drop reference to returned fence.
> > + *
> > + * Return: fence on success, ERR_PTR(-ENOMEM) on failure
> > + */
> > +struct dma_fence *
> > +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > +		     struct xe_exec_queue *q, struct xe_vm *vm)
> > +{
> > +	struct dma_fence **fences = NULL;
> > +	struct dma_fence_array *cf = NULL;
> > +	struct dma_fence *fence;
> > +	int i, num_in_fence = 0, current_fence = 0;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	/* Count in-fences */
> > +	for (i = 0; i < num_sync; ++i) {
> > +		if (sync[i].fence) {
> > +			++num_in_fence;
> > +			fence = sync[i].fence;
> > +		}
> > +	}
> > +
> > +	/* Easy cases... */
> > +	if (!num_in_fence) {
> > +		fence = xe_exec_queue_last_fence_get(q, vm);
> > +		dma_fence_get(fence);
> > +		return fence;
> > +	} else if (num_in_fence == 1) {
> 
> 
> Don't we need to also wait on the exec_queue last fence in this case, and
> the multiple-in-fences below?
> Otherwise we only wait for the in-fences but not on currently executing
> jobs?
> 

That is right. I think if num_in_fence > 0 we need to wait on the last fence too.

> Did you investigate just to forward a non-existing batchbuffer in the exec
> case and create a NOP binding job in the bind case?
> 

Hmm, let me look at that as an option.

Matt

> /Thomas
> 
> 
> 
> > +		dma_fence_get(fence);
> > +		return fence;
> > +	}
> > +
> > +	/* Create composite fence */
> > +	fences = kmalloc_array(num_in_fence, sizeof(*fences), GFP_KERNEL);
> > +	if (!fences)
> > +		return ERR_PTR(-ENOMEM);
> > +	for (i = 0; i < num_sync; ++i) {
> > +		if (sync[i].fence) {
> > +			dma_fence_get(sync[i].fence);
> > +			fences[current_fence++] = sync[i].fence;
> > +		}
> > +	}
> > +	cf = dma_fence_array_create(num_in_fence, fences,
> > +				    vm->composite_fence_ctx,
> > +				    vm->composite_fence_seqno++,
> > +				    false);
> > +	if (!cf) {
> > +		--vm->composite_fence_seqno;
> > +		goto err_out;
> > +	}
> > +
> > +	return &cf->base;
> > +
> > +err_out:
> > +	while (current_fence)
> > +		dma_fence_put(fences[--current_fence]);
> > +	kfree(fences);
> > +	kfree(cf);
> > +
> > +	return ERR_PTR(-ENOMEM);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> > index 98f02bb34637..c0c8ddac805d 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -9,8 +9,10 @@
> >   #include "xe_sync_types.h"
> >   struct xe_device;
> > +struct xe_exec_queue;
> >   struct xe_file;
> >   struct xe_sched_job;
> > +struct xe_vm;
> >   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >   			struct xe_sync_entry *sync,
> > @@ -23,5 +25,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync,
> >   			  struct xe_sched_job *job,
> >   			  struct dma_fence *fence);
> >   void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > +struct dma_fence *
> > +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > +		     struct xe_exec_queue *q, struct xe_vm *vm);
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 2f212939d2b5..2a7fa8e2058e 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3155,12 +3155,28 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   unwind_ops:
> >   	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> >   free_syncs:
> > -	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
> > -		struct dma_fence *fence =
> > -			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > +	if (err == -ENODATA) {
> > +		struct dma_fence *fence;
> > -		xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +		fence = xe_sync_in_fence_get(syncs, num_syncs,
> > +					     to_wait_exec_queue(vm, q), vm);
> > +		if (IS_ERR(fence)) {
> > +			err = PTR_ERR(fence);
> > +			goto cleanup_syncs;
> > +		}
> > +		for (i = 0; i < num_syncs; i++)
> > +			xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +		if (!async) {
> > +			long timeout = dma_fence_wait(fence, true);
> > +
> > +			if (timeout < 0)
> > +				err = -EINTR;
> > +		}
> > +		xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> > +					     fence);
> > +		dma_fence_put(fence);
> >   	}
> > +cleanup_syncs:
> >   	while (num_syncs--)
> >   		xe_sync_entry_cleanup(&syncs[num_syncs]);
