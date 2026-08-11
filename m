Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208C6C5CFD9
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 08:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B959410E240;
	Tue, 11 Aug 2026 08:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi2Ecjom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB4810E240
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786438450; x=1817974450;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hZUO2iFEmo6CMT4t2bhG99U4Gk2MPSw5v07w8GDY9fk=;
 b=Qi2Ecjom9pgh1YwsqLdfodwH58c3E09LGb3QdFII7T5xGUK+dfOfX7KL
 aghGHtdj6PWoDlDPS7z5KQ+t/dXPpQHC6ycIhOMoS0nfULjqArpqf7EYm
 eOplZHRe1kP4TVK57qW5frl/Quqo1XGkiBMpNyiM3scqUQRLVZkhHwhce
 p2DW2lhRgRKlug4E59fu82B8ELvTSAcTxFl7uz5BF0Dce5Qs8UxoG1Ga2
 zV38kEaoBPs6s+CRC1mt3Hm25Nkd5EmTGKSVcXdid8jiaoqae8RzYg5Si
 JEiq+jo1UdkkUZH1nM9vc31RAdJzFxw2Tg4a3wX6kodzAEj+JJpNQsGJI w==;
X-CSE-ConnectionGUID: Iil+1YhFTISHf3y5uTl69g==
X-CSE-MsgGUID: 8CcVi+aTSeeyUHjDVSkOFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="112509478"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="112509478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 01:54:09 -0700
X-CSE-ConnectionGUID: D+/gszCpR0KIB33GqY6UAQ==
X-CSE-MsgGUID: /NxgtsrGSuaQmCt15P/GFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="261970278"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 01:54:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 01:54:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 01:54:07 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 01:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRqc1Tl1ttdpe29pb1JNIjoD/2cpKqU3e6UHJKQ1Q3Xkji0tat5NX5pMG0wgrGE+1QAbgdtoeMXlM1cnuBXmr1Ydm2SV4VyCOLANeBG4gPbLqyExK0ulpVwH91YfXhbhUyTBgYRlugUMLeEnVaQAb0OYmR4tQyUHU7sLl8CZPgleWQBV49CPP4tBu/sxWkeppz66Bytm7Flk1XApXAURSjaexjYS3nvmMvqyp8h7rcUegyEwN9s4G1ef09qCixeL5j5xXRIJeQiBI8Mao9dBoNAN/6QlNOrk4osK0XUBgt1mE2NFxag+a7ofL9u6LIzpFilJvfEofRRVOcdFb5ryyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bphvaBrxMbLkWfFDqMHfvvdWSnJFek9L4ThDSVezi+s=;
 b=whN04imP2LSkIugaUhi8RVXYNNdXMxWy3sC/GCD+fNqFLehQA2MbW6zmdX6c/LuehEDyGq2vnR1EKavuWjHCFY5Nmx0fmPQT7pwnlhGUjkjcs5SbCc/NPRD/SWGGfzUllmGZ1qgyk1QGaa/sJf3Yv6dzZciyZ/WESScTLKEhUDiSzzx9KSR3TROMnU5S7gZxhz1iJMP2IEz94ySfkvyfK08YZySYrMkBjKsIG3ProtIxjH4T7nYNKajLbDf9ajuYq1nDjpi3ZD2lFHyWRK9w2rsnMwaQs7mFhHIi/BY9wzYRgY34Nlp6Way0yyL+OrXHKucJ5X3dAUCmQ4sW/PeYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6983.namprd11.prod.outlook.com (2603:10b6:303:226::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Tue, 11 Aug
 2026 08:54:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 08:54:04 +0000
Message-ID: <8d56ca1c-bc2c-470f-995b-20d25099219c@intel.com>
Date: Tue, 11 Aug 2026 10:54:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe/guc: Allow to replace
 xe_guc_mmio_send_recv() with KUNIT stub
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-9-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0faf7e-db37-4ef5-1827-08def7861866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: x/BBV0K3NZGoDI1s3uueJ2tddO/z7nEChiuM7HC+mPBGWeP5XbW6sHYL/p9xWrAI1nhEAZ81NkV+Py0DAq0rNRurs6bUdhD+aQ4Sf/zhvRbNqbn09Ub3/iYh0dERY9IsKX+lyhl5VDCkrEefqW8e/cfowkgRinvO5k1HJsFFy+GgvU3Pc+5H4Y58fx1OieFCyXp/2+lVJlzsCsYquW+rG12YHtig2zAVDxt9e2DYLnvF5TOGIsZAufzwGLLP2EDFndqNwOo239D/jhkhMcutC21nEyD08zf1ZhZoNE/foT9BAvZPEhRInmnG66Tkvmcb0VxEIVBNhix8ARcD5vyFdLyfkqqMEIaHxDWPR9nlB33v5Z2EjGHEIcyhrtVDLgrzFYCOOzt9HtJM2BpOvJdhlu6lFn4v6k/uaoIX0oqcKaFYc6tPphGgJaSSpONdDg1wLf8aJBIYYUrEfL3vLo5+pGLWen9fPNmMh61DT34DCbcqJXsKiRcnbmIRGFioovgUaypaVF84vK2xSanPsfjVMgDlUsUpbIPmxK1vKzaLBHGnY0MMI8ozEQ/9jTH4Sh3ThAAqjrJk8ZRZ9ucYghngHY2ztIHTO7MnQcp7OtlonEiUylPy7TGXuG5Y06xAvBM8Y4Nh9bfppPXGmG766fFfeU4bN5eI95uru+sjmY2QW24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEM0MGMvbk5VWWt3OFlkaGYwTXVwSTBkZkFPelpuejJ1Rkp2eENxNGN5ZzM1?=
 =?utf-8?B?Y3MyWVhLY2l3T0lSdlk5MHpuQWM1WE4xSXJOaGdxZGF5MFZReTJRUEV1NEhJ?=
 =?utf-8?B?djlLblhhVlJMNmRuejVqZ0RVNzhTd0FXdG1HY09MUEMvczdUQTkxckcvNGF6?=
 =?utf-8?B?dkVFUjQxczBqWWFaV2E2MGMwMUJtMUx6QjVCS3Y2VStXamZhcjlwUW9wbDJy?=
 =?utf-8?B?NUhHWXl0MEtNdi9ZOHZZSHRWaXBmMmRQMlNGcHVHMGtLWW1pNXFaZ3BVQXow?=
 =?utf-8?B?NEJ6Ylo0V3VYajJmaUZFa1gwSWtac3UvY25hR0VPeVgrVmtLZ2EzamRLTmpL?=
 =?utf-8?B?Z1JDaEZReU9raFJDTUx3bnNRNTUrQjd3bFZYY0dHM2pDRmpFQnNhcEpVMDd5?=
 =?utf-8?B?VzJ1UlREQWx1elJYK3hXMm5IUmdpZW5zQXdoZHhBaFQ1T1Q1ZE0vNXV5QkFl?=
 =?utf-8?B?OG5sTktUKzZpU2dpeGozR3V5czlXcURmUzQ4d2l1SEF2TUtMZGtRSFdyUXM1?=
 =?utf-8?B?WXNudU00cUx6dkorVklpcWFQSVRTMWNwUFVrc1NwR3M1NHQ0emZZVXUwdTY2?=
 =?utf-8?B?dHBZSlM2MmtjZmpYUHhDSXlqYjFtRU0rT2RCUTRCZk9yK1dNMnhFV2lDQ1Uz?=
 =?utf-8?B?cHV2VHR1cEVwb25GS3BKRmQ4UUpBN2c5QUdHWTd0eUpHZTE2WUVNaW5PNEVz?=
 =?utf-8?B?MGVtZ2xPQnlVSjlyaFVEN2xJeDVuQ2RUaVJueFhyekw4K2xaeXZ1NzNvbGNz?=
 =?utf-8?B?MjVLcjI4ZkNUa0JoemEzRGdaSE55QjM3bHNjZ3pDb2paSU50NjBLQnUrRnJk?=
 =?utf-8?B?ZTZLZEp4MlJIYXEyOS9HTXg0eFEyMENaVkgvcFR5aWNXdjI5OHdsUm9iM0pv?=
 =?utf-8?B?UkU4MUx2VCt5UGp2YmN4L0phVVNVSUZBU2tlYUd5ZytBa3NLdUUrSmdJTi91?=
 =?utf-8?B?YWNQQ1B6TzRqZEo5b3VmQ1FjbUh5L3B1cHkvd3dTNTU5TEVqbUsyMVhoUWh3?=
 =?utf-8?B?RHhuYTJxdGRFWFF2U2dZVVdQNHFJZjVndENFRHFjWFBjTGJEUUl4S21CQ0hs?=
 =?utf-8?B?T2VUclBtTW5SSGdLM0h2RTZxN2FCSktQV3VRYzRBRUtoZGttUmhUR1Y0bURs?=
 =?utf-8?B?NHZ4UUN2M3Y3aEh2S2k5dlpUYkw0UHREMGo1VTE4aUQvaEE3UTJocnhFMDV5?=
 =?utf-8?B?ZDdMeUVVOERXbEtUYUM4eGc5b1M4SVAybHYyWXhvVWNwSVgvNC9FOEVwT2Z3?=
 =?utf-8?B?ZFMzLzlCWTZ3VUY4b253QVB1MjVXVnBBMEU3bjlMYTNaSWJWQUI4MTJ1MGJ6?=
 =?utf-8?B?czJIQWsvM0RpTExITGZJU2dtQkt4QjBRTU83amJlNERRY24rUXF2VGVHWFFE?=
 =?utf-8?B?czRiRHpvYWVVdkpYOWlzRUk2ZVpsdjZvaEVFekRQREkzU2JJQjlQdHNneFhs?=
 =?utf-8?B?aWdSc2dEVDA4SUU5VUN3akJHamlQbThNQlV4NWF3LzJnTzdseFVhMUJIK1Yz?=
 =?utf-8?B?R005aUFIMy9IM1JvY01WcW5LWEhXSEJ2RzdJZGtoM2lYcTFpcE5UUFozemor?=
 =?utf-8?B?RzhVd3lqTUdmTzc0QVl0MXgzSkxka2JXSTJuUUNGYmxldkJjdnBrcnNuR1N5?=
 =?utf-8?B?QmVUbEtLK2gvelloZldVWUxvRmJOS21ScVMvSVQ5MlFCYmQzZW4ydldIQWMx?=
 =?utf-8?B?ZGRJR2U5RWxTRzFrLzZjRHFSaHFUdDlkeTh3RWRzRUk1SGFXNUdpMHAyVCtL?=
 =?utf-8?B?RjJ0aitaVkdOc3JQaTUwQVc4bzNuZ2Y0cDZOK2wvY3JkQURNbkhVY1lXa1BN?=
 =?utf-8?B?azdZMVRCd2twajBKd2pudzMxQXVPaVY1blFRK29BaGRUUzRFMnV3SkZzMFIx?=
 =?utf-8?B?OWFEb3hnZ0JzelMzc2xSYVEwRWdKbW5WM1ZRZS9UNDlzaWhpRUx6QlpZSlZj?=
 =?utf-8?B?Mjl0dkhZK3kwNHJIdGpOSUlWb1JUcGhzZEs2YUxaL1BNaFlEM1NUMW1OVndw?=
 =?utf-8?B?VXFSL3pocGJUWXUxWmFPQ0FYbzc1Z2JuK28zL0hOMHVpR3NqM3N6TjIySmda?=
 =?utf-8?B?WkxiTEZDc2E4bG4rcjJHQ0c2dU8zZVNEaWp5TmcvZWxad0V2aFArcWNuL01m?=
 =?utf-8?B?Q1BCZm5POFdVc2dBamhDTTNodlRjYithakVtOWhvUFRUYXFOSk5ISXZBb3dM?=
 =?utf-8?B?STBxeWc2MjZlTWFwQldldmYraHZTT0FiZVMrTE1JbWcva2w0NkRqM3lVeTZh?=
 =?utf-8?B?TUdsZUNUNEt4OHVaTmtMellHaUtsenBwQkZFbVNlZnBSenRjRXRGY3Rwalhh?=
 =?utf-8?B?ZEJ6TGJvc0RsdTNKMklObldiVG54TU5weFBpekVGYmI4bXROc1FIYSt5ZVoy?=
 =?utf-8?Q?H8XwAF5PYEUo1BUY=3D?=
X-Exchange-RoutingPolicyChecked: hFzBC7mj20n9oVeg12RP3HsshQUfG7ajoKsWXA5cybrKfpD9363e265zbyo6n0S3lgL0tQbu6XBn8qUOGEZdGC3vJ99wGrA3cyOSGEgXvAAXgwFHP9evrKBMY8knhQJZf375Esi4Tol4SWoeBlVZFSac0TChMmKmjyrSHdMtwz4PZ6+5JJGrZBLkC0bz9yV7n6H5oe98GuHZ5/pMfJZUnvRZFVUql4KxgQ8Nka9uHZqO7zo0aura42mD8j/w46/ZPd79Kq9MRteHshy/+SFbEvT6VgaDSK94EklMBzq5uQHZdCt8jctssMOcwwfPyKmXNoHvj/2ZLocO6h2cfm8Vfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0faf7e-db37-4ef5-1827-08def7861866
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:54:04.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Inwql8UL32bstv5ntQ2xdqoY1Kb7Q4/01x651JKUTTFM4AYDbQJ2wjdpSKw8WnwIrsP//tcUMB9VkVIgB0I98x/30O288rfljgaExWqNExk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6983
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> Allow to replace xe_guc_mmio_send_recv() with the stub so we can
> exercise more code paths on the fake xe device during kunit tests.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
> V4 -> V5:
> - Fixed review comments (Michal W).
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4286bd05c686..82e67e9219bd 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -6,6 +6,8 @@
>  #include "xe_guc.h"
>  
>  #include <linux/iopoll.h>
> +#include <kunit/static_stub.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> @@ -1509,6 +1511,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	int ret;
>  	int i;
>  
> +	KUNIT_STATIC_STUB_REDIRECT(xe_guc_mmio_send_recv, guc, request, len,
> +				   response_buf);
> +
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
>  	xe_assert(xe, len);

