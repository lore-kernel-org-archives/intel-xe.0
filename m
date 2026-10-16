Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C9DCCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D887310EC76;
	Mon, 19 Oct 2026 11:42:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120BC10E3A9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:40:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso4231105e9.0
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792179640; x=1792784440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iMRRI5bEPrjeiE8Y1aI7MLDO6J4IuqM4URq6dJXpjo8=;
 b=oKkHCOhJvP8zFwthChr5urz8Pxbe8JbIZjfVDQ/71EuSMuXCjw0pD9PI7M8xh0Hq1Y
 /gMLXuWotihg6vHHA4mATpf5P+RNSRqUF69/moEDX/quqTzxOU+Tm51l29471FH4MnZq
 CHjBpny0bJEQOULHPtJnnvYrIf6cllxRk7nOjesxW+PGG9clG1/4Puj5X4C0aAMx23li
 JaaJarEziV64qyEIiLySGdiCdhDf94ATuH5nXi/xTtMeTrWlrpS/jqyIAVGJA/Sv0ZHP
 9GUwVCVyZemKk2+XSnr7UXTXq15HH1LKnGL54uVJXWhWT6/8QDrJv0kDORXZy65Kwcl5
 0OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792179640; x=1792784440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iMRRI5bEPrjeiE8Y1aI7MLDO6J4IuqM4URq6dJXpjo8=;
 b=a2CESMZCd9mrTJuqpdW77KQgvKdwLQUmGRw67MBHZ61QkbwOMCo19mufnmV5BMyw8L
 nB/hIYsxkwo6J68YSFFs/2isUyVy4YUhmoujaAEjfX8jCKKyxD4VuRC+yI4YSkOBBVpm
 ADyTdOsAplzDs73bHCfGupwL9cm+GhKguMEtjtydPdjRCWcDtEXvZHmD4tfLsO4rkNCF
 ai63DJEk3KZZma4EHHgTh+aGxNQooJlV/68v47/QRJJWcV+Ef29DwFjcAC8/eefw4l77
 FcUpCErzm+cZhW84GJzjO/wWx+xeUvTfBNmspUl91cIuE4OTfIDhunD+FiOiMTLCv1cn
 LE8A==
X-Forwarded-Encrypted: i=1;
 AKwUvByQlWUjGtGvR0DXhGJD67GBA1nGRJHMEjYAqdL8Hp3hwYmx9R9XCOkD0s5aptxmpBQ8SFhGdcu66w==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKc7xQvij1zl4QS5nK6F4fVCQV8h8zq8WqCrj9mQD/NdrP7Aomw
 DVQ+XDPDPFE7PfZw4gRjge9hO5ASClnJ4pvxe7A9TreB3iSjKfIHqox7
X-Gm-Gg: AYBFou0hsyiFXCtRxJVgDjBPd3/+lUVz/NYOYGatZ2ZkHM9w5U9VftrNX84H4G21/Aa
 p5UOGxV8hGd3HikFmY5xJM810yC1nR0mryoiRFHR8nRmtRK/zFUeezmcZ1KpWZlH/CZDzma9EKM
 C0ekH2bESrwjsijnKOHEp/6g6G6vCvNQi+zjmj9GgDAuR3P01FD2jTpuyfZ66qndEib/jmwlE7P
 HRfAfCCHXeO7x/Ex7bGcWtvNlHwcYp2C2pTBuYQRRzJplv21B52rNCX1tf3GYGitPuiSXLwOPDx
 FhwtGFhee/QRyeClkIKu4bicpnCRnRfGpMocx+1XNk791rxCGi+gSIm3PBSBjTRs02AqtdwLBqq
 LuNjj+fLxY9VTONL9dsvyn84Q/51IguHrv4CFs1lblaEjC3tmZxIEF5yrjty/tyavhmqirQD15t
 +dEz6CZPHtR8QOQoRo3ow9Vg6Au6Cie8hj4Pby2hvxx8Q0rwzY06cq0EiTo00APmJLR243mLmQz
 M6j9XNGp1zcwW/RqoDeEIB4MMghLgG5Cs6foYEzAej7cB3OWFO9Ka+j3QgWM8bBP9oW/LuBnFsj
 zfTZXyeRxGTbc2XbZh31gy91HSsZoRuQMsONCUGKYLyAQWCT3OT+uUu+PzsqxGAxLy30GrVExwe
 fW0Rum5nc0Klr
X-Received: by 2002:a05:600c:a102:b0:4a1:bc14:224b with SMTP id
 5b1f17b1804b1-4a1c66b37cfmr83617395e9.10.1792179639973; 
 Fri, 16 Oct 2026 12:40:39 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de.
 [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5038b8sm7026413f8f.48.2026.10.16.12.40.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Oct 2026 12:40:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 Alistair Popple <apopple@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 23/26] iommufd: Use the PAL mapping type instead of a
 vfio function
Date: Fri, 16 Oct 2026 21:40:22 +0200
Message-Id: <20261016194022.62065-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <23-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <23-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:42:17 +0000
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

On Tue, Feb 17, 2026 at 08:11:54PM -0400, Jason Gunthorpe wrote:
> +		dma_resv_lock(dmabuf->resv, NULL);
> +		if (pages->dmabuf.exp_phys)
> +			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
> +					       pages->dmabuf.exp_phys);
> +		dma_resv_unlock(dmabuf->resv);
> +
>  		dma_buf_detach(dmabuf, pages->dmabuf.attach);

exp_phys remains non-NULL after dma_buf_pal_unmap_phys() frees it. A
move notification after dma_resv_unlock() and before dma_buf_detach()
therefore reaches iopt_revoke_notify() and frees it again.

A test hook forced that ordering on the posted series. The one-page
IOMMUFD selftest unmap on arm64 QEMU with KASAN reports:

  BUG: KASAN: double-free in iommufd_dma_pal_unmap_phys+0x14/0x20

The first free is in iopt_release_pages(). The second is through
dma_buf_move_notify() -> iopt_revoke_notify().

Clearing exp_phys before dropping the reservation lock makes the same test
complete without a KASAN report.

Karl
