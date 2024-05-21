Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3FC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 19:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E6F10F0B0;
	Tue, 21 May 2024 19:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCdyEgNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03F910F08B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716318257; x=1747854257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yF8ZJ1tVYLbOnt8/jGYRpwBQIb3UHHvWq9FGK1ZBoyM=;
 b=QCdyEgNvMVfCoy/tAa82Ww5xVy6GPcjXCULhjenQIT4R/hBcJg0b03vL
 T/geMd/OfdnmlzJnihEAr1ahAtr3Ma7NNyemfLt9oyaFGL0IXpCJfgidb
 pob4dGFI3wX3NzMfBiF3FlOfjTGdTUjjTaKQYSFtiqZichFMlt70aNPDa
 Bhl1xM2xLuhviqqrlTSU5gIjNdy1XZGlJnL5ObFg17AZjkKU8la2noPLR
 LSWlrwkLRYtioCY9uDxjAOHa8s/obi7NGNv2/851Hcgb8VE2gqKEmde0R
 xrIZ5fDx0BTPpqBejkafPDB5aK4Kot7RFQBleZoPjyjyHeb7DVYESisYX A==;
X-CSE-ConnectionGUID: IDOG0jQ0RZyVdoqeUwqX3w==
X-CSE-MsgGUID: AFu1g99TTTqZwX16mf4i2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="37916833"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37916833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:04:16 -0700
X-CSE-ConnectionGUID: i5455qX1QFOClrUDD3b0Kg==
X-CSE-MsgGUID: mDVfjQ79Skqc2K2nbHljUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37519864"
Received: from apsathix-mobl.gar.corp.intel.com (HELO [10.246.34.38])
 ([10.246.34.38])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 12:04:16 -0700
Message-ID: <909b40ab-c310-421b-8593-1ae42c98d0f8@linux.intel.com>
Date: Tue, 21 May 2024 21:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add process name to devcoredump
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240521175143.100511-1-jose.souza@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240521175143.100511-1-jose.souza@intel.com>
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


On 5/21/2024 7:51 PM, José Roberto de Souza wrote:
> Process name help us track what application caused the gpug hang, this
> is crucial when running several applications at the same time.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       | 8 ++++++++
>   drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 3d7980232be1c..69968d7feb8bc 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>   	ts = ktime_to_timespec64(ss->boot_time);
>   	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	drm_printf(&p, "Process: %s\n", ss->process_name);
>   	xe_device_snapshot_print(xe, &p);
>   
>   	drm_printf(&p, "\n**** GuC CT ****\n");
> @@ -166,12 +167,19 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	enum xe_hw_engine_id id;
>   	u32 adj_logical_mask = q->logical_mask;
>   	u32 width_mask = (0x1 << q->width) - 1;
> +	struct task_struct *task;
>   	int i;
>   	bool cookie;
>   
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
>   
> +	rcu_read_lock();
> +	task = pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
> +	if (task)
> +		strscpy(ss->process_name, task->comm, sizeof(ss->process_name));
> +	rcu_read_unlock();

Use get_pid_task() instead. Otherwise

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> +
>   	ss->gt = q->gt;
>   	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>   
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 6f654b63c7f1c..923cdf72a816a 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -26,6 +26,8 @@ struct xe_devcoredump_snapshot {
>   	ktime_t snapshot_time;
>   	/** @boot_time:  Relative boot time so the uptime can be calculated. */
>   	ktime_t boot_time;
> +	/** @process_name: Name of process that triggered this gpu hang */
> +	char process_name[TASK_COMM_LEN];
>   
>   	/** @gt: Affected GT, used by forcewake for delayed capture */
>   	struct xe_gt *gt;
