Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC1C7EE39
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 07:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC1B10E203;
	Mon, 30 Jun 2025 07:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RCYGdulJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A683410E203
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GsYAi8fZkcocX5YIydYaBi73QUjHxtNjE2o0e5vCnJw=; b=RCYGdulJSA6DJzfvcaKs04TE2w
 2jNCgHrLP9x2hGhJSmpCCRTVSb505R3qdWfUhNM6rlfUzpCE9B3VYiACPmLchMVEh5SvDTvlRGRTw
 jYnZpEQ4GFmydn4qaX+CJjM7Wd/hd8BjbKV47wZXUnoHHI895+CQDIO93weY7F01Rvx5HHuk7K5ya
 IRUW5BDIK8kAxBIyKwDCk2Ef1F65GXpp6rhhl71uantRS9LMWSEgovb8sa/pinQo9YD5K02CNZfvf
 10nWz2k5A47kLssy/TvHswOcRaQIA1INqiCOS/ZZLunM45Kmdk1lN4ZCeL+p2czRBH9Lnu7DS8kUM
 mQ69tgcw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uW9CF-00ANNB-8J; Mon, 30 Jun 2025 09:44:59 +0200
Message-ID: <db53b846-d684-4356-a8d4-164ce3e40c8f@igalia.com>
Date: Mon, 30 Jun 2025 08:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Simplify batch buffer allocation in
 emit_wa_job()
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
 <20250627131438.54398-2-tvrtko.ursulin@igalia.com>
 <a5xk7rv2p5gr3tqlt6w7xwthchix4gvzddbrkmwwlxtlpa5cy7@3qhl5c67sbts>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <a5xk7rv2p5gr3tqlt6w7xwthchix4gvzddbrkmwwlxtlpa5cy7@3qhl5c67sbts>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 27/06/2025 23:47, Lucas De Marchi wrote:
> On Fri, Jun 27, 2025 at 02:14:37PM +0100, Tvrtko Ursulin wrote:
>> Code just needs a large enough buffer and it doesn't even check. Lets
>> therefore simplify to one allocation path which is guaranteed to be as
>> least as big as the current ones.
> 
> In my stashed patches (not sent yet since they don't fix an LRC
> corruption we are chasing) I went the other way around:
> 
> b1f0626cb3d3 o drm/xe/gt: Extract emit_job_sync()
> 979fe60f3883 o drm/xe: Count dwords before allocating
> 5dca40d2503f o drm/xe/lrc: Reduce scope of empty lrc data
> d892c8ac707a o drm/xe/lrc: Add table with LRC layout
> 
> ... particularly the "Count dwords before allocating".

Sounds good from the titles. Carry on as planned. :)

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c | 9 ++-------
>> 1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index d397df056e4c..86018fee74d3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -190,13 +190,8 @@ static int emit_wa_job(struct xe_gt *gt, struct 
>> xe_exec_queue *q)
>>     int count_rmw = 0;
>>     int count = 0;
>>
>> -    if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>> -        /* Big enough to emit all of the context's 3DSTATE */
>> -        bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>> -    else
>> -        /* Just pick a large BB size */
>> -        bb = xe_bb_new(gt, SZ_4K, false);
>> -
>> +    /* Just pick a large BB size */
>> +    bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>>     if (IS_ERR(bb))
>>         return PTR_ERR(bb);
>>
>> -- 
>> 2.48.0
>>

