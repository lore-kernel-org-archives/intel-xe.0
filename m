Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C986C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 09:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFC510E066;
	Thu,  6 Apr 2023 09:32:58 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3268710E066
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 09:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqNIPo4ECq/QzZN6Y1NTqo/5H2nylxstyX9gwgfFU9pjAL9zM3vsEJ74w3iq/fTdKvhJJhHbaxt23ZBeZm7ZGnLaEy9BwO6ddJZ+obxo97tsO8WeHZ9FlpdsK/wk85cH8/+/1oMqBGoejYwaJQ5hhACrObIZFjabjOoCfZgnX1qnbQE9aXfHQkOgtu0RWr/EHBL5QxCuAM2aWhpBrzApsURt+QKvg6jMf26syoO+bpQOQnHXYY654Vdjobtw+OMpKJz29pBQN3ylhD7w8+Wy0jeZ30QHO1MQcbscjrvlFYwKgfOqwG8th87tGBv/hQkG6yn5qZfaTqsedo6vs+vgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMj/J11oSqBT69S4hOh3ZalkDI+92WxDVjLUA8x4Fj4=;
 b=QtqcJaVsAWLyIOyH3msoTU6EnE6NsMXDJ62PxneUp6FnLpoZWh9/fZh8WlJZ6pVQzl7UYTzqKloyc768yp+4ZUut9OCu+YWIKHpl9bJiuZYpOBAn1FjyMlTPwycXb4o3VwqlVDoLk0sVm9YfzbMn4xaU6ST5ZccRVRWIL4en0nQxMczcIGMndHfkTkU86OQ+S6UVZTpYKDK7qgcvjMHR1sNJv7CzJbEyKXAwNfhEnGcuBAgmayvMmYc3+8ibw8z6rPfrFjQ3b8CPTy0I3tV99fF+Oqr0i18tPfCskUAch9pNiyjSTOeiIPQmaZnF75YfkqRvoE3I/TKL3C53B0n2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMj/J11oSqBT69S4hOh3ZalkDI+92WxDVjLUA8x4Fj4=;
 b=QauBIRzzqH/kKOS02tKm0JijCJ8NEc+GT23ULXyTFQYHBQ8uay/zFAzsZe25xGooZ/GCkOd0k/dxWeH5Q6PPDhTeQ59kb2uFATxPQgKTaoA4DLn9czNy9WHlkanHCoJhlmDvdxIGbRmlwuYX+2klmtTo4T59MmevehiC5Kbds5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Thu, 6 Apr
 2023 09:32:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 09:32:52 +0000
Message-ID: <ee7fa331-5cfa-14a6-b25d-9e8b22654bf8@amd.com>
Date: Thu, 6 Apr 2023 11:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
 <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
 <ZC2FfgbxUJpI+FEI@DUT025-TGLU.fm.intel.com>
 <CAM0jSHNS0G3pTptm-3+6byuB7HmQiKswoWoceD7O9e5CgG9T6w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHNS0G3pTptm-3+6byuB7HmQiKswoWoceD7O9e5CgG9T6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7833aa1e-9c4b-43d5-156e-08db3681e4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVZ98+0xVk0ZUzzW1fig9RhR2aYogQwp7D0MFFdi4OM9UoDqdsckB6YRVJuT7+HofE5zAH/l1dbhVxWapjIS7X4l2E/8Lxevi72gY2LOgF5/Uz8+tqgTHUsIBpZBnw5qu4Ge8HKZanojdDxWEttI+aJG78HM5Wpavwk7OiszmoqLAXFbLyvum22yTuB/LyM9e7fvMsTWoEQPb8XXQnmA1tRRYRg7GvoqR+8jm+DQJzZ7SeJNCyhtuDmR+OL134EJ+0M74+7rRyPbXPsLda3ZhhTBTwXEeU4s4pvWSE+Rj48GYuq2TqZJr5OM6+p9HXjoe6Ti77eB5Wnz3lGbGfQkarkOtsBcMzM4hg+SW4fyxyLMA96mH+atqRHNLtlCnTUWvy1TFvmG/ViqCvNKh1b3EUpqW/aTpwh5cs3NmpmSy3gOPFUsx0CzVuO/Ve6a5fkGF/fHaKjSPnh3wez+KCxKmPybtwiV9plGojeXjPiO9nw6W7grmMhupEN9YSo1F4x/qKmjhVuXd4JgoOAtm4ztl/o18FGYYfVlYoBKBkbRND/2aicSg3mpHgg5oUL6sP9kfJrNgEWWIjHr9RvpAArNjva9furJ3tpPvlOFgFY/+1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199021)(66476007)(66946007)(478600001)(66556008)(4326008)(316002)(110136005)(38100700002)(31696002)(86362001)(2906002)(8936002)(8676002)(6512007)(6506007)(5660300002)(36756003)(26005)(41300700001)(2616005)(966005)(31686004)(186003)(83380400001)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di9iaHJ5WUQ1YURiWkNXRUhuMjhFU1ZHcnZwdEJ5bUJVT3ptdkovRUI0enJ0?=
 =?utf-8?B?SjFEOGFQSFZBcU9LQ1JhQW5mRjBVWmloWDdEenhVWDBWTTdhUWs1czRCRTJ0?=
 =?utf-8?B?UDl6alJwSE91NEtFMmtDVFA2RUpidmIrMklOcVJrb05Fd2t6WFFkRWJtdTZE?=
 =?utf-8?B?SE1LbThhOTNrbmtwcGdqSjdKc2JYdENRdm5KK1dzK3ZsajlqOXZxbkpjQlhi?=
 =?utf-8?B?N0JlRVpKOWxmSXZmb0VpcXlvQ1cxWmFiOEc5dm5yVjRPblpqTk50TWNkTHIy?=
 =?utf-8?B?aUFmbHArUlUrWEQrdkN6SlVkNDc0bGF6ZTIwcWwxcGs2N1ZHRlZRZWIwNU9n?=
 =?utf-8?B?dnpQNEJBeFQ2c0JoUFB2ZTc3SXBmNEkxT0dScXlJSllUN2tJWGl2Y1o3MjlL?=
 =?utf-8?B?WEZSQUZ6OFNCRENsdlpsMFpxL2d1ZXZ0WXZPc2JvOXRtQnBHcDRVZkE2eUor?=
 =?utf-8?B?Zk82R2MxQnV5QlFrZyszS3JJY0lHRUQ3KzFCRW5NVjh6VnJ3aUJjZFo5YUdx?=
 =?utf-8?B?WTVEajNOWUVNYTJjajJWQzYrRnliL0x0ellmVkFpaGFlaEdiZ3ZpMlQ3Wjd2?=
 =?utf-8?B?WjJlTnUrcHVOMjFaS1BMMVVpbzFhVXJya3ZuS2VZZkZnUExnUVFXOTdmSXR6?=
 =?utf-8?B?YkxsZFZIRmVmZ2lHOGhQbHUzRE90Ym1oNWpoVlAvZW9jN2hjd0FpdnV2OFVn?=
 =?utf-8?B?aG52VngzYTVXZSt0elhZUFJQeHJucXBFQ25jczNyVHZ2RldIVXBxWkQ5VitP?=
 =?utf-8?B?V3hrMTBjUUlZbjdSTFRJZXJPSHo3Rm51R1pBekpqUFFQdHVUZmF1ZTJDa3pl?=
 =?utf-8?B?VC9XTlZ6YzA5bUFUcFBwSjl0cmxrdUJsUTNPQmhTTnpiNldJVDRTakdhanZu?=
 =?utf-8?B?RXVjZ3crckdkSVB1SzkzYSs5QUpWUXd6aHd5czkvZUJkaTU0TlA2azVTWUtJ?=
 =?utf-8?B?MlAwbzZEY3BVNUFBblNWV0FRdTJ4SC9lWmJub0xVQXhJV2tpcURNZjMvSjYz?=
 =?utf-8?B?bGg4eDhyYUN6TnNvMjl5OURieFhJRjhNWHI4QzNkZUd3d3Z1ZktrdlR5ZkZJ?=
 =?utf-8?B?aUlIOThZSndQK3c0d3lraVNzT3NZSnBiSG1xN2c4MnpUb200SXFXbjVOQUpt?=
 =?utf-8?B?Q3Z0R2xJTHVkNjNmVm1WaUZncW1ONHZyME9SYk9KZDBya1pYcWFwcCs1QlZr?=
 =?utf-8?B?VDZhZGVPZldOSUNaM0xSaE8wK1BnZlBLMlNJVXRNcXl2cFAyd0M4ZGplKzh5?=
 =?utf-8?B?VkhVYWUzN3d6d2NiR2w4cjdabnlxTnppSXBLb0QxQ3loejVLOVk1eDdFZU1u?=
 =?utf-8?B?WkxPVUJXSm5CdWZXSC9GbUZBVjgxR2tSbzJNQVhWMzlTT0xudjBkNGV3dGpM?=
 =?utf-8?B?S3I3TUhsTGQ3SDBsTnk4WGF0NnIrdlcxU3BGckJzYTd5eVQ0NmZhRzlEZmhU?=
 =?utf-8?B?VjRlUTVPdWRYcDlVTVBWM2hDaVlIOGtNYzF3RHN2YzNjK3djVEQ4ZHZXeUJ3?=
 =?utf-8?B?OEVKZjdLczJpV3hSR0tHR01veUpOMUs5WktKMW9TU0Y0OEluTktHSjd5R0Fu?=
 =?utf-8?B?aEVXbjF3bjlpZkQyQXpDdW5ZaDZwajNnU2ZFOHh6V3BsVlUyTEdTanc4eWsv?=
 =?utf-8?B?VTB6QTl4V3prU05McmhCZWhkS0YrQVM5bEd5dGJCMzJVRURjVDZtanBkN1NP?=
 =?utf-8?B?TGpoWTNWOU13OCtzTnBKSDh2dGZicWJqS2hyWjlWc0s3UTZObTVMUHJ1QmhK?=
 =?utf-8?B?SVc3bFBpZ3JMQXhyQUJFaS8rWHk0UXlOMWNOZmxtNTkvYWhRWS9NUkpWaWRn?=
 =?utf-8?B?a211N1d5clVmWWx6cENFUElma0VMZlhUK1NhSTFaVDFCTG14SXV6dVlKbkN1?=
 =?utf-8?B?eVhCYWZiZzFpclk4WTdKUU9EU3ZXQUs4T0J0cFdBd1BFanpsbmFEU2RHRitk?=
 =?utf-8?B?REJ5anZxemIwbmlPSlZEemZObUFRTkxsdmh2MUZqbzIvNk9KOExzK0NNOThq?=
 =?utf-8?B?U3NSLzZPWEZPK3E5WGVmZmFqNGg4dWJlLzYyRWUrckliaG5QMTNoa0hzNGo3?=
 =?utf-8?B?MkxCNmRPUXk1VGltTzd4aXRBT0dpdmZiSkl2Ti83Q2FYK1BrMzF2Ty9EcVkw?=
 =?utf-8?Q?//L0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7833aa1e-9c4b-43d5-156e-08db3681e4e9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:32:52.3472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVvcRKKPfzT/Jd9w5/KNiQIblOWJK3c7Xrzoy450wAkAsLkFI1Qzs97KVL52iHxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use Xe BO pin / unpin functions for
 FB pin
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Am 05.04.23 um 19:04 schrieb Matthew Auld:
> On Wed, 5 Apr 2023 at 15:28, Matthew Brost <matthew.brost@intel.com> wrote:
>> On Wed, Apr 05, 2023 at 02:14:22PM +0000, Matthew Brost wrote:
>>> On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
>>>> On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
>>>>> Need to use XE BO pin / unpin for suspend / resume to work properly.
>>>>> Part this fix too is too allow xe_bo_pin to be called more than once.
>>>>>
>>>>> Should fix:
>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> Change makes sense to me, but I think we also need to update xe_bo_unpin()?
>>>>
>>> Yep, thought that coded correctly but was looking at xe_bo_unpin_external().
>>>
>>>> But I must be misunderstanding something here. AFAICT we can have
>>>> various pinned VRAM objects, and xe_bo_pin() still adds them to
>>>> pinned.kernel_bo_present, where during suspend we evict everything on
>>>> that list to system memory. But as these are all still pinned, suspend
>>>> is still going to fail with this patch, given the recent TTM changes.
>>> What reference recent TTM changes? This all worked at one point in time.
>>>
>> Oh, I see:
>> git format-patch -1 f87c1f0b7b79b
>>
>> I would've NAK'd that one as this broke us. What you think is the best
>> way to move forward on this one? I like the idea of using TTM to move
>> the objects...
>>
>> I know we could just hack this and set pin_count=0 before calling
>> validate aand restore it after? Horried hack though?
>>
>> Revert the above patch + post upstream?
> Christian, can you share your thoughts here?
>
> This is regarding the TTM change: f87c1f0b7b79 ("drm/ttm: prevent
> moving of pinned BOs"). To quickly summarize, it looks like Xe was
> relying on being able to move pinned BOs for suspend-resume, where the
> driver has some special kernel-internal VRAM buffers that are
> perma-pinned, but need to be moved to system memory during suspend and
> then copied back when resuming. This was all handled by just doing
> something like ttm_bo_validate(PL_SYSTEM), without needing any special
> handling. But this ofc no longer works.

Yeah, exactly that's what this check here should prevent :)

> So wondering if it makes any sense to move the decision back into the
> driver, for whether to treat moving pinned objects as an error or not,
> given the above use case with suspend-resume in Xe?

Well pinning a BO means that it's fixed and can't move any more.

The background is that the physical location (domain, address whatever) 
for this BO is used somewhere in the hardware and you need to notify the 
hardware if that ever changes. Typical applications are scanout, 
firmware buffers etc....

Now if you still want to evacuate those buffers during suspend/resume 
you basically have three options:

1. Manually make sure inside your driver that the location doesn't 
change during evacuation/moving it back in again.
     You can easily allocate additional backing store for you BOs and 
then copy the content back/force manually similar to what 
ttm_bo_validate() would do.
     This wouldn't trigger the warning above and should work as well, 
see functions ttm_bo_mem_space() and ttm_bo_move_null().

2. Unpin them on suspend, re-pin them on resume.
     This is what we do for example for scanout. Re-pinning then usually 
means that you also re-program the hw with the new location information.

3. Stop caring about evacuation during suspend.
     We actually started to do this for a bunch of the read-only 
firmware buffers and just re-load the firmware after resume.
     Has some pitfalls as well (if for example the fw changes), but 
generally seems to work quite fine for a lot of use cases.

If you want to keep moving the BOs just using approach #1 should work 
for you, but approach #2 or #3 is probably cleaner from a high level 
perspective.

Regards,
Christian.

>
>> BTW, this patch is needed regardless with the fix in xe_bo_unpin().
>>
>> Matt
>>
>>> Matt
>>>
>>>> What am I missing?
>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
>>>>>   drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
>>>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> index 65c0bc28a3d1..c7c849be288f 100644
>>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>>> @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>>>>>
>>>>>          ret = xe_bo_validate(bo, NULL, true);
>>>>>          if (!ret)
>>>>> -               ttm_bo_pin(&bo->ttm);
>>>>> +               xe_bo_pin(bo);
>>>>>          ttm_bo_unreserve(&bo->ttm);
>>>>>          if (ret)
>>>>>                  goto err;
>>>>> @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>>>>>
>>>>>   err_unpin:
>>>>>          ttm_bo_reserve(&bo->ttm, false, false, NULL);
>>>>> -       ttm_bo_unpin(&bo->ttm);
>>>>> +       xe_bo_unpin(bo);
>>>>>          ttm_bo_unreserve(&bo->ttm);
>>>>>   err:
>>>>>          kfree(vma);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 3a482c61c3ec..25c696bd380c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
>>>>>           */
>>>>>          XE_BUG_ON(bo->ttm.base.import_attach);
>>>>>
>>>>> -       /* We only expect at most 1 pin */
>>>>> -       XE_BUG_ON(xe_bo_is_pinned(bo));
>>>>> +       if (xe_bo_is_pinned(bo))
>>>>> +               goto pin;
>>>>>
>>>>>          err = xe_bo_validate(bo, NULL, false);
>>>>>          if (err)
>>>>> @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
>>>>>                  }
>>>>>          }
>>>>>
>>>>> +pin:
>>>>>          ttm_bo_pin(&bo->ttm);
>>>>>
>>>>>          /*
>>>>> --
>>>>> 2.34.1
>>>>>

