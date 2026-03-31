Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D98610F92FF
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 20:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471E610EBA1;
	Tue, 31 Mar 2026 20:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExGjnv4c";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kap40kjn";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7042B10EB94
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 20:39:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62VGdich3926956
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 20:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=; b=Ex
 Gjnv4cRYbBcnoWP5H/dLR6n48B9J1sTVKiTQZXxU0BoU8dxXO5dscAbXvvlfVA+v
 DfkwTOrt6dpnY3yIncxH84L5furMm99iMKrhdzRnV5xr8saPU8IOM5gS5QlsD+e9
 nFb9a2lDjTfpOqkcAzksxKv8TKDxBKsOdLIA3rovkWPJ/kNM0cHMWErKb+8p8syC
 oIvs/CxxpCUG3jbbg6faWy3shnAjzSBREbHqKuHfwxqd2VdGLHZoAM0k+4EDHLDp
 WleH3Pt4VXAiXjU3G9IJeubOyhEDlNHVZp+hHLFrlTZ6xAhXhC8b5T5fklNC7RKb
 4jeZ7ijjIqr+FdvB+I/w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b93371e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 20:39:24 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d9d3230cf8so1091898a34.1
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 13:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774989564; cv=none;
 d=google.com; s=arc-20240605;
 b=aYmo6/Asf3DbgGazs8KL++2Cdp7I3a7Q9Wo1YoRcvPMcXn2vTVFWyCdzyEpbJBMVgB
 oj7js9dIRKLPU2YrBjpAE3Zn+UrYdMB/XmdEqd7M5WTDG6uoHcXNkQad91bft/i8PFZA
 Q7EmCAYQ7bjeNz2GtOvbYpEHRTirmzsvDxhOSIKD+5brqzOPzpNJ3urIv+vdOJGHwhR7
 hQprqDMyly+eMFYpl540ATvv3gSdUfuOhYihMJdAIFR9Wd1/VnueKz2VkG2Z4c7pzAis
 MA7+Jln576l5ric0hQO3rZqEPhBFUsG8r+vexpFTg28AtPERKUyOJEYAERKmXZRk5Ntm
 F43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
 fh=qFU9j8CQOYqLrI9s7EF2XCW4+t4aOBw3NMHJrjbseWs=;
 b=MRE6orMiMivky3SW2kZGreGgx6/420c/FvX5XQ+fTgduj/pwRMCKZzY7jKT56VclcC
 I7iGA1tjbhKIwBSI78N3X77VwLQwEoQoLwuhfEBkmIqE9Ub3nKGNWLdk2SPxbKJL1HLv
 wdSkVbeEZFqdqW40SZbpoB7N5QYk7hC6OqAE91/ou2ZkBMfBfNCnBapm5+oMp20eEKvo
 NEefsgwpAf1+vnMn1Utd7sGs65UaUoHy6tn2b2N0ondVPyDLFCXgRzVD10Sz2kZV7bZP
 KUkUXESOTnWcdkjN+tJs1gr8rltoi+RZRcGd/rcQP6ACAvujfu69wx8/iPbDU5SPl3KG
 OC1A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774989564; x=1775594364;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
 b=Kap40kjnfGuefZvypHJvNk+lNhBmjP4DCtqWCCS0HsXQDyene0U37FrQezebiktJcH
 X7aY7iYbEY+kkkqSuZ3TrRvJ4yK/X3XJjMG03CPm11+Qd1veQrd8B49lBOHrYS/7s3h7
 eP3XaVgDqj2pNrqCWjEmVb+cuf9w6eC/7Ky7s7BRmafRLhgDOSqqB5SBO6iP5dsDIHKn
 j17+vKKIZrYxJY9Qc0zDcCF4ncD2xqV7RqhmhY15zTkCF0b5xGClmF0Zl+UyFQ3hExem
 8SwHxYePtCaTYlgeJ3tF/byKKqgHVzWZuWzXBkuglD978OZecT83mEJ6ES/RCUuIrMXb
 Y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774989564; x=1775594364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n2x6RwIuLxR3MCzlHPNU6MwPlfd8sBS5fLS/Xz7Q11o=;
 b=X3fxGX8Idaabjy5feBdNT7I77sWwQpYuW9uQAu2jtI20fb+F83LwH5ipsegbTkAeof
 yZbX9K4BSlU6JMF9iOnWV1M+9D5p15br0eePG/ARenTeuUsOOoI5ccV9GA5thtTEr+Jn
 Gmf8KPHwivZMpsfFk4Oc0nrLX5JQMOJoAN13zyKkuwBl6Z2HLWpYgldDDrKI8q8CF4VS
 WdWmNGmfbBbGxpJra4yAYcuIlm5sWka4RdJod9HdN2MW5U6RcUQfKPtywIaCPjh03FQj
 bnuEj7hy0uY/aBnoj9Px4NnfoeQvtI/Ldv5pl6sse96FtrJbF7Ksg2g5OQ2Esy3QN6qX
 gpYA==
X-Gm-Message-State: AOJu0YznsYqpqwT1p9cgYUJdbKEX+gDgFxEnccs+e9urmn0zK2NPhP6I
 h0r4yijcBTtZJB8i3iToz/G1GWOhmqhyMWdZnAmhYOLNWhvG/U6N7JWKWXKBNzVuVQRSONwPW9h
 zh0kqLUdrB7EvPd1tP5c2I6ehlkFJv+xJTXfFhVde8gFHEJjSFBBFdBNe+xwXso0F8LrMy9lZ1J
 mwMaCyS3+MDdE9GnqZILKLGlMv+4OdMm6qrfDm//Tlvc4l
X-Gm-Gg: ATEYQzxWswj/Ok5HvPfu98JlduehlYkksHhHfgtCqN6Du+oUn8fQEoHRPJxGJlJfgcI
 JiWaLMAMTj4k3AhiEeiHvJJqS/623FRj4XoRBg1OjQ6auDFtaffwN19/+2hqZyhFTVlVhBzWFUl
 bIxw1r7Qq9EgvkV72tQNfGpKexkguMM74XEZ8NrjrEiQMZl/cVYKB8sw3mSb7bC+iEjZtvnfDnZ
 6C2Mv0AFbD3Yh635KjJ0wEnAFmCw/hiqoIyvg==
X-Received: by 2002:a05:6830:1bda:b0:7d7:c79a:cb69 with SMTP id
 46e09a7af769-7da3775aa76mr2018809a34.18.1774989563938; 
 Tue, 31 Mar 2026 13:39:23 -0700 (PDT)
X-Received: by 2002:a05:6830:1bda:b0:7d7:c79a:cb69 with SMTP id
 46e09a7af769-7da3775aa76mr2018781a34.18.1774989563512; Tue, 31 Mar 2026
 13:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
 <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
 <CACSVV03FFvi0c4XMEShmH5ou4OKKZcvvni2j=0DBoYnuT55ecQ@mail.gmail.com>
 <bd45632be1a5bcd2ce34834b45a35254e23f7679.camel@linux.intel.com>
In-Reply-To: <bd45632be1a5bcd2ce34834b45a35254e23f7679.camel@linux.intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:39:11 -0700
X-Gm-Features: AQROBzA8VsO3mMQtD1h3R-Aco6tohePIO4VrDwi1_DI8AqCbRSrROyb9UzFEmww
Message-ID: <CACSVV01XKYegc3B-WAdDCCPYX1M8As1k42kT75JVjKeY+7QAWA@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE5NyBTYWx0ZWRfX5rnImFbxMIc5
 gOQ8nQd8g3gfkO1XeW49rvwD1vYPCk3Jr3+jetPj81s65todOctuTgP46AlgenMoyfnAVJNzbwp
 CgDbuRwkLFOJg/DeBrwOy/KkdfUGTRruAyYWW3e77GZiCeENXj4dkGfVsLrEvyhxGj8A/kmLzg/
 IeU2GIzTE0iHvRVnKqyLfIEZq9/4q1ab2T93UD8LUk1vE/fQsOTNwyFr8hQrIQaM4Qw6auhw7p3
 2CoBOl9EupvsuwM0ryGR3EVuIkmuPcjtJ3hq+40wzSE2fyK1zJsnJOJ+k2py+jjV5mG+Xp5D7Ia
 bkxTaSonALh2ca0aPNpvMmZHoGVWIuc8FxK541MNU8MnKCgRoyJspxGCqNfEq5xXPGAxagJ1Q+u
 X0kMh6iea1flB9FHQ+eS2YFQ5CRIUtEVLTCmyW6NOXZRkyj+U+Suz2Rr1oz6L5UgrLYCGOfEZqp
 c8xLwnFYEFOLdvgyrlg==
X-Proofpoint-ORIG-GUID: mSRHoHjgZt-3M94d3QUdW2tlvHXuxC1W
X-Proofpoint-GUID: mSRHoHjgZt-3M94d3QUdW2tlvHXuxC1W
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cc30fc cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=pqXIF9v9MgCKvzB1QCwA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310197
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

On Tue, Mar 31, 2026 at 12:52=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Tue, 2026-03-31 at 12:08 -0700, Rob Clark wrote:
> > On Tue, Mar 31, 2026 at 2:21=E2=80=AFAM Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > The code was reading drm_exec internal state to determine whether
> > > the drm_exec structure had been initialized or not, and therefore
> > > needed cleaning up, relying on undocumented behaviour.
> > >
> > > Instead add a bool to struct msm_gem_submit to indicate whether
> > > drm_exec cleaning up is needed.
> > >
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> >
> > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > This is pretty stand-alone, so I can pick it up for v7.1.  Or ack for
> > landing it via drm-misc with the rest of the series if that is easier
> > for you.  It shouldn't conflict with anything in flight.
>
> Thanks Rob. Please pick it up and I'll exclude it from the next
> iteration of the series.

Will do, I have it queued up:
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/227

BR,
-R

> Thanks,
> Thomas
>
> >
> > BR,
> > -R
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem.h        | 1 +
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem.h
> > > b/drivers/gpu/drm/msm/msm_gem.h
> > > index cb32093fda47..762e546d25ef 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem.h
> > > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > > @@ -452,6 +452,7 @@ struct msm_gem_submit {
> > >         bool bos_pinned : 1;
> > >         bool fault_dumped:1;/* Limit devcoredump dumping to one per
> > > submit */
> > >         bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
> > > +       bool has_exec : 1;  /* @exec is initialized. */
> > >         struct msm_ringbuffer *ring;
> > >         unsigned int nr_cmds;
> > >         unsigned int nr_bos;
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index 75d9f3574370..26ea8a28be47 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct
> > > msm_gem_submit *submit)
> > >         int ret =3D 0;
> > >
> > >         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> > > +       submit->has_exec =3D true;
> > >
> > >         drm_exec_until_all_locked (&submit->exec) {
> > >                 ret =3D drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> > > @@ -304,6 +305,7 @@ static int submit_lock_objects(struct
> > > msm_gem_submit *submit)
> > >                 return submit_lock_objects_vmbind(submit);
> > >
> > >         drm_exec_init(&submit->exec, flags, submit->nr_bos);
> > > +       submit->has_exec =3D true;
> > >
> > >         drm_exec_until_all_locked (&submit->exec) {
> > >                 ret =3D drm_exec_lock_obj(&submit->exec,
> > > @@ -523,7 +525,7 @@ static void submit_cleanup(struct
> > > msm_gem_submit *submit, bool error)
> > >         if (error)
> > >                 submit_unpin_objects(submit);
> > >
> > > -       if (submit->exec.objects)
> > > +       if (submit->has_exec)
> > >                 drm_exec_fini(&submit->exec);
> > >
> > >         /* if job wasn't enqueued to scheduler, early retirement:
> > > */
> > > --
> > > 2.53.0
> > >
