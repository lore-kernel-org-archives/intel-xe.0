Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA15C3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 04:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103B710E8BF;
	Fri,  2 May 2025 04:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntYt+y8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5155810E8AF
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 04:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746161012; x=1777697012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/O3g7sk2Fo2ZgrIY4/6B0hQqOxIIEXXwFX5tPFxma30=;
 b=ntYt+y8B/tHPMea21jB5Vjdy6lZQmb1YzNIvH6YRp+uSsbUsT23HTop9
 GPfaFGsl83nm127v05WWUeNeox+xVhujFWpkII04wL0Fcx9XXlXTSmwUm
 QWKlfJdmddDlYkIYcsFDX+dgkKanOgir2DF2BLwmaLb8YHWqXx+oanWly
 lPDjfbcewvv6Px4OQ5ZiKrspthIoAOA4Jux6pQ2418UA93KWX1ECY9Ki8
 fMHLkTsqVKChjOX2Po09mXQZ9uEH8DRkJu108Xc1hehB1OzW2GwW7au4D
 0rQIWRhvrFbwQdSnOrOB3QS7F9jfo+JYTsBRfR2DGWqVPnCxHlUKtZ3Wk g==;
X-CSE-ConnectionGUID: aHBjEIzCTomDMgG5Zw44ag==
X-CSE-MsgGUID: 338Yof4RTpCbRBIEfehj/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47559729"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="47559729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 21:43:31 -0700
X-CSE-ConnectionGUID: ULG0gj6wRTW/UsaJ88R8uQ==
X-CSE-MsgGUID: yEAWFR6lSbC8iXtiAoiU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="139700979"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 21:43:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 21:43:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 21:43:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 21:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS814f+CcxEyKJ7yu1tm/RxKHTnYpYwILfgyBS4q01xUoluCMC7OtsS9dlxVQKzNlMgSRSYIZW0kEqVY/RKDavg0qlFm2am0hhhCEMtEbUFkrFotXjvQ5/YyEl2M1VHn396y4uys1ONw5QzKMQLmee14z0zszrNONUEkw+e8LBUTKSOPq+GFEUeyNF2kkQBbt3T4qvottR0PMe2Tdy8U61CtUduvLCrVriKNkIsg5wT4uAgLgDK9k6/BuCvh5bhVAaaZdWfwiTLx3rUIrZ+irRdsZukovXnqrGviihe00t2ybPdizAXHCegmh6ffSRVjMy3DE7ziWgVaZMH8Hgg28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jej7WJwfMznsrOLb+YGIBVrrlsnVyTuVNunE0Je5W8M=;
 b=lwdg5ZfXdCF8AMLXL8hFdhEUK6JJoQ7L1q0Zu/ypng+dAoLpZNzFCIpt1rkNNx0rjJhwSVqk42oYFw8I7yfKgRXjhFJpv0hrxYan4Te7ON85tNEz2WAe/QKQyY/+Q7CT0gTT+2oR7oZSJhesAqhIRlE+NFtj+uoYjjhE/MnoptU8DGN17xGMK7K5DMGSl4lo3cI9NUI4o+wAQwa9SFKyxcYrKJMi90bxitvdiIB4VqmPVJttRtVLOqhxlFZuofY7fsZSPzy9GuhPsFUfaXOgRPxpXt92GG51HhpDY46E1cC7rWC36v6Hc05af/beF3WOJmtzp8xkI0qQgzQy1+Npqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 04:42:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 04:42:46 +0000
Date: Thu, 1 May 2025 21:44:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Call svm worker only when svm is enabled
Message-ID: <aBRNmQQ9XwQk62pd@lstrano-desk.jf.intel.com>
References: <20250502040757.1722973-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502040757.1722973-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:217::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f297568-92a6-4c79-a9de-08dd8933c8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H2TR+SLXHW+2Et/BpNiY61ykIBtSuq+ViCGEx7AT5h+KTgc4P6r61AIAJqrH?=
 =?us-ascii?Q?8NWLhZP+iwPgRP8jZId64fHw5wQtEuf00fvLFqdvtNafDTUtx00tNLBeuOgv?=
 =?us-ascii?Q?WnhRdhc0YmawxS1xRgAig0Ige78uP4uX2f6ufDRgBlZNKJgkcGwJTgWoV4oX?=
 =?us-ascii?Q?aSZSHo8Z2okorxOL+k6afoA9dGXQ/7HWrEWRzzk9AC1vH/8YPhElvnEqwf91?=
 =?us-ascii?Q?GZK0sDpL4tA34RBPWDCxF2CoL7e6MvbQ9dOqIPzi/t8+/69UOElTyX35gWVt?=
 =?us-ascii?Q?iShvSlC7eUvcCOJmLb/P6HLQLzzVkwTF2Jgp6Ypq91XXwks7kZS2mQ0HR9GA?=
 =?us-ascii?Q?evAJHxL8gPOJxD8ujNiw5/WdpBijnvZ7XViw976kzlVH1/kHrjDEIKb4dUGh?=
 =?us-ascii?Q?vtg7RNYXQm+4bXijGLp93v4ApQV+25X8/BtxRn62JPOlo+nSLWLxlEvhFSNL?=
 =?us-ascii?Q?/Veb7Is2g09SnHRqkEGLeZuHLhXHOAF5jlDOlVTQvPWY7IehaGqWs3X5oqGQ?=
 =?us-ascii?Q?PA5Uj7YU/wAO89+JKXNwiK6MBSy6YxcQxsHspJCaPXYWY4w1z3pa+PWXs1WN?=
 =?us-ascii?Q?CBloJmhZ4dg5nvQvCkFNIlqzJL7TceyKV2dHGCTcR88QF9hEJ2QxYRvnVRWK?=
 =?us-ascii?Q?FM12DHS9Bu6yh3bExAH8xE8irv7vEropXd6pwOMiZPeXsMlaoRaGxCeHaS2Z?=
 =?us-ascii?Q?+Fd5Cttbp3sn0FzHzJfOhpoZoomUJ9YiBVCZhaAouL7p5sfoc3zSh0zWAL46?=
 =?us-ascii?Q?+7Jtx9ZteRUz3CS9pV8FCiHO4qvIR9nxhI0/Yeg628wQkXwPh6HQGe26RuuM?=
 =?us-ascii?Q?B5ET2NgztspvvSZcrgBUxtUlTjy1wOhyaDeM/e4uBnPqH8temA9PXoxKMrHU?=
 =?us-ascii?Q?ZFY9P+scEIpcHf7PwlFb+12A1OSj2Q8aWDqXBsieJ8hNT9J024St2izxSA7g?=
 =?us-ascii?Q?UY8kXthSxsIOdA+lshImmTQ2gODbUKM/GcYxlU5Uu3pgtYvwLBOO/TtZNQ87?=
 =?us-ascii?Q?741RaXU8NoeJL8biygY/+ap7r2GjDAiF2MbCrmAtJu4NoNB7820ZyvGLRcfD?=
 =?us-ascii?Q?EDoJFUsGNoEaDQ+7RVfqQL3lNTqK7j4Au3XWZ+N2+h7Bjwd1PC71kNtdxJ+B?=
 =?us-ascii?Q?mQAZbIJ/VbQD+j2w2M/5xpgvQjT8w0CS9P++Jow2s/ldVZJS94eObxthT/so?=
 =?us-ascii?Q?thfthIb5vh6T5nicPY7GNlggIAv29tCy2aJmRwiZc7a5yYqpHUNstFaM5+gu?=
 =?us-ascii?Q?TBv0kU6JZS6W1roKutiCduWKmE4TRc5QzqjpwJ54Iw46F7Tg1Z31kMdrUKn0?=
 =?us-ascii?Q?QIxxezUUqnUE1ykrVNU4MUeCgSX2iCTBgqDlCeZ/zj/mlCa8tmyyfpjw6LMb?=
 =?us-ascii?Q?Tv9LqoSVco/tKRk4Fk5QScsXobVtUXWlRXeHcC1Ajku/iR9eVpzgJBSG5Z0+?=
 =?us-ascii?Q?vfSj1b8R7t0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sl06djmJWlBRnT4DtOs9HPbiXFs0kDmL6UobXxxtCy84aBAUD1w1lCV9xs0d?=
 =?us-ascii?Q?i++2hOz2anH8UJCtBUKXT2NJJIeYl5Kc/qEmthX29XsiwdNnzXxaxgfmAKiR?=
 =?us-ascii?Q?vwTOhqG0d3PgfZkyEj+JWNIqOP39l6Ds3cVNBsJ5l9s/ysgZ6TgbdHamev+n?=
 =?us-ascii?Q?LmKb4p2WOxBCDwkZ4+obcUkRSL//6aNq3GYk35tstwRpmvgsCNIUBt56zSaX?=
 =?us-ascii?Q?tXtGwQGYdn8wyEOqDeq+TtPVDLbAiLnp0m03BvQLFQgRAOJairWle2NXW2VE?=
 =?us-ascii?Q?hWpPR54+dgiW81BOxkaVdyoDPd67fh1JtlIHfeuWtKpd1WNF7ExjKBtyTo12?=
 =?us-ascii?Q?OV3CbqEEYBXMAF/LFbNXf0vejK1/VL8FchGKdqH0I3YyLG8VOVio+DP7JuYh?=
 =?us-ascii?Q?1uTsHqlGTY6IFnOo8oyvVy3b/KFxtq0sEBl0lMv9+9fPn4+ATrSh6zARXNP4?=
 =?us-ascii?Q?8Oj1Xo0+8FN+EI8sIZL9oYFHSDrPrlsxQqD4xgNG4gU5ZMpKdicDc1nXn4xm?=
 =?us-ascii?Q?paw3KyAr072IULKLZOY5IIAn1fVDB3jOugejo4+ic9GenmRBb5kRIhjkQCg5?=
 =?us-ascii?Q?QXFnQspVm+Fs+hftCOdWF785e+n8om0FbyAfDCwmJRelvKxtSR19PoDi+6U6?=
 =?us-ascii?Q?pOlq4ilwifsUzihHB1O08p8bBqKVyIV3pF7fhLQ0RU9gxcqUo3C2vaXVpI9P?=
 =?us-ascii?Q?emzG9YgG2LIt5qbs6OtJQLsNA7Cp/TMgsh/qHG1XasZMuLxqOn+H/N/k5WsR?=
 =?us-ascii?Q?D6kkSuufpkipk2/zX6OUJPpnrk4h9I7N1rkdlB0P85dXPmQBa5Yz7n3uPvXT?=
 =?us-ascii?Q?x8yGtWNbk6P8lh9Olh439/l8PGHdsRoO4FGrzY8/CxH2N9KSKYi8ddBHlXDg?=
 =?us-ascii?Q?CsTbo5MCZ2By+kDA208r2PShy3gwES7BjckaAErIiIIZOlGxhu8vHUETdUpD?=
 =?us-ascii?Q?Vm7AkhHnhDjCtmoBY5zyxAr50jyJDaRVz4abll0FzdvPFRgr1wywRpxpJ4lg?=
 =?us-ascii?Q?uTO8Bo2EKrGDOO0ekk/mGQnqLUsJmLWL2v+4gRHeihk9mcRS54ZBZwQA1nh7?=
 =?us-ascii?Q?17MTi10kGDv7fc7gnnHbF8ftcKYj2aBg58ghbg1SO5vHA2wjjvJVgv1f2zZW?=
 =?us-ascii?Q?fZC37DtvY60WEKkJyHQxGSOPKaGcvvKM5nk24pICFfcooDWmoxNP/osUVXcq?=
 =?us-ascii?Q?HbhuRZ/Go7DXiB2NLsAAL+zlGRd8qUmUpPxWRsEXvm7uInwSR5m77+X7O9XU?=
 =?us-ascii?Q?4DGK0lt5AMB7S7w8HSUrHxirqajgZs2Hma2fELT7tPiLD3GWmcmeFOh6E8Zz?=
 =?us-ascii?Q?7Stz/BkqR2uxxc3pXgnEWG2tn+RCHXVCkVHAfOFYhctNal7je/RZeQvJ7MJd?=
 =?us-ascii?Q?g6vzud6AAzrG9eJPYQ/OJEQyzhht3OG0SMXLLkb08qOLCE1bmHPXlkIgUDLm?=
 =?us-ascii?Q?14gr43C3F2xLPg98lhOpkNA26onwLryHiMI6K+r7VYlSJgG2xrF1iedC3uGM?=
 =?us-ascii?Q?Wwyia7pIq7Kt2fL1xwpQt2M+AY/uobvQOQ8p7QqMMoG1STleSaLdFKqLERjY?=
 =?us-ascii?Q?8U9Fn8yLUXl0GebVxgyIMh9Bny5rfA4hmunovDY94FPIGigKi1+ZJNXwoOsB?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f297568-92a6-4c79-a9de-08dd8933c8e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:42:46.4981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/Tph2KYrksFqPyOwTq8Eg5RT7IKdyIJNj2I41UhDPAnIkT4Bs6M3ad3i1r5N9F8WMqiaiSwFQ9fZJGQyj94FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
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

On Fri, May 02, 2025 at 04:07:57AM +0000, Shuicheng Lin wrote:
> It is in order to avoid below warning:

Slightly better commit message.

e.g. 'Without CONFIG_DRM_XE_GPUSVM set, GPU SVM not initialized thus below warning pops'.

> "
> [  453.132028] ------------[ cut here ]------------
> [  453.132527] WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205 __flush_work+0x379/0x3a0
> [  453.133355] Modules linked in: xe drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper drm_gpuvm drm_exec
> [  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted: G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
> [  453.135405] Tainted: [U]=USER, [W]=WARN
> ...
> [  453.136921] RIP: 0010:__flush_work+0x379/0x3a0
> [  453.137417] Code: 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89 c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45 31 e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe
> [  453.139250] RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246
> [  453.139782] RAX: 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000
> [  453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881016d61c8
> [  453.141253] RBP: ffff8881016d61c8 R08: 0000000000000000 R09: 0000000000000000
> [  453.141985] R10: 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001
> [  453.142709] R13: 0000000000000002 R14: 0000000000000000 R15: ffff888107db8c00
> [  453.143450] FS:  00007f44853d4c80(0000) GS:ffff8882f469b000(0000) knlGS:0000000000000000
> [  453.144276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  453.144853] CR2: 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0
> [  453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  453.146320] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  453.147061] Call Trace:
> [  453.147336]  <TASK>
> [  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30
> [  453.148067]  ? xas_load+0x9/0xb0
> [  453.148435]  ? xa_load+0x6f/0xb0
> [  453.148781]  __xe_vm_bind_ioctl+0xbd5/0x1500 [xe]
> [  453.149338]  ? dev_printk_emit+0x48/0x70
> [  453.149762]  ? _dev_printk+0x57/0x80
> [  453.150148]  ? drm_ioctl+0x17c/0x440
> [  453.150544]  ? __drm_dev_vprintk+0x36/0x90
> [  453.150983]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.151575]  ? drm_ioctl_kernel+0x9f/0xf0
> [  453.151998]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.152560]  drm_ioctl_kernel+0x9f/0xf0
> [  453.152968]  drm_ioctl+0x20f/0x440
> [  453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [  453.153893]  ? ioctl_has_perm.constprop.0.isra.0+0xae/0x100
> [  453.154489]  ? memory_bm_test_bit+0x5/0x60
> [  453.154935]  xe_drm_ioctl+0x47/0x70 [xe]
> [  453.155419]  __x64_sys_ioctl+0x8d/0xc0
> [  453.155824]  do_syscall_64+0x47/0x110
> [  453.156228]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> "
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Fixe tag.

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2a9d58a4471c..9d2a15575122 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3418,9 +3418,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  	/* Ensure all UNMAPs visible */
>  	if (xe_vm_in_fault_mode(vm))
>  		flush_work(&vm->svm.garbage_collector.work);

I'd hide the flush work in xe_svm.h that already has the
CONFIG_DRM_XE_GPUSVM def and the just stub out the function if
CONFIG_DRM_XE_GPUSVM is not enabled.

Matt 

> +#endif
>  
>  	err = down_write_killable(&vm->lock);
>  	if (err)
> -- 
> 2.25.1
> 
