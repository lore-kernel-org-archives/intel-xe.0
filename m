Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742C9606A33B
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4DuLXkR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CE310E5D8;
	Sun, 22 Nov 2026 16:41:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB8B10E5D8
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795365705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
 b=i4DuLXkRfBoKkPdQMMKa32RW1ogoVjLXgxpWAAn7VsEUXkcDcf25fZfBy5NXFNs/1EV3up
 eriU5xZLLXGAk6Bwu8V8JkwrnUS/x/VChVbc/OodWmCesLUaUBsZKS0ALFxxpUz2kzuH3e
 GgQ4gOEl5P59rDr67zLQTuVdI6kqZw8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-uJ9ouBl0MM6c2doJYqViZw-1; Sun, 22 Nov 2026 16:41:43 +0000
X-MC-Unique: uJ9ouBl0MM6c2doJYqViZw-1
X-Mimecast-MFC-AGG-ID: uJ9ouBl0MM6c2doJYqViZw_1795365702
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48fcb657f32so1444566f8f.2
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795365702; x=1795970502;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LL3qYOVyI9czVO79Zu0V4wotcvHDG47da4SE8/8wYVY=;
 b=DINJZWxBHdQwvdbYTDITJefxcUwJPDHTKZjdyP/1zTxa1phNGFqjEsOA1xI1mFFu40
 KUSPLbsRdi8zRgtXzbCxRBxeE7zG3Zsr/OCZYUjxQH3+qd8N12JOVwc8GL4oep2K/4Tl
 ElQVt+BRpW5QR2lH6kltbYBwl6Na8cWvpoNm5U48jky+m/elxXSg0ypkmJZMK15cZyzQ
 9wgs1xSv8NR+nHoLT0ZCfNCONKG12auanC23XCK9OIJAuGI9DvScbk6XHJatJyo740wf
 K2RDpHWPKOjd4CAsVesyOgK4NDkmHyMqol/5uDnPJvNX8YZIwobGzgRgGlRoBXziNZVp
 Jvjg==
X-Forwarded-Encrypted: i=1;
 AL+hErFsWpKJRest4PRdp75DLkIc3Jd1edmxxTlFR9Hnlb+whS+1oRxBoyDUwbUmjB8+tg/XJom48YEI6g==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9bEAxm3kNYhZRE2bN94jqjGf37BRxKkJjZ1dr6g77IDEBZQ595
 Ts/ngSva2mwmss1gh5bt2/f7BjNyrsKRFnPaOIt1u2WdoeUinRWtJG49UpuSpAt0u6SsezXb9wQ
 owMr0bvN3I8IFa72sTn85ILAx+OSoO7N8eGei1AtPeQebdtFip3/1K/AzkMo6oxBz4DU=
X-Gm-Gg: AZFdTZee4/oZHD96EU3DXaPJ+Kud7BJAWyaEa/3/DAt5yGZTKfctA9sCK3DoLamD+xL
 1p5vNX8MpiZ/xtSx++KZwlICok9bUT2zFz6Bf6Hi1K55plVtIeN+FmZEipluvUUvCztpqW1aYAD
 WDxXceKSF6dqQM12lHx0i4kHRbfEt0ItDY/I2Jylp24Ya+7OXz4/S9DG1T9YafbXN+4dyWAHBQZ
 RWFeQk5cxdSJgZOxBsCTJEo/A1gdChrgTOZXI+xb8rEotGTjv6kuZHWSIqjU7EaNAlzvIuA0gSs
 hdgLweMYQ93A/QZZGXKdSI8NnzMANuxGMa4MVxoXUI2SVM5aIJo0JGd/KCnY4QZ7w2jfF9KWGYZ
 NSvqnDZrozkuX0fPgoiHE6dL8Al7+9XL6DLILPMrS4kSjsXz9NqsUJgtJb0cbnaf2XwiqWOAoHP
 LFhQCi
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id
 ffacd0b85a97d-4abb4f58c75mr17629617f8f.27.1795365701980; 
 Sun, 22 Nov 2026 08:41:41 -0800 (PST)
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id
 ffacd0b85a97d-4abb4f58c75mr17629591f8f.27.1795365701633; 
 Sun, 22 Nov 2026 08:41:41 -0800 (PST)
Received: from [192.168.1.86] (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf62f7sm18809912f8f.13.2026.11.22.08.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2026 08:41:41 -0800 (PST)
Message-ID: <af91d4a7-11ca-4f84-b8da-33ee1a585916@redhat.com>
Date: Sun, 22 Nov 2026 18:41:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
To: Aveline Noir <jm5905938@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 jgg@nvidia.com, jgg@ziepe.ca, leon@kernel.org, leonro@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org,
 Patchwork <patchwork@emeril.freedesktop.org>, Shuah Khan <shuah@kernel.org>,
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com,
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
 <179535872126.34.4789080961796247940.b4-reply@b4>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <179535872126.34.4789080961796247940.b4-reply@b4>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ks57aweP8YXtOdcUwcAaodvPgOJlBNCK7xi_tkRvcAs_1795365702
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/22/26 16:45, Aveline Noir wrote:

> Hi Andrew,
>
> On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:
>
>> Store the corresponding RAM backing page instead.
> This avoids the oops on the first read through the second descriptor,
> but leaves a stale backing page pointer after CPU faultback.
>
> Since the mirror XArray entries don't take a page reference, they rely
> on invalidation.  When the CPU later faults the page back to RAM,
> dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
> mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
> migrating descriptor's entry before the backing folio is freed.  The
> second descriptor still points to that freed backing page.
>
> Reading the same page again through the second descriptor in QEMU
> triggers a KASAN use-after-free in dmirror_do_read(), and the read
> returns the stale data instead of what the CPU wrote.

I think this is right, but a fairly artificial scenario: it needs two
descriptors open on the same test device in one test, a migration through one,
a read through the other, a CPU fault back, and then another read through
the second descriptor..

The fix lets the device private page content be read without an oops
in the context of one fd which is an improvement. 


>
> The second descriptor's entry probably needs to be invalidated before
> the backing page is freed, and it'd be nice to cover a second read
> after faultback in the selftest too.
>
> Thanks,
> Aveline Noir

--Mika

