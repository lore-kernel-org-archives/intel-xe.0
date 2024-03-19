Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C73C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693310E254;
	Tue, 19 Mar 2024 14:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRnqlQnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E24C10FB2B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 14:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710858203; x=1742394203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WStdilQAymGaN8i4pnuRQCPiYQL8krbXZDSxCvkcTwk=;
 b=IRnqlQnAQDkYZSLR/dx+nSgHoh2OXX4fkev6/mTxFE+Bm62LBru8tUB/
 3I4ys9hPT/7Wr0Dv4GWF0D8qkg0luB42GDoKdW6B0hWJjlwQLZtCZfzRa
 la0q8gj8SHQtCJIgwSXOamxzydguRJj3lhpXuohAop38fGV3TbDKjrxoI
 PrTMDbmqg+EcZ7QlTMS9sZng08LdYHlPgFb6/uBz7MIaNYhhWnUgMjS0w
 wPKOiq+tJLrY1162vZqmUdmh6OPL55UOmCouucw8jKA4Q3kPkX3ITVy4X
 ANud18RHwmoIsjqARH0KlAkv4J885/1ikBHOomdqaamA7EfMwl6dEfHUp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5661355"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5661355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 07:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="18402765"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 07:23:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 07:23:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 07:23:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 07:23:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 07:23:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnoqPycA1N4w/MCGHP6PNk8C6p8ANEIB7sInkQhet6y8iWCfTaddx7OOrjkydQ1aYt5UIlQeiffBe1Ow8d5bPPfa4Z1Z56SY59GYB5A2wqJtaRIFjeM2XIXvMOKqjf13jHw+i4KYdm5LkCYJn/Q6M4zSRVhS24blkgm8UfUG3q5ZJAVBdnab1OUKdapF0yFypfBnwAJ0Zep3ICMtl5NoiZuLqSg1ObGAOJC+AMjGQxxPRm2ormCdLOVjjXhOzKbxMOdkH2CN/09jSXxnwcuYOCAVS15DP8hNToNGM+7XMVIKSEd823xewxUOhjR9WM4ReKGPf3QIgj8wiWJCHi1vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS1HIOxkKsLscNVjByYcAt2Lh2u16pfJRvHLNMgJdGU=;
 b=l4ZqY2QcbeAi8deJLCD2+8+E7SThAJq42d8M6FmlXS9QqXupMv1zxn3OJ7v6F6y44KRDcgd4kektCraiVUJP20jypfI0rYOAq8/aUjcXb3zfpF2A46So9t3Xo1Z9JUhfq9R3Gsjy3HX7hGVE2WZhlqkL5t+HZVHBJXFlDJHHPgk3nNzsjGT0aZYEgvC83KQ7N7IEYeYzu5n9YTjeaxsLV68cDiLEDRaQIuUT2VdWZ6Y3M5iQFb4+bltFzDsqpml8YTGYbHEUkbm9owuHu5+tstZdr22QgCEKUd1WhlIk9Uj6qJiMwoM7m/WW0JNkp8GZWMdWbIsoHuGOQkkKMsGb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7412.namprd11.prod.outlook.com (2603:10b6:8:152::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Tue, 19 Mar
 2024 14:23:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 14:23:18 +0000
Date: Tue, 19 Mar 2024 10:23:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Add dbg messages on the suspend resume
 functions.
Message-ID: <Zfmf0itERZZWtznc@intel.com>
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
 <20240318180141.267458-2-rodrigo.vivi@intel.com>
 <8f2a95fa-2acc-46ba-8618-c7e784f69d25@intel.com>
 <ZfiajmWtdxG0COvx@intel.com>
 <7716487d-be0b-4e65-b506-63ba17318955@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7716487d-be0b-4e65-b506-63ba17318955@intel.com>
X-ClientProxiedBy: BYAPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7412:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2ddGO0iV4vo/o9n/Tu13KYLKEtXHlRe2KbATdMAlfCYotF6LW8s1WtHabZ/g/yru5xtH+MgM2xjQdc7Z6nt1l36aa/IgAw31Fd1BpsDEeLcrreGUYzV9kkoYtGI32A4O7BF6c6Qb7wEjhOLhmvBzLqX0SEKJWaHFub+y9EHjES1HHsLwsGRKQ9ZckzUAk2pfegPH8ueIrs7sSQ1xjsUdvDthnHNTAi1i6M3acv8DTWr86k9aQRD6F616Gl9cRTAHdhNYdMEhGLWyw/7f6433uYr7kJtpYUNZZKrr3MhUDa6jW9SF/Dl3qpLtsuTKkh8NuIp9IZHmODTC4IgP+a6kivuuztFcjo5/M4FrzPo6IG3BbZPE8STeYj+mB0hIGybh5/x/s85hZRV+aZzekFxAiOidXwSWAVgu4nPZAWk4KBb5ihjwzLSBBr9e7QKibKA/hFTILLGJHqkxK9M1NhvJJIKB1uHyuAdaPgC1Z8UqCL3zk/1gq9BqMQtVqxSWknM3yTEU3GlGDxOYpzJraBXl0I1V8Pdy4X8t7BK//KRG8uvoj+PFnRYO+nlIf7Ax3PCHLEKdzE07lQq817oVMB4TaugLlQGB9zR6BFm0w7TR8pmGiPJjPZXXnhYbI+OwCkk212heEJEzBZOuMaOPmCWj2MJcOk8GDfzFbWAkMNhpAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MxZV1EcVvFEQgHOTVcK6Cn4TKlKoGVRNERr7WhQbgXwoYvKuZMzpW8JpIaB5?=
 =?us-ascii?Q?vIIXKJ8gUYSJVCYVZ0jUjQvh7E3/orerMlWsUTc5/eK3FmKh3i+dYBx1ybpZ?=
 =?us-ascii?Q?DvD5bqVa58hMHiarBbU4uREfD4voWcbr8sL2oJdJTFOGFVskG+EpZVUBhkPw?=
 =?us-ascii?Q?5IxZjN9gLG4oSw/OFjqRZM9lxT+otBdSqtX8jvUOc/OPsTcxuCkF4ZaJ8Dn8?=
 =?us-ascii?Q?jtbL/18FIWfsBydhrFhZ1kZkMvirDCsVCYBUvtznYkz5Tj9lxBsxRFLfQJEG?=
 =?us-ascii?Q?vBcfBW5skYTaFp8mpog7VfPfZj7pCwJITskD54ij8MUbhD6i1W1Hr/DGBMjk?=
 =?us-ascii?Q?vAP5PHya7w/rqsJpL3pLN7D0+10aI+IC6DnNxMQImMsFzbHFG8uKFfkUHDe+?=
 =?us-ascii?Q?SmYj7pu6xgpOv7nHVxWmBrUcJ0KtJWoKRzZLSaq19j9bL0A9WdKEn0+ieAQy?=
 =?us-ascii?Q?/K2h4CkKRMc3qraApX8+rbc2q63OljjsKzN/btoBzZs+d175SiU/cBMiqPfC?=
 =?us-ascii?Q?Du7RUuNa6R5ObkjXr+iI0jagTMCJ9n/6VWPAtZq13UEEZYPlb3/3SjP4PnlO?=
 =?us-ascii?Q?vN9dLQCDq2AwEM5wUWnaZK1yFGqnhdUqeHZEjnbOIHRZwzQTTAFAit2E26pY?=
 =?us-ascii?Q?lPdJpclp6CMGW+5Qj57rnygDZSWDQT5qjQhQdGZHBzwEntPhJRWf56UYE4Jb?=
 =?us-ascii?Q?524h4pvr3kXKQZcrHoMW/VzwtFaYqnKouYBWAAiPYyrOnre2JQB7U07n3Ukt?=
 =?us-ascii?Q?B8SVKmwkXGokZgzuVH+hfbn1tWWzrnorz9sOIokPMV+MErWoOLGlI2MiguVC?=
 =?us-ascii?Q?+5eHFkvg040H+55ilSf7VMvLLbmE0p9qwDvHFr724poJOL2v6oNyU6t34eqn?=
 =?us-ascii?Q?ja/KqP0z+2kwyWTZZOLLB+PAXGQdlvyQqcTdlpZNtTod5EtVNi3BxcCV2An6?=
 =?us-ascii?Q?AEfWCG9/XGs21WfbMPutw7X6JsnALyRz+IuWnqESU3yfElpSmUGxSW8odmxD?=
 =?us-ascii?Q?t5Jb4UoubfK9Y4CktxYE/7ls5vIz6MAeoCVxBjiZN4w8iw2MWFxZNKvRJ3/N?=
 =?us-ascii?Q?dXBCwXHupPBtcibwcRz+hZlsUxtzxI7YuT8z2OgUEgOMNXVHknkAg4DG8sKb?=
 =?us-ascii?Q?ESW0vIMRZrTXQqFzE40gDWLo7g38zAfV7w/K00W+v5IbtO4nVE70O8QtimIl?=
 =?us-ascii?Q?Xbt3cecABMGxQAw5VE8Vz6JUBl/9TvM3gtYj6pyGNe6OmZhzEGqOmztI5P/x?=
 =?us-ascii?Q?Q/g1ZRySeQaADO2Qug6CJTmNEZrhfECEHtGmbZsjAaakQn8bZ/bmmuCGPs0g?=
 =?us-ascii?Q?EwP04MmsXXGE6qADTmgMzEp8cxMPGaclsA/406XVkNgVsQlfgIg8V0SVnkO/?=
 =?us-ascii?Q?qjGmxaN0S8B6CkAdYC3CXlAoa7zqS7WgimKhSk7Ik7U5sifRvLoQ3ibs4vtr?=
 =?us-ascii?Q?Eglw8mM47/5y4Y/G4qRPpjLJXyhwjhWB+gSgHloPz/+FccNKb7vUUOC4pdym?=
 =?us-ascii?Q?mVFYKzS6KhHjxRHCvTey1BM4ujUymVS6A1sbH9VCwff0H4YDTehifdaDyvX8?=
 =?us-ascii?Q?42lmUkeFk/X0xK9Ud0DQV7URPdQSiMCRnqcVjyWq+yzbyq79cf/coTkwcM9K?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4076d7-2777-4d97-abad-08dc48201f8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:23:18.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aws9VppvSCzafHmf5TDNwOUX4dAFEL3dp4qotfY8pGv3c2Jv3rQGjEakmRe5dPkrmKWtlwbkMfvjEAwfgw/bAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7412
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

On Tue, Mar 19, 2024 at 09:38:53AM +0000, Matthew Auld wrote:
> On 18/03/2024 19:48, Rodrigo Vivi wrote:
> > On Mon, Mar 18, 2024 at 06:12:44PM +0000, Matthew Auld wrote:
> > > On 18/03/2024 18:01, Rodrigo Vivi wrote:
> > > > In case of the suspend/resume flow getting locked up we
> > > > can get reports with some useful hints on where it might
> > > > get locked and if that has failed.
> > > > 
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > Makes sense. What about maybe also adding that to the rpm versions? Those
> > > can also be fun, and so would be useful to get hints when inside the
> > > callbacks.
> > 
> > I'm planning to get that on RPM next... just was trying to avoid
> > conflicting with myself ;)
> > The bug that I'm targeting with this right now is a suspend to memory.
> 
> Ok, sounds good.
> 
> > 
> > And I was afraid that someone might complain about verbosity in the rpm
> > path on cases where gnome-shell keeps doing some ioctl and waking up
> > the device.
> 
> If that is a concern, I think for rpm we also trigger (per gt):
> 
> xe_gt_dbg(gt, "suspending\n");
> ....
> xe_gt_dbg(gt, "suspended\n");
> 
> Which would also be quite verbose?

yeap, let's see how it goes... at least it is a debug now and not a info

> 
> > 
> > > 
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pm.c | 22 +++++++++++++++++-----
> > > >    1 file changed, 17 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 9fbb6f6c598a..cc650a92c2fc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -80,13 +80,15 @@ int xe_pm_suspend(struct xe_device *xe)
> > > >    	u8 id;
> > > >    	int err;
> > > > +	drm_dbg(&xe->drm, "Suspending device\n");
> 
> New line between declarations? Below also.

well, the line is there... not sure why it is not showing up
here in your reply...

But after applying with b4 from this thread I see

	int err;

	drm_dbg(&xe->drm, "Suspending device\n");

        for_each_gt(gt, xe, id)

I don't believe we need any extra, nor less...

below also:

	int err;

        drm_dbg(&xe->drm, "Resuming device\n");

        for_each_tile(tile, xe, id)

> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > > > +
> > > >    	for_each_gt(gt, xe, id)
> > > >    		xe_gt_suspend_prepare(gt);
> > > >    	/* FIXME: Super racey... */
> > > >    	err = xe_bo_evict_all(xe);
> > > >    	if (err)
> > > > -		return err;
> > > > +		goto err;
> > > >    	xe_display_pm_suspend(xe);
> > > > @@ -94,7 +96,7 @@ int xe_pm_suspend(struct xe_device *xe)
> > > >    		err = xe_gt_suspend(gt);
> > > >    		if (err) {
> > > >    			xe_display_pm_resume(xe);
> > > > -			return err;
> > > > +			goto err;
> > > >    		}
> > > >    	}
> > > > @@ -102,7 +104,11 @@ int xe_pm_suspend(struct xe_device *xe)
> > > >    	xe_display_pm_suspend_late(xe);
> > > > +	drm_dbg(&xe->drm, "Device suspended\n");
> > > >    	return 0;
> > > > +err:
> > > > +	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> > > > +	return err;
> > > >    }
> > > >    /**
> > > > @@ -118,13 +124,15 @@ int xe_pm_resume(struct xe_device *xe)
> > > >    	u8 id;
> > > >    	int err;
> > > > +	drm_dbg(&xe->drm, "Resuming device\n");
> > > > +
> > > >    	for_each_tile(tile, xe, id)
> > > >    		xe_wa_apply_tile_workarounds(tile);
> > > >    	for_each_gt(gt, xe, id) {
> > > >    		err = xe_pcode_init(gt);
> > > >    		if (err)
> > > > -			return err;
> > > > +			goto err;
> > > >    	}
> > > >    	xe_display_pm_resume_early(xe);
> > > > @@ -135,7 +143,7 @@ int xe_pm_resume(struct xe_device *xe)
> > > >    	 */
> > > >    	err = xe_bo_restore_kernel(xe);
> > > >    	if (err)
> > > > -		return err;
> > > > +		goto err;
> > > >    	xe_irq_resume(xe);
> > > > @@ -146,9 +154,13 @@ int xe_pm_resume(struct xe_device *xe)
> > > >    	err = xe_bo_restore_user(xe);
> > > >    	if (err)
> > > > -		return err;
> > > > +		goto err;
> > > > +	drm_dbg(&xe->drm, "Device resumed\n");
> > > >    	return 0;
> > > > +err:
> > > > +	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> > > > +	return err;
> > > >    }
> > > >    static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
