Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0359AC43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 05:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A884610E182;
	Tue, 30 Jun 2026 05:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1DLC3IPi";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC98A10E182
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 05:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWbCya1bD7tNgOyOIYs79Xlzqkc0gN19LiZQ/z6/W2s/HpoJDFBUS2rooCHDZsxDq0ukLKjcQF0EnHMewO8AeP9VFtwEy8/N0mfOGpmyV3GZ5kCKcazGRWPXs/LWV+fUhsJ33TwP4QGfabWd5eTp8XxqRbMaInDVfthDr1K4ZmEKtHVSMY+lo+VJF+UgcMRrAybpPi3iQ6mqlnmDyGJtvY7VrQk25kncqPAtjPYezwaQLjBEdTdXendLDecRdxqKNoL3iAlQHx/rtL+3UDq9fRsaFzZ1rMxCo8v6Id834Uao1lG1oufsv+N1V6Q+UTzYn7LloKWs9Ak44HXW6C5Ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiQassLb/co0tiAo68roAwBXqFAPDe1SxRj2p1ZrM0Q=;
 b=CObvUEctgeGVqy7fkxFSJyjdadQSOsRj67/FZBIAgRAtB1gmFEFb4bWhNiIi2HLPuwF0Ae+lHch6Gm1aVNM/mrMocjqDREOlg4B2K+KVTy4+6rKSg0nXPv/OmoJg+dm+DdYSByGSiTq4vWcuEB9NfMh0fhBvbIjQiMQIoUi2yRcO33utBMoC+nfiQPwNNqjX6dMYhUJ4YtUnmguPey3nQs25asrfgYUfQXd0TI5KjMTeJc7dw/ZduJZsmlVJQXGPaD0klIEGO8KVS9BAAPecdxhntgvMwqU1DierIXdNTAqdZNyt1v1kw6YOJyq7xO0niB+lQPx9o8KHwAWJ9D/vmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiQassLb/co0tiAo68roAwBXqFAPDe1SxRj2p1ZrM0Q=;
 b=1DLC3IPivKxp9WYBPoJOMWRJ/jpwoDrb33SXanUv0Hp/DWPCSPzHhZ63Kfb9hex7I58zFefvZiB8rrc7WQSPFMJnmkSLGrammZcyDok2GxXihJ4L+T51YOxd4DcJf8ZOP5z07UDzNjspLBj1JFPQhmpXqno+WI/vaeVaL4nuwBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18)
 by DS5PPF7B9F1F8E0.namprd12.prod.outlook.com (2603:10b6:f:fc00::656)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 05:43:11 +0000
Received: from CY8PR12MB7170.namprd12.prod.outlook.com
 ([fe80::7565:bdd3:383a:de5f]) by CY8PR12MB7170.namprd12.prod.outlook.com
 ([fe80::7565:bdd3:383a:de5f%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 05:43:11 +0000
Message-ID: <2558870e-6ba5-40a4-9578-86a21c10e7b2@amd.com>
Date: Tue, 30 Jun 2026 13:43:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/gpusvm: free the whole IOVA reservation on
 unmap
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20260630034021.362571-1-honghuan@amd.com>
 <20260630034021.362571-2-honghuan@amd.com>
 <akNARmCitub0EIio@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Huang, Honglei" <honghuan@amd.com>
In-Reply-To: <akNARmCitub0EIio@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To CY8PR12MB7170.namprd12.prod.outlook.com
 (2603:10b6:930:5a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7170:EE_|DS5PPF7B9F1F8E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c1eea6-5c0b-420f-c4df-08ded66a7871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yLwKS578PvJmj25z/l3oWFPiDDSjVRieURp1Ibz/5mut2AkUWcfRsGjAusFk7ObQytY38aMo7gOLq2JD9bbypjDeJPezNBK8Yq55XRTgkpjv1AUaEtGsGL3wREHSxfUIqCWik7iA99DjKsD9Topa+3x9pHYvsNiGCtdML2wvIlg39x2MWfsb481b2e5AJcuUlIi5buD+XKm6Jj3ptiSbHFosMAx2KD+364o0Q6ATnJdT9DTtiAZToGiUtcdnLREtOgnVF/GODj+Q1lYLDF80YmmMNHS2bPCjHXizs+M5cgs9ArMHAJEce1nKv2xlO77INn+HyA2K4QE8oTlY4sU2dWKYHITg/5fDgA9Ie2InIZGMZ0U030VT55a6gjiWry6ZrqhGtMBQheVXLlqXmrcIyaepXDtalQHc+eHVefjjovRaNSIsx3LPEwFniFzT9ToI06eha7SJqQo+XXWzJkGJ2OU9zuE+9INXfuo8vjkPYZfjQD5xA15iXU5uAXpQW2saqkSw+3SGW7RtFOfnJa9A5+Gk56OcYMcuOt/JYlirJPDLGXALcxzMo1twWOrOWHGvnLQArmvZHCCiwioAYc50w5SMBDwNcMc7HnXiKUHS5GNzxjtsQzjg5SwmSNP4ccWuYZ4pu8sXxrEdHG3oxL6qk30+bpZ6qHy3R1gzpilJu+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7170.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVySDRRbWJBSy8rU0xoc0hwRnF6eHZaVE4rUnVUYUFJNEpKazNZVk45L2hh?=
 =?utf-8?B?WkFvVHhORTVUYzNWWFZPSmJjOXhUWlFhd1p5dGtXL3lKVDVJQitvZWIzajhI?=
 =?utf-8?B?U1k4bzhmbmI0MVhIRURsemdCdXRpcm5XQUxmcityLzFVV3l6MXF6N1drZXN2?=
 =?utf-8?B?NFVjQzkwV1c1b2ZZR081dlRGamwvRGVxVFo5WTIvbWNZQVU4YVNmdkRFREVQ?=
 =?utf-8?B?UE9UMHU2b2VjaFd3QjcxQWVkbHlYc1NQNnVlZHR2SHJYNW9WQTF2Z29HekVV?=
 =?utf-8?B?eGM1QmowbzdWVmNvRmdkNDNaSURMMUYvSnBhKytrOHZwMVA0ME5IU2d2VThv?=
 =?utf-8?B?aE8vL1RKdDU0T3FDQklIOVBQeUd1cHQ4Um94REhwTUIxa0wrYU4rcXQ5c1h6?=
 =?utf-8?B?R0tkcWRkWUVrbUE0eFNVNngxcWozYWFyd3dPTkoyaHcrQWVRNVJKaUQwaWNn?=
 =?utf-8?B?QzhnSmZZYnpjWXBDUGF1SitYc3Nqa2ZqZTNpay85SlNDOE9BT3RHczIwK3Jw?=
 =?utf-8?B?a0xUQ3MyenBoUW84TENHRlg0SWRKQ2pJS21zeWMra0REN2l3YkN6K0ltZ3hN?=
 =?utf-8?B?Y2NlTXRlY2lZczdRaGZrY1dOZ0VMMDBEWWZuaEtqU1B2ekZWUzAzblZEQXYz?=
 =?utf-8?B?VE84QVo3UURvTG1XVFVwaXlndmRWVHVPVTI3THUwL0JSTkRhUW9QNVdoc0hJ?=
 =?utf-8?B?bVZ3bW02T2tlVW1UWE1KK0c3eGJLQk5iS3VPWmxMbU5scVJPSWsyazZXZUFt?=
 =?utf-8?B?VFBPK05qTTdRM3lSakxlanZlQ3JoNitEV2NhRmJWUHlTdWZNYzhvTWhHM2NK?=
 =?utf-8?B?TEM3V0RFNUlVN0VTRkU4NFI3eGJWL29FUWhra2p6OGcrcEhxMVNXUG9QVDBz?=
 =?utf-8?B?emFaYkFPZUxTRmxiUkxLRXhnbHlwcHZjTkVVak5Vb0lubmtud1k1YWxZcTQz?=
 =?utf-8?B?MEpzYnRYUkVzY1Z3UHlKRGJTL1IxeFJ0ZklpV2cxV2NDRzU3N3RGTi9IQ3Q4?=
 =?utf-8?B?aTVGK1IySm9XNWdWQWNDWVVIdHBzSlM1ZU12NjYwRDJXamhLUmRPN20zVHlq?=
 =?utf-8?B?WW56aUptMGxSemM3azVXb0txbWhyamtMK0pKby9TTXBzMUJudTdSWWJNWVZi?=
 =?utf-8?B?ZFBGSGUrdUtYc08yTzJXejZHdURobTR5RWNNM21OeitWSlh3YnlLYVV1ZWFZ?=
 =?utf-8?B?T0RPNC9iU0dyalVpR0tvaHlrRFF2bDZLckRwL3RUekRLN09Ib05ZS1VuYWwr?=
 =?utf-8?B?WUdqV3FjMVAzbUJEZ0dBelpRVDRiczVOM0Z3TWpFSHNLZ3VyZHlaM2JzUGJ6?=
 =?utf-8?B?dGhMNEVzNlEyUHF4WTRnd295aTBPMHlpanJNeFlpN2dCOHJvbjB2SHlmcHlP?=
 =?utf-8?B?ZUsvOVNSc000ZzVLUFRQR2VLTXl5NjNFYTNGdWJpeTYvNUNVRTB5a0xyNlFI?=
 =?utf-8?B?dGF4NFZXZUwybFgzdUZDZzFnM1hDTTA3TDNVbnd6S3FFWXQxc0JIaFhEeW13?=
 =?utf-8?B?SnZYZzgyQi9FbnZqWGtPVHBYU20zZW1iSzFXOWZLTmFZRUlxbjJFV2FDaFNq?=
 =?utf-8?B?NE16a3NoL1NIbGNwdXhScUZFU1VBaUdDWE9KUVpqd3h0RmR3L0xGY2JuZWtk?=
 =?utf-8?B?bSt2eFRtUWw1NkgvZDcrQzExK25ncVNQR29RNm1XRW5rQjRTNmJIWkFYNVAv?=
 =?utf-8?B?UGRWTzVZSVJyaDlQb2s1djdWQkM0UnhCYnc0TXlwb1IwdmJDRVJZNURyeHlC?=
 =?utf-8?B?Y2RRQkFXaFljb1FqeXBYYlRuY3cvVGRhcTQvMm1BdWJwV1pjaUxaaGQvTGl3?=
 =?utf-8?B?d21odUR6QXNmUVRLTW9YWk9FRmFLRkRLY3FGUWlMK1Y3dUwzczlNSFRsSFo1?=
 =?utf-8?B?MklCeUtWeUt5Qi92U2pJVERKT3dVaXQ2eDFVVmtxTW1xMzdrVWFROHQwQ2NL?=
 =?utf-8?B?LytMUE13K1FNVUZJb29aMTM1bHRqV1Zya1FKQm0zS0RFcTZzL1NvRDkwd3p5?=
 =?utf-8?B?OTV2cHdVR21qYzUxNG9YcDdwaUFLdTNOSmVKdXA0TFhMZjM4ditlNEhrbG9z?=
 =?utf-8?B?citNMFNBNjV6cnd1YXJHZjJ6QUgxZE95cnRLZzlYekt6VDRnV2FRbExna2tH?=
 =?utf-8?B?YTJrUlZXU3Y0blIvdElVOVBvY3lIbE5nbFdLOXo0UWFDZS82OWM2MUpJcjNT?=
 =?utf-8?B?Q3F6d2hYdDZZcVVqdlJ5cVovZzdEbVc3Y1VHRlIzUzFzUUVUbHJWNlJEVUo5?=
 =?utf-8?B?clBkT0VXU2d2K3poUitjSzZZTnc4d1EzRjJNSkNTNXdaa1o3Wms5YitJb2R3?=
 =?utf-8?Q?WWRrc2L30eAtyPFpVt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c1eea6-5c0b-420f-c4df-08ded66a7871
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7170.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 05:43:11.1175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQ3d5HDWeeyoqPH2Z0kU/A1RIx5SuPiA9o4SSLNqY58QBpJPJLLAqF+nVOa1YJkjR8lYvgrdaQHlwfWdmCnh+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7B9F1F8E0
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



On 6/30/2026 12:04 PM, Matthew Brost wrote:
> On Tue, Jun 30, 2026 at 11:40:19AM +0800, Honglei Huang wrote:
>> dma_iova_try_alloc() reserves IOVA for the entire range, but in a mixed
>> range only the system pages are linked (their total size is state_offset)
>> while device pages never touch the IOVA state. dma_iova_destroy() with
>> state_offset only frees the linked part, permanently leaking the IOVA
>> reserved for the device pages and eventually exhausting the IOVA space.
>>
>> Unlink the linked system-page portion and free the whole reserved IOVA
>> instead. On the get_pages() error path state_offset is 0 (no page linked,
>> dma_addr[0] unpopulated), so skip the unlink and just free the reservation;
>> this also avoids reading the uninitialized dma_addr[0].dir there.
>>
>> Allocate the dma_addr array with the zeroing kvzalloc_objs() so every entry
>> has a well-defined value.
>>
>> Reported-by: Sashiko AI review
> 
> Reported-by: sashiko <sashiko@sashiko.dev>
> 
> Fixes
> 
> Cc stable too
> 
> But fix looks good, so with proper tags:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Got it, will add fix and Cc stable.

Regards,
Honglei

> 
>> Signed-off-by: Honglei Huang <honghuan@amd.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 958cb605aed..3145d55cd86 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -1146,10 +1146,19 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>>   		};
>>   		bool use_iova = dma_use_iova(&svm_pages->state);
>>   
>> -		if (use_iova)
>> -			dma_iova_destroy(dev, &svm_pages->state,
>> -					 svm_pages->state_offset,
>> -					 svm_pages->dma_addr[0].dir, 0);
>> +		/*
>> +		 * IOVA is reserved for the whole range but only the linked
>> +		 * system pages (state_offset bytes) need unlinking; free the
>> +		 * entire reservation to avoid leaking the device-page part.
>> +		 * On the error path state_offset is 0, so just free it.
>> +		 */
>> +		if (use_iova) {
>> +			if (svm_pages->state_offset)
>> +				dma_iova_unlink(dev, &svm_pages->state, 0,
>> +						svm_pages->state_offset,
>> +						svm_pages->dma_addr[0].dir, 0);
>> +			dma_iova_free(dev, &svm_pages->state);
>> +		}
>>   
>>   		for (i = 0, j = 0; i < npages; j++) {
>>   			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
>> @@ -1486,7 +1495,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>>   		/* Unlock and restart mapping to allocate memory. */
>>   		drm_gpusvm_notifier_unlock(gpusvm);
>>   		svm_pages->dma_addr =
>> -			kvmalloc_objs(*svm_pages->dma_addr, npages);
>> +			kvzalloc_objs(*svm_pages->dma_addr, npages);
>>   		if (!svm_pages->dma_addr) {
>>   			err = -ENOMEM;
>>   			goto err_free;
>> -- 
>> 2.34.1
>>

