Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D3CC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 14:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB9710E025;
	Mon, 29 May 2023 14:46:51 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB5010E101
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685371609; x=1716907609;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/Hm+otsBUhUt0a0mn9hpLb8EoycMzYtebaQEi2lyvs4=;
 b=hysmP2RsJOUDAUOhPtjJJPrQQeHkfsT61z4yLtMgfiyeqKlPT9PKL+cM
 vrjlr2tvyz8Gmf3Suxvh79Hiiy/RNNtWtiJ+RS7WcMxvR/mS15NZtPAZa
 cihPM0uQLJaB2PG7wWEsAZbky3v2t0uwBdmQpKUIPGMuDPuT30nQwrtE+
 VIh+KA+mxCNUQMcViGzeplmMLY5/NBQVhAziuh+FxIbBjoRLbQvDhTVlC
 JxwK7Vdd5p0KSCen/lOPnD5xH60ZRP5m6OIOUPX34L95sLsEwuHnCRDP7
 bLIUGU7OqLV8OpX8A0Jij3hLcYn4LrT4kwznN3stK7DIRxDqBJkzScfQT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="382974858"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="382974858"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="880422733"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="880422733"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.136])
 ([10.249.254.136])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:46:25 -0700
Message-ID: <29af556c-008c-4c4c-421b-a08bb59ef3a7@linux.intel.com>
Date: Mon, 29 May 2023 16:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230526190609.61529-1-jose.souza@intel.com>
 <323d497f6ea67a8eb813ffac043393644c57fa67.camel@linux.intel.com>
 <cba9fb1a0374286bf847325d4d574e7d9b9b665d.camel@linux.intel.com>
 <376886023a6aed008f3e9e438722403a6278d348.camel@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <376886023a6aed008f3e9e438722403a6278d348.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Disable interruptable wait on
 xe_bo_move()
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


On 5/29/23 16:40, Souza, Jose wrote:
> On Mon, 2023-05-29 at 12:31 +0200, Thomas Hellström wrote:
>> On Mon, 2023-05-29 at 10:59 +0200, Thomas Hellström wrote:
>>> On Fri, 2023-05-26 at 12:06 -0700, José Roberto de Souza wrote:
>>>> All the Xe users of dma_resv_wait_timeout() also disable the
>>>> interruptable wait.
>>>> And doing so this avoids DRM_IOCTL_XE_EXEC fails when under memory
>>>> pressure.
>>> Interruptible waits are crucial for signal delivery latency and for
>>> user experience (being able to ctrl-c away from somtething that is
>>> stuck).
>>>
>>> Uninterruptible waits should only ever be used in situations where
>>> it's
>>> impossible to recover from an error, like in error or possibly
>>> destruction paths.
>>>
>>> In this case execbuf should be able to handle the -EINTR returned
>>> from
>>> the ioctl and restart. If it doesn't there's an error elsewhere.
>>>
>>> But Maarten had a patch to return the real error code rather than
>>> rewriting it to -ETIME.
> This patch? https://patchwork.freedesktop.org/patch/539633/?series=118428&rev=1
>
> This would cause it to return ERESTARTSYS to user-space.

ERESTARTSYS is a special error code that is never forwarded to 
user-space, the kernel's signal handling functionality converts it to 
EINTR iff there is a signal pending, and if not, just restarts the 
system call internally without returning to user-space. So user-space 
should just see the EINTR.

/Thomas


>
>>> /Thomas
>> Upon closer inspection of the code, that bool now set to true should
>> really be ctx->interruptible. Still Maarten's patch would be needed to
>> avoid the -ETIME rewrite, though.
>>
>> /Thomas
>>
>>
>>>
>>>
>>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bo.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 0db9c05097d07..6ed7e08269e82 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -609,7 +609,7 @@ static int xe_bo_move(struct ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>              new_mem->mem_type == XE_PL_SYSTEM) {
>>>>                  long timeout = dma_resv_wait_timeout(ttm_bo-
>>>>> base.resv,
>>>>                                                      
>>>> DMA_RESV_USAGE_BOOKKEEP,
>>>> -                                                    true,
>>>> +                                                    false,
>>>>                                                      
>>>> MAX_SCHEDULE_TIMEOUT);
>>>>                  if (timeout <= 0) {
>>>>                          ret = -ETIME;
