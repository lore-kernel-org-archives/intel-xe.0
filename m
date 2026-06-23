Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A8CD98F0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 04:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FE610E927;
	Tue, 23 Jun 2026 04:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mV9A7axm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8D510E927
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 04:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782187413; x=1813723413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XF2YWRjaTV8wkd9lpwDJStMdX/0w93vHTJSghEDLbVY=;
 b=mV9A7axm55dTbwI6ymrMfuwitZsh1iPAgheeIe7w0E9ft0YRDFFxPM+z
 QrlNmwPLanJ0ApLk9jczQnK9iS8hjRzG7y6El2G1qoj+iMGpR/5wy0ukN
 LCmFs07v/Om/cHeF7c1/PCN7RZcM07uPffpbBJcqgNfEBGrqgRKBL/7I5
 pjbb1So/pyLF+A8cQbhMDru04Gyv7uEeeuOdL1gXLv42EsYZK6iXQD5fs
 X5IZ8HGSJzz1N4lmBH2jrWhrOcdy11XOoJwzJDwOhG7FWa338tjmBbTuF
 xvrW8ikvC6InvCCRRa0ERtaQA7cqmVXkrY7iec3t06d1rqMzhADVTgLPj Q==;
X-CSE-ConnectionGUID: AtMrKwo6TZCP9xMQbQbjEg==
X-CSE-MsgGUID: 7MHoy/o6Rs+gwsE6UHAagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="105716268"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="105716268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 21:03:32 -0700
X-CSE-ConnectionGUID: z9OLUTqqQ/yXTd+oJL/c4Q==
X-CSE-MsgGUID: JXTHZDL0RWGdj9Jqngq/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="279583073"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 21:03:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 21:03:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 21:03:28 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 21:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvmRzMa49n8yOL7bt5K/g906QJY1dfJLb5uN64aodEoxqFLvM2IxJUV7kAt1G5k4XSAVnaBqqQekTfWt0eg7TIas+Ok2FQecdHMxLwVl4TaqBgMP0uaorMXB+bkXkmA+iGnagi6HNFDiGZ8VxczIXuA5Lo055vOIBxkYBnDELsbxOI/bFR2oKqHa8rMrV62tygmOZaAuyb7FVmHlpjEfcmtw6Az7Ib+Oc99VUn1AbBYxZ1UDvaruTJxpMjnByerafGrmIns+CvNsjH/oFPWdU7os9Sxa84QOWuXFw7yy3/S1bCRhR7qmQx9t/EyvTiJB5xLbJrDKZOkpMa9B+n+/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkYpitTLxAQgutOY1W2pKUrMSTpxE2shHg6GF4BLSt4=;
 b=vHp3nd+GepqKRo43W8yQxTFxLBL3V5EFUADb2MNNQTySXilqjsH+orh4OddlH62RRMO2KPRYQxW4LAVEiWmwyhOjy+AthzRtSxAT88ZX/BkCl0eztnGexnc9gOhjCc9sXK+9Q/s6ebKj4/Lk5K2hO9eDFOe18sIIVUnw9+q7CciusysDljfhVfUzHRzVABuL8a6ietXboWPs2zg6i4VkL1K4GwiCP4oWeUNGTJV7iXCZprzc805KOkP9spzPXGRRJkizcd3EYaeSucEstvnKHxBI7sK4ByBJ13U8c3nKZOdwhzDIJT9aL8eLsEI3M6POKuDhYY5NFfOo18BQDUN2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 04:03:17 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0113.015; Tue, 23 Jun 2026
 04:03:17 +0000
Message-ID: <b4941276-145b-4ead-8c5c-34190bb46ebd@intel.com>
Date: Tue, 23 Jun 2026 09:33:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe/guc: Hold device ref until queue teardown
 completes
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260622091335.2222655-1-arvind.yadav@intel.com>
 <ajm1A1+b6UWuzlGK@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <ajm1A1+b6UWuzlGK@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a550b2d-c61d-43fc-072e-08ded0dc5ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0HC9K8ro6Gf/V38FOhuKoCOI5YoHB6rtIVyXfeHa+A30CF+zipVc0N9aWWWXv+tWml37nibPNGvwW+GjB0++W36ox3RYfbZRE4JDwRxyFia5Pm+wIs0m/0rk7HwKFkIYOdOOaLIYT9nMIhz9u7t6tMybIsMsRqlPbyBgaFMLJzxy61RndOVlV7CGr+mg6pvKeHwpmscoJR7/W8BRBwiq89YMZTLQihPtwNsdOjBmAMtbAGsSpiOuVPmsqVj18NnB5MEMFupRkQbpM5SinC598sSJTszvAuVC8GRNMKFj8vaid2PeLnIxvRfeZwTsgXMVHENv40SZppKRvGVnjnMYd8ZBHUMGT7iZK+lfuou+Xgcv/I/wtHC9RDkAP0PiLFjux6Xy/Ixn7xPgoB62aJ5FHBG0nk9tims9+iU/KaI/DoRJSsXVVUp7EEESgFcMzuJQvrmIyMhRsmwZv2ALJtRLbLqF9A3u8Re12qkTJrNPh3v6Ou+XUrYmYbnDrnC/biUhJlTKa75kvJ93wpkPBYJVNoCU5om4LtzLwRO6HIvU0QJ/nnI4opnpW7mi7bILf+M3mdveg1qs0rHdZcNVAG+WTmKKr7/FB8bAPM/hErKcWZOCI1oO/FygjQgFTFjj7ONjao8fQ0szeVaAdNT1nnZwpREBwshMXDPWqbAGiN2hy9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWFKcGJEZ291NVExOXNITDlXTmZpTHoxVHpRamYrejQ2Tm9Ibit3c3U5MDEr?=
 =?utf-8?B?TjljWTJJVjhPUUxYYXdFTUlzS3VhN2pVdTliUEpyN3ZicGUwVXE1d1duSFc5?=
 =?utf-8?B?aE05NllKbytiS1ZLVS9uUklqNE5IMHh1SmRZMnB0cVZyb2NodXlIN0cwQzlq?=
 =?utf-8?B?SGxreE5aUUJ0a0JyaElCVlE4Q2FKR1hVQjhSU3I1czdyK3d2LzJ4T2NKb1dL?=
 =?utf-8?B?NWxkempYVmxUVjg2MkdFUzhDVzJxWlNrZ3ROZEVna3pWOUJnOEVDNE9uZ0Zi?=
 =?utf-8?B?UjFocUZQWXB3RWtOUmM5dFhZeWEveHRZMThtNHkwM21pNTk4amNqL0srTzN1?=
 =?utf-8?B?RjRGODlzNUdpdlYxejBPWE9kR0N6VDMybDV3YmZrTnI4UE9PTW5Zc3ZETTdH?=
 =?utf-8?B?UTd0MEFucWZQek5SVzZ3VmU4dlBXNHV0ZUt5a1FRK0VUQTdPWXJSQ1NtcEV1?=
 =?utf-8?B?ak00Q1VlRTBGT2ppT2kxeUR0dCtzQWppWitRMGJCNmEvMkt0Y05idTE5RFln?=
 =?utf-8?B?TG1reGt5bURQcEl0aXlxSTJtSVVEbVRZVUovcmdZblV6Q0xlQklkbTQ4bDhw?=
 =?utf-8?B?Rk0wU1ZLODJiV3RmeDhXV3BpLzY3R2hSeUVpa25rcktadFpmNzhtR1RLakFi?=
 =?utf-8?B?U0RWbFhET1RzUHROaWoyQTJzeUdDVElPWnFtMzQ1Q1M1QTRBc1VyQzRuYThO?=
 =?utf-8?B?Q20vOVlvZlpNclFwbFpDOWhFdGNvL2ZONmUxbU8vT2Z0UW1QSXlTYjQzemNp?=
 =?utf-8?B?eVUzcjBIdCtjOTRoTzZFTThWTnZBeTZocGpDZnZFNXd1WnVFNW1BQW1kL1dT?=
 =?utf-8?B?TUZqZE02NUh1U2gyWHZSVUgyQUMrSkpsNHpSMEZWRElIM2pnL2tHaTl5SFJx?=
 =?utf-8?B?dG1VMVlRZTgzK1BLaGVIQkVVMWhuQmF6ci91ekplc1IrK3huRlVTRGlKR1Zy?=
 =?utf-8?B?MmNrQTVsazFsaTVpUWhDbnN0QWsvblR2SEg4M3YzdjhzM0xGeDN0T1djODhG?=
 =?utf-8?B?MFE1ZlVBWm1mS3F3Sk0yVUZBVjE3YlBod0lRU3p1K2YvM1gxeUFEQy9EWFVT?=
 =?utf-8?B?Nm8zb3dHbDBMNTNsZXBYa2NxVEdmeGZPVEd5aDdWbERXaG5PYWtkcU1wREhG?=
 =?utf-8?B?bXcyMENGcDR0Q2R3ZHJMdktLZmlGOFllSTN6bjZhenp1aHVxQ2UxOXkzVVN2?=
 =?utf-8?B?SkVZY3ROc0hMbTZZVTRkaTgyT0hsTC9UQXhOOUIwWDVGTitTYnM2TEpwVkcz?=
 =?utf-8?B?WFNoZ0pIMWhhdzFaQ0JDM0Zrc2cwZENkZWZEZWlwMnpReTUyT2R4MVU3TDJm?=
 =?utf-8?B?cTJtQWdVRENhZE5OeTdGSFBkRmtsV0FwWVdiT05LaHlwcHE5eHR1dEtGeVc1?=
 =?utf-8?B?N3JGamdJdnRLQ08rYVJ5T2dFWHA5bHNPSzQrcVN0dlN0aTRCYmVsTENVVUFU?=
 =?utf-8?B?ZlpsNzI1bkhobXkrclB3TXJpWnpZbzNoZFFGREFqa3NiaUR0Ky9ZejBsSUJQ?=
 =?utf-8?B?bjhqaStkNUM3QmVxNE5GN0VjYzN3bkR1cUpLK3VEZVo0OVdMazNWS0ROY1lu?=
 =?utf-8?B?aUNnTFNVbVBvWFpTNmUwYUoyQTdReGpVdmszamxoUUZPNlZrTWZ6eWI3cDI3?=
 =?utf-8?B?Z2c0dThTNUNRWUFjWTl1VTRjOGhnYkhZSmRVN3B3WXRvNXpoVkF4SElGbE9D?=
 =?utf-8?B?eitHVHBWdHY4V2pqY1o2bndPK0ErTUZHR3pXZ3NxNEN3Vzkzd3ZHdW1lcDFu?=
 =?utf-8?B?MXZaMFRhaGc0SmpmcEdqU2VMWW1DOWkrTS9SL2xhdU9JeG1idGFQNkRENzlT?=
 =?utf-8?B?ZDhZbjYrVlJhT2wwQVBjdDAyaWZMOHZzdVJlRVZROXU0V1lJNDEwTGZZb2Fy?=
 =?utf-8?B?NmNDYjhCTEpxSEVaY3JFaE1RQkZ2emRWSEZ3LzdJWlNXYXJLbjFFK3cwME9j?=
 =?utf-8?B?MC9ZcDhzUmtSb0VIY3RpelA3SDg4TEV5eDFFbDhlMDFlMHE0aHRUWUZVNXN4?=
 =?utf-8?B?WGdjZ0cvSUpKT3hnbGN0VjdNTU81NDBFYi9NdnY0MVFIbmtKUmxkZVZXRVh4?=
 =?utf-8?B?SC92OFI3SFNMa01sRWNJaFBIVXZOTmNXSEJ0YkVxME5OelJDb29nbFpTR0FR?=
 =?utf-8?B?K21hbEdKTDUrU0JzekZOenNoSUJoTFdod285RDI5dmVxRFUwekpDa0hvWHNx?=
 =?utf-8?B?MVF1T0JlTnpTRWhuMUo0K0svVnd2OTdxU2tmV0VnZkJJZGNTM3Q4RjZWQ3Aw?=
 =?utf-8?B?dVR5Y2tuakhJZGpCdFphVndqdjRhZWhmb0RSLzhkaGI5aytnNVd0TDZacVR3?=
 =?utf-8?B?QUk5RmJVTVBmWVlacEF0d2dFbSs4VzVBRlpBdzBVVW1FZ053MytMUT09?=
X-Exchange-RoutingPolicyChecked: epSe123hc/+5AlDosiOqPyKPcguIsnCFV90/HWKFIsyq1CEvY6TYDcBSOP4mNORk/ygxOYEZnI6hhpSw7yCuVvma8nEBN9L0cKu0Hy64ndmRD8yP/gjxjy9RaSApBWaK4xZyV9TVGejhOKLcTrkrxd/KFqqgwCnMx0qZgHp9zCFMwVVu6G8Wz8gwBvrONnAC2zY8ZVuufw7rDWsFjev0iBf1DZwXVoRw38r3xoHneI3roJdTvLM+sN3/DauLIOIi+BKOdx/r/Hpb5YRl+Knr8zmQZBrkFS8rfHPSDW+QWtZQYdtWOSdj7xOW1wE8Xrk8Z35XqFgGrDF3lqRNU6G0nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a550b2d-c61d-43fc-072e-08ded0dc5ab2
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:03:17.2506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Tu17QkzsGgm3418/6VUVUykMk5+N0oJ76GDZGMG5tBDAfNE/IeV8Kz7ZlrmRESiHeF2Ypp88swteJH69XKVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
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


On 23-06-2026 03:49, Matthew Brost wrote:
> On Mon, Jun 22, 2026 at 02:43:35PM +0530, Arvind Yadav wrote:
>> GuC exec queue destruction can run asynchronously. If the final device
>> put happens from a destroy worker, drmm cleanup can end up draining
>> the same workqueue and deadlock.
>>
>> Hold a drm_device reference for the queue lifetime and drop it after
>> queue teardown completes. This keeps drmm cleanup from running while
>> async destroy work is still pending.
>>
>> Move destroy work to a module-lifetime Xe workqueue and flush it on
>> PCI remove so hot-unbind/rebind still waits for pending destroy work.
>>
>> With queue-held device refs, guc_submit_sw_fini() cannot run with live
>> GuC IDs. Replace the fini wait with an assertion and remove the unused
>> fini_wq.
>>
>> v2:
>>    - Rebase
>>
>> v3:
>>    - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>>    - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>>    - Drop separate deferred drm_dev_put worker.
>>    - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
>>
>> v4:
>>    - Replace the guc_submit_sw_fini() wait with an assertion and remove
>>      the now-unused fini_wq. (sashiko)
>>
>> v5:
>>    - Move destroy work to a module-lifetime Xe workqueue instead of
>>      system_dfl_wq. (Matt)
>>    - Flush the module-lifetime destroy workqueue during PCI remove to
>>      preserve the old device-remove wait semantics.
>>
>> v6:
>>    - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
>>      letting it outlive the xe_device/drm_device. (Sashiko)
>>    - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
>>      can be queued from the reclaim path.
>>
>> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       |  2 +-
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>>   drivers/gpu/drm/xe/xe_exec_queue.c   | 30 +++++++++++++
>>   drivers/gpu/drm/xe/xe_exec_queue.h   |  7 +++
>>   drivers/gpu/drm/xe/xe_guc_submit.c   | 65 ++++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>>   drivers/gpu/drm/xe/xe_module.c       |  5 +++
>>   drivers/gpu/drm/xe/xe_pci.c          |  7 +++
>>   8 files changed, 88 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 089872507bdd..a81345811a8d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -580,7 +580,7 @@ int xe_device_init_early(struct xe_device *xe)
>>   						       WQ_MEM_RECLAIM);
>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>>   	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
>> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
>> +	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_MEM_RECLAIM, 0);
> Can't we just drop this? xe->destroy_wq is used in xe_svm.c but that can
> use the module level one.


Agreed.
I will drop xe->destroy_wq and use the module-level destroy WQ for the 
xe_svm.c user too. SVM pagemap destroy should be safe there since the 
pagemap lifetime keeps the drm_device/module alive.

>
>>   	if (!xe->ordered_wq || !xe->unordered_wq ||
>>   	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>>   		/*
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 32dd2ffbc796..0e6065d62e37 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -355,7 +355,7 @@ struct xe_device {
>>   	/** @unordered_wq: used to serialize unordered work */
>>   	struct workqueue_struct *unordered_wq;
>>   
>> -	/** @destroy_wq: used to serialize user destroy work, like queue */
>> +	/** @destroy_wq: used for device-lifetime async destroy work */
>>   	struct workqueue_struct *destroy_wq;
>>   
>>   	/** @tiles: device tiles */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 1b5ca3ce578a..43990d19ec63 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_exec_queue.h"
>>   
>>   #include <linux/nospec.h>
>> +#include <linux/workqueue.h>
>>   
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> @@ -30,6 +31,35 @@
>>   #include "xe_vm.h"
>>   #include "xe_pxp.h"
>>   
>> +static struct workqueue_struct *xe_destroy_wq;
>> +
>> +int __init xe_exec_queue_module_init(void)
>> +{
>> +	xe_destroy_wq = alloc_workqueue("xe-exec-queue-destroy-wq",
>> +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
>> +	if (!xe_destroy_wq)
>> +		return -ENOMEM;
>> +	return 0;
>> +}
>> +
>> +void xe_exec_queue_module_exit(void)
>> +{
>> +	if (xe_destroy_wq)
>> +		destroy_workqueue(xe_destroy_wq);
>> +	xe_destroy_wq = NULL;
>> +}
>> +
>> +bool xe_exec_queue_destroy_wq_queue(struct work_struct *work)
>> +{
>> +	return queue_work(xe_destroy_wq, work);
>> +}
>> +
>> +void xe_exec_queue_destroy_wq_flush(void)
>> +{
>> +	if (xe_destroy_wq)
>> +		flush_workqueue(xe_destroy_wq);
>> +}
> Then here s/xe_exec_queue_destroy_wq*/xe_destroy_wq*
>
> and make this module generic?


I will rename xe_exec_queue_destroy_wq_*() to xe_destroy_wq_*() and make 
it generic.

~Arvind,

>
> Matt
>
>> +
>>   /**
>>    * DOC: Execution Queue
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 0225426c57b0..a269bb0f77c7 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -31,6 +31,13 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>   						struct xe_vm *user_vm,
>>   						u32 flags, u64 extensions);
>>   
>> +struct work_struct;
>> +
>> +int xe_exec_queue_module_init(void);
>> +void xe_exec_queue_module_exit(void);
>> +bool xe_exec_queue_destroy_wq_queue(struct work_struct *work);
>> +void xe_exec_queue_destroy_wq_flush(void);
>> +
>>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>>   void xe_exec_queue_destroy(struct kref *ref);
>>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index afe5d99cdd8b..64d3029fa6ac 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/circ_buf.h>
>>   #include <linux/dma-fence-array.h>
>>   
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> @@ -232,17 +233,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>   static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>> -	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> -	int ret;
>> -
>> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
>> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
>> -				 HZ * 5);
>>   
>> -	drain_workqueue(xe->destroy_wq);
>> -
>> -	xe_gt_assert(gt, ret);
>> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>>   
>>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
>>   }
>> @@ -319,8 +312,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>>   
>>   	xa_init(&guc->submission_state.exec_queue_lookup);
>>   
>> -	init_waitqueue_head(&guc->submission_state.fini_wq);
>> -
>>   	primelockdep(guc);
>>   
>>   	guc->submission_state.initialized = true;
>> @@ -411,9 +402,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>>   	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>>   				     q->guc->id, q->width);
>>   
>> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
>> -		wake_up(&guc->submission_state.fini_wq);
>> -
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>>   
>> @@ -1685,6 +1673,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>   {
>>   	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   
>>   	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>   		struct xe_exec_queue_group *group = q->multi_queue.group;
>> @@ -1703,36 +1692,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>   	 * (timeline name).
>>   	 */
>>   	kfree_rcu(ge, rcu);
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
>> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>>   {
>> -	struct xe_guc_exec_queue *ge =
>> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
>> -	struct xe_exec_queue *q = ge->q;
>> +	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_device *drm = &xe->drm;
>>   
>> -	guard(xe_pm_runtime)(guc_to_xe(guc));
>> -	trace_xe_exec_queue_destroy(q);
>> +	/*
>> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
>> +	 * Keep the device alive until the PM-runtime guard unwinds.
>> +	 */
>> +	drm_dev_get(drm);
>>   
>> -	/* Confirm no work left behind accessing device structures */
>> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +	scoped_guard(xe_pm_runtime, xe) {
>> +		trace_xe_exec_queue_destroy(q);
>>   
>> -	xe_exec_queue_fini(q);
>> +		/* Confirm no work left behind accessing device structures */
>> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +
>> +		xe_exec_queue_fini(q);
>> +	}
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>   {
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_guc_exec_queue *ge =
>> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>> +
>> +	guc_exec_queue_do_destroy(ge->q);
>> +}
>>   
>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +{
>>   	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>   
>>   	/* We must block on kernel engines so slabs are empty on driver unload */
>>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>> +		guc_exec_queue_do_destroy(q);
>>   	else
>> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>> +		xe_exec_queue_destroy_wq_queue(&q->guc->destroy_async);
>>   }
>>   
>>   static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
>> @@ -1927,6 +1932,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   	struct workqueue_struct *submit_wq = NULL;
>>   	struct xe_guc_exec_queue *ge;
>>   	long timeout;
>> @@ -1938,6 +1944,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	if (!ge)
>>   		return -ENOMEM;
>>   
>> +	drm_dev_get(drm);
>> +
>>   	q->guc = ge;
>>   	ge->q = q;
>>   	init_rcu_head(&ge->rcu);
>> @@ -2014,6 +2022,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	release_guc_id(guc, q);
>>   err_free:
>>   	kfree(ge);
>> +	drm_dev_put(drm);
>>   
>>   	return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index c7b9642b41ba..31a2acb63ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -100,8 +100,6 @@ struct xe_guc {
>>   		 * even initialized - before that not even the lock is valid
>>   		 */
>>   		bool initialized;
>> -		/** @submission_state.fini_wq: submit fini wait queue */
>> -		wait_queue_head_t fini_wq;
>>   	} submission_state;
>>   
>>   	/** @hwconfig: Hardware config state */
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 4cb578182912..1949fb3242bb 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>>   #include "xe_observation.h"
>> +#include "xe_exec_queue.h"
>>   #include "xe_sched_job.h"
>>   
>>   struct xe_modparam xe_modparam = {
>> @@ -112,6 +113,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_exec_queue_module_init,
>> +		.exit = xe_exec_queue_module_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 78fc2e4dcfc6..5a185ca00c1f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_configfs.h"
>>   #include "xe_device.h"
>>   #include "xe_drv.h"
>> +#include "xe_exec_queue.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>> @@ -1049,6 +1050,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>   		return;
>>   
>>   	xe_device_remove(xe);
>> +
>> +	/*
>> +	 * Preserve remove-time flush after moving destroy work to module
>> +	 * lifetime.
>> +	 */
>> +	xe_exec_queue_destroy_wq_flush();
>>   	xe_pm_fini(xe);
>>   }
>>   
>> -- 
>> 2.43.0
>>
