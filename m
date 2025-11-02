Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F91CCF9F8
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 00:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3510E174;
	Sun,  2 Nov 2025 00:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5otBa4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9883410E04D
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 00:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762043012; x=1793579012;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tn2of1Q2htq5/A/jHRjxG0LwVJ9/cRzWxzKHa7W2gTM=;
 b=G5otBa4eAOjlWgemrcGkACfIHoXzig5Q1rHh9wROb+MvbbrGo/ZisLeW
 3qqs2FVLODgbf6scqpsL9S1vpfe+MS21ySw+8spgYHT+9s5KYB/gsy+c8
 PFvL10QXX6PNJKDzsHrQGeAoF0Y3sfg6DHTBIgan0yIYjSVE257xt9L1F
 h8TVeq41ZVftcTDebB6oBNjptpYKhdmaxwyePt3qZ43M6/pxzEZSaubT5
 xmyvR26SQcdwFZhxV7ofR9m8WdVy1/7ZWUVt6C3Uspj37qjyNnYSQdcXm
 L1ACSeUcpCcHzArAOHjbk/8ysBSgcePgdfSDiXDZqlwJzdbKTvvM5CHFv Q==;
X-CSE-ConnectionGUID: BnpsRSm0QMG2LAoe7SSoHQ==
X-CSE-MsgGUID: lcIckZOHRluxpVIrwsqAXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="74842129"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="74842129"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:23:32 -0700
X-CSE-ConnectionGUID: Pwq0WdJQS1SBIysqu2d3zQ==
X-CSE-MsgGUID: p2TmVOfzS4aJKZs7GxAPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="190886052"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 17:23:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:23:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 17:23:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 17:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy3l8gadPOZNU4I0Pmc+Tl+hjQCOUy6OAM0fddJnar8WWE8XFJOhhe4VUEp2Uf3pO5usIynUkgFz/xrJd3gvPGEc260Ntexxr1qs0eA3yB3UguGz5OPfFXiVTE1Iu2pHZA6kp0Y0G+eQyEW3S6rINM0N9uijry04INTUZHr49XP0vo5x/s06ND1Px8YztzeVN1rRX+xT9vV3TSdiRKvW1F15mJ8xZPmYG4UgGU4rvtPgbkjb1RTmKYZPRPRHuBTef8dVVa+Qs9i4ecmrAHHS+i9JxmOfdpMTKKdVFuUyrSDrbaqAEuuILqlGoUaxsjrnaRn75KlKXC0a9Lft94l0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zapfM0fhTwu2I3o4jM8MeQM8+djDpPytpwA+BRomUPo=;
 b=MuA+44ho6bRKRfmhpO/NoUeu2GeIH2CdIGp9TgY99evXeMciMn2MUkbq/z3OjnJeqbDdg81aP2ymvJUSBuvCwjc7yXd2mpSxXasl4JxNZJuhVvD+azi6kmysFYkAmeJ/2fj7yw2981eaBuodG5y6CvqRjeLa/UYpj/f6uNodoToKMIAN7fXXvg6j65xjtgJGGLGICQO4bn+Ebqiokt8P5KFE61UhD/netqz013LoJDvWAAbpmY9Gfg/csNjwEEW6SQYOTgpmgX1WuiPdcznls1oxbyVqIZmJmqjOVQBN4CWwbMlRn9KiNtPBQUb3amHO4PLNGj6r0wbIXdH64WnLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 00:23:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sun, 2 Nov 2025
 00:23:22 +0000
Date: Sat, 1 Nov 2025 17:23:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/16] drm/xe/multi_queue: Add user interface for multi
 queue support
Message-ID: <aQakd8Y53qfxpmvk@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffd1895-faa7-4793-9974-08de19a60807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XD3ZuKLDfcnIt/A/BH7DOUvvYqC4lJvTtsGiT4XgNT+msWEkoeZCQypo4HHi?=
 =?us-ascii?Q?sqzQLrhLbh00TqtbzLThmW9Zu7SyXGvpdN9w7R4v1RoXx/QkebyIHO15ooU5?=
 =?us-ascii?Q?otLyML5K4KsEbfFiPOlCELnYzdec7YE8JJefQfhE/FKCmo6EFGym/OJsT8hX?=
 =?us-ascii?Q?f/MhvpENQNvI5UVjqL42voG3siRo0F8em/P0vvfQZwUuFqIEShSCM6JtlM5P?=
 =?us-ascii?Q?vpIHYiX7WR45gfCw8ESIGLvRo9gozNmFBIqS4aydRlkirReajzS4F0kk7o0T?=
 =?us-ascii?Q?uO/l/aOzkhPyQUmninYVkpJdzhishZ+Wy0iN5yPwBN2igNPCYt9cgukcli3x?=
 =?us-ascii?Q?EpwBZ1OMRwEYtm35KiJhWNoqJDM71xWWDpHb2Wh5Q7Gin7W6nA/xIEIwExKE?=
 =?us-ascii?Q?VcYck4jw8cM+qPQlGXa+x418qp1KOi+0h9sRHeN6EXGSekSPC5UtNh4ybKRp?=
 =?us-ascii?Q?/RQQZhFF8v7+dK6OmXto8NSWuR2EWS/GWpGN/xyBB+DwWrHKzdvklUVBvPgl?=
 =?us-ascii?Q?Iskutjp0WXojtCJEcycA/j9TjGmpC3seg6QDlqLoY7oJagcduwNG4n66q/ZN?=
 =?us-ascii?Q?8kIAcD5epkyxjRme6of0m30Fdf4Qfo5jUiwgHzv5vzAjn7As9tAY2AyWtZ8s?=
 =?us-ascii?Q?OTPxjjKP8eW/01dI7y/+UVVydeX8BOj8mh4fFH/Yu25Pfp83yQgSPVIEmLCw?=
 =?us-ascii?Q?0Wbl+S1w5iNBmDJnGyIPA2c2C1N0hVNiC6/l+gss5KVh/dg9QBl03nzJ9wTu?=
 =?us-ascii?Q?EUYdZ+CyUwWC+sX2BECWC/QjIZmxMU1ATUMASxzXDozoSYYC5ZPSQZU0xjWv?=
 =?us-ascii?Q?6MctXwia5NqY7/2J60ZRqJam2jC07Wz/UXIxlUcinp98AgDAiGfOeQgYDwOj?=
 =?us-ascii?Q?7UbLVupH0q+sCQGna9A1S+GXpdCY8rOd+j1MDnS7bkj+4rXLmchXypjRrWoF?=
 =?us-ascii?Q?GxqPfKPWY2YdEEOOzhjUrk67NqLS41u8g9T+i+XYC8IrYivteErMfjyFoyNb?=
 =?us-ascii?Q?3aRXFTCotx/o6nWGx67AhmlVCwFbtru7l3NMfJ+n1OCyWs9r0NQqmXomrQBW?=
 =?us-ascii?Q?PQ/E2N+KfsSaB6BKjF4hK2PV/lNE3H9x4l20X0qyZvI4r1c9u3xk2QmqzRU0?=
 =?us-ascii?Q?3VGQygvk2ttVe2Cs4ViGLZ0s+zpmEs+8YcuAIfrubJMV/Na0Lp2VaEdMtzmT?=
 =?us-ascii?Q?V5L+puUKGErmF672mZxgYNTKirnZGvXEym9oIePwPpEETzqMwergnVXwi75y?=
 =?us-ascii?Q?8o/5JIQQgPcRP+hh188/fmjp3CXhLcfxiXa741Lh1nDlTB098zbBqEDGw8nC?=
 =?us-ascii?Q?vCoovzIegYn2+GY1qvQ6yz3v8TNGTyWOg1qynXrCokWYg80BZkEsIh3wBN4K?=
 =?us-ascii?Q?1eYrbVnZX0yn2uS91BDZVeUgnaR7D8xbz07idhX8To4bdHucdRL50jOwBoKW?=
 =?us-ascii?Q?VTjO5N8s1nZ8GyqJCYkSFZrhpUCEqws3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95KzgJdNuCJ8pUy9EOoY/JpGHDTflN37Wg9AHfcmikIXttzanyNpdzwexGz6?=
 =?us-ascii?Q?hdNiyZ/WB6QUAXyyX5kNvqauvpRlG5rz7Xo+0U63REuzJGRT68Y81RkAh97a?=
 =?us-ascii?Q?cjmYA5D3fWbcaSLXBfj/NODcFGeXp8E4+iv6fSiouLsEs2jGw3HqAJHgID53?=
 =?us-ascii?Q?7EKww0433syWIBo2gN0sVgtbFPBm77KtSuozicMjlMYgZXLItDl6H33Rf5ZL?=
 =?us-ascii?Q?NbMVGTvwjzdu92ud9WLDUlLzPHLFK448dlPmI/mQxVXrBDRlI0yq14byEYG9?=
 =?us-ascii?Q?T6yhdXZT4u7eGQc6+NocOOHMQ8zT5Xy3mC6gtnZSs93IIxLfOojmgK3jVo1U?=
 =?us-ascii?Q?8ttEYBFDHFtk74CJHuKvZ6EA/qdCgGw9y8CnTSaMuyZ25f3fzpIHkEX97tzh?=
 =?us-ascii?Q?fCjg1GUgkv6Te0Y85uZnkPBZolxOk8TCcyfmHLuzk5J71+9VFOI8xHgp+QRt?=
 =?us-ascii?Q?rUjosUL45nwwcjFR6nHbW8xhTZpYdrWmfnwuJJwWp8TCEWF09xSJDLtBM27a?=
 =?us-ascii?Q?iE8Y+C/1j8xlxZl47WzfpPe/GCZHwBpmbWRsJLdGo70hvg12X+LbLBSxHsgT?=
 =?us-ascii?Q?/hCLAs2fHTg8WGDzlgX4yqkzfLhvEjwbuK2J+V6AxhqvfSHtJnK//1bWCOh3?=
 =?us-ascii?Q?HthJ1vYI8rghZY1uWoIjsI6B3AZqDbQpceNQa28hjtXVaWmWAvq9QNN+xE24?=
 =?us-ascii?Q?UqMvkQQhWK5STT6qc9B9BZ0t0I61jhOCNk1jPm8qvXOMjIcYxSFJ7t6yop25?=
 =?us-ascii?Q?xUDI4lknQva5W95vQ0zjat2v9X7SPo+mEVcMwEm0dZ8zlcO0uGy2JmUMOS0Y?=
 =?us-ascii?Q?+n4RHF1A+Qmhiqf0jFxfhmI0k21Ms/qniNCuMS2zhdpob1iBekd0Q6h/mLyR?=
 =?us-ascii?Q?/1K5vcKk1i2QXSTkkN+KcnrLB5XyCtI53Lb5IuXPf/+bdCCGQnvwj9j4WTay?=
 =?us-ascii?Q?qzaUPT1ti3HiRfr78XZ61m9vAhNMgr1IjkETsLnpMno2SYPxX1ljN93YYlxx?=
 =?us-ascii?Q?MADrU2a6C1QxrOuUJTPOmWBY6nb15BET0Sngqwth3n2W9B5i20eE+Wa2wkAD?=
 =?us-ascii?Q?w8pNa9J9z8u5Mbnh3lxpn2dDYU90pvyiikJkZSdmSB06f837RdQolEfiR2Nx?=
 =?us-ascii?Q?eHc42wTmVmMSlRFl2SGy2V25+wsQ1Q1JkjiriBJXCN7LvbP88pd1dGD/Owp+?=
 =?us-ascii?Q?Fx3mczOoPckn4osB832VI8UHtIVdK5C7qIqi1fSxILQZnNBDvlmWv5ezfzF0?=
 =?us-ascii?Q?bv8M1hB6oCBWc4+KibEMUo2BCwn3KLkT5u8/jNYqKG+Xrp9NVHKntsQKVihr?=
 =?us-ascii?Q?HVwoGkGlk/AMyVST/y/ivncmLewSXLzJJU0eIMgSLvgMeIsLx2xdYGOD6pIF?=
 =?us-ascii?Q?76JOS56NGflS2cZwPeCNpN2cbjO/aBbSXR9p2DYHxRtGUuFski6TMwQuT/cx?=
 =?us-ascii?Q?cQ2LZxR+ppcIHQY1k9pE/1gT2KodNo2YTGfxY2wUFVn5Dh3esUqCx1mAV05P?=
 =?us-ascii?Q?LJZfzwgycLNsEpu6ZLRVcFLZNEaRD8b+GJhgw9cSd2RA4kVveCgwxoVN470D?=
 =?us-ascii?Q?+w7xok65Yz45phq+I558XUIi3PjxWjEj4Lu8Mtk1xQHugfioCiDFkP/kz6aN?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffd1895-faa7-4793-9974-08de19a60807
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 00:23:22.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CTU1t7tIvy3Y9wDG3QdZtXTB4ZVi2qTB7uhSQeeWXzJR2TnOqRGMg5rDBBVdQr7W9MNJGdvEJqH7+wrCLEA8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
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

On Fri, Oct 31, 2025 at 11:29:22AM -0700, Niranjana Vishwanathapura wrote:
> Multi Queue is a new mode of execution supported by the compute and
> blitter copy command streamers (CCS and BCS, respectively). It is an
> enhancement of the existing hardware architecture and leverages the
> same submission model. It enables support for efficient, parallel
> execution of multiple queues within a single context. All the queues
> of a group must use the same address space (VM).
> 
> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
> property supports creating a multi queue group and adding queues to
> a queue group. All queues of a multi queue group share the same
> context.
> 
> A exec queue create ioctl call with above property specified with value
> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
> queue being created as the primary queue (aka q0) of the group. To add
> secondary queues to the group, they need to be created with the above
> property with id of the primary queue as the value. The properties of
> the primary queue (like priority, timeslice) applies to the whole group.
> So, these properties can't be set for secondary queues of a group.
> 
> Once destroyed, the secondary queues of a multi queue group can't be
> replaced. However, they can be dynamically added to the group up to a
> total of 64 queues per group. Once the primary queue is destroyed,
> secondary queues can't be added to the queue group.
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 191 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  30 ++++
>  include/uapi/drm/xe_drm.h                |   8 +
>  4 files changed, 274 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b57d7c2cc94..86404a7c9fe4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_bo.h"
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -62,6 +63,32 @@ enum xe_exec_queue_sched_prop {
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>  				      u64 extensions, int ext_number);
>  
> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +	unsigned long idx;
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
> +		return;
> +	}
> +
> +	if (!group)
> +		return;
> +
> +	/* Primary queue cleanup */
> +	mutex_lock(&group->lock);
> +	xa_for_each(&group->xa, idx, lrc)
> +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +
> +	xa_destroy(&group->xa);
> +	mutex_destroy(&group->lock);
> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
> +	kfree(group);
> +}
> +
>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -72,6 +99,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		xe_exec_queue_group_cleanup(q);
> +
>  	if (q->vm)
>  		xe_vm_put(q->vm);
>  
> @@ -549,6 +580,148 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
>  
> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_tile *tile = gt_to_tile(q->gt);
> +	struct xe_exec_queue_group *group;
> +	struct xe_bo *bo;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return -ENOMEM;
> +
> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				       XE_BO_FLAG_GGTT, false);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
> +			PTR_ERR(bo));
> +		kfree(group);
> +		return PTR_ERR(bo);
> +	}
> +
> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
> +
> +	group->primary = q;
> +	group->cgp_bo = bo;
> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->lock);
> +	mutex_init(&group->list_lock);
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +}
> +
> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->gt->info.multi_queue_enable_mask & BIT(q->class);
> +}
> +
> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
> +					u32 primary_id)
> +{
> +	struct xe_exec_queue_group *group;
> +	struct xe_exec_queue *primary;
> +	int ret;
> +
> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
> +	if (XE_IOCTL_DBG(xe, !primary))
> +		return -ENOENT;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
> +		ret = -EINVAL;
> +		goto put_primary;
> +	}
> +
> +	group = primary->multi_queue.group;
> +	q->multi_queue.valid = true;
> +	q->multi_queue.group = group;
> +
> +	return 0;
> +put_primary:
> +	xe_exec_queue_put(primary);
> +	return ret;
> +}
> +
> +#define XE_MAX_GROUP_SIZE	64
> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 pos;
> +	int err;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return 0;
> +
> +	mutex_lock(&group->lock);
> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);

Not a complete, just another few quick comment.

I see the documentation patches mention the ref counting scheme but it
is easy to over look that. Can we we have a quick inline indicating
primary holds a reference to secondary queues LRCs?

Matt

> +	if (XE_IOCTL_DBG(xe, err)) {
> +		xe_lrc_put(q->lrc[0]);
> +		mutex_unlock(&group->lock);
> +
> +		/* It is invalid if queue group limit is exceeded */
> +		if (err == -EBUSY)
> +			err = -EINVAL;
> +
> +		return err;
> +	}
> +
> +	q->multi_queue.pos = pos;
> +	mutex_unlock(&group->lock);
> +
> +	return 0;
> +}
> +
> +static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_lrc *lrc;
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		return;
> +
> +	mutex_lock(&group->lock);
> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
> +	if (lrc)
> +		xe_lrc_put(lrc);
> +	mutex_unlock(&group->lock);
> +}
> +
> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
> +		return -ENODEV;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
> +		return -EOPNOTSUPP;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
> +		return -EINVAL;
> +
> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +			return -EINVAL;
> +
> +		q->multi_queue.valid = true;
> +		q->multi_queue.is_primary = true;
> +		q->multi_queue.pos = 0;
> +		return 0;
> +	}
> +
> +	/* While adding secondary queues, the upper 32 bits must be 0 */
> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
> +		return -EINVAL;
> +
> +	return xe_exec_queue_group_validate(xe, q, value);
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -557,6 +730,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -577,7 +751,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> @@ -626,6 +801,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>  						  ++ext_number);
>  
> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
> +		err = xe_exec_queue_group_init(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			return err;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -780,12 +961,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> +		err = xe_exec_queue_group_add(xe, q);
> +		if (XE_IOCTL_DBG(xe, err))
> +			goto put_exec_queue;
> +
>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->lr.context = dma_fence_context_alloc(1);
>  
>  			err = xe_vm_add_compute_exec_queue(vm, q);
>  			if (XE_IOCTL_DBG(xe, err))
> -				goto put_exec_queue;
> +				goto delete_queue_group;
>  		}
>  
>  		if (q->vm && q->hwe->hw_engine_group) {
> @@ -808,6 +993,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  kill_exec_queue:
>  	xe_exec_queue_kill(q);
> +delete_queue_group:
> +	xe_exec_queue_group_delete(q);
>  put_exec_queue:
>  	xe_exec_queue_put(q);
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..8cd6487018fa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -62,6 +62,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>  	return q->pxp.type;
>  }
>  
> +/**
> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if the exec_queue is part of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.valid;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is primary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
> + * of a multi queue group.
> + * @q: The exec_queue
> + *
> + * Return: True if @q is secondary queue of a queue group, false otherwise.
> + */
> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) && !q->multi_queue.is_primary;
> +}
> +
> +/**
> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
> + * @q: The exec_queue
> + *
> + * If @q belongs to a multi queue group, then the primary queue of the group will
> + * be returned. Otherwise, @q will be returned.
> + */
> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
> +{
> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
> +}
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index c8807268ec6c..3856776df5c4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -31,6 +31,24 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +/**
> + * struct xe_exec_queue_group - Execution multi queue group
> + *
> + * Contains multi queue group information.
> + */
> +struct xe_exec_queue_group {
> +	/** @primary: Primary queue of this group */
> +	struct xe_exec_queue *primary;
> +	/** @lock: Queue group update lock */
> +	struct mutex lock;
> +	/** @cgp_bo: BO for the Context Group Page */
> +	struct xe_bo *cgp_bo;
> +	/** @xa: xarray to store LRCs */
> +	struct xarray xa;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
> +};
> +
>  /**
>   * struct xe_exec_queue - Execution queue
>   *
> @@ -110,6 +128,18 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> +	/** @multi_queue: Multi queue information */
> +	struct {
> +		/** @multi_queue.group: Queue group information */
> +		struct xe_exec_queue_group *group;
> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
> +		u8 pos;
> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
> +		u8 valid:1;
> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> +		u8 is_primary:1;
> +	} multi_queue;
> +
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..d903b3a55ec1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1252,6 +1252,12 @@ struct drm_xe_vm_bind {
>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>   *    runtime PM will be blocked while queues of this type are alive.
>   *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
> + *    or add secondary queues to a multi-queue group.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
> + *    then a new multi-queue group is created with this queue as the primary queue
> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
> + *    queue id is specified in the 'value' field.
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1292,6 +1298,8 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
