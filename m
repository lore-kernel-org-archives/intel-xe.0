Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBAFC7EE23
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 22:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF25910E42A;
	Tue,  9 May 2023 22:16:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C343810E426
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 22:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683670604; x=1715206604;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wydnTCyI7QW3WBhNe3djiEQgp5k6sXGoULYAkxbWY3M=;
 b=LvSOZC6kVJlHUDjx/5TTMDd1PxAb3dlkHk9o+1KqtHsdY5QdhS7FRJTC
 ZFvVMFJampBQ4yp+/nlK8oSk4Dav+N3rvFlYXYhDw6HCYpjQ4Euk+joWs
 CQhC8xVEYjqGxxEKuxALeJOKqDZpZTwLeBt6FFmT0hWErTFenxIoFRhp5
 HnwcSaUnsT1OV0H2BuBlhFnq83LLNyV0KFKbwTe/X4XRDGWtU1z9eWUi8
 ILw3SpOWrM6kSa4HKuNf2g8iUdKY6x50q17hFagbtYerLY8VFd15kvtc4
 f95CFLEX68Jo5JHDKoDv20//VPODDj0VUxU2N1oiQz20uzZGRZyclrr6U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329683748"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="329683748"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768678860"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="768678860"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 09 May 2023 15:16:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:16:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 15:16:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 15:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxanTncbC8qaBpdeaH9pI0+kTsYNEkwMfEJTZJxLnBxWOgeB8i0MY8ijbESkZDOUGkX457p2I/ML8t918X7P9mEMLqyZMLZflf6mPp1OZuo8S7MNxHB0EapzioN1wI2jfyv9OTwXJdBV0nI5uAX7O/IN/whJ42b6/ZpZxiwYG8PVyqddR1sDo7QX6HEwILXwl9/fFFe/rVvyaHqdOhnVXsZjwvu5rKH23CfmySGoXv0WDIJBuxK2Cl9c9/wmCvS5ahFPgpG6keQO/wQNSCjfQRWa0IUl0R8r4ABSaRqbU382na9ey0j1JfRenRtHMSrCSGNi7sBpaU+KBOZZoFkNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CZgf6g9q+MJWJvx9JZp5ZfVxYItCNgaMeBK3RtDKao=;
 b=jwtsXLSML6TOgtlCLfDAcIahXGia3CnBt11Cp6MCizH72iECCjEQ4FGBaaF3IiELrQMlfInpxQdaQ0HXyKCvP9F+P0DmhCDFdST4fs5DVBw0kOtwji3wR5Q/UMz2uwrLvYp4NUtKiOk42a9j436eszppAuCaxuWB1mnpV+QTBvR8unxvkLmcFPsSCDDW8BOsR9svGvguLHM+lw+sTVoP+K37h4hXNS/lvvfigYAQq7W0eBwziByYZYozj1jnhhwP/5oNT1VR7vAdqv+zKY3vz/yRZiNB1sW9h2+SBFC3VA3sow66WeQwL4E3mxtZvoKqn7ZA0uXg4I2gswk3v4VntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 22:16:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 22:16:41 +0000
Date: Tue, 9 May 2023 22:16:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFrGJWx+blMkljvM@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-6-matthew.brost@intel.com>
 <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
 <ZFpfM0cvsd76A+tY@DUT025-TGLU.fm.intel.com>
 <df98676a-039b-d159-72c8-559c6ece606a@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df98676a-039b-d159-72c8-559c6ece606a@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af6b589-7b19-4091-8176-08db50db106c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rnc8VxRpGVuCoTPC/yvfkcqC6OTjMn73wGxRDUdujNNLwxHwLlkEphKs1aqNpJofO3XCn/e6km08RGNls39+ms2fadxsIfWJ5nzrfpwVfZtsBTBDVBF0MxK/KtFpaQaZW9xZGgW/qHyLLdoOoptPVdHZIiOnAzVET2mc+t/bhNbOX7GHECMu+g/GztjVTOqjWBhdGL8M+vUaJaSdHtVoD/fyhegnO0+cRxTCYiJQTUBlYFPUavSzdbiVhmIXWAJstDn9RigvkAsfI2EbfpFLSrtzI+5vqM7/ZH2pgaZyvodMTaJ+ZT4f/02Hn5H35sV29j9uxlHK+y+qtQ4mJYfy9mktwYMfT6Ei7Eg9DAAxEVC4C0xw9g+xEzmnbtVe2Ci5M6/0hZ+Vq0dJ74Qj6txt6Mvyc+p/DqvSi2qg246+zgt9C37unXz1QyBXTNp5V9ss7YTpRFDHgnHWrz9qjmSr9VgYGvM3V3TJ+vhJpuA413EWP07W1hxDPRyotlhVzZFokQFrjZE75+mEaCG7HtIbJykY14cL8xGW/w5Phc49HziO5EfBcEm4g9YqHwyhHjbZD2lDRxSlOQRgGIt5l6SCEFAmfKmeosQFlZ29O0tn5BA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(38100700002)(44832011)(6512007)(6506007)(26005)(15650500001)(83380400001)(478600001)(6666004)(66574015)(6486002)(6916009)(82960400001)(316002)(4326008)(66476007)(66556008)(66946007)(53546011)(8936002)(8676002)(41300700001)(5660300002)(30864003)(86362001)(2906002)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5cdFANzQ4JXvUO8xfkQzddgIJkQ4l66FI/WICTu0LQlRDpyMjkKxhCjRRQ?=
 =?iso-8859-1?Q?sYKQT2T6T9JPkDApKeWNp5zztMruGO0xQ5+auFQ8IjTO+meZNED5QGHTJW?=
 =?iso-8859-1?Q?EZcEDoFWF1Ds65vAQSnQwQR+KpNIom1lc2g8++7773+nwa9uo3Pbh1W/M+?=
 =?iso-8859-1?Q?9vQFE9vX0lNPzDDffzPwBvz3smZNkOxr0O4Q3u0qdSj1PE0npV9fZwS8DI?=
 =?iso-8859-1?Q?MvnjgiAdPgdgdDc3WJSLDDceBPid7Fb8waaFMNb+XgTRhE8KDfUoYevOBU?=
 =?iso-8859-1?Q?6aTyQ6PZDmEXv5X1FFCDJBIgAQeRnKttcTmMYZCSW7eASo3kDA3DbLNJyg?=
 =?iso-8859-1?Q?dEFnz9avpr1FzTP3UvlTRHjYahLMIZewT+SeMpMn26vW2QEv+2jas8YGQt?=
 =?iso-8859-1?Q?NY7XjgUSlS3Sek5XRX9iKPYeANdXiXqyMimE2tXaMYMUaQ+sNmHv3Is6G/?=
 =?iso-8859-1?Q?GGOOaEdJYY7S7qMpFLxLlbKYRMcE66WCb8i4RafvUPX6tpoEgFtdAhkgbl?=
 =?iso-8859-1?Q?E6MUqU/fqizar/ijEx7/luOvizr2yoAsXL1UqHOFQEu0iHA8G72kSCHR9+?=
 =?iso-8859-1?Q?dcLhBQ42I40QVxXehuwzfOHpRn5SyfkEl7w2JY/pKm9c5+3PCTpGgdVHxE?=
 =?iso-8859-1?Q?Rh5Qbeb3YBmq4Q2wapsZPz9LsIliq8ARSSLaMR5xlmnR3nTvfv/qYw9mvA?=
 =?iso-8859-1?Q?i/sJV+9c1yzJgR/LiI3p/nXvy29pen1KRwfQVAqChLSTjEXWkdV6F0vpPD?=
 =?iso-8859-1?Q?Pzmm7k+biEC+BM/1ppo8cccSHCIPJmvE3dGhdAdfN3ZuQC9v58gC1q3wbX?=
 =?iso-8859-1?Q?9a8cTjgwEl3NKRuEQ6dmkA9BWGsuwvZa8Ao5pqqt9N3DbC08BPZn4eLPS8?=
 =?iso-8859-1?Q?LzYreuynGZEmxVqlEKRAAQy/s+TB9DE0jqx0jqtC9EU9rnyJixQtE0rXlu?=
 =?iso-8859-1?Q?J6ZYmktGgEvkVpmY3drr46GfW0XKW+mbtyvWGmFHSrApb0aR+nsbVNN/Dz?=
 =?iso-8859-1?Q?tGkDpbCq3Z3HoQFZYdbWOp3tWTFdLgv0YP4iIohExaqOmA6ge0GgnnzekW?=
 =?iso-8859-1?Q?/gcprOvzcGFF9O9+wRWncdq9BPiPL5lAthV9T3PTYcy3XMlvStHkSq3afa?=
 =?iso-8859-1?Q?L+xTMPVggYKIFxTzCxAAWLsGOW9aCVTPRJvhT7AaIk/paU5NWnqcTmovdM?=
 =?iso-8859-1?Q?QlC0LyW5+K1udLf4hPRSFvDuSWCvxYQqtTtNXHqc+LCFlK+LDhuJ5afMrj?=
 =?iso-8859-1?Q?TdVSLl3qk65o987hls6SHMwQac55YEe0/QoHOZen8oZ2VP/F1UE+ebNgqt?=
 =?iso-8859-1?Q?yS1B0I3S/RqJU2Pa2vTtBiwq560f/nFJryr5ZJ0CN0pet9oyU3JkNnojH9?=
 =?iso-8859-1?Q?ZGkKXFqB2p/2VSkOwTwEaE+eHZCs6+cIXXyCR0I308yVtwsMedE0EAdey/?=
 =?iso-8859-1?Q?To3Jg7ahE6tJtZsIzXYHTTF2YaPb/aa/yrOhIcfjxWZpXoJQmwtuVum6up?=
 =?iso-8859-1?Q?NdpwFBB9iIs2/zsD6uxF/p5Pf3cx6dljHfwUngVVemC81GuPtVBf+9zP/7?=
 =?iso-8859-1?Q?d289UybD9X275NNvPSNhyG8Ykm5AbX26rBmRbyYPWuLoRJ3nDMD7DKrNS6?=
 =?iso-8859-1?Q?w0XOXzSh0M+VFkNaGatGk253oG9iKwJ8acCBubCnUrB893cG8O/lOPjQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af6b589-7b19-4091-8176-08db50db106c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:16:40.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQv9+vG6fXYCroGxS9Jpg3a/biENPmgX9GUZ6zCrfkXU2kpDCDUVp2eUrehhyDrGT6zUoud4ZzXICMmyz/IICQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Tue, May 09, 2023 at 05:21:39PM +0200, Thomas Hellström wrote:
> 
> On 5/9/23 16:56, Matthew Brost wrote:
> > On Mon, May 08, 2023 at 03:14:10PM +0200, Thomas Hellström wrote:
> > > Hi, Matthew
> > > 
> > > In addition to Rodrigo's comments:
> > > 
> > > On 5/2/23 02:17, Matthew Brost wrote:
> > > > Flow control + write ring in exec, return NULL in run_job, siganl
> > > > xe_hw_fence immediately, and override TDR for LR jobs.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
> > > >    drivers/gpu/drm/xe/xe_engine.h           |  4 +
> > > >    drivers/gpu/drm/xe/xe_exec.c             |  8 ++
> > > >    drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
> > > >    drivers/gpu/drm/xe/xe_trace.h            |  5 ++
> > > >    6 files changed, 137 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > > > index 094ec17d3004..d1e84d7adbd4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > > @@ -18,6 +18,7 @@
> > > >    #include "xe_macros.h"
> > > >    #include "xe_migrate.h"
> > > >    #include "xe_pm.h"
> > > > +#include "xe_ring_ops_types.h"
> > > >    #include "xe_trace.h"
> > > >    #include "xe_vm.h"
> > > > @@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
> > > >    	up_write(&e->vm->lock);
> > > >    }
> > > > +/**
> > > > + * xe_engine_is_lr() - Whether an engine is long-running
> > > > + * @e: The engine
> > > > + *
> > > > + * Return: True if the engine is long-running, false otherwise.
> > > > + */
> > > > +bool xe_engine_is_lr(struct xe_engine *e)
> > > > +{
> > > > +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> > > > +		!(e->flags & ENGINE_FLAG_VM);
> > > > +}
> > > > +
> > > > +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> > > > +{
> > > > +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_engine_ring_full() - Whether an engine's ring is full
> > > > + * @e: The engine
> > > > + *
> > > > + * Return: True if the engine's ring is full, false otherwise.
> > > > + */
> > > > +bool xe_engine_ring_full(struct xe_engine *e)
> > > > +{
> > > > +	struct xe_lrc *lrc = e->lrc;
> > > > +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > > > +
> > > > +	return xe_engine_num_job_inflight(e) >= max_job;
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_engine_is_idle() - Whether an engine is idle.
> > > >     * @engine: The engine
> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> > > > index a49cf2ab405e..2e60f6d90226 100644
> > > > --- a/drivers/gpu/drm/xe/xe_engine.h
> > > > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > > > @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
> > > >    	return engine->width > 1;
> > > >    }
> > > > +bool xe_engine_is_lr(struct xe_engine *e);
> > > > +
> > > > +bool xe_engine_ring_full(struct xe_engine *e);
> > > > +
> > > >    bool xe_engine_is_idle(struct xe_engine *engine);
> > > >    void xe_engine_kill(struct xe_engine *e);
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > index ea869f2452ef..44ea9bcd0066 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -13,6 +13,7 @@
> > > >    #include "xe_device.h"
> > > >    #include "xe_engine.h"
> > > >    #include "xe_macros.h"
> > > > +#include "xe_ring_ops_types.h"
> > > >    #include "xe_sched_job.h"
> > > >    #include "xe_sync.h"
> > > >    #include "xe_vm.h"
> > > > @@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		goto err_engine_end;
> > > >    	}
> > > > +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> > > > +		err = -EWOULDBLOCK;
> > > > +		goto err_engine_end;
> > > > +	}
> > > > +
> > > >    	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
> > > >    				  addresses : &args->address);
> > > >    	if (IS_ERR(job)) {
> > > > @@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >    		xe_sync_entry_signal(&syncs[i], job,
> > > >    				     &job->drm.s_fence->finished);
> > > > +	if (xe_engine_is_lr(engine))
> > > > +		engine->ring_ops->emit_job(job);
> > > >    	xe_sched_job_push(job);
> > > >    	xe_vm_reactivate_rebind(vm);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > > > index cbfb13026ec1..5d83132034a6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> > > > @@ -31,6 +31,8 @@ struct xe_guc_engine {
> > > >    	 */
> > > >    #define MAX_STATIC_MSG_TYPE	3
> > > >    	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > > > +	/** @lr_tdr: long running TDR worker */
> > > > +	struct work_struct lr_tdr;
> > > >    	/** @fini_async: do final fini async from this worker */
> > > >    	struct work_struct fini_async;
> > > >    	/** @resume_time: time of last resume */
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 68d09e7a4cc0..0a41f5d04f6d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
> > > >    		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> > > >    	}
> > > > +	/*
> > > > +	 * We must keep a reference for LR engines if engine is registered with
> > > > +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > > > +	 * GuC has a reference to it.
> > > > +	 */
> > > > +	if (xe_engine_is_lr(e))
> > > > +		xe_engine_get(e);
> > > > +
> > > >    	set_engine_registered(e);
> > > >    	trace_xe_engine_register(e);
> > > >    	if (xe_engine_is_parallel(e))
> > > > @@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> > > >    {
> > > >    	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > > >    	struct xe_engine *e = job->engine;
> > > > +	bool lr = xe_engine_is_lr(e);
> > > >    	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
> > > >    		  !engine_banned(e) && !engine_suspended(e));
> > > > @@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
> > > >    	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
> > > >    		if (!engine_registered(e))
> > > >    			register_engine(e);
> > > > -		e->ring_ops->emit_job(job);
> > > > +		if (!lr)	/* Written in IOCTL */
> > > Hmm? What does "Written in IOCTL mean?" Could you rephrase to something more
> > > descriptive?
> > > 
> > "LR jos are emitted in the IOCTL"
> 
> Ah, I read it as "the lr variable was written in IOCTL."
> 
> Perhaps LR jobs are already emitted at execbuf time?
> 

I missed exec in my update.

s/LR jos are emitted in the IOCTL/LR jos are emitted in the exec IOCTL/

Matt

> /Thomas
> 
> 
> > 
> > Does that work?
> > 
> > Matt
> > 
> > > > +			e->ring_ops->emit_job(job);
> > > >    		submit_engine(e);
> > > >    	}
> > > > -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> > > > +	if (lr) {
> > > > +		xe_sched_job_set_error(job, -ENOTSUPP);
> > > > +		return NULL;
> > > > +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> > > >    		return job->fence;
> > > > -	else
> > > > +	} else {
> > > >    		return dma_fence_get(job->fence);
> > > > +	}
> > > >    }
> > > >    static void guc_engine_free_job(struct drm_sched_job *drm_job)
> > > > @@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
> > > >    }
> > > >    #endif
> > > > +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> > > > +{
> > > > +	struct xe_guc *guc = engine_to_guc(e);
> > > > +
> > > > +	if (xe_engine_is_lr(e))
> > > > +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> > > > +	else
> > > > +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > > > +}
> > > > +
> > > > +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> > > > +{
> > > > +	struct xe_guc_engine *ge =
> > > > +		container_of(w, struct xe_guc_engine, lr_tdr);
> > > > +	struct xe_engine *e = ge->engine;
> > > > +	struct drm_gpu_scheduler *sched = &ge->sched;
> > > > +
> > > > +	XE_BUG_ON(!xe_engine_is_lr(e));
> > > > +	trace_xe_engine_lr_cleanup(e);
> > > > +
> > > > +	/* Kill the run_job / process_msg entry points */
> > > > +	drm_sched_run_wq_stop(sched);
> > > > +
> > > > +	/* Engine state now stable, disable scheduling / deregister if needed */
> > > > +	if (engine_registered(e)) {
> > > > +		struct xe_guc *guc = engine_to_guc(e);
> > > > +		int ret;
> > > > +
> > > > +		set_engine_banned(e);
> > > > +		xe_engine_get(e);
> > > > +		disable_scheduling_deregister(guc, e);
> > > > +
> > > > +		/*
> > > > +		 * Must wait for scheduling to be disabled before signalling
> > > > +		 * any fences, if GT broken the GT reset code should signal us.
> > > > +		 */
> > > > +		smp_rmb();
> > > wait_event() paired with wake_up() family of functions typically set the
> > > necessary barriers to make sure anything written prior to wake_up() is seen
> > > in wait_event(). So that smp_rmb() is most likely not needed. If it still
> > > is, its pairing smp_wmb() should be documented and pointed to as well. See
> > > documentation of set_current_state() vs __set_current_state().
> > > 
> > > > +		ret = wait_event_timeout(guc->ct.wq,
> > > > +					 !engine_pending_disable(e) ||
> > > > +					 guc_read_stopped(guc), HZ * 5);
> > > > +		if (!ret) {
> > > > +			XE_WARN_ON("Schedule disable failed to respond");
> > > > +			drm_sched_run_wq_start(sched);
> > > > +			xe_gt_reset_async(e->gt);
> > > > +			return;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	drm_sched_run_wq_start(sched);
> > > > +}
> > > > +
> > > >    static enum drm_gpu_sched_stat
> > > >    guc_engine_timedout_job(struct drm_sched_job *drm_job)
> > > >    {
> > > > @@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> > > >    			err = -EIO;
> > > >    		set_engine_banned(e);
> > > >    		xe_engine_get(e);
> > > > -		disable_scheduling_deregister(engine_to_guc(e), e);
> > > > +		disable_scheduling_deregister(guc, e);
> > > >    		/*
> > > >    		 * Must wait for scheduling to be disabled before signalling
> > > > @@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> > > >    	 */
> > > >    	list_add(&drm_job->list, &sched->pending_list);
> > > >    	drm_sched_run_wq_start(sched);
> > > > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > > > +	xe_guc_engine_trigger_cleanup(e);
> > > >    	/* Mark all outstanding jobs as bad, thus completing them */
> > > >    	spin_lock(&sched->job_list_lock);
> > > > @@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
> > > >    	trace_xe_engine_destroy(e);
> > > > +	if (xe_engine_is_lr(e))
> > > > +		cancel_work_sync(&ge->lr_tdr);
> > > >    	if (e->flags & ENGINE_FLAG_PERSISTENT)
> > > >    		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
> > > >    	release_guc_id(guc, e);
> > > > @@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
> > > >    	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
> > > >    	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> > > > -	queue_work(system_unbound_wq, &e->guc->fini_async);
> > > > +	queue_work(system_wq, &e->guc->fini_async);
> > > >    	/* We must block on kernel engines so slabs are empty on driver unload */
> > > >    	if (kernel) {
> > > > @@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
> > > >    	if (err)
> > > >    		goto err_free;
> > > > +
> > > Unrelated whitespace?
> > > 
> > > 
> > > >    	sched = &ge->sched;
> > > >    	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
> > > >    				    &sched, 1, NULL);
> > > >    	if (err)
> > > >    		goto err_sched;
> > > > +	if (xe_engine_is_lr(e))
> > > > +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> > > > +
> > > >    	mutex_lock(&guc->submission_state.lock);
> > > >    	err = alloc_guc_id(guc, e);
> > > > @@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
> > > >    {
> > > >    	trace_xe_engine_kill(e);
> > > >    	set_engine_killed(e);
> > > > -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > > > +	xe_guc_engine_trigger_cleanup(e);
> > > >    }
> > > >    static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> > > > @@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
> > > >    	/* Stop scheduling + flush any DRM scheduler operations */
> > > >    	drm_sched_run_wq_stop(sched);
> > > > +	if (engine_registered(e) && xe_engine_is_lr(e))
> > > > +		xe_engine_put(e);
> > > > +
> > > >    	/* Clean up lost G2H + reset engine state */
> > > >    	if (engine_destroyed(e) && engine_registered(e)) {
> > > >    		if (engine_banned(e))
> > > > @@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > >    	trace_xe_engine_deregister_done(e);
> > > >    	clear_engine_registered(e);
> > > > +	if (xe_engine_is_lr(e))
> > > > +		xe_engine_put(e);
> > > > +
> > > >    	if (engine_banned(e))
> > > >    		xe_engine_put(e);
> > > >    	else
> > > > @@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > >    	 */
> > > >    	set_engine_reset(e);
> > > >    	if (!engine_banned(e))
> > > > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > > > +		xe_guc_engine_trigger_cleanup(e);
> > > >    	return 0;
> > > >    }
> > > > @@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > >    	/* Treat the same as engine reset */
> > > >    	set_engine_reset(e);
> > > >    	if (!engine_banned(e))
> > > > -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> > > > +		xe_guc_engine_trigger_cleanup(e);
> > > >    	return 0;
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > > index 2f8eb7ebe9a7..02861c26e145 100644
> > > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > > @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
> > > >    	     TP_ARGS(e)
> > > >    );
> > > > +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> > > > +	     TP_PROTO(struct xe_engine *e),
> > > > +	     TP_ARGS(e)
> > > > +);
> > > > +
> > > >    DECLARE_EVENT_CLASS(xe_sched_job,
> > > >    		    TP_PROTO(struct xe_sched_job *job),
> > > >    		    TP_ARGS(job),
