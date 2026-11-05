Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA42606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGKztrve
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882210F1B1;
	Thu,  5 Nov 2026 01:03:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3610E5D5
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 01:03:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 34F3E43D42;
 Thu,  5 Nov 2026 01:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14551F00919;
 Thu,  5 Nov 2026 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793840608;
 bh=8HEUrIff2fasJRXF3BG9l7B89ksogiUcL7ddZopL8IU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SGKztrve25f96YXk0GUxd2ih1UJ0G31IPnQ7pIirvqFj9LB8UfPtxM5bHSLbJ04D8
 hnTHcpbskCj+wiIgcbSSlp7N0h8vio4eYOHAWEdiIFgkO8LCoY3VrdNRdR9SlaheAN
 skoMiat9YDttxWHsT9zRec6rJOnUlSI9bF3/PZaOxiMEZM/hetWOP3yAPxgbTKQcKM
 B/wJanK0msmHACY2RxTQE/85i3NyAKhgYnVIMIeTW007aqyj+GILKxMnd6lSE0ZSgY
 qpLsii2VLy5NPG1RhWqVSDr5EMPUkebypKRy59awXxICX1Fst9OVWLQrORae8UCftM
 +3Ib0YJdra2uA==
Message-ID: <sashiko-outbox-198380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261105001559.3288915-14-umesh.nerlige.ramappa@intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
 <20261105001559.3288915-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:03:27 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/xe/oa: context LRI batch in xe_oa_disable_metric_set() is not =
drained
- [High] drm/xe/oa: post-teardown HW programming when xe_oa_stream_drain() =
times out
- [Medium] drm/xe/oa: missing xe_oa_stream_drain() on xe_oa_stream_init() e=
rror path
--

commit 82829afb190084d0c0c592c6968d740225601cf9
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Wait for in-flight OA batches before stream HW teardown

This commit records the fence from context LRI batches in
stream->last_fence and adds xe_oa_stream_drain() to wait for
stream->last_fence with a timeout before running hardware teardown when an
OA stream is destroyed.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 7552ace821caf..31fc1e7675de0 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -733,6 +733,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *=
stream)
>  	dma_fence_put(stream->last_fence);
>  }
> =20
> +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct =
dma_fence *fence)
> +{
> +	dma_fence_put(stream->last_fence);
> +	stream->last_fence =3D dma_fence_get(fence);
> +}
> +
>  static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa=
_reg *reg_lri, u32 count)
>  {
>  	struct dma_fence *fence;
> @@ -753,6 +759,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *s=
tream, struct xe_oa_reg *re
>  		goto free_bb;
>  	}
>  	xe_bb_free(bb, fence);
> +	xe_oa_update_last_fence(stream, fence);

[Severity: Medium]
What happens if xe_oa_enable_metric_set() fails in xe_oa_emit_oa_config()
after xe_oa_configure_oa_context(stream, true) has already submitted the
enable LRI batch via xe_oa_load_with_lri()?

In drivers/gpu/drm/xe/xe_oa.c, xe_oa_enable_metric_set() submits the
context LRI batch before emitting the OA config:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_enable_metric_set() {
	...
	if (stream->exec_q) {
		ret =3D xe_oa_configure_oa_context(stream, true);
		if (ret)
			return ret;
	}

	return xe_oa_emit_oa_config(stream, stream->oa_config);
}

If xe_oa_emit_oa_config() fails (for example, due to an allocation failure
or xe_sync_entry_add_deps() error in xe_oa_submit_bb()),
xe_oa_stream_init() jumps to err_put_k_exec_q:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_stream_init() {
	...
err_put_k_exec_q:
	xe_oa_disable_metric_set(stream);
	xe_exec_queue_put(stream->k_exec_q);
err_free_oa_buf:
	xe_oa_free_oa_buffer(stream);
err_fw_put:
	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
	xe_pm_runtime_put(stream->oa->xe);
	xe_oa_free_configs(stream);
}

Should this error path also call xe_oa_stream_drain(stream) so that the
in-flight LRI batches from enabling and disabling the OA context are
waited on before forcewake, runtime PM, and stream->last_fence are
released?

>  	dma_fence_put(fence);
> =20
>  	return 0;
> @@ -876,6 +883,23 @@ static void xe_oa_disable_metric_set(struct xe_oa_st=
ream *stream)
>  		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE=
, 0);
>  }
> =20
> +/*
> + * Wait for the last OA batch of the stream, so that it can't program th=
e HW after the HW
> + * teardown.
> + */
> +static void xe_oa_stream_drain(struct xe_oa_stream *stream)
> +{
> +	struct xe_exec_queue *q =3D stream->exec_q ?: stream->k_exec_q;
> +	long timeout;
> +
> +	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
> +		return;
> +
> +	timeout =3D msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
> +	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
> +		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");
> +}

[Severity: High]
Can an OA config batch still execute and program OA registers after
xe_oa_stream_hw_teardown() if dma_fence_wait_timeout() times out here?

When userspace opens a stream or calls DRM_XE_OBSERVATION_IOCTL_CONFIG
with both an unsignaled input sync (without DRM_XE_SYNC_FLAG_SIGNAL) and
an output sync (with DRM_XE_SYNC_FLAG_SIGNAL), xe_oa_emit_oa_config()
calls xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb), which
attaches the input sync to the job via xe_sync_entry_add_deps() and
returns without waiting because num_signal is non-zero.

While that input sync remains unsignaled, the job stays queued in
q->entity waiting on the dependency callback and the scheduler TDR timer
has not started. If the stream is closed before the input sync is
signaled, dma_fence_wait_timeout() in xe_oa_stream_drain() will time out
after q->sched_props.job_timeout_ms + HZ and return without killing the
queue or canceling the pending job.

Because the pending xe_sched_job holds a reference on job->q until
xe_sched_job_destroy(), xe_exec_queue_put(stream->k_exec_q) in
xe_oa_stream_free_resources() does not destroy k_exec_q or tear down its
scheduler entity. If userspace signals the input sync after
xe_oa_stream_destroy() has finished, wouldn't the scheduler wake up and
run the OA config batch on the hardware after OA registers have been
restored and forcewake has been released?

[ ... ]

> @@ -913,6 +937,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
> =20
>  	mutex_destroy(&stream->stream_lock);
> =20
> +	xe_oa_stream_drain(stream);
>  	if (!xe_wedged(stream->oa->xe))
>  		xe_oa_stream_hw_teardown(stream);

[Severity: High]
Does calling xe_oa_stream_drain(stream) before xe_oa_stream_hw_teardown()
leave the context-restore LRI batch submitted during teardown undrained?

During stream enable in xe_oa_enable_metric_set(),
xe_oa_configure_oa_context(stream, true) is immediately followed by
xe_oa_emit_oa_config(), which overwrites stream->last_fence with the
config batch fence.

Then, during teardown in xe_oa_stream_destroy(), xe_oa_stream_drain() runs
before xe_oa_stream_hw_teardown():

xe_oa_stream_destroy()
  xe_oa_stream_drain()
  xe_oa_stream_hw_teardown()
    xe_oa_disable_metric_set()
      if (stream->exec_q)
        xe_oa_configure_oa_context(stream, false)
          xe_oa_configure_oar_context() / xe_oa_configure_oac_context()
            xe_oa_load_with_lri()
              xe_oa_update_last_fence(stream, fence)
    xe_force_wake_put()
  xe_oa_stream_free_resources()
    xe_oa_free_configs()
      dma_fence_put(stream->last_fence)

When stream->exec_q is set, xe_oa_disable_metric_set() submits a new LRI
batch to restore OACTXCONTROL, OAR_OACONTROL or OAC_OACONTROL, and
RING_CONTEXT_CONTROL, updating stream->last_fence after
xe_oa_stream_drain() has already completed. xe_oa_stream_hw_teardown() and
xe_oa_stream_free_resources() then immediately release forcewake, runtime
PM, and stream->last_fence without waiting for that LRI batch to complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105001559.3288=
915-9-umesh.nerlige.ramappa@intel.com?part=3D5
