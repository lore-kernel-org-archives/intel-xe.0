Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D77106ACDD
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 19:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA010EA9C;
	Thu, 12 Mar 2026 19:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9nEOg2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FC910EAA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773342833; x=1804878833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8h+OX8+7WjMVY1lecmaFKiDhr4yIa+SWDsgMa+HPnU8=;
 b=l9nEOg2BKR0AvejaSQby5JysTLpXCUu3JvQiMPf1j6phFaUmm9Pvf/4f
 AjVDoYdsQQcO9XiMZd5FR/Rjss43XE7Ek4okj8siTbH/DIFFwBmdLH6n+
 9ie9X6o6wrKZbAhQsDt+45iY7ZU8fnh9JgqMHG2DbyzoQNfs6MzBzpPGY
 jnu1JapxDWa/15mX9Qb0HeWHmVcXq+uncCxlqseJDNzDYkUXLJKP2ima+
 OEtggz431E16FgYWwLslJOzFU+tHmgom5RDS+kv4/yxKt2SR3QED5Ru/y
 kn7yXwhEbMQnJUutsrBkR6aFImuXowheZgq+TzNc+T6S/9TrnxsThHQ+L Q==;
X-CSE-ConnectionGUID: O1UyR/xnQ7+MWNtJkfxDYA==
X-CSE-MsgGUID: Zvke09TtTiiiAvZXaiIdwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="84767402"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="84767402"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 12:13:52 -0700
X-CSE-ConnectionGUID: Qw05oTPeReKxEZ3Yza7UdQ==
X-CSE-MsgGUID: KDQgifoCQnOgGQSQDSrGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="223342434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 12:13:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 12:13:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 12:13:51 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 12:13:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0om8BZOuhdGjGIr3ShTRxU4CURaSXprAEBFuSLtrVVJ7wWk2XLTD/1EfRJ0FsY8Hxh0m6K7nDfSQCrrcKK/NKkJQVnrXoQVocWleeRD8ZvbS96lLB5+aSIIUAIUXj1IE03Ak5OUsJOUtpqqJ91+iwvhtyyhQ9E+i0DChjVlmn1qtcePomOfiPJuoaAWWt+e3T8aHYORtsvh6w/TRrZWOzMnVkR+HLyDY+NynI4phkklWDrM1JMOcW1aSLYSwW/r4nx1UrRas1C2akKHFbcqKz3VyAJov0oaAKWhwM2MWkKy0mpafcZ0MzcBrM6B278rZ3/KQ9RuaNC/CeyeuzBTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSCVzodvTbaBWdkMnNHXiaJ2qzxCfTGBxmm2jEf8bZU=;
 b=u7vNAvBXdyJkARanjoYA9FTjQh11Bxr9uQtI6vHYq/IbRRJm0hteM7E0YOp1OLYXvl6EpbFWFrQuTrfFBGheS8bCOSsmOvwOg7oKll1YN+taQs/K928u6XBa0WAEmPre4yQY/ZY4MrRHiyafXoqSb5ScMv/ySYJUV2603MRVWujlpHJZNjjWClu/uwjBNKbAjBzYEKcxLZl4+ZzASn7Dett2rpF3XneWYezkb+sa4MBuZ46Df1c+RjhP0bmlMZN3KNaDV2e3M+aZY4u07FMTbzJbtkT7xgC9l2p12PfGLQIinGqnqBsRwQclYJk1ugF4UAX08GAJWiGBebPDgdM/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 19:13:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 19:13:48 +0000
Date: Thu, 12 Mar 2026 12:13:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: always keep track of remap prev/next
Message-ID: <abMQaEF38QvKEpr7@lstrano-desk.jf.intel.com>
References: <20260312134648.286641-2-matthew.auld@intel.com>
 <abMBmZXHwLmAMywS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abMBmZXHwLmAMywS@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c9a663-3b55-4d4e-db68-08de806b7cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: EVMe6i7ockP/upXa1YdfsR9mWu8m1MWUaz4X1FMCgXeYcRHkmb90cfXGyO+W9al10i2kv6QeDaLAmH8b8INjJ29K/q9VZS92msi/bLIFapWBan52ct8ibsO4u7H8yArCCIOwDxAJlw6xQW27XA9p0qpyf+FeJ5Ei4hh1w3uKpM4OyawcWyf22AipThgtxdUQhDuA0geZKXbfah2fKrfwKeKDUAb4YuavbexcIa+yJF1TaR00tf+uGVIfl0tNfkqdrSMt/sZf163mSU/s1DNOw6xbAchNQrbhbZuJWwK3zVbeg5Ad/gwKH11ZisrONZ5T0BnnZWBBZyD8hHs1Rq6Ha4mbsz+ygBDQx9PUingNXAd9HARbpbho7K6Lq/WIexOVSxIH8oBeYoG3InAeaWocYk6nvHSVGt8rWbhzeL6dkn+HnAZz0rbjvco/S51wtEKzC4qfez6+PnIHZ6C1iVDFidFWwh5Ddgw7lRnfJJ+33c1q9UbqdMur/ksoqVr/tlE9jo61Ry1iN8HqxOIwQOA8i4to9i2SUZ7wSeNNAF086y3ijXAEJ2261N7k8bmkXIl0FBnhBlbdghyOWpXdSleeQhlzOgI4CoggJfcp2RyWof4tdCPy8cLuMrL+oLedDAKJWIMKwFx1wawvfwJK36BK6dE75GI/uU3NCcs+onmot6M+0E0+/Ngfe8msLj0y3ssL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6zOxTVEerrU3EEq9pWk6CPWRfoWa6lKdkTSR9S3SDUx5tLdWtLhrAYP/yw8S?=
 =?us-ascii?Q?zLBgRYLu4cJQHpF8DLlrwp829co4X4KZ69Jqh9UFci6oWp7BixQ7hRLVG8ag?=
 =?us-ascii?Q?A6tAoXbJEewFYhFH52SfABVBNwgYFr5UY8KiwWZ9d6dyPX+ZaeR4sc+kXgq+?=
 =?us-ascii?Q?krwpm/bGkA9tv9diSVNjfCvHRvKbbEode4JQnSa81blvbHxXm9kBGOAfe273?=
 =?us-ascii?Q?uO5zQy9UuyqyJusXvxaV+PzU+IbMNKVUQWoYgFO19XHf8S5W5CQgMdW//AP9?=
 =?us-ascii?Q?eMc0V87lwCPOQI9Dg5rKzq7aR0fGHMihAQpYVaGJNAa83zR6yG+jlpXDlCSp?=
 =?us-ascii?Q?tkpnbDoy8HvmovSGS9z1ZvOrib6TwupJth10ybL3TE0YOx648ea1B4PcpkZR?=
 =?us-ascii?Q?O9CamLr2aAVYWQXMYEv1uCxdOGPH8zZI8JCQt0q1xLsT7/1tpK0RWvLgLFwK?=
 =?us-ascii?Q?+qZHEjhZ1wnz/U9hKsTQ+P2JJv8exRgs+TMQjlpbOCpwBINrVQZ1kfciZ8eU?=
 =?us-ascii?Q?idniefbcWHORD2fvyAh2no+joJ83piPbGfm7MLiORjXgT0UnuY9nU8nIrfcu?=
 =?us-ascii?Q?FR0qaHUdRT7TU9cAfGTQNQtXeJyw9jaVhc2f8DajZ2I6vyWsL5mQzVjbvLdH?=
 =?us-ascii?Q?Wj+1Nmr6cuhZX/eg53hgVZNZRbJwUWDfHwBjm+H8htGxuSplvWlvVV55fe6j?=
 =?us-ascii?Q?xqj8jmnyWas1zOCnK9zI8jms4zUKjSQ2axqGp+wdE7RWtBQivSNTq/5xRF9T?=
 =?us-ascii?Q?b6+0TFNsNTyw94z63B9ybIacHscWhL+3MdJnBjc0IQmKJf2JJgmpKppuCCcY?=
 =?us-ascii?Q?p7nCT+Gyr9KVc29wyrzbZ8K4NsrBZ1xjmZ3ZnjsfxldQPE0r3O7lg14efOAo?=
 =?us-ascii?Q?3wke8zIKDi/Mq0YlXaxwh99wKFtKv5/CKKVPYw7GqwT8BYsCOINEXHpwTfG2?=
 =?us-ascii?Q?JCZ7UMCq3UHleuq1gCbuHIT2Up0Sn34YV/cKN20vEuNXTkmHFIoCFVnBYUsc?=
 =?us-ascii?Q?1j9Mh8ZUeHpd1h9v8XR4tiNV7neHYUXlNu2Y+Fn0DnzkLGX+uuyLLyH97SAc?=
 =?us-ascii?Q?Qn/92gO10oklCVgIziJT7dA4jom6/+jMZyar13bXtPxu44Z51rIW0GJNCF2H?=
 =?us-ascii?Q?9ryUoi5TAqg6aNQae+eZUeHawHx4ZM4IG4Mr9BDqfeU4ceRuraB8W4LZ0e4y?=
 =?us-ascii?Q?3vcdGZUjOBKfoPioZeSs4pgoRHsJXruqefL/ZiJAdTaUpIqzpz/P9b30xMM8?=
 =?us-ascii?Q?HDHesC/vj23JbruXcwDHeC22dfuPtoucbMZ6FolTESXySy9uFNz0R3Qdnsu4?=
 =?us-ascii?Q?o3CLk+wOyQiYnPOWRTp41uTHw9pxVt4XZew/8fBFby/UZLs4OO4F//e39TFB?=
 =?us-ascii?Q?D2YoZSYxTK9wnXFkNrwdA99lVxliwvWBOhKJJRHqkeManp7mWJ376J0RXfu3?=
 =?us-ascii?Q?EYn9aKOBtVxEazZ4kj37A8pWpMwakxkjXCvr+AsjQyyi9zYT79/qE3WI3fj6?=
 =?us-ascii?Q?8WK65HkxMHkeaMZ4negExhh0u+feQW+5rYDPXiCmj7aJEHKkd0nNasFiSM9b?=
 =?us-ascii?Q?GQZA85zxxRB0hvCDENnMhI+NNpFW7sUD33oyYAx6q+heE4ijqFyefmigfiX9?=
 =?us-ascii?Q?GkMqQuVFlBgkT53Wk8CNfpFMemGugV6ct7C+ulCPsjwND2UUmE7gMl/eRUvT?=
 =?us-ascii?Q?+VTeTsMup/fgXf06sjq74L16BIYOvoy8CnM74xlXLZSvpeb3h8m8hgj+wMNj?=
 =?us-ascii?Q?fq/0MgBvfg=3D=3D?=
X-Exchange-RoutingPolicyChecked: OOziGFTMjC/cfiP8ryWOt2ayFPi68I4mdGaO5683uQGlkYy5I6/pIvs46t/Gs9T6iyg/2xtDtzIRunw3Bp8MHXfXE0/p1AjaQPXw0eEXNcbZZBenCW/VWZRhJSvIDpdQc3mf8gsAA7f+fIg1hsf3iCMOV8kPmoQrFfg4xkFeMhGvOyU7IKKmwM1P2tmYFqwmAdsl3Jig1gvto3dx8anIOUJRF1ib+wlkPUD+qMhlKPO5Y06u26159N4rj3Jb4uuU9FG7D40472rXGSgWvZMF+xs13oaai6/a69TGJtaxQbN/txnQFz1RW7OrDw4CMANVSO6VbhhI2YUs2FPjS8upxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c9a663-3b55-4d4e-db68-08de806b7cde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:13:47.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fVNyb8cHshZFTmfMyumBND+bldDgjHamC+0y6Mz/exWiLCFU39DiNQq/xDqfsOn4fRNq6rRxBNd4Fp9e69qEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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

On Thu, Mar 12, 2026 at 11:10:33AM -0700, Matthew Brost wrote:
> On Thu, Mar 12, 2026 at 01:46:49PM +0000, Matthew Auld wrote:
> > During 3D workload, user is reporting hitting:
> > 
> > [  413.361679] WARNING: drivers/gpu/drm/xe/xe_vm.c:1217 at vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe], CPU#7: vkd3d_queue/9925
> > [  413.361944] CPU: 7 UID: 1000 PID: 9925 Comm: vkd3d_queue Kdump: loaded Not tainted 7.0.0-070000rc3-generic #202603090038 PREEMPT(lazy)
> > [  413.361949] RIP: 0010:vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe]
> > [  413.362074] RSP: 0018:ffffd4c25c3df930 EFLAGS: 00010282
> > [  413.362077] RAX: 0000000000000000 RBX: ffff8f3ee817ed10 RCX: 0000000000000000
> > [  413.362078] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > [  413.362079] RBP: ffffd4c25c3df980 R08: 0000000000000000 R09: 0000000000000000
> > [  413.362081] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8f41fbf99380
> > [  413.362082] R13: ffff8f3ee817e968 R14: 00000000ffffffef R15: ffff8f43d00bd380
> > [  413.362083] FS:  00000001040ff6c0(0000) GS:ffff8f4696d89000(0000) knlGS:00000000330b0000
> > [  413.362085] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > [  413.362086] CR2: 00007ddfc4747000 CR3: 00000002e6262005 CR4: 0000000000f72ef0
> > [  413.362088] PKRU: 55555554
> > [  413.362089] Call Trace:
> > [  413.362092]  <TASK>
> > [  413.362096]  xe_vm_bind_ioctl+0xa9a/0xc60 [xe]
> > 
> > Which seems to hint that the vma we are re-inserting for the ops unwind
> > is either invalid or overlapping with something already inserted in the
> > vm. It shouldn't be invalid since this is a re-insertion, so must have
> > worked before. Leaving the likely culprit as something already placed
> > where we want to insert the vma.
> > 
> > Following from that, for the case where we do something like a rebind in
> > the middle of a vma, and one or both mapped ends are already compatible,
> > we skip doing the rebind of those vma and set next/prev to NULL.
> > However, if we need to do an ops unwind later, we currently need to know
> > the next/prev when removing the two end vma, before then re-inserting
> > the original vma we tried to split. If we don't remove the prev/end vma,
> > then the re-insertion could fail since the two end vma are overlapping
> > the range we want to re-insert. This could explain the user bug, and
> > does seem to fit.
> > 
> > With that keep prev/next intact, and rely on skip prev/next.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> I'll need a bit to wrap my head around this - but quick question can we
> recreate this bug in an IGT and get it added to our testing?
> 

I've wrapped my head around this one, I believe the patch is correct:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

For test idea I think we need to do this:

addr = 0;
bind(addr, bo, 8M);
/* setup error injection for xe_pt_update_ops_run (late in bind pipeline */
unbind(addr + 2M, 2M);

I believe this should trigger the bug, verify the fix...

Matt

> Matt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 12 ++++++------
> >  drivers/gpu/drm/xe/xe_vm.c |  2 --
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 13b355fadd58..a5bc553f8456 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1442,9 +1442,9 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> >  		err = vma_check_userptr(vm, op->map.vma, pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> > -		if (op->remap.prev)
> > +		if (op->remap.prev && !op->remap.skip_prev)
> >  			err = vma_check_userptr(vm, op->remap.prev, pt_update);
> > -		if (!err && op->remap.next)
> > +		if (!err && op->remap.next && !op->remap.skip_next)
> >  			err = vma_check_userptr(vm, op->remap.next, pt_update);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> > @@ -2178,12 +2178,12 @@ static int op_prepare(struct xe_vm *vm,
> >  
> >  		err = unbind_op_prepare(tile, pt_update_ops, old);
> >  
> > -		if (!err && op->remap.prev) {
> > +		if (!err && op->remap.prev && !op->remap.skip_prev) {
> >  			err = bind_op_prepare(vm, tile, pt_update_ops,
> >  					      op->remap.prev, false);
> >  			pt_update_ops->wait_vm_bookkeep = true;
> >  		}
> > -		if (!err && op->remap.next) {
> > +		if (!err && op->remap.next && !op->remap.skip_next) {
> >  			err = bind_op_prepare(vm, tile, pt_update_ops,
> >  					      op->remap.next, false);
> >  			pt_update_ops->wait_vm_bookkeep = true;
> > @@ -2408,10 +2408,10 @@ static void op_commit(struct xe_vm *vm,
> >  
> >  		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
> >  
> > -		if (op->remap.prev)
> > +		if (op->remap.prev && !op->remap.skip_prev)
> >  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> >  				       fence, fence2, false);
> > -		if (op->remap.next)
> > +		if (op->remap.next && !op->remap.skip_next)
> >  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> >  				       fence, fence2, false);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5572e12c2a7e..9a897388ff5f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2584,7 +2584,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> >  			if (!err && op->remap.skip_prev) {
> >  				op->remap.prev->tile_present =
> >  					tile_present;
> > -				op->remap.prev = NULL;
> >  			}
> >  		}
> >  		if (op->remap.next) {
> > @@ -2594,7 +2593,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> >  			if (!err && op->remap.skip_next) {
> >  				op->remap.next->tile_present =
> >  					tile_present;
> > -				op->remap.next = NULL;
> >  			}
> >  		}
> >  
> > -- 
> > 2.53.0
> > 
