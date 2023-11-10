Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DAC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 16:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390610E118;
	Fri, 10 Nov 2023 16:04:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D13210E118
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699632278; x=1731168278;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7lYxZT662FcUSLocMw8cPwEYTk7zYfztWneMBxWpkAs=;
 b=ax0f8ckWlnNbrHiinKfevVV5jl6xJcxsN2JKtS+2QIY1uqbpfAabvopW
 EWi/fZy6uPkKxRanjZcWm6yBwaChKo3YzK2hsPwfUozUYElgY+QBgAOF0
 CFNC7LKDMkWZIlUkhTuebyoikikQtl8Ph4qYeLDTz5Tc8SAzWj2FC1kSp
 p8yNQnfWYq8hdR5l0rPARd5VicbhML5BoqtIsHO1Pluv0BrKzDVKIvgHJ
 Z2rMiVn1/8ungPZd+N+Gg0UpfOzC1mTkMdnG1hDL1hRu+lWWDCL2GaXer
 EoUvWz5dHcpVlnvYJHWCcIkbSvKvzgL+KTc5Txaz2H/vV0a6F1IExOU9s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389059583"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="389059583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 08:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="4878609"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 08:04:37 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 08:04:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 08:04:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 08:04:36 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 08:04:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1PcjB/br5NGwhwuAbnvuEpS99rRhmo397wWzmx8dgNOAIx0yXqXvPGkDrUoPk9A0NvBvEXOkOMqX0Q+xoX112qUu0vV/g8fd9c3JeqXqDLb++Mg0GEP6oAJkz9CUsxAN518PM2m7ZppTvFxoWnSTx8SrTwyxbW9WInU1h0Yxt6bF6dQxQI17n1WU4g6BzWiNfYcZ+38SDDUrfElNKX23naaZ3tTlOHeY81YfobUOorQcjjL790AcKfZErfHPjL7tY194uOng4Cor0fPA5kuSj0y8PSHLXbukWDZBDDNr9wUjh8HBBE7vFlMWJSNo8YG8ndPZiMfddmPQ400pPFEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsAQi90+yqFtxNkPZdlGj1Of1FQFko5s7o2Ei3wBOgg=;
 b=QOu7p9nMQlL8JLWaKC+8CT9VbdT/7k8MxfmTmSrLi/7Nm53XzUHVAiXi6xC7sylr2uW8ybVYDaYZyDLMAHkXogoW++7juq3JliwZgXGbhPqvc2vWiUE9tSuzk//j6LYmNOoqxtho+714EeMLCrQIR60EGm4O/w7GAa8FzEYTIYAFrJSeQ1X4jF3+KuqmYxiu9JcmbnNpKU1nxDpdKuR8pAXQZQSBkOF+rg/ts0TrUS/I2QkPS7cRps5yPS68rcsfUMaF/IpEstVT81K5x2HPoSyMqEa1JbMgasCkj4cAikxvM47dg+wGCdFdC5nitbDuNXnfoJFKOa1yFm+RpjiHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Fri, 10 Nov
 2023 16:04:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 16:04:34 +0000
Date: Fri, 10 Nov 2023 09:03:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZU3x6d71fR5Ej7Zm@DUT025-TGLU.fm.intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-3-matthew.brost@intel.com>
 <bbafb1542651c119143976247853c13464adfb12.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbafb1542651c119143976247853c13464adfb12.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba8c93c-96a4-4eaf-3ceb-08dbe206bb0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vwi7oYKfS1cWF0COPtwFxoBofui4DbE93HrfAWuZKDn+1oyN/hEEhPTu3BNqFuj8MuxCVKsvJItCITw+Tc4SXxMCsJQpU40koLs8cArRXiFzDFgamoe17YAq69CeK7h/N5/PzTRIccOLfMNj3mbifcLStctK2OWZezwHdXRXlNU6v3vu29InyQA657wZtBGgnyYI3BUpWqGuczbrJDvQ4zdwOovlBz3fSntj8WwUbii6Fi2+gYUZpLaKUxc2uBIR54FtCGk2l+9Fy6LbhvTdoCE9oIHVqRh6cxINF39JkIkZlZlD10NijbcblexmKfpbM9arQlUgUjWmKSIl+pVlOj+jygWI4Xjvcj40HbX4NPMSOh9Te7O6phvrESy5sy+EAzI5zRxa3pBJj+gSvJ8jk8OyOvCpHUdUBXoPIQ498TJsv5emmcP/7Lb6OyebRhwEaI5IsvOnfjvibHMEvGA4k6x3PlvhsECLf9RKDvP14JFuoPDLIZADsBSAEsU82in2Y9qdqbuiqF9VuTCJUqAJ404V0pl7ekHEFK5rO+ANMBvZi4hJURugjDY3CztblAch
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(6506007)(6486002)(26005)(38100700002)(66574015)(66946007)(316002)(4326008)(2906002)(66556008)(66476007)(44832011)(83380400001)(8676002)(8936002)(6916009)(41300700001)(5660300002)(86362001)(82960400001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wUfN9vio8UODGUlLV20hIUo+MZtmJeRr2oMMmBurdT3Aj1hSL3g5WktoSs?=
 =?iso-8859-1?Q?48FQOUMhfBjIXdE55BmHCQkhi6vFrjMyu3BOgxXbNXjYeSIDyUG70QpT6n?=
 =?iso-8859-1?Q?ZqnvLFAeO/xpmrWoabdgxr55nb/oTIJjr9LvvC+5dm7YKNlEr+6Z87v36n?=
 =?iso-8859-1?Q?ijNZFBobeyroYpDVajclIW1aJEDTuz6mmxf8D5ebqjvuzJP7TgggpuOQrG?=
 =?iso-8859-1?Q?7RHFA8h2PRZal+bKu0nUtnWezamwk9tjfmA85vAWtv3hUlPvJIPjN8qYuH?=
 =?iso-8859-1?Q?iS0nPGQ+a2sfN/sHwGk7Dyd+i+VprWE8mUtN7UqyuX/sJZ1AShnyDjcEr7?=
 =?iso-8859-1?Q?2Tmx6E+26NuHuLNoEWzERbZxhlWXcPw6s5PiPaiDaYw75PxQHAsRJsm67u?=
 =?iso-8859-1?Q?G3MFwajv4zQfsuBBrQoGJXDidIxsW/DCxYiBoXd/Xz/Xt//Lqh1pgf+V5l?=
 =?iso-8859-1?Q?NX+s0Q6TuUsiuPi3gPF1zVOiKfwKSuQuUoZDUDSI3Zpl7GiLOoziS9Hb7Z?=
 =?iso-8859-1?Q?WOYY+HL9b3Xy8vbIZpPsVPszu3Jq9oWOK657bsZq6LUED00ZWIuC75f5rl?=
 =?iso-8859-1?Q?IBoOSnLgbHPov5RqvKzAoXQohgUWn5GAysHNCBi/Q7/3Y0DNGw2LYaPd0m?=
 =?iso-8859-1?Q?X+2FuJ7h/ciUqA4g2ENgDH2o1/sM+o0ZhmtstPorg4ct6VplVz6aGUxpqU?=
 =?iso-8859-1?Q?s3OCqc8oVQMSEbtb0mwoRuqHQaDw6FsPmVIozYYic+O692HwC7Js2YgM1u?=
 =?iso-8859-1?Q?2uIjPWT3Uk/F8DGga5rCKwbzl0BOmSmrIOrXwCXEdxKPJG06+NymNMAwha?=
 =?iso-8859-1?Q?oYq+HfBFlcWVyAw+zAI86Tg7ALeFa1uNjs8/omHqjqXfiowxnovmH7AGBV?=
 =?iso-8859-1?Q?+qGs1K0Nsh2XWDL5QtexGKXwLY+OS5yVbcAUP5MVjXfdFk2GjtqIRhEnUp?=
 =?iso-8859-1?Q?n7S2VtH/uueFwJw7BxZKp4ORKdijcLCURC9aJC6B9/tjQIKVwsSX//6iid?=
 =?iso-8859-1?Q?ESm6LYS04zW+b+k7pKUoTdhgH3oxf9vbQTMJwDXaTY77jkmefUpILtl7s1?=
 =?iso-8859-1?Q?5q4wMi4CnIMnuJBrkegQykRMZIXyC9XP27iHmYV54qjtmkVAoQxg5ZNx6b?=
 =?iso-8859-1?Q?iUMzwk3SnUj8p/9GCbYM7S/fRClt5W+vNDwmGStOXOMNJelX11L5Fqs7Ok?=
 =?iso-8859-1?Q?Uu2ituiudY7NjDtlsP0eLaiCzMrpgILNQ7E78SotKUxH/Ojav9v+gw/N4T?=
 =?iso-8859-1?Q?zIjBAoXNv56ArgRqh2fsMNjrBD/BrXqqX2gv9z/s9wGQcKsFKVEnGyvLyc?=
 =?iso-8859-1?Q?TutCruYkYzvq6E0AojVUi8iglgP+/3atAIqZxJ5Z9xBUE49viDmZUI/jvS?=
 =?iso-8859-1?Q?a0sloDtxAGbQNuuFRsdv8CrX0naVEUInLRKLCDhVHGOa4MsduZs78zR6TK?=
 =?iso-8859-1?Q?hsCEFpZVMxo8B3r2mZDkMtTX/BBaZkDIdY1B+NqcytsiGw38oy34KqwdMg?=
 =?iso-8859-1?Q?XP/+QLTgY5RQ9i4OjI4GKV0NEvl/ej5dEBiBPnNwNQ2+U7R+A5IeKzGMDd?=
 =?iso-8859-1?Q?/paj0+6i6E89/NwURk3bwi1wyiq5+qtGeV0oWg+l55e0oj13uXJUOZL6OG?=
 =?iso-8859-1?Q?zYvsaqPfnuTN2B1UT++gD8QiZWVOIlqvRn01agLVzxTZY/ykB7GbhTgw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba8c93c-96a4-4eaf-3ceb-08dbe206bb0e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 16:04:34.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGpVjROwJvCUIrhjN5i6JKDPxFIfSWUYv1R3m/nzufHivAEFC5E1qfJxTluY/RlXe9UgUDGU9xZMpzGcvJWfoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/27] drm/xe: Allow num_batch_buffer == 0
 in exec IOCTL
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

On Fri, Nov 10, 2023 at 12:11:19PM +0100, Thomas Hellström wrote:
> On Mon, 2023-11-06 at 21:25 -0800, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous
> > operations
> > on the exec queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > v2: Don't add last_fence for VM's that do not support dma fences
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c             | 22 +++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
> >  drivers/gpu/drm/xe/xe_sync.c             |  5 ++++-
> >  drivers/gpu/drm/xe/xe_sync.h             |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c               |  2 +-
> >  6 files changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 28e84a0bbeb0..4666f5b145f7 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> >                 return -EINVAL;
> >  
> > -       if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
> > +       if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> > +                        q->width != args->num_batch_buffer))
> >                 return -EINVAL;
> >  
> >         if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> > @@ -182,12 +183,13 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >         for (i = 0; i < args->num_syncs; i++) {
> >                 err = xe_sync_entry_parse(xe, xef,
> > &syncs[num_syncs++],
> >                                           &syncs_user[i], true,
> > -                                         xe_vm_no_dma_fences(vm));
> > +                                         xe_vm_no_dma_fences(vm),
> > +                                         !args->num_batch_buffer);
> >                 if (err)
> >                         goto err_syncs;
> >         }
> >  
> > -       if (xe_exec_queue_is_parallel(q)) {
> > +       if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
> >                 err = __copy_from_user(addresses, addresses_user,
> > sizeof(u64) *
> >                                        q->width);
> >                 if (err) {
> > @@ -234,6 +236,18 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >                 goto err_exec;
> >         }
> >  
> > +       if (!args->num_batch_buffer) {
> > +               if (!xe_vm_no_dma_fences(vm)) {
> > +                       struct dma_fence *fence =
> > +                               xe_exec_queue_last_fence_get(q, vm);
> > +
> > +                       for (i = 0; i < num_syncs; i++)
> > +                               xe_sync_entry_signal(&syncs[i], NULL,
> > fence);
> > +               }
> > +
> > +               goto err_exec;
> > +       }
> > +
> >         if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> >                 err = -EWOULDBLOCK;
> >                 goto err_exec;
> > @@ -327,6 +341,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  
> >         if (xe_exec_queue_is_lr(q))
> >                 q->ring_ops->emit_job(job);
> > +       if (!xe_vm_no_dma_fences(vm))
> > +               xe_exec_queue_last_fence_set(q, vm, &job-
> > >drm.s_fence->finished);
> >         xe_sched_job_push(job);
> >         xe_vm_reactivate_rebind(vm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 4fd44a9203e4..35710b66e5de 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -924,7 +924,10 @@ int xe_exec_queue_set_property_ioctl(struct
> > drm_device *dev, void *data,
> >  static void xe_exec_queue_last_fence_lockdep_assert(struct
> > xe_exec_queue *q,
> >                                                     struct xe_vm *vm)
> >  {
> > -       lockdep_assert_held_write(&vm->lock);
> > +       if (q->flags & EXEC_QUEUE_FLAG_VM)
> > +               lockdep_assert_held_write(&vm->lock);
> > +       else
> > +               xe_vm_assert_held(vm);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index ecd761177567..35ffe7c55f25 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -53,8 +53,9 @@ struct xe_exec_queue {
> >         struct xe_hw_fence_irq *fence_irq;
> >  
> >         /**
> > -        * @last_fence: last fence on engine, protected by vm->lock
> > in write
> > -        * mode if bind engine
> > +        * @last_fence: last fence on exec queue, protected by vm-
> > >lock in write
> > +        * mode if bind exec queue, protected by dma resv lock if
> > non-bind exec
> > +        * queue
> >          */
> >         struct dma_fence *last_fence;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 73ef259aa387..2461e7d4814c 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence
> > *fence, struct dma_fence_cb *cb)
> >  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >                         struct xe_sync_entry *sync,
> >                         struct drm_xe_sync __user *sync_user,
> > -                       bool exec, bool no_dma_fences)
> > +                       bool exec, bool no_dma_fences, bool exec_nop)
> 
> Here we have a number of bools indicating the context of a potential
> caller. That makes the code hard to read. When reading the caller code
> you'd both need to remember what each argument position means and
> exactly what xe_sync_entry_parse does for a certain caller, for example
> exec_nop.
> One would have a set of flags instead
> exec_nop becomes FLAG_DISALLOW_USER_FENCE
> 

Agree, let me clean this up.

Matt

> Otherwise LGTM.
> 
