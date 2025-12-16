Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE45D5C0C6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 03:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2282C10E5D8;
	Tue, 16 Dec 2025 03:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kmr+nmv5";
	dkim-atps=neutral
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60710E621
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 03:03:35 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7a02592efaso609640766b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 19:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765854213; x=1766459013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCsYpP4kG57ll11sX6pA37ofQFrcZscIKNKIIFf6+7U=;
 b=kmr+nmv51VCoENgGN1PYBJmoDGhK0WNC2XSbw63pquLkronVbdNQGPPjoIqBqkN0hM
 td7+054MPUIW7KFGxBNoZJbpHHppUz1PB2RM+lsVSTdUsioHbIKkF+tSFsHn8jjQbSLy
 nTMIaEA6NYazExDwotBIBA9j4klkIciX3ul2LpiFr/WlDQqoR/NCpPPCECkmY7D/kURd
 T2vgO88eg0npi7PwYQ+k+EpSCCTZyWSUduRYc43wwTI4SCL0S90CVb/pEnz/3EsqRw0Q
 nq9W4ad+fdrBcfrVgtJY7ttgwZp017tqoZYdaIXavCPaZ3mZ52NQFlTSNQvaq1Dz7eck
 juDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765854213; x=1766459013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vCsYpP4kG57ll11sX6pA37ofQFrcZscIKNKIIFf6+7U=;
 b=JTXIN8VKL7A2AyVW1KW2oq8iX1VDR79O6sjltpVjWNZOy4fnnPOoayVJQu9U7I8RwU
 S9G4IWfDZtJlRK54ipvowbI2+u6+ez54LTY7Vy2FXMq/8BBd49VbNWn4KSRtNMG/sm1J
 /93d9f5B7yXW4FSu7Yz4m6R2gBNjdJWup4nCJ5xmV221ZQEyZTMzsgQUv/EPeYtuAkZg
 Kgu9+V9IDVk0dwlXxmfREZPqRY5ebgsRlMmc2iHq/ESCWRw/smgY2nAffcP9WqGoBB62
 NMSfpjMfmyokUwzlHS3gckDUL0hhSUWNigBDHB4eTlXOKObAceWVwX/qZLBix5nXJaQb
 cB4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzQ5LLDoQbrgUsaPf+N2MASYBaoJByUzotnEEseqRnEKy2u7uUIzRDPMNMHqudye7TZ3PBxaR/Wg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqOznqAZrgbw06X7DxBkoOvQdtzTCrf+miBKhLSJ0ifEG5DWJR
 Xwq4PjzxxxDxLXfbQJ+XVWJB9e4Uz03fjxkGjytB9CRvYdKVhgLXV40+DqVOExgVaxEdmDliJg3
 I4PZOD5qv+pWw5hXyO9wLYkKCv9gD33iVIVx3
X-Gm-Gg: AY/fxX43E7GkrS3nX5zZPqTdPNkOd/amscgziImPI8niz0qzyJmoMZDsxsSq0rzPYlm
 XZsO6Q+Zry14YKt/a6mSi2ILQBj/cA6CWYo+NjdNG10oc08lwIiVPZy4R89eqhW7+4/gh7iKrQN
 8IxaqKj2ZIRHMKsO4D0/ZCTc45GWRUSkfWRDzFjaUacuyRzQECjq8gLKbZovQMCr5gG224zO/oc
 MdwTPWfnBpJVt17sTw8jCswhlte8IDRWx8Vsk0KYr5x8sxhAxvZco3i8yG6Rc/JCIoWgUzP
X-Google-Smtp-Source: AGHT+IHi78t43mdDJwWUQLX5294p4FXlpYBzrWdjP3wVNK8yi2OvPo+22UY7uYARNOiXVqBhUWaPnGfElHZWs/Pl6hQ=
X-Received: by 2002:a17:907:3c91:b0:b73:32c7:6e6a with SMTP id
 a640c23a62f3a-b7d23665a3emr1246788866b.25.1765854212905; Mon, 15 Dec 2025
 19:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
 <20251215150807.58819-21-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251215150807.58819-21-tvrtko.ursulin@igalia.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 16 Dec 2025 11:03:19 +0800
X-Gm-Features: AQt7F2qp7kXjU0BkBzroysuOZQ6ms4OfftVAxdLTz1keITVqgV7U-l8_XxQ7ekQ
Message-ID: <CAKGbVbtziYenWBOHQA+BJMS_1suM-CQMF8i=gpA83he_iKYFZg@mail.gmail.com>
Subject: Re: [PATCH v4 20/28] drm/lima: Remove drm_sched_init_args->num_rqs
 usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.or, 
 intel-xe@lists.freedesktop.org, kernel-dev@igalia.com, 
 lima@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Mon, Dec 15, 2025 at 11:08=E2=80=AFPM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: lima@lists.freedesktop.org
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index 9a1e6b9ecbe5..0a01213c4878 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -521,7 +521,6 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe=
, const char *name)
>                                lima_sched_timeout_ms : 10000;
>         const struct drm_sched_init_args args =3D {
>                 .ops =3D &lima_sched_ops,
> -               .num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
>                 .credit_limit =3D 1,
>                 .hang_limit =3D lima_job_hang_limit,
>                 .timeout =3D msecs_to_jiffies(timeout),
> --
> 2.51.1
>
