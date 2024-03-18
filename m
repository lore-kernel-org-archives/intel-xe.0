Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF0DC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 15:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC3A10F929;
	Mon, 18 Mar 2024 15:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5+0xIQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A22410F929
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710774919; x=1742310919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ywYuUK+Y3GovBI44A14EzzO0cOHygMZA/RIqriR8mxc=;
 b=L5+0xIQMbqb0vXIHhoLgpBLd7oT50koh/YwZn4O32CLNSz45Hx7j2UO1
 6SqoKDiDMlw8vLWupNUag40yuvE+gq1iq+JetCjWvDK0ZadA0tCKtNPfU
 EXFhJihsynhQS8Jouj4bjEdSMe48Wk9a7Y+w9RfV8cN/OnNnIl8moIhx5
 nYrEurIWBaqZVJcU1muJF9R8u6vP5wY6faS79oGrq+HCLwvcEW+QrPhL5
 A1Q9FTOTA10UAMuspKebQ/5wlPEJQX4HdU1TAT9pdTLN2reKLpk2nEyDT
 dII+3JCY83iZc4cZxwe5n/5UA9yNjG+gDRGpDNFB7Z4QzL81EEhn69k7P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16231254"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16231254"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13554824"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 08:15:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 08:15:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 08:15:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 08:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIJH+wqgxw0KlbE2Clk+QlP8nSoaOYqUzStT2E1eJKljXfIAdj5ZZprwMHzwT5Dm00ERmPQnzGpqnxfX4jL6895eiMF+rBGikUPI0BSfsC0Xp6ynZtyBTLT/YQ16tvEaTyyRR3oQ/B0nWKXQzzpFDZrDVqY1Z9j6HSMMQHhIJ2q03KJCUuW7L96W8w08CQ5GzTFEK+Uc58cEtyBs8SoFspEhYP5api8lN1wx2zDq8PhbUrdHqMWSKYz8EuvyiOlexRpNEhjwrDYcFzNXcEVQm3/BhtnHLlCiHl2mbfOF7ibiZbrBz+G+AsNSqbx2Mtpkb2RDf2ajtlbmcO22EDgOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7QkGG3c0GRkoHjB88ptw0qx2dHdjqo9Ikjy7DDSOUY=;
 b=jufoZVzUYP+wfIhuhF7xGMfsK/gPvgKDddlbHlK6LsD18/2hBHsic/7w9i3pTMcdF/xIINYINUQE84qDMRMskPeJFgiRmVjvHfwH+YO1NfNVSQzN9WQqIx+EK56WEgPXusMyM4j1mKTM42xOGLOZlbV0gXVA509C+GrUGyYS6zmgr8EWcNjttWgG2J81n4m0GZG8UsknCfR6ZslLZxFCUDeKspFC7I+AES6D6V9D9ehtJ5T/x75I0D76QEhRdMoeb8ROl9mRqkMiXOxOYp+oRzNTjoS9tEzXgcl081XE4yOZf3NH6cQ1ZAKSueXJoTTLEuT9VWIMYrGLXYPqZkEirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Mon, 18 Mar
 2024 15:15:15 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 15:15:15 +0000
Message-ID: <62620928-feb7-41ec-802a-828c27e76664@intel.com>
Date: Mon, 18 Mar 2024 08:15:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
 <5ukhtlrlcyw4n5shqptrlpyxfaye57zrrqtmajoq24xqejvnvd@qdk4jvbnworx>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5ukhtlrlcyw4n5shqptrlpyxfaye57zrrqtmajoq24xqejvnvd@qdk4jvbnworx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 4392edff-6e55-46d4-bea6-08dc475e36a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Knsi3pBjy7f+RTHyKj+O6CT7d7wUE0GGTF4hLdETfnG3aS+MDHKXiDrH+JoFFaXzexL3qbSmhUm6qcGZTsxj7lvKmcZ8vn6PQQnsQi6zzLFx2nUmC+uIQhWyQiHkWMEJTvaSXejeBQal3NW9k5T3uvbfr9rEw1GBe13S+wiUWTzzJXrNB/h5zYgDZp/9wjNG1KUxFqUgINSuVn76ri2Egt8fMF/oGKrW7XZYuixen87dxOTjQvQfONQy0+S7QNBSL3CEYB2uaMkN21W7muNpLKc599SnO5s1yiyzzfCbw1nq6+TI5km62ms8tdA3fpZK8t8phpCPCZt9k0CROC8qcl43pOMlVrLQxpuRKWBta+NZVoxPNUE9XOzr0WATGAXPVKvf4rDc4mvmwppZVREyVAjRv4o3EBgIqlU9QruidctHOuzNFvjysbLB13don6H3iCw+tQvJMOqXSFBuVZB7oa3pRAtPvnVzpfA0Yy8fM47QeNE8PKNWJq7RACZeb6GpvMhvL2qN4u+JYW+e9lSpolHDLuqPlzwI8+Jg5uXnZOyDdWieULq2+iUtsR3VACUCYbXfuxKax4BZ/FkJ+5rG+LRPboh1epdfiB+MrB96BWAHOOxWTH6dRb3Oc8DHrEHjw1YJMwAskp6z1RycY95rnvXYFu9OVL5EowYrmVSpxxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFXSEhjNnprKzVYSzZjOWpHTTBCT2ZUYlpkSko3SUxuNTJtMzhXWFlTMWlq?=
 =?utf-8?B?RXFyNTM1OEF4R1RyL2Evcnc4OGlkakN0QkVLM2FKSU1xSEZJZUJUQlpuRERz?=
 =?utf-8?B?cno2RVZVWXB2QjBzcXlKYWk1amJRcjZ3ekVmNVYrOEdacnFZYklWZWFaYnpx?=
 =?utf-8?B?cDRjaktRWDV1SE1nS1ErWjVoUzJKVEZWLzVDUVRsNWtmWk8rcUlKTHNRWGhw?=
 =?utf-8?B?M3hQUXpua0NBUWc3NzJOaUthak5GWjlBYUNEYktqUEd1M2YxN0JTd1k5SlNT?=
 =?utf-8?B?bFpKTFVndkVZaXRSR2Z5bnV1Z0QwcHVBQ2s5YlRrRjBzWVByNGlFQjBSdCtQ?=
 =?utf-8?B?VG41REhJbEh0WXdZb0RQNDh6aGkrckJqTG5iUkZZYm9xZXlIVjAwcWtzUHhM?=
 =?utf-8?B?VUFQM3poN3o0Q1lzY2oxdThSeHFYUVpsUVhxT2lNeUdlWktpcVlrU3RqazJL?=
 =?utf-8?B?MGxSdDVpbHYweUFPNGkrTTg1N0pqbUtiKzJkeTVuZEtzMHhPMFZFQlJpSGNo?=
 =?utf-8?B?dm1iQnNTNHpsbFJEbEhPN1VReCtYTGVlQ0IzMi92SFlMdUQyaWxRVng5dVpF?=
 =?utf-8?B?SmdaVm5zUVB6OWNUaXUyOVQvdTYrWW1nTDc4YzczY3FPcFhmTVllanZNZVdZ?=
 =?utf-8?B?N2h2VTZ5M2ZqVktKZnh5UE1RNUN0VTJlUXl3TVVKS3lIMG16QWNUUGVuRnFZ?=
 =?utf-8?B?NTNneFYwN1QrdFdGaDVnQ1Bxayt1a1cwT2ZqeHNoaTNPRTlTczg5enlBNWRW?=
 =?utf-8?B?akxNOTJHU1FmR1NNNWFRVnBYTjVLUFRpeTUvdG1DS0tWbDJxR3F3SVg4WnN2?=
 =?utf-8?B?OUNXa1Bjckh4STZvaUxqUVZubjRwYWpkcmQ5R1BKOU9DVnppb0NYOXlHdis1?=
 =?utf-8?B?dXpaNDVTMjZrQW1qK25haG96T09tY0UvUURTV1JtQkJOU0dPL1hXRCtMQ0oy?=
 =?utf-8?B?SUNTWGVaYUlHY1FlZlYybWU2Zm1XbVBtV1JidnlpN0xid0U5cHNHaHJvNWs2?=
 =?utf-8?B?cFYzVGdZZ21objJxZWpVK3lVNkRHaHR0SWpPMXdwa2dxd3I3MEgvV3ExSytj?=
 =?utf-8?B?QXB5NjFGRDhzd2FKdnNKYnlKeGgwY0JETG5ZNWdSc1JOTUwwNmRCVHR4MWY3?=
 =?utf-8?B?Y2dheXF2WHdMY0Vud1Q2RTZhZWNITlVob2JOSjN5VTNKN0ZzbnRlOU1wY05q?=
 =?utf-8?B?ZkQxdkxqNDMwT3h4Z0tGREpqcmxHbStxN2dSQ045VzdqcURtblNSdDVJck85?=
 =?utf-8?B?ZUJaaTA4ZjVKd0RsdkZiUFlmdnlSbG5LRUgwZFBpYU51TWVkdTFiYVN3cTRJ?=
 =?utf-8?B?b2N0Y3dmdHFDeVVjcFZsWVltQkJBeUJtV3NtQ2RpKzUvM0JweTZCeVp1K2Fo?=
 =?utf-8?B?TkhHRFo5NkJ1L3AvQVZnQUtqMlhNVFprcTVzMU5XRFNkbXpLQTFMQ2JkZkR3?=
 =?utf-8?B?T2ZlaHZ6NlpMOVpic3MwN216cEFrTEpkb2FTMi82YlkralNiNlVIMENITjBK?=
 =?utf-8?B?SlhBMjV1bHIyZGY3WnNrRVJ0ZE5sOWpRaDhPTmFDeUttS0dSOUhRUnpUbG5h?=
 =?utf-8?B?VGRpbXRxUkl1eG5YOWR2OU4rcGxIVk9aTjAvWjI2d1N0bWFZazFvRFlQSk9F?=
 =?utf-8?B?dktxdmhmOWhqRktuRVhoV2xaZmhoemVmR0sxSTM1WjI1MmRwaHlMZXcxMUJX?=
 =?utf-8?B?c1dOQlQ1NmtNMWloN0R5VG8wSFVYMzlCRklvYW9xQnNCZ3JwL1dkbGlkN1FG?=
 =?utf-8?B?cWxlUkdySXdYaHlhYXQzbnhJSjczYks3KzhJU0lhTWxBZmNEaEtLektJYzJC?=
 =?utf-8?B?UW83S2QyUDY0SndndG56UTBPeDRPKzdDeUhWbXBkWEdkQ29DZHVNbkJ0TjV6?=
 =?utf-8?B?Y0xVaXo3TW0yZmh1Vi9kbkx0QVEvdWFKQ2FIbUlxS2pwLy9ibmM0UWlBNTFo?=
 =?utf-8?B?K0Jka2E3aXQ3NGxlUjVlTzVmdVB6WWdvSUYwMFdXL2U2N2EwNzkySGt6aEVh?=
 =?utf-8?B?WDdHcUhka0swZ3JJUVMrQVB3MVlJVUNjbDljZEc0L0VYclpmQ3hIZjVqanlo?=
 =?utf-8?B?QjZCWkJERWFVMHVmNUdqa2NEWTRBd1Axa0kyc0czQXF4Zmp3Q3NYMU0wSUZl?=
 =?utf-8?B?cmF3OUZmNTFEeFNYK1pjZkl4ejRrNis2cmMzeHJRSHJFTTBwQ3IrRm1ZZXNI?=
 =?utf-8?Q?GNOAnG+PXKlwvGRf+3R4g1I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4392edff-6e55-46d4-bea6-08dc475e36a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 15:15:15.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U35E0amSjywqYkyrSKh2a5hIYLm9rkLl6M8LKj0KQv2K0313n/xanJTfyZtE0kpBuYtU4j241Rncx+vVjEn2bPvxn48Y4NfZHSoUvDsoQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7636
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



On 3/18/2024 7:48 AM, Lucas De Marchi wrote:
> On Mon, Mar 18, 2024 at 05:10:57PM +0530, Tejas Upadhyay wrote:
>> Remove continue statement which does not have real effect
>> as no actions are to be taken post continue.
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> as this comes from commit 3d2b5d4e28d9 ("drm/xe: add GSCCS irq support")
>
> apparently we needed to invert the check for class since GSCCS is
> OTHER_CLASS, but it's expected to return a hwe from xe_gt_hw_engine().

I simply didn't remove a "continue" that was already there when I 
removed the last statement after it. My idea was that this way we 
wouldn't risk forgetting to add it back if we ever add something new 
again at the end of that loop. I'd prefer to keep it in for that reason, 
but CI should catch eventual problem so I'm ok with it being removed if 
you think it makes the code cleaner.

Daniele

>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_irq.c | 1 -
>> 1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 2275ca35a3c7..996806353171 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -326,7 +326,6 @@ static void gt_irq_handler(struct xe_tile *tile,
>>                     xe_heci_gsc_irq_handler(xe, intr_vec);
>>                 else
>>                     gt_other_irq_handler(engine_gt, instance, intr_vec);
>> -                continue;
>>             }
>>         }
>>     }
>> -- 
>> 2.25.1
>>

