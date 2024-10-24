Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B98AD10380
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 21:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C39810E3B6;
	Thu, 24 Oct 2024 21:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5uDNGMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D14310E3B6
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729804366; x=1761340366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=99MFkAHsfERdmvJd2SJjiUlNzEtrAyHKPLA6zQ1pONI=;
 b=m5uDNGMkeWH5lMn1ZlKW20h0DXn0/l8fP3ZVQEsekI2rFRqwZMEdyYUA
 jLckJAoCTy3D2npPIJ+G9cticTbSa2B7Pc9PXjPP3i6nFKFj2buRW0M7E
 Os0Ir9OitVSqf8KgGhQesF6ApAmtoVPaA2NUQqZsXgVUFC0sJVq/jBO0c
 VQg3kpR2aC7k4MX6vB3L8cIeT0zQlerHKLiVdTZj7sMjX8OYdeAomaxt/
 qwiItqb5JD1Y/EDR0UFeCE1bIg7Lj5bdiywibFPSmvgMUsTOiPWWgulEP
 s9sn1uGSPk2WNBerUP5xD9uOD6RfvmU1vJRqh09ely5LH0yDBl33BeksQ w==;
X-CSE-ConnectionGUID: PwYlgM3hSOqUOibNcHqNDw==
X-CSE-MsgGUID: kzH6oOPlSnalr7MOdQp/qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29678443"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="29678443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 14:12:38 -0700
X-CSE-ConnectionGUID: NQnble1dSWSSkJRWAJEVsA==
X-CSE-MsgGUID: ZocekUPlTSWR9xJEEzfxOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85308720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 14:12:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 14:12:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 14:12:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 14:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBtaUDek/2yhbcZCfkaxdSBb8SQAw1mL3Vhi94DI4JkoTL9yv8g/VeArMSXGTQXON4N3xJBgt799WLLNwIiPG72GyCmSjy2h5Mz6zQRkkpeHpcA3D0vXtmeCeY3AJlDgGxN94uCDDtpzaJRLJeASZu8IV3es9N7qc8OvHiGBZSBMAaLE5HcY1cBRrh41c+vyxGL9cUnKxn0jre08/CZfgYtSACOdUbfY6BgNcdKqS44PtcAbHit2LFIm2lmGwJk5n1KSq224GVgzt7vDkVx71PBv/VKX0JA12spm+TyJeuLX+De+ULOd+PF2o66cL80jkP9mj04hZSbB3VCMkt1VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjMe/kmaDCivbThNxjwxplHjvwsa6A5MiDqGOLmqo6M=;
 b=Z7FSgH7MCOlljiWIxLtcZDfM0ymbY7MAyXh/cnHnAOGfUzgOoPkaflmUBXy8EhKONBnqE7tX7Nh2k9RPvc8zDZnYn5uu3EsIKgWdF/+ldMZHwaA1e7r6LEUoc4jPAOoUhR2XKwIOthEf/ENM6G3PEzzC1aQG+UtYfkGvmAWmjOKltkmTxGheWoVT5633rlTF1oK2xmwGGpmAkSpPlIZEHSIJ6Rd8jNF3exv+Tfar5LOL2vcCvUip01W/EfWJewHRyTKKaDz7jJqZvqwn/c+KpHVQ/cOkpfPT+pKVjmtqGK4KNKBD+EXFjIJhroZa9UIEpBL8UjRj0dtwggEjpnW+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 21:12:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 21:12:32 +0000
Date: Thu, 24 Oct 2024 14:12:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Capture all available bits of GuC
 timestamp
Message-ID: <20241024211229.GN5725@mdroper-desk1.amr.corp.intel.com>
References: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
 <20241024002554.1983101-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241024002554.1983101-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: bedb237f-6915-4b3a-b2e1-08dcf4709316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jrbJ4dxu8JIyNF5TEKSyweB3y+UA4L1MCZ50iaty4HeGsdbZnV1INjjrMy6/?=
 =?us-ascii?Q?6dXimNKTdWSRvczLvU+NdSQQS44H/OFV/X8UTnZAF1xKSYOUncBTbVBkha91?=
 =?us-ascii?Q?Ms48QSJAP4YxedklEIBXteqg32Giww+dhhiwOGMFC+z7ELDcWOwaUcuzTdIE?=
 =?us-ascii?Q?9kskiHR1NBvYsdKoBljni8DRklkyalRmGm1ZQU28AnT8NXKiPIaRufcp/3YO?=
 =?us-ascii?Q?rTggimaLGHGOtrqcQAE8chfYNSZx7J5vNGQxOEsb8m5JKOtDdtuWLyC7U+LH?=
 =?us-ascii?Q?TpfZNAhG/soUgatboZdTBiPHvwu0JxnPjgoktPTFJU9FZvaFbY+ojFTP733b?=
 =?us-ascii?Q?HDMnqfeysIblLAMI3qLFOvEm8UBkAh0OAW2oKUTDBntAj8fGS2Ok1TFUHehW?=
 =?us-ascii?Q?cOEHJcuG/PKEf+UCBArEhoV1HrO8MnFdWTHbaZ+VSXIS7bnqbFL6S0KwEQcI?=
 =?us-ascii?Q?kcCj+IFjjgSlrYCh/9/sl6cVIh4fLymJqyhUx1XWNJ5we7OybNmLZzX/KDH1?=
 =?us-ascii?Q?/RBzICizOiopvMhyiif1IfF/4oJ5/NNYjBFZy186yRJaYu5W13XvPNXbkhhm?=
 =?us-ascii?Q?XMw+xL1jcUhVs7GKVeYF0Ixf80qaVgq3uhJoTqMXH2vEpvFsoQFjkNwynHcV?=
 =?us-ascii?Q?UGzMhofWDoqy3Gc3tZv5YU6xz8FcHYUb+K3owWELfUt+VRgiR2bFeJM35MVi?=
 =?us-ascii?Q?ncw8lHui+Kuy+7LpQZFylKLlUVeh//dE8q5fbkCl/nvVn6rpFPMIjf57+1Jm?=
 =?us-ascii?Q?tT0/65xxPu2KKNzU8fgaJ5/8TrFkVUWtPbsUQpMOcCkxKIK9zFNX3Pm0HX6A?=
 =?us-ascii?Q?SRg37RFdVTTWHhf8q05D+XW1pOZRVL8sERJHfTjJjazu+qShPugt3xBsXRHS?=
 =?us-ascii?Q?lZGKIWI+czPAjV0T34iqAhWMwWDV021npxeRuf0V2YrLeew06uGA6LKqXAml?=
 =?us-ascii?Q?wbXdQDM6psD8bQ5TaRPnfK+b1ifQuwyWYr4XP7Dsl4I3zafWK7foeLHDGKqg?=
 =?us-ascii?Q?PSpmnzCXGJ8n75YTDVxtYieV2WhfZyQMhAoRyggbh++SV0QTogTzf9Fy0OGx?=
 =?us-ascii?Q?Jvb3IcvLnMBzERQJIVjnHi/j58QGdNnS+HJ03oDcBqUINV7OQStG+nFvDM71?=
 =?us-ascii?Q?4bVAP/iRdHpPTAsxAN91Y/Pd8LrBFAbPE53xCD+l25qlgDVLE1qZXjn88p7q?=
 =?us-ascii?Q?gms2SUHCmBqqGZUgVwFvHPbx6YtAreUbwymCbGOD0RKq4H+taY+QSO3fEV4e?=
 =?us-ascii?Q?XhVmCx+guZbkW/KJTINC1B0/eEgJkRpUvllQkb+PybWHCoIlAQM7Cr8l2XV2?=
 =?us-ascii?Q?BlS+4XANlIcGc+wbXM3xkbBc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?erZmz6qEAnUJuxIDVjMNlIWugr3ZhFY/+mql+xR1UquV63Oq13CNz7N1qmRc?=
 =?us-ascii?Q?6gBIfW3OIr7ieS81qS84M1NqleDZCbkssbR/5xAlVhJqhqGxTGOq55fTq3GS?=
 =?us-ascii?Q?tiaujKawW5fi5OUM6NxqIHplwU0g3dEvXqYxYFKZpQy68zZqD+Pp2irUbYdM?=
 =?us-ascii?Q?ig4SMg+aGFYWHXdyx4kBLt2lcE2c9S4jdFbOQLtI3tNMKL0yTwuiCGBW3Kee?=
 =?us-ascii?Q?GVSEaQpdfx4T0m6kGg7aPLK6gPRUnVbUbfTqAYVrdUxQ84kjMfPC3oXc1KC4?=
 =?us-ascii?Q?nt6HKZ3VKULQoOqyUZFeUncHNqJWaAzhbHicE4h6UrXkOEP4lt0FFOygREYX?=
 =?us-ascii?Q?AozUEW6z6eFpla3JwlGAqOYsszfhwpRGKydLXVF/d16d/zTuGY432ilpbKBW?=
 =?us-ascii?Q?xFG9xrX8BwSqgG7/jEOcMJqpb13apPZZM09bgSs8Fm/1WiQW4sBKQ5qNZ7an?=
 =?us-ascii?Q?b+34JWyIxr2hwh7bf4GOo7RPPP752eG39dsHCnEhIjiNi51abNseT2DI82d5?=
 =?us-ascii?Q?8Ycqqaa5Vztnd2TWy/HU/hF8hKh/M+eKKugeZVcNMEsEZbVbvkLNhU05pRJU?=
 =?us-ascii?Q?boU8u+wfItg+x5IZhaCbWWS23e15zCSBsyqhUY8Uay7oFgqtqQaPeO677voi?=
 =?us-ascii?Q?cFpmpcSJ30aVfS2oTGjBrgnJ7HmS61WjzRYVFV7vpZXKuM2JLna6ajJvSCw9?=
 =?us-ascii?Q?0mPc7j3iAVFHUxTmgm0tewuNj3wBZudxZDriJcTPHyyyBs3oPdEaAS2qKVYm?=
 =?us-ascii?Q?/qiq2EFB2vCvb4LA1iKf6b0uD8nQCxjWUT746dvuDX1cqs+1qI/df9Eq/6EC?=
 =?us-ascii?Q?Y0tCiSnKAiYe9Hkg6ONYgeM3dJHYccfrNYS9xvrsb4P7Gxcx4rykpZeuj+fL?=
 =?us-ascii?Q?pHOQ2uc94Kmo0A3jaC6u5mk4jnRtlbqsJbsFEMkmw2Z587Pd0PZJetI4xp0/?=
 =?us-ascii?Q?ZgIgZRb/XiFQaXTMPk2qf5xXqdWJcW5AgQ44BatfuekME7yrWGnoecasdvJQ?=
 =?us-ascii?Q?D74JtsvboV12FjWsULGGN7IqR43GXE04TsnWGiwCmFHNvCvlrVplmcWk63OO?=
 =?us-ascii?Q?yTUQLldOnf5E4IOIwPWWwHFk6LIL2sfyalZQy9DlZtyrZdHLN1BI5VFFrhEA?=
 =?us-ascii?Q?g9rqDiM0bQlwz1p0cWEuCEdQhYGVm+ivIOaGj+1Kcu+GThWx9LLNiqNOqFwM?=
 =?us-ascii?Q?iVn8GocWURRfLspbM9g78Dpi6cslQ/psAc1U4ST24Mi6vB9dCLcdAfnYFoIG?=
 =?us-ascii?Q?S2ePi62n4RjQKpM9D9U89esvcugfcZHq3YqKWfjqxAXgcIdgVqQw8DpFKZuw?=
 =?us-ascii?Q?E6npWdhMi3OEAHVR5lf2u06wPU7aMvqJvop/Q18Q3WBKPB0QQxSy+N3Wo6YZ?=
 =?us-ascii?Q?5MA7iij4sq0eOxlyYFkLKYaN+H9r1bXYS8oy1n76sgu9TZJAdAmJfNHOsYaB?=
 =?us-ascii?Q?xlBOqJ2mv9zAu6dD6B44XiHhJLxbsGa/FwCwLvsLlxsrs5xrDR5Jx97BMJwP?=
 =?us-ascii?Q?9YqNbAGoQYQwnCYo0+cr6Igq2q1zuMwbXFAyi/vciKAI61eg+h8ssdZgvHkK?=
 =?us-ascii?Q?j0bGLCBhwSYpKCvsKPtMlrZBooaC1tdcUvFQfAV+AdTxajpQ+ubBH399lj4g?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bedb237f-6915-4b3a-b2e1-08dcf4709316
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:12:32.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbFryRTwQcBZHIEd1fXLEkJ/fCZPvBM2xcWRgKtkFco6vhtqJOgjF+cOLL2itlP94pI5S5m8s5hgNbaPbRpiiXqPO3CaaATi7EbK35dXh5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

On Wed, Oct 23, 2024 at 05:25:53PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The extra bits are not hugely useful because the GuC log only uses
> 32bit time stamps. But they exist so might as well provide them.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_log.c       | 6 +++---
>  drivers/gpu/drm/xe/xe_guc_log_types.h | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index b27b73680c12..2118f7dec287 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -84,7 +84,8 @@
>  #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>  #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>  #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> -#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
> +#define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
> +#define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)

Do we actually need this change if we're not using _HI directly
anywhere?


Matt

>  
>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index fead96216243..df4cfb698cdb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -171,9 +171,9 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	if (!fw_ref) {
> -		snapshot->stamp = ~0;
> +		snapshot->stamp = ~0ULL;
>  	} else {
> -		snapshot->stamp = xe_mmio_read32(&gt->mmio, GUC_PMTIMESTAMP);
> +		snapshot->stamp = xe_mmio_read64_2x32(&gt->mmio, GUC_PMTIMESTAMP_LO);
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
>  	snapshot->ktime = ktime_get_boottime_ns();
> @@ -205,7 +205,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
>  		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
>  	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
> -	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", snapshot->stamp, snapshot->stamp);
> +	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
>  	remain = snapshot->size;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
> index 4d57f8322efc..b3d5c72ac752 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -27,7 +27,7 @@ struct xe_guc_log_snapshot {
>  	/** @ktime: Kernel time the snapshot was taken */
>  	u64 ktime;
>  	/** @stamp: GuC timestamp at which the snapshot was taken */
> -	u32 stamp;
> +	u64 stamp;
>  	/** @level: GuC log verbosity level */
>  	u32 level;
>  	/** @ver_found: GuC firmware version */
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
