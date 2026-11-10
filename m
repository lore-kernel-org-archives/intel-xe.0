Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31056606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ioRT8Zko
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBDB10E0EB;
	Tue, 10 Nov 2026 19:25:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAD310E0EB
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:25:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9000040340;
 Tue, 10 Nov 2026 19:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483211F0089F;
 Tue, 10 Nov 2026 19:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794338703;
 bh=2zzEsKxAcW7orcw8t6FFQwRYEg2/v43r4t38q1Cx/8w=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ioRT8ZkorNaHZwos3XnyYV5tt1/jYGoQRyZOZa5Pb0wsuHOtHKEawAiKXGeTDxRtN
 wuXK54J/TqPmdEzfVzew2MCcsVS7Kut2P9q77PMlTRphZYCpNS24IsM55mkTfZ+X0E
 +XIQMgOaElZ2au0RN/wpo4q6xDsv479yk7QJaJMnEg8N6lbTXn4zo/1UrGhAn/4CT9
 lWQi+MSNkVtzJiq7k84ADZKq7azdVeOhVzuMaVZ/EXjjaN7hQGOxDIC3K2eZw5NUBa
 ppKPJZt1mhyoqhqMDx+GlNrCzxAvn1edoZbxQCeUTDQCkrpO81tyQU1ZfQx+HlDTSZ
 2SpvLHIhYFRAQ==
Message-ID: <sashiko-outbox-207653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110190052.3514226-14-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
 <20261110190052.3514226-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:25:02 +0000
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
- [High] drm/xe/oa: context LRI batch fence in xe_oa_load_with_lri() is
  never drained
- [High] drm/xe/oa: post-teardown HW programming when
  xe_oa_stream_drain() times out
--

commit a42a6ce61696e1b256881421425e340fba9f094d
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Wait for in-flight OA batches before stream HW teardown

This commit records the LRI batch fence in stream->last_fence and adds
xe_oa_stream_drain() to wait for stream->last_fence before tearing down
OA hardware state on stream destruction.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 6383a2e036ab0..d2bd9622109af 100644
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
Can an OA config batch still program the hardware after teardown when
dma_fence_wait_timeout() times out here?

When xe_oa_emit_oa_config() submits a batch with both an unsignaled input
sync and an output sync, xe_oa_submit_bb() attaches the input sync as a
scheduler dependency via xe_sync_entry_add_deps() and returns without
waiting.  While that input sync remains unsignaled, the job sits in
q->entity before the scheduler's job_timeout_ms timer starts (or waits
behind earlier jobs on stream->exec_q).

If the stream is closed before the dependency signals,
xe_oa_stream_drain() times out after job_timeout_ms + HZ and returns
without killing the exec queue or canceling the job.  Because the pending
xe_sched_job holds a reference on job->q and free_oa_config_bo() keeps
oa_bo->bb->bo alive until stream->last_fence signals, signaling the input
sync after xe_oa_stream_destroy() completes will still run the batch on
the hardware after xe_oa_stream_hw_teardown() has restored the OA
registers, dropped forcewake, and cleared u->exclusive_stream.

>  /*
>   * Also drops forcewake, which accesses the HW too. On a wedged device t=
his is skipped and
>   * the forcewake reference leaks, which is fine: the device needs a rese=
t or rebind to
> @@ -914,6 +938,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
>  	/* The poll timer may still be armed if the OA disable was skipped */
>  	hrtimer_cancel(&stream->poll_check_timer);
> =20
> +	xe_oa_stream_drain(stream);
>  	if (!xe_wedged(stream->oa->xe))
>  		xe_oa_stream_hw_teardown(stream);

[Severity: High]
Does calling xe_oa_stream_drain() before xe_oa_stream_hw_teardown() leave
the context-restore LRI batch submitted during teardown undrained?

xe_oa_load_with_lri() is only reached via xe_oa_configure_oa_context().
During xe_oa_enable_metric_set(), the fence it stores in
stream->last_fence is immediately overwritten by the subsequent
xe_oa_emit_oa_config() call (or left undrained if xe_oa_emit_oa_config()
fails and jumps to err_put_k_exec_q).  During teardown,
xe_oa_stream_hw_teardown() -> xe_oa_disable_metric_set() ->
xe_oa_configure_oa_context(stream, false) calls xe_oa_load_with_lri() and
updates stream->last_fence after xe_oa_stream_drain() has already run.

As a result, the LRI batch that clears OACTXCONTROL, OAR_OACONTROL or
OAC_OACONTROL, and RING_CONTEXT_CONTROL remains in flight on
stream->exec_q after forcewake is released, the OA buffer is unpinned and
freed, and the OA unit is released for reuse by a new stream.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110190052.3514=
226-9-umesh.nerlige.ramappa@intel.com?part=3D5
