Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF84C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 06:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788710E3A9;
	Thu, 27 Aug 2026 06:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6050lse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A6610E3A9
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787812961; x=1819348961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RgGE9EVPxa8PJnr4CYbjNzce24JeMkqJyXExA3qF6Mo=;
 b=L6050lselu6WLa05kJ1yXDAc1Ao6hvcpzcsdNOtmToQKbi8Jurj7JWwG
 nyHLU9GiRu05TUKLXjgFYVZ6vMivNymWgWNz3poU4FXwMIMNnizl+qQDz
 cgbmGfwT5Ye1bCokYylAKYg+BOqk/Hl/FORW3m9+Toc8rkAdsFKGjDHhA
 0UuMhqIFVcX5+9/DMBalQXdB45aD0gpzjEVlWR0xPx/fgjKWiIQ3lREva
 sUN1HojZzIiMxk7nGDllnwimVGMzaeIv58tpBdxmVw13zjt+vw58PT/Sr
 Ppxd/zlOPQ25pAybWlQC+4s8oM/KciCvSdc2ANlPlhGxIqAoWy2lP8zAs A==;
X-CSE-ConnectionGUID: zmR7NXPlSxCuKuxO5ksfyA==
X-CSE-MsgGUID: y7dHVRVRTnK84LZ4cl4y/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87247780"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="87247780"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:42:40 -0700
X-CSE-ConnectionGUID: L1+nlz7XSwGGK/U+vNkIcg==
X-CSE-MsgGUID: naPdMwHmSCyVsNdL6cQC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="269737520"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:42:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:42:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:42:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM8eIIu3r9dLMmy1hg3rmUdqq6zZ7xxGFFplE2mhYFeGyBB9DYyBfSWTgAdZj3vAB5bhIxQWglCjISvE/cp6ldTWLGro86MOW3IhU8yozpCxulfP6tRPcctxBcsDvfprMEFv0RXrOcy382ArdBcAIa77ZucFDeCYNNw6qcRRYDPeu1jSDXq+9pN87shev8OqTWcY+S92AfcqHfMirI4917ehksSpe7TxrYHYrP7JAsDxgrIiiFiYY1KrvhYpvK2UJtzy6lMdcdErbuHuGb6u4vlYj+kaKlAhW3nfFN//r0C1HGE/3/ESCHEhDjZNbZsLWYkcrKRmYerglJp9VpwGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqeAwLdnBZgMRXYJr2EGnckXnbkP960uGVGUebcJ9uE=;
 b=aO5M+N5Y5N26El05z/R1T8nwFNhnSoumv6BMi4z1ih+zF6DnI8gjB60JDm0X2lAnYLafOYoqaFqhOUEQCV/GcDjuUtT/iHhq0HBV3xFSc+U/G37Qg2Nqjnr6wL5u2QTnCUWfsFwub6wiWwiUrTy5dVJFS2tgR1WFcofvxHKAYqi8nohzwr4kf5FYjndU4DP4bFdiztKwqZOZCbQBRdZsBldanJhmIbC3hUcv10OjVhedk4oGmvWLNh6zI2rWOttJN2y8cJbK2jsY5ZWCqxm1wXs5HbDe/3tiDtTHZ4p7Vvi3EesDmSoOAzz/vcS+o2fu/jdt4J+MRnuiG5zRId9FAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA2PR11MB5131.namprd11.prod.outlook.com
 (2603:10b6:806:116::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 06:42:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 06:42:37 +0000
Message-ID: <67f4794d-58c4-4b10-834f-eae0c4acdc18@intel.com>
Date: Thu, 27 Aug 2026 12:12:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V18 09/14] drm/xe/configfs: Add bad_page_reservation
 attribute
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-25-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260826135136.204044-25-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 093782c8-1902-486e-a8cd-08df04066232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QDlJW5CA1zVw7NsuKFzT2p290wQHAQlu5R1hBHPpB07HSvsY1vvQUMPfAnfWITEExsjqBTRWnh/1P+n/YZ92VonzEYQCCriOZpACV7dU4RCfzqclYvAWA47DhcxBtBexXOdZAzBu7rsTN+QipO2y+suKn17Xji45sj0RNhHRIscKoZh3RagE5adWwB8SJNn7qwgiPzKGQ5ckv41xViDMSUuPZScRbl1gmOF4AvldwSHAc7IaYHzw1mVEO3K2Sg/7GkNjsi+Dpa/jbkfPXr8/s4YOK0VRI04D5cHnqDdUxL9vKO9iU/vWTeBum79YZewycAylKNeuzQ52ouXubwxVSelZ+QwSwvFf4qd45sY1mmKgsMqxp8qNidIHGFm9XmQmiOEHBBFnhnSsLZRwN2khdMs82gv7kn/vADnwkLB2ZHxojid/5/ETLgl+DJAUmv3xCtxeOJ+eOVqZkl3rHF/8hoPgvSAs46RsWS+WChLWSOEJyVarJcyeIfaSYuMiUKpZdaxUhOw9ci0bBKmCBqe8p4/bV8u4FPhumJ3IB7uphj/pyKQFMMWufqZenL581A2PXUHp25fheGyZAf70rE+h/5YyOiFieQnEgFzRv6QPDxME7E49K8QQ4Pn7YflYjc07b+8AfJKZSx711SxS+3u82fMlIpwxYkcaXrFf7QwfL7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SENTWkFRYUFsSHJDSjhFekZYdmN5OU9aT3lIZVBpamV4SzBzQ3crZFVuNkZl?=
 =?utf-8?B?K2hSYWE2ZW15ZVQyYmcyN3lUWnlzeDJ1YjQzQ0g0ZDAyWCttdVo1QzdqREFo?=
 =?utf-8?B?cWUydGh6S2dTNHNubDJtQzc0SWlSNFU3eGFWNHREWm9YTkgzQkJJenV2ZFFy?=
 =?utf-8?B?UWtWQ1NkRDAxcjFOT3hMcGxxRDlGVFNDNDRrajNLd1VaeDVDVGR4WWdpTWJU?=
 =?utf-8?B?bkhnc3d3MzVFZ1BGMWZ1cUVtbDYycjhGU0RTZmxKVEdpM1NENUp0SjR3QTF0?=
 =?utf-8?B?MXIyOUN1TW1nelZKY1ZSNHM0Q1dLM205OEFma1JhdVNXYXBYTUlyZEdSMFZl?=
 =?utf-8?B?RmUzK2tzaG9XaWRUSVQxczhDVEtqbVNDQ1dQVTNkYkdlOUdHaVJnOEZQYVJU?=
 =?utf-8?B?aXdkVnlvWUFtQkJmREpqVlhVUjRPRVNEUkVBc1dEc3cvbk5tU3ZxS0s5MkFR?=
 =?utf-8?B?MWdLdzFUOUVsbjkyWW83em9RRWUxeThXenRHbVQvYVpwVXNUSk9aRElHVVBz?=
 =?utf-8?B?SkZSczBKSFJmY3VGdHNmaDlpTEc1N1VnZzRQcmZiTDZ2WjEvdUVCZFlrTUw4?=
 =?utf-8?B?VDlyZ0lwTkxScVpQZjhKUVMzU3ZaaEhvV1ZGb3lxM2ZIWkxLZlMwcmxpWlBC?=
 =?utf-8?B?RXlOR2NISHorRnJYb1lROGpsbXZRODNkbHprSGdkZGpoSUNhaWl2Nmhzeks4?=
 =?utf-8?B?RkNUd2ptSFAxN2k1anJ0bHh2M3Q3RXpsQTdjTW5DWmx3dVJUeENpR091b3l2?=
 =?utf-8?B?WGJONTVZYzQ1bFZRaFRjTkFBS1VOZFE2SGE2cTdFQ0VFbE1nQzdqdER6UFlF?=
 =?utf-8?B?RUkvbm4xNHVwM3U3VFdVMTVCUzBaNktXakxqVlN2bEZLL0J0VllMM1E2cDk5?=
 =?utf-8?B?Slk1REJHNWFETGw0d2VncFFpdTh1NHZWUnc1NFF2ZWVNVWJoUWNvczZ3ZW05?=
 =?utf-8?B?TDBOb3d4dUkrTk9lNGtjVlBzcWRXLzRQMEhod0NlUWVwTlkxVGxSNTBhWVFu?=
 =?utf-8?B?Q2hXMjhTS256VnM0aWNEajIzVE16aVQxSVNOeVBBb3VJc1NSVWlDYlZIdnI5?=
 =?utf-8?B?QzdMclVRdVR0NEpGSGZpbUNlZHlrMWYzcDBMNTJVT3lpeEtKcE5HcXhSWEpN?=
 =?utf-8?B?VlBpeHR1dU50VjR4RWpEL0hiOEJ2UTY0czY3UDY5eWNGN2tWSVVCUW8vUkZv?=
 =?utf-8?B?eU1PNHB0ZnE0eUVIWXAvYU1qZ3lRdDFjb0xaS1cwOW8xOUFYRGl4UjBGWTJi?=
 =?utf-8?B?SUJuQWlHdXhVNWs2akd2UVg1UHB5eTFUVEtrZVcvdnQ2MnoyTms5cEgvbFpw?=
 =?utf-8?B?SnVjNVJOdmFObkNLVm02NlJzaFVnZ0xKWHpCN0tRR1FWUmZkbHoxR0FCUHZj?=
 =?utf-8?B?VjZYbDdiRjhVZGMyR2JPTTBod21xdVcvQ0ZlUVJNaE1ibmtRTm5RbnNoOGJz?=
 =?utf-8?B?dnNHOEMyMEU1bU1BbzJ5dXJHcE01T0s0dGE2cWVXU245QXZrK0UvNzFkbXJi?=
 =?utf-8?B?L0xmbFBhMmlOK3BsOWdVR2hXMG5rNWE3OU9xSC9CSXdwekQ5NStaTWRxZzVT?=
 =?utf-8?B?RU8weE9DRi9xci9XVGduYlhwSm1acWFTTXBTeUgzODhuWUlMUW1XdWpsdWZx?=
 =?utf-8?B?eUpUaFBWZDFVOSsrQlNXN3kxNGxTUU1YVDgxeVlLZnpNTDRQSWUwNGdUVklv?=
 =?utf-8?B?K25VTHYxZ0RYTUNzNEZjWWtVNDVmRDNyQW1KZXhTZmtXbXg5cXhGbDYxdU51?=
 =?utf-8?B?OXVXZm5LYWFRak5XelJHZUdUaXNRVWhudDhzTWI0bjZhRkFzeStNU3FlMW1w?=
 =?utf-8?B?d1NlWldTbUNJbXIwaUdBSnl2b0ZnNzBHVCs4RktJQkVyeExrR0hrUk52SEtr?=
 =?utf-8?B?MHFCWFh5ZGZIU241UkJUUEE3UUJacW42VmlJdWxuWmZoNlRlYzdCekpjMmk0?=
 =?utf-8?B?cjFtcVBuY2ZqaEd1azN3TVZCVDUxSDZOd1JuT3BFMERhYkZNbGxLbVFhR29i?=
 =?utf-8?B?dWtYSWh2UDd3dnJ6VEsyNXNIWTdrdEU0eWZ5TDJWcDVJQzR4WlpNOGQzY1BX?=
 =?utf-8?B?eGhzR0RRVEw3blVVTm11VTdrcTJxbXVGOG5XeDRLT29TVGlFQURRSWZKUkhx?=
 =?utf-8?B?MU9lZGZ0em4yU095NkVQZXFnVGE4SWI2QXlvOVFUd2cvM0JPK1dlNFZ4WTZP?=
 =?utf-8?B?bk5Pa2ROQnp1bGIvdmRrZUVBZ1ZUZUEvMjJSUUdwbXVzUU96NnNmd0x6dE04?=
 =?utf-8?B?QkJaVEREN01zZXJ0UFhrempKdmdiblJlUWJsaDB4aGE1UElVMWJGa2tUdUhS?=
 =?utf-8?B?cDM4MURvaHB1eDRKc0M0MXV2U2lGektBVWt3Y2dtMWR5QzFIbUZxejlnUXo4?=
 =?utf-8?Q?0OcfJMUo9doXz8kk=3D?=
X-Exchange-RoutingPolicyChecked: b/xvczp1fnL82/gLVZKen6ZcCSKnt72xlyD6xDrPxOIqjXVng6Sb+DvqVZ+p/9aW1XVdktZbUJhRT8Rws/AzrP8Mr2MgjyBAQWgYh4qzi9TZD4DughcWF79B1BQgs+I5OaFyK4gSXBSMtSstfP3aoxW5PAMOeyhbmzO/MJErCF3UCUlqMs4QEq17NPrgO/w5qsk8oJg/6x7fllY5Fkloum4T/LuEt+gh3sDu0ni1zG+Id1EEfwVB3pVjYgImVOcCODRL2QDFEmK2dGUQP8uzRCVBhVTvD8Hu4o1PRWy7anKsim/Imnmtr5R9xLZUiEpHpLzXyZDXV69QI6UMh7UsqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 093782c8-1902-486e-a8cd-08df04066232
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:42:37.7131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCp5tGVJz1liNmbeSjvA3PjvghNNtIdi2l8cYKYOC7bxqeB7Vh95k0ehk40rCtXEm2khKWj7uw5VRC/W8cA+p5g42dYHFaxPxzm5H+jxvlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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



On 26-08-2026 19:21, Tejas Upadhyay wrote:
> Add a new configfs attribute 'bad_page_reservation' to control how bad
> VRAM pages are handled:
>    0 - Logging only (report in dmesg, no offlining)
>    1 - Offlining (default)
> 
> The attribute can only be set before binding to the device and defaults
> to true (offlining enabled). This gives administrators control over
> whether corrupted VRAM pages detected by hardware (e.g., ECC errors)
> are actively offlined or only logged.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 67 +++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_configfs.h |  2 +
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..80c4c5f66e4c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -61,7 +61,8 @@
>    *	    ├── survivability_mode
>    *	    ├── gt_types_allowed
>    *	    ├── engines_allowed
> - *	    └── enable_psmi
> + *          ├── enable_psmi
> + *          └── bad_page_reservation
>    *
>    * After configuring the attributes as per next section, the device can be
>    * probed with::
> @@ -159,6 +160,19 @@
>    *
>    * This attribute can only be set before binding to the device.
>    *
> + * Bad pages reservation:
> + * ---------------------
> + *
> + * Controls how bad VRAM pages are handled:
> + *  0 - Logging only (report in dmesg, no offlining)
> + *  1 - Offlining (default)
> + *
> + *  Example to disable offlining::
> + *
> + *      # echo 0 > /sys/kernel/config/xe/0000:03:00.0/bad_page_reservation
> + *
> + * This attribute can only be set before binding to the device.
> + *
>    * Context restore BB
>    * ------------------
>    *
> @@ -275,6 +289,7 @@ struct xe_config_group_device {
>   		bool survivability_mode;
>   		bool enable_psmi;
>   		bool enable_multi_queue;
> +		bool bad_page_reservation;
>   		struct {
>   			unsigned int max_vfs;
>   			bool admin_only_pf;
> @@ -295,6 +310,7 @@ static const struct xe_config_device device_defaults = {
>   	.survivability_mode = false,
>   	.enable_psmi = false,
>   	.enable_multi_queue = true,
> +	.bad_page_reservation = true,
>   	.sriov = {
>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -616,6 +632,32 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
>   	return len;
>   }
>   
> +static ssize_t bad_page_reservation_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->bad_page_reservation);
> +}
> +
> +static ssize_t bad_page_reservation_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.bad_page_reservation = val;
> +
> +	return len;
> +}
> +

Nit: would have preferred bad_page_reservation_store as static and being 
called in xe_drm_ras.c in next patch, but looks like 
to_xe_config_group_device being static will cause issue.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   static bool wa_bb_read_advance(bool dereference, char **p,
>   			       const char *append, size_t len,
>   			       size_t *max_size)
> @@ -855,6 +897,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>   CONFIGFS_ATTR(, enable_multi_queue);
>   CONFIGFS_ATTR(, enable_psmi);
> +CONFIGFS_ATTR(, bad_page_reservation);
>   CONFIGFS_ATTR(, engines_allowed);
>   CONFIGFS_ATTR(, gt_types_allowed);
>   CONFIGFS_ATTR(, survivability_mode);
> @@ -864,6 +907,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>   	&attr_ctx_restore_post_bb,
>   	&attr_enable_multi_queue,
>   	&attr_enable_psmi,
> +	&attr_bad_page_reservation,
>   	&attr_engines_allowed,
>   	&attr_gt_types_allowed,
>   	&attr_survivability_mode,
> @@ -1142,6 +1186,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>   	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>   	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>   	PRI_CUSTOM_ATTR("%d", enable_psmi);
> +	PRI_CUSTOM_ATTR("%d", bad_page_reservation);
>   	PRI_CUSTOM_ATTR("%d", survivability_mode);
>   	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>   
> @@ -1290,6 +1335,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
>   	return ret;
>   }
>   
> +/**
> + * xe_configfs_get_bad_page_reservation - get configfs bad_page_reservation setting
> + * @pdev: pci device
> + *
> + * Return: bad_page_reservation setting in configfs
> + */
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return device_defaults.bad_page_reservation;
> +
> +	ret = dev->config.bad_page_reservation;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>    * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..7405cc5f3207 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>   bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev);
>   u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   				       enum xe_engine_class class,
>   				       const u32 **cs);
> @@ -44,6 +45,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>   static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline bool xe_configfs_get_bad_page_reservation(struct pci_dev *pdev) { return true; }
>   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>   						     enum xe_engine_class class,
>   						     const u32 **cs) { return 0; }

