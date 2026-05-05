Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B3CD13DA
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8321510E021;
	Tue,  5 May 2026 05:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQzNXozQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02CDE10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777957715; x=1809493715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jrcuBvKt0ZVTlcyBAd+NrLipMRAmC8TDeI1a9qHF3uo=;
 b=JQzNXozQh1Kuj5zZYD51mVzmuE4c4Ghbw6q09yWxj3pbC5P+VWqqV0s7
 reHNJ7L599x2FhLi/DIKhfetlXcyGskzofkC5ZMck/0B8DC1dz7UTnuhv
 tQkMbA6CV/zYMYasFbXAaIXoNnJIdcmuDqom53dLuVver+QlJVcP8kxsn
 kI3ozAj8VSRqu5uz4/UslKVF+hRrXzRBjC3rwdMjwQGDm1Fg38jLOx1s4
 6T3kslhldz/YT0qGSvXbIQ1fyBokEPIgq9B5pb8dO4pXbs03JpG4K9yn6
 Xzn0fnTUtx49v9KxA+bOTKNGqie28ZtiFgwunr1lvgzydSVUM9Zbf1pBy Q==;
X-CSE-ConnectionGUID: upWttV3aSiCdDOIsBX7jrg==
X-CSE-MsgGUID: p/bO1QMmQaGeLSeeZCuWbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89125997"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89125997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:08:34 -0700
X-CSE-ConnectionGUID: TtUYG+MCTECjlSqrYQFtRA==
X-CSE-MsgGUID: deKFIf8uS3uO2UjAr3m8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="237485385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:08:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:08:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:08:34 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfMqaJoCiOK39Nawda1tBZhqPwBio3LzxRsFOjT91ifOiTgfbaies/5twEr1QYiM8j9Sp/G39JnT8aWcKo3voNDSWa8DjK9IEMXgh/FKUZdF5+hdNkudzNFJ5P36b6YF4xWrY7y5Sw0kZMaNFQaDnxs+zuoT2y6Am3Vj6Z2P15CplZSdALFWlAgskbmqst/g09l9FkDgiwZDNoS/E0GmWVCewhVCArtSo8okVwNnyf6T4ai7K6zh1Goa18QPHh/Rv82rvL6kJcVdlLIR4Lfg+qSxwIU6CWPxwEeV79RR41dxvrB8JtfZrc6BFUbb7O+4xtmZOaxqOQO3Ei9oWMipuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3QefxcweRM/blUnvsBcTuUlXwfjUIniK2aXviQDapA=;
 b=YwJtqqgS7ghbei1+iKvoMP59UXACjhXaKwpFGayFiEYc9RgZQhl6q3GOQUFc7u23V2aZa99dolob/D5M3fsobXz3P2/SQ4oQZnjeSYZtcIlnqGwINOI44HnQIZHr+1B/SjR48v3kQ+ElA0HEFzL2zwpgpCsc4XJSBxPfeIsaQTJxIJzUbVSfNjm+nbxm6CjaJVaSIHt6hXBhSAgrYKgLVhwMoDKg8omj5L1FFSsW5GImH0gbi/y59GQNDGtc/O6L4BvbXrBAX6tzEzZifCCYqM5Kf4T3ftyHvFMpLabVSksqvRjjcOcKoakk0CdcO/gBSwwDSqGSE3JzRyv5Jl7dBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF2EEA5C68E.namprd11.prod.outlook.com (2603:10b6:f:fc02::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 05:08:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:08:26 +0000
Message-ID: <4441c6aa-b85d-42c1-8fd3-d19333ef426c@intel.com>
Date: Tue, 5 May 2026 10:38:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
 and queue commands
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-26-riana.tauro@intel.com>
 <SN6PR11MB3232A9B11E2C9B9E2E492DCF812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SN6PR11MB3232A9B11E2C9B9E2E492DCF812C2@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF2EEA5C68E:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cdb63f-d646-4653-ae4e-08deaa64569e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: +skYZ8ch3Bli+hX8PuUdp86Tf11uwkTdkKxK9FAA51mk1KRBgHNGFQ27SqrT3Okz2wR8sSPpuPSTTRlXuf4a1uHF8q2vmWeKDZkVzezoJNg0JBFD7evtWVJZdPMyjys/+MnXkFemh8/dHPa2ehvkhsMEbgfMWZPcMeE/ba9Rke2tBptNHXs52iIppK5WmFHKWDtZYi7AhDivZr2I6ns9zfOouC1TdJt9ml3cgiNXjUcqKYZtG5ZftWYLmT2RZ2ahzLCdCAn+QgSgNRG2N2LvETDFzHaYKvqbfrZkp72HBT2WK8wcg8rlsy5bZvYXSApnI7OfN5qFMpHTqPYxJVs/y4ee5wTLao39e8FhHMG1W2cU7Quy+FjJgAjzzJqgnX7DFrWAWrb6IdtXArllQsTgzZi+Ydo90U7MEIpdeYZmDzMhvFjBtmPfKo+mbkevyD3Ek6Bnu6eqKbGbOZmzVpTU4qlxFTC/N1nrEe7mIvST/3moxKODqMLzhQamaGs5q+tArREc3V0nJ2qu6EPaQHorBQXcg0ln4rjLd5ukpaUfoupPhbQEv1Cooj8tFfLWPEKjDXyGg1ps13PQr6FjZWXGlRgVGW/Oipe2lYjpYy9ifbmOStwkVm8S2GmRTBxpLZ11IsG6LO4GKJii7MNhcwq7MjhwKjtXB/v/K3o1v6rDlxa3kcYas3QdQRYPuh/2dCro
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBBK0NJSVBCQkZta1h6SWtHOGNweXc3SXAyM1NXMndxVlVSeVJYU2Q4WHN1?=
 =?utf-8?B?ZjhmQ0pKeCtIZ25uMGgybE5NVGtSUGwrTkt3Qk1YeXR0d0dyRGo4amVWRE1u?=
 =?utf-8?B?dkZIT0k4U09ucTBBSzF1ZDZlNGtFZ3VIVDYwNTlNTjhJWXdjQVIyN25TMWw3?=
 =?utf-8?B?VjdBdCt2L0NNSmNoa1MwQmE5eWNZeHJaS0t3TENtbjg3ekh6a3IwU3psQ2RK?=
 =?utf-8?B?WkNSaUo2dTRyendyRDVXY3JVdk0zbldMUkJHdGt6dk1wRHAxTlRoK2xsaHoy?=
 =?utf-8?B?OFlQMTVjOUUwejlSR3dUbjNsMDNuUUZsMmpPZTBEQUtTM3RYcyt6MHo3YWdS?=
 =?utf-8?B?dUpMeURTVHhZa0N5ajVXaUtzWUoyNG5WRWZqVU5SdS8wUCtzNG04Y1VPUmla?=
 =?utf-8?B?VUIrUk5QY2k0SFZXeEYzai9TMlVyYjJBVW1JdUdscjJzUnY5cHJ3YVk2MFBr?=
 =?utf-8?B?bDJtWWlSa3J0NlVBWXZTMmtVbDdyMDh1cEtwMEsyb2hYTU5GQlJLQmNjSlRJ?=
 =?utf-8?B?UGhHSkVoVGt2OWZ6cnZsQTg1bExKZDAvUDVzKzhtNjYrb3FBZVhYQzVPTzRs?=
 =?utf-8?B?OUFEdHRtUlJMQ2ZBUDFuZllxMExoanBmK254WFljNWhXbVZscmRteUNDeU1U?=
 =?utf-8?B?N1VHWm8zVXVyY29DNTh6V1E3aGRHbllMbFJpNDlyakFOeWpxallMZ3NsS2J3?=
 =?utf-8?B?T3Y5ZzYrYlgxdjJwUCtsb3VQUjRELzdxZTNNNk5FMUZZaXVQamJ5ckFka2ky?=
 =?utf-8?B?Z09nWFNFUXRjVWZQenFNWVlIUHBWUVFFb1dEcWR6cHByeS9XeW15dHdPMW5M?=
 =?utf-8?B?TXBHbE5LaGs0T0VCK3I4cUJvd2Z3cGZuYlU0NTd4RHJvWmJTNzhNVW9wVmw1?=
 =?utf-8?B?SjZMWnVzajQ3a1lkWkgrUGIwUzFyTmt6OWN0RW5YZjBwUGRHWmtlS1JEQmJr?=
 =?utf-8?B?ak01cmdGSXRicG1oaVZiU3lvejdPQTh1dW96NjZIK281bUdvSEJ5akRtY0VC?=
 =?utf-8?B?V0lXQ2JUOUNQU24xRDVMTlZHeGdQRkpMVEtUaUtPM2pvYzVtaTh4REpKMS9K?=
 =?utf-8?B?MktIWXZHM21vQWx0MFBTanBKK1VlTWw0cDBkR2sxOGNpaXVRMElTUU1JK2JT?=
 =?utf-8?B?eVRGK2FLdy9kWWhNSGExbGp0Wi9VTkNkcW9XZktEWXB6SCtLdWNDM3lDeUxF?=
 =?utf-8?B?WCs3WE05ZUFqU0IxbTRtVnRwN3l2RzhiOHFhVkRZNCtrdjFnbzNaTExsNUw4?=
 =?utf-8?B?MmJUWmJZSHI0QjgzcUErRTlDQjhUVWZFajZNU05uckVyK2gycTlzZWQ1Qnlq?=
 =?utf-8?B?WkQ5R012SHRDTURZSERQb1NlVStSRnlqeFdQQllyT0xPVWVZMTl5eUhlQVZp?=
 =?utf-8?B?T3BheXVoOEpMK3JNejhqSG4yOE54cUF4SGJZSTFFdkI0ckppbjAxcGtpNU0r?=
 =?utf-8?B?NHJkN2hJUWNscm5NbnFUL3VJL3hjT2xySkRoOUVCbkRGTzRDbng3ektzNEp0?=
 =?utf-8?B?U1pRb3UveVhsYVRBZ0tHZ2NFZXhrVCtHQkRlVnh5WjcwQkRQZTBsQTJwRVNC?=
 =?utf-8?B?VEIyZ3RCWXFOQ2VWL0IvTFY0bmhuQ3pGQlVyUEN3NFRmTU50VUU0emdzdjRi?=
 =?utf-8?B?MkVTRm9DM2lvT0p2dVozNlh6UXphSXNNbDBRTVFobTRoallrWnpnTTFuRUZy?=
 =?utf-8?B?cmtJTmpnWGtyRUh0MG8za01HRnpDNWpPN3NyZ25PeVdqT0c0VlFMNVNSdmpM?=
 =?utf-8?B?Qm1vU0VnMGhSN1ZJZDVHWVNVVjlWUThUd1FoWkdueTQrZHV3MHpsSUhyNFY1?=
 =?utf-8?B?RFc0N2lGMXVpRUU4aEFxQlVrK1M4Y0FZWnQrN3BxdFlLUVViSzdFMFpwVzRG?=
 =?utf-8?B?Wk9zZDQrM3FadjVZNHVhb0pCdno2Z1ZLbUJpWTZvamdITjNlU3FjbWZmblJZ?=
 =?utf-8?B?ZDNKcU93amVLbWt1VkRoWTNDRjNldVZsdC9Gc2RNTWt6M2UzT0RsejZrZWFX?=
 =?utf-8?B?Zno5MmFTbzA0Mmw4UTVMdnRUeEdiZTBLOXc0TkdXMld2emhpdy80QjdLQi9j?=
 =?utf-8?B?Z25QWXo2N0p6RVFsdWpSWFhhdGwyTDAxYzlXNi83MXdueWVKejdNT2llZmM2?=
 =?utf-8?B?OHZXSEVWTWwrQU5oUUdWRHFRdHFaeEl2ekczQVpDL09vOFZ6SkJPS2llWTg5?=
 =?utf-8?B?TEpVRVFJeklsdkJmNW52ak1qUkM5YUVmbDBtU3ZIN2xtcWNSRFdnMEJFTXJQ?=
 =?utf-8?B?UVdDTkNVWUpGcmxkU1F4bklWSWRCRzllZEFtRmZCWmRoSEtoajVuTlBJUFJP?=
 =?utf-8?B?cGhwUHdmWGZNNUcwOE50a2JYT203d3dLYUxaWTQySVZtV09jRVJCUT09?=
X-Exchange-RoutingPolicyChecked: ndc6oYLryhzd6OORzpXUH6zgfulR+aShjrBH+VbgqSegaCkE6L1+i8cBV2Gyk0L5pxkP7Nbunr0S4Y5woq4DkdHOQrlX0J2XeMX0oRBqQ6AUQExLvjyBrtIHWIEzIJYRn77Gu74yYjeo50IY/TjjvkUZ/zn8tVlvyTeVcnzw7LFMI3xNi8zjCjPQwx/p/P74yGVAX2ul2orrObwK6ex4y6MHy9bhWSZkukwG1Vqud0092qpQUBUSfzl/7ylKUfr4aFHRmUYMAgujRKs4HH4+ti0E5cduVgu2xyBUOlTmB4lc9/IJB9nri2kPmE1txI6Zfd3gBvfC1HGmmBAJ6gVPQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cdb63f-d646-4653-ae4e-08deaa64569e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:08:26.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3F4trPfx9TzA5z7tGe6/rksWvGYnMQP1s9Et8+9OQgz3cWySHPxljJEMp/UHOzV217lAWJPOmYQjUEGAKtjLBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2EEA5C68E
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

Hi Tejas

On 4/21/2026 11:49 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 17 April 2026 14:28
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v4 11/13] drm/xe/xe_ras: Add support for page offline list
>> and queue commands
>>
>> Add handling for page offline list and queue sysctrl commands. The page
>> offline list command retrieves pages that are already offlined by the firmware.
>> The page offline queue command retrieves the pages pending to be offlined by
>> the firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 39 +++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  6 +-
>>   3 files changed, 129 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> cd1ac6441b92..42ec27c05e9a 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -319,6 +319,87 @@ int xe_ras_page_offline(struct xe_device *xe, enum
>> xe_ras_page_action action, u6
>>   	return 0;
>>   }
>>
>> +static void get_queued_pages(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_queue response = {0};
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	prepare_sysctrl_command(&command,
>> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
>> Expected %zu, got %zu\n",
>> +			       sizeof(response), rlen);
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
>> pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>> +static void get_offlined_list(struct xe_device *xe) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_list response = {0};
>> +	int ret, count = 0;
>> +	size_t rlen;
>> +
>> +	/* Supported only on platforms with system controller */
>> +	if (!xe->info.has_sysctrl)
>> +		return;
>> +
>> +	prepare_sysctrl_command(&command,
>> XE_SYSCTRL_CMD_GET_OFFLINE_LIST, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
>> +			return;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch.
>> Expected %zu, got %zu\n",
>> +			       sizeof(response), rlen);
>> +			return;
>> +		}
>> +
>> +		/* TODO: Process pages and offline them */
>> +
>> +		count += response.pages_returned;
>> +		if (count > response.total_pages) {
>> +			xe_err(xe, "[RAS]: sysctrl: Pages returned exceed total
>> pages %u, returned %u\n",
>> +			       response.total_pages, count);
>> +			return;
>> +		}
>> +	} while (response.additional_data);
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>> { @@ -394,4 +475,8 @@ void xe_ras_init(struct xe_device *xe)  #ifdef
>> CONFIG_PCIEAER
>>   	aer_unmask_and_downgrade_internal_error(xe);
>>   #endif
>> +
>> +	/* Get any pages that need to be offlined from firmware and reserve
>> them */
> Should be executed only on CRI, right?

We do have has_sysctrl check in the start of the ras_init function.
This check is also there in every function too.

Riana

>
> Tejas
>> +	get_offlined_list(xe);
>> +	get_queued_pages(xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index d76310866da5..1a5de6cd16a1 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>
>>   #define XE_RAS_NUM_ERROR_ARR		3
>>   #define XE_RAS_MAX_ERROR_DETAILS	16
>> +#define XE_RAS_NUM_PAGES		25
>>   #define XE_RAS_IEH_PUNIT_ERROR		BIT(1)
>>
>>   /**
>> @@ -297,4 +298,42 @@ struct xe_ras_page_offline_response {
>>   	/** @reserved: Reserved for future use */
>>   	u32 reserved;
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_list - Response from get offline list
>> +command
>> + *
>> + * This structure provides the details of offlined pages from flash.
>> + */
>> +struct xe_ras_page_offline_list {
>> +	/** @max_entries: Total no of pages that can be stored in flash */
>> +	u32 max_entries;
>> +	/** @total_pages: Total number of permanently offlined pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of permanently offlined page addresses
>> (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_queue - Response from get offline queue
>> +command
>> + *
>> + * This structure provides the details of queued offlined pages from firmware.
>> + */
>> +struct xe_ras_page_offline_queue {
>> +	/** @total_pages: Total number of queued pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of offlined page addresses (4KB aligned)
>> */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 2cafa8a14cc3..b6139ac0eaca 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -15,10 +15,14 @@
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Get basic error information
>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
>> page
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Get list of all offlined pages
>> + from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Get list of offlined queued
>> pages
>> + from firmware
>>    */
>>   enum xe_sysctrl_mailbox_command_id {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>> -	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A
>>   };
>>
>>   enum xe_sysctrl_group {
>> --
>> 2.47.1
