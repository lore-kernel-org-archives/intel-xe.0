Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ADBC5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 21:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DD710EA7C;
	Thu, 22 Feb 2024 21:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0Gjw9ta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ABA10EA7C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708638042; x=1740174042;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s+e4eTpTe76CzZBhke6xbJQY2FJdo1ycFNGm7gw4YGg=;
 b=I0Gjw9taeubEH9wJrkic/5SX7wsp5PSKDIK+xL+N3OwIPbskrqLQcfEH
 LmBrk1FuucebIomGhcj1GkEx1B4/0pBxEqkSaySY9ucanNC8W7D74TVK9
 9p9td++qwbE7Fpf9xQb0Ln3DP0BPkFLckfuHYyQ7LnNvZeYnFN5GR0iC8
 PgCtW+lnjlwh46QKbfheHEx0Bk5I470v4xtSdzlhmX6lxnBmjgLVI9/1J
 TdYlsnmqr22rDi89U64++R/Nidxs7tWUDmxZYq3RGPh3Y+tpZoVNMoYtT
 3PLE9s3pyiPSahRhDxHQexOnr5v7O4ZBWvhJRUsHfUjWqa2Une5Mf6n9e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13524308"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="13524308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5993162"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:40:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:40:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:40:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:40:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:40:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKlVLNkLSIUe5/ppQrtefZ/Gu5D0tHQFD/hTmZABpw4itZ21ly4+iB/SY4ctbnqe76mcBFmB1FVGWrS97TDvnll+hNETZWQPkARHSVmgJJObRMUu/wdKp4qearXTVoK7G8vPKe5YT8+BjEhsPhzuhv8Zu1dQ1Eu3ZHZ7xkeB0txgv5yY4MRPh+icPfn/+xgEZ4BAcafsLpVPdWbovdfsx2Kt1ctpThJN44iXP6b5Yj7NAjVMvMBDa09Jf/5mzoD161FbFcv848R8D4fh2gjMeZ5rPAIAqyiuM/cAtQQX0KsL2vlscqNFdvKNvKw/GCU60LfKAezoMBzKCQdzAI3U5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPc5sF3u6Og7gGmNFrS6HiZZykTps1me/xgs38Vbwn4=;
 b=ElRqc311KxxrfMMaQULjsrtunT666h2mMoI8UIVhYmov6yU2GzgxaHi6iQE+sBm4Ytufx46LUMUgLlXFOEbzpM+a4iWIip3pIOtR9d1SHB6/HUmgQPdSaO7W03uL67Sg+g3pqtZgA/fO3xUGiXfRqr/EBUTDAyGvJKIXNrUoD9gUVAtV2X1/n7L87frpfzG6pv3p4FdqSV6eISa/DPNTE5yUGYUVzfgcRy5xwbfMgw/mZN8mvDWKpBqbvQnkePngiCDX036Uces2QUzmSp+wKrfqXi8Rm3dPEsj/vNCayk4lS3MX+9yiG8O2bUyoL6ZW+65y7MODlq3I3RI74EXx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 21:40:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:40:32 +0000
Date: Thu, 22 Feb 2024 16:40:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Fix execlist splat
Message-ID: <Zde_TLxu85rXLszE@intel.com>
References: <20240222035906.3835257-1-matthew.brost@intel.com>
 <20240222035906.3835257-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240222035906.3835257-2-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: c064e2e4-7afa-4cfa-384f-08dc33eee50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GkuO7rczGq0dyAsr7RENqpw0usJmWaCL/8mhioVvBUej0AdeqJ2gmBb7KNq5b+hyXymAWNu7tzFClahkSpv6UtS+bqNtPz9QFbSmdi104DB9UJzY1aVMEcUcyz/RYZFCcOQnASa/05jvvB6bdImDcLM0XuOobTHJ30C7zB5XWNa4sjtzSkvew9PcBt4cT3nuyh13VAkk0ZhRGpAXhsnDajDb63/oM7+Q5CMPKQYnP438Jf2TZN3krWClxQmJoRvnyhw1AH+HAw5OTEvQlVuHDdhhNL63RAdNmgccS7DjVkkUXA2UNMIVb57GeAedNtAGo3vIHI/7hm7a+gAKPcI0tyDxaFvkxWt4oD1/T/tcAGRqwr5TpPi8AZfa72tO6eMPW/eRAyqBKYrXXILJBiQg5zvqD6Ld3E/gqZ0rQCM5uAMrbRy2+GCkB14HpFk70dlSZ2zAUGEaqh2Xrk0WypsV/1DFa/hgAHqxXzUZqI9O93T+sGbX6RcGWVFdOoDe4v4p2FGScLf+bMnvcqw6bz9gQsm+qfF3HM923Ba6la970wCWiGlfdY7qJN4cAK0xcwdp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtC4X6Iq4Lnjk256gmkjsoAcCUOYwsT8PT7Sgh1O7p8Bn05lwnu41VEXU2Ok?=
 =?us-ascii?Q?TpQr1rlP19/G6BiCcTTyefQ23v1PYY6z82Rt0eFVJeZFCbEXIUW4VdNhTZFy?=
 =?us-ascii?Q?yfoGL5c+eQQakNaDoFLHOJIuEdPikcU86V13IQV0FjwnQ0pzxdwUGbvogad3?=
 =?us-ascii?Q?utuNPi8nr3G6qR1mItPHvMzf/A4YQnWqCdhyAbmRka9qrlkAT0zxiyeEkEj8?=
 =?us-ascii?Q?HWQ27f5TW13G7h065NZk9esqi8c1NkkUqZrFiJT3f3hWC3Cx26orprQbVkXY?=
 =?us-ascii?Q?ncW/qsd15Z8R3nomVvZw3ANHISIxpL4zJoWif0nnLsrgHesAAoQ2W4CjY+9p?=
 =?us-ascii?Q?iJEomuxDNCB1Fdq248a/Rc1JsYkAZAGZsGeBfablA9ckdi7AzxBR8gQKSMhW?=
 =?us-ascii?Q?9AfBfvyCGHmx+XwqoaqWz3NcU+yR4nQc+naAZxVIWlUlAeV0oZljlrqqL0pP?=
 =?us-ascii?Q?MKrLPKcenXtcg14qXi68DN71JR+Tsquw1jXvG+9agXbzQpKbOkd31DJ1q+WI?=
 =?us-ascii?Q?xbkYcGSeQUEjruBPpgrEWXeyQTbBzDzkO99Vvnwov16XHA+H4WBPrlfJBi/r?=
 =?us-ascii?Q?a8gTbc1SMbiK/QQwLGNwMc5O9rCSIHaet8DQl8NE4UYusSseCbDQMtXeqwjL?=
 =?us-ascii?Q?Qp9Ks/8Ucs39BnhoWl8H6mT7XFKt/Pb2W9nfoiO1leuvkC1bSx1xWeAOK5Mz?=
 =?us-ascii?Q?Mq80a9ixCzI5F/ZjQxfuCQuQm/lmY46J8DALNd2A3OGKX/ryLrTo+LjlsXC0?=
 =?us-ascii?Q?Kk31OXJigJWFfOnEg1wuFy2f9+8hfl/9+Meq8JV9x7u8n9I6QHUoYGyDWeM6?=
 =?us-ascii?Q?/aS4CoaAxpTfl35fLMIIqqbFnLkmETlv5yy2ZYZG4lgemOQqvLaAwTu7VkJv?=
 =?us-ascii?Q?3KhBCawWdlb8hCb295zqN7q9WGG/orp8qtlboowDai+aibdKky/W8+BjaRQi?=
 =?us-ascii?Q?FhcvZZ/CsMo9NICBAjOwKc7fj5VUUibYqaBsXt6Qdd2pAi2LkXgRCSEOFWR7?=
 =?us-ascii?Q?c6BoqZUVpQBzJzGqvEsgFoDo12lyzEe6Bs+C808SM/TCp5Mohc5fNaMBGZJp?=
 =?us-ascii?Q?7jDijZhAimhnFv82Cnm6TTez3V0Zk6hQwfw7WshMVXVPEaiLaI1ZkjVJNL16?=
 =?us-ascii?Q?9mBt4mJvB46waoRggcPWb0HK+hxfB+QwArSoByjMxm1RPacUvnuO+TJXdqrr?=
 =?us-ascii?Q?uOuqt1mABzVqgW9oPu//EmkXkySBnjnart1CbWANrlyWsk3KmD7PjVpZPh9C?=
 =?us-ascii?Q?pGV/YGUV2syQ+Opt4YWkQiWMsLOCgDg1MpKSdDuIC0+pho/ZZA7aJAjOGhP8?=
 =?us-ascii?Q?xLonubND+rsTtMNA0RTjoLbuBzkKY5JimvE0MBKZks/h0aj3glZsYgRhLuYy?=
 =?us-ascii?Q?jjxTvRCbhls4xMMo8WjwKgyat9DI9frT7F5T4M8pPqMyz8x+Zz/VqemEIkrc?=
 =?us-ascii?Q?V3jbfX6kDqS7mTZgOMhOkVnXJwanNgR0//b4BT9Sdikjpl+ETmoN/oIF2e2+?=
 =?us-ascii?Q?BhoObPOwIAhZlXWanQUFXYjxgnIi5t6GzposdI0M5A9PYeJN12QR7kVI4sI9?=
 =?us-ascii?Q?rgFe1QDPC1mizvHCFdyYIB/4wG63WWe8J9aK8Ha2SaxD0vvXjBYpk5WF0Klq?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c064e2e4-7afa-4cfa-384f-08dc33eee50e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:40:32.1283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXk75rRj5TRyiOV1gtScklilWl0OqbeSfKkP92t0Hj4YSN698oDnsFkXC302yv1fLrDUw6YG7p+5xGUIvwmpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On Wed, Feb 21, 2024 at 07:59:05PM -0800, Matthew Brost wrote:
> Although execlist submission is not supported it should be kept in a
> basic working state as it can be used for very early hardware bring up.
> Fix the below splat.
> 
> WARNING: CPU: 3 PID: 11 at drivers/gpu/drm/xe/xe_execlist.c:217 execlist_run_job+0x1c2/0x220 [xe]
> Modules linked in: xe drm_kunit_helpers drm_gpuvm drm_ttm_helper ttm drm_exec drm_suballoc_helper drm_buddy gpu_sched mei_pxp mei_hdcp wmi_bmof x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul snd_hda_intel ghash_clmulni_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core video snd_pcm mei_me mei wmi fuse e1000e i2c_i801 ptp i2c_smbus pps_core intel_lpss_pci
> CPU: 3 PID: 11 Comm: kworker/u16:0 Tainted: G     U             6.8.0-rc3-guc+ #1046
> Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
> Workqueue: rcs0 drm_sched_run_job_work [gpu_sched]
> RIP: 0010:execlist_run_job+0x1c2/0x220 [xe]
> Code: 8b f8 03 00 00 4c 89 39 e9 e2 fe ff ff 49 8d 7d 20 be ff ff ff ff e8 ed fd a6 e1 85 c0 0f 85 e1 fe ff ff 0f 0b e9 da fe ff ff <0f> 0b 0f 0b 41 83 fc 03 0f 86 8a fe ff ff 0f 0b e9 83 fe ff ff be
> RSP: 0018:ffffc9000013bdb8 EFLAGS: 00010246
> RAX: ffff888105021a00 RBX: ffff888105078400 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: ffffc9000013bd14 RDI: ffffc90001609090
> RBP: ffff88811e3f0040 R08: 0000000000000088 R09: 00000000ffffff81
> R10: 0000000000000001 R11: ffff88810c10c000 R12: 00000000fffffffe
> R13: ffff888109b72c28 R14: ffff8881050784a0 R15: ffff888105078408
> FS:  0000000000000000(0000) GS:ffff88849f980000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000563459d130f8 CR3: 000000000563a001 CR4: 0000000000f70ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? __warn+0x7f/0x170
>  ? execlist_run_job+0x1c2/0x220 [xe]
>  ? report_bug+0x1c7/0x1d0
>  ? handle_bug+0x3c/0x70
>  ? exc_invalid_op+0x18/0x70
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? execlist_run_job+0x1c2/0x220 [xe]
>  ? execlist_run_job+0x2c/0x220 [xe]
>  drm_sched_run_job_work+0x246/0x3f0 [gpu_sched]
>  ? process_one_work+0x18d/0x4e0
>  process_one_work+0x1f7/0x4e0
>  worker_thread+0x1da/0x3e0
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xfe/0x130
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x2c/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> 
> Fixes: 9b9529ce379a ("drm/xe: Rename engine to exec_queue")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_execlist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 1788e78caf5c..dece2785933c 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -212,7 +212,7 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
>  static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
>  {
>  	struct xe_execlist_port *port = exl->port;
> -	enum xe_exec_queue_priority priority = exl->active_priority;
> +	enum xe_exec_queue_priority priority = exl->q->sched_props.priority;
>  
>  	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
>  	XE_WARN_ON(priority < 0);
> -- 
> 2.34.1
> 
