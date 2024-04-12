Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B3C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 12:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C73310F5C6;
	Fri, 12 Apr 2024 12:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EptDg9dk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E6610F5C6
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712923432; x=1744459432;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=zpU1uL08rp9liOw4tO4Qwjv2HpPqIINU7S1BULMggyU=;
 b=EptDg9dkkxwHqH9D6fc5gyAT4FZqSsG2zjXE1dm2Q5jQdU4ZzItq1Tkj
 YAADAsElUexYvmgRDE5iVSI8g7CQDW3w2IOk5N44uEP+9i28q+T7Pc5GM
 JVMr6GZxj60BPTdzQxPyD/umIMCXk56o7tJf/wHIk+ZDc4yjbTxFjvXzj
 TJtiig8CTEIzMJ7xapVHT78DusTouzGGLEwiBU5lzqWvFk4Zq99pqgFQq
 5Fink4IIiqylnmSMMLjeqJ65fWTjomVUHwQe86oOHS0uoLkx8K7iRLrFg
 Bh8EEP2fyfxouSmxaPkJ7DpBDdCTpCUgze/3oa1Y59cTrgi8jNk+oOx3W Q==;
X-CSE-ConnectionGUID: HsRba6hYTBepET8zSd/AEw==
X-CSE-MsgGUID: ALReK8htQ7eq6nwF/DU5QA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8222194"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="8222194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:03:51 -0700
X-CSE-ConnectionGUID: rI7GNPrFSx+8y1krVTcoMw==
X-CSE-MsgGUID: V8qxu9y0QRGX8HoSwg0ogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="25657108"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:03:49 -0700
Content-Type: multipart/alternative;
 boundary="------------sx8NKLpQm6KWukTVM8jfMWEy"
Message-ID: <319c54d5-7652-4328-b9fa-d7c808881ca7@linux.intel.com>
Date: Fri, 12 Apr 2024 14:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use drm_sched_priority enum instead of 0
To: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20240412113426.12518-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240412113426.12518-1-nirmoy.das@intel.com>
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
--------------sx8NKLpQm6KWukTVM8jfMWEy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matt,


Shouldn't this be DRM_SCHED_PRIORITY_NORMAL ?

Regards,

Nirmoy

On 4/12/2024 1:34 PM, Nirmoy Das wrote:
> Use enum drm_sched_priority, DRM_SCHED_PRIORITY_KERNEL
> instead of 0.
>
> Cc: Matthew Auld<matthew.auld@intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_execlist.c      | 3 ++-
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index dece2785933c..a8c83b36289f 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -341,7 +341,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   		goto err_free;
>   
>   	sched = &exl->sched;
> -	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
> +	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL,
> +				    &sched, 1, NULL);
>   	if (err)
>   		goto err_sched;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..1f712f4fc76a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -63,7 +63,7 @@ static inline int
>   xe_sched_entity_init(struct xe_sched_entity *entity,
>   		     struct xe_gpu_scheduler *sched)
>   {
> -	return drm_sched_entity_init(entity, 0,
> +	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>   				     (struct drm_gpu_scheduler **)&sched,
>   				     1, NULL);
>   }
--------------sx8NKLpQm6KWukTVM8jfMWEy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Matt, <br>
    </p>
    <p><br>
    </p>
    <p>Shouldn't this be  <span style="white-space: pre-wrap">DRM_SCHED_PRIORITY_NORMAL ?</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <div class="moz-cite-prefix">On 4/12/2024 1:34 PM, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240412113426.12518-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">Use enum drm_sched_priority, DRM_SCHED_PRIORITY_KERNEL
instead of 0.

Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_execlist.c      | 3 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index dece2785933c..a8c83b36289f 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -341,7 +341,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &amp;exl-&gt;sched;
-	err = drm_sched_entity_init(&amp;exl-&gt;entity, 0, &amp;sched, 1, NULL);
+	err = drm_sched_entity_init(&amp;exl-&gt;entity, DRM_SCHED_PRIORITY_KERNEL,
+				    &amp;sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..1f712f4fc76a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -63,7 +63,7 @@ static inline int
 xe_sched_entity_init(struct xe_sched_entity *entity,
 		     struct xe_gpu_scheduler *sched)
 {
-	return drm_sched_entity_init(entity, 0,
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
 				     (struct drm_gpu_scheduler **)&amp;sched,
 				     1, NULL);
 }
</pre>
    </blockquote>
  </body>
</html>

--------------sx8NKLpQm6KWukTVM8jfMWEy--
