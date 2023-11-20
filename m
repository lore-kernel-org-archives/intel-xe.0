Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C68C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA83410E0C5;
	Mon, 20 Nov 2023 19:38:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E2A10E0C5
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700509129; x=1732045129;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2B9N/PKBVb3iAXdr+hs84n9MTItnCpnTD30uv4kmBBg=;
 b=ZErxqiZPVMl+C+Q3RaZ8efdICrmhDsL27UN+Q8Cunuq+D80W76L2CLH1
 h/DnKmYYSrx4Nm3uXQ1O5Zo1yHUJs08zYJEoLO03lwnQ18ldBa5lKFyNc
 a+MUXsTwzL8XnYdtfsYc+048/LVwDiTl3wtNsBGj3GXZtXZG1oTCUBlxh
 EXYlLfO3df34ohPm2Smugx9RorEpzGwXb/ctmCYMsExvGhmsbwKFErkj7
 AcS8C+m0YoMZmWEwyPdmI6eOn0qvpwkSka1vb7YYdugBNt46cB9hW38UZ
 oWWXiAeUkEfBSabUJkfOmD98BCr/FMPKnGuX53YFBaO2YT4oYhvDuMOTE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456028887"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="456028887"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:38:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890026247"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="890026247"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:38:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:38:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:38:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:38:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWoC2wEMrBetj5g47plFl342hKcJ/S9tipkiHQKyPeC+2ACXMcnvSJEk1SMzivlwwMRNUgHfdUnTafQFfsMAazwhQYoJCPP5+a9f8/DVP/pa/0r+J9d3RGAgPfMv5jcNJwGsBqM0ayiOpASZny8zVrwRcOwAj4WbgmLga2ewgZc9+OmiykU3TrMcR4yIl/2F8NR2WQCl6+Lv1d01wGrXusPlx/FKC2xl7NiTg+nungy7vmuKWXVmPYmLoan11r3mGz+/cKFJGZSHyLoMrkmeSIHPnR52w7Ix9F8EaCY38oiAt0XSF7LRUXGEeGdXBdFmjAKTmqGtJ/TvbfErw8kZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp+9M1ozKiYqbk1TSNZXBy8cATpIacX9Bd7p8FBbSRw=;
 b=Hasm3uhUIhdDbpln6l5C9WCdU5/1cf7AkUqI5/x9KjnWf5tbhzgHUdWn6MEl4sPE9TzRPVW7ahF730fjm3098Xnv9Zj95tZvfEFGpmfnov42rCWST+ejz7tvO/k5DIqe5FpyTehkx/qvgRu8cNywOW5YxLJmNQMViZ3V2A3b+YjoZXUvYmwcDOLPa0fn+7ZeRzmBizcycwB1xH8y/w1h56VZ8JQEz7MEpqfwDcV+QBu4dIDFiOjdUyxevktY5LhfKhKvAA+1Dj0i8lC8UYu9sFX6g9Xu0hVdsiZM+vK4PklTv1//XO1unfBX9fgdV9CnVHIMANCXiBgUje/Losnzvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 19:38:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:38:33 +0000
Date: Mon, 20 Nov 2023 12:37:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Message-ID: <ZVtTC5E2dc9LrxOT@DUT025-TGLU.fm.intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
 <20231116194047.214330-2-matthew.brost@intel.com>
 <5071488434e6018bf1ca7deef03434cbf70d4291.camel@intel.com>
 <1dfb060aed8ee6e581601cd037d24fd4bb8a9b27.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dfb060aed8ee6e581601cd037d24fd4bb8a9b27.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b809c46-be7f-4b7e-258c-08dbea00484a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpVYH1HmiBszg15mtogmobkV3KX03+SySk72uLLhAQ3x/npqlZ0o3ki5rTko0UwtbLjp7SFLPvFx7Q9NpN8zyx2/UO6931KYnYcv+a6R6sRoRnHy4bEamtuod4cgff016GRy8US7Y8zM36Zfn5+DgRJ5+BbmWd9BeGxzx53apYs5Bs5/QOe4eKnLR3ZQgZHzRkjdpyqJsNxcza2w6W6xCiTHKll/mU9xC4TiPDNvhnM+ow+QYDJAIdYdUjC31aUvV343MtzoLx0ZslpZYA3TZ1T35AyFQCbXKiLQ3VmkEntIZQ4lypKj6pDkKSK6VxP00sCCoqB4TiOwwS1VjHP9NAICAgsWCvyd6/Ra11ls5+43v+8AtExr/GCQdXybyggF5w1D1P+jPsekgaCKXEXLW9zp962Tr1vc/HDUM+zu139w4r5H259jVGrCVCcg61eUY5GIoLPJvTm1F3lThyCyonPsQRTNLnSs/bJ4K58xRwsuPRKKp2huGaUjopvUSa9uRMxA61dAJgFlfj8bGP1hJsnn8UTuekxY4uLVlaExNhewOj1hLwA63POhjQjYJUhG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(4001150100001)(2906002)(44832011)(8936002)(4326008)(6862004)(8676002)(5660300002)(38100700002)(86362001)(41300700001)(6506007)(6486002)(478600001)(26005)(83380400001)(66574015)(82960400001)(6512007)(107886003)(6636002)(316002)(66476007)(66556008)(54906003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PvFm9FbHCawuuq+Vpeqg8TVolq1ghsTgBIbcA7cVNopjVZ84L/Qpg7pux/?=
 =?iso-8859-1?Q?jFdhBhrsi2ZKbNnakTo/XC5eg6Cp66i6U1aS8MYW2Ja5tLGxYcG29OoWGn?=
 =?iso-8859-1?Q?F5TPxl4QhOGqJRr+UEiqScrF7iDcwPhwKtq2/ywCkSF4P1yTTyMXQIY1xg?=
 =?iso-8859-1?Q?stcPmB1WMNOuvBoaLwDGMDyrO9ZGg/MVteJnc/dz/XqXnK8wrb+TrdVftj?=
 =?iso-8859-1?Q?SpVr4kmB3WEEYYQVl1OfjyE03w5wy64GlPOS8N3cUpDjH/V3UvIbQjia22?=
 =?iso-8859-1?Q?jA0Nsq2izaQyJ6hzQkXyS+4bfoaVXw0BVfs+mlTeOlJiEXH1qWTj0gGOgC?=
 =?iso-8859-1?Q?9LzUAJmSxS7u370q+EIVvfZGDLEnoQKrr9wLaxqIz0kAybNKGrnkvnJdVH?=
 =?iso-8859-1?Q?JoeZiqEwgphrxrGIXYJYiyRtXI44uw29zJvJo2yHzGpdTBRweRya4JbWVb?=
 =?iso-8859-1?Q?wC78M8AzZaSeoLTBLQTtI/fFzFJqfyjvZIj2YOsKicvEs7BMVDc3ikcClP?=
 =?iso-8859-1?Q?urCMm1q5qx2Ls579KrvNdEcfSB1F73JoboojQyEGn3AHPbjGtTkVNBafqi?=
 =?iso-8859-1?Q?mq6rRKIiWImeFrls8VQLZVPu12zaefpeA/nos9Qf8moLvH6ld4MJmX2gXD?=
 =?iso-8859-1?Q?9VjjvsqK3vqFDSobVhk/6Uo5Kz6y4AH0AXBE2pi9hj96PdLWn6DVqhntiK?=
 =?iso-8859-1?Q?IRV6rLLd/ist4LpOUA2xZK3R0HJ1AralzCVLaD0YG63hhz5L/QRF5NowP+?=
 =?iso-8859-1?Q?u/qdrnET3EgGGdtmIQWcdspTY3R5jy6DId2MZ5T6h6Ix5p1o7I2icmup9b?=
 =?iso-8859-1?Q?IX5oys8oddrq4gji1SaC457IRXNvXIdSHcYB5sPGKQCuPDqvIjQNXeWMpN?=
 =?iso-8859-1?Q?Suh4LyI9Mrow2hufGkJUNJX3dfwCsSxywcmvqLD/qkjOHMa2PMYJDlR7w6?=
 =?iso-8859-1?Q?rVXOrEU6SXEA8aY/R9rjfpUCmbuEdojXjZ4fRc55SLikOQhzBuuDE32xQW?=
 =?iso-8859-1?Q?ZkBXFbWb0Z9wB3ITjlSvfCwS8lT5lX3/QG/8T87C3LLM8VNMG8jJWYoirW?=
 =?iso-8859-1?Q?xSYjeIo5UA5zMfuk7WFqA28Z3nSjjl5ZjaWB29Js1JcOIrGkhR+tbb7Aht?=
 =?iso-8859-1?Q?s0db1nuGajVjiceLyaBydQg+FLXzGkxtw15mwY7sOsM05An6bV+VsoONj2?=
 =?iso-8859-1?Q?T5tswG/CpElPCZ8zkTnsOlYK1SFmFBxXsQ6V/T2lWLc2aEWw7PuPiaQPXm?=
 =?iso-8859-1?Q?cxnVYOH4TWhMVLiCWJKpbiFOCmwvft4Y9hID+mH58O8wPE+a3gPcMTbREE?=
 =?iso-8859-1?Q?YK0NIH4wMqtTSDSmE3Zb2XzbZ3viAEZrfBzCueNfcNlBiV2Tb7bAMlS0vA?=
 =?iso-8859-1?Q?fr0eP2bspEPB+3KdYFOffJJHeHXI1SVn17m+KE0JoTjfFqOMepJJUM8kVd?=
 =?iso-8859-1?Q?snFQ6I1qI/fB9CKo9rxomcdrdI7QHod8nNEB6C0CPjEm4UV30OAkIVIosK?=
 =?iso-8859-1?Q?zTdVFfdlObvzkORixB3L4+m5znMENs6pMT/fPwREYUHJtywc1if4rUP1xr?=
 =?iso-8859-1?Q?jBTrXFQFYJMSXd7HX9lXkTOh65YzUuex0eBD90LFIADj+KOwo+IJ5mHRZ9?=
 =?iso-8859-1?Q?+D6IibHR7wfATHGVS3ieQFiJULrRmZ4USAyfdC4UECzbv58FUDtToDHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b809c46-be7f-4b7e-258c-08dbea00484a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:38:33.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HacrcZDfwVNwgzrX/IIFF77obxVVimMTFirDfXU3fSjGwxToyhq3k2YlLVXVOTd+GlJhwkeE7gHkq3WD6OgYCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/5] drm/xe: Allow num_binds == 0 in VM bind
 IOCTL
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 04:11:40PM -0700, Zanoni, Paulo R wrote:
> On Thu, 2023-11-16 at 20:53 +0000, Souza, Jose wrote:
> > On Thu, 2023-11-16 at 11:40 -0800, Matthew Brost wrote:
> > > The idea being out-syncs can signal indicating all previous operations
> > > on the bind queue are complete. An example use case of this would be
> > > support for implementing vkQueueWaitForIdle easily.
> > 
> > s/vkQueueWaitForIdle/vkQueueWaitIdle
> > 
> > So this is just for the bind queue.
> > Not sure if it is useful, Mesa will eventually move to async vm bind and we will use a single TIMELINE_SYNCOBJ to track what bind operations are
> > completed.
> > Paulo do you see any use with sparse?
> 
> We don't have plans to submit stuff to the Kernel with num_binds=0, but
> we do need the Kernel to support the case where we're trying to bind
> something that's already bound (so there's nothing for the Kernel to
> do, but num_binds > 0).
>

This series fixes an issue with num_binds > 0 but nothing to bind too.
 
> And yes to track operations that are already complete it's usually
> better to just check the syncobj (timeline or not) of the last thing
> you submitted.
> 
> Currently, due to the xe.ko bugs, our vm_bind code is completely
> synchronous, but the plan is to move it to async like we're doing with
> TR-TT.
> 
> I'm not discarding the possibility that we may have to do something
> extra for vkQueueWaitIdle, especially after we make it async, but I
> don't think submitting num_binds=0 will be the right choice.
> 

I'd like leave this option in the kernel as it is pretty easy to
implement and matches the behavior for execs with num batches == 0.

Matt

> > 
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
> > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index d45f4f1d490f..cd8c2332a22e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >  	int i;
> > >  
> > >  	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > -	    XE_IOCTL_DBG(xe, !args->num_binds) ||
> > >  	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> > >  		return -EINVAL;
> > >  
> > > @@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  			goto put_exec_queue;
> > >  		}
> > >  
> > > -		if (XE_IOCTL_DBG(xe, async !=
> > > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > >  				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > >  			err = -EINVAL;
> > >  			goto put_exec_queue;
> > > @@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  	}
> > >  
> > >  	if (!args->exec_queue_id) {
> > > -		if (XE_IOCTL_DBG(xe, async !=
> > > +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > >  				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > >  			err = -EINVAL;
> > >  			goto put_vm;
> > > @@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  		}
> > >  	}
> > >  
> > > -	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > > -	if (!bos) {
> > > -		err = -ENOMEM;
> > > -		goto release_vm_lock;
> > > -	}
> > > +	if (args->num_binds) {
> > > +		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> > > +		if (!bos) {
> > > +			err = -ENOMEM;
> > > +			goto release_vm_lock;
> > > +		}
> > >  
> > > -	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > > -	if (!ops) {
> > > -		err = -ENOMEM;
> > > -		goto release_vm_lock;
> > > +		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> > > +		if (!ops) {
> > > +			err = -ENOMEM;
> > > +			goto release_vm_lock;
> > > +		}
> > >  	}
> > >  
> > >  	for (i = 0; i < args->num_binds; ++i) {
> > > @@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  			goto free_syncs;
> > >  	}
> > >  
> > > +	if (!args->num_binds) {
> > > +		err = -ENODATA;
> > > +		goto free_syncs;
> > > +	}
> > > +
> > >  	for (i = 0; i < args->num_binds; ++i) {
> > >  		u64 range = bind_ops[i].range;
> > >  		u64 addr = bind_ops[i].addr;
> > 
> 
