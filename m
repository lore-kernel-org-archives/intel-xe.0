Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A76DCA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 21:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DC910EA2A;
	Thu, 21 Aug 2025 21:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uVRB6JRW";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F59710EA2A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 21:32:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-246013de800so65835ad.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755811933; x=1756416733;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dz7RDdIAdym4j5xhdixGaxPIwJbWp2rNz7mv9bLh3G0=;
 b=uVRB6JRW7TsLjrvZV5jZnkAnB1m8WZQ4WHt8CaSe0BbIQ1WNJSbEFKSCy8w25A8aX9
 IgvXqRK5Ff89wWVFpHiEg2Jlw99usX7jvgOJNHd8VjcHBvz1nKCJbR8se6kXpGE13cXM
 A9lA4B5i+GnFtnUM71uw9Nf0/PvzL+gNueCmHLII/5XUdMOrbqGiDKr6hapI30mwkInI
 7NuuNfhRx4NjOyLiG7I1zcp2xnWPU+VLtOOq/2vBK5SHOuhhzkqr+OEPTjftSWD8V52N
 Fl9Hix+IAYIatZXDAmajV0WIPC6YEGx5MhhIMlwASZCYd49Uw/IzneoggqfmPdxTYl/K
 Upuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755811933; x=1756416733;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dz7RDdIAdym4j5xhdixGaxPIwJbWp2rNz7mv9bLh3G0=;
 b=K0APEJavPdkHp/8767OUjxP+1/jAvPHr3cMR0OMfZF9Wl5JNqaplNIAfDBW5VNusEe
 pLXwJGykbXuwdo5XZjgH6FtVFAxAeBQKTQmqXntw9yHFYo0hef+Ao95uMF3CrgUZNKaZ
 Ds2ktS3YmqzUEGRnnE7CPPYniXh4c1X55ky81XzahGhGCbEoDDtCl+7b3TKAtkAYXMc4
 yaN7FNhrw1d3LvmzCI80AU0xgWZRjdzk8kLr1tb0akRd8L+nCKyEOMVQgVcAf7Eijn3s
 zqbdSgrsn6W83tQ4q8CzeP0t/32MNsnkm3z5s9q3Bvz3Hf7Lq4KzKBc6/estDMVIlSWy
 4Ong==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Uncylw9TYGX0lelqULaa8ny/BZofwrIhV09DmjEIC9wnUoNt6P3WErdZsn2Imwoz5rkR6toE1g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySx04YA13H/WfnjWKtFT+vZ909y9oULBd6Z40fkn0HWNzT+Sn6
 2/TYeJ/c3cHILM9aMhg5ieMwhich9HntRrjYGYrCslKPvITuuFZ4wR4YVm8NOxaDLQ==
X-Gm-Gg: ASbGnctQl+JHA6JJNiOLGOwBS9pwXmMSF97RhSmtC9rrQpWYHBwTcgV73EfT0coLlOk
 Xllm6Ien6/bA4FsfZdgh2BzUXSYxllFdMElA0sjVWUZSLXNbJVcnhevtajGIbIeGplDSU2Ps364
 SlpTNNnxnoXhQz5rz04Yl7eFs0D8qaRkNgqJNKuZynqgc5nl0ZWa3GlgboHf2fvXPN5eVLcyvTm
 Wha3IYv+N39J40OxleFWM6i2Yr7Lwxy0Klg6AktE6NBoYrRlEfcYUrJX1UCFrKpHaelHaGjgqPA
 dH/glJ504ZW6kVpaC9XZAFfGF6Cidp8TPDwwA0PUVVm44HfN0b5FnAOxJd0gwzaR4w5tulS62bN
 v3JJhxPpAiXkoWeXs+v2WRMdrQ2ELuK0ocFtpOTIWESwFQTAb693ppQYJXL2dMw==
X-Google-Smtp-Source: AGHT+IEjUQbjSOhgPioiI9ZU+wJJPwSs4HepY0QfCBtA7GumDrWid1z4G3QnghW1ZWO3O5vL9kL0iQ==
X-Received: by 2002:a17:902:e749:b0:237:e45b:4f45 with SMTP id
 d9443c01a7336-24639f24399mr417285ad.1.1755811932524; 
 Thu, 21 Aug 2025 14:32:12 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4764090714sm5482103a12.32.2025.08.21.14.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 14:32:11 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:32:07 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Atwood <matthew.s.atwood@intel.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
Message-ID: <aKeQV4EeNgfIsX_k@google.com>
References: <20250820201612.2549797-1-cmllamas@google.com>
 <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
 <aKZUy_XZxHKLQUAS@google.com>
 <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
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

On Thu, Aug 21, 2025 at 04:00:33PM -0500, Lucas De Marchi wrote:
> 
> IMO the POSIX version is horrible. Let's add a xbasename() in this
> xe_gen_wa_oob.c and use it:
> 
> /*
>  * Avoid the libgen.h vs string.h differences or lack thereof, just use
>  * our own.
>  */
> static const char *xbasename(const char *s)
> {
> 	const char *p = strrchr(s, '/');
> 	return p ? p + 1 : s;
> }
> 
> static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> {
> ...
> 	fn = xbasename(fn);
> ...
> }
> 

Sounds good. Would you mind if I use __basename()? I'll send the v2 in a
bit.
