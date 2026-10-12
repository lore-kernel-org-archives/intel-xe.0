Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39483CA9ED2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 10:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C561010EFAB;
	Mon, 12 Oct 2026 10:00:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3678D10EFAB
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791799212; x=1823335212;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FQGioO8lmLbhfvMY50n6lGgNEZJ+JpCY5AqCeA4VSCc=;
 b=KtflFbPTNW8j24S8Zw8F42YzDXW2z/EKIyyBuhWpc8oLC6gIRlTJ/J/a
 aAdj8usGZsM5GZ5+Ac3cJfQyB3k56t+ruTGG8wmq4QnXdtDKTvHSfIkW6
 Do4V+z08XdHFHdtaB2fHzAFZAFHCVveF6A+fPncjQip7EkqRkKkOdzdwU
 q9qu+ZVLXZnZZDFyEsEI/9AjV6Rtwpb9wrj3cmAGSsRDTLNrSCf8r9Hd0
 deFYc+dRAbyYGDy6xFDSQ4F3Y1xOTd12kiMEK47sCrNQ4iEe8Q8JFWIuD
 3+w5nTqaTxYx0O6TQssLc9bpTtI++M6evKu/Lv6AgO78TmtYP//S6P1D3 w==;
X-CSE-ConnectionGUID: nRpWX5BFRzybL2/eskY4Kw==
X-CSE-MsgGUID: /o3MzCfRTgWDJF3YGfhlPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="527801"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="527801"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 03:00:12 -0700
X-CSE-ConnectionGUID: 4YKKxQ2rQvSLqMTPzDBANw==
X-CSE-MsgGUID: URFmZ2KqQyunIW06DpHNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1318010"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 03:00:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:00:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 03:00:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 03:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kihEQ00wUJSD/dQp07Ea6ClgVHJz0b8qE9XRqgWzrJjZf32Jptr3EjGnXMgQvKCOIsXz/vkD1ZsuKY78BCeXTg1J8TeLuxBohAv++cMWhYLxAJuNX31v3O7L0QmAZPPxnCorqe7yWoQhbGxhVkZJTh9HSSdZCYSHj0Oxr2ovqAYVucc4PjdaaeqhboVfRROSLWWcK84ExQ4r9itckcigddAPXmSbczp5lW3tphEC8MxcicIV+Wld9gwUxysjJn5fUORCjQbaGhmK00Oymvk0uMY5fPjUmKgb2H5fwAya3/gn/qUYKLEHwqPWQt3OcJN3Gdv67J3XsSafs1ZzW77Byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN2nByOnommGZ3M55Fg++BBOxeN74voAlEuyvqZoAbg=;
 b=J8JGRMMe8oubVENwIYqs+YslCHEZDaed2IAjYBFmEj0wH+g86Xbo7vwaIP4YqIsfL5FGDOP7JGWbo21VhWd5EuJOVnFTGQElHiz1RYK9lxLowBg9P4ZGIU2b6LB215fb3nVsHIkYmwwLAmpCKJR/+ZNOXE5WEVPpBG24rJG0lz0Hpc2hCGMXDXzzJxvArZ4Ge4vQfLjJ7nPRcabIx8ZHMfpQ6mD9gibf26vDlHdH6g9r8j4Q0HrztEUmsrQctZ7X5pCvmvncq006YCnrX0rN4fuH8SI0nFE46eYs2vuTKIxc0RPC9m/WAV8t/B/mqM3K2gJtfZtQ06wH+LIHiHRrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DSWPR11MB9689.namprd11.prod.outlook.com (2603:10b6:8:354::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.21; Mon, 12 Oct 2026 10:00:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 10:00:03 +0000
Message-ID: <5cecd445-03e7-4cf9-a688-a954509a5407@intel.com>
Date: Mon, 12 Oct 2026 15:29:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ras: Fix sysctrl and drm-ras discrepancy
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260910142550.2373557-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260910142550.2373557-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DSWPR11MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4230c8-3b08-4829-4ccb-08df284795d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|261009221227099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: MD8dbpuaa34kbKz/KiMFgPaGZoy7pEpINUQQFPOeYTvnTmQQLihi/D/n/Fbzg8z2YpHJkU1muAQSo7ioKDXEkoBUmnGppVPQFuGtid74lhdTUgGl3I742G9Ae7A0imFVMe6XXoZA3R/eZXiOsGBaP88T0FkGwEnK78P0gOTHZr0NvfwoH3kwMt00pEHMMZWd43JjWHVVjIFG/APT6OmL/rocwYFrJqQL2cOdq7KsfhFRjzNNJ8aFT8CaB8IIAXKjdhARPrIZFoty8opnrt/YkswZ1sX0PCrYsK9oqp+zACjvR4BeBETGRRWatYIhWvVHKpN+meT/+IhYWlJY2GLJmevyHAdX8+yb3pwt5IbPGDag1JTd7+zGqtS4JySkZvxR58KHGflUyvkM5dz432mlSu6YteOeDd0x9yNWNXnZ1w1LYF52y1TqZWXbtulBCsna/+p8FpsBBKkNwsKIuQKMdgQiirbDrbbopGCVWIhKDICc2pw71oZ7eFlsdOQxAIRw5JMwV6fxIt3rPLx3kuEFhhY/UYy3le+BzV7F5fRXGkcw7wy+mqGNR9+KAGZyWEzfilCk/9SEY4cPwD1MZty92z/SbFmX3Us0gxW6vXsDw9qdyIdr0eKg+iy3EzRqINY1HP4rZ/lvFOnssE//SH6vPmyoXrkWELP07dLGXVyeuZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFGN0kvWGY0SGg1dXlJd2ExRnFidXBid1h1MGZiOHN3L0Jja21JUGFHakk2?=
 =?utf-8?B?Ym1ENTRucGZFTGFvTDVYeVJOdWpocWpLV1JuQVllNWU5dUZRZithNHlvVVly?=
 =?utf-8?B?SjN3aE1kdjQ1T0tVTGlVbnhoUXZqYjJLZ0p5dDd2Mld2WjBYQ2FGbE1BRHFu?=
 =?utf-8?B?eFFZbkRTWjg0M0lQTU5VYUowY3NOS2RwdGs4ajFOSVhqakkrNm5tWm5PMjVo?=
 =?utf-8?B?UktYaWNJd1Qvc0gvQTBWZWZrRC9oMTlEK2NjbGpJK3FxeXI5cXJDUlVldEJa?=
 =?utf-8?B?L2lyQ3NCd0RGeHBQUWJKcjQ0TFhVUFc0Z0pOMjdWaHBUN1F0MWtMZENsaU1V?=
 =?utf-8?B?N3FjSkVhTC9CcEVuR09xRldUWEl4R013Mlk0Nlg1Wk4zcDMxOU9pMWxpb1M2?=
 =?utf-8?B?VEZxSVd0emtXVU9UdEp6b0RLRXpZVGhQMHJ0YzlVenczSkVFbDFENFRoQ2ZX?=
 =?utf-8?B?SWZGNU5DbTQ3Q0pqZ0hFbmxoYmhpb3htOGh4aUtyM1N4YUlnbXBINERTcm9s?=
 =?utf-8?B?MEdHUXMwaGlvbGVmWldHQWdMMVZ2R1llZXU5eG5BV2JwM0RHaHlMY0F4VlNG?=
 =?utf-8?B?L3ByY2V1V1BPckxpWnFrRWV2Zy8xMWlER0xnWjF5UHFjaEtBTk1vS0Z3d3Ns?=
 =?utf-8?B?RHN6cGMyZDRIU3dDTmNpTDVqRG9pa2psQTA0L3ErMXVjT2lyS09SSlRBRzly?=
 =?utf-8?B?SzRvZnducHNNUkUzWTVrbC9MekUzWmt4WlRVbmkxdW5tYUNUbzdSdXZCdDFm?=
 =?utf-8?B?Zk9IU09uRVVQLzkrUUk1a1pJcEpTOExLVGJiTGh0MGwzbWpzdnIwb0J4WDNJ?=
 =?utf-8?B?Z2xtVy9iSEtqWTBUZjcvRHV3UmVGamw5ZXZkVmFNVlhUMmZaVzFWMkxnckxz?=
 =?utf-8?B?NEJuNGVjL0FYckNScFZKdnhTNEsrOVQ4TE1EOVhaZi9CV2J0VWZPTjc1T3ZF?=
 =?utf-8?B?MWY2UHhGZXRYNld2V0tNMStQYytCdnhlUzdhbzFLclBkQlVZSlpRRVgrdVhj?=
 =?utf-8?B?TGI5RDZ0VVNTdkZtaXF0M3NPdHRYcDQwU20yTWhxWU51bkpQeGhpTFV4Z2VG?=
 =?utf-8?B?aldqVG9zRVViZDM3cWMvYnVna1F4Nk9vSC9qZ3liWGptSDdaWlZFaTB3WXJR?=
 =?utf-8?B?TERQeHBSQUVmcGJUV0xkdGg0YURsRFpqQ3huZkIya3pqVjVuQ3JjSDU2STB0?=
 =?utf-8?B?azViNC9vQkZwY09xNlJOZjcwOTFodDVGMUI0VXdNUTRWZG1Pc2ZINTF1STg1?=
 =?utf-8?B?SmdKWE0yWGZKcVFGRU9XWVRlVmZ5SG9ub3ZhVHBXaUF3LzF4cHY2bDZicGpB?=
 =?utf-8?B?b2RyL3lteGxJQUE3TjFVWDBHd0QremFsdVRIdW1jR3lBT0RxdmZUcVNkT3FQ?=
 =?utf-8?B?eE9kU05qdzRCbGRGT0MrdFZtL2NyMG5WYmt0bE5kU05GV1dRQk1jbmNtTUxi?=
 =?utf-8?B?a2F5SUE1aGc1OHRwNUYyMHk3N1JFWWF1MkpJUXV3Si9GbC8xRWpBVEFsSVVh?=
 =?utf-8?B?ZGxpVlpPU2VEQVhVNVl4MDRVbFlxcytGOGJIT0gvR1NTbE12d25BR1laSEZF?=
 =?utf-8?B?NHlHZytaQ29rQjZLQWZpT0VOVWpMNmRtN3JUNXQrazlzQUpDblUzZ2lSUE81?=
 =?utf-8?B?dTBHZEc3ZS9WUDhNRnlTOUZiSDg1azBxdkszamUrV2lHWjJnNTRVWlhBNkZB?=
 =?utf-8?B?eldDTWxWZitrSmhNSTRaRXFXRGRKVXNnQm1qdStWUG92eHNoeUZ5cGFkcU5t?=
 =?utf-8?B?WDZudFVWbWxNeS8yTFFhN1JwLzlyeDhsQU5aMDFlRU9RZFJ0emRUcW9uQThu?=
 =?utf-8?B?VjhMSlMwU2FHZkNqank1N3E5SHZibjBVdVl4TGV2cXl5QkxmdW4yQlh6b1NS?=
 =?utf-8?B?TFVTdEJnVFpTR3I3MjE0eHNYKzZnUWNVZ2M5YitaNktCb09RNWoxbXpDNzY1?=
 =?utf-8?B?TmpPbFFCU0oyb3JvaXBmbVRQa2tTbFU2dlBUdHR3Y3Z4QUM0dWpXT0JwM2Ns?=
 =?utf-8?B?WnUrSnJGcndWazB0SjVmTHhrRzVFOFRPL2ZsSzYwbllLVEd4UUZrWUxQVENy?=
 =?utf-8?B?VE9ZY3JvbHd1aXV6MmtyY3BPME9CY0ZNWGRab0lKOTQyR2k4emhtYytSTXRi?=
 =?utf-8?B?cE85SEVuWTg4STJUajRFNDBrK3hqbjdKYzkvaXh1RUJsZitHMlZlL1NLQVdt?=
 =?utf-8?B?L1JWTXNvZ2o2Q1hxbUdhWEsrTDZYL0gzRlpITk03dUF2M0wxQis4dkRDMldm?=
 =?utf-8?B?NE94UFpTZUorU0Q2SC8yRnBIa0ROam05UmRZNW5HSEFzS1VRVGVVL2w4WUZ1?=
 =?utf-8?B?bTcxRzRtVlMzbEZ4T2QyTWRnT0kxZ0lXVjRNVktYdmgyekNtN0Y3dz09?=
X-Exchange-RoutingPolicyChecked: j9GxbIud2fdzRuGL6P4gWiwbO8vWUtxv4ad7i9WSwMlBFEXs3Yvg9iURMHrnqjztuTT+umPL0Tfo4Esl3djsWAKyDoOQ16If+xOE4J1pp72iCLnvCOqC7mLhO/+LVyyJ/BP9bhcD26Yd5eMQqOEa6YQft4VfPmqfUBAT6Z/2GH/Wgci+MKy8605Oda1HnTMaaK7zwn6OSy+e4Lf+22uvZnP6CW4bFTmB+1fIyKooeziqhHBVpIt/ZVph2oYYvvsoUowgtPioxnnYtKi4H10/A0+AyzLGzcWxREXVJO3lSkNmbT0XP5I0Mhe67ul+nWdQ/NJ3bjXgpoXocOCzkX1iWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4230c8-3b08-4829-4ccb-08df284795d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:00:03.6905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQXG+v4MQ0g09YB1EajkqFrTIgJgmmFnJ1RV5BthCVtRixCMhjRhmdRitKe34dnL9YAetKVMF3GsGuab1o4RJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9689
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


On 10-09-2026 19:55, Raag Jadav wrote:
> There are cases where a reported error is valid for sysctrl but it's
> not exposed as a valid uapi through drm-ras. We allow such error to be
> logged but it's redundant to try to send an error-event for it. Early
> return such cases and prevent misleading drm-ras error-event failures.
>
> Fixes: 6a9493e47075 ("drm/xe/xe_ras: Report correctable/uncorrectable error events to userspace")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

LGTM

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v2: Move sanity check to xe_drm_ras (Riana)
> ---
>   drivers/gpu/drm/xe/xe_drm_ras.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index 7f3695707611..5e6d4926d08e 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -16,6 +16,17 @@
>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
> +static bool drm_ras_counter_is_valid(u32 severity, u32 component)
> +{
> +	if (!in_range(severity, DRM_XE_RAS_ERR_SEV_CORRECTABLE, DRM_XE_RAS_ERR_SEV_MAX))
> +		return false;
> +
> +	if (!in_range(component, DRM_XE_RAS_ERR_COMP_CORE_COMPUTE, DRM_XE_RAS_ERR_COMP_MAX - 1))
> +		return false;
> +
> +	return true;
> +}
> +
>   static int query_error_counter(struct xe_device *xe,
>   			       enum drm_xe_ras_error_severity severity,
>   			       u32 error_id, const char **name, u32 *val)
> @@ -239,6 +250,9 @@ void xe_drm_ras_event(struct xe_device *xe, u32 component, u32 severity, u32 val
>   	if (!xe->info.has_drm_ras)
>   		return;
>   
> +	if (!drm_ras_counter_is_valid(severity, component))
> +		return;
> +
>   	node = &ras->node[severity];
>   
>   	if (!info || !info[component].name)
