Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA63AF43854
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE4510E19F;
	Wed, 15 Apr 2026 16:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3j8MjZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7E10E19F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776270333; x=1807806333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z6DI5HsY2jPNmh02xPaMTOtjIVQgmwOhaj7oHfVTh94=;
 b=M3j8MjZ7lr/82psS1DJlNMCIBULNsq1vZkUSZgIrWj0l8wN7gUfuciug
 S72+WCwAbEIBXZQt8RA/5RB8Tt/XQjZ2nwMd4UE8yC1OTqK6gZvodi+pO
 dKmr/vtM0wdpOLaeUeRYkKcBoQY1XLa77FdzTKou7tp6walPiHVtxYHAN
 +2SsthFapcAFd01w9J4HPPadt9IcaSIIKUjwLzDL9D3IgM3idxo0pAo6J
 wsysx4bVWvmlNcXeZP2887wxqMNKkzDo4sylvV4T1iybCgPm+bAWOwlxI
 GO1vK40RTef8L3f7fYEUnFdhp8zaRl9H4WAG/X5A4SVI67fXVmEXnsfPO Q==;
X-CSE-ConnectionGUID: kxfOdN1UTsyPEdRTP+N+dQ==
X-CSE-MsgGUID: pW/5Uoj6RvCKfGnoaUqi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77132250"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77132250"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:25:32 -0700
X-CSE-ConnectionGUID: DPJLjJLCTcmnX+LzN7DZzQ==
X-CSE-MsgGUID: 2zs1w1AQRYWi70frXJE/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230715897"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:25:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:25:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:25:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEuaziaLN4YnGRo+75ingAU1/38aUhD/SRmnUKpx0HAN5DJ5SoJq+xc3tAgFUeDdk8OoOQLA2fdpuxIUvz0HrtdrJ7gZ3hQ8IZtfN4pt4G+hynTLG52436VjC6jXFb2ZnKiFYAnw4WY9cG4A8nKWvrG3FYNJf/cdCARLU4YLXSJf1+qZNRZqo5hHmSqF87EDhxlmgGdmPJWjBpl+xQ7CD4yNIJQZLzKcGabupw0kUKweTlEytsmCVinKaypBnnsmwp8xPlhkv8vUJwDCSiAZFRlqeuukY76OtXJsMU2A6AzLzRegyZiLjmfbPdYJ/rsSGTTfIrP1sO22prJQs5mNDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Fnko6Cl7wfGJ0Ih6DM5dT7S+JbRVk9kbUxUGaOv8M=;
 b=JpvJtzX2GtXlnpREmTitQcX2fbVGxUbMmnrSVSTt05xVSkNU3o1UocYRfgIHUWana7zFbpbw51Kr0GyLPMWWlICYDP7SqLsnIBhUDq8vzR27vmNbitgvr4UOO3iXXyTi79Apc0k6ihUOOjDvwgzJ8uhYF9ZtGFst8ExFkcmGsen5Z4oFw6jI0M4cugWgFZSHVRG1UzzbydwpdLRUC6bGzOB1eAA8mPGIwP/ZzpuWjyfr8FRW42bBYMGeYgQr4kV1PjqnaD/+6mfdhczWYkEq1rSCbOTuwjjlwq7Dx1jsf+FP1RUQzx22iXHhRNHdsiD/8fdL1AwtwgqWmnWvQ2zDFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:25:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:25:28 +0000
Message-ID: <9eb9aa1e-92fd-4e8a-991b-a94599600c4e@intel.com>
Date: Wed, 15 Apr 2026 09:25:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm/xe/gt: Introduce FLR helpers
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-4-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406140722.154445-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c663be-294f-4a11-c9db-08de9b0b9aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: WqSLWOUQWfuXtEDzhZNBdtU2ImdjxXWi6JIt9iuYmTKNN5i5y9451JflfW6BgtV1uBMkJxQbD4yFAwWT3otzmPyjaj1xdN7ncl7Q1M/iHrwCDRe1zwwYf3BIExqGHqEpkQ2lKfWg6PeiMouMq1XT8Jfxqa8lgVlIlfgc9FQbArmzHQN2gSkRxdntlLCW54VrqAIej9Gz4HyDbafYQYlHh9a8aK/+wwL0Gi01FmILaRI5S8LoH64SOu9n5W/oUwLpf2TKhsGXyq/kC2PzuuIrqEqVMIYhO1p6q73LoT1KDEKGSN/hKn3SZiuSjBidLJicmnu1N/aGIAYesyJVoP4x+4CQbQMwGkCmk5GVfA8EHgMnXKvhsKIeDhaUEs/oxM+XlTGibEoLYELeDtYz9Z0f8eCTVTRvGrnOepopUSGd7e2NcG9JUYirZTYUkrWVgXeh7ICqh8TOaTjo9eLWzDN51BT/uTx3xVvEFgwXHc4IU8GbVSEYwyAHJl1PjKMPFlBChMVDLXhNhbm5SBLrP75/jQg3flloP0NPF+2e1YtcYAYmAnej7FPPFakhwhCqo/vMcTf89fmBX92kSL3Bg+dHO5ffEBHb5nfrASHJYHMczpj1IMxftEDs+Xx6obRHWDZ7VumWJ/532hWbDvzOpkrHx/1+iyZmOcLcl8Z9G19gzKaYoQ/45lZnaQAxyzl1Ws79Wop13x0hxxFZtX9LHSmZ91il9xd0APT+NDumEwFPsLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3E1bC9kNit4K2hvenV3Z2FMUGQ5YWRiYjg1QmxUSDdZQ1JrOHlOVmd1dC8y?=
 =?utf-8?B?WS90ckYyeWo5ZlZnYzJCYUltSDM4RkQ5bHlCdS9BRmZNb3o5Z0krZTBZbXdo?=
 =?utf-8?B?a2poYUdGa0wxd0ZmNVIvaDUveUxaQUJjUmxmMVltdy91MVR3Z1I2aW1ZMytq?=
 =?utf-8?B?bTdtK08yWVp5RVViTCt0RzVPUGpBSlBaZGR1M0dZdnR2SjUwTXZodmgyVmdx?=
 =?utf-8?B?K3pvMlIyRFdZRXlIM2ZKQU5sN1dmb2dwNE9ldzhjODU2M0N4TFlVTnZ6aWhw?=
 =?utf-8?B?QzRwZkNuREk4SzRzRjJ5N1poT1hoQXR3d0NnUkduNHE4OXlXUU5SRFh3Q1V4?=
 =?utf-8?B?VFo1dUF2bTN4bGhJbEdlVWQybzRWWTZLUGFBSVNpQ1ZDaGZWcU1rWDhwOWNy?=
 =?utf-8?B?WTdDYS82WFEzRGh0VGpSYzd3S1htYU94dTROcmtZazZiUEtza3E1TVZvSXQ1?=
 =?utf-8?B?MFdmeFZYUE40ZmYzOVRPZWFFL1JabElsdGxYT2hEWEJ4dGVxWG5FU3R3THAx?=
 =?utf-8?B?U1lINzRkcHdROVJLdUNldTVkKzUySTVOREpYNGtLc05aSnhJT1JKN2dYS1Va?=
 =?utf-8?B?ckszVm5wTmZUWHFLQllvUDdzaTJEU3ZEdXBLZU1GSXZjd014WUk0ZDNnOTVC?=
 =?utf-8?B?TWt4dEFCNzFsWXF1cTdNV05hWFdWQVdYQTlqU3U0WFpiT1V1Z1JkZWJmTEVu?=
 =?utf-8?B?MDQwazRnTmtwbzlnMForQWhac1R4NzdmWEk2OUNWNXc1Z0YzK0N5NnBxdlB3?=
 =?utf-8?B?L0pHOFBFaXVGdjVHcUc0d1VrT0JnS2FDR0w0bjg2WVZyWjFIbUIvTmFhaVc1?=
 =?utf-8?B?eG5qclNsMjB2L2hPNjN2OUdGMDk4a1lMT1pQOE5RenJweTI2OGhMdHRSUU9u?=
 =?utf-8?B?blAxZ1FXSzlSWVpjVmlQWllJS2ppemNIRktHeklkdVJvNW5XK1Zha2tPTEI2?=
 =?utf-8?B?MHdBYmdpL1VneDBmK25Ia2JyMjNaeVVkMElyaFVmcFQ0ajVrcjhaS3A1WjRq?=
 =?utf-8?B?MjdkV1QzaXlzU2ZmWHUzTEdMMEJpdllaVTNGUyttaURURkI2d3Y2RjNwYmtk?=
 =?utf-8?B?NFJibWV1blRYZkRRR1pVbFFnM3I5UXAwQ1VIZjlYemxMb3pwZmJYUUtlVHpD?=
 =?utf-8?B?cVgzV3Jrc3dqMWVVVGhDMGYyazNTVkFFeU43STFOcFRjaWZCenZxbzVhYThn?=
 =?utf-8?B?RlpZQWlxbVpXb3dlb1gyVXlYSXVFOWxqVUlpZVhCd3JGR1dYZmR1YkJvQlN1?=
 =?utf-8?B?aHFSMndYcnZWN3NLLzBIcFdtbThmK1JpcXBQV3lMYTdpa1JEOWNmanJOdFlW?=
 =?utf-8?B?N2R2T050QWJPWjhoamNUeHhmVUJaalcyaDhoUG4vN3VvK3F4MllyVW9WV0Zw?=
 =?utf-8?B?N1NER3ZLMW9IV1liZU1GQWhpcVNqZXNCeHg1TEtYRkF5OWl6QkVUNHdvdHJF?=
 =?utf-8?B?TGZEMkJkQmZXb3dUL3lPOThoOExET2hhZUxGL01sTmQzcDM2SXhCMVdNYzVa?=
 =?utf-8?B?WGpTbnZxUjBQOC8raTd2bFpIcVdPQ1JvakpScE9HT0VzM2FtaC9rSFdQZXZw?=
 =?utf-8?B?Qk1qRy83Q1hCcVpiMC9hUGcybE5nK1IrTU81blIvTFVrdWNNd3Z6dSs4SUpH?=
 =?utf-8?B?Q0ZPV1dlRnltaGdiSmRFZzZwNzJOemJMNmQvSUFPWnBXQUtrbGlhMVM1d0Fs?=
 =?utf-8?B?Yk94NktvQ25hNVJYc2xOV3ZZYkRQVzVvSlNmTGx2djRHWVZyQ0p5cXNjMk05?=
 =?utf-8?B?U1FreVIrN3ZodlJrTWcwdHNxNU5Ec0d0YkR3c2NKa0tOWDY0Q2pNRzZUQm15?=
 =?utf-8?B?RlFabE1RYytPcFZEQkJWWkF2OHdDWUg4Y3ZMTFR4bnlLbEVzOVZwN2xHcnpp?=
 =?utf-8?B?ejJEaS8zZDlaczE2TXJkeXVTYm9TbjVoaFJIM0FmSGtrN3ZKbHh6eGF0UVlJ?=
 =?utf-8?B?Q3dtTDRQd1RSR2VKQVdSVFJqanBFbnRpU1liQ2YyTE03NXRWV1JlRStWc2Nz?=
 =?utf-8?B?RWZQckwvTWxXaDBmeXdRR0ZvS1gyUVVjR0RaMmVaQVV4eHVtd1REeERzOGpt?=
 =?utf-8?B?ck1KcWI4cUgwVE9GSm42Tk1TeG5tMTBvYi9OQlA4YTRmNTV1RkpLMGk1TWJX?=
 =?utf-8?B?d2k1WEt6eWprQ0pmemVLSEM4emNuYU52NkROYitjUHM1ZUlPbHMxRHBybjBK?=
 =?utf-8?B?NnVnTEtoQWZnblNheU9XOGpZdHZ1Z2hoRHhsV3lZMkJPOXVLZThWVzM5RVRQ?=
 =?utf-8?B?d2g4cnRDMFpQRFFKVllraEdjdHdsbTRXanlWSW1OT1ExRVdPWWRUMjZUSmRY?=
 =?utf-8?B?YUIzN1JwWlBKV2tPcjYvNDRZZFBKVWFaZWNSelRUWWtFcndWZlpIRURTUDNw?=
 =?utf-8?Q?XJYQd2dAlVt+9tg4=3D?=
X-Exchange-RoutingPolicyChecked: lhJzHTlxED8iGq2UIImQZP3EaE/8foUtXxIwBjAUyMyvHwmCg6nIa6yuL4KwjrYYS9L81B+B5+kctRFVgUVO4L4Nf1aydUEiAHXIveLOuFCYWhutAdE6q7YkdXbqWCh+hYQ1CMDno0JZl7lhZ2MD4S9VVarg6o7IiOAg0h8ni4DTmE9a5kPGViK3yI6yDMtQx2WyW6UiOF2Ef+Hk8eXeeEE2UDBMRzwKYhB8GDoMdrYjdJ083N4JsE95jPU1iYmV6qqJpSv/9itjxla28Q69xmeZs5G/BFN0vi2DZzTrLe81g7dS6xjdvsfQR5vg6hzyvBaZpt1cdMM7b43VKeSuvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c663be-294f-4a11-c9db-08de9b0b9aff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:25:28.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FY53b9Is2x31JQqucqyRpwjMkXw1FUlEtAvNSvIBtpXKQoCy1WS+uJpa+iJBw91CAIokZSSkS6nrhaaxelk6OfUmrhas6iV+nWBqOgKEAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
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



On 4/6/2026 7:07 AM, Raag Jadav wrote:
> In preparation of usecases which require preparing/re-initializing GT and
> all its uCs before/after PCIe FLR, introduce flr_prepare/done() helpers.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Add kernel doc (Matthew Brost)
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_gsc.c      | 14 ++++++++++++
>   drivers/gpu/drm/xe/xe_gsc.h      |  1 +
>   drivers/gpu/drm/xe/xe_gt.c       | 37 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h       |  2 ++
>   drivers/gpu/drm/xe/xe_gt_types.h |  9 ++++++++
>   drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h      |  2 ++
>   drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++++++++
>   drivers/gpu/drm/xe/xe_huc.h      |  1 +
>   drivers/gpu/drm/xe/xe_uc.c       | 37 ++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h       |  2 ++
>   11 files changed, 148 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index e5c234f3d795..7bf6a90ea1a2 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -552,6 +552,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>   		flush_work(&gsc->work);
>   }
>   
> +/**
> + * xe_gsc_flr_done() - Re-initialize GSC after FLR
> + * @gsc: The GSC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gsc_flr_done(struct xe_gsc *gsc)

The function name is slightly unclear, as it feels like you're querying 
in the FLR process is done or not. Maybe just call it xe_gsc_reinit or 
xe_gsc_reinit_post_flr?
Same for other similar functions.

> +{
> +	if (!xe_uc_fw_is_loadable(&gsc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&gsc->fw);
> +}
> +
>   void xe_gsc_stop_prepare(struct xe_gsc *gsc)
>   {
>   	struct xe_gt *gt = gsc_to_gt(gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index b8b8e0810ad9..8b7fd98f0be6 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -13,6 +13,7 @@ struct xe_gsc;
>   struct xe_gt;
>   struct xe_hw_engine;
>   
> +int xe_gsc_flr_done(struct xe_gsc *gsc);
>   int xe_gsc_init(struct xe_gsc *gsc);
>   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..c395d8cc3b5a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -991,6 +991,43 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   		xe_pm_runtime_put(gt_to_xe(gt));
>   }
>   
> +static void xe_gt_flr_prepare_work(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), flr.worker);
> +
> +	xe_uc_flr_prepare(&gt->uc);
> +}
> +
> +/**
> + * xe_gt_flr_prepare() - Prepare GT for FLR
> + * @gt: the GT object
> + *
> + * Prepare all GT uCs for FLR.
> + */
> +void xe_gt_flr_prepare(struct xe_gt *gt)
> +{
> +	/*
> +	 * We'll be tearing down exec queues which signals all fences and frees the
> +	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
> +	 * the scheduler while jobs are still in-flight.
> +	 */
> +	INIT_WORK_ONSTACK(&gt->flr.worker, xe_gt_flr_prepare_work);
> +	queue_work(gt->ordered_wq, &gt->flr.worker);
> +	flush_work(&gt->flr.worker);
> +	destroy_work_on_stack(&gt->flr.worker);
> +}
> +
> +/**
> + * xe_gt_flr_done() - Re-initialize GT after FLR
> + * @gt: the GT object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_flr_done(struct xe_gt *gt)
> +{
> +	return xe_uc_flr_done(&gt->uc);
> +}
> +
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
>   {
>   	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index de7e47763411..5e6e4eb09efe 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -63,6 +63,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>    */
>   void xe_gt_record_user_engines(struct xe_gt *gt);
>   
> +int xe_gt_flr_done(struct xe_gt *gt);
> +void xe_gt_flr_prepare(struct xe_gt *gt);
>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>   int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8b55cf25a75f..f6694cc90582 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -201,6 +201,15 @@ struct xe_gt {
>   		struct work_struct worker;
>   	} reset;
>   
> +	/** @flr: state for FLR */
> +	struct {
> +		/**
> +		 * @flr.worker: worker for FLR to be done async allowing to safely
> +		 * flush all code paths
> +		 */
> +		struct work_struct worker;
> +	} flr;
> +
>   	/** @tlb_inval: TLB invalidation state */
>   	struct xe_tlb_inval tlb_inval;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e762eada21db..76a3f0904159 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1689,6 +1689,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
>   	xe_guc_submit_disable(guc);
>   }
>   
> +/**
> + * xe_guc_flr_prepare() - Prepare GuC for FLR
> + * @guc: The GuC object
> + *
> + * Stop GuC submission and tear down exec queues.
> + */
> +void xe_guc_flr_prepare(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return;
> +
> +	xe_guc_submit_stop(guc);
> +	xe_guc_submit_pause_abort(guc);
> +}
> +
> +/**
> + * xe_guc_flr_done() - Re-initialize GuC after FLR
> + * @guc: The GuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_flr_done(struct xe_guc *guc)
> +{
> +	if (!xe_uc_fw_is_loadable(&guc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&guc->fw);
> +}
> +
>   int xe_guc_reset_prepare(struct xe_guc *guc)
>   {
>   	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 02514914f404..1fcc623cf24e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -32,6 +32,8 @@
>   struct drm_printer;
>   
>   void xe_guc_comm_init_early(struct xe_guc *guc);
> +int xe_guc_flr_done(struct xe_guc *guc);
> +void xe_guc_flr_prepare(struct xe_guc *guc);
>   int xe_guc_init_noalloc(struct xe_guc *guc);
>   int xe_guc_init(struct xe_guc *guc);
>   int xe_guc_init_post_hwconfig(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 57afe21444b1..96c1bbb6f52c 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
>   	xe_uc_fw_sanitize(&huc->fw);
>   }
>   
> +/**
> + * xe_huc_flr_done() - Re-initialize HuC after FLR
> + * @huc: The HuC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_huc_flr_done(struct xe_huc *huc)
> +{
> +	if (!xe_uc_fw_is_loadable(&huc->fw))
> +		return 0;
> +
> +	return xe_uc_fw_reinit(&huc->fw);
> +}
> +
>   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>   {
>   	struct xe_gt *gt = huc_to_gt(huc);
> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> index fa1c45e70443..7600ea196908 100644
> --- a/drivers/gpu/drm/xe/xe_huc.h
> +++ b/drivers/gpu/drm/xe/xe_huc.h
> @@ -17,6 +17,7 @@ enum xe_huc_auth_types {
>   	XE_HUC_AUTH_TYPES_COUNT
>   };
>   
> +int xe_huc_flr_done(struct xe_huc *huc);
>   int xe_huc_init(struct xe_huc *huc);
>   int xe_huc_init_post_hwconfig(struct xe_huc *huc);
>   int xe_huc_upload(struct xe_huc *huc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 75091bde0d50..e41aa95a4322 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>   #include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>   #include "xe_huc.h"
>   #include "xe_sriov.h"
>   #include "xe_wopcm.h"
> @@ -275,6 +276,42 @@ static void uc_reset_wait(struct xe_uc *uc)
>   		goto again;
>   }
>   
> +/**
> + * xe_uc_flr_prepare() - Prepare uCs for FLR
> + * @uc: The uC object
> + *
> + * Tear down pending work and stop all uCs.
> + */
> +void xe_uc_flr_prepare(struct xe_uc *uc)
> +{
> +	xe_gsc_wait_for_worker_completion(&uc->gsc);
> +	xe_uc_reset_prepare(uc);
> +	xe_guc_flr_prepare(&uc->guc);
> +	xe_uc_stop(uc);
> +	xe_uc_sanitize(uc);

Note that xe_uc_sanitize purposely does not clear the GSC state because 
GSC survives both reset and D3Hot. However, FLR does reset it so the 
state needs to be cleared here.
However, we currently do not support GSC on DGFX, so while the FLR 
support is limited to DGFX this is not an issue (although if you want to 
skip adding support please at least add an assert so that we catch it if 
we ever enable FLR for iGFX).

Daniele

> +}
> +
> +/**
> + * xe_uc_flr_done() - Re-initialize uCs after FLR
> + * @uc: The uC object
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_uc_flr_done(struct xe_uc *uc)
> +{
> +	int ret;
> +
> +	ret = xe_guc_flr_done(&uc->guc);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_huc_flr_done(&uc->huc);
> +	if (ret)
> +		return ret;
> +
> +	return xe_gsc_flr_done(&uc->gsc);
> +}
> +
>   void xe_uc_suspend_prepare(struct xe_uc *uc)
>   {
>   	xe_gsc_wait_for_worker_completion(&uc->gsc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 255a54a8f876..1756821edea1 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -8,6 +8,8 @@
>   
>   struct xe_uc;
>   
> +int xe_uc_flr_done(struct xe_uc *uc);
> +void xe_uc_flr_prepare(struct xe_uc *uc);
>   int xe_uc_init_noalloc(struct xe_uc *uc);
>   int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);

