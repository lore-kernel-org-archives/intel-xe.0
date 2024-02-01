Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C5EC48286
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859B410E3B7;
	Thu,  1 Feb 2024 19:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj6VYOEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368610E3E1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706815609; x=1738351609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f4+RKuT282/UrAeVYq1nqasmJgU+8Vl7BEk7VJOoz4I=;
 b=aj6VYOEFYb2XRxfVNA4OLS9Rxxos4cqcAoZWPQ6SKQGVRgS2E4Cgtxlp
 waat2bbzCKrrs4kWk0HGVVDF8L+qqFiCRuztyuS2i3eO6ipb+KDIN7rE5
 2xiW7Mvbmdq80kIKvfUGRPj9yw3itOGqzDRyOVWDhpcJlpcDM7IRhCChB
 6SuLnX+TI+YAsDNc4mymtKVwL3dRDde4D8z/DGN0SUlSf9mZO/NMZGenV
 v7/hEBSVzJ8gussLxsEDc6HEvK3vTBrOO/YH7puKAu7rmRoZTeY0BNqcB
 jYIRhRqzhZIqqpe7CL8G81FXyFm2oyqK298X1nkOg8oiO3VKDFZlrDPbc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="207690"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="207690"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="879191865"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="879191865"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 11:26:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 11:26:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 11:26:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 11:26:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 11:26:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3tL5AmbziuKtLS+4JFh1EU4ii/JreBbmUZLMWQTLIWZzNwrbt+4722P9kV3exh0iMRL+jkasOKcXcg87JtccJXeOHG0vk+Jze/gzyE/0o32+wZ4hJE6owOUBQH6x+fC6LYixunLwGzKsddfeQQQoW3SBJYz0KX+65KtiWqI8wtBbJ+Z3oPLKbhvjAdL5MgKD5w6Q2qH4DwR6Tv+lAahTSIlNIysbbeO4zNbg9jTLw2fuRc0TAtvUbzJYZ+e9mEbM6MtX67swGCmCVk0jaPc3XknvUEpAlro7lRVi0Frty1Df14f42Fztpg7QhiQS87kpG5lQGvIytv03xWj+XlJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH8TVg3irC6el6DlZXyslxhmetRWKxw5yayn3bQZvAc=;
 b=TM45Ra01e+FSbjB+ZwsFs3Tn47BO5P9XIc6I5ZDGbzrMNtBOvgrashVwLMFAQkMHo12g/30hNZtehRUe7AWhClu3z4GopjMOHiIOJsyyAjJVVRfAThOwxZbYBoiMh8PRbHiHOBd79X7LYYHg7jD2CNw8PFo5KRvizA1NbJ86khkNM8VfaV2DZB/2xesxiHtOONGSj6eIzwVVMGr/PJl21YeN4b0BiBN/dPuRRA4Hz3q6rA6KQajyYMCnnUGaVFXwd89vqrztnTTSLyPK1uEi193uRnulptg2Kll3gzjjgw9cLPQg9cBQ7L2+5zo3mePN/TExdHJX1jYF/qRjAHpZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 19:26:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Thu, 1 Feb 2024
 19:26:45 +0000
Date: Thu, 1 Feb 2024 19:26:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Pick correct userptr VMA to repin on REMAP
 op failure
Message-ID: <ZbvwWn84IXdbLjIU@DUT025-TGLU.fm.intel.com>
References: <20240201004849.2219558-1-matthew.brost@intel.com>
 <20240201004849.2219558-3-matthew.brost@intel.com>
 <265682a3-b813-4f1f-8031-1d500c3d89af@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <265682a3-b813-4f1f-8031-1d500c3d89af@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c10d98-310c-4288-32e0-08dc235bba28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcDTwlPy1eCpcWuXPxUhlqKy5q+a5X4UsxiudDksXUcrjapd6jWP6/QIXxhedh2T/N4/tW0NHmBewxdx3NwZgar7zJPku6xPFyy/hdtQGA3V+7hbrbnCVnaDbW80xthzyP2xQ4q5vUpFipeWnJu3og0MfI/VB72aSzg8bC/nYm2bkyfEOrVM+ZeMZwaML1LPVRzCU3SO48ChnDxiQY4wHQLGlQEjK0sZmHYePJMygK9/REUy5yMTuJjp65rcwTF2Z7wTE05irwK+ctMuug+/ldK+NjkhEmilqzGXBFpXm/NGhEUdiwUNd52ulO3a684E7e2Uk5BHnWyWel632HzHnGXwJOxv7uBIkvCEI4/G3a7i/So8xjLTXNXdWONpsfAGlaKvYrGaVlf9E2hK+n23ef4SMmw9vUWZnLra2+z604ZrbFR6/MJeqnBIwsIFOeLeo0D+VYjeIRpjmL7NFl6EZBvuGe5TPo+5hvkiCtajQxOxj0+4Jz3PFzfynhFlBRTM1M2Ca/y9P4CeCnJqsQmP08Eku4rhH2optzG6nYFmSQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(44832011)(8676002)(66476007)(4326008)(86362001)(2906002)(8936002)(5660300002)(66946007)(6916009)(66556008)(966005)(82960400001)(38100700002)(6666004)(53546011)(6506007)(6512007)(478600001)(6486002)(83380400001)(26005)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yN63msvLzqPAVKPC3L5okNG/R1FGGTcGz5cgO8OfKIS2BsR3IZKrLHkBGGkJ?=
 =?us-ascii?Q?943csoU12MG+Z1Mc7duLwaUCkR1IXXFRscsdv4JVjA+mdXDuNjI2+jHCyI1D?=
 =?us-ascii?Q?JgSZbDaRm1sqC5grjo3dYxmMxTtL42IJwdZNM0BWKl+8JoXcVFD6dPTpa8iO?=
 =?us-ascii?Q?9jjRqjYZjzX+b3oPWWvEfLJSvXHVXzBIRCLgRWSSxduJ/3c8a2xNsPvpnFvp?=
 =?us-ascii?Q?e//xhmJshIAl+hFiFwziJZnFs1qr3Jzv9x8IXdmKRXd7ICNNv4eMG9AFq8Fy?=
 =?us-ascii?Q?mIAz45jbyT8J90wNow3bH/lX/TjJSLRn+gZt/PnFrrJGR01DK1kqGqt9SY4R?=
 =?us-ascii?Q?N+7KVKC0AzU3/bsWry1uCI9Zy//PmLt8Jrn9ci0wmstO+mvuekXJQ1vmKXn9?=
 =?us-ascii?Q?vD+kVS7OVfqYk0R4DdqnWq897N1pcrlBKd6ZQacmdI1hHSZ+7TCZJEGsjLo+?=
 =?us-ascii?Q?KpOfxwX1/P3dfYXjbBHbNisci1e5LW+LigMbIAqo/MC+n2V+pxIRvaLXDog4?=
 =?us-ascii?Q?jc/6PFBJIMF6sEQ73DJSpW/QqBeVM0XpzSC8q/qbh23pTlxSY/2jF/8GhjQG?=
 =?us-ascii?Q?baKXWl74vLaxUjUBjab35vtJPNo6myYsIrfSoy7ECcnVVMgOr9eshNn/BqNu?=
 =?us-ascii?Q?wr5Ungkqw/cItxg1bVJQXiTtfD7fuzDRX8fCs9BG63ed5XqysFE/r5AM/oAb?=
 =?us-ascii?Q?vRH9zYZJg4811lguc2cQdsIdsi0cw14kkn9BODJbZVGcQU4N7nSG5e+uSQLK?=
 =?us-ascii?Q?P11xOEKcYBuFtEXGgVGx3xwszNNtlGIaVofYgvdDXjvEHehE5fefyeIfmHiI?=
 =?us-ascii?Q?W66OFVZhj9MdsY7JDyT65mt1r4xre6yqX7hF4EhjTdoVGPP4hNFaFaIU1vtC?=
 =?us-ascii?Q?O/RMY7NrLDO+ITCdRCMLxKbivrn3TydLiES2RLU4SZzf+EBK7nOeHGXe5RIt?=
 =?us-ascii?Q?XbLUzstEWoY/46lqD5L5hSWN+k8EdgwONwszNzqt8xDJmxKQ7W9bSccbZ9R8?=
 =?us-ascii?Q?QmenN+iAWWL2Yof6HoivnpLA+uZnKr77+zkdUcttOxu1KBx1InmjIK0YdooP?=
 =?us-ascii?Q?/UkAXh/C8hoPmUZh7OYBoo+3S2fdGuIQgul4Q6OioaCia5zWyZbx08MgENRC?=
 =?us-ascii?Q?fhY/Eynt0ozim37suPlmi85jNk00H/YcwtKjP+ClbxXoZUERFccIXjRbQV1t?=
 =?us-ascii?Q?3Yznus/6zHtTS8d9yblleylhicK7JnOWjAGpb294e3p0tUXMaPWc7GNH/MW5?=
 =?us-ascii?Q?kJiViz07Zk+l2mkkEhCLHxcXnasA/T0Y8CWUl6dM001FUdgT4MghqMY/ZGrz?=
 =?us-ascii?Q?YmhkGRUfrc4oQyiGbUL07c6phaPTK55urHQvM+ujSblyztCqh3WVBbnJaKv0?=
 =?us-ascii?Q?h8q6twhhWbKkadwFgkUmFjOB+Wj/lInqdwm+vmHRdS2/g3q/DKzUAzaj0s/E?=
 =?us-ascii?Q?yB7+Mlsl5+KduVvfZOir9ds4XYuIe/o1vI1bL8lI1wDcsXJ6ReaLYK1t/uWO?=
 =?us-ascii?Q?PWA7HTnOAN4CA3Xy17FUfQOP67biWeHCRczpZrKOu7Sd+y+Fa5INj+FqZ5Kl?=
 =?us-ascii?Q?ngYUmmuJIoJaGZm91H2/0PlPvgPuK3FAETBDg1yIflRzwxtXXSWgQ3yGf0Q9?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c10d98-310c-4288-32e0-08dc235bba28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 19:26:45.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOKn4TV1Pp4+z6aqFTYHbfJOh1VhJ8/rnqfRXr+jKWi91vsK2zXtp45+JMjbDArXC+eM9zGkWBE6wxcjmSgpiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Thu, Feb 01, 2024 at 08:18:52PM +0100, Maarten Lankhorst wrote:
> 
> 
> On 2024-02-01 01:48, Matthew Brost wrote:
> > A REMAP op is composed of 3 VMA's - unmap, prev map, and next map. When
> > op_execute fails with -EAGAIN we need to update the local VMA pointer to
> > the current op state and then repin the VMA if it is a userptr.
> > 
> > Fixes a failure seen in xe_vm.munmap-style-unbind-userptr-one-partial.
> > 
> > Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++++++++-----
> >   1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e55161136490..2ab863fe7d0a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2506,13 +2506,25 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> >   	}
> >   	drm_exec_fini(&exec);
> > -	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> > +	if (err == -EAGAIN) {
> >   		lockdep_assert_held_write(&vm->lock);
> > -		err = xe_vma_userptr_pin_pages(vma);
> > -		if (!err)
> > -			goto retry_userptr;
> > -		trace_xe_vma_fail(vma);
> > +		if (op->base.op == DRM_GPUVA_OP_REMAP) {
> > +			if (!op->remap.unmap_done)
> > +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> > +			else if (op->remap.prev)
> > +				vma = op->remap.prev;
> > +			else
> > +				vma = op->remap.next;
> > +		}
> I see this same vma picking in handling of DRM_GPUVA_OP_REMAP.
> 
> Could the switch in xe_vma_op_execute() be moved to a separate pick_vma
> function instead, called from this place too?
> 
> It might make the code slightly more readable.
> 

I would agree if this code wasn't going get rewritten shortly in [1]. We
are transiting to 1 job per VM bind IOCTL in [1]. I currently am
reworking on rebasing that code and found a few bugs in the current
code. I want to stablize the code quickly so I czn reliably test my
larger changes.

Would it help if I added comment here saying this code is temporary?

Matt

[1] https://patchwork.freedesktop.org/series/125608/ 

> Cheers,
> ~Maarten
