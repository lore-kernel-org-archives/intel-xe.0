Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C46C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 20:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9CC10E22C;
	Mon, 26 Feb 2024 20:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9V9Qg6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11010E22C
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 20:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708978886; x=1740514886;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pDCmXUyEzMA0kB4P4+XRcpEd6qjxii1vKCGC+oKjYLg=;
 b=I9V9Qg6ReCh0MjTCcIK63qGVxhDoLUGKZtLfEdMzWLMbb4sTzUDP9KFs
 Ze55pKIflrTIwA1TY6fPp1OMsL1TQyzsROcVmNSN1E/QpxStP2VvbXJYq
 NIXqH4FHhiXcHChEMZl1PeVKpZXkIXWNri3/t0t5VPEv/SXhAE2NfU7/c
 O6gfRn8jb250ipfC5Trceyib4R7yz9jeVkeUR1q0q1Xhj5IcQAzmftOio
 0K2m08BOpVaZV2Ax2Dby/Tm5UQvNOf2X5mZ1Z5Pvp6bOYnmnadXE8YzWl
 Z6lfrREq5mFYiWDdWLO8N0ykXZVRAlQDKH8dALmnyyQdGRSZwXdcBqoKx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3454861"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3454861"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 12:21:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="7011294"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 12:21:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 12:21:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 12:21:22 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 12:21:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHVShXbpZtpwWPJr/gvGYAx2jo56O8qp6DdpblKxRdLWprGhM1nQm9S+e7UP8QiegC9uOC4dqQkS129rMh7Rpfnoiug0be+wja5+ZUYgs1Di3GVUXLF1Baag0RqGN5QjXlElNq0p6ycyNAFO97yPFjfLAk1cauc5H5gDdgDYLsv46pUXw6xecWKtvEQgc1WQILCE5qGVETzBfFuLGZ9CckWM4gkEpKWtKaVfap2OsGnncFE87gieUcBeCFMOIaCXUNN0OrWgT3o4S9xyHsaNmm9KhvXCs3Hv/4H0vCFli9l1DfqxUe80OtW3WqzKdLohp3mjEjevubuGheUmSSzVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW4Fgh7Vnxb6WZ5ewmZ9ETbz4sMNEHDl/gk16m19tpg=;
 b=U6y0Nb2iQHhaJnnvF6WgZCA7/V75ApkcctRvDnQUT7IaRCqOUjZS40HLlJvwf/9XeW2XHbSY0c2T5H49RgIFjZkMfumP3UTzZsL777Z6JaaVaFzA6o8RaGGezha2KTEkEvgvv2p1nujpTkeR1MkgnHNTQ1dWQ2f7MkHRgNA+osJXkdrp3Z+g8B64rL9wMVJDTUEtqs3A4zU48ins4PNIUwZoYwUVOz3+68FYdwj0ePoA4a2/te4R+NQKS/j9fO1aLrb169BbldXmU16fvzxVexrv0qOMFgv3J0QcjcuAq3M3kfmOP+EON0Epo9DH4JSX41JCg/WgqFoYs5bSwna+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 26 Feb
 2024 20:21:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 20:21:19 +0000
Date: Mon, 26 Feb 2024 20:20:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Handle timing out of signaled jobs gracefully
Message-ID: <Zdzyl1D9YR5C0v4e@DUT025-TGLU.fm.intel.com>
References: <20240223204659.40750-1-matthew.brost@intel.com>
 <07060f9c57583d71193b3e18d029ee8d6abffc6c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07060f9c57583d71193b3e18d029ee8d6abffc6c.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: eae7888c-b249-42a9-ea57-08dc37087dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBLzY9asu5X0CK+jQ8clG0mJL7NNLRhJFvUPj1PuCvFA8xTmgOhoByqowFfSa/55Jw6yOEfcOhkhBPenxsrssGtcwNI74J/awq8ac9es8lrVFPLnc2c9NppSH+5m5lo6DX5HAuR8auntJsE7bh0BoAnl20kxdVdXce/FquVbF+nA3gxVWbI2JbzefL4uAlSeI2hG7RWmiqysyCjLjFACcYRB6pKaIuz+evg854wZILfHuv3L7zP9QPEVjFL5YDBQYlsec5iItCIsEU17sFK7YMLf6Ae1UIwWDTIgHX1lMRWX5cBizN/LDra4xC4zd2j0Q5OxtFU9v4XceYqZ3tBxxIUTtMUYd80dnnzyotBHbDVQLb8MFElVYVRunRyhiT5LgkFW8xDQfOCte/P1FI4PDhIFp9vPaGTqMrMTzdrz89IOxJ4xJPd/x6oBBb1i2zBd6POpST63+yM6hSPXXKcZAIWokWx06E36iy8zvhOVkFN2sM6u7n/XYk2qTUgmp/nhq0hSb1Q/ek33NvkgUUHaR8UvMO9WtE92Lk4rE0hRAb962ixEJJCm7WSx8CzBgda61Z8cSyL5BJ4sHWmNn0O0c6CsfVudoQEgYPiumvZweaVPNTnxgPCxIZOEfp6jLEP7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?skA5QlV8xEuTErUdes1QCyDlrAt9b9QDXek4Ez29evcbNA97W91fG1srVw?=
 =?iso-8859-1?Q?aSk5zo+es33uTuWgAKKclDCAK8oRdVLQScbnnuy4m+sNLVxqg2krDHXBu4?=
 =?iso-8859-1?Q?gm2iHbkNQcU36CKPPXs1jRRpusuN2J/uVaPiMPCcIDAOpovtTTlrKYpoF5?=
 =?iso-8859-1?Q?tSizFV4LkNCc04y09RG200d7h6+PSSMUIVTbqAh3P8P4OVD+WSR0ZhhRDi?=
 =?iso-8859-1?Q?A/VE1Rcs2sgI9NzpMDwo3aATHniYquawtkue0tSOToZRjioRSTBR9Auhur?=
 =?iso-8859-1?Q?K2yg5Ws1D63wdg523TZS1JFkohOFRr4z7MHlUdeO5uWKmmaa3BUIb11M2e?=
 =?iso-8859-1?Q?2m+rEVqKxM7Q7hv8XiIwau2A3o7xGcWrGaui5Idjc/O/6OUA769si1Rsof?=
 =?iso-8859-1?Q?fONuYYzcbTKS12oYad3lef8RVr31qGeob8GodfXydcMCYFprO1f1BRIS8K?=
 =?iso-8859-1?Q?DKgiHVRSo4mH14mD/9UITJkMy5Zbb1u9ANIl+593sV2Kw3VbJ67gIC4meU?=
 =?iso-8859-1?Q?v9ZAm75EXkoDbMiJgCJiSLqxygTJjK83GhoEwd6keaquRUi7uO9tSMLEZt?=
 =?iso-8859-1?Q?KkzBDYMacMTQl1xngeHnmnZJYjGmKHEpbxwOg203jReDKbISvsRFQsNr3v?=
 =?iso-8859-1?Q?m0lzjVlzOR2OUa9C4NAV6EPEMpQalS7ytmiaI4wn36EAqK4wI/uvTBN8VV?=
 =?iso-8859-1?Q?GTrDI+kTBY0lSs++gnIbLxzW0y8aJ2UrB/wU+xake1W6JHhYekzk0g1QuO?=
 =?iso-8859-1?Q?hHLul/as1wOalykqvsmzNlpu3Ti4kqZEklbkOy9ouT2j1hHz8Hb6dglIBj?=
 =?iso-8859-1?Q?Epzqxr/kTEBnwtT6cYJY0Y2eCOmF71192hh/EluF8Qp+MTo1X2d0ikgeat?=
 =?iso-8859-1?Q?AMsoy5W4WmvatHQsak5mpVviR2AeBme5+75l5D1y9B0KQWDDqV5r7kuEzP?=
 =?iso-8859-1?Q?oYQuMgK3qoMDNX2+L4gPOxEKrAV96xA7OjFdRPAnu64deTnKSW65ibJwWV?=
 =?iso-8859-1?Q?3VOABjhqqWga60zSRhTtUBlfXSMG09+IW+5y/I8H3YmMvp0rX5ACyuu8sO?=
 =?iso-8859-1?Q?HP7fDk2U58rWWrZZvBqrBUqSOEeBcpgBTeQapFFcRGaV2lTIiYdWV1VuxX?=
 =?iso-8859-1?Q?eenj/0ovFBclngjQ017sO8g3QIKIuqLqnOtK0Gw1caUdoJlktSyBipejjL?=
 =?iso-8859-1?Q?lA6r8hpuiKLwqExVQDvNpleVfvyoSR9tvjwLOmy4jY4FM7hK0jTOcKeeym?=
 =?iso-8859-1?Q?AaxKWm/VFrlooKF/4fvBIxL/Fr//OgoaMTnaYpSvZG+2V0VObZP9NE01Nk?=
 =?iso-8859-1?Q?L0iynj+Iic/EtuzO9Agg8ghmgncVQmQxMaeHIKBEfT71h8zfxwzwfRixVQ?=
 =?iso-8859-1?Q?ri4Oz3uSoBxS263Pcj0YAuEi2UBE222XNn6+iR41e8KjEJRnzGa837RMbo?=
 =?iso-8859-1?Q?A3ZQme3MEzW+8Z5C6ZLGBEF3ojToWRWYzmlgfrT4swRD9T7iwZgo1mQVxv?=
 =?iso-8859-1?Q?1KLdl/zdwcVhtjF9Cj7pm+M2ITMmAT5tyvZ0GfrwJAA/L+tB1bXODsn0Ty?=
 =?iso-8859-1?Q?8OXqZ/SzsM8KkKa7mgamUcHiJlhVnE9gQUtJCyfr9PaYdglge3VGm+abI0?=
 =?iso-8859-1?Q?LxOQvS82H3jBC5Gp/Xw0FcvMonvloVY0zwOvqc/64NN4oUgyP1mVYGcg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eae7888c-b249-42a9-ea57-08dc37087dbf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 20:21:19.0023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnMU/gKpl+e/W03dFbQZdIAiwjl3R4sJwZECsA/I96pxkv4zdxQCzNHlINnFJRpy4bTtWCPApTo+bdlSnlHggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

On Mon, Feb 26, 2024 at 10:26:02AM +0100, Thomas Hellström wrote:
> Hi,
> 
> On Fri, 2024-02-23 at 12:46 -0800, Matthew Brost wrote:
> > Timing out of signaled jobs can happen during regular operations
> > (e.g.
> > an exec queue closed immediately after last fence signaled). The TDR
> > can
> > pass the worker which free jobs. Rather than running through the TDR
> > if
> > signaled job is found, simply free it without any debug messages.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Reported-by: José Roberto de Souza <jose.souza@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1271
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 32 ++++++++++++++++++----------
> > --
> >  1 file changed, 19 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index ff77bc8da1b2..29748e40555f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -929,20 +929,26 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> >  	int err = -ETIME;
> >  	int i = 0;
> >  
> > -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > >flags)) {
> > -		drm_notice(&xe->drm, "Timedout job: seqno=%u,
> > guc_id=%d, flags=0x%lx",
> > -			   xe_sched_job_seqno(job), q->guc->id, q-
> > >flags);
> > -		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -			   "Kernel-submitted job timed out\n");
> > -		xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> > !exec_queue_killed(q),
> > -			   "VM job timed out on non-killed
> > execqueue\n");
> > -
> > -		simple_error_capture(q);
> > -		xe_devcoredump(job);
> > -	} else {
> > -		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u,
> > guc_id=%d, flags=0x%lx",
> > -			 xe_sched_job_seqno(job), q->guc->id, q-
> > >flags);
> > +	/*
> > +	 * TDR has fired before free job worker. Common if exec
> > queue
> > +	 * immediately closed after last fence signaled.
> > +	 */
> > +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence-
> > >flags)) {
> Perhaps use dma_fence_is_signaled() to double-check?
> 

The reason dma_fence_is_signaled is not used here is because
dma_fence_is_signaled() can signal the hw fence. By design the only
place in the KMD hw fences should be signaled is in
xe_hw_fence.c:hw_fence_irq_run_cb. If I recall correctly, this
simplifies a bunch of things / makes the code less racey. It might be ok
to signal a hw fence here but I'd rather to stick to the current design
of hw fences only signaling in exactly 1 place.

Hope that makes sense.

Matt

> Either way 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> > +		guc_exec_queue_free_job(drm_job);
> > +
> > +		return DRM_GPU_SCHED_STAT_NOMINAL;
> >  	}
> > +
> > +	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d,
> > flags=0x%lx",
> > +		   xe_sched_job_seqno(job), q->guc->id, q->flags);
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> > !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> > +
> > +	simple_error_capture(q);
> > +	xe_devcoredump(job);
> > +
> >  	trace_xe_sched_job_timedout(job);
> >  
> >  	/* Kill the run_job entry point */
> 
