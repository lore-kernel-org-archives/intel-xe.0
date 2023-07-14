Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2515EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 06:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2010E7CB;
	Fri, 14 Jul 2023 06:45:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1CB10E7C8
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 06:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGlydbojj7jo2Hx/KtsNp5Xys9vD6ovnJxPfif1Q8VD5RAAXGSXd8TkVIyB+DMWTuqxHR/RvwGffPQxTSuYD9lE3uDG20PMRTeAICs3ISggMPTJmhJMmiXL/02ijWqFxhH3lOl3KcF5pz4QCpx9fVTR8sNi4Q6IoNgb8LKqC949HvbIqZ1awqf9pKiMMR5D8zt/nHxnZEc1gx164C2Se0eO1nhj9+z/8i58UvllXIxhtO1MDG6c57LbA0hPdajsHHy9/gpd+6VvEroDoxq3epQlDsEkiYMmXJ2o/DxH6GK6Y4s47VG7mIJL8hXgZ+cJs7Z3aaTkuZynXIwfviIJkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FUfGYMCsFdRJ+vC66UJkJM6LNAMkGAJ68TjTst+Nbs=;
 b=EUyKyKNVkQoEi8mrElt0O/bsir72BKmpM476xFYWMvTcddOxoXQ8IaNxLFomjM4BXOApLCwd9Mj/jTFxVsFdFNrdk88DxiQvW1fvocyEqCbgNQy/TvkzadqBZnZsPdutujAeo8sEVFoRSZTa8uF+VQIk8D8U9fi5rYBTmVV9dUp8j3qkFEpMAVVhZjLTc9PUqRwEFDkxlYD1nX1Lf0devbK0BEUFdi4l5oGBEOkuEdCiWeuZHoh3b+cfmNGTjaS7rmxYjUINtLRR3qXWQ3d8UFj2X7okO1dHOT1qnppLWEVmNJ0VliSpwdeHXqOeeCO7ZHSbq/g4YCWzm4GA5iyjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FUfGYMCsFdRJ+vC66UJkJM6LNAMkGAJ68TjTst+Nbs=;
 b=PU3i35dWCwrOjJE7TaT/ND4pqkJLvLpgnKXNVabyBgjepaLhHVXTjUxPneRZz4Ddg1UGeQ8MeIaALX7tR05DwFqXcRcRW9CsSVCAOdm38PDMTRhCRbzUb7JRWXn/frZjAm8cSENFOmqtZaMZ/Sc1uJZwBjefGuY+3bRTp2bwl1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 06:45:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 06:45:34 +0000
Message-ID: <b55eecd6-647d-c963-3173-70395f905bf8@amd.com>
Date: Fri, 14 Jul 2023 08:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230713131711.7-1-francois.dugast@intel.com>
 <20230713131711.7-3-francois.dugast@intel.com> <ZLADblgo7aS6fTNi@DUT025-TGLU>
 <d096a0e9-fdd0-ba2a-682d-99cf30cabf4d@amd.com> <ZLA+rYKwFuo9RiJS@DUT025-TGLU>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZLA+rYKwFuo9RiJS@DUT025-TGLU>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: aed05b1f-9379-4369-d30b-08db8435ec73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n0U18547mPbVKNwPoASJPbHWtdJry5FNJwPoz/Cs/mzJQ+2LmeL02GOZvYugoOinnjw4PRpIZwlY75uKgoiwaS2j9e1kPq0jUsq0HPLVA40cafI0kAHDp5sYWapwt5o/H45azA5bOlFoEDxnZ5BVFFUtO6ZBKRtST/cGrkoVk0OwIQ1gJRksV8M97j+nUWpyjIkLJ9kRFzsrOkbT10PAbNATyudtMvCgxMJQ6ZqQhnYAaXIKhcZE20t1PshFNtq7f16RvL42J5GJneCzW6vrzl/QGrqwrM5+0hbQfqKnzeUt2wvT/YSCdHLO8+6yLDq1hTAFRIgb6uprgN9qP7sxk4ASVuGkqlKzbH5JHHHGXI+pbCC6JAZCSQ1JR3s9ee8PXEm5ZNDks7+xm/qLyagt4+Ikd6RvVYNhI9dwRu3yzYrQGLWtHcOgSf11ZTiTpptoLKs04PnoZM54R62g01m9wOF0jC4wgTEOZ4wrmht7vCSoapvPkV64OSoyE9KmdiEqWDd82X9yVdSlIBRpUwyS9ZRlwt8z5EPlKMy+Q/bKe2JTz7KU9PhX4OEeqcPGMVni8YF/FhgcO4rCc8ycxW0Z4IaauylDfleMo8m8cTtOka9XFYJTgalWc33MaosFn9+owmHzglCdzy0uydJ7OUIrz9coqtQRto4q+/+hVHQ0y8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(31686004)(2906002)(41300700001)(478600001)(6486002)(6666004)(30864003)(8676002)(8936002)(36756003)(66556008)(66946007)(4326008)(6916009)(66476007)(316002)(6512007)(66574015)(83380400001)(38100700002)(31696002)(5660300002)(6506007)(186003)(2616005)(86362001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFiZVZuSERtWDBqZzQydWs1S1lrKzdpTjhiR2swNmZ2UlJPbmViVmVsYkhC?=
 =?utf-8?B?VkV1dHliSlNtUDg1YjZOSzFKMGpveTlGSjZPNFp3Z2syN1lKMHZORVhBOFNv?=
 =?utf-8?B?TDhTODZHcXVYaWx5am9idzNMall1WFBDbmZ6WFVTUncwRnFFS1ozSFh6VTJo?=
 =?utf-8?B?bG5vS2J5QnY3aGMyL29WSGl1QytnZlcxV0x3Q2RmSTdENTdvTFZuV0JRWUFZ?=
 =?utf-8?B?dHNRYzhDeHBlVE5CM1NQNXNLUWdvWUxMdjBRUFBWdDM4bDEyNTZKREZMRUtT?=
 =?utf-8?B?eDdOSnhJSTdkVDluWnIyam41WkNJbUNLYjVnNjl1Q0xHREk5d0JIQW5yTjMw?=
 =?utf-8?B?eUFYd2tSaFRsWE5GZkswK3RyUjFJdXFTKzJ2VjEveE1ldThvYmN0Q0sxQURr?=
 =?utf-8?B?SENFNUpNNlNGeGFDRm9PaTZlaTJHNGJKZmorS2Q2aGNhakY5R2FPMjRmQk81?=
 =?utf-8?B?RkZhSmdTelBmVGhlVlJpUGprOHVOOHdGaUk4eElYZFRWaVpac0dPZzRnbUdS?=
 =?utf-8?B?YVdRcndCUzF0Um56UHRlT0E5VHRJWHJoMEp1TTdpZjdxTWdyZE9VM29xdjNp?=
 =?utf-8?B?YnBISkdsK00wUjlFYXdFK1YxMkhXZi9CTDlJNG9vb1pFNlNWaGNuQTFXNnJp?=
 =?utf-8?B?U1BWcFN3ZUJjTlVmWkFIajNiUndZaGdSQkEzMkQyTWFYMmV1RktPbXNFYzRi?=
 =?utf-8?B?ZWVwU2xxTFJJNFFzTG9NM1Btc1dBNDAwOWVWVnNOTmtHNGN2VklZVEZ0QmhD?=
 =?utf-8?B?YVVjUDEzbmhHV2s5OGdZZnlJWnFuQnNiQi83TStpSktWN09EdHJuUWtFSCtw?=
 =?utf-8?B?OGZPd0Nuem9NYnF1ZFZ5aDBuZmMzVVFralAwc1pRR3RFUEd5RFlNYW5DNno0?=
 =?utf-8?B?VmxpTCtPSTZJNWN5STMwVzU3TWFBZnBhMWNDODZVZ3YwZmVmbzBGNVNRVzRW?=
 =?utf-8?B?b2RVZEdMU1lJQVk0L0VwNUxRWkNSdERxNkQxaTQyd3VTa1ppK1dOeXZlWDl3?=
 =?utf-8?B?Mk1ETnRQNFpvWVI2ZWgyKzR1RGwrMTBtZWVkMmlXaTJhUEtQb05rU1hCN2E5?=
 =?utf-8?B?R1VRWnZFY1hvem5pczczb2ZXRnlpNkVvQzkxNER4UVZlSTF0NDFtMlMxb2Y1?=
 =?utf-8?B?VWhmemh6a0tMK1BzUzExRndQTkh6SXJaRFdEY3VjMFVCdC9mUGd4WHA1RE1k?=
 =?utf-8?B?bzhzVjg2K0Mzc0tFaHNoTXcvTU9nYmI0eGtpckdYL1daK29CR1lHUkxETmxv?=
 =?utf-8?B?N2pnNHZtd2cwQTlhT25LSEZuTVV0Uk9VTG04QThCRnJNZm50ejI0bXk0bUYv?=
 =?utf-8?B?MlBrelppbjJQNityREtRNkIyVU9heVRVNUlPRHJTd29nMEJzUERULzZtNXFS?=
 =?utf-8?B?MEFjRGtxZE5HVEo5M1pTbXplWGhiMUdiZldVa2xUa3UrSURiMk5wRWdqME5w?=
 =?utf-8?B?U3FSdjIyMFBNUzFyN2xCMm5ua1FVYy9BYmwxMFI4ZEtXb0tSaStsY0tCZmto?=
 =?utf-8?B?cWdZSXB1YlQ0cTZlNzZERTkyWURwOExucit0Yit2SmZadnJCSUJiMVh6QjR4?=
 =?utf-8?B?bFdzOVlIT2ZLV1Z4TmxWY1FucXBxM0dDbnhzcE9iUU0xWlIzS0pBWnVZTWMv?=
 =?utf-8?B?MjgxS3NibUw3cFBzWnR1MW1JQTFEbmIvcERNdFdXZThJVHZ3VGJOVnFJdi9Y?=
 =?utf-8?B?VlMyR0lidnFxWWVjRFRYS1VxZFVyZWRkNTNENkVaZlcvdFZYSmhwTG5tNnU3?=
 =?utf-8?B?ejhNVTNQU2lvUS81MmQyNGhwMjljMDRHWkwzbHZSUk1zb2VZM1cwNFZhcHh3?=
 =?utf-8?B?eUpjTUMxOFFDRDRodXNCUTc1a1VEQk54bXdpZkZmMDFBbjRGZlRIWXpWNGZq?=
 =?utf-8?B?OWxYZEZSUGpkL3cxVzBqVUEvZitLcnRVeGc2dEFDUmhzS1B1QUQ5dnBqTC92?=
 =?utf-8?B?OVpQeHRtc01RTUVJS3E5Wmh4RFVsUXEwQkU1NXJoZTM3U2lWd0dadmNEekxL?=
 =?utf-8?B?RlVvU1JoT1J3N0lUem9TWkJuUGhkMm5ONEtyZlVGdW9Bdnp0ejVIVEpyekxs?=
 =?utf-8?B?ZFN1ZUhwVERRaVpWbjVaZ2FvY3pJMHZ6S1ltOVBpOUFETUVyeEZmTm8ybER2?=
 =?utf-8?B?bmFCUGp3ZEE0b2ZmcW9vVllXczJWMTZ4VHJBYWVMK1AvWC9acmVBSXRqdVl5?=
 =?utf-8?Q?1lg00iX0MmqqMAb3ZqFdLjlYs9q55kvrGFIB9n5bLLC2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed05b1f-9379-4369-d30b-08db8435ec73
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 06:45:34.2421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzmVmZ67Aj+f327Qkp3jiYe3Uz4VFfw6N/b0QQmMGxfXUjGNjlLfnEIi53XyRJkE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Am 13.07.23 um 20:13 schrieb Matthew Brost:
> On Thu, Jul 13, 2023 at 04:35:57PM +0200, Christian König wrote:
>> Am 13.07.23 um 16:00 schrieb Matthew Brost:
>>> On Thu, Jul 13, 2023 at 01:17:11PM +0000, Francois Dugast wrote:
>>>> Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
>>>>
>>>> v2:
>>>> - Call dma-resv locking functions directly in xe_bo_lock and
>>>>     xe_vm_lock functions (Matthew Brost)
>>>> - Switch to execution context for GEM buffers v7 (Christian König)
>>>> - Use DRM_EXEC_INTERRUPTIBLE_WAIT
>>>>
>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/Kconfig           |   1 +
>>>>    drivers/gpu/drm/xe/xe_bo.c           |  29 +++-
>>>>    drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
>>>>    drivers/gpu/drm/xe/xe_exec.c         |  30 +---
>>>>    drivers/gpu/drm/xe/xe_gt_pagefault.c |  55 +-----
>>>>    drivers/gpu/drm/xe/xe_vm.c           | 246 +++++++++++++--------------
>>>>    drivers/gpu/drm/xe/xe_vm.h           |  32 ++--
>>>>    7 files changed, 168 insertions(+), 226 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>>> index d44794f99338..b739faa401d3 100644
>>>> --- a/drivers/gpu/drm/xe/Kconfig
>>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>>> @@ -8,6 +8,7 @@ config DRM_XE
>>>>    	select SHMEM
>>>>    	select TMPFS
>>>>    	select DRM_BUDDY
>>>> +	select DRM_EXEC
>>>>    	select DRM_KMS_HELPER
>>>>    	select DRM_PANEL
>>>>    	select DRM_SUBALLOC_HELPER
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 6353afa8d846..aafe69ed4320 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -1806,17 +1806,32 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>>>>    int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>>>>    	       int num_resv, bool intr)
>>>>    {
>>>> -	struct ttm_validate_buffer tv_bo;
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> +	struct dma_resv *obj;
>>>> +	int err;
>>>>    	XE_BUG_ON(!ww);
>>>> -	tv_bo.num_shared = num_resv;
>>>> -	tv_bo.bo = &bo->ttm;;
>>>> -	list_add_tail(&tv_bo.head, &objs);
>>>> +	obj = bo->ttm.base.resv;
>>>> +	ww_acquire_init(ww, &reservation_ww_class);
>>>> +
>>>> +	if (intr)
>>>> +		err = dma_resv_lock_interruptible(obj, ww);
>>>> +	else
>>>> +		err = dma_resv_lock(obj, ww);
>>>> +
>>>> +	if (unlikely(err))
>>>> +		return err;
>>>> +
>>>> +	num_resv = max(num_resv, 1);
>>> Why? If the user ask to reserve 0 fences this will reserve 1.
>> Reserving 0 fences is illegal. The dma_resv object will complain about that
>> in debug builds IIRC.
>>
>   
> Maybe if you call dma_resv_reserve_fences with 0 or try to install a
> fence without reserving something will complain but certainly can do
> this:
>
> dma_resv_lock
> do something without calling dma_resv_reserve_fences
> dma_resv_unlock

Yeah, that's exactly why I have separate the _prepare_obj() and 
_lock_obj() functions in drm_exec:

  * drm_exec_prepare_obj - prepare a GEM object for use
  * @exec: the drm_exec object with the state
  * @obj: the GEM object to prepare
  * @num_fences: how many fences to reserve

  * drm_exec_lock_obj - lock a GEM object for use
  * @exec: the drm_exec object with the state
  * @obj: the GEM object to lock

If you don't need to reserve a fence then don't call the function for 
that, otherwise reserve at least one fence or you will get a warning :)

A simple if (!num_resv) here should do as well.

Regards,
Christian.

>
> Matt
>
>> Christian.
>>
>>>> +	err = dma_resv_reserve_fences(obj, num_resv);
>>>> +	if (err)
>>>> +		goto out_err;
>>>> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
>>>> +	return 0;
>>>> +
>>>> +out_err:
>>>> +	dma_resv_unlock(obj);
>>>> +	return err;
>>>>    }
>>>>    void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> index f6ee920303af..bc67263c6713 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>>> @@ -11,7 +11,6 @@
>>>>    #include <drm/drm_mm.h>
>>>>    #include <drm/ttm/ttm_bo.h>
>>>>    #include <drm/ttm/ttm_device.h>
>>>> -#include <drm/ttm/ttm_execbuf_util.h>
>>>>    #include <drm/ttm/ttm_placement.h>
>>>>    struct xe_device;
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>>>> index ba13d20ed348..32a6e16ec177 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include "xe_exec.h"
>>>>    #include <drm/drm_device.h>
>>>> +#include <drm/drm_exec.h>
>>>>    #include <drm/drm_file.h>
>>>>    #include <drm/xe_drm.h>
>>>>    #include <linux/delay.h>
>>>> @@ -95,23 +96,18 @@
>>>>    #define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
>>>> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>>>> -			 struct ttm_validate_buffer tv_onstack[],
>>>> -			 struct ttm_validate_buffer **tv,
>>>> -			 struct list_head *objs)
>>>> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>>>>    {
>>>>    	struct xe_vm *vm = e->vm;
>>>>    	struct xe_vma *vma;
>>>> -	LIST_HEAD(dups);
>>>>    	ktime_t end = 0;
>>>>    	int err = 0;
>>>> -	*tv = NULL;
>>>>    	if (xe_vm_no_dma_fences(e->vm))
>>>>    		return 0;
>>>>    retry:
>>>> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
>>>> +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
>>>>    	if (err)
>>>>    		return err;
>>>> @@ -128,8 +124,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>>>>    		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>>>>    		if (err) {
>>>> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
>>>> -			*tv = NULL;
>>>> +			xe_vm_unlock_dma_resv(vm, exec);
>>>>    			break;
>>>>    		}
>>>>    	}
>>>> @@ -153,14 +148,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>>>>    	return err;
>>>>    }
>>>> -static void xe_exec_end(struct xe_engine *e,
>>>> -			struct ttm_validate_buffer *tv_onstack,
>>>> -			struct ttm_validate_buffer *tv,
>>>> -			struct ww_acquire_ctx *ww,
>>>> -			struct list_head *objs)
>>>> +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
>>>>    {
>>>>    	if (!xe_vm_no_dma_fences(e->vm))
>>>> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
>>>> +		xe_vm_unlock_dma_resv(e->vm, exec);
>>>>    }
>>>>    int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>> @@ -173,14 +164,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    	struct xe_engine *engine;
>>>>    	struct xe_sync_entry *syncs = NULL;
>>>>    	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
>>>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>>>> -	struct ttm_validate_buffer *tv = NULL;
>>>>    	u32 i, num_syncs = 0;
>>>>    	struct xe_sched_job *job;
>>>>    	struct dma_fence *rebind_fence;
>>>>    	struct xe_vm *vm;
>>>> -	struct ww_acquire_ctx ww;
>>>> -	struct list_head objs;
>>>> +	struct drm_exec exec;
>>>>    	bool write_locked;
>>>>    	int err = 0;
>>>> @@ -293,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    			goto err_unlock_list;
>>>>    	}
>>>> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
>>>> +	err = xe_exec_begin(engine, &exec);
>>>>    	if (err)
>>>>    		goto err_unlock_list;
>>>> @@ -412,7 +400,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    	if (err)
>>>>    		xe_sched_job_put(job);
>>>>    err_engine_end:
>>>> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
>>>> +	xe_exec_end(engine, &exec);
>>>>    err_unlock_list:
>>>>    	if (write_locked)
>>>>    		up_write(&vm->lock);
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> index 125e4744fa38..94f59c29ba9b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>> @@ -8,8 +8,8 @@
>>>>    #include <linux/bitfield.h>
>>>>    #include <linux/circ_buf.h>
>>>> +#include <drm/drm_exec.h>
>>>>    #include <drm/drm_managed.h>
>>>> -#include <drm/ttm/ttm_execbuf_util.h>
>>>>    #include "xe_bo.h"
>>>>    #include "xe_gt.h"
>>>> @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>>>>    	return true;
>>>>    }
>>>> -static bool only_needs_bo_lock(struct xe_bo *bo)
>>>> -{
>>>> -	return bo && bo->vm;
>>>> -}
>>>> -
>>>>    static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>>>>    {
>>>>    	struct xe_vma *vma = NULL;
>>>> @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>>>    	struct xe_vm *vm;
>>>>    	struct xe_vma *vma = NULL;
>>>>    	struct xe_bo *bo;
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>>>> -	struct ww_acquire_ctx ww;
>>>> +	struct drm_exec exec;
>>>>    	struct dma_fence *fence;
>>>>    	bool write_locked;
>>>>    	int ret = 0;
>>>> @@ -171,20 +163,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>>>    	/* Lock VM and BOs dma-resv */
>>>>    	bo = xe_vma_bo(vma);
>>>> -	if (only_needs_bo_lock(bo)) {
>>>> -		/* This path ensures the BO's LRU is updated */
>>>> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
>>>> -	} else {
>>>> -		tv_vm.num_shared = xe->info.tile_count;
>>>> -		tv_vm.bo = xe_vm_ttm_bo(vm);
>>>> -		list_add(&tv_vm.head, &objs);
>>>> -		if (bo) {
>>>> -			tv_bo.bo = &bo->ttm;
>>>> -			tv_bo.num_shared = xe->info.tile_count;
>>>> -			list_add(&tv_bo.head, &objs);
>>>> -		}
>>>> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>>>> -	}
>>>> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>>>>    	if (ret)
>>>>    		goto unlock_vm;
>>>> @@ -227,10 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>>>    	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
>>>>    unlock_dma_resv:
>>>> -	if (only_needs_bo_lock(bo))
>>>> -		xe_bo_unlock(bo, &ww);
>>>> -	else
>>>> -		ttm_eu_backoff_reservation(&ww, &objs);
>>>> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>>>>    unlock_vm:
>>>>    	if (!ret)
>>>>    		vm->usm.last_fault_vma = vma;
>>>> @@ -498,10 +474,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>>>    	struct xe_vm *vm;
>>>>    	struct xe_vma *vma;
>>>>    	struct xe_bo *bo;
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>>>> -	struct ww_acquire_ctx ww;
>>>> +	struct drm_exec exec;
>>>>    	int ret = 0;
>>>>    	/* We only support ACC_TRIGGER at the moment */
>>>> @@ -534,28 +507,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>>>    	/* Lock VM and BOs dma-resv */
>>>>    	bo = xe_vma_bo(vma);
>>>> -	if (only_needs_bo_lock(bo)) {
>>>> -		/* This path ensures the BO's LRU is updated */
>>>> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
>>>> -	} else {
>>>> -		tv_vm.num_shared = xe->info.tile_count;
>>>> -		tv_vm.bo = xe_vm_ttm_bo(vm);
>>>> -		list_add(&tv_vm.head, &objs);
>>>> -		tv_bo.bo = &bo->ttm;
>>>> -		tv_bo.num_shared = xe->info.tile_count;
>>>> -		list_add(&tv_bo.head, &objs);
>>>> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>>>> -	}
>>>> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>>>>    	if (ret)
>>>>    		goto unlock_vm;
>>>>    	/* Migrate to VRAM, move should invalidate the VMA first */
>>>>    	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>>>> -	if (only_needs_bo_lock(bo))
>>>> -		xe_bo_unlock(bo, &ww);
>>>> -	else
>>>> -		ttm_eu_backoff_reservation(&ww, &objs);
>>>> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>>>>    unlock_vm:
>>>>    	up_read(&vm->lock);
>>>>    	xe_vm_put(vm);
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 6c216350084b..c89b10d5feb5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -7,8 +7,8 @@
>>>>    #include <linux/dma-fence-array.h>
>>>> +#include <drm/drm_exec.h>
>>>>    #include <drm/drm_print.h>
>>>> -#include <drm/ttm/ttm_execbuf_util.h>
>>>>    #include <drm/ttm/ttm_tt.h>
>>>>    #include <drm/xe_drm.h>
>>>>    #include <linux/delay.h>
>>>> @@ -321,11 +321,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>>>>    int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>>>    {
>>>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>>>> -	struct ttm_validate_buffer *tv;
>>>> -	struct ww_acquire_ctx ww;
>>>> -	struct list_head objs;
>>>>    	struct dma_fence *pfence;
>>>> +	struct drm_exec exec;
>>>>    	int err;
>>>>    	bool wait;
>>>> @@ -333,7 +330,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>>>    	down_write(&vm->lock);
>>>> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
>>>> +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
>>>>    	if (err)
>>>>    		goto out_unlock_outer;
>>>> @@ -367,7 +364,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>>>>    	up_read(&vm->userptr.notifier_lock);
>>>>    out_unlock:
>>>> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>>>> +	xe_vm_unlock_dma_resv(vm, &exec);
>>>>    out_unlock_outer:
>>>>    	up_write(&vm->lock);
>>>> @@ -397,68 +394,43 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>>>>     * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>>>>     * objects of the vm's external buffer objects.
>>>>     * @vm: The vm.
>>>> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
>>>> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
>>>> - * ttm_validate_buffers used for locking.
>>>> - * @tv: Pointer to a pointer that on output contains the actual storage used.
>>>> - * @objs: List head for the buffer objects locked.
>>>> + * @exec: Pointer to a struct drm_exec execution context.
>>>>     * @intr: Whether to lock interruptible.
>>>>     * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>>>>     *
>>>>     * Locks the vm dma-resv objects and all the dma-resv objects of the
>>>> - * buffer objects on the vm external object list. The TTM utilities require
>>>> - * a list of struct ttm_validate_buffers pointing to the actual buffer
>>>> - * objects to lock. Storage for those struct ttm_validate_buffers should
>>>> - * be provided in @tv_onstack, and is typically reserved on the stack
>>>> - * of the caller. If the size of @tv_onstack isn't sufficient, then
>>>> - * storage will be allocated internally using kvmalloc().
>>>> + * buffer objects on the vm external object list using helpers provided
>>>> + * by drm_exec.
>>>>     *
>>>>     * The function performs deadlock handling internally, and after a
>>>>     * successful return the ww locking transaction should be considered
>>>>     * sealed.
>>>>     *
>>>> - * Return: 0 on success, Negative error code on error. In particular if
>>>> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
>>>> - * of error, any locking performed has been reverted.
>>>> + * Return: 0 on success, Negative error code on error.
>>>>     */
>>>> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>> -			struct ttm_validate_buffer *tv_onstack,
>>>> -			struct ttm_validate_buffer **tv,
>>>> -			struct list_head *objs,
>>>> -			bool intr,
>>>> -			unsigned int num_shared)
>>>> -{
>>>> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
>>>> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>>>> +			bool intr, unsigned int num_shared)
>>>> +{
>>>>    	struct xe_vma *vma, *next;
>>>> -	LIST_HEAD(dups);
>>>> +	struct drm_gem_object *obj;
>>>>    	int err;
>>>>    	lockdep_assert_held(&vm->lock);
>>>> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
>>>> -		tv_vm = tv_onstack;
>>>> -	} else {
>>>> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
>>>> -				       GFP_KERNEL);
>>>> -		if (!tv_vm)
>>>> -			return -ENOMEM;
>>>> +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
>>>> +	drm_exec_until_all_locked(exec) {
>>>> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
>>>> +		drm_exec_retry_on_contention(exec);
>>>> +		if (unlikely(err) && err != -EALREADY)
>>>> +			goto out_err;
>>>> +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
>>>> +			obj = &xe_vma_bo(vma)->ttm.base;
>>>> +			err = drm_exec_prepare_obj(exec, obj, num_shared);
>>>> +			drm_exec_retry_on_contention(exec);
>>>> +			if (unlikely(err) && err != -EALREADY)
>>>> +				goto out_err;
>>>> +		}
>>>>    	}
>>>> -	tv_bo = tv_vm + 1;
>>>> -
>>>> -	INIT_LIST_HEAD(objs);
>>>> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
>>>> -		tv_bo->num_shared = num_shared;
>>>> -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
>>>> -
>>>> -		list_add_tail(&tv_bo->head, objs);
>>>> -		tv_bo++;
>>>> -	}
>>>> -	tv_vm->num_shared = num_shared;
>>>> -	tv_vm->bo = xe_vm_ttm_bo(vm);
>>>> -	list_add_tail(&tv_vm->head, objs);
>>>> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
>>>> -	if (err)
>>>> -		goto out_err;
>>>>    	spin_lock(&vm->notifier.list_lock);
>>>>    	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
>>>> @@ -470,14 +442,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>>    			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>>>>    	}
>>>>    	spin_unlock(&vm->notifier.list_lock);
>>>> -
>>>> -	*tv = tv_vm;
>>>>    	return 0;
>>>>    out_err:
>>>> -	if (tv_vm != tv_onstack)
>>>> -		kvfree(tv_vm);
>>>> -
>>>> +	drm_exec_fini(exec);
>>>>    	return err;
>>>>    }
>>>> @@ -485,20 +453,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>>     * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>>>>     * xe_vm_lock_dma_resv()
>>>>     * @vm: The vm.
>>>> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
>>>> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
>>>> - * @ww: The ww_acquire_context used for locking.
>>>> - * @objs: The list returned from xe_vm_lock_dma_resv().
>>>> + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
>>>>     *
>>>>     * Unlocks the reservation objects and frees any memory allocated by
>>>>     * xe_vm_lock_dma_resv().
>>>>     */
>>>> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>> -			   struct ttm_validate_buffer *tv_onstack,
>>>> -			   struct ttm_validate_buffer *tv,
>>>> -			   struct ww_acquire_ctx *ww,
>>>> -			   struct list_head *objs)
>>>> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
>>>>    {
>>>> +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
>>>> +	unsigned long index;
>>>> +
>>>>    	/*
>>>>    	 * Nothing should've been able to enter the list while we were locked,
>>>>    	 * since we've held the dma-resvs of all the vm's external objects,
>>>> @@ -507,9 +471,13 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>>    	 */
>>>>    	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
>>>> -	ttm_eu_backoff_reservation(ww, objs);
>>>> -	if (tv && tv != tv_onstack)
>>>> -		kvfree(tv);
>>>> +	drm_exec_for_each_locked_object(exec, index, obj) {
>>>> +		struct xe_bo *bo = gem_to_xe_bo(obj);
>>>> +
>>>> +		if (obj != skip)
>>>> +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>>>> +	}
>>>> +	drm_exec_fini(exec);
>>>>    }
>>>>    #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>>>> @@ -536,10 +504,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>>>    {
>>>>    	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>>>>    	struct xe_vma *vma;
>>>> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
>>>> -	struct ttm_validate_buffer *tv;
>>>> -	struct ww_acquire_ctx ww;
>>>> -	struct list_head objs;
>>>> +	struct drm_exec exec;
>>>>    	struct dma_fence *rebind_fence;
>>>>    	unsigned int fence_count = 0;
>>>>    	LIST_HEAD(preempt_fences);
>>>> @@ -582,8 +547,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>>>    			goto out_unlock_outer;
>>>>    	}
>>>> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
>>>> -				  false, vm->preempt.num_engines);
>>>> +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
>>>>    	if (err)
>>>>    		goto out_unlock_outer;
>>>> @@ -662,7 +626,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>>>    	up_read(&vm->userptr.notifier_lock);
>>>>    out_unlock:
>>>> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
>>>> +	xe_vm_unlock_dma_resv(vm, &exec);
>>>>    out_unlock_outer:
>>>>    	if (err == -EAGAIN) {
>>>>    		trace_xe_vm_rebind_worker_retry(vm);
>>>> @@ -1105,27 +1069,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>>>    static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>>>>    {
>>>> -	struct ttm_validate_buffer tv[2];
>>>> -	struct ww_acquire_ctx ww;
>>>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>>>    	struct xe_bo *bo = xe_vma_bo(vma);
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> +	struct drm_exec exec;
>>>>    	int err;
>>>> -	memset(tv, 0, sizeof(tv));
>>>> -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
>>>> -	list_add(&tv[0].head, &objs);
>>>> -
>>>> -	if (bo) {
>>>> -		tv[1].bo = &xe_bo_get(bo)->ttm;
>>>> -		list_add(&tv[1].head, &objs);
>>>> -	}
>>>> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>>>> +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
>>>>    	XE_WARN_ON(err);
>>>>    	xe_vma_destroy(vma, NULL);
>>>> -	ttm_eu_backoff_reservation(&ww, &objs);
>>>> +	xe_vm_bo_unlock(vm, bo, &exec, false);
>>>>    	if (bo)
>>>>    		xe_bo_put(bo);
>>>>    }
>>>> @@ -2125,21 +2079,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>>>>    #define VM_BIND_OP(op)	(op & 0xffff)
>>>> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>>>> -{
>>>> -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
>>>> -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
>>>> -
>>>> -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
>>>> -	return &vm->pt_root[idx]->bo->ttm;
>>>> -}
>>>> -
>>>> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
>>>> -{
>>>> -	tv->num_shared = 1;
>>>> -	tv->bo = xe_vm_ttm_bo(vm);
>>>> -}
>>>> -
>>>>    static void vm_set_async_error(struct xe_vm *vm, int err)
>>>>    {
>>>>    	lockdep_assert_held(&vm->lock);
>>>> @@ -2577,17 +2516,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>>>>    static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>>>    			       struct xe_vma_op *op)
>>>>    {
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> -	struct ttm_validate_buffer tv_bo, tv_vm;
>>>> -	struct ww_acquire_ctx ww;
>>>>    	struct xe_bo *vbo;
>>>> +	struct drm_exec exec;
>>>>    	int err;
>>>>    	lockdep_assert_held_write(&vm->lock);
>>>> -	xe_vm_tv_populate(vm, &tv_vm);
>>>> -	list_add_tail(&tv_vm.head, &objs);
>>>>    	vbo = xe_vma_bo(vma);
>>>>    	if (vbo) {
>>>>    		/*
>>>> @@ -2596,16 +2530,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>>>    		 * take a reference here.
>>>>    		 */
>>>>    		xe_bo_get(vbo);
>>>> -
>>>> -		if (!vbo->vm) {
>>>> -			tv_bo.bo = &vbo->ttm;
>>>> -			tv_bo.num_shared = 1;
>>>> -			list_add(&tv_bo.head, &objs);
>>>> -		}
>>>>    	}
>>>>    again:
>>>> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
>>>> +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
>>>>    	if (err) {
>>>>    		xe_bo_put(vbo);
>>>>    		return err;
>>>> @@ -2687,7 +2615,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>>>    		XE_BUG_ON("NOT POSSIBLE");
>>>>    	}
>>>> -	ttm_eu_backoff_reservation(&ww, &objs);
>>>> +	xe_vm_bo_unlock(vm, vbo, &exec, false);
>>>>    	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>>>>    		lockdep_assert_held_write(&vm->lock);
>>>>    		err = xe_vma_userptr_pin_pages(vma);
>>>> @@ -3338,24 +3266,47 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    	return err == -ENODATA ? 0 : err;
>>>>    }
>>>> +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
>>>> +{
>>>> +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
>>>> +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
>>>> +
>>>> +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
>>>> +	return &vm->pt_root[idx]->bo->ttm.base;
>>>> +}
>>>> +
>>>>    /*
>>>> - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
>>>> - * directly to optimize. Also this likely should be an inline function.
>>>> + * XXX: This likely should be an inline function.
>>>>     */
>>>>    int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>>    	       int num_resv, bool intr)
>>>>    {
>>>> -	struct ttm_validate_buffer tv_vm;
>>>> -	LIST_HEAD(objs);
>>>> -	LIST_HEAD(dups);
>>>> +	struct dma_resv *obj;
>>>> +	int err;
>>>>    	XE_BUG_ON(!ww);
>>>> -	tv_vm.num_shared = num_resv;
>>>> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
>>>> -	list_add_tail(&tv_vm.head, &objs);
>>>> +	obj = xe_vm_gem(vm)->resv;
>>>> +	ww_acquire_init(ww, &reservation_ww_class);
>>>> +
>>>> +	if (intr)
>>>> +		err = dma_resv_lock_interruptible(obj, ww);
>>>> +	else
>>>> +		err = dma_resv_lock(obj, ww);
>>>> +
>>>> +	if (unlikely(err))
>>>> +		return err;
>>>> +
>>>> +	num_resv = max(num_resv, 1);
>>> Same question as above here.
>>>
>>> Matt
>>>
>>>> +	err = dma_resv_reserve_fences(obj, num_resv);
>>>> +	if (err)
>>>> +		goto out_err;
>>>> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
>>>> +	return 0;
>>>> +
>>>> +out_err:
>>>> +	dma_resv_unlock(&vm->resv);
>>>> +	return err;
>>>>    }
>>>>    void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>>>> @@ -3364,6 +3315,43 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>>>>    	ww_acquire_fini(ww);
>>>>    }
>>>> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>>>> +		  int num_resv, bool intr)
>>>> +{
>>>> +	int err;
>>>> +
>>>> +	drm_exec_init(exec, intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0);
>>>> +	drm_exec_until_all_locked(exec) {
>>>> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
>>>> +					   num_resv);
>>>> +		drm_exec_retry_on_contention(exec);
>>>> +		if (err && err != -EALREADY)
>>>> +			goto out_err;
>>>> +
>>>> +		if (bo && !bo->vm) {
>>>> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
>>>> +						   num_resv);
>>>> +			drm_exec_retry_on_contention(exec);
>>>> +			if (err && err != -EALREADY)
>>>> +				goto out_err;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +out_err:
>>>> +	drm_exec_fini(exec);
>>>> +	return err;
>>>> +}
>>>> +
>>>> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>>>> +		     bool lru_update)
>>>> +{
>>>> +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
>>>> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>>>> +	drm_exec_fini(exec);
>>>> +}
>>>> +
>>>>    /**
>>>>     * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>>>>     * @vma: VMA to invalidate
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>>>> index eaf11ac8ff51..62a062bd5078 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>>>> @@ -12,6 +12,7 @@
>>>>    #include "xe_vm_types.h"
>>>>    struct drm_device;
>>>> +struct drm_exec;
>>>>    struct drm_printer;
>>>>    struct drm_file;
>>>> @@ -39,11 +40,17 @@ static inline void xe_vm_put(struct xe_vm *vm)
>>>>    	kref_put(&vm->refcount, xe_vm_free);
>>>>    }
>>>> +struct drm_gem_object *xe_vm_gem(struct xe_vm *vm);
>>>> +
>>>>    int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>>    	       int num_resv, bool intr);
>>>> -
>>>>    void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
>>>> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>>>> +		  int num_resv, bool intr);
>>>> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
>>>> +		     bool lru_update);
>>>> +
>>>>    static inline bool xe_vm_is_closed(struct xe_vm *vm)
>>>>    {
>>>>    	/* Only guaranteed not to change when vm->lock is held */
>>>> @@ -183,8 +190,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
>>>>    extern struct ttm_device_funcs xe_ttm_funcs;
>>>> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>>>> -
>>>>    /**
>>>>     * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
>>>>     * vms.
>>>> @@ -212,23 +217,10 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>>>>    	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>>>>    }
>>>> -/*
>>>> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>>>> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
>>>> - */
>>>> -#define XE_ONSTACK_TV 20
>>>> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>>>> -			struct ttm_validate_buffer *tv_onstack,
>>>> -			struct ttm_validate_buffer **tv,
>>>> -			struct list_head *objs,
>>>> -			bool intr,
>>>> -			unsigned int num_shared);
>>>> -
>>>> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>>>> -			   struct ttm_validate_buffer *tv_onstack,
>>>> -			   struct ttm_validate_buffer *tv,
>>>> -			   struct ww_acquire_ctx *ww,
>>>> -			   struct list_head *objs);
>>>> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>>>> +			bool intr, unsigned int num_shared);
>>>> +
>>>> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
>>>>    void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>>>>    			     enum dma_resv_usage usage);
>>>> -- 
>>>> 2.34.1
>>>>

