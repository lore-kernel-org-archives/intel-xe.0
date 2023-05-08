Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520CFC77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62AB10E08F;
	Mon,  8 May 2023 01:20:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91F10E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683508820; x=1715044820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CwF7yLIHgkpGxGqwYuAMm5+j2VExFr+IYjuBqEFs5g0=;
 b=I/UZkc/4NckQBdve6ycWAYGK4IkrxVb0pMZhsQXVUkepzGSAzd6zcIAj
 Pdv+01liNouiCgeiVr43a1donODEPiKJp660H8hfBBrOmTebnc7MNL7Su
 8ZirX39AWDfm2a+d73FrCD3JWLkLA96I7bTOLk0DDvW25ZOmmjM6SzTJe
 0VREORFeEDue3uzbTPHYNeMchExj6CYiGTBn4r2Ski2LD0WX7DPwcfr8q
 gnnOYR7wRudcuWqiyVuFOsz3gFAy7eGHed2iwznUyNpiYtOfCu4w6hHRu
 7mjLUAcCfLFXEww/lKs2hjb4cu6cGnbuSfmrufB2Iy20vIILBBp7G08e+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="349559818"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="349559818"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="698328694"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="698328694"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2023 18:20:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:20:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:20:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:20:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI7DEYdCJ80M6XXem+zfYWLPocWMU4gY9ZYTXJAXT4iQa5ZQ6eWH3y3ZG399NHteq6p9H8q/m79tYekp1IO3tDUKE/D40SbjqtlSGKoiYBJzRYs0HR40+0EJmeHgv+b3dEPggYc29lULJU71RvkOmOAtUZeHsHPsrgwQYvUGkY/Jq93VuPTt6SbFElbHqY7S4r5opp5gP5vqZQylIfmVhQCuQ0uKv+4ruF1tSmvq1cMdJ+dOUX5Nv65K/LVth3edpPstGvsk0SbI9WRtWaNFJF2yypQAyqVMZ0xaCwUjXGZJtO1eiW89bUskNCSVuM46QDq/zS/ctKM3cSiusxkYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRYsNigmX1PCd0fWo9YwyJNnlP29BB06BFceoD52Noo=;
 b=YylC0Z7doYnzyVhmA/9NhsRcvqDsVUx9enmA6+xClIyduEl2LS/lxzelUZIjE+DRF2AzKppCXtrn9p0KPJpomuAbTsyEzmxHOVsEiTLFu4DxagJ4dFyVREXx9srCpxwxVFjmFu1LxVRSnU3Oqpna10WVYNgNGpwEFNgWiJ8OumoDpIL3szG3/iLt5IETs9kIe89uK4mV6/OYAkVb1Eq6TnlJGLstzP8jSS8p7s8nE+hO3XQNJIblfGsOnB8O03oG+JuHJEbQtKz/M4qHvoiTNGB3TISCUdAJtYvbEgEWSnw19OFJFB1Xb9vo6b8fOBlg+dgorsooTOJN/uPK54pwBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:20:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:20:17 +0000
Date: Mon, 8 May 2023 01:19:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <ZFhONAGmO8X+qD1f@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-29-matthew.brost@intel.com>
 <ZFVcU5VPibAp/Umi@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFVcU5VPibAp/Umi@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: d671565b-b843-4601-fd11-08db4f62614e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzYHRhgguppmlai5Cmb91IPAM4g6UW7+W1DOLN+i3ctIcLgdhuLl3w22YATdrTb1lg/BmGNqq8sTEMpj6XZkFBkI1QAMG366Fj174SBsLjdF0uAw2zjqFKAikwOMeJog20SOBFLfVj580nHk60gpt99SYUJvnAVpTUWLbAkQOZ2FMKLOuaeLbiYYm09LEM1+UutR84cH+fpeaXdDNxmNCVSgzdc42yDA/rR+ztRIJVuUv0oZIoO6hc7dRLC2mpuwG3I5sK61s2UlL7+kmlPwM8R2HrCPYhfYyUTF6qOIGSCt1OekbYp9jPZO+9qWali1lhdSvOKbzYhn05lLPBeU/9Tbg6Qvv6x6x0tQddw2CAyWfNu0aCOGHHh+XC6cQ3yN3Mr350BR3EAQ4UdK/ZtI4NKSxFp6VdwxAgm7NNlejvijuFSOHMVfmw9/5A2e+VO7vZK6zAwiNMI6YjcdeaTdi+VvQwl1EtItaB+yQCOMapzGHMEpA8xpxW5ZzCxF5z3jZuFVoCeYMkQXzqHIw7ZyuTjqhNihqVBC6pvidXfxLrC3nIwfF4cx2wPoV5SiiEnN31hqXrwjebut+wty5mswkzLALFMDEKjdff9eGq+dYO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199021)(86362001)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(6486002)(478600001)(6666004)(8676002)(8936002)(5660300002)(2906002)(44832011)(41300700001)(82960400001)(38100700002)(186003)(6512007)(6506007)(26005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lQs9ypN9lytqHMjh8JbJnN0b5DsudJGCTxpR1FN0Wom0MCd8k0wk0GSiJhWO?=
 =?us-ascii?Q?OzcKLThmMi7ySqvnMX+FkS2AY1PVFnYAYrIevT0r/Oxp6e9UlT+OKJEufsy7?=
 =?us-ascii?Q?c7At6Rnzk2qaUWaCuU/SSWRRBAMutDoA+91jWD6j0JikYDvTuQSvZH5nTcui?=
 =?us-ascii?Q?TJRh+6+Fc5ctcqrrh/W184hWIXxSSx5wTCru7Mo2bwPVoVAGja55G5TDDeEo?=
 =?us-ascii?Q?D7uTn15LG5qbaooi1S6tHlhA39OJa5WV6wwRx7EAft0rGWx46fuiXl0uLyua?=
 =?us-ascii?Q?xnMYUEbIWs/HsLBkQAK0LGKHFYFuDPQ4ILFJLRHqaRtP+AdactR90xAC0iBQ?=
 =?us-ascii?Q?pswksmD5vKagq3xVW7kOfcWBFRD4N4T6fLTcXpeUk+MbJbxzB7JdJ/WSEwfY?=
 =?us-ascii?Q?vBOYaHbSiXuNCk7HzYFvUSNfsr3HK1orCVxRhTSDQ/Zxm734RqSmuoGJJTfj?=
 =?us-ascii?Q?5SJgmWNp9MzQbDuolQeQdw6mbg8Bc2CKbtMwQOx/W1RK5ftMPXEIREUmfMh2?=
 =?us-ascii?Q?vWt9CHXqdweOfS2obiQbtV+tEC620gpx2yKXg2H3tCSQDlMn94Rl4kJWrqHg?=
 =?us-ascii?Q?ZQhz7mB18DD1R8P10by+7QNPsctgMizDNGXuZPkga9/ojXxVNsJ4+2X5AtL7?=
 =?us-ascii?Q?SvTvjh4LPs4BMj9Z8S7Y1jlMWttoQVTFAksji8UXTsMhDlsjRA6IuQGj/amg?=
 =?us-ascii?Q?xXwdtSeUW8tE3+Kzas0vAv8RTGggWI8bOSDUJDf13ju1rdvU9ECb3yZa1dJQ?=
 =?us-ascii?Q?tMSw6lyNIKsH9vqNxn+J/px9D2N9z7ZhlW/5T6wJh3WIWIHFaBbtOBmuRSx9?=
 =?us-ascii?Q?Y7RO2m8U/lEOSaV2ZKG/YUEiJFqqEbAb5RJ9RPJo9Q6/+6NmPrINZiJYRlLW?=
 =?us-ascii?Q?nGxcWp6VoOyg9qKAn9W1gIzDnAhfuM8CtHzv+4iH1NSoq1ZkkUE09xMS/8Ua?=
 =?us-ascii?Q?aZwJijSxeIBUPTghUUbeLeZR9Pj0fsesd7SaeJbxPa8cYzfVN6QKE5bJ1FcN?=
 =?us-ascii?Q?L11PYr0Nj5tuIE0zCOpFgEAqbQNyL71u2YgNgoRI4GpOHeS809tGGqJQvs2i?=
 =?us-ascii?Q?xXkwi2OQX3HVbiCuYj2ZYm89HYzNg/iYWWSu6c7PuNSuXase/b3mL5+qz57d?=
 =?us-ascii?Q?YtXYj3u/yiqIDgmbvPJBuSl4HgKfz0DrcUDiNT7vCryIAjcioHoLwNa+0HEw?=
 =?us-ascii?Q?tues336JkWXu1Knftu8kUvF1bq8FOqspkN/c+TDU0htNQBddOrlQ1ow4y6U4?=
 =?us-ascii?Q?Ulyfl1Cq6s6RNM0XSl/44z0VpM+12osJYaUCy3YKs2k3patmZfgDSn2y+1B2?=
 =?us-ascii?Q?OU9AMzrRWUIeNS6vJfRuHHJru32DcLNlfDmoGd2gZhnNfVp5OdOJRle96Rs6?=
 =?us-ascii?Q?ILGuKC2CQcHKG/AZfXN5j+c60tyi7v4p3dC7Jhg0s6bm5Zx6IsRcW0glTLLm?=
 =?us-ascii?Q?geDd9wkjCFptNEItWr8Ln3OgbSAFR5gGItWwQgDCmcQWxGDju1JCiuouTys3?=
 =?us-ascii?Q?eNthG3VR0ijS+ai7wpzDAxGl/rXdHWtlmU+3jYE37tVrA1Va+XH08MItvAgO?=
 =?us-ascii?Q?DphKRARVgIaTAOG0MBRM55flKK3f4mT0rGa9HMTCSsi+kF04P7H11xfSsjhn?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d671565b-b843-4601-fd11-08db4f62614e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:20:16.5150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwB7JugsxCDsHCrw04kTU8Ij5QtBe8Ty9w6zoMk247oYlEu6g3PgB4yX3xIhX1Kc71WKi048c6dKZrT/xNXL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 28/31] drm/xe: Allow dma-fences as
 in-syncs for compute / faulting VM
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

On Fri, May 05, 2023 at 03:43:15PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:24PM -0700, Matthew Brost wrote:
> > This is allowed per the dma-fencing rules.
> 
> it would be good a word saying 'why' we are doing this.
> only because we can it doesn't mean we should...
> 

This is allowed and encouraged the dma-fencing rule. This along with
allowing compute VMs to export dma-fences on binds will result in a
simpler compute UMD.

Sound ok?

Matt
  
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 99f1ed87196d..1e4e4acb2c4a 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -105,6 +105,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  {
> >  	struct drm_xe_sync sync_in;
> >  	int err;
> > +	bool signal;
> >  
> >  	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
> >  		return -EFAULT;
> > @@ -113,9 +114,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
> >  		return -EINVAL;
> >  
> > +	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
> >  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
> >  	case DRM_XE_SYNC_SYNCOBJ:
> > -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> > +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
> >  			return -ENOTSUPP;
> >  
> >  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> > @@ -125,7 +127,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
> >  			return -ENOENT;
> >  
> > -		if (!(sync_in.flags & DRM_XE_SYNC_SIGNAL)) {
> > +		if (!signal) {
> >  			sync->fence = drm_syncobj_fence_get(sync->syncobj);
> >  			if (XE_IOCTL_ERR(xe, !sync->fence))
> >  				return -EINVAL;
> > @@ -133,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  		break;
> >  
> >  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> > -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> > +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
> >  			return -ENOTSUPP;
> >  
> >  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> > @@ -146,7 +148,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
> >  			return -ENOENT;
> >  
> > -		if (sync_in.flags & DRM_XE_SYNC_SIGNAL) {
> > +		if (signal) {
> >  			sync->chain_fence = dma_fence_chain_alloc();
> >  			if (!sync->chain_fence)
> >  				return -ENOMEM;
> > @@ -168,7 +170,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> >  		break;
> >  
> >  	case DRM_XE_SYNC_USER_FENCE:
> > -		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> > +		if (XE_IOCTL_ERR(xe, !signal))
> >  			return -ENOTSUPP;
> >  
> >  		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
> > -- 
> > 2.34.1
> > 
