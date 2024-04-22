Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B82FC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 08:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD6E10E6BE;
	Mon, 22 Apr 2024 08:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8t+MHR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E91B10E6BE
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713775991; x=1745311991;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=Unj3zT1pxYsehJt0DE3mgk1QKHCKbsFiUjQAfjnmNBg=;
 b=n8t+MHR+ARAFDi7ydCNjEDa0sYrcJtP1pacBL7tNiQXWLzEBSma+vB0+
 HTMIwwgub/V4DriIJndRrSfBQE+uby3LvBgoQj69g1Ua96QSzvkSwSa/r
 N9z+CPeLpY3J3HsU95oA0az89JerRVDy+VF1a4GCrjll4NIJ5f5eIQmUf
 q7sfR3UnYwWOALNALhfb4VAJ7SYMwoBaWrBz8PNaFarPdlgcclLrAaQHf
 ANTit3nnbyC5t54HY6fXpu2xDR+wIOfHKsZ2LSpumv/qG99tqnUlSYW/R
 y7O3bSdXbSiElhp0CpG11y8JJEB6UxP1f1FQ1G+aOiS+MaH76uqylhxy2 g==;
X-CSE-ConnectionGUID: N89nz4M7QaGc3lgacZYVrA==
X-CSE-MsgGUID: 4DA0N12YQcu9TPApcEdRjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="26753603"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208,217";a="26753603"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:53:10 -0700
X-CSE-ConnectionGUID: NKLQjUu2RC+E5aVK468NFA==
X-CSE-MsgGUID: l8pYCjYdT3WiwJBOcfEXHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208,217";a="28414117"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.180])
 ([10.246.48.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:53:04 -0700
Content-Type: multipart/alternative;
 boundary="------------J0TYCbiFySwtYZqh1IQuo9BE"
Message-ID: <84ad50d6-2668-4269-b6b0-72da57b0b324@linux.intel.com>
Date: Mon, 22 Apr 2024 10:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-8-nirmoy.das@intel.com>
 <109eb32e-99c9-49a0-8166-42ed59e67662@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <109eb32e-99c9-49a0-8166-42ed59e67662@intel.com>
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
--------------J0TYCbiFySwtYZqh1IQuo9BE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lionel,

On 4/19/2024 9:08 AM, Lionel Landwerlin wrote:
> On 15/04/2024 17:52, Nirmoy Das wrote:
>> Add a query flag for xe->info.has_device_atomics_on_smem
>> as this is platform dependent. This flag can be use to inform
>> whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
>> applied for a given platform.
>>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_query.c | 3 +++
>>   include/uapi/drm/xe_drm.h     | 5 ++++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index df407d73e5f5..43272fdd5442 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -336,6 +336,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
>> +	if (xe->info.has_device_atomics_on_smem)
>> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM;
>>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index ca4447e10ac9..80fff6fe3199 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
>>    *
>>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
>>    *      has usable VRAM
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM - Flag is set if the device
>> + *      supports device atomics on system memory
>>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>    *    required by this device, typically SZ_4K or SZ_64K
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> @@ -404,7 +406,8 @@ struct drm_xe_query_config {
>>   
>>   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>>   #define DRM_XE_QUERY_CONFIG_FLAGS			1
>> -	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 << 0)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 << 1)
>
>
> I find this flag a bit confusing, because it would imply that 
> platforms that do not report this flag don't suppoort atomics on smem.
>
> But for DG2/MTL/TGL (if officially supported by Xe), that's not the 
> case, yet they do support this.
>
This query should return true for DG2/MTL/TGL but I missed setting 
has_device_atomics_on_smem on those platform.

>
> Maybe renaming this 
> toDRM_XE_QUERY_CONFIG_FLAG_HAS_EXPLICIT_DEV_ATOMIC_ON_SMEM would make 
> more sense.
>
> Meaning the platform requires a specific vm_bind flag to get atomics 
> working on SMEM only BO.
>
We could do that but we would need another query flag to indicate when a 
platform doesn't support dev atomics SMEM only BO at all like PVC.

So I think let's keep it DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM 
which will return true for all platform but PVC at this moment.

On platforms that doesn't have the new PTE bit, this flag will have no 
effect. Let me know what do you think?

Regards,

Nirmoy

> -Lionel
>
>
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>
>
--------------J0TYCbiFySwtYZqh1IQuo9BE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Lionel,<br>
    </p>
    <div class="moz-cite-prefix">On 4/19/2024 9:08 AM, Lionel Landwerlin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:109eb32e-99c9-49a0-8166-42ed59e67662@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 15/04/2024 17:52, Nirmoy Das
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20240415145214.25641-8-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">Add a query flag for xe-&gt;info.has_device_atomics_on_smem
as this is platform dependent. This flag can be use to inform
whether DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be effectively
applied for a given platform.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E"
        href="mailto:nirmoy.das@intel.com" moz-do-not-send="true">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 include/uapi/drm/xe_drm.h     | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index df407d73e5f5..43272fdd5442 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -336,6 +336,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)-&gt;mem.vram.usable_size)
 		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
+	if (xe-&gt;info.has_device_atomics_on_smem)
+		config-&gt;info[DRM_XE_QUERY_CONFIG_FLAGS] |=
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
 		xe-&gt;info.vram_flags &amp; XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
 	config-&gt;info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe-&gt;info.va_bits;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ca4447e10ac9..80fff6fe3199 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM - Flag is set if the device
+ *      supports device atomics on system memory
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -404,7 +406,8 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 &lt;&lt; 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 &lt;&lt; 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 &lt;&lt; 1)</pre>
      </blockquote>
      <p><br>
      </p>
      <p>I find this flag a bit confusing, because it would imply that
        platforms that do not report this flag don't suppoort atomics on
        smem.</p>
      <p>But for DG2/MTL/TGL (if officially supported by Xe), that's not
        the case, yet they do support this.</p>
    </blockquote>
    <p>This query should return true for DG2/MTL/TGL but I missed
      setting <span style="white-space: pre-wrap">has_device_atomics_on_smem on those platform.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:109eb32e-99c9-49a0-8166-42ed59e67662@intel.com">
      <p><br>
      </p>
      <p>Maybe renaming this to<span style="white-space: pre-wrap">DRM_XE_QUERY_CONFIG_FLAG_HAS_EXPLICIT_DEV_ATOMIC_ON_SMEM would make more sense.</span></p>
      <p><span style="white-space: pre-wrap">Meaning the platform requires a specific vm_bind flag to get atomics working on SMEM only BO.</span></p>
    </blockquote>
    <p>We could do that but we would need another query flag to indicate
      when a platform doesn't support dev atomics SMEM only BO at all
      like PVC. <br>
    </p>
    <p>So I think let's keep it <span style="white-space: pre-wrap">DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM which will return true for all platform but PVC at this moment.</span></p>
    <p><span style="white-space: pre-wrap">On platforms that doesn't have the new PTE bit, this flag will have no effect.  Let me know what do you think?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite"
      cite="mid:109eb32e-99c9-49a0-8166-42ed59e67662@intel.com">
      <p><span style="white-space: pre-wrap">
</span></p>
      <p><span style="white-space: pre-wrap">-Lionel
</span></p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:20240415145214.25641-8-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap=""> #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
</pre>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------J0TYCbiFySwtYZqh1IQuo9BE--
