Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C212C25B7A
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 10:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C4C10E34D;
	Thu, 23 May 2024 10:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7yx/AL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB2610E8C1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716459795; x=1747995795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Ps+wHdtEd4jEa1+vTLSwVLw058JdMHcGmh+Aplliwns=;
 b=Z7yx/AL7/IcaF60xhuo3dvulYiG7bbdfSFuBCmKy5TRh8NgTwliCxjAO
 JpGrAU5ZH2cpVDde8jF/0/sT9EWbqZ8DKQSAae4KOPVCl2I+YAHtB47DD
 NEynwSYnMGNSQCBGJmhFZLXTy4JXuy9dBRnUW+SXYjahYe9gCznFgE94W
 jD/xco1Vzs2ECTuqZfT4BW1fuFEA3nNq2MT/+8YCBY0uOFO2lgbWMrtMy
 cjt7KYovbc7RJAZca5R3DcJWvMG+bnGJScT3dV2+q2JvDHG0fwEdHtq4o
 p/fLt04COm3qmu5N5+eA+yfuy+OqLZAnyNgUcKO/92Uszl/gU6/HPc3wQ w==;
X-CSE-ConnectionGUID: /HDkmbX/Qnia7J6e6zcbBg==
X-CSE-MsgGUID: 0wMf8A4IROqhn9AKqdR/3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12597891"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208,217";a="12597891"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:23:14 -0700
X-CSE-ConnectionGUID: PVlQ77FLQiegctmuE1tGlA==
X-CSE-MsgGUID: LxGQeM6iQVqvwAAamjqa9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208,217";a="33463829"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.61])
 ([10.246.32.61])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:23:13 -0700
Content-Type: multipart/alternative;
 boundary="------------qrSV22vs8U8daCoZ35ZGk5oi"
Message-ID: <5e260bdc-7ca5-48ae-8caf-aff039c740cc@linux.intel.com>
Date: Thu, 23 May 2024 12:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: Add process name to devcoredump
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240522201203.145403-1-jose.souza@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240522201203.145403-1-jose.souza@intel.com>
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
--------------qrSV22vs8U8daCoZ35ZGk5oi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/22/2024 10:12 PM, José Roberto de Souza wrote:
> Process name help us track what application caused the gpug hang, this
> is crucial when running several applications at the same time.
>
> v2:
> - handle Xe KMD exec_queues without VM
>
> v3:
> - use get_pid_task() (suggested by Nirmoy)
>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Signed-off-by: José Roberto de Souza<jose.souza@intel.com>
Reviewed-by : Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
>   2 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index e70aef7971930..1643d44f8bc42 100644
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
> @@ -166,12 +167,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	enum xe_hw_engine_id id;
>   	u32 adj_logical_mask = q->logical_mask;
>   	u32 width_mask = (0x1 << q->width) - 1;
> +	const char *process_name = "no process";
> +	struct task_struct *task = NULL;
> +
>   	int i;
>   	bool cookie;
>   
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
>   
> +	if (q->vm) {
> +		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
> +		if (task)
> +			process_name = task->comm;
> +	}
> +	snprintf(ss->process_name, sizeof(ss->process_name), process_name);
> +	if (task)
> +		put_task_struct(task);
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
--------------qrSV22vs8U8daCoZ35ZGk5oi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/22/2024 10:12 PM, José Roberto de
      Souza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240522201203.145403-1-jose.souza@intel.com">
      <pre class="moz-quote-pre" wrap="">Process name help us track what application caused the gpug hang, this
is crucial when running several applications at the same time.

v2:
- handle Xe KMD exec_queues without VM

v3:
- use get_pid_task() (suggested by Nirmoy)

Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Signed-off-by: José Roberto de Souza <a class="moz-txt-link-rfc2396E" href="mailto:jose.souza@intel.com">&lt;jose.souza@intel.com&gt;</a></pre>
    </blockquote>
    Reviewed-by : <span style="white-space: pre-wrap">Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></span>
    <blockquote type="cite"
      cite="mid:20240522201203.145403-1-jose.souza@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index e70aef7971930..1643d44f8bc42 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&amp;p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss-&gt;boot_time);
 	drm_printf(&amp;p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(&amp;p, "Process: %s\n", ss-&gt;process_name);
 	xe_device_snapshot_print(xe, &amp;p);
 
 	drm_printf(&amp;p, "\n**** GuC CT ****\n");
@@ -166,12 +167,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q-&gt;logical_mask;
 	u32 width_mask = (0x1 &lt;&lt; q-&gt;width) - 1;
+	const char *process_name = "no process";
+	struct task_struct *task = NULL;
+
 	int i;
 	bool cookie;
 
 	ss-&gt;snapshot_time = ktime_get_real();
 	ss-&gt;boot_time = ktime_get_boottime();
 
+	if (q-&gt;vm) {
+		task = get_pid_task(q-&gt;vm-&gt;xef-&gt;drm-&gt;pid, PIDTYPE_PID);
+		if (task)
+			process_name = task-&gt;comm;
+	}
+	snprintf(ss-&gt;process_name, sizeof(ss-&gt;process_name), process_name);
+	if (task)
+		put_task_struct(task);
+
 	ss-&gt;gt = q-&gt;gt;
 	INIT_WORK(&amp;ss-&gt;work, xe_devcoredump_deferred_snap_work);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 6f654b63c7f1c..923cdf72a816a 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -26,6 +26,8 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+	/** @process_name: Name of process that triggered this gpu hang */
+	char process_name[TASK_COMM_LEN];
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
</pre>
    </blockquote>
  </body>
</html>

--------------qrSV22vs8U8daCoZ35ZGk5oi--
