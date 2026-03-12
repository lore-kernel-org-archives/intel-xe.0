Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF15FED2E3
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 07:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4D710E993;
	Thu, 12 Mar 2026 07:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pmxBn22R";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2710E98F;
 Thu, 12 Mar 2026 07:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dy3Cxyw12F2DIEZhVEJyRO2ilbXRETNWdo2u9w4k05G8B53vseE93NH+Po/Gr2sJFqNq17/PelHBJT+cJViMSs6iMd4jHeYKcZwbinSzVJzGQ2bTRVIx17FuxKGvOdfoSsTWpS0EJJfhGQfaEotn+2cZ53fCXrx7Bag+Jt8yBGp6wUKVLvoUla/xU/+JmIAgQLVKs2AK6F0NZNEcuX2vJFumqwssFWkrTKClQosjiTKSQLc+WFyz1y+EBDMmpZe14hC2UCB0KPKA9FsOzFDTZ+8LP+9j60PIeh4+T9AkURa8oxaSnETVIvCemRqyr4EOEdGI/bxWIt0QJ3Oz76NBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kt8VAK+UO4IVWAMdJJ+++tMARlDTEt+QFP2YRKN2Ufg=;
 b=wtW/xpAGfvVtB3sOT3G6OuQRXNpiFypxeo5RkeGneWMpCI7xrjcRx9v5jS+dPkc8MKoSgZt+MwKQkzn4uCxBYvpLkhg6nJRg5gMGeJIUwTJkL75ON/21xfZxmkCMsxeiSIsgsvHp8DZ2y25qikYgOdNqvtndQ4no7jDc3kRm882rsqWaERzDbbv2ZCfLq9iTv4UoZLw1tr0W73ltV39bQASNBtiTmkoKVgeYyvlYYUX3MR/nJxPF+15UtsdkimDomX0Gvt6bcvx0UO2Yc3d0LRw7XtfvDBdJMGnBimXMpNRxUXw5ZINAIcaXblEwT5ZdeViSB/Jwv9LRxZIMWQ7VuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kt8VAK+UO4IVWAMdJJ+++tMARlDTEt+QFP2YRKN2Ufg=;
 b=pmxBn22RWBf2KgLGAtHcbqbsP4EBYtoaTjAUb9Rn2kz31j3kxrZEy5fQPty5m6jEwbfaUlN3Bbbd8sTEntTa6BJePzaeT45dz3WNhJKA5a7HUBSqbcHp9wY9/9Pe0/TOUqmOw4H/seKtYuNL/GEmHXB1kTw2/rdJm7oJ14DfPsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 07:58:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 07:58:40 +0000
Message-ID: <bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com>
Date: Thu, 12 Mar 2026 08:58:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sa: Scan all holes when fences are disabled
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
 <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
 <78e96e9a6bf228c19c43698666785268b9477493.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <78e96e9a6bf228c19c43698666785268b9477493.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b4e658-903f-4d99-8b39-08de800d2c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info: vJKqD8kVhw2W7nK09Ccc4HKbTpHzu/uwy6qx1BwL/ydV6J5BCjf/RYKK1E70WEtn8XBk0fb4E0aUP/keyz4uZWBYDNRzcQmE8ZF2/h5Yv7uIM3ARJ04ZBdYs/Ys+1i+mDNAfMkyJQ7QQ9OzlC+nkZkmfr/C4C4mhrauMsHN74MEDTeE6uTu1h8o0aWSeMBlFGMG0kYOfxAiszuEqBhaC/s0zYLFRl+d0YtmIM4o3rVXoJRUsp6lViVDZxTRsTfWuLl744Q9UEgUhvsvsg4TmYhTGUOHAiv67UKd30HJ3auPtgf96vKowvEGLVn6pxtMl34+ZZEfZEldvcGVuGwL/mrNbVjTmdlodyNMIyaZkHoUmBrhpn0UNtnqZqVM+nIkrKgcODy0hgqMEDdHzQAXHS9xW7QsFM1KjYLxhGoEWUoxoFhBZkkailFuxsG/uyOgxNF7LFpanWqqoJ4dy+Em2gz2wqlLnktQ5P3NoDRiBfdcPv9sLeipL3cqzMogKN0ih0mABAAr0cgbwWHcBEeSYU0nsMONMvBZyib52xMkGHNWkmOkvvDPNIn6F9XfUM0V+yErfiXZ7AzycN7FRzCmntFqrkdVOSBquzB7sZ8n7hDNZvzXUX348U/5xwGG0p3Vbg9KeASHeJm2f+1NAUE0mkHGk5YjjSZbRPIjWPOuHcvNBTvNCEkQKH1rH8RwZ6t6YoFr6h5ncsnXrG/PN1RYOatU9DIBKtaPMLR0kES5p07M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tnVzloNHBPakErMWVXS0N2L2ZvVjV3ZW1YKzcwcGszaERNQ090VE96VkVk?=
 =?utf-8?B?elNNNlZsclBCT3VCTXNZZVI0OUNodlhMNzJpNlUzbXBQc1pGb1RHTlhzZGJj?=
 =?utf-8?B?ZS9hbjh3TTJIQmpxaG1CbXlSQ2FMNDQyOFhJSmdybGpib1Jnc2w0S0Nudm1O?=
 =?utf-8?B?Y2Y4aWt6b01WTW5veGtEWW14N1NNS1pQRm9UWDlTVGVzUUc0VW5zMXUyVlVl?=
 =?utf-8?B?WklGUTZ0YzM5c2JuMElMVyt6NmJXdHRxNW8vc0tOMDhQNVB3SGs1L2VpTEtz?=
 =?utf-8?B?VmtEcm1wT2czdXAzQVA2SzZhd2VpdFE3SzhjVzBEaE40ekszVVBRdDQ1WVpp?=
 =?utf-8?B?TWp2WHVPM3puKzJJS1kzbm1uWHl5Vi9DZ1RoZUxGeERSTXoxUnNjQzBkS0xZ?=
 =?utf-8?B?dlBPVkt2WGxCaWhDTkhwUGVDQ0RoR1FGL2VYRCs0VFp5MUM4MTBqNmp1MXRr?=
 =?utf-8?B?OUxtbmZWaXQwQjVMWS80czJFdFlFSXdYVU9UWXdWZ2I3Si80TEs5bkZjcXBH?=
 =?utf-8?B?SjlwSGpNU0VqMTFwRSswaVJXU29XT2VpOEx6OS9UMGxodSt4K2FGbGMzOW9N?=
 =?utf-8?B?QzBaUkFEMXNDZ3BnR3Q1L0daa1FOZk1VQ2hOZWZaUVY3dVNqampxd0ZTZkQx?=
 =?utf-8?B?V3libEp4MmtteHMwYkJOTFZGV3lmcHJ3djZJZVJ5NDZpcGUxVytKb2VxUVli?=
 =?utf-8?B?VEhpNmpBZlpkT1pKSlBQWFY3SXlibzYxMDlyTlBFRkludUtMcGZNYldFeHRG?=
 =?utf-8?B?MlN6VjV0aU42eWx4K1FKb0tSbktqaTJBcDFHdHFZdzhscHdMMlNkT2JQUkRB?=
 =?utf-8?B?YUhmSlFnUzZIb1pzOG9BeFFFWmZEdGFuaUg4MCtPSEdCay9tTjkzRTJlQzF2?=
 =?utf-8?B?dXA4YW5DQVplMlFCelUrZGZjalRvLzZ5TytFYTVDck51OEZZZFRIdjk4UkY3?=
 =?utf-8?B?UnovbElzbWdnTHI1cXdMTDhmMG9WbTN2RW9qRXJTdXpVWi9HWGJ4TElSZFhL?=
 =?utf-8?B?S1Z6azNqS1QxcDRiQ0Z4N2lIVkdLU3ZtREtxdElyYURGZnZmT2FnNmZ1RDdy?=
 =?utf-8?B?RXlkeXFsb2NHenlkWUQ3bGI5QkdFL0NBeHhvQ2ZFSVY0VXhmNnNobmp1dnpL?=
 =?utf-8?B?L1F1SjlRY2NLL3doSmZtYXh2WmpZclNCb2pURWk0N0FKcUIzMWtQakRsVGU5?=
 =?utf-8?B?am1iNVlCajFrM3RyZ0w3bGJFNmtyZFRVYVB3bm04RnVra3NEdUhHbm1sVVBH?=
 =?utf-8?B?czJZanpJQnErcWJPMjkrUnBwUmxtMnlTNFh6WkZBYmVsZHE1MnJtcGVqQnA3?=
 =?utf-8?B?ZW9Oblp4ZHNHbWo4cWYxc2ovekVIRDVucUJYQUZpdlpoVGlQWTB5dDBKQk9s?=
 =?utf-8?B?c1k4Ri9DZWdsSzMwUWxZVCswK2tNQmw3Y2IwajdHV1dseTZnZHBrbzlOTVYz?=
 =?utf-8?B?czdXZzE3RHU3bnlTdUpoaUN0QS9vQXNWSjJHUlJUZTRJNFBUU1dycjVFY0R3?=
 =?utf-8?B?VkJHUGl0UXZEcnRuOUsyUXk4QjVmVTVpempjUVl4RTdTYi9tc1lHR1pXN3hx?=
 =?utf-8?B?a2NhR2c2NzBpSUtHMzE0ZnhvME5DY2VXMWEzS2FyNzFCdmx0eVNsOVQ5NnV6?=
 =?utf-8?B?YnBCbkpjMWdVNDM0UVp0SzhHZFZ6NGZEdVBLaVdnTEZ6YUxtS2N4WkNxN1Er?=
 =?utf-8?B?ZU5KOVpsSzVqSmF6SXF2QVFXbXZ6V3ppNUl1ZE05K0kyUjIrR2VrazExTXMv?=
 =?utf-8?B?MzVCbDZTZzdXUXNrTW1qUk5aZW9oMkVFR1RqaUZ6dlBCc0toS0Q0dHRHTUlh?=
 =?utf-8?B?SUswSDl4Sm9zSzl5cm5GbVQ5Q21OMDZvVXo4ejBHbUt3SEpBUSt0eGpyV0Z0?=
 =?utf-8?B?dUJFZTdjN0hodEVzNEVQT24wdG5QdklSMklXd1ZORDhVWmVGMjc5dC9LS0tR?=
 =?utf-8?B?NjB0akVWUVd2ekphY25BbTF2Q05zOEpvZFNISitTSm5qQ0lnc0NUVWpDN2pE?=
 =?utf-8?B?bWh0SHR0aTJQZWd0Z2w3dGI5ckRVL3pMM29sNG1vRWVZTk82czFSZE90TTVr?=
 =?utf-8?B?Z2dnWDk4OEl1YkdXSVVIaDRnZU54d0tyTzFQdmtRTWk3OHR6bUdVL3BXVGxC?=
 =?utf-8?B?bDE1K1p4b0N0djFXOTRlK0ExZ01WYVYwWWdHb2M1V0E3SFdaNFF2b0RoeVo3?=
 =?utf-8?B?U2plb0dob2VTSWNlQ1d2VzZUeFpQOWN1ZjFuT3dVTDYrWW9pc2JNK29odG1n?=
 =?utf-8?B?UGx6aWw0YU9scnhPdTl0TGZEdVpyakRDdlI2VDgycmtZREdiWWpxQmtxaXcz?=
 =?utf-8?Q?MdpYc4TprIOHVnR/5y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b4e658-903f-4d99-8b39-08de800d2c66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:58:40.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgXs2Mpgp/BVrrwT1X0Bi04ZZUOSxcKpHbHR6MqB3/MAqIezjSSVi5Wti5UfL2HC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272
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

On 3/11/26 20:02, Thomas Hellström wrote:
> On Wed, 2026-03-11 at 15:52 +0000, Satyanarayana K V P wrote:
>> The suballocator algorithm tracks a hole cursor at the last
>> allocation
>> and tries to allocate after it. This is optimized for fence-ordered
>> progress, where older allocations are expected to become reusable
>> first.
>>
>> In fence-enabled mode, that ordering assumption holds. In fence-
>> disabled
>> mode, allocations may be freed in arbitrary order, so limiting
>> allocation
>> to the current hole window can miss valid free space and fail
>> allocations
>> despite sufficient total space.
>>
>> Update the fence-disabled path to walk through all holes and select
>> any
>> fitting range, while keeping the existing fence-based behavior
>> unchanged.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
> 
> Hmm.
> 
> The amount of changes we discover are needed for this use-case makes me
> wonder whether we are actually using the incorrect subsystems and
> should have coded up a separate utility for this: The utility holds the
> HW and shadow BOs, and we then embed (or possibly point to) a struct
> drm_mm_node in the bos.

Yes that matches exactly my thinking as well.

From the description it sounds like a job for drm_mm instead of the sub allocator.

Regards,
Christian.

> 
> Perhaps should've Claude code that up and see what it looks like?
> 
> Thanks,
> Thomas
> 
> 
> 
>> ---
>>  drivers/gpu/drm/drm_suballoc.c | 90
>> ++++++++++++++++++++++++++++++++++
>>  include/drm/drm_suballoc.h     |  5 ++
>>  2 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_suballoc.c
>> b/drivers/gpu/drm/drm_suballoc.c
>> index b74277bbc14b..307da191a855 100644
>> --- a/drivers/gpu/drm/drm_suballoc.c
>> +++ b/drivers/gpu/drm/drm_suballoc.c
>> @@ -78,12 +78,33 @@ void drm_suballoc_manager_init(struct
>> drm_suballoc_manager *sa_manager,
>>  	sa_manager->size = size;
>>  	sa_manager->align = align;
>>  	sa_manager->hole = &sa_manager->olist;
>> +	sa_manager->fence_disable = false;
>>  	INIT_LIST_HEAD(&sa_manager->olist);
>>  	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
>>  		INIT_LIST_HEAD(&sa_manager->flist[i]);
>>  }
>>  EXPORT_SYMBOL(drm_suballoc_manager_init);
>>  
>> +/**
>> + * drm_suballoc_manager_fence_disable() - Enable or disable fence
>> tracking.
>> + * @sa_manager: Pointer to the suballocation manager.
>> + * @fence_disable: Whether to disable fence tracking for free
>> suballocations.
>> + *
>> + * When @fence_disable is true allocation scans all holes without
>> waiting on
>> + * fences. When false, the manager tracks free suballocations behind
>> fences and
>> + * reuses them only after the fence signals.
>> + *
>> + * This should be called immediately after creating the suballocator
>> and before
>> + * any allocations are made. The behaviour is undefined if this is
>> called after
>> + * allocations have been made.
>> + */
>> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
>> *sa_manager,
>> +					bool fence_disable)
>> +{
>> +	sa_manager->fence_disable = fence_disable;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_manager_fence_disable);
>> +
>>  /**
>>   * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
>>   * @sa_manager: pointer to the sa_manager
>> @@ -110,6 +131,7 @@ void drm_suballoc_manager_fini(struct
>> drm_suballoc_manager *sa_manager)
>>  	}
>>  
>>  	sa_manager->size = 0;
>> +	sa_manager->fence_disable = false;
>>  }
>>  EXPORT_SYMBOL(drm_suballoc_manager_fini);
>>  
>> @@ -161,6 +183,69 @@ static size_t drm_suballoc_hole_eoffset(struct
>> drm_suballoc_manager *sa_manager)
>>  	return sa_manager->size;
>>  }
>>  
>> +/**
>> + * drm_suballoc_hole_soffset_eoffset() - Find a hole fitting size
>> and alignment.
>> + * @sa_manager: Suballocator manager.
>> + * @soffset: Start offset of the selected hole.
>> + * @eoffset: End offset of the selected hole.
>> + * @size: Size to be allocated.
>> + * @align: Allocation alignment.
>> + *
>> + * This function is used when fences are disabled. It scans the
>> holes starting
>> + * at the current hole pointer and selects the first one that can
>> satisfy @size
>> + * once @align padding is applied. We may need to scan the entire
>> list of holes
>> + * and update soffset and eoffset for each hole to find a suitable
>> one, as the
>> + * current hole pointer may not be the same as sa_manager->hole.
>> + *
>> + * Return: true if a suitable hole is found, false otherwise.
>> + */
>> +static bool drm_suballoc_hole_soffset_eoffset(struct
>> drm_suballoc_manager *sa_manager,
>> +					      size_t *soffset,
>> size_t *eoffset,
>> +					      size_t size, size_t
>> align)
>> +{
>> +	struct list_head *start, *hole;
>> +
>> +	if (!sa_manager->fence_disable)
>> +		return true;
>> +
>> +	start = sa_manager->hole;
>> +	hole = start;
>> +
>> +	do {
>> +		size_t s, e, wasted;
>> +
>> +		/*
>> +		 * We can't use drm_suballoc_hole_soffset() and
>> +		 * drm_suballoc_hole_eoffset() here as the hole may
>> not be same
>> +		 * as sa_manager->hole.
>> +		 */
>> +		if (hole != &sa_manager->olist)
>> +			s = list_entry(hole, struct drm_suballoc,
>> olist)->eoffset;
>> +		else
>> +			s = 0;
>> +
>> +		if (hole->next != &sa_manager->olist)
>> +			e = list_entry(hole->next, struct
>> drm_suballoc, olist)->soffset;
>> +		else
>> +			e = sa_manager->size;
>> +
>> +		if (e < s || e == s || (e - s) < size) {
>> +			hole = hole->next;
>> +			continue;
>> +		}
>> +
>> +		wasted = round_up(s, align) - s;
>> +		if ((e - s) >= (size + wasted)) {
>> +			*soffset = s;
>> +			*eoffset = e;
>> +			sa_manager->hole = hole;
>> +			return true;
>> +		}
>> +	} while (hole != start);
>> +
>> +	return false;
>> +}
>> +
>>  static bool drm_suballoc_try_alloc(struct drm_suballoc_manager
>> *sa_manager,
>>  				   struct drm_suballoc *sa,
>>  				   size_t size, size_t align)
>> @@ -169,6 +254,11 @@ static bool drm_suballoc_try_alloc(struct
>> drm_suballoc_manager *sa_manager,
>>  
>>  	soffset = drm_suballoc_hole_soffset(sa_manager);
>>  	eoffset = drm_suballoc_hole_eoffset(sa_manager);
>> +
>> +	if (!drm_suballoc_hole_soffset_eoffset(sa_manager, &soffset,
>> +					       &eoffset, size,
>> align))
>> +		return false;
>> +
>>  	wasted = round_up(soffset, align) - soffset;
>>  
>>  	if ((eoffset - soffset) >= (size + wasted)) {
>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>> index 29befdda35d2..066412196f8a 100644
>> --- a/include/drm/drm_suballoc.h
>> +++ b/include/drm/drm_suballoc.h
>> @@ -20,6 +20,7 @@
>>   * @flist: Array[fence context hash] of queues of fenced allocated
>> ranges.
>>   * @size: Size of the managed range.
>>   * @align: Default alignment for the managed range.
>> + * @fence_disable: Fences are disabled for this SA manager.
>>   */
>>  struct drm_suballoc_manager {
>>  	wait_queue_head_t wq;
>> @@ -28,6 +29,7 @@ struct drm_suballoc_manager {
>>  	struct list_head flist[DRM_SUBALLOC_MAX_QUEUES];
>>  	size_t size;
>>  	size_t align;
>> +	bool fence_disable;
>>  };
>>  
>>  /**
>> @@ -51,6 +53,9 @@ struct drm_suballoc {
>>  void drm_suballoc_manager_init(struct drm_suballoc_manager
>> *sa_manager,
>>  			       size_t size, size_t align);
>>  
>> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
>> +					*sa_manager, bool
>> fence_disable);
>> +
>>  void drm_suballoc_manager_fini(struct drm_suballoc_manager
>> *sa_manager);
>>  
>>  struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);

