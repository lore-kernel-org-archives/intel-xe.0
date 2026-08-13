Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACFC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 17:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C2810F44F;
	Thu, 13 Aug 2026 17:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI4TsXSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF810F44F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786641960; x=1818177960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9B1UEZ+IP2VaRszfnpI8TPbA39XDoHxVg+uLp6NbowQ=;
 b=FI4TsXSXvbPCg/VNoUp0DlADIxxsI/u6VPewten2sGytzqSGk6Qh/Lki
 sBkh8zwZLYjOzJQavWw6qLK1fW/r1/wvONzyPjAHi2xAaAreOXu/jGeRt
 vRH4NoQR/vJPt9XonywbvVjbRrAUaCbVpL/EjOMppjq6siVHIw2LjsY0j
 2ywKsqKTsO8gawkB2lrbj7q5qL115q6H30++eTfyFE+ilf+hmnl6tDZVZ
 xrBqGpThPZEHIGBd3/Gkc5ncQRCx/sps2QeNv3x3joaWWuGPwsd3fZj3a
 dz8M92d5/o/TpGT91g7FcHTnOsF9WgSz8A3yzmZVsaHpGKAo2600L6sn/ g==;
X-CSE-ConnectionGUID: SZV85lI8TSyd+Bzcgo7Auw==
X-CSE-MsgGUID: bhXMn7BYSymsWNtcd042Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97809522"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97809522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:26:00 -0700
X-CSE-ConnectionGUID: S5kC6y2HTB6w+P/EIcbqsw==
X-CSE-MsgGUID: jEZmyczTTBCF4EaCz445ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="259760122"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:25:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:25:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 10:25:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh5WsycVqeayS5LkT+HqVtHyjpOvy1673+00HjsgyGaf4Od6t39eV2NuO4XT1wdmqSW8Qqx3ATFrl5Q1t41r91yqA/l4D1jlucfwpSJ7HZZQpsLKPZa9I3FQuJU2v/i6Q8aSTfqiuc+K1ALvLRpE1ie5l5JiWR3Z0lgGgpMgfWi5smXk+hHMEpGYb7/MhHScq2x39w2AnxWy0eoponoiT3KUxLLHv24RnS2M9/0EMtTYKfgTvJNKLLDdfDQPTjKKIxPX6qvwguJfMLDwNtBSaRWS7ld4T7voF85k8EEyzmS79DFyZGGV+a3xEng1stm2Z7juno39mKDnt8vEHelVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIriO9RUMFKvKGVWPf6cq9ewkyQ5m72xUmnDHfMaFUI=;
 b=jmPZFXw5S9KTjYq91CSybQAjR6R4/LeCrUA80RcsVoC9jC6NgV2Y5Hbf2e3mV0K8IdQG/df6atFneDu+XVKZrnbvuYyLwm2utx4MMNPB9/GfMgaWloybLI9+VWl6LRmA1aaTkv7VGT85zu4NGfEsGhXlWwOgy+Hy+SxHov/BxQr4C96ZMzj4bsikUYjUXisK1/fXxyvziGNGANkM0yft0SOFn6C4nbjMpl2AyxOggYhMP7sqTLAZ9QyhZBU7cankujtV65iKMmcEu8J1lU5otznLFs5nNufetEIE5WSbs0dCzzPLKRFFo8zOydxD4fAUtqD3mCC4ieKirxiyXO1NWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 17:25:50 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 17:25:50 +0000
Date: Thu, 13 Aug 2026 13:25:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v4 31/32] drm/xe/gt: Report 'Queue full' pagefault error
 using SIGID
Message-ID: <an3-G8O8Ab7vUejd@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-32-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-32-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4c82eb-ae79-4df4-dbf4-08def95febc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: MsGPeXsvN/WEpd9UO0ByFSA2cw2cTdWod5Re9p3/FG6to8VXMS1v2zL3GmsORO17NTbtaxQjpF2oP8bjURvHXBBgd0fN4bXgaeZPuBpvcds0ocY323XleXHaRyHxDlm6jwtifEyz2apcqH2Ar2fWMuj46B7/GoVCbyi+6mNCn7IEKkBDFdhYG6wxJAwmy5SJXHbEHc5HMUWF465AiLPJCX0gMNykea1ZYos9CZTiXKJjJKsHr6YcQJhQwMuS6jQrByJO8TPnMDn5NEmrXy5NhkYpAhXTrURZ5tCvlR5vrg6gGP3iEIJdsQwBktJHbZJeNXYsSCbvKfOUzo090jMJg775dL4iTdf0ww168tgc3BjD4datr7aXEcsGapMGNDCNn6ZC6tnIQesXRnOrK0VlKTFHInOfC6+1qhs6d5oLCNftH9+b2T/4bv61ooSqNx5WWmIFbtGvZ5tgjmob261ZrqQLlwMgP1JP/JfUCYSGqexmg+qlt49mV5P6hhM3dFxl7OjxCFZbe8l+l4NBFbF6orT6o4MkTZU3/6NHoXmNO04GD6DO5g4ld7i6SLf0L/XfxFYeMNGUI1/7aPVJqXEC+biPc4RmV6Dw/e8rGx356Vxo2W88M0YK33hWKqS8v02UGOwV3VThmwF+5Pku/47TdJWN7TNBznt8VGKlBiLzVMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kVNZ39ls2nlAiYKgqgO7GuM0AYSFUmRmxszIwIF/jMslFTnLxiIEzx7SUEKd?=
 =?us-ascii?Q?oT1M/SFosoYdGdDr1UW3BkrIh7jl66kNZE9dvcc3QxizdThfuNxFo8v9If47?=
 =?us-ascii?Q?POfrvrL7x0JDxZM42lTPLQnKuIM5u3S5MUvni8xupQ2SHBKWxE+C/4zgDJsJ?=
 =?us-ascii?Q?Mr4PGPdWfAqNW6387FMmrMZGbjCuOzrd4407H8y2YIlj8f82xyfbrFJ9cEqt?=
 =?us-ascii?Q?DK1iWl97SkAOOnboS9bcG9IWUVdOEIa4EyvPkzfQoRA7AjsEGKSTjiSVffNN?=
 =?us-ascii?Q?vtHNppjsHLf7ulPFYg7sToiENKvRtLbIlGn2WNTL3LTt3DbOSOU7TkRyFNat?=
 =?us-ascii?Q?8zdONn7rCPN3HX3mRZdwcYG0DhYYOknEVjA3ePRDYOP3YG4lWEGy1eKN/Ja/?=
 =?us-ascii?Q?NpSYuZbHOVx7X8a/ti4xEOi3fwDtXtg3sgtHvw1kS+W2Kq+RCWYLthmagsgC?=
 =?us-ascii?Q?2H+JxEzBlGhZ2VguSvOa9cABidv4CgMr28O/NoLXXfQjVWzbjmnWiUCMLeMs?=
 =?us-ascii?Q?jwW89YpKSCQ9rXIJkYS3GjBy4iVhOeX/hCas0UXD2u4nxCP6NpexKV2AWK46?=
 =?us-ascii?Q?Dlj2jYTRG4Lo6qnzPKMLJLiezH4nSmFB/SB1lAMpl5WD3M1TSE5M5qgrun1t?=
 =?us-ascii?Q?M1xFLa6FlwkJ5MvPR2UrrJmCZvV+kdsz64+athBV8/46u+COArUsttcMP5e5?=
 =?us-ascii?Q?balFbet4HgzpA0Cts8k7G4pq+hMODFcFpcO7FtPIrl0wzBiojYEVkCq+qJkG?=
 =?us-ascii?Q?Y6sUWL9c0aU0N15RAF946+Y5hQ9yOnAP1zdPxjaa8/WoEcS5IFX5/ZN04fdV?=
 =?us-ascii?Q?i5PR2OPePUzghsC+QpFL25+1hnA/C1KRKGvZbnDV3wT73mdFPeg/i5lg5/sx?=
 =?us-ascii?Q?HoVOH0kEbR6f89cjblK/p1H8bOOPbK5v2bhp6fC2n7UMKs11KiaDeWKNqmv8?=
 =?us-ascii?Q?8wk2nAT6P+OVy81lrb686BXiX/d89a7L0+CwId1Si687XbFhgvZvmd+6+Xqf?=
 =?us-ascii?Q?PbzE2AbV3S/dfZCb7Zrw9yXbr1GsiqB2dNITg3M5hfxpg9erM30wZrOABE7s?=
 =?us-ascii?Q?9r2TZmJz1E2wLjRVcJPHHwC3xJHMumiKeWt9fH7cBNVnyvhfcVQVoJrIbJyK?=
 =?us-ascii?Q?B+DoZN9u+ms/KThFtrMrRAV/3MdfxcgODuiQQRTRXBfVyOZVfrZQgIqsp8BV?=
 =?us-ascii?Q?gateA0gHh0wNxnQHOXl+AdaMNNbh6v/8cOBhNSzxLsT4U9TBmZLTMd6UHZQh?=
 =?us-ascii?Q?bXyuW8J56nwwI/HZRsUfgb9sEqUizQRv5+80tp7FBmO1rk9K3nsxvr8Vs6VE?=
 =?us-ascii?Q?7YxI96+LPTQUJ9h5tSEQ/oTl7WadTloDrT0O23+d/0cVzFZoBkeQ29hd6fz4?=
 =?us-ascii?Q?HU/yBvEwipMQ/T4ws0tPmRdQA9kfDBrDXb44HIol2xKPtPzN5E4JAr7YMSq7?=
 =?us-ascii?Q?ngTfzuoBJF+Xzj0xjTf6KG6mzJglU7QYeeGemi9JC0uHNv/hAqZHkUeuSbGP?=
 =?us-ascii?Q?Te2QPhMoLA9lEaOVXWhQm9pmQ70ASkXmD1Ihe/WHJL35LOs3QEAocKEQ2DlA?=
 =?us-ascii?Q?pm9UJ6CNXeZd3mn1C39E2QiFA7bHBMipxMpKD0g3Ff3ei/pmbLeL8QdPLq9u?=
 =?us-ascii?Q?Aj7QIBC9WC9s7D7bwHM+5u2GRcGVOdOGGBz61TILwjY0iSEGKKqYGnFUk91a?=
 =?us-ascii?Q?2XHiZ/Dam/DIvUNwTxafyl4nJ2UC6OHlo2rElfqouCoOtTlP4oLyUYAKGY96?=
 =?us-ascii?Q?0yztoXcL6A=3D=3D?=
X-Exchange-RoutingPolicyChecked: R7bMMe2KBthBrL6DK0masVydS6PZi2fBtmZy0X3NwHmmx/mmhZOe7huDlOoIFM3Cj72u4AbVyn46Q0MRqCP3G/mi8RIXxlrBOu/UHC/NeKFHbqhVY6FJ5LEFwHiMBSPICLwqFXNzGaPL0A/Nwc4MUOayY3AXhI9GumKqHEKu/YGuqBzGVovGhUQr8AJL7BYaGyMeHx9DPX1UaPTWJSP0pL+XLTBx0VE4sGtczI0+7G2yMD0UrODH2OUp5s2lUYAvOhd79UWkFKyB8JT2DUyxhojS+bV7H4AGYJ1JMlTgUpBhHKHkeQ5/+8IxoB4wuTUlK7+kqTsUz3aEQ9/jClc4IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4c82eb-ae79-4df4-dbf4-08def95febc0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:25:50.7387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HREcf8hMYEzVQQcUrqw3RxYTReuo868QiHCESPZ3oML0VhutaMDDfyU9o3fVgdktYikFtHQFvBR+YeOULOczlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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

On Wed, Aug 12, 2026 at 09:14:47PM +0200, Michal Wajdeczko wrote:
> Report 'Queue full' error using xe_log_err() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index eb600c466187..f0e173a251e4 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -328,8 +328,10 @@ xe_pagefault_queue_add(struct xe_pagefault_queue *pf_queue,
>  
>  	do {
>  		/* Not possible, warn on and drop page fault */
> -		if (WARN_ON(xe_pagefault_queue_full(pf_queue)))
> +		if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {

Please mention in the commit message that we are replacing the WARN_ON
per WARN_ON_ONCE to avoid the extra noise and also because once is
enough anyway.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +			xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");
>  			return NULL;
> +		}
>  
>  		lpf = (pf_queue->data + pf_queue->head);
>  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> -- 
> 2.47.1
> 
