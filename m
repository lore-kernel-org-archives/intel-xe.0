Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6744E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 20:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752B110E1E2;
	Thu,  9 Jan 2025 20:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjjgAI0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B902210E0A1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736453256; x=1767989256;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mXtbO5QAxxmqkglHX7mhQBLNTKVQJyTDXjoeDvTClhU=;
 b=jjjgAI0ou1AOIrqNnXt9Ee+88AKYmpfJCugPdryiwprpQRHvpFvhH7or
 2nDTAT8xI7n8PaAmrY0+8mtc+33oq9rRuogOezkpVs0TS4Jh5HNCjPmT9
 VnF8MkffJWPzwkfZC6mnWWaLiHvlOb6l+VPBatpLPlvR7GmtF3DbrZGrw
 ZiTZQFam0nRUR271hr3/N7R4ektx3C0IDgdmWqB/Lvuj3qd46h+q3Nj7v
 +0waegE9M7IJALZLrfZx+teg8MM1c3jD4yg9LXszDb+xl/w1Wh6EsF+K2
 GSwxd6OVIlYAEG5uHjYx43vmhZUYfY6k9d4yd9X6Fmx6vOA6C9IQFkCsZ Q==;
X-CSE-ConnectionGUID: iHRC2w1BQQ2CvUCAP3XxDw==
X-CSE-MsgGUID: pddpnagXR8qnvFmxoPdE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47229436"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47229436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:07:36 -0800
X-CSE-ConnectionGUID: Im7Ga+26SSm9FDFHxv2xrg==
X-CSE-MsgGUID: 0eDjQYLyTTChC0CMV0eyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="104029343"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.77])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:07:35 -0800
Date: Thu, 9 Jan 2025 14:07:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, 
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/xe/client: Better correlate exec_queue and GT
 timestamps
Message-ID: <rebwdxk36hxogunyiobcj23pvci4h5qvtxqyn352t4tjyzw6ha@uoxq7hz6wytf>
References: <20241212173432.1244440-1-lucas.demarchi@intel.com>
 <Z3xcy2Z3CuwkR9L1@orsosgc001>
 <yucnyvz3vdhvxlpuxsd2c5jyzqpbdcpxoxhw2lbvfvjpndr7nb@7tiqvwmaxg2t>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <yucnyvz3vdhvxlpuxsd2c5jyzqpbdcpxoxhw2lbvfvjpndr7nb@7tiqvwmaxg2t>
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

On Wed, Jan 08, 2025 at 04:57:40PM -0600, Lucas De Marchi wrote:
>On Mon, Jan 06, 2025 at 02:44:27PM -0800, Umesh Nerlige Ramappa wrote:
>>On Thu, Dec 12, 2024 at 09:34:32AM -0800, Lucas De Marchi wrote:
>>>This partially reverts commit fe4f5d4b6616 ("drm/xe: Clean up VM / exec
>>>queue file lock usage."). While it's desired to have the mutex to
>>>protect only the reference to the exec queue, getting and dropping each
>>>mutex and then later getting the GPU timestamp, doesn't produce a
>>>correct result: it introduces multiple opportunities for the task to be
>>>scheduled out and thus wrecking havoc the deltas reported to userspace.
>>>
>>>Also, to better correlate the timestamp from the exec queues with the
>>>GPU, disable preemption so they can be updated without allowing the task
>>>to be scheduled out. We leave interrupts enabled as that shouldn't be
>>>enough disturbance for the deltas to matter to userspace.
>>
>>Assuming
>>
>>- timestamp from exec queues = xe_exec_queue_update_run_ticks()
>>- GPU timestamp = xe_hw_engine_read_timestamp()
>>
>>shouldn't you also move the xe_hw_engine_read_timestamp() within the 
>>preempt_disable/preempt_enable section?
>
>this is what I thought I had done, but it seems I messed up.
>
>>
>>Something like this ..
>>
>>	preempt_disable();
>>
>>	xa_for_each(&xef->exec_queue.xa, i, q)
>>		xe_exec_queue_update_run_ticks(q);
>>
>>	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>
>I'd move the gpu_timestamp to be done before the exec queue, so we don't
>call it with the exec queue mutex still taken. AFAIR this is what I was
>doing in the test machine, but sent the wrong version of the patch. Let
>me double check locally here and resend.

just re-tested that and submitted a v2. With and without the pending igt
patch series I can run the test for 1000 times while running cpu stress
and not have any failure.

Lucas De Marchi

>
>thanks
>Lucas De Marchi
>
>>
>>	preempt_enable();
>>
>>Thanks,
>>Umesh
>>
>>>
>>>Test scenario:
>>>
>>>	* IGT'S `xe_drm_fdinfo --r --r utilization-single-full-load`
>>>	* Platform: LNL, where CI occasionally reports failures
>>>	* `stress -c $(nproc)` running in parallel to disturb the
>>>	  system
>>>
>>>This brings a first failure from "after ~150 executions" to "never
>>>occurs after 1000 attempts".
>>>
>>>Cc: stable@vger.kernel.org # v6.11+
>>>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3512
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_drm_client.c | 9 +++------
>>>1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>index 298a587da7f17..e307b4d6bab5a 100644
>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>@@ -338,15 +338,12 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>
>>>	/* Accumulate all the exec queues from this client */
>>>	mutex_lock(&xef->exec_queue.lock);
>>>-	xa_for_each(&xef->exec_queue.xa, i, q) {
>>>-		xe_exec_queue_get(q);
>>>-		mutex_unlock(&xef->exec_queue.lock);
>>>+	preempt_disable();
>>>
>>>+	xa_for_each(&xef->exec_queue.xa, i, q)
>>>		xe_exec_queue_update_run_ticks(q);
>>>
>>>-		mutex_lock(&xef->exec_queue.lock);
>>>-		xe_exec_queue_put(q);
>>>-	}
>>>+	preempt_enable();
>>>	mutex_unlock(&xef->exec_queue.lock);
>>>
>>>	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>-- 
>>>2.47.0
>>>
