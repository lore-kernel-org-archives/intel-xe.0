Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2759DC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 12:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BD010E3F4;
	Tue,  9 Jan 2024 12:09:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7989A10E3F4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704802188; x=1736338188;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Xma/6nBOK3DwFw70aUvm0yMsTcA+mTTZqP+nkJO1qGI=;
 b=DQ1bFvx7wqzcZIWSBv49slY2dR300wkrkzts8PHAGfxvd5IcMfbtCDd4
 e89S1G2AAyhwZn4iF09sx2JkXA/5jI/J4/CrKMaFFvFBOyqloyK8348+a
 4Z+iFzdzLrd1I2J6Du39N3f4+k1U6pPRkiwhyVZkSQg97DQ76o2k05gqk
 9yE/ogdsBGFUkTAacuBw8iYDGPg//dPieLRnZ8wFofjnr5n0sftHIQLTE
 sz4FyMxdJFNzJCHeNjcQD3hHOrFSClc77yKFKSSv0QgK/Wj3cRffQ7kU+
 mHbD1gLLwIlYpEHjTrGeMWUIidokb8tttWLATYLp9nIYcfh5zV79ZQAmj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="19681474"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="19681474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="16261833"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 04:09:47 -0800
Message-ID: <40019771-542e-442a-823a-071fd8a5aab5@intel.com>
Date: Tue, 9 Jan 2024 12:09:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 15/20] drm/xe: Allow GuC CT fast path and worker regardless
 of runtime_pm
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-16-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-16-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> First of all, this !ongoing && !from_runtime_functions seems a case that
> should not happen and be bad anyway. So, let's at least stop doing
> the workaround and if we find the case again we need to find in which
> outer bound we need to protect this access, or another real condition.
> 
> On top of that we are now protecting more outer bounds instead of
> a more granular memory access, so we might be fine. Or maybe ensure
> that we really shut off GuC on these conditions.
> 
> Anyway, let's proceed with our killing of the memory_access callers
> for now.

IIRC the main concern was that you could somehow get unsolicited CT 
messages from GuC, so we figured it was best to ensure the device is 
awake (and stays awake) before proceeding with accessing the device. Say 
device enters SUSPENDING just as we get/process an unsolicited CT 
message, or maybe CT request timed out waiting for response and caller 
bails out dropping rpm and maybe triggering async gt reset, but turns 
out GuC is just being slow and we do eventually get that response and 
process it? Is that type of stuff not possible?

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 40 ----------------------------------
>   1 file changed, 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4cde93c18a2d4..7e68ef69ca8d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1096,14 +1096,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>    */
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   {
> -	struct xe_device *xe = ct_to_xe(ct);
> -	bool ongoing;
>   	int len;
>   
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> -		return;
> -
>   	spin_lock(&ct->fast_lock);
>   	do {
>   		len = g2h_read(ct, ct->fast_msg, true);
> @@ -1111,9 +1105,6 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   			g2h_fast_path(ct, ct->fast_msg, len);
>   	} while (len > 0);
>   	spin_unlock(&ct->fast_lock);
> -
> -	if (ongoing)
> -		xe_device_mem_access_put(xe);
>   }
>   
>   /* Returns less than zero on error, 0 on done, 1 on more available */
> @@ -1144,36 +1135,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>   static void g2h_worker_func(struct work_struct *w)
>   {
>   	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> -	bool ongoing;
>   	int ret;
>   
> -	/*
> -	 * Normal users must always hold mem_access.ref around CT calls. However
> -	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
> -	 * at this stage we can't rely on mem_access.ref and even the
> -	 * callback_task will be different than current.  For such cases we just
> -	 * need to ensure we always process the responses from any blocking
> -	 * ct_send requests or where we otherwise expect some response when
> -	 * initiated from those callbacks (which will need to wait for the below
> -	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
> -	 * the device has suspended to the point that the CT communication has
> -	 * been disabled.
> -	 *
> -	 * If we are inside the runtime pm callback, we can be the only task
> -	 * still issuing CT requests (since that requires having the
> -	 * mem_access.ref).  It seems like it might in theory be possible to
> -	 * receive unsolicited events from the GuC just as we are
> -	 * suspending-resuming, but those will currently anyway be lost when
> -	 * eventually exiting from suspend, hence no need to wake up the device
> -	 * here. If we ever need something stronger than get_if_ongoing() then
> -	 * we need to be careful with blocking the pm callbacks from getting CT
> -	 * responses, if the worker here is blocked on those callbacks
> -	 * completing, creating a deadlock.
> -	 */
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> -		return;
> -
>   	do {
>   		mutex_lock(&ct->lock);
>   		ret = dequeue_one_g2h(ct);
> @@ -1187,9 +1150,6 @@ static void g2h_worker_func(struct work_struct *w)
>   			kick_reset(ct);
>   		}
>   	} while (ret == 1);
> -
> -	if (ongoing)
> -		xe_device_mem_access_put(ct_to_xe(ct));
>   }
>   
>   static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
