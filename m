Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F0DC54E49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 10:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0111376C;
	Thu,  7 Mar 2024 10:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtmY5oQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF133113770
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 10:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709808658; x=1741344658;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hd2BTIyHMQqzT9X3u99D9xREyvRNxUdS5Nik/grXITM=;
 b=MtmY5oQ9rlS3KdqNT5PVGkTnFTvHRoLDmrJGDR64PSZNv1fQmdvmfFc4
 C6Bm8MVE7vA0cp2AZF9EL95iUgxLQEwFHOLL5h5lqHegOLt2n6lo1jWuP
 jc6uDcNSaGc5ODJxA7C/Hn7w2KtG2EeChPBgrYP8jdGTX5TfIO4m6Da2B
 e/QG1jr2+S/bATkz7HuKZ2ZVm5xsR1Ghhg8OucNS3ZUOjft/wWgKmvwgY
 Bv59FXFafItqKL8vHon1lfus5O+i49plOyk3/3Tmx1vAFfiu+WGYCkQIZ
 lC6zGWZeMgQdidGuoY618QBwf7pLM3QN6md7L6hcOLkTC+rclOfu6JOCu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="7413793"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; 
   d="scan'208";a="7413793"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="47565596"
Received: from cpetrove-mobl.ger.corp.intel.com (HELO [10.249.46.111])
 ([10.249.46.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:50:56 -0800
Message-ID: <83889329-ec9f-4c0e-8bb7-f34a8670d607@linux.intel.com>
Date: Thu, 7 Mar 2024 11:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/devcoredump: Print errno if VM snapshot was
 not captured
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240304140514.24768-1-jose.souza@intel.com>
 <20240304140514.24768-2-jose.souza@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240304140514.24768-2-jose.souza@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 2024-03-04 15:05, José Roberto de Souza wrote:
> My testing machine has only 8GB of RAM and while running piglit tests
> I can reach the OOM cache in xe_vm_snapshot_capture() snap allocaiton
> sometimes.
> 
> So to differentiate the OOM from race between capture and UMDs
> unbinbind VMs here I'm adding a '[0].error: -12' to devcoredump.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c |  6 ++----
>   drivers/gpu/drm/xe/xe_vm.c          | 13 ++++++++++---
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0fcd306803236..4ab0feca55cdd 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -117,10 +117,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   		if (coredump->snapshot.hwe[i])
>   			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
>   						    &p);
> -	if (coredump->snapshot.vm) {
> -		drm_printf(&p, "\n**** VM state ****\n");
> -		xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> -	}
> +	drm_printf(&p, "\n**** VM state ****\n");
> +	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
>   
>   	return count - iter.remain;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index df9360a4c9e8e..f7d20bf9b33a9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3336,8 +3336,10 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>   
>   	if (num_snaps)
>   		snap = kvzalloc(offsetof(struct xe_vm_snapshot, snap[num_snaps]), GFP_NOWAIT);
> -	if (!snap)
> +	if (!snap) {
> +		snap = num_snaps ? ERR_PTR(-ENODEV) : ERR_PTR(-ENOMEM);
>   		goto out_unlock;
> +	}

You inverted -ENODEV and -ENOMEM here. Perhaps return earlier for 
!num_snaps instead of a ternary?


>   
>   	snap->num_snaps = num_snaps;
>   	i = 0;
> @@ -3377,7 +3379,7 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>   
>   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>   {
> -	if (!snap)
> +	if (IS_ERR(snap))
>   		return;
>   
>   	for (int i = 0; i < snap->num_snaps; i++) {
> @@ -3434,6 +3436,11 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
>   {
>   	unsigned long i, j;
>   
> +	if (IS_ERR(snap)) {
> +		drm_printf(p, "[0].error: %li\n", PTR_ERR(snap));
> +		return;
> +	}
> +
>   	for (i = 0; i < snap->num_snaps; i++) {
>   		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
>   
> @@ -3460,7 +3467,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   {
>   	unsigned long i;
>   
> -	if (!snap)
> +	if (IS_ERR(snap))
>   		return;
>   
>   	for (i = 0; i < snap->num_snaps; i++) {
