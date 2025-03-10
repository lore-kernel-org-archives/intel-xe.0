Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8739EC282EC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 18:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15E89950;
	Mon, 10 Mar 2025 18:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ElmbqlGz";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B91890B6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 18:22:55 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so2527978f8f.2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741630974; x=1742235774; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IM67112e6aVWPb0y1+A+iibMGJnbZ9dK5fhRXopQ0Rg=;
 b=ElmbqlGzeOnAA5zbu5fQDaZtK+C5Y6WFEddEd9UJZdfrlQJGYbQh7eb/PtRKL1NkQ4
 6CdwPCRVdpNhPLrrRMFXqJV8MQ4+iZHbXkGwaZKNSM39IzuGv3e97x1zEsIHzAAjzlqo
 ELgcqpQjFHq7uin/hvJxfvTMzqjgxgaJWhpsfbONPz0+o9tchlAI3t9BtgbP302XJbv3
 Ath6rQ+zBTGZLpNP/6XKxecGker+BPsePzp3Jwz+/GLAi0kn5jcoZUwgk4fE19eE0ihF
 0iGtPWoFWGYj/eXzVBH6PKRIfkzj2ucH4caHsP1JagQuEExTdzkiMr9wtWbMKb6we97B
 TeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741630974; x=1742235774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IM67112e6aVWPb0y1+A+iibMGJnbZ9dK5fhRXopQ0Rg=;
 b=b2VQzB+nRcbJ5pJZyPBOyr3skHm8Hv7pD44EdMZD0EYjJdIDuLNs5ymOVl3NbZ5k2Y
 xqf0GPeITRlIqlZbjDrE5ooc6nv5d7Oc4x/aFL4pEbJqSHOUAu4UrYAik9DGve6GSCy1
 Zp1Mj6t+MUKDeQGugTyYcbXty6JLcqH/iRXS4cGTUnhl0dU6yYAHjM+AqzBGtyHwKtbR
 I8aTuvQDn/F17p0Xsxv8GqsyAM0xdTjBA5IstPInmrx44yxVHpMHR8b9PSIQHpvg3Kr/
 Xeh9JUU0Jo6bTxqaeoX+DsM3JLzY9IZYD8IpD7NcSnCZU4MNpGKIxE/2eTgXo0u4rxM2
 4aOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyL7JHuUqQfC1XZZK98zASpudS6vFiEnUKB0XdiZSEwvZpn+nJU+WG/DM4db4Y22OTLb4Nxk7bZQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC1Ub+Ol6mXxEbhmvZ/d4vObDhkkwT39A+PkrMH9+sN13LU8ot
 W8PZXH3HZjH+gQ98ACnLb4/w56mgfc5+qJGSQe7SwSDMzo6bWbzI1DMYBiAqhfo=
X-Gm-Gg: ASbGnctV10XQAH8oiNWsDXzS+gqbg0Z45pXR+K0S2Vcc3P7x+B4kXGA4rlCQ9LcspVV
 Ddp8TA/xTmr5sBDyb0+xItoHSL9pLqxlGI6bODawFyL2jfUQf51jY73fDzcDEH7KuyAYjw0R/OS
 BWdcWqB8r0QSynl6nNhMjX+1GiDevhqhP21V95g//hu2DibVYH1dH0PdZoD0k11GqlEdCEnryr5
 gwi/4Xp2MtmWfeOSgrdxrBue2BGmNVrzzc8s8hGDrrP8AuHug0KcuQF1bcafJ9KALIB6s57CnKt
 L6esXC2QUT44jKuPd2+x7CIc1OCcTP8CXQMDRqFCTovnG3wMMg==
X-Google-Smtp-Source: AGHT+IFPPRTmEdhJHKxLy8Tag7aJ8MCR6K5N/RY9rHYVd+ENG21KhflHXXSPp3UiTZ2sQh+jQtPtYA==
X-Received: by 2002:a5d:584f:0:b0:391:ffc:2413 with SMTP id
 ffacd0b85a97d-39132da08b4mr9411995f8f.40.1741630974330; 
 Mon, 10 Mar 2025 11:22:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c015c2csm15382176f8f.49.2025.03.10.11.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 11:22:53 -0700 (PDT)
Date: Mon, 10 Mar 2025 21:22:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/xe: Fix uninitialized variable in
 xe_vm_bind_ioctl()
Message-ID: <95a4da90-dfa0-4033-aba5-276b3d9a1824@stanley.mountain>
References: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
 <Z88ZzoFA5KpQTLmH@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z88ZzoFA5KpQTLmH@intel.com>
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

On Mon, Mar 10, 2025 at 12:56:46PM -0400, Rodrigo Vivi wrote:
> On Mon, Mar 10, 2025 at 01:48:00PM +0300, Dan Carpenter wrote:
> > The error handling assumes that vm_bind_ioctl_check_args() will
> > initialize "bind_ops" but there are a couple early returns where that's
> > not true.  Initialize "bind_ops" to NULL from the start.
> 
> It is not a couple, but only the one goto put_vm where this bind_ops
> gets actually initialized, or not...
> 

I'm on linux-next.  I'm not seeing the goto put_vm...  I think we're
looking at different code.

  3063  static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
  3064                                      struct drm_xe_vm_bind *args,
  3065                                      struct drm_xe_vm_bind_op **bind_ops)
  3066  {
  3067          int err;
  3068          int i;
  3069  
  3070          if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
  3071              XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
  3072                  return -EINVAL;

One.

  3073  
  3074          if (XE_IOCTL_DBG(xe, args->extensions))
  3075                  return -EINVAL;

Two.

  3076  
  3077          if (args->num_binds > 1) {
  3078                  u64 __user *bind_user =
  3079                          u64_to_user_ptr(args->vector_of_binds);
  3080  
  3081                  *bind_ops = kvmalloc_array(args->num_binds,

Initialized.

  3082                                             sizeof(struct drm_xe_vm_bind_op),
  3083                                             GFP_KERNEL | __GFP_ACCOUNT |
  3084                                             __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
  3085                  if (!*bind_ops)
  3086                          return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
  3087  
  3088                  err = __copy_from_user(*bind_ops, bind_user,
  3089                                         sizeof(struct drm_xe_vm_bind_op) *
  3090                                         args->num_binds);
  3091                  if (XE_IOCTL_DBG(xe, err)) {
  3092                          err = -EFAULT;
  3093                          goto free_bind_ops;
  3094                  }
  3095          } else {
  3096                  *bind_ops = &args->bind;
  3097          }

> but perhaps the order in the exit is wrong and we should move the
> kvfree(bind_ops) upper to the end of put_exec_queue?
> 
> Matt, thoughts on the order here?
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

I feel like ideally vm_bind_ioctl_check_args() would clean up after
itself on failure and, yes, it should be in reverse order from how
it was allocated.

regards,
dan carpenter

