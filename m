Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E70CCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA99E10E581;
	Tue, 14 Oct 2025 08:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMVcUWGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C5F10E592
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760432330; x=1791968330;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ZlfcV/RTSEbrbh0IC7nykkr7/tzT4mwPGyUk7BHNODs=;
 b=TMVcUWGsO6hW4B4Q/s7UBjPYpWdPjsrtRjJ1PsuXrNgrNGIJNuDcJYfc
 +C1iXs/tFUKSC/HAjoKbYN2DVvhZLRyttK+pjzzNAxBRLP20rnIWJXeUG
 D/ggpfW/ient24iwKPxaisPV8MUx2g6Zty1RG+iuqSbOkrQbzZ4gD6IId
 i4hSrCyZqou0PPfrfRq2NgoqlA9QiAaIzU1oaEqZ/t1fkyohIPhfgIh7v
 126Sb9Nt8ipGUbOKPWT35tWygO+whSdWdng10zrhwlXqqjdTRjFOKOlhE
 LfCPdpLwvOtQwwXUJ+miBZhHB9PEgHcXLVI/6Pm/89hBa+PpIIgiS/D/k A==;
X-CSE-ConnectionGUID: 2tXkAQWiSHmJkdNkq2PfJw==
X-CSE-MsgGUID: twFp4pCIToifh/xpXZ9ukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73189119"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73189119"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:58:50 -0700
X-CSE-ConnectionGUID: jNqUVmD8SGGn98GsqgMQow==
X-CSE-MsgGUID: DkIVG3RWQ8CBz8mMNZBABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182610313"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.206])
 ([10.245.244.206])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:58:49 -0700
Message-ID: <9d6c807a-0d7a-4141-abb0-0ea115666614@intel.com>
Date: Tue, 14 Oct 2025 09:58:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, michal.wajdeczko@intel.com,
 Matthew Brost <matthew.brost@intel.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <20251010172529.2967639-2-shuicheng.lin@intel.com>
Content-Language: en-GB
In-Reply-To: <20251010172529.2967639-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/10/2025 18:25, Shuicheng Lin wrote:
> In normal operation, a registered exec queue is disabled and
> deregistered through the GuC, and freed only after the GuC confirms
> completion. However, if the driver is forced to unbind while the exec

With forced to unbind do you mean the device unplug/unbind flow? If so, 
would it make sense to use the drm_dev_enter/exit API here? Checking 
xe_uc_fw_is_running sounds like it could be racy?

> queue is still running, the user may call exec_destroy() after the GuC
> has already been stopped and CT communication disabled.
> 
> In this case, the driver cannot receive a response from the GuC,
> preventing proper cleanup of exec queue resources. Fix this by directly
> releasing the resources when GuC is not running.
> 
> Here is the failure dmesg log:
> "
> [  468.089581] ---[ end trace 0000000000000000 ]---
> [  468.089608] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> [  468.092716] ------------[ cut here ]------------
> [  468.092719] WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298 ttm_vram_mgr_fini+0xf8/0x130 [xe]
> "
> 
> v2: use xe_uc_fw_is_running() instead of xe_guc_ct_enabled().
>      As CT may go down and come back during VF migration.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e9aa0625ce60..0ef67d3523a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -44,6 +44,7 @@
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
> +#include "xe_uc_fw.h"
>   #include "xe_vm.h"
>   
>   static struct xe_guc *
> @@ -1501,7 +1502,17 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>   	xe_gt_assert(guc_to_gt(guc), !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>   	trace_xe_exec_queue_cleanup_entity(q);
>   
> -	if (exec_queue_registered(q))
> +	/*
> +	 * Expected state transitions for cleanup:
> +	 * - If the exec queue is registered and GuC firmware is running, we must first
> +	 *   disable scheduling and deregister the queue to ensure proper teardown and
> +	 *   resource release in the GuC, then destroy the exec queue on driver side.
> +	 * - If the GuC is already stopped (e.g., during driver unload or GPU reset),
> +	 *   we cannot expect a response for the deregister request. In this case,
> +	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
> +	 *   will not process further requests and all resources must be cleaned up locally.
> +	 */
> +	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
>   		disable_scheduling_deregister(guc, q);
>   	else
>   		__guc_exec_queue_destroy(guc, q);

