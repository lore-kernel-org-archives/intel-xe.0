Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009AAC02180
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 00:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352910E092;
	Tue, 14 Jan 2025 00:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4OpopTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1D10E092
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 00:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736815097; x=1768351097;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qf5688TKZXlcU5M9fcryaFnjnfJY8S5eOl5Vvg3SAo4=;
 b=W4OpopTO0q5zI6JRApRYtoZX5ICD/33R+/5ezRxXVQbCCKd6xdXLgmpk
 J13qXDDgKjE3TpysXDpO6EId8viwtWC/L6sqKWhS6vO9WxFt23xlm9zF+
 eJ+NeCNr31OLOGVbq4MeCI/lneeaRKaCb8T5pFH735LM186Nx4ZkUwXEZ
 MwnErTd9mktPo5EDg+iULBk34yPcRJ7eY/Gft1OeIGW+GCvVkFdbl9w7f
 iN5Qlm+3u+yR6zQTBdto3ICBoiCaAowGhCof09CnFqebSY/X0Q8GiVuSV
 0K9pJnFRo/KQ/fFMmuas6q69fa9e/hxhI1UFt9VS+tpjNUiRESqN8BJMl w==;
X-CSE-ConnectionGUID: R/3XHkFnQRSk9/yZRIjrOA==
X-CSE-MsgGUID: HWIQg4khQGKNLdogDlsGNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54514250"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="54514250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:38:16 -0800
X-CSE-ConnectionGUID: UlpYGskBRLK88uzykW4qCA==
X-CSE-MsgGUID: nhSUie/fTfGnE43+F/w52Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="135471751"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.113])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 16:38:16 -0800
Date: Mon, 13 Jan 2025 18:38:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/client: Better correlate exec_queue and GT
 timestamps
Message-ID: <dzljhhqyjtekkpb3uasqa23czry4vidubrhtyfxixdebscptwi@adfnn4pbfzme>
References: <20250109200340.1774314-1-lucas.demarchi@intel.com>
 <Z4WbJ4DMaPS+LfJ5@orsosgc001>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z4WbJ4DMaPS+LfJ5@orsosgc001>
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

On Mon, Jan 13, 2025 at 03:00:55PM -0800, Umesh Nerlige Ramappa wrote:
>On Thu, Jan 09, 2025 at 12:03:40PM -0800, Lucas De Marchi wrote:
>>This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
>>queue file lock usage."). While it's desired to have the mutex to
>>protect only the reference to the exec queue, getting and dropping each
>>mutex and then later getting the GPU timestamp, doesn't produce a
>>correct result: it introduces multiple opportunities for the task to be
>>scheduled out and thus wrecking havoc the deltas reported to userspace.
>>
>>Also, to better correlate the timestamp from the exec queues with the
>>GPU, disable preemption so they can be updated without allowing the task
>>to be scheduled out. We leave interrupts enabled as that shouldn't be
>>enough disturbance for the deltas to matter to userspace.
>>
>>Test scenario:
>>
>>	* IGT'S `xe_drm_fdinfo --r utilization-single-full-load`
>>	* Platform: LNL, where CI occasionally reports failures
>>	* `stress -c $(nproc)` running in parallel to disturb the
>>	  system
>>
>>This brings a first failure from "after ~150 executions" to "never
>>occurs after 1000 attempts".
>>
>>v2: Also keep xe_hw_engine_read_timestamp() call inside the
>>   preemption-disabled section (Umesh)
>>
>>Cc: stable@vger.kernel.org # v6.11+
>>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Cc: Matthew Brost <matthew.brost@intel.com>
>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3512
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_drm_client.c | 14 ++++++--------
>>1 file changed, 6 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 7d55ad846bac5..2220a09bf9751 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -337,20 +337,18 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>		return;
>>	}
>>
>>+	/* Let both the GPU timestamp and exec queue be updated together */
>>+	preempt_disable();
>>+	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>+
>>	/* Accumulate all the exec queues from this client */
>>	mutex_lock(&xef->exec_queue.lock);
>
>mutex_lock could sleep and you have disabled preemption above, so not 
>a good idea. I think it will bug check if the lock is contended.
>
>Earlier you had mutex_lock on the outside, so that was fine.

yeah... saw that in the CI test results.

So far with the igt patches it seems we eliminated all the issues. I
will come back to this eventually, but priority is now pretty low.

thanks
Lucas De Marchi

>
>Thanks,
>Umesh
>
>>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>>-		xe_exec_queue_get(q);
>>-		mutex_unlock(&xef->exec_queue.lock);
>>
>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>		xe_exec_queue_update_run_ticks(q);
>>
>>-		mutex_lock(&xef->exec_queue.lock);
>>-		xe_exec_queue_put(q);
>>-	}
>>	mutex_unlock(&xef->exec_queue.lock);
>>-
>>-	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>+	preempt_enable();
>>
>>	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>>	xe_pm_runtime_put(xe);
>>-- 
>>2.47.0
>>
