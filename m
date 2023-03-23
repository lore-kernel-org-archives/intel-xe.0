Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB09C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 09:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3931E10EA53;
	Thu, 23 Mar 2023 09:43:56 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A7510EA53
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 09:43:53 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id e11so13078274lji.8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679564631;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3vFtA/0wVD/yXDJ9zYtpg9SA1c3/2vU/T2NtEXIR2QA=;
 b=f/+ikcs3R010TjLqMOmyAZJ1N/y//kcVgjqP32lqiKeOdncOwVc2yxcMbMnxiHlyPe
 yj/Oq8wvEXJstTEXfGi9brfqcD1Pl8r+X3EKOmCBgaqMiuIzpE7iXEilJsFRVub+KmcS
 GUVFvJ3yRXc7rdsggDbE3sQP1qn/0H+nbZxwV/F9Up+/ORn4P7AuEWfgP4tOkzq2n3P9
 kI79oX+ldEwnJpicctNWts86DB1mukE1Qs788H7EJP6dbsnAkGeEUv5VEn+1rw1rlczt
 sXnPyc5KwMUb3sV82CkLk+0H7jqPZHjMGJuh+fMBvdj7YW+auk3Q7RNGl/VVjznj8x/+
 jbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679564631;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vFtA/0wVD/yXDJ9zYtpg9SA1c3/2vU/T2NtEXIR2QA=;
 b=OmdKDNpOkbjeHEUI13Hf1ylXbLXv3+YIR0AijgPecDMglBzRb4y0B+cgsc2mfxPLOp
 cQ4BKcB3WGgx8iUPvaur2eXnguuCL7XxX+MKwa7blcTJC1Kt5AzvOLCGWZkP3uVNsRoq
 Dqel2T5zkZVotNQzodKBF8lyXQhgbdS4+vuRNrZ/1VPV8jUPiuJbm6g0X7faQTWK8Q7X
 1W6+7TL/t67wPpx+x3zlBNI+Sk0+HTzjF9CWglrVZq7/pEAdgSV9l+BsXkHOsSt9T+Q/
 oR0Ceu8jiRMS2e9xo6SwUP1cGSba/rcbF4It+71HqgjM8AAsGKg59eXD2RTuMMz9QE/M
 TH+g==
X-Gm-Message-State: AO0yUKVzjNbN3WwIqeCsp7mudfzjrFjw9rXDzsdrH74sglmY0BFDORY6
 2vq8VAb5zLzxN9WVdlEKFqCZ2l1TRgOnyu8Bng0=
X-Google-Smtp-Source: AK7set+p2FEzVSZvINoXLhDWhyU5GxdN7jYusqI/yKJp2qc+Jg0zijjBHIoSW+vL3fxSDp+it9q9ylTyRxUxb7Ifsvo=
X-Received: by 2002:a2e:b046:0:b0:299:b5e6:4c45 with SMTP id
 d6-20020a2eb046000000b00299b5e64c45mr2953043ljl.5.1679564631472; Thu, 23 Mar
 2023 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230323025801.822678-1-matthew.brost@intel.com>
 <20230323025801.822678-3-matthew.brost@intel.com>
In-Reply-To: <20230323025801.822678-3-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 23 Mar 2023 09:43:24 +0000
Message-ID: <CAM0jSHO_iXUePB8D5x2uW3OhwGZUk3xzdT5J8v+Z6feXGL=BNw@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [RFC PATCH v3 2/2] drm/xe/uapi: Add query engines
 uAPI
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 23 Mar 2023 at 02:58, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Not all hardware engines are created equally, certain instance have
> unique capabilities or properties. Introduce a uAPI to query for both
> capabilities and properties. The capabilities are represented by a bit
> mask which is unique to each class. The properties are represented by a
> name and value return in an array to the user.
>
> v3: s/xe_engine/xe_hw_engine
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 89596d353d3e..2f936fe2e452 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -119,6 +119,7 @@ struct xe_user_extension {
>  #define DRM_XE_WAIT_USER_FENCE         0x0b
>  #define DRM_XE_VM_MADVISE              0x0c
>  #define DRM_XE_ENGINE_GET_PROPERTY     0x0d
> +#define DRM_XE_HW_ENGINE_QUERY         0x0f
>
>  /* Must be kept compact -- no holes */
>  #define DRM_IOCTL_XE_DEVICE_QUERY              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -135,6 +136,7 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY       DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE           DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_VM_MADVISE                        DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
> +#define DRM_IOCTL_XE_ENGINE_QUERY              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_HW_ENGINE_QUERY, struct drm_xe_hw_engine_query)
>
>  struct drm_xe_hw_engine_class_instance {
>         __u16 engine_class;
> @@ -253,6 +255,45 @@ struct drm_xe_device_query {
>         __u64 reserved[2];
>  };
>
> +struct drm_xe_hw_engine_query_property {
> +       /** @name: name of the property */
> +       __u64 name;
> +
> +       /** @value: value property */
> +       __u64 value;
> +
> +       /** @reserved: reserved */
> +       __u64 reserved[2];
> +};
> +
> +struct drm_xe_hw_engine_query {
> +       /** @extensions: pointer to the first extension struct, if any */
> +       __u64 extensions;
> +
> +       /** @eci: engine class instance to query */
> +       struct drm_xe_hw_engine_class_instance eci;
> +
> +       /** @capabilities: bit mask of capabilities, specific to each class */
> +       __u64 capabilities;
> +
> +       /**
> +        * @size: Size of the queried properties, if user passes in zero the KMD
> +        * returns the size of the properties array, if user passes in the size
> +        * of the properties array the KMD copies the properties to the user
> +        * pointer.
> +        */
> +       __u32 size;

Just a drive-by-comment, AFAICT we need some kind of __u32 pad here?

> +
> +       /**
> +        * @properties: user pointer to which an array of  struct
> +        * drm_xe_hw_engine_query_property are copied to if size is non-zero
> +        */
> +       __u64 properties;
> +
> +       /** @reserved: reserved */
> +       __u64 reserved[2];
> +};
> +
>  struct drm_xe_gem_create {
>         /** @extensions: Pointer to the first extension struct, if any */
>         __u64 extensions;
> --
> 2.34.1
>
