Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730E606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0qyRX7U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A28310FC12;
	Wed, 18 Nov 2026 13:03:44 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3DF10F378
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 18:15:06 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-571eb508edaso761805b6e.3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 10:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852905; cv=none;
 d=google.com; s=arc-20260327;
 b=g6DysBTqT/mhaQvgumtbAWQLd+ek2+oqjuZU9tZD06wXHNo9AnYueJ2jlXJRa++QS5
 R8sEB+N5qDq7w5ht9ueltH71pvOvlszqm2w5wjJVsQ6Qw2CD21fyvifGzDnCTc1jNyBb
 HPEz/7Yt+2WztLXlwgLv/zja89D1hf12SitGZba38HNCs9A/39GsOrTTB0lOpJ/wKKhA
 Nla6amtmT5gIig9Tua5TG5UJ2rRMd+G3r8CQzv+tujM4ZwSWnSuyG2nLQH9+t16iNvTl
 J1fslvI5G9Rwolynwpa1nxk5iqSqVxg73ubpjrUtbZmB6uoPuOzDtTg1kxKvDEYju5mh
 1svQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
 fh=uV299MhVNeS7inzicY3g+4CFq/tSPN1yLART4V7B+iY=;
 b=fHjk6a7ipw4j7RGbiwbdG6iYURJerkShNm+iCefYwZ5VDUS23kKGa3m/vHlYLLLWLl
 KltFZ8rxuCBKRlwkHY2+hEN/VUyeNkkswZa/5HtOEOs0BfZ9Il1751qoj9H4AIGG1UHm
 UoJp+/pvkHdSkGGR9OJ30Riuu3IrgCmfwNxjcS7dvXw+GE/3K4lFY2BG+7T9nj9mU/3/
 D3A62gi+YPDFoWSB7lR5L3HpknPQqP8TYGTV8NjdP7gTv15BMjER3Iu+aocPN30IZfyN
 OpsFJM/HBtPZUzX6jNbwZpFGCEmMG/jGFeZugg3pz21iLRjlKdFDWoVPG5m9GXRbVYHs
 +EXw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794852905; x=1795457705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
 b=c0qyRX7UdV90LvNizrajXTM0opkb5lod5vS3/U2DNIxHTa1TjM6uff6yJfdy+Zd8Zv
 /LugjRmVcboaareQmhBqgr2tqaoNUCXbqYFM0GOhiz/Pe56OsSCFh/Bp7jw9p3vlDjud
 j7wc6xYQSe5fbtqHC0AaenOCLhFES+93LQj3PD9A2i+T2Q973YQXBrtCQtXmgcVdpASy
 gcgI6uA8NfT/h/rw1Fsq5Yh1d2gn+a7/trHwFjugHksvA8N+RuhG5g5xAKOkSjs3zixc
 zR2drf9qUNVDn6hSwz5P5lDleeInVWpWhG30By6jPEKbzT1RMW9yzpC+0VF5GVvIvArD
 yNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794852905; x=1795457705;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Y9VFYmn0OLSOPuVThwD952io40l2TovP2T7RuvsEtdM=;
 b=r1lpTn2yyne7VvixEMRoGHUVQp8jaOb2UeZKL6anW8O6hNbgiX6NN/7m2NrPolF1Uy
 kGxUuq2Y0Q47xtB2dJ+F/VhCmwgL7DocGxHQHV8fJxoKAPljBF8wNwRVX198ot7pXBfp
 PP/b0s0IYaE2Z9Bq2pf7zOQPPMEGGI9PVerSF+g61Ak4UwItD6brZWiPiK7W2PDg8i0c
 k/5W4RlhP9UOqkiGVTth0okJvsIYBsVlKRzHJebE3q2+jplYhfItRs2Oi25Bg0fvGXR1
 LF0qcs9SgzixelA9BSXU2Dq7lzzEWSfcv/yggexWYaXykIAF/TQVlTIgwH0LJCLbs5pM
 WbRw==
X-Forwarded-Encrypted: i=1;
 AL+hErF5+PThWNitaLCB+CIbmpYlf+3p/9qCS/0UyXoRumfZfe6b1gGEEE1/BDLTpcWiUljSPnNZxagLJA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8n4i9pvlPpYD6OmtjVIKLtJLwZ1ByfMi/rhNKHopfESTiICD/+
 i0mbCnHQe52TpKJyJZJEPwCG6RBCqh7j4UsyuBW5bBmaBNV/gJqyjpN2SmKG3hm5bxSMffoJw+y
 z4CL1BZHnpypxeQKk0b0oNVpJA/0pizk=
X-Gm-Gg: AYBFou11tZnw/fwevvVyRvP+nE3BSqVvsfc4k2ECMx81DdnEatNdFZpfKhkJirUtK1q
 0TsVocno8LaAIp2Q8nMaKDMhh83Tep/4CKJ0NLJywoC2XTqMNz5WaLNMcWpvTm1K5tJAIUsRAeB
 kKaoZm4V4dsV4CRfYzUMgP9q3v51/kRPVLaB9bbzEZCpZTIdCvXVSLHPc7GRPbYMngl2Lt5V7Gf
 EDYSDj0vebi3R6dfwPY6zkqh4lDlpaiSS2642EswpeiEdarqKe+l0rjUHn8LXWUfrNZXvbD2nzO
 mWSKdjZ1lUUm0vlcRDkxhdwVSnijcGbFuzV7YRGUhoP+ZTY96XYAB9mao8A5GUQ1ajeRruw0ysH
 G66+s8G9WeC1zyVO6+LMbS7oIMkqXjPIJwaDZsLR39OPkTjvb8jxecmgDGqsDYtdGGe3tUWtgl3
 dNjDYeNfFdJTlPgzBE5a5z/gUIIuouwHXZNWmU0SchMWpqacCpbQ==
X-Received: by 2002:a05:6808:4f5e:b0:53b:11c7:2da0 with SMTP id
 5614622812f47-56e63285bd9mr11614093b6e.21.1794852905260; Mon, 16 Nov 2026
 10:15:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108060418.4554-1-sowmyatorra@gmail.com>
 <20261108075335.13248-1-sowmyatorra@gmail.com>
In-Reply-To: <20261108075335.13248-1-sowmyatorra@gmail.com>
From: Sowmya Torra <sowmyatorra@gmail.com>
Date: Mon, 16 Nov 2026 23:44:54 +0530
X-Gm-Features: AclHuK80DRIS82kx7xBKjBoqWiP5iWpB5RL4yuJG733QwPO3EG-EZ7zh6pOiZ0o
Message-ID: <CAFsBPPnsv2xbLXHQfM66h6RdK1+mGR91S=D86OzKzmds1cTPnA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/xe: Remove unused xe_vm_restart and xe_vma_flush
 tracepoints
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 outreachy@lists.linux.dev, rostedt@goodmis.org, julianbraha@gmail.com, 
 julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 18 Nov 2026 13:03:43 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

I received a CI notification saying that testing could not start
because my email address is not on the allowlist.

The notification refers to my earlier patch removing only
xe_vm_restart. I have since sent v4, which combines the removal of
xe_vm_restart and xe_vma_flush.

Could someone trigger CI for v4? Please let me know if I need to do
anything on my side.

Thanks,
Sowmya

On Sun, Nov 8, 2026 at 1:28=E2=80=AFPM Torra Sowmya <sowmyatorra@gmail.com>=
 wrote:
>
> Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
> binds") removed the calls to trace_xe_vm_restart() and
> trace_xe_vma_flush(), but left both event definitions behind.
>
> Remove the unused definitions from xe_trace_bo.h to avoid
> generating code and data for events with no remaining callers.
>
> With the tested x86-64 configuration, size reports a reduction of
> 888 bytes in xe_trace_bo.o, from 20262 to 19374 bytes: 296 bytes
> in text and 592 bytes in data.
>
> Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
> ---
> Changes in v4:
> - Combine the xe_vm_restart and xe_vma_flush removals as requested
>   by Steven. This replaces the separate patches for these events.
> - Report the measured combined object-size reduction.
>
> Changes in v3:
> - Add the Fixes tag.
>
> Changes in v2:
> - Document the measured object-size reduction.
>
>  drivers/gpu/drm/xe/xe_trace_bo.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_tra=
ce_bo.h
> index 86323cf3be2c..a6802f6d3a01 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -115,11 +115,6 @@ DECLARE_EVENT_CLASS(xe_vma,
>                               __entry->end, __entry->ptr)
>  )
>
> -DEFINE_EVENT(xe_vma, xe_vma_flush,
> -            TP_PROTO(struct xe_vma *vma),
> -            TP_ARGS(vma)
> -);
> -
>  DEFINE_EVENT(xe_vma, xe_vma_pagefault,
>              TP_PROTO(struct xe_vma *vma),
>              TP_ARGS(vma)
> @@ -228,11 +223,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
>              TP_ARGS(vm)
>  );
>
> -DEFINE_EVENT(xe_vm, xe_vm_restart,
> -            TP_PROTO(struct xe_vm *vm),
> -            TP_ARGS(vm)
> -);
> -
>  DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_enter,
>              TP_PROTO(struct xe_vm *vm),
>              TP_ARGS(vm)
> --
> 2.47.3
>
