Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32FACD98E6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 05:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059710E038;
	Fri, 19 Jun 2026 05:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1Ul9DFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B80110E038
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 05:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781847831; x=1813383831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vsSQ3nbkpD6Ix6zzT7ehyZ0so+fdUmUHYmHZrEJhcaA=;
 b=T1Ul9DFQcWfU9cUXSrSRgQIlYeh5Uj5gZr4+e/7P+2nj4GW0j6btsFik
 3fjK7flXaoDGPkp0+fW+N3u+uRjmFR6ToF775t56u7f8F6Fm+9rdj7SdQ
 Fn0zrxLivdsZWuK4vP/accXSpRUYmyqXnOMneB/zwaJq7DMSpFwkQ2fS0
 rvpmo07+JP0BxXXHxHO0+dmEExT6P10LbJ7n4F6YdZfYdsUYRtp7LWfIs
 BnmTbuACicv8RLNlJlAs7Y7o4HWzZtNXkbArFvoBo3KS+kT6PXc96v/9X
 fdg+FnXVhnIL2cRfHCu6sRS9ea1ITeZC/9OJvP3Shfx2ugoF7cuHezE1t A==;
X-CSE-ConnectionGUID: Ai0ec6EUSfimJE4lS7pPAw==
X-CSE-MsgGUID: HFvdFOd+QumoaWSguKAlgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93293587"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="93293587"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:43:51 -0700
X-CSE-ConnectionGUID: D/9i8uKNR7SprVVATIXzGg==
X-CSE-MsgGUID: AGo//qwvRHKuMcMZJjo4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="272620362"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:43:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:43:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 22:43:49 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5ULpWeQW7x57frP0VAVo5VNcoOwqVRoq6ZePccXI3RFY7wAiHx7lI5tG6Dl9VYf+FiVz5bK/oajDkJff5PE8Li6uGo1WzJqLl1KpyXshUVwQJ55icSiMEhjYUjDsv8AbNSFpiCRIqhv1vituq2wxaNdqFNuRMxaXgkgvdmKFxBl36mJ5kRUaSVQH2b8PU7KlZMvztPQ/zLvbPo0BmvxdBensNpSNqJXBB8qmjglZfQFk9rhMCtzvI4sA9Fhj6v364/5mmVccfO5QraftnBfmY2nbkyxe/hMeVoTqpOpnO8rEFMh3RMpPYy9z+RMKW4E7l2lZn9SCpdRhy9fTlehKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl93FzUFCELoPdUcKg/Czz7uYLMGefJpjEsdvIUABZk=;
 b=MvKdOXe9BauKbYA77nTnEeHpFhtBFzPupZNUFScCzzNBL64Aw6lSmhHkO4wIPqWZNwUN0b9AWkFoI0tNliEtEKJ2pk1nCXEjJ1tIcjeYnkOsGdCHaddx/NZHyQgDDuhdekrk4XcHYByoVTWOpmaWuPARDqbNH4XN9MdU8eD8NbgMXTWDTHiOtx0hi8bNlns41wFifunGBHTQwPmXRZE4uykoOzUm6ms0qESgvtJkrElvuIX5f3YRYrKSjiHOR1F33Btur2NrA61vEeSCgoz3E7xil4wxB0eeVDGJVOhzHnIiDuEe6S4zeHag+ae146N116Lt1XNqzLRJkU+39MY9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 05:43:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 05:43:48 +0000
Message-ID: <fcffd5d8-c019-47e8-83cb-c84cdb3b88bb@intel.com>
Date: Fri, 19 Jun 2026 11:13:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-7-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260617104711.79646-7-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a83ae2-1c0f-41cd-41fc-08decdc5bbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /0JLQzanYZa4TuJf+x2s2pKPYtR61+bZDQD+k8uZ7HlBWKBDj4cPLQfR2dC6QGVS4ucYIuejyi88W6rcRfeIDPdl7lJWi7fE23iuX/BoDhDZ4r6jFAYt993nBm/US3uVtOFmygwm12QQG+D9TTvMX4Yp7Uo9YTQ4dC0vdd5GihVLJv08XAeKi0QOEhHPkt50wpfHMd1rB/k1rWOvX2c+vbpC2J9YhnehtNSAHts1URU09QfPGk0PTbG5gQTF5+44rstQBmY8hBk5zNCWkNCcoWfAOpCnSKgH6GgcDgD/H0KiN/Qgs3WFm0orQ6D5lpLVPNHDizCgYxUiXEnQ6ja8nZCLbUbYZpmlp1vi637ONTp9pd7az3aA3HmOPqpRu+Vlf9vgRZnlGKvHdEL501fl9x9IXXDEwDdmk6xYXkB26pbiqWNiQsiEknd5RGbXVa1JNlVsS0KCCLGROO/FwMwM58ktWP6FOZgmdCfIWpVOVmapecR2NtnftNYFq/zOiDK7FTIf0N3C8emQRfPVIRdMA+1rnmjXN76CRnwz+YRl5stgVh0rBOrbLkmc3fSQGC3Ao8dx7qyS7N7Te2e8lWH0FA+xtO6CICOPqKb36kCwv5f6BffFBnEfOwIvoaBZbeTHLVkjYBTxtSB2hmjIVnJOVgSxY00fohoM7GhlSq4F/Q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVR3OHQrREw4TUQyTFAvS3NsQm1LZlpUNzVBbDhkdm1ZVVQ3ZVhhRk5OZ2xm?=
 =?utf-8?B?Rys2bCtwSldERkxUaVduN1Axa1lpb01vNVhucEZmSlphQ1d5Z3ZLUFZqNDZU?=
 =?utf-8?B?Z0w4M1A4TFZDNlNnUktaU0NwNENiRUFoY015S1F1RXNETlplQ0hwTk9kMksx?=
 =?utf-8?B?UnB5cFNNVjVUL0VEbWtqYmluSGtpSXJ4Y0UzN290bnJCcHBiR1JIYlNrZGMz?=
 =?utf-8?B?aDJyeE1TYmtvZjN4MUlTSGFxWnpiVVR6ZFJSVEZVd3dHZHZ4dEV3U1U5ZGk1?=
 =?utf-8?B?VVpWajk5OFZFV2NMbGtNU2NLWENyL25rZGJ5dTlWSmZnKzRQRStJTXlxM0l5?=
 =?utf-8?B?dm5XMitVRVJ6R2NCTlRBZmIrU0xrc0dldDJtT0MveUl3amVDdG9Sb2F2WEdS?=
 =?utf-8?B?UzBmUXpZTm9CQzgxZ0RzaEpScFZoUHQxWGdMSlNKR0FvOU1Dc3F5OWIvVkh2?=
 =?utf-8?B?dVNLN1BnTjFLUjZWMFhOd1VHNjhucUUzY2ltMXBkRk0zL3NOeHlvZVNTZ1Uy?=
 =?utf-8?B?OXNQKzIxMjJlYWhaU3VaSi84cmQxV0xpbm8vUElDZHFJVzhsbEMwRlVPaTZR?=
 =?utf-8?B?cktnR094YUNqbnFjTjN4ZXdUUFJYNzR2MGwzenJsMld1UU91R0I3VUI2YVht?=
 =?utf-8?B?T0MxcndGZVhpRjBLeVhvL0tNVEExNDFzK1pHeXhQd0lZYzdPeVVnc2RZb3lI?=
 =?utf-8?B?Z3Y0ZEZkSHJkNVlMR0ZjbkMwYUdiZ21pQmJyWXYyT0QxWFJPUy9RMDZpTkZY?=
 =?utf-8?B?OTAzdDhHdDBGWDNDNjAxNUV4NjM0M09jN1d3TzdRVVVjbm1ia3dYNW53VHNm?=
 =?utf-8?B?WGc3cE0yU1NWcW5kcXdBYWxwd2gwRWxuZTJVK21WZnRaV1RNbVFHMHNMQjYw?=
 =?utf-8?B?RXR4OFI3NXJtWCtqSFAyODVGakVNejF4TjVGOUd1RTFUODZ6d21aVERiWkxv?=
 =?utf-8?B?VjZrdm85RERzTFlJNnljZ3Ftd3Z1ZE1aa2RRY2JKQ3QrUTZwcmR3aHJoV0tp?=
 =?utf-8?B?L3UzVG1LQVBYRjYwSXk2N05JSjJBMTR2RThMOWdtVm4yTHI0NDhmSGZtcjRl?=
 =?utf-8?B?RmNDSDJUTzExYlpENVBvZUU4NTM5NWdhVmZmbEhiaGFqM1VkaDBpRFB6ZVN6?=
 =?utf-8?B?WFFqRHNBckVtZmpCQ0VJUGpmN3h3N0hQaEg3NUNyYmdBaFFLOWVmbUJySnBr?=
 =?utf-8?B?L2lVTm5wdXhmaERhaWV6UzJHUWpkOU0yZEZ5eFFLY00zMEVmSWNBWUl1TWxH?=
 =?utf-8?B?Z0dZcXp0OW1VeEVUR0x3a3RPTTdTS1pFV2owaVJpeEVzVFhpSmw5ZSs1emxF?=
 =?utf-8?B?dURzM2xyRVdNMlRrMmltQ0lpQUo4NUtYVzErUXZ1SVMrcDdwYzhIa2dvNFE0?=
 =?utf-8?B?cjUwT2k2T1lLQUlMem9ubko2cU9sODByOUpTVjVObndCZ0wxY1ZiNnI4VlZG?=
 =?utf-8?B?WEdwSDR0K0lKQ1RSZWpOc1g1aHhvWFJhajJpOEs1VlBYUVFpQ2JtT2xSMTAy?=
 =?utf-8?B?SXhvNVFUV0ltZTRjS1ZWSFhIM25VMFd5dUVaN1lhWlJFVFh6SGt4WHBFZWxD?=
 =?utf-8?B?YUNkUXFEMmlYYlZHMWZxbThKeEdMUW14NFZSbVlwMHlPb1dnVU1RbDhaUFUv?=
 =?utf-8?B?TjFHZVMrTkVoc1JGeFRselduUmE4aHBHZGJ1SWxHS0RsSStaQ3dERCs0b1BC?=
 =?utf-8?B?N080cXVSZEU4aDhUK1VJNmp6V2pFeU01dittcVdERVB0QU13MUdYSGxqL3Jl?=
 =?utf-8?B?Yis5bjBjNCtsUC9SVFgxVjRLL21SN3dabzkwWkFCcDM1aWtPYk85VVA2T0s3?=
 =?utf-8?B?TlJuSHJtb0s3TUY0eG81TENXRWRWQk1SRWZRS2h2UktxZndQc0FmdGhFY1ND?=
 =?utf-8?B?cHYzOWRaUGR2a3FjQysxMU5RQjlEeW8rUTJJeUQ4UE5IK0ZmVWw4ZHpPcnJx?=
 =?utf-8?B?S3ZHeGVwMGdMbnR2NkpnVm9SYlJoWGxXd0JVSVF2S0c2bjVMV0RMVXdVdTdH?=
 =?utf-8?B?TEQraWw1UkxUT3hrMHlja20wWldLZndJTzM4TW1yYVJDeDNpSkFhcnJKaWd3?=
 =?utf-8?B?NkxBUnl1U2x0OTdINVdOalNYTkhVU2ZsT0dyQjVCYTU1TlZDeWZvZzZTMlQ0?=
 =?utf-8?B?aVR5eGdXSEhyZWJqM0M0eTN6bFVVMkxsSmxYMEVDR2JIUHlxQ2s3R08rWHgr?=
 =?utf-8?B?YjV6YmdVZy9kRGFwejFZdFZPWFJLS1c5TDZCc2ZiMFdUZ1BpWG9Rck5oSnVs?=
 =?utf-8?B?L2laWVJ5VlVXNWZORUhVN3k2WTU4QnBGT0pzcENDd2laT29lRGZnalN1MEtW?=
 =?utf-8?B?b3U4d3FaRVh3VXdSWDI1eW1zb21ISkJic1BVRjNHOGIwc1NvQVVtUT09?=
X-Exchange-RoutingPolicyChecked: erQVD4+RypiH7WwAS0I2ePdK3FmXCcDGfe1jo2btDjPKOEJym3jiGH2YmsdISe6gWPV+GR5q3zq95vzKSXckm8pDJUsG9De8RkmtcJJQpeXBN1JGjNkHr6s5zDLKuLTivefTUrQxyQRxZV873MIK0pio0+c3hRJdfXZOYbIg3DZkvabjFXW/NgmiHKvvDm3ogU6fTEQ0XEb3CS8lCM0H9oBR+m1YTRC1TaLQExnW4rrWIMLPwxBI2hkm7XFdACht5nCt6eCyGx6fWoxMleFmTj36dbfRb9rFns5QoWs3nP5AC357XlRCwRzDErmHb6VtoGbi2q3EmSHtF57MkxhcYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a83ae2-1c0f-41cd-41fc-08decdc5bbc9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:43:47.9706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xTt7TYUM2B/hCfxPVSQUnYtgTxzwo8WJvXvyKrDyYKrLlLW4DhA9jpjsLygUbk8BfXxsk+yKnq+D4pk+4qN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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


On 17-06-2026 16:17, Mallesh Koujalagi wrote:
> Add xe_ras_log.c and xe_ras_log.h so the driver can report
> faults in a structured, machine-readable way.
>
> The core is __xe_ras_log(), which emits a single log line with:
> SIG_ID, severity, location (device or tile/GT), errno, and message.
> Fatal faults go to drm_err(); recoverable ones to drm_warn().
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
> - Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
> - Make macro function properly.
> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
> - Add sig id documents. (Riana)
> - Change macro function same prefix as the file.
> - Handle __xe_ras_log() function with variable format.
> ---
>   drivers/gpu/drm/xe/Makefile     |   1 +
>   drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e7b146880f4..607c9b099d03 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>   	xe_query.o \
>   	xe_range_fence.o \
>   	xe_ras.o \
> +	xe_ras_log.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
>   	xe_ring_ops.o \
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
> new file mode 100644
> index 000000000000..0e836ef5dcf6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_ras_log.h"
> +
> +/**
> + * __xe_ras_log - Emit a structured RAS log entry

Why __?

> + * @xe: xe device instance
> + * @gt: GT instance where the error occurred, or NULL if device-wide
> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)

Add enum  name instead

> + * @errno_val: negative errno describing the error condition

Why do we need error no?

> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Formats the message and emits a kernel log line via drm_err() for fatal
> + * events or drm_warn() for all others. CPER record generation and hex dump
> + * are planned as follow-ups.
> + *
> + * Format:
> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"

You are using both error and warn but here it's only xe-err.
Isn't this misleading?

> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...)
> +{
> +	char loc[32];
> +	struct va_format vaf;
> +	va_list ap;
> +
> +	if (gt)
> +		snprintf(loc, sizeof(loc), "tile%u/gt%u",
> +			 gt->tile->id, gt->info.id);
> +	else
> +		snprintf(loc, sizeof(loc), "device");
> +
> +	va_start(ap, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &ap;
> +
> +	if (cper_sev == CPER_SEV_FATAL)
> +		drm_err(&xe->drm,
> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			sig_id, cper_severity_str(cper_sev), loc,
> +			errno_val, &vaf);
> +	else
> +		drm_warn(&xe->drm,
> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
> +			 sig_id, cper_severity_str(cper_sev), loc,
> +			 errno_val, &vaf);
> +
> +	va_end(ap);
> +
> +	/* TODO: Add CPER record driver handler */
> +	/* TODO: Add RAS dump cper hex handler */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
> new file mode 100644
> index 000000000000..08318dea75a9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_LOG_H_
> +#define _XE_RAS_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "xe_sig_ids.h"
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +/**
> + * DOC: RAS structured logging and SIG_IDs

Link this document.  Add a  brief heading

> + *
> + * What this file is for
> + * ---------------------

Once  this document is generated.
"this file" does not indicate what you are referring to.
Use general doc headings

> + * Use the xe_ras_log_*() macros to report faults in a
> + * machine-readable way.
> + *
> + * What is a SIG_ID?
> + * -----------------
> + * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.

Add full form. Define what is SIG ID

> + * It tells tooling what kind of fault happened, independent of message text.
> + *
> + * Driver SIG_ID classes:
> + *   XE_SIG_PROBE         - probe/init failure
> + *   XE_SIG_WEDGED        - device unrecoverable

wedged does not mean device is not recoverable

> + *   XE_SIG_SURVIVABILITY - degraded/safe mode
>

not really safe mode. Please use actual definition

> + *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
> + *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
> + *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
> + *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
> + *
> + * HW SIG_ID classes are hardware-defined categories, reported by firmware via
> + * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code does not
> + * emit HW SIG_IDs directly.
> + *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
> + *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
> + *   XE_SIG_HW_PCIE           - PCIe interface errors
> + *   XE_SIG_HW_FABRIC         - on-package fabric errors

on-package?

> + *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
> + *
> + * Why this exists
> + * ---------------
> + * SIG_IDs let RAS tools parse logs reliably, correlate CPER events, and apply
> + * policy/thresholding without depending on fragile string matching.

What do you mean?

> + *
> + * When to use xe_ras_log_*()
> + * --------------------------
> + * Use these macros when the event is:
> + *   1) a real hardware/firmware fault,
> + *   2) relevant to production monitoring, and

How does one decide if it's relevant?

> + *   3) clearly mapped to one SIG_ID class.
> + *
> + * Do not use for all logs
> + * -----------------------
> + * Keep regular debug/info/driver-state messages on standard logging helpers
> + * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), drm_dbg(), drm_info()).
> + * RAS macros are for structured fault reporting only.
> + */
> +
> +/*
> + * Common backend helper
> + */
> +__printf(6, 7)
> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
> +		  u16 sig_id, u32 cper_sev, int errno_val,
> +		  const char *fmt, ...);
> +
> +/*
> + * Driver-facing reporting macros
> + */
> +
> +/* FATAL */
> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +/* RECOVERABLE */
> +#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +

Why force a type of severity here?

Thanks
Riana

> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
> +		     (errno), fmt, ##__VA_ARGS__)
> +
> +#endif /* _XE_RAS_LOG_H_ */
