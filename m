Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40974CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 03:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC3710E51E;
	Tue, 13 Oct 2026 03:49:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6708F10E51E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 03:49:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F36F742E71;
 Tue, 13 Oct 2026 03:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBFF1F000FF;
 Tue, 13 Oct 2026 03:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791863342;
 bh=LPcxv7Yfg2LwtTzbp+zTtJFSa5Ft/+LFvEyxZq968MM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=dyYYWGg0k7Pd1wFI6toHQUR7gaghlRhyTm4TL/u0nrgkDYsJe0LSy6jn1vBKVQ3X5
 88WXZduBR+XbrUwPTK+3QadMxw+uecDDFmbTXB/xolkbtLU8KZu4Wxjd6dAq2loiN7
 kr3w0HT7glIAsRDBcr/dHx9B+JQiKZqZSGx+p2Lj09K5k4LinN+xjbpIEtK0DxozZn
 eX/96VHz+8dbAdlMDL3h0N3OzqR/wiSItjPcx/dlq04zsQ1M8E0P3Ag5H+x6IDKljN
 T4PSQdgcO/134NZLWGFxvDvzE8zdwikIRQQFKlqCFeQMpLSRjjn68X1BqXTXJt3uU4
 0jyhmUUj0arzg==
Message-ID: <sashiko-outbox-168920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
To: "Varun Gupta" <varun.gupta@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013033430.1885990-2-varun.gupta@intel.com>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:49:00 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/guc: UAF in xe_guc_uncorrectable_error_handler due to missi=
ng refcount
--

commit c1812b93b48a6984d3994289c7b05357ce4e4972
Author: Varun Gupta <varun.gupta@intel.com>

drm/xe/guc: Demote uncorrectable local error log on CRI

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. This commit demotes the error log to an info log on
CRI platforms to reduce noise from routine workloads.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 0b231228bde8b..6dd0e0eead9c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
[ ... ]
> @@ -3569,9 +3569,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
> =20
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_mas=
k=3D0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	/*
> +	 * On CRI, the hardware cannot distinguish GT translation faults
> +	 * from true RAS conditions. Demote to info to avoid false-positive
> +	 * hardware error logs.
> +	 */
> +	if (gt_to_xe(gt)->info.platform =3D=3D XE_CRESCENTISLAND)
> +		xe_gt_info(gt,
> +			   "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_m=
ask=3D0x%x",
> +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	else
> +		xe_gt_err(gt,
> +			  "GuC: Uncorrectable local error! guc_id=3D%d class=3D%s, logical_ma=
sk=3D0x%x",
> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);

[Severity: High]
Can this sequence lead to a use-after-free on the queue pointer?

The uncorrectable error handler uses g2h_exec_queue_lookup(), which retriev=
es
the queue pointer via xa_load() without taking a reference count. If the
device is wedged or GuC firmware is stopped concurrently, the scheduler's
cleanup worker can bypass the synchronous wait for GuC's deregistration
and call guc_exec_queue_destroy_async(q):

__guc_exec_queue_process_msg_cleanup() {
    ...
    if (bound && !exec_queue_wedged(q) && exec_queue_registered(q) &&
        xe_uc_fw_is_running(&guc->fw))
        disable_scheduling_deregister(guc, q);
    else
        guc_exec_queue_destroy_async(q);
}

This asynchronously schedules the queue's destruction and immediately frees
its memory via kfree(q) instead of kfree_rcu():

__xe_exec_queue_free() {
    ...
    kvfree(q->replay_state);
    kfree(q);
}

Since the G2H worker processing xe_guc_uncorrectable_error_handler() holds
no reference, couldn't the queue memory be freed and reallocated before
or during the evaluation of q->class and q->logical_mask?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013033430.1885=
990-2-varun.gupta@intel.com?part=3D1
