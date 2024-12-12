Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D16E77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 14:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AED610EE03;
	Thu, 12 Dec 2024 14:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9zGxNBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6311910EE03
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734014174; x=1765550174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jDwOB9h8ls9uAgvGw1HYlO1WhK7MhCHcE+2Fe47lhIE=;
 b=B9zGxNBjeMYWZe9IbEDwb8p0adEkwNGNLpHVgAMSYgXkM9ghUEdsydvv
 ck0Yw40/Dp6VAYFgW1gLxDcnxUYNHTll/GatztspCnV+iAkZBooc6NcdW
 6jsNIsY5W3z2sLhmgEj76NpveEoUGHY+sfokCMmM3EJIGK1LnrocUDtGN
 OAup0NEIjj6KJP5PAFo5jN0hXlpzgakphkLCFypbInULwcbLxuJsAxG7g
 8WihtskO/ZPoXlYajPwWQO4Ns+qXOF0j71jehkIIyBG39TacZPnF9lS4U
 M6TUScaqqv+ojvUITJxK7pYMZ3kTF9aQ/GmeR+RoTVcDBNgMvMBw8Nlzp g==;
X-CSE-ConnectionGUID: YHO7ueNgS3i8YmYAlNhjKA==
X-CSE-MsgGUID: RZ/4FaOYT1O8iqV7pAjPmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33758696"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="33758696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 06:36:14 -0800
X-CSE-ConnectionGUID: rnZP3QLqSAOep9IfLdyT1w==
X-CSE-MsgGUID: prO9+UduQTObHfZNN2pAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96130219"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 06:36:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 06:36:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 06:36:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 06:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwio2AZB/jbjyyOUq+oHPo4dcmIzMl1fH+py/j2w0hnHOmJXkHqIsl60ySSboVCzsin2263VJ04/7+froT77MG3OYKBC3HSg2tqWWvYAUmJGDFWzzwAhs1bO+dUr/xRb7x31HXgGLMLqa9TkwrYwZeUMHKO+105+ttsygpkTwg1zgh11Abc3Zl4QCFA2iCpLUYAnG32bdQs10SvxobdikYitz6fLXeqs/tsrK1dSfMobR2wBCRTbaGFj93bDUPb4DS1xjdE2gbcR6a9COO6DrTaj2j25OwIUAwmPJYsjAISP6ERDH1uz7e/9zzq7WsNpjtu+hwRl/5MP4empjkkd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIHqpP9vjYdROHcFQiyaEhvew++2niMdps0t1pVmMfE=;
 b=w7LCOu45xSO4EWrM/ONRbWVmKelLO8SJnVzG2zcHT6vCLuFLOnL7Wc0IuQc/44PyTouoAuue8Hjd7IXwY6J5Uq4l4d1JRPuAOfXnSbtXjlAOA5X9HOpzUqxCA9Va1QCcKaC3vBbfh0N70pznjEk+UGJnFmVbvHHR/Hly00I0cA9sUQ8wagbj3IN3IEzpBom1uzlABz+K1+1ShvcRql0cB22M+NXOLSGAlMzyqO6bIs1aa6TFzH3K1iND4YJsaTIX1IXx1RnEUaiwo33qETgUlh0tPirNE4O5lWdnRLKF0p8TGKJvwfRSh9FjPi3knSQ2lIiizKn7XuCLziezM6uAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 14:35:41 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 14:35:41 +0000
Date: Thu, 12 Dec 2024 09:35:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] drm/xe: Make it possible to read instance0 MCR
 registers after xe_gt_mcr_init_early
Message-ID: <Z1r0uUIBK4sNpC0j@intel.com>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-10-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241210083111.230484-10-dev@lankhorst.se>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: bcca859f-d1be-401c-343f-08dd1aba40c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gZ0Ux3l86HcYDobZ/XGXXsAOO1umYfAF7nfsEzj/aCHjCTmr8PcLeFW6uxtv?=
 =?us-ascii?Q?ETDH5/r/QVzGwGqQl2Nttfy3RrCmFXkDKFNLlPGNZHx4f2xrNo9NNkUK8jAa?=
 =?us-ascii?Q?JZBYS91DGl2KhcDD9nGLBh/+y++4AqNXoHGbRkJnf/gsZqoV1Md1nLteLciQ?=
 =?us-ascii?Q?M3IrCPInK0U2Ah0OGx7Ioy4iylWLOEAdj1pMNhZAafpHY0/fZudmjWQwCjH5?=
 =?us-ascii?Q?6YLKctXCz9qv4dhxxXGO812vzxAsITuhvzn3Letqfyn/CBXQhS40TdADZhWX?=
 =?us-ascii?Q?0FI6mYoKmuoARhIlv2dhQ5WUTSw3xsshNmQXPAcY2ZtU0gilE1TkvX5aJxBP?=
 =?us-ascii?Q?HMaYVcWrXUsUNBWQ4w3dPbnoRe0uIv/EEMMWlyBE3W/H9WVmdAclV0dXP0+P?=
 =?us-ascii?Q?4bA7iI7n2eyMjQLkuEal3Y+CpY2rXgTNuBOpABSLjl9ntpl3kQL/2OCAHD7v?=
 =?us-ascii?Q?hHBcRo3AAs0DVBLMsp4l5Fhg0M0FT2KZXrbST9xuwUIQpLpff5SPKl8gteFm?=
 =?us-ascii?Q?KSgVBHBP8ys/5cYtkkxJa8GgYW9nRQyo3w7fYfcrHPxt2L9TRJVqjTYiXpHs?=
 =?us-ascii?Q?z9dwk05y3qem/nrbj3ZzS28RwciTqVDKFQ8wYQD8ZALZ4H+2pzliVxi2W5YM?=
 =?us-ascii?Q?9J4XlT/eXmHlIHaxkQg3TcsH+nNeglW3wQTRB1m9xNe7gVr/eLw/BX3/m9FZ?=
 =?us-ascii?Q?P9eePlxsHjkoR/EIF2q2bEhOv6iX2vNKc9ZHYfoL4NWJA8qdPPBWaMVpL6tI?=
 =?us-ascii?Q?zubsHFfodfBSMU331zgqRJXu2ckmX5kC0k62NdS49GLHra0NG6lONvPeOF+i?=
 =?us-ascii?Q?KokV5D8Vb9iIsKDvMBxCUzeqMNc8xrsxs/0d1ihtmfTc+KmI44isthZqWLdL?=
 =?us-ascii?Q?zzWNuSJmxoi6cggX1G1rXBvlk7FeefsiPZMSWv7TOgh/poc+VuATjfReLwiF?=
 =?us-ascii?Q?ynz/rcWlbV8P6UetyOyI+t4KnFrbfCchalZ4li7D5aeQdvk42pLJSawPpJvA?=
 =?us-ascii?Q?qNKLfiD8teJUwNosI9VYFnbbcoyFCDKLD1TTdV4q/PJsHmmFhryru8QpSgBB?=
 =?us-ascii?Q?bBwobG1jI6yiLmdo28hlJoQIbbbg5HxbdlohwKZhR2lVaHKcbWZMrGxpG6s6?=
 =?us-ascii?Q?IDUsh9y1c7DOoZHEeYjd+kwqVxVs8kbNhnmcad5ghhm6Nyy7i8GJ4qCkyu8Y?=
 =?us-ascii?Q?knT+1xBB3vfzL5lgbNbSVD61Efk4LcwXUy87OpcunGqT8djbalQguRvFQrOM?=
 =?us-ascii?Q?6IaWYO2XWUjZtPvszyP+LjOh6XM9Ux9us0X+qgF2D7HMEu3NKzmRYtwe/p3h?=
 =?us-ascii?Q?6O30N1FyUt+xc9nDcfYTKu4CmgvUUnL5VzBzez0zWsVbtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sv7b29dMM8GCA4HlsWqC92FjKxktG+x5QPGP4Esl/OQbZyBX8DnuANnBBLT8?=
 =?us-ascii?Q?UNQ6DX6q4ZjVwhUaJfZf940KKQPYeiOOWThzFyPm8J3JDXwtpKPqh3YpBL8h?=
 =?us-ascii?Q?CwMmB9RC8RCeWFn3HcP8p/X640xe8y3isBDJ9pbvHBhL7paBdAeeMEhY1FER?=
 =?us-ascii?Q?rL4H7idbAFHJCqfbTzO+qj4cQlxO1oskjvd4oOgK+ZJqBPIgpbe9RwP6vH+G?=
 =?us-ascii?Q?b1DXElOKZ+ljdVA8G6xdlWdCAVRikkO/Ubf2VJbb5GDnDcYwItOk4ga5ijVm?=
 =?us-ascii?Q?MO7GcfYEJ6Kqb6HtzMn8iNrUv+K/8dOPXhO9Qbrxx1/hOiUxSEE4JMckbY8Y?=
 =?us-ascii?Q?67qkJGcSrhRsw/t1Hp4TZxELWwx0Q0T0kEL8+XoBxaty0qPCZf6/J7PB7WhO?=
 =?us-ascii?Q?rfkKJXLjgKXaNHSE0MaHjxA+eJt6At1HH1i2kEafAS9vHTAoePqTtHXRSwDz?=
 =?us-ascii?Q?AqBZz0ET58Wh6xjve2UWBiY1iSDvivVn3sgdagLOMuwo1nD+EJ5okTHgbsp9?=
 =?us-ascii?Q?Bw4YDUCTM43rcsoYy5nvruOqmAUCff4XyFCukNrk+jslaATGpBFQnCc4GDB9?=
 =?us-ascii?Q?8gZm7tHI9TtqQCHcfUTTxqoMWL4YpnF6kywVS0g2nrz0CQP/l0ok85l2qKki?=
 =?us-ascii?Q?1loDiewme10Zc7LtS06lJAfFoOMRX6VV7OwGfxGbvlEouKc3hXX23S4yactL?=
 =?us-ascii?Q?/6qeGK7bqS6JhREnu7OEP7zoh5M6jixcQlpXk/ath1d8Av8tPonQwJHYLpwt?=
 =?us-ascii?Q?aTHh93IHwb7io1F5kcRw8dehK85jJ0jilGqu2BIGOzEztRnvPtBssJnfhMWv?=
 =?us-ascii?Q?37e+Etk5NNoTGe8fe3RASvCy8NBkJU2qNA59BbOyKP57Fv2woEybZZxYyJ0c?=
 =?us-ascii?Q?DFzhLpqKeXzmbvC97uchNYdASVyQnfINvRh814TMNzMPNWAcJ2sMCPU3qHHC?=
 =?us-ascii?Q?XBRKufjIjCCC+3X1gJpTM+cImyxHY6PYCkxgRUEy1C1LpPGIpK7t6z08GikH?=
 =?us-ascii?Q?VW6MEzb1k7aGN/LPqWdmUMoS38bAng82mgJtMnFMP0o+SZl3wPSzr57SWlIu?=
 =?us-ascii?Q?+JCKUcPp4MXvlPY/3NNEAhs+6JdSUKifgTNdaCg8wyar+Te2QAzZWPbWOLOn?=
 =?us-ascii?Q?wfRSF951UhrfAFxRCTDgvJKyg9H34GcaXQkmREWjp+r2qh4Cbdn0zou1Cc2e?=
 =?us-ascii?Q?sl4HgVF5CDqtoTMcHKb8f043PYWsAvYbru7xFAiMnfSmL6KIUQv2YpZcN6mp?=
 =?us-ascii?Q?XsGOtH6F2dU5Alzs2KwgLVzZKQnPLlwLbYGkAI0CZulyJ82W5zz5/HsYe1lt?=
 =?us-ascii?Q?K1nu4b86fenFbNScY2M3XQPVmPBvTGlzYKAQi+a6psBi0uihmFfrqJUtP/Zc?=
 =?us-ascii?Q?qSWZ1oEebnHE8C1MZWIDTZ+WDTUZYjOK/QhbcgobhkW0mk34FN484Dz6DfVQ?=
 =?us-ascii?Q?MlSnkcjusdsWhR+8+adKOjf4hBZGEVhuJh4kOojiLQaOaF/mII/sl2wlCB8n?=
 =?us-ascii?Q?30TQ/jd5W9lL7Fpt1hoy6OUaAoHE6ikVL0Clmg4PveOxnH1dKYEFiube6pBK?=
 =?us-ascii?Q?LdAcuel977zx1BQd0tyEBrbS2YNPzjPDhN2EmK0fHhYnePrlhSCnM2tKDBFy?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcca859f-d1be-401c-343f-08dd1aba40c4
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 14:35:41.1674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkXdrPoz1gB2UpXWWWfrJ6uzQ4cR+ma+aUyO/SAb/iwGgVHtO3CRV2B/zf2k6fFtjfQq6Bx8qgRw802YWSkB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Tue, Dec 10, 2024 at 09:31:09AM +0100, Maarten Lankhorst wrote:
> After mcr_init_early, we need to be able to do VRAM and CCS probing
> without hwconfig probe. Fortunately the relevant registers are all
> instance 0, which fortunately means no dependencies on further initialisation
> is required.
> 

Cc: Matt Roper <matthew.d.roper@intel.com>

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c   | 47 ++++++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
>  2 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 5013d674e17da..4b23c96290046 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -413,12 +413,6 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
>  	gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
>  }
>  
> -static void init_steering_inst0(struct xe_gt *gt)
> -{
> -	gt->steering[INSTANCE0].group_target = 0;	/* unused */
> -	gt->steering[INSTANCE0].instance_target = 0;	/* unused */
> -}
> -
>  static const struct {
>  	const char *name;
>  	void (*init)(struct xe_gt *gt);
> @@ -429,7 +423,7 @@ static const struct {
>  	[DSS] =		{ "DSS",	init_steering_dss },
>  	[OADDRM] =	{ "OADDRM / GPMXMT", init_steering_oaddrm },
>  	[SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
> -	[INSTANCE0] =	{ "INSTANCE 0",	init_steering_inst0 },
> +	[INSTANCE0] =	{ "INSTANCE 0",	NULL },
>  	[IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>  };
>  
> @@ -439,25 +433,17 @@ static const struct {
>   *
>   * Perform early software only initialization of the MCR lock to allow
>   * the synchronization on accessing the STEER_SEMAPHORE register and
> - * use the xe_gt_mcr_multicast_write() function.
> + * use the xe_gt_mcr_multicast_write() function, plus the minimum
> + * safe MCR registers required for VRAM/CCS probing.
>   */
>  void xe_gt_mcr_init_early(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	BUILD_BUG_ON(IMPLICIT_STEERING + 1 != NUM_STEERING_TYPES);
>  	BUILD_BUG_ON(ARRAY_SIZE(xe_steering_types) != NUM_STEERING_TYPES);
>  
>  	spin_lock_init(&gt->mcr_lock);
> -}
> -
> -/**
> - * xe_gt_mcr_init - Normal initialization of the MCR support
> - * @gt: GT structure
> - *
> - * Perform normal initialization of the MCR for all usages.
> - */
> -void xe_gt_mcr_init(struct xe_gt *gt)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (IS_SRIOV_VF(xe))
>  		return;
> @@ -498,10 +484,27 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  		}
>  	}
>  
> +	/* Mark instance 0 as initialised, we need this early for VRAM and CCS probe. */
> +	gt->steering[INSTANCE0].initialised = true;
> +}
> +
> +/**
> + * xe_gt_mcr_init - Normal initialization of the MCR support
> + * @gt: GT structure
> + *
> + * Perform normal initialization of the MCR for all usages.
> + */
> +void xe_gt_mcr_init(struct xe_gt *gt)
> +{
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
>  	/* Select non-terminated steering target for each type */
> -	for (int i = 0; i < NUM_STEERING_TYPES; i++)
> +	for (int i = 0; i < NUM_STEERING_TYPES; i++) {
> +		gt->steering[i].initialised = true;
>  		if (gt->steering[i].ranges && xe_steering_types[i].init)
>  			xe_steering_types[i].init(gt);
> +	}
>  }
>  
>  /**
> @@ -563,6 +566,10 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  
>  		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
>  			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
> +				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialised,
> +					 "Uninitialised usage of MCR register %s/%#x\n",
> +					 xe_steering_types[type].name, reg.addr);
> +
>  				*group = gt->steering[type].group_target;
>  				*instance = gt->steering[type].instance_target;
>  				return true;
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6e66bf0e8b3f7..07c332ff7aa80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -375,6 +375,8 @@ struct xe_gt {
>  		u16 group_target;
>  		/** @steering.instance_target: instance to steer accesses to */
>  		u16 instance_target;
> +		/** @steering.initialised: Whether this steering range is initialised */
> +		bool initialised;
>  	} steering[NUM_STEERING_TYPES];
>  
>  	/**
> -- 
> 2.45.2
> 
