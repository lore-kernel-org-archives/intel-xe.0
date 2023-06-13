Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040ACC7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 08:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFC210E352;
	Tue, 13 Jun 2023 08:30:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45110E353
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686645026; x=1718181026;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w2qCvgr1mJRRWHsQYhboDMGF8oaXE5A1GdYjrTWjx2s=;
 b=iFtTHel9fJMnVi9Z4hVoxPIKN/+QghmLKmK0Hc/mgm1w8KgyqAPJTbqS
 TDy59vLus287jCMAnfnHsXsFHja7aoFm8RYN2j+eX/FltWjkfj9njXM2T
 IyYvXaifANYdoT9bPQcjeyQYhhM5WCz20wn2lfjAwyfJv5XzCDaadMgP9
 gWAm53mo0fgPmuiMgKyg/kVIvhl8/O3vDle43/w4qBTGVdz/eHM31KsMG
 CFbUGQNAvwLevMEEmzhz7Qd51j0xXGPsTbae5/rA4EPoTeuTw3u3tmO5H
 6FuBM2V+1jCcCG2oyQYJ46yQwLzjb9lM05xZVxuC+JhozRwWAmO6SwidU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="361637758"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="361637758"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958323705"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958323705"
Received: from tomdoylx-mobl1.ger.corp.intel.com (HELO [10.252.5.196])
 ([10.252.5.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:30:10 -0700
Message-ID: <f834a19f-7d34-525c-5139-024a2da5f020@intel.com>
Date: Tue, 13 Jun 2023 09:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
To: Matthew Brost <matthew.brost@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
 <20230612171225.88689-5-matthew.auld@intel.com>
 <ZIdgOrS9n3daGvK1@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZIdgOrS9n3daGvK1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v11 04/12] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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

On 12/06/2023 19:13, Matthew Brost wrote:
> On Mon, Jun 12, 2023 at 06:12:17PM +0100, Matthew Auld wrote:
>> Any kind of device memory access should first ensure the device is not
>> suspended, mmio included.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index f7a7f996b37f..cc5ccbef85a4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -476,6 +476,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>>   	 */
>>   	reg = XE_REG(args->addr);
>>   
>> +	xe_device_mem_access_get(xe);
> 
> What about moving xe_device_mem_access_get/put to xe_force_wake_get/put?
> Just an idea, but this patch LGTM so I'll leave it up to you if you want
> to keep it as is.

Yeah, I think Rodrigo also wanted something similar. However the 
pm_runtime_get_sync() in xe_device_mem_access_get() is scary since it 
allocates memory, plus if it ever reaches our callback 
xe_pm_runtime_resume(), we might grab various locks like ggtt->lock, 
ct->lock etc. That is the main motivation for the patch that adds the 
lockdep annotation. The xe_force_wake_get() is called in some pretty low 
level places AFAICT so my worry is that we will just see a big stream of 
lockdep splats, like already holding ggtt->lock etc. My feeling is that 
xe_device_mem_access_get() should be a fairly "outer" thing, and 
xe_force_wake_get() etc should be more an "inner" thing when looking at 
the hierarchy. What do you think?

But perhaps we can add some helper like xe_force_wake_mem_access_get() 
for the cases where we are close to the ioctl like in this patch?

> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>>   	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   
>>   	if (args->flags & DRM_XE_MMIO_WRITE) {
>> @@ -519,6 +520,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>>   
>>   exit:
>>   	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	xe_device_mem_access_put(xe);
>>   
>>   	return ret;
>>   }
>> -- 
>> 2.40.1
>>
