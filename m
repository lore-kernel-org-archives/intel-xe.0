Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CCEC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 10:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1455910E908;
	Fri, 10 Nov 2023 10:35:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6D910E908
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699612533; x=1731148533;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=mOqpjjr7AwTtrwZCLf7QJxBmLwUiY+Q8+qG8f9g9N0Y=;
 b=W3zQnzWuyTHwuAkV++jDSb7jD5PPnaYqQ0uyerXBV+JeYFk612pEHFyp
 nc6cElmnpC3DPRVaNxrF7asSadVD/IXWBUk3Umpi6CyKddduKQ2srlxI9
 AShETLywCOvY/fbu3GGrYhR2cW9Qylu93+pLgDT8uDuPI5h19ge19t9fi
 bLATel4MCQhgwD5nTefUCa5XUlReqmPTtd7QzVxeh6uKn3dIcwFE2QVK7
 tcUod29HsgQDIOMKrHps2FwTfnKFKws1ZjIRORBfSK5gYMZj+Er0A983V
 vT823HEitfbUMXNhHYyFUvq0121v7AJ0wx/y2ncELQJrR9tGDYYG45U9w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421259208"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
 d="scan'208,217";a="421259208"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740127704"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
 d="scan'208,217";a="740127704"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO [10.249.254.223])
 ([10.249.254.223])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 02:35:29 -0800
Content-Type: multipart/alternative;
 boundary="------------UkAMexhmnA9ovck8O8bUyD7l"
Message-ID: <3569017f-890c-45eb-a611-8694ec51a776@linux.intel.com>
Date: Fri, 10 Nov 2023 11:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-2-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231107052603.124361-2-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 01/27] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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
--------------UkAMexhmnA9ovck8O8bUyD7l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/7/23 06:25, Matthew Brost wrote:
> The idea being out-syncs can signal indicating all previous operations
> on the bind queue are complete. An example use case of this would be
> support for implementing vkQueueWaitForIdle easily.
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d26c90f0d702..403444ff3856 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   	int i;
>   
>   	if (XE_IOCTL_DBG(xe, args->extensions) ||
> -	    XE_IOCTL_DBG(xe, !args->num_binds) ||
>   	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
>   		return -EINVAL;
>   
> @@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto put_exec_queue;
>   		}
>   
> -		if (XE_IOCTL_DBG(xe, async !=
> +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
>   				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
>   			err = -EINVAL;
>   			goto put_exec_queue;
> @@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	}
>   
>   	if (!args->exec_queue_id) {
> -		if (XE_IOCTL_DBG(xe, async !=
> +		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
>   				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
>   			err = -EINVAL;
>   			goto put_vm;
> @@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		}
>   	}
>   
> -	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> -	if (!bos) {
> -		err = -ENOMEM;
> -		goto release_vm_lock;
> -	}
> +	if (args->num_binds) {
> +		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
> +		if (!bos) {
> +			err = -ENOMEM;
> +			goto release_vm_lock;
> +		}
>   
> -	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> -	if (!ops) {
> -		err = -ENOMEM;
> -		goto release_vm_lock;
> +		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> +		if (!ops) {
> +			err = -ENOMEM;
> +			goto release_vm_lock;
> +		}
>   	}
>   
>   	for (i = 0; i < args->num_binds; ++i) {
> @@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto free_syncs;
>   	}
>   
> +	if (!args->num_binds) {
> +		err = -ENODATA;
> +		goto free_syncs;
> +	}
> +
>   	for (i = 0; i < args->num_binds; ++i) {
>   		u64 range = bind_ops[i].range;
>   		u64 addr = bind_ops[i].addr;
--------------UkAMexhmnA9ovck8O8bUyD7l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/7/23 06:25, Matthew Brost wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20231107052603.124361-2-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">The idea being out-syncs can signal indicating all previous operations
on the bind queue are complete. An example use case of this would be
support for implementing vkQueueWaitForIdle easily.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a></pre>
    </blockquote>
    <p>Reviewed-by: Thomas Hellström
      &lt;<a class="moz-txt-link-abbreviated" href="mailto:thomas.hellstrom@linux.intel.com">thomas.hellstrom@linux.intel.com</a><font size="4">&gt;</font></p>
    <p><font size="4"><br>
      </font></p>
    <blockquote type="cite"
      cite="mid:20231107052603.124361-2-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d26c90f0d702..403444ff3856 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_DBG(xe, args-&gt;extensions) ||
-	    XE_IOCTL_DBG(xe, !args-&gt;num_binds) ||
 	    XE_IOCTL_DBG(xe, args-&gt;num_binds &gt; MAX_BINDS))
 		return -EINVAL;
 
@@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_exec_queue;
 		}
 
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args-&gt;num_binds &amp;&amp; async !=
 				 !!(q-&gt;flags &amp; EXEC_QUEUE_FLAG_VM_ASYNC))) {
 			err = -EINVAL;
 			goto put_exec_queue;
@@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!args-&gt;exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args-&gt;num_binds &amp;&amp; async !=
 				 !!(vm-&gt;flags &amp; XE_VM_FLAG_ASYNC_DEFAULT))) {
 			err = -EINVAL;
 			goto put_vm;
@@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	bos = kzalloc(sizeof(*bos) * args-&gt;num_binds, GFP_KERNEL);
-	if (!bos) {
-		err = -ENOMEM;
-		goto release_vm_lock;
-	}
+	if (args-&gt;num_binds) {
+		bos = kzalloc(sizeof(*bos) * args-&gt;num_binds, GFP_KERNEL);
+		if (!bos) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 
-	ops = kzalloc(sizeof(*ops) * args-&gt;num_binds, GFP_KERNEL);
-	if (!ops) {
-		err = -ENOMEM;
-		goto release_vm_lock;
+		ops = kzalloc(sizeof(*ops) * args-&gt;num_binds, GFP_KERNEL);
+		if (!ops) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i &lt; args-&gt;num_binds; ++i) {
@@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
+	if (!args-&gt;num_binds) {
+		err = -ENODATA;
+		goto free_syncs;
+	}
+
 	for (i = 0; i &lt; args-&gt;num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
</pre>
    </blockquote>
  </body>
</html>

--------------UkAMexhmnA9ovck8O8bUyD7l--
