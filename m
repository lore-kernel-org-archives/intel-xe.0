Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D1BCD1296
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 12:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE910F142;
	Mon,  1 Apr 2024 12:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JZNjXPVA";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483AD10E17E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 19:13:56 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e0b213efa3so12277075ad.0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711653236; x=1712258036; darn=lists.freedesktop.org;
 h=48208e010a25250e94a9b24485523acbe79cf861from:in-reply-to
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0LXeNPmqyAxge/cGn4Qev/aT/r5g++MEZ69hkgXXfY=;
 b=JZNjXPVAUg6nLMEfSiXIqe2vmznGPdjx3ebZ6ckbOl2+n0yhmJV8yW7PHJegolBbLj
 JyLkDKImXmax6AoK//pIoZnIvC/dZSiL/OjI/DRpf71Ar26/sUNsIA4aaNjN4q50mKgg
 /7NSTv0b36in34Pnu4fvI+3p+maUxlwQkweYLrwFrF4RZCAC+G6i9tQtRo1lkNq9YQH6
 x8IMtsulzK3+MMgtdDQVrrLicOn1aYB9jbNhUEF13+oHZRloRUQCyKCkyWIVZzuXDhCM
 9F2OONvcRIxfxR6tSeLwc9fEsl7XyQYFH0L25z3ry1N333iOdxjAsFTaa3VbUnFvw7QT
 DJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711653236; x=1712258036;
 h=48208e010a25250e94a9b24485523acbe79cf861from:in-reply-to
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t0LXeNPmqyAxge/cGn4Qev/aT/r5g++MEZ69hkgXXfY=;
 b=kWLBv1+C2lDra6uZk8WW52WLSdR1IhQjuAbWZAEKjpV35L4DOMmbIxsdQuPPCXVfby
 xaVA4vnqMaCoO0nPPBAm07+d1bVe7IfdvK1LtdX2yfgdhrlkpKDMawZcKnV7WW7S4Rfi
 TBnkRBcFaxzUNn5FzsCnDnPfsKh4iYu3r75Q5X6Ek+fzeJ5jD+StGoqN6jQQSCSTfMl4
 GnRDFAguQWADci6afw4ZwucPRdzd0l98d6K8BZR14OunIx7DlX765lHvuZAatnsgvmle
 tid+iy1Vvfgl7bugoDDDn/5gcpLbsHFj8hLaSw2puBTeb1e2PxS2uWJ5AuDBxOscEFdQ
 8qhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS6nnPWidNh5WR6CWYp9xZM3tQhyZ2ZR41CkJTB1rDC9LPXSTYDyMVW8z/CP77TkwWB9zhM51yhYE0d6LfsZ/9OJC8+OruSwfsQQMXj+Y=
X-Gm-Message-State: AOJu0Yz9KMM4kIMWPkJ7ACK/CatkaVVifyGyb2uYPDWzbHD9CWlkzdGq
 0MkJkKNzvjUqIHYBoJWB69jKmvjY4kIFgzIbbXjTc2MQsMvVNEBlN3PNVVXJ
X-Google-Smtp-Source: AGHT+IEP5TVGKcxs122LDgEDGgm+rIRZJciDbLsL/k6VZcYjQzgsdyiHzSxUTY0YCFKETdV0hm0cNw==
X-Received: by 2002:a17:903:32cb:b0:1e0:b629:b009 with SMTP id
 i11-20020a17090332cb00b001e0b629b009mr548242plr.20.1711653235702; 
 Thu, 28 Mar 2024 12:13:55 -0700 (PDT)
Received: from localhost (dhcp-141-239-158-86.hawaiiantel.net.
 [141.239.158.86]) by smtp.gmail.com with ESMTPSA id
 q17-20020a170902dad100b001e06c1eee22sm1982396plx.74.2024.03.28.12.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 12:13:55 -0700 (PDT)
From: htejun@gmail.com
Date: Thu, 28 Mar 2024 09:13:54 -1000
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH 0/3] Rework work queue usage
Message-ID: <ZgXBcpRv_FTIoq91@slm.duckdns.org>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
48208e010a25250e94a9b24485523acbe79cf861From: Tejun Heo <tj@kernel.org>
X-Mailman-Approved-At: Mon, 01 Apr 2024 12:47:10 +0000
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

Hello,

On Thu, Mar 28, 2024 at 02:02:47PM -0500, Lucas De Marchi wrote:
> On Thu, Mar 28, 2024 at 11:21:44AM -0700, Matthew Brost wrote:
> > Avoid sleeping or grabbing locks in work queues shared with the system.
> > Recent changes to work queues [1] have exposed deadlocks [2] in Xe.

Can you elaborate it a bit? I'm having a bit of hard time imagining how the
latest workqueue changes would have exposed deadlocks.

> I think we need some of this information in the commit message in patch
> 1. Because patch 1 simply says it's moving to a device private wq to
> avoid hogging the system one, but the issue is much more serious.
> 
> Also, is the "Fixes:"  really correct? It seems more like a regression
> from the wq changes and there could be other drivers showing similar
> issues now. But it could alos be my lack of understanding of the real
> issue.

I don't have enough context to tell whether this is a workqueue problem but
if so we should definitely fix workqueue.

Thanks.

-- 
tejun
