Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A780EC77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 01:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3C910E11C;
	Tue,  2 May 2023 01:54:43 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF9510E11C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 01:54:41 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7606d460da7so59065139f.1
 for <intel-xe@lists.freedesktop.org>; Mon, 01 May 2023 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682992480; x=1685584480;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=rJXpoici5tA4MSmCzlu5OW0HB34Nf9VYQQfNaRRaMik=;
 b=RwSvgILz5gHrlQG3EtVhxmG2FD5yXHuaSQ+8o/JZwNR2JCZ/kgBz99t5T3oj/4kI2A
 pBXoKR6xHkQ8CsDiwEPK3m4ERAKDXOoopyfOQ1SEnfbE8yHZx9ODM2ERlmIO3MOA9yU6
 D11cBZ6t3yVIQMGO2gtpp+4ltBVdTGiB1nj0PSTd8s1iaMZ0d3BywYU1ALugNoTCmuhZ
 sqRj8fmYMbB2Q1OwUCG40bGkRwJvyx8Ca/rfHK3MGQe9kfhPnuwUau3fFoYCiQ6+lWw8
 mfaU1gRQGfmkTP8bhgHnRO8HuhXN5skFZ5nOGXl1HZUdS3giEvxQenB/Om7/kC3QsgJU
 3DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682992480; x=1685584480;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJXpoici5tA4MSmCzlu5OW0HB34Nf9VYQQfNaRRaMik=;
 b=M0uC84PAbFgvSqkTVy7GocnKDdGLhpfRySUA8zJ6XIpUN7K1/ENOY9O434I6K+C+IN
 r7GclEbBzkoPMAzug0IlGVaKekZ1HzoEoI5r+PLA7wcAGyvS5VpNYozx8O/+cIRiihOC
 JNOumIlOqfDyolotX2jkp6E06kq1MAh9xD3cWCHL+QW3LFyP2ZmsteQikXpdns1jwxkl
 uQqpASSVqq0CqvLj/5/DggiSTY7nwC2C8d3YryDI29WTgGP2s2SRzJr0o2Ph8xOHCrXg
 LJnvZ0qep/Duy74rHY05WYWZ0tBQxbHgxI8SUZjKIn3dTEW26lfKbZK0HH0R5JX5JZVu
 n+Eg==
X-Gm-Message-State: AC+VfDxEyAnT/TPL1pirggSnvnvB4OQhF89jKI+zkw6ZLm0w0tqzEY6Z
 yDZf9xut/yY2hbAuYEA6Kx3QicN2X0Uudg==
X-Google-Smtp-Source: ACHHUZ7UpB/TCPv0GJ155DGITZi2iBIgyjZxurJecKhJcKbcSQmVv40yw0n3zfzL+4SRYFynG2380A==
X-Received: by 2002:a6b:7902:0:b0:760:efd4:957e with SMTP id
 i2-20020a6b7902000000b00760efd4957emr10618861iop.3.1682992480550; 
 Mon, 01 May 2023 18:54:40 -0700 (PDT)
Received: from smtpclient.apple ([2600:6c51:4c3f:9541:bc86:abe4:fd1a:a68b])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a05663824c900b0040f9e66095fsm8398023jat.134.2023.05.01.18.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 18:54:40 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Christopher Snowhill (kode54)" <kode54@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 1 May 2023 18:54:27 -0700
Message-Id: <EAD46124-72EC-4FA3-BBF1-A93CE0B043F2@gmail.com>
References: <168298681205.18872.1103483750250801232@emeril.freedesktop.org>
In-Reply-To: <168298681205.18872.1103483750250801232@emeril.freedesktop.org>
To: intel-xe@lists.freedesktop.org
X-Mailer: iPad Mail (20E252)
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Upstreaming_prep_/_all_of_mbrosts_patches_=28rev2=29?=
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



Sent from my iPad

> On May 1, 2023, at 5:20 PM, Patchwork <patchwork@emeril.freedesktop.org> w=
rote:
>=20
> =EF=BB=BF=3D=3D Series Details =3D=3D
>=20
> Series: Upstreaming prep / all of mbrosts patches (rev2)
> URL   : https://patchwork.freedesktop.org/series/117156/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> =3D=3D=3D Applying kernel patches on branch 'drm-xe-next' with base: =3D=3D=
=3D
> Base commit: 9a7a643c2 drm/xe: Fix media detection for pre-GMD_ID platform=
s
> =3D=3D=3D git am output follows =3D=3D=3D
> error: patch failed: drivers/gpu/drm/xe/xe_pt.c:778
> error: drivers/gpu/drm/xe/xe_pt.c: patch does not apply
> hint: Use 'git am --show-current-patch' to see the failed patch
> Applying: drm/sched: Add run_wq argument to drm_sched_init
> Applying: drm/sched: Move schedule policy to scheduler
> Applying: drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> Applying: drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
> Applying: drm/xe: Long running job update
> Applying: drm/xe: Ensure LR engines are not persistent
> Applying: drm/xe: Only try to lock external BOs in VM bind
> Applying: drm/xe: VM LRU bulk move
> Applying: drm/xe/guc: Read HXG fields from DW1 of G2H response
> Applying: drm/xe/guc: Return the lower part of blocking H2G message
> Applying: drm/xe/guc: Use doorbells for submission if possible
> Applying: drm/xe/guc: Print doorbell ID in GuC engine debugfs entry
> Applying: maple_tree: split up MA_STATE() macro
> Applying: maple_tree: Export mas_preallocate
> Applying: drm: manager to keep track of GPUs VA mappings
> Applying: drm/xe: Port Xe to GPUVA
> Patch failed at 0016 drm/xe: Port Xe to GPUVA
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>=20
>=20
