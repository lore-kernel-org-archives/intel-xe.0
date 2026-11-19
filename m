Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3760A2619
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KbIdfeKp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2010E391;
	Thu, 19 Nov 2026 00:48:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE7910E391
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:48:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B70176402D;
 Thu, 19 Nov 2026 00:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6351F000C8;
 Thu, 19 Nov 2026 00:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795049291;
 bh=zw3A3Acgj289cWUsLnjYygKIxgZWppkOHnFHC34ghZ4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KbIdfeKpMFL1465YuWNyncwiGcKA/4s5adKUDzHuwQFmFiJuqHJ4bkzoZgZZOsT9m
 a+J43xim1+LmZolKHFZkzNs0iZpvF4IURTE1yBktjM0AHLPZyXGyP6JiHpIALpbXEt
 bWGcW/WN3C904BgRRNSh9OmfLwyAMcBKBlMThUuY4pECLeHBgbMKQ1uzKYzk/6bqLX
 PT40voxkkvsxrlfXlJhc+mLFPdUNjkourtnNBBtLoIhWNxjIEW+8Ui3OHQneaen8Pb
 NEzEpdKuIFQnBM5i9+SdK52zVrHu23yhxakuBRoJjPguUUslFIUD5LVkt7/tM+wpjj
 r/q0pxhse+sWw==
Message-ID: <sashiko-outbox-222265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/8] drm/xe/oa: Free the OA buffer and the stream
 after the stream destroy
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-17-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 00:48:10 +0000
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
- [Medium] drm/xe/oa: xe_oa_free_oa_buffer() without rpm ref races with
  D3cold evict
--

commit e0096ecf7691779fa66e916b1237581810b85b60
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Free the OA buffer and the stream after the stream destroy

This commit moves freeing the OA buffer, destroying stream_lock, and
freeing the stream structure from xe_oa_stream_destroy() and
xe_oa_destroy_locked() to their callers, xe_oa_release() and the error
path in xe_oa_stream_open_ioctl_locked().

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f3eceeb34e7b6..223419347eb7b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -929,8 +929,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
> =20
>  	WRITE_ONCE(u->exclusive_stream, NULL);
> =20
> -	mutex_destroy(&stream->stream_lock);
> -
>  	xe_oa_stream_drain(stream);
> =20
>  	if (stream->sample)
> @@ -939,8 +937,6 @@ static void xe_oa_stream_destroy(struct xe_oa_stream =
*stream)
>  	xe_oa_disable_metric_set(stream);
>  	xe_exec_queue_put(stream->k_exec_q);
> =20
> -	xe_oa_free_oa_buffer(stream);
> -
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
> =20
> @@ -1772,7 +1768,6 @@ static void xe_oa_destroy_locked(struct xe_oa_strea=
m *stream)
> =20
>  	drm_syncobj_put(stream->ufence_syncobj);
>  	xe_pm_runtime_put(gt_to_xe(stream->gt));
> -	kfree(stream);
>  }
> =20
>  static int xe_oa_release(struct inode *inode, struct file *file)
> @@ -1784,6 +1779,10 @@ static int xe_oa_release(struct inode *inode, stru=
ct file *file)
>  	xe_oa_destroy_locked(stream);
>  	mutex_unlock(&gt->oa.gt_lock);
> =20
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
> +	kfree(stream);
> +
>  	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);
> =20
> @@ -2052,6 +2051,8 @@ static int xe_oa_stream_open_ioctl_locked(struct xe=
_oa *oa,
>  		xe_oa_disable_locked(stream);
>  err_destroy:
>  	xe_oa_stream_destroy(stream);
> +	xe_oa_free_oa_buffer(stream);
> +	mutex_destroy(&stream->stream_lock);
>  err_free:
>  	kfree(stream);
>  err_syncobj:

[Severity: Medium]
Can calling xe_oa_free_oa_buffer() after the stream's runtime PM
references have been dropped race with D3cold pinned-BO eviction and
restoration?

stream->oa_buffer.bo is pinned with XE_BO_FLAG_GGTT, which places it on
xe->pinned.early.kernel_bo_present.  When D3cold is allowed,
xe_pm_runtime_suspend() and xe_pm_runtime_resume() walk the pinned lists
via xe_bo_apply_to_pinned(), which drops xe->pinned.lock before locking
the BO:

CPU0                              CPU1
xe_oa_release()                   xe_pm_runtime_suspend()
  xe_oa_destroy_locked()            xe_bo_evict_all()
    xe_pm_runtime_put()               xe_bo_apply_to_pinned()
                                        spin_lock(&xe->pinned.lock)
                                        xe_bo_get(bo)
                                        list_move_tail(&bo->pinned_link, ..=
.)
                                        spin_unlock(&xe->pinned.lock)
  xe_oa_free_oa_buffer()
    xe_bo_unpin_map_no_vm(bo)
      xe_bo_lock(bo, false)
      xe_bo_unpin(bo)
      xe_bo_unlock(bo)
                                        xe_bo_evict_pinned(bo)
                                          xe_bo_lock(bo, false)
                                          WARN_ON(!xe_bo_is_pinned(bo))
                                            <-- returns -EINVAL

If runtime suspend finishes first and a subsequent runtime resume races
with xe_oa_free_oa_buffer() on platforms where mert_wa_14026633728 places
the OA buffer in VRAM, xe_bo_restore_pinned() also reads bo->backup_obj
before acquiring xe_bo_lock(bo, false), racing with xe_bo_unpin() freeing
bo->backup_obj.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119002737.3899=
877-10-umesh.nerlige.ramappa@intel.com?part=3D7
