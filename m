Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D9CC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 20:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8430010F691;
	Thu,  9 Jul 2026 20:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8WbsaWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C1B10F691
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783629661; x=1815165661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EZBaMQo3rSdmWl7Qnp07J7I2qavGjG83yHotZc/+DE0=;
 b=A8WbsaWnD2L2V2prBnUbfTmhwTb00EdXH5jJfo9lYoQv5rCDJvvL3sjt
 s/NapEzU06NT28tCi35+DfqPzbiq0V46nDUxPPe0H7pXaurnBJ/VE2UqT
 rPk6fbL9d6+0BA+2+3SMxV126rhl/jtYAGg7iWuEKFuF9MO5hqgztdKV9
 /6OP0CI3zmp7ikuBPoWKkhpG/xU3hocNL6Co1kmm2mpvuPWHk+wYUN7eb
 AqwQAKHmG+A2/of3I/80C8nJLRqkSfVzjs6xmtdsEA31U8VlP46K67rSO
 V12OLNs/NosnImyjU53hSwNFTeqweCGcJEgt3SHjcNI9ta1ouQSqmYmIj A==;
X-CSE-ConnectionGUID: isBXnOxpTXCN/RfQPwU4Ng==
X-CSE-MsgGUID: QBasOWnXQXC8ZTTzAvO9SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101876906"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101876906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:41:01 -0700
X-CSE-ConnectionGUID: z32VwbvTR+ibv0wgoqB7KQ==
X-CSE-MsgGUID: UWqkNSG8SYefgWPBbJIe+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259599579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 13:41:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:41:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 13:41:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 13:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJcxL+L4O5w2T+H/ThsJoNXw2mTKWs5O/kcitrgoIUob0+/DAZu7+4J3u6guRIOPvMlto94y+4hqywC5s86+cP1c75a5bVKnP5cN97zeqcagdwVkuhANHw3EEPgJr5H/w+a92oVeNDizI5Zkas00pTlu63NYLfLF4+fEBhhAt16guwMTwJxrlAMsxsGN9iuXCVsXAEaaeZtfXkFk45I7dfmvT0f+w13YCtvvJ4PD0He2SRmOYSgjgbcawY3Ct8XlthJqxNFFHjje1xpIcPwbTR4U6wwh7ldCNwDxCFZTQT4vP5C1z6eueY4lrDN5OlRuoSLOC7FkJoFhBtjG4Xyf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BekQyb3TxxhxcpjB8wTPF1ypXvRNGqJMKPCZBR1Ag44=;
 b=VhiE/wZlCfhh4XUko6pg2awfaoVJ8KX68ZySZIzQmtn0LORZ3yb/MZWAmi6XoxCXC64oWGWD0D/82Ify5lFBz+KSo3Bhwp1p1Hq4XUyU1aK/xfc3JU0nUaIXleoBhax8fDJMbDgf7lHj/+wVCqEWnyt5aJZJeW8/Jn51qiAJHAnHToFKTrW/EoXCTE3BbBCIpOz6c5qElVqnT8XeUyk2DZlVkrhURpI8z7qepH8E3WKBmRyxisghoz7tL+ozpjVEqI8Jp3dvuvmeqjWg9HRQEg2dnGpNc9aLuwYFnqx1K5p6l4jD4gaWmsqvmKq6NalmFntlfQfP9epWM2Fj+z1KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6359.namprd11.prod.outlook.com (2603:10b6:8:b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 20:40:55 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 20:40:55 +0000
Date: Thu, 9 Jul 2026 13:40:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/guc: wait killably for suspend and ban
 queue on timeout
Message-ID: <alAHUXLtmyjcuQbq@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
 <alAGPmGuKrIXN23Z@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alAGPmGuKrIXN23Z@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e751b1-5a12-45e7-6156-08deddfa5e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2lfWpQTApJWhKfnP1ZgMOu0A+erqlXrjSax9FFJFtk3y/LeURizLsiB3wOtE6A7Xj/IjQYiKJT4AhV25oO0Q0tjBkZ+r9ZIiyDoObwvX3uY4Pvu6mSRr9IzdltCtwdVh0Qq46rIOKFucXOdNNiov+sYm0JQTjRZD4p4MToeSnIKupqPPBwNrb1p2synl/dAqTu1SDTr/ZKFos1dyPJGEISP/6pkWNezkxE2yd1HKGFEILRhVmKP5mfnkofArgvqz/kz1hkeRhbzhshH/8Z0nSIcwY26WHGG4zzwyEzKuUMtMW6ZIbN64TfcuEZjYzi+pvnApVNe8kyw3YnIhISkE4h9ZafmXKnewQDSkRWS5a2Jn+KrXS1YpUQoZ3/9eMvrV8sjaLLrz6pyvJhyPj3sV6I5UkTZ+SVX9yADjxns+LxT/K7AuexPQY3Q4J2DzyXU20kqhCo4w8Xz/JyAQG3CM4P9RJnzeupl4bDfAE0eOZb1aYNvBf2oiHjCSaKAXsxzyFQm/tn8aMFqqQKwf9Jso47vm73Ws1lTBuuYrrrZ3TM1bRH06lRI7Wo3jjBRDzZYnq0cKJLwuerb2ZOK0ExSAW89ze/OMhiNV08tYwFWkfRnJXBGZBDbcTu0ijqZXS33HCVoU1tzmNpn8D341XM627g5Hx0ARWs3K1HwUpnXfx60=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HsCP3d4yvEZKE77oWNixfu1n+twifBixt4hpPAoDejqzajjkO9WkgEoGamcq?=
 =?us-ascii?Q?yl30b+yYpeB0rhbHMEAWshc1368fOxkpHlyp23dUCakgAU8TSvE00zRwIV+0?=
 =?us-ascii?Q?MX9AKHrLqYShwL/bSCszXu25VtzhO4lMkVgxajdgn+UnaB7+h8FcHELCyv11?=
 =?us-ascii?Q?QZkZTQo7CCJsOP3QzOMAKm3AJEtH0iPLK7jUu3shdvG15w/Ue0Z/6XvJHI8/?=
 =?us-ascii?Q?3CIl9guqNRPSg/ORahDOe4vPd/tTbouh4u0MmzLTn2NFYBBOgiCzdkZbc18k?=
 =?us-ascii?Q?q/wUpA53AGd5jP81oTft9w074oyD4j8Vj8ClZpqDQ73rYIpw51FcUocWLU03?=
 =?us-ascii?Q?0o3E8LsYtQgs3LkZUJwwyLmcoVBurkDzQ7VslrWv/Efc0nR0OKrPnJ7T3/Ez?=
 =?us-ascii?Q?vTla/xdMkMcKkBcMSdYOW4m2ET12S+c9y6Iy7lGBeFS9rnaAkMRuzRS4NVJi?=
 =?us-ascii?Q?nHk0eDSHilCQgWOpu1HO4H7W/Df5XaWyggZDIVzjvVvfqYxUXsZ3Y2WZlluo?=
 =?us-ascii?Q?jVg07XbiuYMtTFbCQx14BVJjaKQSyO9WwHgwYu/Jm30fDFJvwaRM+Ki9Mnii?=
 =?us-ascii?Q?Bg6xqKMLtTKAm+SyihRlU4rFCTj84lpy1N4DOcItIZJ9qTWk8JIFDEddJqR7?=
 =?us-ascii?Q?eufd+OSLJlM3HcnuL1uabFQURIobZLFV6Zzq/s2pRNHJOnxsUOZYXQW4SM/Y?=
 =?us-ascii?Q?jBQrAxMpPu9VrVVLkuv54YDwQVumPYkY01UA0GTcSzvMU2Ii+FNu0Bw1bOyx?=
 =?us-ascii?Q?AExBnrabqG2TlqL9tIQAuaV/GmErsxmQZhgrIIyODQ2fUFG/L4UVL+7cZ97H?=
 =?us-ascii?Q?Amu5ICIYpgVyYRJG9qsjGboJ+mgjYcAlyAju3JNydgypue9drXdlGWdM8ozx?=
 =?us-ascii?Q?jcWbmpOV4yCm+Rfem3Np0tT7xpvoFTHVaEVM+gnH3D2JAHRUgGOGSEq99d9Y?=
 =?us-ascii?Q?j5qbHqAzWeh1MjdvAPzx2gU+1F/ZKqYExO+/x27A0NhQ9kV+aWItxlmiIlnQ?=
 =?us-ascii?Q?rZ3rL14gCgJEVL8d7u6MUCPDA/YIoq55hY4+K+ctoSsFWEX04in3GspWyjwb?=
 =?us-ascii?Q?A61pgQftuWFMwGxyN8xGeUnTif6IKaoQXfE5mySG6yDV2oMhWkYD9uZVC+W+?=
 =?us-ascii?Q?djMCDSKXjq8PY67fVaGxuMbnzpW2GqRItGznsZudyw+okjwviXIkDAEww2TG?=
 =?us-ascii?Q?7EA5jlcQD1x2RRg3pgPaV2vzaMXhgfSd/I5e3PhhYAEwyaYH74U02Jho1VzY?=
 =?us-ascii?Q?HSLrip3G3fS5ZI3jw9rxk/esKXosjLgLX9AhlnQzRhEK9JVwkKR0pmeTxlva?=
 =?us-ascii?Q?FlfXdaKGhxla2emaOS6WHsLzNTtwBHw5kjbU4O5F0QOv7A/AYWyTlSFVUnbg?=
 =?us-ascii?Q?uy88o4kOciyvuQOFJ+RgH8EqejEovy7VAaVnhhDK53mguIKgBqneuEl+PnZN?=
 =?us-ascii?Q?pyWdPqR04hmX0aM0vVxc55crEBBvc8B+Y43c0o6RWh/dZQXosmhRAgtJaofn?=
 =?us-ascii?Q?ADoXGuLNXm7EnMkiAVclEGHqZQwzDGAMtIjJ9idgimnJFdTlRxQR/TbttjpR?=
 =?us-ascii?Q?HP6obHRjpYI2QJ4uMJISBzlmwWTKZlL8D1SGgzmhMoOISdPJUtEZD206Qi+I?=
 =?us-ascii?Q?abW70tlOB9q737ca4AgdMTl00ciEN+Qr8fGEFeJQcoA2CPn0kWulFFHaCfzy?=
 =?us-ascii?Q?xZ2ManNTLxuaHfiPx91oBs402wwccxwYEOGZTXSegpURXCoC4LrWw2v9vYhp?=
 =?us-ascii?Q?mpgelyrZGeE16YQGLY96gCTaLdHC6sw=3D?=
X-Exchange-RoutingPolicyChecked: cTvZuU3TzXEd/wZzztq4AXMx0zSeylP2OOdUuv2GdP3+3/lIUa1kts8pExZDgZs+ZE1mnZsBhQQegZpnYJqCoo+APKPfDPuCOxu+Kp3F/0CCB1/4KpjeyvbYUqqt4BO/yS66Vy0IkJns8xPemfhrCwfu4d4hYDr47/5wbgwPczeJbQAbW12X0PIMU3vijPeyrlmnPccPlhhTr8RON0p2HgzLHIVU2tzf2nFJMN+1paX6TiOyqgdlW6UFq1VFkrKHBOHZnSJ8xoBnczuJFZrQnVIs+EWD6QC+L6GjjmD3cYsl/x040HAt/yvyjXkPTolRZip5gKY0Jl7QKRtQ+nKang==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e751b1-5a12-45e7-6156-08deddfa5e91
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:40:54.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3NOqGprY7p9ipHIur/PAD0iasUzReH+dII8Rb4uYWSMhRUn+hklaSnKfZviZ/y+FWWKwqOJUd6wU1+N8ylAQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6359
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

On Thu, Jul 09, 2026 at 01:36:14PM -0700, Matthew Brost wrote:


> On Tue, Jun 30, 2026 at 10:07:31PM -0700, Niranjana Vishwanathapura wrote:
> > Harden guc_exec_queue_suspend_wait():
> > 
> >  - Wait killably rather than interruptibly. Once a suspend has been
> >    issued it must be waited to completion (or timeout); an arbitrary
> >    non-fatal signal must not abandon an in-flight suspend, otherwise the
> >    wait reports a spurious failure while the suspend is still pending.
> >    Only a fatal signal aborts, in which case the dying task tears the
> >    queue down (clearing suspend_pending), so no stuck state persists.
> > 
> >  - On timeout, ban the queue and trigger cleanup rather than leaving it
> >    suspended forever. Clearing suspend_pending via __suspend_fence_signal()
> >    lets a subsequent resume() proceed without tripping the
> >    !suspend_pending assert.
> > 
> > v2: Add comment about -ERESTARTSYS in suspend_wait
> > 
> 
> This doesn't actually help per my comments in patch #2 given sigkill on
> one process doesn't mean another processes queues are being torn down.
> 
> I'd drop this patch as I dont see this buying us anything.
> 
> Matt
> 

Sorry typing too fast... More below.

> > Assisted-by: Github-Copilot:Claude-opus-4.8
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 39 ++++++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9458bf477fa6..3d9bdc22c89f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  	 xe_guc_read_stopped(guc))
> >  
> >  retry:
> > +	/*
> > +	 * Wait killably rather than interruptibly: once a suspend has been
> > +	 * issued it must be waited to completion (or timeout), otherwise an
> > +	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
> > +	 * the wait would report a spurious failure while suspend_pending is
> > +	 * still set. Only a fatal signal aborts here; in that case the dying
> > +	 * task tears the queue down (clearing suspend_pending), so no stuck
> > +	 * state persists.
> > +	 */
> >  	if (IS_SRIOV_VF(xe))
> > -		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> > -						       vf_recovery(guc),
> > -						       HZ * 5);
> > +		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
> > +						  vf_recovery(guc), HZ * 5);
> >  	else
> > -		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > -						       WAIT_COND, HZ * 5);
> > +		ret = wait_event_killable_timeout(q->guc->suspend_wait,
> > +						  WAIT_COND, HZ * 5);

Drop this part.

> >  
> >  	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> >  		return -EAGAIN;
> >  
> >  	if (!ret) {
> >  		xe_gt_warn(guc_to_gt(guc),
> > -			   "Suspend fence, guc_id=%d, failed to respond",
> > +			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
> >  			   q->guc->id);
> > -		/* XXX: Trigger GT reset? */
> > +		/*
> > +		 * The GuC failed to respond to the suspend within the timeout.
> > +		 * This is not recoverable for this context, so ban it rather
> > +		 * than leave it suspended forever (unmarked). Clearing
> > +		 * suspend_pending lets a subsequent resume() proceed without
> > +		 * tripping the !suspend_pending assert (the RESUME message is
> > +		 * dropped for a banned queue), and triggering cleanup tears the
> > +		 * context down.
> > +		 */
> > +		set_exec_queue_banned(q);
> > +		__suspend_fence_signal(q);
> > +		xe_guc_exec_queue_trigger_cleanup(q);

This part mostly looks good but __suspend_fence_signal should actually
be signaled in the TDR after queue is off the hardware as without that
we could get a memory corruption signaling suspend fence early while the
hardware could possibly be touching memory.

guc_exec_queue_kill has the same bug which should also be fixed.

Matt 

> >  		return -ETIME;
> >  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
> >  		/* Corner case on RESFIX DONE where vf_recovery() changes */
> > @@ -2219,6 +2238,12 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> >  
> >  #undef WAIT_COND
> >  
> > +	/*
> > +	 * ret < 0 (-ERESTARTSYS): aborted by a fatal signal. The queue is not
> > +	 * banned - the failure is in the waiter, not the queue. The suspend is
> > +	 * not confirmed complete, so suspend_pending may still be set; callers
> > +	 * must not resume() on this error without re-confirming the suspend.
> > +	 */
> >  	return ret < 0 ? ret : 0;
> >  }
> >  
> > -- 
> > 2.43.0
> > 
