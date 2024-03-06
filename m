Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C240FC54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 20:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F51113509;
	Wed,  6 Mar 2024 20:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCpoyz2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E511350C
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709755451; x=1741291451;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+eFQlAbpPuACiVVNs/V1GLbvS7vHa0lvSphNeGR52Ws=;
 b=MCpoyz2Z91S65Y0M3nbT3E4evHVLkwj3uxrttp2//Ot47lIZhQ/VPLgy
 mnQ1V6PIt4kbihrWlOS4YYl6enml5CZ9qX7gCw0j2JxDI2bPCfgtMD0p6
 Od5Jw+hWnGGzqTwWGH2NDVGVNleGrobBvSLHSjcM8k2YRDAQZSYUolUpC
 A03ANPn1Ffhy0PcWe/tccVZI1NmoDARQc//yoCdCGYLtLhAkU/pI2qGJ+
 lMrBl2sD02llYe3i/+85mh31ZdlnMfLvw/3Yif+Lfr2jaUIXLpKmlRnQv
 3yAJUV5c/gUkfQrE+swf9x0ylHcbiPr612TvTxkKElVvNX9bjIq6ojS3S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="29839270"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="29839270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 12:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40755981"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 12:04:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 12:04:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 12:04:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 12:04:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVeLjKzVoqxHflrMVbN9pSU2FSgi2IN2JFtM5hrK7DFd57erEEYFCbx0w6OI+m3Lll3klqbQ/bVsbxN89TG+7LnV8IwGjHufR8SgZYrFshBH6YAUs/4U0d9p5y4yvnqW4kN5BN7wgVmKM2oGFuD06UA4EsRdfTLy/A8uoZEsqA0nNzCBpJxgSIRFnRd7qgigSbVWwbKxTSMW1U6ZnD8JDSI24zxYVROgQiSqC6PcLdqD+qJoLASEkuQNEs6ZoaYctAuiBVX+OZfmn6sx9j3+qXC+LOrVU+Wiu+uOxFzSeHw+2HTj71BSzTZph6g1Tf9zwz/xp60ekZ7AYgHIzTPNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O8ubc1s8C7vgEhsamL89ytlPX3KBIChWEDiA0gCB/8=;
 b=at2KNhEImy9Kx4LkXi0cK+ImqrUNjR76HIpA6NLBkn4fckmTGLzF104vuOfL+Z2/+I4mqUyOzHKXWoeOn2DG+IlChLqFD9PIVZLue3voZaeCIqoBP3xJMTHsR0EIMwg0lATZ1s3I7I3OpwN+FJyWT5mDiHunDmckcUqdMrIJBNlCV73FG7aQ2nx1aaTJrUcimYp06FGYLIne3AGqe4Y2yk4Q2XsED1qzNAC7mScJKMFxzll653yqxChE3Un3W3TXmKoWEKJTkprzWEfyLfQsRlc7vQX9zP9E6wKqr56tuCsW/GzUw82W5I1BehAs2/l3is6etjMzzcg7fyH7v3Oohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 20:04:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 20:04:06 +0000
Date: Wed, 6 Mar 2024 15:04:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out
 of lockdep
Message-ID: <ZejMM8WVoBIxYDam@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-4-rodrigo.vivi@intel.com>
 <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com>
 <ZeegmIhyBz5aCwcm@intel.com>
 <efcfb623-3e2d-4a4a-bc79-b14b712f204c@intel.com>
 <ZeisnaCxdBOTy93t@intel.com>
 <ac6c899a-4bb8-470d-b582-cd74da2f161c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ac6c899a-4bb8-470d-b582-cd74da2f161c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e76d99-ed93-4114-2738-08dc3e189434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVTtUP7E08l1Ru0uOah7zC1SaCwF+hO378HrVHDoIX2Li3NVKmHZDdHUao1kRmsiOiGZsmvAsnXhPpwfL3DXjRQZT1ito32g6C+heNNoSyOtRp1uPucA1/XRtVgHiQA8FKNUzsNqTjzUyp1mkfrSVXCudnM/Zw1/J4Hbbt6ja7PQNbtA4DcvUUgOh/ziflcIshDmfRCPAf+e1GTiS/mBj8Uu0JavVbphLDNv1mvJmWv8K1pc86okwKPNdH0t+K0FQcL9LLkdy2lClYULcBKXHJOpjBVESrObMNvWq248nS9tJfPGW4YIL6EDSrHV/zx/R4vK38Kvzghg9EDEngrL0Kd8M/+8PhqIZgM2hunmUtSpEXX8sDWDUuwkPlISxhuEyOCLB1VVi45921uFtpuf5r25/HnRV+vodxLnCluZv2DD88ZJJBwveIirzaHmNwsVszBKghxpdH3iiVgoAM7+/WnVu1kd0tN0s02fdWrgJv2GFCdt3U9mTHHJmeSoOesoJNT5wKV2B4GOumbUa4OVM0dXOFAEbcvKxnxZG1DmgCQYe44zW9ehXN5+gjS8pjY/LrQz8vnacwkpirSvr9Viw61NgKijGvojqacdItDMFvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ByATEVOPSwSbl7iht1VhHn1z7YRp3bRDhBJCzQMB4PtgIFQ3K3b/k7PSCmIc?=
 =?us-ascii?Q?r9a/2CJ4XlQziV5NPgPjAXV60X1WOoXlj9z9RJlxy7C+9YfQEmS/JG0Qe/sz?=
 =?us-ascii?Q?ERq+V3NUHrlfFg5UKJstklvZiXf+yhoK1UpQ2A1J5D1tr7KoARcKS1YwuDD3?=
 =?us-ascii?Q?/lbUV2Q0OMcwGY1fwOpV8ypGk04KpKY6sTbzb2/fcguAOCoXaSaIjIJK6GF1?=
 =?us-ascii?Q?1j+zEqavyeQGVBv5YwBIgEAS3JYitR51eYRCFq3hRLYUZk8HIlKmBX9+Jr9B?=
 =?us-ascii?Q?sEKomqBd0eg/3n2IUg5Akf1DFuGd/nTYhXBnpizwt2xNC7XNH9vIjo5kYWUe?=
 =?us-ascii?Q?RQSAdytYxVxlvz212iL6OU6kdlr702yiZ/g+sggqJrAtJ6Aen+/f5HkTw7wv?=
 =?us-ascii?Q?xesARFh76iMmDeHx0e08mNJ6c5X+JOIPLm+nDVTikEhqKOOxC5llmfsdFJg8?=
 =?us-ascii?Q?aqEsKnU39R/u9Q23iyrU2ZYPb2mSG+dNyLzulDk7RmJUK1uqWXEGCSibbjvr?=
 =?us-ascii?Q?MXWXnPTKlMnBtQa4O4N0RuCjzC6gIupZ/0sXY8geE8yXwLrlBRY3lviBGnoy?=
 =?us-ascii?Q?P8mF9HE5fTeo3ThBO3aCyUYgFXXc/VkJhOZFbZEwHWOuQeJ5ERKmnBy8r1nj?=
 =?us-ascii?Q?IfkEU8KKxzIOPE/yONe93fVYt0TEmVevkZhIW/qoXqnh8CXLNK0nA/LlBhVH?=
 =?us-ascii?Q?2IKZygPBNYbaOSd6Vi0aSvb679M2sY+5QuzocCZRQAA/D0+eU45XDIcC/n/P?=
 =?us-ascii?Q?V28szrUwt7TmX3XeHBNLBj15NfabzIgW74e4Dap4vU9A5ZztFpNh0xUUg/gk?=
 =?us-ascii?Q?qfmHmdeyggzA3nTR5Vl/8yTFA5omS67Xn+vn6f0OYThLcnogrQ5NtlZnN4Xv?=
 =?us-ascii?Q?6mELnB52+19hlkJGvxz0/BLeB5ql2W9mXh+uUo4T10g7bdfRQ6dZr4KM0aB0?=
 =?us-ascii?Q?klj/nX42xE+W6WV2BNc3g0krPF3e75y0BZDRLvTvWq91U190ogw9cfRxWkLq?=
 =?us-ascii?Q?skDHgLMcvEJcGPUbL11vYqvB1olw2G+TwnVTkgV5043xTLmoPWBdeI5ikwGf?=
 =?us-ascii?Q?2oy3Q26W2rpD+C7eGQrLFO/jTikB0vLjYz9QGuOSkMti9ogVhHssHYnE0rdx?=
 =?us-ascii?Q?nBeRLkd+bSTpoJ1pBAHOzy9O/QodSR05PAYHA+Cvv3mIf8j96lCApdBwUcRp?=
 =?us-ascii?Q?707pZeu746v0u8PW2QLO+1zhbjRXVok4cIpxCY6C0DNBfd7dqglkdSyRPDZ3?=
 =?us-ascii?Q?DI8g78ZQCBVrXthmE4/7jLiLjVUMeTjnhyTyuF4P9GLvsAvCEhGxe/jx9xoq?=
 =?us-ascii?Q?QU4vl3TDaTaIbsa6mswlekSDDSahzt1/+Kiqj+nWx/0f6gTGd5kTYqXg1cSL?=
 =?us-ascii?Q?SspYcwDidP4J+1gd/Qj+meT/7ZV6T5DqFclhp3SFdS1Ru7y4JBzaPtDh5fSL?=
 =?us-ascii?Q?635jliOULutxpwYDOdaOKp1uTdsPL6apec5lWo5nyXsUqqqviZV36qM9Mh8y?=
 =?us-ascii?Q?lOAfzXcYI7ZcjX4im97K5eqtYXC7F+3uiRklrreomeDXDgmHKB3ixBkRVU28?=
 =?us-ascii?Q?9fS3cfgtxvULq1yMGLnvy8ixqibhlYaf7sXlRQ5q2tmyz4y1aaH4KrbXb4+U?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e76d99-ed93-4114-2738-08dc3e189434
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:04:06.9261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKYh2ABaYZsxm2G/S654S5buGqfpvrN6FwFiPGEOtvSpPyZf0MJikiAJXBswa5KNBQlF1mLfHA2j7GoGqdCMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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

On Wed, Mar 06, 2024 at 06:56:37PM +0000, Matthew Auld wrote:
> On 06/03/2024 17:49, Rodrigo Vivi wrote:
> > On Wed, Mar 06, 2024 at 04:04:45PM +0000, Matthew Auld wrote:
> > > On 05/03/2024 22:45, Rodrigo Vivi wrote:
> > > > On Tue, Mar 05, 2024 at 11:07:37AM +0000, Matthew Auld wrote:
> > > > > On 04/03/2024 18:21, Rodrigo Vivi wrote:
> > > > > > Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
> > > > > > the sync resume calls lockdep is saying:
> > > > > > 
> > > > > >     Possible unsafe locking scenario:
> > > > > > 
> > > > > >           CPU0                    CPU1
> > > > > >           ----                    ----
> > > > > >      lock(xe_pm_runtime_lockdep_map);
> > > > > >                                   lock(&power_domains->lock);
> > > > > >                                   lock(xe_pm_runtime_lockdep_map);
> > > > > >      lock(&power_domains->lock);
> > > > > > 
> > > > > > -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> > > > > >           xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
> > > > > >           release_async_put_domains+0x26/0xa0 [xe]
> > > > > >           intel_display_power_put_async_work+0xcb/0x1f0 [xe]
> > > > > > 
> > > > > > -> #0 (&power_domains->lock){+.+.}-{4:4}:
> > > > > >           __lock_acquire+0x3259/0x62c0
> > > > > >           lock_acquire+0x19b/0x4c0
> > > > > >           __mutex_lock+0x16b/0x1a10
> > > > > >           intel_display_power_is_enabled+0x1f/0x40 [xe]
> > > > > >           gen11_display_irq_reset+0x1f2/0xcc0 [xe]
> > > > > >           xe_irq_reset+0x43d/0x1cb0 [xe]
> > > > > >           xe_irq_resume+0x52/0x660 [xe]
> > > > > >           xe_pm_runtime_resume+0x7d/0xdc0 [xe
> > > > > > 
> > > > > > This is likely a false positive.
> > > > > > 
> > > > > > This lockdep is created to protect races from the inner callers
> > > > > 
> > > > > There is no real lock here so it doesn't protect anything AFAIK. It is just
> > > > > about mapping the hidden dependencies between locks held when waking up the
> > > > > device and locks acquired in the resume and suspend callbacks.
> > > > 
> > > > indeed a bad phrase. something like
> > > > 'This lockdep is created to warn us if we are at risk of introducing inner callers"
> > > > would make it better?
> > > 
> > > Yeah, or maybe something like:
> > > 
> > > "The lockdep annotations will warn if any lock held when potentially waking
> > > up the device, can also be acquired in either of the resume or suspend pm
> > > callbacks".
> > > 
> > > ?
> > > 
> > > > 
> > > > > 
> > > > > > of get-and-resume-sync that are within holding various memory access locks
> > > > > > with the resume and suspend itself that can also be trying to grab these
> > > > > > memory access locks.
> > > > > > 
> > > > > > This is not the case here, for sure. The &power_domains->lock seems to be
> > > > > > sufficient to protect any race and there's no counter part to get deadlocked
> > > > > > with.
> > > > > 
> > > > > What is meant by "race" here? The lockdep splat is saying that one or both
> > > > > of the resume or suspend callbacks is grabbing some lock, but that same lock
> > > > > is also held when potentially waking up the device. From lockdep POV that is
> > > > > a potential deadlock.
> > > > 
> > > > The lock is &power_domains->lock only, that could be grabbed at both suspend
> > > > and resume. But even though we are not trusting that only one of the operations
> > > > can help simultaneously, what are the other lock that could be possibly be
> > > > hold in a way to cause this theoretical deadlock?
> > > 
> > > I don't think there needs to be another lock here to deadlock. Also it
> > > should be completely fine that both the resume and suspend callbacks acquire
> > > that same lock. The issue is only when you are holding that same lock and
> > > then try to wake up the device synchronously. If that can actually happen we
> > > can hit deadlocks.
> > > 
> > > Simplest example would be A -> A deadlock:
> > > 
> > > lock(power->lock)
> > > pm_get_sync()
> > >     -> runtime_resume(xe)
> > >       -> lock(power->lock)
> > 
> > this case is impossible with power_domains->lock because the get_sync
> > is never called from inside a power_domains locked area.
> 
> I agree that you likely can't actually wake up the device here in practice,
> but it is still calling xe_pm_runtime_resume_and_get() while holding the
> domains->lock, which looks like a deadlock from lockdep pov.

dang, you are absolutely right. I'm sorry. That was exactly what lockep
got. From where I was looking the power_domains->lock I was confident
that it was already awake before getting to the locked areas, but lockep
has no ways of know it and we have a remaining case where although it is
protected, it still calls the get_sync case.

So I'm dropping this patch and adding this display patch:

--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -646,7 +646,7 @@ release_async_put_domains(struct i915_power_domains *power_domains,
         * power well disabling.
         */
        assert_rpm_raw_wakeref_held(rpm);
-       wakeref = intel_runtime_pm_get(rpm);
+       wakeref = intel_runtime_pm_get_if_in_use(rpm);

Since we are already asserting before that the wakeref is held, there's
absolutely no functional change here, but this will ensure that xe_pm lockdep
won't complain about possible deadlocks.

Fair enough?

> In other places
> we instead just use noresume() or similar to make that clear in the code and
> to lockdep (and reviewers) that it is impossible. It is a trade-off between
> false positives and having a design you can more easily validate and be
> somewhat confident doesn't have deadlocks; every caller of
> xe_pm_runtime_resume_and_get() or xe_pm_runtime_get_sync() etc. is assumed
> to always be able to potentially wake up the device from a lockdep pov. I
> thought that made good sense overall with d3cold on dgpu now wanting to do
> stuff like GPU submission, allocating memory, and grabbing all kinds of
> scary locks etc, but if you think the annotations are getting in the way too
> much, I guess we can just nuke the annotations or don't use them for
> display?

I will have another display case soon when moving towards d3cold sequence.
On that one I will try to scrutinize better and we can discuss in separate
and see if we find an easy alternative.

Thank you so much,
Rodrigo.

> 
> > 
> > > 
> > > A more nasty example with A -> B, B -> A deadlock (where did B come
> > > from???):
> > > 
> > >                            rpm-core worker
> > > lock(power->lock)    |
> > >                       | -> status = RPM_SUSPENDING
> > >                       | -> runtime_suspend(xe)
> > >                       |   -> lock(power->lock)
> > > pm_get_sync()        |
> > >    -> wait_for_worker |
> > 
> > again, this case is also impossible because the get_sync is never
> > called from inside the power_domains locked area. On both sides that
> > is called just from inner portions of the work and then it would be okay.
> > 
> > As every other current i915-display rpm handling.
> > 
> > > 
> > > The wait_for_worker is the waitqueue dance where it sees that runtime_status
> > > is RPM_SUSPENDING or RPM_RESUMING and then goes to sleep until the status
> > > changes to RPM_SUSPENDED or RPM_RESUMED. Once the worker completes it then
> > > wakes up the sleeper. But that wait_for_worker thing creates a dependency
> > > underneath. But here that wait dependency is hidden from lockdep AFAICT,
> > > since there is no actual lock acquisition happening. There is exactly one
> > > lock and two different contexts acquiring it, seems totally fine, so from
> > > lock acquisition pov there is no issue.
> > > 
> > > And yet it still deadlocks, since the rpm-core worker (or whatever is
> > > running the async suspend) is stuck trying to acquire lock(power->lock), but
> > > the other caller is already holding it and won't release it until the worker
> > > completes. And this is where the xe pm annotations helps by basically
> > > introducing a big-dumb-fake-lock to try to model the dependencies. The above
> > > then actually ends up looking like:
> > > 
> > >                            rpm-core worker
> > > lock(power->lock)    |
> > >                       | -> status = RPM_SUSPENDING
> > >                       | -> runtime_suspend(xe)
> > >                       |    map_acquire(pm)
> > >                       |   -> lock(power->lock)
> > >                       |
> > > map_acquire(pm)      |
> > > map_release(pm)      |
> > > pm_get_sync()        |
> > >   -> wait_for_worker  |
> > > 
> > > So what we actually have and what lockdep will easily see as potentially
> > > possible:
> > > 
> > > lock(power->lock) -> map_acquire(pm)
> > > map_acquire(pm) -> lock(power->lock)
> > > 
> > > Which is now a simple locking inversion with A -> B, B -> A. But this is
> > > actually a bit silly example with lock(power->lock) since lockdep will see
> > > the simple A -> A, but point is there there might exist other locks that are
> > > only taken in the suspend callback, for example, and since suspend is
> > > usually always async and done from the rpm core worker I don't think lockdep
> > > will see the potential deadlocks without the xe pm annotations (comes back
> > > to the hidden wait_for_worker dependency).
> > > 
> > > The other thing worth mentioning is that all pm_get_sync() calls are assumed
> > > to be capable of waking up the device as per the xe pm annotations. The
> > > advantage is that we don't need to hit the full wake-up-the-entire-device
> > > slow path for every caller in a real run (probably not possible in single CI
> > > run). We instead just need to hit both pm callbacks once in a given CI run
> > > (very easy), to record the map_acquire(pm) -> locks-in-pm-callbacks
> > > dependencies. And then so long as we also hit every pm_get_sync() call site,
> > > which now doesn't need to actually wake the device up for real, we also then
> > > get the locks-held-when-waking-up-device -> map_acquire(pm), which should be
> > > enough for lockdep to find any clear locking inversions, like the above.
> > > With that we can have pretty high confidence we don't have any potential
> > > deadlocks. The disadvantage is potential false positives (like maybe in this
> > > patch), but when you consider that nasty A -> B, B -> A example, I think it
> > > is probably worth it IMO.
> > > 
> > > Also a good read here:
> > > https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > 
> > yeap, I have read that entire series more than once. I would never challenge
> > the lockdep itself.
> > 
> > My challenge here is with our annotation. If that is a so problematic case,
> > perhaps we should then try to convince the linux core kernel folks to get
> > this annotation inside the runtime pm calls itself?
> > and likely under the power->lock?
> > 
> > Our annotation is very good for the various memory handling cases where
> > we get the memory locks upfront and then the inner get_sync calls getting
> > the same locks would certainly cause the deadlocks mentioned above.
> > 
> > > 
> > > > 
> > > > > 
> > > > > If we are saying that it is impossible to actually wake up the device in
> > > > > this particular case then can we rather make caller use _noresume() or
> > > > > ifactive()?
> > > > 
> > > > I'm trying to avoid touching the i915-display runtime-pm code. :/
> > > > 
> > > > At some point I even thought about making all the i915-display bogus on xe
> > > > and making the runtime_pm idle to check for display connected, but there
> > > > are so many cases where the code take different decisions if runtime_pm
> > > > is in-use vs not that it would complicate things a bit anyway.
> > > > 
> > > > > 
> > > > > > 
> > > > > > Also worth to mention that on i915, intel_display_power_put_async_work
> > > > > > also gets and resume synchronously and the runtime pm get/put
> > > > > > also resets the irq and that code was never problematic.
> > > > > > 
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
> > > > > >     1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > index b534a194a9ef..919250e38ae0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > @@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > > > > >     			goto out;
> > > > > >     	}
> > > > > > +	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > > >     	xe_irq_suspend(xe);
> > > > > > +	xe_pm_write_callback_task(xe, NULL);
> > > > > > +	return 0;
> > > > > >     out:
> > > > > >     	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > > > >     	xe_pm_write_callback_task(xe, NULL);
> > > > > > @@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > > >     	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > > > > >     	xe_pm_write_callback_task(xe, current);
> > > > > > +	xe_irq_resume(xe);
> > > > > > +
> > > > > >     	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > > > >     	/*
> > > > > > @@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > > >     			goto out;
> > > > > >     	}
> > > > > > -	xe_irq_resume(xe);
> > > > > > -
> > > > > >     	for_each_gt(gt, xe, id)
> > > > > >     		xe_gt_resume(gt);
