Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46860C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 01:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30F410E08F;
	Mon,  8 May 2023 01:17:58 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C079310E08F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 01:17:57 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-38de3338abeso2064464b6e.1
 for <intel-xe@lists.freedesktop.org>; Sun, 07 May 2023 18:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683508676; x=1686100676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8pfzOB0x/moPscWpyoRQ0MaMSQNDX1Q92Hr/lASJhK4=;
 b=b+8bZ6JdQ87cdZHJ6EWO+IxoxfiGDWNUL4wD52jLegsFzddm7VbPj1TJha3WWsizfz
 E7StqVsM+L36z60rXPSDHS+SaX/c8g8BQs6VlI8bN3hAYLuE39aIU6LNcxdV5dn5ngGV
 J1zY6BGftUtmGbP+w1LuKbiKCYfbM+aL9CKPj4vbJ3w7bdlJBIT2L2DbGj87w6MI3EK0
 mc85Bh//Pk6JqkSErdyAo0zQvN2SfJuKdDRxDIiIoMsvnfbxB7nw2oqgsQMs5ckpIPQb
 sJARZ+cDevnxT72CIltaxA/CFYqYqwIDIivdD4ZsLz9q5Qlq0qcMw2TtcPr/vPiu83kw
 zgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683508676; x=1686100676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pfzOB0x/moPscWpyoRQ0MaMSQNDX1Q92Hr/lASJhK4=;
 b=kNCS+xK60Jk77SH1bllwzytJLgHyZRo8XKKnZSmmnADaeXXzKnuhzSYPDImqk7c37R
 ay/JIAOllwLymGOm/UNglLGXwA4MMdYC9z+wvXgV6MCU6HN4W+grK9BMsiU8XQF0GiqB
 htjlcMtEGlF1RbG4eZQQEyawvMM6brnBFiGlNqpBJYrtMoqX0piOhHbWaRUeItNMMhRm
 mCjroApOJL1q5DXGThffQ1Jo2oEcA47I6HWEf+q1zUp36nM3wfrTRuZap16zZYpLBokW
 anMYynIqj0dkn1VgPNjKQ5/H4J0b2xuqo8/SfsgjXJkg4K5LCJxNxgG6qJcw6KlANiEg
 KRwQ==
X-Gm-Message-State: AC+VfDwOT/xg++TSwF65blY2FRi6W1kdyQTiJlYO5Ie7fuEIJgUf4GPX
 RrmH1U/4mqRod2B6FU7X2uu+0VeAzJRfb0ZWCHY=
X-Google-Smtp-Source: ACHHUZ5NhPU/Hc/k3ZTxwVPRm5/AZ2Hdm1HURG1QtBzmoZQ37fO+KNiXtCPFt0vbmx5fgvt8zE0Fsdm4d/3CoYD0yoM=
X-Received: by 2002:a05:6808:298c:b0:38e:4b70:a5d6 with SMTP id
 ex12-20020a056808298c00b0038e4b70a5d6mr4003414oib.24.1683508676521; Sun, 07
 May 2023 18:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
In-Reply-To: <20230502001727.3211096-8-matthew.brost@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 7 May 2023 18:17:45 -0700
Message-ID: <CA+aRtuaq3G0k2qPtDce5or4Sffkc+-m46-uXeXDSLAuTYyBfPQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a3f46805fb24684b"
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <mattthew.brost@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--000000000000a3f46805fb24684b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, you've typoed your email address as mattthew.brost@intel.com in a few
places here, including the Signed-off-by. It has also ended up in the CC
list for reply-all.

On Mon, May 1, 2023 at 5:17=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om>
wrote:

> Not needed and causes some issues with bulk LRU moves.
>
> Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 272f0f7f24fe..6c427ff92c44 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct
> xe_vma *vma,
>                  */
>                 xe_bo_get(vbo);
>
> -               tv_bo.bo =3D &vbo->ttm;
> -               tv_bo.num_shared =3D 1;
> -               list_add(&tv_bo.head, &objs);
> +               if (!vbo->vm) {
> +                       tv_bo.bo =3D &vbo->ttm;
> +                       tv_bo.num_shared =3D 1;
> +                       list_add(&tv_bo.head, &objs);
> +               }
>         }
>
>  again:
> --
> 2.34.1
>
>

--000000000000a3f46805fb24684b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also, you&#39;ve typoed your email address as <a href=3D"m=
ailto:mattthew.brost@intel.com">mattthew.brost@intel.com</a> in a few place=
s here, including the Signed-off-by. It has also ended up in the CC list fo=
r reply-all.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 1, 2023 at 5:17=E2=80=AFPM Matthew Brost &lt;<a=
 href=3D"mailto:matthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Not needed =
and causes some issues with bulk LRU moves.<br>
<br>
Signed-off-by: Matthew Brost &lt;<a href=3D"mailto:mattthew.brost@intel.com=
" target=3D"_blank">mattthew.brost@intel.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/xe/xe_vm.c | 8 +++++---<br>
=C2=A01 file changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c<br>
index 272f0f7f24fe..6c427ff92c44 100644<br>
--- a/drivers/gpu/drm/xe/xe_vm.c<br>
+++ b/drivers/gpu/drm/xe/xe_vm.c<br>
@@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe=
_vma *vma,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xe_bo_get(vbo);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://t=
v_bo.bo" rel=3D"noreferrer" target=3D"_blank">tv_bo.bo</a> =3D &amp;vbo-&gt=
;ttm;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv_bo.num_shared =
=3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;tv_bo=
.head, &amp;objs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!vbo-&gt;vm) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://tv_bo.bo" rel=3D"noreferrer" target=3D"_blank">=
tv_bo.bo</a> =3D &amp;vbo-&gt;ttm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tv_bo.num_shared =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0list_add(&amp;tv_bo.head, &amp;objs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0again:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000a3f46805fb24684b--
