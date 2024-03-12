Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AAEC5475B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 01:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25F310E645;
	Tue, 12 Mar 2024 01:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBt0H4I7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1560A10E4C4
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 01:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710207073; x=1741743073;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IbUWo8mK/kdNVBmX7zm9gHgbXrOIf7b9xtkqdq8f4mw=;
 b=hBt0H4I7byoydQEKybt15FoBLvRcV1glGstmJYSWXRXq/nhUZXmzgo3n
 RZMRLnyNhEqITnFoyJQuNGeIBZu1EMt19cGPgF+aQbN5MvPEcEklbOH5l
 YgDrif2FErIf/pRoVvQjkFPAWKCHaS0uDtry+CTXEUc8d34QOtlqJreca
 FbTvLUA6YjocI4L5G5/pF1oK6I83yvhpc3B6ckzzp6KcijDPMWLP2z4wy
 FjOrCf6lsr+7w/x6r7Pid2NoTv4ciyTrDYNQmNAgwcCuuhn25h2kFKIvQ
 oZ3T6r0pjq6UuWn7TNon19QcPaXSeQzgheFHherHN4NUCJuNvSjpGP5qb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16339746"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="16339746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 18:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11264420"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 18:31:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 18:31:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 18:31:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 18:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZr5RxdR0LBjHzoL06M+JXgEbI30b7CeyN1AH0avMpkFDP1anL4uaDvG2WPjM6NA4pRvWmVI445yQm2eEmy5x5fTMkQbmS/27dgRIAlX6WFdZVvwFY7J7yQvGMabiQwRvlWhfA1jQQepuTN+AIjut+2CKpQwT9hu5S9/H4xqHloV6ej1lKxsp8D3pazzjG1tNBdkn/26noR12JM5qpE7dytkzF4JCXpJTD+JoOfm94IPbsu5Zqe/JLI0S7XKCTWNAlY+Tcyj7fJ9O6e4U4d297KXKL0l556tDhjRZWcu6HvGfD6XQvk48TdrKh1vg8/XNwEsI3+VLY/unPG9snBRYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmWJXdbzSjo3sXirnfiUSqoHr9M0EkRxpgIqixifqOg=;
 b=O0SuYkmbmfODW/anQM2RPiNXcjdaQVUFJuFNdGwUd7OBPq0blCs93h5Pz2ZqKg5RgyLgeIuLz45YHvp8T/zoRZ6cIUZD58wn5T8eqmWCSqPvRWz/m6Q8pVbWXFXmrFq+NDwdBg1qwN381tiQ0PvXLntQsvjmtYvnvs6ijkQYArW+xk3HMUY4Q7X1QiJMpz7g2aBjQLAfiuJKZ4yP3EHxDl5eCgUW4zP1eF1Wc1Jt0dKx9jYT1bhI9xECFemWK2CXtUyYuk7nkWJvrxNNh9lSQiktPkPNdeiQVPd/f0nxwDW4j6lqI+Mty6JqDlJeHA5VYvCaexw1vmyORBFBH+CPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6311.namprd11.prod.outlook.com (2603:10b6:8:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 01:30:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 01:30:36 +0000
Date: Tue, 12 Mar 2024 01:29:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
Message-ID: <Ze+v/z7SWpR4rnN/@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-2-matthew.brost@intel.com>
 <SA1PR11MB6991E7ECA4A2ADD89DA05C1792252@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Ze9gKyDiycibP6g5@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69915ABA34C079F317F76DAE92242@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69915ABA34C079F317F76DAE92242@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: d69a68b8-00a0-44dd-7a22-08dc4234044b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvlCW8YGB/6AgnfbK51T+2CwPTgpGOdVQDmSB1M6jqE90uDhhdYUAHWfahJCcFLRZL9tJcf4zbCtIzpTBcy/oCU3Q00UsjHRq2nf2D2mxMtmlB2Vqv6qTkpzDcHzeXb4ujOJb66GV4o1oT7DGG6BAHcDPsPJ09iH56vdSZaUXYxFySb0R2PyNVoNf8u47qF1j+UF8x0vLSrEzDsiwraiJw+EM/GKVsoQ3EQ+CkICjtihlKCFLltlWN9rgaOjji4A1oTxMi1HWPmfLWxd0S8MCV1aDPQcDPv1WCEWtCEp6NrBJYzZI1ZqgNq4QR0ImBrEUepgdbd7hq5/vybzf2PP3XRm/0J2BFGCaosJXeRhBAIBJ99CKqF86N6PM1l8E7U9Ov0iC1eJagWZanI7PgYThcACXx3e5K1v0whz3ih7SMlr1R1tTmr0Nfei7zP6AVO7P557IN7uePwgphokDRkt8L+ZcvltKYcdnygJZeVtcC6RBpoNqXUPQhDdepBp2Xcko/JWbTNRQ4jxnmZZrnTFc4i/Fl2weqYvDWrbwJffvJspWqtQVF0wmIuvPsZqJWE2NpKouQ/Ang9XX8VyCGWWVlnquS8Zm1SLnwdCOS+A0o0zw7I7mWTofgMfYRtVbQy4/s8BlS/P4ciqCutGefDWVXQlgcBZDJWN6lWPa6UptOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4+7wgVCu++Mt87/0juLSCmXUBh7KzdxjgO1SpS4DORUMMu3kjdRZGMu/M4Qy?=
 =?us-ascii?Q?wnHOPuuchZoe4VGLZM3RCZDY6MHqEl4lG4sRKiCzxjaxjtX+s4f/J4NSXZum?=
 =?us-ascii?Q?NmpbNMCunfXvcpxlKqtmdRwI+Boiga8gMNUvXkTGz0JzHlm/WU+RH0BDbcbr?=
 =?us-ascii?Q?MZv2r0wsAa6Jd9iQP+1TAi7d563yYknQA0e6mbPBvSdZmxW/RAV1PYBprKOc?=
 =?us-ascii?Q?e8tRbTxgi13rHHNC7XusCefX0s2oVMaVZqFHu5+5VAmrcl9bABbdDkcFbWkp?=
 =?us-ascii?Q?VUFbxWzgRee6YHVf8YAWdf1yOfxGo2Ta6MI9psgli0/HtaiKbSrqLtJQUuot?=
 =?us-ascii?Q?PK0DAfifoRo5oYu9EfmyokOGNSBWg6YpCN1dQYvoEPrWjuzzwt+Uvkkg7aaI?=
 =?us-ascii?Q?q668A4B9RTuHc3WNDLEwOYxq0V9YmtNh6XGxNGpwT5Q0StADJhbfcANk0tZx?=
 =?us-ascii?Q?xIvYGG5v1ksTFHXZhe77gHBuSFV4CkQrnrwkNJOtNizxjEU3PgelNqB7WrQy?=
 =?us-ascii?Q?2cXtjrP50L/vlS4pZRCNx3zxMAc62+Xpwg8vRc3NjKi5cDiDUZcgYC3NM+sZ?=
 =?us-ascii?Q?fZ8uEAevogoDF0G/vlLCIBFik4T1iR8QY4FdjQsWZLJm8hhRa4xOqHJX4mM/?=
 =?us-ascii?Q?iuoFCIRNxmCFbU92XqBV2dVEx/XlPJXE5sAjXbKEfUks6gdr8nom1wnlWd98?=
 =?us-ascii?Q?h3Sv+fjvk/ZBbMaAtwikC5fu58+OFMYfbIBZVCDbKFK9SuHJUot86oz1fOUB?=
 =?us-ascii?Q?80QHLoztLilPzqUChpN1/kbzBoxWe8MhAze0XCX7F7O00p9o8U6xMw/QQck0?=
 =?us-ascii?Q?OxCX0MfuoxEWFrM+KjkBYnKpZmKFgv0+11XlEUqrtf0G0K1Doe3Og+I54S3M?=
 =?us-ascii?Q?FWE/cjCs/YVhHeY89KMdipuYUU0tK4XkKjnbAW+R/fXmyFzBZC4nOeMrhK2a?=
 =?us-ascii?Q?PSxQyqhocoS5doyFseVMK8QYGXvZDRthuI/dVn9sWqq77VWTQ6CtrYQ7MCWS?=
 =?us-ascii?Q?ksmKHFX4ocNOepFPTI4Gqc03QAfSVoq1a3yGM2jQToVYqjQOqs2QxvA/E4/c?=
 =?us-ascii?Q?tgUV4kWENv8nEMG22n1EQR6uJ7RMBtr0qVN0WKB72D7Ni4rDUH/pEhncQB1K?=
 =?us-ascii?Q?PpOIUKfKGwcqHk2whO3ePiqyc3aFwX01Xt8VdpOB1DwG/1ZMqjkNnRkWreW9?=
 =?us-ascii?Q?6YE5RH1fyLmoqedAWy1N92pm1VR+Bgo9LV3FxBQwtC9rEOEzP3mMAL0zcsoj?=
 =?us-ascii?Q?pDrrIYS0K9hCnEz1vyZmeQ/BO4nnQ/VttSVQ+ZuAzRjS13mPFuoEIV1nMQeI?=
 =?us-ascii?Q?CpU6CiZUhx9SSRM4UkiM+P162ZwyJxGUtwPSdHJpop04BJHcL2MTK4Dlked1?=
 =?us-ascii?Q?+bum350K2pruQnsbkvqYkywyqWd1YmBahsayoo4rfrYdGGljOVABbGQPkVXw?=
 =?us-ascii?Q?pzftbpTzvmx3LA5TUpArfSNM2gjvG7yrIReq+jHo0+h7HB5ThaBgk1VDnzwL?=
 =?us-ascii?Q?OmSg7IE0pdB1VzAV/vm+EXN07MskqvHWO7smDtiSdDVDDHI2bSK6ausP4xDR?=
 =?us-ascii?Q?qDuRwjhmcTah1og1WWFcacHDfvj6abx4CdWwhNmnNl1Zx2rfbItaox7MuAEa?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d69a68b8-00a0-44dd-7a22-08dc4234044b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 01:30:35.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7ZgFZXAuRd7QN8D5xn3WPT+nTqU9c+bbwY1g9FC0JtVBRtoobWlaATKwPLs4n0apm6sjMcp6d78uw9fRpgExg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6311
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

On Mon, Mar 11, 2024 at 04:02:28PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Monday, March 11, 2024 3:49 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
> > 
> > On Sun, Mar 10, 2024 at 11:44:00AM -0600, Zeng, Oak wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew
> > > > Brost
> > > > Sent: Friday, March 8, 2024 12:08 AM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Brost, Matthew <matthew.brost@intel.com>
> > > > Subject: [PATCH v4 01/30] drm/xe: Lock all gpuva ops during VM bind IOCTL
> > > >
> > > > Lock all gpuva ops
> > >
> > > Can we have a better wording? Better to say locking all Bos used in gpuva ops?
> > >
> > > Or maybe lock ops by locking and validating all Bos used in ops.
> > >
> > >  and validate all BOs in a single step durin the VM
> > 
> > 
> > Lock all BOs used in gpuva ops and validate all BOs in a single step
> > during the VM bind IOCTL?
> 
> Yes, that looks better.
> 
> > 
> > > > bind IOCTL. This help with the transition to making all gpuva ops in a
> > > > VM bind IOCTL a single atomic job.
> > >
> > > Can you also explain, why you want bind to be a atomic job?
> > >
> > > My guess is, bind ioctl can end up with a series of operations, if some (not all) of
> > those operations fail in the middle, it is hard to revert the successful operations
> > before failure.
> > 
> > Yes, exactly. It is ensure if we fail at some point in the bind IOCTL
> > (e.g. memory allocation failure) we can unwind to the initial state.
> > Also another benefit is we get 1 fence per IOCTL which is installed
> > dma-resv slots and returned to the user via out-syncs. Lastly, it
> > logically makes sense that 1 IOCTL translates to 1 job.
> > 
> > The cover letter at some point explained this. I add something in the
> > next rev.
> > 
> > > >
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_vm.c | 142 ++++++++++++++++++++++++++---------
> > --
> > > >  1 file changed, 101 insertions(+), 41 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 643b3701a738..3b5dc6de07f7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -413,19 +413,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm
> > *vm)
> > > >
> > > >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > > >
> > > > -static void xe_vm_kill(struct xe_vm *vm)
> > > > +static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> > > >  {
> > > >  	struct xe_exec_queue *q;
> > > >
> > > >  	lockdep_assert_held(&vm->lock);
> > > >
> > > > -	xe_vm_lock(vm, false);
> > > > +	if (unlocked)
> > > > +		xe_vm_lock(vm, false);
> > > > +
> > >
> > > Can you explain why we need xe_vm_lock in the first place here?
> > >
> > > My understanding is, xe_vm_lock protect gpu page table update. Below kill
> > function eventually calls into guc_exec_queue_kill where I don't see any page
> > table operation there. So I doubt whether we need the lock in the first place.
> > >
> > 
> > I think it it protect vm->preempt.exec_queues list but that could
> > probably be reworked. For this series I'd rather leave the locking as is
> > and then in follow up rework the locking a bit and fully document it.
> 
> Isn't that vm->pre-empt.exec_queues is protected by vm::lock (the rw) semaphore? Xe_vm_lock here is vm's dma resv.
> 

It isn't really all that clear but since this is in the existing code
let's just leave it until we rework / document the locking.

I'll likely add a new patch in next rev at the end of the series which
works on the locking a bit...

> I agree we can rework those locks later.
> 
> 
> > 
> > > >  	vm->flags |= XE_VM_FLAG_BANNED;
> > > >  	trace_xe_vm_kill(vm);
> > > >
> > > >  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
> > > >  		q->ops->kill(q);
> > > > -	xe_vm_unlock(vm);
> > > > +
> > > > +	if (unlocked)
> > > > +		xe_vm_unlock(vm);
> > > >
> > > >  	/* TODO: Inform user the VM is banned */
> > > >  }
> > > > @@ -621,7 +625,7 @@ static void preempt_rebind_work_func(struct
> > work_struct
> > > > *w)
> > > >
> > > >  	if (err) {
> > > >  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
> > > > -		xe_vm_kill(vm);
> > > > +		xe_vm_kill(vm, true);
> > > >  	}
> > > >  	up_write(&vm->lock);
> > > >
> > > > @@ -1831,17 +1835,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma
> > > > *vma, struct xe_exec_queue
> > > >  		      u32 num_syncs, bool immediate, bool first_op,
> > > >  		      bool last_op)
> > > >  {
> > > > -	int err;
> > > > -
> > > >  	xe_vm_assert_held(vm);
> > > >  	xe_bo_assert_held(bo);
> > > >
> > > > -	if (bo && immediate) {
> > > > -		err = xe_bo_validate(bo, vm, true);
> > > > -		if (err)
> > > > -			return err;
> > > > -	}
> > > > -
> > > >  	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> > first_op,
> > > >  			    last_op);
> > > >  }
> > > > @@ -2488,17 +2484,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm,
> > > > struct xe_exec_queue *q,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> > > > -		      struct xe_vma *vma, struct xe_vma_op *op)
> > > > +static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > > +		      struct xe_vma_op *op)
> > > >  {
> > > >  	int err;
> > > >
> > > >  	lockdep_assert_held_write(&vm->lock);
> > > > -
> > > > -	err = xe_vm_prepare_vma(exec, vma, 1);
> > > > -	if (err)
> > > > -		return err;
> > > > -
> > > >  	xe_vm_assert_held(vm);
> > > >  	xe_bo_assert_held(xe_vma_bo(vma));
> > > >
> > > > @@ -2579,19 +2570,10 @@ static int op_execute(struct drm_exec *exec,
> > struct
> > > > xe_vm *vm,
> > > >  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > > >  			       struct xe_vma_op *op)
> > > >  {
> > > > -	struct drm_exec exec;
> > > >  	int err;
> > > >
> > > >  retry_userptr:
> > > > -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> > > > -	drm_exec_until_all_locked(&exec) {
> > > > -		err = op_execute(&exec, vm, vma, op);
> > > > -		drm_exec_retry_on_contention(&exec);
> > > > -		if (err)
> > > > -			break;
> > > > -	}
> > > > -	drm_exec_fini(&exec);
> > > > -
> > > > +	err = op_execute(vm, vma, op);
> > > >  	if (err == -EAGAIN) {
> > > >  		lockdep_assert_held_write(&vm->lock);
> > > >
> > > > @@ -2756,29 +2738,107 @@ static void vm_bind_ioctl_ops_unwind(struct
> > xe_vm
> > > > *vm,
> > > >  	}
> > > >  }
> > > >
> > > > +static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool
> > validate)
> > > > +{
> > > > +	struct xe_bo *bo = xe_vma_bo(vma);
> > > > +	int err = 0;
> > > > +
> > > > +	if (bo) {
> > > > +		if (!bo->vm)
> > > > +			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
> > > > +		if (!err && validate)
> > > > +			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
> > > > +	}
> > > > +
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
> > > > +		   struct xe_vma_op *op)
> > > > +{
> > > > +	int err = 0;
> > > > +
> > > > +	switch (op->base.op) {
> > > > +	case DRM_GPUVA_OP_MAP:
> > > > +		err = vma_lock(exec, op-
> > >map.vma, !xe_vm_in_fault_mode(vm));
> > > > +		break;
> > > > +	case DRM_GPUVA_OP_REMAP:
> > > > +		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap-
> > >va),
> > > > +			       false);
> > > > +		if (!err && op->remap.prev)
> > > > +			err = vma_lock(exec, op->remap.prev, true);
> > > > +		if (!err && op->remap.next)
> > > > +			err = vma_lock(exec, op->remap.next, true);
> > > > +		break;
> > > > +	case DRM_GPUVA_OP_UNMAP:
> > > > +		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> > > > +		break;
> > > > +	case DRM_GPUVA_OP_PREFETCH:
> > > > +		err = vma_lock(exec, gpuva_to_vma(op->base.prefetch.va),
> > true);
> > > > +		break;
> > > > +	default:
> > > > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > > +	}
> > > > +
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
> > > > +				  struct xe_vm *vm,
> > > > +				  struct list_head *ops_list)
> > > > +{
> > > > +	struct xe_vma_op *op;
> > > > +	int err;
> > > > +
> > > > +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	list_for_each_entry(op, ops_list, link) {
> > > > +		err = op_lock(exec, vm, op);
> > > > +		if (err)
> > > > +			return err;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > >  				     struct list_head *ops_list)
> > > >  {
> > > > +	struct drm_exec exec;
> > > >  	struct xe_vma_op *op, *next;
> > > >  	int err;
> > > >
> > > >  	lockdep_assert_held_write(&vm->lock);
> > > >
> > > > -	list_for_each_entry_safe(op, next, ops_list, link) {
> > > > -		err = xe_vma_op_execute(vm, op);
> > > > -		if (err) {
> > > > -			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
> > > > -				 op->base.op, err);
> > > > -			/*
> > > > -			 * FIXME: Killing VM rather than proper error handling
> > > > -			 */
> > > > -			xe_vm_kill(vm);
> > > > -			return -ENOSPC;
> > > > +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> > > > +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> > > > +	drm_exec_until_all_locked(&exec) {
> > > > +		err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
> > > > +		drm_exec_retry_on_contention(&exec);
> > > > +		if (err)
> > > > +			goto unlock;
> > > > +
> > >
> > > Do you need below ops inside the drm_exec_until_all_locked loop? After you
> > locked all objects, you can close the drm_exec_until_all_locked loop, then
> > perform below out of drm_exec_until_all_locked loop.
> > >
> > 
> > Yes, xe_vma_op_execute can GPU allocate memory. GPU memory allocations
> > can trigger evictions which try to grab more locks. Once the
> > drm_exec_until_all_locked loop is broken we are not allowed try grab
> > more locks.
> 
> I see. So you need xe_vma_op_execute in the drm_exec_until_all_locked loop to grab more locks.
> 

Yes.

> 
>  Also eventually on memory allocations I think we will pass
> > in drm_exec state so the looking can hook into that.
> 
> Then I guess you need a exec parameter in xe_vma_op_execute, so eventually you can grab more locks in memory allocation?
> 

This gets reworkeed later in the series where xe_vma_ops is passed
around everywhere (VM, migrate, and PT layers) and we should probably
includd the drm_exec as a member of xe_vma_ops.

Matt

> Oak
> 
> > 
> > Matt
> > 
> > > Oak
> > >
> > > > +		list_for_each_entry_safe(op, next, ops_list, link) {
> > > > +			err = xe_vma_op_execute(vm, op);
> > > > +			if (err) {
> > > > +				drm_warn(&vm->xe->drm, "VM op(%d) failed
> > > > with %d",
> > > > +					 op->base.op, err);
> > > > +				/*
> > > > +				 * FIXME: Killing VM rather than proper error
> > > > handling
> > > > +				 */
> > > > +				xe_vm_kill(vm, false);
> > > > +				err = -ENOSPC;
> > > > +				goto unlock;
> > > > +			}
> > > > +			xe_vma_op_cleanup(vm, op);
> > > >  		}
> > > > -		xe_vma_op_cleanup(vm, op);
> > > >  	}
> > > >
> > > > -	return 0;
> > > > +unlock:
> > > > +	drm_exec_fini(&exec);
> > > > +	return err;
> > > >  }
> > > >
> > > >  #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> > > > --
> > > > 2.34.1
> > >
