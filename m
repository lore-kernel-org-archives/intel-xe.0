Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2378AFED2E1
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 07:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13E10E994;
	Thu, 12 Mar 2026 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HEpyYkE3";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1D10E997;
 Thu, 12 Mar 2026 07:56:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCkpkz0NvnVZM6S8mPb4ia/244IRfXKfi97kNccFyXw58bmuRtq50LN09vPyx+5baLWOrO1/eQEOEjfYO3pFdoFUVqoVRityKdc5r7CKjDPhIMVNkFWR0Qi/avSmYOC0sDopecfnAk2uUfuBTEePiMDRxNQG5qgfJV6TFOWIvmpbax08xAmdNFmtZYiHMSfY9RO8vM3lxrpipe5OxRunLtJCl3hbIlHfxU617DDQEjZp31g00sQy3p++HZbbjs3NLQY/9zkcIIdaPE1fMYe7YsqaYN76XutyicUuhB1HX5Eq7EogjqK6P4xnLjhkr+WMxqn/lVsNxAJoVvjDe8HtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcSP7KSwij88x/UpA/R6VhUQGs6LVMVHkIWcEjN+WVE=;
 b=E4KVkNn6fXffzRljbEt6sut615LrctmoOI29AOgv57BM0CFQ+Hg8AdcF8Q9jrUMAbIv+mep0x1JVf3WA0tfe/nWL7x1GE4Jw+sH9K6MnoOFGN9NY4ht08SEPTOupRCiNJ/7z5wGMqS2SfQbrUzZp2/DQxOhtNPJ1vXO5Dj+pIG7zr2kSHfYtJCZ0TJcWWA5u3Uf67Qi9bVRXjeFaf8MtvcBpb8/6JRE2ZFVGX+N86pNP2syIRfBhSFiqtW6Liwpv/qzwfrsajuJkH5RYbFpvNe2Z5fe8+YGEnHK9swVbtHM6XZ6BO3cb8yL1z/r6oMkl/QbxTVYBOcVq0FR0CfW6tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcSP7KSwij88x/UpA/R6VhUQGs6LVMVHkIWcEjN+WVE=;
 b=HEpyYkE3FEMqpB/bdu5V5P8uoQa/JeKdbHrm82RP2eu74DuQhjR6v9wADfrzr2GOh+vyqe9CQ/oIA14Zp55rpXoHrTbVP7xGhvG1IFEYqdSzsrekmN+REbhv02FEjpCd3vgtBcZd1nEuN5strnlBa3itvHdkD2adPp/B8hL4v5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 07:56:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 07:56:38 +0000
Message-ID: <c97a444f-1b47-4281-8cdb-b544c8fb59af@amd.com>
Date: Thu, 12 Mar 2026 08:56:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sa: Scan all holes when fences are disabled
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
 <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fc7205-e89e-4b0b-cef0-08de800ce3b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info: Omx3dQeCUCtMyc8tqXir6BJNEYvk60DBuKZTHc+66qrRIitkI0zcsQzKV4T0NVcC9wUxm4gPhuLL3s3DNYU49ZM2DL8sTSVkJta9MigmE9WBcKTfhEem9TT0za50W3QM07CL5hR3XFR5kMnjZ8uzDO4urjgNuWtNvOkku3KwGvBwuPLTPiQcJ9gzxbgH4zmbp3ramDRoAmhQbiEDsXyeOsLK9HxnGO49c13Yd0SNmT5+vkKJC9qeMBoj9UXBI/heDCt1Pkk+0uBJ2MGisrAbknDoAJYO5mBkU4uGBBQ7uU193hShdW6HLgUil8S9U3azpzNcV1h6ZE6Lg4amdxEWaLhVSrzXx2duwa8PWeragOFOcI4ZixViDMGotpcYI7ITAuieyyJV+OGVTSittm7VtY7nOpTdvhbMTytAoED/1QJkPKFLPW0D7nvYKU69GJ0iXBSQ+yVJixTo6tR/KagrgwHjLuSmfKhxa3os0KgvKGRgWQwzgilhJUlrT5AprR0SpD+VK8ntcf28/F6coK1/jasxBxAf4NvEA5ppK2Y5j1YO3MfvT9v2miXfAXkWKDIaNeIrkFSKvE2+FhBxbe4mZcmlrbieyNuwNjx4oIoZq6E0ZYOmX0OojvyOp6mwddWNW/8DvYYf83GSqIHOGqqIVpZo6YcHJtOTf+sdSlr7xpHhWQ+3jM2/KP9EzQzpGCS+82sKTFmAL5plGef+vxG1uOPy2Ru4G68v42sIVa1D8z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkR6aGNyZ2Nrcmlxd0UrbDFQUTJsRW5POVpyRnFzcTYxUG42ZHJ5OVhROHV6?=
 =?utf-8?B?VlRqWnh0QnROWVhpR2xmK2o1dmlZVVhwSHIwVGpidStndDR1cEVsTHM5dEsw?=
 =?utf-8?B?K3Q5YThieVEyQ0pZbWtOaGVXaGoyN2NEb2s1ZHl3Z1V6TXBSREdTTFlmZ0Q5?=
 =?utf-8?B?YlVqWmhpbjM5cm1TZ1Z2M2VCQ2lqOTU1UXZRa3ZhcWtWYXJleGl2Ynk5RGRn?=
 =?utf-8?B?TXFPdldvdG9yTU9YYmtjdms5aDRaV1RFNC9LSDRhWkpndG1sSU9pTW5Qb2Zz?=
 =?utf-8?B?NHdnUzBvbUl2alFvMGJZZm5pYzVpNVl1Y1NkTmUvUlJQL2ZpOHJ6NS93ZFVL?=
 =?utf-8?B?ZTdCWXRQMFkyRTFoYUp0cmZKM1NXWmZQSFdZV3ZJQkt4ems5V1FQbVdpekJD?=
 =?utf-8?B?SWJWR0Q3dlowTnJXL3lReS8zQ0ptZ3Q3VlVFWklKSW9xYi9nSnJtRzNRRm1V?=
 =?utf-8?B?MGkrbFhodXZMS0FQb1lYdjh0L04rQTdOcGUxdjZVeWpwUTJvdGg5ZXBaYzlz?=
 =?utf-8?B?Z3JXQVQwdXEyWlpRS2JvbTZzQnZMU1pkdk9MMDR5b3N6YS9wU3I3Ukc0MkNl?=
 =?utf-8?B?YUVSRGoxYVVoc2JLZkM0UWNnbmRsbWo5WFFXM0lINXNOMU5maCtSQ2ZMbmM1?=
 =?utf-8?B?enRsSEo4RXVyVis2L3A0M0RkcjIxSUxIbFRlL3VaUHozcE5lOXcvTUQ2NjBC?=
 =?utf-8?B?MVRDK2kzM3phMCtRQngzSjlmQUVLR1l1K2VNZ3hyWTRINGd0QmJnbjJQdHZO?=
 =?utf-8?B?RWNSUjBnOVhlRWs1TXlIeG1udnNOVEdaMC9adHF0ZjE4OGdBYUNYUEhYTit3?=
 =?utf-8?B?aGJweC9Rd2RqbldoeHNpY3NrK1RHODNHLzJvRmc3T1JyeWE0VlI1UnhSMWRX?=
 =?utf-8?B?ckdqOU1qaFU2S2tYbndTU2JFN3g2Z0dzN3NvWVNtUWxaNHA2STlYdHBKZEJW?=
 =?utf-8?B?MU11aU16NGFWWGFxZHhodllyTWF0SzJJQzNUQ2dSRmJadDEvOXNvYzM4Q2Fk?=
 =?utf-8?B?SlBRYlU3WHlLamFxRVpBMlZKNThHY0d2dUxPT2UyODR5Nm1GNXZ4OS9yL2Js?=
 =?utf-8?B?R3FKeG83WDhZbW8vc1YrRjVGWDlsenFDRVZIZDNBMUZZeFJxTnFyME9qOXF3?=
 =?utf-8?B?bytTbEZCQThQaHloR1hLOW9DaW9PWDlpc3o2MHlCQmttcmZrL0FBcForRE8r?=
 =?utf-8?B?SVkrR05rWmp6WjNUblNEK09DWERlNFlMMVJieTBsRWNnWHpTZlhqRFpac3lY?=
 =?utf-8?B?U1laQUFLalFoQlZQbU9OUzlvRlg3QWFMRmpla1lYdUpORUszM1MwUkJXU3Zv?=
 =?utf-8?B?K2NsVVdkTnplZmx4SFdZeTVEQ1VrL2VTQWd2bStkNWZEM0pnU2lVekkrOHE4?=
 =?utf-8?B?VDIrR2hleXBwOWNrQnRKbk9LWVBFRGQrcVdNclZEcFBld1M3bzJwZTJTTWQ5?=
 =?utf-8?B?SFJSNHovc2hFQWMrSUl0WUVMVnh5NUIySTZLUUxDQi9YTGVablNFY2R6TDJT?=
 =?utf-8?B?a0VNY1JhK1J2dGtrbEZWUnhXT1BjTDA0TXJmQzllSThFaHQ0Q2xiSjdtR0J4?=
 =?utf-8?B?b2d3RDNZOEs1OWRqQzNFUjIxaTJaeTc2MTcwVWhKbzRNT0dwSUR2VVdpTFVt?=
 =?utf-8?B?Yk5IVHgxR1h4ZmxPYmlUa3hqY3dOV21Dd2V0RXFKSzFFa2F3MnRLc0ZGbnVV?=
 =?utf-8?B?ZXQwRnZrQWg3empIeHNDcEZVNFdsanNBYUZremxNQ0MyRUN6NDRVbWRKb1Jn?=
 =?utf-8?B?dEVBOHFaRHArVWd2VU9BZ0MxZHlRMkRIUjFHbERmYzBLdDlsQzFiZzZxR0RU?=
 =?utf-8?B?bnVvVmJ4QUhnZDR0bk12ZFdaVTUyUEVUYWloVENFN3N4bGd4eVViOW0zbnlT?=
 =?utf-8?B?T0FKcENHaE5GQVNJeHNsYUVXWFRHRlpVbXEzZk5TNWkvREFTQmlUNFBhOHM4?=
 =?utf-8?B?dmFYdHh0bkpUdzU5aGxGclVWU3N6RmNscmJuYThoZXFNdGZaNXdINEtiM2Fs?=
 =?utf-8?B?eFFySzNQYnUzQTRCb2ptQ2VWU2xTOVBHei9LVTFzRXpMOVZGTEFOeFd0NENB?=
 =?utf-8?B?Zy90YlYxOTNFTXhkejJBN245WVI2ekd6bXQrem9hUzUzVWczTzdUb2ZVOVlH?=
 =?utf-8?B?V3FXc1ZtMkpxWjMzK3c5TnhiVnAycjVydDR6dTd3cDVPNFZCU3lWNXN0MGh4?=
 =?utf-8?B?VGYyYjJ4NitUWXg2S1gwajRaYi82UmQ5SExuZ1pLY1ZEWHI3UEFZMmFTL2Fl?=
 =?utf-8?B?akl0dUZ0RUtCbldTem55d2FMZFc0WnRhU0V2c3p4V0t2aVhpK2I5ZUU1R1VC?=
 =?utf-8?Q?ShN7x/2c9TMILHCCYS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fc7205-e89e-4b0b-cef0-08de800ce3b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:56:38.2877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnEc5RD8Mi48YyLqYDNtQCDOqIoFaue1HiNxmaiJKBXPH20r8AaGQfbfaT7o4oK5
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

On 3/11/26 16:52, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable first.
> 
> In fence-enabled mode, that ordering assumption holds. In fence-disabled
> mode, allocations may be freed in arbitrary order, so limiting allocation
> to the current hole window can miss valid free space and fail allocations
> despite sufficient total space.
> 
> Update the fence-disabled path to walk through all holes and select any
> fitting range, while keeping the existing fence-based behavior unchanged.

Mhm, that sounds like we are abusing the SA for an unfit use case to me.

The whole idea of the SA is to work with fence protected allocation, if you don't need that then you can also use the drm_mm for the job.

So why are you not using drm_mm for that?

Regards,
Christian.

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_suballoc.c | 90 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_suballoc.h     |  5 ++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> index b74277bbc14b..307da191a855 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -78,12 +78,33 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  	sa_manager->size = size;
>  	sa_manager->align = align;
>  	sa_manager->hole = &sa_manager->olist;
> +	sa_manager->fence_disable = false;
>  	INIT_LIST_HEAD(&sa_manager->olist);
>  	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
>  		INIT_LIST_HEAD(&sa_manager->flist[i]);
>  }
>  EXPORT_SYMBOL(drm_suballoc_manager_init);
>  
> +/**
> + * drm_suballoc_manager_fence_disable() - Enable or disable fence tracking.
> + * @sa_manager: Pointer to the suballocation manager.
> + * @fence_disable: Whether to disable fence tracking for free suballocations.
> + *
> + * When @fence_disable is true allocation scans all holes without waiting on
> + * fences. When false, the manager tracks free suballocations behind fences and
> + * reuses them only after the fence signals.
> + *
> + * This should be called immediately after creating the suballocator and before
> + * any allocations are made. The behaviour is undefined if this is called after
> + * allocations have been made.
> + */
> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager *sa_manager,
> +					bool fence_disable)
> +{
> +	sa_manager->fence_disable = fence_disable;
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_fence_disable);
> +
>  /**
>   * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
>   * @sa_manager: pointer to the sa_manager
> @@ -110,6 +131,7 @@ void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
>  	}
>  
>  	sa_manager->size = 0;
> +	sa_manager->fence_disable = false;
>  }
>  EXPORT_SYMBOL(drm_suballoc_manager_fini);
>  
> @@ -161,6 +183,69 @@ static size_t drm_suballoc_hole_eoffset(struct drm_suballoc_manager *sa_manager)
>  	return sa_manager->size;
>  }
>  
> +/**
> + * drm_suballoc_hole_soffset_eoffset() - Find a hole fitting size and alignment.
> + * @sa_manager: Suballocator manager.
> + * @soffset: Start offset of the selected hole.
> + * @eoffset: End offset of the selected hole.
> + * @size: Size to be allocated.
> + * @align: Allocation alignment.
> + *
> + * This function is used when fences are disabled. It scans the holes starting
> + * at the current hole pointer and selects the first one that can satisfy @size
> + * once @align padding is applied. We may need to scan the entire list of holes
> + * and update soffset and eoffset for each hole to find a suitable one, as the
> + * current hole pointer may not be the same as sa_manager->hole.
> + *
> + * Return: true if a suitable hole is found, false otherwise.
> + */
> +static bool drm_suballoc_hole_soffset_eoffset(struct drm_suballoc_manager *sa_manager,
> +					      size_t *soffset, size_t *eoffset,
> +					      size_t size, size_t align)
> +{
> +	struct list_head *start, *hole;
> +
> +	if (!sa_manager->fence_disable)
> +		return true;
> +
> +	start = sa_manager->hole;
> +	hole = start;
> +
> +	do {
> +		size_t s, e, wasted;
> +
> +		/*
> +		 * We can't use drm_suballoc_hole_soffset() and
> +		 * drm_suballoc_hole_eoffset() here as the hole may not be same
> +		 * as sa_manager->hole.
> +		 */
> +		if (hole != &sa_manager->olist)
> +			s = list_entry(hole, struct drm_suballoc, olist)->eoffset;
> +		else
> +			s = 0;
> +
> +		if (hole->next != &sa_manager->olist)
> +			e = list_entry(hole->next, struct drm_suballoc, olist)->soffset;
> +		else
> +			e = sa_manager->size;
> +
> +		if (e < s || e == s || (e - s) < size) {
> +			hole = hole->next;
> +			continue;
> +		}
> +
> +		wasted = round_up(s, align) - s;
> +		if ((e - s) >= (size + wasted)) {
> +			*soffset = s;
> +			*eoffset = e;
> +			sa_manager->hole = hole;
> +			return true;
> +		}
> +	} while (hole != start);
> +
> +	return false;
> +}
> +
>  static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
>  				   struct drm_suballoc *sa,
>  				   size_t size, size_t align)
> @@ -169,6 +254,11 @@ static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
>  
>  	soffset = drm_suballoc_hole_soffset(sa_manager);
>  	eoffset = drm_suballoc_hole_eoffset(sa_manager);
> +
> +	if (!drm_suballoc_hole_soffset_eoffset(sa_manager, &soffset,
> +					       &eoffset, size, align))
> +		return false;
> +
>  	wasted = round_up(soffset, align) - soffset;
>  
>  	if ((eoffset - soffset) >= (size + wasted)) {
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 29befdda35d2..066412196f8a 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -20,6 +20,7 @@
>   * @flist: Array[fence context hash] of queues of fenced allocated ranges.
>   * @size: Size of the managed range.
>   * @align: Default alignment for the managed range.
> + * @fence_disable: Fences are disabled for this SA manager.
>   */
>  struct drm_suballoc_manager {
>  	wait_queue_head_t wq;
> @@ -28,6 +29,7 @@ struct drm_suballoc_manager {
>  	struct list_head flist[DRM_SUBALLOC_MAX_QUEUES];
>  	size_t size;
>  	size_t align;
> +	bool fence_disable;
>  };
>  
>  /**
> @@ -51,6 +53,9 @@ struct drm_suballoc {
>  void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>  			       size_t size, size_t align);
>  
> +void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
> +					*sa_manager, bool fence_disable);
> +
>  void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
>  
>  struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);

