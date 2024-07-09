Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ECBC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283BE10E60A;
	Tue,  9 Jul 2024 16:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWnlqE7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEAB10E60A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720543360; x=1752079360;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=XhxIJez3bYVKU+zCMY0kmFMd+Dg6gAlg/jo0JmTnGuo=;
 b=MWnlqE7ifjVQilox89Ncn6h9rT3bWCOlp00P9K8aI6/qQDEo01lfeLd8
 7xxO9sbn1yfZk+iLKOX2gKBn4tYK8uXZop6c5u1l1zxf9t64QteaYh0tL
 fFiU19+5ZRh87WHUJc4y52jKDHybQWg8okFdo0F2E1o7CFF1kzkOwBhm+
 5w8gAr8puCGlhIoHNuTcb9hU3+Kw5txYE04nfIz8EH5iC685KYis+C1op
 DxqXjoiSD79781d3L8sPOSboZ0aEcGera6IJBw86JXq/6IYwKnhvLepWz
 HQaDUtfs5ejK8AjHfCsLWcqy/EuOM95P5U48MSgFVe3LyFJESZQgD5rL1 w==;
X-CSE-ConnectionGUID: wWeBFLfrQmutQneOUTHDVA==
X-CSE-MsgGUID: ZzNzhbzVQiOwom87oWQeYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17950911"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208,217";a="17950911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:42:39 -0700
X-CSE-ConnectionGUID: 8h9LaxgfRE+UtTrRmXVmNg==
X-CSE-MsgGUID: iiiewGaxTT2O70WYaBtJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208,217";a="85441313"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:42:37 -0700
Content-Type: multipart/alternative;
 boundary="------------9r4a075oLsVVmegbSPvRorQG"
Message-ID: <e96424e6-31ef-4b50-92cf-dfb3349a1a6f@linux.intel.com>
Date: Tue, 9 Jul 2024 18:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Proper GT TLB invalidation layering and new
 coalescing feature.
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <6aba8e53-55fd-4573-ad0c-e8c62ebe1297@intel.com>
 <b008d72f-8123-4f3e-827f-9e5fd9368983@linux.intel.com>
 <Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com>
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
--------------9r4a075oLsVVmegbSPvRorQG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/9/2024 6:35 PM, Matthew Brost wrote:
> On Tue, Jul 09, 2024 at 06:08:54PM +0200, Nirmoy Das wrote:
>> On 7/9/2024 11:57 AM, Matthew Auld wrote:
>>> Hi,
>>>
>>> On 08/07/2024 05:03, Matthew Brost wrote:
>>>> While debuging [1] an issue was identified in which if too many GT TLB
>>>> invalidations are issued to the GuC, the GuC can get overwhelmed to the
>>>> point scheduling of jobs starts to stall. To avoid this, hold and
>>>> coalesce GT TLB invalidations in the KMD if a watermark of pending
>>>> invalidations is past. Add gitlab for this issue has also been opened
>>>> [2].
>>>>
>>>> Layering issues with GT TLB invalidations are known [3] which needed to
>>>> be fixed first before adding this new feature.
>>>>
>>>> - Patches 1-8 fix the layering.
>>>> - Patches 9-11 add coalescing feature.
>>>>
>>>> We could merge these two as seperate series if needed.
>>>>
>>>> CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
>>>> TLB invalidation issues in the past.
>>> Maybe worth mentioning for [1], we try to process TLB invalidations
>>> directly from the irq, however we also only process the g2h queue
>>> in-order, so if there is something other than TLB invalidation or fault
>>> earlier in the queue then we do nothing useful from the irq and just
>>> return, that is until the wq can eventually process those earlier items
>>> that couldn't be processed directly from the irq. In the past
>> Seen this recently :
>>
>> <3> [3763.731822] xe 0000:03:00.0: [drm] *ERROR* GT0: g2h outstanding: 611
>> <snip>
>> <6> [3727.857273] [IGT] xe_evict: executing
>> <3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB
>> invalidation time'd out, seqno=26858, recv=2685
> Missing the last digit of '2685'?
oops, yes:
<3> [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB 
invalidation time'd out, seqno=26858, recv=26857


>
>> Which I think fits your description. This series should help but not sure
>> how much.
>>
>  From arch level if this is a continued problem, perhaps we should ask
> for a dedicated G2H queue for TLB invalidation done responses. It seems
> like a fairly reasonable ask to me as TLB invalidations really shouldn't
> get stuck behind other G2H processing...

Yes, that should work really well. I am currently trying out this series 
but haven't manged to reproduce the issue without/without the series 
reliably yet.


Regards,

Nirmoy

> Matt
>
>> Regards,
>>
>> Nirmoy
>>
>>> I have seen TLB timeouts where the TLB invalidation is clearly in the
>>> g2h queue (and has been for a while), but is stuck behind something
>>> earlier in the queue that needs the wq, but system is under such a heavy
>>> load that the wq can't be scheduled in a timely manner.
>>>
>>>> v2:
>>>>    - Fix CI issues
>>>>    - Clean up some of the series / patch structure
>>>>
>>>> Matt
>>>>
>>>> [1]
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497
>>>> [2]https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162
>>>> [3]https://patchwork.freedesktop.org/series/133001/
>>>>
>>>> Matthew Brost (11):
>>>>     drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
>>>>     drm/xe: Drop xe_gt_tlb_invalidation_wait
>>>>     drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
>>>>     drm/xe: Add tlb_invalidation.seqno_lock
>>>>     drm/xe: Add xe_gt_tlb_invalidation_done_handler
>>>>     drm/xe: Add send tlb invalidation helpers
>>>>     drm/xe: Add xe_guc_tlb_invalidation layer
>>>>     drm/xe: Add multi-client support for GT TLB invalidations
>>>>     drm/xe: Add GT TLB invalidation coalescing
>>>>     drm/xe: Add GT TLB invalidation coalesce tracepoints
>>>>     drm/xe: Add GT TLB invalidation watermark debugfs
>>>>
>>>>    drivers/gpu/drm/xe/Makefile                   |   1 +
>>>>    drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
>>>>    drivers/gpu/drm/xe/xe_device.c                |   3 +
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |   5 +
>>>>    drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
>>>>    drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
>>>>    .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
>>>>    drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
>>>>    drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
>>>>    drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
>>>>    drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
>>>>    drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
>>>>    drivers/gpu/drm/xe/xe_trace.h                 |  10 +
>>>>    drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
>>>>    drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
>>>>    17 files changed, 801 insertions(+), 279 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h
>>>>
--------------9r4a075oLsVVmegbSPvRorQG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/9/2024 6:35 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Jul 09, 2024 at 06:08:54PM +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 7/9/2024 11:57 AM, Matthew Auld wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi,

On 08/07/2024 05:03, Matthew Brost wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">While debuging [1] an issue was identified in which if too many GT TLB
invalidations are issued to the GuC, the GuC can get overwhelmed to the
point scheduling of jobs starts to stall. To avoid this, hold and
coalesce GT TLB invalidations in the KMD if a watermark of pending
invalidations is past. Add gitlab for this issue has also been opened
[2].

Layering issues with GT TLB invalidations are known [3] which needed to
be fixed first before adding this new feature.

- Patches 1-8 fix the layering.
- Patches 9-11 add coalescing feature.

We could merge these two as seperate series if needed.

CCing various stakeholders (Farah, Michal, Nirmoy) which have raised GT
TLB invalidation issues in the past.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Maybe worth mentioning for [1], we try to process TLB invalidations
directly from the irq, however we also only process the g2h queue
in-order, so if there is something other than TLB invalidation or fault
earlier in the queue then we do nothing useful from the irq and just
return, that is until the wq can eventually process those earlier items
that couldn't be processed directly from the irq. In the past
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Seen this recently :

&lt;3&gt; [3763.731822] xe 0000:03:00.0: [drm] *ERROR* GT0: g2h outstanding: 611
&lt;snip&gt;
&lt;6&gt; [3727.857273] [IGT] xe_evict: executing
&lt;3&gt; [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB
invalidation time'd out, seqno=26858, recv=2685
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Missing the last digit of '2685'?</pre>
    </blockquote>
    oops, yes: <br>
    <div
style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span
      id="dmesg-warnings1" class="dmesg dmesg-warnings"
style="font-family: monospace; color: orangered; font-weight: bold; white-space: pre; overflow-wrap: normal;">&lt;3&gt; [3730.165480] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB invalidation time'd out, seqno=26858, recv=26857</span></div>
    <br class="Apple-interchange-newline">
    <br>
    <blockquote type="cite"
      cite="mid:Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Which I think fits your description. This series should help but not sure
how much.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
From arch level if this is a continued problem, perhaps we should ask
for a dedicated G2H queue for TLB invalidation done responses. It seems
like a fairly reasonable ask to me as TLB invalidations really shouldn't
get stuck behind other G2H processing...
</pre>
    </blockquote>
    <p>Yes, that should work really well. I am currently trying out this
      series but haven't manged to reproduce the issue without/without
      the series reliably yet. <br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:Zo1m7r+f0kfXsUSC@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">
Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,

Nirmoy

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have seen TLB timeouts where the TLB invalidation is clearly in the
g2h queue (and has been for a while), but is stuck behind something
earlier in the queue that needs the wq, but system is under such a heavy
load that the wq can't be scheduled in a timely manner.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
v2:
  - Fix CI issues
  - Clean up some of the series / patch structure

Matt

[1]
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799#note_2449497</a>
[2] <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162</a>
[3] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/133001/">https://patchwork.freedesktop.org/series/133001/</a>

Matthew Brost (11):
   drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
   drm/xe: Drop xe_gt_tlb_invalidation_wait
   drm/xe: s/tlb_invalidation.lock/tlb_invalidation.fence_lock
   drm/xe: Add tlb_invalidation.seqno_lock
   drm/xe: Add xe_gt_tlb_invalidation_done_handler
   drm/xe: Add send tlb invalidation helpers
   drm/xe: Add xe_guc_tlb_invalidation layer
   drm/xe: Add multi-client support for GT TLB invalidations
   drm/xe: Add GT TLB invalidation coalescing
   drm/xe: Add GT TLB invalidation coalesce tracepoints
   drm/xe: Add GT TLB invalidation watermark debugfs

  drivers/gpu/drm/xe/Makefile                   |   1 +
  drivers/gpu/drm/xe/xe_debugfs.c               |  38 ++
  drivers/gpu/drm/xe/xe_device.c                |   3 +
  drivers/gpu/drm/xe/xe_device_types.h          |   5 +
  drivers/gpu/drm/xe/xe_ggtt.c                  |  21 +-
  drivers/gpu/drm/xe/xe_ggtt_types.h            |   5 +
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 641 ++++++++++++------
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  26 +-
  .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  41 ++
  drivers/gpu/drm/xe/xe_gt_types.h              |  43 +-
  drivers/gpu/drm/xe/xe_guc_ct.c                |   2 +-
  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c  | 145 ++++
  drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h  |  18 +
  drivers/gpu/drm/xe/xe_pt.c                    |  33 +-
  drivers/gpu/drm/xe/xe_trace.h                 |  10 +
  drivers/gpu/drm/xe/xe_vm.c                    |  45 +-
  drivers/gpu/drm/xe/xe_vm_types.h              |   3 +
  17 files changed, 801 insertions(+), 279 deletions(-)
  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.c
  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_invalidation.h

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9r4a075oLsVVmegbSPvRorQG--
