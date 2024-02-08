Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8984C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 18:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE0510EA48;
	Thu,  8 Feb 2024 18:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4GN0MlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A1010EA48
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707418723; x=1738954723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p8Fvsohmyey4NeQDe5VeiUNjm0Pki4EaVbrrJpusTo4=;
 b=b4GN0MlM+qtk3+Zpax5ZVo2Qr9mwehl1xIjCLWM0ZbEE3IaRGfvVnSuc
 Zz8poxa8ruZncMtYAZ1DeFTVQuedLJ7zmqJylPtZXI6T7fwUKUq34OVD3
 cI4NwzyY/WNTBFySPqXZxR1gE43oRb9HpnYngTpH6giM/dEy/gUo7dhFP
 movsJE15H9jLjiJYrOCkHsIT7nYNKwEEU/mmdQyirwo6n7hsicqotZbfs
 JB4WLt6iHogcQNbJx0B7mcmWI2vMOteapZN+S3MhAewAxRcpr4g79APNh
 iLR+0Q2OXDzQzRHZ5dw0SG6LASp5HMzlNjeHCIzd1bFMs4SDDtuSkGCyc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12372255"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="12372255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="824920742"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="824920742"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 10:58:36 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 10:58:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 10:58:35 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 10:58:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDYM+Ei7RCcCOYE4anpUauLht7p51REiMW0hfAQpqc+bEOzD/z2kERrwmLvkVZHwzBCnCAJR1m3wGj2SdSgd9Ts9ffMA2cKeEwoUd9w4o5FWdQ9vWW0LQWPiOChhvHdqIvY7mVEVdsqIi+BWnZD92ia7NoKWqWGRxNNN6H3CBPXYIWSlSXKkgpszE6ggC2/H4Z6XpXSMd12/K5i6/iY8uyR/9NAjIvfXcLxluD9csNwmWdxcRRc0cMiZlDmB58nHQXkMPl+3pHc0K8UczKsus7iTMHfSm0Bg/0CFnUiS0vFz677TsM0f7IfVAvvt+1uJdM8hLtw6um10HzNxJVbalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSaQzxRpN21eDCn49uRd93A/baCfdviEqJetJruMB+E=;
 b=BCHG8gdi4XlpMXh42cFOuS4OzULfPAYmy/nQZ92CDhOtQu82K3FOxJkCbJTYoZShpKXXdLl5nUwVh05TWo7g1xs4KeHxL91wjwqVXy3DZJYSQ9W65Cea5GSLCGThTfv+ziz7+b+P2gxpaTkCUCa3V7n1DkxaLFVLbTeG30DB6uvXBrVyT7kdwkH5xssjjoQwP9sgPFMC4wjIFn42eduHhN/EPiT+R/PMHaarKkwjctrjLjgqmifq8axA08Ah6ziJZ+OESD9NtADJR7ZD+2TmO2/ibjC3fWLzRUAs/d0XEAzOY2Ey2LjrUEzH9VM/mQGvxek/kN8ZWflfhxa5dPl32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 18:58:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%6]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 18:58:32 +0000
Date: Thu, 8 Feb 2024 18:58:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pt: Allow for stricter type- and range checking
Message-ID: <ZcUkPQ3VZ5CnrXka@DUT025-TGLU.fm.intel.com>
References: <20240208162258.6388-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208162258.6388-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: df09047c-e0ad-4bfe-4d21-08dc28d7f1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C0UcGz+MmKQTJ7GmbBxViGeFywpTqYKQfYT77uW24QOMO9nD3gPb5C+aHqBU85pwXZmyy+LWrM56xEyfc6bGPgAFg2fSVTQNCDiekUztQJz/Prq/sH+UV5oUSeS7q2tOl1ERSaioKz0IFQRYPMT97y236hnxkVeIzG/iE95/r83syWns1If5VqNr9KDD7kneeBopBPzQGFM3W4J7RWee+sUKUX3+VgWPjY9bVrihwWYlXM62yek2QvaUAIeWNJsQDljtvAQc4VyK0IiW6lmpk236JOn/gOEElembUOOUT08ft25iX5kPuUD/0D1C2/4/GexjFPjgmdQDxvjKSWqaOq6mlJzjZhTMlw54T5hiwmPZAODfELyz7EfXTPuIxTbjs+jf2B9r440yqijPRj9yWnLFXqso1GJ790TMp5Ks8+NRMb/PHgYI1LrmRUzfDYlOVrNgkA29h1Od5xOn1qirqPnOADjMJgDCYrgbcaKltZRfBcTbDXZ0Yf/nEGwsAdUHU9ul9e+ZpjX6Je6LiThNGuUu/CVV/mRxk4HTA20fSaeiGma3dQpJNt9IteQ6949a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(5660300002)(44832011)(83380400001)(82960400001)(26005)(86362001)(66574015)(41300700001)(6512007)(66946007)(316002)(478600001)(66556008)(6666004)(6506007)(38100700002)(66476007)(6916009)(6486002)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5hrcBMfuNgkSk8CiVmDwzGcwBxMkeRz3mLWgPVQh811rIzDyRpBZf6iYoq?=
 =?iso-8859-1?Q?9+wwVVcIF6hurwlcpU75PXDe/mmzr/h0lHqVKTjYxwLxCNRLzuMRMZsKoj?=
 =?iso-8859-1?Q?1C2OD8Pju3RUbaiSo2qIHmE3xxKFnLxqsP9W1tJSjHRwFabHWuL3UJMjbN?=
 =?iso-8859-1?Q?wdsfX7MwOKqMni3B4meHpthCLCxvXBi0Br2dndXX/4wZc8sPWaJVk2V3So?=
 =?iso-8859-1?Q?jhG8VpXl9gFw8GLuAb2S11lFX2Gu37oZCwHoYs6cjmFGNEIWp4oVYB/M9u?=
 =?iso-8859-1?Q?SNjBrQW4bCFSbbrplm0+/rXH9BnM//YsVGIuniI7xkCC8Z6+fihy3mMlZP?=
 =?iso-8859-1?Q?+rsqXBPESDySyXO0dM1v9G0tayZ8X8nawE7ALYYBduMIky/1CWILBIwpgc?=
 =?iso-8859-1?Q?6NX3QfNsn2QnO5iKKyIGG7iHrUCSis1O8ZXhr4k7lwtlF+Ofc6SoEsRuVR?=
 =?iso-8859-1?Q?vDXN2BLM4WNRrfvLNJRaTCZLWK/uWOf6kRp4ekxv0oAg7th+NWMe5qfSHk?=
 =?iso-8859-1?Q?ZZMjZPTlxX2Xa5qb3RXSR+ZR8MamtUol7Wre4L8YrzYi1xQ3H28hFrDpO4?=
 =?iso-8859-1?Q?bKfWYWimXWZCnAYdk3WrhVNBLBwwc5okcwHYn6TJyBcf8dE6WNFNfDET3Z?=
 =?iso-8859-1?Q?qVOPa7ZWODN0o3dtVWb00gmAu64RWLC3IHkj/foBOCaNUTGEChBNj6slSE?=
 =?iso-8859-1?Q?j6fDRwMUOscsAOQiTwbAshHJdmrlEDDJxi7Z6+5YPIXxJGcEasw8KFLteW?=
 =?iso-8859-1?Q?gI+LfBzKBJLn/clpOHljH2VOyHBNPbJYqtIyWoBlHPof6mdJrmyVT1Wm8V?=
 =?iso-8859-1?Q?2WeS6Ta8GNNnzb3ck70gapSspMMPy81OqT8NR2Hv0x2PeWGgAZwiCuFoOd?=
 =?iso-8859-1?Q?uTQuRkQaUzVj1Mi5bjmpDNl7VPT5Z3UXJUqghwTSK1Mg8YQvAxikUmeRG/?=
 =?iso-8859-1?Q?SE9JYipOh5WAxKs1UnKRuZb9MFG/bKNDgMOj76AMvVy4PtLO0pouxQVh8d?=
 =?iso-8859-1?Q?P8vhBKZTm7Ykpiaj6MVerbjkkTQGNv/VRjcHtoVVuagsY4VPLApw2K5vpY?=
 =?iso-8859-1?Q?pFCkXPvm6dMS6lIYTpVJ4be1fsC+huKLi9jFziI378ID6N7BcIIZdoX75r?=
 =?iso-8859-1?Q?d3DVhdSn2/UiQrenxK9VV+Q1haBP2SYoLnTLdwv3YxPxE/rxhL2yf6VAH2?=
 =?iso-8859-1?Q?XLb9Z4Qka3AVqirfrUF2K3Ja13KlI+F+0S4Nh5kOpcrNFkr7zDy+ciq5Ww?=
 =?iso-8859-1?Q?6XCQwg5aRnqgRg21kziZFplByEwUBNIYgCfN0mR7Qa5k5iPFHW1LcTvb5d?=
 =?iso-8859-1?Q?vFk9JwNt4XYwq4YJ1CmdchOWdAld0KWWNuc38xtU/pA9hDGFEuF8hT38xn?=
 =?iso-8859-1?Q?LqGrhINeXOmNF86aQMNpX3Lsi0yr/dlAaodkjzjWZyOkk4moAmIz30LlK0?=
 =?iso-8859-1?Q?kAannfAKCXJ5X9zr/3hGGdR+9WWQiWzVKHirBdpV7WJ9ox0Rs1EuCQ0fMF?=
 =?iso-8859-1?Q?6XPVxFUCcd5hoJf2Q45fYDuCRb9TGD86PSKq2OG1gP6WfrdeVklJbuOeqG?=
 =?iso-8859-1?Q?XBmHaAvHtndu36cIzkJAtZGEZUZqx8YA6jYdo/8CCNCSqErw5FdA0KgihR?=
 =?iso-8859-1?Q?scKxC2lONxyowyfAvQZt9DDAtnTMigFQzPbLvoVUnzn3ywhFKdcCTnuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df09047c-e0ad-4bfe-4d21-08dc28d7f1e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:58:32.3101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AoirTdS5d0wBeQyKZYEI1AULOnZkvl2kMXUnRxflTmhBKlvdW6AhGZoUzDGW48mpc3w+lLvue/mfayhzMmX+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
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

On Thu, Feb 08, 2024 at 05:22:58PM +0100, Thomas Hellström wrote:
> Distinguish between xe_pt and the xe_pt_dir subclass when
> allocating and freeing. Also use a fixed-size array for the
> xe_pt_dir page entries to make life easier for dynamic range-
> checkers. Finally rename the page-directory child pointer array
> to "children".
> 
> While no functional change, this fixes ubsan splats similar to:
> 
> [   51.463021] ------------[ cut here ]------------
> [   51.463022] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/xe/xe_pt.c:47:9
> [   51.463023] index 0 is out of range for type 'xe_ptw *[*]'
> [   51.463024] CPU: 5 PID: 2778 Comm: xe_vm Tainted: G     U             6.8.0-rc1+ #218
> [   51.463026] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
> [   51.463027] Call Trace:
> [   51.463028]  <TASK>
> [   51.463029]  dump_stack_lvl+0x47/0x60
> [   51.463030]  __ubsan_handle_out_of_bounds+0x95/0xd0
> [   51.463032]  xe_pt_destroy+0xa5/0x150 [xe]
> [   51.463088]  __xe_pt_unbind_vma+0x36c/0x9b0 [xe]
> [   51.463144]  xe_vm_unbind+0xd8/0x580 [xe]
> [   51.463204]  ? drm_exec_prepare_obj+0x3f/0x60 [drm_exec]
> [   51.463208]  __xe_vma_op_execute+0x5da/0x910 [xe]
> [   51.463268]  ? __drm_gpuvm_sm_unmap+0x1cb/0x220 [drm_gpuvm]
> [   51.463272]  ? radix_tree_node_alloc.constprop.0+0x89/0xc0
> [   51.463275]  ? drm_gpuva_it_remove+0x1f3/0x2a0 [drm_gpuvm]
> [   51.463279]  ? drm_gpuva_remove+0x2f/0xc0 [drm_gpuvm]
> [   51.463283]  xe_vm_bind_ioctl+0x1a55/0x20b0 [xe]
> [   51.463344]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [   51.463414]  drm_ioctl_kernel+0xb6/0x120
> [   51.463416]  drm_ioctl+0x287/0x4e0
> [   51.463418]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> [   51.463481]  __x64_sys_ioctl+0x94/0xd0
> [   51.463484]  do_syscall_64+0x86/0x170
> [   51.463486]  ? syscall_exit_to_user_mode+0x7d/0x200
> [   51.463488]  ? do_syscall_64+0x96/0x170
> [   51.463490]  ? do_syscall_64+0x96/0x170
> [   51.463492]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [   51.463494] RIP: 0033:0x7f246bfe817d
> [   51.463498] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [   51.463501] RSP: 002b:00007ffc1bd19ad0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [   51.463502] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f246bfe817d
> [   51.463504] RDX: 00007ffc1bd19b60 RSI: 0000000040886445 RDI: 0000000000000003
> [   51.463505] RBP: 00007ffc1bd19b20 R08: 0000000000000000 R09: 0000000000000000
> [   51.463506] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc1bd19b60
> [   51.463508] R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000010000
> [   51.463510]  </TASK>
> [   51.463517] ---[ end trace ]---
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c      | 39 +++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_pt_walk.c |  2 +-
>  drivers/gpu/drm/xe/xe_pt_walk.h | 15 +------------
>  3 files changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 3a99bf6e558f..1e35c7525447 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -20,8 +20,8 @@
>  
>  struct xe_pt_dir {
>  	struct xe_pt pt;
> -	/** @dir: Directory structure for the xe_pt_walk functionality */
> -	struct xe_ptw_dir dir;
> +	/** @children: Array of page-table child nodes */
> +	struct xe_ptw *children[XE_PDES];
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> @@ -44,7 +44,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
>  
>  static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  {
> -	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
> +	return container_of(pt_dir->children[index], struct xe_pt, base);
>  }
>  
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> @@ -65,6 +65,14 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  		XE_PTE_NULL;
>  }
>  
> +static void xe_pt_free(struct xe_pt *pt)
> +{
> +	if (pt->level)
> +		kfree(as_xe_pt_dir(pt));
> +	else
> +		kfree(pt);
> +}
> +
>  /**
>   * xe_pt_create() - Create a page-table.
>   * @vm: The vm to create for.
> @@ -85,15 +93,19 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  {
>  	struct xe_pt *pt;
>  	struct xe_bo *bo;
> -	size_t size;
>  	int err;
>  
> -	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
> -		XE_PDES * sizeof(struct xe_ptw *);
> -	pt = kzalloc(size, GFP_KERNEL);
> +	if (level) {
> +		struct xe_pt_dir *dir = kzalloc(sizeof(*dir), GFP_KERNEL);
> +
> +		pt = (dir) ? &dir->pt : NULL;
> +	} else {
> +		pt = kzalloc(sizeof(*pt), GFP_KERNEL);
> +	}
>  	if (!pt)
>  		return ERR_PTR(-ENOMEM);
>  
> +	pt->level = level;
>  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> @@ -106,8 +118,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  		goto err_kfree;
>  	}
>  	pt->bo = bo;
> -	pt->level = level;
> -	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
> +	pt->base.children = level ? as_xe_pt_dir(pt)->children : NULL;
>  
>  	if (vm->xef)
>  		xe_drm_client_add_bo(vm->xef->client, pt->bo);
> @@ -116,7 +127,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>  	return pt;
>  
>  err_kfree:
> -	kfree(pt);
> +	xe_pt_free(pt);
>  	return ERR_PTR(err);
>  }
>  
> @@ -193,7 +204,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>  					      deferred);
>  		}
>  	}
> -	kfree(pt);
> +	xe_pt_free(pt);
>  }
>  
>  /**
> @@ -358,7 +369,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
>  		struct iosys_map *map = &parent->bo->vmap;
>  
>  		if (unlikely(xe_child))
> -			parent->base.dir->entries[offset] = &xe_child->base;
> +			parent->base.children[offset] = &xe_child->base;
>  
>  		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
>  		parent->num_live++;
> @@ -853,7 +864,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>  				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
>  					      xe_vma_vm(vma)->flags, deferred);
>  
> -			pt_dir->dir.entries[j_] = &newpte->base;
> +			pt_dir->children[j_] = &newpte->base;
>  		}
>  		kfree(entries[i].pt_entries);
>  	}
> @@ -1506,7 +1517,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>  					xe_pt_destroy(xe_pt_entry(pt_dir, i),
>  						      xe_vma_vm(vma)->flags, deferred);
>  
> -				pt_dir->dir.entries[i] = NULL;
> +				pt_dir->children[i] = NULL;
>  			}
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pt_walk.c b/drivers/gpu/drm/xe/xe_pt_walk.c
> index 8f6c8d063f39..b8b3d2aea492 100644
> --- a/drivers/gpu/drm/xe/xe_pt_walk.c
> +++ b/drivers/gpu/drm/xe/xe_pt_walk.c
> @@ -74,7 +74,7 @@ int xe_pt_walk_range(struct xe_ptw *parent, unsigned int level,
>  		     u64 addr, u64 end, struct xe_pt_walk *walk)
>  {
>  	pgoff_t offset = xe_pt_offset(addr, level, walk);
> -	struct xe_ptw **entries = parent->dir ? parent->dir->entries : NULL;
> +	struct xe_ptw **entries = parent->children ? parent->children : NULL;
>  	const struct xe_pt_walk_ops *ops = walk->ops;
>  	enum page_walk_action action;
>  	struct xe_ptw *child;
> diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
> index ec3d1e9efa6d..8e57b11edcbb 100644
> --- a/drivers/gpu/drm/xe/xe_pt_walk.h
> +++ b/drivers/gpu/drm/xe/xe_pt_walk.h
> @@ -8,8 +8,6 @@
>  #include <linux/pagewalk.h>
>  #include <linux/types.h>
>  
> -struct xe_ptw_dir;
> -
>  /**
>   * struct xe_ptw - base class for driver pagetable subclassing.
>   * @dir: Pointer to an array of children if any.
> @@ -18,18 +16,7 @@ struct xe_ptw_dir;
>   * embed the xe_ptw_dir::entries array in the same allocation.
>   */

The kernel doc needs to be updated. Other than that LGTM.

With updated kernel doc:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  struct xe_ptw {
> -	struct xe_ptw_dir *dir;
> -};
> -
> -/**
> - * struct xe_ptw_dir - page directory structure
> - * @entries: Array holding page directory children.
> - *
> - * It is the responsibility of the user to ensure @entries is
> - * correctly sized.
> - */
> -struct xe_ptw_dir {
> -	struct xe_ptw *entries[0];
> +	struct xe_ptw **children;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
