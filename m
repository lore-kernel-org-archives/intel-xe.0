Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EAAC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80310E451;
	Wed, 17 May 2023 16:21:44 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510FF10E451
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340503; x=1715876503;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=USIul4cCIiHlxdMyemLg1F7oFiCSsrelR7Y06S60fQ8=;
 b=C04rf5f39LIaFGaF3TXfY94gCGqY9GMNzHQFBsQRN9JTlbqt1yX1Kabd
 ik3ogMWNcU0AXQsC8C3eLSLMbDbQwD1UItAp4S/8KvZWMamWaFxxjP9gX
 Mu4g0qvsJY0ZbbAKVRsagG+2vyRgKVpmdzkkUSaZO4Xw/VHV/C9rBoUuK
 G2h/alMLVp4AcJ2ZzlOrmY3v1LwRAHyuJERFlnb9EXYHnKY+7sks8TaVr
 QD0UW64Xbpmox0ex6rr6lPiZELtr7WJLzwEwf0b4TLO2mYXDRRNUOkuMN
 tT5wvTOZzYKg2x6+8rzE7FiqeGHz9SDuvCrqKeH0aXTDjgRMDbQXt5hMf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="417464869"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="417464869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791575535"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="791575535"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO [10.252.15.194])
 ([10.252.15.194])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:21:41 -0700
Message-ID: <71cd40cf-5164-4230-8ffd-28d6479dc9f0@intel.com>
Date: Wed, 17 May 2023 17:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517152244.348171-5-matthew.auld@intel.com>
 <ZGT3Mq1b3Gp/+tgx@rdvivi-mobl4>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZGT3Mq1b3Gp/+tgx@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v5 5/7] drm/xe/ggtt: prime ggtt->lock against
 FS_RECLAIM
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 17/05/2023 16:48, Rodrigo Vivi wrote:
> On Wed, May 17, 2023 at 04:22:42PM +0100, Matthew Auld wrote:
>> Increase the sensitivity of the ggtt->lock by priming it against
>> FS_RECLAIM, such that allocating memory while holding will result in
>> lockdep splats.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index f986e8218820..e25eb70d44f6 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -90,6 +90,16 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
>>   	xe_bo_unpin_map_no_vm(ggtt->scratch);
>>   }
>>   
>> +static void primelockdep(struct xe_ggtt *ggtt)
>> +{
>> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
>> +		return;
>> +
>> +	fs_reclaim_acquire(GFP_KERNEL);
>> +	might_lock(&ggtt->lock);
>> +	fs_reclaim_release(GFP_KERNEL);
> 
> should we use the might_alloc instead of these fs_reclaim directly?
> or the order here with the ggtt->lock in the middle matters?

Yeah, the order matters. I think roughly fs_reclaim is a dummy lock 
taken when entering direct reclaim (like shrinker). So here we are just 
teaching lockdep that fs_reclaim -> ggtt->lock is the correct lock 
order. If anything later inverts that we should get a splat, like for 
example doing kmalloc(GFP_KERNEL) while holding ggtt->lock. In other 
words we are saying that ggtt->lock can potentially be grabbed directly 
from the shrinker.

> 
>> +}
>> +
>>   int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -132,6 +142,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>>   	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>>   		    ggtt->size - xe_wopcm_size(xe));
>>   	mutex_init(&ggtt->lock);
>> +	primelockdep(ggtt);
>>   
>>   	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
>>   }
>> -- 
>> 2.40.1
>>
