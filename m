Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB0F483C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ABB10E46F;
	Mon, 23 Mar 2026 16:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pw61+tJp";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24A10E4AA
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 14:56:51 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48628ce9ab5so10591515e9.2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773759409; x=1774364209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fV0vsElu+7ZDP0k7EZQosqrMEMjbFMIbCAe1EPTu8LI=;
 b=Pw61+tJpY9hG/aPfRgW282RX3RujtlF9GAUx8/P9W/sa6dqj57+1TG3YUP91JfAmSV
 9ZryN2EKZi/08kq46waJzBal2xAYkeefAViJX13qERt+7PNqLk1Hd/MM0LJjEO7ebSEP
 uZjGDQEbu/4reL11ekjxWnrzXYJggeSXZ104ShZKlvB1TYuSLuDGa/jxThcvEWQTY9md
 83or+Iuee0wqWgvlYPvvpTAFJR1Slv8Pzu/v878MIaN2p2AFygs+4KR0viDNjDW4NXyn
 uK5KjRkbwaYi0+qEtIc6av+FKUCUJ5wIxGdON3qrsdaz5KvStMbRH2RQah3KO5peWiNi
 Ug9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773759409; x=1774364209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fV0vsElu+7ZDP0k7EZQosqrMEMjbFMIbCAe1EPTu8LI=;
 b=Nno5nY4tn3+lOswNUMo1yCSGObQHyz6Is7mFwZcZ6ZzowSrvwz3uIYH69ZlkbggnF6
 c2727sYJzkq8Tc8qtJTWEAF5dF07VQ6dy94UVMDym8BHVdch96QBtxcJ9DBIvnc6tfFx
 61lNr2xSiAxcPDE+MZWawGQ2qJqLb4fw7iv1G6hbb813gSSCqET7v/rjymmpz29LvoJz
 l5p6g3Eq/147JlhTr/n0GBomqgKilbM9PTujutFNDAev+KXxxblezESmAge4vHuZHs0U
 F10/4jqnmklc0YX0m481NinonqlQxvbKphuRKjnsyX2L/4FBqcQkcjiwJrMOYyOCtHbM
 YEyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcWooOVD4MWS7jRh+1uRvGP/zUjyZWPJyjOXs8zFetQbPxvRH/3Pc0aRentXcqu685NZf6o9/giw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjRDxtWa1UMUjthzXAyIY+4195qL7fkZsyLdpdKdpJ0mxlpd1I
 eaywFbfXmgQtFGFVKZ4yTm0xJTxcJLwjzT0JkmPOGkN5O6j5yqyASEpq
X-Gm-Gg: ATEYQzwfvYUVQC+QyZqwXLw6LRbIBmQE6z4QZ6FCmNVsY3z2qvavhMkGxCJTztd3XCI
 kUjNPBsUCVIc51Qzg6Rxt0bFL1P2gnvJFjOQtuO0LM9l/fCJuqJNdKNs7mcNxV8M6/h24+Uj0eF
 U+SPX8P7eZrwnnJwDiUGhAMAQg/L24mNlAyJWE7ENoAKF3ah/LwZmyTSjLGuy4jf1r0XDd74Jxg
 mowfqmrh1FWtwuYKCOrbTuGXZw7NKt1TCHDGZff7ZbPQqIUXsGXQP85nttHiDU2G8dO/9PZ1UMk
 OjT0jTqfNkDDWE23pzZRZLrRthBQcZ9rwv442LQdqCgYE56cdGtaCIEwanZpdBYlZtTozs9OEBw
 qBqtuTgp73JSb4JrnpBivnFvPP4bRfiX8e/8ogA+K15wFwmRgSz7J8QX0eg2jYETvMBJs4VcoH8
 7WvA5grTdLKg/T3yYt+TbLiTaV+P0IfEN/D4qS8u33Dsh2O8HS3OiQfNJzQz5SI1yt
X-Received: by 2002:a05:600c:1d1a:b0:485:3d00:efd with SMTP id
 5b1f17b1804b1-485566cfacbmr307335885e9.7.1773759408795; 
 Tue, 17 Mar 2026 07:56:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856ea97e8esm74472665e9.5.2026.03.17.07.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 07:56:48 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:56:47 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Matt Roper" <matthew.d.roper@intel.com>, "Arnd Bergmann"
 <arnd@kernel.org>, "Matthew Brost" <matthew.brost@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, "Dave Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Dnyaneshwar Bhadane"
 <dnyaneshwar.bhadane@intel.com>, "Lucas De Marchi" <demarchi@kernel.org>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, "Umesh Nerlige Ramappa"
 <umesh.nerlige.ramappa@intel.com>, "Raag Jadav" <raag.jadav@intel.com>,
 "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe: use %z format string for ptrdiff_t
Message-ID: <20260317145647.0d5de2a1@pumpkin>
In-Reply-To: <e46c3681-6f5f-4a41-b5bf-72627b4ec87a@app.fastmail.com>
References: <20260316224357.658520-1-arnd@kernel.org>
 <20260316225118.GD2729713@mdroper-desk1.amr.corp.intel.com>
 <e46c3681-6f5f-4a41-b5bf-72627b4ec87a@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

On Tue, 17 Mar 2026 00:07:57 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Mar 16, 2026, at 23:51, Matt Roper wrote:
> > On Mon, Mar 16, 2026 at 11:43:46PM +0100, Arnd Bergmann wrote:  
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> ptrdiff_t, size_t and long are the same size on all supported architectures,
> >> but gcc requires the use of the %zx modifier instead of %lx. On 32-bit  
> >
> > Nathan Chancellor just sent a fix here:
> >
> > https://lore.kernel.org/all/20260316-drm-xe-fix-32-bit-wformat-ptrdiff-v1-1-0108b10b2b6b@kernel.org/
> >
> > His solution uses %tx rather than %zx, which according to
> > Documentation/core-api/printk-formats.rst sounds like it's probably the
> > most accurate format string for this case?
> >  
> 
> Right, Nathan's version is correct. I wasn't aware that size_t
> and ptrdiff_t have different modifiers.

Consider:
void foo(size_t len)
{
	char *p = malloc(len);
	char *end = p + len;
	ptrdiff_t diff = p - end;
	printf("len %zu, diff %td\n", len, diff);
	free(p);
}
Clearly foo(5) output "5 -5".
But what about foo(5u << 29) on a 32bit system with a large unlimit and
a big enough hole in the address space.
More likely would be something running on an x86 in real mode.
There malloc(65000) might be reasonable, so size_t would be unsigned int
but ptrdiff_t would need to be a signed 32bit type.

Of course, in linux, they are all 'long'.

	David


> 
>       Arnd
> 

