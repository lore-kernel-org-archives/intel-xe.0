Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B01C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 22:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF71810E148;
	Wed,  5 Jun 2024 22:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwxYkQQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1801110E1A7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 22:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717625401; x=1749161401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QHsdo5UUj5RX5tvpXwP6jBmC34KHVj1WXt5jnNpUleE=;
 b=YwxYkQQjgfI+x3evVc9153JctI8NgCKCr/ciPM0KHzXaS38yL77t4n8h
 pm+W/Ci3a/8qoyp+/oOSTWIsV4IyWIiRk3qwJUfMGzrea0MsYGr+CqVhI
 rel9mNA+lQISi5ENhM8UPCzVrnJ7ParG1timHI+QhINtNnBxbCFw7xBKz
 N3fAlD+s8/p/rQhmw2WETUHr0HbfTC3ILVSi45bOsn28rD7jeGPHyenWW
 0ZaCwLTwemKGz0u/2xhxz98MzSAwISHyk8rfdO5MmBrWpdN1/Wq6POXds
 A8ZhBmMJJuQM/jzQWwBF50g/khpg+9PbngSy8VhMPt4L29vdlYilaVoe+ w==;
X-CSE-ConnectionGUID: d2+OYPEVTpOXFmI3dF9RaQ==
X-CSE-MsgGUID: p51WvZ8FTYqb9JBZt4fs9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14103302"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14103302"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:10:00 -0700
X-CSE-ConnectionGUID: ow5ndQ2iQgeBB+oHaOixdg==
X-CSE-MsgGUID: KF0dvpHrQyKgyf1HVtkrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="37751442"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 15:09:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 15:09:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 15:09:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 15:09:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nquwTr3zFxgGB+4uUY89ns4ydNc+5/WYackAKjM1c2LRlWUP3Q0MAhaqEUIl3TX6ehS3CNhonnXAKdgPPSA5Rari0tmdAfcmIDpbgU1HXK6yEgGOOp+OqGzMye2wSJ5QHyIUbFrd6awOlc6p72UVskgNRqlzH29FNatdjJch8K8KTQstAHJ/O8FBmmJKvsNRU0GK/H6VkbwdpM3z858M9WpAEaVzS+3qiHv1CnYWV5X1rGo5RGuVxqJGPqDxz3ZraED9cFMPUSSZO+F1yOPBSQTXXLbuoJy0A4rYDuh1KkS/2ZnZ+YM/JLux9C5DFSjf1ocoNT+Xvy0pO+7Vv91H4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB29peazlj4w5/PQ1wQqUx8J0kkCCU76iB2KpTy6+W8=;
 b=VUgl8fyxELWRpumE8AFoMWQVSEm/rkcAe4SPMvPRilGz2hZIXm7QysOR5TTgLJlfUH38NBGmj0apoX4SUUECW4sLXAyEuJ+UgkBCA3QBFY+qmKah6ktK4/y2ELBkqS0rzf6YoQuoCcpU/PqtWLlETo8ZgbkIAaHGkjh7XdnC/trh6/V8buP9Pk2npdCDWMz64f60cgy6z5aKiuv+sQJWoRqp2U9FtJg7BOrvaB3WxDNygx5k7LD7vNU5wq+z/bgVtHHuFIhPKWqlNxwJEDpt0k7l2uk6IRrIkNQJxT5vFF7VSneXuRqL0sWiCpb6U3q9VlYcjE+CWfPUlIRjwsDEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 22:09:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 22:09:55 +0000
Date: Wed, 5 Jun 2024 18:09:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <matthew.brost@intel.com>, <john.c.harrison@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_gt_debugfs: Add synchronous gt reset debugfs
Message-ID: <ZmDiLcMGBdCcz2Rx@intel.com>
References: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605150828.2736396-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 725f1c87-bf10-4700-1f25-08dc85ac3b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?42YEvnkcuoNi3M0WnxgyuADvX7t6oG1c2O+aBCLhxm4sAqCsMQ95qjQwKBA4?=
 =?us-ascii?Q?/xvNzmCFWg+oKyrQdKBrxBRpAezie62ER6YArFePWxuZ/596ZYgco+3LlYFE?=
 =?us-ascii?Q?P/Lw1ST/3Hhd22ClQbIdgU68U7yaCLsQWA5rsiSnAAXbU3uFrsq9ungj17Vu?=
 =?us-ascii?Q?EBak3bpvbt/p8hR+mlU0liuqC/qpMe335XjmbPbSfmus47xL65qeZ15Kx9ET?=
 =?us-ascii?Q?tmaQmfhtSV/n9fntdHi7rYOHu3RW6+zg22/F1WjRCFcTCTCV62+fTRekiOWI?=
 =?us-ascii?Q?w4UsfNzGNBn11d+twmn6aYAtj1kdGooNXMGP2CZR8ou6AFgcQHuso4qCP5k9?=
 =?us-ascii?Q?2aAM6lpojKj4rNR1wFg13WoK1HxrMqV+7/T6TjZPSsuUsg1VhziuQ2VOHO+3?=
 =?us-ascii?Q?CzY1kfLDHg19FmKRYv+DiVktvpW8j7YuMrFNuBz+Ava66h+o8XR94ZB491qM?=
 =?us-ascii?Q?JBD5F4ITtfOiDWngRbd+UpOolXV8OH9FpUbVLI82g3cBSqXhqjn84e5b+1yl?=
 =?us-ascii?Q?vkCpbACiDvVpUuJzsk7W8S7s2vJyXrYNPG/BuTYRjkThJVGgpbyW6CkIc7tY?=
 =?us-ascii?Q?xTc/krpYRmiDqaw+BXZI9g6ixRsezuI9QZ4SukflRAmwdaPJKG9j2UhJwIdF?=
 =?us-ascii?Q?AL7Du/7REAwNrKN3w08Zqx9WwHoimTlmjbIWbpf5UkqpL6LNsPpdg4rnxA35?=
 =?us-ascii?Q?NjxMEMv4VpIoxamCprshXCv0UF5AVqk3OA79A3L+qXufnfNQFLVgO0IrwCGP?=
 =?us-ascii?Q?xvaH4hW3OLXgqVenShspRw3IrevieejSbfDr1PMz7HbEb59eIJM2wXkO6UOy?=
 =?us-ascii?Q?ZF2e7PPv6w7EuExlAVqAMtS+FwzyvPjBNpXU6KpTCzz7g9bqId1Z4o7bQ3hg?=
 =?us-ascii?Q?d1jhzhwzlvBcYeOT86bSiPL6qfdJUhproTWfPMepNds1YuPpk9QZo08I3+iW?=
 =?us-ascii?Q?6eYd9I+v3CnCAA2zx6S6ytxhXBkJDkiLZuISLZMrqoRneS1hEAT8xXJw6ba4?=
 =?us-ascii?Q?6mQC2iaApf0DOmVWDHVZ+PEmkw9l2kQQeqfZcqVIMx3SoR3g59TydzVWx1KG?=
 =?us-ascii?Q?/wYMQ6j+zxnmh8kC4ViCxpc9m9v58Yl4aIefp90c8RrHW8sbIBG98ttdNXEl?=
 =?us-ascii?Q?699LBk90hpF5LtVSi90gRKkdQM+hL7v0Ccu4l3Kp4LvWkvU2w/yvES6zcuJx?=
 =?us-ascii?Q?H0PZeKRkcjQrlit7Zqimv6H4RRWRLFS368woJfQL+42VyKszQyX0xrowijDj?=
 =?us-ascii?Q?L9hJQlp132DkN/jM2rws?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s6a6eUgu2QcJUoV0Ojyv4+MmHIqQ7txhDbOf1Wbqbr9e19qGwdvvd6GJjq4y?=
 =?us-ascii?Q?riWWLK5f/gS1uRGabpWAqeb361giWvAcNPp3hay5ZorPGksMuL4Gt5NqCl0j?=
 =?us-ascii?Q?C7DU1SyN0s4XY6N0YJ85pqGY5mqF/po7zh/rU7j2f42g4oIXctvFT4HTNpm5?=
 =?us-ascii?Q?CLwl1L3Mj3j+5N+WthK50h9d3mHXBEt7BNilLjQuZsuQjVBKqI2/Cg/RS0/1?=
 =?us-ascii?Q?n5sl/oEc9+2VWIl6GMo0qvlbmrTE03Uh67syD6fRxkrDpuc4Zg7Y1Tfb2EZ5?=
 =?us-ascii?Q?WqaQkHOL1GNph7q46a3XpCBAxJM9p3f+k6iulyalt2/eqxQUu82cWQcl7QOG?=
 =?us-ascii?Q?AVfFxHAKv7B6qmfXX2xV8hWc8ArpnDWFSAV6g6AEIAikZvgZlTnPxfGh9i5Y?=
 =?us-ascii?Q?dmfHzlAez6ubFUnfdJC6QfODBcNekazgIwtXoTYoQi4Ap+OIfa5X9Ima2aL3?=
 =?us-ascii?Q?uv7Fy4VpWeSrC1qSv8rLv8luYsjZ1EusYlxAr2hqbENUxogodoWQ6QtL9CDn?=
 =?us-ascii?Q?kH8P4Pkp9WjovGh4ExT2k3o2RdTzp8+UYz/+TXgLCxwY6X9/abm7YuqagVRW?=
 =?us-ascii?Q?BoDfeX2LEnExqskSk+8nOegkWJlOMCKicBPtJ3LaWC/hw0JkYzy6UEa+oJFR?=
 =?us-ascii?Q?hhcre9LmHZheaGaIwUVrdQgK2aSpk3mbfNi1K7LNJD73CRU1vkZnigTMOifU?=
 =?us-ascii?Q?xTuHl76gh9SvOOjP19G8ij7pOZKVLG8nBS6HVmnOBd6PoSQx71qYgA+RjMWk?=
 =?us-ascii?Q?2a/r4mszBGyLfNr50fkwX4YDfS3hR0zeZOdzyAGl8yKiLrD92MhZS1e2lUsR?=
 =?us-ascii?Q?JwSOSfXDLZirI/ho85ecFRX5tXnS7XI0zCMgBhK+2R/9UmtyfnbUYU/0cMEm?=
 =?us-ascii?Q?F0BU8Z24oDdOLcho4OiMADr37yr9P5dtdYnef/BsdFUj2bWQhs1Y69NCxata?=
 =?us-ascii?Q?gd+aZtxSN+hXtc0e4+NWsgergSb7X/KTQyDEQswkMhGOWxcdsD9+Ap7SiMSz?=
 =?us-ascii?Q?UVE7mUTlYBvwbDCqY8dEyE5+6iaGWCSf7WbkhJXnf5dAk6MPDHRrf5mCwzCF?=
 =?us-ascii?Q?WxXg9VmXS3mb7PYJcHNkdKh9416Lw5N04c1oYxtFHAPnXbQNrMzOm6Ppg0a8?=
 =?us-ascii?Q?hjPcPNs+W2wn+BhRoC9hL93ULur0UVjmorDsbIWOfFUiWik4EpFZjN3Ye28P?=
 =?us-ascii?Q?DVMNNVvpRBtTTGhm9abQSzay0jrp5GyFPeNCvqNi+E4GMs/jB0ALewL/AKu/?=
 =?us-ascii?Q?FTk7dW5yCyKjEVVhljs10tXarSjaxQFUC2CInbkJ8nXRRl2fW0pw7yaU6lT6?=
 =?us-ascii?Q?zehz0+66ElmOwuT20wukMk/4tvQKy1/7hzyQwPrippACLe6f3NMQUd49apqN?=
 =?us-ascii?Q?Q033IaZ+TunN4MW76D4hdDmoG7rAI/TOqnROe3NSDd6UywjwXznZbl4FTmE8?=
 =?us-ascii?Q?kMWrWCCRfsptoRUEMMjM4tH4Vyxe3eAXvDVNWHFgkQAXBuN0chHRKQJT4uFw?=
 =?us-ascii?Q?AN7vq09gLONCL5YeU5LUwKtIYIiK66zkHH+Z3vF2uSfjDWxkHz1UkSK46EpQ?=
 =?us-ascii?Q?VjA2cjA6xTCc8++Qygm4v3A+SGdqINapcgyLIpJz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 725f1c87-bf10-4700-1f25-08dc85ac3b61
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 22:09:55.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUTw49KZtR0Db/VmSXvU+J+jdoHOi/LbFoAnm9nkr+0mCW39IiRcSZ4Mw2UBrjQkiRMJ2uOJIty6d704/RNuFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
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

On Wed, Jun 05, 2024 at 08:08:28AM -0700, Jonathan Cavitt wrote:
> We currently have debugfs support that allows the userspace to initiate
> an asynchronous gt reset on command.  However, userspace may also wish
> to wait for the completion of the gt reset before performing any
> additional work.  To that end, add a version of the force_reset gt
> debugfs function that operates synchronously.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1068

do we already have the igt changes that really closes this?

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 66f897a9b6ca9..5e7fd937917a1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -116,6 +116,17 @@ static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +	xe_gt_reset_async(gt);
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	flush_work(&gt->reset.worker);
> +
> +	return 0;
> +}
> +
>  static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -261,6 +272,7 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> +	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>  	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>  	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> -- 
> 2.25.1
> 
