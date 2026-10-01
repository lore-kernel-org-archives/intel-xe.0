Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E7CCA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ADC10E3BE;
	Thu,  1 Oct 2026 13:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdQ39sc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E2010E3BE
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790860696; x=1822396696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RS1f2tTHHYUKhRC3YvgCLBDCWN5y9dICTIV5jjTjwnU=;
 b=VdQ39sc9n1IxtI0aS0kkfP723Gz11uQ5R63ADt6J2zsgUbYZy0TlykZO
 +p1O2OZrfGIPc+p5I/fh1G2Ti13JHYCra7AMwMLd76P/Ee3TF7MzkFTl7
 0LOcHb2fmcepm97kVlZoN5QKHdVZ1NF2coIcknEcM8HIGmSRN4q/ZZ6K2
 4bxtXbmj5wuKpWJPAW/CyJ5gP51BVTtEuJba0TMxWBo+Zw+aULQWZUzUq
 vur8GFETomzu+oMpk+dFrHJFi4fQ3YLTP83bRDHx4ym0N7/LQYaen9Sor
 fQvnXaj+LK3cmaq2VUKWcwwKN/9H6Ghc0qpckAoLSCHjkgF+gUgBWq3YF w==;
X-CSE-ConnectionGUID: J5pGT3WeSO+HXB0lqiOJ8A==
X-CSE-MsgGUID: HwMn0q5gSeeUvIkTyLuYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91634279"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91634279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:18:15 -0700
X-CSE-ConnectionGUID: HTFq5r+kTxO0KLFL8lHLBw==
X-CSE-MsgGUID: tyuXGymERlGUKt6cMILfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="280755153"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:18:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 06:18:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 06:18:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 06:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJW3RlggjL8eX02TpxXjLtTjknYgP62z/ILYznkROpSW6QIpkkaYTzKLq0jecjtoWzzCbGzHCg4PMkm8AXr5FAaMkQV/778Mk1QBMNmRUEauTXKH+PuGc36UYWOmCYaTjjR1jsS+OA62OZH/Jkjk8VwW2iBIJg/bg0YG3khmAog26tw0WSmQ+JHq3otdhW/BNbNbiJh9RbncR3JfHme0sy07ygpTfmu7QctViiqXdrKqBJwLFzOZ55GMnThzchekZlx3Q6EIdskMiUnJppHD0tRO5J1UYmWwlf4NKSAA3bXMQQUWDSFJ1ivHbHuKExECkdtfGTia9FqQarZYUlgF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2heiyDPNb6ujQFj1vfjRMFJFSCxb7tZDIlqpkM3NrsM=;
 b=ZUcMZA5QAQnSzPaJUEiuvTK3HFSIfnVqZGTmNHbp2lx0qiGwaKu4dgDZJIjIC68nKSr+kR4NsrERAGWcK55uvV5fBpebMQXprUBc56oq6iSI8l8jARb+bsw8hgJ28rhoZOjlKUybCgS0od4lUxlhTd5cK+4/Jy9oZQ4EcMp90OEEqK1OkMN5FSP9p7z9vI1jXK8uvePJdvg+zctjnX68IO2angMQXeg8fq0W2wb33xryL+x+KHCa0eiJB6b6pnb2ij+iLH0v9XFrwX2Q0XndxS4fPGPUADoWcLz+WEIwFt/ofOsIQYP8WEL0b/3UbVJNgutQCtCUZRGeE4s+L9GyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.16; Thu, 1 Oct 2026 13:18:12 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 13:18:12 +0000
Message-ID: <6166a826-39ef-4670-9997-82aae0053601@intel.com>
Date: Thu, 1 Oct 2026 18:48:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <heikki.krogerus@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
 <20260910124151.3135801-5-badal.nilawar@intel.com>
 <df934dcf-5a91-4b83-9c17-174c77ade36a@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <df934dcf-5a91-4b83-9c17-174c77ade36a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec77a44-e482-4fdd-8215-08df1fbe7195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8VSQJ1rYS15oXkm2xmjYovXhO4P7v5lVeGnPGdNISl2X1Kttf3i4qW/unPR5DUb6bj4TEcie+xfsK+vPjNB2DKu4RZ4NULLx1b/U9TQYRefaa4WjnWom80bhqBnsTDbcEiX9wv4gXtHHNUBzYTQVhPc40d3T/1XdcYZQgPF9bXxzuR+w9TUw7hyLKJvBkHS5bONwFeA6LMkRh4RdMViqSLxsug1T2mgQlvBNNS+JM8k0ZXX20sz658ZRs8xvznRgMoN86SNFCMl7PBj1V2tu38ODLCsAd2WFQzmCafK4kgUPHozx5aJgSw5vZOSj52DayvlVl/fcdSflHl/GwjDNSrd9k2+TytzkiBYXzdnASs0k2zsByMP5xRChsRAV2/pwZ5oqEi2DQdZfJrPqvjG1sJ0EY5aBb4ieBmuT/PNr0HdeXAp44tQc5Y8etTKfalXevjojWP1h/DmAci61CIDpQcDPMEJhnjEkMySe+C6U0IFS31dSM7Aux6OpiJXZmKIkNq/xfb5jDvcFwc78ZwquzAWxS+7DMi7KO+FtfibSuzaq0/r9P9i2giNkQ8LTTRH8OFwKaXUpNCejMmkYKKwHoSPOi3rGINt17NIgU2nwKUkkajo9QNwKZj+Wzw8bFCK0GYjojEzwtVce9jpfXKIAmotMSo9D2LeH+NqCy5/MCac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akJGL3Y4bTI3UURob1RZNDJkbWlSdVUrbXZLUUcvVDlIWi8wT1Z0ejNtaTdm?=
 =?utf-8?B?Rld1M0N2UWtRWlEwdHQreFNjU21ROStKVmJyR0czTmVBWmZPMlI3SVNVK052?=
 =?utf-8?B?SnhzOTRXcGtsaWNDZkpsanZTbDFPVkZrT1pmVHFCRlRQYnhuRlo2UFNiSnNv?=
 =?utf-8?B?V2lhV1RiakJyUld0TU1YNmVTS0JkODJHT3duTGVDbUZDRHJIT1pqN3RCMkVK?=
 =?utf-8?B?b3UzcGJJdDVYUGhwZTc0Njg4eWplb3VZanBtTXZCb3RnWHJmdkNocEZ0S1lr?=
 =?utf-8?B?RzRJU3p1UTJkcVUrSmg4SDgra0dKakloMm5sd0kxQTQ2eWg1Y09jK0U0QXE3?=
 =?utf-8?B?R0dMaS9QV25UVC9vQjNSa2JPTkdMZ1gwVm44WjMwbTVrbkppcWtMZHRHTVBp?=
 =?utf-8?B?KzkrS2piT05GUnVMRlJnL1Y4Z3Y3Z2V6Nmw3Mm85UFB3cFZFb0tNcWtWNHQw?=
 =?utf-8?B?NFpVTFczdS9sY1pWNm8zZFRqTmVMRlBSL1pRQUtzNXViMFVhdEZoUFl2ZUU5?=
 =?utf-8?B?M3RpcGxFU2VQSWdRdlU5aXFMcXR0UVdyOVc0bWNaUzhLQXJwbFNYeWtMRTlR?=
 =?utf-8?B?S2trZ2VqUno2WDdtZ0RMREpSc3hzeitwNmZPc3RLTExBMVAzT0dDNjJxYTNR?=
 =?utf-8?B?WnlZL1R3ZGI0M21rL0dNZW1vOG85Yy9OM2pNNnBxU1MvZU80eXQ0dFU2dldX?=
 =?utf-8?B?M01OTG1DM2xWRU1tdHZ0UE5sbFUvL2V6ZXVZVkFKUTYrcGU1dTlrems0RjVP?=
 =?utf-8?B?TE50U3BISTVMUjNJN3dVWXBFTDhjamtFNnBxa0ZLa2I5SnlOdTc4VzZtNWx0?=
 =?utf-8?B?MkpOdVEzOFpMZ2hTWTAreEg5SHZOTldhblJIS3o5VTByMTFLNDNKR0hnZzI0?=
 =?utf-8?B?YkoxQUkwZExMUm9aT2svTlRLUExWMHBZZ2Y1dGdkZ1R2NzdnRDhKU1llZWlj?=
 =?utf-8?B?YkxxVmNxakdHazRRVjIxaHdJVnd5NUptK3VxbVAyTDN2aVliUS9Hd3c5UHlm?=
 =?utf-8?B?L0FDaWczSUFNQzNqd1I1RU1ybWRRS2dxTDJBVjZqMEdhMjRhOHYvd3Vjc0pj?=
 =?utf-8?B?UWJKanR3UVNzZm5ZV296dS9yZ1RpbGRzZUlNLzhjd1pUSTVRdUF0OTVRd0s5?=
 =?utf-8?B?LzY3dnp0UUtPSDFkVFJMbXk0bHdkVTFqaUpwQ3ZmYVJjU3ovdkhqTFptSkQz?=
 =?utf-8?B?LzN4K21mOTE4NERCTTNYVmUvSDRJYmdIekxiVXB6SFJaT2lwZU9JT1J3a0dO?=
 =?utf-8?B?eVZ3KytUKzVpWFRjR0wya015U2JJNHZ5aENXZ2MzL2RhN0t3MTRHK2d6UVA4?=
 =?utf-8?B?NkVHSWxXanFlZVVXSms1YzY0VlZ0RTNGRG1JbU5HRUFIYjh5VTNFSGMwSmNw?=
 =?utf-8?B?TnBGWlp6c1Z2UWJlWk55MUhTUTBDbktyQXFkYjh4UVJaRkQydXpQYnZLQ0gy?=
 =?utf-8?B?Vms2ZnFBUHZpTUpweE5zZGxRR0pscXZQQ3lkNlpmaXlBTkZnTmJZNGRzeXpW?=
 =?utf-8?B?b3dxei83SFBmZnZtZmVEdGZoR2FTRS90Q3dLT1FabUlZOXNjWXBybW9NVHBs?=
 =?utf-8?B?cDlVQTlFSTQyZTdtUlBzcW54Y0ZXdzdTRjhsZUR4d3dJY1F2aFBrdU1wOFJl?=
 =?utf-8?B?QU5tVzNhY0tIQXQ1dERHdGlQa2hiNkN3c1dLOGE0c0NjODRjNmtDMTlyWG9j?=
 =?utf-8?B?NElIT0xlL2puR3hUbWNyZ0JVSlRNUy9jT3Uyd25sVkhaNy9zTzhKTmZ3ZTZy?=
 =?utf-8?B?bTdzQS9CWlRWdjVTb2pUcFZiS0k2dDZqSXFJN1Y3NWpUUkxTZVo0UUVvL2RK?=
 =?utf-8?B?dTV5OWN0blhmM0pXZ2pxc0JTNTBNcVUvMFM5QVlkMFdzaHVkSFZnaXlsekds?=
 =?utf-8?B?N0dWR3VPL0R6a0xkT3Z5N3Z5YW9DdnVlYVRXSXdTRnp5WUxhdFQ0dlBKZHdl?=
 =?utf-8?B?cjRsTDdaaktNVDFRVUU1aWJDVHpwbXRhdW9YVXMrdFdYOGtOMDY0dzR3eGFz?=
 =?utf-8?B?bTI4dDYxa29VY2pCdnhnVGsxZ2hhM3dkbWJIYy9HZU5lN1BSOCtiNUo4Umxo?=
 =?utf-8?B?QWJMQTRQemtIeFJDbWhyWDc2ZitvNWtMZjgvdis3NmFnemlIalpPZkQzczVY?=
 =?utf-8?B?VjVISUM0aUNiSjZnR3FzYlJPQUZlbDRIa2VKdW1yTHZFTDJGZ3hTNi9jNFVv?=
 =?utf-8?B?OWZwR254Zms3MDZtVGpBUGtYVGxuSGJRRXhIcG03aDd5M0VpdlJNSFNseFhK?=
 =?utf-8?B?aDRnOFl1N1o2MWdKaW8xWnlUaEhibkxUNUxIN0t0NHFtKzQ2cDdDM3AwOGFp?=
 =?utf-8?B?Wm1meEJiajREWVozaG9ESjNrWVpFcGRZWW9mbUhqUFp0NW1TTVBjQT09?=
X-Exchange-RoutingPolicyChecked: QPZ720D4Cb/KUkL1GLkpNte1rrTcHrPjhw8jbe6PHikEQxMr+BBhqH86U26HMXkj8wPqCG9EfOEs/KH7a/AqcUMP/PVdV92JI+l20S9u3Oqf9EHxUqjvNpu2I07AnbyG1KcYzl+qTutkSN9b0kp3myHGsSDXYYE7rGh1XVS9lF7sa3UrL73fyLTvFuGg1iiOJjDsXDfHZfTeLVEmG/uLabswbJO1XzJDw+43VmYdZgI6JKskrG5bI2nSKsx2o2FzZS/a9Tqr+21XDUiVwyzhTYbtDQ4JLZIrc0Pu/8yTx7sOAmZSrStcF7lbp3Xssk6c0biqEeyMMQfvfXfM/vutAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec77a44-e482-4fdd-8215-08df1fbe7195
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:18:12.0895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDSeJk+VJu2hW3PGQ0H+/DipKvYeo2Oq9P/o8Do4by9r8BbHG4O8UGIt3JOAu5iZWz8suXUS4rXlZmJe527a5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
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


On 10-09-2026 20:11, Michal Wajdeczko wrote:
>
> On 9/10/2026 2:41 PM, Badal Nilawar wrote:
>> AMC raises an SMBUS alert before performing a power removal or
>> power-cycle operation. The xe driver then places the device into
>> vendor-specific wedge mode until the recovery is performed.
>>
>> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
>> identify the required recovery action.
>>
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2:
>>   - Created sysfs during i2c probe time
>>   - Fix Documentation (Rodrigo)
>> v3:
>>   - Keep limited information in "DOC:" section (Michal)
>>   - Handle AMC alert none and unknown cases, document
>>     in ABI
>>   - Clear i2c->amc on sysfs creation failure (Sashiko)
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-amc     | 25 ++++++
>>   drivers/gpu/drm/xe/xe_amc.c                   | 78 ++++++++++++++++---
>>   2 files changed, 93 insertions(+), 10 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> new file mode 100644
>> index 000000000000..3bae78d1e0d9
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>> @@ -0,0 +1,25 @@
>> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> do we need this 'xe' prefix?
> it is already listed as available on xe drivers only
Make sense, I will drop xe_ prefix.
>
>> +Date:		September 2026
>> +KernelVersion:	7.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		This file exposes the reason for the most recent Add-In
>> +		Management Controller (AMC) alert on Intel Xe platforms.
> I guess we should add "... on selected Xe platforms."
Sure
>
>> +
>> +		An AMC alert is delivered via an SMBUS interrupt and causes the
>> +		device to be wedged, requiring vendor-specific recovery. This
>> +		attribute is created when such an alert is handled and is
>> +		available to all users as read-only.
>> +
>> +		Read returns a single line containing one of the following
>> +		alert reasons:
>> +
>> +			none
> other ABI documentations are quoting possible names:
>
> 			"none"
>
>> +				No AMC alert has been received
>> +			unknown
> 			"unknown"
Sure.
> ...
>
>> +				AMC alert received but with invalid reason code
> maybe either change above tag to "invalid" or description: "... with unknown reason ..."
Ok.
>
>> +			firmware_download
>> +			thermal_trip
>> +			oob_request
>> +			oob_reset
>> +			catastrophic
>> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
>> index edd50bf8261e..bb9d260f800f 100644
>> --- a/drivers/gpu/drm/xe/xe_amc.c
>> +++ b/drivers/gpu/drm/xe/xe_amc.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_device.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_printk.h"
>>   
>>   /**
>>    * DOC: Add-In Management Controller (AMC)
>> @@ -43,19 +44,23 @@ enum xe_amc_alert {
>>   	AMC_ALERT_OOB_REQUEST,
>>   	AMC_ALERT_OOB_RESET,
>>   	AMC_ALERT_CATERR,
>> +	AMC_ALERT_NONE = U8_MAX,
> is this defined by AMC (as part of the AMC ABI?
>
> if not, then maybe you need private field:
>
> 	bool alert_valid;
Will add this field to handle "none".
>
>>   };
>>   
>>   static const char * const amc_alert[] = {
>> -	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
>> -	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
>> -	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
>> -	[AMC_ALERT_OOB_RESET]		= "OOB Reset",
>> -	[AMC_ALERT_CATERR]		= "Catastrophic",
>> +	[AMC_ALERT_UNKNOWN]		= "unknown",
>> +	[AMC_ALERT_FW_DOWNLOAD]		= "firmware_download",
>> +	[AMC_ALERT_THERMAL_TRIP]	= "thermal_trip",
>> +	[AMC_ALERT_OOB_REQUEST]		= "oob_request",
>> +	[AMC_ALERT_OOB_RESET]		= "oob_reset",
>> +	[AMC_ALERT_CATERR]		= "catastrophic",
>> +	[AMC_ALERT_NONE]		= "none",
> is there any strict requirement that we need to use lowercase/underscores only?
There was suggestion in previous rev to follow this way.
>
> for sysfs we are printing text line, IMO we should be good with old names
>
>>   };
>>   
>>   struct xe_amc {
>>   	struct xe_i2c *i2c;
>>   	struct work_struct work;
>> +	u8 alert_reason;
>>   };
>>   
>>   struct amc_header {
>> @@ -104,6 +109,42 @@ static const struct amc_request amc_get_alert_reason = {
>>   	},
>>   };
>>   
>> +/**
>> + * DOC: AMC Alert Reason
>> + *
>> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
>> + * to notify events such as firmware download, thermal trip or a
>> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
>> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
>> + * specification.
>> + */
>> +
>> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
>> +					struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>> +	struct xe_amc *amc = xe->i2c->amc;
>> +
>> +	return sysfs_emit(buf, "%s\n", amc_alert[amc->alert_reason]);
>> +}
>> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
>> +
>> +static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
>> +{
>> +	struct device *dev = i2c->drm_dev;
>> +
>> +	device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
>> +}
>> +
>> +static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
>> +{
>> +	struct device *dev = i2c->drm_dev;
>> +
>> +	return device_create_file(dev, &dev_attr_xe_amc_alert_reason);
> can't we use managed variant of sysfs initialization?
To follow i2c->amc lifetime avoided using managed variant.
>> +}
>> +
>>   static void xe_amc_work(struct work_struct *work)
>>   {
>>   	const struct amc_request *request = &amc_get_alert_reason;
>> @@ -158,12 +199,19 @@ static void xe_amc_work(struct work_struct *work)
>>   	case AMC_ALERT_THERMAL_TRIP:
>>   	case AMC_ALERT_OOB_REQUEST:
>>   	case AMC_ALERT_OOB_RESET:
>> -	case AMC_ALERT_CATERR:
>> -		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
>> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
>> +	case AMC_ALERT_CATERR: {
>> +		struct xe_device *xe = i2c_client_to_xe_device(client);
>> +
>> +		dev_warn(amc->i2c->drm_dev,
>> +			 "AMC Alert: %s (%u)\n", amc_alert[alert_reason], alert_reason);
> maybe we should use xe_log(AMC) ?
May be in the separate patch with AMC component added.
>> +		amc->alert_reason = alert_reason;
>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>> +		xe_device_declare_wedged(xe);
>>   		break;
>> +	}
>>   	default:
>> -		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>> +		amc->alert_reason = AMC_ALERT_UNKNOWN;
> hmm, is AMC_ALERT_UNKNOWN(0) actual AMC ABI definition or it is just a driver define?
>
> shouldn't we still store alert_reason code?
> then in sysfs you will be able to emit:
>
> 		"Unknown alert %#x"

I don't think we need to preserve raw code for sysfs. We already log the 
received code with dev_warn().

For the userspace ABI, unknown should be sufficient to indicate that an 
alert was received with an unrecognized reason code.

Thanks,

Badal

>
>> +		dev_warn(amc->i2c->drm_dev, "AMC Alert: unknown (%u)\n", alert_reason);
>>   		break;
>>   	}
>>   }
>> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>>   int xe_amc_init(struct xe_i2c *i2c)
>>   {
>>   	struct xe_amc *amc;
>> +	int ret;
>>   
>>   	amc = kzalloc_obj(*amc);
>>   	if (!amc)
>> @@ -185,13 +234,22 @@ int xe_amc_init(struct xe_i2c *i2c)
>>   	i2c->amc = amc;
>>   	amc->i2c = i2c;
>>   
>> -	return 0;
>> +	amc->alert_reason = AMC_ALERT_NONE;
>> +	ret = xe_amc_create_alert_sysfs(i2c);
>> +	if (ret) {
>> +		kfree(i2c->amc);
>> +		i2c->amc = NULL;
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   void xe_amc_exit(struct xe_i2c *i2c)
>>   {
>>   	if (i2c->amc) {
>> +		xe_amc_remove_alert_sysfs(i2c);
>>   		cancel_work_sync(&i2c->amc->work);
>>   		kfree(i2c->amc);
>> +		i2c->amc = NULL;
>>   	}
>>   }
