Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510FDF531CE
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 23:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6F210E3E9;
	Mon, 13 Apr 2026 23:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XazcYDqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E410E3E9
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 23:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776121871; x=1807657871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/BHldDCTD+gU3bEW8etbjFVOVY7o/fX/2Tdy0wP74Mk=;
 b=XazcYDqV6MHByye3XNLdINZmluQaSMO5rRlCIAh3Vk1sO9o/Qmz2uEvC
 TTaMsswBbS4YhNTxcb8Z74rtHsFi9gUc9g1TiEMtKZ9+TjMdlCeJTyLK4
 N2LhTgJxja9z9i6OiLvgex4BPWU1uriA0oBhLMjA7ZSpqCFXB4qoOBEjY
 OLTnZVjiSQOVSE4sYJsyCrjDQHnypEsbUtaqDL6Zefcpizo+ZQOzJFCNO
 niqRliVogNlGKE2pEf22ITk3LDo6kUxMJVRtHDaHvFW68rcIp9VZM1SHh
 7WRAtgRDdeUGT6kb74M88hN4hdNUgVFS0uqzyGLICQfUeT2NvNjetzwmb A==;
X-CSE-ConnectionGUID: 3DBcBffrTWWAmzspOegVfg==
X-CSE-MsgGUID: II7lgWF/Stu2BIMFAKie3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80931444"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="80931444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 16:11:10 -0700
X-CSE-ConnectionGUID: 8/zZr3ByRqS5z3NQcwYotA==
X-CSE-MsgGUID: v9LQU8SjRi2Y4LIv4i1EkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="253132872"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 16:11:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 16:11:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 16:11:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 16:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cb+6CdQlB/8FjgXE43t7WQ1sLkoO+9nhUc25poI2OE9S98/Ca2CDzGgRFzoTkuBM4D/AjdO9/mykfubNqjClzLFgdDFzAdKsrniN32eYQirUfeBei2G24U4KC3xhmYGMFjxKdxXznaI8xGuHDOddVIqtu4zltDJimE7kiC7CX4SzYikZd8WR0PAjE1TfPBEcn+g+g9f80pPOf0DsEsRCz/bkjiD7BL6+tS+SiJ1aYxkHWpvEwK4nQqWZwk4nMV8TIPq6Eg7ieujxDRISOYNYL0cVIYWpF1i8CAylZK5JLkQq8mGU9srkNijvaQOiFY3Mhe9vCvCcAGx3bKJs+T8sJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXfMzi10d8eHBqbFd1nc1TLV/5lPbmAhTKo6srkoSik=;
 b=Uh4ii3wLZBy+GBzvPgzXwfk2eOS5fdjeJbfq4nG5ypVHfZPZGsGDDALhcnKEz+0zZEO7nj6fBdaX3PszR8BTjbktL2IoCIoTuHTrd9GxJStOgMAaO7evKHVKKg7jYxeUzBltrx/rXeMTkpPNxUEFMGLGL4DaWPsX07mKQmrorb7BPG8uioYeYib88OkM0R3aHkGOMEWQ5a/wpqWUvU3Utfm6z3UTQVdrbER2XVH+L/ukCB/2kSIDzZ/z9L+cFlbJEi36B4E00CeLP4ZnPS10DsIk1bBlvVetxm3Gt5yEBo+W0RgfYcAxfU4p7cupew2VKuru5/CXpmJDilmpPBsw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 23:11:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 23:11:01 +0000
Date: Mon, 13 Apr 2026 16:10:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Suppress reset log for killed queues
Message-ID: <ad14A1TEWOX/b4vV@gsse-cloud1.jf.intel.com>
References: <20260413230724.714884-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260413230724.714884-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0377.namprd04.prod.outlook.com
 (2603:10b6:303:81::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b8df5d-ce1f-4131-022d-08de99b1edd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: EYX6h5WaBAVm5c2Otavep4oZRU7L8moqCj8qfqNIpEIdrqs5kEtDB/0ViutYzyWCVo9cUHE41qpial+vBr/7WBCy5nMSXCT2aagZtdZ/4z1SbVh8X7JNF8ETXxgoke0CQkE8zSNgHvq9FOGvayGcKgtUPz+Hnjy+ff8csh5/EfDFVqcpzK+l/+F4paNth/xmReEbuqAV/jgJDRpdlAE/ADfEIoIqw40Z+miDPwDd2JpJIgknT42lEwRx5jCV1f4QIMEEGdVJMT6fedQbw60nkAxsDnCs3HVEiK1J6sGyeBjl1oXWzti7Vxb5bYaFlW2UMhXJhy7VlX6MWSvWb0oRalAaV6FWKqDhUXQWZ7XIUtgtmRce+lElXGRaSVnzK+vXKAjJGkgze2/5qIURVeXNg4h/0nqjR4PKGoSXOi9TMLhcS9t9mbKkJoN7AWCoSOdAmfy43IBc6uUblf0v/LbxzLOdhdgi+VHUpiQFRaI7pifsHzaBRqHq9JskpP6Su9AphERsdRiM9b2TCDrHfrNTE0U29icYa6QAv1mAi8RjWGReLukpIG2/+F0KNx1Yeq0f0Psc36+MPQ/WYobZxhrcKJ/36uGWQBVi4Hbg92lJ/bDjcrlrSactNMBFXgHTSTPq6Ll61wRjujUlnx0sZN36tqLZSsnLtkINkJwoTX8C5YKTJp5O481064x0SQ22/uv+by0LKXD55fE5KkdVQWBeobFF3QHYHxL/KWZR5rtS1Ao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?STB0OAvqQpTqx6xVV73PDz2npLhKy+Ew6cgzf6nGsAfEq7EtKYRghAnHkvGg?=
 =?us-ascii?Q?sqYocF0JArMRzMb/sG/83oD3IYubS1puK3hx3WoP6VvAxBVR10DxiAekQJBE?=
 =?us-ascii?Q?AKrXD21g+puRYeA50xNnoBr8Valx74SqXZkuFpFQRX8kJlSOy5sL/JiUvtpu?=
 =?us-ascii?Q?UsGebTi73YPhPcAfYBf1orTXg3A+BlvDK2kY3TNNLKDbrcHj1bKi8fd3CscQ?=
 =?us-ascii?Q?X3Uo1cXu/iniG/dSsksHrXPHrQiyR17KHsWV6QrAyyl6hpG3lro0Ysgt3ter?=
 =?us-ascii?Q?avqGKGj62FUbXhK5JHBC/gWdJD1OvFetP0e+ECvCtg3/U9OIQl6eC1eO9cmR?=
 =?us-ascii?Q?zxX06UVJ/uGk+74ZJh5OiRFhrrxe1q0df2YKSW8Y/rWxgOTkWwmVsl8PutzF?=
 =?us-ascii?Q?ChK4iQc6gnDxTvevWNguAYyLTebwt1wxMsD4ILjd2p2Zz/CwIdU585fsy9Wp?=
 =?us-ascii?Q?y/Y8UZxlz6DiIAAGB7YlI/KcxbPJxWOHiSRkS2H0OJ1MA10oyoJZ7NSP4rfO?=
 =?us-ascii?Q?5z47xh5nvDbGJRhUz1cWOciDoJoiFjUKhjNIHmN6aw8BTlmqUKu7y2aPeSnC?=
 =?us-ascii?Q?ZCvi4W5kKVzue272vKFPCVRf21ImoKn1QNPPTtfBabX1Zxs/x1FUnlOzMwNi?=
 =?us-ascii?Q?n7+pW7+peYQ/ePwK593KlQhoPp3zCGErMDBz8QhsH8Mgf2MteHGIcbh7gkSk?=
 =?us-ascii?Q?cU4KOA3J+5s4pA3WUPYLaI4wtp5laxo+Iqrk7Nr6fIObR/ywAy2PLklWtzrQ?=
 =?us-ascii?Q?czbfLmDqiL6WNbsTtTwJg54udISC3B3nOHGUN9niJk6pDrw4308SxZdJWA2O?=
 =?us-ascii?Q?rhHkv7XO1ws5VowwoBgjqIYYz3/vmt6oHYbL33rU9/DirqKctao5mlZilQR3?=
 =?us-ascii?Q?q6Nx/UvoEqHmrmBXim46UreGQyspirklJqPHyRL1aD3hbCyBwMqwfkgF4Z7d?=
 =?us-ascii?Q?StvEzXKG9+vcJNw5HpT7AfYYTEaioguGRD6/fiIgW9INB2WRIUvyQdpPLlON?=
 =?us-ascii?Q?ktQA/JjgbIkTbJt5+3eRdTv/6S+x6mCkLnwjhVlqkDmCCyg3DyE/c7WFAlkp?=
 =?us-ascii?Q?E0zM+T4DosvNZB3IHJ+dAUC8etrTEBVV34Po0pvWIDRNuyyPUvKsxAm7ijur?=
 =?us-ascii?Q?l8EwvRs8uGTYnLQXtSzFMnLsRsz1BLV9gb1zZal9mLzaAYFHoaYTYajrqqvd?=
 =?us-ascii?Q?xCtVdTvkZTZjbzXWzNGe4kYMBR6J9EThcnk2qb4A6MQW5V3ApgiZ6ZsuL57D?=
 =?us-ascii?Q?2QAWsu1Qw2bftF7iuJTWXIcTsnHQ7xKBHPqS3D5GLYH38WOYRkDouRKk14gn?=
 =?us-ascii?Q?6VXDEtBqvnWOeqrE3t8WYNxEM/BgGqZwN0O50k9g78SHeJEgAXIdcwpu4V1W?=
 =?us-ascii?Q?RQBtY0egE+DG9HFn3FRXHQM4VnwS+KgzKclG2lm6nitnGutDKhUAC4SZCFKz?=
 =?us-ascii?Q?qDltf7mhgPAElB9wR+BHXEFkP+aGCE5iElo3FL/A0Dn7gjL88BEYGF1X8nUJ?=
 =?us-ascii?Q?su89f1fAitvQXTdizSXiiYKqCAX5riD7/QowuSVHkjo3GeaOVPbRek/7ZrIV?=
 =?us-ascii?Q?JBlaT9RfOlNZEzbsIrC67QUS03YHWQ+pGCfUPJlHacYOrn1J5J4Serv6FiAG?=
 =?us-ascii?Q?okpvN8CpQrraHg1JTKtWd1x8uDlvUuyPovyIp6IAuUwZGuTgFJMm4jD8GMeW?=
 =?us-ascii?Q?zhGoUz5joHyCuJkIGPtEcScr0TVMyHMLCu1Yr1kAD9HjUNY3WsSQvmh7CHvl?=
 =?us-ascii?Q?QJXGbpMFIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: NTIsbF3eQyR60Fg2VrddLzBS6S6EwLehWtxFM7H+qIAxq1SwROBGMV21BQDfsKxyaYPHyxTZFctOZkavOhuCftDvuzszQAvO3o6/TcQpKLv6o5wTIBQQePXSaDAcztou6maoqtj5tHYNyFWQzBiWZCzUHK/geQSYYl3bg+nLUjHOr2MHL+D5da4PFMRlYBdhGc0dL1nGXCtLEm4Fs/Aon0+Y6oTCzIzEN1QiafVC0u85nLSS7FZVR1aT220sy5spvgJHavZdEFiat85gp7/2e/aXOHJiPvtep1+Z1z1aOc7F1KJlHVJ92dIXoG97UIGyCPj6fvn9MuQCRRHueb8+tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b8df5d-ce1f-4131-022d-08de99b1edd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 23:11:01.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaUXdHZm6xTOcydNNJ8d2k877Fauktb14/ho8UiAHxiOgC840DequD8+Dvjl26v5cfpaxClT49UdaOJslpMCTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

On Mon, Apr 13, 2026 at 04:07:24PM -0700, Daniele Ceraolo Spurio wrote:
> When an app exits abruptly (for example due to the user hitting ctrl+c),
> any of its queues that are still active on the HW are immediately
> killed. As part of this process, the driver tells the GuC to preempt
> the queues off the HW and to reset them if they don't preempt.
> This can cause a reset log to be printed to dmesg, which can be confusing
> to users as resets are commonly tied to errors, while any resets performed
> in this case are just done to speed up the cleanup. Also, those reset
> messages are not useful for debug, because we don't care what happens to
> a queue once its app has exited.
> 
> The only case where a queue might be killed before the app that owns it
> has exited is if the queue uses PXP and a PXP termination occurs. In
> such scenario a log might be useful, but rather than a reset log it is
> better to have a communication that the queue is being killed.
> 
> Therefore, we can silence the reset log for all killed queues and add a
> simple debug log to record when a PXP queue is killed to cover that case.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: silence for all killed queues instead of just destroyed ones (Matt),
> rework commit message, add log for PXP killing.
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>  drivers/gpu/drm/xe/xe_pxp.c        | 6 ++++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 10556156eaad..b1222b42174c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> -		   atomic_read(&q->guc->state));
> +	if (!exec_queue_killed(q))
> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
> +			   atomic_read(&q->guc->state));
>  
>  	trace_xe_exec_queue_reset(q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index d570ab3717df..d9af4d6d4bb9 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -13,9 +13,11 @@
>  #include "xe_device_types.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_submit.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt_types.h"
> +#include "xe_hw_engine.h"
>  #include "xe_huc.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> @@ -755,6 +757,10 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp)
>  	spin_unlock_irq(&pxp->queues.lock);
>  
>  	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
> +		drm_dbg(&pxp->xe->drm,
> +			"Killing queue due to PXP termination: eclass=%s, guc_id=%d\n",
> +			xe_hw_engine_class_to_str(q->class), q->guc->id);
> +
>  		xe_exec_queue_kill(q);
>  
>  		/*
> -- 
> 2.43.0
> 
