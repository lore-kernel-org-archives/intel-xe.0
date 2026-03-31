Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C3510F92EF
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 19:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B69A10EAD7;
	Tue, 31 Mar 2026 19:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aT60FZUu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnmQ6rxA";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3910E088
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 19:08:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62VGdkWa1056506
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 19:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=; b=aT
 60FZUuy8A4IbOSs+BO2hguvHvzM+G61XTY1pG1b5tA7MA24iNTc3H7zYCbMUNdVS
 EVJ26EBsOcKMriR+B8bkdOg2al7gdXuao0Z96Kh7FVHzpaTh1Q4KPUwFdPbnpm8K
 IMkbjmbwXsPlc3ZJ9QZuHgB/cYUkPq3acGF6L+Eso1urVJrmJTP4rNMnj/nv5AG1
 f1BDw8NsdIqMgeffyZdMX7AN/LdhbSpdHl47EiTnNDhArK8C1gzg/aByaG4GigZO
 L9p/RnyWEaT5rkWx/p8eYhjKOeE2hZYYKR0CVtsW5/PxovOEvCD5RWYg+U5wXKrX
 CAljSIRuTLtwhLqkXGRg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hevxse-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 19:08:41 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7d7e610d5dfso26298611a34.1
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 12:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774984121; cv=none;
 d=google.com; s=arc-20240605;
 b=Naljq9bG2fwOAFdJQtklTKI1vfdGV9BZm91hpb1ZpnJxx5eqPLyrChJ42E5jAUz3cI
 8ADBXNdu8T6acZuz8r8NDLJySjVR4Te0qigsv/QHs1F846dTJ7e+kNVtfOSIPkiMn67U
 eRn4pzxumymFUUTuOxPQG7uVdjkxb57oKv4/U9eLgPIgjH6Apmyd4eJGxYIWWp2lqB/2
 LSwRyiAnfN01HLLgCGfEs/xq96oVsfumKceK09i/UeWl6ZkVncJaBT3siFdSukKK8RbZ
 WMCAIMVBwHRzOk20njp/BYJa0yMCxWCXz+zAwYoa0E53I1QYgiyeWuQ8k7qUZHJ2vYuQ
 8ARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
 fh=qFU9j8CQOYqLrI9s7EF2XCW4+t4aOBw3NMHJrjbseWs=;
 b=CdvD6w4sgHLN9l2yswdn6l9ZtKNleH8pPLpkces4OwEFB7Y8aKvkcdv0LlCe5TieS6
 +0IFlu0Yyb1bWObd38Ry428vy4WSfehxw974cjSiKnHxA0Jg9DAItlR/7P/B7InwkgzR
 nHxieoYpNerKtbk8MbkR9Fp/6ch5QVPgZ79CwXU3m5m+hs4J5W5oAN4/gDmI7JHFJkZG
 /M8iMVo4FeKMHWtakATU0leu3SgCYjountYFa2oY3YrKU8LYkGAD1myvp0MsxXHPYBIq
 iwGi0zJWTrx5ozD1WwTwUyIDlv4pbWpcn3QWulvXLzdk7gtz1143GUS8r4jArM9OoB/Q
 PBqQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774984121; x=1775588921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
 b=MnmQ6rxAhHD3kIVXIkq+9rbUwQ9taTyeHe+dY2Db4KX1XxWxvIl3w27zbBd66xhqWc
 tfzpLvHlDhplnzDwDIBb9+GCtgMdNwgn1SCvDJc+QD+F6rjYJ9eY7/YSHOXWe5BS7WKt
 s5NIoBjsQB7rApulaofUCLRYfH9dWxh/bK3QCKmsxkHbSMHVV1dFmmv7KoHGDOqr2Jzd
 nA+caFw0N+/b8Z+GfUo1zRzWIrj/XXXc//p1yeZH4rIZAGn77k48A9KxlcIFg8NL0MTs
 1X39OVKp30KMvVkPfbaQoUvdcEO3voC/e4G/Q5XS4wrSRaOOWaJozoOSz3hRlBW7B/Ei
 tegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774984121; x=1775588921;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RfD33WDA9eBXROKOLNv2BDIrHUF56VsZFatII1K9/FE=;
 b=T+sEhYrd6qTXUGBfuyuDS0cGOz60fxCOcgfJb4fclwNPghwxNbKrR49ovbbxvaZs6Q
 S5Sb1TTaWMfqwKfJ52BCDKwgiUP6pAWaY6MqHHp2b+8TSICyDxpiPAqxe74LKV7i0s2O
 4rb7e7XtXQUq3vY6UAouBlz8K/R84s43D9wCvvVC39jlN/NjYF2IoQkMY7nDRQ0pr43B
 PdHgaxWfyVsR89JYg8+8Sk2F8qiGdDlC77a9klE63pHJMvqt9Au4Pbu/K6zcqVxPUZZV
 LAEl6+MJHewBfZBVVkINnWVMvPvCvlftH+LYtFFWZULTahcewuDMTabwRllZQFLe23Rc
 7QhQ==
X-Gm-Message-State: AOJu0YwsJCzX9DaBhJaIFUlRhEPhkPD/gmRCo4f7I80FbiWku18i2g45
 nBwelenSpQ5aTVNZR5MCHsVn2mnvCZtHChYsIbVPQHcUuYypUF5uSCf9MXwKjCk838pM+teL/Of
 2G0Uc9OIsFOTFDN5to9SgGkUqT7jFqDWjKOvDDwtpZbm5e/couZPvY1rM0j1T4kFMcuVxqOksIY
 iDndo32xaf6AbWdNAE422u1TiW+1FPpyLIuPJ+lOlQUOqD
X-Gm-Gg: ATEYQzxp6qpAxqsBREECERaj/kqf/f/N2SQECIcJJvA2mbww2AOYmbZEcz+c82bDFug
 hWJt3nyvxgfBapSkknZ3PKCKLAcvr4pBgZQlpqG6xqeDxhk4LqTc9yR3h5HTv0uJk8XMMhldAlR
 pyL6VrCsp6Bo6BOvLDFkcN5RFyi5dBlHwL+J7J1WU0DLemXkaJq0/WF58RRpt8aRMtpGyRX3mQh
 9n9sDKPVsiuGW1Ddx4j6UB06fm1QVgtPKPngQ==
X-Received: by 2002:a05:6820:1390:b0:67b:c5ef:abcb with SMTP id
 006d021491bc7-67fabc3ccb1mr275716eaf.23.1774984121001; 
 Tue, 31 Mar 2026 12:08:41 -0700 (PDT)
X-Received: by 2002:a05:6820:1390:b0:67b:c5ef:abcb with SMTP id
 006d021491bc7-67fabc3ccb1mr275686eaf.23.1774984120592; Tue, 31 Mar 2026
 12:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
 <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:08:26 -0700
X-Gm-Features: AQROBzBvAateYSIgol1xE404p0QVo18CvuQ9I4yG1ka6RfVGOoveibudl0Ox9Yw
Message-ID: <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Alice Ryhl <aliceryhl@google.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cc1bb9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=uC2hiXKo-rcvbCjx3PIA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: i3Aq1yzIEjesdykG67J0J_cWJETilpnI
X-Proofpoint-ORIG-GUID: i3Aq1yzIEjesdykG67J0J_cWJETilpnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX31xsC+NQzzid
 Ki34dEnupJjIcLd020Ecdm6rnkMX6qv4PLFBBnHY4HDzzDQN4kxDGJmwoLHyUn3ad6++wX189R6
 QCrARRhPWl4inDzhU61TV6uEmouxdwumWvrsA94hzT9GUFsNljhki+yEstXDWx5Vzct7EItDJgj
 0lsJ+jzSPQR95GZ90rtUc60EbVhbysxebrRbl5UHruDsgHCXv6KvOCk5KHx/01kNmlWx/fesC9R
 7EoYrjp3Jsw0DU6ueM8+C/TTX7OouOr0Ukk/BmNHgfa8RQZyuTUrOhYZQy4dlK+hARVJAGGEQbz
 fJbEcHBVrqWRuK9l9Lx8KAU85O/j0Sj837EtVSdZeTYR01UXGKtAAFP52ztjTBi7JL1HLjKSDlz
 bMBwbosWvTpTEUnY99QVNeMoun8vhn75ZqqDuuedg9fMwwpbM4+s2CgFg1VxyYy6qRJBMNwNNqg
 dxNRAzU1p1MtimOruxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310184
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2026 at 2:21=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The code was reading drm_exec internal state to determine whether
> the drm_exec structure had been initialized or not, and therefore
> needed cleaning up, relying on undocumented behaviour.
>
> Instead add a bool to struct msm_gem_submit to indicate whether
> drm_exec cleaning up is needed.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

This is pretty stand-alone, so I can pick it up for v7.1.  Or ack for
landing it via drm-misc with the rest of the series if that is easier
for you.  It shouldn't conflict with anything in flight.

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_gem.h        | 1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
> index cb32093fda47..762e546d25ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -452,6 +452,7 @@ struct msm_gem_submit {
>         bool bos_pinned : 1;
>         bool fault_dumped:1;/* Limit devcoredump dumping to one per submi=
t */
>         bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
> +       bool has_exec : 1;  /* @exec is initialized. */
>         struct msm_ringbuffer *ring;
>         unsigned int nr_cmds;
>         unsigned int nr_bos;
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/m=
sm_gem_submit.c
> index 75d9f3574370..26ea8a28be47 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_=
submit *submit)
>         int ret =3D 0;
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       submit->has_exec =3D true;
>
>         drm_exec_until_all_locked (&submit->exec) {
>                 ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> @@ -304,6 +305,7 @@ static int submit_lock_objects(struct msm_gem_submit =
*submit)
>                 return submit_lock_objects_vmbind(submit);
>
>         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +       submit->has_exec =3D true;
>
>         drm_exec_until_all_locked (&submit->exec) {
>                 ret =3D drm_exec_lock_obj(&submit->exec,
> @@ -523,7 +525,7 @@ static void submit_cleanup(struct msm_gem_submit *sub=
mit, bool error)
>         if (error)
>                 submit_unpin_objects(submit);
>
> -       if (submit->exec.objects)
> +       if (submit->has_exec)
>                 drm_exec_fini(&submit->exec);
>
>         /* if job wasn't enqueued to scheduler, early retirement: */
> --
> 2.53.0
>
