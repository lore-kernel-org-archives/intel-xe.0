Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168F2C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 12:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448210E0A3;
	Tue, 21 Mar 2023 12:26:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133A610E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679401561; x=1710937561;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=kbWZ8XNsebn1alLI1X8jmC45Af3hI+ZsOQIQFFEv8pg=;
 b=MRyrG5aASoUf9UUMGAB3SfgmGScL/KMtLThjPI3wd9sYiPrTTrvWwVxz
 8r57vseMTs248QWy8nz8BCK7mPeiGjwe4E7+ZTDaWvzuUZfU1nh3ZDeKr
 RtGAdVXb+lvGgFdckIG/K3ME08VXz4Z4B7wDdd+/WJQCYMAOMeCjAlwHd
 xe9c5qqkRoH6r7R763i1o36LYdBdoWQxJWkePDFzBsuHuWWRR/siPlJKm
 o+gv75PYtzdLhmDfPlqXnZzTUguucbM1i5WFHf72JZwwVQx8/Br653dTD
 C7xjh4TdBj3Tv3fm5BwYIwZlvtI2PDBvg/tst6Kqlhgyvzr6Y4RvAvq7y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318579025"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
 d="scan'208,217";a="318579025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="855673921"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
 d="scan'208,217";a="855673921"
Received: from mtiebout-mobl1.ger.corp.intel.com (HELO [10.252.35.151])
 ([10.252.35.151])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:25:53 -0700
Content-Type: multipart/alternative;
 boundary="------------bRqXVBm9W9s5aADkrSB3ERNw"
Message-ID: <f85589d5-b3ac-89c8-6a24-9c51d10d3710@linux.intel.com>
Date: Tue, 21 Mar 2023 13:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230317002221.211065-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230317002221.211065-1-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix locking in CT fast path
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
--------------bRqXVBm9W9s5aADkrSB3ERNw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

I'm afraid this is not allowed, you can't take a mutex in an irq handler, not even a trylock.

 From Documentation/locking/mutex-design.rst:

The mutex subsystem checks and enforces the following rules:
...
     - Mutexes may not be used in hardware or software interrupt
       contexts such as tasklets and timers.

Lockdep will likely still splat too as a result.

Cheers,
~Maarten

On 2023-03-17 01:22, Matthew Brost wrote:
> We can't sleep in the CT fast but need to ensure we can access VRAM. Use
> a trylock + reference counter check to ensure safe access to VRAM, if
> either check fails, fall back to slow path.
>
> VLK-45296
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>   2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 25c5087f5aad..0cc4f52098a1 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
>   	XE_WARN_ON(!xe->mem_access.ref);
>   }
>   
> +static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
> +{
> +	lockdep_assert_held(&xe->mem_access.lock);
> +
> +	return xe->mem_access.ref;
> +}
> +
>   static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>   {
>   	bool ret;
>   
>   	mutex_lock(&xe->mem_access.lock);
> -	ret = xe->mem_access.ref;
> +	ret = __xe_device_mem_access_ongoing(xe);
>   	mutex_unlock(&xe->mem_access.lock);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e5ed9022a0a2..bba0ef21c9e5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   	struct xe_device *xe = ct_to_xe(ct);
>   	int len;
>   
> -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
> +	if (!xe_device_in_fault_mode(xe))
>   		return;
>   
> +	if (!mutex_trylock(&xe->mem_access.lock))
> +		return;
> +
> +	if (!__xe_device_mem_access_ongoing(xe))
> +		goto unlock;
> +
>   	spin_lock(&ct->fast_lock);
>   	do {
>   		len = g2h_read(ct, ct->fast_msg, true);
> @@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   			g2h_fast_path(ct, ct->fast_msg, len);
>   	} while (len > 0);
>   	spin_unlock(&ct->fast_lock);
> +
> +unlock:
> +	mutex_unlock(&xe->mem_access.lock);
>   }
>   
>   /* Returns less than zero on error, 0 on done, 1 on more available */
--------------bRqXVBm9W9s5aADkrSB3ERNw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey,</p>
    <pre>I'm afraid this is not allowed, you can't take a mutex in an irq handler, not even a trylock.

From Documentation/locking/mutex-design.rst:

The mutex subsystem checks and enforces the following rules:
...
    - Mutexes may not be used in hardware or software interrupt
      contexts such as tasklets and timers.

Lockdep will likely still splat too as a result.

Cheers,
~Maarten
</pre>
    <div class="moz-cite-prefix">On 2023-03-17 01:22, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230317002221.211065-1-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">We can't sleep in the CT fast but need to ensure we can access VRAM. Use
a trylock + reference counter check to ensure safe access to VRAM, if
either check fails, fall back to slow path.

VLK-45296

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.h |  9 ++++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 25c5087f5aad..0cc4f52098a1 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -95,12 +95,19 @@ static inline void xe_device_assert_mem_access(struct xe_device *xe)
 	XE_WARN_ON(!xe-&gt;mem_access.ref);
 }
 
+static inline bool __xe_device_mem_access_ongoing(struct xe_device *xe)
+{
+	lockdep_assert_held(&amp;xe-&gt;mem_access.lock);
+
+	return xe-&gt;mem_access.ref;
+}
+
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
 	bool ret;
 
 	mutex_lock(&amp;xe-&gt;mem_access.lock);
-	ret = xe-&gt;mem_access.ref;
+	ret = __xe_device_mem_access_ongoing(xe);
 	mutex_unlock(&amp;xe-&gt;mem_access.lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e5ed9022a0a2..bba0ef21c9e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1030,9 +1030,15 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
+	if (!xe_device_in_fault_mode(xe))
 		return;
 
+	if (!mutex_trylock(&amp;xe-&gt;mem_access.lock))
+		return;
+
+	if (!__xe_device_mem_access_ongoing(xe))
+		goto unlock;
+
 	spin_lock(&amp;ct-&gt;fast_lock);
 	do {
 		len = g2h_read(ct, ct-&gt;fast_msg, true);
@@ -1040,6 +1046,9 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct-&gt;fast_msg, len);
 	} while (len &gt; 0);
 	spin_unlock(&amp;ct-&gt;fast_lock);
+
+unlock:
+	mutex_unlock(&amp;xe-&gt;mem_access.lock);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
</pre>
    </blockquote>
  </body>
</html>

--------------bRqXVBm9W9s5aADkrSB3ERNw--
