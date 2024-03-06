Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C57C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 17:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DB910F2FE;
	Wed,  6 Mar 2024 17:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYBo790u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D0810E5F7
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709747366; x=1741283366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=06AjpMCB/hKJaWJ2/IQJWwnW3sMAXBOOwWH3TBya0oM=;
 b=AYBo790u42JhKz0oRkR3IW2bYaUG83jj8Iewwltz0MHNVCh25ThqYoQC
 vlYu9hA81liLlL32YPNVVGxEXe/smV82kr13L6G5Z8lesqeh0eHYkKxtQ
 UyPYohAVZkkvL0YnnkKjLe5UQ/Ilk34mF3IYUxrEopRrSC4QYAcPXQJ8W
 P5J1AbVe1wz8PaKXPwFa+VY1D/jiiNGwyEWIwSZThyKxPv5YlY/8Pi2R6
 HlAzW3FTknwkB+bGbGBV+XCkskEePdlGrKMyo1JrM5y4XVUYGoqR8ZczR
 YglC66AZbPZnb7FU/nlOMdSJBwl00ERpy1cplxAKbjU1YVwpsEi9AvzFe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4224190"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4224190"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 09:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="32974212"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 09:49:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 09:49:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 09:49:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 09:49:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 09:49:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0oIJ6ytZgcDaP9Wp2Du3zWyYJdV4p5IiA4WzY0XYFDzPc+lhQ8wyeVmH/poEqHvzi0LOMbnrCG7KMQ1HYUTqamo9aI4fZEb2haQ8Sdiilmo2JGzjM54WbCZFTAuJaruSlnkIfhVHvHLpn+mkDoJ1hRC7TdGD2YHgK5nO3Vc3rY83wo6gRNFThcU7VoA/Iop+c0wduYG1LvKVo1q31erTevpgdSPw33pyqZvtKxkjVMZbkMg+zAtqBmZ9H3G19gwqvBfVxEVr2BrziFOldwr3F1djinI1f1lfyAydXaOZk311Ch/joDRFTvWd4hbJ+PcuhaFoVGSAvuUhPMgPleS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GvtdOx4KsRx3kMCe6j+0qXL2ZMtD1G1FWt4up5r6Ss=;
 b=NCtq93qngXWAoN/E5AcMzVP0xxFWcyjvwKDmdvCaGoVxNf29A9r2UNI41Q0e8kSZOYDytOaGS0krFAJ3YugEH010UPaqniJC2AqHGnp+qX2DjNWgCNbQgDDYbVZp16A4waXL1yTQc5e3FvERTZnIM1+nvN9i1cz7QEhNtThI1zl/k3As1vbbEmEURdl0BWFxs7NBU9g817a1izelebheQguajHKzyK1iIOxyc4PQ83T8VJZ+6XD8Z5sP6MucxWukQnWYj8QSOLVF9N9Q40QjcM3IKbxxo8uE14TIXt6I8+scqqzh8Lgge6DUI5FVIAIPkkROyucbG1oN311zhEmoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7100.namprd11.prod.outlook.com (2603:10b6:510:20f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 17:49:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 17:49:20 +0000
Date: Wed, 6 Mar 2024 12:49:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out
 of lockdep
Message-ID: <ZeisnaCxdBOTy93t@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-4-rodrigo.vivi@intel.com>
 <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com>
 <ZeegmIhyBz5aCwcm@intel.com>
 <efcfb623-3e2d-4a4a-bc79-b14b712f204c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <efcfb623-3e2d-4a4a-bc79-b14b712f204c@intel.com>
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: d7fa3435-7df0-4864-6440-08dc3e05c098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUSuZObhxbhI7SfkH+5ARYNOsy7Dk/vGRgJs0c9cLAXAoFFStymCuHr3y+bzI0xGtPPLjm40zzlRZqlL3oyaGFVD4JWHNZToTwxJG0MqstRKufBEIuVaprTdEOWCEpIXREDiIQORX+GnOp2OnIi+ZfZgFZ9UzfQk2F4I8XVRy9M85mGtSI7LqivrP3U5RH10OLUgLHi2c5izgdyUCnNeeSVMysKfkDQM5PsKt4nT6nwxqU+B2/Movwz3L8O86qnH2dtxUiygBTKcPuqxmlY2myAIjR223hREKMbDdn2WHoDu4L1aroo5iJRWlOpMazvo0yxbCTGgXku9A+uOO6PeBQTrKvsEnAHshWx3lsx0Ffgh+6VThjLIv17jbQQFeDo5H8g8J0zDs6ZnHgjMtd8bWeQjchnKnsXz8ds3p/iXZ4mInCzrg4esicmiR4V82C2uCuMlhia7Lc+GYNHDiIdmxXhi1BIyruGxVZ+Pj6wPsp0HlCBQX8eOJzqDUhcEn1D1gpI2SvfmwskuqOYnxw8ett010Es8d4OXqyOn/DD5s7ObsTn9/xFd5B5fcJNAf73j20zR/Rg0iKBUOGeylZWfZCFyF8pn1d7g/GnFX8CqXHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u+tCtChbQ104V1MHvSJgi/2f4JO5ajozy7NjMU0Ps8uJprZcGXekd/4FPc9d?=
 =?us-ascii?Q?fWdak5wy4Cw820UFPgz4KkpF1OR11ARA+QZT9aGQ//eXjosR5257hnepTIER?=
 =?us-ascii?Q?jNNlDVkOWpdNT0/sp+MxK9d8+7LY7J3TL3mZDB0GQj5XCfbynYSjruK7GbGg?=
 =?us-ascii?Q?pQYAVHihzP7FFg0ZcDlLnDNYwuao2q2aD5uwVQo5rOxD56DOqzpxpDqgOAM3?=
 =?us-ascii?Q?Q3tNHpqYSi4k+UwA6YIkcscxGL/JVGtcZPSoFEZEBlapBLCWSCoPVdU72160?=
 =?us-ascii?Q?e8wLzRNiM/eqykcbTywJSU9DUE0jlEziHEZCHVfNylNZ9UbuZrdBsn5QCNSS?=
 =?us-ascii?Q?77GD6Nom+4X6YrBVIfeQX5NRE5gzq3fgHuOMGzpxb9mpx6nX5Wp4roUKL0MM?=
 =?us-ascii?Q?B9JgBmW2nZLiXROewDi6UFcxpBPJdLvcZ0bHnzzpNc5UQBM7eASjJDoP5FWa?=
 =?us-ascii?Q?Dj5dZ+C2Bmq+fQ3UQPkzD0AUqZeH+TROlcjo/4OQQ+zwicRsq5N6eWN9U/mD?=
 =?us-ascii?Q?TRYuyLwFbU30Jn7Yd51h0pZt/Trd6COmiFlPTira7VtKEy3JHx+jeUTWrZq2?=
 =?us-ascii?Q?j3YIBVLDax8VUL50CGa7+yVqrww5t1EUs9Zf34C4tBniRnroWo/91zryJYZn?=
 =?us-ascii?Q?4fXI/07473gZmeA9b9B+SvqeV/Ot6xQ64CfvuYAzJjesEBzdT5EzH5bFcaa5?=
 =?us-ascii?Q?nCCC1LJoaa0dZOmXZWJImtTc+8bveUc19f6pBmJsLcWeKkM1Cd4aBjPzgdpt?=
 =?us-ascii?Q?5AmFLbMLPwydb4h2+1TNrmO6p6MBbrOnin7KCnRQ6WY+KB8VQjoT3h1cXhjF?=
 =?us-ascii?Q?FByxUp/kfESW0nDVyHr2HWcVhMo2tK9gHgxwU3/XhRAnMTo42Fts6c2h/RQk?=
 =?us-ascii?Q?8R7QVdHM8iwTceLYvblHE6ESb7c92Fe0li/v3WBr7oVU2Y9I80C9AT598SDl?=
 =?us-ascii?Q?9fTzz/yAyilsN5WUoQtxU2iIl8piMBcdJzt6WfqShjW0diB1ddkFP6td1WGp?=
 =?us-ascii?Q?1b7s36ukNcSS48ushezwgvEhMCYpD5eGIgvmw4MgrPKZouHVQ/qLSqbf4OQP?=
 =?us-ascii?Q?+GFfhp/9mWtfZ7IAxjrCkGMOk4rTQHSERwLZzJvxuqukC8/yGei9WP38DADj?=
 =?us-ascii?Q?nEY5/8dPygDxntgLziTDU9sOgusiRxsD5R6qZLS3Yuxt/8VTFQIaqAfUJ2Ou?=
 =?us-ascii?Q?Z/8/7/hVk+lF7mLyjRx2VnOVeek9gT0jFkOf2pRBNqV1D+THjouwKS05rCK3?=
 =?us-ascii?Q?NSVkGHM936OfY9MyhG2xAQq0qP1dXVovhk+KIRS/YSYNvFHDDcSlMmh0Wsus?=
 =?us-ascii?Q?cG/OLapsrRX9X1H/Qmby17YtS5IlpXtywv2xB2a4SeJzzqgPUtFGy+0fSbNs?=
 =?us-ascii?Q?kUmVtomihmRgixr+fFXTgvONJtWRudR+YcO3VcjC8gdxbjMbaojqftSE/mPS?=
 =?us-ascii?Q?CkO5giq6xFx/S1keABGpnV/qcUnv9qAmSsHpINx0lr4hScEwllVpsZsBPTf+?=
 =?us-ascii?Q?g6Ukhv8lJpuHKZaEqyCiFAz6fGEMD70/szkR92MqpL8yjlemgscfhjfXH9wL?=
 =?us-ascii?Q?fF+tadh9Bl3ZEqA0CZDBAT7hALXBMbWOCf3Vc+19Td7QCWarE3qkb8q2ESpQ?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fa3435-7df0-4864-6440-08dc3e05c098
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:49:20.8809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJy2z3SUSyh3UZHKJp5IkAp683mj/Yx+rma0vcxaa4IfF4FCeDV3YFzaeXk9I3tnY2pgoontNhY5PYYr9VQR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7100
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

On Wed, Mar 06, 2024 at 04:04:45PM +0000, Matthew Auld wrote:
> On 05/03/2024 22:45, Rodrigo Vivi wrote:
> > On Tue, Mar 05, 2024 at 11:07:37AM +0000, Matthew Auld wrote:
> > > On 04/03/2024 18:21, Rodrigo Vivi wrote:
> > > > Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
> > > > the sync resume calls lockdep is saying:
> > > > 
> > > >    Possible unsafe locking scenario:
> > > > 
> > > >          CPU0                    CPU1
> > > >          ----                    ----
> > > >     lock(xe_pm_runtime_lockdep_map);
> > > >                                  lock(&power_domains->lock);
> > > >                                  lock(xe_pm_runtime_lockdep_map);
> > > >     lock(&power_domains->lock);
> > > > 
> > > > -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> > > >          xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
> > > >          release_async_put_domains+0x26/0xa0 [xe]
> > > >          intel_display_power_put_async_work+0xcb/0x1f0 [xe]
> > > > 
> > > > -> #0 (&power_domains->lock){+.+.}-{4:4}:
> > > >          __lock_acquire+0x3259/0x62c0
> > > >          lock_acquire+0x19b/0x4c0
> > > >          __mutex_lock+0x16b/0x1a10
> > > >          intel_display_power_is_enabled+0x1f/0x40 [xe]
> > > >          gen11_display_irq_reset+0x1f2/0xcc0 [xe]
> > > >          xe_irq_reset+0x43d/0x1cb0 [xe]
> > > >          xe_irq_resume+0x52/0x660 [xe]
> > > >          xe_pm_runtime_resume+0x7d/0xdc0 [xe
> > > > 
> > > > This is likely a false positive.
> > > > 
> > > > This lockdep is created to protect races from the inner callers
> > > 
> > > There is no real lock here so it doesn't protect anything AFAIK. It is just
> > > about mapping the hidden dependencies between locks held when waking up the
> > > device and locks acquired in the resume and suspend callbacks.
> > 
> > indeed a bad phrase. something like
> > 'This lockdep is created to warn us if we are at risk of introducing inner callers"
> > would make it better?
> 
> Yeah, or maybe something like:
> 
> "The lockdep annotations will warn if any lock held when potentially waking
> up the device, can also be acquired in either of the resume or suspend pm
> callbacks".
> 
> ?
> 
> > 
> > > 
> > > > of get-and-resume-sync that are within holding various memory access locks
> > > > with the resume and suspend itself that can also be trying to grab these
> > > > memory access locks.
> > > > 
> > > > This is not the case here, for sure. The &power_domains->lock seems to be
> > > > sufficient to protect any race and there's no counter part to get deadlocked
> > > > with.
> > > 
> > > What is meant by "race" here? The lockdep splat is saying that one or both
> > > of the resume or suspend callbacks is grabbing some lock, but that same lock
> > > is also held when potentially waking up the device. From lockdep POV that is
> > > a potential deadlock.
> > 
> > The lock is &power_domains->lock only, that could be grabbed at both suspend
> > and resume. But even though we are not trusting that only one of the operations
> > can help simultaneously, what are the other lock that could be possibly be
> > hold in a way to cause this theoretical deadlock?
> 
> I don't think there needs to be another lock here to deadlock. Also it
> should be completely fine that both the resume and suspend callbacks acquire
> that same lock. The issue is only when you are holding that same lock and
> then try to wake up the device synchronously. If that can actually happen we
> can hit deadlocks.
> 
> Simplest example would be A -> A deadlock:
> 
> lock(power->lock)
> pm_get_sync()
>    -> runtime_resume(xe)
>      -> lock(power->lock)

this case is impossible with power_domains->lock because the get_sync
is never called from inside a power_domains locked area.

> 
> A more nasty example with A -> B, B -> A deadlock (where did B come
> from???):
> 
>                           rpm-core worker
> lock(power->lock)    |
>                      | -> status = RPM_SUSPENDING
>                      | -> runtime_suspend(xe)
>                      |   -> lock(power->lock)
> pm_get_sync()        |
>   -> wait_for_worker |

again, this case is also impossible because the get_sync is never
called from inside the power_domains locked area. On both sides that
is called just from inner portions of the work and then it would be okay.

As every other current i915-display rpm handling.

> 
> The wait_for_worker is the waitqueue dance where it sees that runtime_status
> is RPM_SUSPENDING or RPM_RESUMING and then goes to sleep until the status
> changes to RPM_SUSPENDED or RPM_RESUMED. Once the worker completes it then
> wakes up the sleeper. But that wait_for_worker thing creates a dependency
> underneath. But here that wait dependency is hidden from lockdep AFAICT,
> since there is no actual lock acquisition happening. There is exactly one
> lock and two different contexts acquiring it, seems totally fine, so from
> lock acquisition pov there is no issue.
> 
> And yet it still deadlocks, since the rpm-core worker (or whatever is
> running the async suspend) is stuck trying to acquire lock(power->lock), but
> the other caller is already holding it and won't release it until the worker
> completes. And this is where the xe pm annotations helps by basically
> introducing a big-dumb-fake-lock to try to model the dependencies. The above
> then actually ends up looking like:
> 
>                           rpm-core worker
> lock(power->lock)    |
>                      | -> status = RPM_SUSPENDING
>                      | -> runtime_suspend(xe)
>                      |    map_acquire(pm)
>                      |   -> lock(power->lock)
>                      |
> map_acquire(pm)      |
> map_release(pm)      |
> pm_get_sync()        |
>  -> wait_for_worker  |
> 
> So what we actually have and what lockdep will easily see as potentially
> possible:
> 
> lock(power->lock) -> map_acquire(pm)
> map_acquire(pm) -> lock(power->lock)
> 
> Which is now a simple locking inversion with A -> B, B -> A. But this is
> actually a bit silly example with lock(power->lock) since lockdep will see
> the simple A -> A, but point is there there might exist other locks that are
> only taken in the suspend callback, for example, and since suspend is
> usually always async and done from the rpm core worker I don't think lockdep
> will see the potential deadlocks without the xe pm annotations (comes back
> to the hidden wait_for_worker dependency).
> 
> The other thing worth mentioning is that all pm_get_sync() calls are assumed
> to be capable of waking up the device as per the xe pm annotations. The
> advantage is that we don't need to hit the full wake-up-the-entire-device
> slow path for every caller in a real run (probably not possible in single CI
> run). We instead just need to hit both pm callbacks once in a given CI run
> (very easy), to record the map_acquire(pm) -> locks-in-pm-callbacks
> dependencies. And then so long as we also hit every pm_get_sync() call site,
> which now doesn't need to actually wake the device up for real, we also then
> get the locks-held-when-waking-up-device -> map_acquire(pm), which should be
> enough for lockdep to find any clear locking inversions, like the above.
> With that we can have pretty high confidence we don't have any potential
> deadlocks. The disadvantage is potential false positives (like maybe in this
> patch), but when you consider that nasty A -> B, B -> A example, I think it
> is probably worth it IMO.
> 
> Also a good read here:
> https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

yeap, I have read that entire series more than once. I would never challenge
the lockdep itself.

My challenge here is with our annotation. If that is a so problematic case,
perhaps we should then try to convince the linux core kernel folks to get
this annotation inside the runtime pm calls itself?
and likely under the power->lock?

Our annotation is very good for the various memory handling cases where
we get the memory locks upfront and then the inner get_sync calls getting
the same locks would certainly cause the deadlocks mentioned above.

> 
> > 
> > > 
> > > If we are saying that it is impossible to actually wake up the device in
> > > this particular case then can we rather make caller use _noresume() or
> > > ifactive()?
> > 
> > I'm trying to avoid touching the i915-display runtime-pm code. :/
> > 
> > At some point I even thought about making all the i915-display bogus on xe
> > and making the runtime_pm idle to check for display connected, but there
> > are so many cases where the code take different decisions if runtime_pm
> > is in-use vs not that it would complicate things a bit anyway.
> > 
> > > 
> > > > 
> > > > Also worth to mention that on i915, intel_display_power_put_async_work
> > > > also gets and resume synchronously and the runtime pm get/put
> > > > also resets the irq and that code was never problematic.
> > > > 
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
> > > >    1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index b534a194a9ef..919250e38ae0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> > > >    			goto out;
> > > >    	}
> > > > +	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > >    	xe_irq_suspend(xe);
> > > > +	xe_pm_write_callback_task(xe, NULL);
> > > > +	return 0;
> > > >    out:
> > > >    	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > >    	xe_pm_write_callback_task(xe, NULL);
> > > > @@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >    	/* Disable access_ongoing asserts and prevent recursive pm calls */
> > > >    	xe_pm_write_callback_task(xe, current);
> > > > +	xe_irq_resume(xe);
> > > > +
> > > >    	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > >    	/*
> > > > @@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >    			goto out;
> > > >    	}
> > > > -	xe_irq_resume(xe);
> > > > -
> > > >    	for_each_gt(gt, xe, id)
> > > >    		xe_gt_resume(gt);
