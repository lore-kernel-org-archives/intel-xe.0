Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D194DC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 09:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A7D10F3B3;
	Tue,  7 May 2024 09:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8YpvFe1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C005310F3B3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715074790; x=1746610790;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=8WBwWX6k+u2as1UtUtZhHJTKDP55tziRNPtfCFkV0DA=;
 b=E8YpvFe12oYUlSNd1NqtoNMKkGbyOuawNM+LxubTqY1qtBwkqakVzGl+
 OfQRFV2o9fN07bSZ3eekDf5zi3DPPKwCC+6TPynfCplNcxzCJ1LgGaJlF
 CNmLmI/UuAupV1b2j7lNZtu6mfuL5scm11GXsiSiFDaaD6oKGzMNg9Tg7
 2Wlljhq+9pWeoxZK19/6aZq1e1L7l1mPZX4gAJBMzUiE8G4s7Kcri2Nfx
 jnuiVYrwk/KRxxmMUovleShdoPhNdCHuWo97cRGryNKV0XvKWZZICgJmo
 myru2Kn9K5TghbkkzNzglHVm2lRIKjGpxunUz32ruPDjuo4wV7lSueyRb g==;
X-CSE-ConnectionGUID: CHazzIKFTcGLt65MyTKeoQ==
X-CSE-MsgGUID: OpiFbHl5ST+l7b4t+4xCMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10708169"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208,217";a="10708169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 02:39:49 -0700
X-CSE-ConnectionGUID: c/hSeqLRQ1qPEkzKvQex6w==
X-CSE-MsgGUID: l/h+7w6nR2W7j5Ba8NPpvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208,217";a="28986477"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.254])
 ([10.246.32.254])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 02:39:48 -0700
Content-Type: multipart/alternative;
 boundary="------------IVRxL754F2tWMRWWIzqTRU2A"
Message-ID: <2a9a7bb2-c74d-44fb-b9d2-cbb42e462d0f@linux.intel.com>
Date: Tue, 7 May 2024 11:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240507080456.613786-1-shuicheng.lin@intel.com>
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
--------------IVRxL754F2tWMRWWIzqTRU2A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/7/2024 10:04 AM, Shuicheng Lin wrote:
> Here is the failure stack:
> [   12.988209] ------------[ cut here ]------------
> [   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
> [   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
> [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
> [   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
> [   12.988239] Call Trace:
> [   12.988240]  <TASK>
> [   12.988242]  dump_stack_lvl+0xd7/0xf0
> [   12.988248]  dump_stack+0x10/0x20
> [   12.988250]  ubsan_epilogue+0x9/0x40
> [   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
> [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
> [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
> [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
> [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>
> It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
> And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
> For the num_fences, it should be 1 at least.
>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin<shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d17192c8b7de..96cb4d9762a3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>   
>   	if (bo) {
>   		if (!bo->vm)
> -			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);

This needs to be fixed in drm_exec_prepare_obj() by checking num_fences 
and not calling dma_resv_reserve_fences()


Regards,

Nirmoy

>   		if (!err && validate)
>   			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
>   	}
> @@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>   	struct xe_vma_op *op;
>   	int err;
>   
> -	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> +	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
>   	if (err)
>   		return err;
>   
--------------IVRxL754F2tWMRWWIzqTRU2A
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
    <div class="moz-cite-prefix">On 5/7/2024 10:04 AM, Shuicheng Lin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240507080456.613786-1-shuicheng.lin@intel.com">
      <pre class="moz-quote-pre" wrap="">Here is the failure stack:
[   12.988209] ------------[ cut here ]------------
[   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
[   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
[   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
[   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
[   12.988239] Call Trace:
[   12.988240]  &lt;TASK&gt;
[   12.988242]  dump_stack_lvl+0xd7/0xf0
[   12.988248]  dump_stack+0x10/0x20
[   12.988250]  ubsan_epilogue+0x9/0x40
[   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
[   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
[   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
[   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
[   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
[   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]

It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
For the num_fences, it should be 1 at least.

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Shuicheng Lin <a class="moz-txt-link-rfc2396E" href="mailto:shuicheng.lin@intel.com">&lt;shuicheng.lin@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d17192c8b7de..96cb4d9762a3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 
 	if (bo) {
 		if (!bo-&gt;vm)
-			err = drm_exec_prepare_obj(exec, &amp;bo-&gt;ttm.base, 0);
+			err = drm_exec_prepare_obj(exec, &amp;bo-&gt;ttm.base, 1);</pre>
    </blockquote>
    <p>This needs to be fixed in <span style="white-space: pre-wrap">drm_exec_prepare_obj() </span>by
      checking num_fences and not calling dma_resv_reserve_fences() <br>
    </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:20240507080456.613786-1-shuicheng.lin@intel.com">
      <pre class="moz-quote-pre" wrap="">
 		if (!err &amp;&amp; validate)
 			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
 	}
@@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	struct xe_vma_op *op;
 	int err;
 
-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
 	if (err)
 		return err;
 
</pre>
    </blockquote>
  </body>
</html>

--------------IVRxL754F2tWMRWWIzqTRU2A--
