Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219DFC87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 14:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81010E956;
	Fri,  8 Aug 2025 14:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/Y+AWSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C39410E956
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754664549; x=1786200549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KrYbGIDi/mLCiXZvZpmJctZtBRlDFspkiWbuFC66ZNw=;
 b=I/Y+AWSWsZQ64C+lN8xC8Fa7mEdlQucptV0ehivLxf1XeyvcipRkOvUR
 hiClMwljjYIO+/rDLz3eUi4JVmNvVzmGj+Qssqq7pJoOvrsy5oPRaEEU+
 WaFiVESfcZx1bHGdmpNmgNDU6Gy1vS+qNK9XfjgdOdIGtus9CkjQnKpJz
 Sbmjv0tikf/89629SS1CwHhimeUZm6U1ZtPstfpkoYD0acI7Y7CA09s3k
 hWEm//N+yKo0KswdIeXGenzZSmKwBANrUxHvXHbVRv1GCtqLfMu4x5t9o
 k7jermoeznx3g9m1DKROAJq3dxD7/yUXysihhWY7VGmmHx/+jqKGjblPk w==;
X-CSE-ConnectionGUID: 6bWYXYu7SaGpqrXsVu9M7Q==
X-CSE-MsgGUID: wJ1xRFscRnKJ5Rl3PvskCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="82454452"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="82454452"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:49:09 -0700
X-CSE-ConnectionGUID: v1AyeuoVQtG3l0RQYha0YA==
X-CSE-MsgGUID: 5gR9OVqvS4ec6dOjg05qxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="189028010"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:49:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:49:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:49:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcvf1oc0FvmOqFwlR9OGc2sygmXc0bZek5oNbNQSCWzRlteUI+56ZSUqBqZegcIx3oxdsIVaf1wYWWGSXUn7jrMv1SZarU60fOCQlnnDYiz84BCKpZDb7MJRKZb6/0l9HKibdi6coBcseDegBP9Hs786PkIK6/ftUG1TWwlUL+bveR7vwDb0BHOJCx96apIrCmOSx/Tddt9g42QZFHf4VYuxojGuMi/TpNCxvlUMv6H2RKhtZfD+JcDCaUWD1NaNQ15VvuKpYTCSwCGI0VC/SU7yWPu4UCG4YWBzDbdvB5NUXz2NKn4/+sv2AH+rH+NdcR4m5RMFDdW8jczwx3t0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QaWLgHTVgomLZPCmaUhjfyWnD9AbVnEcdzSgN0AnuY=;
 b=PKkO+SColr6DUl+I9D8W6WWbDT1bS892GoQz3NR7daJAlE6XJ9ZwZYHAbHwSBqErVc8GVQXdmGa+YR+cAVaUwRD/4syoUX3W6VRxZt0afk7pq2T/g3tc593u41gXwolpe2lqWvokKgJ25V09IF0zedmoeM64hJwXfjNUJzzxO2K3JUdXAcThLBLppCagRjIG0IjoCuH6Ihg4CW+lpXBDjm22M2LxXxjrHzeZPkMohG58iRlKps8yb1/QLCalRkrGMbuHaYb6Zqig42jaLaYHcgT/20k6YmSHq6fRMYbByDjGXCcWLotL478bOULxIqqTFixuinycnuPT43kqeVvKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 14:49:06 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:49:06 +0000
Date: Fri, 8 Aug 2025 10:49:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Update function names for GT specific
 workarounds
Message-ID: <aJYOX55NXAHg1vfP@intel.com>
References: <20250807214224.32728-1-matthew.s.atwood@intel.com>
 <20250807214224.32728-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807214224.32728-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: eda438fb-ff33-41af-d006-08ddd68ab955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v5urydSBNM+yd59XQV9XVsMNrBa4CggXF749G7cg4fFFzGsTjyid4UgjPCV2?=
 =?us-ascii?Q?vRcBof1YOuVDo13ek3U9aqfrGUnclZzRB0l4mYElZxN7i9jRMoB1Zbt+01Q+?=
 =?us-ascii?Q?smy+qSaGiGveIQW3mWgXV0kBC5XQDg+g8mqcJZMy0zSwyFK6G1HSrGqv2aBA?=
 =?us-ascii?Q?yLpfwZpH/+pbusq+vRKIpJULPN502Pe4xKgv64TRrx0OQEXpMtwRjAc2nwUW?=
 =?us-ascii?Q?YATXBYyRpyRyjapEK96rMWZKJyS5ZTTxgK4z+8bFXITu4GruuPUnjSRNDKnz?=
 =?us-ascii?Q?oOfzWndj54TCpgXn05qmHySffIUaXitxCkukRKmDGsC/96vUTgvTtjMUZQ6i?=
 =?us-ascii?Q?rlQ8VJpmY7lCbFu1YtSxEXjhUDlNhnTAafFw9K42XIBMVlYUS8I1pXi5qQg2?=
 =?us-ascii?Q?8EgsUWebRyWIbm2983JiwsJlQtYC2qVFm5YfSGoBMCzyzSsRcKlabsn/Gnge?=
 =?us-ascii?Q?wGtiJ3krRNmjSHcfN6HKtcgMBow7hTt6cMw7twKKqQuSMUZ4QOpYWYuotoGb?=
 =?us-ascii?Q?OFFumnaP7Xo0mQQzLo9yKiAugGww+uEIAyKz204j094+E5sARyXfmIy1xAIL?=
 =?us-ascii?Q?pVqnDzJ2pQcqSOInayQUu+zYAef8xM2yUprlrLxXFoH1mY7tITL6wpfqPobY?=
 =?us-ascii?Q?By3xlFigANa4aJ447LvaycW1+QqnrPGseUjTIerX/yq8iW20WPWsY9aUXVlV?=
 =?us-ascii?Q?o8XSqJlsolIWL/jEKX84VlfTrpL2QIaDAgw5LORtEwjw7RFXzj/ydDgBH6tl?=
 =?us-ascii?Q?Sim6vy7j6WWsRai2fBrEaOelB/m5Sp/AE3fBLsIQOeqViOvPL//CJja4vjEW?=
 =?us-ascii?Q?C2Ej11HGxd1SIDCkRQTc7W1eTJbw+6J76Jyg+lt+12Ejuv3Cb+6jJWUf0lia?=
 =?us-ascii?Q?4xcHJnQq5YEbR2EQgfQU//VyS9UWCMbJctUa008xPNiV8CjMmwoaOF0rTRAg?=
 =?us-ascii?Q?OZyKBvUijhl4wA6Pvfvt834hVVrgfREdb3xX7MdP3h6x3kIhCXVuzPwEmHpi?=
 =?us-ascii?Q?DtkmuGItd4ZQwtBVbssZ4beHVtUAFySJwoLJT4SZ304E5B/ZaVq8QJsNqfll?=
 =?us-ascii?Q?nvB/QmVu0QrqkJRatCA/e+u7GxID00dDngtAnA3GVjk+8cfer8c+ZUtOS8Ed?=
 =?us-ascii?Q?lMRT8URj9XdHaElMCpAT6wHlScf195YNuBhTa7Su4/P+CU6GD1o4gSG04Oyq?=
 =?us-ascii?Q?svfCi/czuB/ylZ8eOUtmYp9ZrRoUhvfoWkTmsE4wEG6APYHaE62279OIsjJ6?=
 =?us-ascii?Q?aZByQisbEPz09+mWlFh0Pizocy8nEsZ6Mhri+uyja+U7tuUYWbrkLuLaCW68?=
 =?us-ascii?Q?wGRyk/XwBJ/WGaCD6DAI1Gm1NPSqF9Zx/ILEuqfYMm1q4LsPckZ+m4pso5sW?=
 =?us-ascii?Q?WFEmEjWdjpniWPQLpktIqYZmBEjvMjqausT4O2VEng+bZv+Z4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fFa8MmOn/eY6yOb63IBEvlRHyH0amDYydNeRyDZTUiK4D6gyxt2ZDrN31q6W?=
 =?us-ascii?Q?zrHgLoTILadtpPLPgWwzfXpCQkp7LANKSXYVsQvO9AC4NJoVJR1vcFA6cFrV?=
 =?us-ascii?Q?fI/o2RD83AY/XZQwhA1on+xBcl9bRcJNTXb0/Y7+r7i6lIuKocwue3Bre2Hn?=
 =?us-ascii?Q?eFwz8nX5lq564Wzf9wZmX6YNz5WTUn1O7nmLUE1go9lnC96s66YndTOaVjX3?=
 =?us-ascii?Q?s+fCCRN5akkJsYADH/12rC7kbeG/9G3yaRpD5mE5re/ZanC/bf2K+pX05LdT?=
 =?us-ascii?Q?CwiA+Ydkd7DklIDC9NMaZY9NG+ELW0VR016cvlEYdVbDWHxf3R0sXqTZqAWp?=
 =?us-ascii?Q?LyrFmzYVhf97kOnGjUeZvm+bTLLrfPxwLXKd6ENK57QN1MH0PLL4refXbLjR?=
 =?us-ascii?Q?8gqDbFUkcBitXpJuFEk8IxdNECvfiyfMcF2yaG33OUK/042BPxjJ8XeLLTlZ?=
 =?us-ascii?Q?pR7eOU743N5JU0vcXcAMW1CWQwwgcNTD+BYWX9L+fxJmoffxNTSQgfUlBhoT?=
 =?us-ascii?Q?STlZ6aJLKd9aMRyyL1l8dU5AHnG4WGKrZ+6tPC44xuETs077De91fb/uacyh?=
 =?us-ascii?Q?wvOJEFNMPrvBbJ2FAIhNHptjNV0TISsBDA8dj+k2Acz0VTx6+RTUKeb7goNb?=
 =?us-ascii?Q?Zt4OaT4934yNC3/PBozPPTaJL4FgDY71EP7SJ7lYVwOG2EKLJLr4x9AMPn5g?=
 =?us-ascii?Q?PfobQJFuciCi6jmEquK3JpBUEDaNUnIOSqIWQtBZMtzc9FVZxs7moQKxAUud?=
 =?us-ascii?Q?32eL0DI3wAclv0xEmImaMMoT6NbiW+soSAmAx0qOXiaNtiLEX816POJUMPZz?=
 =?us-ascii?Q?JNayoP4Dl1ZplusiWoK71Xv/07LWRlxlTPySxFVl1mHcbYjAtVMv2waM4b47?=
 =?us-ascii?Q?gR4TrYq4TmJRU57kdZn+/jBgleYDyYoxCHD0XWTPYinT+crBkIv+Xbj+FV0h?=
 =?us-ascii?Q?PedrcN1ib1CP6TjqJUv/9llDponTYnoSLDKlrY74VF8HN6fQKdOI0FBpOIPK?=
 =?us-ascii?Q?kUmx7Yk1QdKQQefJV458HIMb6qKf7GRoTMHNWEsJgfuNF3SoUtJ0jDgkgqB7?=
 =?us-ascii?Q?qVrSQJUZqhS7w1xeBTmsn7z22It8yNmID2vgssI56XpqMb2EayeVcwonzoRx?=
 =?us-ascii?Q?HDZoH3vDCtDrSdGpHcEYMzDJhicOumRxzu9mUX31dGEF76ls5pgYCTzcomGW?=
 =?us-ascii?Q?O11SBV+6j4Ih117z5osaz0G1zhqofM8OnXRU9o3V52D/Z8czlrI5EWwjQrsP?=
 =?us-ascii?Q?ON0S1BDujCyoXE6guWl2W74fw3nnToout90S31br0OGm4XrJkoJ7foY1P4Le?=
 =?us-ascii?Q?tWvepNCpw3UkxrCV5b96kGBd1nOEEoA0hmt9YHDMwB8KyIkc+W3HS93nmEWK?=
 =?us-ascii?Q?kJsrqtwqdsU0BANMpZpb+4k29aVuS6KFt8pmdmNmG2+pXl5wPCURZSTlM05j?=
 =?us-ascii?Q?8k80jX+hBBEyxk2htJVmhR4uRcs6XyLkn0tREs36tx1C3s+XY0yyFsCToVdp?=
 =?us-ascii?Q?FsTJyycvYMpvUEHcc8B0jvOlyruYhDlJkiK7U9KrWk+CDH9d1D6g4t3AINsB?=
 =?us-ascii?Q?mAgoZQMPVIwPp1JG7AnZLBgT9dWyEbxyBvu6ZyLQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eda438fb-ff33-41af-d006-08ddd68ab955
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:49:06.1906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUusGVblCsBzPriz3N2Ge9RXbLI5wIotZddmnBGuWwjQQOXtOQ6Ml6Pv5m1fjcODJQ88rHX6vhFIlscg6CfIDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Thu, Aug 07, 2025 at 02:42:24PM -0700, Matt Atwood wrote:
> Now that there distinctly different OOB functions, update the names to
> reflect the IPs they interact with.
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing soon to drm-xe-next

> ---
>  drivers/gpu/drm/xe/xe_gt.c |  4 ++--
>  drivers/gpu/drm/xe/xe_wa.c | 10 +++++-----
>  drivers/gpu/drm/xe/xe_wa.h |  4 ++--
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 43f2da27d9d9..a3397f04abcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -400,7 +400,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>  
> -	err = xe_wa_init(gt);
> +	err = xe_wa_gt_init(gt);
>  	if (err)
>  		return err;
>  
> @@ -408,7 +408,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	xe_wa_process_oob(gt);
> +	xe_wa_process_gt_oob(gt);
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  	spin_lock_init(&gt->global_invl_lock);
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 0fc73af1bb4c..52c7df4c3afd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -916,13 +916,13 @@ void xe_wa_process_device_oob(struct xe_device *xe)
>  }
>  
>  /**
> - * xe_wa_process_oob - process OOB workaround table
> + * xe_wa_process_gt_oob - process GT OOB workaround table
>   * @gt: GT instance to process workarounds for
>   *
>   * Process OOB workaround table for this platform, marking in @gt the
>   * workarounds that are active.
>   */
> -void xe_wa_process_oob(struct xe_gt *gt)
> +void xe_wa_process_gt_oob(struct xe_gt *gt)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>  
> @@ -1006,12 +1006,12 @@ int xe_wa_device_init(struct xe_device *xe)
>  }
>  
>  /**
> - * xe_wa_init - initialize gt with workaround bookkeeping
> + * xe_wa_gt_init - initialize gt with workaround bookkeeping
>   * @gt: GT instance to initialize
>   *
>   * Returns 0 for success, negative error code otherwise.
>   */
> -int xe_wa_init(struct xe_gt *gt)
> +int xe_wa_gt_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> @@ -1037,7 +1037,7 @@ int xe_wa_init(struct xe_gt *gt)
>  
>  	return 0;
>  }
> -ALLOW_ERROR_INJECTION(xe_wa_init, ERRNO); /* See xe_pci_probe() */
> +ALLOW_ERROR_INJECTION(xe_wa_gt_init, ERRNO); /* See xe_pci_probe() */
>  
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 105497c1d7d7..6a869b2de643 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -14,9 +14,9 @@ struct xe_hw_engine;
>  struct xe_tile;
>  
>  int xe_wa_device_init(struct xe_device *xe);
> -int xe_wa_init(struct xe_gt *gt);
> +int xe_wa_gt_init(struct xe_gt *gt);
>  void xe_wa_process_device_oob(struct xe_device *xe);
> -void xe_wa_process_oob(struct xe_gt *gt);
> +void xe_wa_process_gt_oob(struct xe_gt *gt);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> -- 
> 2.49.0
> 
