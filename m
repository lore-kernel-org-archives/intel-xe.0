Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB7C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 15:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6E10F9A6;
	Mon, 18 Mar 2024 15:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFaz6pcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B159110F9B4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710775198; x=1742311198;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OHEt/SOowwDlFi4KPky8pGLNsp2uwLH9zmilAmvyARI=;
 b=cFaz6pcG2/OFHl2u5uXHBlHkRUZISqZfWuUApW+kLntMdjnQ/kIGCNKM
 C7vRx8hZ9GcTRn7BUMrjmgZgYZt4+SpdijHnXLwxQh5A40zbgLjrAO0Vx
 UcowXf61dWP+3GVPyOL2DO7SrT9OyJSomBFPXJgeLC/t8R53MjvXeirQg
 P0M63dGBhwqPnNFT5qsz7p3gC4OO4/CB1DTwhqaK6nctwMoNG6SNzTKHh
 uDevYGIBuJRhsXfDMm7NoOwq/dNelikTtLYaOOE5uF91UOBnR0pfG9k5d
 x9W3IkHXuxMEkCEi8arhVUQ6MsGgFwRaRSw2sEtUT+FXmQl1OM5tM0tmx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="8540363"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="8540363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18173081"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 08:19:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 08:19:56 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 08:19:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 08:19:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 08:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJWhaB1kSCKMBz8kLxQoEk2xbeu8A+2vuEjcRv4vZJj/wjnE6kq/+3R84rGWNwXEm+BRl33NcudElV/xfinROobIrhVemT7PKg+GoEl1N01YNdNVx0w3XRnRMZ5rHfI+CTQv3mYwFwugkiPInADXwOsTdrZxdnfD4nyM6plGTOPiocpglICyiTUPMGix41GXKyA6DzdvblKOoDSfDMVOrHv6eHLJEQCelRxPkBOFMgdOEC+hnI5okoYIov+uf83VO6ZMdgy6Iz7O90S1Ii8JLttRjBFWfHI0FFW2STFZgf9L8Pod5Ks9E2h89uH8JxC54oc7wDJmu23+nsUb3o2Cuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIJDo1YxXEkDkxUQen8Cf9ZXg0qT7Capc1W8PewtiBE=;
 b=MgLnqw28i+3X6eDlFHnhGTlKElmbQlaH5WiDNqpZZdoogRmPsOGsyeMVMa+Wy5UjtTYx10grDP3X6nOgeVGw3a2dKSYuIWQHxCztBRO7iQYyCnnUDOAX0eziFaRK2Q+ma2bGTFnrusJ7bherii74DdNInxemYRHIe9NwzKX3Ir/1h/aOLrT8D4N3MIjstmJV8B/quEIOoIZJEhoy2SNwjWIw2+NSnpo3cmX7Az/EZtopuTupcCReKTV2j98WzHIYO0TMJyeF6FHZmA6mnr9MHm9uicixwJTztWERjF2V+CJF92PJyvKhPM+NCglayPR3ZhKjBns5X0PKjSOrDsTSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6521.namprd11.prod.outlook.com (2603:10b6:510:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 15:19:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 15:19:54 +0000
Date: Mon, 18 Mar 2024 15:18:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Message-ID: <ZfhbLett3NP2x2F6@DUT025-TGLU.fm.intel.com>
References: <20240318135000.13032-1-nirmoy.das@intel.com>
 <20240318135000.13032-2-nirmoy.das@intel.com>
 <ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com>
 <6bec64bb-7ec0-4945-b3ff-411c739cbab5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bec64bb-7ec0-4945-b3ff-411c739cbab5@intel.com>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dada632-0d7b-4367-2b86-08dc475edd48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9w26xU3PItxwnQl8l5m3PuUuZEsJt1bALyTuLzeKmKu0mq19Fzor70E4zt+M9egIqfoavzCkrhTbloWM0X7Mx7NUAUZAHItVoE/RHX5hNbQ49D4q8koEB/RWSzqxYAXSBnmiU/etbasBM1kwb4ZzpfCb3BSywE9NinTayZr1k9T/0cZW9tUtMGkZvPGwNEwhwbZ9F9twTHZLH89YrP4PhIEjiXeeYbD96H5UVrY/7Avy8EDkkbAPPccbqSOFvYy08vG4v0KuT3vyng8sAbP58DKFA64Ab34HSSIOyYW3JeZRBJYtQYkvvTRcUUrEFthcsfYE098BSUXDkunuHAkF9gqAU2+zl42EEU3ZjSa3cPCWjlLkIObi9dBpZovkbN/wBXWXMhoDNY8bh2USq4VBpYvMWky9FhPeICZ7osIvm5Frmn4cvvYetjT7uzRyfDTPW3oeAw1OkUuD0XNDbhLdafbIqPjHXLqXTeOYDg64bF7gh2GpPJK4a1vdAGp6+v9bp75A+983kFsYGgWd7uxq+peTcOb+y9q7mRJir8SHeWnbumYEGF2miQKefHpAQ882VTUQZmOlsCWlieAWZBLX1zWNshYyxTUWSba8JGykLAwmPRd+TtOsaw84+U1+RTdF/TimWkdrVMK/EU9hEMcHnnGraDRGkLZ0TsUrhDTwQag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ue70jpRVKbl9AV0QVVp5qVFCOFOIktzMDqlaUg65XeQG2Ujob7sQ3VQqgK?=
 =?iso-8859-1?Q?rE71J1op/VUW8EsEwsfv6cgqt+bAdL4DcwbzVKIQnfXMX/K6bRiSnAZOZK?=
 =?iso-8859-1?Q?kk8kayGGBZI3g7uAQXDfBnftVvJCStKANvTUjBXoED0sMgO2+HON0LwIze?=
 =?iso-8859-1?Q?TB9O86j+xbC1vU3tjQeJo5W0kHTfpCCBNz0ti5R1MDILVzUzdgEZhgQjgx?=
 =?iso-8859-1?Q?9J8+PPLyxSDdWVrVNXIvghLJphCUpsBkhBw6SHv6ZnbvKsDQpsqYFmwZRJ?=
 =?iso-8859-1?Q?vN8/U0DwrWEStLDfzdVnS88P5dRNHVsQVbBUKTncmy2IBkRjkar3k7nQA9?=
 =?iso-8859-1?Q?DipsN68ih5/q37k05yBPiyOXXIzyyVMPqOgrYbcfuh4moz9VUgyBmHxRk4?=
 =?iso-8859-1?Q?VWfcgWA9wl41341cUBOtiwxQcII1UzA7pGxRLZC6/gM2g9hjHP0LQDCuJl?=
 =?iso-8859-1?Q?9+UZ7TyFXEEbZHeMGyVPKEkPEx0r+DClaLt6hYK9a86a/seyAUHZd13hv6?=
 =?iso-8859-1?Q?rzuwXMOPOf5oLcNVrZJrEWO4FkjoD/GJlxBvcdjZ76bhCdWcXFEb+QyW1Y?=
 =?iso-8859-1?Q?Ia/XnRGuNA6eA0RZkpBpW76STlJIYRQjKGWv4SFCM8d9jPY1rwMwkuPuqi?=
 =?iso-8859-1?Q?mXt4y02842i4Ls7lZUQeSEVOpjtQAgVfoil1fD9LhfHE3Njf84c+9ukyjZ?=
 =?iso-8859-1?Q?wX1VUH0gXiiTmo4m+mipdevhcOiNh+atiyhTvN3kZfN+0y/jfex0LTjDib?=
 =?iso-8859-1?Q?Ry0S4ZRdSMV9v/F7/U/W2d8WYl9ze+AoKr4q7hpg6kriyyhwtlQSGmlfQk?=
 =?iso-8859-1?Q?2jFomJhFVpWNLw/MRG4JBAumCdOu6qygkzt/Tm+lfKdDSsMgnkTy6RhvCH?=
 =?iso-8859-1?Q?nlqYDrfPybxY3uPblWzsSeipm8mkaOA9gXQSXB912S3noygQnsWzZpkzF+?=
 =?iso-8859-1?Q?E62W9lMG6Ql8UTxr9mQp/AT3J9e/AatdN6QMWIkigjZkjcLS2l9ZDz9MX/?=
 =?iso-8859-1?Q?TJwSbCEZgz7qJ8Vxk+BqrFsozFUrcLD/ty0ixqD6C/K8+jQcx9UA9DgnjO?=
 =?iso-8859-1?Q?E8ogRgkv/nPGa4i/x1lPbopQVElDwjNAgflBnNwUK+vkq8wBFkuJ5qP++m?=
 =?iso-8859-1?Q?1JLTx4jUdB6sxaSuit2T0zDHHZM1Y2YeWDtSfIXvbkbinV+ttomWcIxxO+?=
 =?iso-8859-1?Q?m8KvITWz5v7KBnZunIfjNaiw3bjACl3BWXnkthZaxFId6XZTQ27OjJVPkx?=
 =?iso-8859-1?Q?BQf6GFQcPl/0TuqOLEViacXgkOonOBVNRIWlA2DQufSZAXEogF67JxskoE?=
 =?iso-8859-1?Q?+tcsheusNfJLUBSxzYolqQOg06po3v1edPPxV7aDTYBD7xOcgRzdd+ZXo9?=
 =?iso-8859-1?Q?hjEAeOV83OS+3W76wpU+Z/91aisF9MB9DHwvY3tI/aCTZvKIopRyocJFUY?=
 =?iso-8859-1?Q?vRMlfFWdvYXsxPJhiK+TqAPKMojLSXgfkOSac7v/ExrhrFRZXCMY79aF9o?=
 =?iso-8859-1?Q?f9ffPflKKWiGWivnGkILA2XGig5yRt+4CYjeav7pcqEcHkHX5+qeugN9TQ?=
 =?iso-8859-1?Q?Aog2x4BRS3sqEdayKE7YMLchFdKhhH7QG15g6KBRQH6GoZbv/GIG6MYgrt?=
 =?iso-8859-1?Q?K1VBy0IEYAR6GJW94Gx3IZdYQqCYIecUQjoQwlLMxw4KBgHTf8ccfqng?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dada632-0d7b-4367-2b86-08dc475edd48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 15:19:54.6354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VH0EZlmciZoLufXFrC5/7mySm/CouCIyDJzL4cGjnvX5G+UOo9rxiBf6s185zY8v1fDB2GYh0Kl50+QzrIoNvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6521
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 18, 2024 at 03:27:24PM +0100, Nirmoy Das wrote:
> Hi Matt,
> 
> On 3/18/2024 3:21 PM, Matthew Brost wrote:
> > On Mon, Mar 18, 2024 at 02:50:00PM +0100, Nirmoy Das wrote:
> > > Add a warn for NULL job when sync->type is
> > > DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
> > > error and should never happen so warn and let the kernel crash
> > > if that ever happens.
> > > 
> > > Cc: Matthew Auld<matthew.auld@intel.com>
> > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_sync.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > > index 02c9577fe418..2b45950aa0af 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
> > >   			dma_fence_put(fence);
> > >   		}
> > >   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
> > > +		XE_WARN_ON(job);
> > For a warn on you this inverted - a WARN_ON(true) will pop.
> Thanks,  that was stupid of me. I meant to do "WARN_ON(!job)"
> 
> > 
> > But I think we should actually use an xe_assert here which has this
> > opposite behavior - pops on xe_assert(xe, false).
> > 
> > So the I think it should be:
> > 
> > xe_assert(xe, job);
> 
> xe_assert needed a xe device struct which I can't find a better way to
> retrieve than to pass it on as new argument
> 

Ah, yes I suppose job_to_xe requires a valid job...

> I think that is bit too much change for it. I will resend with
> WARN_ON(!job).
>

That works.

Matt

> 
> Regards,
> 
> Nirmoy
> 
> > 
> > Matt
> > 
> > >   		job->user_fence.used = true;
> > >   		job->user_fence.addr = sync->addr;
> > >   		job->user_fence.value = sync->timeline_value;
> > > -- 
> > > 2.42.0
> > > 
