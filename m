Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60612C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 01:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5710E042;
	Fri, 21 Aug 2026 01:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G59HYyqe";
	dkim-atps=neutral
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E625810E042
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 01:08:40 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-836c43641baso10538487b3.0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 18:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787274519; cv=none;
 d=google.com; s=arc-20260327;
 b=KQTfJ3woA1+y06ZT6HPcasXh1kLRPgYiaEXs2UPfZBo6GsiDZwzruB4KzEL2eakoCj
 191iMCUnfO9ym4I6e1rcZKVVXHSffbeBXw+mYjDJFplKn2cqQgOC0gtgdnogQtwQwlwk
 ZTrAhazJIRcaS3HVloaxDP1dTwx7SCyvoATNUzcA2U4lB3DbKI/8MYVNoh4BhGKe8S/s
 01j7E6cIbJ2rOYeqJsdF7QqNYsgxStT+m6887LTnTVfTVsmXgKiJohGLRJ1Akqgo6c1z
 FSR6X0rGR66wlWHh+gUBehSAY5XfcI/ZjKwTpeiFWhgHsfjHl4iNxIhnZaLMOVu9p7ur
 irjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZV1SmMEvT1gGgEqnQY6QhKs4sAjhQXU4YWr0913GIYA=;
 fh=jKbjw45erNSvX+CxUzSv81FoBYr2YK2Ob9t3T740Mnc=;
 b=M0ni3tgpgVDIo49Ia9ruQyu/haFkyB9GyUsh5ZnGIY3AEy6wPkWZnqq6nP4CGGUQr6
 cz/s3TBzeQRD6PciL/Nlla5M1+rzxrAWQodndd1m/bgfm8T9SwKFybkfVjlstN6pwEcp
 tuU9U47X49l4tZOUWtm+3HxMAO/4itr7sVsOBgjpyYB1oc323esvF7iGPz8acraiYoD7
 LX3VY/1LirWhyFjLHz1xfZsHVBUq9xV85v2o/fLpQnoAygKxoaU05/ywEBX0V9QXOPm8
 frKU+l+0rjKcJulIF1LLNqzGNcrdjmH2qgcVq5zSCJ9JGJoU6PFvu/bEwAvSvEbR5a0S
 Hm3g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787274519; x=1787879319; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZV1SmMEvT1gGgEqnQY6QhKs4sAjhQXU4YWr0913GIYA=;
 b=G59HYyqeyDlGjw4xcOEp8nIFztjmVgjRprnOC5oZVty/zLHqsscZtyctMI9SCH9Nmw
 Kgz0hMFhi4MJR1PdMhmeOnrqYE3UXxPEa85/HkTmWNK/ZgGjl+gkS6i6Xm4cmQfYH6GM
 SAlys6Ip/rin+tK9gZjCXs9l2iD+0DiP4aTvayyUZ0EkieCk0djfAxMKtc69zD7i6Azx
 6Q8GiCQjDEBSH2DDyKcx29lveeYW2EsHon5JaE5YJnlNCR4MIEadO4pAOctdScQyYD9k
 LyOjMoEU8CCZzknBTMfQRt4ruZcswYGiJW0TxrZoXF3FGcgp037TIUhEE+RJcevMi/dY
 gv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787274519; x=1787879319;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ZV1SmMEvT1gGgEqnQY6QhKs4sAjhQXU4YWr0913GIYA=;
 b=Ph6RatWi7T3kmjQuwEi3KaIpc1julvfO0CV533o9/tOFeOO9ARArWuJLlZ2H01GTu1
 hc/AZ35BwJ1GEEiZFu+qGsRFdNcUPZYo0Lyypaaqa0jgbq+xhakixv7INVVNuvTlcatj
 7n6FbJkvXuxriEIdwQ7ieLp550dV3V3WPZR4eQno65BZX6Stj8aHTuT/8Gkyq/S7YVWJ
 /CoXKFtN1nd9smVLy6j9RN7QsvFNzzqZnrFXq9z0YJsis2cvKSts0KqDJw1eeryLZ0vQ
 xMy4wwPuVkwzWqxlYGTWe80YY/Xv9weEdCBCJKNwwzar2rwkU/4M8NXeNY5QFWeGkcQ5
 ADFw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2XCu6m4LipaeczTVwakSX0KpEH/H5hTXCOcwUO4YWwUd4nVj3GPhw0+d5RUGMBAWkgLO2Jl8wew==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mPvyI4XsykrH0yEWyNLPZ3UuGNPbT4FCmEFvZNI7wPh84hXRwb
 S3j9+6eZ9L5dRw7hhKcvTy0YcWlvQPkT61fBUBgCGrwB2XN5Hno78K3BfJmUjJfmwjDJ8ZCeQ9b
 w3gs/mIuVCHB7I7WLRgJzk/kHmZAEizg=
X-Gm-Gg: AR+sD11EyVcGgNs/LSBu59CMqzu7QYjkJsPliNO64Yn3HF7sTH2+bFg/I7VUagBurkT
 kjAUokQmXHTvTOuUPrWwdx9lZ777VAkeOblbq0ScltDxuVUJw/xLAaXi7n0OH4/WsijGp7/QzPY
 KjNyebFMS+HVO5yKCQUPt7c0ZsSNoNFuY00T2YmAF5lhCTJC6GTPiQWdHaqC+eG+rPc+Vz0JE9t
 h5V+F18faIq6iI7uHFSWTsnBhIVO978E1Fqjr0IzRgss/YhObo/F2tUNef97AmbkT2YRbAyOCnr
 QKjhiHk5oBnxeWl9r6B34drdPL1Wl4cnae/pNsU46B2Sur2Qaq5dmp5AvkZmC4W7AfIeI2+v18F
 EpswBe6uCC6etlSp6O1uIHzsnq1b5eg==
X-Received: by 2002:a05:690c:c15:b0:81d:75b4:925f with SMTP id
 00721157ae682-849f4c6ffd3mr12676957b3.19.1787274519530; Thu, 20 Aug 2026
 18:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260820031901.1018324-1-iridescentrosesfall@gmail.com>
 <aoczaCuoaZfUkfm5@gsse-cloud1.jf.intel.com>
 <CAMpTW2cxRrG4oJ0HrRoKhHrVHxWO01-L+QDoWMLCAUaSfw75sA@mail.gmail.com>
 <CAMpTW2fxFRrpn1b5WGYBrtLLMfUo_fmx9s2D0b552GJp-sF5qg@mail.gmail.com>
 <8b7001c68c94491095f41d2a3dff45090c0a95cf.camel@linux.intel.com>
 <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com>
In-Reply-To: <aoeUdfrPX+0ZnZMr@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 21 Aug 2026 11:08:27 +1000
X-Gm-Features: AcwNN1Vy2c56KBkguZEqayMZ9B-wiM7yYaHLrhCXdPlk_ehdLULZhAiBE_MtLIs
Message-ID: <CAPM=9twBded3B553KYzwDtVd0NbhbAwbiVDGw_bdrmBnOKgtKA@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix unnecessary host-side population of ttm_tt on
 non-TT resources
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Nathan Bourgeois <iridescentrosesfall@gmail.com>,
 intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

> Yes, this might be a better solution, making ttm_bo_setup_export()
> completely unnecessary.
>
> It's also a bit odd that, in flows where we don't have backing storage
> on export, we populate with pages and charge the system memory cgroup,
> only to move the data to VRAM when the import attach is triggered,
> resulting in a copy and a change in cgroup charging.
>
> I guess the question is why was ttm_bo_setup_export() introduced over
> just a validation at export?
>

I'd like to think I had an answer for that, but I don't. Likely
because I wasn't thinking about VRAM charging at all, and just
worrying about making sure we had populated some pages for system
memory ones, so the other side couldn't DoS us.

Dave.
