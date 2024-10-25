Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A92ED149C1
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 16:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BA110EB15;
	Fri, 25 Oct 2024 16:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxmOb3kA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF8010EB15
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729872414; x=1761408414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=BuoXf3yYBlvt4i5uCyjtCb8dniu+qPWz43TGgFz0n30=;
 b=KxmOb3kAeVbf3vWa5+dJWOEbiAoRYkJFdGpTCrdgEHQnUWzcI6vu0FvM
 1gY/b7a2nZ+Y1HsOSlxWgef8mH4W3lteU3grl5fXlqdXCP8ECXdFBT8P2
 gjrUB0bv4hA+cVpmJB12msmORaJ8pHf9ACf1TPAocu9gaKGAZvMguyqzM
 BhwnlyMEpizV8R6HTxuW8XsAWHJWOdETCBgCTByz7c1c0v+nRe1BeCQHW
 FBv5FaUW3PGiG+/nuHQyCWvL7+mN0vnQgR9tRM7U0/pce3dZdpqI+J8v5
 MpqUqetOft2yHKDewxPuSMv/Otz1OghzWV2gh2397zgsdr8yfUIm1HEmF w==;
X-CSE-ConnectionGUID: xSy2zkvtRVWh50tN7XIA2g==
X-CSE-MsgGUID: E/6d5BgxSFGBciZE9p5GrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33350524"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208,217";a="33350524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 09:06:54 -0700
X-CSE-ConnectionGUID: MHMzZtN2Sp2gFJMbMvvzDQ==
X-CSE-MsgGUID: PwwQRTPOSc+RRC53a2UJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208,217";a="80878344"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.87])
 ([10.245.197.87])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 09:06:51 -0700
Content-Type: multipart/alternative;
 boundary="------------pFF0JE1r9YTeoF2KJONB9eGF"
Message-ID: <7ffb544e-059e-49ea-a121-485154496bc1@linux.intel.com>
Date: Fri, 25 Oct 2024 18:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
References: <20241024151815.929142-1-nirmoy.das@intel.com>
 <ed863a65-5238-4bb9-9173-d297ed953d1f@intel.com>
 <ZxqCXUp+0EWLVX7u@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZxqCXUp+0EWLVX7u@DUT025-TGLU.fm.intel.com>
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

This is a multi-part message in MIME format.
--------------pFF0JE1r9YTeoF2KJONB9eGF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/24/2024 7:22 PM, Matthew Brost wrote:
> On Thu, Oct 24, 2024 at 10:14:21AM -0700, John Harrison wrote:
>> On 10/24/2024 08:18, Nirmoy Das wrote:
>>> Flush xe ordered_wq in case of ufence timeout which is observed
>>> on LNL and that points to the recent scheduling issue with E-cores.
>>>
>>> This is similar to the recent fix:
>>> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
>>> response timeout") and should be removed once there is E core
>>> scheduling fix.
>>>
>>> v2: Add platform check(Himal)
>>>      s/__flush_workqueue/flush_workqueue(Jani)
>>>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.11+
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> index f5deb81eba01..78a0ad3c78fe 100644
>>> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
>>> @@ -13,6 +13,7 @@
>>>   #include "xe_device.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_macros.h"
>>> +#include "compat-i915-headers/i915_drv.h"
>>>   #include "xe_exec_queue.h"
>>>   static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>>> @@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>>>   		}
>>>   		if (!timeout) {
>>> +			if (IS_LUNARLAKE(xe)) {
>>> +				/*
>>> +				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
>>> +				 * worker in case of g2h response timeout")
>>> +				 *
>>> +				 * TODO: Drop this change once workqueue scheduling delay issue is
>>> +				 * fixed on LNL Hybrid CPU.
>>> +				 */
>>> +				flush_workqueue(xe->ordered_wq);
>> If we are having multiple instances of this workaround, can we wrap them up
>> in as 'LNL_FLUSH_WORKQUEUE(q)' or some such? Put the IS_LNL check inside the
>> macro and make it pretty obvious exactly where all the instances are by
>> having a single macro name to search for.
>>
> +1, I think Lucas is suggesting something similar to this on the chat to
> make sure we don't lose track of removing these W/A when this gets
> fixed.
>
> Matt


Sounds good. I will add LNL_FLUSH_WORKQUEUE() and use that for all the places we need this WA.

Regards,

Nirmoy

>
>> John.
>>
>>> +				err = do_compare(addr, args->value, args->mask, args->op);
>>> +				if (err <= 0)
>>> +					break;
>>> +			}
>>>   			err = -ETIME;
>>>   			break;
>>>   		}
--------------pFF0JE1r9YTeoF2KJONB9eGF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/24/2024 7:22 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ZxqCXUp+0EWLVX7u@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Oct 24, 2024 at 10:14:21AM -0700, John Harrison wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 10/24/2024 08:18, Nirmoy Das wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Flush xe ordered_wq in case of ufence timeout which is observed
on LNL and that points to the recent scheduling issue with E-cores.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

v2: Add platform check(Himal)
     s/__flush_workqueue/flush_workqueue(Jani)

Cc: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v6.11+
Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754</a>
Suggested-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Reviewed-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
  drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
  1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f5deb81eba01..78a0ad3c78fe 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
  #include "xe_device.h"
  #include "xe_gt.h"
  #include "xe_macros.h"
+#include "compat-i915-headers/i915_drv.h"
  #include "xe_exec_queue.h"
  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
@@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
  		}
  		if (!timeout) {
+			if (IS_LUNARLAKE(xe)) {
+				/*
+				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
+				 * worker in case of g2h response timeout")
+				 *
+				 * TODO: Drop this change once workqueue scheduling delay issue is
+				 * fixed on LNL Hybrid CPU.
+				 */
+				flush_workqueue(xe-&gt;ordered_wq);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">If we are having multiple instances of this workaround, can we wrap them up
in as 'LNL_FLUSH_WORKQUEUE(q)' or some such? Put the IS_LNL check inside the
macro and make it pretty obvious exactly where all the instances are by
having a single macro name to search for.

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
+1, I think Lucas is suggesting something similar to this on the chat to
make sure we don't lose track of removing these W/A when this gets
fixed.

Matt</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Sounds good. I will add <span style="white-space: pre-wrap">LNL_FLUSH_WORKQUEUE() and use that for all the places we need this WA.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite"
      cite="mid:ZxqCXUp+0EWLVX7u@DUT025-TGLU.fm.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">John.

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+				err = do_compare(addr, args-&gt;value, args-&gt;mask, args-&gt;op);
+				if (err &lt;= 0)
+					break;
+			}
  			err = -ETIME;
  			break;
  		}
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------pFF0JE1r9YTeoF2KJONB9eGF--
