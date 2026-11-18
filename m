Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CC606A332
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJSurixW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E746410E0E2;
	Wed, 18 Nov 2026 03:25:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0CD10E0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 03:25:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2321B438FA;
 Wed, 18 Nov 2026 03:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56981F000C4;
 Wed, 18 Nov 2026 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794972334;
 bh=ZvpVgw1ONaDBOvxAZjMern3Ir/yUrV4RAK0Zk0UXDWs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=VJSurixWdbAUQ38wtqBA4iQUnGi3dlxhiFfngEpTbKoiw1JZSkaFZgIvmEa3wtl3m
 dNa4FfyOYR8/1Bj5mvAbNIrIDdUL07xKhcHRVit0HPcpPE/qXA/I4wJaD8DSJSbDUh
 n/EgelA92rtI/vGaGPLpEbHenj/bn8DIxUlL4k8vS6PsmF++GfCRZdlZBnYzJCWR8U
 +fhLQ+37h6IRZS4+r49vCzcnG52oYRMwzUS0KstNlksgIWFirhV6l4vEwA4QIkFS4K
 vSFoA9E69zyBBxY+suObSPd3TspMQ1+C51VYkC/aSXxecAbTxqIqTsyAroSoURQ9/k
 8pqm8QIq2vPGg==
Message-ID: <sashiko-outbox-220010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/7] drm/xe/oa: Skip OA HW teardown on a wedged device
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118025140.3782678-13-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
 <20261118025140.3782678-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 03:25:33 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/oa: DMA to freed OA buffer when xe_oa_destroy_locked()
  skips disable
--

commit 075f191997c0893af49f78ce642bd67df0a344cb
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Skip OA HW teardown on a wedged device

This commit skips disabling the OA stream and performing OA hardware
teardown when the device is wedged, while unconditionally canceling the
poll check timer during stream destruction.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 3ddccc7e6f90c..8ed427ad67b48 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -43,6 +43,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sync.h"
>  #include "xe_wa.h"
> +#include "xe_wedge.h"
> =20
>  #define DEFAULT_POLL_FREQUENCY_HZ 200
>  #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> @@ -905,7 +906,12 @@ static void xe_oa_stream_destroy(struct xe_oa_stream=
 *stream)
> =20
>  	mutex_destroy(&stream->stream_lock);
> =20
> -	xe_oa_stream_hw_teardown(stream);
> +	/* The poll timer may still be armed if the OA disable was skipped */
> +	hrtimer_cancel(&stream->poll_check_timer);
> +
> +	if (!xe_wedged(stream->oa->xe))
> +		xe_oa_stream_hw_teardown(stream);
> +
>  	xe_oa_free_oa_buffer(stream);
>  	xe_oa_stream_free_resources(stream);
>  }
> @@ -1704,7 +1710,8 @@ static void xe_oa_destroy_locked(struct xe_oa_strea=
m *stream)
>  {
>  	xe_pm_runtime_get(gt_to_xe(stream->gt));
> =20
> -	if (stream->enabled)
> +	/* A wedged device may be unresponsive, skip HW access */
> +	if (stream->enabled && !xe_wedged(gt_to_xe(stream->gt)))
>  		xe_oa_disable_locked(stream);
> =20
>  	xe_oa_stream_destroy(stream);

[Severity: Medium]
Can skipping xe_oa_disable_locked() and xe_oa_stream_hw_teardown() while
still calling xe_oa_free_oa_buffer() leave the OA unit writing reports via
DMA into freed memory?

xe_wedge_declare() marks the device wedged without resetting the GT that
owns the active OA unit in several paths, such as when another GT on a
multi-GT device fails reset in gt_reset_worker(), when a kernel queue job
times out in guc_exec_queue_timedout_job(), or when wedged_mode is 2.  In
those cases gt_wedge_worker() only stops GuC CT and sends
XE_GUC_ACTION_CLIENT_SOFT_RESET, which does not stop the fixed-function OA
hardware timer.

When userspace closes the OA stream fd before driver unbind or PCI reset,
OAG_OACONTROL_OA_COUNTER_ENABLE remains set and OA_TLB_INV_CR is not
written, while xe_oa_free_oa_buffer() -> xe_bo_unpin_map_no_vm() unpins
and frees stream->oa_buffer.bo (and send_tlb_inval_ggtt() returns
-ECANCELED when wedged), allowing ongoing OA report writes to corrupt
reallocated backing pages or recycled GGTT ranges.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118025140.3782=
678-9-umesh.nerlige.ramappa@intel.com?part=3D4
