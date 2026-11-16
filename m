Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3DF606A335
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CoEvBlC/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04F110F4AF;
	Mon, 16 Nov 2026 23:00:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E5C10F4B0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 23:00:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BFA2360D52;
 Mon, 16 Nov 2026 23:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4731F000C7;
 Mon, 16 Nov 2026 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794870050;
 bh=BmaajiC3zULaOAuNBbLEKmaqxke2zgkQRHpBUKsdhnU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CoEvBlC/K6mumUF5AgyK7tsuUETFFJxvtuPJtEg1PqSnOmtoIiCQmazSSvMoQjuS+
 A+wR5XyUHEeVWKkEoKwbsksYE61JndJBYjGpC8ayuSIOTYJG5jYKBGVoJ3i5sOrz6S
 fah3fjOi9rq2ROBZDLJ/VhHmnygbJ3nwuAysUGXRE1aC9wXU24bcbv5TMf796k3CNL
 UFC4Hg888niIf2pQ2TZP1yDi9k73qGqyAA/LjoPBg5bRFm28GvVA3h5JvXP4CC7ZmT
 BFkA98dj4mVLu66AJfXk7ak9uwcqMka5JJfW7KdeEXa7axh5iAHvo4SILwL8KnNm/n
 8e1Xtdgz82G8g==
Message-ID: <sashiko-outbox-217833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261116222752.3677159-14-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
 <20261116222752.3677159-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:00:49 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/xe/oa: killing exec queue in xe_oa_stream_drain() leaks
  jobs and wedges GPU
- [High] drm/xe/oa: context LRI batch fence in xe_oa_load_with_lri() is
  never drained
--

commit 78c0868da376abbc9e627eede4220f1019cbf62e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Wait for in-flight OA batches before stream HW teardown

This commit records the LRI batch fence in stream->last_fence and adds
xe_oa_stream_drain() to wait for stream->last_fence before hardware
teardown, killing the exec queue if the wait times out.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8ed427ad67b48..1a37312de099c 100644
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
>  	dma_fence_put(fence);
> =20
>  	return 0;
> @@ -876,6 +883,38 @@ static void xe_oa_disable_metric_set(struct xe_oa_st=
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
> +	if (dma_fence_wait_timeout(stream->last_fence, false, timeout))
> +		return;
> +
> +	drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch, killing =
exec queue\n");
> +
> +	/*
> +	 * The batch is most likely still waiting for an input sync, which no T=
DR covers. Kill
> +	 * the exec queue, so the batch is dropped instead of run when the inpu=
t sync signals.
> +	 * A batch already on the HW gets cleaned up by the TDR the kill trigge=
rs, give it a
> +	 * moment.
> +	 */
> +	if (q->vm)
> +		xe_exec_queue_kill(q);
> +	else
> +		q->ops->kill(q);
> +
> +	dma_fence_wait_timeout(stream->last_fence, false, HZ);
> +}

[Severity: High]
Can killing q here wedge the GPU when q is stream->k_exec_q, and leak
jobs that are still waiting on an input sync?

When stream->exec_q is NULL, q is stream->k_exec_q, which is created with
EXEC_QUEUE_FLAG_KERNEL.  Calling q->ops->kill(q) invokes
guc_exec_queue_kill(), marking the queue killed and arming immediate TDR.
Once the job reaches sched->pending_list, guc_exec_queue_timedout_job()
checks timeout_needs_gt_reset():

drivers/gpu/drm/xe/xe_guc_submit.c:timeout_needs_gt_reset() {
	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
		return true;

	return !skip_timeout_check && !xe_sched_job_started(job);
}

Because EXEC_QUEUE_FLAG_KERNEL unconditionally returns true even when the
queue was killed, guc_exec_queue_timedout_job() triggers two asynchronous
GT resets and then fires a kernel WARN and wedges the device.

In addition, a batch blocked on an unsignaled input sync sits in
q->entity->job_queue rather than sched->pending_list.
guc_exec_queue_kill() only schedules TDR on sched->pending_list and does
not call drm_sched_entity_kill(q->entity), so stream->last_fence is not
signaled and the second dma_fence_wait_timeout() always waits out the
full HZ.  Because the queued xe_sched_job holds a reference on q via
xe_exec_queue_get(), xe_exec_queue_put() never reaches
xe_sched_entity_fini(), leaking the job, exec queue, config buffer, and
runtime PM reference if the input sync never signals.

> +
>  static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
>  {
>  	if (stream->sample)
> @@ -909,6 +948,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
>  	/* The poll timer may still be armed if the OA disable was skipped */
>  	hrtimer_cancel(&stream->poll_check_timer);
> =20
> +	xe_oa_stream_drain(stream);
>  	if (!xe_wedged(stream->oa->xe))
>  		xe_oa_stream_hw_teardown(stream);

[Severity: High]
Does xe_oa_stream_drain() ever wait for the fence recorded by
xe_oa_load_with_lri()?

xe_oa_load_with_lri() is only called from xe_oa_configure_oa_context(),
which runs in xe_oa_enable_metric_set() and xe_oa_disable_metric_set().
During xe_oa_enable_metric_set(), xe_oa_emit_oa_config() runs right after
xe_oa_configure_oa_context(stream, true) and overwrites
stream->last_fence; if xe_oa_emit_oa_config() fails, xe_oa_stream_init()
tears down the stream via err_put_k_exec_q without calling
xe_oa_stream_drain().

During xe_oa_stream_destroy(), xe_oa_stream_drain() runs before
xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
xe_oa_configure_oa_context(stream, false) submits the context-disable LRI
batch.  That teardown LRI batch is never waited on before
xe_oa_free_oa_buffer() unpins the OA buffer and xe_force_wake_put() drops
forcewake (and for OAC, after xe_oa_configure_oac_context() writes
__oa_ccs_select(stream) to OAG_OACONTROL).  Moreover, if
xe_oa_stream_drain() timed out and killed stream->exec_q,
xe_oa_configure_oa_context(stream, false) submits the disable LRI batch
to a killed queue that will never run it on hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222752.3677=
159-9-umesh.nerlige.ramappa@intel.com?part=3D5
