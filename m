Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7BFC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 09:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF710E216;
	Mon, 27 Nov 2023 09:41:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F68B10E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701078077; x=1732614077;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=6UgZjMFKACsPvBxtWsEeBuwljxFJzQseyWWlFEH9gQU=;
 b=AEk01DFQ5GHRO1RrNxYBJ/53x5i9gSejY88EZfuVJEwPm9DoDyyE9LG5
 hfHE2nu6GPOA9ztfo0OXpaDOKjyUP+BXHxS425ylRtYuzR1H+Y5UQP9A9
 Rkutnkwq2cQMO7yD62H7ub/2abe4e/4AmL2YBbPSsBT6kRDXggWbtT34P
 MKaRKjWT08udZKK0gsb14P5MWnXW3XUiBySaaB9svsc+USWSMenMwJ4oB
 cdstocGEva9kpQ5l299n9b2lQIkSaPJBovwcnjVBOPBlCSa0WGfMAYdR9
 KIoMb/RhoYqXtmoNOY5kTGe+Bg9AjKQPajg4iOOWYCUFdzEN8J05xWVuS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="392419717"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
 d="scan'208,217";a="392419717"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:41:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="717980137"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
 d="scan'208,217";a="717980137"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.187])
 ([10.249.254.187])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 01:41:15 -0800
Content-Type: multipart/alternative;
 boundary="------------2Di9hK094UU2gSEuFKW03Z2b"
Message-ID: <076f7618-4bf3-1b5c-cd47-b1f9bd835020@linux.intel.com>
Date: Mon, 27 Nov 2023 10:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-4-himal.prasad.ghimiray@intel.com>
 <797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com>
 <64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com>
Subject: Re: [Intel-xe] [RFC v2 3/6] drm/xe/xe2: Allocate extra pages for
 ccs during bo create.
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
--------------2Di9hK094UU2gSEuFKW03Z2b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/23 04:19, Ghimiray, Himal Prasad wrote:
>
>
> On 24-11-2023 16:39, Thomas Hellström wrote:
>> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>>> Each byte of CCS data now represents 512 bytes of main memory data.
>>> Allocate extra pages to handle ccs region for igfx too.
>>>
>>> Bspec:58796
>>>
>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray
>>> <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
>>>   drivers/gpu/drm/xe/xe_bo.c                | 15 ++++++---------
>>>   drivers/gpu/drm/xe/xe_device.c            |  2 +-
>>>   3 files changed, 8 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>> b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>> index 4402f72481dc..7f74592f99ce 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>>> @@ -16,7 +16,7 @@
>>>   #define   XY_CTRL_SURF_MOCS_MASK       GENMASK(31, 26)
>>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK     GENMASK(31, 28)
>>>   #define   NUM_CCS_BYTES_PER_BLOCK      256
>>> -#define   NUM_BYTES_PER_CCS_BYTE       256
>>> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)  (GRAPHICS_VER(_xe) >= 20 ?
>>> 512 : 256)
>>>   #define   NUM_CCS_BLKS_PER_XFER                1024
>>>   
>>>   #define XY_FAST_COLOR_BLT_CMD          (2 << 29 | 0x44 << 22)
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 4305f5cbc2ab..4730ee3c1012 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
>>> force_alloc)
>>>    * placed in system memory.
>>>    * @bo: The xe_bo
>>>    *
>>> - * If a bo has an allowable placement in XE_PL_TT memory, it can't
>>> use
>>> - * flat CCS compression, because the GPU then has no way to access
>>> the
>>> - * CCS metadata using relevant commands. For the opposite case, we
>>> need to
>>> - * allocate storage for the CCS metadata when the BO is not resident
>>> in
>>> - * VRAM memory.
>> Please extend modify this comment rather than deleting it
> Sure. Will address in next patch.
>>> - *
>>>    * Return: true if extra pages need to be allocated, false
>>> otherwise.
>>>    */
>>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>>   {
>>> -       return bo->ttm.type == ttm_bo_type_device &&
>>> -               !(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
>>> -               (bo->flags & XE_BO_CREATE_VRAM_MASK);
>>> +       struct xe_device *xe = xe_bo_device(bo);
>>> +
>>> +       return (xe_device_has_flat_ccs(xe) &&
>>> +               bo->ttm.type == ttm_bo_type_device &&
>>> +               ((IS_DGFX(xe) && (bo->flags &
>>> XE_BO_CREATE_VRAM_MASK)) ||
>> It looks like you have removed a restriction for DGFX here: If the BO
>> has SYSTEM set, then ccs pages are not needed.
>
> Is ((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK)) not suffice 
> to ensure
>
> that for DGFX BO is only in VRAM region ?
>
No. It can also has the the CREATE_SYSTEM_BIT set, and then the content 
can't be compressed.

/Thomas



>>> +               (!IS_DGFX(xe) && (bo->flags &
>>> XE_BO_CREATE_SYSTEM_BIT))));
>>>   }
>>>   
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index 07a3e4cf48d1..265f9ffc5323 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
>>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>>   {
>>>          return xe_device_has_flat_ccs(xe) ?
>>> -               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>> +               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>>>   }
>>>   
>>>   bool xe_device_mem_access_ongoing(struct xe_device *xe)
--------------2Di9hK094UU2gSEuFKW03Z2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/27/23 04:19, Ghimiray, Himal
      Prasad wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 24-11-2023 16:39, Thomas Hellström
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
        <pre class="moz-quote-pre" wrap="">On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Each byte of CCS data now represents 512 bytes of main memory data.
Allocate extra pages to handle ccs region for igfx too.

Bspec:58796

Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                | 15 ++++++---------
 drivers/gpu/drm/xe/xe_device.c            |  2 +-
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 4402f72481dc..7f74592f99ce 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
 #define   XY_CTRL_SURF_MOCS_MASK       GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK     GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK      256
-#define   NUM_BYTES_PER_CCS_BYTE       256
+#define   NUM_BYTES_PER_CCS_BYTE(_xe)  (GRAPHICS_VER(_xe) &gt;= 20 ?
512 : 256)
 #define   NUM_CCS_BLKS_PER_XFER                1024
 
 #define XY_FAST_COLOR_BLT_CMD          (2 &lt;&lt; 29 | 0x44 &lt;&lt; 22)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4305f5cbc2ab..4730ee3c1012 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2074,19 +2074,16 @@ int xe_bo_evict(struct xe_bo *bo, bool
force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't
use
- * flat CCS compression, because the GPU then has no way to access
the
- * CCS metadata using relevant commands. For the opposite case, we
need to
- * allocate storage for the CCS metadata when the BO is not resident
in
- * VRAM memory.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Please extend modify this comment rather than deleting it</pre>
      </blockquote>
      Sure. Will address in next patch.<br>
      <blockquote type="cite"
cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">- *
  * Return: true if extra pages need to be allocated, false
otherwise.
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-       return bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
-               !(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT) &amp;&amp;
-               (bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK);
+       struct xe_device *xe = xe_bo_device(bo);
+
+       return (xe_device_has_flat_ccs(xe) &amp;&amp;
+               bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
+               ((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_VRAM_MASK)) ||
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">It looks like you have removed a restriction for DGFX here: If the BO
has SYSTEM set, then ccs pages are not needed.</pre>
      </blockquote>
      <p>Is <span style="white-space: pre-wrap">((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; </span><span style="white-space: pre-wrap">XE_BO_CREATE_VRAM_MASK)) not suffice to ensure </span></p>
      <p><span style="white-space: pre-wrap">that for DGFX BO is only in VRAM region ? </span></p>
    </blockquote>
    <p>No. It can also has the the CREATE_SYSTEM_BIT set, and then the
      content can't be compressed.</p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:64d14c6f-ceef-4193-9a35-bfd1f6e7c9da@intel.com">
      <p><span style="white-space: pre-wrap"></span></p>
      <blockquote type="cite"
cite="mid:797b983ed6313c2866c8b02aa73a5cab1fc4d4a3.camel@linux.intel.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+               (!IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp;
XE_BO_CREATE_SYSTEM_BIT))));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.c
b/drivers/gpu/drm/xe/xe_device.c
index 07a3e4cf48d1..265f9ffc5323 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -551,7 +551,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
        return xe_device_has_flat_ccs(xe) ?
-               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+               DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------2Di9hK094UU2gSEuFKW03Z2b--
