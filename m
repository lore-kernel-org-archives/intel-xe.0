Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44997606A33F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9IMo6nw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE10410EF18;
	Mon, 23 Nov 2026 15:17:28 +0000 (UTC)
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23B810E474
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 14:53:42 +0000 (UTC)
Received: by mail-pj2-f9.google.com with SMTP id
 98e67ed59e1d1-3b196fefa1fso1310992a91.1
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795359222; x=1795964022; darn=lists.freedesktop.org;
 h=references:in-reply-to:cc:to:message-id:date:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=RMgj1FiPWOfcno2Rg3daraUU1yDv6jWsUnElDClVHG0=;
 b=i9IMo6nw22B3VZHrSw4nEZtpnSR/jofjsvbPUqiPzGjsxNXlnu4nM9hePRZQgokXcE
 QSyHxsjE7RC3qW7YBHlwdyJHDZ0CEYpRbI9yk7IUXmV7mLvVAsTK6Nhr1kXjDGtiBQ/e
 CqIA77EbpMsnrEGJJG9wHdDQVt5BA/X71w+cjITCgqREKKddqT/TwUYAbrnpvFu6YJnH
 eRdOzrVwcsCgdVtcadaUjIBDs9JwIF/7+f7x4c0h7cVgUv3AnfGXCSnArG3rDDRFleLW
 3u4XFYmdnKg/JDZAfwy2fPZA8QAib4KRmlTykL85eGGiDb1GAzoedL6HRT7jSy1ECiFQ
 j/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795359222; x=1795964022;
 h=references:in-reply-to:cc:to:message-id:date:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RMgj1FiPWOfcno2Rg3daraUU1yDv6jWsUnElDClVHG0=;
 b=a5HvdMo3DrAnw0wDvvguZiSSLlvWOMASkDME7Oo/vLFkRAT0/m4Clpr5hULw8sD7nq
 iwD7wnL8m+D/e7mGz8JJmmVkcYDTzZJ3e50R6P4rkAPscVrT6p5BezUsVPxitdfPVf8s
 wm6eVp2dx/UVeUAYz/knTgplpeoV0Gl3T7R6MNHsALxn10JvTSznlhqOJIGbbWrdazTo
 MxO9vb2jT7cZliT10oMbHfoG7cKJITALM98R42VMOaXyObgfXHGPUfWHoSLa6DtgbdW2
 5I3a7T7ux9Pj9T0TXB+TEtr0fzMzDDnS0N8rpcINsT7RX9WRXosZlam9q9MrGbpa0vWH
 x5mQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEmntMJtKTRmCit8GBpTVfopnpn2vWzV66dSxyPH/dmY3zyHUt4xu0LB4cj35+DWQHglYssY642kg==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+AQI02iXAm3c2F1V1PEJS5WPSXm39M6aQwh5dOUQ5x/E7Vu+wH
 kfyAfX6bytMO9o5qtYtIK6uM5P3lI9gIQDHjlOsB/4+NsSEKomatOsT6
X-Gm-Gg: AZFdTZdpOcUIUpir/jWQJCjAivDDUmd999CkGvzTusrwojpJSWkCRbwO6Y0NTwzujGl
 2ocNdwODnimxKQVUnkjf3SaqUu08rpTVAvYSVkngEW5P9PGSJ+d3XbG0ZbWUj7kdzaUL+xB/BaT
 cnXOMtbXv6gHeJtX32w5zPTJ0/veuiWjQkKURBi9ngmt6ag94KOiZF1W0W3hk8elLmCFG8mpmrr
 Mfy3Atxdy2uFZp17tX/s2Xl3CYjqmBtQIZd0ohUl6EBWvWlvXSW5q0X+FCP0LUDRUid8caXeJNt
 k4rzKcGTqaUUXE6mkX46DjhqFwOvX+YDZSMLsa2KEW3LU5N5AvjcbwVYN4g33vzQOnQEG41nuZo
 F1aJhZyfjVnFBA8mpdtV7Epyu0upTkKDNrDhApHrXPFpvpZrY+n778EKy6dskt5sVR2x7TzpIun
 T5dpDU4uR81V3/jwaPdPqsHFM4GQSsZ/T0o0+Xt2Tze/JaKTmIjZCWtli2bOVflzsVmBtC7T55W
 0uC92C78PwkpxEfYig7R/RZps4ieCjaKLXTGH3xcLsxzO6U4yItROIUzCDky01xUZigw4x84zL/
 /XVChUSxLXm/NVhCGD2E+GMw33t5EQDT0Y8rzgh0ojQ4P1586TkDjcX06BEreRmqyx4zdpFVOMK
 xtWSu4Qu9QHeddk0ovRm3j0Nm/hMYOZSKK7bN4ccQ/PfKaSYqP+Hgw+BHYs3yidX7U+HVjFo=
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id
 98e67ed59e1d1-3b41c90329emr8542890a91.30.1795359222086; 
 Sun, 22 Nov 2026 06:53:42 -0800 (PST)
Received: from [10.131.38.181] (n106-71-19-159.sun21.vic.optusnet.com.au.
 [106.71.19.159]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b44b75f2a4sm4545959a91.2.2026.11.22.06.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 06:53:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: account for subpage offsets in device-private PMDs
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 23 Nov 2026 01:45:21 +1100
Message-Id: <179535872126.34.4789080961796247940.b4-reply@b4>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, apopple@nvidia.com, balbirs@nvidia.com, 
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, 
 jgg@nvidia.com, jgg@ziepe.ca, leon@kernel.org, leonro@nvidia.com, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Matthew Brost <matthew.brost@intel.com>, mm-commits@vger.kernel.org, 
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Patchwork <patchwork@emeril.freedesktop.org>, Shuah Khan <shuah@kernel.org>, 
 SeongJae Park <sj@kernel.org>, thomas.hellstrom@linux.intel.com, 
 Vlastimil Babka <vbabka@suse.cz>, ziy@nvidia.com
In-Reply-To: <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
References: <179342234355.4.16705453209886955762@gmail.com>
 <20261121160037.1a479f3c8b4e860bc23c106d@linux-foundation.org>
 <36be0904-168d-4813-82ff-27ecced464e3@redhat.com>
 <20261122015246.d8b6b98ff5a8157168156339@linux-foundation.org>
X-Mailer: b4 0.16.0
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On Sun, 22 Nov 2026 01:52:46 -0800 Andrew Morton wrote:

> Store the corresponding RAM backing page instead.

This avoids the oops on the first read through the second descriptor,
but leaves a stale backing page pointer after CPU faultback.

Since the mirror XArray entries don't take a page reference, they rely
on invalidation.  When the CPU later faults the page back to RAM,
dmirror_interval_invalidate() skips MMU_NOTIFY_MIGRATE for the same
mdevice, and dmirror_devmem_fault_alloc_and_copy() only clears the
migrating descriptor's entry before the backing folio is freed.  The
second descriptor still points to that freed backing page.

Reading the same page again through the second descriptor in QEMU
triggers a KASAN use-after-free in dmirror_do_read(), and the read
returns the stale data instead of what the CPU wrote.

The second descriptor's entry probably needs to be invalidated before
the backing page is freed, and it'd be nice to cover a second read
after faultback in the selftest too.

Thanks,
Aveline Noir
