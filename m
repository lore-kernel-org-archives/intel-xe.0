Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCE1C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 06:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3AB112102;
	Mon,  8 Apr 2024 06:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aT7ZJGI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608C112102
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712556746; x=1744092746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=soPaHhbZqWTz0ZMrC6SuF6tmB2HRxH0c3zAB/HXAohk=;
 b=aT7ZJGI2hT1242W1MQaONqwg9QDS5NcVhlBktxlpKBCd5UH0dd75zEiY
 232m9zXfHl5DxQ7tBV5K2MY9uPcI/PhKe6XfeXdtbPARjCvNXgHiwVNsf
 GqvdxAaIKTOxjFDCxu49vCK+NjuzkrykiJn7zSc9oXwMvEOW9el4HWfQJ
 q33HOo7Odh5P6MHemgTly8o9Fd1cZ40c0zpblQOD5ulry78LSfXqZT6BC
 MQpOyh/AiDokJ3YZ7VZz0iobX1lcinzrU6ERZ1UPMQbyNx/+PHvgRexja
 ZnPm8wA+TcDxorOLtpnIilK6nf0jdGyTGewd3mtRTz+8yDE/w7oko9PDP g==;
X-CSE-ConnectionGUID: v56OPo5eQJG7o4M5Dycepg==
X-CSE-MsgGUID: 272Ay6HlS1eKQ2WaLLQ+RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="11607253"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208,217";a="11607253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:12:25 -0700
X-CSE-ConnectionGUID: iHB5SGgwTJqnVhcZ310xZA==
X-CSE-MsgGUID: Y6v9bGbwROC1rZ2aUgsABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208,217";a="20334287"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Apr 2024 23:12:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 23:12:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Apr 2024 23:12:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Apr 2024 23:12:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 23:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiGp/neb5LAeBYvhlmj2XjG3u2fAZKRI9TxliKnbqsF16WokKxPY4pkJIzZlsQmIdVO3jRI2sQQXlKwp74ObVBwm/U39tGCwhZl95yZDOSPhWj7qbvWUVeMYJ8seQ6kV4O3vaqtDs7rtwXL2Qk/mkC597Idvp8voYc8LgL7keEzAFpwO5jRZ19wc+s5U5+JTuq/p5WkHccr6cF2NU6g9yZpaBF4viRGxIKyT2NgE8VVMybpzcnUQkWF3wWUE8DXqRcTvifaSECijkEAnBT6ycZagLDfrX8x7z8Gf0WSugbRtsWdWDZmArQqlGt08OVQVP13iu70YFQeVhzwacK25sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBPIftP2jD605IAdRaTUWRvJbSrMC+F6xc0g+QuGkS4=;
 b=dCBKJvdcwYR6nw0i6dq+cMxoxIvmk569TY+co3TQo3hhc8GpggWkf+CTSZxiR4/WKMWDeW4faT0dP0fLlIARkkTsAf3zBM2rcb90QB5hOqAZKn1ILJUP0aW3iJS44utwzFMeW7thWizkv75MORONHa6LoZMkjZ4FtwHPqzYL9qMCunFAgaetOp/AZyHfOos2h2TaeE/UGGZzy/E/AJ/PbdrrBPE3YNTr2ipL1ZZq+w8S3Et+2EczVJV5DVI5GYFTTQaYhi3duxue01hIH4ju7hehjMKYuXkvW4IhyzPJTEB/Dt8QB9RV9BHEshwAjvl2g5cEutBIfmV59dHxX4psOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 8 Apr
 2024 06:12:22 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 06:12:22 +0000
Content-Type: multipart/alternative;
 boundary="------------t3qU01GD5GEyyVZI91voGsX9"
Message-ID: <f60d691d-57d1-4933-9a36-c9186fbdfaa9@intel.com>
Date: Mon, 8 Apr 2024 11:42:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe: Introduce helper to populate userptr
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>, Niranjana
 Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>, Brian Welty
 <brian.welty@intel.com>
References: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
 <20240405190508.244177-2-himal.prasad.ghimiray@intel.com>
 <ZhBtKA7YDQ3Q4W3L@DUT025-TGLU>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZhBtKA7YDQ3Q4W3L@DUT025-TGLU>
X-ClientProxiedBy: PN3PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8572:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnOc6RDt+nk6Yf2K/kGRANkY/+jy0Yqs8oba6iOWX1h8jK2F3hCOPPscy/q5AM5OAJk+yXa/GzdynFOO1LtBi6pgtGfiDMU4KCizPZW3TS6H8Qmw+GN+4sstTnl9j4Er3NgixjzRjU2n9ID1I0PqU+ytwiK1cdFTI1OXrJx85C+xKubKmMubkotV37X/oqI/CRboVCCZxaTBjrTd5ku51TWZrQQdXjguFBuivEhvl6547GMwoLEL47fazSSymJL0ri4agv9JYXgeGdV56LMbjR+qC8+7M2nIXlQcQDAia2j6JnFsDrGBf9a/6A9ROB17MaQAuIK5u1fgd3eAayaK18sjFwVurA1sLf9elyqNT0V9pWlPiSO/+3MBQSSCE05ln7D/J5nOg2KHE05twttapTl05LYvLH910Fqk29Wg7qCN89PyOEhp7CkcsfVfml/Q91rAZs0sGGOgBtiDew6Myo586VX8FbvCk7A6tBmv/x0CAzTc0rs36+oFRs4pQHm5PCvpnIEkcQfbvkcfbnqx5/2oy5ae1hbIHMOPJEc2LuNoG8LuKRTGcU40q0M8LCPFta0KaU+EN61FWY8CXCPilX5bmZsNk+y2+V+HCkHYwkzLgdWuIrEhA8WY2+poxp+NOlemz7uO0E7WZoldzhV3SpRKx7CMPjBbIHyJZas/gMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlFpeXYya0JjRkpoOEZ0L2JBcW03WUQrUzRrME1COUp2TkpDalBOZVZyU1NR?=
 =?utf-8?B?Y3FTdGlTQVpDT2hXd09aMmRYRnZYcW5XWGZJSXJ6RlRiNmFmNjZvNkQ0aUlZ?=
 =?utf-8?B?UHRWb1hXZlVOMGUxSTRaU3hCTitYU2hPcHFXQzVTVHI3RHE0dk81NGRSbXhs?=
 =?utf-8?B?ekhPRmIvYTZrbEJHYW9zaEF3OURCRmNUWHRlOUg0Yitka2RWckF1bjloTFR6?=
 =?utf-8?B?NjNYcVVaYjBWQ1JuYUduYVRFNmhLUE9yYkIwWWEwcWs5UG44RkpwWG9sTXJn?=
 =?utf-8?B?aStmL3JTb2orRFg1ZDRkVXBhM2hwWDRWVTdPeDdLa1I2aWdYS3RrRDRoL2hN?=
 =?utf-8?B?UFlXWEMvRUVVZHQ1UEdremxxR2F2NEV5L2RtcllFdTZNSUdGbUZUUDZMRDhs?=
 =?utf-8?B?Z2YrZjlJb0J4T3hqYk0wLzVXYTltNEFTTm9rdWtvaDBpcVVZMy9Eb3JqTWxS?=
 =?utf-8?B?ci9zSklxT0N3Umo2ZTBMMjl3RGN1aE5hRWFjclFFME5OaVhTYWNpZmUyWFhC?=
 =?utf-8?B?OElXcUVpUzhrd1VtdHpTU2c1MTNEK1NpRlZ0aGRRbUZpWk0vWmFXZnlUQXlr?=
 =?utf-8?B?M0twNnI3TUJFUW41OVRwbjhBU3N2VU1DdUdDQUFoK1dPZ1BQUC9VTUNwMUI0?=
 =?utf-8?B?TnMvMWR4UWpDNldxK2M0cjJwaTJ0LzJwS3Z4ajYyQTZreERLUDh3TDhYbDkr?=
 =?utf-8?B?REllMk9kd0xGdzk3cDVFdEVXWitpN0dWaG11SHk3bklPaDFEUGI2S096TlM5?=
 =?utf-8?B?b3ZubWRDMDhYeTc4dk9LU2tvUndKSXZCMG52YUhYT3lobWNCZlJDd3NSR0Vs?=
 =?utf-8?B?L1B5em0wOW11RUR0d2JaeUhpUithL3BTdW91eEcvaWw3SmVpdVd4aVpvOXcx?=
 =?utf-8?B?QzdTTGlMMXVPSEFpeTNSRFR6QjBqcHpjUTlVdkZONmNtWWVuejZVbVJ3RTRD?=
 =?utf-8?B?dmNCNzF3Vkt0OG0vK0xvTThOR0M5MG5CcHQrcW5iMGlXUmUyY0JnNU9tSFRm?=
 =?utf-8?B?RlRQQkhpTFJkT1llVndCVVJ5NTVoY2xqSkptcUl1NjJIbVdaWmpwTUkvdDVn?=
 =?utf-8?B?bzRoN3BZSXVMSWJZeUhScUZ1YktST3VpSFh2ZGVzOXhwdGs2dVBqTGJINlBs?=
 =?utf-8?B?QlJKZmZDTFVNejcwL0JVR2VNVzZoTXEybk9uWkhQRXc4ajNQcVFlU3V4K3Nt?=
 =?utf-8?B?MERhMWI3TERQS0dGNVJTMUFpSys3cVV0NHJ1SGhtdDE1QXRyUU1FTWR0ZEZC?=
 =?utf-8?B?TXV2Y1hNUWxRWUFpTk56Vjlndk94RzlHVFExVTRkbkxEUTZCSUVSem1rVVdq?=
 =?utf-8?B?N2hpbm02djR4R29ZdE50VkRGT2k4RWNXMWhLWWlneHFDYXJEaHZkT2xwaXRn?=
 =?utf-8?B?UGd4Yk5UazlLZ21NaWFCckIrYkpRR2VDaVpFbDVvZXkxVFZQZm1UcTlMVWNk?=
 =?utf-8?B?V0pWKzdkS29Od25tUVFBVCtOZFk2L0RjczdKaGFINEZOaEhkQ251eVExZXNS?=
 =?utf-8?B?dU9iZk5NRkNEbFFHU3E3VXl0amhlWU8vdTlOeGNJdzJGSWxzOUdqVHo0RGp4?=
 =?utf-8?B?amJVQ0gxdERySmR3eW9SaDlrbHRDVWh4bS9ueWxIRG5EQVliVjMrTURhZlJ5?=
 =?utf-8?B?RkR5TkFyd0M1clRWWmRHNDMxMUNVak9Cclkvd2ZaNjIycDlUUFFFWE51bDlO?=
 =?utf-8?B?VFVwRXMxVW5SQ1g5U2ZhZDdzZGtyV3QweW1idTRscUxQU0dqZFlXTERUdDNF?=
 =?utf-8?B?dGFIMlpkOUV3Z3J6dVpqNGltVGwyNkRvRzZsNFNuWjBPK3dkQmlScjZuZ2xN?=
 =?utf-8?B?SGVZUDNGTVUrVWE1NzJlMzlCUlJYb2x0R09iNGs3N2dPSk90WFJIeCtnVTJj?=
 =?utf-8?B?Y2J2azJuU24vbkU5S1AwY21JeEtBYlRGeDMwV09XOEdXaWY1OXJQZ0RaWkp5?=
 =?utf-8?B?TGt5eWo5MWJibHBWM3BUcEFBK3k5dFQrMkFUWkJINVl0Y3I0UWQyZkRQS293?=
 =?utf-8?B?K1VHaGRuT0RXVlUyY3cwMUFuc0lTNTNRZE81aWhmZXk5Sk8xaEU2ZVFHMFEy?=
 =?utf-8?B?bk93cW12TjBvNWlTY1FsV3FvdU1Xb3NhQmhiNzFYYTNvYkJQSU5IYzlpZjF4?=
 =?utf-8?B?RTVySXNZcHNSaVBXODlFblJqR0phd0gvZGozQ2huNXR3WlRwOVRDVWtzc3NH?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a3dfce-3024-44da-3517-08dc5792da42
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 06:12:22.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7t4U8gEZCPmfPbBVlJSiQE3cDnURoLWy2FO2vLJRUGsBve/Ty2wztV9ipHxAQd3RECT4hE53v1+PzZ5nz0D+oV67DczCljJmt7pS6TmI+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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

--------------t3qU01GD5GEyyVZI91voGsX9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 06-04-2024 02:59, Matthew Brost wrote:
> On Sat, Apr 06, 2024 at 12:35:07AM +0530, Himal Prasad Ghimiray wrote:
>> From: Oak Zeng<oak.zeng@intel.com>
>>
>> Introduce a helper function xe_userptr_populate_range to populate
>> a a userptr range. This functions calls hmm_range_fault to read
>> CPU page tables and populate all pfns/pages of this virtual address
>> range.
>>
>> If the populated page is system memory page, dma-mapping is performed
>> to get a dma-address which can be used later for GPU to access pages.
>>
>> If the populated page is device private page, we calculate the dpa (
>> device physical address) of the page. This will be handled in future
>> patches.
>>
>> The dma-address or dpa is then saved in userptr's sg table. This is
>> prepare work to replace the get_user_pages_fast code in userptr code
>> path.
>>
>> v1: Address review comments:
>>      separate a npage_in_range function (Matt)
>>      reparameterize function xe_userptr_populate_range function (Matt)
>>      move mmu_interval_read_begin() call into while loop (Thomas)
>>      s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>>      use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>>      move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
>> v2: Remove device private page support. Only support system
>>      pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
>> v3: Address review comments:
>>      Squash patch "drm/xe: Introduce a helper to free sg table" to current
>>      patch (Matt)
>>      start and end addresses are already page aligned (Matt)
>>      Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
>>      non system allocator call. (Matt)
>>      Drop kthread_use_mm and kthread_unuse_mm. (Matt)
>>      No need of kernel-doc for static functions.(Matt)
>>      Modify function names. (Matt)
>>      Free sgtable incase of dma_map_sgtable failure.(Matt)
>>      Modify loop for hmm_range_fault.(Matt)
>> v4: Remove the dummy function for xe_hmm_userptr_populate_range
>>      since CONFIG_HMM_MIRROR is needed. (Matt)
>>      Change variable names start/end to userptr_start/userptr_end.(Matt)
>>
>> Signed-off-by: Oak Zeng<oak.zeng@intel.com>
>> Co-developed-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura<niranjana.vishwanathapura@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
> Reviewed-by: Matthew Brost<matthew.brost@intel.com>
Thank you, Matt, for the review.
>
>> Cc: Thomas Hellström<thomas.hellstrom@intel.com>
>> Cc: Brian Welty<brian.welty@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig  |   1 +
>>   drivers/gpu/drm/xe/Makefile |   2 +
>>   drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hmm.h |  11 ++
>>   4 files changed, 267 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index 1a556d087e63..449a1ecbc92a 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -41,6 +41,7 @@ config DRM_XE
>>   	select MMU_NOTIFIER
>>   	select WANT_DEV_COREDUMP
>>   	select AUXILIARY_BUS
>> +	select HMM_MIRROR
>>   	help
>>   	  Experimental driver for Intel Xe series GPUs
>>   
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 21316ee47026..07031b5ba977 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -146,6 +146,8 @@ xe-y += xe_bb.o \
>>   	xe_wa.o \
>>   	xe_wopcm.o
>>   
>> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>> +
>>   # graphics hardware monitoring (HWMON) support
>>   xe-$(CONFIG_HWMON) += xe_hwmon.o
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
>> new file mode 100644
>> index 000000000000..2c32dc46f7d4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hmm.c
>> @@ -0,0 +1,253 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/scatterlist.h>
>> +#include <linux/mmu_notifier.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/memremap.h>
>> +#include <linux/swap.h>
>> +#include <linux/hmm.h>
>> +#include <linux/mm.h>
>> +#include "xe_hmm.h"
>> +#include "xe_vm.h"
>> +#include "xe_bo.h"
>> +
>> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
>> +{
>> +	return (end - start) >> PAGE_SHIFT;
>> +}
>> +
>> +/*
>> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
>> + * have such information for memory eviction or write back to
>> + * hard disk
>> + *
>> + * @range: the range to mark
>> + * @write: if write to this range, we mark pages in this range
>> + * as dirty
>> + */
>> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>> +{
>> +	struct page *page;
>> +	u64 i, npages;
>> +
>> +	npages = xe_npages_in_range(range->start, range->end);
>> +	for (i = 0; i < npages; i++) {
>> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
>> +		if (write)
>> +			set_page_dirty_lock(page);
>> +
>> +		mark_page_accessed(page);
>> +	}
>> +}
>> +
>> +/*
>> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>> + * and will be used to program GPU page table later.
>> + *
>> + * @xe: the xe device who will access the dma-address in sg table
>> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>> + * has the pfn numbers of pages that back up this hmm address range.
>> + * @st: pointer to the sg table.
>> + * @write: whether we write to this range. This decides dma map direction
>> + * for system pages. If write we map it bi-diretional; otherwise
>> + * DMA_TO_DEVICE
>> + *
>> + * All the contiguous pfns will be collapsed into one entry in
>> + * the scatter gather table. This is for the purpose of efficiently
>> + * programming GPU page table.
>> + *
>> + * The dma_address in the sg table will later be used by GPU to
>> + * access memory. So if the memory is system memory, we need to
>> + * do a dma-mapping so it can be accessed by GPU/DMA.
>> + *
>> + * FIXME: This function currently only support pages in system
>> + * memory. If the memory is GPU local memory (of the GPU who
>> + * is going to access memory), we need gpu dpa (device physical
>> + * address), and there is no need of dma-mapping. This is TBD.
>> + *
>> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
>> + * memory. Add this when you support p2p
>> + *
>> + * This function allocates the storage of the sg table. It is
>> + * caller's responsibility to free it calling sg_free_table.
>> + *
>> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
>> + */
>> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>> +		       struct sg_table *st, bool write)
>> +{
>> +	struct device *dev = xe->drm.dev;
>> +	struct page **pages;
>> +	u64 i, npages;
>> +	int ret;
>> +
>> +	npages = xe_npages_in_range(range->start, range->end);
>> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
>> +	if (!pages)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < npages; i++) {
>> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
>> +		xe_assert(xe, !is_device_private_page(pages[i]));
>> +	}
>> +
>> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
>> +						xe_sg_segment_size(dev), GFP_KERNEL);
>> +	if (ret)
>> +		goto free_pages;
>> +
>> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
>> +			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
>> +	if (ret) {
>> +		sg_free_table(st);
>> +		st = NULL;
>> +	}
>> +
>> +free_pages:
>> +	kvfree(pages);
>> +	return ret;
>> +}
>> +
>> +/*
>> + * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
>> + *
>> + * @uvma: the userptr vma which hold the scatter gather table
>> + *
>> + * With function xe_userptr_populate_range, we allocate storage of
>> + * the userptr sg table. This is a helper function to free this
>> + * sg table, and dma unmap the address in the table.
>> + */
>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
>> +{
>> +	struct xe_userptr *userptr = &uvma->userptr;
>> +	struct xe_vma *vma = &uvma->vma;
>> +	bool write = !xe_vma_read_only(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_device *xe = vm->xe;
>> +	struct device *dev = xe->drm.dev;
>> +
>> +	xe_assert(xe, userptr->sg);
>> +	dma_unmap_sgtable(dev, userptr->sg,
>> +			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
>> +
>> +	sg_free_table(userptr->sg);
>> +	userptr->sg = NULL;
>> +}
>> +
>> +/**
>> + * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
>> + * address range
>> + *
>> + * @uvma: userptr vma which has information of the range to populate.
>> + * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
>> + *
>> + * This function populate the physical pages of a virtual
>> + * address range. The populated physical pages is saved in
>> + * userptr's sg table. It is similar to get_user_pages but call
>> + * hmm_range_fault.
>> + *
>> + * This function also read mmu notifier sequence # (
>> + * mmu_interval_read_begin), for the purpose of later
>> + * comparison (through mmu_interval_read_retry).
>> + *
>> + * This must be called with mmap read or write lock held.
>> + *
>> + * This function allocates the storage of the userptr sg table.
>> + * It is caller's responsibility to free it calling sg_free_table.
>> + *
>> + * returns: 0 for succuss; negative error no on failure
>> + */
>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
>> +				  bool is_mm_mmap_locked)
>> +{
>> +	unsigned long timeout =
>> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
>> +	struct xe_userptr *userptr;
>> +	struct xe_vma *vma = &uvma->vma;
>> +	u64 userptr_start = xe_vma_userptr(vma);
>> +	u64 userptr_end = userptr_start + xe_vma_size(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct hmm_range hmm_range;
>> +	bool write = !xe_vma_read_only(vma);
>> +	unsigned long notifier_seq;
>> +	u64 npages;
>> +	int ret;
>> +
>> +	userptr = &uvma->userptr;
>> +
>> +	if (is_mm_mmap_locked)
>> +		mmap_assert_locked(userptr->notifier.mm);
>> +
>> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> +		return 0;
>> +
>> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> +	if (notifier_seq == userptr->notifier_seq)
>> +		return 0;
>> +
>> +	if (userptr->sg)
>> +		xe_hmm_userptr_free_sg(uvma);
>> +
>> +	npages = xe_npages_in_range(userptr_start, userptr_end);
>> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
>> +	if (unlikely(!pfns))
>> +		return -ENOMEM;
>> +
>> +	if (write)
>> +		flags |= HMM_PFN_REQ_WRITE;
>> +
>> +	if (!mmget_not_zero(userptr->notifier.mm)) {
>> +		ret = -EFAULT;
>> +		goto free_pfns;
>> +	}
>> +
>> +	hmm_range.default_flags = flags;
>> +	hmm_range.hmm_pfns = pfns;
>> +	hmm_range.notifier = &userptr->notifier;
>> +	hmm_range.start = userptr_start;
>> +	hmm_range.end = userptr_end;
>> +	hmm_range.dev_private_owner = vm->xe;
>> +
>> +	while (true) {
>> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> +
>> +		if (!is_mm_mmap_locked)
>> +			mmap_read_lock(userptr->notifier.mm);
>> +
>> +		ret = hmm_range_fault(&hmm_range);
>> +
>> +		if (!is_mm_mmap_locked)
>> +			mmap_read_unlock(userptr->notifier.mm);
>> +
>> +		if (ret == -EBUSY) {
>> +			if (time_after(jiffies, timeout))
>> +				break;
>> +
>> +			continue;
>> +		}
>> +		break;
>> +	}
>> +
>> +	mmput(userptr->notifier.mm);
>> +
>> +	if (ret)
>> +		goto free_pfns;
>> +
>> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
>> +	if (ret)
>> +		goto free_pfns;
>> +
>> +	xe_mark_range_accessed(&hmm_range, write);
>> +	userptr->sg = &userptr->sgt;
>> +	userptr->notifier_seq = hmm_range.notifier_seq;
>> +
>> +free_pfns:
>> +	kvfree(pfns);
>> +	return ret;
>> +}
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
>> new file mode 100644
>> index 000000000000..909dc2bdcd97
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hmm.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: MIT
>> + *
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_userptr_vma;
>> +
>> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
>> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
>> -- 
>> 2.25.1
>>
--------------t3qU01GD5GEyyVZI91voGsX9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06-04-2024 02:59, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZhBtKA7YDQ3Q4W3L@DUT025-TGLU">
      <pre class="moz-quote-pre" wrap="">On Sat, Apr 06, 2024 at 12:35:07AM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Oak Zeng <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>

Introduce a helper function xe_userptr_populate_range to populate
a a userptr range. This functions calls hmm_range_fault to read
CPU page tables and populate all pfns/pages of this virtual address
range.

If the populated page is system memory page, dma-mapping is performed
to get a dma-address which can be used later for GPU to access pages.

If the populated page is device private page, we calculate the dpa (
device physical address) of the page. This will be handled in future
patches.

The dma-address or dpa is then saved in userptr's sg table. This is
prepare work to replace the get_user_pages_fast code in userptr code
path.

v1: Address review comments:
    separate a npage_in_range function (Matt)
    reparameterize function xe_userptr_populate_range function (Matt)
    move mmu_interval_read_begin() call into while loop (Thomas)
    s/mark_range_accessed/xe_mark_range_accessed (Thomas)
    use set_page_dirty_lock (vs set_page_dirty) (Thomas)
    move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
v2: Remove device private page support. Only support system
    pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
v3: Address review comments:
    Squash patch &quot;drm/xe: Introduce a helper to free sg table&quot; to current
    patch (Matt)
    start and end addresses are already page aligned (Matt)
    Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
    non system allocator call. (Matt)
    Drop kthread_use_mm and kthread_unuse_mm. (Matt)
    No need of kernel-doc for static functions.(Matt)
    Modify function names. (Matt)
    Free sgtable incase of dma_map_sgtable failure.(Matt)
    Modify loop for hmm_range_fault.(Matt)
v4: Remove the dummy function for xe_hmm_userptr_populate_range
    since CONFIG_HMM_MIRROR is needed. (Matt)
    Change variable names start/end to userptr_start/userptr_end.(Matt)

Signed-off-by: Oak Zeng <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>
Co-developed-by: Niranjana Vishwanathapura <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Signed-off-by: Niranjana Vishwanathapura <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a></pre>
    </blockquote>
    <span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thank you, Matt, for the review.</span>
    <blockquote type="cite" cite="mid:ZhBtKA7YDQ3Q4W3L@DUT025-TGLU">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@intel.com">&lt;thomas.hellstrom@intel.com&gt;</a>
Cc: Brian Welty <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Kconfig  |   1 +
 drivers/gpu/drm/xe/Makefile |   2 +
 drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hmm.h |  11 ++
 4 files changed, 267 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 create mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..449a1ecbc92a 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -41,6 +41,7 @@ config DRM_XE
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
+	select HMM_MIRROR
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 21316ee47026..07031b5ba977 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -146,6 +146,8 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
new file mode 100644
index 000000000000..2c32dc46f7d4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/scatterlist.h&gt;
+#include &lt;linux/mmu_notifier.h&gt;
+#include &lt;linux/dma-mapping.h&gt;
+#include &lt;linux/memremap.h&gt;
+#include &lt;linux/swap.h&gt;
+#include &lt;linux/hmm.h&gt;
+#include &lt;linux/mm.h&gt;
+#include &quot;xe_hmm.h&quot;
+#include &quot;xe_vm.h&quot;
+#include &quot;xe_bo.h&quot;
+
+static u64 xe_npages_in_range(unsigned long start, unsigned long end)
+{
+	return (end - start) &gt;&gt; PAGE_SHIFT;
+}
+
+/*
+ * xe_mark_range_accessed() - mark a range is accessed, so core mm
+ * have such information for memory eviction or write back to
+ * hard disk
+ *
+ * @range: the range to mark
+ * @write: if write to this range, we mark pages in this range
+ * as dirty
+ */
+static void xe_mark_range_accessed(struct hmm_range *range, bool write)
+{
+	struct page *page;
+	u64 i, npages;
+
+	npages = xe_npages_in_range(range-&gt;start, range-&gt;end);
+	for (i = 0; i &lt; npages; i++) {
+		page = hmm_pfn_to_page(range-&gt;hmm_pfns[i]);
+		if (write)
+			set_page_dirty_lock(page);
+
+		mark_page_accessed(page);
+	}
+}
+
+/*
+ * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
+ * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
+ * and will be used to program GPU page table later.
+ *
+ * @xe: the xe device who will access the dma-address in sg table
+ * @range: the hmm range that we build the sg table from. range-&gt;hmm_pfns[]
+ * has the pfn numbers of pages that back up this hmm address range.
+ * @st: pointer to the sg table.
+ * @write: whether we write to this range. This decides dma map direction
+ * for system pages. If write we map it bi-diretional; otherwise
+ * DMA_TO_DEVICE
+ *
+ * All the contiguous pfns will be collapsed into one entry in
+ * the scatter gather table. This is for the purpose of efficiently
+ * programming GPU page table.
+ *
+ * The dma_address in the sg table will later be used by GPU to
+ * access memory. So if the memory is system memory, we need to
+ * do a dma-mapping so it can be accessed by GPU/DMA.
+ *
+ * FIXME: This function currently only support pages in system
+ * memory. If the memory is GPU local memory (of the GPU who
+ * is going to access memory), we need gpu dpa (device physical
+ * address), and there is no need of dma-mapping. This is TBD.
+ *
+ * FIXME: dma-mapping for peer gpu device to access remote gpu's
+ * memory. Add this when you support p2p
+ *
+ * This function allocates the storage of the sg table. It is
+ * caller's responsibility to free it calling sg_free_table.
+ *
+ * Returns 0 if successful; -ENOMEM if fails to allocate memory
+ */
+static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
+		       struct sg_table *st, bool write)
+{
+	struct device *dev = xe-&gt;drm.dev;
+	struct page **pages;
+	u64 i, npages;
+	int ret;
+
+	npages = xe_npages_in_range(range-&gt;start, range-&gt;end);
+	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
+		return -ENOMEM;
+
+	for (i = 0; i &lt; npages; i++) {
+		pages[i] = hmm_pfn_to_page(range-&gt;hmm_pfns[i]);
+		xe_assert(xe, !is_device_private_page(pages[i]));
+	}
+
+	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages &lt;&lt; PAGE_SHIFT,
+						xe_sg_segment_size(dev), GFP_KERNEL);
+	if (ret)
+		goto free_pages;
+
+	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
+			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
+	if (ret) {
+		sg_free_table(st);
+		st = NULL;
+	}
+
+free_pages:
+	kvfree(pages);
+	return ret;
+}
+
+/*
+ * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
+ *
+ * @uvma: the userptr vma which hold the scatter gather table
+ *
+ * With function xe_userptr_populate_range, we allocate storage of
+ * the userptr sg table. This is a helper function to free this
+ * sg table, and dma unmap the address in the table.
+ */
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &amp;uvma-&gt;userptr;
+	struct xe_vma *vma = &amp;uvma-&gt;vma;
+	bool write = !xe_vma_read_only(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm-&gt;xe;
+	struct device *dev = xe-&gt;drm.dev;
+
+	xe_assert(xe, userptr-&gt;sg);
+	dma_unmap_sgtable(dev, userptr-&gt;sg,
+			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
+
+	sg_free_table(userptr-&gt;sg);
+	userptr-&gt;sg = NULL;
+}
+
+/**
+ * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
+ * address range
+ *
+ * @uvma: userptr vma which has information of the range to populate.
+ * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
+ *
+ * This function populate the physical pages of a virtual
+ * address range. The populated physical pages is saved in
+ * userptr's sg table. It is similar to get_user_pages but call
+ * hmm_range_fault.
+ *
+ * This function also read mmu notifier sequence # (
+ * mmu_interval_read_begin), for the purpose of later
+ * comparison (through mmu_interval_read_retry).
+ *
+ * This must be called with mmap read or write lock held.
+ *
+ * This function allocates the storage of the userptr sg table.
+ * It is caller's responsibility to free it calling sg_free_table.
+ *
+ * returns: 0 for succuss; negative error no on failure
+ */
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
+				  bool is_mm_mmap_locked)
+{
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
+	struct xe_userptr *userptr;
+	struct xe_vma *vma = &amp;uvma-&gt;vma;
+	u64 userptr_start = xe_vma_userptr(vma);
+	u64 userptr_end = userptr_start + xe_vma_size(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct hmm_range hmm_range;
+	bool write = !xe_vma_read_only(vma);
+	unsigned long notifier_seq;
+	u64 npages;
+	int ret;
+
+	userptr = &amp;uvma-&gt;userptr;
+
+	if (is_mm_mmap_locked)
+		mmap_assert_locked(userptr-&gt;notifier.mm);
+
+	if (vma-&gt;gpuva.flags &amp; XE_VMA_DESTROYED)
+		return 0;
+
+	notifier_seq = mmu_interval_read_begin(&amp;userptr-&gt;notifier);
+	if (notifier_seq == userptr-&gt;notifier_seq)
+		return 0;
+
+	if (userptr-&gt;sg)
+		xe_hmm_userptr_free_sg(uvma);
+
+	npages = xe_npages_in_range(userptr_start, userptr_end);
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns))
+		return -ENOMEM;
+
+	if (write)
+		flags |= HMM_PFN_REQ_WRITE;
+
+	if (!mmget_not_zero(userptr-&gt;notifier.mm)) {
+		ret = -EFAULT;
+		goto free_pfns;
+	}
+
+	hmm_range.default_flags = flags;
+	hmm_range.hmm_pfns = pfns;
+	hmm_range.notifier = &amp;userptr-&gt;notifier;
+	hmm_range.start = userptr_start;
+	hmm_range.end = userptr_end;
+	hmm_range.dev_private_owner = vm-&gt;xe;
+
+	while (true) {
+		hmm_range.notifier_seq = mmu_interval_read_begin(&amp;userptr-&gt;notifier);
+
+		if (!is_mm_mmap_locked)
+			mmap_read_lock(userptr-&gt;notifier.mm);
+
+		ret = hmm_range_fault(&amp;hmm_range);
+
+		if (!is_mm_mmap_locked)
+			mmap_read_unlock(userptr-&gt;notifier.mm);
+
+		if (ret == -EBUSY) {
+			if (time_after(jiffies, timeout))
+				break;
+
+			continue;
+		}
+		break;
+	}
+
+	mmput(userptr-&gt;notifier.mm);
+
+	if (ret)
+		goto free_pfns;
+
+	ret = xe_build_sg(vm-&gt;xe, &amp;hmm_range, &amp;userptr-&gt;sgt, write);
+	if (ret)
+		goto free_pfns;
+
+	xe_mark_range_accessed(&amp;hmm_range, write);
+	userptr-&gt;sg = &amp;userptr-&gt;sgt;
+	userptr-&gt;notifier_seq = hmm_range.notifier_seq;
+
+free_pfns:
+	kvfree(pfns);
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
new file mode 100644
index 000000000000..909dc2bdcd97
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hmm.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/types.h&gt;
+
+struct xe_userptr_vma;
+
+int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
+void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------t3qU01GD5GEyyVZI91voGsX9--
