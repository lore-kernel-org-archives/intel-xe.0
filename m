Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48BFCDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 08:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F15B10F422;
	Fri, 26 Jun 2026 08:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrX8bXNo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1875B10F422
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782464002; x=1814000002;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JaS4JTkvKRlA1sjBWfYXnUDSyqKzFZ8tN+NGTuxuSJg=;
 b=VrX8bXNo1C6vZ5ZkDDLJMPN5SqjaIenQV5G9mhxotT7Faqx55TYeZZNr
 tUUNISg9ejD5k7X9pKr6caZu/H3j6k59QAGuZV+xfihTWep5QASeeO9oq
 1WwTxNnYcPMk9piWKoaz4AV0fpFvrZuAQmxw73Bx03BLyEWXhCxj4mJUT
 Tg4nG2HXzN2YqEXnUrMDnI4xwvfskhVZspYhysAS2FDZe+K2warG/yTMH
 3vgJWWH7Y291Gnrrez4se3aax5ovNxUbWIuW7wy3fVuRkSSIE0h2L7U/G
 Kv6f2XMPodIQr/02VjRezV69gfOJRN44GgiJdev6MJE1/Krszkh/cNWOS A==;
X-CSE-ConnectionGUID: IT9mnWsDTUCYpDaxX+nOLw==
X-CSE-MsgGUID: 3IF4S0YMTHGmndXvUCiZxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83392398"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83392398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 01:53:22 -0700
X-CSE-ConnectionGUID: PB/rMrFKQ3iMHjErRiK5Ng==
X-CSE-MsgGUID: wm9jVxSuTAaogoN2C0brlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="247312866"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 01:53:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:53:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:53:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKaAn9KMNjHbAztDmWksEuaYHzpf0W+cCQhcOG+8cK6o8+KXxJUmWs1RdkcxsPWgWVbhf/1okPQYW77KqK1kzLWjfz5MVj5df6Cr+nFi/tR9Knye0wxjgB4n0rlBX5eAApivk1CeO2h772dRMUooMgsDb0FXjJ3f33X4rgSeXyJJffn3Ta/F4SZfD8X391MOCS4k1sA/J0iwkGvQkiuKj8RugfiF5EOwXNVn/LEBBCgiZNJbrHs5AKVqVNj7pdPPCNKY8Aj7xR+P6Df+AZ9ATXN3gCDUqBdXw99mMtTHcWEeiDJ8BQXkrEQdSDCKGT6q9QhHWX1TLOMpHUgPgleB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0iFCGRVzVE3vHwXhfXA/fYFYz4k6Tzuk4DfJil4dQ0=;
 b=uC3AOpplrnAaxMedf7IE62saQYq7YFwxdSMXyMo/5uWP8JfOY7XeU3NvdKXjGsmLe9hzayrX6D1HmGWy/T0VxUymCq/LCXuayEqBtVjvey20KFvRAPHrdh58ibNYO23f++F9CFj3EE7gAVf9OEzdcOkZbp0OCiM9wz6AML+qprZyIsaJ+EHMwCJR8ZvLC14sAuuTIae8DQUusZtng+TCkWrN+iykDM29+sW7dpTggdaQZ1OAy8CqJ53OeSg1XAWyoEvoGSBMZH9Elp4viz0oWBsG8A3LrUaxvTBXSnqNglSf5fGqQ8QZRmT6Lp3YRrsRHWuUKfYFkSpJGdfKEtIkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 08:53:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 08:53:13 +0000
Date: Fri, 26 Jun 2026 01:53:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: Re: [PATCH] drm/xe/userptr: Hold notifier_lock for write on inject
 test path
Message-ID: <aj499sjV6RGf27b4@gsse-cloud1.jf.intel.com>
References: <20260625215615.3016892-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260625215615.3016892-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 4464d6bf-356c-4767-2123-08ded3605ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: hWenG6y8AbZOQhOQ0+qRCf30rA+FTS7Ul0q3HCFjeg0qSD+WfShnU316DSWRbntRTAVroujqqvqV79gtxGm3KSQNT/XdWl5Tdo1iqDAfZq/yHx2bxe6mKDNE4RJf96XST81ubDAKGXf7qX7bsnL3NHMJCELVUy1vIwX27KXDhj5yVAQ+uU9wL7F8UiQMcRhL0f8/JOguid7Azv3CR8wzkzyd+yXxyphzAC6FxDeUI9lO/V2cMtbDz59F7z/ckh5sFqhg6aYICkSnmC1D4/CK87gvdL6NeEpjfeOJZt/nJwFqHkGHhnv4unS0FNqNsGGo39MLKXTDA7cPrScwzjukitLmUvpTznxHIsSXtOTHtQ58jSfhAR/8e/LdhFnrdOQvgFLo/Rgqh6c+S9YYWm11qW3UPsJtlQzasN5etDOIy+/0UpNdyWVRxgDmBL1Thv62od/wVjOKgMhF/IjYiSTXAg/OACGqw+qlPD6gyitQRgZOEwmtCgi7W3edmmiMFMxsvaVtz9aZCT17Kb1+ttArCNbt75buEs9i6Da/6YFvi9rE2QmuPD23Qd2QAh6EKFZZBzc8LCct49Ozeeeo17AGSbJn5pF6tRsA9gITKDnVOkXs2dqeI5yJdGkEWo/piwW4JiGucPCcDdAMQWgP2Cgs8R5ACVjT5fPRWAfkNF1BIAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7P5kMsPH4vfBO1rIkl35KUbJTQEEC7FMXIZJMIi8//byJRxl4SY2ZSMIGn90?=
 =?us-ascii?Q?BgosMAEgaRRHYtlg54SyphEFpcQoXdAgJo62GDayfuiHFf/r+Zk0nVVbJRzN?=
 =?us-ascii?Q?PNzUu+cCxCchkz+wBlspFCxqnpzb7j66rDYC6DZseK+usRA4yJM8Ix8Fsdk0?=
 =?us-ascii?Q?fY0ufX7610lDu/gQdO/lfYnTaN5BfsT//hafRRdunEXytJL1NGrlntXVdJFk?=
 =?us-ascii?Q?NnkmG+tvYrVaO4zv71D+g2rzAg99wMR2aMv6qvLqiJRIcSlVCWitCo5dclWE?=
 =?us-ascii?Q?LQ63hDPcDq7Z9PJRLXpHF0dDafTkucSaxRs2mic577LNDrSuexjUWHFIdPxy?=
 =?us-ascii?Q?ADgpkAa8Z0jyvr1it8oO+nda3vCYP20KsgwriAqp63PVdcbCLI3JzPOkMjbO?=
 =?us-ascii?Q?k5GDpzEmuPTPUi+6ZmqnVQ39cpEGngl5DiDWC/enWT0eiJz4pLRmFSRdlkGT?=
 =?us-ascii?Q?YiMgV1SCwLU55DE1Ul3KQHkwol+peaJy8nvoQCjRr1MVyWeOPx1lqlgkLBa1?=
 =?us-ascii?Q?VQkQsZq8V/mVhIb42rTBX9QlPUopK7JPSgR7/1rqxHdqfKq5LkzjHG2ya0tq?=
 =?us-ascii?Q?xNKgZ0qlLu6YzSZqjOe8mg+Kt5XP7TqldI7wAk3KJENTDyx5SkmQUfguu5Dw?=
 =?us-ascii?Q?PMb/Pip4tSCG3+pOvQoI09veHzNtxVAyAiznvl5nz6eA/xB3z/80DYJycvoa?=
 =?us-ascii?Q?Bb8b/nnKAPq67hYjDCudKPE+csm5tsMyG0iB2bvKEO1rbWmb5RjbnMZr+X5q?=
 =?us-ascii?Q?+omZDKTEwacOkkkp5Wru6k4dHz4tvPI7XdxSqkmI/7hzYEutzAq1JlJ4Yihg?=
 =?us-ascii?Q?FFLtdRuVZxkOM9O4ZMJ1W7FIkAy6lrDBs7iAZAJtAX9d4RNGQ99DbQa0GFmd?=
 =?us-ascii?Q?aBCXWzBdcZUIm/16N8wQkbb/CLYmrBat/imRWdxQJD1PgKsGP4e8xu6NFXCS?=
 =?us-ascii?Q?5g3L4LeS4EirTbnSJdPA3l9VBagDtrpbgTH3d263r9Yw/N3Ic/Gn5MYY8Khu?=
 =?us-ascii?Q?TiJw6kRFa+LmQRTu8fPd8pCe26QdTZS5Krgy0rOtPvsU4LUPgLtwAmV6xXef?=
 =?us-ascii?Q?GYVND6WbdrrM7Wv0OG7Xo5d1yeq21eVi3AhYV2ZS7jyZDORKeu9lRCZdBVF9?=
 =?us-ascii?Q?CqfhbWtKXojRo8ITisLehdRtQj1u+faeqdDsPjdZdnlqPDgTw/+8sUSDiK8H?=
 =?us-ascii?Q?I9xBYRfs52/fDS2oUFHeujQyb2P6KHEQdZbskeOW60g/0AVDOVW2brPPGu5y?=
 =?us-ascii?Q?YjqKxZHkR5J7lBg5ImyXu8XYWWT8R3vG//P+54O5TCnggEoz1MSokYhNzGDi?=
 =?us-ascii?Q?WASipVeB82BDYfFvdd884iOi5FQS53NqnlPugbPxWzcEOl7w93x8q2imlCT+?=
 =?us-ascii?Q?VR+KS+PfagQ+1UOj+epJJ7JbphYJt6Lc5xzwrZcJ+FR6Vk0fEgD9aI7xVDZ/?=
 =?us-ascii?Q?BZBWbfjFPgCNXA0IaPhP0zQNHpQNCp9SqxpvZNo0Fg4/7zrw4mPt95VcT3nt?=
 =?us-ascii?Q?ni4BsjgMxKGQ4J3ceASCXooEcD+v6FBd5uLoMH5EmJaTPORsY+769AS6L02C?=
 =?us-ascii?Q?zD+2+Dmbqz/4rpa4M5pdKKHn5wp8mj6458BsbjM8wIQyChRhN7fPQOLMy4/2?=
 =?us-ascii?Q?qhaGm9sr86FUOV2Cx2/yL0w08L6QtIZ1cwKflsJmTBmdUiR1brSVe0xudGzW?=
 =?us-ascii?Q?cG5QC1VAmEr1f78MaE9nFcjFVBsvIRV8+cCBoHKoVO2+3Y6YLym07sfnQ8oX?=
 =?us-ascii?Q?nxp0LpCXcu5RVQkpksJDlojT/rXWsuE=3D?=
X-Exchange-RoutingPolicyChecked: I1XMRW+l/3UYQjSaqXkxhLW+RnNMuN8PAOWyTz5df8N2sNw+k9iQOvmiBxfkHgypsgYU+pouf9QObTdU0YPfgytd1eLY/fYAqF23QTmfBYECpP9IXP86mb3SrEqaAC+1s7kTnySUimDtKEuQNjM7CDvj8tG9Faxg0l8wkO07HpywZjCfF6LjCmfVQUzIbRh3tffH0x3L4EahnUUx8aceBFsY6kfRTIbfq+sEXeDgX02Rw55Kz12QGr1TBYoAQqgU3sNd9kS88O9FA1y5NHNVVD41gn724Bj1Zpakl+p0+KHkU0oC8+ysIArFwhsNwJ/XYILVs2SGDzC7DdUkUlZ2bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4464d6bf-356c-4767-2123-08ded3605ae4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:53:12.9954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tbepP8VXVuHn4+K8LpZWvU+ijBsF9ML8UOKlVvz9FAVGb72QmEAyNnVZblnN0liCd2Bp/nBvebs6sk8DWGsLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Thu, Jun 25, 2026 at 09:56:15PM +0000, Shuicheng Lin wrote:
> When CONFIG_DRM_XE_USERPTR_INVAL_INJECT=y, xe_pt_svm_userptr_pre_commit()
> runs vma_check_userptr() with the svm notifier_lock taken for read. The
> test injection causes vma_check_userptr() to call
> xe_vma_userptr_force_invalidate(), which feeds into
> xe_vma_userptr_do_inval() with drm_gpusvm_ctx.in_notifier=true. That
> flag tells drm_gpusvm_unmap_pages() the caller already holds
> notifier_lock for write and only asserts the mode. Because the caller
> actually holds it for read, the assertion fires:
> 
>   WARNING: drivers/gpu/drm/drm_gpusvm.c:1669 at \
>            drm_gpusvm_unmap_pages+0xd4/0x130 [drm_gpusvm_helper]
>   Call Trace:
>    xe_vma_userptr_do_inval+0x40d/0xfd0 [xe]
>    xe_vma_userptr_invalidate_pass1+0x3e6/0x8d0 [xe]
>    xe_vma_userptr_force_invalidate+0xde/0x290 [xe]
>    vma_check_userptr.constprop.0+0x1c6/0x220 [xe]
>    xe_pt_svm_userptr_pre_commit+0x6a3/0xc60 [xe]
>    ...
>    xe_vm_bind_ioctl+0x3a0a/0x4480 [xe]
> 
> Acquire notifier_lock for write in pre-commit when the inject Kconfig
> is enabled, via new helpers xe_pt_svm_userptr_notifier_lock()/_unlock().
> Rename xe_svm_assert_held_read() to
> xe_svm_assert_held_read_or_inject_write() so it asserts the correct
> mode under each build configuration. Production builds
> (CONFIG_DRM_XE_USERPTR_INVAL_INJECT=n) keep the existing read-mode
> behavior bit-for-bit.
> 
> Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
> Assisted-by: Claude:claude-opus-4.7
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Zongyao Bai <zongyao.bai@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c  | 43 ++++++++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.h | 15 +++++++++++--
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 0959e0e88a14..4f0f438d6b9b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1086,7 +1086,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  	xe_pt_commit_prepare_locks_assert(vma);
>  
>  	if (xe_vma_is_userptr(vma))
> -		xe_svm_assert_held_read(vm);
> +		xe_svm_assert_held_read_or_inject_write(vm);
>  }
>  
>  static void xe_pt_commit(struct xe_vma *vma,
> @@ -1406,6 +1406,33 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
>  				     pt_update_ops, rftree);
>  }
>  
> +/*
> + * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
> + * and the matching late release in xe_pt_update_ops_run(). Read mode by
> + * default; write mode when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on,
> + * because a userptr op in this critical section may invoke the injected
> + * xe_vma_userptr_force_invalidate() path that calls
> + * drm_gpusvm_unmap_pages() with ctx->in_notifier=true, which requires the
> + * lock held for write.
> + */
> +static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +	down_write(&vm->svm.gpusvm.notifier_lock);
> +#else
> +	xe_svm_notifier_lock(vm);
> +#endif
> +}
> +
> +static void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +	up_write(&vm->svm.gpusvm.notifier_lock);
> +#else
> +	xe_svm_notifier_unlock(vm);
> +#endif
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>  
> @@ -1437,7 +1464,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_userptr_vma *uvma;
>  	unsigned long notifier_seq;
>  
> -	xe_svm_assert_held_read(vm);
> +	xe_svm_assert_held_read_or_inject_write(vm);
>  
>  	if (!xe_vma_is_userptr(vma))
>  		return 0;
> @@ -1467,7 +1494,7 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  {
>  	int err = 0;
>  
> -	xe_svm_assert_held_read(vm);
> +	xe_svm_assert_held_read_or_inject_write(vm);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> @@ -1539,12 +1566,12 @@ static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	xe_svm_notifier_lock(vm);
> +	xe_pt_svm_userptr_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		err = op_check_svm_userptr(vm, op, pt_update_ops);
>  		if (err) {
> -			xe_svm_notifier_unlock(vm);
> +			xe_pt_svm_userptr_notifier_unlock(vm);
>  			break;
>  		}
>  	}
> @@ -2409,7 +2436,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  			   vma->tile_invalidated & ~BIT(tile->id));
>  	vma->tile_staged &= ~BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
> -		xe_svm_assert_held_read(vm);
> +		xe_svm_assert_held_read_or_inject_write(vm);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
>  	}
>  
> @@ -2445,7 +2472,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!vma->tile_present) {
>  		list_del_init(&vma->combined_links.rebind);
>  		if (xe_vma_is_userptr(vma)) {
> -			xe_svm_assert_held_read(vm);
> +			xe_svm_assert_held_read_or_inject_write(vm);
>  
>  			spin_lock(&vm->userptr.invalidated_lock);
>  			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
> @@ -2721,7 +2748,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	}
>  
>  	if (pt_update_ops->needs_svm_lock)
> -		xe_svm_notifier_unlock(vm);
> +		xe_pt_svm_userptr_notifier_unlock(vm);
>  
>  	/*
>  	 * The last fence is only used for zero bind queue idling; migrate
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b7b8eeacf196..3ca46a6f98c7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -394,8 +394,19 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
>  #define xe_svm_assert_in_notifier(vm__) \
>  	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
>  
> -#define xe_svm_assert_held_read(vm__) \
> +/*
> + * Assert the svm notifier_lock is held. Read mode by default; write mode
> + * when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on, because that path forces
> + * a userptr invalidation that ends in drm_gpusvm_unmap_pages() with
> + * ctx->in_notifier=true, which requires the lock held for write.
> + */
> +#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> +#define xe_svm_assert_held_read_or_inject_write(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +#else
> +#define xe_svm_assert_held_read_or_inject_write(vm__) \
>  	lockdep_assert_held_read(&(vm__)->svm.gpusvm.notifier_lock)
> +#endif
>  
>  #define xe_svm_notifier_lock(vm__)	\
>  	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> @@ -409,7 +420,7 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
>  #else
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  
> -static inline void xe_svm_assert_held_read(struct xe_vm *vm)
> +static inline void xe_svm_assert_held_read_or_inject_write(struct xe_vm *vm)
>  {
>  }
>  
> -- 
> 2.43.0
> 
