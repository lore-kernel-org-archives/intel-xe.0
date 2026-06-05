Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E1CD6E7D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 16:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851A611A9CE;
	Fri,  5 Jun 2026 16:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D0SZ3Nis";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261BD11A9CE
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780678199; x=1812214199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2oJArWwIuzlJW0XtsOV4wzPZtZyv7GI4MjtKU7+QzPU=;
 b=D0SZ3NisaY7lfqYy4smrwMXI8ppevLZ/sARGIeE3eqSdJZodndhcr9Zg
 yiLb7VUC1NQqdjSzOrlLN7rAAPpZ7LR0lKYQ6Msfq1vFy/rrCqbjPL6FF
 kKtPR8Sk7Sjrc+imPU9jJaJA9NZ/N2TFrKqvcNzcmUO279p0zuIgf8yOz
 M/tqA/u/AHw9KykwG4+PqlO+FVB0/AyV6QnOCbARwbq0ZcOc4Cmis8UGc
 MLIhV7CRr+Zmc+EaDWN06zF3OjYobvJVNwQjy/Yv7d+MUFGHKOJIP70nr
 NrG74RpDQTCmGbNS0qMzBBshuMdhuczLYMEQSGD+k7OTx0BP1yv1xVuH2 w==;
X-CSE-ConnectionGUID: xJO8uniWR+2dv9C6E3yYkA==
X-CSE-MsgGUID: Urp/uJh3S86amAoOLwptPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="98933776"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="98933776"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP; 05 Jun 2026 09:48:56 -0700
X-CSE-ConnectionGUID: 1JFld7ipRkufIafoMNRyVw==
X-CSE-MsgGUID: ARh3FowSSNmFyTN/wnKoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245010534"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 09:48:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 09:48:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 09:48:48 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 09:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kvx8prtRdMGYaC1Sm4AX+X86fHhNou3RAW5D+jTPNODBCDiS5rySDVehezlbHzxgdF9eMeaOZX2Ahe08mg6M/hYk3Z+XZxmRynizowgxzPqW/N6yNC+Eg47YWNMdi358QjYLWqVI/Cunwohv7pbk6cFqkIF8KjTdbD7pviVm3jGGt4cRqOPIYk7wCbsm3sydTvaIUTxsNkOXzS1tM83WFS6oepnq4gaJ3lx8xYVm9A/pOmLJXUMlOuv8KVmtnKAAi8HmpS2nz33K6ljr9o1E7INPafp0qWZqiuXNvaPYN4v5QkKHckh6DM1gnJ18amr8A3Gzpa8NdJCkxM2nMRDw4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5PQy6V6CQqKmlcqt28A1dwA/vA5UvJ2A5wqx+a+3vg=;
 b=mOkW6qb6Q/mritJpazHCPyBeZGp2NQIUVbhjVYUIUY1LHSDDwnUKWh94og3APclp86Z48Kw0RbLGfqgFa7oAsmixGilt3d9mP0RcMI4PCMUDgRv69WMs6StljX5QmDkmu3WMHTG+XwYgeSq+1cJQ7rtV9yM3HrazCbbZPeTxAxy4aRR2HB5AtlDwgo68b6huP6Wjlf91nqElhq+ai0IPTGsvqbmMt97AqDDLsB+xS4BBQrzGRT6Qb1ny/QJX7B1N80GEp3qoAln/7jhshj7LaR3q3wPsCsDMPl9KHxpEFkc/ggs4o41BpDu4tfZ/eS+Wwf9HPJUiDAsr97Nlf+14vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:48:34 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 16:48:34 +0000
Date: Fri, 5 Jun 2026 12:48:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] drm/xe: improve Kconfig.profile help text for scheduler
 timeouts
Message-ID: <aiL93V-6K1Por7H4@intel.com>
References: <20260605140951.958172-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260605140951.958172-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1b0caa-5a10-467e-f233-08dec3224869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0HV7GBCB8a2rwsKj2RVd0s0P1meN9d1Mo61WgpdwEk1438K7x3TxuujK/0leUWuvj1Z9KB9xfb/LZZQ1m4WhfIiBe1c07dvXyF3z8YFEU6dX2TEWeGocapa2736PhSNx3KIANnp0YHJtIHBZW3xiMmcZqqpZCkvdUfZHoHlXbYJcBBRqsCaVXS2MUAdjWuyamKYlywvRD2lEi1ll70/hCfbgGgqkdZjxzRim3yc44mplgOdAVmjn1kxhfsanHxsHkpNU9RBm68ELKFfrm1x9YH1K8sNtu0zieUbXfattQBSHgCwX7Qzv8Zd3UEd/VIoCtC2oJbutbl8+YVTHNVpS19GR6DYkUPKawAqUhiO9ErvSRtxFNUB5TkxWNk3Pggpp6PZ2Joxbef7TLgY+8HWGkihsfT/xoxbEZsGiyy7SMdcfgl5fTWja3dWdzFy5kHqBvnvU4ZwUY89F2xOUEl1HMahox/Z+Gp60FzOxKMqExKL9Ua6a1rIxUpr7ewyjGPGPshZRG6eLcmtKcfuzMGieS/5LTz91JJ+f5b5sL99LdcMg8ky51d7zZ1hmAHrmc5zvXprHcr1GbI10Er3y2taQ28BP6lzzf5QxF4N+yvBiBg+C45vTU6RuJ3+2uYdiQaNnAJA71ZYbsRQZkrOn+77XVrllp7tK6lVR2cL5t/4ryNnZBAsoLEjbBqIODXBzsxWG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQTMXfoPLncs3CSSHKVCQTx3CHJouhkSJH6o1oVOY5+SUAvkknisHNqrN1Hx?=
 =?us-ascii?Q?cKXzWewvW3HvfmHGq7NeJKXXsLaziVooRnmGarW6u5aevvaEZFgf4dW6R8HC?=
 =?us-ascii?Q?pLL73vac49PhwLttzodwjqFzNn09uVQeQqql6K7oKlXjvHIussM67aqk0LEC?=
 =?us-ascii?Q?pGTmZlrJUjjAdxT2v6X3CDYBzRJyh8QUkI/510vs59366W49NkfQ4+uN5pH5?=
 =?us-ascii?Q?cyol8OAdFsikVwtiI1QAblCI+WzZN3nOC+C1ipn+H3wK7Iu+nemqtDnXrKMz?=
 =?us-ascii?Q?BkTgN+OLSaMZ5dqezAJZCehRZlGP2piRzLCTt5dnqe7fmPr9cKFbB1I/zqsV?=
 =?us-ascii?Q?sQiCV/YVzBTund76/grLBrz6jPMFFsSd0q2ZICLLWgCjon++tQFSwUIewvo3?=
 =?us-ascii?Q?Wcku7xVQDToA4tEkIR026kGi9bcpkW1XGw0fKNp48KOggq+WTypBZR2C5v6B?=
 =?us-ascii?Q?SZMbN0VgCILMTELXEU4Tjs9AhjYb2UTUYdMTOlNuJjh0WogDtGjgcwLakRnz?=
 =?us-ascii?Q?BlU5iBPniF86BPdR1v9WGh+0yaa4FlUMNInB17FlZDS4LBOjZhy3vddAB7Az?=
 =?us-ascii?Q?ie2ID4XEHRcpedsP9vGrw+qcG4Lx7rnruruL5ZnwvR/vZli0XwF8IFuX56Ku?=
 =?us-ascii?Q?gAQPQoqpmKEUYQQ614iJ+WBo3aiLFCaTKRsqx1CtiG/s7yY84pr8D5Q7O+ye?=
 =?us-ascii?Q?pkCo2/9Nqw+nscbHbZr7B/bm9Ft3u6uVdldqbsYa9AmP10aMpqrODi6tkQJE?=
 =?us-ascii?Q?Y/RHpi+T3RTTvQetB8Pzv/adCg5CW9WC12SiCQdmKel+B+/ti+KvJMvrgzV0?=
 =?us-ascii?Q?nD7bGKvTBPw1BnQLeUDVn2jgQSgsWp2fnxo8TgjcmV3tSDubxZxtP+Tu1cqH?=
 =?us-ascii?Q?VcJNGJeUJOntFNQf5ZJJA2p+8aPrB55Dd3RkeS0LfuvcDIpgOxtTemrOSuZG?=
 =?us-ascii?Q?zn4C7XSTKle4VhHimNUFiajbd1Yaeeb/GtJtjDlyHh8VZZ/DPVQC0YiizAqf?=
 =?us-ascii?Q?iWMrwN2/qFj48TvF2tghqhzj2mAkbdqO7g1yCMUQozk+l6sDcl7K2p6MhC7B?=
 =?us-ascii?Q?xD//HOFpMB3/vrcn3urp0vcHjlQnUFXEaFxD4bzlyNZSwr5IEEWWI/HZvo4V?=
 =?us-ascii?Q?jgrFdWFcFiR0A8W5qWQmoJrkERqx1k5itFOdEuK6krHtPuW3mG2BU9niclOz?=
 =?us-ascii?Q?4QEuskWr3uJiW+ocytmVig40xS6+50ylJcRhFgkjbPUskbFJ4SfKDy6FV+hn?=
 =?us-ascii?Q?dXx2eb8/phM2NGmpWZkXdDB941lcaigIbr85ONMYd4W6Bv6ccCCUWuIAesQA?=
 =?us-ascii?Q?GMB9PYUyg7MLnUeKhpxq7lFzJEBHFbP3HXARxuAGZ8ljK1K1NZDi02hYmvbR?=
 =?us-ascii?Q?guuYsqHZt8v8UvqNA3bOXUc73889AjhJI1sQHgQ20+KxvfrA1nmemuJWUbXj?=
 =?us-ascii?Q?q5nXMAOJvYCs4ojpBQJb6Y9ysVXWSczgHP6Yk8ArL3fmxWCZQGjBAARaMPUv?=
 =?us-ascii?Q?x5UpvbIqU9dKeharwC1+MYJ6UnK1ArVUHuNQ3fe4GzdfBPBFP5mqv4oxS0Rr?=
 =?us-ascii?Q?j+8n4LqsY9Sq1LHj1zRi7sHzx/0XrzVmlObeLNVNswCExsd2bdkfvrPVp133?=
 =?us-ascii?Q?wMrt7HloPjMU8KMqnFRiXOzAMIXR8xtVmYnymKOoq/cyX9ifBYNXak1TnuE+?=
 =?us-ascii?Q?36xHC65qyPawhGTlBIOWECfpeKQ79TQZQGf+CFHescxhP/L+Ti+8LkN7I7tV?=
 =?us-ascii?Q?3fKsV7R/OA=3D=3D?=
X-Exchange-RoutingPolicyChecked: VXyEy+QrSEadz5Tzs5NSofs33ZCUFwfDzvUY4W/W+Rs8n/Iudv6JZZyMdeFmyiyKkpImM+yJVEm8zdddww4GN/Y5mJB9MlBRRD164j5uMggXyAOOnHNa3vg15Jx0jbaVSjMO9H+xute2LTBd2d9vBxTo73hmwD1CV2jXrepEOnFEuP5xihrDsay5Sjb0vRJNeSnYZTZzQlNWiwE+sAyNuTH7D0VGqjcQxrEbKvn7UxdJiZcWWEgmnEoGOerP7b19Xfj0gQ9qFrZhRPk7HhjwdgJLb/HfR4iLxPySszaxmD3XYRgkYWMsSYKT70pniGxQbq1TPaxWagNSmLtLyIkDdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1b0caa-5a10-467e-f233-08dec3224869
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:48:34.6361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBkaiAFpAFuFJmJIP41XKt7xcgZPWut3yelEfscmFwwUh3zDbvkiirnAULvAwthfhsnbkR5Rz3k57+ybrxyplw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

On Fri, Jun 05, 2026 at 10:09:52AM -0400, Rodrigo Vivi wrote:
> The existing help texts for the JOB_TIMEOUT, TIMESLICE and PREEMPT_TIMEOUT
> configs were brief and did not make the role of each symbol clear:
> 
>  - _MIN / _MAX: hard bounds on the per-engine-class timeout. They are
>                 enforced unconditionally by the sysfs knobs, and (for
>                 TIMESLICE, the only one exposed via the SET_PROPERTY UAPI)
>                 they also bound CAP_SYS_NICE requests when
>                 DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is enabled.
>  - PREEMPT_TIMEOUT: the boot-time default; the JOB_TIMEOUT and TIMESLICE
>                     defaults are hardcoded in the driver, not configured
>                     here.
> 
> Rewrite the help texts to reflect this, naming the relevant sysfs knobs
> and UAPI property explicitly.
> 
> v2: Adjusted commit message based on Sashiko's review.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8 #v2

and if we want to be fair with all the tools and models
I guess I also need to add this:

Assisted-by: Sashiko-Review:gemini-3.1-pro-preview

> Reviewed-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 71 +++++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> index 7530df998148..e07517d120e0 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -1,50 +1,71 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE_JOB_TIMEOUT_MAX
> -	int "Default max job timeout (ms)"
> +	int "Hard upper limit for job timeout (ms)"
>  	default 10000 # milliseconds
>  	help
> -	  Configures the default max job timeout after which job will
> -	  be forcefully taken away from scheduler.
> +	  Absolute upper bound (in milliseconds) for the per-engine-class job
> +	  timeout. This is the maximum value that can be written to the sysfs
> +	  job_timeout_ms knob, regardless of privileges. To raise this ceiling,
> +	  increase this value and rebuild the kernel.
>  config DRM_XE_JOB_TIMEOUT_MIN
> -	int "Default min job timeout (ms)"
> +	int "Hard lower limit for job timeout (ms)"
>  	default 1 # milliseconds
>  	help
> -	  Configures the default min job timeout after which job will
> -	  be forcefully taken away from scheduler.
> +	  Absolute lower bound (in milliseconds) for the per-engine-class job
> +	  timeout. This is the minimum value that can be written to the sysfs
> +	  job_timeout_ms knob, regardless of privileges.
> +
> +	  Note: the job timeout default (5000 ms) is hardcoded in the driver
> +	  and is not configurable here. Use the sysfs job_timeout_ms knob at
> +	  runtime to change the engine-class default.
>  config DRM_XE_TIMESLICE_MAX
> -	int "Default max timeslice duration (us)"
> +	int "Hard upper limit for timeslice duration (us)"
>  	default 10000000 # microseconds
>  	help
> -	  Configures the default max timeslice duration between multiple
> -	  contexts by guc scheduling.
> +	  Absolute upper bound (in microseconds) for the timeslice duration.
> +	  This caps both the sysfs timeslice_duration_us knob and the value
> +	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
> +	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	  is enabled.
>  config DRM_XE_TIMESLICE_MIN
> -	int "Default min timeslice duration (us)"
> +	int "Hard lower limit for timeslice duration (us)"
>  	default 1 # microseconds
>  	help
> -	  Configures the default min timeslice duration between multiple
> -	  contexts by guc scheduling.
> +	  Absolute lower bound (in microseconds) for the timeslice duration.
> +	  This caps both the sysfs timeslice_duration_us knob and the value
> +	  accepted via the DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE UAPI for
> +	  processes with CAP_SYS_NICE when DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +	  is enabled.
>  config DRM_XE_PREEMPT_TIMEOUT
> -	int "Preempt timeout (us, jiffy granularity)"
> +	int "Default preempt timeout (us, jiffy granularity)"
>  	default 640000 # microseconds
>  	help
> -	  How long to wait (in microseconds) for a preemption event to occur
> -	  when submitting a new context. If the current context does not hit
> -	  an arbitration point and yield to HW before the timer expires, the
> -	  HW will be reset to allow the more important context to execute.
> +	  Initial per-engine-class preemption timeout (in microseconds). This
> +	  is the value the driver programs at boot; it can be changed at
> +	  runtime via the sysfs preempt_timeout_us knob.
> +
> +	  This is how long the driver waits for the current context to reach
> +	  an arbitration point and yield the GPU voluntarily when a
> +	  higher-priority context becomes runnable. If the context does not
> +	  yield before the timer expires, the HW is reset to allow the
> +	  higher-priority context to execute.
> +
> +	  The range userspace may write via sysfs is bounded by
> +	  DRM_XE_PREEMPT_TIMEOUT_MIN and DRM_XE_PREEMPT_TIMEOUT_MAX.
>  config DRM_XE_PREEMPT_TIMEOUT_MAX
> -	int "Default max preempt timeout (us)"
> +	int "Hard upper limit for preempt timeout (us)"
>  	default 10000000 # microseconds
>  	help
> -	  Configures the default max preempt timeout after which context
> -	  will be forcefully taken away and higher priority context will
> -	  run.
> +	  Absolute upper bound (in microseconds) for the per-engine-class
> +	  preemption timeout. This is the maximum value that can be written to
> +	  the sysfs preempt_timeout_us knob, regardless of privileges.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
> -	int "Default min preempt timeout (us)"
> +	int "Hard lower limit for preempt timeout (us)"
>  	default 1 # microseconds
>  	help
> -	  Configures the default min preempt timeout after which context
> -	  will be forcefully taken away and higher priority context will
> -	  run.
> +	  Absolute lower bound (in microseconds) for the per-engine-class
> +	  preemption timeout. This is the minimum value that can be written to
> +	  the sysfs preempt_timeout_us knob, regardless of privileges.
>  config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>  	bool "Default configuration of limitation on scheduler timeout"
>  	default y
> -- 
> 2.54.0
> 
