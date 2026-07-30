Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B95FC55167
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 22:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA20010F0D0;
	Thu, 30 Jul 2026 22:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxu4buF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1A710F0D0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785450628; x=1816986628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7PU8BRhEy1/UiIv+smLRGHhktg0cj8KGtGIR7Lrt/rM=;
 b=nxu4buF7mHsj5iGbH5kz5MvTmF3U9Pi+uI3ISZHir2j6JyrXAdxQN6by
 s6r4MmdNq7XBROoVcvCh/+6UMP5UchiLC9WDpMv7YbvZCWYZk83Xik5I6
 Z8+l4TzLz8T2jk3I2leRtevEMX4Gq7/1WzJabdHAVqiFPR8sbGt6v/qa7
 qnL52OYK0PFKZMZEC5PzvnGxbMAngRl/G8j8XGTicp9I9QrvGU0+DQPj6
 LBSP+pV3lgczzm1zncLTLbIfRx3UBAPB+S2IztfzJkRibaW1HRnBZ3eRp
 ykK6eCTubOBT4KRL9ET71Fp4cqxGUZY8XArBFEOV41X71YdZQXYqz6SA8 g==;
X-CSE-ConnectionGUID: 5onuRJcfQZWQWRfaOMtbDg==
X-CSE-MsgGUID: 0o+Pul8gTyiVwg1+Ef2UTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96740536"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="96740536"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 15:30:27 -0700
X-CSE-ConnectionGUID: nd3t46kXQdexWlJLbe9gjw==
X-CSE-MsgGUID: VIshYzoVTF+XOzyereOplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="259181029"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 15:30:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:30:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 15:30:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 15:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVcp4jur/fHFcVGoKj4GHTljPE5uaSZnQPtH5mofK3HDb2s/ahWdz1TzQ593VPY/by/aumeuNPXRABuOytlvQo8arzVGcgYC87djZ+PKVfJqBKuOz23+ix4YirryjrBP/XsRZrqZrUSl3hB4qBxXC6hSYpksGEaBgaWGYml+QQHE9hLA45FrMISAf2GHd+5+jLKMAlshZuwgYfM0zfnR1S0x48hPOoliGwzaR/DhYy0hHymcZ/1Gw4ke0hQA2nk8ApkAxA+w3/OvW//CJ5fDuPeCZ9rHP/6qBfGInV1U5bCnvK9jBqb79/xH73BPpGekT3P+qVYTeegvRpcbRL65+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHrCHsHPVxSnDslz3KixTxuT3qLkQ5NUwwJ7CAmjwG4=;
 b=sgE2IFsrroZFVt8TWR0Lc76xMU/qRgwC596GLTur32w/lpXotlpWtJvqVq9vduDvq5U6wqyM+ofk8DLu58qFFZpdKkfdpTWe8+KWhiZECSrYWUfuT76R9jgF4WWDsaSOgn4IohLlVPGLdkREv+MugsdOx8dD/INaYM1Av85uUqadPEJSU18yeJ8t1+4eKapucZLfHHsMCnNVDLnLd+PfMX64Bd/8Cs9+YM0AFZY2McTCXtyJ+ZW/l6NdWg5g4vcTDPbmUxgR6XPuKGLTJNCvmQ077ASvAgshmUIBAVuKmdbPErDeoRWfPsFQtJGU/h10BintnnOvPnlziXJl3XVcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 22:30:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 22:30:17 +0000
Date: Thu, 30 Jul 2026 15:30:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for
 first media slice
Message-ID: <20260730223015.GC8279@mdroper-desk1.amr.corp.intel.com>
References: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
 <20260729230645.3052178-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260729230645.3052178-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 155a7ddf-2234-44b4-cf71-08deee8a21b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hbqDXRvedNXf/bADlpmGt39l/L98q66IoEdoTh9aUOLW0Y2dHfA/D1twM3/vEpGIiHppVGGuBj8YaRe08ReazKOI8xGYub+QFgJlty0ejuBxxuQPFvqQM0v1rOerzcKW3HwaK0zgG+S5/wSET6tj8DyC02gtPSw89hYnkoOGFYE8bOG2K8Wd9Z8U8SMg2riXZ2OgQZo2kpZANxlKi3lFF3mV5y3Bh6hdebQpKrk7dqMIMgJOWSHIpH6ONctMP0I6DM11rFdFT7aFrtHLffvHZJzCKzXEmtnvmRHUxlgiaXkRcDTywFSJFs7emVk10dKlcvB0Mex9IfGPPmFkqFhO2TNpI2TbF24c9/PUaZv6sVGj/Y1OgoO/vP7r00YmJMacI0OQ6t7WRgdnOiaYBWpPFSglfkedIQU+pCm+XfzcCdYFlXiJriT3qyCzaumEaS+ZfAkatC6DTld3OVKxWVNPU0J2SRXhcgQVUXClsHndC9i+LBDhpRZxCOjSa5EfSEhpg7hmFQpTxn6XTD8zyuDNmOWmYNoIrkxHFRt/3yglv7wYX7dO8j1bgK0e+ilUuZi0lR/nCz8O1k9sJ1hAtukr+U1W13T3gUdjNmnq1Q+X/xVtQn4jrI016s3lJ52Aqp5Goi8MMgsvp5/otIC7dHcaIdD++aX2c39n8lV6NBFGDaQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F99dhHKicenLvQxiKd8ZvSCkAdtxOdswFGIGubfj+QdvJ94zWWOwAlhUqzbV?=
 =?us-ascii?Q?mp3g2cLi5RdKxtl3o2IZEgnH7MzxCt5kmA3FEpatkHUcIHTYzoI3T+Y5h5/V?=
 =?us-ascii?Q?WF6fniyRoX7DlS2w2/7d6TLfew28qlC0XcCRZaB6R5HfarAYTKYE6zQDv7le?=
 =?us-ascii?Q?+HcPuBNj5qgB8gZ6IGsva9wE6EDH/2Pgvjdu32lgJWNK0TMZje3nFoLFgB1M?=
 =?us-ascii?Q?c9hzTaNpOuttQ9PKX6b6KLtDh2qfZYX0GwWSfXEMIGJJzfF7M66HG3n/DeXU?=
 =?us-ascii?Q?FgX0YYsH+Gl5Wd20jJUWDI9Ul1daf+EgNRynB+UzDNUYPOqK0IcQGyRrrmM5?=
 =?us-ascii?Q?Lw3EMzOYjhjIj4Syor+Veu+7fBfKw5TJbJogB04fVBHtYQJdK/X3ekVmE14q?=
 =?us-ascii?Q?tnn1OB+51cusOV6JJgBpc7q76/z3hh/DtTnRHuJkSPvJPny/GkElhcavSVtQ?=
 =?us-ascii?Q?XkxaiDv/c/iwgUU+2g5gYn8DfiqoUsiKT7332buQERdHasG2iMa4/sGvR12Y?=
 =?us-ascii?Q?YT9Sh2TnEvSHOdY9Qkr8Y0GatUE+ND5zuPWGjAsa65U4c4uRKxptRNz0jLwu?=
 =?us-ascii?Q?IGRimRN66K+iRq/G6ccCWPpU6I0Zr8ygF2ianADhaHwTVVlWyXX5z/x68jfe?=
 =?us-ascii?Q?gqHLl7tduPwxdEB+YrJIVLf/b+X6DODEdyREPQGCW6RvQVnP6Wf0zUPNv9TQ?=
 =?us-ascii?Q?qNyrs6tT9LWMOL0SY2odVLzKbybdoMwqUX9GWPvpdqaBSggId/CHsPYPb1Hs?=
 =?us-ascii?Q?yf1TSfuQJylt+lGm2L1hcgsyvApWrCPhoCFdB6V5CsUogq/7rhYFUXniSNJa?=
 =?us-ascii?Q?0pt4W1Jlt29D8aiQyR7WH84smfvD6gChhkMKv9DGzcObJMUKtmY2LfN4qUT/?=
 =?us-ascii?Q?PEHyxS57PbAH12XX5Ml0qVbEhi28Bp87xU7lylp7PiWeb5CtJ5th6av5DwJs?=
 =?us-ascii?Q?FTztaItNfmjjRosF+L3xlk+Z/+LyJd2tVQ54keMX+IUSMRpPJlQnp45ZylIV?=
 =?us-ascii?Q?7vg1u+a2UuYX0dEDfIJSFdM+u3w3eKtVm4qzvSPvDrPZjM5dmrxtY1W4bd55?=
 =?us-ascii?Q?ZT73vHEnCYJ+ao1OfH9Tha+srZ56om6w15ohk5U7PtnFiprdaWjypCfKC04C?=
 =?us-ascii?Q?QV2u6Q1b6tSboAXJYNApLQM+wp+dDcxyNRMKHsoy5fiXtqkKHpU65sUvUtPR?=
 =?us-ascii?Q?pxaapqLqjEHnoM2vVNGSy/Ksks873Z2k+Azdl+28iRcgDGuMbsC7EbMtKMIc?=
 =?us-ascii?Q?3vA0zJVPNtxHvOUjRPoGmpX6JbA7GzibGpLtyBqUyItgUqrD/z2tr6P1qYMa?=
 =?us-ascii?Q?hKXsaRA+6pIohJHEleFnL/a3HCuvJURr8zmHyNc9B2PRRSpt5DmvSxYTdbo2?=
 =?us-ascii?Q?MguotOb9D0Ivzqj976TGGByh5RbFEFp7O22db7ovrZr0GOHAwSsZSu2MZFiZ?=
 =?us-ascii?Q?ytDpLCca9ytwxm75R/YwEiBvwY7s4bLNsDU0EdHsRAcNCuP2IVldjebv5pTN?=
 =?us-ascii?Q?skoaEHbB4or9X4DlV/EDR87ggfBb/49kkNOV26Q/cGugjhzJouvuitLzyJIZ?=
 =?us-ascii?Q?iIF7D/24E62SdVLmGLa8XY8DG7jNezBO2DPzzEsxf8hArapUhCXt7A1OiM6T?=
 =?us-ascii?Q?EhsOPyWcAbDS5Cai9jaxE+DCq3NDfnDi0X4JIUQ0nBdnV3W/YEtpUeBPWgTV?=
 =?us-ascii?Q?v+WjqMBY9FvViEpCcRqzwsSjdERVPN/VdIRbgfFWL5dZmSHPoLFZ3tJy1hrD?=
 =?us-ascii?Q?IVFGTWJN0B5Z35g6ItHsR9b2Tz4t/Ko=3D?=
X-Exchange-RoutingPolicyChecked: UxJjahF5iwNZjYC+2SFhK7HeeaH3Di8Km42Ipfo6YOV4vLiJECWk81iHpBe5h6UsNPEj2a8YUaQNG3OPIr8vb/r33NN7ZH6jST3pqowZxqJbjaGv77khcgponAyQ0B5ciavtM4IxNcYHNcQnDtaIu8c3T4k+UNIFC6xV0xEZ9a48P5uS7dQgJE2nVoBeMBHsiqRza7Ap4U9sfahm0TQmahX20l+Ws7g7Rqwgdz47/Sx9svlfJEiOg8SKxA0lNdkdxHWNlqkGguyT7lnA9Dcf5fCFksEhJbWSO83m1Z6gQKK0FEzZEvMsaAKvx1IUBJe2Oe00KJEuOkjZyqJN2pKkiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 155a7ddf-2234-44b4-cf71-08deee8a21b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 22:30:17.4659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaqymntX9stTypjV2qXKZAAelt1Wl9rM3u4I9QjAHsN9UlcfYuzOZhxj81+zWOhPP6Rvt758Vh4zV5W4BsrLQQtNbQ9g/ECQ9ohRvt0eyAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
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

On Wed, Jul 29, 2026 at 04:06:44PM -0700, Ashutosh Dixit wrote:
> vcs1 and vecs1 may also be present on the first media slice, so take
> vcs1/vecs1 also into account when determining if the first media slice is
> absent.
> 
> Bspec: 67103, 77977
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: Bug fix
> v3: Fix for BMG (Matt Roper)
> v4: Add TODO (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a97b236dab7c9..1949bf7d370ac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -443,11 +443,16 @@ static void init_steering_dss(struct xe_gt *gt)
>  
>  static void init_steering_oaddrm(struct xe_gt *gt)
>  {
> +	u64 hwe_mask = XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0;
> +
> +	/* TODO: Add 'VD per SCMI' and 'VE per SCMI' values into 'struct xe_media_desc' */
> +	if (MEDIA_VERx100(gt_to_xe(gt)) >= 3500)
> +		hwe_mask |= XE_HW_ENGINE_VCS1 | XE_HW_ENGINE_VECS1;
>  	/*
>  	 * First instance is only terminated if the entire first media slice
> -	 * is absent (i.e., no VCS0 or VECS0).
> +	 * is absent (i.e., no engines in hwe_mask).
>  	 */
> -	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
> +	if (gt->info.engine_mask & hwe_mask)
>  		gt->steering[OADDRM].group_target = 0;
>  	else
>  		gt->steering[OADDRM].group_target = 1;
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
