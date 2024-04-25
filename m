Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078E3C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 19:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B618B11A7E0;
	Thu, 25 Apr 2024 19:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITU/TVkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5798411A7E2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 19:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714072290; x=1745608290;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWOVUi9zQYAAGa2kRphjlPL+14BTuHz49JezQgC3gwk=;
 b=ITU/TVkjOCy7v29GXCJWB2mxg5MMXVr3fO7r+oEM6S6eRuCGHXbceAOM
 DCuD3AHlzff/N26/F5BI59+skH/pYtArlu7Bkza0AgzqPdWbA/zmqK9RV
 q0V7Y0jUo0IrS9sAUnBeEjVeHu+mgoOmCWa0ncTq5EZSbEj/xoyiCwFis
 ExQIcSQIkkA7KU19fXr/1DQzkA9yX4xTOsiKpeYIz2vsyi05PY75itqYE
 dvsk165K6/zmOew31lHZhsHolHeDCGCVOSSk/TCcMZbqNxwO4gGUAJM2o
 LiwsjPHyNwSYKtAXSO9SVoF9Lq8cWnccspoxXKIkOd4plwiCVSL2f7+3I g==;
X-CSE-ConnectionGUID: GudwpZGtT/ulw3heiL4tcA==
X-CSE-MsgGUID: AwuulT08QLebK6/5e2AMHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9651939"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9651939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:11:29 -0700
X-CSE-ConnectionGUID: hCJwABH4S8yx/8KSHrISyA==
X-CSE-MsgGUID: QBVNt9+eQAePdYa21+bVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56112307"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 12:11:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 12:11:28 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 12:11:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 12:11:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 12:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud1Fikzqle5LLm8GCW4M7JlEwS6dYb3NHzdWOYaZUla/m+GgvZr3TpEWwo5JdkPClkpLQtkonz8kGR1dCevj6ercTD/JOzCy1MajPFZ0R1VsmddzVCQK6qeblY8/J0x9kKJGc3ZYjtgFl/H5r2lfAa+LPduN8wYV4+eAONyk3Hk/J38McxL7AyZaCztZ1Ct3vlxI7V2/0YvRn/ncXIsrWV9HjpSOOSSbojK00XQ6AFvakGOU+EWUDJdysWEFkk81ptusJ9lfPoOVsYo4VLjjmHR+vzrUU3xYeSLk55SPgYtdZhUVurPPDOctP4tmsgitSAG9w4xSxnlhmEtlR6TtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92TuFXFy4vSj+yTVHDDE+F4mwh8s4hLd3s7S7FHzjzI=;
 b=nYxbMgtMSJQ/qO531RwHF2OyxZB75R1/Np6DLekBqVGmsp48jmGXR90fTOb7O4kmA6ArzVs0skCUZemtuK5ZRFD8DAW8To2eGd1LKf8SdXbkyw4ZHxgt9pEmbfJDLISHnT3Ef6LCI/8RdFYoCF2D6yJ05s+omqd8/s4pUmHGbPyPPGn4WpHQM+zEZm1q2f17hUJwRSkULKNnzY+QKWauYKAReO9cLZdsY2133V3SYpem9OOk8PZRUYEDpB7m9S2WwzAGXu766iPJ8axR3hWHF/NLSnmE2u1QXAg9Gt4a5oCSqY9Gql46lmppK9HgrdrgjKgkteO60cx8zMlcZZ14QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB7043.namprd11.prod.outlook.com (2603:10b6:806:29a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.21; Thu, 25 Apr 2024 19:11:26 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 19:11:25 +0000
Message-ID: <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
Date: Thu, 25 Apr 2024 21:11:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB3PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:8:1::36)
 To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB7043:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7ee93c-fef5-4128-c2a2-08dc655b80bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVArekg4TGl0Nm1vc2JqTXlaVFk4aHRZOXU3eG9RSE5OZm55ckNiekJZbm0x?=
 =?utf-8?B?eHUremR1NW9SRC9qckw5ZTRsd1hhNkZpSkpiZHlTNFFLdGxYWjVFMm1KanNN?=
 =?utf-8?B?RHBXNFlaYk1jWExqQkt5NU5MRnl4SU5VNFZYaDJ6MnlWc2RKMGNMMDZ4empj?=
 =?utf-8?B?Mno0UEdSSkR1MGVEVGltdGpLcFoyeVFNbTB0MFhzekZaYjhETU5qbHVndndv?=
 =?utf-8?B?OFVxRnJCQ1FqaGpOSDRRNmt5dFV5TUJxbFZWOFd4UzM0WFFicFRoM1BKcjd6?=
 =?utf-8?B?TUh2Y1kyRE9USHNvSTVNWEFIZnJZc1pPeHFDbjFFMENlRC81YzdyeDBoaExo?=
 =?utf-8?B?WDYxRFNzY1hQZnRqNEtNSEFxOGJ6ZWRqTXcrMFdSVWNrUE9TTGpLd21vSGFQ?=
 =?utf-8?B?UGVRS25Zc292dnNGVlJZRTZNUXErS3ViWFhUdG5hRGkxd1l3N3lRdnhETFYr?=
 =?utf-8?B?N29temZHWDN4bEJJNkZqTkF6Qjk1VUdLRUJNUDF4SWpwelNONDZQeXk2Yy9x?=
 =?utf-8?B?OFFoT0hVNENNY0JPV0VIMHNLVXRPWnF1alpmc1g1RzlWaWwwUWtVZmt2RENq?=
 =?utf-8?B?VE1XbEJoVW9HNmk0NVFWcWp3TUhoK0QvR0lJRTNDdWlvTGJMeVdhd3JoOGVm?=
 =?utf-8?B?OWp5a01hYkhqS3NGWlFPVGNXNjk5QS85Z1hrUGt1c0hKL2FOcldwekI2WUlY?=
 =?utf-8?B?UGNPc2psbzZMRDgrVGkzZ0NYczVZZFVuOXZGdThmODhUQit0eklNTkRCOXUz?=
 =?utf-8?B?N2RneEhCZDJTMFh5UEt2ZGhKMjBhMTg2aUtlb3I0KzBHSHBWd3I3RE5NVU83?=
 =?utf-8?B?eU0vb3RwZm1GZXFXcmhjd2hwdzkyd3kxZUgvMU0rMDhPanVkU1l2M0hWT0V2?=
 =?utf-8?B?Z0VvM1VrYXNrQkdhdjVwbkdlYW44UWRTVmoxSW43azUxcHp4bzFtZHlER0xX?=
 =?utf-8?B?VnNEVTBWc2pFZ09NdzJWN2VPZEdrWnZWU05nMThWSGVTbXBNWENYc1BqL0Ft?=
 =?utf-8?B?NEo0L01Od2p4akVhdy9TR1MyZ2Z6Z2w0c3ZBNWdJMHJONVUvcDY2djVRUGlT?=
 =?utf-8?B?VjBiV3U1bHc0MFkvNnRzRkFaVXJ6eDhTbFVwVjg4WWJvdnRveG1LUWt1bzdX?=
 =?utf-8?B?MG8vYlBCa3ZNZjBoUnVOem1PL0oxa21mcE9hOXZHdUQ2SjBSQlNreGhiZURh?=
 =?utf-8?B?U25USkgrYk9UL3dqblR2YkU2K0dueWpHUnRud0xBeXRKVGtsUUcxRHNRaE5N?=
 =?utf-8?B?TEliVG0zclFLUmtBMXIvblUxa2VKenJUbjJZQXlxcDFHd2ZSOG5mU3RZSUw2?=
 =?utf-8?B?Wm4xZ2J3czRiai9lN05xZzdnZjRqUGRVMWpqRlNIYUxEUmdRMFQzVnMyT20v?=
 =?utf-8?B?RUtrTFpCek5UZEVpV2w1SFZGRHdXYnA0UFl4TEFnSUh2VjIwUmZEUzRqMC8v?=
 =?utf-8?B?TzBhUzc0WmFMaVp4WjEzd21sRzlEVFZmNEtZbmtmYWQzaElTODFwa2lHWkt0?=
 =?utf-8?B?SWUrOHJqdkJCYTlQMkxqSWVmdkErNlNjZ2R5Q1poQVJjaGZaR2t4d3R1WW0v?=
 =?utf-8?B?KzhiUU1SdWFOblpxQjk0b0N6b1RwVHdxZERzZFhNeWhsY3RvalFPN2JCK1BE?=
 =?utf-8?B?TURTRkRvYXVuTHFXaERUSFVZcVpWdDliT01Kdzc5RUd0TGtPN0IrUk9uY3po?=
 =?utf-8?B?ODh5Q2N6a2pwQlZoQUIwTWtSY1Npcm5PZldwRDVobDNEaFB6RTYxcmFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnlYRXdoYmx6cHRVTEx6SXRxL2FDSmNIWlRxdFdkZlhKQkRmMGFGR2xhd3Q4?=
 =?utf-8?B?OE9UazlUMXN6QVg0eVErbW9peCt4UUVSMW9UbURseWRmRWxPSnVSYWp0c0FB?=
 =?utf-8?B?S2RnNnZaU0NlaXJCc3hFYUU3dGJvRDdIVmQ4TWVJMldUYW5NaTZncExzcGFw?=
 =?utf-8?B?RUI4eTN4VmxJQ2xXc3JkMUYyeWVlckNabmZpd1dhNm5nYjJIRVdsS0F3eHNZ?=
 =?utf-8?B?NjZ2NUdNdEtYcE9CeFBrRkpOT2IreXBabHdrc1owTGNTVkk3WWFnMXloeXcr?=
 =?utf-8?B?ZU1rdk8wV29HZ0hGYTFWMkV6SS9aWXVmQloyMStvL1BtejZLZkMxZG5mUXJj?=
 =?utf-8?B?aWNHRzZoRUY2bGVaMkQwalR6NHM1UmdxY1F6TlRGbWJnZHByai80SU5rVldN?=
 =?utf-8?B?aTRHbXNUNHFDdlRabHJHcHlMdFk3c3ZIYm5MZk5TVUNmc0R3U2dZT3V4ZnBQ?=
 =?utf-8?B?d1h6K0RhTjd6c3VqSnA3MHFFdWdOVXRGR3Z0TU1vOEJXb3hwK3kxNEV1cEl6?=
 =?utf-8?B?MFlkVTk2UU5ZcWRsSS9ZY3hTQzQwSytBRlZuRVNLOW1SVHpHT0Y4dnU3ZVdW?=
 =?utf-8?B?cHlubktPNHZ4T2YrRUlJc2xBS2s1aUdrZGJjaEJQZzNBNnJ5WWE0TWxJeGFM?=
 =?utf-8?B?WGE5bS9na3VISEdXWmZDWVdRSUpmazhmYThOdjR4WjZTQTFIWTgxeEFmTVNn?=
 =?utf-8?B?V3VjUjJweGg5YWEzS1d6d0lmTUVxR21MajRqOEFnL2RJVEdJTkl3Sml1S0Vi?=
 =?utf-8?B?dG5xSUhqZjBMQlFwYi9MTkNJdFIvdDRVOTErdm9jQnorUGQyTlZGRVBQcWRq?=
 =?utf-8?B?SXh0UndGWXFJU2J6WFVRUi95WkRXeUJhbElXcEE1QzB4WHZUVEFWVVdFelky?=
 =?utf-8?B?WHJ1NUFDemlUK24wRmQ0eG8wSmp3aWlNVTk5UUpSbUs4eFoyN2FoRld0Z3U1?=
 =?utf-8?B?RG84WVFiNjFJT2xqWmJxZ0pFQ3R0NEhpN1RUNEowbjZQbUZrQ043M0NxeUk2?=
 =?utf-8?B?alhnOHBMTFQ1SmhGNjF3alZNK2FwdEdDR205YUd3VHQrd1BWL09POXpCTUdU?=
 =?utf-8?B?azNtbzcyZjhUUEJ4czRmcFgwZlkzTmY4NWprWnEvemtQTHNZQ254Y2tmLzVj?=
 =?utf-8?B?S3V1ZW9teGVWMHg2S1RSMEdGOUtNbUdVdkJCbG5UTEErNnNNWlpWNUtlTlRR?=
 =?utf-8?B?STJnUFpLUE1nbUloM0ZvcVR6OVBqY2F6MjMwa0JwdENQRmpTbjV2MGZibnVY?=
 =?utf-8?B?alZpQmZRTGcybjZtRkNyUk0yQ3hXTnpNV2JEU3UrdzZ2WUllbU9lUEpTV0VV?=
 =?utf-8?B?YTdzUWs4Q1NvNW9IeGp2SmJNR1VNaTg5TVpSUFlrZkhLSWM4TWZMc295UTg4?=
 =?utf-8?B?M3F5SWE3N3UxWFBBZnRTOGE0bzNzVENCV2lKOHJhL3pTZ2FWZ3dIU1ljTmsr?=
 =?utf-8?B?RlNVUjNFTlU2VFBVc3hYRUZSM2xJMkZWUFpQVjNlcERHalRNOW8wZk1ZNVQz?=
 =?utf-8?B?N0NDZXIxNHAwdWo2TVdLTWxaajI0dlpwRWtzekFVQmNYWGlKMDU3cE5YK09T?=
 =?utf-8?B?TEJWbUw2ZFAwRnlvYkk2VGNPLytrc3FQM0J4ZFNURUVFYktyYWJxYUROWGda?=
 =?utf-8?B?eUVlYXQ3QTFSYnNzZXIzSHZPcmFTK251NDV4d3R6bjFudDhuZDMyRTE5U0Fw?=
 =?utf-8?B?dlNPQmMxamVHbEhYVFZsWlRldTNXM2NmNC9CZlZqWnZtT0VXMVpLWHRMMURJ?=
 =?utf-8?B?N2oreVVjOWZiTHZKVmZHWGFPL1Bub0N1QkEyQkQzb1B3dUt5U0p4eGlHYTVl?=
 =?utf-8?B?eU9CSS9hUk1yV2daa3pCRCt2c2F5R2FVL3dkaXA2K1FnSzN5WVZNMjRGZGNZ?=
 =?utf-8?B?L1k3Yk52L2RubGoxTTBjVVJZbWNPTWVBakJmVWl1ajJsOXpib09sdE9GZ1ow?=
 =?utf-8?B?RnZmV1F0bFBMS0VZbHRZTU5wYXZkb0NCRnZJV29iYm9JSTNkdjduODc2bktI?=
 =?utf-8?B?OWJDRzY5c0FaVlNzTzF6SzEybUE0NzVRcENlVWsyQTFjbGFnU2JzVnVFNFJp?=
 =?utf-8?B?YTZvZ3RteGI3SEFjeGJaYk5wMlY4bmVyOTFOeXdyMnA2eUQ4UitiRVF3ZUY2?=
 =?utf-8?Q?Ed+hLyJEnMj4C/XojygyL65f7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7ee93c-fef5-4128-c2a2-08dc655b80bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 19:11:25.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gb9eNpzmijSD0jVrrdEbcTLtCNGiblqOTocvzYICH73Uh2BP+oO5Yp81cEugEDMQ4Fm0qxWzC95GuB8RMjmwGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7043
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

Hi Matt,

On 4/25/2024 7:46 PM, Matthew Brost wrote:
> On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
>> Add engine name to the engine reset and cat error log
>> which should be useful while debugging.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index c7d38469fb46..245e29d095c0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
> I don't think q->hwe->name name is useful as it might not actually be
> exec queue is running. I'd drop that, and replace with string indicating
> the hardware engine class.

I will resend with engine class instead.

Thanks,

Nirmoy

>>   
>>   	/* FIXME: Do error capture, most likely async */
>>   
>> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
>> +		q->hwe->name, guc_id);
> Same here.
>
> Matt
>
>>   	trace_xe_exec_queue_memory_cat_error(q);
>>   
>>   	/* Treat the same as engine reset */
>> -- 
>> 2.42.0
>>
