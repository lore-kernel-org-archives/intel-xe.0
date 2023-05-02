Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0DC77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 01:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2A210E04B;
	Tue,  2 May 2023 01:59:39 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B1910E04B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 01:59:36 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-32aabbe7e77so7111275ab.2
 for <intel-xe@lists.freedesktop.org>; Mon, 01 May 2023 18:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682992775; x=1685584775;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=r/+dc9heuRto6NU5M840TOTJYzD3rg4hjH6Ci2enUxg=;
 b=iCobnZobsGUuLjODJwmN3iS+sBGJffYTUxgtUCbQ1XN2slDTiesnSxLny7Nuo8n5en
 XbKXxE3HM42lDfYKuPGZ67TSaRc7pNYBtbx7O+0HWK4AtcZ7k7gE2QvSixy5h/yrMkdw
 6bXWBcO6MZCF4ATkslCZT3J8nYO8GJdgu2gzQGVxpBXoKjneo7q6Ym1ZZ0teA5mfafsY
 t1B8m8fD+F5XkD7q48Dz1/JxouwNnGGrV1s5JuV5tdPZyhSGSyM6poaPW4LKCWWDnhwB
 mkRrNPKksqF9ui1tTFeCT5h2YxKwMBtvuRdn/Crl1zoiqs1Spg3iiNpw3Pukyb5LkVWp
 QChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682992775; x=1685584775;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/+dc9heuRto6NU5M840TOTJYzD3rg4hjH6Ci2enUxg=;
 b=Tb2IC9iHk3Q8r3NfoBJBjM+24e+xL2eADF2uGsDcWE7Kl4ZsV++d3dEV4GPxeV/5u7
 YBnlK0j16kErA8Utuw0Pyqf7fVvJ/J+r8FEgzozzw/LALamLc6JsDMkjh6oj45InZ7qv
 tldSboPRrNl2aK8MIzdgsyM9EcyCubBdbYs3CHnRN0GljRzai2vS+uuj5zBY5hTFOOMS
 Gcg+C54RB/Sf6oIQnrOibup/Ae5B0DC4WBed4l6Q1tFLcNd3+r3U5nne8K+34YM3gb70
 VYhnR9dPZahE34vh0PybiArdaLd0hb8R1ZhuwBDOfZqmuet/GTEkh+BhtkqpLjNafTmK
 u7cw==
X-Gm-Message-State: AC+VfDw9PORGzNXJsDAfawcKbRw7zCJGGZSm/mWmT366aIS8a6cl73zv
 ZlsLBPGIHVz9jjbpNnZiS2Nmqmc7cJ9tYQ==
X-Google-Smtp-Source: ACHHUZ59ZWBbH2YH1Lpcsat3w18Ta4PqsduwFebnlmuP/vWaLkCsikWnz/lsH8Sm/4+EqyeKJJwRlg==
X-Received: by 2002:a92:dd0c:0:b0:331:cd3:90a7 with SMTP id
 n12-20020a92dd0c000000b003310cd390a7mr1478940ilm.17.1682992775497; 
 Mon, 01 May 2023 18:59:35 -0700 (PDT)
Received: from smtpclient.apple ([2600:6c51:4c3f:9541:bc86:abe4:fd1a:a68b])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056638328c00b0040fc9317650sm8744443jav.62.2023.05.01.18.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 18:59:35 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Christopher Snowhill (kode54)" <kode54@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 1 May 2023 18:59:20 -0700
Message-Id: <BED0108E-231F-4797-863A-E4B88CC3C39E@gmail.com>
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

damn I hate Apple Mail. I wanted to select which message in the thread I am r=
eplying to, and it naturally assumes I want to quote and reply to the most r=
ecent.

Anyway, is there a Mesa branch that works with this series yet? Or will the c=
urrent Xe branch work here? I already needed to use a special flavor of the b=
ranch because of shared object issues that hadn't been merged into the main M=
R, and I'm using @mlankhorst's uAPI header and validation, and my own compat=
 ioctl function one line change to make 32 bit work.

Otherwise, if there's no working userspace for this yet, I'll just give it a=
 pass at testing for now.

I did notice some typoes in the above comments or commit messages, though. L=
ike "doorbels". I'll have to look over it again if it's worth noting any mor=
e.=
