Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3C1091912
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 20:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962110E035;
	Thu, 19 Mar 2026 20:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SO8lHliV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8D10E035
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773952149; x=1805488149;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0VF5Zl5ss23ITcDwv4dHGzuo6fAtRQD8ZcEfSUAeWrs=;
 b=SO8lHliVCPmFUBtDuYNWSfQBSkiUxMrzht6DwHlnkGqpQZeSM/4jcAcM
 1IDY2ecRGRYKsD5IxcjsvCMspzPT7wqP5120OKB9UhmUHp0X5jaABD+OS
 qest1qC0RW3AuPHqrhTb7BGT8opi6Hucdh9et1PmpoemBy+pYiV9By0cB
 qSwSkhte1wDRqAugnv/RI2mTDN+4l6M+A3gSNUQnI58wtksFpO4pqCgUQ
 9gzM7lrgBOczHc+mDfPOXf9BpBFl4Q74NKXuuQltPr4al+3EuL89JCIbr
 my8FA3X7Rqr678wK+Hr4JxdUQ1g4ktSSkJenFXZNKLVzKkPbhUS4f1rEJ Q==;
X-CSE-ConnectionGUID: /pYbghFoTvm/P4wKOMDBOQ==
X-CSE-MsgGUID: WVpk/2fuSYawtpbXbR78oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78940457"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78940457"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 13:29:09 -0700
X-CSE-ConnectionGUID: 7YEZH83lTNuCJuJXLdTzwQ==
X-CSE-MsgGUID: JRAhkwkSQOSPdShIpjEqaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="223104410"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 13:29:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 13:29:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 13:29:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 13:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDDSidYkoODOn1AQTOwV8eTvJ3fCbmzsnSuU7k4sgn2WOxIf/1XMUHYzfWF4zwrme9BzZCrWR62zs9/aT3Kd5qQknRMcH2P9Ag1+mSnmoyFUTX7Vbokr4hzZs0lep+6z5CVdG4iF+mVFDNoCAm6NPV0wFkPgGpGa8XKCapJoV9Vil/D5Ni82XbNcrp3gbLgoMCTWPx9YFrfO1JcMAgDebvJQFjSLPWeWvu4QaP6Ttz9KG7zQUPQIGys3yDvPcbsueBBLxdn/r36ak4UYr7h5280zVs5I49V2E6//pEd+NxCP1iN1qvi6TrQ81KGL4b/3zwuj2BDZo7JzuVU2a7OsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Kk7sqnjubhAX7D783UnnglCjGqtdvoHE+PK6vMjvw=;
 b=jZV4g9mCNlCKXG4QNObF3SlZiTn4zbjgoxCWX6EcRkYtG/lx37LLUZfMwpwwbzjhm5F+nK/aq9b3ZVnw6RDefSa9/x2jEQvUbT/HzJSiB5NvmwZTpNZEQp7/G+7G9yqq79cyYiGxnlHMnw4Fd/EcohMDZbYq/+XaRyHAUklutBScSnWacBoVQUY0uM2VrsQFTSAYvyEJWHxF3tdviRPoWQ6FxOSD2u9H3+ZZfpM99d7q/g35yxMQyBQcNv/q3eCDYI16+6mrxZS3q21Dfz3G7yPKIZ4IcofpsljObEm5aUgUKjVBlY3HGvUCE2hb/q1Ez+WHQv1Gxuz7Xnx8Dhq2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 20:29:04 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::715e:202c:8b30:1f56%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 20:29:03 +0000
Date: Thu, 19 Mar 2026 13:29:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <piotr.piorkowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add LMTT invalidation to VF provisioning flow
Message-ID: <abxcjWSuj6UKCbq2@nvishwa1-desk>
References: <20260319181610.18006-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260319181610.18006-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a53534-638a-4d51-a6ff-08de85f6294f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: MbqigQhf6WMuEeWTOf7XoWn+Wo44UhjkxKyS45CxM0W2rrAQXnRyNZP1FNjP/T5MhGIQOtAtgwmz40t1E0474i82V0V/6ugIS1q4fITB9X96OFDZQI7aX9ZQ7lyPDcgmWbKYB1sqxRYLqH/hZxDT++R0xFV6KhI++7SfQkO/vQ2KHsX02EMOpWaRdffZHnNe26nlvbSyXAoUvGmTOvHwjklRjWz0Ky5QLdjIs9o/6r/wm0CwcmwTK3679y4yjZkuVm/Guk0wqldzVW2RBDJHWIrng1SadczC36G/ZwYJDJb5gBk0Yh3d8CoIColhJx+XGxK6PgL7QXiaUM9C71V5Tj9jqDKO2iOtzfKZ2bI4ufgOF8gviQsJjrUXuD/9F5SMl8CLGlnoyQWHWtNehHAHXtjnkRmv0U1ep+Lb3GMY+tCe3Kr7Ss1SA7q0DSyU3m/w4LX4iFRglOrdKn9wGwcARaf+P34NvXIYVCT4LEO3pmSIJn2CkczB0bDw/HTWJkdpatdheCcyIlw8QLO8QNbROHg8s5V+YVrrAmlEMwKLqkYcHatdwav7oCUqlMUdAhuARsFC9GoKx0QnBac0drLJOkr5X48HXVV+hKTYv4qkYBIubwwKdm43Xliaas62P6MgeIY2OaCXfkXIwHocKij/DKCFlSLkCkLx3LgBkcAsNcITMWarQHONz9NSNfacR6i1LnrGBfCZ2nJjhgnpabNoURDidDSdeAcqQgVA9kLEm9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQ00Dq+B6wiQkc4hYNevkUJKF/Gv2uOCeY1f7G1F3cfqg4WNsYQz7ipQ+6so?=
 =?us-ascii?Q?xinksi8eCdHyiET/BsxIimVPgaqiHzGAq8wbuF63dxnYnSpvC5k43aYAPzNf?=
 =?us-ascii?Q?kgjBA03PfXB/vSypOj/yWUUZ3g8isO5uZ0qiEFe6TjLYYFz5DXCCp6nv1tPE?=
 =?us-ascii?Q?jmEFGmCSP2DgINdcpoCTrg7QsKKf/U3SQDCIaIKAbJYQhtyiUzB8NsD4VL/d?=
 =?us-ascii?Q?SnJX5v9wgmobiUI3zMKSXwATGqZq12UkBRVWYUer879l2YKj8fuPzpsQ5rX/?=
 =?us-ascii?Q?8tIMSIwaDWgjst+za7VaIjk6HR/5qZfWxRtAyqWMplmCkTwD4fY0JPoNB6EL?=
 =?us-ascii?Q?qXVQnw/Exn4vQ0RjGdR6Dub6a5hv1rOO3t6LaCJVYNyZYQXcUNiJFNYp0Tdk?=
 =?us-ascii?Q?WRLWwbEvjwU4mnCnaEEC922n99+aJba2QpXbLsNhw4/XabdTyblKRnXxmI7N?=
 =?us-ascii?Q?QbMkoLBmi7LuBra5YJxGys1sagldiSkgTOSVYr6Be/HGl9sNt6UA2FGJT+k5?=
 =?us-ascii?Q?fmb05CQxovkwjkzpsiIdgljOrT1DYza3vqfIZODG+642LMHfCDX55azYrTOv?=
 =?us-ascii?Q?NK20/ZPshA/qJomYGg7a7ObHExoBT5GC6feoc7+0qOnqxml31otKMKM3xO2s?=
 =?us-ascii?Q?r65WinQ1ULXc53Y2b61shfP+tXWb2n+V4nAD9efvv+t83TbfeNs7X9N4H/AU?=
 =?us-ascii?Q?WtHJsxFqo1ELBLF07h9IetF5wFyCWluGYE33XrSPv7jULb4/2JHmDreYdFLk?=
 =?us-ascii?Q?gEikxMxiUo7FrxZkWNcD/yocetcdTLOpGwGzBNuDGLeZVsYaDc++MwWhtkgK?=
 =?us-ascii?Q?AkPXsJPojEol5hO9STil6RWRQjF+SxuLhPKDp0+HqLhKGeTOUzyG5JbNg4rl?=
 =?us-ascii?Q?kszNRAyiRCwYudeJ+j3uXAEDhQPFSqPCitdfZ4mdKrC3O1FLglpPjxWQlDHr?=
 =?us-ascii?Q?j/i2B5qg0UimDBkn5YMWbwdh6t4pjiWLKb76o6x/8aaNgPyTpHu1DOXFMpBy?=
 =?us-ascii?Q?cfqQnlo/DkkZ4JDBBVdUcWzz6udBugzBRjHJOZFfRwfisO/Z4aRsGIW9Q4gw?=
 =?us-ascii?Q?WSNcpual2b0hPujrCKgqWnODQqSFAZLBwu9xRbBWy8PcKjXh3WDqAGEwwdJE?=
 =?us-ascii?Q?kEen9WWtlmUAIXN3PAG78XLQVNF5x8o3RZlLQ9/Z/IJoUeeCYrbSkdmIMbo7?=
 =?us-ascii?Q?kEUKJ6Yc1cpbvDkYFxy1Dq0Q8G5A0VLnyEEMxRxBH87IsDP9Xk0Ea5IiYIsF?=
 =?us-ascii?Q?5/JfrdXIbLCi7GjRM6460UgZKqOBAYFXpxy7eoeP/NL1nJ9lOROpKxydNw5g?=
 =?us-ascii?Q?UPDvxNp8mlj3e5ber2wbX5fgpD1mzv0U/Gfi6ysUDxfDeuLVFO4DAjt7/bRF?=
 =?us-ascii?Q?Ta9vN9jeO9wJzLA4c2JNJQNzgfNePJzCKQc4uUB9VwQ4F4L2IHwyIQ/LfTIH?=
 =?us-ascii?Q?TnmitppJcgHht04p5uVNdeJvAYjwKVIvGRpv6X+ZaN/4q47v82ffj8QzjwY5?=
 =?us-ascii?Q?9kPshPxnmtL8+DLoLLhMiHihed6nfA6I1Gpi1Cv7J7FSnnev+8ye2OkX1c6Z?=
 =?us-ascii?Q?zuagBS+N4zb2SJChjAi9iJFQ1i7nREGtMUXoFULXqYhOCBl7ESs9iCozEgk0?=
 =?us-ascii?Q?Bohwwa9nu5qbtLiz3uXx0EC8CJaRqxzzsswPbdpCfvDozq61XrxUOoX7VUH/?=
 =?us-ascii?Q?duB//+ksg84R3jYN36JiCMRGuEbjbu6a9Z/TPUrsghPpKwn/KiYRZBvzux3Z?=
 =?us-ascii?Q?nIAC7ChGERM7+cqR86kbO4Uf1wLjDAE7ngIGLgLrLtRN6b8DQ3aL?=
X-Exchange-RoutingPolicyChecked: btxQZPZpM4MHrVPwSek6rVUQH009l0KEyeHMMn7BZrVGAGm+b439/ZIkF9t3ukZkxvwfSTwVuVHHr2J1GxzP3+Wht7ogUEQfFaclXzMCbZDCGs6IyWrPj5854IiVPTrGdg88966aeRsceTwtrnxuOQsC3wEUwWtPRJlVRzEneVhJWMsxHg8k/WV9KEOVkCByatU9E/lId3XtngvVNE5xdhFb/wrvWZ0UWMJ46buGteCvtVE+NwBjxYhWmIcA+7QEmQjqAlb7WU1ssxR9vWu2kQE3yMgjw/RkWvAQzrtz5gqIpH0cqohRGJNNz646sT5vpPBt4mqq2o3UrZY7A21flQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a53534-638a-4d51-a6ff-08de85f6294f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 20:29:03.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTnXl30egIEVgCtGi8Mw3Kh4fMddXpjG5DOGysSU+WFmJbZdw5qzSEI5AVuITxw0+Elb3aqeo1dBFkdOIDGYmiJsmjki63XFC2Ethin35b6Re+5WZ3QAFxEMDkzDX5DX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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

On Thu, Mar 19, 2026 at 06:16:05PM +0000, Stuart Summers wrote:
>There is a new invalidation type added to invalidate an LMTT of a
>particular VF from the PF instead of doing a full invalidation.
>
>A new invalidation type has been added to GuC to accommodate this.
>Add the new invalidation type, add a new TLB invalidation front
>and back end hook for the new type, and use this in xe_lmtt.c
>by passing the VF ID any time we are provisioning the LMTT for
>a particular VF so GuC can then relay that VF ID to hardware
>during the invalidation.
>
>Bspec: 59311
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_actions_abi.h   |  2 ++
> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  6 +++---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c      | 18 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_lmtt.c               | 17 ++++++++++-------
> drivers/gpu/drm/xe/xe_lmtt.h               |  2 +-
> drivers/gpu/drm/xe/xe_tlb_inval.c          | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.h          |  3 +++
> drivers/gpu/drm/xe/xe_tlb_inval_types.h    | 12 ++++++++++++
> 8 files changed, 69 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>index 83a6e7794982..31272de6fd3f 100644
>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>@@ -239,6 +239,8 @@ enum xe_guc_tlb_invalidation_type {
> 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
> 	XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
> 	XE_GUC_TLB_INVAL_GUC = 0x3,
>+	XE_GUC_TLB_INVAL_ALL_TLB = 0x4,

XE_GUC_TLB_INVAL_ALL_TLB is unused.

>+	XE_GUC_TLB_INVAL_LMTT_ONLY = 0x5,
> };
>
> /*
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>index 2f376b5fb088..bcdcb9fec8a1 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>@@ -1518,7 +1518,7 @@ static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 si
> 	return 0;
> }
>
>-static void pf_force_lmtt_invalidate(struct xe_device *xe)
>+static void pf_force_lmtt_invalidate(struct xe_device *xe, unsigned int vfid)
> {
> 	struct xe_lmtt *lmtt;
> 	struct xe_tile *tile;
>@@ -1529,7 +1529,7 @@ static void pf_force_lmtt_invalidate(struct xe_device *xe)
>
> 	for_each_tile(tile, xe, tid) {
> 		lmtt = &tile->sriov.pf.lmtt;
>-		xe_lmtt_invalidate_hw(lmtt);
>+		xe_lmtt_invalidate_hw(lmtt, vfid);
> 	}
> }
>
>@@ -1592,7 +1592,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> 		}
> 	}
>
>-	pf_force_lmtt_invalidate(xe);
>+	pf_force_lmtt_invalidate(xe, vfid);
> 	return 0;
>
> fail:
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 256759b826bc..978c3905a525 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,22 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+static int send_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
>+			       unsigned int vfid)
>+{
>+	struct xe_guc *guc = tlb_inval->private;
>+	u32 action[] = {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_LMTT_ONLY),
>+		vfid,
>+	};
>+
>+	xe_gt_assert(guc_to_gt(guc), xe_device_has_lmtt(tlb_inval->xe));
>+
>+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
>+}
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -355,6 +371,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> 	.all = send_tlb_inval_all,
> 	.ggtt = send_tlb_inval_ggtt,
>+	.lmtt = send_tlb_inval_lmtt,
> 	.ppgtt = send_tlb_inval_asid_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>@@ -364,6 +381,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> 	.ggtt = send_tlb_inval_ggtt,
> 	.all = send_tlb_inval_all,
>+	.lmtt = send_tlb_inval_lmtt,
> 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>index 0c726eda9390..a8bca1e5a633 100644
>--- a/drivers/gpu/drm/xe/xe_lmtt.c
>+++ b/drivers/gpu/drm/xe/xe_lmtt.c
>@@ -252,19 +252,21 @@ void xe_lmtt_init_hw(struct xe_lmtt *lmtt)
> 	lmtt_setup_dir_ptr(lmtt);
> }
>
>-static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>+static int lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid)
> {
> 	struct xe_tlb_inval_fence fences[XE_MAX_GT_PER_TILE];
> 	struct xe_tlb_inval_fence *fence = fences;
> 	struct xe_tile *tile = lmtt_to_tile(lmtt);
> 	struct xe_gt *gt;
>-	int result = 0;
>-	int err;
>+	int result = 0, err = 0;

NIT...No need to init err as it is set in both if/else condition.

> 	u8 id;
>
> 	for_each_gt_on_tile(gt, tile, id) {
> 		xe_tlb_inval_fence_init(&gt->tlb_inval, fence, true);
>-		err = xe_tlb_inval_all(&gt->tlb_inval, fence);
>+		if (gt_to_xe(gt)->info.has_ctx_tlb_inval)
>+			err = xe_tlb_inval_lmtt(&gt->tlb_inval, fence, vfid);
>+		else
>+			err = xe_tlb_inval_all(&gt->tlb_inval, fence);
> 		result = result ?: err;
> 		fence++;
> 	}
>@@ -286,13 +288,14 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
> /**
>  * xe_lmtt_invalidate_hw - Invalidate LMTT hardware.
>  * @lmtt: the &xe_lmtt to invalidate
>+ * @vfid: VF ID associated with this LMTT
>  *
>  * Send requests to all GuCs on this tile to invalidate all TLBs.
>  * If the platform has a standalone MERT, also invalidate MERT's TLB.
>  *

This description is stale and needs update.

>  * This function should be called only when running as a PF driver.
>  */
>-void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid)
> {
> 	struct xe_tile *tile = lmtt_to_tile(lmtt);
> 	struct xe_device *xe = lmtt_to_xe(lmtt);
>@@ -300,7 +303,7 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>
> 	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
>
>-	err = lmtt_invalidate_hw(lmtt);
>+	err = lmtt_invalidate_hw(lmtt, vfid);
> 	if (err)
> 		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> 				  ERR_PTR(err));
>@@ -367,7 +370,7 @@ static void lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid)
> 		return;
>
> 	lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid);
>-	lmtt_invalidate_hw(lmtt);
>+	lmtt_invalidate_hw(lmtt, vfid);
>
> 	lmtt_assert(lmtt, pd->level > 0);
> 	lmtt_assert(lmtt, pt->level == pd->level - 1);
>diff --git a/drivers/gpu/drm/xe/xe_lmtt.h b/drivers/gpu/drm/xe/xe_lmtt.h
>index 8fa387b38c52..ad370807ff3c 100644
>--- a/drivers/gpu/drm/xe/xe_lmtt.h
>+++ b/drivers/gpu/drm/xe/xe_lmtt.h
>@@ -15,7 +15,7 @@ struct xe_lmtt_ops;
> #ifdef CONFIG_PCI_IOV
> int xe_lmtt_init(struct xe_lmtt *lmtt);
> void xe_lmtt_init_hw(struct xe_lmtt *lmtt);
>-void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt);
>+void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt, unsigned int vfid);
> int xe_lmtt_prepare_pages(struct xe_lmtt *lmtt, unsigned int vfid, u64 range);
> int xe_lmtt_populate_pages(struct xe_lmtt *lmtt, unsigned int vfid, struct xe_bo *bo, u64 offset);
> void xe_lmtt_drop_pages(struct xe_lmtt *lmtt, unsigned int vfid);
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>index 10dcd4abb00f..1283fde94a16 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -321,6 +321,26 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_lmtt() - Issue a TLB invalidation for the LMTT for a VF
>+ * @tlb_inval: TLB invalidation client
>+ * @fence: invalidation fence which will be signal on TLB invalidation
>+ * completion
>+ * @vfid: VF ID for this LMTT
>+ *
>+ * Issue a TLB invalidation for the LMTT for a VF. Completion of TLB is
>+ * asynchronous and caller can use the invalidation fence to wait for
>+ * completion.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval,
>+		      struct xe_tlb_inval_fence *fence,
>+		      unsigned int vfid)
>+{
>+	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->lmtt, vfid);

Should assert if ops->lmtt is NULL? Or should caller call xe_tlb_inval_all instead
if ops->lmtt is not supported?

Niranjana

>+}
>+
> /**
>  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
>  * @tlb_inval: TLB invalidation client
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
>index a76b7823a5f2..38d312c41365 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
>@@ -20,6 +20,9 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> 		     struct xe_tlb_inval_fence *fence);
> int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>+int xe_tlb_inval_lmtt(struct xe_tlb_inval *tlb_inval,
>+		      struct xe_tlb_inval_fence *fence,
>+		      unsigned int vfid);
> void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> 		       struct xe_tlb_inval_fence *fence,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>index 3d1797d186fd..6205f5619303 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,18 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @lmtt: Invalidate the LMTT for a VF
>+	 * @tlb_inval: TLB invalidation client
>+	 * @seqno: Seqno of TLB invalidation
>+	 * @vfid: VF ID for this LMTT
>+	 *
>+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>+	 * failure
>+	 */
>+	int (*lmtt)(struct xe_tlb_inval *tlb_inval, u32 seqno,
>+		    unsigned int vfid);
>+
> 	/**
> 	 * @ppgtt: Invalidate per-process translation TLBs
> 	 * @tlb_inval: TLB invalidation client
>-- 
>2.43.0
>
