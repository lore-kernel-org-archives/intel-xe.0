Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C96D6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A5810E02A;
	Thu,  2 Apr 2026 22:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjWQWS8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4B610E02A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775170301; x=1806706301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HxtM9O91z0OmnOa2amTQ4dMMKq51tilDs5PimuRw9d4=;
 b=EjWQWS8p4/pK1Ukhh1q2zHL4BA9UTQwh8BKdd9nLUS+8dXyAco0QKZV3
 ESMe8G30g9nZ1P2LjYGHhVuhfAH+Q36icpflWMAexnYwZt/Y9tobiUewC
 SqiU8PYsniBRnQa9tMB7u+CNGv/KSlvc44/2Ohg1fM5bIDDAavLB5iDGr
 9D0ry2QNP06F2EDTs+fRp8V5n23+xaseAy4XGxdEJcGKsToCvCHC4dl0T
 LLhUNiJGcX+qL8yhBteShBcHbU8Vg6iCgfVChf8j4C5mUkmv/LsMUJ/qG
 N57ug/BdM0O102eLiHHnUq3ui7lVFi9ER7rwzdJrdXhWakArCYhwh/mDB A==;
X-CSE-ConnectionGUID: 49vraweeTN6U1qwjQjD6ZA==
X-CSE-MsgGUID: il9gqH38QZCYAUQCeUlDmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86941476"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86941476"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:51:41 -0700
X-CSE-ConnectionGUID: nddzjuqRR6SSZLpYEuwqVw==
X-CSE-MsgGUID: 2R431G/SSlurd58nzU7OAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231137877"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:51:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 15:51:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 15:51:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 15:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZQ4mpISHaD6gSHAL4s/NnYpJr6KE5JWjK/0S/uPI8oVgiva0QRX2FqLlEAbkyd5LNq87N5ATWAsYv0x8RkwUu3A5wa7D9LN1JpCjNOnlZPz3At8ZNDcXhgxKrQxCBMzK+emJEdQrgqo/XecbXZhWX9DD+0/J6Ygihg9rgdER05RU0nRLKI51O8wfT7u1Bc/iQ3Za7xcRKjTPqqxJkuwpPnLmi3m4Z6mY5d73IDbGSKrpbl1tp+HV4VDpT5FFAO1O1iTrUAaJcffT3LyZp5cJuoE+KxogTW9yzuP7BChQsjOhsFILuFcG3J+diWAhs6Oh8WQ7aPjBKImE+RVS14sEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofz5rLDg5LCR7OJoZZYP6XLVbIIWxeX67nN7KVBEIyI=;
 b=bpBi2GG9O6zUytMcdlVTtm3zppbM6sS3W5G82g2eIT8YvCXH5KBaZ0xO1/WIiyaC+uxKsg4cWqr+0BXwaYqpXgaRLGRKFf+xKIgnlYiCqSjJoTSnpeIEDJ2Zw3UlD8LTG9nQgKVkr3+mVJEIO+TMIf9ml9GYvjeJ4sh2fpRgR5xfOdlrLdpsA5XoxLteGG7KLa0j/DJ931Eh4opq6UvfvTqOtDBJKUm/R7aqnuXFFNXAep3Bdcde8Z+Bs1wc9NqKIe2KGJt6/pZPjIQTuqzbdtiMosqbSAXDHLlKeisWX9EmHnr/pB09J44FBfHqmMS1S9M/GgVLN7Y2ytvRydKX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 22:51:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 22:51:37 +0000
Message-ID: <38565bd9-47e9-4727-aa00-f49962250fee@intel.com>
Date: Thu, 2 Apr 2026 15:51:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Suppress reset log for destroyed queues
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
 <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0266.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: c100fb98-bff4-4b24-c534-08de910a65b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: iV0B3sNbeN9ymGgHzl1MjBCjLQ2fSROAv5l17Shf3nue44Y8cSNVIDshXS8jO7er8QfQu3tnfch34xPmnY9QIQPM4Elr54fUZJy7ULdR48B0StOeepaUbbPEuQKDx5iGeOjYiO/JwrS0G6m+j1PSMN8Y2Botw+rxofys7XDl6FK/jtbPEaol86+lJp4kz9QpWaIenrnzPOWxtIwvpfIWYf3gfwd9M2BDD9FURIGhVpS03wqjXJhdnieUMs8F4di5mBJNqsEcsGR1LU7OiIyqakzT0H0Oae5d2lr1a1+ONeBdRjFRfU4Z76b62WEUDG9L8HEEZz8pqZhprwEU/zKtP5BAofuCE6ChBq/6P+RGk4nnGH9L6DwuGrrMZ8mwq2aGpjBHDBACSRd87hRJX4XnW1weJa5CsXd70HhJin755ZtSCeRQXxDSVzSIqjEdCXtm0nLjJmIXrdk2wzwhd5exh/iBc2fD6rW36VCM8ZZy7yoSgnIlLYWKotjv2ePH2SrAkvL70LzD7w/+VtmbKphUoBCdAK9QYyDYM9OVdRyd2gsN+4JJVwOOsMZ/DC2RfPfz3ldUk6+nJq9mVGZm2Ec8OLBvsJ6f51aqctpkCUUMrUfdaRRSMgLB6qkvRJZ+Fqny1GyperN3kY/WtLUJn3pXxgB0WLA9Roj23AI0aELIm7K6Sf+JNmtLS+tgDwIrBOkwRB1M+yzw70rwjNkq8KBJCuHrUfKTVTc1nChsm6uynJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZQY3pXVnFObUJYLzNsNG82d1NkNVEreEdYUDZudlgrdFU5RnUxa0Q3M25h?=
 =?utf-8?B?YVN3VTNwajBNZXUzZGxNYVhzc2F6WDBSMW1FOGdFc1BjM0h6RFVHZW5IWlE1?=
 =?utf-8?B?NVRTNEdISEF1VGh5SzRpaGJPQWZwWHh6aW5TWFFTWnZzRVVJb0dLelVSVllw?=
 =?utf-8?B?YzFwRVFvcksxK0FJOWdWZVVXeXQ1ZDdhc1N4QWw3Ni95TlRnaFFCNXZiOXJh?=
 =?utf-8?B?NXdaSkJzbXBDKzNQb3JvVzE2TlBOemlmM3dzalJNZXU2QUVZb0l1Yy8zYllP?=
 =?utf-8?B?NmZzVUUrMkwycUlPMDdQQWFoSDRtZFJteGc3ZENSc2V2OTM0VEpLT2laaHA0?=
 =?utf-8?B?aDdHYU5EN2VGdmk5WEJlbm5LN2ZRalg5dk1LQW0zcWt0YUc4OHBMZ3FaUlR5?=
 =?utf-8?B?S0k3QVRKeEJLRWc1c1FuMmYzQ3JFTEFVd0RhYlN2TXg3OU1OZkxEQTMrTDJ3?=
 =?utf-8?B?VWlkRENDR3ZnQWlYaWZZRGJDNFdoMlBEVGxOSmxtR1ZtTjd6QmlZK3RXSHkr?=
 =?utf-8?B?dkVxNWFOYlJGSmZvemtlblRaVks1WXdZSXhMQ3ZTU2ZpQW9MbXNJa1FaaEg2?=
 =?utf-8?B?Z3dKZThRaytsNUVUaGVoMmRXWllIdCtLaXFjY3dkNUhQandzQWRkVVBuRWJI?=
 =?utf-8?B?ZEo5VTZGSEJNeUpWN3o1SmZWMllMNFRJalJCbEM0VnM0MmVTcTNmaFhsYzVm?=
 =?utf-8?B?cDMzWHI1SlVVLzZKT3BzeFV4aWMySkJVRUJnR0xwd2p0WTE3RWRzbHQ5TndC?=
 =?utf-8?B?MWV5OWJkaHlmanZRTHpYR041eWpvTkw1NmU5OVMrQ0RFS09JZGpid0NCUzRp?=
 =?utf-8?B?SUNzM2hQL1FyL2ZEcEUrNGxMMHFOa1VpMGdxcnUrdXNwc256R2hpY0IrUkRP?=
 =?utf-8?B?S2g0UG9pZzJyaE1HQ2dnSUg1UzZxTXUzb2ZWSlNCTnVKWjRUajZjb29NcUg3?=
 =?utf-8?B?T1l5QVJNaHVHVkx0VWlhdEp2VVMyM0pwL09JYVNKV3V3amcyVlRPNXZLMVN6?=
 =?utf-8?B?RXdabytkNWlkYldiRGh5ejNmMGtQcVNpWXlhWTRjcHlqajliYy9CdFFJazNs?=
 =?utf-8?B?d1Y2bUtFWGZwWnNGZHA4ZGhib3FXQ29BSWxZcVp0WTlUbGJldDI2bWJkRytp?=
 =?utf-8?B?dWZKaCtZbU9nUjJmbW5zcnNITUdGSGVpQnhZR0IydmI5SW9wMUhjQlpMNkdh?=
 =?utf-8?B?NVd3cy8zS2xYWmdhZmN6cVk1WEUwVldPRGlab1QvVGxjOXBwTGNBak80ZzQ0?=
 =?utf-8?B?N241TytNRCtubFZyUEh6YVJ1STZqYlA3ekd0WkVsUFI4MnBaQWRKODJiUTVz?=
 =?utf-8?B?WHlyRTFocm1vemJrRkk2QnhjT1B6cGE1U0ljeVlTQ2dqaVFXMzdDNzR4VHo3?=
 =?utf-8?B?M0lUdUNtRWRYUlA2SEJUbFNiZUZUc3J6dmlWTlpvZWhuQnlZdExDczVMQWFP?=
 =?utf-8?B?RnVCNGYxa0pxSGxsaXNvaSt1bVdOb01HT0VJU1hNNGMxcUVRcTJycEhKVUhX?=
 =?utf-8?B?bGR1alVkbzRDS2U5QVJRclhkMEFEYWhnVHUwYml3eDFOeEhuNThHeElwaWpX?=
 =?utf-8?B?SThtZUFBVTk4YW9jMW56YkthTXFCc3Zvc1Bwd1FoelEvb2Q0Z1NvZmV3bDBx?=
 =?utf-8?B?SGRmZ29DNGhTVGZOSDBFZ1R0d2VvRGFaWGhOOHYxTXZvdy9ZM3hpbUhiR2Jy?=
 =?utf-8?B?WExiSFh1dW1KQjRGcWM1ZjdUdnpLZHVOdjAxaGdHNjFNMnRBaUEycXBsTzZD?=
 =?utf-8?B?VmlQOHFmaW10WjRodSt6Y2pKZnlpcyt5elVFR1pzL3RIMlVaaXg4YWtkVTY2?=
 =?utf-8?B?dkpmeWhXekwrbmVzaWRjdVYyWUhxek0rRGZXdkwwSTdQVndnL1BsQUoyMWJy?=
 =?utf-8?B?THU4WGF6N2E4S2pTUWJSdU5vYkM2bHhCUWtxRWRFcWJnbnNSTjdPam9qSDNN?=
 =?utf-8?B?ZnFwazkrR2FDZWw2SG9YMWhpRXZZcytTeWdQZVFIOTNuRndWajBSdFFwQXdC?=
 =?utf-8?B?ZGNpQll4NkdGRVl4ekcxNzFSclJ6NmFubUE5R29UQXdVdmJNbGhsK2hGcnlw?=
 =?utf-8?B?RWdOQ2k0ZUd3Ni9Oa2EzUG5zTE11QU1tWWFsb3BlR0FWbXNVNk9PRWljbm54?=
 =?utf-8?B?cW1lUXpFNkNLMGJqRVcwemVmbytTcjM5WDJ0SXZaL0MwYW9uNmg0dWxXeU5r?=
 =?utf-8?B?Z2tDRk5aVlIrVlFua1YwbUpuTU93WmRISWhEaS9JRDhCT3E4R2RaQ1lJbS96?=
 =?utf-8?B?VlhYSktTbHF5UW5oYSt5a0NFOXd2czRZd0t5MldFMUxCamNrMnd4dUgwcmhj?=
 =?utf-8?B?blQ1L0U0dlJOcERnZlVJOGw3NDdkQWxCWnZlbGlhS1ljOGpuUmRrdmhUeEJO?=
 =?utf-8?Q?Y7bCx6V+GAx0YM6s=3D?=
X-Exchange-RoutingPolicyChecked: TfK9fOTO1bBPlWwPF4sdsTDVp4qvNOzEw0gDzr0q52ZeQQeG/cVGXM+wnHE5gs4S3KDKXnaRJWCC39cL4+UVmtP6bEeFSK+BXyF+FzYw5DDoMJdjYBAfFde63rUnJ9HL+4Gxaw+0ry2+mu+M4S8z+QIw7VgRSK7SInPMEmYXekGBuL03ATyqU4wQfg2/p9GCqCpWS0gqnYqRlyRZBU8aWVfr9AKhPvMYGGFqBrc3ls/5WfBt6RnApZkFMNjNLkvwulipdBr1X3yy6zmAas3heVRjhh3iz9AVIgYpAV0XZXaRWBj1qCI5iOssfjztxMjWEB4zz0XhLZaOpHTSZIGxnQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c100fb98-bff4-4b24-c534-08de910a65b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 22:51:37.7265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38JYRV8P31MVinGbpKDKZHVHKQvhCmptHk6RQCu9dZL8+gokldQa/Qp2qvhn/Y6sjduRpmxV7VTA6Y5xQJj1mUJKi1xdYCx+fyDRHjoMUQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
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



On 4/2/2026 2:37 PM, Matthew Brost wrote:
> On Thu, Apr 02, 2026 at 02:30:30PM -0700, Daniele Ceraolo Spurio wrote:
>> When a queue is destroyed while still active on the HW (for example
>> because the app owning it is exiting abruptly), the driver tells the GuC
>> to preempt it off the HW immediately and to reset it if it doesn't
>> preempt. This can cause a reset log to be printed to dmesg, which can
>> be confusing to users as resets are commonly tied to errors, while in
>> this case the reset is just done to speed up the cleanup.
>> Given that a queue is only destroyed once all refs on it have been
>> released (i.e., no one cares about it anymore), the log of it being
>> reset is not useful and therefore we can simply suppress it to avoid
>> confusion.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 10556156eaad..e6702bd99309 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
>> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>> -		   atomic_read(&q->guc->state));
>> +	if (!exec_queue_destroyed(q))
> I think you want killed here—right? Destroyed is tied to the refcount,

I actually wanted destroyed here. I was thinking that a queue can be 
killed outside of the user control while the user is still using it 
(e.g. PXP queues are killed when the PXP session is invalidated), in 
which case it might be useful to keep the log.
I have been pinged multiple times about engine reset logs on destroyed 
queues and I kind of got tired of having to explain that it was 
irrelevant, which is why I'd like to just suppress the log in that 
scenario. Maybe I can rework the commit message to be clearer on where I 
am coming from?

> whereas killed is tied to either a user closing an exec_queue or the DRM
> render FD being closed. There may also be a multi-queue case that needs
> slightly different logic. I forget the exact multi-queue teardown flow,
> but IIRC it is slightly different. Niranjana would likely know that
> offhand; otherwise, I’d have to reverse-engineer those flows again.

I'll check that out.

Thanks,
Daniele

>
> Matt
>
>> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
>> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>> +			   atomic_read(&q->guc->state));
>>   
>>   	trace_xe_exec_queue_reset(q);
>>   
>> -- 
>> 2.43.0
>>

