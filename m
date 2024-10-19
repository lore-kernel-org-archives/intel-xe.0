Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C526D3C900
	for <intel-xe@archiver.kernel.org>; Sat, 19 Oct 2024 08:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F016A10E23B;
	Sat, 19 Oct 2024 08:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr6x0sQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D552B10E23B
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Oct 2024 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729326622; x=1760862622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=webqIfwYbQOlWr3XTIxvPd2k0F5VmcyiBpVYod2FUeg=;
 b=Hr6x0sQbfRd3ncFBDdrCWTFjcbtbv7gNIg/WqDTX8MeDvz0MD+fInlhG
 t+z+8ei1VT/4V0eqdHTtipDymHOVJWtzH+DOD0Mbbtp+J1uiVtMLhComl
 ZqWPi+AfD+TSWRO7WOTUk8w+ljYCPaXrQvk5DvJKsvfeVmm03e/Xu0GDr
 aIPf9qcxoFHl2L4pzZPxoTNXXm7anWWMf4xicP5SvgAf/DGtW1k/4zI/Y
 rKKtKBOjskpLxFPpmxWS5fYJGNoKbr6U+gOZPPLPmd7Yp2Ftf+9yd2QdL
 eaTB0XFEHT2b8dXDd6d21t8dtdpDUYLw3w61nBYX3eAk0n11njbuFH6pJ A==;
X-CSE-ConnectionGUID: Lx7QCQn/Rfet4Wl1AtKgGg==
X-CSE-MsgGUID: Z91/z/6iRAaW0o55rJhnQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="32781014"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; d="scan'208";a="32781014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 01:30:21 -0700
X-CSE-ConnectionGUID: lW1f09nASvmmy2IBamNDDg==
X-CSE-MsgGUID: Dw9f2A9oSdCzemNkWpYiKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; d="scan'208";a="78990655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2024 01:30:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 19 Oct 2024 01:30:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 19 Oct 2024 01:30:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 19 Oct 2024 01:30:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHYkAnMIxtDBAEZRtBdTAnQV/btSfYdVU/mK1SZvsPCHbA0BLKMe3uB2DB4/+0BW/ZP4GtzVBuR1FsxEGGtY03KT6E3A92MHMmiN180+OXXNFFt8GFQb98NgQTDroNT8cyxobwPrKnklPiIzFvesATtrMorq+HDLT9xAOPgCeQ/AGrXdHs7HTLYBjaqZtNIlhW3hexkmrQAPMasId2i6xo37vqZ1yxX07ZIZNn0fp8/EdirFmqX1ojHf7hu9igvzPRCPpXdOXY3n29jCMYkNzMWLMLEIudnRuEaXsWQiD2tnAT9eYTvegcMdfP/QOUmCXDgowN+7tbYB9QV/PiDT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=webqIfwYbQOlWr3XTIxvPd2k0F5VmcyiBpVYod2FUeg=;
 b=yj84bosjY4++KeHm0hAtmRLViteFrYiez+vGIN9aLovrkV9yFbHliz8jtbkV3peB/F3Z/X8rMGWQ2UDvqQ8ih74HaiZJnwAwiQg4dFff2kPKJUyUipAmxYyyM9dmMJaqbaYtJLFYLWUH4Kpwz7dhXRi0/5DA4KdXlu2d4dNN3Klr8y/wo6hCIBqjTBuV2DX+hy2qC1l2IiSypWpd93Th2sFXWN9TPxl/iIHCzVx0RzXz9n3Dd6qwMJgwF1exUxxRjhh6a7REUrAV+MWHh/LsTB6yIztTkHmgZpCYmegiEnM+B3zP0dZqdxGpsomI6BJBlSbgSGFRfvr6FVamDznSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Sat, 19 Oct
 2024 08:30:12 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.024; Sat, 19 Oct 2024
 08:30:12 +0000
Message-ID: <d95c055b-fdfb-452a-9065-9a8d289a103c@intel.com>
Date: Sat, 19 Oct 2024 10:30:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Signal ufence immediately when possible
To: Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241018124710.1536948-1-nirmoy.das@intel.com>
 <2ef62119-1b98-4e5f-8218-0c99b4dbce36@intel.com>
 <52c18f08-0d8a-4419-ab36-9f072c54f9cf@intel.com>
 <9fb1e3a2-c4ab-4520-996f-b5d20f634093@intel.com>
 <cdddde09-428b-45b5-a058-3a7a8b80bf77@intel.com>
 <ZxKJ0FRINGiHDblY@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZxKJ0FRINGiHDblY@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0026.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: a229e44e-49c9-4089-00c1-08dcf0183ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW0wMENGejFFMGNyK3VBRjkzMUkxVjZQZm1CVnJNME1CaXc1cnJBVkhTcTRK?=
 =?utf-8?B?Q0pXNjRsbGNBTjZ6M1lnMTlrMVEwSjdlK3BxK09pZllBTTE5N2lRcHQyK3I5?=
 =?utf-8?B?aVBmcVlpK3VBMlpZeDZnZllZcUhCZE9ZUi90Ykd3d2tQUktiNFFFVDl1QWdo?=
 =?utf-8?B?MEdKSGsxdy9oNjhYRU43OSt4eWZjdkYxTzNNKzBnM0laN1p0Y3YzSDRoSlBL?=
 =?utf-8?B?VFgwL1VabXIxZ0JDT0FNVjV2d0ZGUnczRTh1c1RtODlWd1RtNTdTakxCVy9I?=
 =?utf-8?B?QVkvU3ROT0U5Mm8vVmttNXBKajJpUWlmandiNmNNSkNDNi82cVJqWW9DL0E5?=
 =?utf-8?B?RDZsdm9YeTNhaFIzTWlWbkt3OUNBUGdXbmlrcFQxWDBsa1RKbDVXeVhEaktT?=
 =?utf-8?B?NXhjRlNyYW9nWjlBQmdhZzVicXl5NkhvcVZ4ZVUyVTNJMkRWYmI3UU5pYU5U?=
 =?utf-8?B?S1B6bTVEU1lVYUNFc2xGNDd4ZFh1VElHMFJCcWpXcXpOQy9XZDZJbUJkN0lr?=
 =?utf-8?B?Z2RJQWZZMUhpU1drWWxsTi9yenF1V3FrM1llQngyVWtzWDJURTNYbm84VUp4?=
 =?utf-8?B?elJiZFdaOWVNZEphaEtESVlqVitqWWhkSS9xenNiSk96UDhZV0l3ZDRkMmp5?=
 =?utf-8?B?Q3FPNDlGSTNRdjlpeUhKVkZ4UU1TaVp2TDJSUkptYTU5dGF3cUQ4S3JINytF?=
 =?utf-8?B?ZVpVVHcwa3A1RDVONGZ6eEFyaUhKUDQrWEdhdTVkQjVpRitDVUFPY1FQZTRl?=
 =?utf-8?B?NEMwdVJVNVhSR00yK0g1bVZZd2R1bWxESHQyNW43VG1xd2tObjlYSjRKaFRZ?=
 =?utf-8?B?UlQ4NTBpbGRiWUtVMXRTVjFWMlRrbjhTOXdNS3hqWGZneVVwYi9MMHkzUDBJ?=
 =?utf-8?B?SUxySThDemhRWFZlSVQ2TnZwTnBzZUpIVzRQUUZtR0JRSldYQjF6L1pmR3Jm?=
 =?utf-8?B?YmFHUmk2QjdTSlh5MzR4bWJENW5HV2g3UmFlbVh6WHhiZkFIc2xyR0pJS2tv?=
 =?utf-8?B?bHd0SHUvbXlXb2NEZW9UUWRGaEUvakFoSmVhbVhud3FOdTlDL1B0WFB5Rm9F?=
 =?utf-8?B?RUJad0RYTDMvaUVJSnN1a28wMGJNSGhXQzR0OXJUWG5FYVUxdDBnOS90MVN0?=
 =?utf-8?B?bVdKc2hDbXhnS2lvRjhiaFluT3pkZEFVRWFWSzlvNTZEanVxWUk0a2g4MkVH?=
 =?utf-8?B?MmltbmJPVEFpWDRDak5MMmFzZUxXY2p1Q2NRbFVUL0tQWmxLQ2RRcGNpaHNJ?=
 =?utf-8?B?YmJuN2dhTTc2cFVJTGtGT25YQlZyM0xXMjZDMUE0TzFFVnNNaGRRNlNucmN4?=
 =?utf-8?B?RzdYVnluaElEY3ZCSEpCWUp0UnRPckJKcURDNTNyVVpDTFhtWDhnYklsQlk2?=
 =?utf-8?B?d3lnSjdSK1kwLy8yU1Y3cXllSWVpYVNqaE4xTHNtSnM2azVlTGovMEhpRDlZ?=
 =?utf-8?B?Wmd3SkdBUlhQVnVkMEtQb2IzenBiMDdKTE5mdFA2by9iaFE1bm5JNE9UckNK?=
 =?utf-8?B?RzZmMFN5WTN6VUlzOXByT0oxQU1zYjR0dlBmTVM5OVNCbFBNUGVSaVNBcUFD?=
 =?utf-8?B?Rnl6cUNpQW1UN1NycFczKzFyNjlZYXRXUEJmS2VERmtkVm1XNVlOZ0ZsSndu?=
 =?utf-8?B?MnMxTFNMOUJCdzBZU3UvZ0VOVUwzMzd2d05pRDhoOTZOQ1VGN0RtVlg5dHdH?=
 =?utf-8?B?OEdLYjB1bnhRWVJaYTNua281UnEwVURyRklOWDN2bGZmYkFNNUh3YzNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2Nsb0ZtTEdGeS9wRFd5anVsRjIwcjZUR2JNWXo0U3NqSXZtU3VDOUtyMFk0?=
 =?utf-8?B?K0J6WUdMbU5qTHZ6c2hEcmlpZlc2L0tpT1lMQjNBaXNMMVV3aUlEWnJQNFFR?=
 =?utf-8?B?MldqejFHYWtBWmNlZ2VSc0kvZ2VwZ0VPRkpjT0x1REZBTDJkL2NVSFdkVG0r?=
 =?utf-8?B?MGswWEtvZjVvYmkzaERxdU1LakszMVEzNzB6aWFFb3hKTWtwMThHSzBTM3dZ?=
 =?utf-8?B?RzZ4OFRsWHV4UUx0cWhQVkpzU1RvVGhlSlUxaDRIYUZPUTJ0dWRhbnJDOGZy?=
 =?utf-8?B?a1I3aUh2bEdFMnVkL1VzSzZNZUdyTzdkVHZOcGJZRVAvQXZ5Q3JRdVZLa0p2?=
 =?utf-8?B?and1b2d6Tk1VeWlodGxpQ3Rwck9TeHJneDBxYWV2ZWtpZUxlRmUwMFRrTVBm?=
 =?utf-8?B?aU9JTUxkNlp0TlJXK2pGQnZWcEo0alVXNlh5QVQrMGRHZ1JtYXhTOXVBVHor?=
 =?utf-8?B?TWVqa0hHT2hKS1ZlVk43d1ZzUkFTNjFTZUVBbEdkMUtJcHI4WHhscS85WXVt?=
 =?utf-8?B?L0twd3ZNKzlFdTAwdHd5QW96U0VibTFlR3JRVWQ1YUFMVjkzaTQvZWdSQTBF?=
 =?utf-8?B?VVdVYzhHZTFBUXJlMFVYelRMMWdBaTBJMEJKTzBhcHh3dnU5VWRhSTk0Yjhz?=
 =?utf-8?B?a1ByQms1UHNqdHhJZkVyd1djWHZVM3RmM3BpWUM3TjFpNVYzd1BWcEFtNExQ?=
 =?utf-8?B?UTMrUGsyS3N3cG1vbHZJKzExNHpjSTlFdUVydms1eHpxak1PSGJhTDB4MG1r?=
 =?utf-8?B?ZUFIRjZoOUp5R2Y1Rk5LSlljdWU5RkhzUlpuUkRWRW93RGY3dFc5SkxBRnZD?=
 =?utf-8?B?NnA3QjBSWW9VamlvU3l6a0dUMzMxRFFFaWNVWTFONG5oNnRuQSs5cXkxLzJl?=
 =?utf-8?B?YUE1a1NWeFhBb1hCYlUrUHlVVU82NlRSV1I2Q1ZVOTg3bkRMYnExY1puQ2lV?=
 =?utf-8?B?aC8raE9ndk8zYUVhT2VHVkRxSVNST3pCbXhCMjRobzdzMXNvRThQbzdNcUJh?=
 =?utf-8?B?a09hUU1ZL0xxVS9TL0QyODhXcFJVTGxHcFlFUW1udjhqMm9TRG56cU9JbHpK?=
 =?utf-8?B?RG5sM3pKY2F5T2Y4QjVqNGI5eE9YdG5Ha29rK3hmaUZNTkpaaFA5N2NLTWpm?=
 =?utf-8?B?QXpIOTVsNHVDQy8zc2JEYXAzU1YrUUo0OTl3NndzekhDZTl4bDZnUTFaMmE4?=
 =?utf-8?B?ZS9rQTBrUkhXZjlTN0kwenZyMlNzVlhPMjhsN3hHOFF1dkd4dG5rTjFaa3Q5?=
 =?utf-8?B?OGt4d09nQ3VwWlQ4YUVUTWUyT29vNXZESU4vWkdsVVlrcEUzd1B6Q21YKzNo?=
 =?utf-8?B?Tjh6RGE1NWluR1ZJRmNQOEdGaHBhRm1lSVRQY2xnTldlZXhGSnh0a0pWWE1i?=
 =?utf-8?B?RGtFRHZOODFGVSt5bk1wMXpxTi9PeFpURW55dGRnd0wydUVlUjhwYytIaHgv?=
 =?utf-8?B?WlowRHppNC9HczRWVzRoMHBlSm55ZkhheHRHS2VLVFVkNVgwMFN5Z2NrZ2Ey?=
 =?utf-8?B?d2JOejY2a0FjNWRZVUZLMmlvc21iZHZCRTQ2dlVoL1hxWGZGQS9jOC82UTBI?=
 =?utf-8?B?Y29Hd2plVUtBS3FMU0FuMnkvVklOSEhSMVg4eTAwQTZmbHdVc3BHeFlRaUtS?=
 =?utf-8?B?T1hqdWtBaWtpMWp5WE40VGllMU85dXNXOUhyNlhNR21LY21YK2ZBR1dNQUZI?=
 =?utf-8?B?WDFKRGNKQmlpWkk3bG5NeVFwNjVQTGFBN3VHRTl4NDAxd1VYTXREV1VaRW9G?=
 =?utf-8?B?MXZoS2ZPZDRPQlZ0RVdScjVPNmhlRHJzajg1eXpNMWo5VUovdXJJUWhvczdF?=
 =?utf-8?B?S3I1elAyU3Iwakk3QW4xYURoakV6cEtBbnV6T1JEZW9nTlBZNUtaeGxLa3lj?=
 =?utf-8?B?M1A1TUgwcXdGclRHTDg2Qm5uTlZsc2l1TFdFK1JWTUNPdzJVUEcwVXBLT0J4?=
 =?utf-8?B?cDR0QzdQS0NZZy91MmhjY0lPN01CZE9wYmlMbjRuS0hGSjZxY0Z6dVdPLzZs?=
 =?utf-8?B?RFlCRFRHZEZFamxJRGpEdTNsY3JrbnF1c3ovRS9sL2pRblFSYjlHSGFyTlpk?=
 =?utf-8?B?ZnROVHpVeW1hVm95NkFDa2J0UzdNQ3NzUnFVd0VINFVkeElubFoxZ05YeHF2?=
 =?utf-8?Q?ACnW17NO7AKkMjIKMw6LRqKZK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a229e44e-49c9-4089-00c1-08dcf0183ff2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2024 08:30:12.5318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZ3AMdkQWV1nCf1I3/JbC7060jCAcgvlYozDTH3x7khQ8U+99XIao3mONTBpSEKgdeGL4tKFiAQbCLRs5c1ZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
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


On 10/18/2024 6:16 PM, Matthew Brost wrote:
> On Fri, Oct 18, 2024 at 05:29:09PM +0200, Nirmoy Das wrote:
>> On 10/18/2024 4:53 PM, Matthew Auld wrote:
>>> On 18/10/2024 15:40, Nirmoy Das wrote:
>>>> On 10/18/2024 4:23 PM, Matthew Auld wrote:
>>>>> On 18/10/2024 13:47, Nirmoy Das wrote:
>>>>>> If the backing fence is signaled then signal ufence immediately.
>>>>>> This should reduce load from the xe ordered_wq and also won't block
>>>>>> signaling a ufence which doesn't require any serialization.
>>>>>>
>>>>>> v2: fix system_wq typo
>>>>>> v3: signal immediately instead of queuing in system_wq (Matt B)
>>>>>>
>>>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>> gc: Matthew Brost <matthew.brost@intel.com>
>>>>> s/gc/Cc
>>>>>
>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_sync.c | 15 +++++++++++----
>>>>>>    1 file changed, 11 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>>>>> index c6cf227ead40..069c1e4ebea5 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>>>>> @@ -72,10 +72,8 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>>>>>        return ufence;
>>>>>>    }
>>>>>>    -static void user_fence_worker(struct work_struct *w)
>>>>>> +static void signal_user_fence(struct xe_user_fence *ufence)
>>>>>>    {
>>>>>> -    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>>>>>> -
>>>>>>        if (mmget_not_zero(ufence->mm)) {
>>>>>>            kthread_use_mm(ufence->mm);
>>>>>>            if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
>>>>> This can end up in a CPU fault handler? There might be some locking issues if caller is say holding dma-resv. For example the caller in xe_exec which is holding dma-resv. If it can indeed hit this path, then we might get some splats/deadlocks, I think.
>>>>
>>>> What is the connection between writting into ufence addr  and dma-resv  ? Trying to understand this locking problem.
>>> Basically the user can have the ufence be an mmap address from a BO, so it can basically hit xe_gem_fault() here. The mmap lock should already be tainted with dma-resv, so might_fault() should complain.
>>
>> I see what you mean, haven't thought about it.
>>
> Thanks for catching this, forgot this was one of points of worker - to
> avoid this locking inversion.
>
> Nirmoy while you are here, can you add a comment indicating this so we
> don't forget again?
Added in v4.
>
>>>>
>>>> it looks like I have to use a worker anyway to do kthread_use_mm(), https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140169v1/bat-atsm-2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
>>> Yes, exactly that just with might_fault() in copy_to_user. Good to see that CI caught this. From the logs we can also see the exact dma-resv splat as per above:
>> Back to the previous rev but with the bool as suggested by Matt B.

I meant without the bool.


>>
> Fine with that. Sorry for the noise.

No problem at all.


Thanks,

Nirmoy

>
> Matt
>
>> Thanks,
>>
>> Nirmoy
>>
>>
>>> 4> [233.110447] xe_exec_balance/3613 is trying to acquire lock:
>>> <4> [233.110457] ff11000100085998 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x43/0x90
>>> <4> [233.110481]
>>> but task is already holding lock:
>>> <4> [233.110491] ff110001231a1da0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_exec_lock_obj+0x88/0x2b0 [drm_exec]
>>> <4> [233.110517]
>>> which lock already depends on the new lock.
>>> <4> [233.110530]
>>> the existing dependency chain (in reverse order) is:
>>> <4> [233.110540]
>>> -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
>>> <4> [233.110558]        __ww_mutex_lock.constprop.0+0xe1/0x14d0
>>> <4> [233.110574]        ww_mutex_lock+0x3c/0xa0
>>> <4> [233.110586]        dma_resv_lockdep+0x1a4/0x340
>>> <4> [233.110599]        do_one_initcall+0x76/0x3e0
>>> <4> [233.110615]        kernel_init_freeable+0x3dc/0x690
>>> <4> [233.110632]        kernel_init+0x1b/0x200
>>> <4> [233.110645]        ret_from_fork+0x3a/0x60
>>> <4> [233.110658]        ret_from_fork_asm+0x1a/0x30
>>> <4> [233.110671]
>>> -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
>>> <4> [233.110689]        dma_resv_lockdep+0x180/0x340
>>> <4> [233.110699]        do_one_initcall+0x76/0x3e0
>>> <4> [233.110713]        kernel_init_freeable+0x3dc/0x690
>>> <4> [233.110728]        kernel_init+0x1b/0x200
>>> <4> [233.110740]        ret_from_fork+0x3a/0x60
>>> <4> [233.110752]        ret_from_fork_asm+0x1a/0x30
>>> <4> [233.110764]
>>> -> #0 (&mm->mmap_lock){++++}-{3:3}:
>>> <4> [233.110780]        __lock_acquire+0x1623/0x2800
>>> <4> [233.110794]        lock_acquire+0xc5/0x2f0
>>> <4> [233.110807]        __might_fault+0x63/0x90
>>> <4> [233.110818]        _copy_to_user+0x23/0x70
>>> <4> [233.110830]        signal_user_fence+0x46/0xd0 [xe]
>>> <4> [233.111108]        xe_sync_entry_signal+0x14e/0x1b0 [xe]
>>> <4> [233.111366]        vm_bind_ioctl_ops_execute+0x3f8/0x910 [xe]
>>> <4> [233.111665]        xe_vm_bind_ioctl+0x1623/0x22a0 [xe]
>>> <4> [233.111951]        drm_ioctl_kernel+0xb1/0x120 [drm]
>>> <4> [233.112052]        drm_ioctl+0x2e8/0x5a0 [drm]
>>> <4> [233.112140]        xe_drm_ioctl+0x53/0x80 [xe]
>>> <4> [233.112331]        __x64_sys_ioctl+0x95/0xd0
>>> <4> [233.112342]        x64_sys_call+0x1089/0x2060
>>> <4> [233.112355]        do_syscall_64+0x87/0x140
>>> <4> [233.112365]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> <4> [233.112380]
>>>
>>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>>> @@ -89,6 +87,14 @@ static void user_fence_worker(struct work_struct *w)
>>>>>>        user_fence_put(ufence);
>>>>>>    }
>>>>>>    +static void user_fence_worker(struct work_struct *w)
>>>>>> +{
>>>>>> +    struct xe_user_fence *ufence = container_of(w, struct xe_user_fence,
>>>>>> +                            worker);
>>>>>> +
>>>>>> +    signal_user_fence(ufence);
>>>>>> +}
>>>>>> +
>>>>>>    static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>>>>>>    {
>>>>>>        INIT_WORK(&ufence->worker, user_fence_worker);
>>>>>> @@ -236,7 +242,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>>>>>            err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>>>>>                             user_fence_cb);
>>>>>>            if (err == -ENOENT) {
>>>>>> -            kick_ufence(sync->ufence, fence);
>>>>>> +            /* signal the ufence immediately if fence is already signalled */
>>>>>> +            signal_user_fence(sync->ufence);
>>>>>>            } else if (err) {
>>>>>>                XE_WARN_ON("failed to add user fence");
>>>>>>                user_fence_put(sync->ufence);
