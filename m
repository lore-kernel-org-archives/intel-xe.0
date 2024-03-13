Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8D2C54E5D
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 01:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D188D10E21F;
	Wed, 13 Mar 2024 01:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ikei33PA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDC10E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710293286; x=1741829286;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cm7z0XeE6NSvQJd0FvvkpIl0xw+iCpXTdcobSXLU6I4=;
 b=Ikei33PA8fbr7DMNAINl4wvliFW24TJuhBG4NULavignN4e5EXPmlY2I
 Ka7hfMlejgYnWU5eYPlHVEebOcLaDUxBKN67e5fAujTBH67JUZLHoOLx8
 osMgyD9Ju7IJvz/wd+ZMDkyBv8EwrMa3Yl/YmtPDW1gCITgUK82gUnmlb
 dk7inE/YxNZtLxfCpdiJn2mokupTGFKs+KN1DJGbGgYbPfqidtyN7OXTl
 VbGbpkVphe2NmND0g+hLwOuvQ5x29LAwIB6GYKMepfeexQm8ftlBGqm9N
 s86PpXjylGo8WImQ4eFCW9fAXZirUs0CWofMN2Ywthm5jZKsaWz36WR2l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5205486"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5205486"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 18:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16399040"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 18:28:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 18:28:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 18:28:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 18:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqAh4GEKY/nvmLluURolrZdg+m7ERwvqrddkaU95ES2M0XnWFPNmUOcBXCNZ7J+n6QTQ4B7wSVQbjLHt8+DZPKY+AOeSAJa7jvJ6uKw1ASjL0CoRa4KNOI1c4Qrv6xu2yOfFlsyaHM4L+FEs94+zPKYG68RMs6dUN0KmQ7YqQP60usZ2kTnQcCCv33dAR4ultMCotWU19aeLkxliNCwFUrxpueCP9swBrZhT6c6xHVsFdFtMqyYPwinx4txTmOkdm/IJqqX/3da8xdXMJYm0JsglAB+N9GNHIETN1vgw+rXmPkzv4Pq7EhqXZtB2PNfpdOQ0Q0LShusK4RKxQpRnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CJwlcF/ZFOw8JiUU0F6wBaf87QZoYESW0y1eeHFRGY=;
 b=A6RLCKKUlsAVKr1N2nzdAaTGrqsAGFT7cLOwzuwIv9rL6pR1PWtmnbST19AC0K4zrGRqHI+01euTB3mIB507HTM4eKcjuHjykAtda5dBTBQvuzF7O9H4hsjFgpuvdy6ZitE99upOhT0lcpcv/AXVFCHb+9Q1V1ozw2yvsuBgxo8tOIYayKnF4wuBhBp25JtXeUyx0kCW02oRDHgNQ9M3d2Akrkov/f1Q4EtmI2+j3995SaK1SgZZ36AdjdUd7Hz7yS50pmNN5dVL1YijrsSGy9INAzKk9942veVhGK1zo944gmjRTeJjHlYqGWHNaxabmTz5BhSCcZ31FRi7KUFGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 01:27:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 01:27:57 +0000
Date: Wed, 13 Mar 2024 01:27:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Separating xe_vma- and page-table state
Message-ID: <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 77764f13-01e0-442e-d61f-08dc42fcd05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijAjieKH2lufoXCIvkGIjNRo6Ao7jIe/K775+bqkQD+dPOB6QK4L/G7LRHKZ8NVEV+254778r+M5UfpgU1Y4fyXAJGT+2XwWAk6ZFOdDakPyelJveiq+3398rHcOKw7fqs7lDRuqkck2bLjDxdAMzq7YTwsfDj0eFqAAk0nR2QdGfRaBRvDHEHFuY/fhjnbHqUmLJwCcaq4+Ym+tWVMLlWJLCZ5bl6oI0h/KMzwvSCvHsd0J7drgo8VLUKG+V/b/Xpyam+UABkuonKlNEqJf3SFNmIWODIqj9zJP9j7ZPCKRD3UIcx8a/spI12xY5xIV4RNGkXmPPbxT6kqNfzmE8kLDp9hTKbLKa6YmCH9H4zjaw337FgF9waK/tO6gkTYvnXmb++DFapOfF8QeVd+fA889HMYmrbtMEWrwc3EPuSvyPeDyng4irWU5LQq+dhiY6znjT4ZvpWT9FMkyZNm2Y5P9sJPDjIe6OO+cnukZlncqyj0ZUogJRHF26dg9cv4S69VlK3xgBbgik5Z+Ib7U5nTXNsMGSzGFCgo8h9J3ZYb11EhYZaV62S+mJvx5iwXcagbeH4JH9f9ALFMp0XtJvN+qr7Wbxi3N6X5jZV4A2nRHyo55nqqsfldBxOzjZo7V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?y4Bv7K8iBLg7yzffi5w+k/waTNoN7GlJtYnlOjNsf0wAmDfBCLNeRhzkf6?=
 =?iso-8859-1?Q?VlBYfM7EN/kJWuc7svd9gy3lEwGk0mepXnTdHd30mFutndU1JG/aubNCZE?=
 =?iso-8859-1?Q?Qb5FHxCjJBG812BXSk7NH7ZV5xURaynxsSiFyj5hOwyzlyCUtOI6BBz8qq?=
 =?iso-8859-1?Q?UZei8hptzeZydSf+Sll0WHONgRh500RWLy4f7QewOVm98BJfsTM6OjfqI3?=
 =?iso-8859-1?Q?4crjcpP9OhvcP8MpQY+GPqpWStDhdRMB+yPHB6tn3rAgLr3wFkJX3Yil0k?=
 =?iso-8859-1?Q?s8qsETEc5GHkVkFQqtsXQnaupi06JqkcZhQ+757vth7mTVjtfDwyQU4cU7?=
 =?iso-8859-1?Q?g9lBOpELzUHOXtAa0nUyTh3fsSeEpengW7qnunhZblJk71Eiwh62q7UlQ3?=
 =?iso-8859-1?Q?EQWe5VfaLwbLSc00fhjkcAD+Js9CU2Beu6yjKLcD47B4rZLb08JAXZMWN3?=
 =?iso-8859-1?Q?IE2gPj44Qrh1rIyK6C9v+dOyf4jtO9K+So+Wrwn7YsOj/iPfg2qjTmoixd?=
 =?iso-8859-1?Q?4gL0zMqt1ZlxFBglEdadAfoJ+DK0nocHt2Y3RTgy6EZssuoGnhBSm2mEzD?=
 =?iso-8859-1?Q?76Z8y8pRYIopQun+v9Ves4F+NUxtsFsqQ3Lx3oLB+arsOsBLMB9TdOl2gc?=
 =?iso-8859-1?Q?St9BYpR3Ktz9V4GKfmlejOqchwdBHeKpnqI62YSGnBqnwJH1SiBWoZroD7?=
 =?iso-8859-1?Q?umkBio8xfvE24+ZeILJc0Ka8FZaN8+cyyQb7ubVmfQw6oGyL9CbpbBUnPH?=
 =?iso-8859-1?Q?u4NRd1c6uup8JRtNBJs5aaUq1fpDHwMlkIdTtV/XVELekLXoxtoM6kRFRR?=
 =?iso-8859-1?Q?g3z0PdbkU0QnkzP6u5bXlQZtVffooo87F+N7B9b/BdfnoYC9y5KvfdoRRY?=
 =?iso-8859-1?Q?UCEh/eHhQD2BcC81yXB5E+Jnk+tRheVlnPoSel+YuWnfHlkCn/LIzMOUt2?=
 =?iso-8859-1?Q?tRKNKjmwZjXL49SLqDLru6a/8NEJf3BmcU4yPf983dbJwCtsWJXfVtmmst?=
 =?iso-8859-1?Q?bAVmBr2p3+nPUrHi93YDW/vus8YaysLbT5GZ7ittSSabT5aDOOxw2z0Zbr?=
 =?iso-8859-1?Q?VdKyhCP0nfsNmr+XuQmezJQpMXze9Uw0P/8K7Fao6DKVezZJ80CX8oXpyb?=
 =?iso-8859-1?Q?XS8SEE3pO2WG+ZBEPx9V+36TqPhf5XJ0Y19CHlij+lf3Z/FccvyEjwnoLl?=
 =?iso-8859-1?Q?29pN4fUM6WZI/kXRxOoFeBobctGV5CdBi9Q+18nntAwIvFE39YGaG6fDzX?=
 =?iso-8859-1?Q?Jp60GIXrSISSa8oBNVYU+ub614bzBmegUTZ41TUcnIWbXWxYTWWTDt8wxN?=
 =?iso-8859-1?Q?lvfoRS85st5I04P6CeqG4kZhbcHO8pRnT5avD0dar+0wBr0WDZtdqL57yq?=
 =?iso-8859-1?Q?xOrEFqPeuDmqgOc+zNlCofTnYZEVkr60hg8jugR6JUH+MhneCD/UyLlEH+?=
 =?iso-8859-1?Q?D1LSx1lBg/nZEdv8CBHYN7dC+p6tiJwNBc15QPiABq/s9JptEF4LQ9Ebo9?=
 =?iso-8859-1?Q?n5RymnWIMB7BYnvusQiPHVqxJPBiN2SmmoW43WiHKaqxjD/IeWUcnU6vyZ?=
 =?iso-8859-1?Q?4zUjzuXtgBNnZJsW0DL0398yVmqG785F50jeQcoP35Legk3lLQVdLXqsLj?=
 =?iso-8859-1?Q?+eOxZ0mVH3G4IlMyK5RbJeHz5vjZpf+mo8Anc9CrTmdTz4bja/QrV6Xg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77764f13-01e0-442e-d61f-08dc42fcd05d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 01:27:57.6609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpQemPWDqzO5eCSNhM8tWQMve7jhGhFbFv6x2ydKSyLa3L0Eg07Fdu1fppKNg2ie7h2ccJw5fUmMPK1bRhsPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> Hi Thomas,

Going to reply to both Thomas and Oak to not split this thread.

> 
> > -----Original Message-----
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Sent: Tuesday, March 12, 2024 3:43 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: Separating xe_vma- and page-table state
> > 
> > Hi,
> > 
> > It's IMO become apparent both in the system allocator discussion and in
> > the patch that enables the presence of invalid vmas 
> > that we need to be
> > better at separating xe_vma and page-table state, so that xe_vma state
> > would contain things that are mostly immutable and that the user
> > requested: PAT index, memory attributes, requested tile presence etc,
> > whereas the page-table state would contain mutable state like actual
> > tile presence, invalidaton state and MMU notifier.

Thomas:

100% agree with the idea. There are 2 distict parts of xe_vma - what I
call GPUVM state and PT state. In addition, there is what I call IOCTL
state (sync objs, etc...) that is updated in various places in xe_vm.c.

Functions to update these respective states should be clearly seperated.
In the current implementaion is a complete mess in this regard, you
mention xe_vm_unbind_vma below, in its current state there is no way
this function could be easily be reused.

My series [1] vastly improves this seperation. It still could be split a
bit better though. In my next rebase I can look at this series through
the lens of clearly maintaining seperation + likely update [2] to do an
unbind rather than a invalidation.

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/130935/

> 
> It is a valid reasoning to me... if we want to do what community want us to do with system allocator, 
> And if we want to meet our umd's requirement of "free w/o vm_unbind", yes,  we need this "invalid" vma concept.
> 
> The strange thing is, it seems Matt can still achieve the goal without introducing invalid vma concept... it doesn't look like he has
> This concept in his patch....
>

Oak:

I'm a little confused by what mean by "invalid" vma concept. Does
that mean no GPU backing or page tables? That is essentially what I call
system allocator VMA in [3], right?

Also based on Thomas say below related to xe_vm_unbind_vma and [2] we
should be able to have VMA that points to a backing store (either
userptr or BO) but doesn't have GPU mappings. We do have this for
faulting VMs before the initial bind of a VMA but we cannot currently
dynamically change this (we can invalidate page tables but cannot remove
them without destroying the VMA). We should fix that.

[3] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
 
> 
> > 
> > So far we have had no reason to separate the two, but with hmmptr we
> > would likely end up with multiple page-table regions per xe-vma, 
> 
> Can we still maintain 1 xe-vma : 1 page table region relationship for simplicity?
> 
> This requires vma splitting. i.e., if you have a hmmptr vma cover range [0~100],
> And fault happens at range [40~60], then we will end up with 3 vmas:
> [0~40], a dummy hmmptr vma, not mapped gpu
> [40~60], hmmptr vma mapped to gp
> [60~100], dummy, not mapped to gpu.
> 
> Does this work for you? Or do you see a benefit of not splitting vma?
>

Thomas / Oak:

Agree for at least the initial implementation a 1 to 1 relationship will
be easier. Also unsure what the benefit of not splitting VMAs is?

That being said, I don't think this is something we need to decide now.
 
> 
> 
> and
> > with the patch discussed earlier we could've easily reused
> > xe_vm_unbind_vma() that only touches the mutable page-table state and
> > does the correct locking.
> > 
> > The page table could would then typically take a const xe_vma *, and
> > and xe_pt_state *, or whatever we choose to call it. All xe_vmas except
> > hmmptr ones would have an 1:1 xe_vma <-> xe_pt_state relationship.

Thomas:

I like the idea of VMAs in the PT code function being marked as const
and having the xe_pt_state as non const. It makes ownership very clear.

Not sure how that will fit into [1] as that series passes around
a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It does this
to make "struct xe_vm_ops" a single atomic operation. The VMAs are
extracted either the GPUVM base operation or "struct xe_vma_op". Maybe
these can be const? I'll look into that but this might not work out in
practice.

Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship fits in
hmmptrs. Could you explain your thinking here?

> > 
> 
> Matt has POC codes which works for me for system allocator w/o this vma/pt_state splitting: https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commits/system_allocator_poc?ref_type=heads
> 
> Can you take a look also... 
> 

Thomas:

It might be helpful to look at that branch too, the last 3 patches [3]
[4] [5] implement a PoC system allocator design built on top of [1],
using existing userptrs for now, and is based on our discussions in the
system allocator design doc. Coding is sometimes the easiest way to
convay ideas and this roughly what I had in mind. Not complete by any
means and still tons of work to do to make this a working solution.

[4] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
[5] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commit/d2371e7c007406fb5e84e6605da238d12caa5c62
[6] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commit/91cf8b38428ae9180c92435d3519193d074e837a

> When I worked on system allocator HLD, I pictured the invalid vma concept also. But somehow Matt was able to make it working without such concept....
>

Oak:

Still unclear on this. Maybe we can chat offline to clear this up.

Matt

> Oak
> 
> > Thoughts, comments?
> > 
> > Thanks,
> > Thomas
