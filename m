Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C8C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61C910E0E3;
	Thu, 13 Jul 2023 14:36:07 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D34910E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 14:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPftm8s6df88NW4N1dDYbnRBjyks4E8mPj3h7y2HJezWKDT372XqG/rd/tBwlqX+/VMq8hcfrRn97ZBcr+nJ4qjsxqlKIJNdFYM3BvV0tjuz2N/Sp8+kh74PtB9OTtP+4HNU2T9dFY46vQ8U6LTW5TpzVqkx3MuJpcbes0uPtP+ofbqCOmy4GuP6453HyXxdJWmwXj7LexCdKzh5JKdkEaWTESmGW6Td74v7Z8LsyhKzoNbdCGACv3rOOB0kfW2VmrMhZReYfIEgd0WgTHzSeL3g0Yy4LFLPL0iadvJ/uR4EQjo0KZ+b0jNtaXpI6eqe/p0VsYcB1gsB3GvUxXsdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Xt3QYsPltmP7/J/W6bVwWOXgF0kYdnv/n8aBQG20Ow=;
 b=fytGPWIY0yBWSvkeIWrkeZ7ltUUhlWqz1bBc+OtyakZirxRHHiQ8XXFJQbMTjAcyjm1POP7/pDexZWYN601/AzSwdsSaJAUsQyG1fXUiqJWN8mwm7LgZGshwgJJfeLSvFhbHOJRoUDOdnMW7C0HkXxX8TYpGj0iU8NpHC6WjvgIjmAxOxbuDZk1HNLogsokVVxxKh2ytTgQTrb+IwsnE74Y5RWK3mN4L5ttvRVZjMs7tqU4S3oDQiKV/1/ZbaOaHRTC3DouM6RDr7Td/rGL80I3K3sNxDH1uMkJN6Nez4ba0tXlRagX9+SaD7MqvDH8ItPTXT8h9gxQ+e9NE7LSIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Xt3QYsPltmP7/J/W6bVwWOXgF0kYdnv/n8aBQG20Ow=;
 b=yCGm/AaBu/O1hp5hj740mBaCcKP5m6RVE7gQc758dr3fG0ySXGfntMPFqOnY+zxdsw4opiFn6DpGYy0+5TBJYBwUKJeokWFC45MCFWKD3Vo0trtfdHRwxiWFn5G8/St4uW89vFsxChqpghu9ifkpc4oQz4+Tuxk1Pnn2DJCkGRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 14:36:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 14:36:01 +0000
Message-ID: <d096a0e9-fdd0-ba2a-682d-99cf30cabf4d@amd.com>
Date: Thu, 13 Jul 2023 16:35:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20230713131711.7-1-francois.dugast@intel.com>
 <20230713131711.7-3-francois.dugast@intel.com> <ZLADblgo7aS6fTNi@DUT025-TGLU>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZLADblgo7aS6fTNi@DUT025-TGLU>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d86a931-d726-4034-6b10-08db83ae7a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjzfJqKJ94p7har8NW+Rc171S/Or7VpTNOJf/8yo2l9Me0PRSw1opbFrz9IL42oyipc4N44xjz3Z3L6ZjazkNf+iev4P1RpoQPr396kI4RjSV5zy8N6ocI22/m2QsEGjAW+cHskCjmxrqGITB9qPmsA2pruKxjBq4ZyW05sYgteSLP9yqk9ip/P/roSuFZIcPHMQRUYVqcn0q3U0/B/auUZO+gVY8+NKv9SSt3xo+ZQbO+8bT0uUwDiI4WbG/igdvleQ41NQ0uicdoc4R4s3NevRhOfR9MBub+CLHgOpChR+UubYe+prAY9CBZDyP0xzMrCTlpvsVN3U6nqaaEESscbFOnTZDrv3tlFx+kVWWUQ7CDhjLjEd/ogZgfyjHsjPs7E+KKKHTqENed37GVMNkeENUiIeP5Crqlj0sNHC+lO4bW3txJcz1fpteCLakK6DMzMJcrsjVqv/BPe3EIiVsC8xcjd+yXbEXrF09dXxro5hSsjpl92us5pDY3dG7BHjL5yBh6FGKTpdGWH4Fs5nliF6A7+9txO/L8rId1qxxscHa6PB6+ov8Wm+nivKbUHnZeZeVNXRGK8fto4rP70IRZpmWA9MFTNWExH6TbGOBf9nIUZHQrNXERU64lnZ5P80T48biO9CaBaX/A/vsZYHnrxE21gmjTlIB1AD8rrFnO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(110136005)(41300700001)(66476007)(4326008)(66946007)(66556008)(478600001)(30864003)(31686004)(5660300002)(2906002)(8676002)(8936002)(316002)(6666004)(6486002)(6512007)(31696002)(86362001)(6506007)(186003)(83380400001)(66574015)(2616005)(36756003)(38100700002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFg4N3dXYVh3bDBqVy8wYzlYRXJUU2E0bTFEQW9xMGhhMXJTUW05OG40bTBv?=
 =?utf-8?B?ZDlRb3VvT2lLdVpwekFyY0hHeTIzZHFnRHhvU3M2QytVRnlqZlh0cWVCMUJq?=
 =?utf-8?B?NHJmR1BUeDRjZUgxR2F6RTByVm9hcnFpRlJpTXE4ZXRpNDNweHNGRFB2WmxK?=
 =?utf-8?B?SHNJUmRPOTE2bVBWbm01UzRuVVc4SjluaHQrZ1JCbnBlS3JiQlBSSU5nbDhX?=
 =?utf-8?B?ZkE2TGlua3VvVjkzSzlzQU9WdGRvUytGZFFCMG5VMUp3SkVrUkhJQmRwamtJ?=
 =?utf-8?B?RFRPcnF2RXVIZnp3a0xxNmt0aG9oaTZJRENwdWFTOUx6TTJ5YXlFNlkwbFdR?=
 =?utf-8?B?WWdud1c3dmxYUkxSMXNVWG1LVVVMaE1XOHFjOXJlbElkZDQ4MkNlb3BlTlJi?=
 =?utf-8?B?RUJ2NzB5bDJCRlNsaFZBM1MvcWdCSE03cGpqdld6Z2FHV2I3S1F1d29HYk90?=
 =?utf-8?B?VHNXS3BBdy8wUXFXdTNreDZ0Sk1GTUVET2F3OEkyU1lxUHp2M3E0YkFacWNw?=
 =?utf-8?B?ZDI5SFpnYThPNGdZWFE0T2xqMGpWcnpCc0d1SkhHbXlqMEFwd3BzaDNOWDU2?=
 =?utf-8?B?dHpENnVBemtUNkVSYzViT1pGK3dIUjZKb3locHRvZE40V1h2bmlaWXU0Ulgv?=
 =?utf-8?B?Ny9lazVzSzRvOUh2QW8vZGZYU0tqdkY1MkxCOUM3MnZHTDhCbHhETVQycy9K?=
 =?utf-8?B?a0w2aVlrbUN1cFlNL0NaNUhleGpwMXZna0pmWTBkbDVhRXRSRVYxK1QxMkVL?=
 =?utf-8?B?cytOK1lnT2F4S1BvZlU5YnVmeHVISlhQem1NMGpxeWg1ZW9LVnNmejd6aGl4?=
 =?utf-8?B?SUxEaU51Q2NMUVlWZmpaeVRTZnZLZXltRGV5QUlnYVIyQ1JSMVY4Z1FhTlZ3?=
 =?utf-8?B?dzRINy9XZG5JbXVnaGppTE9LZU1ieXo5QTZuY0VUeXo4NFR5MjgxcTlaWWI0?=
 =?utf-8?B?cVVnMURTeGlmREN3ZEtndklZMVNYR2FDcEhmT2h4L0wvV1F0aDdna0d3SVdq?=
 =?utf-8?B?azJ2aVBJWmZWdSszd0p1K2V2V25EZ0FYTmFiMnArakJYWjdicUZ4ek00UkJX?=
 =?utf-8?B?bzdMcWlPMm1teXQxTHF1bUhtbUc1M2ljcU9vdVBDdlVESXVwR1RlYVpnMXVG?=
 =?utf-8?B?dkdDVHRwbkZtVmZCOURKM1pQazJjZ1IvTmhsbFU1VHp6MjdycFczVWRpNGVY?=
 =?utf-8?B?eW9pazVwQkVQQU0vWU9VSXhFWFRCQTcwUmJBRGoyK28vUzlHWjRwb3NGSXg2?=
 =?utf-8?B?b01XTE5ZVkU4TEc0VzdWZ21pelpsQ2xjdDdUcVZ0S2YxczNzYktRUk9MUWla?=
 =?utf-8?B?K3dXeXlUNU9DRXZnV1dMUXB2TEp4V2tMdS9uREtWVG5OTGh2cWdaS3FnOHAw?=
 =?utf-8?B?Uzd4b1NLUUgwYVowMUFVdzQvTEhOZGt4bEtUQkx2L0tpcmJmSlNGVEQ3MEZK?=
 =?utf-8?B?U2kxTlJOcU9BYU0zbXVOUjNIaXhDbDV1OTYvaE1pb1hFeThCZWpFRUxWLzdX?=
 =?utf-8?B?NXdrZWpOcGg3ODl4WkJuVmNOdVZwT3M2VGNaZWxiaHBWaXUyMFdtZnNhR2xS?=
 =?utf-8?B?SG5vOEoxbTJrN280MWE1OHBYWXVwZ005Uy9YcmpmaDNRMUhXN0wwNTQ0UmpK?=
 =?utf-8?B?TC9OcE1OQXpwd3N2bWFmOG9tekFyUU9Oc0hJMnk2d1oyU2xyNzgzVnhzZG1w?=
 =?utf-8?B?aExnMzAvY2h4TFZsR2JUaldDZERqWlZ2cHJuWGVRVm1UMVBib1ArMmVHVlVQ?=
 =?utf-8?B?V0hUays3bWZndU5BWTRwVCswL0NuQnBJL3lXbDhBdmJmbE8rVEhLcUdQYTBo?=
 =?utf-8?B?UisyK2pPSlZOdWd6UHVIaVNLYWVLTDExdVRSMXZURXNKZXlDTS9VUklIUStV?=
 =?utf-8?B?c3ZTVU1ITHdVMVo0U01pUFA0QUxhS1NqSlN0Zyt4eVdReURZM2dqbzNIL1cz?=
 =?utf-8?B?ZmxpL0NQUHdHNTZVMnpsdjRjeFIwenlRTExHSDlCaDhnU2hmb2IwOTNwUVdy?=
 =?utf-8?B?WXNHNFNtdXJ4aFNMVUF1S2ZyM3JTKzd1NUlDWU5uWXV0TXFhZlJoZzFrbmVx?=
 =?utf-8?B?SkdTTzR6UGxzYU5SUEV3RngzbWp4cmNja1NMeFBaTlRoQmNFc2dlTFlJczE5?=
 =?utf-8?B?ZjdNTnJOSVFOM3YrcnBEdFBwMXFaVmM3b1NEWlNqbEtmQ04vME1WZjl1Q0cz?=
 =?utf-8?Q?20iYniuzf4NS+ApZYCG3r6kMYQHtOnjd1cKsCfYyfKCr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d86a931-d726-4034-6b10-08db83ae7a94
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:36:01.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjqdKWMH1EVGOskUBiyFGGx6nHKXZzvMYfFA5lJdkIZUFkfQP02pItneN0YPX+H4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: switch to using drm_exec
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Am 13.07.23 um 16:00 schrieb Matthew Brost:
> On Thu, Jul 13, 2023 at 01:17:11PM +0000, Francois Dugast wrote:
>> Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
>>
>> v2:
>> - Call dma-resv locking functions directly in xe_bo_lock and
>>    xe_vm_lock functions (Matthew Brost)
>> - Switch to execution context for GEM buffers v7 (Christian König)
>> - Use DRM_EXEC_INTERRUPTIBLE_WAIT
>>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Kconfig           |   1 +
>>   drivers/gpu/drm/xe/xe_bo.c           |  29 +++-
>>   drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
>>   drivers/gpu/drm/xe/xe_exec.c         |  30 +---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +-----
>>   drivers/gpu/drm/xe/xe_vm.c           | 246 +++++++++++++--------------
>>   drivers/gpu/drm/xe/xe_vm.h           |  32 ++--
>>   7 files changed, 168 insertions(+), 226 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index d44794f99338..b739faa401d3 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_XE
>>   	select SHMEM
>>   	select TMPFS
>>   	select DRM_BUDDY
>> +	select DRM_EXEC
>>   	select DRM_KMS_HELPER
>>   	select DRM_PANEL
>>   	select DRM_SUBALLOC_HELPER
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6353afa8d846..aafe69ed4320 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1806,17 +1806,32 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>   int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>>   	       int num_resv, bool intr)
>>   {
>> -	struct ttm_validate_buffer tv_bo;
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> +	struct dma_resv *obj;
>> +	int err;
>>   
>>   	XE_BUG_ON(!ww);
>>   
>> -	tv_bo.num_shared = num_resv;
>> -	tv_bo.bo = &bo->ttm;;
>> -	list_add_tail(&tv_bo.head, &objs);
>> +	obj = bo->ttm.base.resv;
>> +	ww_acquire_init(ww, &reservation_ww_class);
>> +
>> +	if (intr)
>> +		err = dma_resv_lock_interruptible(obj, ww);
>> +	else
>> +		err = dma_resv_lock(obj, ww);
>> +
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	num_resv = max(num_resv, 1);
> Why? If the user ask to reserve 0 fences this will reserve 1.

Reserving 0 fences is illegal. The dma_resv object will complain about 
that in debug builds IIRC.

Christian.

>
>> +	err = dma_resv_reserve_fences(obj, num_resv);
>> +	if (err)
>> +		goto out_err;
>>   
>> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
>> +	return 0;
>> +
>> +out_err:
>> +	dma_resv_unlock(obj);
>> +	return err;
>>   }
>>   
>>   void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index f6ee920303af..bc67263c6713 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -11,7 +11,6 @@
>>   #include <drm/drm_mm.h>
>>   #include <drm/ttm/ttm_bo.h>
>>   #include <drm/ttm/ttm_device.h>
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   
>>   struct xe_device;
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index ba13d20ed348..32a6e16ec177 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_exec.h"
>>   
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_exec.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/xe_drm.h>
>>   #include <linux/delay.h>
>> @@ -95,23 +96,18 @@
>>   
>>   #define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
>>   
>> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>> -			 struct ttm_validate_buffer tv_onstack[],
>> -			 struct ttm_validate_buffer **tv,
>> -			 struct list_head *objs)
>> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>>   {
>>   	struct xe_vm *vm = e->vm;
>>   	struct xe_vma *vma;
>> -	LIST_HEAD(dups);
>>   	ktime_t end = 0;
>>   	int err = 0;
>>   
>> -	*tv = NULL;
>>   	if (xe_vm_no_dma_fences(e->vm))
>>   		return 0;
>>   
>>   retry:
>> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
>> +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
>>   	if (err)
>>   		return err;
>>   
>> @@ -128,8 +124,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>>   
>>   		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>>   		if (err) {
>> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
>> -			*tv = NULL;
>> +			xe_vm_unlock_dma_resv(vm, exec);
>>   			break;
>>   		}
>>   	}
>> @@ -153,14 +148,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>>   	return err;
>>   }
>>   
>> -static void xe_exec_end(struct xe_engine *e,
>> -			struct ttm_validate_buffer *tv_onstack,
>> -			struct ttm_validate_buffer *tv,
>> -			struct ww_acquire_ctx *ww,
>> -			struct list_head *objs)
>> +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
>>   {
>>   	if (!xe_vm_no_dma_fences(e->vm))
>> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
>> +		xe_vm_unlock_dma_resv(e->vm, exec);
>>   }
>>   
>>   int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> @@ -173,14 +164,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	struct xe_engine *engine;
>>   	struct xe_sync_entry *syncs = NULL;
>>   	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>> -	struct ttm_validate_buffer *tv = NULL;
>>   	u32 i, num_syncs = 0;
>>   	struct xe_sched_job *job;
>>   	struct dma_fence *rebind_fence;
>>   	struct xe_vm *vm;
>> -	struct ww_acquire_ctx ww;
>> -	struct list_head objs;
>> +	struct drm_exec exec;
>>   	bool write_locked;
>>   	int err = 0;
>>   
>> @@ -293,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   			goto err_unlock_list;
>>   	}
>>   
>> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
>> +	err = xe_exec_begin(engine, &exec);
>>   	if (err)
>>   		goto err_unlock_list;
>>   
>> @@ -412,7 +400,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	if (err)
>>   		xe_sched_job_put(job);
>>   err_engine_end:
>> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
>> +	xe_exec_end(engine, &exec);
>>   err_unlock_list:
>>   	if (write_locked)
>>   		up_write(&vm->lock);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 125e4744fa38..94f59c29ba9b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -8,8 +8,8 @@
>>   #include <linux/bitfield.h>
>>   #include <linux/circ_buf.h>
>>   
>> +#include <drm/drm_exec.h>
>>   #include <drm/drm_managed.h>
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   
>>   #include "xe_bo.h"
>>   #include "xe_gt.h"
>> @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>>   	return true;
>>   }
>>   
>> -static bool only_needs_bo_lock(struct xe_bo *bo)
>> -{
>> -	return bo && bo->vm;
>> -}
>> -
>>   static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>>   {
>>   	struct xe_vma *vma = NULL;
>> @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   	struct xe_vm *vm;
>>   	struct xe_vma *vma = NULL;
>>   	struct xe_bo *bo;
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>> -	struct ww_acquire_ctx ww;
>> +	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	bool write_locked;
>>   	int ret = 0;
>> @@ -171,20 +163,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   
>>   	/* Lock VM and BOs dma-resv */
>>   	bo = xe_vma_bo(vma);
>> -	if (only_needs_bo_lock(bo)) {
>> -		/* This path ensures the BO's LRU is updated */
>> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
>> -	} else {
>> -		tv_vm.num_shared = xe->info.tile_count;
>> -		tv_vm.bo = xe_vm_ttm_bo(vm);
>> -		list_add(&tv_vm.head, &objs);
>> -		if (bo) {
>> -			tv_bo.bo = &bo->ttm;
>> -			tv_bo.num_shared = xe->info.tile_count;
>> -			list_add(&tv_bo.head, &objs);
>> -		}
>> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>> -	}
>> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>>   	if (ret)
>>   		goto unlock_vm;
>>   
>> @@ -227,10 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
>>   
>>   unlock_dma_resv:
>> -	if (only_needs_bo_lock(bo))
>> -		xe_bo_unlock(bo, &ww);
>> -	else
>> -		ttm_eu_backoff_reservation(&ww, &objs);
>> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>>   unlock_vm:
>>   	if (!ret)
>>   		vm->usm.last_fault_vma = vma;
>> @@ -498,10 +474,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>   	struct xe_vm *vm;
>>   	struct xe_vma *vma;
>>   	struct xe_bo *bo;
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>> -	struct ww_acquire_ctx ww;
>> +	struct drm_exec exec;
>>   	int ret = 0;
>>   
>>   	/* We only support ACC_TRIGGER at the moment */
>> @@ -534,28 +507,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>   
>>   	/* Lock VM and BOs dma-resv */
>>   	bo = xe_vma_bo(vma);
>> -	if (only_needs_bo_lock(bo)) {
>> -		/* This path ensures the BO's LRU is updated */
>> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
>> -	} else {
>> -		tv_vm.num_shared = xe->info.tile_count;
>> -		tv_vm.bo = xe_vm_ttm_bo(vm);
>> -		list_add(&tv_vm.head, &objs);
>> -		tv_bo.bo = &bo->ttm;
>> -		tv_bo.num_shared = xe->info.tile_count;
>> -		list_add(&tv_bo.head, &objs);
>> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>> -	}
>> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>>   	if (ret)
>>   		goto unlock_vm;
>>   
>>   	/* Migrate to VRAM, move should invalidate the VMA first */
>>   	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>>   
>> -	if (only_needs_bo_lock(bo))
>> -		xe_bo_unlock(bo, &ww);
>> -	else
>> -		ttm_eu_backoff_reservation(&ww, &objs);
>> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>>   unlock_vm:
>>   	up_read(&vm->lock);
>>   	xe_vm_put(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 6c216350084b..c89b10d5feb5 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -7,8 +7,8 @@
>>   
>>   #include <linux/dma-fence-array.h>
>>   
>> +#include <drm/drm_exec.h>
>>   #include <drm/drm_print.h>
>> -#include <drm/ttm/ttm_execbuf_util.h>
>>   #include <drm/ttm/ttm_tt.h>
>>   #include <drm/xe_drm.h>
>>   #include <linux/delay.h>
>> @@ -321,11 +321,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>>   
>>   int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>   {
>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>> -	struct ttm_validate_buffer *tv;
>> -	struct ww_acquire_ctx ww;
>> -	struct list_head objs;
>>   	struct dma_fence *pfence;
>> +	struct drm_exec exec;
>>   	int err;
>>   	bool wait;
>>   
>> @@ -333,7 +330,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>   
>>   	down_write(&vm->lock);
>>   
>> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
>> +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
>>   	if (err)
>>   		goto out_unlock_outer;
>>   
>> @@ -367,7 +364,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>   	up_read(&vm->userptr.notifier_lock);
>>   
>>   out_unlock:
>> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>> +	xe_vm_unlock_dma_resv(vm, &exec);
>>   out_unlock_outer:
>>   	up_write(&vm->lock);
>>   
>> @@ -397,68 +394,43 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>>    * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>>    * objects of the vm's external buffer objects.
>>    * @vm: The vm.
>> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
>> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
>> - * ttm_validate_buffers used for locking.
>> - * @tv: Pointer to a pointer that on output contains the actual storage used.
>> - * @objs: List head for the buffer objects locked.
>> + * @exec: Pointer to a struct drm_exec execution context.
>>    * @intr: Whether to lock interruptible.
>>    * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>>    *
>>    * Locks the vm dma-resv objects and all the dma-resv objects of the
>> - * buffer objects on the vm external object list. The TTM utilities require
>> - * a list of struct ttm_validate_buffers pointing to the actual buffer
>> - * objects to lock. Storage for those struct ttm_validate_buffers should
>> - * be provided in @tv_onstack, and is typically reserved on the stack
>> - * of the caller. If the size of @tv_onstack isn't sufficient, then
>> - * storage will be allocated internally using kvmalloc().
>> + * buffer objects on the vm external object list using helpers provided
>> + * by drm_exec.
>>    *
>>    * The function performs deadlock handling internally, and after a
>>    * successful return the ww locking transaction should be considered
>>    * sealed.
>>    *
>> - * Return: 0 on success, Negative error code on error. In particular if
>> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
>> - * of error, any locking performed has been reverted.
>> + * Return: 0 on success, Negative error code on error.
>>    */
>> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>> -			struct ttm_validate_buffer *tv_onstack,
>> -			struct ttm_validate_buffer **tv,
>> -			struct list_head *objs,
>> -			bool intr,
>> -			unsigned int num_shared)
>> -{
>> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
>> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>> +			bool intr, unsigned int num_shared)
>> +{
>>   	struct xe_vma *vma, *next;
>> -	LIST_HEAD(dups);
>> +	struct drm_gem_object *obj;
>>   	int err;
>>   
>>   	lockdep_assert_held(&vm->lock);
>>   
>> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
>> -		tv_vm = tv_onstack;
>> -	} else {
>> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
>> -				       GFP_KERNEL);
>> -		if (!tv_vm)
>> -			return -ENOMEM;
>> +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
>> +	drm_exec_until_all_locked(exec) {
>> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
>> +		drm_exec_retry_on_contention(exec);
>> +		if (unlikely(err) && err != -EALREADY)
>> +			goto out_err;
>> +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
>> +			obj = &xe_vma_bo(vma)->ttm.base;
>> +			err = drm_exec_prepare_obj(exec, obj, num_shared);
>> +			drm_exec_retry_on_contention(exec);
>> +			if (unlikely(err) && err != -EALREADY)
>> +				goto out_err;
>> +		}
>>   	}
>> -	tv_bo = tv_vm + 1;
>> -
>> -	INIT_LIST_HEAD(objs);
>> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
>> -		tv_bo->num_shared = num_shared;
>> -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
>> -
>> -		list_add_tail(&tv_bo->head, objs);
>> -		tv_bo++;
>> -	}
>> -	tv_vm->num_shared = num_shared;
>> -	tv_vm->bo = xe_vm_ttm_bo(vm);
>> -	list_add_tail(&tv_vm->head, objs);
>> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
>> -	if (err)
>> -		goto out_err;
>>   
>>   	spin_lock(&vm->notifier.list_lock);
>>   	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
>> @@ -470,14 +442,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>   			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>>   	}
>>   	spin_unlock(&vm->notifier.list_lock);
>> -
>> -	*tv = tv_vm;
>>   	return 0;
>>   
>>   out_err:
>> -	if (tv_vm != tv_onstack)
>> -		kvfree(tv_vm);
>> -
>> +	drm_exec_fini(exec);
>>   	return err;
>>   }
>>   
>> @@ -485,20 +453,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>    * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>>    * xe_vm_lock_dma_resv()
>>    * @vm: The vm.
>> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
>> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
>> - * @ww: The ww_acquire_context used for locking.
>> - * @objs: The list returned from xe_vm_lock_dma_resv().
>> + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
>>    *
>>    * Unlocks the reservation objects and frees any memory allocated by
>>    * xe_vm_lock_dma_resv().
>>    */
>> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>> -			   struct ttm_validate_buffer *tv_onstack,
>> -			   struct ttm_validate_buffer *tv,
>> -			   struct ww_acquire_ctx *ww,
>> -			   struct list_head *objs)
>> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
>>   {
>> +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
>> +	unsigned long index;
>> +
>>   	/*
>>   	 * Nothing should've been able to enter the list while we were locked,
>>   	 * since we've held the dma-resvs of all the vm's external objects,
>> @@ -507,9 +471,13 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>   	 */
>>   	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
>>   
>> -	ttm_eu_backoff_reservation(ww, objs);
>> -	if (tv && tv != tv_onstack)
>> -		kvfree(tv);
>> +	drm_exec_for_each_locked_object(exec, index, obj) {
>> +		struct xe_bo *bo = gem_to_xe_bo(obj);
>> +
>> +		if (obj != skip)
>> +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>> +	}
>> +	drm_exec_fini(exec);
>>   }
>>   
>>   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>> @@ -536,10 +504,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   {
>>   	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>>   	struct xe_vma *vma;
>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>> -	struct ttm_validate_buffer *tv;
>> -	struct ww_acquire_ctx ww;
>> -	struct list_head objs;
>> +	struct drm_exec exec;
>>   	struct dma_fence *rebind_fence;
>>   	unsigned int fence_count = 0;
>>   	LIST_HEAD(preempt_fences);
>> @@ -582,8 +547,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   			goto out_unlock_outer;
>>   	}
>>   
>> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
>> -				  false, vm->preempt.num_engines);
>> +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
>>   	if (err)
>>   		goto out_unlock_outer;
>>   
>> @@ -662,7 +626,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   	up_read(&vm->userptr.notifier_lock);
>>   
>>   out_unlock:
>> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>> +	xe_vm_unlock_dma_resv(vm, &exec);
>>   out_unlock_outer:
>>   	if (err == -EAGAIN) {
>>   		trace_xe_vm_rebind_worker_retry(vm);
>> @@ -1105,27 +1069,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   
>>   static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>>   {
>> -	struct ttm_validate_buffer tv[2];
>> -	struct ww_acquire_ctx ww;
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> +	struct drm_exec exec;
>>   	int err;
>>   
>> -	memset(tv, 0, sizeof(tv));
>> -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
>> -	list_add(&tv[0].head, &objs);
>> -
>> -	if (bo) {
>> -		tv[1].bo = &xe_bo_get(bo)->ttm;
>> -		list_add(&tv[1].head, &objs);
>> -	}
>> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>> +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
>>   	XE_WARN_ON(err);
>>   
>>   	xe_vma_destroy(vma, NULL);
>>   
>> -	ttm_eu_backoff_reservation(&ww, &objs);
>> +	xe_vm_bo_unlock(vm, bo, &exec, false);
>>   	if (bo)
>>   		xe_bo_put(bo);
>>   }
>> @@ -2125,21 +2079,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   #define VM_BIND_OP(op)	(op & 0xffff)
>>   
>> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>> -{
>> -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
>> -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
>> -
>> -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
>> -	return &vm->pt_root[idx]->bo->ttm;
>> -}
>> -
>> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
>> -{
>> -	tv->num_shared = 1;
>> -	tv->bo = xe_vm_ttm_bo(vm);
>> -}
>> -
>>   static void vm_set_async_error(struct xe_vm *vm, int err)
>>   {
>>   	lockdep_assert_held(&vm->lock);
>> @@ -2577,17 +2516,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>>   static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>   			       struct xe_vma_op *op)
>>   {
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>> -	struct ww_acquire_ctx ww;
>>   	struct xe_bo *vbo;
>> +	struct drm_exec exec;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> -	xe_vm_tv_populate(vm, &tv_vm);
>> -	list_add_tail(&tv_vm.head, &objs);
>>   	vbo = xe_vma_bo(vma);
>>   	if (vbo) {
>>   		/*
>> @@ -2596,16 +2530,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>   		 * take a reference here.
>>   		 */
>>   		xe_bo_get(vbo);
>> -
>> -		if (!vbo->vm) {
>> -			tv_bo.bo = &vbo->ttm;
>> -			tv_bo.num_shared = 1;
>> -			list_add(&tv_bo.head, &objs);
>> -		}
>>   	}
>>   
>>   again:
>> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
>> +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
>>   	if (err) {
>>   		xe_bo_put(vbo);
>>   		return err;
>> @@ -2687,7 +2615,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>   		XE_BUG_ON("NOT POSSIBLE");
>>   	}
>>   
>> -	ttm_eu_backoff_reservation(&ww, &objs);
>> +	xe_vm_bo_unlock(vm, vbo, &exec, false);
>>   	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>>   		lockdep_assert_held_write(&vm->lock);
>>   		err = xe_vma_userptr_pin_pages(vma);
>> @@ -3338,24 +3266,47 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	return err == -ENODATA ? 0 : err;
>>   }
>>   
>> +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
>> +{
>> +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
>> +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
>> +
>> +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
>> +	return &vm->pt_root[idx]->bo->ttm.base;
>> +}
>> +
>>   /*
>> - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
>> - * directly to optimize. Also this likely should be an inline function.
>> + * XXX: This likely should be an inline function.
>>    */
>>   int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>   	       int num_resv, bool intr)
>>   {
>> -	struct ttm_validate_buffer tv_vm;
>> -	LIST_HEAD(objs);
>> -	LIST_HEAD(dups);
>> +	struct dma_resv *obj;
>> +	int err;
>>   
>>   	XE_BUG_ON(!ww);
>>   
>> -	tv_vm.num_shared = num_resv;
>> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
>> -	list_add_tail(&tv_vm.head, &objs);
>> +	obj = xe_vm_gem(vm)->resv;
>> +	ww_acquire_init(ww, &reservation_ww_class);
>> +
>> +	if (intr)
>> +		err = dma_resv_lock_interruptible(obj, ww);
>> +	else
>> +		err = dma_resv_lock(obj, ww);
>> +
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	num_resv = max(num_resv, 1);
> Same question as above here.
>
> Matt
>
>> +	err = dma_resv_reserve_fences(obj, num_resv);
>> +	if (err)
>> +		goto out_err;
>>   
>> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
>> +	return 0;
>> +
>> +out_err:
>> +	dma_resv_unlock(&vm->resv);
>> +	return err;
>>   }
>>   
>>   void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>> @@ -3364,6 +3315,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>>   	ww_acquire_fini(ww);
>>   }
>>   
>> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>> +		  int num_resv, bool intr)
>> +{
>> +	int err;
>> +
>> +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
>> +	drm_exec_until_all_locked(exec) {
>> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
>> +					   num_resv);
>> +		drm_exec_retry_on_contention(exec);
>> +		if (err && err != -EALREADY)
>> +			goto out_err;
>> +
>> +		if (bo && !bo->vm) {
>> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
>> +						   num_resv);
>> +			drm_exec_retry_on_contention(exec);
>> +			if (err && err != -EALREADY)
>> +				goto out_err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_err:
>> +	drm_exec_fini(exec);
>> +	return err;
>> +}
>> +
>> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>> +		     bool lru_update)
>> +{
>> +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
>> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>> +	drm_exec_fini(exec);
>> +}
>> +
>>   /**
>>    * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>>    * @vma: VMA to invalidate
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index eaf11ac8ff51..62a062bd5078 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -12,6 +12,7 @@
>>   #include "xe_vm_types.h"
>>   
>>   struct drm_device;
>> +struct drm_exec;
>>   struct drm_printer;
>>   struct drm_file;
>>   
>> @@ -39,11 +40,17 @@ static inline void xe_vm_put(struct xe_vm *vm)
>>   	kref_put(&vm->refcount, xe_vm_free);
>>   }
>>   
>> +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm);
>> +
>>   int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>   	       int num_resv, bool intr);
>> -
>>   void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
>>   
>> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>> +		  int num_resv, bool intr);
>> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>> +		     bool lru_update);
>> +
>>   static inline bool xe_vm_is_closed(struct xe_vm *vm)
>>   {
>>   	/* Only guaranteed not to change when vm->lock is held */
>> @@ -183,8 +190,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
>>   
>>   extern struct ttm_device_funcs xe_ttm_funcs;
>>   
>> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>> -
>>   /**
>>    * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
>>    * vms.
>> @@ -212,23 +217,10 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>   	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>>   }
>>   
>> -/*
>> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
>> - */
>> -#define XE_ONSTACK_TV 20
>> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>> -			struct ttm_validate_buffer *tv_onstack,
>> -			struct ttm_validate_buffer **tv,
>> -			struct list_head *objs,
>> -			bool intr,
>> -			unsigned int num_shared);
>> -
>> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>> -			   struct ttm_validate_buffer *tv_onstack,
>> -			   struct ttm_validate_buffer *tv,
>> -			   struct ww_acquire_ctx *ww,
>> -			   struct list_head *objs);
>> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>> +			bool intr, unsigned int num_shared);
>> +
>> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
>>   
>>   void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>>   			     enum dma_resv_usage usage);
>> -- 
>> 2.34.1
>>

