Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B94EC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 23:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E65A10E58B;
	Mon,  3 Feb 2025 23:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl6jXl/M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B0310E588
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738624411; x=1770160411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bfd5+M0+D1gMStpCdUw68Nj1ODFgsDGk1jKNN6n/vaI=;
 b=dl6jXl/MqInuyDt9XEAbD6NsxLvaUce2kmfLhntOu9ZxDV/QM/wYFX4k
 FmyxpueFmyjXMGjQnWlpVBOsPFG3LrB5X6R0Svmiv7gjeSNMEw/fsTsWk
 QH063DAgbvuzvzLwFH7m/Trfx4jwt3l1wBnOf1btpdXmovGQC0KS75bit
 clV36ENSEJz9j9umo9Xm2DphIqm2Cvfc10D02V+uiz/3E3xxBxWdLQLRp
 /9WgZn4MZMJHQQqTaElemxgOV0a0u01AQjkrm6WjycbCQA8owsL4d4XlP
 qsz3GuogmfjlVzE0b2PyUxmMx/YbU9ciJr7p3QB8+p+Rp3gl42chj+XPn w==;
X-CSE-ConnectionGUID: vi8V+31iTaC0SGbAkISL8w==
X-CSE-MsgGUID: +lkJQKwlRD2mmz4RBw0Kuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56672077"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; d="scan'208";a="56672077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 15:13:31 -0800
X-CSE-ConnectionGUID: E3GSYzh4SNWvlKHvUvOvkg==
X-CSE-MsgGUID: 1sp38KFkQgyzwVbgAgqDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110225854"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 15:13:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 15:13:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 15:13:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 15:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdAFzM7nWwmyURyjucI03TEYVpcxdklKNZjKOto1qBR7KcTrPpF5frl9VHT1w/2wMu0B4AchKSxsNMheFx9XrXA9dvH7rOZZQaVwLAesc3Nk4Es/pI/rC0B2ZPqAIlxjo09REqSdoMV6n9/DA9Z2JSWS/6pOLZtMwkH5iu1ezVZqmps3eNwhz3A/qm7uGCXZZfa3BNh0WBcbsy5VRYdU8VppzPgHLxzBSBttw4BKaX2d1q3T8mIdISX5WFVPB4r1cGBbvF3rov52Wu0RM5ZWmBZevIgRmRdqfZ01zFPjKAIFoiPAjWX2VWi1umkr2Qx3JOtXzyG40SAQCpzwW2UZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBq7ifWBGlq49idn3HySeINmaAzGqMvXiwms1zR40w4=;
 b=DWbdkU3QZnP6tLPFvj/ROUTZ1GoKss992/uCVb6fMGmVtEQy9a4QIrmEn1KwUKQzyTzB2VVSrnrbv+iyZpxw5W0UYrVU4fxCj0zvuQGhWI2IoJMgSNvfe+z1PWm914RgbtjGQtbmCekcbqCIp5A//OKOK8i6IEXhjipJF0qsgfauvvISBo6M9qM9uz+HQF2pgjYUwpnqHrcYsZiqNcZ0FQhRBV0lhDkGf0uWWa2p5XUYFyE78bWQdhSsOmFtCXbinBuppAg25K8AJQ52t5WYXfe2vZjL2hCO00kDCrY+pbhdxjF+KJbQa7aCrNf/jVbnOYqiEHhjCBsk69sGIqn7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 23:13:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 23:13:24 +0000
Date: Mon, 3 Feb 2025 15:13:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Refactor some graphics descriptor flags (rev3)
Message-ID: <20250203231322.GU5109@mdroper-desk1.amr.corp.intel.com>
References: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
 <173823829206.2846780.8782880805109556806@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173823829206.2846780.8782880805109556806@b555e5b46a47>
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b1daea-82cf-4ae5-a7a8-08dd44a85bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b3YkJRqR1x+Kn7OOKfZSKR7J1XzKHD9s1eqh9mBExJFC6mqs7EXpJ/Iwy9+x?=
 =?us-ascii?Q?dLTaNAfZEAJU1Ew7Rl6rd444O1rnWuIuvUi7FjSJzmlf/pTDPeJgq0+isrp3?=
 =?us-ascii?Q?MeuHycFvpTxZ3AksDIW2Y77ZzT9USvZQ5zHt3xGxKUBV0hOWgL3r14lOxH/e?=
 =?us-ascii?Q?f/2hCzxJJBkpiYp7t2Cc5zYsjN55vDWF3CYu/cQiShlV75X+FdMTPvK7qXI2?=
 =?us-ascii?Q?CJEyrHNabT7V2piBfNb8CMKVSiDW1Wls+tJ5aY6agB0Zk+Oqx6jNCecfe92N?=
 =?us-ascii?Q?SghxNYdAlBB9HEqtw5rBNW2YhWNqKYY+hJFTSC4DquvRs3SJ26MEpCvQ5kKn?=
 =?us-ascii?Q?ChsgX8HwZdkrxtsB4tfPfuDTGVUoX9CWBIDsDDKyhXocnP8VjjavSH6jVVTS?=
 =?us-ascii?Q?hP2OU9rup95D16lwYhX0LB2OVfvHygKfRi+wOVHJPDyMHIJRuJJAxfBL4svC?=
 =?us-ascii?Q?w4vufjFOGJIDHV9BuvbgMduNv+4HIxQqm+CaIA82vFFNKJcdclZQQUWZKtoW?=
 =?us-ascii?Q?ZSAbW1i6awtPA/jxA9tNrlCFWN4TJ9F4w27iuZsSlaOVMApQWeFmxkJxxC6b?=
 =?us-ascii?Q?JFU46rcOFyGLcD34LrsDWEgFIRPmdhig2P4CfNsDOW6xypn64feEus9JsmXT?=
 =?us-ascii?Q?evmCWL9IPpmtxx1cuBfOxarswESWGBWFDzJIxx3f9WW5lhm+wz9rDPiiufUY?=
 =?us-ascii?Q?bXM6GGt2rsagjVQROZNNIJEIuBDNPFvXFSqLvfWfXVb4sAiOl9OtIuVyQMjh?=
 =?us-ascii?Q?xA2QrMPjOKfTinIFrnn9equMc54tdlQWyabmh3/Xx5yFtOt4pyADaeyWyDCw?=
 =?us-ascii?Q?NBaS/nou9zxPBhYkXVom1fCG/X9tmK325HmxuyjcRDcIuF0vI7t1CchIG7w3?=
 =?us-ascii?Q?1arLEFwCBVQwYkC5s3inkA45y7C0N14N9X/T8yTP1MB5+Y7OtU3W5nh2Rep2?=
 =?us-ascii?Q?88P+Q0sGG7LxWTxSMU8VAXlYo99z11n24ZtyqDmvfkOXto3vVWWPHaOhI9/o?=
 =?us-ascii?Q?cf2zlzFXaQZ9KPXQ9zwciqUrs3IZs5UIYszLPN4m4nQenfW3Uv5P6BxjZ8Zl?=
 =?us-ascii?Q?FCDJAtJ1XH4jG3mv/ZK0Awieo9lE+gh1uKtBjAh9I/ajfT50wNi1crZNqCuj?=
 =?us-ascii?Q?C74U6WqKuCRGWds1j6csj9aXN7bt0aMrIyQCQVQa8TzoPVIMmd7h7vHSoUC7?=
 =?us-ascii?Q?phDf1acsh/XlvwazKzWnyou5IiszPi27q7tZBgrJlq/0AU+stTISV9LZkJVg?=
 =?us-ascii?Q?7lK0n5wxUXyeBD8pregFmdBcy5cmyxCPBAJtjLyvcoCAYKS5VoWhuc6hkP0I?=
 =?us-ascii?Q?vw1Pj88FaFog0bFwa1rjHGJG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?krj0i7IodFBTLC2FKnoSNMSolyrydsWu9N7Z7zTdpskpHO9Hb/HFpqmtZL6b?=
 =?us-ascii?Q?8x/gJyHodO4oaiF23eeNzpG56A5srU2Q4xXNVdrngsJRGxEVpFMmai/N4hK7?=
 =?us-ascii?Q?Uyfsgo9qdQM8bIJS0WDLhfWlmZX9a2BX4gZTKbMx4dZzamy/EPq7Jrx2mCWy?=
 =?us-ascii?Q?WsDet6Qev8ipS+nbVHWjz0adVIBDlQSlgzLmtu9IdHOje4PfAUblyK4mTOOF?=
 =?us-ascii?Q?uUj63AiFEhuI/MFefMD1ljFSeU2z8KQakqeiv3EeRbrg9AXO2mfYlONjkXeW?=
 =?us-ascii?Q?S6721UTFRnN/6hwAW9hM3qPpyax9mV5f5shddUiKg0CNTb+dQBcr5ddCF7zw?=
 =?us-ascii?Q?xJ7W1axZJnVUXnQQ2umKOCpVu6zPULEMUvESfXr5siIXeRldGxePM7OfXdka?=
 =?us-ascii?Q?kLUW5KbeeKM57s82i6y6qiDKV803bq27WbMalDoAwnJ656qdO5Nd6Y1j/MRH?=
 =?us-ascii?Q?5MouZq480O9HELJAfMgrHVLwOfVpvczSrLSKm1slDL4IbTh1doZX5XPEG0MD?=
 =?us-ascii?Q?0HMT66czaUUzRyijXs4z64xyQ+vvnYK8S9068QISn3pJIjlmkfKhMdcKUkZk?=
 =?us-ascii?Q?3OOFtqIUJ3fYLCevQ6cfLvMVvhFmvejtc6/roRqqlf2xZUbrSWIBn5XWXvZB?=
 =?us-ascii?Q?spni9s7ZUD8Myse5ipStZYtTv0wnFBFiOqhum5qYLJ4MhM+dAOn4Urzy22wQ?=
 =?us-ascii?Q?DlBXYPZqnp9VkO8ZI2PJ67/qNfMYOumdjrQFpl0Sj1dyUn0xHt51qTztSigC?=
 =?us-ascii?Q?ZrdnHErunLQoJWxiSu0+BUMQy90oFlI2XLlgBWnPTuz09+h0Wsczzbj7lm6b?=
 =?us-ascii?Q?0BudElMq5H0QOf3izfhHKFXrGdTBUHABqTvVjr4NMp/dejoHYynLBUlHgxwg?=
 =?us-ascii?Q?xSL9NvSBQzkTQpQi1BHosliKG1X+DO5RA16MHH8zgQhzRk6A2MTJLtTpNBcT?=
 =?us-ascii?Q?CotoiB/D0SpRigmHsJ+hGFV+x9MKAX8kP+MiXVTeeE0TD9Nc09oAeLpQc87s?=
 =?us-ascii?Q?GAfkf1U1mYUsbyf7i9FieswoldOFIQGIlxuMKlEwfZLhNRpKtsqC51zlF2SD?=
 =?us-ascii?Q?lKoBwXXOLcjUDeR0xrFg5/NPZjuvgXGmw97F15/r2Gh1HtMrT2fHcbRPK5u0?=
 =?us-ascii?Q?gAdk1w7uWlEGXHK2wYbx51+vNKKYuKP9wy5hhSQifoW5rgRR8MDm0HZ4M2FN?=
 =?us-ascii?Q?hnHY8xu2M/cSY35AZd/MVagG+KYaS/v3g9uIogjiNKp/dhPI4ttVIb+fgLIY?=
 =?us-ascii?Q?nNLECkAPt8qJT+BPpw6v6Ize6TX6PX78RfzyezpiyBq2AtaR/se5bZ75PrtF?=
 =?us-ascii?Q?rVTHHsOYuipmBqn23ws/R4VrU7iWTHH9lBYEXv4ovauXCjNZkwtODpbeFGOn?=
 =?us-ascii?Q?X8A5SdPCfKBrtuYEZF0hPWTW4NN7c+e6hvHLke/D/dCHQ08uc69NvrJebS3W?=
 =?us-ascii?Q?Ggg2mJ1iF0/QSxaIOU5JI99mtTUl05uTeyZoA2/ocdFXIYCRWWTiwXCLDYx1?=
 =?us-ascii?Q?MHH25o3ss5DsGklVFBVRsxU5eMZdhzqW+pss7EfNCU7GPpsqKTsjxlQj1sT6?=
 =?us-ascii?Q?xc3gCnaeFuiCYa2tdPhmz1NtX3kmCqNitapaGFtPc8Btl2gmke0+fqPTgUl+?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b1daea-82cf-4ae5-a7a8-08dd44a85bef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 23:13:24.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR9Vz/rqHzxK3mzvkZNGGQd7tg9V4/7WlDFTtPIDx7uGOfhVzMssinKt4wJ2Tf8u8Ct4y/Y8dgiH7sFSwVymZ2j6R3micHqIzdXO9rWpD/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

On Thu, Jan 30, 2025 at 11:58:12AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Refactor some graphics descriptor flags (rev3)
> URL   : https://patchwork.freedesktop.org/series/143608/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b_full -> xe-pw-143608v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143608v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143608v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-143608v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html

Unexpected incomplete without any warnings or errors.  Seems like CI
just lost communication with the target machine; doesn't appear to be
related to the changes here.

> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>     - shard-adlp:         [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

<3> [456.774358] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)
<3> [456.784403] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173

> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_pm_rpm@system-suspend-modeset.html

Same https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4173 again.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_atomic_interruptible@legacy-setmode:
>     - shard-bmg:          [SKIP][5] ([Intel XE#2423]) -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_atomic_interruptible@legacy-setmode.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_atomic_interruptible@legacy-setmode.html

This is the same as the first item in the regression section above, just
without the specific dynamic subtest noted.

> 
>   * igt@xe_exec_sip@sanity-after-timeout:
>     - shard-bmg:          [SKIP][7] ([Intel XE#1130]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_sip@sanity-after-timeout.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_exec_sip@sanity-after-timeout.html

Looks like another unexpected incomplete.  The timeout warnings in dmesg
are expected for this test; there's no unexpected warnings or errors
reported.  Doesn't appear to be related to these patches.


Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-143608v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][9] ([Intel XE#1033]) +8 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1033]) +9 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#3767]) +15 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +6 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-180:
>     - shard-bmg:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#4172]) +40 other tests dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#316])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][20] ([Intel XE#1033])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#607])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#2191])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +223 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#3442])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][34] ([Intel XE#2625]) +1 other test abort
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#787]) +26 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +37 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#2705] / [Intel XE#4010])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#4010])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][42] -> [DMESG-WARN][43] ([Intel XE#1727] / [Intel XE#3113])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#3124] / [Intel XE#4010])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1152]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#373]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#373]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#306]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#306])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_chamelium_color@degamma.html
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#306])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-4/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#373]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][53] ([Intel XE#1178])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#307])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3278])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1424]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#309])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2291]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#877])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#309])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([i915#3804])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#776])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1138])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1033]) +19 other tests dmesg-warn
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#2882])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#310]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#3321]) +4 other tests fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#301]) +11 other tests fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1421]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][77] -> [ABORT][78] ([Intel XE#2625]) +1 other test abort
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][81] ([Intel XE#1033])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#3321])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-rmfb@b-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][83] ([Intel XE#2049]) +1 other test incomplete
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_flip@flip-vs-rmfb@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [PASS][84] -> [INCOMPLETE][85] ([Intel XE#2049] / [Intel XE#2597])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
>     - shard-bmg:          [PASS][86] -> [INCOMPLETE][87] ([Intel XE#2049]) +1 other test incomplete
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][88] ([Intel XE#4172]) +11 other tests dmesg-warn
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1401]) +3 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293]) +6 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2380])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1397] / [Intel XE#1745])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1397])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#455]) +13 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][96] -> [FAIL][97] ([Intel XE#1874])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][98] -> [DMESG-FAIL][99] ([Intel XE#1033]) +10 other tests dmesg-fail
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#651]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#651]) +23 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#656]) +8 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#651]) +7 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#455]) +7 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#653]) +17 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#653]) +4 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#656]) +17 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][108] ([Intel XE#2625] / [Intel XE#4048])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#346])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2927])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][111] ([Intel XE#1035])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-3:
>     - shard-adlp:         NOTRUN -> [WARN][112] ([Intel XE#2078]) +1 other test warn
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#616]) +1 other test fail
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2763]) +14 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2763]) +11 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2938])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1129])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1129])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>     - shard-lnl:          NOTRUN -> [FAIL][120] ([Intel XE#718])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#3309])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#3309])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-3/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#3309])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1489]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1489]) +3 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1406]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-8/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1127])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][130] -> [SKIP][131] ([Intel XE#1435])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#899]) +2 other tests fail
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#2168])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-4/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          NOTRUN -> [FAIL][135] ([Intel XE#1522]) +1 other test fail
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-1/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][136] -> [SKIP][137] ([Intel XE#1499])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_vrr@negative-basic.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1280] / [Intel XE#455])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#3889])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2905]) +5 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug_online@set-breakpoint:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#2905]) +3 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-3/igt@xe_eudebug_online@set-breakpoint.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#2905]) +3 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-bmg:          [PASS][143] -> [DMESG-WARN][144] ([Intel XE#1473] / [Intel XE#4172])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@xe_evict@evict-beng-large-external-cm.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#688]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-1/igt@xe_evict@evict-large-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1392]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#1392]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1392])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#288]) +10 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#288]) +18 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
>     - shard-adlp:         [PASS][154] -> [DMESG-WARN][155] ([Intel XE#4173]) +2 other tests dmesg-warn
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2229])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#512])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182]) -> ([PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [SKIP][208]) ([Intel XE#378])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_module_load@load.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#379])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_oa@non-zero-reason:
>     - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@xe_oa@non-zero-reason.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#979])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][213] ([Intel XE#1358])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [PASS][214] -> [DMESG-WARN][215] ([Intel XE#2953])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-bmg:          [PASS][216] -> [DMESG-WARN][217] ([Intel XE#1616] / [Intel XE#4172])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][218] ([Intel XE#1033] / [Intel XE#569]) +1 other test dmesg-warn
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-dg2-set2:     [PASS][219] -> [DMESG-WARN][220] ([Intel XE#1033] / [Intel XE#569])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_pm@s3-exec-after.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-bmg:          [PASS][221] -> [DMESG-WARN][222] ([Intel XE#4172] / [Intel XE#569])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][223] -> [ABORT][224] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#944])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#944]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#944])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-bmg:          [SKIP][228] ([Intel XE#2136]) -> [PASS][229] +21 other tests pass
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@core_hotunplug@hotreplug.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@core_hotunplug@hotreplug.html
> 
>   * igt@fbdev@info:
>     - shard-bmg:          [SKIP][230] ([Intel XE#2134]) -> [PASS][231] +3 other tests pass
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@fbdev@info.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#2134]) -> [PASS][233] +2 other tests pass
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@fbdev@write.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@fbdev@write.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-adlp:         [DMESG-WARN][234] ([Intel XE#1033]) -> [PASS][235] +2 other tests pass
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_atomic@plane-invalid-params-fence:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#2423] / [i915#2575]) -> [PASS][237] +119 other tests pass
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][238] ([Intel XE#2291]) -> [PASS][239] +1 other test pass
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-bmg:          [DMESG-WARN][240] ([Intel XE#877]) -> [PASS][241]
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#1033]) -> [PASS][243] +20 other tests pass
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][244] ([Intel XE#2373]) -> [PASS][245]
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][246] ([Intel XE#3321]) -> [PASS][247] +2 other tests pass
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][248] ([Intel XE#886]) -> [PASS][249] +3 other tests pass
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
>     - shard-dg2-set2:     [FAIL][250] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][251]
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2:
>     - shard-dg2-set2:     [FAIL][252] ([Intel XE#301]) -> [PASS][253] +3 other tests pass
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][254] ([Intel XE#2953]) -> [PASS][255] +1 other test pass
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][256] ([Intel XE#4173]) -> [PASS][257]
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-dg2-set2:     [FAIL][258] ([Intel XE#2882]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
>     - shard-dg2-set2:     [FAIL][260] -> [PASS][261] +2 other tests pass
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][263] +9 other tests pass
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][264] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][265] +1 other test pass
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#2136]) -> [PASS][267] +26 other tests pass
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [DMESG-FAIL][268] ([Intel XE#1033]) -> [PASS][269] +7 other tests pass
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
>     - shard-adlp:         [DMESG-WARN][270] -> [PASS][271] +2 other tests pass
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [FAIL][272] ([Intel XE#718]) -> [PASS][273]
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#2446]) -> [PASS][275] +3 other tests pass
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-bmg:          [SKIP][276] ([Intel XE#2446]) -> [PASS][277] +1 other test pass
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_sequence@get-idle:
>     - shard-bmg:          [SKIP][278] ([Intel XE#2423]) -> [PASS][279] +99 other tests pass
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_sequence@get-idle.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_sequence@get-idle.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][280] ([Intel XE#1435]) -> [PASS][281]
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vblank@wait-busy-hang:
>     - shard-bmg:          [DMESG-WARN][282] ([Intel XE#4172]) -> [PASS][283] +11 other tests pass
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_vblank@wait-busy-hang.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_vblank@wait-busy-hang.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][284] ([Intel XE#2159]) -> [PASS][285] +1 other test pass
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@testdisplay:
>     - shard-dg2-set2:     [DMESG-WARN][286] ([Intel XE#2705]) -> [PASS][287]
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@testdisplay.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@testdisplay.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#1392]) -> [PASS][289] +2 other tests pass
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [FAIL][290] ([Intel XE#3546]) -> [PASS][291]
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_module_load@many-reload.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [FAIL][292] ([Intel XE#3546]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@reload.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_module_load@reload.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1130]) -> [PASS][295] +218 other tests pass
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-bmg:          [DMESG-WARN][296] ([Intel XE#4172] / [Intel XE#569]) -> [PASS][297] +1 other test pass
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@xe_pm@s3-vm-bind-userptr.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html
>     - shard-dg2-set2:     [DMESG-WARN][298] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [ABORT][300] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-3/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][302] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][303]
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-lnl-4/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][304] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][305] +1 other test pass
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-dg2-set2:     [ABORT][306] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][307]
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>     - shard-bmg:          [SKIP][308] ([Intel XE#1130]) -> [PASS][309] +234 other tests pass
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-bmg:          [SKIP][310] ([Intel XE#2423]) -> [SKIP][311] ([Intel XE#3768])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-bmg:          [SKIP][312] ([Intel XE#2423]) -> [SKIP][313] ([Intel XE#2385])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          [SKIP][314] ([Intel XE#2423]) -> [SKIP][315] ([Intel XE#2370])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#2136]) -> [INCOMPLETE][317] ([Intel XE#3225])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          [SKIP][318] ([Intel XE#2136]) -> [SKIP][319] ([Intel XE#2327]) +5 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#2136]) -> [SKIP][321] ([Intel XE#316]) +1 other test skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][323] ([Intel XE#316]) +1 other test skip
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][325] ([Intel XE#1124]) +7 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][327] ([Intel XE#607])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-bmg:          [SKIP][328] ([Intel XE#2136]) -> [SKIP][329] ([Intel XE#1124]) +17 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][330] ([Intel XE#2136]) -> [SKIP][331] ([Intel XE#1124]) +9 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][332] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][333] ([Intel XE#619])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][334] ([Intel XE#2423] / [i915#2575]) -> [SKIP][335] ([Intel XE#2191]) +1 other test skip
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          [SKIP][336] ([Intel XE#2423]) -> [SKIP][337] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#2423] / [i915#2575]) -> [SKIP][339] ([Intel XE#367]) +2 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          [SKIP][340] ([Intel XE#2423]) -> [SKIP][341] ([Intel XE#367]) +3 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][342] ([Intel XE#2136]) -> [SKIP][343] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][344] ([Intel XE#2136]) -> [DMESG-WARN][345] ([Intel XE#4199])
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          [SKIP][346] ([Intel XE#2136]) -> [SKIP][347] ([Intel XE#3432])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          [SKIP][348] ([Intel XE#2136]) -> [SKIP][349] ([Intel XE#2887]) +18 other tests skip
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][350] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][351] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [DMESG-WARN][352] ([Intel XE#1033]) -> [INCOMPLETE][353] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136]) -> [SKIP][355] ([Intel XE#2907]) +3 other tests skip
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][356] ([Intel XE#2136]) -> [SKIP][357] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          [SKIP][358] ([Intel XE#2136]) -> [SKIP][359] ([Intel XE#2724])
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cdclk@plane-scaling.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][360] ([Intel XE#2423] / [i915#2575]) -> [SKIP][361] ([Intel XE#306]) +2 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [SKIP][363] ([Intel XE#2325]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_chamelium_color@degamma.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          [SKIP][364] ([Intel XE#2423]) -> [SKIP][365] ([Intel XE#2252]) +14 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][366] ([Intel XE#2423] / [i915#2575]) -> [SKIP][367] ([Intel XE#373]) +13 other tests skip
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [SKIP][368] ([Intel XE#2423]) -> [FAIL][369] ([Intel XE#1178])
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@atomic.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][370] ([Intel XE#2423] / [i915#2575]) -> [SKIP][371] ([Intel XE#307]) +1 other test skip
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][372] ([Intel XE#2423]) -> [SKIP][373] ([Intel XE#2341]) +1 other test skip
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@legacy.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [FAIL][374] ([Intel XE#1178]) -> [SKIP][375] ([Intel XE#2341])
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][376] ([Intel XE#2423] / [i915#2575]) -> [FAIL][377] ([Intel XE#1178])
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_content_protection@srm.html
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          [SKIP][378] ([Intel XE#2423]) -> [SKIP][379] ([Intel XE#2321])
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-bmg:          [SKIP][380] ([Intel XE#2423]) -> [SKIP][381] ([Intel XE#2320]) +4 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64:
>     - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][383] ([Intel XE#1033]) +3 other tests dmesg-warn
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-64x64.html
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-64x64.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][384] ([Intel XE#2423] / [i915#2575]) -> [SKIP][385] ([Intel XE#308])
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [SKIP][386] ([Intel XE#2423]) -> [SKIP][387] ([Intel XE#2291])
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          [SKIP][388] ([Intel XE#2423]) -> [SKIP][389] ([Intel XE#2286])
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          [SKIP][390] ([Intel XE#2136]) -> [SKIP][391] ([Intel XE#1508])
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          [SKIP][392] ([Intel XE#2136]) -> [SKIP][393] ([Intel XE#2244]) +2 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#4156])
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][396] ([Intel XE#2136]) -> [SKIP][397] ([Intel XE#776]) +1 other test skip
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][398] ([Intel XE#2423] / [i915#2575]) -> [SKIP][399] ([Intel XE#1138])
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][400] ([Intel XE#2423] / [i915#2575]) -> [SKIP][401] ([Intel XE#1137])
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-bmg:          [SKIP][402] ([Intel XE#2316]) -> [DMESG-WARN][403] ([Intel XE#4172])
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [DMESG-WARN][404] ([Intel XE#4172]) -> [FAIL][405] ([Intel XE#2882])
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [SKIP][406] ([Intel XE#2423]) -> [SKIP][407] ([Intel XE#2316]) +5 other tests skip
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [SKIP][408] ([Intel XE#2423] / [i915#2575]) -> [FAIL][409] ([Intel XE#301])
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [SKIP][410] ([Intel XE#2423]) -> [DMESG-WARN][411] ([Intel XE#4172]) +8 other tests dmesg-warn
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][412] ([Intel XE#2423]) -> [FAIL][413] ([Intel XE#3321])
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [SKIP][414] ([Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][415] ([Intel XE#1033])
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][416] ([Intel XE#1033]) -> [INCOMPLETE][417] ([Intel XE#2049] / [Intel XE#2597])
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [SKIP][418] ([Intel XE#2136]) -> [DMESG-WARN][419] ([Intel XE#1033])
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-dg2-set2:     [SKIP][420] ([Intel XE#2136]) -> [SKIP][421] ([Intel XE#455]) +2 other tests skip
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          [SKIP][422] ([Intel XE#2136]) -> [SKIP][423] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          [SKIP][424] ([Intel XE#2136]) -> [SKIP][425] ([Intel XE#2380])
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
>     - shard-bmg:          [SKIP][426] ([Intel XE#2136]) -> [DMESG-WARN][427] ([Intel XE#4172])
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][428] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][429] ([Intel XE#455]) +3 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][430] ([Intel XE#2136]) -> [SKIP][431] ([Intel XE#2311]) +34 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][432] ([Intel XE#2312]) -> [SKIP][433] ([Intel XE#2311]) +10 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][434] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][435] ([Intel XE#651]) +13 other tests skip
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][436] ([Intel XE#2136]) -> [SKIP][437] ([Intel XE#4141]) +13 other tests skip
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][438] ([Intel XE#2312]) -> [SKIP][439] ([Intel XE#4141]) +5 other tests skip
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][440] ([Intel XE#4141]) -> [SKIP][441] ([Intel XE#2312]) +2 other tests skip
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     [ABORT][442] ([Intel XE#1033] / [Intel XE#2625]) -> [ABORT][443] ([Intel XE#2625])
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][444] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][445] ([Intel XE#658])
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][446] ([Intel XE#2136]) -> [SKIP][447] ([Intel XE#651]) +25 other tests skip
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][448] ([Intel XE#2311]) -> [SKIP][449] ([Intel XE#2312]) +6 other tests skip
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][450] ([Intel XE#2136]) -> [SKIP][451] ([Intel XE#2313]) +34 other tests skip
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][452] ([Intel XE#2312]) -> [SKIP][453] ([Intel XE#2313]) +9 other tests skip
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-dg2-set2:     [SKIP][454] ([Intel XE#2136]) -> [SKIP][455] ([Intel XE#653]) +29 other tests skip
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          [SKIP][456] ([Intel XE#2136]) -> [SKIP][457] ([Intel XE#2352])
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][458] ([Intel XE#2313]) -> [SKIP][459] ([Intel XE#2312]) +8 other tests skip
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][460] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][461] ([Intel XE#653]) +11 other tests skip
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][462] ([Intel XE#2136]) -> [SKIP][463] ([Intel XE#2312]) +10 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][464] ([Intel XE#2423] / [i915#2575]) -> [SKIP][465] ([Intel XE#605])
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][466] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][467] ([Intel XE#3544])
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][468] ([Intel XE#1033]) -> [ABORT][469] ([Intel XE#2625])
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136]) -> [SKIP][471] ([Intel XE#346]) +1 other test skip
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [SKIP][472] ([Intel XE#2136]) -> [SKIP][473] ([Intel XE#3012])
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][474] ([Intel XE#2136]) -> [SKIP][475] ([Intel XE#2927]) +1 other test skip
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
>     - shard-dg2-set2:     [SKIP][476] ([Intel XE#2136]) -> [SKIP][477] ([Intel XE#2927])
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          [SKIP][478] ([Intel XE#2423]) -> [SKIP][479] ([Intel XE#2501])
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][480] ([Intel XE#2423] / [i915#2575]) -> [SKIP][481] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>     - shard-bmg:          [SKIP][482] ([Intel XE#2423]) -> [SKIP][483] ([Intel XE#2763]) +2 other tests skip
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][484] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][485] ([Intel XE#1033] / [Intel XE#2566])
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][486] ([Intel XE#2136]) -> [SKIP][487] ([Intel XE#870])
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          [SKIP][488] ([Intel XE#2136]) -> [SKIP][489] ([Intel XE#2391])
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          [SKIP][490] ([Intel XE#2136]) -> [SKIP][491] ([Intel XE#2392])
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          [SKIP][492] ([Intel XE#2136]) -> [SKIP][493] ([Intel XE#3309])
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][494] ([Intel XE#2136]) -> [SKIP][495] ([Intel XE#908])
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][496] ([Intel XE#2136]) -> [SKIP][497] ([Intel XE#2499])
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          [SKIP][498] ([Intel XE#2446]) -> [SKIP][499] ([Intel XE#1439] / [Intel XE#836])
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [SKIP][500] ([Intel XE#2446]) -> [DMESG-WARN][501] ([Intel XE#1033] / [Intel XE#2042])
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][502] ([Intel XE#2136]) -> [SKIP][503] ([Intel XE#1489]) +11 other tests skip
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][504] ([Intel XE#2136]) -> [SKIP][505] ([Intel XE#1489]) +12 other tests skip
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          [SKIP][506] ([Intel XE#2136]) -> [SKIP][507] ([Intel XE#2387])
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][508] ([Intel XE#2136]) -> [SKIP][509] ([Intel XE#1122]) +2 other tests skip
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-cursor-blt:
>     - shard-bmg:          [SKIP][510] ([Intel XE#2136]) -> [SKIP][511] ([Intel XE#2234] / [Intel XE#2850]) +19 other tests skip
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][512] ([Intel XE#2136]) -> [SKIP][513] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][514] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][515] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@psr-dpms.html
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][516] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][517] ([Intel XE#2939])
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][518] ([Intel XE#2423]) -> [SKIP][519] ([Intel XE#2330])
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][520] ([Intel XE#2423] / [i915#2575]) -> [SKIP][521] ([Intel XE#3414]) +3 other tests skip
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          [SKIP][522] ([Intel XE#2423]) -> [SKIP][523] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          [SKIP][524] ([Intel XE#2423]) -> [SKIP][525] ([Intel XE#2413])
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][526] ([Intel XE#2423]) -> [SKIP][527] ([Intel XE#2426])
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][528] ([Intel XE#2423] / [i915#2575]) -> [SKIP][529] ([Intel XE#362])
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][530] ([Intel XE#2423] / [i915#2575]) -> [SKIP][531] ([Intel XE#2168])
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-bmg:          [SKIP][532] ([Intel XE#2423]) -> [SKIP][533] ([Intel XE#1499])
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_vrr@flip-dpms.html
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][534] ([Intel XE#2423] / [i915#2575]) -> [SKIP][535] ([Intel XE#455]) +8 other tests skip
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@flipline.html
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-bmg:          [SKIP][536] ([Intel XE#2423]) -> [SKIP][537] ([Intel XE#756])
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][538] ([Intel XE#2423] / [i915#2575]) -> [SKIP][539] ([Intel XE#756]) +1 other test skip
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-bmg:          [SKIP][540] ([Intel XE#2423]) -> [SKIP][541] ([Intel XE#1091] / [Intel XE#2849])
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][542] ([Intel XE#1130]) -> [SKIP][543] ([Intel XE#1280] / [Intel XE#455])
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][544] ([Intel XE#1130]) -> [SKIP][545] ([Intel XE#1126]) +2 other tests skip
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     [SKIP][546] ([Intel XE#1130]) -> [SKIP][547] ([Intel XE#2905]) +16 other tests skip
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_eudebug@basic-close.html
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>     - shard-bmg:          [SKIP][548] ([Intel XE#1130]) -> [SKIP][549] ([Intel XE#3889])
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-5/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          [SKIP][550] ([Intel XE#1130]) -> [SKIP][551] ([Intel XE#2905]) +11 other tests skip
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
>     - shard-bmg:          [SKIP][552] ([Intel XE#1130]) -> [DMESG-WARN][553] ([Intel XE#4172]) +2 other tests dmesg-warn
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
>    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-dg2-set2:     [SKIP][554] ([Intel XE#1130]) -> [SKIP][555] ([Intel XE#1392])
>    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
>    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          [SKIP][556] ([Intel XE#1130]) -> [SKIP][557] ([Intel XE#2322]) +12 other tests skip
>    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][558] ([Intel XE#1130]) -> [SKIP][559] ([Intel XE#288]) +35 other tests skip
>    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][560] ([Intel XE#1130]) -> [DMESG-WARN][561] ([Intel XE#1033]) +2 other tests dmesg-warn
>    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
>    [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-bmg:          [SKIP][562] ([Intel XE#1192]) -> [DMESG-WARN][563] ([Intel XE#4172])
>    [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
>    [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          [SKIP][564] ([Intel XE#2833]) -> [SKIP][565] ([Intel XE#1192])
>    [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html
>    [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-bmg:          [FAIL][566] ([Intel XE#1999]) -> [SKIP][567] ([Intel XE#1192])
>    [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html
>    [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][568] ([Intel XE#1130]) -> [SKIP][569] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
>    [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][570] ([Intel XE#1130]) -> [SKIP][571] ([Intel XE#977])
>    [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
>    [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][572] ([Intel XE#1130]) -> [SKIP][573] ([Intel XE#979])
>    [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
>    [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [FAIL][574] ([Intel XE#1173]) -> [SKIP][575] ([Intel XE#1061])
>    [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_peer2peer@write.html
>    [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-432/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][576] ([Intel XE#1130]) -> [SKIP][577] ([Intel XE#2284] / [Intel XE#366])
>    [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
>    [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          [SKIP][578] ([Intel XE#1130]) -> [SKIP][579] ([Intel XE#2284]) +1 other test skip
>    [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
>    [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-bmg:          [SKIP][580] ([Intel XE#1130]) -> [DMESG-WARN][581] ([Intel XE#4172] / [Intel XE#569]) +1 other test dmesg-warn
>    [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html
>    [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-8/igt@xe_pm@s3-d3hot-basic-exec.html
>     - shard-dg2-set2:     [SKIP][582] ([Intel XE#1130]) -> [DMESG-WARN][583] ([Intel XE#1033] / [Intel XE#569])
>    [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html
>    [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][584] ([Intel XE#1130]) -> [SKIP][585] ([Intel XE#944]) +4 other tests skip
>    [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          [SKIP][586] ([Intel XE#1130]) -> [SKIP][587] ([Intel XE#944]) +3 other tests skip
>    [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-bmg-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     [SKIP][588] ([Intel XE#1130]) -> [SKIP][589] ([Intel XE#3342]) +1 other test skip
>    [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
>    [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [SKIP][590] ([Intel XE#1130]) -> [ABORT][591] ([Intel XE#3075] / [Intel XE#3084])
>    [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
>    [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
>   [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8214 -> IGT_8215
>   * Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -> xe-pw-143608v3
> 
>   IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8215: 4baeb7397d7139c273b0861e11d96cee27236838 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b
>   xe-pw-143608v3: 143608v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143608v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
