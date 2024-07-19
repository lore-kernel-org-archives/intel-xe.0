Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E5C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 20:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D978E10E00C;
	Fri, 19 Jul 2024 20:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqogIBSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EA710E00C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721419222; x=1752955222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KfcvPQtSGq15ZNPAig68zYodGJ0UPjjN+srmRlwJgkI=;
 b=HqogIBSXvpf0nEjjTlCL4pwmT/ZOvfDvApaqMki/1K7qom87lv9hlfq3
 fa63/bgya1C3CmoJqOlivN1ePWXeyk9GcX9C8wCZIRxpmxR32MKL9lXj9
 /F8I3qU13SuTymKzYvV2Cpu3UX4r6B2LcUpwshz5vPoXbrJtj0618oxqh
 JBfJd7eUQPMSGagRHD0iSzcFnoQfj5ppg4tqkNiRrdYsuSB6X/2S4vT09
 atXB7a3pqSkw66upn8WvcsW7y468zzUhfVhtm1WA0KG61unF1J4yyJGM5
 cbwP0OVmQCxjYpRJ9o7d7kFYwmqAi4ETa8A3njK6LLHX1DWDsIeApSf8K w==;
X-CSE-ConnectionGUID: aKCEPMmkTOy0stqgTXeg9Q==
X-CSE-MsgGUID: jRvp0FIEQAqlnq8l/Mvfdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30479213"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30479213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 13:00:12 -0700
X-CSE-ConnectionGUID: /RTj74fCTNGXs9iSs64Z2g==
X-CSE-MsgGUID: kZ5szdE4SFe4NEuBxpdmQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56065560"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 13:00:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 13:00:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 13:00:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 13:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJxGAhQnP4tZk/4BGr0DK4fPLZQQ/L6SwIVBlto4u5Uw06faMS4jKzhhcK33zDxH4eRlPgcCDHm4dZpk/fB/gAkXqqC77/sHCbR9dLbFfUrak1BkORJis2vMJZAWsA/561TNbnRkyPLDvBH0ZtOE6sVmyQsE1zxL2EXdoC9JQU7382zEgvyE4Q35/syevIHWXLmdfYtmbAYcxqiA543atcn+Pw8dA2FjNVf0yPa5ZQaeJRYcJAOn2cB4KQODHqSckXKnA6J6qXmu3qZ7oaY8bxubBXzzokxwoSjsYRlOga7ei6a1l5ZmtsBSjqSpEMtClynBzhWZwpqmojMAxIVLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHontlRjWQR7BQ0HppolkNbea7AfFaN7faxHsc+IVKk=;
 b=aXyqRoice1KSIadZfKW8BvU8Pyij62+OymwTKN8y7c5etV6FBECyu/hH4+XlS1ZtfFpb7pliIhAd3AZCbrPuF+mFLOPSQrw2S1Nn0YgGfGk6iVNHRXr0rBgUV49SOO9y/5kGpejYCnfqByNsHArnY5BGT4RyBrNaIyOoYYnDHLrxBG6RMzyXTgHRE5Ry+wvKjieffRpH+iqyP9530eBad0YCSh95qO/RNgSdeOi+DtISeFV4Y5Pc+CMZkcNGS8JKwblop4DN9rvKV2efq+V4et7VJBEyZrQ0qofcACd+kXieKCCdY06MELeujAS8U5DQYiKZmWtgesvrX/qDz+bI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 20:00:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 20:00:09 +0000
Date: Fri, 19 Jul 2024 19:59:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix warning on unreachable statement
Message-ID: <ZprFmUmx4vK1v0HT@DUT025-TGLU.fm.intel.com>
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240719191534.3845469-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: ab150f95-19e6-44e0-0f82-08dca82d6469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?smuqTN98tT0fktd0vESlXPo0rLw7prnApPh5ox4Wxd7ALkPSfOiEAwEHY9PI?=
 =?us-ascii?Q?OwsVqJmpu42WNMl3fNS4FNhikhcI04WuX+i1/9ZgwACgzqiMCQGO3JFihS/U?=
 =?us-ascii?Q?feSQ4HuI1I5hP+W67Oc1hGCc/gvYG7vw+ek3GNQJyUXpO/0QXcTqKXP91QoB?=
 =?us-ascii?Q?MjyEH+uC1mCw8qZTsYNRmSX4S/lmXxz8p7Y52i4ZEV+ucn0hAGO6xAtgXtGa?=
 =?us-ascii?Q?K+RoVi/+CgeMvjkpaBuzlc1MNOBQ2dmKNbwJ/GwgJGlLrQJU1LpBr8WGvtwK?=
 =?us-ascii?Q?IPzvG+KAK410KT1KOMXXvdKkV6QkgSaWhCgQnNpL4H33RFNTyORlPpMvxClY?=
 =?us-ascii?Q?dtjZgpNBHkd9xUeBkLWmTAYSKeUlsyT6fEEAKsbXxPLrqAQ8+Z0w1vevEVmU?=
 =?us-ascii?Q?WMObw2pERUH1QOWuWlXdT3FaDNGjRRh47qKZgP2zHJNQWxhDO72cg318gyuC?=
 =?us-ascii?Q?hjrlMsDQgIv4n7dGE7Q3bhKRFvB3rpU+YrmmZMvUlB+iCjdbBgdQCjueQ1dx?=
 =?us-ascii?Q?fQtqrWDOE2Sk8cwHMr7zrRkV1zC3CqsN178A4RDJDxeYjOors4DtUJewqJmj?=
 =?us-ascii?Q?V5NqPXPN7O3y0K0FJtkoWH+vogXwU9uTtknAMpEG+69T43nQxIXKIj3c7YoW?=
 =?us-ascii?Q?VpVlsmOV8t7Si5Ulp41CGq/DC8XkRcBPMkPr7125cZevG4MTaZP1V0dnda4Y?=
 =?us-ascii?Q?15qamz/Dy7HCV/mobpUmMF7OG0ASpC7E5S0G1wnwji88jjyyg3GPtLIiEvRi?=
 =?us-ascii?Q?o08nH+k5yPCcAhieOMuWdM1sMYcoxRwi39J41lqBo2+1IVPn9n2HWhqO/Jl5?=
 =?us-ascii?Q?jkHap7qaecJfnAJeNBEPm5mUqB8x+FV7RZRjlB4mWkiqM2yFE8tqBZtmd3ly?=
 =?us-ascii?Q?SMmSkJdX8VmXULKKRuwD3b6TV8tTQtnMFmqgx1UW1+/Ol6mO+CqhYQ7xchZJ?=
 =?us-ascii?Q?Swul3kUGwPt8aYJQLcAMHkr2W2/iBrQ3x9ks/r9zJ64ff4I0nOwi4v5cn8JD?=
 =?us-ascii?Q?wZLuUrB8yUQ6CdYJIUymx6Vz7G6lGqk9IU8bnAkrqPWHqtaSsogAsiob4z1D?=
 =?us-ascii?Q?Dva+gBbgcAeIBnnGlCXLQQb8k4k9Q6U9ySJP/dpnaqotDUJsta1MZ2DsYg+w?=
 =?us-ascii?Q?S0ZcNNlhuALOq9AA6YPk5HiYQKgQHvXOwfDqy8WlpgqiW7g0PN6pc1zyMrH5?=
 =?us-ascii?Q?c6kqe7pCQI/LrjHpDeKlRji+e+N+TbH2VmGCj+xD39ZZr5W53FYfM/FZSeer?=
 =?us-ascii?Q?edYvzQNMvOZ4B6xxH3ENkAeKBlPqqe+NSZyfw++vSYVrPfhVSog8fyUKast1?=
 =?us-ascii?Q?6hujfCJCn5crJrfqKySBuhqsNYBXKuNwK2vRmc5XSAKFPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uAnYV9LLop2wP6sXtXoOIYikIpIv/l3m+KhrQ4ewRqDf1uoBPNB8ohCTYB6o?=
 =?us-ascii?Q?x+22bSm2trNfofmLL2/iYvLnCxnKYVefSLW1TmH/mgCsv6wk+47iSyYz9q1S?=
 =?us-ascii?Q?w7e7diiukBJeJPDJFGnYqF7HPYPWEGI2Bvvs/LcTB7M4hXbgO7ZM3m3SDljT?=
 =?us-ascii?Q?pjDU8h6DMY7Hk2GgaejUWfnBN9LE0o88ZYH1Nd+k+riWthsD5+LbXTFocnFz?=
 =?us-ascii?Q?594AM/dKAmZkbuWRDPeShOA1hnHunzZuaIOSkv4tbKTP4tiKrUU8GtQ9VzDT?=
 =?us-ascii?Q?6GqrVRcRnyhzsa037tgSblaWEtIIyq2MfGJPBv10K/Am8l4+78bO2nPIRXqW?=
 =?us-ascii?Q?BjW9K0msbyo+7O+I253aN4o/oQVpFeC5HvCMis9dS+YVB43Bm0tVR0cb+JAS?=
 =?us-ascii?Q?7aR/IWf1akyqq630tVjUVaVlC2z3KDAnmlJ5klOTL4DUkZ1s8Yga8RDinVkJ?=
 =?us-ascii?Q?d1OB1+x0iBLG30lytHPDz+FWHXc8s+l+3f7YItY31d+c/IEZy0+p2Bkb9/iT?=
 =?us-ascii?Q?QKK+D5BzsHyAL+zGT4ys2KgDTrbvhg6njTtN2K/If3KkoJh/GpfweI6kPSDi?=
 =?us-ascii?Q?qZfEkDEJYQh1sD4CaSTTKa/DB2B0fFZ4sx2IhmzaYkpC5c9z1va0th1wHs7N?=
 =?us-ascii?Q?mV23fZrp4IQkq+We4t1zotsqTlPIi0pTLu0k643WYByeztnddAIkV51LymB8?=
 =?us-ascii?Q?PrTnYyWool8014/AlPVBrmg9XuBeIcAGSaJFKpVccn5KdugOYXW1s7fWAFVI?=
 =?us-ascii?Q?hdt2wjl19jJKGO0OOvYG3Llr7aa0yhTTPDZpQdNTcu4D3xyI2StKv4ubbkA6?=
 =?us-ascii?Q?ceqYRmAJe94wugNpqod/cUnEG9AGwHbT3LhyrDIK2PCPyQdyHChIK4LXYimj?=
 =?us-ascii?Q?MpTiRetSmpPveW3+8R6qrV0jZhLMk7ty4Q0Ad5vsJsFWOP4SaZHqzN0laXkm?=
 =?us-ascii?Q?pHXjbxW1Iln2LqeUrwwjlOfYvsAtNwSlwIPEHFLTRuKDjQQaqW3NuwPbFcwP?=
 =?us-ascii?Q?0TjVVDEbhTrP9Qjh0ZkJ/oAfrCSVPJhR/OMpdlgSNYdBfwAqwNZSqfT9mYrQ?=
 =?us-ascii?Q?xiJKEZAzWQxUAeUnnOsdaLukOoOIPL6C981HFleBklx7gaTtlwdgcki+u31w?=
 =?us-ascii?Q?6mWhb4tn593Gb/3C4p+U39i1nzZiBtHFqs3j+nbJjWLcqT4TRzkOWePix18Q?=
 =?us-ascii?Q?44EY296skSxlplC/dGyxcAklPuqV/hC2n8HbGVLUQtBTxiwt8d+M12uCPZSA?=
 =?us-ascii?Q?m+pXCFuPUWLcRG3wEX/O7dum5WH3qVwYLHyN27UpZwVLfGfCnVzgrM7SxgOM?=
 =?us-ascii?Q?Q+EkoyiUMaMmo7HQOmd/qgvYoH67jCu1mHLiK56eL8e7Dlwgz30cpOjiW2te?=
 =?us-ascii?Q?HVUaxvVMEn33NKZufKn0SDTMaLmM3bLAWqOaPqS1wFVNtci4AL+NpBXRtU6l?=
 =?us-ascii?Q?H1xgUX11eONL8nCJMm6bOZ2743UZnkboo35aHDfLtZbk3KXGbfUOSf+GTQ1P?=
 =?us-ascii?Q?hDqnixrx5pqNTQa2l+2I3rMoAm0bQe7sUC5XYGBtu/Be8xc0j/P0tgzOwNvj?=
 =?us-ascii?Q?/NLK7FsoPhX8hiOO/fxcBS+gImxcRlSjwnXXVb8Yol4U4498dWbD6qrs1/6d?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab150f95-19e6-44e0-0f82-08dca82d6469
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:00:09.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXYXJ/0K4lj2uLmyxNfcdLf/WOIuN9E99U9rcn4jo2UWKk0ls7ethtvWZTGgorpEih4tdCzhzwx3evJIi/WXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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

On Fri, Jul 19, 2024 at 12:15:34PM -0700, Lucas De Marchi wrote:
> eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
> it handles all enum values. However it's perfectly legal to pass an int
> to that function so in the end that function may happen to return
> nothing. A smart compiler could notice eu_type is never assigned to
> anything other than those values.
> 
> Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
> triggered for me, but this was reported in a different system with
> gcc-10:
> 
> 	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()
> 
> Since that is not really possible, just take the simple approach and
> return NULL.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 5a1559edf3e9..0662f71c6ede 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>  		return "simd8";

Typically elsewhere in the KMD issue done this:

        default:
                drm_warn(&xe->drm, "NOT POSSIBLE");

Never really agreed on approach but this is used in a lot of places.

Should we do this here?

Matt

>  	}
>  
> -	unreachable();
> +	return NULL;
>  }
>  
>  void
> -- 
> 2.43.0
> 
