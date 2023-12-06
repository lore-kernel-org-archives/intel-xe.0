Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62781C10F05
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 15:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1722410E72F;
	Wed,  6 Dec 2023 15:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED5910E72F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701877002; x=1733413002;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xnl4z40ap00lRkPLKWIXbB5i2XnQ/q8ZGc1TPeyijHo=;
 b=a2XzMK0Ugp+vb9l5u94kpAlTzZTAt3KPmX12celNKUdLN69j7DHpsqQx
 PBqHQDUobS5OOWsicd2Z8OyLxXrZxjv7wqjoGCEQESOZQPyfmUY8kaGib
 ns0lgFR2wtJLGoI1PI/B2eP4ZT6cD2Y0XSgqcWSzNVDKrNE4P4bVCV9YV
 Ml52x/Xvd2Wjn9EkvQC1/cHmHqbrC3DArBe2lUgCZvM6ALYCsfAVV9St1
 VqBT5UOtdAw6kqdz4M4fj2Zszo0/s0MOwG/DJm8u99s32fb7KfGEoh7EE
 vn3+NP9zZMcsXuxk05u5vIABvOjc/W9UQ1b3l7LiAQBHVsqJzPQAzBTyA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373544710"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="373544710"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 07:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889386414"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="889386414"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 07:36:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 07:36:41 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 07:36:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 07:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7QZrjfkjohajCvCpTr90duqkThi8lwQ6ZkxBD2I69Z+whjwkT8v9B+no1guXmmlGPGV2cv4oRu2ttD8Hs7uG6788U/cSk8NCc6J3wt6AI4EVScH/zW3qgWSgtt/A7XtYXc/+GhfMAYJ6CBK/4weNMDOpzRfJKIyatus4Ny20PjE6r6O3zIwEEoZPVeIaQulwiGc30+QWSa1FdW4vXy8e3Y/9mesJRxgVN3xWL8koG0Mw8hVe/0XLwKFXqprgpZZY+pnhkm4RFgqnW2HBLzvi0Fr97Fz4w9vBVcIk5UVJ67phH5C9MBQAUiqFD7ZxOKCD+xav5EcNdmb0D0he+b6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNVYpEN5TcJgYMIyT4QYqjJufK73gmksT1MNNqj6/9g=;
 b=LVaGtR9/38EQU+OgStQ7Tc32rc9udrENOuUgGayRcdxdVUhNo2fAisBgKSJ1sSK1B9wjmiLH1Gs1odSRAlx3K21Gg1CEr2SChxUSRxtC2Wxd8djOqum5MvNYVSaxBySSyftznRuVLkiff/nXjZHjMqXAyQYdYWRPV/TyiDODs1llzq+9tDfsd8qOLCv4+6Oai0HJYVE3kd984LFawZOXx0Ka/ZE9lqTB4oG726Lvwzcx5oVPaUT22P0utXmQJlhR99Rg541CKwNgmJ1iaDvfjanLBV8HmVSvwkt3xRj8Z8QOhQUV+JSie+Cii5EgrtTiyGKVhmYT9vSEthWJD8AX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 15:36:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 15:36:38 +0000
Date: Wed, 6 Dec 2023 08:35:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZXAyX8YnTt8+EQ1V@DUT025-TGLU.fm.intel.com>
References: <20231205203758.322438-1-matthew.brost@intel.com>
 <20231205203758.322438-6-matthew.brost@intel.com>
 <b2dbb79791a44af979fbc27e3a01d861b515f676.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2dbb79791a44af979fbc27e3a01d861b515f676.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 71de9832-db93-463a-a766-08dbf6712330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5XAX8SqTf9WugICmCdPNbucP9Tg/tVCC9rT8eanp12avh1DxIbxCRUvqI9FXdYA4YRoRsNMZ3MaTLSD7VKIKlc7rXmG4XQkKeaocxajpekyUm68PWAfWwo3zJK1ALNQAK+LD12dipB0+MW3gMTTb7d9nnglGOcILdw6Ja9nSmbL6uD4hOkcJVGDwoGalBrBGs3B3vVZRfC6HrLDgmKB3aY4ULPAi6PeQO83R63fW80gpcRxBSnis5EMC2AwWHKkAguUlW8RKJ5n9ZzruLb77ay7tYxHjNofb/7VgA+RUMsiZj9Da6zZGHUyx1O0OAOweTzCEVKPDWJhVv3bFGacxsSMr0opy0ufSAi7hgZvr9YM4+zL1hJUo1pBSEi4jcrCtDvpCB3D+HN/5sZ6lvILd6cx+slnK+NhpLwZXwL6ZR8TjWR4rtxP8WZFWV4q61Vg3INJudHlH+f02WfSTiyy226V+wIjWxIJGUu1R6s6pVVxppti2sdejCXrgC2icK0YeHgQoqH7jnbYg0zbKb2hGb9y5xyhPixVxIyo3D1DJThI1mcB1gKbn+tTgoRsmjboEqQVSRMkGKoAWNXOCv20cDDVTEZtipup2IYOVqOoaso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(44832011)(82960400001)(2906002)(41300700001)(86362001)(6506007)(6486002)(478600001)(6512007)(38100700002)(6666004)(83380400001)(26005)(66574015)(8676002)(4326008)(6916009)(8936002)(66556008)(66946007)(66476007)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TgBy0tK1ZcxRR/UBM6kvQSqDLO9JnQiw+thZeucve6Ro3R93V846vR9Ix9?=
 =?iso-8859-1?Q?soBN2lWDAanrBIxhg5+C9Zv3tK48PBsX+a/JzTMryVftfpv5owhDSugyQs?=
 =?iso-8859-1?Q?dKk39QGzyOMl71PXtXx1x+EE68ksO6clkMJIzsDXjmNuOSXkNPcgHEynGH?=
 =?iso-8859-1?Q?JQGMejRNYUiaFHYX367t9CF6uNGy5EoJcbu/DJibvvcAFz6Lbg90NfV/Mw?=
 =?iso-8859-1?Q?vlcQ01Lvvi9vYdqybnUe1AeMo7wK9xtlALtZuJzkTlzxRrwwzHjKXgCW52?=
 =?iso-8859-1?Q?BuAeDoA+oi2xtn3DPJZGNUsQm0N4hurY3dKrJaFD9m4ksJyoZom9k4npla?=
 =?iso-8859-1?Q?BJI6JsiU1M0WHspVaGxIbx6aLbY+qtGpndQF2quPHuNE4yP72Lqg8HPUrP?=
 =?iso-8859-1?Q?rLSu35EA84T+ZCzEoR7wHjjuwprBiI7zPst53PoHQGo5JgRSYjBjHf03rb?=
 =?iso-8859-1?Q?ccs/gZYtUZvO7YqeS8dGi66IdovfrIq+J7yDqwuraoNr063Ud/uKRqbLqB?=
 =?iso-8859-1?Q?QUJVtQXRvMHqUKby5eaYvcZDcWuYi6cYdOkQk12g01M3XP01cu5xvkJ0Iq?=
 =?iso-8859-1?Q?I6Ip57kLG2m1reGqLcvync93aFPmsn6gzZ+5lIQkChywmQIGmoM1jitMiB?=
 =?iso-8859-1?Q?ritxJJCs12pJBPELdilsYzX5Ce0Is0s6fHfmtUToj6KTRcJJxJ8t3MajmX?=
 =?iso-8859-1?Q?MzhlTPdAavWpKmSxmxJQZcFESLpGvyrWukmk8QGqG6T2CJ4XqTsak0yyoy?=
 =?iso-8859-1?Q?V1R1aCNCcB9d4sY4XBQBG+1+Mdo3ht0HXaQh66mfFzeC3jDeUppncf2IGL?=
 =?iso-8859-1?Q?r5UyA641EWH0Hlvjm57JGl/AYtaRueir8GX7o7gqDBruME6Uw27Ujo/vW4?=
 =?iso-8859-1?Q?t7xsp6iXZCubgAMssGU5Yn3K3J/6/wx1uxwc3F8orfhTCj0gvQ5XVuxeOM?=
 =?iso-8859-1?Q?emd37lG3emsRJ9SE9PhTGCxeamH3VT2Y/XzxcAwnLSwQxp8ZLMvIRCcLAV?=
 =?iso-8859-1?Q?Gsu7KyTf2YnENigPobKq7oF/dtnUffPody8ut0ubbalXPb7h5pPqbA4ehg?=
 =?iso-8859-1?Q?x9H6A1NocdsB0YI5pZnA++rV8oQbnxBtzRpXew376AmgKkTNPWD5Fg7noa?=
 =?iso-8859-1?Q?QmogkTZANkZ/wgS9IEpjvs12QppsCXTc9OahQ/3IWSPxgoyu8S80yhEefo?=
 =?iso-8859-1?Q?YNSf5JyG4eOY9MmMhM8ECiabgiz/sFdTgEPTUShEOqG+fP47+Xt47eaft0?=
 =?iso-8859-1?Q?zY2nZVS4eF9EUef9I50WPa1qTW1p/D/rsdUNo1trQPRQBGmfU9Ek0QVwYl?=
 =?iso-8859-1?Q?t2OO6cdUjK3ZakMK0w4jTLB6xYAUZjzqQ/Hj2/PUc3L8D2vVZGlFyQjR68?=
 =?iso-8859-1?Q?CH0yYKoHZ7dyVT9Zhho9tuc9IS5IHJwG6lIVVZQCEzvP7ye/YfuU/VY1L4?=
 =?iso-8859-1?Q?fryW06JJLNre89XkDQB0ZtRA+/jIbYatHQEMfateVqmUSbwMy8tvsP6B/J?=
 =?iso-8859-1?Q?xB1KfDnuBAXCN/jPx71ccW60tM5ftSk2BqoRk8e54IMdMf2A7Fw91pGKRK?=
 =?iso-8859-1?Q?t3IbjofTLO3iW8p13lDnt6qEKPuyrEj1toefIAXK3aBuf8wMg/9Mb73pZm?=
 =?iso-8859-1?Q?c1Mi25Sk8CPgnOLG23ty46RQJda+SII7mQI4VMJB0/+V8N4ElSiAYJiQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71de9832-db93-463a-a766-08dbf6712330
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 15:36:38.6717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7e1SY8rZG1h3TAlfY8RydI3Jzz/GVKMPBJqxKU/50d0sduqJIsIihNwm2FDkwfH1bKYY8ujsDiWCapV5PzskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/5] drm/xe: Take in-syncs into account
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

On Wed, Dec 06, 2023 at 03:00:33PM +0100, Thomas Hellström wrote:
> On Tue, 2023-12-05 at 12:37 -0800, Matthew Brost wrote:
> > Wait on in-syncs before signaling out-syncs if num_execs or num_binds
> > ==
> > 0 in execbuf IOCTL or VM bind IOCTL respectfully.
> > 
> > v2: Wait on last fence in addition to in-fences (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
> >  drivers/gpu/drm/xe/xe_sync.c | 74
> > ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sync.h |  5 +++
> >  drivers/gpu/drm/xe/xe_vm.c   | 24 ++++++++++--
> >  4 files changed, 107 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 96d7506a4c72..438e34585e1e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -238,11 +238,17 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >         if (!args->num_batch_buffer) {
> >                 if (!xe_vm_in_lr_mode(vm)) {
> > -                       struct dma_fence *fence =
> > -                               xe_exec_queue_last_fence_get(q, vm);
> > +                       struct dma_fence *fence;
> >  
> > +                       fence = xe_sync_in_fence_get(syncs,
> > num_syncs, q, vm);
> > +                       if (IS_ERR(fence)) {
> > +                               err = PTR_ERR(fence);
> > +                               goto err_exec;
> > +                       }
> >                         for (i = 0; i < num_syncs; i++)
> >                                 xe_sync_entry_signal(&syncs[i], NULL,
> > fence);
> > +                       xe_exec_queue_last_fence_set(q, vm, fence);
> > +                       dma_fence_put(fence);
> >                 }
> >  
> >                 goto err_exec;
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index d0f118223fa2..e4c220cf9115 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include "xe_sync.h"
> >  
> > +#include <linux/dma-fence-array.h>
> >  #include <linux/kthread.h>
> >  #include <linux/sched/mm.h>
> >  #include <linux/uaccess.h>
> > @@ -14,6 +15,7 @@
> >  #include <drm/xe_drm.h>
> >  
> >  #include "xe_device_types.h"
> > +#include "xe_exec_queue.h"
> >  #include "xe_macros.h"
> >  #include "xe_sched_job_types.h"
> >  
> > @@ -268,3 +270,75 @@ void xe_sync_entry_cleanup(struct xe_sync_entry
> > *sync)
> >         if (sync->ufence)
> >                 user_fence_put(sync->ufence);
> >  }
> > +
> > +/**
> > + * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and
> > VM
> > + * @sync: input syncs
> > + * @num_sync: number of syncs
> > + * @q: exec queue
> > + * @vm: VM
> > + *
> > + * Get a fence from syncs, exec queue, and VM. If syncs contain in-
> > fences create
> > + * and return a composite fence of all in-fences + last fence. If no
> > in-fences
> > + * return last fence on  input exec queue. Caller must drop
> > reference to
> > + * returned fence.
> > + *
> > + * Return: fence on success, ERR_PTR(-ENOMEM) on failure
> > + */
> > +struct dma_fence *
> > +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > +                    struct xe_exec_queue *q, struct xe_vm *vm)
> > +{
> > +       struct dma_fence **fences = NULL;
> > +       struct dma_fence_array *cf = NULL;
> > +       struct dma_fence *fence;
> > +       int i, num_in_fence = 0, current_fence = 0;
> > +
> > +       lockdep_assert_held(&vm->lock);
> > +
> > +       /* Count in-fences */
> > +       for (i = 0; i < num_sync; ++i) {
> > +               if (sync[i].fence) {
> > +                       ++num_in_fence;
> > +                       fence = sync[i].fence;
> > +               }
> > +       }
> > +
> > +       /* Easy case... */
> > +       if (!num_in_fence) {
> > +               fence = xe_exec_queue_last_fence_get(q, vm);
> > +               dma_fence_get(fence);
> > +               return fence;
> > +       }
> > +
> > +       /* Create composite fence */
> > +       fences = kmalloc_array(num_in_fence + 1, sizeof(*fences),
> > GFP_KERNEL);
> > +       if (!fences)
> > +               return ERR_PTR(-ENOMEM);
> > +       for (i = 0; i < num_sync; ++i) {
> > +               if (sync[i].fence) {
> > +                       dma_fence_get(sync[i].fence);
> > +                       fences[current_fence++] = sync[i].fence;
> > +               }
> > +       }
> > +       fences[current_fence++] = xe_exec_queue_last_fence_get(q,
> > vm);
> > +       dma_fence_get(fences[current_fence - 1]);
> > +       cf = dma_fence_array_create(num_in_fence, fences,
> > +                                   vm->composite_fence_ctx,
> > +                                   vm->composite_fence_seqno++,
> > +                                   false);
> > +       if (!cf) {
> > +               --vm->composite_fence_seqno;
> > +               goto err_out;
> > +       }
> > +
> > +       return &cf->base;
> > +
> > +err_out:
> > +       while (current_fence)
> > +               dma_fence_put(fences[--current_fence]);
> > +       kfree(fences);
> > +       kfree(cf);
> > +
> > +       return ERR_PTR(-ENOMEM);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > b/drivers/gpu/drm/xe/xe_sync.h
> > index 45f4371e94b9..d284afbe917c 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -9,8 +9,10 @@
> >  #include "xe_sync_types.h"
> >  
> >  struct xe_device;
> > +struct xe_exec_queue;
> >  struct xe_file;
> >  struct xe_sched_job;
> > +struct xe_vm;
> >  
> >  #define SYNC_PARSE_FLAG_EXEC                   BIT(0)
> >  #define SYNC_PARSE_FLAG_LR_MODE                        BIT(1)
> > @@ -27,5 +29,8 @@ void xe_sync_entry_signal(struct xe_sync_entry
> > *sync,
> >                           struct xe_sched_job *job,
> >                           struct dma_fence *fence);
> >  void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > +struct dma_fence *
> > +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > +                    struct xe_exec_queue *q, struct xe_vm *vm);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 042e1e31ba54..254766a79364 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3178,12 +3178,28 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  unwind_ops:
> >         vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> >  free_syncs:
> > -       for (i = 0; err == -ENODATA && i < num_syncs; i++) {
> > -               struct dma_fence *fence =
> > -
> >                        xe_exec_queue_last_fence_get(to_wait_exec_queue
> > (vm, q), vm);
> > +       if (err == -ENODATA) {
> > +               struct dma_fence *fence;
> > +
> > +               fence = xe_sync_in_fence_get(syncs, num_syncs,
> > +                                            to_wait_exec_queue(vm,
> > q), vm);
> > +               if (IS_ERR(fence)) {
> > +                       err = PTR_ERR(fence);
> > +                       goto cleanup_syncs;
> > +               }
> > +               for (i = 0; i < num_syncs; i++)
> > +                       xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +               if (xe_vm_sync_mode(vm, q)) {
> > +                       long timeout = dma_fence_wait(fence, true);
> >  
> > -               xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +                       if (timeout < 0)
> > +                               err = -EINTR;
> > +               }
> 
> 
> Is there a chance we can make all this a small static function and also
> reuse that above?
> 

Yes. Will fix.

> 
> > +               xe_exec_queue_last_fence_set(to_wait_exec_queue(vm,
> > q), vm,
> > +                                            fence);
> 
> Hm. What happens when there is a new bind with a real workload being
> queued *after* this operation? Will it take this composite fence as a
> dependency? 
> 

Good catch, I think I missed this part. We should always add the last
fence as a dep if any new jobs on queue. Will fix.
 
Matt 

> /Thomas
> 
> 
> 
> > +               dma_fence_put(fence);
> >         }
> > +cleanup_syncs:
> >         while (num_syncs--)
> >                 xe_sync_entry_cleanup(&syncs[num_syncs]);
> >  
> 
