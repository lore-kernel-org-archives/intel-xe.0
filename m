Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04F9CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A87C10EBCD;
	Fri, 29 Aug 2025 14:08:34 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444E810EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:08:33 +0000 (UTC)
Message-ID: <e42df19b-a82d-4893-be03-2843dd2a56d1@lankhorst.se>
Date: Fri, 29 Aug 2025 16:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/pcode: Refactor pcode_try_request() to use
 poll_timeout_us()
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-4-9832ccd1c8b1@intel.com>
 <1896b8fb-74de-4549-a531-d76989dcbfb9@lankhorst.se>
 <ljtjibcl6ivqeva66d2rsofgwu7o4vt4zrx7qumb3s5gw65vbv@mclxcipdw5jf>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <ljtjibcl6ivqeva66d2rsofgwu7o4vt4zrx7qumb3s5gw65vbv@mclxcipdw5jf>
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



Den 2025-08-29 kl. 15:53, skrev Lucas De Marchi:
> On Fri, Aug 29, 2025 at 01:35:12PM +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>>> Refactor the hand rolled wait to use poll_timeout_us(). Do a 20us wait
>>> between reads instead exponentially growing from 10.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pcode.c | 33 ++++++++++++++-------------------
>>>  1 file changed, 14 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>> index 6a7ddb9005f99..7bf5d3b9c0cc1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>> @@ -5,7 +5,7 @@
>>>
>>>  #include "xe_pcode.h"
>>>
>>> -#include <linux/delay.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/errno.h>
>>>  #include <linux/error-injection.h>
>>>
>>> @@ -135,28 +135,23 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>>>                   u32 request, u32 reply_mask, u32 reply,
>>>                   u32 *status, bool atomic, int timeout_us, bool locked)
>>>  {
>>> -    int slept, wait = 10;
>>> +    int (*req)(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>>> +           unsigned int timeout_ms, bool return_data,
>>> +           bool atomic);
>>> +    int ret;
>> if (locked) lockdep_assert_held(&tile->pcode.lock);
>>
>> and then use __pcode_mailbox_rw unconditionally?
> 
> yeah, that would be much better indeed. But it seeems the locked arg
> has different meanings here. In xe_pcode_ready() we do:
> 
>     if (locked)
>         mutex_lock(&tile->pcode.lock);
> 
> That looks like a bug introduced in commit 933fd5ffaf87 ("drm/xe: check
> pcode init status only on root gt of root tile")? It doesn't match its
> kernel-doc neither in that function.
Yeah that was what I was looking at, the 'locked' here means 'require locked access',
so the mutex_lock() appears correct at first glance.

