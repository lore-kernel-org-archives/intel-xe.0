Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F4E106ACD6
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 18:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE34310E22C;
	Thu, 12 Mar 2026 18:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpps7Hjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D799C10E22C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773339040; x=1804875040;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WQB64Q147IuCc1GFsx8GEpvutV3KvIQx9dsUFz0LsGM=;
 b=cpps7Hjtn3KvU9I8ZZ6WkvDDdLVxTyVDuh8v92Sn9/6xo/ZbuR6XcYP2
 4lxCX5KCQ43kb5J7huhzqRE7eMUkLp9fVIHelStqymX5se6EeqJ4FQ9Hx
 R4rwenmnus7+ZSoLPLnmztSZK1/HCxKnYPfJm92IgqjWTWo8wyiuyjAY4
 BTfAyUKFxP+xOYa/1lVnpl7+by54MDeiqp0eHUuUUBcicv5GtmnzHlGCw
 G2tO2NmRqUa9/Z3L+/SMZOSwFUQAl79rR2Z0xwJ9fuj/iCQKIajC5adbH
 wCqs077aWoOSfQnAFjlDB5k9gf46VQ71PL6PDZG/QZX7UF6IEnv3NK4DI Q==;
X-CSE-ConnectionGUID: MB0CdxewRXucZ7C6oYg+DQ==
X-CSE-MsgGUID: Rbn4aN7mTJ+j5uheIvuz4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="99903656"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="99903656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 11:10:40 -0700
X-CSE-ConnectionGUID: Ja8rT4zjQxqatZA0HwXPOQ==
X-CSE-MsgGUID: W0rnBfC3SDKb5tLHbUg3qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="218692430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 11:10:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 11:10:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 11:10:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 11:10:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8rgPYrcA5Zpndrff/3kg4eJTKCub/ryJSLZyXFuCTnkxiLVkPwGJt5ZkM2GEHYXvaHFGkwatgl1iumzeEE/hyJjwmpRuXVieHHn7oD7IW9vNj650WJz6FbbK+9mUQ2MSqIwFAkFBlzjM+S7MfFueVQJRt/KEO8xYo0ly5hU+ppZVK2dgm0jZ3t9hDE+5uARzCPi9yf3ZAsh+NimscsuorixP4smdl/SqJbkEkq4QbKtiZ32dtqKu4f1nA4slQdxAyjhUkBQFUHrAEJzCNKqRCoi32xikGwPn955wYSqFQUzP8W33VSKLethGohNx1xEG+lw1szyrVxg0N+umXlNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTTmF5qBB5Z7iUOgv5vmCVkvBsMSQPeUNudVk2awoMU=;
 b=iqOynUt7uSIPzTQHatRrjGwSjkLVKYhclIlxsQeDZrNahyHt/0CWLDTWUlviLfPah6ocxytjwrIcoY4ezmZLD17oFa8jP+9qJc9i3qr+EoEF87RVuBistPvSuvYO08hS5z2yiIGXXzj2SeN2+U5r5sF4NtQcc7XGB3ULbQV1/Bv9x7eEARDqZEwT4YCquOQE+BeZiUx2G3NxJlRDjqljkyNXGESKLmV72M++cBRQKKQsSY7n5/bARChI7LjzWYkik4ynuMz5AsJ+BgmoPTlwxfmo+sAhMu0uS/EKtgPEJnrKe3kpfVOAEmocKsA69tclSEbQqMHGmVi4EHj0ARpCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Thu, 12 Mar
 2026 18:10:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 18:10:35 +0000
Date: Thu, 12 Mar 2026 11:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: always keep track of remap prev/next
Message-ID: <abMBmZXHwLmAMywS@lstrano-desk.jf.intel.com>
References: <20260312134648.286641-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260312134648.286641-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:303:b4::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d44949e-2f00-4d50-f824-08de8062a874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: TllczfXYybHYnGWywwNN4VSdwc/Eh2iKspfpSz6URSwzBNexs2J502qYxi2KuXk3lG2Nbnh0zqYgS9wB/kfzWRHD2NhyX+3+nJGlgM8fHmUxVb49/is/3DjkscoQ6dSX+BhYIM5Vr9o2oT+I8tl2/Wu84HKq0CKyIzehpLLiU7HDSXBlCu5OtRiyuxnxdxzPFxLFsbSbl6v5/uSyY6SUgeWE4/0hiWpP3axrTGbX6W/aqo+E/JSQS+4QublFxu5WQ4/57/SwO1ISGCZ1TGMQHEGZ1HyyihoTwJyqEw9fqDJiCDcc8XykIDo9rg2iYQnoMIL7KL2BO1/zMPPEssr/XHSSDjUzt2gQXV3j/KbP8FA+D8xjXEL/PXGQozqzUk47awf7AXBksMZjjOh/Rf8en4DaKJewHrMXv/BKP970sgZwORZwrGSszrJxN3UTf6F/6oEeXiX69t3dkRg57fRmpeqRmAw6IVaXYbR4HTET6D/1sl19yHbjb3HErsMhbQYT5cg33VafxKBauTFSh7uAlscDrT6SWsKTZvwznWfQYG7MqeNmVr2ysJDFFcaeyz81lEcrfy1mG++V9fJWPZCa+kBnQEUW1F9iCF5BhlbDBOxfC1Q5Y4X2D/tOse3ES1Te0zWcJ+en9TKY9J8zTgWiGZyejNu8czepd6/XeF3zmsxmWRS8ya6I5ixeALbCPb5v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQriBsEPGPbQ/imCUFvUJKz8+HC+kQ33aOFhfRSTbhksbEt4Lshj7jQ5o4Dg?=
 =?us-ascii?Q?JH4dbT8xDiwGxgfyjcYq/WFtJhIJNfu3D66Vx2yT3ZPQTCL9a2Jy1nvEIu/Z?=
 =?us-ascii?Q?Qbq2sssNhKjOxM+iYOyrD7GKtBQFgatH+lQKmFgnpaueVMyrBzoSZVNS9VLQ?=
 =?us-ascii?Q?1fOZoMLdH76yDpLjZfN6NBFTonOfhI0XZeZ1Hj3EGwxyih4gGL1JL9JCaOTx?=
 =?us-ascii?Q?rsRP8yKhd6KCn6s8DwO2NBf2FG9hxLvUQTtydSsveV6Eg7R+bkIV2HgNTFCc?=
 =?us-ascii?Q?zqbPDoLvLyduAy6tHz5D+h5/33vwbqkDAMp7dEqLebxA/vU6Wb6oy+teMLMV?=
 =?us-ascii?Q?VcGz1b+pc/updiEFnoXare660sHRozYIWkTtUOEBBx3PVAcfMBkfNjVXsdER?=
 =?us-ascii?Q?7m+72/K2J6lYaJTRieK21hHEDYNXyDbkhQE71fOgbptFqOdHjGd2awZKbjSz?=
 =?us-ascii?Q?M0dnHBm5WBHNtC+XN8HTOFy+yAA4vcFmrRgJIBAtA7qYIJZJxHQNhswtIH+W?=
 =?us-ascii?Q?hHTZUXiN9t5HAblqx+xptJ0QapzUiTVft4+Ns8H7EGQ0DLPlKWg+JzQEmNCP?=
 =?us-ascii?Q?sCDkMMae6Wkkb8TZIQ3Et0r3eVdFZ7zT0tmRNf+3GQqYelHIRJijo/KQA5mG?=
 =?us-ascii?Q?mZlwTHc/wS0bkbg1yiqQRpZLnbD47Y7C27yZoDEbR73YZHUNsl2cWmMF7vzR?=
 =?us-ascii?Q?kwdAVPrxBkLVXSziMgKV4UIt04Fl20khQ59VgjNkYS7xx7+NdoyFHmJjZeQh?=
 =?us-ascii?Q?fpvufvjBo2j0PWfNio2AwHbHU0de3KK6OKDQAt+7omwcKYlIoyM4YO3AmFAI?=
 =?us-ascii?Q?TGnKGXQlo0xEMU+qgJWfl/U9ZRe9isBivbXuyOYVF7YiqxCltiozqyHAyyO5?=
 =?us-ascii?Q?/gXnunG4cEyF/2Fp3QZxAmUdi0qJJWcSgeHx0LDCZs9mOfX3HPImpSluIs08?=
 =?us-ascii?Q?ZSkTM1kWOJ+OYy2E8UWnpNYqp1Ux3FIaAvYGksc89BEzdK64mfmzz9BxnebA?=
 =?us-ascii?Q?T4r47TqYKbqPVqikzmN4GHSRzinV5Co70q6G1DjsuKcFYE+Wpdy52y4EDWxu?=
 =?us-ascii?Q?Pis3dNw8AgxeVEHCZYJLY+CFHYRSQZ6hHS3rWtUwqF4nMZ07XTQOR47POqaz?=
 =?us-ascii?Q?LTuEYekNEteR2KNikJKB8iHwSEO2a9XVgs8hj5XTgueLI1noqFsOfTnG3hOD?=
 =?us-ascii?Q?oRakBTq25SVEX/sfV76zX/X+wmTYKjH883jupWU88TJQ34eIYdM6qZxWj2k2?=
 =?us-ascii?Q?3IAon9MJkhKlB17ZJ3+lJmSye+/SkUxBGgrzrAMTylkPe7+zTcLHL9k62j3M?=
 =?us-ascii?Q?dYNHFFkFn6nSO1veVJ7oWnA5HSndQAGJDU9PBJ9u+yf4FYZOgW/M4QH7yzZj?=
 =?us-ascii?Q?BRg47LX6MP7pCO1TF5kySp6CqleXIZvX9yVJ1NdvD/I/wEpRHpoveyBbu+9g?=
 =?us-ascii?Q?9fPtnq7j5ggj79fhY2X0lxyuexsUcUKlpRacsIM4p3R8tAYDJQUS1ftjpaO8?=
 =?us-ascii?Q?YqSt/dAfPAfLxX94JumbG4+e/flisIZ80r7GkmW36S0S8rlaSY1lKiKAoBzQ?=
 =?us-ascii?Q?hYdj0/WFmO5mW4vSuCUHxGHxVpHNleCVre5ywxBgkJFcvjHWCME/WP7PtV2S?=
 =?us-ascii?Q?QKOB3MgiyGfF/gCN4Jyazyc6rlgusTVrBGTY86ciVYdfy3wuosoyquVr+jUj?=
 =?us-ascii?Q?4foYu4dGiqm5OhKr59LJcHKIkn4ru4jfSN+5uqcGFeChrUesT641rSOLF/jq?=
 =?us-ascii?Q?XuUEcZWF4Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: KDRgdnu+T0Wc91mN9kvJl1pGyiZnZ/MdIzuJnj5i2yvsYTopLoi/oOXai9uObej31pEUBxEcLb2Q1GN4oJmS/oR3HHXlcGLmm65AoTNpbG6noNIds5kVCwliDIJyzhPwMuN9m15uMf6UDw5acld/snVSq3nmp2KnekqTEaTH4KM8h1XlD7TeBAwY40/lwyPJ0kKsxNbPkOvJtQcf7wMvKfe4zhhYFVhuM/gkJDYsaFt7QufN3GUCSUzcvhX+oyZw8bUzap4DCm7QI+vfVpD7dreNsTgAn/dYn9Pq4gKQlY7LhSNJ3Y/Xao27MAJxpFYs8FSHGQbubvg+IXzrTRoCLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d44949e-2f00-4d50-f824-08de8062a874
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:10:35.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U91KGQEyFUyVH2NKghmlpbJxSEuw3L08PQngtACAxM9MRNXRdW7obe/a55tAB2JO7LMPXQhmjnrTfe9a1LYSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

On Thu, Mar 12, 2026 at 01:46:49PM +0000, Matthew Auld wrote:
> During 3D workload, user is reporting hitting:
> 
> [  413.361679] WARNING: drivers/gpu/drm/xe/xe_vm.c:1217 at vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe], CPU#7: vkd3d_queue/9925
> [  413.361944] CPU: 7 UID: 1000 PID: 9925 Comm: vkd3d_queue Kdump: loaded Not tainted 7.0.0-070000rc3-generic #202603090038 PREEMPT(lazy)
> [  413.361949] RIP: 0010:vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe]
> [  413.362074] RSP: 0018:ffffd4c25c3df930 EFLAGS: 00010282
> [  413.362077] RAX: 0000000000000000 RBX: ffff8f3ee817ed10 RCX: 0000000000000000
> [  413.362078] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [  413.362079] RBP: ffffd4c25c3df980 R08: 0000000000000000 R09: 0000000000000000
> [  413.362081] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8f41fbf99380
> [  413.362082] R13: ffff8f3ee817e968 R14: 00000000ffffffef R15: ffff8f43d00bd380
> [  413.362083] FS:  00000001040ff6c0(0000) GS:ffff8f4696d89000(0000) knlGS:00000000330b0000
> [  413.362085] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [  413.362086] CR2: 00007ddfc4747000 CR3: 00000002e6262005 CR4: 0000000000f72ef0
> [  413.362088] PKRU: 55555554
> [  413.362089] Call Trace:
> [  413.362092]  <TASK>
> [  413.362096]  xe_vm_bind_ioctl+0xa9a/0xc60 [xe]
> 
> Which seems to hint that the vma we are re-inserting for the ops unwind
> is either invalid or overlapping with something already inserted in the
> vm. It shouldn't be invalid since this is a re-insertion, so must have
> worked before. Leaving the likely culprit as something already placed
> where we want to insert the vma.
> 
> Following from that, for the case where we do something like a rebind in
> the middle of a vma, and one or both mapped ends are already compatible,
> we skip doing the rebind of those vma and set next/prev to NULL.
> However, if we need to do an ops unwind later, we currently need to know
> the next/prev when removing the two end vma, before then re-inserting
> the original vma we tried to split. If we don't remove the prev/end vma,
> then the re-insertion could fail since the two end vma are overlapping
> the range we want to re-insert. This could explain the user bug, and
> does seem to fit.
> 
> With that keep prev/next intact, and rely on skip prev/next.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

I'll need a bit to wrap my head around this - but quick question can we
recreate this bug in an IGT and get it added to our testing?

Matt

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 12 ++++++------
>  drivers/gpu/drm/xe/xe_vm.c |  2 --
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 13b355fadd58..a5bc553f8456 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1442,9 +1442,9 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  		err = vma_check_userptr(vm, op->map.vma, pt_update);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> -		if (op->remap.prev)
> +		if (op->remap.prev && !op->remap.skip_prev)
>  			err = vma_check_userptr(vm, op->remap.prev, pt_update);
> -		if (!err && op->remap.next)
> +		if (!err && op->remap.next && !op->remap.skip_next)
>  			err = vma_check_userptr(vm, op->remap.next, pt_update);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
> @@ -2178,12 +2178,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  		err = unbind_op_prepare(tile, pt_update_ops, old);
>  
> -		if (!err && op->remap.prev) {
> +		if (!err && op->remap.prev && !op->remap.skip_prev) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
>  					      op->remap.prev, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
> -		if (!err && op->remap.next) {
> +		if (!err && op->remap.next && !op->remap.skip_next) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
>  					      op->remap.next, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
> @@ -2408,10 +2408,10 @@ static void op_commit(struct xe_vm *vm,
>  
>  		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
>  
> -		if (op->remap.prev)
> +		if (op->remap.prev && !op->remap.skip_prev)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
>  				       fence, fence2, false);
> -		if (op->remap.next)
> +		if (op->remap.next && !op->remap.skip_next)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
>  				       fence, fence2, false);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5572e12c2a7e..9a897388ff5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2584,7 +2584,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  			if (!err && op->remap.skip_prev) {
>  				op->remap.prev->tile_present =
>  					tile_present;
> -				op->remap.prev = NULL;
>  			}
>  		}
>  		if (op->remap.next) {
> @@ -2594,7 +2593,6 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  			if (!err && op->remap.skip_next) {
>  				op->remap.next->tile_present =
>  					tile_present;
> -				op->remap.next = NULL;
>  			}
>  		}
>  
> -- 
> 2.53.0
> 
