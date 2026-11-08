Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C2606A334
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/4XsHrD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A310C10F30B;
	Mon,  9 Nov 2026 13:57:01 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5445910E4A9
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Nov 2026 07:18:08 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-6d68de53053so186629eaf.0
 for <intel-xe@lists.freedesktop.org>; Sat, 07 Nov 2026 23:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794122287; cv=none;
 d=google.com; s=arc-20260327;
 b=Gbe7mqPAQMpKpggbg64hgOUyHm/eXVk6EXueH7riPvbbsMJ2EomhjuygZ0LIHmg6Pp
 Jg2b4+94U/rw09hO2T1Dx5cCcCu6sbWf1tXaxcbz+yxb3aDgWm9+NDQQk7wbzNmun5Ex
 AVilvmWIi7yUF00EDRPZO0AS0dDgmdEN5q1bbYVFQUmn+kY0rzIXUtynbiggfqsGcxql
 9NjznHrpCu759s4c4OccgSgv7UwK1kks9+Yqd+ueeRucM100GK1YfBDjbBK1onW+kpkw
 5IcEPem0s1Kkc2hvUikEAub3BhXRqlT+bw27YLeT/0E2SQhX1+gqUBBdMusfcLx/7Rcc
 +bBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
 fh=PfqZdTPQ8MPX5W9of609wvsm7XiQ+J65+frV0ZZ1rNU=;
 b=BzlDHWFsg/e1NtgkUEo8XqdWFqI+HF4tpXAjTFuTM95NWfaAKZnJVeVudVGR+EqZwS
 gEtkTx9r3Q8ux3FrgqlS42jQmEk1l2WxkadzBRjpVFL4DZrszKuOCbHfN38IqCN6DFWY
 rg6EWreCaGAC2Z8FzFMrdcNnmrKFk0ucqBk8uwC2lGVCYCZnjpZZBQRO/eMfvWAd3wDn
 y8B5DAmPvq/8ccMlbajRHREvhZWuXcigtvHB/6CvLzKMPfqGWoGlTg40DeM9VmrXM1qX
 4me9xol1HsYNzr2e+wiIHEP5d2AHdpeaUkiRpbQdqb5DnzjDvnZdZfi2T5salIevBX8q
 gkEQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794122287; x=1794727087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
 b=l/4XsHrD2xFPZelAFDSw7XkeI36LxE73mGik45Bl7xWBG89rzjfUV24i95hSYq9+66
 jv8T2ckSDwXl/7Hzkz1LFoQONlmVEYLsootkWd5xiYoLeYswlfFXvhF31gLhKUEgFkFC
 zcSpYqzqeEjQKSjh+ZUp57EcvyqbZV4cWSXZh6UaAsOW08/RS/b/BlITlnDEJExqkWeu
 PSzyeBTftqTuMT7lydp6xZh2VHbT5xOruxklsNyXfi9SMQjFc6WNeLxazVW80PKS75Ds
 4AGo9P9+RfSFFz3xJTvl/n1CnV0WzrSC5yc6+/aTccFw/pbBXFM8rEQAMQFFv2TP0Xz3
 cIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794122287; x=1794727087;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NcRrq3gEPrpdv1ZQteio9YneHMJdpZak6tVDegOFnzM=;
 b=hfXFWCGe/pZlDmG/s7ExRMdwqBaqdoJcfC/heHGgfI9nRR1mKMK/81DAdOgWw3YPn3
 xNGKpdPmoP0xsot08z8AziPn6uI8bxpI9YwkeoM4EqhjUN16v07mlWtLKiVo/roQeXw9
 LnB/kWreN5awga5HkaHujjDMpv2ttrvAu5X3MOdRKgmnXlp+NAAHCY8Dd3lWB0kI43bb
 k8Rrcrh5VUjgynizo3LCcIYOt9kfZoqRxmXBw7oPnm++sSuZqlcgqJ+//XcWXwxBeEeA
 /32gSUVtQCxsJ8q+mSIbZYJvl3VvJnbqVQo/oRG0WRyWofznWqpVhZUC6Ch4x4ogH0CV
 tQHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByW/18FR/z19l23rfbidiNaq6IttmbhF7LClXYTkOQ46ArtCResv0QrC/DXuDj+lAhgtr6sr11aDA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9c+sUh92ZOx6Kmraomzz7yieJiJ8FSYYTCMr6bkEZ3zPntIOUk
 449a/iAr9XY+CeDe6GkmANxhRDtCL1cL6ajOfOASaWgPz9fFuhbzDDz+NQy825QCOFk33qBIqlo
 O/sJRRdphmiHFcjp694E/1+610KLZ5Tc=
X-Gm-Gg: AYBFou3729ojI1TDPgUzvPfTTg4vXsDp9e2g8s0qQ5bdq9aoNEuM0DANdaBbU6IMTQL
 ZxjyVyIuk9YoFVlZGfIO28gM6wXiA8uiQBD8zrf/BZovL6nNGNuJyO1s/pNnqVj2kFPzEDklkL5
 FwE0NND7bCsGG1dyRHRk7DKTkIKcKO5QUkKaXH03b6URYOwYIA1ROQIVjANFE2TXDj3CZlsUVd2
 VlAf36b/EZ59h3eUaRz4GIUco56hC/STIBFdoTWDtgfQQGHNap53zSHTZouaKNDWA6s+ztodC60
 rh3w/gR7loIE0hhwzaDGB5mTFBHksOGlneIqcfnLxuX6BXbXxeIEpXOCF8Bn34W3BwZddbGQLAH
 R+bT8DpZ4zpK1Nd7plwoM858YoxapOb4BYdScuulZyKzlsM4UCgapGxgWTxyRcYanh+4JwLQ5NB
 74VUbeJKucf4ygld942g6cFffSjmCKsbJvtHWjW4TRKq/jCLn2Wzy+mNZl5bYDHSUCeNY5Z0E=
X-Received: by 2002:a05:6808:23cb:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-568145d336emr529936b6e.44.1794122287109; Sat, 07 Nov 2026
 23:18:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101125808.9770-1-sowmyatorra@gmail.com>
 <20261108060418.4554-1-sowmyatorra@gmail.com>
In-Reply-To: <20261108060418.4554-1-sowmyatorra@gmail.com>
From: Sowmya Torra <sowmyatorra@gmail.com>
Date: Sun, 8 Nov 2026 12:47:55 +0530
X-Gm-Features: AclHuK_AWNWzoTHZGt6quHeK_0iVsD6npnwX0A7nfswTgR9HefL9of-94iq9oyA
Message-ID: <CAFsBPPmrD3ca=8-9c-baz+hEh7SBEr-n2nF0j2eZmDwp8h1Q+g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/xe: Remove unused xe_vm_restart tracepoint
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 outreachy@lists.linux.dev, rostedt@goodmis.org, julianbraha@gmail.com, 
 julia.lawall@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
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

I missed Steven=E2=80=99s request to combine this with the xe_vma_flush
removal before sending v3. Please hold off on applying this version.
I=E2=80=99m testing a combined revision and will send it shortly.

Sorry for the extra email.

Best regards,
Sowmya

On Sun, Nov 8, 2026 at 11:35=E2=80=AFAM Torra Sowmya <sowmyatorra@gmail.com=
> wrote:
>
> Commit f3e9b1f43458 ("drm/xe: Remove async worker and rework sync
> binds") removed the call to trace_xe_vm_restart(), but left the
> event definition behind.
>
> Remove the unused definition from xe_trace_bo.h to avoid generating
> code and data for an event that has no callers.
>
> With the tested x86-64 configuration, size reports a reduction of
> 436 bytes in xe_trace_bo.o, from 20262 to 19826 bytes: 140 bytes
> in text and 296 bytes in data.
>
> Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
> ---
> Changes in v3:
> - Add the Fixes tag.
>
> Changes in v2:
> - Document the measured object-size reduction.
>
>  drivers/gpu/drm/xe/xe_trace_bo.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_tra=
ce_bo.h
> index 86323cf3be2c..fa91dd2b2174 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -228,11 +228,6 @@ DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
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
