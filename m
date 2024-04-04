Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1663ECD1296
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 23:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DB410E366;
	Thu,  4 Apr 2024 23:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITYdzW7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA16210E674;
 Thu,  4 Apr 2024 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712272983; x=1743808983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uVW21sRTtiHFh1XUUAaNzfXT7RfTn3qRsSSDuUYLle0=;
 b=ITYdzW7OJa3qaICbSOT255+bThdAEsa6sZZBoiGNiQCmyJBqTMj12ppX
 9w9hW7ZeCMl9k+StDgWolM/9/KvGkYo3pCpStazyCNst7wOQOoCOjTbj6
 0zTt3m3vUT7aREygtZ7RHmla8W5rCtnGm1ClFkm4k6nVqJLvStQ6/fwFE
 L+fzsudM1hsbRQJY/Zub+S8NRgUGUQJk/giTL673l2AUF2VVquvb/TnO2
 iPZ3rp0OrJ1DRPhuzarIM/J8umVoyYffsHebcST5KxEcCwxSan0T23ns8
 K1p86T8FFcZOX2lxKqnqiWC7UfHqcCPg8Ceqia3Wx2w4l3oAGAAt6Usv+ A==;
X-CSE-ConnectionGUID: IZztnsN4RSqK4p4Hi9eGEQ==
X-CSE-MsgGUID: PVUiXW7oRauJCXOX33Z54w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8169863"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8169863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 16:23:01 -0700
X-CSE-ConnectionGUID: /pXcxVOCTq2lsDEXUDXLLQ==
X-CSE-MsgGUID: t/KRdIL8ToS6WsqFSoMMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23611077"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 16:23:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 16:23:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 16:23:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 16:23:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 16:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/A2U0Ekx6R3/vWs8rnKfMZptPlq5CoIp8fNpglqq3GDfBnDIjPCIfBCPyE0LbONhPFRezO9uNpyVbIcOtPXfkH9VLjNJGTfrdtTJWmwC4oQMbF4VxdYleUz1QmEV83Aep2gwhWF31ww5brm9WkN21p/cAzaC0oyirQz4xS3aUKCUhc4nkF48hY7tACBTEpKS17P8GxLaf3n6MjclN3+o5futI/Jgb+eyQJBYp7vdyluunpiTtJlx+C9Z1xbpapcruc1C3q5+6s/bbuc5FhlPTyGFdR7416Ab85YiGL9aK6HRiJYCOeRz3Yyz6aSP/7v0+OOCickA2gW3xsb/HDwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApDgEyfcMY8vwygWSl1KyYAfahd58nhdlxj749nZtmA=;
 b=Lxnl4Q/82zlfgXcI/gkj0vpVYSW5VbVAk6L9Dz+38gpbab1zZmrOkw9BuR14RZm2sdViRuOmGa3ZZS8ASFBM3jNI3sht2TvCK1YOFEgzxbW+VMRnpWnbniU9uaTvdB1HCVImVe+Xa9Q0T4rpQOQMXwO29Q/ng6kI0gfydBmHAkDwKrrbHUfv0D3gTDZQoSLm7m42N9ZdrAfKv6NOQ9IMbAxISZRRovG8LdoojtN6I0SVBV2kg58sePWjDlYmnkF/q56is2wdBPzXcn8hAACtBF75nRyDGAum55yiPtJ1vwZNAhF192YaghdJUrauNs1KQ7rqi8F/yZUM73Patqq8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 23:22:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 23:22:58 +0000
Message-ID: <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
Date: Thu, 4 Apr 2024 16:22:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6738:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUGTudajKU3wGduDBwVGn56K7y69OhoINUR3f5BZ8laqWQPPFr2/mdx4E82R/NUTWC7t3OqpxP2zIQZFNr1ZJApXd8ybIfLD1JZ9a38WaXUCosgX7z8PjCi1YNX50hLVwySpV1TpTMq2aeCzJa10UxtTP+Pz8Zv63OK/4KoH8N9stpEfr2d4Nj0wYgsvfNa5nZDypHRBiBzgerxKwpGTOzYYTfhvIeDo0wggPuLdcRPq10k5BVIMHYNmPOoV0f+yUZV6pPnTinDTJIK9JlM4fsX1V2aLrGwWoI64x6Gn56ML7L/Bf9AaVBRPhHpbeMr0BOD7rXWAZBacRjWT8xo/ESkzwl+3NnUEgG0oXxiCVJ4XZ6M+4c//VwoCCKZwGpB4k4xLlaG5RK80thD66yAy9WVhWB+/oODdWI1B6ASlRtoEe10v3KyC/1/atnOcrtBqY8RbiZF4Lf37iaafU1woutBXbU1QTIJOrIYR7OMAN6/+mP7LITFD83nLkDWPQJ+2VJBqF8pWWX0LGjA7KzCc2UB6iTEPIQu+QQOqYwM+qUCqG5Utp3E7xRlev0HhogKf+2n9I596OiTNwYwpD8bjQUMtLRx12LJvMqkyCBNeEvSB6wY+lOwembkimIOmWa0F8J/UFY3Al7ywmaNmjHsH7wsbe4JvdMj0iKbQOPCaX5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xxT0lRT2pnMGlQRmJYVmx0VmhQanRtQkdrenZsUnlhMUM2ZmlKMG5ESHdx?=
 =?utf-8?B?OUFBVmJ0YW9CaU45MGNVVnhJOWxOOVd0U1lJOGNvMjV6QmpXWmIza0RLUE1y?=
 =?utf-8?B?WlkyUmMwUzY5U1VMRmJJeVJicGVJYWZKSDFidUVKTmhSRVBXRXZUbU5kVnFS?=
 =?utf-8?B?QzBtZTNPTmpoSlllWmR1cGNNbFZzUm12ZjMxZDU3OGMrbld4SFM2d2RhK09E?=
 =?utf-8?B?VUJtckcybkNWa0V5QXhtOUc0ek56RDh5Qk5UazB1RHZUV1BLVVBUYmlxK1R6?=
 =?utf-8?B?WHJnQ2VLYzNZYXJXQnhRcHpXNkpYRXN1RWo0YjJhTmwxMlQzdzhTd2lTVVJ0?=
 =?utf-8?B?ZG0weUoxOFpocjdBbWFCQTE2aVdJTTVUaGQvbzFwU3VZbWVOdFI1ZlhLNERE?=
 =?utf-8?B?RGRQWDQ4NVFuWVdvUnpFbzV0dkMxWmtIVkc4VXBEajc2RElxdVhHNTdnRmhR?=
 =?utf-8?B?eXdTaktiS1pIMmJJaVpLL2dWNG44cENraHhNWVZhQWFjS2I0cWN5M2I3MFVa?=
 =?utf-8?B?UWNkSEJHYkRGRHVhWXpyb3RrdGJEaktqRTVyMlcwN1I3V2RZMHpCTUNZK01j?=
 =?utf-8?B?ZEY1SEtoT0NqcDBiY2pOYi9Bc2hXOXNscjRreHU1NFoyUlBQWTFWTXJwYzN1?=
 =?utf-8?B?NDQwUHQ5eGd3dkQ5MGxvMnVJaEt4eVc4RFY3OFNMSC82N0NQQ09yazZtMHlk?=
 =?utf-8?B?Zk9SSE5rak13VWVkeEVQNnVkWDV1N2I5eVlmYTdqc2dEaE9GMWg0VWlSTitm?=
 =?utf-8?B?NUhWZU5NSFM0Y0lDUkRVcERUa0UrSGIrd0RsTGRqUEFXdzBhdE1lSGJYcEhN?=
 =?utf-8?B?TGFkNDNMVmUwZDdXS01WSllkVDdkTEJBb1lXcUlySWZBSHJ3N0QyVlRNVkUw?=
 =?utf-8?B?NXByTEpoc0ZoTklLZ2FidnV3VzNQcmplVTgyQUZzdHA0bUhWUXgvY0hVbzNH?=
 =?utf-8?B?MEpnVTRlbEZYdnJGc2xDV3VQNVlQZE9FMStLNjdoVjQ0WjZtcXd1K2poTExp?=
 =?utf-8?B?RVBsMllDSjNRYlo4bWhEaitWZFpxN2NUaWUrdnNLTmJuM0xKUzNmN1A5elhm?=
 =?utf-8?B?UEJqdUcxL0RmMHlobFVET0tGWFEzTWszNnB6cm02UTUxUWMwWXZwa3JXNFFG?=
 =?utf-8?B?YWg5SnF6K2pmeFBza0dQL2o5K3NlK0VlYkpuOXlNSm03VkFlVmhnVFZIclFt?=
 =?utf-8?B?eU1iTDhyckIxRVl2b1Rnck1IV3QvanY3WmRRdEhlcis4VjBKV1hDbmc1SFFT?=
 =?utf-8?B?WFR5Z0RPNW1KRUZJRHVucXRtU2h1T05uYlQ4SHAzbWszdTB4bkZYNmdtQk02?=
 =?utf-8?B?T3ROSVZ0RnJUcXNXc2YwdC9jZm5xaE1yTzFTUW1DcTR2b2xRYURIQUVFeXNk?=
 =?utf-8?B?L2pzbHJHa0J1dU1ZYXJkOElOSjhQanZqMWZwMEJMSkhXVTN1NTFWTWdlV3Y3?=
 =?utf-8?B?Rm5rdlU5T0UraHhHS3I5R0pLcnN0TW5URHh1SDVTTWdjdVFXQ3lWeW1FUFpo?=
 =?utf-8?B?NlBSbmdSWHNsM05NTFJKTHBoSTAxZHB4dk1EcjJuS1NxODVLaTN2d0hjYnBx?=
 =?utf-8?B?cWVnSkc2cWo1QjVGSzl4RUxoYVlRVDBlVnJHU1J0MVkyR2ZadjRuZE1ITEFz?=
 =?utf-8?B?dE1mOWFmNjhzVmZkd3ZEWUdHRXloZWtMMml3cHRWM3BhVjFIZERoQkYvaWky?=
 =?utf-8?B?UVlmUHkzdmNmNlRWdUdhTlp6cUdpVkJRYWpzdjhiSGJwYUcwZDJueFFIdmlU?=
 =?utf-8?B?ZUtUTWFKRDZUNE1ZK2pTQk40d25LSGszMDJ6SlphUmJOdTM4aTFZZHhCRVM5?=
 =?utf-8?B?M1NIQkxhZHpvbm84Tzl5SjhOcFJuQXVpTFJUVW5YbDdlZUMwT3RqM0J6NXcw?=
 =?utf-8?B?cWU5eVowbXR4TFdEbkttSlF0VExLS3dMUHY3Y20zODBtRWtoWXpmeEtBa2cy?=
 =?utf-8?B?OEh1WkVtOHUxSzFZZnV4ZGlBcjY2d0lMUDdDZlhudFR0WTRkNW9WL0MzNEdw?=
 =?utf-8?B?VStiSDFJc1N0RndBV3ZEcEtvZnhVWjNSbnFUNmZGUkE2RFdqU3h1OU5CQVFR?=
 =?utf-8?B?TVp6K3pCOE1DYXY1Nm9BKytDTWcrWjEyL3RkYWF5b0NQTG5HOVdocmltTkM2?=
 =?utf-8?B?bVdHaW1TVG1DK0NrWUhCUVI1WElvYTNhSWpsWFNVamRiY1VuS3ozSXAwamRZ?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc083d08-9f25-4ac8-6540-08dc54fe29a6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 23:22:58.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6w4x/WuQKQu8ciRV2m0o7GYA5Tx8C7/ei87YFZdvSCBpL6a3jiqGTP8Y31Ta+T45ixN0QjKAA4ohnaAcvZvRmaMxgLpF/yobvrHBPSflii0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

On 4/2/2024 22:35, Upadhyay, Tejas wrote:
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Wednesday, April 3, 2024 2:26 AM
>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
>> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
>> domain aware
>>
>> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>>> On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>>>> RCS/CCS are dependent engines as they are sharing reset domain.
>>>> Whenever there is reset from CCS, all the exec queues running on RCS
>>>> are victimised mainly on Lunarlake.
>>>>
>>>> Lets skip parallel execution on CCS with RCS.
>>> I haven't really looked at this specific test in detail, but based on
>>> your explanation here, you're also going to run into problems with
>>> multiple CCS engines since they all share the same reset.  You won't
>>> see that on platforms like LNL that only have a single CCS, but
>>> platforms
>> but it is seen on LNL because of having both RCS and CCS.
>>
>>> like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset on
>>> one kills anything running on the others.
>>>
>>>
>>> Matt
>>>
>>>> It helps in fixing following errors:
>>>> 1. Test assertion failure function test_legacy_mode, file, Failed
>>>> assertion: data[i].data == 0xc0ffee
>>>>
>>>> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c,
>>>> Failed assertion: __xe_exec(fd, exec) == 0, error: -125 != 0
>>>>
>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> ---
>>>>   tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>>>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/intel/xe_exec_threads.c
>>>> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
>>>> --- a/tests/intel/xe_exec_threads.c
>>>> +++ b/tests/intel/xe_exec_threads.c
>>>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>>>   	return NULL;
>>>>   }
>>>>
>>>> +static bool is_engine_contexts_victimized(int fd, unsigned int
>>>> +flags) {
>>>> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>>>> +		return false;
>> as above, I don't think we should add any platform check here. It's impossible
>> to keep it up to date and it's also testing the wrong thing.
>> AFAIU you don't want parallel submission on engines that share the same
>> reset domain. So, this is actually what should be tested.
> Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which helps to run things parallelly on engines in same reset domain and apparently BMG/LNL does not have that kind of support so applicable for LNL/BMG with parallel submission on RCS/CCS only.
>
> @Harrison, John C please reply if you have any other input here.
I don't get what you mean by 'have some kind of WA/noWA'. All platforms 
with compute engines have shared reset domains. That is all there is to 
it. I.e. everything from TGL onwards. That includes RCS and all CCS 
engines. So RCS + CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform 
with multiple engines that talk to EUs will reset all of those engines 
in parallel.

There are w/a's which make the situation even worse. E.g. on DG2/MTL you 
are not allowed to context switch one of those engines while another is 
busy. Which means that if one hangs, they all hang - you cannot just 
wait for other workloads to complete and/or pre-empt them off the engine 
prior to doing the shared reset. But there is nothing that makes it better.

I assume we are talking about GuC triggered engine resets here? As 
opposed to driver triggered full GT resets?

The GuC will attempt to idle all other connected engines first by 
pre-empting out any executing contexts. If those contexts are 
pre-emptible then they will survive - GuC will automatically restart 
them once the reset is complete. If they are not (or at least not 
pre-emptible within the pre-emption timeout limit) then they will be 
killed as collateral damage.

What are the workloads being submitted by this test? Are the 
pre-emptible spinners? If so, then they should survive (assuming you 
don't have the DG2/MTL RCS/CCS w/a in effect). If they are 
non-preemptible spinners then they are toast.

John.


>
> Thanks,
> Tejas
>> Lucas De Marchi
>>
>>>> +
>>>> +	if (flags & HANG)
>>>> +		return true;
>>>> +
>>>> +	return false;
>>>> +}
>>>> +
>>>>   /**
>>>>    * SUBTEST: threads-%s
>>>>    * Description: Run threads %arg[1] test with multi threads @@
>>>> -955,9 +966,13 @@ static void threads(int fd, int flags)
>>>>   	bool go = false;
>>>>   	int n_threads = 0;
>>>>   	int gt;
>>>> +	bool has_rcs = false;
>>>>
>>>> -	xe_for_each_engine(fd, hwe)
>>>> +	xe_for_each_engine(fd, hwe) {
>>>> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
>>>> +			has_rcs = true;
>>>>   		++n_engines;
>>>> +	}
>>>>
>>>>   	if (flags & BALANCER) {
>>>>   		xe_for_each_gt(fd, gt)
>>>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>>>>   	}
>>>>
>>>>   	xe_for_each_engine(fd, hwe) {
>>>> +		/* RCS/CCS sharing reset domain hence dependent engines.
>>>> +		 * When CCS is doing reset, all the contexts of RCS are
>>>> +		 * victimized, so skip the compute engine avoiding
>>>> +		 * parallel execution with RCS
>>>> +		 */
>>>> +		if (has_rcs && hwe->engine_class ==
>> DRM_XE_ENGINE_CLASS_COMPUTE &&
>>>> +		    is_engine_contexts_victimized(fd, flags))
>>>> +			continue;
>>>> +
>>>>   		threads_data[i].mutex = &mutex;
>>>>   		threads_data[i].cond = &cond;
>>>>   #define ADDRESS_SHIFT	39
>>>> --
>>>> 2.25.1
>>>>
>>> --
>>> Matt Roper
>>> Graphics Software Engineer
>>> Linux GPU Platform Enablement
>>> Intel Corporation

