Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84008CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E24C10EBCC;
	Fri, 29 Aug 2025 14:05:55 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AB010EBCC
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:05:53 +0000 (UTC)
Message-ID: <36736f87-009b-4b0d-80f1-4034bac7fe48@lankhorst.se>
Date: Fri, 29 Aug 2025 16:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/device: Use poll_timeout_us() to wait for lmem
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-1-9832ccd1c8b1@intel.com>
 <0249c60d-5232-4531-93d9-2a20e5eda7a4@lankhorst.se>
 <fn2cfyx5yhi6aloybfd5lhjfksgj6ywbigjl3ikvl5bwjgh52l@ae6xb34s6i6q>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <fn2cfyx5yhi6aloybfd5lhjfksgj6ywbigjl3ikvl5bwjgh52l@ae6xb34s6i6q>
Content-Type: text/plain; charset=UTF-8
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



Den 2025-08-29 kl. 15:35, skrev Lucas De Marchi:
> On Fri, Aug 29, 2025 at 01:17:13PM +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>>> Now that there's a generic poll_timeout_us(), use it to wait for
>>> LMEM_INIT in GU_CNTL.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.c | 50 +++++++++++++++++++-----------------------
>>>  1 file changed, 23 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 9e4773a17ef8d..ffcd3d04ebbf7 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/aperture.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/fault-inject.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/units.h>
>>>
>>>  #include <drm/drm_atomic_helper.h>
>>> @@ -636,7 +637,9 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>>
>>>  static int wait_for_lmem_ready(struct xe_device *xe)
>>>  {
>>> -    unsigned long timeout, start;
>>> +    unsigned long prev_jiffies;
>>> +    const unsigned long TIMEOUT_SEC = 60;
>>> +    int ret;
>>>
>>>      if (!IS_DGFX(xe))
>>>          return 0;
>>> @@ -648,35 +651,28 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>>          return 0;
>>>
>>>      drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
>>> +    prev_jiffies = jiffies;
>>>
>>> -    start = jiffies;
>>> -    timeout = start + secs_to_jiffies(60); /* 60 sec! */
>>> -
>>> -    do {
>>> -        if (signal_pending(current))
>>> -            return -EINTR;
>>> -
>>> -        /*
>>> -         * The boot firmware initializes local memory and
>>> -         * assesses its health. If memory training fails,
>>> -         * the punit will have been instructed to keep the GT powered
>>> -         * down.we won't be able to communicate with it
>>> -         *
>>> -         * If the status check is done before punit updates the register,
>>> -         * it can lead to the system being unusable.
>>> -         * use a timeout and defer the probe to prevent this.
>>> -         */
>>> -        if (time_after(jiffies, timeout)) {
>>> -            drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
>>> -            return -EPROBE_DEFER;
>>> -        }
>>> -
>>> -        msleep(20);
>>> -
>>> -    } while (!verify_lmem_ready(xe));
>>> +    /*
>>> +     * The boot firmware initializes local memory and
>>> +     * assesses its health. If memory training fails,
>>> +     * the punit will have been instructed to keep the GT powered
>>> +     * down.we won't be able to communicate with it
>>> +     *
>>> +     * If the status check is done before punit updates the register,
>>> +     * it can lead to the system being unusable.
>>> +     * use a timeout and defer the probe to prevent this.
>>> +     */
>>> +    ret = poll_timeout_us(ret = verify_lmem_ready(xe), ret,
>>> +                  20 * USEC_PER_MSEC,
>>> +                  TIMEOUT_SEC * USEC_PER_SEC, true);
>>> +    if (ret) {
>> The 'ret' re-use is a bit confusing here, on a quick read it looks like the if (ret) would also be true when verify_lmem_ready is set.
>>
>> Furthermore we're losing the signal pending check, which is useful when aborting module load early, instead of waiting the whole minute. This is saves minutes when debugging memory initialisation timeouts.
>>
>> Perhaps
>> ret = poll_timeout_us({ if (signal_pending(current)) return -EINTR; }, verify_lmem_ready(xe), constants) ?
> 
> I thought about adding a check inside the function called rather then
> use this syntax above, but ended up forgetting to add it in
> verify_lmem_ready().
> 
> As per return value, since poll_timeout_us() is a wrapper wait around
> the check for readiness, I don't think it's bad to re-use the control
> variable to break out of the loop.
> 
> Looking at other poll_timeout_us() users I prefer to keep the first arg
> as the op and the second as the condition, rather than inserting a
> return in the first arg that will actually return from the caller
> function, not from poll_timeout_us(). That I think is a much more
> surprising effect than the ret re-use.I think specifically for 1/4, will make sense to just keep the original open coding, as this error cannot be handled like that.

Kind regards,
~Maarten Lankhorst 
