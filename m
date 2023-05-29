Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33087C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE610E0C8;
	Mon, 29 May 2023 15:21:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808E210E2D5
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685373676; x=1716909676;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MQgRPRcfn0OoiZRX/Z9TNdurI+1XeSIeq8xQDUqp374=;
 b=IlVkmUOcw5qT3XNZu6c9CvoVsx6YK96+BO5MlCpJGMjnCYTFTVBssk2V
 Rv79HktFkZnS4ynQL/13ncuEPGA93CguPeXbGaD4lTUBSf6c1Uo2sAkuv
 DWL32OPeamNTg493BSTJ1XBCi8/AguVmksSHEqw0JXUQ44jqGqrNyavUb
 UolxMliitvwiWGMgbkm0OsXu7U/TuFQSxURcmUyRhkKoSKYGnr3kLZlpj
 D9znyeDTkkMRtUKqAKL4DEyFKKGPuXXlfnCt6ti848YCc6baO5mFynVv5
 6TfhG/E72ooz3049eVwmUv14KRrhIbrQiX7+5KTQRHB7SLIYNU+Af+VJX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357980781"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="357980781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706093320"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="706093320"
Received: from olhomerx-mobl.ger.corp.intel.com (HELO [10.252.46.198])
 ([10.252.46.198])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:21:14 -0700
Message-ID: <2654aef0-7e6a-f82c-3cdd-ec3a4a999632@linux.intel.com>
Date: Mon, 29 May 2023 17:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Christopher Snowhill <kode54@gmail.com>,
 "Souza, Jose" <jose.souza@intel.com>
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-6-maarten.lankhorst@linux.intel.com>
 <97d4425bbb46b19cf48dd04594c9eb3c2f0c5662.camel@intel.com>
 <CA+aRtuYGnrdL_o+iO=Xj9ikRA_ddtGf8jhpuhPcXJN63qUK4-w@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CA+aRtuYGnrdL_o+iO=Xj9ikRA_ddtGf8jhpuhPcXJN63qUK4-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 5/5] drm/xe: Return the correct error when
 dma_resv_wait_timeout fails
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-05-27 07:17, Christopher Snowhill wrote:
> On Fri, May 26, 2023 at 12:16 PM Souza, Jose <jose.souza@intel.com> wrote:
>> On Fri, 2023-05-26 at 14:11 +0200, Maarten Lankhorst wrote:
>>> We call dma_resv_wait_timeout with MAX_SCHEDULE_TIMEOUT, so it can
>>> never return -ETIME. It will however fail if interrupted, so in that
>>> case return the error.
>>>
>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
>>> ---
>>>  drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 8735facb1cf9..77ba8492bd90 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -611,8 +611,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>>                                                    DMA_RESV_USAGE_BOOKKEEP,
>>>                                                    true,
>>>                                                    MAX_SCHEDULE_TIMEOUT);
>>> -             if (timeout <= 0) {
>>> -                     ret = -ETIME;
>>> +             if (timeout < 0) {
>>> +                     ret = timeout;
>>>                       goto out;
>> 0 means timeout, so what this is doing is allowing a error to be treated a success.
>> I understanding that is should never happen with MAX_SCHEDULE_TIMEOUT but I would rather leave this as "<=" just in case there is a bug in
>> dma_resv_wait_timeout() that ignores the MAX_SCHEDULE_TIMEOUT.
> If 0 means timeout, and < 0 means other error, then perhaps it should
> return -ETIME for 0, otherwise pass on the error?

No other code tests 0 for MAX_SCHEDULE_TIMEOUT, it's LONG_MAX/HZ. So even on 32-bits, it would take 12.4 days.

Assuming a timeout happens after that time, I think it's safe to just continue..

On 64-bits, I think the system has to move between solar systems first.

~Maarten

