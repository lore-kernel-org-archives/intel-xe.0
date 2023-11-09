Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E243C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 21:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CA310E913;
	Thu,  9 Nov 2023 21:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738710E925
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699563658; x=1731099658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ix2BJNBYrZqqgkgs0fBNzCslsUKbawzdOfKRoL/9cfE=;
 b=KjphjWtCcCqQ7ybWhNvk4KnMQKohD0VeSNvKkShk2s9s/hi6nl7kdlTA
 6EE1FeVVGNTeoVYBIZ7F0wy/kSKuBSSajR1g4tzb0Tm9G4Te3RqYfCyiC
 uEb9zjJw0qKaKZ2Xe/VTJk7dAgsP6KeQZUPBg4pYMsQB3HH2AWS1CgLnl
 lbgrr5RZgkrrWDh1e92c6RFjaiZa8wo2q219xoOVifDpI7MrJ3oAn6XEq
 K3rE4s5Nf7NqF7wbrrEBPEv/FYH1LFYENLCjMH9oqTRQcS2ouKZfcTgjg
 /xIpRlvGCLzQsFk9fQ6ag9gZUd5oetAngmlAZibY4idmuLXd+htSV/aM4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421167037"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="421167037"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 13:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887143501"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="887143501"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 13:00:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 13:00:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 13:00:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 13:00:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFe7m9Zmdc+WgOduNrk8OSyhdZy8FTQ99S1THsLNtaFFGIzq92rdg7agwoUTnNPsMAtkfDddSrVqlqaF4u6hzYa5VbcVie8irpm2tlWnTpyOQ3M01diRYXTCg4x/KkJvgdJpi64RKJ+HDiGG20tP73oZnx2LsQcPMmrkMtIqp426WAg8Tewa3kfybRQiccKIIOMAQNpomKQ9ckIt1pYD2o4d7jdXOa3SkInklYFLhtFMU6x8edf9z4mG4hE27jg2vsCZKboObgcai5QbozfKyROe/5GZWG8H7VitAjcXqsI5rYsj+iLLTs87Nx1z+zkajZGOM8IhX8J01SuKJjTHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+rALKXYVzG5HPTVjqRLXebQSd7j2nXO41pKQUaheQs=;
 b=nOhQ3lKu2wnjbiPdaS3sBPe+9endW/vu/8nf46XivTIOWvSVlBKi0anZylvC2eTlRwY3iaLWeBz2y59z/LhQweXNIuXUwYPy73qBZ/uuDBAJKphVuJXvwBsRxAbvPwmhFxxQ5ywbJiOB/p3R2BZV10roRTS02yDs6DjyHBFTfAWoTuM1QTwBJY1U/ChFKgQ3jO+T+cwI4GU8q9e+LGpPXT8/GxRcT1JFxZ4EXhiVdSHaEAnvttjq6XQrVRdL1mHBe3mcIuAJU+KfHOYriAIL/ZMwoR5MPekLYWUvHcn0Vd1TgM/kzoesL5PWSD5KC4+u04XpYQEO+0irJgEYdRWlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 21:00:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 21:00:49 +0000
Date: Thu, 9 Nov 2023 13:59:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <ZUzl3N2GXN3xGDD3@DUT025-TGLU.fm.intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-2-matthew.brost@intel.com>
 <d8763447-3045-4c2c-8666-ba2853f8c34a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d8763447-3045-4c2c-8666-ba2853f8c34a@intel.com>
X-ClientProxiedBy: BY5PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 126704ce-17e4-4f44-1a31-08dbe166f381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSdG/y3KEMWVRFkq9V0Pav0dXB5WIgQVntaPGEXaNGaSB+kuo5ah6JdgYHW399EB7vT/QL+S6pvWAg0YWGMxzrr8WbwDFOvZIchmur1I/BQVPa51Hm8bNglCM77FKHC4BVLREl8Jpshvv+1lMmTlC4fYPvBeWBiL/ibjjyTllbrypy5J9vihGaypN2jaoVy89A+BnZuSjDEg52bCrbUdl1RGDRduglLpc7WiFGY4I7j/L8GgcddO0tSByVWPeJp1Nk6fUN+tFEnBes8eC1fCKbUJ4AD60SaibVkG8pWFiOahx4r3RmEmW8qXRmj9hjiWsuSCLbotZY3n08btQCBNwI7Q9rS0B8mJe1YtC78fHXFJ44fW7/dGJpy/6thiIYLZzctohEWNko7vs0XUwqMRqQ3hpZchyJq06H5klC/gGsMs65Xw6sYeMf73LkQjnGW1VfaV8p1Glc/hn2kRJ88n1X2YKpvFqlypr/Q/jsqlXasHWSlI8APd4xpZaem3+3G8libfmr/3b+1MYueRTXvUGgjw+0pRKlI8oenA0iuqSrLzELzBL5UY9Q8Ria0m/YeF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(26005)(2906002)(82960400001)(83380400001)(41300700001)(8936002)(38100700002)(8676002)(6486002)(6666004)(478600001)(66946007)(4326008)(6862004)(44832011)(6506007)(86362001)(66476007)(53546011)(316002)(66556008)(6636002)(5660300002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?byONCmAIWMBBxRdZS1TgBwI3U6L42dQM1QSvd+Knlp0DC3GvXiDLcudRIapg?=
 =?us-ascii?Q?r9DT7X3LgWENQ0TSRd/M/aW0TvI5frbKw6mCKbarutRAuEwWa17HqfBTTSTP?=
 =?us-ascii?Q?RCpSH0rzJFm37IPxXhYchhLHZqkFcYaLl0S8y9yoDaS+lCqlUUMOtK3ymshd?=
 =?us-ascii?Q?hE9ENcYEeKSEKqrPyXJ7kmD46Q4LwEJx6jSv76FOlery2NGbMkvNj1PGnXp7?=
 =?us-ascii?Q?8weoGoXTz0oJLKe0h34ELdxLngpiraiM6Px/gn/GUsC1kq1AkDF+kEQuCOSD?=
 =?us-ascii?Q?PH2AdTmb9ldtAU4zZ34v0FWyg7O9oKIuhnZXWwNon2SfdcOOU+V8BFB5Glx0?=
 =?us-ascii?Q?FO/p8GLADKMqUMpj+RKsJoj7YW9XAV1hilgQKDgcq+9yF4P+OyIprNrG9AWh?=
 =?us-ascii?Q?ckbdoSGks7h+nXcadTWCSaQAIn79xAc29ygJz7xT5CiR15+KZqLeUC59OpmA?=
 =?us-ascii?Q?qteE0JN4MELL32OOSG/9LpdT//pOO2Nzosr32NFPd14zUh53gCd+SV+sAWNM?=
 =?us-ascii?Q?p4ib+tFfuLcX1/Ue+9XheF3ai0EowwJI3IIu0j27WIMMIV+SqjqqvEtFCWbv?=
 =?us-ascii?Q?2HMgeADIXy8iyA7LIj8AxArX33xGedZHQ/SmW+SIOicKA2PvPy8+zI8go+La?=
 =?us-ascii?Q?YIBhpMywHfGPye2u4LHEY1cTQs4nfYFaFPFT+wH01WvewY0wKKj+Hc1misyV?=
 =?us-ascii?Q?FKdJrEDxULMVdh54/rXO0CI7mcTleUJu2qQR3JhrjrmJMvlRh8ACV2pDVLMg?=
 =?us-ascii?Q?4MkypfyqUTQYrez654I2l6sLYLa90aQ4fAPgZg+rcd561vnyXc6cTDQ4Dwsl?=
 =?us-ascii?Q?u7QQvIAAFM/wULRkDh3EEm/Xl3UGJSaOe3EKhQ+ye2/eF5YJNw5zYJk+6DHQ?=
 =?us-ascii?Q?6xBOMwU5QSnLMn4o+rG/0RGh726Bk4Lt5b3BTTsMr6MHkF4QUlVWr20kSZcP?=
 =?us-ascii?Q?y/i1sdEsPWJ1UJbFdUx4vnWxkG783ljjRRT5u/HW8Vay5KT8tj3YaTJROcSC?=
 =?us-ascii?Q?Y6IyLr0ge4YmtKL03czyNmNUzTk+xtjrpgdI1D/l4Fm7UH6lJ6XZd7GKAtYA?=
 =?us-ascii?Q?AMwPLv6IBGMONAn2fP/50cCKPFW9y+Az6/1wc028GTrhHJYTFCDWZuN1kVVw?=
 =?us-ascii?Q?DKhCRqVDoxCrdibTCuqBgy1LC84maAYCHpLUjFneYkrdcZlel58wTtx0yhOU?=
 =?us-ascii?Q?oAg7SPUKAqknS1hVK3wNKiWzlsGfMNXUlPcu6aj/Rl+pYbm1QssogvFv7PJR?=
 =?us-ascii?Q?ZqUQrJXs1FeAsrMVctCgyDC2pVx/Ra+T1nEtJdRhUwW6Io3X6EIOWtODQX5Y?=
 =?us-ascii?Q?pLp7EKBar5k1Kdb/HWxiT0VIMiWWU0OSyFV/1HQG3jzlDyfE97lGCSXWH+rM?=
 =?us-ascii?Q?hWCJPmjCOptJwO8pKehdhe45QLXR8WisxsnJGjKEQfHIyD4N7YJ/7iGwCXdy?=
 =?us-ascii?Q?E1J6sbkcLusXWHqGRxRIRKnkV52xpFGoP/5npMYCzYn9H7PasAQWJJoN7ZrQ?=
 =?us-ascii?Q?Tw+3t8+71BwBz77mHVyyw6sfKgwbZOvGqzdM+InibMONTKDy6F72lHzLhdim?=
 =?us-ascii?Q?7h7LX9Cqt0QD792nMTuujcGDbmg16HZbCgfJVxnAmknvu0b9YIGfYIIYtDJ/?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126704ce-17e4-4f44-1a31-08dbe166f381
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 21:00:49.3578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFeQzNRnz/kYe0GvYXGyWvuEED8CCyCOqU5akjBloqCI6f7O8msh2UcjYFMWj9JxT0ElrZT8ckIq1iM6RJAW6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/27] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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

On Wed, Nov 08, 2023 at 01:30:56PM +0200, Lionel Landwerlin wrote:
> On 07/11/2023 07:25, Matthew Brost wrote:
> > The idea being out-syncs can signal indicating all previous operations
> > on the bind queue are complete. An example use case of this would be
> > support for implementing vkQueueWaitForIdle easily.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
> >   1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d26c90f0d702..403444ff3856 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   	int i;
> >   	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > -	    XE_IOCTL_DBG(xe, !args->num_binds) ||
> >   	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> 
> 
> Just randomly noticed this, but is there a uAPI for the MAX_BINDS?
> 
> Or do we need to hardcode that in the UMD and hope it never changes?
> 

We should probably report this somewhere. Let me look into this.

Thanks - Matt

> 
> -Lionel
> 
> 
> >   		return -EINVAL;
> > @@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			goto put_exec_queue;
> >   		}
> > -		if (XE_IOCTL_DBG(xe, async !=
> > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> >   				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> >   			err = -EINVAL;
> >   			goto put_exec_queue;
> > @@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	}
> >   	if (!args->exec_queue_id) {
> > -		if (XE_IOCTL_DBG(xe, async !=
> > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> >   				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> >   			err = -EINVAL;
> >   			goto put_vm;
> > @@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		}
> >   	}
> > -	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > -	if (!bos) {
> > -		err = -ENOMEM;
> > -		goto release_vm_lock;
> > -	}
> > +	if (args->num_binds) {
> > +		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > +		if (!bos) {
> > +			err = -ENOMEM;
> > +			goto release_vm_lock;
> > +		}
> > -	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > -	if (!ops) {
> > -		err = -ENOMEM;
> > -		goto release_vm_lock;
> > +		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > +		if (!ops) {
> > +			err = -ENOMEM;
> > +			goto release_vm_lock;
> > +		}
> >   	}
> >   	for (i = 0; i < args->num_binds; ++i) {
> > @@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   			goto free_syncs;
> >   	}
> > +	if (!args->num_binds) {
> > +		err = -ENODATA;
> > +		goto free_syncs;
> > +	}
> > +
> >   	for (i = 0; i < args->num_binds; ++i) {
> >   		u64 range = bind_ops[i].range;
> >   		u64 addr = bind_ops[i].addr;
> 
> 
