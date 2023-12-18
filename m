Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B44C35274
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A0210E28C;
	Mon, 18 Dec 2023 18:20:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7996010E28C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702923620; x=1734459620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TD9+gzLSdRutrT7jUNFKI43xVdrCbbYKldil5uKK6vU=;
 b=IL48KsuCCXXDjUtAu2ZcHIDfaXdtKG7Cnztp++sFDA0+yVNGOiRMqhbx
 apCwGVMRKBNpCrriyrnR/pshIKpnu0PpYC8bqPtvnqXjvXpw8kkgXC9iG
 FGLkgdxRjnPfd7fswbQf5XVrlJYBFJCciOHNvruEmi/YaJ/2mRJAJWL3n
 +m1+tzEGcArhoEjMAJi/E/7RI21eWiksq08IMFHeUiPWnZNT77IcQughy
 yzSwCAwZclmE1IVY5E06zFsFflGRVDmnilVlONfkxwDMJsIbPAdbM90h6
 sN0BMZU9zD5U86EhlDztg+yczBatfht2eWVo6A7x/Yfl4WTvql1qjVEw6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="8985448"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="8985448"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 09:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779164063"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779164063"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2023 09:11:22 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 09:11:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 09:11:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 09:11:07 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 09:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrZ4bARD9NU+ARifmlBYuk/YT9oVhCqmBkGaLGw+tTvEcI02WHBPaIPgRq70Bc5P47MKlzw7kHMG0Vb+CaQE/8pBDzLRZ0XrarrIEWWnukSrszl369l/AtevEck8pe/7ZBADq9tQsnLkAR9AfjhmiBZNReL7RJPKELz1J/zmRznFBZef3lJQBz20KdijQaQo1tFkMLQTSxJss0lp3j3Pgl0b1UJj4l7GWBQZvNy2J32hyaLpgKg60bs4DUtAGJ6LmhVfiMwRPaLF6GdJKGwW89q0KU0e8MxKWzX6I3fs5WA26mKUL6eMOk2L4qgaCZdeP5bwxjGc1Bk0vh/wgogRNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krsELYfmHRm/78jlI9XYkqKXlQ+UoGzS3IwM/VuZgEE=;
 b=j6WCTmwkA44O+uoYTv0pTZP4ilSAO+11ngdWdYrVsACcb+Juru1km51tp1o3EFJMrFFqO7fysqwUCStqI1C8tE4aMJ04Uf1m5fxiflhse18FCNB7uru6r3o0fUPQKi9CoX1Z9wzL0xUil5+aYGz20FsBG0af6xmVcib3i9VhaTJdOFrlzQm0Guo/yr17AZU8vyBof2VfiNdqQMd7MIU75HZG9Kk3eVFGRRP/mK4jTWEKywzrVOeJmZJh8RcVxjHd5Qeg+AH+EszOqEzdXGlmlPzxOrqpzjfgCN+2tyhyN3YPqc91K1FRLcaAvohOxYD3f6OJy9Y9/PUkARSYpOOXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 17:10:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 17:10:55 +0000
Date: Mon, 18 Dec 2023 11:10:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix UBSAN splat in add_preempt_fences()
Message-ID: <nx6k4krsw7stwm4gl54livsfxx3rntdlm67btiz7ny52f4eb7h@ry34d3vkjr6d>
References: <20231215230203.719244-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231215230203.719244-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fae053-9931-4502-dffd-08dbffec4bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ji7aK/MwQS9DqhJcgRkUwdRMBl6O8ZqCp5ysTGQXwilbkuimCg7fpFDhZm2YsLwIHG6Sjh67zqe9vyhxW/qVvzl0G0+j3r0csX5VS3GpZ9CTlOApEuFaL4f9eyxs+WwPxRhdGkWjvQy9OwV2D/5NaSAoy7N7FwuczZYiYZjybM9EKDGdyLARsfnN1kPFQdJLEyxkZO9HmKuxX1qxReAjZtuHir4xiRWKwN4xQ6SE9hqnYKew/gNO0QfmJhtTbzJilbmOp/Y4nQTIesUqkH4jXlF96N7OhTzj1ca9MYgar0ExhszwlsEE2fZKRM7bdJuVxB326zoK3Nl93ZABXXDxKvmzEZsDPXSHPsVzJCI7mKBayP1ysOC4iV1Lr6PNHNgOU3ph8e1nz5RNIoNUy40olSo5MNjwFOPSXT23xcrTqUvcGUNjJuGZl4aze7WkYYZxc8Ya39edNItX4AUowIK+2ZlJ0a05o97VIqo6VE2qdZiMo1cOXQN19hDsBidOw/eH0E1r3zAvlHlctI14ACl2h2pBCcUXXReZWV1LaNZ5SRItAPQeIHdNsHI5r3XSwdUu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6506007)(6512007)(9686003)(26005)(5660300002)(83380400001)(478600001)(2906002)(8676002)(8936002)(6862004)(4326008)(33716001)(6486002)(66556008)(66946007)(6636002)(316002)(66476007)(41300700001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Xx9xeJOaitHxq4t/H/UZGYN3Yp/S9aMATCVK+nxJhnUbibiX8QgtPd9bt4g?=
 =?us-ascii?Q?f5/jDJUM7yvVbJ1GoxTEV4Qf8JGZ7pJjemq64TIG87/bV9siViy9Fr632rHy?=
 =?us-ascii?Q?pqupXLBbZR+cRikI4DFIld+h9J/8mrsWhVn2TLPLOKYtAwR3iBZhH/nudFS8?=
 =?us-ascii?Q?HxJ4DErEvo84WchDXtGcN9hxv6w8FR23PSrpE7ZfwmqcDQwnh4N1u2svf10D?=
 =?us-ascii?Q?9m9P/umDRRmlz5ttunDBc1BI0uZx0dyKrchIbwiZUMt6Dxi9dyw8Icm6+NN3?=
 =?us-ascii?Q?Bc3lc9oXaZpz1a3nuJgbJoOwl9OSLFiSc8HvJzIeIONeWcWKIWjqkNq2bZ3V?=
 =?us-ascii?Q?iF7azdd5tiyhdfMfSI600h3oonlX0eDVY1aK6oXGVO+3xu6lm4NYIef/qVCl?=
 =?us-ascii?Q?9T2CR3KAwGFEosoXNCPwS4hHEINJxrx+pHWOLu34iP2WKSxZtgcsdFjIKsx/?=
 =?us-ascii?Q?9Bsw/wD1EMDvNbJsqrspbWir/kxkKC/M0xQ68rQ0UMvb0ENcw0MTYVSdxPwD?=
 =?us-ascii?Q?zK+GPgt5RLjhOWi/VZt9WtYzJDJ84BDC2wraWUndDHuURfrm2RPVrHp3zFUm?=
 =?us-ascii?Q?GhEnZ438U8lDQYFMHPxZMjRG13LpgzNyjEVGkGc5VedcVcYSLTjrkrpF3NUn?=
 =?us-ascii?Q?d73sFZRmPHfAgj+Bj5gtY//62cm9t6kOZuKTggV7IYFD4h8VcGheeweSspKx?=
 =?us-ascii?Q?NO/dQXi5ecDF/L8L0/tE4XrluuYFbwKFLA081FxiLM6atYyak9V69DRKvLUV?=
 =?us-ascii?Q?nHCe6npLGLAx+H0iOrCJFi3aCMXP2GuV50aBJQFUzAvGuc3Yx1GNmn7LdUb3?=
 =?us-ascii?Q?W4NPVEmh1VfhbjPbJxQWh4NlFNrp4t7msGUmRKXcqddQXaVOPV9q0SDH2W/S?=
 =?us-ascii?Q?Qd8/q7XQqx4IvAXe6g40jKKU7NHRT9Xqf0/nWN+RhqyLRp/tdgowLltYFkLu?=
 =?us-ascii?Q?sOQp6kSS8mzYZ6CDrooOPrS6E80BkX7IFjQNB3JzMV+QRdLOVCd5px06dMyw?=
 =?us-ascii?Q?j+P8/6Vssjo4uOvFEA3SjPG1FNiP8IPHkSUufu6XspLO+L2g7kkuAjq9brJw?=
 =?us-ascii?Q?an33bZrtvaII+lV4E6NQ4+hEWS7peK+s0n+yQavh+dlC53rF9BhXDUclocWU?=
 =?us-ascii?Q?6tIK4onTPYfm81XcV/kHVoMH/9XFluGstpJ+e26rVlAuckUm1nzYTWDqif70?=
 =?us-ascii?Q?yaJM/wMSTD2B1PlYFENya1jNASvQbZSRt+KkpkqKD3BldXDTjLe5tj9HZ9ba?=
 =?us-ascii?Q?3XtSVm/T0K2OPji0aLiIz2bYGUci7ZqFbuzngzo7ev847rGHjDiRNEs+zzXn?=
 =?us-ascii?Q?cABttEVYfham8GNDSEyIEyuaa+vwORqgdVw4x5c6swkPhcs/77Kmj3tbcdI2?=
 =?us-ascii?Q?JGpYF0i01kW/QXJ0VJK4h5XvjJw4d3IIfMj3REXB4iMKJr8pXqzcxEs2uAlG?=
 =?us-ascii?Q?ruDt/06GaWnR8St3EtR9e54vUwGAsGdUJbS7auNKpLXyPadkZmzrb3FYJUj9?=
 =?us-ascii?Q?VHKC3hzTZjjvHL0MpnVvJNKZ72k1egBRUGGZfifTxuO2UwRbRhGyqBkxDkMZ?=
 =?us-ascii?Q?ktyFFT99N5gnpNHXIzPmrG/W+swyYoFBfGA38F8xhJScYoQVSOFL2L6PBhVO?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fae053-9931-4502-dffd-08dbffec4bc0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 17:10:55.3094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD0axE3yZLu+Qt6s+2whYVW5tnjXEm2UzEHVPiZLdteT4ZQslt6C77GmzN88UjKttKnODN34p2mu812pZVNoE77Ipm5LZSP9ZxRKoh3tqn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 03:02:03PM -0800, Matthew Brost wrote:
>add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
>0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
>if num_fences == 0.
>
>[   58.652241] ================================================================================
>[   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>[   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
>[   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
>[   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
>[   58.674547] Call Trace:
>[   58.674548]  <TASK>
>[   58.674550]  dump_stack_lvl+0x92/0xb0
>[   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
>[   58.674559]  ? rcu_is_watching+0x12/0x60
>[   58.674564]  ? software_resume+0x141/0x210
>[   58.674575]  ? new_vma+0x44b/0x600 [xe]
>[   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
>[   58.674612]  new_vma+0x4b3/0x600 [xe]
>[   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
>[   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>[   58.674680]  drm_ioctl_kernel+0xc1/0x170
>[   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
>[   58.674703]  drm_ioctl+0x247/0x4c0
>[   58.674709]  ? find_held_lock+0x2b/0x80
>[   58.674716]  __x64_sys_ioctl+0x8c/0xb0
>[   58.674720]  do_syscall_64+0x3c/0x90
>[   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>[   58.674727] RIP: 0033:0x7fce4bd1aaff
>[   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>[   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>[   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
>[   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
>[   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
>[   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
>[   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
>[   58.674747]  </TASK>
>[   58.674748] ================================================================================
>
>Fixes: 099192666a18 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Applied to drm-xe-next, thanks.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_vm.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 322c1eccecca..1ca917b8315c 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -279,6 +279,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> 	struct xe_exec_queue *q;
> 	int err;
>
>+	if (!vm->preempt.num_exec_queues)
>+		return 0;
>+
> 	err = xe_bo_lock(bo, true);
> 	if (err)
> 		return err;
>-- 
>2.34.1
>
