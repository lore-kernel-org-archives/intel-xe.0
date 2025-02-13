Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09746C021A7
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 06:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2710EA01;
	Thu, 13 Feb 2025 06:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ImCK39nu";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D71410EA01
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 06:42:47 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso95977766b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 22:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739428966; x=1740033766; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9BwzwrGYYZTdrC+x4ZDscx1vZlqh8gdJX/EdgKjGlkU=;
 b=ImCK39nuYbvWUmQ7Xjuq98RGV56dQpviNtXWTm/LRzanrMYfAYnDcdV7t/JJJNsJqI
 TOvJU+skgRa/RCRV7teKUh/UMywpZ7LPBpwrfeZJt/N3i7DyblTv5KtQzv6oZMC8Bh2+
 DWIbGIUUQRcQVyVKgNUP9XyLi+JT58R4QAt0XhJVsDKLFJueU31nId4LBWTKA0laPc+C
 gQqHMG0WQi7zmc+AjTXSwBYUTGcn6Flwu/C/mShMBwRsYbzzh5M7HU5/wstINK9S0iUh
 E7eYNwhF8eAs8cnPekZJLDazPD4221OMvzUBbDVAnLBL768ZirWIaW8sQ/JNXV+xOGD9
 VsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739428966; x=1740033766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9BwzwrGYYZTdrC+x4ZDscx1vZlqh8gdJX/EdgKjGlkU=;
 b=lpAQx+JWVlHxKVxo9Fh3f8IreTiIbs4z4irWApTYzwCA7wk3HfxRQO9fQXxZJI3K2D
 JVmhvg7KYxWktr3pn3yLlx9iW+EqYghwTNRve82GsqQuxo2rDzP5baW+ovd04CFcT194
 /cdu0uAOGXgc5YIDbClq7KMvq7rJi+yrXawkHdc+9ikDh/cXZcF2t1mZChzpIJjakoEc
 WuHP79DbB0g6f5eVxgAawsYLNURIBatqtelQLThFr+WwFKY2VV1WohMoseh2uVWuqhj7
 6J+CCE7/YB2Tx9tjYoD6vE4u9gTIiWP7qCc6x9pzTL9b6wL1/g7O/ekMQtpqx96nXY46
 N/yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrjlu7VdyQ51hWBZW7eoQqAiBnNGHoRooa1XBQVLCiIQDjblANYsq55NoVOVkMTD3QjQKj38bbyA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL2ifA9adH48uCPG0JkK/IFU1alrA+FKRMyqtpheUjfk8Yj3aO
 cTfBzJI1JBa2Xe8KwuR4IBw0Fv3VSIeS/h3HU0MMwE8KI/4tWGI/eFXYHbiWgus=
X-Gm-Gg: ASbGncuEfyrNAFSRYz6r3pc5Ef8LMN13auPx6B3S6TzWPRVzKfGvh/sSMMp0CxsqQOE
 XN1e+pTpTJ9R8tHte4lymTTfucd0DgVWPddIfUz8zlcxUx9QPIVIMdNplfsdT8o30e3SedpJ/y1
 DXykRaX7bp4Nzh7V4uTryoBD4v3/rMReYicem9v5HOSK/to7WDnOZZkgaZVNl00nXEGBoTooxNE
 kwhn2vbyGlT+D3oIPiXvpPHAKpv04HXXutq97vBegt/2ToAHlRd7CL6eq9qdE03ESDiV1N6comH
 1yP+OpinYaK8AS9fiygB
X-Google-Smtp-Source: AGHT+IHfO8U4hoQ4wfehrbP6h0/5qB3bjvRpKf7TxOY9LwHfy4pcqhScdFSiA9hJ+EqazrPV64mc4g==
X-Received: by 2002:a17:907:7207:b0:ab2:db7b:5db3 with SMTP id
 a640c23a62f3a-ab7f34e7515mr531837466b.54.1739428965658; 
 Wed, 12 Feb 2025 22:42:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aba5337674asm64956166b.99.2025.02.12.22.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 22:42:45 -0800 (PST)
Date: Thu, 13 Feb 2025 09:42:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
Message-ID: <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
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

On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
> On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
> > xe_exec_queue_kill can sleep, so we can't call it from under the lock.
> > We can instead move the queues to a separate list and then kill them all
> > after we release the lock.
> > 
> > Since being in the list is used to track whether RPM cleanup is needed,
> > we can no longer defer that to queue_destroy, so we perform it
> > immediately instead.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Patch LGTM but can this actually happen though? i.e. Can or do we enable
> PXP on LR queues?
> 

This isn't really an answer to your question, but when I reported this
bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
xe_vm_remove_compute_exec_queue().  So it's possible that this was a
false positive?

> Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
> catch this type of bug immediately?

There is a might_sleep() in down_write().  If this is a real bug that
would have caught it.  The problem is that people don't generally test
with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.

regards,
dan carpenter

