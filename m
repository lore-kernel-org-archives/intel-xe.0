Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8581C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 21:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9953010E079;
	Thu, 27 Mar 2025 21:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/AsjQGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4310E079
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743109366; x=1774645366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IqIs0Q24hxr0X9+jC58csSpkHqsQKePLAxIsAflaOO8=;
 b=d/AsjQGUWXXXdHvBJkL5i6hDdB1VE+lfNg4vxA5NFHfEcWzfZ5uNSc6E
 w1ztc5t9wNm5Z8pq3drI8ZQdFSuWg1U/8q2fqmFfeWZJ+Up9T96xsybfG
 m8tJgFwVl7GwDeOYICho82FFm4fJkP7Tp+lfW4/NtLb06rBsk+TIPbWCC
 9l6gEW3nXznyojoDOoFQfyO1W8/P2BPqV/0t0s/EY+8lTkfWo4tjNTz8m
 eu0NmMOjMcBLgSowVdFUde/LVU1dBTSx6rC23N+Ik81bp8zGigKRF1BXt
 X5xmkMP1nK5Ug4mWPnwuIekZ9fudgkVdAeIJoF6Taea5g3wZQQsXw1XSx g==;
X-CSE-ConnectionGUID: 3FLKaCePTqSEZji5Jwt6vw==
X-CSE-MsgGUID: Zm0S3PTwSQiMmV7ytYjTIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69826708"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="69826708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 14:02:44 -0700
X-CSE-ConnectionGUID: Q8uYhg87SZOH8g7pVe5hfw==
X-CSE-MsgGUID: 8B4kMpWmQOCoV1D612W0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125225251"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2025 14:02:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Mar 2025 14:02:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 14:02:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 14:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3TdrV8QxPGXTcQ7ZJHOQ9wlC1idt+Kbw8fEZUXgqiHtw7d2o1IZ+az5GWL09/utecCNFyy5BD0rTspxpSYDak1uyzT6PmQgmo26EsUj5pIS8yyWWqm3cHagDK7PeU9B3QCkWP7tRlS9m9qXESryCrsELNo/tW0UVDgb6iACDngPHAv0yh4kOsSMxR6GD0H7BpM5xRKdfLB6TGy/v/bPUrCHLoJy101UJi0evQPPq6Kb0c8N7yepxYWp+KU056Iq5CCacgA2TN3o3a/i22hzFt/WbWqTOih5O34Whp2eDdz3LiRcQ37cvG+UZcV/fCDF9neI+dsbvcBHwvYdF0pcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XzqL357D6TUHjfrTDSIcd13MWBAGuLhZ4CWqI/+m4I=;
 b=r8cSAjRDE1O+mmWxbHpeGvIKq4CyilQedGSEsGozXT0516kwsYJki1ng3i1LSNkWUkBTUQCsKHNrCtdbaCzuQNAgsIMzK4HvIF6fmjCXJp3OwcgqCg9DDe5HrMcO1NawPSqzjm7HGFA72Pj5GWdvziOnx8vsO3+/bKG0eVDbb16+d0mmj/arSzWHZTOtvGe/FaI5hPcxqAn5VR3IC/BrMgXEoHtslQEUMmtiOHZz2aCdDGH5gORgw2L7sN5yBwdtPsNnuvpoUNm4kEtX9dHdDAGyD7Y2HYSEPTWpxDc90pRyYKtaFXqtmnsc0o83tAf2U1DGfiHZS1/WtB5cLyv2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 21:02:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 21:02:07 +0000
Date: Thu, 27 Mar 2025 14:02:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Ensure fixed_slice_mode gets set after
 ccs_mode change
Message-ID: <20250327210205.GI1439735@mdroper-desk1.amr.corp.intel.com>
References: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250327185604.18230-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: e8973ae2-40a9-4874-8a63-08dd6d72a276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A4ssFSV7y7IcOL5O1Gv0vD+JriLdDCMFerW0sDOdI4i7RijmL4bhWkD8F3Tq?=
 =?us-ascii?Q?pAge8eYbY7UixeUIlmztIpEMSs9h4bBmNsQtLt3qnYHB+pPQGfP40ATQW7o8?=
 =?us-ascii?Q?x3QHsMQ57H9de7jykHrfphsigNfNDUrgkEF/Tw+sETNAgYvbpjfIvnrztd00?=
 =?us-ascii?Q?2M0VTdH+jO3zVdf6RIF4kJgqqwAKyWYc1U56xYW3qjgCqwDkDlan4hveIUiv?=
 =?us-ascii?Q?PiySKK4e4y+1rVtQYsfzy9+QjDgRDSrDwKw0ydSh60Q9vfMuNpgangT1qJwR?=
 =?us-ascii?Q?k0AuYnEriUHtGYS8HazlHOBE9V1lqJiHawmiM2gB4xLodtl3ZfuPvuJ76EMU?=
 =?us-ascii?Q?aJf4N/lu5raIaeexG5e4Spzt7bvMDzizquiCukSpHFKl1og06606fpqajczX?=
 =?us-ascii?Q?nR5ibZVOqV9mEUSfU4ngsZdfq04TV0M690gy+oDB9p/OrNwcJQzUulzeuQWF?=
 =?us-ascii?Q?C3Ll5fU55gdBoulNAFbjqOkQGnq2QzuVt/fkJaitiR9D0sTP8xcxf4xWS2zj?=
 =?us-ascii?Q?yLgwgCBf4fnfsP8JCVk+vT0MBCW/2RLZgxnYSHcarF3Z+vtQjU9RUvwoD4N3?=
 =?us-ascii?Q?CN28w5VfCcpiLPg90bNa/ldOWQIxqKVTbmqZ82ocEm++MxkUhd9JIRbw7GO7?=
 =?us-ascii?Q?unrsc6Viy4W7aiUFKq2x7S3BqnwkUor0h++I4j+zfHuc5Ilh3lHSRtwV1dS7?=
 =?us-ascii?Q?cPngzY+0A5m4ZEIMzMXcLbFdKPeH/TiBHYZmdMaDMVPus8Cx/RIsZeCk8Ugs?=
 =?us-ascii?Q?cGRc3uP/EjyaQ7qS37lYWMtDUHEUJ9Oc7W+F+HCSgQYLb6vfjK0lEGOAXuyv?=
 =?us-ascii?Q?vWVT1V08p1fbU5+F9hgWC0dowx3cVgXhcntfCO+Qnp2cy9z5vthKF9c/4Bho?=
 =?us-ascii?Q?+uiULFM1JDnifGlv2TsvBdIFNAsUh+tOfnH4L/jdi7hEd+hCsts1D42BN0AP?=
 =?us-ascii?Q?tyjln0QEMMKpmdtdQREDu8eCBZa+gWQcTvpin9M0UDl0kxy6tkF7iqkKRmZ3?=
 =?us-ascii?Q?RnL/M5s4Yl81L4SzoyV1pdN9tayPZJls8GzgUO6rLVobXqreOBl4tjJZ4JyY?=
 =?us-ascii?Q?LYJdNXzJTUHH8xsI3/y5P/9t5kkTcnuRObfYjjxJLjBHU19TelhRXkQgPeNi?=
 =?us-ascii?Q?d3ZDD7EE//cf7k+R3pgemjwhwAbeoNoxYWodLiwRU3/VBkf54ub8n9K2tiKG?=
 =?us-ascii?Q?pp984Piu8OpmefqpNW+LPAfh6wK+Fz0kNBIqITjmt5C3zqJizApT7h+Shrbm?=
 =?us-ascii?Q?UMCvqnzam4OwdHwd5iXw9rmP6oSKyV9Dleyg+ZKL3CCNOfrs8c38NroWmtBs?=
 =?us-ascii?Q?JjRtBI73x/Et7WC5cIzS7R1Iw5VoAZ9RN53F3FFXCFnoJMwOXx/vesgE4Wyz?=
 =?us-ascii?Q?qaxqLNUlsf+vMJUj1ucirdafYqld?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?slMM8QauNqrwPEfCBXoSeM5txaP8i6sy8SqkfJDXxoktSHWPsnZ6dj5azT39?=
 =?us-ascii?Q?j8Mtxp+vq4MvB/HRTTxYWR0vWsN+JIP6KbhCTAnAZz0g4NsjkdF/eFTaNFJf?=
 =?us-ascii?Q?EtSXqCyqfV7mU5iDHP8hOea4TNoim1sfB/9fl7FcAfhRYyO/njOBe5s2TTVD?=
 =?us-ascii?Q?5Wg4bpUSQY7PfNXFv6KCJ7TEn+RQBs1RhJsdq5bgVyjnfyT2DOQ/FR2RUn3S?=
 =?us-ascii?Q?coy/3fNy+Ht2JQJ+k3rr2f30XsIQKMXbiIQGIcWa5f2J6N8MzJiWMoXZohIZ?=
 =?us-ascii?Q?Cf117/NdYqLB3EabBmDjcxFSiH+UlUOhXvjEWcLNSbnqZsfTs36XVrHCXW3i?=
 =?us-ascii?Q?fzCTntjY14F8HzH3HvhjnXAMj6Cue5SBI7F2TSxMqfLRc2Tgb6UBiIxycLYF?=
 =?us-ascii?Q?hppUZ/bXxKUkwNjOwK7U2YYmNa75dPWrt7cRv2bPDAM8cb12fNELNYxQcXT3?=
 =?us-ascii?Q?zVXc32UqwDRUbusPoypX1MkAIrBkhlzzRNfzVI5iy8ZXOhPsYJPDnd/JVlBd?=
 =?us-ascii?Q?4DNyeVvOcK961MAape3E43J9jqEM6fYozSFLqKgX0iIzaMmw6B9it35hK2G8?=
 =?us-ascii?Q?8cpR0lw3FfQAhcaqjvG6ffSDTmF3ZkdEPShMHxkmeZsSvgnAzKWxuyXnfm4A?=
 =?us-ascii?Q?L8nadgdOWDbPc4SQd+8FeDVO8oaUIXXLBzxCdd7IGjD/d45doZS7DuyRKyVr?=
 =?us-ascii?Q?ryODfmzxKkvoCXszLiQTQrH6/n0avrpojhUfLGsBos9SR0c6upDnvqhbemWR?=
 =?us-ascii?Q?CRl2Lr6aQ0P54jOGMVHBF0bhj8IqDvZJ+a0LdZPnOL1DC6f/oWUCq403JZpo?=
 =?us-ascii?Q?J9UJ92oJDk3mmMynJDlAi2may+Fw6lYndD9nl6K9W7hXS9G1NKyFj7w+F6sn?=
 =?us-ascii?Q?YmS4HwBjohPJaCo0lIt43vNEyXwCikRY9/Jh9Mbhw0f0XcyX71500M7HxNQK?=
 =?us-ascii?Q?nTHAt44fgzawg0w+v34TO2Zwmrfhd5abdXY5fHal0p4v8OaiYxTph4ZYqgV8?=
 =?us-ascii?Q?3a9widWilH+/ocUdDdtOV55NsCVPsi4iTlAmI96TvoeKb5jK4+ym7hVirsTs?=
 =?us-ascii?Q?9QPoxTQxQtJfDzHgMcmUK5kgkHkOCART3eYWEhns08DMArJl8GMKpyXkgsvv?=
 =?us-ascii?Q?RFDH1Fb/y0rbIkqtHqTlSH8qjTHeUwlGUnmbB9pxtEML/Oq6s2uyZyywu/tK?=
 =?us-ascii?Q?f7nsfzN5OCpXVUL9ql/RrbcdU9AO3LlKA6IScBi28AKkW1+7MoaeyKQ2sfU0?=
 =?us-ascii?Q?uHyA/ZXzL3n25dUS0R4dnpvejj9lvt4FS1BwR3HIYLqKVDAEsfnrKYD/np14?=
 =?us-ascii?Q?HMtzr9c1GjfZaA79s6HtSAzhhuydHniNJWmVnQnYr8+KDZV+VfqNVlLUjhLK?=
 =?us-ascii?Q?KsANUIF40TZ59kj81n20tFhb5IDqNjZr+JHvmzuqalZTDfWqpj2AINxG8EdM?=
 =?us-ascii?Q?tzSvqABBPMiX9kmdY2Z8KBYJQTyBRAhfCIztW3Rc6ZJd7k7kKP+Qo/lneK6d?=
 =?us-ascii?Q?1tr8f0BwsF8n8iPFUcHiMgYYTjoHtO8YSbVQwOfm8zgGzYIC4syThCapDplV?=
 =?us-ascii?Q?o/L6pL91CfU3j5FG08P6lBoObAlndxnWd/ksYaSlQfPGQ8elKi2BwD22a41o?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8973ae2-40a9-4874-8a63-08dd6d72a276
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 21:02:07.8143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjMP9c2iIEpLXE3zCTFSMwsDfnKm8CHJZ5zDgU0neIZMtgd2+OMuvUbxEKdIC2iOAHybyCsSBPULm2RKJxlpbiOe/VNLnJlqrygbLBEnBng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
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

On Thu, Mar 27, 2025 at 11:56:04AM -0700, Niranjana Vishwanathapura wrote:
> The RCU_MODE_FIXED_SLICE_CCS_MODE setting is not getting invoked
> in the gt reset path after the ccs_mode setting by the user.
> Add it to engine register update list (in hw_engine_setup_default_state())
> which ensures it gets set in the gt reset and engine reset paths.
> 
> v2: Add register update to engine list to ensure it gets updated
> after engine reset also.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 8c05fd30b7df..93241fd0a4ba 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -389,12 +389,6 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>  				 blit_cctl_val,
>  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> -		/* Use Fixed slice CCS mode */
> -		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> -		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> -		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> -					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> -		},
>  		/* Disable WMTP if HW doesn't support it */
>  		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
>  		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
> @@ -461,6 +455,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/* Use Fixed slice CCS mode */
> +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
> +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
> +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
> +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
> +		},
>  	};
>  
>  	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
