Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AE0C0755A
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 17:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC76A10E039;
	Mon, 27 Nov 2023 17:34:28 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882E510E3B8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1701105346; x=1701710146; i=spasswolf@web.de;
 bh=2hlmtZVvcS6ufYqIfCouQbw+RGkSyNOwcQmKV6gp9zY=;
 h=X-UI-Sender-Class:Subject:From:To:Date:In-Reply-To:References;
 b=a4edNfdmdSLEHPwoAxFVoW1Cm9I17AfxPp2cetnUZt4f3rXXGToWyev1EcOnZmC0
 LqDkvfhh4dnQn/Tg4hzv3SCfF0w6PNAqAHU8u4RgX3HIsYpw3kyoebnUl312FrmCG
 Asjjicx6vx0WVjQ5imgYTXhT6nmlKOG0Y0RR6EonRB+1b+8nHS7l6CyM64xebZm0G
 wX91fqCmS1jaYdOVoKt+u+7dOLJpVpQC5ex3bdfAklWWbpivc5zg7xNNV8gtFjTq2
 SNBRoCe0jt2k14ouuxitVs0n0S99tBJ2Dgftn4f8l3QLQ7XnXnSZmD932HoJN8ytd
 pefvwIilnH0y0bjr/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MfKxV-1ro9hh366d-00gUlo for
 <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 18:15:46 +0100
Message-ID: <7371f7d04792fc26b2a5d392e74b08882adcd022.camel@web.de>
From: Bert Karwatzki <spasswolf@web.de>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 18:15:10 +0100
In-Reply-To: <170110192422.3005.17739464521144476330@emeril.freedesktop.org>
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <170110192422.3005.17739464521144476330@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AFxxc3Fnj97iq9xJ65XYOVsTEDL09HdAnGZUX0lAprgpjg/AnQD
 lxAVqk4GfrbZpG8gLGo47+vMq3z7pabqXGMGLyvtE7gaOf6xNx6go2lyd4sf9JNvgeWFo8N
 dGIeljEUUFCmqo965A4EY/laL/WPlxM+WB0JRSY0N3dBwTJzHiN0/KvOe56ZmQQtYGL2vBM
 zV3ZjOyGv6hVcfs/LOC0A==
UI-OutboundReport: notjunk:1;M01:P0:D+EXda/F254=;496t3nmOd8ZRW+fZkmEjecJdK3m
 vvREKlQS+2/3Szp8ewbYC1AwrhUKuGOGmNhDBfmnKMxtxNsDKAglasRp3ngL55GDuTeLxeHMd
 16jo95ZJfZAYf+r7HuJNh/auSv9YeSpINNtQpZKOucrIMPffSIcBy0IXkRAG52UflTeSVq6Qq
 SK7DSnJSGcHBJgyv9FLHWUWFgRWGROMbQAXiILjHvD/euLDWnDkkLrziO6qojOSkz0ifqElB4
 G+ctybIPKLticgx0fIqbcP044wh+TeHk6jOq68+XtU66PMrGN9K1jzzqnIpWi7U0jKfwKmgxg
 y7IBUcItT4Cv5ZxiMRfMx2vB8Z5lfrV9GVFfLxhVVhEu02rLXpEvmaigOfuKn9HcqkI3RVZfq
 D014XXgHGc0Pltov0O+/AGVeL0MdxSo9XcrTkUfpGaXYbVLd88QUpAsU4gC0s89Mr7CPk3+/x
 K1J4ukYPUXhK7bndxXcelwgcYzzilXG7r4v23CWNaIuAhgbrXwhltnOdwIDcwXbpMrfgqxGFp
 zTx1/1/cny8lAZt1raJxnfenMr5kL4aXMtVOtcKFXsYSkRIZCy+Y94Uma2SShtQmC3tMxSyai
 esHvDW3lDqmgalg9p6zsECfxQTkbtoX2PTKrOjYwW1emacaswoqtZl5hWfc7kfqZWOAz7aqO5
 R1Q2OsJuC+fqvZl9jXaKieto6zpw7WX1ZlnGtcgBwqPXfLMN4pyFr6yIwcpyvvekAiQ1UCrLP
 sWiZg812AqgTVALijGctOJYNnKqGXRYPzSnUhxvfwl1z6ttUSN3x9J/sU/3+Lcom3PRlx2Qhr
 uV+uF3t6/l56h2UJP6Dve9EbcCJq7bXHDxfrcYjY6s4gZL+QchtsV+XC5+1vPCJEmNEGSXkdB
 d2pTZnGAkAPeEXKfz9VVV3WEj/P/wOi9tL2xctfJ/8dmcXZhTipz5gJQ+/tnd2R05E35QJJ2f
 mTPO+R0KJuEi0/6rmaQeMbfG+Lc=
X-Mailman-Approved-At: Mon, 27 Nov 2023 17:34:27 +0000
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_DRM_scheduler_changes_for_Xe_=28rev14=29?=
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

Am Montag, dem 27.11.2023 um 16:18 +0000 schrieb Patchwork:
> =3D=3D Series Details =3D=3D
>
> Series: DRM scheduler changes for Xe (rev14)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/121744/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> =3D=3D=3D Applying kernel patches on branch 'drm-xe-next' with base: =3D=
=3D=3D
> Base commit: 7c4b213b5 drm/xe: Internally change the compute_mode and
> no_dma_fence mode naming
> =3D=3D=3D git am output follows =3D=3D=3D
> error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c=
:290
> error: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c: patch does n=
ot
> apply
> error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:1659
> error: drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c: patch does not apply
> error: patch failed: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4861
> error: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c: patch does not apply
> error: patch failed: drivers/gpu/drm/msm/adreno/adreno_device.c:841
> error: drivers/gpu/drm/msm/adreno/adreno_device.c: patch does not apply
> error: patch failed: drivers/gpu/drm/scheduler/sched_main.c:439
> error: drivers/gpu/drm/scheduler/sched_main.c: patch does not apply
> error: patch failed: include/drm/gpu_scheduler.h:552
> error: include/drm/gpu_scheduler.h: patch does not apply
> hint: Use 'git am --show-current-patch' to see the failed patch
> Applying: drm/sched: Add drm_sched_wqueue_* helpers
> Patch failed at 0001 drm/sched: Add drm_sched_wqueue_* helpers
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
>

The patch was targetting the for-linux-next branch of the drm-misc tree
(url =3D https://anongit.freedesktop.org/git/drm/drm-misc.git).

Bert Karwatzki
