Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343EFC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6110E425;
	Fri, 19 Apr 2024 19:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agzyo7Au";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7910E425
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713556396; x=1745092396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TC8gUq9MNz5fL/vxjCcKFwaXqALVGLmaDJmJRj1vuQg=;
 b=agzyo7AuKDTPww+LG1iUjMY/Zx88mi9VrbBw4ykf+o8mvQu/WgxKSllC
 NswLdfYtq6ojhPjO3NlVAj4l1uMACVqyPSHT0oeJUHncTGkZMn9Iitt42
 lsuoWY+CqrVw11yY75WXcKlmopLvomStAVa9Bf+c6FxyoX3zfce9yvoEg
 obXtTQoppH2fv18qw3YeH5w8BWZkoCy40W/pwSJ6HFschksOvkhZ46OrK
 mNnS/x2BinoMC5I4JNYT8/1vp0azjOHQMZMOvzWnDuNbMp0b7r006ugp0
 +tfPbjq1frls5Je3Ep8GF5+QQ9T7nNK5d+aTAY1CsSu/2DDVdrQzYAU9u A==;
X-CSE-ConnectionGUID: BLz2aOgqRR6WRN1QtcYzIQ==
X-CSE-MsgGUID: oRM5hsv/QrmiaWcPI+g1bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9039044"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9039044"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 12:53:15 -0700
X-CSE-ConnectionGUID: +vSL3q2pToGQP/YEYfGXMA==
X-CSE-MsgGUID: wndsgH4jSk2EUpiNKSfm6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28247766"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 12:53:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:53:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 12:53:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 12:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajAi2T1cJlZiWWIaRmmIUK8HjLVh6cWogDgomtvS0E8CKnEjTQtCd0HNIhUlrwDu6MXzJ718rFhYe9PbTgJ1i0WopRQiLnClESKsfRP6jlejtVHLUCtMa7a5Gv53RU0ini6+LzK414Znx+bgWaKDRReyvTfy4tX7UG23ebPTZJ4npgQQPcTsDOLdK2Qf/XSVTs8kNti89L0X/m4D5HO1rpF107IK6xJQgKu5wHMqh24BRWojWb1z4h+b/AWThoJ5ByLRGK/hkiFB5Dav7yPMeIP3ajmmhwRTBRZOlI6mYiCEImxZPynHvH/664Tp6MqvsCTNV89Tf5DLnFffSXiV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI/kO1F3H/EcT4OYKAa9SW048nh9agLTiRoEnyooKb0=;
 b=Gg3FFw56F01KYkDu3dKTJ5q0tawLaprrcXj2ZBZGr3Unt0pDoYe/C+QniWlUg0h1N4obOrDibKqFI4gu2vYDtzKtp8I3XIC7inl+b5U7XtmSJwNhMkKMM8Rzh7i1jiBYu058HxmnHOTj7lAA0Rcm6RS0yYR3SWcv9oX8b9dPGLW6zvdnyXb72ZETjUJrntQ323CZhLca2lHgVEm6HEC2uCPOk9GTDtfgI8THr01lQAwISH3Qg4lHJ7Tp4pxWNVMmFpD6bw4zbyVbgagZ58LG38JT8r1uAQyd2H7GsNodRxduEq2U+eroEAUeY7u7Ie2QcfBTU4uhWMtuP8x0wAnz3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Fri, 19 Apr
 2024 19:53:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 19:53:11 +0000
Date: Fri, 19 Apr 2024 19:52:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/13] drm/xe: Move migrate to prefetch to
 op_lock_and_prep function
Message-ID: <ZiLLl1GhRKmVsHrE@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-4-matthew.brost@intel.com>
 <SA1PR11MB699182390BCE532BD3E5939A920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699182390BCE532BD3E5939A920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:a03:80::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a8f8c8-82ba-40f6-946f-08dc60aa580b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wh5rzf5eDmMROhdevfJ8L5RsdWmXc0MBVDxa+M3a/dDlCBdA9J01ZWS9u/+d?=
 =?us-ascii?Q?W8aeBQh/RFAZQfJKmIjT/pN+TOdyRlH+JO4d7/ePh9ohHjD4TdJgG0M488zq?=
 =?us-ascii?Q?1MA9u7CvBedko9qNRWJ8WD4xD4erpnoQpJD96PsnljZKNqWSLRHpQsjgoLQc?=
 =?us-ascii?Q?9t9jmYowgDytOWwZ8A/fxFcmcHhzFPhFC8si2yzIQzYylqK//DrPTeqQKrTj?=
 =?us-ascii?Q?rfKKo0Eaw8WW8LIvsOYxtjPQDY5rUJLKhkT5Tc/bd59G26uumnp/sBv1kUd1?=
 =?us-ascii?Q?7UQJ8OfJihicBykD1Ctw68nRyYhkJBnSHEk3i3YW3pF0dvkPVcJooWuGeA78?=
 =?us-ascii?Q?waYgpa9GG7rB44MVrSs/vzpPZNAMxYSOxSskq9O7FQjxtvbPRjCrUMIVr6rD?=
 =?us-ascii?Q?FchqSDx994bPTXwDOIRagAJhCFnLhjX3xHM89ZW3/BT0GWeXNDgyELegv2AH?=
 =?us-ascii?Q?Xf8SPS33iRNLCj7Z0MrWX1ioI8EDsO7D451NujefjwrWChsDftIMO4D6U3K+?=
 =?us-ascii?Q?5bc1DM4Yv9/ogPMLQz53tBXCbo6gGrCh4MMdN+ZLSrNkOHSOMnA1Lswk/F+e?=
 =?us-ascii?Q?MESrw4HMTw8iM0F9mUJqXILxOYF8ZpUcRSvfRu9IOdGuFPuPHwG6zUJZKfYz?=
 =?us-ascii?Q?TQT3c/Qa1KbBUZko8q33SbPVjkb50l6BkCKw4APQLfZaXPF0PhX5r+nKnugT?=
 =?us-ascii?Q?kLhOZEPqddaWz20eZiE3aC26qVE7meXaT+/bIombqAM8xsJBMm8PJUil1EgX?=
 =?us-ascii?Q?ehkFXqa5Z025fO+QhO3aQs7EXKLjxiYUT2CwyOd6LmPs8Ss+dasC5JIVkLTW?=
 =?us-ascii?Q?4mlRJuseG8JYmyTeJn0LbE7OFHOeesu9fEhLXfMJz2cvMFCkduhDKi9dRtAb?=
 =?us-ascii?Q?fern6i+kTDnFryFwW2QtILlfd4vPnR/rJGDlytCMn9AISuzKI1OErXlSfPTK?=
 =?us-ascii?Q?a3WASFFbd7KXgR2aXUBiGPEixkGK2E+PCaiIm58AcUiffsnbKKV8WPyjzYb3?=
 =?us-ascii?Q?b48FI30oEY+MUnXRuo8TgP7KEZ5aExGZgHLpNFQS2orlHWdhXsDcXUrhXb2o?=
 =?us-ascii?Q?5ylpyXo26N4G48dJjv7oStowYRDGpjy/J0Gqeo1vSeLn4MQckLHgxOed6/lz?=
 =?us-ascii?Q?S3AsWGNyEpW4QwblMMBaWDBSMrKNbPUdFL707poL57GKSFady2N0jCRwVfk3?=
 =?us-ascii?Q?mpDDob8vsAqpJiUtBAk9G7WZEUZ91J5l2066Ew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UWQ4Dx7coOS/Q6ZaA8+7YDNkZXjTs8Zc0MXCeGzxcHyK/GDu63H1Q/6ca1I1?=
 =?us-ascii?Q?EuNqUGnbJLMYdjNbFSt8taaxkl5kt4PkGELcvin7DXzIvZj5IBxsrGhIyRd2?=
 =?us-ascii?Q?yxEidupHTq7yNXxTgIaAl0xOIfODVi8tXpZGGuthyWmHOqGgL7xE1Q8+1ZbY?=
 =?us-ascii?Q?0kzbuPJCzcuvQNej5xyMqXU9XMdndguFdNlsTRGW18gUUfq0wz5Y6ilIK4oW?=
 =?us-ascii?Q?nQvBVFYWQ4jxPcYUZAX0h2GK8KJT98ie05k5FbuiX+aG85Miu5nelW7zPvHm?=
 =?us-ascii?Q?mCJWE0i8CetZoOrsBwDm4nTBvopZ8VIszg6KEi1XpSc//+nklNYirZ3ihTPC?=
 =?us-ascii?Q?qEAtAUAOEY4vVGIfTjS0JnuXZe8q/8tbWI1jsreEQVUF8iIfHIogj5TUb9WM?=
 =?us-ascii?Q?3QHQGMPUYShrmg3vwBsxFeN2gsIvLvfSkk3yFE3XwH8ee0Ur0058DKgeC2nK?=
 =?us-ascii?Q?mEMUWCwGtmTo/zvww+mp27ipww2Verk98VXL4rl4fAX8NhR0BOswcxpHEkzJ?=
 =?us-ascii?Q?rp9pWI2FbTmozefMrGzIwFF0rTKGQ74Ii/h7NlHchbFUNuIKN9rpomLWGNoK?=
 =?us-ascii?Q?pecg1P3tl8RuxHnqMnLk1xGMLq7VGVVQ0kaq76GuL5ygqj+CnSu5pAMt3ctS?=
 =?us-ascii?Q?uYj+Bf5xdsgYfZRYS8saYXzqx/gYebGu7o+6op0Mmh948yJ7KHwhx6otcAeM?=
 =?us-ascii?Q?UGcX8Lt2DNHJM/tflsc4BhUy5HqT5xdWf8Dtn29piSgeQFa/Wo0PJn10bkcJ?=
 =?us-ascii?Q?PAGD/dg3nESP6potjuAl0NZXVnmIVbxQPY6mElDEenoJ/4NJjYcKisrIK1ua?=
 =?us-ascii?Q?6qvb84LRqpMH/X7BC89nmStiy+P03gOnMfjgZK39WP6mx2rqC3uTcg6yp1nb?=
 =?us-ascii?Q?AHf1LZ65MeOzgRValKzSB2/sXK2joCUHuwcPAoy1NOISQCWc++/h/PdIuH80?=
 =?us-ascii?Q?EMLtVrQ/0L/jLV12xukQphIGxmLammFicsfVte2nW+TkDYHNpPG5fN/F5GzG?=
 =?us-ascii?Q?rDPvGm2SZc9rfZFz3k/YK3bDHSBWKTT1fDVy4/7qyZfPiT3OfVXcYcF7r7YN?=
 =?us-ascii?Q?t1uEenzwDodoZ1NvpdHG/sTn9pOCHGStwOn03CqLgjYnWHB39gmtWdqRgJ5J?=
 =?us-ascii?Q?oDZS1vf4N7Q/hwPvFL1WfWP6UDjV8BhuC1CjKnnHk2clcXT+F/j1jdhVeADz?=
 =?us-ascii?Q?OPc1lnFg4DKyjC2YZwjY7FaABEtuxW2CxqyMtdynjco5r2McHvlTjWnIcVlA?=
 =?us-ascii?Q?ugQueyZJwm3NASLGpplb968UXbFEECexIOyTOFGKA/lu4MQv3ABWXXqE7mqG?=
 =?us-ascii?Q?KZMwhXCd8qJgilaD1sJe9LZgptkPDzzALNIxzvyZIcfWp1ROa1hgNbyhjC1S?=
 =?us-ascii?Q?8KRyaDM2IdkAnH7IbALua0FWqJkONyeHBORpczcTeWkhjBIvcxf3HhhlxU76?=
 =?us-ascii?Q?NdfGvibr1BNw70rQs9WYPvYwWa6yhkUQDA7AH67SMmWP9ZwIYOYDhM+CeDIO?=
 =?us-ascii?Q?isgA6Mi3ydSOnRWR8i8QtGPEY88bfa9IhYBVSFaIAGcl3+c3qCyHo+IvC+s0?=
 =?us-ascii?Q?oSw+qmam42N+LrXCujGOVgFqAQVveeh57sD0q7nIkWgmFMtMYn1YV8RQbroQ?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a8f8c8-82ba-40f6-946f-08dc60aa580b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 19:53:11.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz6S2UZXDGSyZB5/LEay5sn6tvw8jojY8XUFOVz6jyNS57Cv+aGJLEVslmRM+Mh7HKsspZ6y+GU4SDI80Y2qjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6682
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

On Thu, Apr 18, 2024 at 01:27:13PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: [PATCH 03/13] drm/xe: Move migrate to prefetch to
> > op_lock_and_prep function
> > 
> > All non-binding operations in VM bind IOCTL should be in the lock and
> > prepare step rather than the execution step. Move prefetch to conform to
> > this pattern.
> > 
> > v2:
> >  - Rebase
> >  - New function names (Oak)
> >  - Update stale comment (Oak)
> > 
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 84c6b10b4b78..2c0521573154 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2039,20 +2039,10 @@ static const u32 region_to_mem_type[] = {
> > 
> >  static struct dma_fence *
> >  xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > -	       struct xe_exec_queue *q, u32 region,
> > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > -	       bool first_op, bool last_op)
> > +	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > +	       u32 num_syncs, bool first_op, bool last_op)
> 
> 
> I am wondering, do you still need this function? The original prefetch function is migration + vm_bind. Now you moved the migration to lock_and_prepare step, only vm bind left...
> 
> Even if you keep this function, we should change the name... it is not a prefetch anymore...
> 

I'd rather leave as is for the following reasons:

1. The code is slightly different and skip the bind under certain conditions
2. It still implements the prefetch op so name applies
3. This is just a staging patch and this function gets deleted once a
version of [1] is merged, I'd rather not squabble / nit pick code that
is temporary. The goal to not regress behavior while making progress
towards [1].

Matt

[1] https://patchwork.freedesktop.org/patch/582024/?series=125608&rev=5

> Oak
> 
> >  {
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> > -	int err;
> > -
> > -	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
> > -
> > -	if (!xe_vma_has_no_bo(vma)) {
> > -		err = xe_bo_migrate(xe_vma_bo(vma),
> > region_to_mem_type[region]);
> > -		if (err)
> > -			return ERR_PTR(err);
> > -	}
> > 
> >  	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated))
> > {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> > @@ -2592,8 +2582,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  				     op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		fence = xe_vm_prefetch(vm, vma, op->q, op-
> > >prefetch.region,
> > -				       op->syncs, op->num_syncs,
> > +		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op-
> > >num_syncs,
> >  				       op->flags & XE_VMA_OP_FIRST,
> >  				       op->flags & XE_VMA_OP_LAST);
> >  		break;
> > @@ -2823,9 +2812,20 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >  					    false);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > +	{
> > +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +		u32 region = op->prefetch.region;
> > +
> > +		xe_assert(vm->xe, region <=
> > ARRAY_SIZE(region_to_mem_type));
> > +
> >  		err = vma_lock_and_validate(exec,
> > -					    gpuva_to_vma(op-
> > >base.prefetch.va), true);
> > +					    gpuva_to_vma(op-
> > >base.prefetch.va),
> > +					    false);
> > +		if (!err && !xe_vma_has_no_bo(vma))
> > +			err = xe_bo_migrate(xe_vma_bo(vma),
> > +					    region_to_mem_type[region]);
> >  		break;
> > +	}
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > --
> > 2.34.1
> 
